import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

print(f"Total tables: {len(tables)}")

# Special rules for specific fields that have specific check constraints or ranges:
# Let's inspect all columns across all tables that have checks or specific names
check_cols = {}
for t in tables:
    for c, allowed in t['checks'].items():
        check_cols[f"{t['table']}.{c}"] = allowed

print(f"Total check columns: {len(check_cols)}")
for k, v in list(check_cols.items())[:20]:
    print(f"  {k}: {v}")
