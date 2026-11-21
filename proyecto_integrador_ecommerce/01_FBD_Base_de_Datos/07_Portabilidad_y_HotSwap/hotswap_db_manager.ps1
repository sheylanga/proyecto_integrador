<#
.SYNOPSIS
    Gestor de Hot Swap Multi-SGBD (Microsoft SQL Server <-> PostgreSQL) para DERMA-ECOM.
    Proyecto Integrador V - Fundamentos de Base de Datos (AEF-1031).
.EXAMPLE
    .\hotswap_db_manager.ps1 -Action status
    .\hotswap_db_manager.ps1 -Action query
    .\hotswap_db_manager.ps1 -Action swap -TargetEngine postgresql
    .\hotswap_db_manager.ps1 -Action test-failover
#>
param(
    [ValidateSet('status', 'query', 'swap', 'test-failover')]
    [string]$Action = 'status',

    [ValidateSet('sqlserver', 'postgresql')]
    [string]$TargetEngine,

    [switch]$Force,

    [string]$ConfigPath = (Join-Path $PSScriptRoot 'hotswap_config.json')
)

$ErrorActionPreference = 'Stop'

function Get-HotSwapConfig {
    return (Get-Content -Path $ConfigPath -Raw -Encoding UTF8 | ConvertFrom-Json)
}

function Save-HotSwapConfig($cfg) {
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($ConfigPath, ($cfg | ConvertTo-Json -Depth 5), $utf8NoBom)
}

# ==============================================================================
# ADAPTADOR 1: MICROSOFT SQL SERVER (ADO.NET SqlClient)
# ==============================================================================
function Invoke-SqlServerQuery($engineCfg, [string]$sql, [int]$timeoutSec = 5) {
    $connStr = "Server=$($engineCfg.server);Database=$($engineCfg.database);Integrated Security=True;Connection Timeout=$timeoutSec;"
    $conn = New-Object System.Data.SqlClient.SqlConnection($connStr)
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    try {
        $conn.Open()
        $cmd = $conn.CreateCommand()
        $cmd.CommandTimeout = $timeoutSec
        $cmd.CommandText = $sql
        $da = New-Object System.Data.SqlClient.SqlDataAdapter($cmd)
        $dt = New-Object System.Data.DataTable
        [void]$da.Fill($dt)
        $sw.Stop()
        return @{ Success = $true; LatencyMs = $sw.ElapsedMilliseconds; Data = $dt; Error = $null }
    } catch {
        $sw.Stop()
        return @{ Success = $false; LatencyMs = $sw.ElapsedMilliseconds; Data = $null; Error = $_.Exception.Message }
    } finally {
        if ($conn.State -eq 'Open') { $conn.Close() }
    }
}

# ==============================================================================
# ADAPTADOR 2: POSTGRESQL (psql CLI)
# ==============================================================================
function Invoke-PostgresQuery($engineCfg, [string]$sql, [int]$timeoutSec = 5) {
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    $psql = $engineCfg.psql_path
    if (-not (Test-Path $psql)) {
        return @{ Success = $false; LatencyMs = 0; Data = $null; Error = "psql.exe no encontrado en $psql" }
    }
    try {
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = $psql
        $psi.Arguments = "-h $($engineCfg.host) -p $($engineCfg.port) -U $($engineCfg.user) -d $($engineCfg.database) -w -t -A -F `"|`" -c `"$($sql -replace '"','\"')`""
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true
        $psi.UseShellExecute = $false
        $psi.CreateNoWindow = $true
        $proc = [System.Diagnostics.Process]::Start($psi)
        if (-not $proc.WaitForExit($timeoutSec * 1000)) {
            $proc.Kill()
            return @{ Success = $false; LatencyMs = $sw.ElapsedMilliseconds; Data = $null; Error = "Timeout conectando a PostgreSQL" }
        }
        $stdout = $proc.StandardOutput.ReadToEnd().Trim()
        $stderr = $proc.StandardError.ReadToEnd().Trim()
        $sw.Stop()
        if ($proc.ExitCode -ne 0) {
            return @{ Success = $false; LatencyMs = $sw.ElapsedMilliseconds; Data = $null; Error = $stderr }
        }
        return @{ Success = $true; LatencyMs = $sw.ElapsedMilliseconds; Data = $stdout; Error = $null }
    } catch {
        $sw.Stop()
        return @{ Success = $false; LatencyMs = $sw.ElapsedMilliseconds; Data = $null; Error = $_.Exception.Message }
    }
}

# ==============================================================================
# ROUTER / DIALECTO MULTI-SGBD
# ==============================================================================
function Test-EngineHealth($cfg, [string]$engineName) {
    $eCfg = $cfg.engines.$engineName
    if ($engineName -eq 'sqlserver') {
        $sql = "SELECT (SELECT COUNT(*) FROM sys.tables) AS tablas, (SELECT COUNT(*) FROM sys.foreign_keys) AS fks, (SELECT COUNT(*) FROM seguridad.usuarios) AS usuarios;"
        $res = Invoke-SqlServerQuery $eCfg $sql $cfg.health_check_timeout_sec
        if ($res.Success) {
            $r = $res.Data.Rows[0]
            return @{ Engine = $engineName; DisplayName = $eCfg.display_name; Status = 'ONLINE'; LatencyMs = $res.LatencyMs; Summary = "Tablas=$($r['tablas']), FKs=$($r['fks']), Usuarios=$($r['usuarios'])" }
        }
        return @{ Engine = $engineName; DisplayName = $eCfg.display_name; Status = 'OFFLINE'; LatencyMs = $res.LatencyMs; Summary = $res.Error }
    } else {
        $sql = "SELECT (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema NOT IN ('pg_catalog','information_schema') AND table_type='BASE TABLE') || ',' || (SELECT COUNT(*) FROM seguridad.usuarios);"
        $res = Invoke-PostgresQuery $eCfg $sql $cfg.health_check_timeout_sec
        if ($res.Success) {
            return @{ Engine = $engineName; DisplayName = $eCfg.display_name; Status = 'ONLINE'; LatencyMs = $res.LatencyMs; Summary = "Resultado=$res.Data" }
        }
        return @{ Engine = $engineName; DisplayName = $eCfg.display_name; Status = 'OFFLINE'; LatencyMs = $res.LatencyMs; Summary = $res.Error }
    }
}

function Invoke-BusinessQuery($cfg, [string]$engineName) {
    $eCfg = $cfg.engines.$engineName
    if ($engineName -eq 'sqlserver') {
        $sql = @"
SELECT TOP 5
    o.folio_orden,
    c.nombres + ' ' + c.primer_apellido AS cliente,
    o.total_neto,
    tx.estado_pago,
    f.estado_cfdi
FROM ventas.ordenes o
INNER JOIN clientes.clientes c ON o.cliente = c.id_cliente
INNER JOIN pagos.transacciones tx ON o.id_orden = tx.orden
INNER JOIN fiscal.facturas_cfdi f ON o.id_orden = f.orden
WHERE o.activo = 1
ORDER BY o.total_neto DESC;
"@
        return Invoke-SqlServerQuery $eCfg $sql $cfg.health_check_timeout_sec
    } else {
        $sql = @"
SELECT
    o.folio_orden,
    c.nombres || ' ' || c.primer_apellido AS cliente,
    o.total_neto,
    tx.estado_pago,
    f.estado_cfdi
FROM ventas.ordenes o
INNER JOIN clientes.clientes c ON o.cliente = c.id_cliente
INNER JOIN pagos.transacciones tx ON o.id_orden = tx.orden
INNER JOIN fiscal.facturas_cfdi f ON o.id_orden = f.orden
WHERE o.activo = TRUE
ORDER BY o.total_neto DESC
LIMIT 5;
"@
        return Invoke-PostgresQuery $eCfg $sql $cfg.health_check_timeout_sec
    }
}

# ==============================================================================
# EJECUCIÓN PRINCIPAL
# ==============================================================================
$cfg = Get-HotSwapConfig
Write-Output "==============================================================================="
Write-Output " DERMA-ECOM | HOT SWAP MULTI-SGBD MANAGER (SQL Server 2022 <-> PostgreSQL)"
Write-Output " Motor Activo: $($cfg.active_engine.ToUpper()) | Respaldo: $($cfg.fallback_engine.ToUpper()) | Auto-Failover: $($cfg.auto_failover)"
Write-Output "==============================================================================="

switch ($Action) {
    'status' {
        foreach ($eng in @('sqlserver', 'postgresql')) {
            $h = Test-EngineHealth $cfg $eng
            $tag = if ($eng -eq $cfg.active_engine) { '[ACTIVO]  ' } else { '[RESPALDO]' }
            Write-Output "$tag $($h.DisplayName) -> $($h.Status) ($($h.LatencyMs) ms) | $($h.Summary)"
        }
    }

    'query' {
        $eng = $cfg.active_engine
        Write-Output ">>> Ejecutando consulta de negocio en motor activo [$eng]..."
        $res = Invoke-BusinessQuery $cfg $eng
        if (-not $res.Success -and $cfg.auto_failover) {
            Write-Output "[ALERTA] Fallo en motor activo [$eng]: $($res.Error)"
            $eng = $cfg.fallback_engine
            Write-Output ">>> [HOT SWAP AUTOMÁTICO] Conmutando en caliente a motor respaldo [$eng]..."
            $res = Invoke-BusinessQuery $cfg $eng
        }
        if ($res.Success) {
            Write-Output "[OK] Consulta respondida por [$eng] en $($res.LatencyMs) ms:"
            if ($eng -eq 'sqlserver') {
                $res.Data | Format-Table -AutoSize | Out-String | Write-Output
            } else {
                Write-Output $res.Data
            }
        } else {
            throw "Ambos motores fallaron. Error final [$eng]: $($res.Error)"
        }
    }

    'swap' {
        if (-not $TargetEngine) { throw "Debes especificar -TargetEngine sqlserver|postgresql" }
        $h = Test-EngineHealth $cfg $TargetEngine
        Write-Output ">>> Verificando salud del motor destino [$TargetEngine]: $($h.Status) ($($h.LatencyMs) ms)"
        if ($h.Status -ne 'ONLINE' -and -not $Force) {
            Write-Output "[ABORTADO] El motor destino [$TargetEngine] no está ONLINE ($($h.Summary)). Usa -Force para forzar cambio de configuración."
            exit 1
        }
        $prev = $cfg.active_engine
        $cfg.active_engine = $TargetEngine
        $cfg.fallback_engine = if ($TargetEngine -eq 'sqlserver') { 'postgresql' } else { 'sqlserver' }
        Save-HotSwapConfig $cfg
        Write-Output "[HOT SWAP COMPLETADO] Motor activo cambiado en caliente: $prev -> $TargetEngine (sin reinicio de aplicación)."
    }

    'test-failover' {
        Write-Output ">>> Simulando caída del motor primario (PostgreSQL no disponible sin sesión / caída simulada)..."
        $simCfg = Get-HotSwapConfig
        $simCfg.active_engine = 'postgresql'
        $simCfg.fallback_engine = 'sqlserver'
        $simCfg.auto_failover = $true
        $resPrimary = Invoke-BusinessQuery $simCfg 'postgresql'
        if (-not $resPrimary.Success) {
            Write-Output "  1) Motor primario [postgresql] falló en $($resPrimary.LatencyMs) ms -> Activando Hot Swap Automático..."
            $resFallback = Invoke-BusinessQuery $simCfg 'sqlserver'
            if ($resFallback.Success) {
                Write-Output "  2) [FAILOVER EXITOSO] Tráfico redirigido en caliente a [sqlserver] en $($resFallback.LatencyMs) ms (0 pérdida de servicio):"
                $resFallback.Data | Format-Table -AutoSize | Out-String | Write-Output
            } else {
                throw "Failover falló: $($resFallback.Error)"
            }
        } else {
            Write-Output "  PostgreSQL respondió ONLINE en $($resPrimary.LatencyMs) ms (ambos motores operativos)."
        }
    }
}
