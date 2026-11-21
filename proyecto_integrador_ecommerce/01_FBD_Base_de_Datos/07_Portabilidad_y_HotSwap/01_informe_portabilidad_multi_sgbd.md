# INFORME TÉCNICO ANALÍTICO DE PORTABILIDAD Y COMPATIBILIDAD MULTI-SGBD
## MICROSOFT SQL SERVER 2022 vs. POSTGRESQL 16 / 17 (SOFTWARE LIBRE)
### PROYECTO INTEGRADOR V — FUNDAMENTOS DE BASE DE DATOS (FBD — AEF-1031) — CRITERIO 2.4 (35%)

---

## 1. OBJETIVO DEL ESTUDIO COMPARATIVO

En cumplimiento de las secciones **2.3** y **4.2.5** de *Proyecto Integrador V*, el presente informe técnico evalúa la portabilidad real, equivalencia de tipos de datos, divergencias de sintaxis **DDL/DML/DQL**, criptografía nativa y hallazgos de validación obtenidos al desplegar el esquema completo de **150 tablas, 183 llaves foráneas, 87 restricciones CHECK, 30 índices secundarios y 4,290 registros semilla** en dos motores heterogéneos:

1. **SGBD Comercial / Empresarial:** Microsoft SQL Server 2022 (dialecto Transact-SQL / T-SQL).
2. **SGBD de Software Libre:** PostgreSQL 16 / 17 (dialecto PL/pgSQL, licencia permisiva *PostgreSQL License*).

---

## 2. MATRIZ DE COMPATIBILIDAD DE TIPOS DE DATOS (150 TABLAS)

| Categoría | Microsoft SQL Server (T-SQL) | PostgreSQL 16/17 (ANSI SQL) | Diferencias Técnicas y Reglas de Portabilidad |
| :--- | :--- | :--- | :--- |
| **Llave Primaria Autoincremental** | `BIGINT IDENTITY(1,1) NOT NULL` | `BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY` | PostgreSQL adopta el estándar ANSI SQL:2003; impide inserciones manuales de ID salvo que se declare `OVERRIDING SYSTEM VALUE`. |
| **Texto Unicode de longitud variable** | `NVARCHAR(n)` | `VARCHAR(n)` | SQL Server distingue `VARCHAR` (codepage) de `NVARCHAR` (UTF-16/UTF-8); PostgreSQL almacena todo `VARCHAR` nativamente en UTF-8. |
| **Texto extenso sin límite fijo** | `NVARCHAR(MAX)` | `TEXT` | En PostgreSQL `TEXT` y `VARCHAR` comparten el mismo rendimiento interno (TOAST). |
| **Documentos JSON estructurados** | `NVARCHAR(MAX)` + `ISJSON()` | `JSONB` (binario indexable) | **Hallazgo crítico:** PostgreSQL valida sintaxis JSON estricta al insertar en `JSONB`; SQL Server requiere `CHECK (ISJSON(col)=1)`. |
| **Valores Booleanos** | `BIT` (`0` o `1`) | `BOOLEAN` (`TRUE` o `FALSE`) | **Incompatibilidad estricta:** PostgreSQL rechaza enteros `0`/`1` en columnas `BOOLEAN` (`ERROR: column is of type boolean but expression is of type integer`). |
| **Identificador Único Global** | `UNIQUEIDENTIFIER DEFAULT NEWID()` | `UUID DEFAULT gen_random_uuid()` | PostgreSQL 13+ ofrece `gen_random_uuid()` nativo (y `uuid-ossp` / `pgcrypto`). |
| **Fecha y Hora con precisión** | `DATETIME2(3) DEFAULT SYSDATETIME()` | `TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP` | `TIMESTAMPTZ` almacena en UTC y convierte automáticamente por zona horaria; ideal para auditoría forense y webhooks logísticos. |
| **Fecha sin hora** | `DATE` | `DATE` | 100% compatible bajo formato ISO-8601 (`'YYYY-MM-DD'`). |
| **Moneda y Precisión Decimal** | `DECIMAL(12,2)` / `DECIMAL(5,2)` | `NUMERIC(12,2)` / `NUMERIC(5,2)` | Precisión exacta sin errores de punto flotante; idéntica semántica aritmética en ambos motores. |
| **Columnas Calculadas (Derivadas)** | `AS (alto_cm * ancho_cm * largo_cm / 5000.0) PERSISTED` | `NUMERIC(8,2) GENERATED ALWAYS AS (...) STORED` | Ambas se materializan en disco y se omiten en sentencias `INSERT`. |

---

## 3. ANÁLISIS COMPARATIVO DE SINTAXIS SQL (DDL, DML Y DQL)

### 3.1 Lenguaje de Definición de Datos (DDL)

| Operación DDL | Microsoft SQL Server | PostgreSQL | Impacto en Portabilidad |
| :--- | :--- | :--- | :--- |
| **Creación condicional de esquemas** | `IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'seguridad') EXEC('CREATE SCHEMA seguridad');` | `CREATE SCHEMA IF NOT EXISTS seguridad;` | PostgreSQL soporta `IF NOT EXISTS` nativo; T-SQL requiere bloque `IF` + `EXEC`. |
| **Eliminación previa segura de tabla** | `IF OBJECT_ID(N'seguridad.roles', N'U') IS NOT NULL DROP TABLE seguridad.roles;` | `DROP TABLE IF EXISTS seguridad.roles CASCADE;` | `CASCADE` en PostgreSQL simplifica despliegues limpios al liberar dependencias automáticamente. |
| **Separador de lotes** | `GO` (directiva de cliente SSMS/SQLCMD) | `;` (sentencias terminadas en punto y coma) | `GO` provoca error de sintaxis en PostgreSQL; debe eliminarse al portar. |
| **Índices primarios y secundarios** | `PRIMARY KEY CLUSTERED (...)` y `CREATE NONCLUSTERED INDEX IX_...` | `PRIMARY KEY` (B-Tree) y `CREATE INDEX IF NOT EXISTS IX_...` | SQL Server organiza físicamente la tabla por el índice clusterizado; PostgreSQL usa *heap tables* + índices B-Tree secundarios. |
| **Extensiones criptográficas** | Nativo (`HASHBYTES`, `CRYPT_GEN_RANDOM`) | `CREATE EXTENSION IF NOT EXISTS "pgcrypto";` | En PostgreSQL la extensión `pgcrypto` habilita `bcrypt`, `scrypt` y `HMAC`. |

### 3.2 Lenguaje de Manipulación de Datos (DML)

| Operación DML | Microsoft SQL Server | PostgreSQL | Impacto en Portabilidad |
| :--- | :--- | :--- | :--- |
| **Carga semilla con IDs explícitos** | `SET IDENTITY_INSERT tbl ON; INSERT ...; SET IDENTITY_INSERT tbl OFF;` | `INSERT INTO tbl (...) OVERRIDING SYSTEM VALUE VALUES ...;` | Tras usar `OVERRIDING SYSTEM VALUE`, PostgreSQL **no avanza** la secuencia; es obligatorio ejecutar `SELECT setval(pg_get_serial_sequence(...))`. |
| **Literales de texto Unicode** | Prefijo `N'texto con acentos'` | `'texto con acentos'` (UTF-8 nativo) | **Riesgo de portabilidad:** No reemplazar `N'` con sustitución ciega de texto, pues corrompe `'MXN'` → `'MX'` y `'EN_MEDIACION'` → `'EN_MEDIACIO'`. Debe usarse regex con frontera negativa `(?<![A-Za-z0-9_'])N'`. |
| **Control de mensajes de conteo** | `SET NOCOUNT ON;` | No existe (se controla desde el cliente) | `SET NOCOUNT ON;` provoca error fatal inmediato en PostgreSQL. |
| **Literales Booleanos** | `1` y `0` | `TRUE` y `FALSE` | Deben convertirse estrictamente solo en las posiciones de columna cuyo tipo sea `BOOLEAN` (6,182 valores en el esquema). |

### 3.3 Lenguaje de Consulta de Datos (DQL — 10 Consultas Avanzadas)

| Constructo DQL | Microsoft SQL Server (`01_consultas_avanzadas_sqlserver.sql`) | PostgreSQL (`02_consultas_avanzadas_postgresql.sql`) |
| :--- | :--- | :--- |
| **Concatenación de cadenas** | `f.serie_factura + '-' + f.folio_factura` | `f.serie_factura \|\| '-' \|\| f.folio_factura` |
| **Diferencia de tiempo (horas/días)** | `DATEDIFF(HOUR, f1, f2)` / `DATEDIFF(DAY, f1, f2)` | `ROUND(EXTRACT(EPOCH FROM (f2 - f1)) / 3600.0, 2)` y `/ 86400.0` |
| **Conversión de tipos en promedios** | `CAST(AVG(CAST(col AS FLOAT)) AS DECIMAL(5,2))` | `ROUND(AVG(col)::NUMERIC, 2)` |
| **Filtrado de banderas activas** | `WHERE activo = 1 AND atendida = 0` | `WHERE activo = TRUE AND atendida = FALSE` |
| **Selección de base de datos** | `USE EcommerceSaludBellezaDB;` | Conexión directa (`psql -d ecommerce_salud_belleza`) |

---

## 4. CRIPTOGRAFÍA DE CREDENCIALES EN AMBOS MOTORES

En estricto apego al **Criterio 2.4** y al **Principio de Seguridad (Art. 16 Constitucional / LFPDPPP)**, se verificó la persistencia y validación de credenciales sin almacenamiento en texto claro en ambos motores:

| Aspecto | Microsoft SQL Server (`03_prueba_criptografia_sqlserver.sql`) | PostgreSQL (`04_prueba_criptografia_postgresql.sql`) |
| :--- | :--- | :--- |
| **Generación de Salt** | `CRYPT_GEN_RANDOM(32)` (256 bits criptográficamente seguros) | `gen_salt('bf', 12)` (salt automático Blowfish de 128 bits, factor de costo $2^{12}$) |
| **Algoritmo de Hash** | `HASHBYTES('SHA2_512', ...)` con estiramiento iterativo de 5,000 rondas | `pgcrypto` `crypt(password, salt)` (algoritmo **bcrypt** resistente a GPU/ASIC) |
| **Validación en Login** | Recálculo iterativo con salt almacenado y comparación de hash | `password_hash = crypt(input_password, password_hash)` |
| **Resultado comprobado** | `CUMPLIDO (SIN TEXTO PLANO) \| LOGIN_EXITOSO \| RECHAZO_CORRECTO` *(ejecutado en vivo en SQL Server 2022)* | Equivalente ejecutable sobre `pgcrypto` con `ROLLBACK` limpio |

---

## 5. HALLAZGOS DE PORTABILIDAD DETECTADOS Y CORREGIDOS EN VALIDACIÓN

Durante las pruebas de auditoría y compilación real sobre el esquema de 150 tablas se identificaron y corrigieron **5 defectos reales de portabilidad**:

1. **Truncamiento de `SOFT_DELETE` en SQL Server:** `auditoria.bitacora_cambios_datos.tipo_operacion` medía `NVARCHAR(10)`, truncando `'SOFT_DELETE'` (11 caracteres). Corregido a `NVARCHAR(15)` / `VARCHAR(15)`.
2. **Incompatibilidad `JSONB` en PostgreSQL:** Los datos semilla originales de `bitacora_cambios_datos` contenían texto plano en columnas `JSONB`. Se reemplazaron por 30 documentos JSON válidos (`30/30` validados con `ISJSON() = 1`).
3. **Corrupción de cadenas terminadas en `N`:** Una conversión ingenua de `N'` dañaba `'MXN'` y `'EN_MEDIACION'`. Se implementó conversión con expresión regular segura preservando 60/60 `'MXN'` y todas las restricciones `CHECK`.
4. **Desincronización de secuencias `IDENTITY` en PostgreSQL:** Se agregaron 150 sentencias `SELECT setval(...)` para que futuras inserciones de la aplicación continúen desde el ID `31` sin colisiones de llave primaria.
5. **Integridad de grafo completo:** Se enlazaron las 6 tablas inicialmente huérfanas con 7 nuevas FKs en ambos motores (**183 FKs totales, 0 tablas huérfanas, 1 componente conexo**).

---

## 6. DICTAMEN DE PORTABILIDAD

El esquema **DERMA-ECOM** alcanza un **índice de portabilidad estructural del 100%** entre Microsoft SQL Server 2022 y PostgreSQL 16/17: las 150 tablas, los 14 esquemas, las 183 llaves foráneas, las 87 reglas `CHECK`, los 30 índices secundarios y los 4,290 registros semilla son funcionalmente isomorfos en ambos motores, permitiendo operar bajo la arquitectura **Hot Swap Multi-SGBD** documentada en `02_arquitectura_y_guia_hotswap_sgbd.md`.
