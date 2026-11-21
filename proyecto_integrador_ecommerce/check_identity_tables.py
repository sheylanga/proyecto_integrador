import json

with open("tables_meta.json", "r") as f:
    tables = json.load(f)

no_identity_tables = []
for t in tables:
    has_identity = any(c['identity'] for c in t['columns'])
    if not has_identity:
        no_identity_tables.append(t['table'])

print(f"Tables without IDENTITY: {len(no_identity_tables)}")
for tbl in no_identity_tables:
    print("  ", tbl)
