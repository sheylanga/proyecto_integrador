import re

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    ddl_text = f.read()

table_pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)

tables_info = []

for tbl_name, body in table_pattern.findall(ddl_text):
    tbl_name = tbl_name.strip()
    cols = []
    checks = {}
    fks = []
    
    # We need to collect constraints first
    lines = body.splitlines()
    for line in lines:
        line_str = line.strip().rstrip(',')
        if not line_str or line_str.startswith('--'):
            continue
        if line_str.upper().startswith('CONSTRAINT'):
            # Table-level check
            m_chk = re.search(r'CHECK\s*\(([a-zA-Z0-9_]+)\s+IN\s*\((.*?)\)\)', line_str, re.IGNORECASE)
            if m_chk:
                col_name = m_chk.group(1)
                allowed = [x.strip().lstrip('N').strip("'") for x in m_chk.group(2).split(',')]
                checks[col_name] = allowed
            # Table-level FK
            m_fk = re.search(r'FOREIGN KEY\s*\(([a-zA-Z0-9_]+)\)\s*REFERENCES\s+([a-zA-Z0-9_\.]+)\s*\(([a-zA-Z0-9_]+)\)', line_str, re.IGNORECASE)
            if m_fk:
                fks.append({
                    'col': m_fk.group(1),
                    'ref_table': m_fk.group(2),
                    'ref_col': m_fk.group(3)
                })
        else:
            # Column definition
            # Strip comments
            raw_no_comment = line_str.split('--')[0].strip().rstrip(',')
            match = re.match(r'([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_\(\)]+)(.*)', raw_no_comment)
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
                is_nullable = 'NOT NULL' not in crest.upper() and 'NOT NULL' not in raw_no_comment.upper()
                
                cols.append({
                    'name': cname,
                    'type': ctype,
                    'identity': is_identity,
                    'nullable': is_nullable,
                    'raw': raw_no_comment
                })
                
    tables_info.append({
        'table': tbl_name,
        'columns': cols,
        'checks': checks,
        'fks': fks
    })

print(f"Loaded {len(tables_info)} tables from DDL.")
# Check the specific tables from user errors:
for t in tables_info:
    if t['table'] in ['comunidad.rutinas_belleza', 'catalogo.multimedia_variantes', 'clientes.solicitudes_arco']:
        print(f"\nTable: {t['table']}")
        for c in t['columns']:
            print(f"  {c['name']} ({c['type']})")
        print("  Checks:", t['checks'])
        print("  FKs:", t['fks'])
