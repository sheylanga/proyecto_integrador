# -*- coding: utf-8 -*-
import json
import os

with open(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\schema_details_mod2.json', 'r', encoding='utf-8') as f:
    mod2_tables = json.load(f)

table_cols = {t['table']: [c['name'] for c in t['columns']] for t in mod2_tables}
print(f"Loaded {len(table_cols)} tables from Module 2.")
for tname in list(table_cols.keys())[:5]:
    print(tname, "->", table_cols[tname][:6])
