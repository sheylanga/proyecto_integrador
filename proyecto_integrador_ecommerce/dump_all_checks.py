import re

ddl_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql"

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    text = f.read()

# Find all CHECK constraints
checks = re.findall(r'CONSTRAINT\s+([a-zA-Z0-9_]+)\s+CHECK\s*\((.*?)\)', text, re.IGNORECASE)

print(f"Total CHECK constraints found: {len(checks)}")
for cname, cexpr in checks:
    print(f"{cname}: {cexpr.strip()}")
