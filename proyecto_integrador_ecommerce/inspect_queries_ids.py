import re
import os

base = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\04_Consultas_Algebra"
files = [
    os.path.join(base, "01_consultas_avanzadas_sqlserver.sql"),
    os.path.join(base, "01_algebra_relacional_y_sql_avanzado.md")
]

# In these queries, we know PKs are on their own table (e.g. c.id_cliente, p.id_producto, o.id_orden, u.id_usuario, r.id_rol)
# Wait: when joining `clientes.clientes c` with `ventas.ordenes o`, `c.id_cliente = o.id_cliente` -> `c.id_cliente = o.cliente`!
# Let's inspect all JOIN / ON / WHERE / SELECT / GROUP BY patterns in 01_consultas_avanzadas_sqlserver.sql first!
with open(files[0], "r", encoding="utf-8") as f:
    sql = f.read()

for line in sql.splitlines():
    if "id_" in line:
        print(line.strip())
