import json
import os

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

# Reverse order of tables
rev_tables = list(reversed(tables))

lines = [
    "-- =================================================================================================",
    "-- SCRIPT DE REINICIO / LIMPIEZA TOTAL DE DATOS (150 TABLAS)",
    "-- Limpia registros en orden inverso para respetar las claves foráneas (FK)",
    "-- =================================================================================================",
    "USE EcommerceSaludBellezaDB;",
    "GO",
    "SET NOCOUNT ON;",
    "",
    "-- Desactivar cualquier IDENTITY_INSERT que haya quedado abierto en la sesión de SSMS",
    "BEGIN TRY",
    "    SET IDENTITY_INSERT seguridad.permisos OFF;",
    "END TRY BEGIN CATCH END CATCH;",
    "BEGIN TRY",
    "    SET IDENTITY_INSERT seguridad.roles_permisos OFF;",
    "END TRY BEGIN CATCH END CATCH;",
    "GO",
    "",
    "PRINT '>>> INICIANDO LIMPIEZA DE DATOS EN 150 TABLAS...';",
    "GO"
]

for t in rev_tables:
    tbl_name = t['table']
    lines.append(f"DELETE FROM {tbl_name};")
    lines.append(f"IF OBJECT_ID('{tbl_name}') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('{tbl_name}'), 'TableHasIdentity') = 1")
    lines.append(f"    DBCC CHECKIDENT ('{tbl_name}', RESEED, 0);")
    lines.append("GO")

lines.append("PRINT '>>> LIMPIEZA COMPLETADA CON ÉXITO. TABLAS LISTAS PARA EL NUEVO SEED DATA.';")
lines.append("GO")

out_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_RESET_LIMPIAR_DATOS_150_TABLAS.sql"
with open(out_file, "w", encoding="utf-8") as f:
    f.write("\n".join(lines))

print("Created updated 00_RESET_LIMPIAR_DATOS_150_TABLAS.sql successfully!")
