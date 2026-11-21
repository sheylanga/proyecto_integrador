import json
import re
import os

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

fk_map = {}
for t in tables:
    renames = {}
    for fk in t['fks']:
        c = fk['col']
        if c.startswith('id_'):
            renames[c] = c[3:]
    if renames:
        fk_map[t['table']] = renames

def transform_ddl_text(text):
    # Process each CREATE TABLE block
    def repl_table(match):
        header = match.group(1) # CREATE TABLE schema.table (
        tbl_name = match.group(2).strip()
        body = match.group(3)
        footer = match.group(4) # );
        
        if tbl_name not in fk_map:
            return match.group(0)
            
        renames = fk_map[tbl_name]
        new_lines = []
        for line in body.splitlines():
            # Split off REFERENCES ... so we NEVER rename the PK in REFERENCES parent(id_...)
            ref_split = re.split(r'(\bREFERENCES\b)', line, maxsplit=1, flags=re.IGNORECASE)
            left_part = ref_split[0]
            right_part = "".join(ref_split[1:]) if len(ref_split) > 1 else ""
            
            for old_c, new_c in renames.items():
                # Replace whole word old_c in left_part
                left_part = re.sub(rf'\b{re.escape(old_c)}\b', new_c, left_part)
                
            new_lines.append(left_part + right_part)
            
        return f"{header}{chr(10).join(new_lines)}{footer}"

    pattern = re.compile(r'(CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\()(.*?)(\);)', re.DOTALL | re.IGNORECASE)
    new_text = pattern.sub(repl_table, text)
    
    # Also check any CREATE INDEX statements outside CREATE TABLE:
    # CREATE [NONCLUSTERED] INDEX idx ON schema.table (col1, col2)
    def repl_index(match):
        prefix = match.group(1)
        tbl_name = match.group(2).strip()
        cols_part = match.group(3)
        suffix = match.group(4)
        if tbl_name in fk_map:
            for old_c, new_c in fk_map[tbl_name].items():
                cols_part = re.sub(rf'\b{re.escape(old_c)}\b', new_c, cols_part)
        return f"{prefix}{tbl_name}{cols_part}{suffix}"
        
    idx_pattern = re.compile(r'(CREATE\s+(?:UNIQUE\s+)?(?:NONCLUSTERED\s+)?INDEX\s+[a-zA-Z0-9_]+\s+ON\s+)([a-zA-Z0-9_\.]+)(\s*\([^)]+\))(.*?;)', re.IGNORECASE)
    new_text = idx_pattern.sub(repl_index, new_text)
    return new_text

base = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos"

ddl_files = [
    os.path.join(base, "01_DDL_SQL_Server", "01_modulo_identidad_catalogo_alu1.sql"),
    os.path.join(base, "01_DDL_SQL_Server", "02_modulo_comercial_pagos_alu2.sql"),
    os.path.join(base, "01_DDL_SQL_Server", "03_modulo_logistica_inventario_alu3.sql"),
    os.path.join(base, "01_DDL_SQL_Server", "00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"),
    os.path.join(base, "02_DDL_PostgreSQL", "01_modulo_identidad_catalogo_alu1_postgres.sql"),
    os.path.join(base, "02_DDL_PostgreSQL", "02_modulo_comercial_pagos_alu2_postgres.sql"),
    os.path.join(base, "02_DDL_PostgreSQL", "03_modulo_logistica_inventario_alu3_postgres.sql"),
    os.path.join(base, "02_DDL_PostgreSQL", "00_SCRIPT_COMPLETO_150_TABLAS_POSTGRESQL.sql"),
]

for fp in ddl_files:
    if os.path.exists(fp):
        with open(fp, "r", encoding="utf-8", errors="ignore") as f:
            txt = f.read()
        updated = transform_ddl_text(txt)
        with open(fp, "w", encoding="utf-8") as f:
            f.write(updated)
        print(f"Updated DDL: {os.path.basename(fp)}")
    else:
        print(f"WARNING: File not found: {fp}")
