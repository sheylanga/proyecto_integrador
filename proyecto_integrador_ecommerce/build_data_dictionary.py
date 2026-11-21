# -*- coding: utf-8 -*-
"""
Generador del Diccionario de Datos Completo (150 Tablas)
Rúbrica FBD - Criterio 2.3 (15%)
"""
import re
import os

base_dir = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos"
ddl_file = os.path.join(base_dir, "01_DDL_SQL_Server", "00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql")
output_file = os.path.join(base_dir, "05_Diccionario_de_Datos", "00_DICCIONARIO_DE_DATOS_150_TABLAS.md")

with open(ddl_file, "r", encoding="utf-8", errors="ignore") as f:
    text = f.read()

pattern = re.compile(r'--\s*(\d{3})\.\s*TABLA:\s*([a-zA-Z0-9_\.]+)\s*\((.*?)\)\s*IF OBJECT_ID.*?CREATE TABLE\s+[a-zA-Z0-9_\.]+\s*\((.*?)\);\s*GO', re.DOTALL | re.IGNORECASE)
matches = pattern.findall(text)

print(f"Tablas encontradas por regex: {len(matches)}")

doc = []
def p(s):
    doc.append(s + "\n")

p("# DICCIONARIO DE DATOS TÉCNICO Y LEGAL NORMALIZADO (150 TABLAS)")
p("## PROYECTO INTEGRADOR V - TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA")
p("### ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD - AEF-1031) - CRITERIO 2.3 (15%)")
p("**Sistema E-Commerce Integral de Cuidado de la Salud, Belleza y Maquillaje**\n")
p("> [!IMPORTANT]")
p("> **Cumplimiento de Parámetros de Rúbrica:**")
p("> - **Escala:** 150 tablas normalizadas (1FN, 2FN, 3FN, BCNF, 4FN).")
p("> - **Distribución Equitativa (3 Integrantes):** 50 tablas por alumno (Integrante 1: 001–050, Integrante 2: 051–100, Integrante 3: 101–150).")
p("> - **Tope de Catálogos:** Máximo 25% de catálogos simples (el sistema cuenta con 22 catálogos = 14.6% y 128 tablas complejas/transaccionales = 85.4%).")
p("> - **Auditoría Estándar y Soft Delete:** Las 150 tablas implementan las 7 columnas obligatorias (`activo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `fecha_baja`, `eliminado_por`).")
p("> - **Clasificación Legal:** En cumplimiento de la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP) y regulación COFEPRIS.\n")
p("---")

for num_str, tname, tdesc, body in matches:
    num = int(num_str)
    autor = "Integrante 1" if num <= 50 else ("Integrante 2" if num <= 100 else "Integrante 3")
    modulo = "Submódulo 1: Identidad, RBAC, Perfil Dermo, Catálogo y COFEPRIS" if num <= 50 else ("Submódulo 2: Carritos, Suscripciones, Órdenes, Pagos, CFDI 4.0 y Promociones" if num <= 100 else "Submódulo 3: Compras, WMS, Cadena de Frío, Envíos, RMA y Auditoría Forense")
    
    # Extract columns and constraints
    lines = body.splitlines()
    cols = []
    constraints = []
    
    for l in lines:
        line_clean = l.strip()
        if not line_clean or line_clean.startswith("--"):
            continue
        if line_clean.upper().startswith("CONSTRAINT"):
            constraints.append(line_clean.rstrip(","))
        else:
            # column definition
            # e.g. id_rol BIGINT IDENTITY(1,1) NOT NULL,
            col_parts = line_clean.rstrip(",").split()
            c_name = col_parts[0]
            c_type = col_parts[1] if len(col_parts) > 1 else ""
            c_null = "NO" if "NOT NULL" in line_clean.upper() else "SÍ"
            c_pk = "PK (IDENTITY)" if "IDENTITY" in line_clean.upper() else ("FK" if c_name.startswith("id_") and not c_name.endswith(tname.split(".")[-1]) else "-")
            
            # extract default or check
            extra = []
            if "DEFAULT" in line_clean.upper():
                m_def = re.search(r'DEFAULT\s+(.*?)(?:CONSTRAINT|,|$)', line_clean, re.IGNORECASE)
                if m_def:
                    extra.append(f"DEF: {m_def.group(1).strip()}")
            if "CHECK" in line_clean.upper():
                m_chk = re.search(r'CHECK\s*\((.*?)\)', line_clean, re.IGNORECASE)
                if m_chk:
                    extra.append(f"CHK: {m_chk.group(1).strip()}")
            extra_str = "; ".join(extra) if extra else "-"
            cols.append((c_name, c_type, c_null, c_pk, extra_str))
            
    p(f"\n### FICHA TÉCNICA {num:03d}: `{tname}`")
    p(f"- **Autor Responsable:** {autor} (50 Tablas Asignadas)")
    p(f"- **Módulo de Pertenencia:** {modulo}")
    p(f"- **Descripción Funcional:** {tdesc.strip()}")
    p(f"- **Total de Columnas:** {len(cols)}")
    p(f"- **Restricciones de Integridad:** {len(constraints)} restricciones (PK, FK, UQ, CHECK)")
    p("")
    p("| No. | Nombre de Columna | Tipo de Dato | Nulo | Clave | Restricciones / Reglas de Negocio |")
    p("| :---: | :--- | :--- | :---: | :---: | :--- |")
    for idx, (c_name, c_type, c_null, c_pk, extra_str) in enumerate(cols, 1):
        p(f"| {idx:02d} | `{c_name}` | `{c_type}` | {c_null} | {c_pk} | {extra_str} |")
    p("")
    if constraints:
        p("**Restricciones Definidas:**")
        for c in constraints:
            p(f"- `{c}`")
    p("")
    p("---")

with open(output_file, "w", encoding="utf-8") as f:
    f.writelines(doc)

print(f"Diccionario de Datos generado exitosamente: {output_file}")
print(f"Tamaño: {os.path.getsize(output_file) / 1024:.2f} KB | Total Fichas: {len(matches)}")
