import re

def list_fks(file_path):
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        text = f.read()
    tables = re.findall(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', text, re.DOTALL | re.IGNORECASE)
    print(f'=== FKs in {file_path} ===')
    for tname, body in tables:
        fks = re.findall(r'CONSTRAINT\s+([a-zA-Z0-9_]+)\s+FOREIGN KEY\s*\((.*?)\)\s*REFERENCES\s*([a-zA-Z0-9_\.]+)\s*\((.*?)\)', body, re.IGNORECASE)
        for cname, col, ref_table, ref_col in fks:
            print(f'{tname} ({col.strip()}) -> {ref_table} ({ref_col.strip()})')

list_fks(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\02_modulo_comercial_pagos_alu2.sql')
list_fks(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\03_modulo_logistica_inventario_alu3.sql')
