# -*- coding: utf-8 -*-
"""
Conversor de DML SQL Server a PostgreSQL (Multi-SGBD)
Cumplimiento de Rúbrica FBD
"""
import re
import os

base_dir = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla"

def convert_sql_server_to_postgres(tsql_text):
    lines = tsql_text.splitlines()
    pg_lines = []
    
    current_table = None
    
    for line in lines:
        stripped = line.strip()
        
        # Remove USE ecom_belleza_salud; and GO
        if stripped.startswith("USE ") or stripped == "GO":
            continue
        if stripped.startswith("SET NOCOUNT "):
            continue
            
        # Handle SET IDENTITY_INSERT
        if "SET IDENTITY_INSERT" in line:
            # We don't need SET IDENTITY_INSERT in Postgres
            continue
            
        # Handle PRINT statements -> RAISE NOTICE or comment
        if stripped.startswith("PRINT "):
            msg = stripped[6:].strip().strip("';")
            pg_lines.append(f"DO $$ BEGIN RAISE NOTICE '{msg}'; END $$;")
            continue
            
        # Replace SYSDATETIME() with CURRENT_TIMESTAMP
        line = line.replace("SYSDATETIME()", "CURRENT_TIMESTAMP")
        line = line.replace("DATEADD(minute, 15, SYSDATETIME())", "(CURRENT_TIMESTAMP + INTERVAL '15 minutes')")
        
        # Replace N' with '
        line = re.sub(r"\bN'", "'", line)
        
        # If line is INSERT INTO table (cols) VALUES
        # Add OVERRIDING SYSTEM VALUE
        if "INSERT INTO " in line and " VALUES" in line:
            line = line.replace(" VALUES", " OVERRIDING SYSTEM VALUE VALUES")
            
        pg_lines.append(line)
        
    return "\n".join(pg_lines)

# Process modular files
files = [
    ("01_dml_modulo_identidad_catalogo_alu1.sql", "01_dml_modulo_identidad_catalogo_alu1_postgres.sql"),
    ("02_dml_modulo_comercial_pagos_alu2.sql", "02_dml_modulo_comercial_pagos_alu2_postgres.sql"),
    ("03_dml_modulo_logistica_inventario_alu3.sql", "03_dml_modulo_logistica_inventario_alu3_postgres.sql"),
    ("00_MASTER_SEED_DATA_SQLSERVER.sql", "00_MASTER_SEED_DATA_POSTGRESQL.sql")
]

for src, dst in files:
    src_path = os.path.join(base_dir, src)
    dst_path = os.path.join(base_dir, dst)
    with open(src_path, "r", encoding="utf-8") as f:
        src_content = f.read()
    pg_content = convert_sql_server_to_postgres(src_content)
    with open(dst_path, "w", encoding="utf-8") as f:
        f.write(pg_content)
    print(f"Generated PostgreSQL DML: {dst_path} ({os.path.getsize(dst_path) / 1024:.2f} KB)")
