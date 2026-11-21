import json

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

for t in tables:
    for c, allowed in t['checks'].items():
        print(f"{t['table']}.{c}: {allowed}")
