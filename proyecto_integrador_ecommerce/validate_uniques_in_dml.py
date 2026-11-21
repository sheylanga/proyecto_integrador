import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

dml_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_SQLSERVER.sql"
with open(dml_file, "r", encoding="utf-8") as f:
    dml_text = f.read()

# Map table meta
meta_map = {t['table']: t for t in tables}

# Parse INSERTs from DML
insert_pattern = re.compile(r'INSERT INTO\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\)\s*VALUES\s*(.*?);(?=\s*SET|\s*GO|\s*--|\s*INSERT|\Z)', re.DOTALL | re.IGNORECASE)
inserts = insert_pattern.findall(dml_text)

def parse_rows(values_str):
    rows = []
    in_str = False
    depth = 0
    start_idx = -1
    i = 0
    n = len(values_str)
    while i < n:
        ch = values_str[i]
        if ch == "'":
            if i + 1 < n and values_str[i+1] == "'":
                i += 2
                continue
            in_str = not in_str
        elif not in_str:
            if ch == '(':
                depth += 1
                if depth == 1:
                    start_idx = i + 1
            elif ch == ')':
                depth -= 1
                if depth == 0 and start_idx != -1:
                    rows.append(values_str[start_idx:i])
                    start_idx = -1
        i += 1
    parsed = []
    for r in rows:
        tokens = []
        cur = []
        r_in_str = False
        k = 0
        rn = len(r)
        while k < rn:
            c = r[k]
            if c == "'":
                if k + 1 < rn and r[k+1] == "'":
                    cur.append("''")
                    k += 2
                    continue
                r_in_str = not r_in_str
                cur.append(c)
            elif c == ',' and not r_in_str:
                tokens.append("".join(cur).strip())
                cur = []
            else:
                cur.append(c)
            k += 1
        if cur:
            tokens.append("".join(cur).strip())
        parsed.append(tokens)
    return parsed

uq_violations = []
for tbl_name, col_list_str, values_str in inserts:
    tbl_name = tbl_name.strip()
    cols = [c.strip() for c in col_list_str.split(',')]
    rows = parse_rows(values_str)
    meta = meta_map[tbl_name]
    
    for uq_cols in meta['uniques']:
        seen = set()
        col_indices = [cols.index(uc) for uc in uq_cols]
        for r_idx, r in enumerate(rows):
            key = tuple(r[idx] for idx in col_indices)
            if key in seen:
                uq_violations.append(f"{tbl_name} UNIQUE({', '.join(uq_cols)}) duplicate key {key} at row {r_idx+1}")
                break
            seen.add(key)

print(f"Total UNIQUE violations found: {len(uq_violations)}")
for v in uq_violations:
    print(" -", v)
