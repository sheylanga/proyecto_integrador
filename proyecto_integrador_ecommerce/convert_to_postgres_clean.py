import re
import os

out_dir = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla"

def convert_script(sql_text):
    # Remove USE and GO
    sql = re.sub(r'USE\s+[a-zA-Z0-9_]+;\s*GO', '', sql_text, flags=re.IGNORECASE)
    sql = re.sub(r'SET\s+NOCOUNT\s+ON;\s*GO', '', sql, flags=re.IGNORECASE)
    sql = re.sub(r'SET\s+XACT_ABORT\s+ON;\s*GO', '', sql, flags=re.IGNORECASE)
    
    # Replace SET IDENTITY_INSERT ... ON/OFF
    sql = re.sub(r'SET\s+IDENTITY_INSERT\s+[a-zA-Z0-9_\.]+\s+ON;\s*', '', sql, flags=re.IGNORECASE)
    sql = re.sub(r'SET\s+IDENTITY_INSERT\s+[a-zA-Z0-9_\.]+\s+OFF;\s*', '', sql, flags=re.IGNORECASE)
    
    # In INSERT INTO tbl (cols) -> INSERT INTO tbl (cols) OVERRIDING SYSTEM VALUE
    # or INSERT INTO tbl OVERRIDING SYSTEM VALUE (cols)
    # Standard PostgreSQL syntax: INSERT INTO tbl (cols) OVERRIDING SYSTEM VALUE VALUES ...
    sql = re.sub(r'INSERT INTO\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\)\s*VALUES', r'INSERT INTO \1 (\2) OVERRIDING SYSTEM VALUE\nVALUES', sql, flags=re.IGNORECASE)
    
    # Remove N'...' prefix
    sql = re.sub(r"N'((?:''|[^'])*)'", r"'\1'", sql)
    
    # Replace SYSDATETIME() with CURRENT_TIMESTAMP
    sql = re.sub(r'SYSDATETIME\(\)', 'CURRENT_TIMESTAMP', sql, flags=re.IGNORECASE)
    
    # Replace GO statements with empty or comment
    sql = re.sub(r'^\s*GO\s*$', '', sql, flags=re.MULTILINE | re.IGNORECASE)
    
    # Replace PRINT '...' with RAISE NOTICE '...' in DO $$ BEGIN ... END $$; or simply SELECT '...'
    sql = re.sub(r"PRINT\s+'(.*?)';", r"-- \1", sql)
    
    return sql

# Convert Master
with open(os.path.join(out_dir, "00_MASTER_SEED_DATA_SQLSERVER.sql"), "r", encoding="utf-8") as f:
    mssql_master = f.read()

pg_master = convert_script(mssql_master)
with open(os.path.join(out_dir, "00_MASTER_SEED_DATA_POSTGRESQL.sql"), "w", encoding="utf-8") as f:
    f.write(pg_master)

# Convert Mod1, Mod2, Mod3
for num in ["01_dml_modulo_identidad_catalogo_alu1", "02_dml_modulo_comercial_pagos_alu2", "03_dml_modulo_logistica_inventario_alu3"]:
    with open(os.path.join(out_dir, f"{num}.sql"), "r", encoding="utf-8") as f:
        m_sql = f.read()
    pg_sql = convert_script(m_sql)
    with open(os.path.join(out_dir, f"{num}_postgres.sql"), "w", encoding="utf-8") as f:
        f.write(pg_sql)

print("Converted all seed scripts to PostgreSQL successfully!")
