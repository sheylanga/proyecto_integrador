import json

with open("tables_meta.json", "r") as f:
    tables = json.load(f)

for t in tables:
    for c in t['columns']:
        b = c['type'].split('(')[0].upper()
        if b in ['CHAR', 'NCHAR', 'BINARY', 'VARBINARY']:
            print(f"{t['table']}.{c['name']} ({c['type']})")
