import re
import json

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"
dml_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    ddl_text = f.read()

# Parse CREATE TABLE
table_pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)
tables = {}

for tbl_name, body in table_pattern.findall(ddl_text):
    tbl_name = tbl_name.strip()
    col_dict = {}
    checks = []
    fks = []
    pks = []
    
    for line in body.splitlines():
        line = line.strip().rstrip(',')
        if not line or line.startswith('--'):
            continue
        if line.upper().startswith('CONSTRAINT'):
            if 'CHECK' in line.upper():
                checks.append(line)
            elif 'FOREIGN KEY' in line.upper():
                fks.append(line)
            elif 'PRIMARY KEY' in line.upper():
                pks.append(line)
        else:
            # Column definition
            # e.g. id_perfil_cutaneo BIGINT IDENTITY(1,1) NOT NULL
            # or estado_tramite NVARCHAR(20) NOT NULL
            match = re.match(r'([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_\(\)]+)(.*)', line)
            if match:
                cname = match.group(1)
                ctype = match.group(2)
                crest = match.group(3)
                col_dict[cname] = {
                    'type': ctype,
                    'rest': crest,
                    'raw': line
                }
    tables[tbl_name] = {
        'columns': col_dict,
        'checks': checks,
        'fks': fks,
        'pks': pks
    }

print(f"Total tables parsed from DDL: {len(tables)}")

# Now let's examine specific tables mentioned in the error:
# 1. clientes.perfil_cutaneo (CK_clientes_pc_solar)
# 2. clientes.solicitudes_arco (estado_tramite)
# 3. Tables around line 1427, 1617, 1655, 1693
# 4. ventas.tipos_descuento (codigo_descuento)
# 5. ventas.motivos_cancelacion_orden (codigo_motivo)
# 6. Tables with invalid column names around 1961-2249

problem_tables = [
    'clientes.perfil_cutaneo',
    'clientes.solicitudes_arco',
    'ventas.tipos_descuento',
    'ventas.motivos_cancelacion_orden'
]

for pt in problem_tables:
    if pt in tables:
        print(f"\n--- {pt} ---")
        for c, info in tables[pt]['columns'].items():
            print(f"  {c}: {info['type']} {info['rest']}")
        for chk in tables[pt]['checks']:
            print(f"  {chk}")

# Let's inspect tables in Module 2 around line 1961-2249:
# What tables are around there?
print("\n--- Tables in ventas / suscripciones / carritos ---")
for t in tables.keys():
    if any(k in t for k in ['carrito', 'abandono', 'frecuencia', 'suscripcion', 'gwp', 'orden']):
        print(f"Table: {t}")
        cols = list(tables[t]['columns'].keys())
        print(f"  Cols: {cols[:8]}...")
