import re
import json

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    ddl_text = f.read()

pattern = re.compile(r'CREATE TABLE\s+([a-zA-Z0-9_\.]+)\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)

tables = []

for tbl_name, body in pattern.findall(ddl_text):
    tbl_name = tbl_name.strip()
    cols = []
    checks = {}
    fks = []
    uniques = []
    
    lines = body.splitlines()
    for line in lines:
        line_clean = line.split('--')[0].strip().rstrip(',')
        if not line_clean:
            continue
            
        if line_clean.upper().startswith('CONSTRAINT'):
            m_chk = re.search(r'CHECK\s*\(([a-zA-Z0-9_]+)\s+IN\s*\((.*?)\)\)', line_clean, re.IGNORECASE)
            if m_chk:
                checks[m_chk.group(1)] = [x.strip().lstrip('N').strip("'") for x in m_chk.group(2).split(',')]
            m_fk = re.search(r'FOREIGN KEY\s*\(([a-zA-Z0-9_]+)\)\s*REFERENCES\s+([a-zA-Z0-9_\.]+)\s*\(([a-zA-Z0-9_]+)\)', line_clean, re.IGNORECASE)
            if m_fk:
                fks.append({
                    'col': m_fk.group(1),
                    'ref_table': m_fk.group(2),
                    'ref_col': m_fk.group(3)
                })
            m_uq = re.search(r'UNIQUE\s*(?:CLUSTERED|NONCLUSTERED)?\s*\((.*?)\)', line_clean, re.IGNORECASE)
            if m_uq:
                uniques.append([c.strip() for c in m_uq.group(1).split(',')])
        else:
            if re.search(r'\s+AS\s+\(', line_clean, re.IGNORECASE):
                continue
                
            m = re.match(r'([a-zA-Z0-9_]+)\s+([a-zA-Z0-9_\(\)]+)(.*)', line_clean)
            if m:
                cname = m.group(1)
                ctype = m.group(2)
                crest = m.group(3)
                
                m_chk = re.search(r'CHECK\s*\(([a-zA-Z0-9_]+)\s+IN\s*\((.*?)\)\)', crest, re.IGNORECASE)
                if m_chk:
                    checks[m_chk.group(1)] = [x.strip().lstrip('N').strip("'") for x in m_chk.group(2).split(',')]
                
                m_fk = re.search(r'REFERENCES\s+([a-zA-Z0-9_\.]+)\s*\(([a-zA-Z0-9_]+)\)', crest, re.IGNORECASE)
                if m_fk:
                    fks.append({
                        'col': cname,
                        'ref_table': m_fk.group(1),
                        'ref_col': m_fk.group(2)
                    })
                
                if 'UNIQUE' in crest.upper() and 'UNIQUEIDENTIFIER' not in ctype.upper():
                    uniques.append([cname])
                    
                is_identity = 'IDENTITY' in crest.upper()
                is_nullable = 'NOT NULL' not in crest.upper() and 'NOT NULL' not in line_clean.upper()
                
                maxlen = None
                m_len = re.search(r'\((\d+)\)', ctype)
                if m_len:
                    maxlen = int(m_len.group(1))
                    
                cols.append({
                    'name': cname,
                    'type': ctype.upper(),
                    'maxlen': maxlen,
                    'identity': is_identity,
                    'nullable': is_nullable,
                    'raw': line_clean
                })
                
    tables.append({
        'table': tbl_name,
        'columns': cols,
        'checks': checks,
        'fks': fks,
        'uniques': uniques
    })

print(f"Extracted metadata for {len(tables)} tables.")
with open("tables_meta.json", "w", encoding="utf-8") as f:
    json.dump(tables, f, indent=2)
print("Saved tables_meta.json")
