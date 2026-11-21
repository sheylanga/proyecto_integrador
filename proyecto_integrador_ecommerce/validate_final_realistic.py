import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

meta_map = {t['table']: t for t in tables}

dml_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_SQLSERVER.sql"
with open(dml_file, "r", encoding="utf-8") as f:
    dml_text = f.read()

print("Checking for 'Dato_' placeholders:", "Dato_" in dml_text)

insert_pattern = re.compile(r'INSERT INTO\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\)\s*VALUES\s*(.*?);(?=\s*SET|\s*GO|\s*--|\s*INSERT|\Z)', re.DOTALL | re.IGNORECASE)
inserts = insert_pattern.findall(dml_text)
print(f"Total INSERT statements: {len(inserts)}")

errors = []
for tbl_name, col_list_str, values_str in inserts:
    tbl_name = tbl_name.strip()
    cols = [c.strip() for c in col_list_str.split(',')]
    t_meta = meta_map[tbl_name]
    ddl_cols = {c['name']: c for c in t_meta['columns']}
    
    for c in cols:
        if c not in ddl_cols:
            errors.append(f"{tbl_name}: unknown column '{c}'")
            
    # Parse rows
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
        
    for r_idx, r in enumerate(rows):
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
            
        if len(tokens) != len(cols):
            errors.append(f"{tbl_name} row {r_idx+1}: {len(tokens)} values != {len(cols)} cols")
            break
            
        for cname, val in zip(cols, tokens):
            cinfo = ddl_cols[cname]
            btype = cinfo['type'].split('(')[0].upper()
            maxlen = cinfo['maxlen']
            if btype in ['BIGINT', 'INT', 'SMALLINT', 'TINYINT']:
                if val != 'NULL' and not re.match(r'^-?\d+$', val):
                    errors.append(f"{tbl_name}.{cname} ({btype}) invalid int: {val}")
                    break
            elif btype in ['NVARCHAR', 'VARCHAR', 'CHAR', 'NCHAR'] and val != 'NULL':
                raw = val[2:-1] if val.startswith("N'") else val[1:-1]
                raw = raw.replace("''", "'")
                byte_len = len(raw.encode('utf-8')) if btype in ['VARCHAR', 'CHAR'] else len(raw)
                if maxlen and byte_len > maxlen:
                    errors.append(f"{tbl_name}.{cname} ({btype}({maxlen})) byte/char len {byte_len} > {maxlen}: {raw}")
                    break
            if cname in t_meta['checks'] and val != 'NULL':
                raw = val[2:-1] if val.startswith("N'") else val[1:-1]
                if btype in ['INT', 'SMALLINT', 'TINYINT', 'BIGINT']:
                    raw = val
                if raw not in t_meta['checks'][cname]:
                    errors.append(f"{tbl_name}.{cname} check failed: '{raw}' not in {t_meta['checks'][cname]}")
                    break

print(f"Total validation errors: {len(errors)}")
for e in errors[:10]:
    print("  ERR:", e)
