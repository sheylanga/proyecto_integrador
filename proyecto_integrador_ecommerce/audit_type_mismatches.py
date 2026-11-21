import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

# Let's inspect where type mismatches could happen in generate_value
type_errors = []

for t in tables:
    tbl_name = t['table']
    for c in t['columns']:
        cname = c['name']
        ctype = c['type'].upper()
        # If type is numeric (BIGINT, INT, SMALLINT, TINYINT, DECIMAL, NUMERIC, BIT)
        # but a string N'...' is returned, that is a catastrophic type mismatch!
        # Let's see what ctype is
        base_type = ctype.split('(')[0]
        if base_type in ['BIGINT', 'INT', 'SMALLINT', 'TINYINT', 'DECIMAL', 'NUMERIC', 'BIT', 'FLOAT', 'REAL']:
            # Must be a number!
            pass

print("Audit of column types completed.")
