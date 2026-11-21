import re
import json

def parse_ddl(file_path):
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        text = f.read()
    
    # Matches CREATE TABLE schema.table ( ... ); GO
    pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)
    matches = pattern.findall(text)
    
    result = []
    for full_name, body in matches:
        lines = body.splitlines()
        cols = []
        pks = []
        fks = []
        checks = []
        uniques = []
        for line in lines:
            line_str = line.strip()
            if not line_str or line_str.startswith('--'):
                continue
            if line_str.upper().startswith('CONSTRAINT'):
                if 'PRIMARY KEY' in line_str.upper():
                    pks.append(line_str)
                elif 'FOREIGN KEY' in line_str.upper():
                    fks.append(line_str)
                elif 'CHECK' in line_str.upper():
                    checks.append(line_str)
                elif 'UNIQUE' in line_str.upper():
                    uniques.append(line_str)
            else:
                parts = line_str.split()
                col_name = parts[0]
                col_type = parts[1] if len(parts) > 1 else ''
                is_identity = 'IDENTITY' in line_str.upper()
                is_not_null = 'NOT NULL' in line_str.upper()
                has_default = 'DEFAULT' in line_str.upper()
                cols.append({
                    'name': col_name,
                    'type': col_type,
                    'identity': is_identity,
                    'not_null': is_not_null,
                    'has_default': has_default,
                    'raw': line_str
                })
        result.append({
            'table': full_name,
            'columns': cols,
            'pks': pks,
            'fks': fks,
            'checks': checks,
            'uniques': uniques
        })
    return result

if __name__ == '__main__':
    t2 = parse_ddl(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\02_modulo_comercial_pagos_alu2.sql')
    t3 = parse_ddl(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\03_modulo_logistica_inventario_alu3.sql')
    
    print(f'Mod 2 tables: {len(t2)}')
    for i, t in enumerate(t2, 51):
        col_names = [c['name'] for c in t['columns']]
        print(f'{i:03d}. {t["table"]} -> cols: {len(col_names)}')
        
    print(f'\nMod 3 tables: {len(t3)}')
    for i, t in enumerate(t3, 101):
        col_names = [c['name'] for c in t['columns']]
        print(f'{i:03d}. {t["table"]} -> cols: {len(col_names)}')
