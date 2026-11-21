# CAPÍTULO VI: GESTIÓN NORMATIVA, JURÍDICA Y CONTRACTUAL (TLI — IFR-1024)
## Entregable 6.5: Expediente Simulado de Registro ante INDAUTOR (RPDA-01) y Dictamen Comparativo de Licenciamiento de TI

---

## PARTE A: EXPEDIENTE FORMAL SIMULADO DE REGISTRO DE OBRA ANTE EL INDAUTOR

**SECRETARÍA DE CULTURA**  
**INSTITUTO NACIONAL DEL DERECHO DE AUTOR (INDAUTOR)**  
**DIRECCIÓN DEL REGISTRO PÚBLICO DEL DERECHO DE AUTOR — FORMATO OFICIAL RPDA-01**

### 1. Datos Generales de la Solicitud y Fundamento Legal (LFDA)

- **Trámite:** Solicitud de Inscripción de Obra Literaria o Artística (Formato **RPDA-01** + Anexo de Coautores **RPDA-01-A1**).
- **Ramas de Registro y Sustento en la Ley Federal del Derecho de Autor (LFDA):**
  1. **Programa de Computación (Código Fuente y Arquitectura):** Artículos **13 fracción XI** y **101 al 106** de la LFDA *(se precisa que el software en México se protege por Derechos de Autor ante INDAUTOR y no mediante patentes de Propiedad Industrial ante IMPI, conforme al Art. 47 de la LFPPI)*.
  2. **Base de Datos (Compilación Original de Estructura Relacional):** Artículos **107 al 110** de la LFDA, que otorgan protección autoral por la selección y disposición original de sus 150 entidades, 14 esquemas lógicos y 183 relaciones de integridad.
- **Título Oficial de la Obra:**  
  *"SISTEMA INTEGRAL DE COMERCIO ELECTRÓNICO Y GESTIÓN DERMOCOSMÉTICA CON TRAZABILIDAD MULTIALMACÉN FEFO Y CADENA DE FRÍO (DERMA-ECOM)"*.
- **Carácter de la Obra:** Originaria, Inédita, Creada en **Colaboración / Coautoría Equitativa** (Art. 80 LFDA).
- **Síntesis Descriptiva:** Sistema de comercio electrónico dermocosmético compuesto por un esquema relacional normalizado hasta BCNF/4FN de 150 tablas (0 tablas huérfanas, 183 FKs, 30 índices secundarios) con despliegue dual en Microsoft SQL Server 2022 y PostgreSQL 16/17, conmutación *Hot Swap* entre motores, autenticación criptográfica, facturación CFDI 4.0, trazabilidad sanitaria FEFO/IoT y marco normativo LFPDPPP/COFEPRIS.

---

### 2. Cuadro de Coautoría y Titularidad de Derechos Morales y Patrimoniales (Art. 80 LFDA)

| Coautor (Nombre Completo) | Institución / Nacionalidad | Porcentaje de Coautoría | Delimitación Técnica de Autoría | Titularidad Legal |
| :--- | :---: | :---: | :--- | :--- |
| **José Luis Luna García** | TecNM — ITSM · Mexicana | **33.33%** | Módulo 1: Seguridad Criptográfica, IAM/RBAC, Perfil Cutáneo, Catálogo y COFEPRIS (**Tablas 001–050**). | Derechos Morales inalienables (Art. 21 LFDA); Derechos Patrimoniales cedibles por contrato (Art. 27 LFDA). |
| **Sheyla Estefanía Moncada Guel** | TecNM — ITSM · Mexicana | **33.33%** | Módulo 2: Motor Comercial, Suscripciones Beauty-Box, Pagos Tokenizados, Antifraude, CFDI 4.0 y Promos (**Tablas 051–100**). | Derechos Morales inalienables (Art. 21 LFDA); Derechos Patrimoniales cedibles por contrato (Art. 27 LFDA). |
| **Eduardo Salazar Martínez** | TecNM — ITSM · Mexicana | **33.33%** | Módulo 3: Compras, WMS FEFO, Telemetría IoT Frío, Envíos, Postventa RMA, Auditoría Forense y Red LAN (**Tablas 101–150**). | Derechos Morales inalienables (Art. 21 LFDA); Derechos Patrimoniales cedibles por contrato (Art. 27 LFDA). |

---

### 3. Protocolo de Depósito de Ejemplares (Art. 57 Reglamento LFDA — Delimitación Código Fuente vs. Base de Datos)

Para garantizar la plena protección registral ante el INDAUTOR se adjuntan dos ejemplares cerrados en soporte digital no regrabable (DVD-R / USB sellado) delimitando expresamente ambos activos:

1. **Ejemplar 1 — Programa de Computación (Código Fuente y Scripts Ejecutables):**
   - **Primeras 10 fojas:** Encabezado de arquitectura, configuración dinámica `hotswap_config.json`, gestor de conmutación en caliente `hotswap_db_manager.ps1` (patrón *Adapter/Strategy*), módulo de autenticación y prueba criptográfica (`03_prueba_criptografia_sqlserver.sql` / `04_prueba_criptografia_postgresql.sql`).
   - **Últimas 10 fojas:** Consultas analíticas avanzadas en SQL Server y PostgreSQL (`01_consultas_avanzadas_sqlserver.sql`, `02_consultas_avanzadas_postgresql.sql`) y rutinas de configuración de red segura Cisco IOS (`04_script_configuracion_cisco_ios.pkt.txt`).
2. **Ejemplar 2 — Base de Datos (Compilación Estructural Original — Arts. 107–110 LFDA):**
   - Diagrama Entidad-Relación Extendido y Transformación al Esquema Relacional (`01_modelo_conceptual_ER_extendido_y_relacional.md`).
   - Memoria analítica de normalización 1FN→BCNF (`02_memoria_normalizacion_1FN_a_BCNF.md`).
   - Scripts DDL completos de las **150 tablas normalizadas, 183 FKs y 30 índices** en SQL Server y PostgreSQL, acompañados del Diccionario de Datos (`00_DICCIONARIO_DE_DATOS_150_TABLAS.md`).
3. **Documentación Administrativa Adjunta:** Comprobante de pago de derechos federales (Hoja de Ayuda e5cinco — tarifa vigente INDAUTOR), identificaciones oficiales de los 3 coautores y contrato de cesión condicional de derechos patrimoniales.

---

## PARTE B: ESTUDIO COMPARATIVO Y DICTAMEN JURÍDICO DE LICENCIAMIENTO DE SGBD

### 1. Matriz Comparativa Legal y Financiera: Propietario vs. Software Libre

| Dimensión de Análisis | Microsoft SQL Server 2022 (Comercial / Propietario) | PostgreSQL 16 / 17 (Software Libre Permisivo) | MariaDB / MySQL Community (Software Libre Copyleft) |
| :--- | :--- | :--- | :--- |
| **Tipo de Licencia** | EULA Comercial Propietario (código cerrado). | **The PostgreSQL License** (aprobada OSI; equivalente a MIT/BSD). | **GNU GPL v2** (*Copyleft* fuerte). |
| **Modelo de Costos** | Alto costo por núcleos (**Per Core**, mín. 4 cores: ~$3,945 USD / 2 cores Standard; ~$15,123 USD / 2 cores Enterprise) o **Server + CAL**. | **$0 USD** (libre de regalías para uso comercial, producción, réplicas y nube). | **$0 USD** en edición Community; licencias comerciales OEM/Enterprise de pago si se distribuye en software propietario. |
| **Derechos de Modificación y Distribución** | Prohibida la ingeniería inversa, descompilación, redistribución y publicación de *benchmarks* sin permiso de Microsoft. | Permite usar, copiar, modificar y distribuir libremente con fines comerciales, conservando solo el aviso de copyright. | Permite modificar y distribuir, pero toda obra derivada distribuida debe liberarse también bajo **GNU GPL v2**. |
| **Riesgo de Efecto Viral (*Copyleft*)** | Nulo (código cerrado); alto riesgo de auditorías **SAM** (*Software Asset Management*) por sublicenciamiento en virtualización. | **Nulo (Non-Copyleft):** se integra con software privativo sin obligar a abrir el código fuente de DERMA-ECOM. | **Medio-Alto si se distribuye:** enlazar librerías cliente GPL en un producto distribuido obliga a liberar el código fuente; en modelo SaaS puro el riesgo baja, pero subsiste en conectores embebidos. |
| **Adecuación para DERMA-ECOM** | Ideal como nodo corporativo primario cuando el cliente ya posee licencias empresariales o requiere ecosistema Microsoft. | **Óptimo como motor libre y nodo de contingencia/producción:** costo cero, `pgcrypto` nativo, `JSONB` y cero riesgo legal de propiedad intelectual. | Viable en SaaS, pero jurídicamente inferior a PostgreSQL por las restricciones de copyleft de sus conectores GPL. |

---

### 2. Dictamen Jurídico-Tecnológico Conclusivo

1. **Validación de la Arquitectura Multi-SGBD con Hot Swap:** Se dictamina favorablemente el uso combinado de **Microsoft SQL Server 2022** y **PostgreSQL 16/17** soportado por la capa **Hot Swap** (`hotswap_db_manager.ps1`). Esto evita la dependencia cautiva de proveedor (*vendor lock-in*) y permite escalar réplicas de lectura, contingencia y analítica en PostgreSQL con **$0 USD en licencias adicionales**.
2. **Elección del Motor Libre (PostgreSQL sobre MariaDB/GPL):** Desde el punto de vista del Derecho Informático, **PostgreSQL** es jurídicamente superior a MariaDB/MySQL Community porque su licencia permisiva estilo MIT/BSD elimina por completo el riesgo de contaminación *copyleft* sobre el código propietario de DERMA-ECOM y blinda la titularidad comercial que los coautores cederán a **DERMA-ECOM S.A.P.I. DE C.V.**
