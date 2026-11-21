import re
from collections import defaultdict, deque

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    ddl_text = f.read()

table_pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)

tables_info = {}
table_order_in_ddl = []

for tbl_name, body in table_pattern.findall(ddl_text):
    tbl_name = tbl_name.strip()
    table_order_in_ddl.append(tbl_name)
    
    cols = []
    checks = {}
    fks = []
    pk_cols = []
    
    for line in body.splitlines():
        line = line.strip().rstrip(',')
        if not line or line.startswith('--'):
            continue
            
        if line.upper().startswith('CONSTRAINT'):
            if 'PRIMARY KEY' in line.upper():
                m_pk = re.search(r'PRIMARY KEY\s*\((.*?)\)', line, re.IGNORECASE)
                if m_pk:
                    pk_cols = [c.strip() for c in m_pk.group(1).split(',')]
            elif 'FOREIGN KEY' in line.upper():
                m_fk = re.search(r'FOREIGN KEY\s*\(([a-zA-Z0-9_]+)\)\s*REFERENCES\s+([a-zA-Z0-9_\.]+)\s*\(([a-zA-Z0-9_]+)\)', line, re.IGNORECASE)
                if m_fk:
                    fks.append({
                        'col': m_fk.group(1),
                        'ref_table': m_fk.group(2),
                        'ref_col': m_fk.group(3)
                    })
            elif 'CHECK' in line.upper():
                m_chk = re.search(r'CHECK\s*\(([a-zA-Z0-9_]+)\s+IN\s*\((.*?)\)\)', line, re.IGNORECASE)
                if m_chk:
                    col_name = m_chk.group(1)
                    allowed = [x.strip().lstrip('N').strip("'") for x in m_chk.group(2).split(',')]
                    checks[col_name] = allowed
        else:
            # Column
            match = re.match(r'([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_\(\)]+)(.*)', line)
            if match:
                cname = match.group(1)
                ctype = match.group(2)
                crest = match.group(3)
                
                # Inline check?
                m_chk = re.search(r'CHECK\s*\(([a-zA-Z0-9_]+)\s+IN\s*\((.*?)\)\)', crest, re.IGNORECASE)
                if m_chk:
                    checks[m_chk.group(1)] = [x.strip().lstrip('N').strip("'") for x in m_chk.group(2).split(',')]
                    
                # Inline FK?
                m_fk = re.search(r'REFERENCES\s+([a-zA-Z0-9_\.]+)\s*\(([a-zA-Z0-9_]+)\)', crest, re.IGNORECASE)
                if m_fk:
                    fks.append({
                        'col': cname,
                        'ref_table': m_fk.group(1),
                        'ref_col': m_fk.group(2)
                    })
                    
                is_identity = 'IDENTITY' in crest.upper()
                is_nullable = 'NOT NULL' not in crest.upper() and 'NOT NULL' not in line.upper()
                has_default = 'DEFAULT' in crest.upper() or 'DEFAULT' in line.upper()
                
                cols.append({
                    'name': cname,
                    'type': ctype,
                    'identity': is_identity,
                    'nullable': is_nullable,
                    'default': has_default,
                    'raw': line
                })
                
    tables_info[tbl_name] = {
        'columns': cols,
        'checks': checks,
        'fks': fks,
        'pks': pk_cols
    }

print(f"Total tables: {len(tables_info)}")

# Check FK order in DDL
# Is DDL order already a valid topological order?
# Let's check for each table in DDL order if all its FK ref_tables appear BEFORE it
violations = []
seen = set()

for idx, tbl in enumerate(table_order_in_ddl):
    seen.add(tbl)
    for fk in tables_info[tbl]['fks']:
        ref = fk['ref_table']
        if ref == tbl:
            # Self-reference
            continue
        if ref not in seen:
            violations.append(f"Table #{idx+1} '{tbl}' references '{ref}' which appears LATER in DDL!")

print(f"FK violations in DDL order: {len(violations)}")
for v in violations:
    print("  " + v)
