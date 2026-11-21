import re

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"
dml_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    ddl_text = f.read()

table_pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)
ddl_tables = {}

for tbl_name, body in table_pattern.findall(ddl_text):
    tbl_name = tbl_name.strip()
    col_dict = {}
    col_order = []
    checks = []
    fks = []
    
    for line in body.splitlines():
        line = line.strip().rstrip(',')
        if not line or line.startswith('--'):
            continue
        if line.upper().startswith('CONSTRAINT'):
            if 'CHECK' in line.upper():
                checks.append(line)
            elif 'FOREIGN KEY' in line.upper():
                fks.append(line)
        else:
            match = re.match(r'([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_\(\)]+)(.*)', line)
            if match:
                cname = match.group(1)
                ctype = match.group(2)
                crest = match.group(3)
                col_dict[cname] = {
                    'type': ctype,
                    'rest': crest,
                    'raw': line
                }
                col_order.append(cname)
    ddl_tables[tbl_name] = {
        'columns': col_dict,
        'order': col_order,
        'checks': checks,
        'fks': fks
    }

print(f"Parsed {len(ddl_tables)} tables from DDL.")

with open(dml_file, "r", encoding="utf-8", errors="ignore") as f:
    dml_text = f.read()

# Let's find every INSERT INTO statement in dml_text
# e.g. INSERT INTO schema.table (col1, col2, ...) VALUES ...
insert_pattern = re.compile(r'INSERT INTO\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\)\s*VALUES\s*(.*?);(?=\s*SET|\s*GO|\s*--|\s*INSERT|\Z)', re.DOTALL | re.IGNORECASE)

inserts = insert_pattern.findall(dml_text)
print(f"Found {len(inserts)} INSERT statements in DML.")

issues = []

for tbl_name, col_list_str, values_str in inserts:
    tbl_name = tbl_name.strip()
    if tbl_name not in ddl_tables:
        issues.append(f"Table '{tbl_name}' NOT FOUND in DDL!")
        continue
    
    # Parse columns in INSERT
    insert_cols = [c.strip() for c in col_list_str.split(',') if c.strip()]
    ddl_cols = ddl_tables[tbl_name]['columns']
    
    # Check 1: Non-existent columns
    for c in insert_cols:
        if c not in ddl_cols:
            issues.append(f"Table '{tbl_name}': Column '{c}' in INSERT does not exist in DDL! Available: {list(ddl_cols.keys())[:5]}...")
            
    # Check 2: Parse VALUES rows
    # Each row is (val1, val2, ...)
    # Let's count rows and value counts
    # A simple regex for matching rows:
    # rows are delimited by '),\n(' or '\n('
    # Let's clean values_str
    # Note: values might have commas inside strings N'...', so we should parse carefully
    row_strings = []
    in_str = False
    str_char = ''
    depth = 0
    curr_row = []
    
    # We can split values_str into rows by finding matching () at depth 1
    rows = []
    current = []
    i = 0
    val_len = len(values_str)
    start_idx = -1
    
    while i < val_len:
        ch = values_str[i]
        if ch == "'":
            # Check for escaped ''
            if i + 1 < val_len and values_str[i+1] == "'":
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
        
    if len(rows) < 30:
        issues.append(f"Table '{tbl_name}': Only {len(rows)} rows found (expected at least 30)!")
        
    for r_idx, r in enumerate(rows):
        # Count elements in r taking into account commas inside strings
        tokens = []
        cur_tok = []
        r_in_str = False
        k = 0
        r_len = len(r)
        while k < r_len:
            c = r[k]
            if c == "'":
                if k + 1 < r_len and r[k+1] == "'":
                    cur_tok.append("''")
                    k += 2
                    continue
                r_in_str = not r_in_str
                cur_tok.append(c)
            elif c == ',' and not r_in_str:
                tokens.append("".join(cur_tok).strip())
                cur_tok = []
            else:
                cur_tok.append(c)
            k += 1
        if cur_tok:
            tokens.append("".join(cur_tok).strip())
            
        if len(tokens) != len(insert_cols):
            issues.append(f"Table '{tbl_name}', Row {r_idx+1}: {len(tokens)} values provided, but INSERT specifies {len(insert_cols)} columns!")
            break # just report first row failure per table
            
        # Check string lengths against DDL column types
        for col_name, val in zip(insert_cols, tokens):
            if col_name in ddl_cols:
                col_info = ddl_cols[col_name]
                ctype = col_info['type'].upper()
                # Check NVARCHAR(X) or VARCHAR(X)
                len_match = re.match(r'(?:NVARCHAR|VARCHAR)\((\d+)\)', ctype)
                if len_match:
                    max_len = int(len_match.group(1))
                    # If val is N'string' or 'string'
                    if (val.startswith("N'") or val.startswith("'")) and val.endswith("'"):
                        # Extract inner text unescaped
                        raw_str = val[2:-1] if val.startswith("N'") else val[1:-1]
                        raw_str = raw_str.replace("''", "'")
                        if len(raw_str) > max_len:
                            issues.append(f"Table '{tbl_name}', Col '{col_name}': String len {len(raw_str)} > max {max_len} (value: '{raw_str}')")
                            break
                            
                # Check CHECK constraints on col_info
                raw_col = col_info['raw']
                if 'CHECK' in raw_col:
                    chk_in = re.search(r'CHECK\s*\([a-zA-Z0-9_]+\s+IN\s*\((.*?)\)\)', raw_col, re.IGNORECASE)
                    if chk_in:
                        allowed_raw = chk_in.group(1)
                        # Parse allowed items like N'MUY_BAJA', N'MODERADA'
                        allowed = [item.strip().lstrip('N').strip("'") for item in allowed_raw.split(',')]
                        if (val.startswith("N'") or val.startswith("'")) and val.endswith("'"):
                            raw_str = val[2:-1] if val.startswith("N'") else val[1:-1]
                            raw_str = raw_str.replace("''", "'")
                            if raw_str not in allowed:
                                issues.append(f"Table '{tbl_name}', Col '{col_name}': Value '{raw_str}' NOT IN allowed {allowed}")
                                break

print(f"\nTotal issues detected: {len(issues)}")
for issue in issues[:40]:
    print(" - " + issue)
if len(issues) > 40:
    print(f"... and {len(issues)-40} more issues.")
