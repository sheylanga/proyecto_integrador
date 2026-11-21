import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

for t in tables:
    for c in t['columns']:
        if 'DECIMAL' in c['type'] or 'NUMERIC' in c['type']:
            m = re.search(r'\((\d+)\s*,\s*(\d+)\)', c['raw'])
            if m:
                p, s = int(m.group(1)), int(m.group(2))
                max_int_digits = p - s
                if max_int_digits <= 2:
                    print(f"{t['table']}.{c['name']}: {c['raw'].split()[1]} (max_int_digits={max_int_digits})")
