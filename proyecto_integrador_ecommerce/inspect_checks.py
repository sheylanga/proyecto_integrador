import re

def find_checks_in_file(sql_file):
    with open(sql_file, 'r', encoding='utf-8', errors='ignore') as f:
        text = f.read()
    print(f'=== CHECKS IN {sql_file} ===')
    matches = re.findall(r'(\w+\.\w+).*?CHECK\s*\((.*?)\)', text, re.IGNORECASE | re.DOTALL)
    # Better: find table name and every CHECK
    tables = re.findall(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', text, re.DOTALL | re.IGNORECASE)
    for tname, body in tables:
        checks = re.findall(r'CONSTRAINT\s+([a-zA-Z0-9_]+)\s+CHECK\s*\((.*?)\)', body, re.IGNORECASE | re.DOTALL)
        for cname, cexpr in checks:
            # clean whitespace
            cexpr_clean = ' '.join(cexpr.split())
            print(f'{tname} -> {cname}: {cexpr_clean}')

find_checks_in_file(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\02_modulo_comercial_pagos_alu2.sql')
find_checks_in_file(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\03_modulo_logistica_inventario_alu3.sql')
