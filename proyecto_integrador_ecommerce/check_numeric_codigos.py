import json

with open("tables_meta.json", "r") as f:
    tables = json.load(f)

for t in tables:
    for c in t['columns']:
        btype = c['type'].split('(')[0].upper()
        cname = c['name']
        if (cname.startswith('codigo_') or cname.startswith('clave_') or cname.startswith('numero_')) and btype in ['INT', 'BIGINT', 'SMALLINT', 'TINYINT']:
            print(f"{t['table']}.{cname} ({c['type']})")
