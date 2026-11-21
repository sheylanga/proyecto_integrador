import json
from parse_schemas import parse_ddl

t2 = parse_ddl(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\02_modulo_comercial_pagos_alu2.sql')
t3 = parse_ddl(r'C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\01_DDL_SQL_Server\03_modulo_logistica_inventario_alu3.sql')

with open('schema_details_mod2.json', 'w', encoding='utf-8') as f:
    json.dump(t2, f, indent=2, ensure_ascii=False)

with open('schema_details_mod3.json', 'w', encoding='utf-8') as f:
    json.dump(t3, f, indent=2, ensure_ascii=False)

print('Dumped schema details for mod 2 and 3.')
