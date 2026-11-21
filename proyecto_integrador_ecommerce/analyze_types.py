import re
from collections import Counter

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    text = f.read()

pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)

types = Counter()
cols_by_type = {}

for tbl_name, body in pattern.findall(text):
    for line in body.splitlines():
        line = line.strip().rstrip(',')
        if not line or line.startswith('--') or line.upper().startswith('CONSTRAINT'):
            continue
        line_clean = line.split('--')[0].strip().rstrip(',')
        m = re.match(r'([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_\(\)]+)', line_clean)
        if m:
            cname = m.group(1)
            ctype = m.group(2).upper()
            base_type = ctype.split('(')[0]
            types[base_type] += 1
            if base_type not in cols_by_type:
                cols_by_type[base_type] = set()
            cols_by_type[base_type].add(cname)

print("Base types distribution:")
for t, cnt in types.most_common():
    print(f"  {t}: {cnt} columns")
