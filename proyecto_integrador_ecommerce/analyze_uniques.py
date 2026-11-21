import re

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    text = f.read()

pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)

uniques_by_table = {}

for tbl_name, body in pattern.findall(text):
    tbl_name = tbl_name.strip()
    u_cols = []
    for line in body.splitlines():
        line_clean = line.split('--')[0].strip().rstrip(',')
        if 'UNIQUE' in line_clean.upper() and not line_clean.upper().startswith('UNIQUEIDENTIFIER'):
            # Could be inline UNIQUE or CONSTRAINT UQ_... UNIQUE (col1, col2)
            m_uq = re.search(r'UNIQUE\s*(?:CLUSTERED|NONCLUSTERED)?\s*\((.*?)\)', line_clean, re.IGNORECASE)
            if m_uq:
                cols = [c.strip() for c in m_uq.group(1).split(',')]
                u_cols.append(cols)
            else:
                m_inline = re.match(r'([a-zA-Z0-9_]+)\s+.*?UNIQUE', line_clean, re.IGNORECASE)
                if m_inline:
                    u_cols.append([m_inline.group(1)])
    if u_cols:
        uniques_by_table[tbl_name] = u_cols

print(f"Tables with UNIQUE constraints: {len(uniques_by_table)}")
for tbl, uqs in uniques_by_table.items():
    print(f"  {tbl}: {uqs}")
