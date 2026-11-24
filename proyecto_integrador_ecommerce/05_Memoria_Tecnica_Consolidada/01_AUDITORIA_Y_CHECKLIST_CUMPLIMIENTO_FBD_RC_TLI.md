# AUDITORÍA INTEGRAL Y CHECKLIST DE CUMPLIMIENTO (FBD, RC Y TLI)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
**Sistema:** DERMA-ECOM (Comercio Electrónico Dermocosmético con Trazabilidad FEFO y Cadena de Frío)  
**Integrantes (Equipo de 3):** José Luis Luna García · Sheyla Estefanía Moncada Guel · Eduardo Salazar Martínez  
**Fecha de Auditoría:** 23 de noviembre de 2026  
**Documentos de Referencia:** `Proyecto Integrador V.pdf` y `Rúbricas de Evaluación - Proyecto Integrador TecNM (AMSI, FBD, Redes, TLI).pdf`

---

## 1. TABLERO EJECUTIVO DE CUMPLIMIENTO

| Asignatura (Clave) | Nivel Estimado Actual | Porcentaje de Avance | Diagnóstico General |
| :--- | :---: | :---: | :--- |
| **Fundamentos de Base de Datos — FBD (`AEF-1031`)** | 🟢 **Excelente (95–98%)** | ~97% | Diseño conceptual/relacional, 150 tablas, 183 FKs (0 huérfanas), 30 índices, DML 4,290 filas, 10 consultas, pruebas criptográficas, diccionario y Hot Swap completos y verificados en vivo en SQL Server 2022. Solo resta corrida en vivo en PostgreSQL 17 y unificar nombres reales en encabezados. |
| **Taller de Legislación Informática — TLI (`IFR-1024`)** | 🟢 **Excelente (98–100%)** | ~99% | Los 6 entregables `.md` y el documento consolidado `Capitulo_VI_TLI_Ecommerce.docx` cubren 100% los 4 criterios (4.1–4.4) con tablas reales del DDL y los 3 nombres reales. Solo resta agregar los números de control. |
| **Redes de Computadoras — RC (`IFD-1020`)** | 🟠 **Bueno / Riesgo en 3.4 (65–75%)** | ~68% | Diseño de 3 capas, cálculo VLSM (100% exacto) y SITE ANSI/TIA sobresalientes; sin embargo, **falta el archivo ejecutable `.pkt` de Cisco Packet Tracer (25% de la rúbrica)** y el script Cisco IOS presenta **6 errores técnicos** para ejecutarse en Packet Tracer. |
| **Memoria Técnica Consolidada y Anexos (Sección 5)** | 🟡 **En proceso (~80%)** | ~80% | Capítulos III, V y VI actualizados; falta crear el **Anexo C (Manual de instalación y puesta a punto)**, limpiar 43 scripts `.py` temporales de la raíz y completar la portada institucional (números de control, profesores y logotipos). |

---

## 2. INVENTARIO ESPECIFICADO: LO QUE YA TENEMOS Y ESTÁ VERIFICADO

### 2.1 Fundamentos de Base de Datos (`01_FBD_Base_de_Datos\`)

#### Criterio 2.1 (20%) — Modelado Conceptual E-R Extendido y Lógico Relacional
- [x] **Diagrama E-R Extendido y Transformación al Esquema Relacional:**  
  `01_FBD_Base_de_Datos/06_Modelado_ER_y_Normalizacion/01_modelo_conceptual_ER_extendido_y_relacional.md`
  - 4 jerarquías formales de especialización/generalización (`{o, parcial}` y `{d, total}`).
  - 17 entidades débiles identificadas explícitamente.
  - Atributos compuestos, multivaluados y derivados (`peso_volumetrico_kg`) documentados.
  - 3 diagramas E-R en Mermaid cubriendo los 14 esquemas con cardinalidades `(min, max)`.
  - Transformación documentada en 8 pasos (Elmasri & Navathe) con reglas de integridad de entidad, referencial, dominio y unicidad.

#### Criterio 2.2 (30%) — Magnitud, Estructura y Normalización de Tablas
- [x] **Volumen y distribución equitativa:** `150` tablas normalizadas (`50` tablas por integrante × 3 integrantes).
- [x] **Límite de catálogos paramétricos:** `22` catálogos simples (**14.6% ≤ 25%**) y `128` tablas maestras, transaccionales, intermedias $N:M$ y bitácoras (**85.4% ≥ 75%**).
- [x] **Cero tablas huérfanas (Integridad estricta):** **`183` llaves foráneas activas**, **`0` tablas huérfanas**, **`1` único componente conexo** (verificado en vivo en `sys.foreign_keys` de SQL Server 2022 y en análisis de grafo de PostgreSQL).
- [x] **Estándar de auditoría y Soft Delete:** Las 7 columnas obligatorias (`activo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `fecha_baja`, `eliminado_por`) en el 100% de las 150 tablas.
- [x] **Memoria analítica demostrativa 1FN → BCNF / 4FN:**  
  `01_FBD_Base_de_Datos/06_Modelado_ER_y_Normalizacion/02_memoria_normalizacion_1FN_a_BCNF.md`
  - 3 demostraciones paso a paso (uno por submódulo) eliminando grupos repetitivos, dependencias parciales, transitivas y multivaluadas.
  - Matriz individual de verificación para las 150 tablas generada desde el DDL real.
- [x] **Índice técnico maestro:** `01_FBD_Base_de_Datos/00_INDICE_TECNICO_150_TABLAS.md`.

#### Criterio 2.3 (15%) — Diccionario de Datos y Asignación Equitativa
- [x] **Diccionario de Datos Técnico y Legal (150 Fichas):**  
  `01_FBD_Base_de_Datos/05_Diccionario_de_Datos/00_DICCIONARIO_DE_DATOS_150_TABLAS.md`
  - 150 fichas completas (`2,020` columnas documentadas).
  - Equivalencia de tipos de datos **SQL Server / PostgreSQL** por columna.
  - `183` llaves foráneas marcadas explícitamente con `**FK**` en la columna `Clave`, además de `**PK** (ID)` y `UQ`.
  - Descripción operativa por tabla y descripción semántica individual por campo.
  - Clasificación **LFPDPPP** por tabla y por campo (cruce con TLI 4.4.1).
  - UTF-8 limpio (`0` errores de mojibake, `0` bytes nulos).

#### Criterio 2.4 (35%) — Implementación Multi-SGBD, Álgebra Relacional, Criptografía y Hot Swap
- [x] **Scripts DDL SQL Server 2022 (Verificado en vivo):**
  - `01_FBD_Base_de_Datos/01_DDL_SQL_Server/00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql`
  - `01_modulo_identidad_catalogo_alu1.sql`, `02_modulo_comercial_pagos_alu2.sql`, `03_modulo_logistica_inventario_alu3.sql` y `00_master_deploy_sqlserver.sql`.
  - Validado en `.\SQLEXPRESS03`: `150` tablas, `14` esquemas, `183` FKs, `87` `CHECK`, `30` índices secundarios `CREATE NONCLUSTERED INDEX`.
- [x] **Scripts DDL PostgreSQL 16/17 (Verificado estáticamente):**
  - `01_FBD_Base_de_Datos/02_DDL_PostgreSQL/00_SCRIPT_COMPLETO_150_TABLAS_POSTGRESQL.sql`
  - `01/02/03_modulo_*_postgres.sql` y `00_master_deploy_postgres.sql`.
  - Extensiones `pgcrypto` y `uuid-ossp`, `150` tablas, `183` FKs, `30` índices `CREATE INDEX IF NOT EXISTS`, `0` fugas T-SQL.
- [x] **Scripts DML Semilla (4,290 registros, mínimo 5 filas/tabla, 30/30 JSON válidos):**
  - SQL Server (**probado en vivo**): `01_FBD_Base_de_Datos/03_DML_Datos_Semilla/00_MASTER_SEED_DATA_SQLSERVER.sql` + 3 módulos.
  - PostgreSQL (verificado estáticamente: `6,182` `TRUE`/`FALSE`, `150` llamadas `setval()`, `0` `SET NOCOUNT ON`, `0` fugas `N'`, `30/30` JSONB válidos): `00_MASTER_SEED_DATA_POSTGRESQL.sql` + 3 módulos.
  - Script de limpieza: `00_RESET_LIMPIAR_DATOS_150_TABLAS.sql`.
- [x] **Álgebra Relacional y 10 Consultas SQL Avanzadas:**
  - `01_FBD_Base_de_Datos/04_Consultas_Algebra/01_algebra_relacional_y_sql_avanzado.md`
  - `01_consultas_avanzadas_sqlserver.sql` (**10/10 ejecutadas en vivo con resultados reales** en SQL Server 2022: Q1=10, Q2=14, Q3=4, Q4=7, Q5=29, Q6=15, Q7=15, Q8=5, Q9=29, Q10=29 filas).
  - `02_consultas_avanzadas_postgresql.sql` (versión nativa ANSI/PostgreSQL).
- [x] **Pruebas Funcionales de Persistencia Criptográfica de Credenciales:**
  - `03_prueba_criptografia_sqlserver.sql` (**probado en vivo**: `CRYPT_GEN_RANDOM(32)` + `HASHBYTES('SHA2_512')` 5,000 rondas → `CUMPLIDO (SIN TEXTO PLANO) | LOGIN_EXITOSO | RECHAZO_CORRECTO`).
  - `04_prueba_criptografia_postgresql.sql` (`pgcrypto` con `crypt(..., gen_salt('bf', 12))`).
- [x] **Informe Técnico Comparativo de Portabilidad Multi-SGBD:**
  - `01_FBD_Base_de_Datos/07_Portabilidad_y_HotSwap/01_informe_portabilidad_multi_sgbd.md`
- [x] **Arquitectura e Implementación Ejecutable de Hot Swap entre SGBD:**
  - `01_FBD_Base_de_Datos/07_Portabilidad_y_HotSwap/02_arquitectura_y_guia_hotswap_sgbd.md`
  - `hotswap_db_manager.ps1` + `hotswap_config.json` (**probado en vivo** en modos `status`, `query` y `test-failover`).

---

### 2.2 Redes de Computadoras (`03_RC_Redes_Telecomunicaciones\`)

- [x] **Criterio 3.1 (25%) — Modelo Jerárquico de 3 Capas y Plan VLSM:**
  - `03_RC_Redes_Telecomunicaciones/01_diseno_topologia_jerarquica.md`: arquitectura Core (Catalyst 9500), Distribución (Catalyst 9300 con HSRP/LACP) y Acceso (2960-X/9200), OSPFv2 Área 0, RSTP/BPDU Guard y diagrama lógico Mermaid.
  - `03_RC_Redes_Telecomunicaciones/02_esquema_direccionamiento_vlsm.md`: **cálculo matemático VLSM sobre `10.40.0.0/16` 100% correcto** (11 subredes ordenadas de `/23` a `/30` sin solapamientos ni errores de broadcast, más tabla de IPs estáticas con SQL Server `10.40.5.10` y PostgreSQL `10.40.5.20`).
- [x] **Criterio 3.2 (25%) — Cableado Estructurado y Especificación del SITE:**
  - `03_RC_Redes_Telecomunicaciones/03_especificaciones_site_normas.md`: normas **ANSI/TIA-568-C, 569-B, 606-B (etiquetado y código de colores) y 607-B (tierra física TMGB/TGB <3 Ω)**, horizontal Cat 6A F/UTP LSZH, backbone fibra OM4/OS2, plano arquitectónico del SITE (24 m²), piso falso, climatización ASHRAE TC 9.9, UPS modular 2N de 40 kVA, generador 100 kW, detección VESDA y extinción Novec 1230 (NFPA 2001).
- [x] **Criterio 3.3 (25%) — Base de Configuración Cisco IOS (requiere correcciones listadas en Sección 3):**
  - `03_RC_Redes_Telecomunicaciones/04_script_configuracion_cisco_ios.pkt.txt`: configuración base de `DIST-SW-01`, `ASW-DC-01` y `ASW-WMS-01` con SSH v2, banner legal CPF 211 bis, VLANs, HSRP, ACL para VLAN 10 y *Port Security* (`sticky`, `maximum`, `shutdown`/`restrict`).

---

### 2.3 Taller de Legislación Informática (`04_TLI_Marco_Legal_Contratos\`)

- [x] **Criterio 4.1 (25%) — Protección de Datos Personales, Art. 16 Constitucional y Criptografía:**
  - `04_TLI_Marco_Legal_Contratos/01_aviso_de_privacidad_lfpdppp.md`: inventario exhaustivo vinculado a tablas y columnas reales del DDL, Aviso de Privacidad Integral completo (Arts. 8, 9, 15, 16, 19, 25, 29, 32, 36 y 37 LFPDPPP; plazos ARCO 20/15 días; transferencias; política *Soft Delete*) y **Dictamen Técnico-Jurídico del Art. 16 Constitucional** vinculado a las pruebas criptográficas reales.
- [x] **Criterio 4.2 (25%) — Contratación Informática, SLA y EULA/SaaS:**
  - `04_TLI_Marco_Legal_Contratos/02_contrato_desarrollo_software.md`: contrato formal con los 3 coautores reales, declaraciones, entregables actualizados, calendario de pagos, **propiedad exclusiva de la base de datos**, derechos morales/cesión patrimonial (LFDA), NDA (5 años), garantía (12 meses), **responsabilidad civil**, penas convencionales, jurisdicción en Monclova y firmas.
  - `04_TLI_Marco_Legal_Contratos/03_contrato_sla_servicios_cloud.md`: SLA formal (uptime 99.9% con fórmula, latencias incluyendo Hot Swap $\le 5\text{ s}$, matriz Sev 1–4, ventanas de mantenimiento, RPO $\le 15\text{ min}$, RTO $\le 2\text{ h}$ y créditos de servicio).
  - `04_TLI_Marco_Legal_Contratos/04_contrato_eula_terminos_condiciones.md`: EULA/SaaS (Código de Comercio Arts. 89–97, restricciones de licencia, descargo médico COFEPRIS Arts. 269–270 LGS, suscripciones *Beauty-Box*, devoluciones RMA Art. 56 LFPC y conciliación PROFECO).
- [x] **Criterio 4.3 (25%) — Propiedad Intelectual, INDAUTOR y Licenciamiento de TI:**
  - `04_TLI_Marco_Legal_Contratos/05_solicitud_registro_indautor.md`: expediente formal simulado **RPDA-01** delimitando Programa de Computación (Arts. 13 fracc. XI, 101–106 LFDA) vs. Base de Datos (Arts. 107–110 LFDA), coautoría 33.33% c/u, protocolo de depósito y **Estudio Comparativo + Dictamen Jurídico** SQL Server (Propietario) vs. PostgreSQL (Permisiva MIT/BSD) vs. MariaDB/MySQL (GNU GPL v2).
- [x] **Criterio 4.4 (25%) — Delitos Informáticos y Matriz de Mitigación Técnica:**
  - `04_TLI_Marco_Legal_Contratos/06_matriz_penal_delitos_informaticos.md`: análisis del **Código Penal Federal (Arts. 211 bis 1 al 211 bis 7)** y **Código Penal del Estado de Coahuila de Zaragoza**, matriz de correlación con tablas reales del DDL y controles técnicos (*hashing*, MFA, *Port Security*, ACLs, tokenización PCI-DSS, 7 columnas de auditoría), más protocolo de cadena de custodia (**Art. 227 CNPP**).
- [x] **Entregable Word Consolidado:**
  - `04_TLI_Marco_Legal_Contratos/Capitulo_VI_TLI_Ecommerce.docx`: documento formal completo (secciones `6.1` a `6.6`, 13 tablas con estilo institucional, XML/ZIP validado).

---

## 3. CHECKLIST RIGUROSO: LO QUE FALTA POR REALIZAR O CORREGIR

### 🔴 PRIORIDAD CRÍTICA (indispensable para alcanzar Excelente 95–100%)

- [ ] **1. [RC — Criterio 3.4 (25%)] Crear el archivo ejecutable real `.pkt` en Cisco Packet Tracer y capturar evidencias:**
  - Actualmente solo existe `04_script_configuracion_cisco_ios.pkt.txt` (texto plano). Sin un archivo `.pkt` operativo, el Criterio 3.4 se evalúa en **Insuficiente (0%)**.
  - Debe incluir la topología funcional de 3 capas (Core, Distribución, Acceso) con servidores de BD (VLAN 10), DMZ (VLAN 20), WMS/IoT (VLAN 30), Admin TI (VLAN 40), Empleados (VLAN 50), CCTV (VLAN 60), Invitados (VLAN 70) y Management (VLAN 99).
  - Documentar evidencias (capturas de pantalla) de:
    - `ping` y `traceroute` exitosos entre segmentos permitidos.
    - Resolución de nombres/servicios (DNS/HTTP/SQL).
    - Aislamiento comprobado de la VLAN 10 (tráfico bloqueado desde VLAN 50 Empleados / VLAN 70 Invitados hacia `10.40.5.10` y `10.40.5.20`, y permitido desde DMZ/Admin TI).
    - `show port-security` mostrando aprendizaje `sticky` y política `shutdown`/`restrict`.

- [ ] **2. [RC — Criterio 3.3 (25%)] Corregir los 6 errores técnicos en `04_script_configuracion_cisco_ios.pkt.txt`:**
  1. Agregar la configuración faltante de **`CORE-SW-01`**, **`CORE-SW-02`**, **`DIST-SW-02` (HSRP Standby)**, **`ASW-CORP-01`** (VLANs 40, 50, 60 y 70) y los **enlaces punto a punto `/30`** (`10.40.5.128/30`, `10.40.5.132/30`, `10.40.5.136/30`).
  2. Agregar **`interface Vlan70`** (`10.40.3.1/24`) en `DIST-SW-01`/`DIST-SW-02` con su ACL de aislamiento para Invitados.
  3. Corregir la contradicción en **`ACL_PROTECCION_CLUSTER_BD`**: actualmente bloquea `icmp` desde VLAN 20 (DMZ), contradiciendo el `ping 10.40.5.10` desde NGINX DMZ de la línea 419; además añadir `permit tcp any 10.40.5.0 0.0.0.63 established` para tráfico de retorno.
  4. Reemplazar comandos incompatibles con Cisco Packet Tracer: cambiar `enable secret 9 $9$...` / `username ... secret 9` por `enable secret` / `username ... secret` (Packet Tracer no soporta Tipo 9 scrypt), y quitar `switchport trunk encapsulation dot1q` en switches Catalyst 2960 de acceso.
  5. Completar el *hardening* faltante en **`ASW-WMS-01`**: añadir `banner motd`, `line console 0` y `line vty 0 15`.
  6. Reemplazar los placeholders `Integrante 1/2/3` del encabezado por los 3 nombres reales.

- [ ] **3. [FBD — Criterio 2.4 (35%)] Ejecutar corrida de validación en vivo en PostgreSQL 17 y prueba bidireccional de Hot Swap:**
  - Ejecutar con la contraseña local de `postgres` los 4 scripts de PostgreSQL:
    ```powershell
    & "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -c "DROP DATABASE IF EXISTS ecommerce_salud_belleza; CREATE DATABASE ecommerce_salud_belleza;"
    & "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -d ecommerce_salud_belleza -v ON_ERROR_STOP=1 -f "01_FBD_Base_de_Datos\02_DDL_PostgreSQL\00_SCRIPT_COMPLETO_150_TABLAS_POSTGRESQL.sql"
    & "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -d ecommerce_salud_belleza -v ON_ERROR_STOP=1 -f "01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_POSTGRESQL.sql"
    & "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -d ecommerce_salud_belleza -v ON_ERROR_STOP=1 -f "01_FBD_Base_de_Datos\04_Consultas_Algebra\02_consultas_avanzadas_postgresql.sql"
    & "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -d ecommerce_salud_belleza -v ON_ERROR_STOP=1 -f "01_FBD_Base_de_Datos\04_Consultas_Algebra\04_prueba_criptografia_postgresql.sql"
    ```
  - Verificar luego `.\hotswap_db_manager.ps1 -Action status` y `-Action swap -TargetEngine postgresql` con ambos motores **ONLINE** simultáneamente.

---

### 🟡 PRIORIDAD MEDIA (calidad técnica y coherencia documental para 100%)

- [ ] **4. [RC — Documentación `01` y `02`] Pulir detalles técnicos en los documentos de Redes:**
  - En `01_diseno_topologia_jerarquica.md`: encerrar entre comillas los nodos Mermaid que llevan paréntesis (`SW_DIST1["Cisco Catalyst 9300 - DIST 01 (HSRP Activo)"]`) y agregar un **diagrama/tabla de topología física** (cableado Cat 6A, fibra OM4/OS2 y ubicación en Racks 01–04) como exige el punto 4.3.1 del PDF.
  - En `02_esquema_direccionamiento_vlsm.md`: aclarar que los 3 enlaces `/30` son punto a punto router-a-router (no usan Gateway Virtual HSRP) e identificar explícitamente el segmento de **Finanzas / Activos** (mencionado en 4.3.2 del PDF).

- [ ] **5. [FBD / RC / Memoria] Unificar los 3 nombres reales en los 18 archivos con placeholders restantes:**
  - Sustituir `Integrante 1/2/3`, `Estudiante 1/2/3` y `22050001/02/03` por **José Luis Luna García**, **Sheyla Estefanía Moncada Guel** y **Eduardo Salazar Martínez** en:
    - 8 archivos DDL (`01_DDL_SQL_Server/*.sql` y `02_DDL_PostgreSQL/*.sql`).
    - 6 archivos DML modulares (`03_DML_Datos_Semilla/01..03_*.sql`).
    - `01_FBD_Base_de_Datos/05_Diccionario_de_Datos/00_DICCIONARIO_DE_DATOS_150_TABLAS.md` (153 referencias).
    - `01_FBD_Base_de_Datos/00_INDICE_TECNICO_150_TABLAS.md` (6 referencias) y `02_memoria_normalizacion_1FN_a_BCNF.md`.
    - `03_RC_Redes_Telecomunicaciones/04_script_configuracion_cisco_ios.pkt.txt` (3 referencias).
    - `05_Memoria_Tecnica_Consolidada/00_MEMORIA_TECNICA_CONSOLIDADA_PROYECTO_INTEGRADOR.md` (3 referencias en texto interno).

- [ ] **6. [Anexo C Obligatorio y Limpieza del Repositorio]:**
  - Crear el **Anexo C: Manual de instalación y puesta a punto de la solución** (exigido en la página 9 de `Proyecto Integrador V.pdf`) y un `README.md` en la raíz del proyecto.
  - Eliminar o mover fuera del entregable final los **43 archivos `.py` temporales** y la carpeta `__pycache__` que actualmente ensucian la raíz de `proyecto_integrador_ecommerce\`.

---

### 🔵 PRIORIDAD ADMINISTRATIVA (datos institucionales para la entrega final)

- [ ] **7. Completar Portada Oficial Institucional (Sección 5, pág. 7 del PDF):**
  - Agregar los **3 números de control reales** de José Luis Luna García, Sheyla Estefanía Moncada Guel y Eduardo Salazar Martínez (en la Memoria Técnica, Contrato, INDAUTOR y encabezados).
  - Agregar los **nombres completos de los 4 profesores titulares** (AMSI, FBD, RC, TLI).
  - Incluir los **logotipos oficiales del TecNM y del ITSM** en la compilación final (Word / PDF).
- [ ] **8. Publicación en GitHub (Sección 1 del PDF):**
  - Confirmar con los docentes la modalidad de repositorio público por integrante (*"un Repositorio por Persona en Público"*) y subir la versión final limpia y verificada.
