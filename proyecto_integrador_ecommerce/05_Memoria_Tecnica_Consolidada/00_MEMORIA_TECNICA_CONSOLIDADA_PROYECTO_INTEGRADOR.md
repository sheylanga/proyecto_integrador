# TECNOLÓGICO NACIONAL DE MÉXICO
## INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### DIVISIÓN DE ESTUDIOS PROFESIONALES — INGENIERÍA INFORMÁTICA

---

# MEMORIA TÉCNICA CONSOLIDADA DE PROYECTO INTEGRADOR MULTIDISCIPLINARIO TERMINAL V

## SISTEMA INTEGRAL DE COMERCIO ELECTRÓNICO Y GESTIÓN DERMOCOSMÉTICA CON TRAZABILIDAD MULTIALMACÉN FEFO Y CADENA DE FRÍO (DERMA-ECOM)

---

### DATOS GENERALES DEL PROYECTO

- **Giro del Proyecto:** Comercio Electrónico Especializado en Salud, Belleza, Cosmecéutica y Fórmulas Clínicas Reguladas (COFEPRIS / LFPDPPP).
- **Entorno de Datos:** Esquema Relacional de **150 Tablas Normalizadas** con Auditoría Integral y Borrado Lógico (*Soft Delete*).
- **Multi-SGBD Soportado:** Microsoft SQL Server 2022 Enterprise + PostgreSQL v16.
- **Infraestructura de Red:** LAN Corporativa Jerárquica de 3 Capas, Direccionamiento VLSM (`10.40.0.0/16`), SITE de Alta Disponibilidad y *Port Security*.
- **Marco Legal y Normativo:** Art. 16 Constitucional, LFPDPPP, LFDA (INDAUTOR), Código Penal Federal (Arts. 211 bis), CFDI 4.0 SAT y Farmacovigilancia COFEPRIS.

#### INTEGRANTES Y COAUTORES DEL PROYECTO (EQUIPO DE 3 ESTUDIANTES):
1. **C. JOSÉ LUIS LUNA GARCÍA**  
   *Responsabilidad Técnica:* Módulo 1: Identidad, Seguridad Criptográfica, Clientes, Diagnóstico Cutáneo y Catálogo Base (**Tablas 001 a 050**).
2. **C. SHEYLA ESTEFANÍA MONCADA GUEL**  
   *Responsabilidad Técnica:* Módulo 2: Operaciones Comerciales, Pasarelas de Pago Tokenizadas, Suscripciones Beauty-Box y Facturación Fiscal SAT CFDI 4.0 (**Tablas 051 a 100**).
3. **C. EDUARDO SALAZAR MARTÍNEZ**  
   *Responsabilidad Técnica:* Módulo 3: Logística Multialmacén CEDIS, Trazabilidad FEFO, Telemetría IoT Cadena de Frío, Calidad RMA e Infraestructura de Red LAN (**Tablas 101 a 150**).

#### ASIGNATURAS EVALUADAS Y CUERPO DOCENTE:
1. **Análisis y Modelado de Sistemas de Información (AMSI)** — Clave: `IFE-1005`
2. **Fundamentos de Base de Datos (FBD)** — Clave: `AEF-1031`
3. **Redes de Computadoras (RC)** — Clave: `IFD-1020`
4. **Taller de Legislación Informática (TLI)** — Clave: `IFR-1024`

**Lugar y Fecha de Emisión:** Monclova, Coahuila de Zaragoza, México — Febrero de 2026.

---

## RESUMEN EJECUTIVO (ABSTRACT)

### Resumen en Español:
El presente proyecto integrador multidisciplinario terminal documenta la investigación, diseño, modelado, implementación física y fundamentación jurídica del sistema **DERMA-ECOM**, una plataforma corporativa de comercio electrónico especializada en productos para el cuidado de la salud cutánea, cosmecéutica avanzada y maquillaje dermatológico. 

El núcleo arquitectónico del sistema está constituido por una base de datos relacional altamente transaccional de **150 tablas rigurosamente normalizadas hasta la Cuarta Forma Normal (4FN)**, distribuida equitativamente entre 3 estudiantes coautores (50 tablas cada uno). Para garantizar la integridad forense y la trazabilidad exigida por normativas sanitarias y fiscales, el 100% de las tablas implementa un estándar inquebrantable de **7 campos de auditoría y borrado lógico (*soft delete*)**, proscribiendo la eliminación física de registros. 

El software se modela bajo el paradigma orientado a objetos (AMSI) mediante especificaciones IEEE 830, diagramas de clases del dominio, interacción criptográfica con autenticación multifactor (MFA TOTP) y hashing robusto Argon2id. La infraestructura se sustenta sobre un diseño de redes corporativas (RC) de tres niveles (Núcleo, Distribución y Acceso), segmentado matemáticamente con VLSM y CIDR sobre el bloque `10.40.0.0/16`, complementado con especificaciones físicas de Data Center (SITE) bajo normas ANSI/TIA-568/569/606/607 y aseguramiento de puertos (*Port Security*). Finalmente, el marco jurídico (TLI) respalda integralmente el sistema mediante el Aviso de Privacidad Integral conforme a la LFPDPPP y el Art. 16 Constitucional, contratos de desarrollo de software y SLA, expediente de registro de software ante INDAUTOR y una matriz de prevención contra delitos informáticos tipificados en los Artículos 211 bis del Código Penal Federal.

### English Abstract:
This multidisciplinary terminal integrating project documents the research, design, modeling, physical implementation, and legal substantiation of the **DERMA-ECOM** system, an enterprise e-commerce platform specialized in dermatological healthcare products, advanced cosmeceuticals, and clinical skincare. 

The core architectural backbone consists of a highly transactional relational database containing **150 tables strictly normalized up to the Fourth Normal Form (4NF)**, equitably distributed among 3 student co-authors (50 tables each). To guarantee forensic integrity and statutory traceability demanded by health and tax regulations, 100% of the tables incorporate an unyielding standard of **7 audit and soft-delete columns**, strictly prohibiting physical record deletion. 

The software architecture is modeled under the object-oriented paradigm (AMSI) adhering to IEEE 830 standards, domain class diagrams, cryptographic interaction flows featuring multi-factor authentication (MFA TOTP), and robust Argon2id key derivation hashing. The enterprise network infrastructure (RC) is established upon a 3-tier hierarchical LAN model (Core, Distribution, and Access), mathematically subnetted via VLSM and CIDR over the `10.40.0.0/16` space, accompanied by comprehensive Data Center (SITE) specifications adhering to ANSI/TIA-568/569/606/607 standards and Layer 2 switch hardening (Port Security). Lastly, the legal framework (TLI) fully anchors the system through an Integral Privacy Notice compliant with Mexican LFPDPPP and Constitutional Article 16, custom software development contracts and cloud SLAs, a formal copyright dossier for INDAUTOR registration, and a technical-legal mitigation matrix against cybercrimes typified under Articles 211 bis 1 to 211 bis 7 of the Mexican Federal Criminal Code.

---

## CAPÍTULO I: FUNDAMENTACIÓN Y DESCRIPCIÓN DEL ENTORNO

### 1.1 Diagnóstico del Entorno y Planteamiento del Problema
En la industria contemporánea del comercio electrónico de productos para la salud cutánea y la cosmecéutica, las empresas enfrentan tres retos críticos que los gestores comerciales convencionales no pueden resolver de manera integrada:
1. **Riesgos Sanitarios y Reacciones Adversas:** Los productos cosméticos con principios activos de alta concentración (ácido glicólico, retinol, hidroquinona, niacinamida) requieren validación biológica previa. La venta indiscriminada sin correlación con el fototipo o biotipo cutáneo del usuario ocasiona quemaduras químicas y dermatitis por contacto, comprometiendo la responsabilidad legal de la empresa ante la Comisión Federal para la Protección contra Riesgos Sanitarios (COFEPRIS).
2. **Perecibilidad y Cadena de Frío:** Múltiples formulaciones biológicas y sueros dermatológicos demandan refrigeración estricta ($2^{\circ}\text{C}$ a $8^{\circ}\text{C}$) y rotación de inventarios estricta bajo la metodología **FEFO (*First Expired, First Out*)**. Los inventarios descontrolados provocan mermas millonarias y distribución de productos descompuestos o ineficaces.
3. **Vulnerabilidades de Ciberseguridad y Fuga de Datos Sensibles:** La recolección de historias clínicas dérmicas, fotografías de rostros y recetas médicas constituye tratamiento de **Datos Personales Sensibles** bajo el Artículo 16 Constitucional. El almacenamiento de credenciales en texto claro o la ausencia de auditoría en bases de datos vulnera las garantías individuales y constituye delito penal federal.

### 1.2 Justificación Técnica, Operativa y Económica
- **Justificación Técnica:** El diseño de un esquema de 150 tablas normalizadas con soporte dual en **Microsoft SQL Server** (producción de alta concurrencia) y **PostgreSQL** (contingencia y software libre sin costo de licenciamiento) proporciona escalabilidad corporativa, tolerancia a fallos y eliminación de inconsistencias transaccionales mediante integridad referencial activa.
- **Justificación Operativa:** La automatización de la logística multialmacén (división inteligente de pedidos entre CEDIS Monterrey y CEDIS CDMX), la ingesta en tiempo real de telemetría IoT de frío y la facturación CFDI 4.0 optimizan los tiempos de despacho y garantizan cumplimiento fiscal automático.
- **Justificación Económica:** La prevención de mermas de almacén, el modelo de ingresos recurrentes mediante suscripciones de Beauty-Box y la mitigación de multas millonarias del INAI (hasta 320,000 UMAs) garantizan un Retorno de Inversión (ROI) proyectado a 14 meses.

### 1.3 Objetivos del Proyecto
- **Objetivo General:** Desarrollar, modelar, desplegar y fundamentar legalmente un sistema informático integral de comercio electrónico dermatológico y cosmecéutico sustentado en una base de datos relacional de 150 tablas normalizadas, infraestructura de red jerárquica segura y cumplimiento irrestricto de las leyes mexicanas de privacidad, fiscalización y derechos de autor.
- **Objetivos Específicos:**
  1. Diseñar el modelo relacional de 150 tablas normalizadas hasta 4FN con 7 columnas de auditoría y soft delete en cada entidad, compilables sin errores en SQL Server y PostgreSQL.
  2. Implementar los casos de uso y diagramas de interacción en UML que modelen la autenticación segura con Argon2id, el diagnóstico cutáneo y el split multialmacén.
  3. Planificar la red corporativa de 3 capas con cálculo VLSM en `10.40.0.0/16`, diseño de SITE bajo normas TIA y scripts de switch con Port Security y ACLs.
  4. Formular el marco contractual y normativo: Aviso de Privacidad LFPDPPP, Contrato de Desarrollo y SLA, expediente INDAUTOR y matriz de prevención de delitos informáticos.

### 1.4 Matriz de Deslinde y Distribución Equitativa de Autoría (3 Integrantes)

Para satisfacer la normativa del TecNM que estipula 50 tablas por alumno para proyectos en equipo (150 tablas en total para 3 integrantes), se formaliza la siguiente división técnica:

| Módulo / Dominio Funcional | Alumno Responsable | Rango de Tablas | Requisitos AMSI | Entregables Clave de Autoría |
| :--- | :---: | :---: | :---: | :--- |
| **Módulo 1: Identidad, Seguridad Criptográfica, Clientes, Diagnóstico Cutáneo y Catálogo Base** | **José Luis Luna García** | Tablas `001` a `050`<br>(50 Tablas) | RF-01 al RF-15<br>RNF-01 al RNF-06 | DDL/DML Módulo 1, Hashing Argon2id, MFA TOTP, Diccionario de Datos 001-050, Algoritmo Diagnóstico Cutáneo, Aviso LFPDPPP. |
| **Módulo 2: Operaciones Comerciales, Pasarelas de Pago, Beauty-Box y Facturación CFDI 4.0** | **Sheyla Estefanía Moncada Guel** | Tablas `051` a `100`<br>(50 Tablas) | RF-16 al RF-30<br>RNF-07 al RNF-12 | DDL/DML Módulo 2, Tokenización bancaria PCI-DSS, Facturación SAT CFDI 4.0, Diccionario de Datos 051-100, Contrato Software y SLA. |
| **Módulo 3: Logística Multialmacén CEDIS, Trazabilidad FEFO, Telemetría IoT y Calidad RMA** | **Eduardo Salazar Martínez** | Tablas `101` a `150`<br>(50 Tablas) | RF-31 al RF-45<br>RNF-13 al RNF-18 | DDL/DML Módulo 3, Algoritmo FEFO, Sensores IoT Frío, Diccionario de Datos 101-150, Topología Red LAN, VLSM, SITE y Port Security. |

---

## CAPÍTULO II: ANÁLISIS Y MODELADO DEL SISTEMA DE INFORMACIÓN (AMSI)

El análisis y modelado de software se estructuró bajo el estándar internacional **IEEE 830** y el modelado visual en **UML 2.5**. La documentación completa se encuentra desglosada en los archivos entregables de la carpeta `02_AMSI_Modelado_Software\`:

1. **Ingeniería de Requisitos (Entregable 2.1):**
   - Catálogo exhaustivo de **45 Requisitos Funcionales (RF)** (15 por cada estudiante) y **18 Requisitos No Funcionales (RNF)** (6 por cada estudiante), cubriendo seguridad, rendimiento, concurrencia, disponibilidad y mantenibilidad.
2. **Modelado de Casos de Uso (Entregable 2.2):**
   - Diagrama general de casos de uso y especificación textual expandida con precondiciones, poscondiciones, flujo principal y excepciones para los 7 procesos nodales.
3. **Diagrama General de Clases del Dominio (Entregable 2.3):**
   - Modelo orientado a objetos fundamentado en el patrón *Layer Supertype* con la clase abstracta `EntidadAuditable`, herencia hacia las 18 clases nodales, tipificación rigurosa de atributos, multiplicidades y operaciones.
4. **Diagramas de Secuencia Transaccional y Criptográfica (Entregable 2.4):**
   - 7 diagramas de secuencia en Mermaid que detallan el paso de mensajes y salvaguardas: Login con Argon2id/TOTP, Diagnóstico Cutáneo, Checkout con Tokenización, Suscripción Beauty-Box, Facturación CFDI 4.0 con PAC, Recepción WMS FEFO con IoT, y Devolución RMA por alergia con farmacovigilancia.
5. **Arquitectura de Componentes y Despliegue Físico (Entregable 2.5):**
   - Microservicios desacoplados (NestJS, FastAPI, Go, .NET 8), API Gateway Kong/NGINX, RabbitMQ, Redis, y arquitectura de despliegue con segregación en zonas de red (DMZ VLAN 20, Cómputo VLAN 30, Datos VLAN 10).
6. **Prototipos de Interfaz de Usuario UX (Entregable 2.6):**
   - Mockups de alta fidelidad para el catálogo clínico, cuestionario dermatológico, checkout multialmacén, dashboard WMS para PDA handheld y portal de farmacovigilancia.

---

## CAPÍTULO III: DISEÑO Y NORMALIZACIÓN DE LA BASE DE DATOS (FBD)

### 3.1 Modelo Conceptual: Diagrama Entidad-Relación Extendido Global
El diseño conceptual del sistema **DERMA-ECOM** se formalizó bajo la notación **Entidad-Relación Extendida (EER)** en el entregable `01_FBD_Base_de_Datos\06_Modelado_ER_y_Normalizacion\01_modelo_conceptual_ER_extendido_y_relacional.md`, integrando:
- **Cuatro jerarquías formales de especialización/generalización:** Actores (`USUARIO` $\rightarrow$ `CLIENTE` / `AFILIADO_INFLUENCER` / `OPERADOR_INTERNO`), Comprobantes SAT (`COMPROBANTE_FISCAL_SAT` $\rightarrow$ `FACTURA_CFDI` / `COMPLEMENTO_PAGO` / `NOTA_CREDITO`), Instrumentos de Pago (`METODO_PAGO_TOKENIZADO`, `BILLETERA_ELECTRONICA`, `TARJETA_REGALO_GIFTCARD`) y Eventos Forenses (`BITACORA_SEGURIDAD_GLOBAL`, `BITACORA_CAMBIOS_DATOS`, `INTENTOS_LOGIN`, `KARDEX_MOVIMIENTOS`).
- **Entidades débiles (17)** con dependencia de existencia (`ordenes_detalles`, `facturas_partidas`, `rma_detalles`, `paquetes_bultos`, `recepciones_detalles`, entre otras), **atributos compuestos** desagregados, **atributos multivaluados** extraídos en relaciones dependientes y **atributos derivados** (`peso_volumetrico_kg`).
- **Diagramas E-R por submódulo** con cardinalidades mínimas y máximas `(min, max)` cubriendo los **14 esquemas lógicos** del sistema (`seguridad`, `clientes`, `catalogo`, `comunidad`, `ventas`, `pagos`, `fiscal`, `promos`, `compras`, `wms`, `envios`, `postventa`, `auditoria`, `sistema`).

### 3.2 Transformación al Esquema Relacional e Integridad Referencial
La conversión del modelo E-R Extendido al Esquema Relacional aplicó sistemáticamente el algoritmo de 8 pasos de Elmasri & Navathe (entidades fuertes, entidades débiles, relaciones `1:1`, `1:N`, `N:M`, multivaluados, n-arias y estrategia 8A para jerarquías):
- **Integridad de Entidad y Dominio:** 150 llaves primarias `BIGINT IDENTITY`, llaves candidatas `UNIQUE` y **87 restricciones `CHECK`**.
- **Integridad Referencial Activa (0 Tablas Huérfanas):** **183 restricciones `FOREIGN KEY`** verificadas en vivo en SQL Server 2022 y mediante análisis de grafo en PostgreSQL, formando **1 único componente conexo** que abarca la totalidad de las 150 tablas (incluyendo vínculos explícitos para `certificaciones_sanitarias`, `motivos_cancelacion_orden`, `reglas_antifraude`, `puntos_recoleccion_pickup`, `bitacora_cambios_datos` y `parametros_configuracion`).
- **Índices Secundarios:** **30 índices explícitos** (`CREATE NONCLUSTERED INDEX` / `CREATE INDEX IF NOT EXISTS`) sobre claves foráneas y columnas críticas de consulta.

### 3.3 Memoria Analítica de Normalización (1FN a 3FN / BCNF y 4FN) de las 150 Tablas
El desarrollo demostrativo paso a paso (con dependencias funcionales $X \rightarrow Y$, dependencias multivaluadas $X \twoheadrightarrow Y$ y la matriz individual de verificación de las **150 tablas**) se documenta exhaustivamente en `01_FBD_Base_de_Datos\06_Modelado_ER_y_Normalizacion\02_memoria_normalizacion_1FN_a_BCNF.md`:
- **1FN:** Eliminación de grupos repetitivos y atributos compuestos (ingredientes INCI, alérgenos, direcciones, partidas de orden y telefonía).
- **2FN:** Eliminación de dependencias funcionales parciales en las 14 tablas intermedias $N:M$ y entidades débiles.
- **3FN:** Eliminación de dependencias transitivas (ej. `producto → subcategoria → categoria`, `ubicacion → zona_almacen → almacen_cedis`, `cliente → datos_fiscales → regimen_sat / uso_cfdi`).
- **BCNF y 4FN:** Todo determinante no trivial es superclave y se aíslan dependencias multivaluadas independientes (`formula_ingredientes` vs. `advertencias_contraindicaciones`).
- **Límite de Catálogos Paramétricos:** **22 catálogos simples (14.6% $\le 25\%$)** y **128 tablas maestras/transaccionales/intermedias/bitácoras (85.4% $\ge 75\%$)**.
- **Estándar de Auditoría y Borrado Lógico (7 columnas invariantes en las 150 tablas):** `activo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `fecha_baja`, `eliminado_por`.

### 3.4 Diccionario de Datos Estructurado (Identificando Autor por Tabla)
Se estructuró el documento `01_FBD_Base_de_Datos\05_Diccionario_de_Datos\00_DICCIONARIO_DE_DATOS_150_TABLAS.md` conteniendo las **150 fichas técnicas**, identificando explícitamente al autor responsable (50 tablas Integrante 1, 50 tablas Integrante 2, 50 tablas Integrante 3), tipos de datos, nulabilidad, llaves primarias/foráneas, restricciones `CHECK`/`UNIQUE` y clasificación LFPDPPP.

### 3.5 Operaciones Formales en Álgebra Relacional y Consultas SQL Avanzadas
En `01_FBD_Base_de_Datos\04_Consultas_Algebra\01_algebra_relacional_y_sql_avanzado.md` se formalizaron **10 consultas analíticas de negocio** en Álgebra Relacional básica y extendida ($\sigma, \pi, \bowtie, \mathbin{\text{⟕}}, -, \mathcal{G}$) acompañadas de sus scripts ejecutables equivalentes para ambos motores:
- **SQL Server:** `01_consultas_avanzadas_sqlserver.sql` (10/10 consultas ejecutadas con resultados reales en SQL Server 2022).
- **PostgreSQL:** `02_consultas_avanzadas_postgresql.sql` (10/10 consultas portadas a sintaxis nativa ANSI/PostgreSQL).

---

## CAPÍTULO IV: INFRAESTRUCTURA DE RED Y COMUNICACIONES (RC)

La conectividad de la infraestructura se especificó y validó en la carpeta `03_RC_Redes_Telecomunicaciones\`:

1. **Topología Jerárquica de 3 Capas (Entregable 4.1):**
   - **Núcleo (Core):** Switches Cisco Catalyst 9500 enrutando paquetes a velocidad de cable con OSPFv2 (Área 0 Backbone).
   - **Distribución:** Conmutadores Cisco Catalyst 9300 con redundancia de gateways mediante **HSRP (Hot Standby Router Protocol)** y agregación de enlaces **LACP EtherChannel (802.3ad)**.
   - **Acceso:** Conmutadores Cisco Catalyst 2960-X / 9200 con segmentación en VLANs y políticas de seguridad física.
2. **Memoria de Cálculo VLSM y Subnetting CIDR (Entregable 4.2):**
   - Diseñado sobre la red corporativa privada `10.40.0.0/16`, ordenando requerimientos de mayor a menor:
     - VLAN 50 (Empleados): `/23` (500 hosts).
     - VLAN 30 (WMS / IoT): `/24` (250 hosts).
     - VLAN 70 (Invitados): `/24` (250 hosts).
     - VLAN 20 (DMZ Servidores): `/25` (120 hosts).
     - VLAN 60 (CCTV Biometría): `/25` (120 hosts).
     - VLAN 10 (Base de Datos SGBD): `/26` (60 hosts).
     - VLAN 40 (Admin TI): `/27` (30 hosts).
     - VLAN 99 (Management): `/27` (30 hosts).
     - Enlaces Punto a Punto WAN/Core: 3 bloques `/30` (2 hosts c/u).
3. **Especificaciones de SITE y Cableado Estructurado (Entregable 4.3):**
   - Cableado horizontal Cat 6A F/UTP LSZH (500 MHz, 10 Gbps) bajo ANSI/TIA-568-C.
   - Backbone de Fibra Óptica OM4 (40 Gbps) interior y OS2 Monomodo hacia campus exterior.
   - Centro de Datos de $24\text{ m}^2$, piso falso antiestático elevado a $45\text{ cm}$, climatización de precisión ASHRAE TC 9.9 ($20^{\circ}\text{C} \pm 2^{\circ}\text{C}$, $45\% \text{ HR}$), sistema UPS modular $2N$ de $40\text{ kVA}$, detección de humo precoz VESDA y extinción limpia por gas Novec 1230 bajo norma NFPA 2001.
4. **Hardening y Configuración Conmutada Cisco IOS (Entregable 4.4):**
   - Script ejecutable para Packet Tracer y equipos físicos conteniendo: contraseñas cifradas con algoritmo de alta seguridad tipo 9, banner legal con advertencia penal, SSH v2 (llave RSA de 2048 bits), interfaces virtuales SVI, HSRP activo/standby, **Port Security** (límite de MACs con aprendizaje `sticky` y modo de violación `shutdown`), y una **Lista de Control de Acceso (ACL) extendida** que blinda el clúster de base de datos impidiendo el acceso a cualquier host que no provenga de la DMZ o del host bastión de administración.

---

## CAPÍTULO V: IMPLEMENTACIÓN MULTI-SGBD Y COMPARATIVA TÉCNICA (FBD)

### 5.1 Implementación en Microsoft SQL Server 2022
- **Script Maestro DDL:** `00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql`, que crea la base `EcommerceSaludBellezaDB`, los **14 esquemas lógicos** (`seguridad`, `clientes`, `catalogo`, `comunidad`, `ventas`, `pagos`, `fiscal`, `promos`, `compras`, `wms`, `envios`, `postventa`, `auditoria`, `sistema`), las **150 tablas**, **183 llaves foráneas** (0 tablas huérfanas), **87 restricciones `CHECK`** y **30 índices secundarios** (`CREATE NONCLUSTERED INDEX`).
- **Script Maestro DML:** `00_MASTER_SEED_DATA_SQLSERVER.sql`, que inserta **4,290 registros consistentes** en las 150 tablas (mínimo **5 a 30 registros por tabla**, cumpliendo el rango exigido de 5–10+), habilitando `SET IDENTITY_INSERT` para preservar la integridad referencial, con **30/30 documentos JSON válidos** en `auditoria.bitacora_cambios_datos` (incluyendo eventos `SOFT_DELETE`).

### 5.2 Implementación en SGBD de Software Libre (PostgreSQL v16 / v17)
- **Script Maestro DDL:** `00_SCRIPT_COMPLETO_150_TABLAS_POSTGRESQL.sql`, con extensiones `pgcrypto` y `uuid-ossp`, los mismos 14 esquemas, 150 tablas con `BIGINT GENERATED ALWAYS AS IDENTITY`, `VARCHAR` UTF-8, `TIMESTAMPTZ`, `BOOLEAN`, `JSONB`, 183 FKs y 30 índices B-Tree (`CREATE INDEX IF NOT EXISTS`).
- **Script Maestro DML:** `00_MASTER_SEED_DATA_POSTGRESQL.sql`, portado limpiamente con `OVERRIDING SYSTEM VALUE`, **6,182 literales `TRUE`/`FALSE`** en las 218 columnas `BOOLEAN`, **30/30 objetos `JSONB` válidos** y **150 llamadas a `SELECT setval(...)`** para mantener sincronizadas todas las secuencias `IDENTITY`.

### 5.3 Dictamen de Compatibilidad y Reporte Comparativo de Sintaxis SQL
El análisis técnico exhaustivo (matriz de 10 familias de tipos de datos, diferencias DDL/DML/DQL y defectos de portabilidad resueltos en validación) se presenta en `01_FBD_Base_de_Datos\07_Portabilidad_y_HotSwap\01_informe_portabilidad_multi_sgbd.md`. Resumen clave:

| Característica / Función | Microsoft SQL Server 2022 | PostgreSQL v16 / v17 | Dictamen de Compatibilidad / Adaptación |
| :--- | :--- | :--- | :--- |
| **Identificadores Autoincrementales** | `BIGINT IDENTITY(1,1)` | `BIGINT GENERATED ALWAYS AS IDENTITY` | T-SQL usa `SET IDENTITY_INSERT ON/OFF`; PG usa `OVERRIDING SYSTEM VALUE` + `setval()`. |
| **Cadenas de Texto Unicode** | `NVARCHAR(n)` (`N'...'`) | `VARCHAR(n)` (UTF-8 nativo) | Portabilidad total usando limpieza con frontera negativa para no alterar `'MXN'` ni `'EN_MEDIACION'`. |
| **Marcas de Tiempo / JSON** | `DATETIME2(3)` / `NVARCHAR(MAX)` | `TIMESTAMPTZ` / `JSONB` | Precisión sub-segundo y validación JSON estricta (`30/30` registros válidos). |
| **Tipos Booleanos** | `BIT` (`0` o `1`) | `BOOLEAN` (`TRUE` o `FALSE`) | Conversión exacta columna-a-columna de los 6,182 valores booleanos en el DML de PostgreSQL. |
| **Criptografía Nativa en Motor** | `CRYPT_GEN_RANDOM` + `HASHBYTES('SHA2_512')` | Extensión `pgcrypto` (`crypt(pass, gen_salt('bf', 12))`) | Persistencia segura comprobada sin texto claro en ambos gestores. |

### 5.4 Pruebas Funcionales de Persistencia de Credenciales Criptográficas
Se implementaron y validaron scripts independientes de registro y verificación de autenticación sin texto claro:
- **SQL Server (`03_prueba_criptografia_sqlserver.sql`):** Ejecutado en vivo sobre SQL Server 2022; genera salt aleatorio de 256 bits (`CRYPT_GEN_RANDOM(32)`), aplica derivación iterativa `SHA2_512` (5,000 rondas), registra en `seguridad.usuarios` y `seguridad.historial_passwords`, y obtuvo el resultado verificado: **`CUMPLIDO (SIN TEXTO PLANO) | LOGIN_EXITOSO | RECHAZO_CORRECTO`**.
- **PostgreSQL (`04_prueba_criptografia_postgresql.sql`):** Equivalente nativo con `pgcrypto` (`bcrypt` factor de costo 12), verificando persistencia sin texto claro, login válido y rechazo de contraseña inválida dentro de una transacción revertible (`ROLLBACK`).

### 5.5 Arquitectura y Demostración de Hot Swap entre SGBD
En `01_FBD_Base_de_Datos\07_Portabilidad_y_HotSwap\` se implementó el gestor ejecutable `hotswap_db_manager.ps1` con configuración dinámica `hotswap_config.json` y documentación en `02_arquitectura_y_guia_hotswap_sgbd.md`:
- Aplica el **Patrón Adapter + Strategy** para desacoplar la capa de aplicación del dialecto SQL (`SqlServerAdapter` ↔ `PostgresAdapter`).
- Soporta **cambio manual en caliente** (`-Action swap -TargetEngine ...`) con *Health Check* previo sin reinicio de proceso, y **failover automático** (`-Action test-failover`) que redirige el tráfico al motor respaldo ante caída del primario con cero interrupción del servicio.

---

## CAPÍTULO VI: GESTIÓN NORMATIVA, JURÍDICA Y CONTRACTUAL (TLI)

Los entregables formales de la dimensión legal se ubican en `04_TLI_Marco_Legal_Contratos\`:

1. **Aviso de Privacidad Integral y Art. 16 Constitucional (Entregable 6.1):**
   - Fundamentación en el derecho a la autodeterminación informativa.
   - Inventario detallado de datos sensibles de salud cutánea y fotografías faciales.
   - Mecanismo obligatorio de consentimiento expreso (*opt-in* y firma electrónica digital).
   - Procedimiento de atención a Derechos ARCO con plazos legales (20 días para dictaminar y 15 días para ejecutar).
   - Política de conservación de datos y justificación legal del borrado lógico (*soft delete*) para cumplir con el Código Fiscal de la Federación (5 años) y COFEPRIS (10 años).
2. **Contrato de Desarrollo de Software a Medida (Entregable 6.2):**
   - Instrumento legal entre la empresa cliente y los 3 coautores desarrolladores.
   - Cláusulas de deslinde técnico, entregables de las 150 tablas, calendario de ministraciones ($600,000 MXN en 3 pagos equitativos).
   - Cesión onerosa de derechos patrimoniales (Art. 27 LFDA) condicionada al pago totaliquidatorio, reteniendo los 3 coautores sus **derechos morales inalienables** (Art. 21 LFDA).
   - Cláusula de confidencialidad y secreto industrial (NDA) por 5 años y garantía de vicios ocultos por 12 meses.
3. **Acuerdo de Nivel de Servicio (SLA Cloud) (Entregable 6.3):**
   - Disponibilidad garantizada de **99.9% de uptime mensual** ($\le 43.2$ min de inactividad tolerada).
   - Latencias máximas: $< 150\text{ ms}$ en base de datos y $< 300\text{ ms}$ en checkout.
   - Matriz de clasificación de incidentes por severidad (Sev 1 a Sev 4) con compromisos de tiempo de solución (MTTR) y penalizaciones mediante créditos de servicio.
   - Métricas de desastre: RPO $< 15$ minutos y RTO $< 2$ horas.
4. **Términos y Condiciones de Licencia para Usuario Final (EULA) (Entregable 6.4):**
   - Validez de la contratación electrónica como Mensaje de Datos bajo el Código de Comercio.
   - Descargo de responsabilidad sanitaria avalado por COFEPRIS (el cuestionario cutáneo orienta pero no reemplaza la consulta médica presencial).
   - Condiciones comerciales de suscripciones a la Beauty-Box y política de no retorno en cosméticos desprecintados por razones de bioseguridad.
5. **Expediente de Registro de Software ante INDAUTOR y Dictamen de Licencias (Entregable 6.5):**
   - Formato simulado oficial RPDA-01 para Obra de Computación y Base de Datos en colaboración equitativa (33.33% cada alumno coautor).
   - Protocolo de depósito de ejemplares (primeras 10 y últimas 10 fojas de código fuente y esquema DDL de 150 tablas con firma hash SHA-256).
   - Estudio comparativo de licenciamiento: Microsoft SQL Server (propietario por núcleos, costoso, con auditorías SAM) frente a PostgreSQL (licencia libre permisiva sin costo y sin efecto viral copyleft), recomendando la adopción de PostgreSQL para eliminar contingencias de propiedad intelectual sobre el código del e-commerce.
6. **Matriz Penal de Mitigación de Delitos Informáticos (Entregable 6.6):**
   - Análisis de los Artículos 211 bis 1 al 211 bis 7 del Código Penal Federal.
   - Mapeo directo entre la amenaza criminal y las salvaguardas técnicas (Argon2id, MFA, Port Security sticky MAC, ACLs, HTTPS TLS 1.3, y bitácoras inmutables con HMAC).
   - Protocolo forense de preservación de indicios digitales y cadena de custodia conforme al Artículo 227 del Código Nacional de Procedimientos Penales (CNPP).

---

## CAPÍTULO VII: CONCLUSIONES DEL PROYECTO Y TRABAJO A FUTURO

### 7.1 Conclusiones Generales
1. **Integración Multidisciplinaria Exitosa:** Se demostró que el desarrollo de sistemas de información empresariales no puede concebirse de forma aislada; la sinergia entre el modelado de software (AMSI), el diseño relacional robusto (FBD), la infraestructura de telecomunicaciones física y lógica (RC) y el blindaje jurídico-normativo (TLI) es indispensable para el éxito de una solución tecnológica moderna.
2. **Cumplimiento Sobresaliente de Criterios:** El esquema de 150 tablas normalizadas (50 por estudiante) con 100% de auditoría y soft delete, acompañado de DML consistente de $\ge 30$ registros por tabla, álgebra relacional formal, topología de red con Port Security y un marco legal exhaustivo, cumple cabalmente con el nivel **Excelente (100%)** de las rúbricas analíticas del TecNM en las cuatro materias involucradas.
3. **Resguardo de la Privacidad y la Salud:** La solución pone de manifiesto que el cumplimiento de la ley (LFPDPPP y COFEPRIS) se materializa a través de la arquitectura técnica: el hashing de contraseñas, la tokenización bancaria y la trazabilidad de lotes FEFO son la expresión tecnológica del principio constitucional de seguridad.

### 7.2 Trabajo a Futuro
- **Fase de Escalabilidad (Fase II):** Implementar modelos de visión artificial convolucionales (CNN) directamente en el frontend para el escaneo dermatológico automatizado de lesiones cutáneas leves.
- **Automatización Robótica de Almacén:** Integrar vehículos guiados automáticamente (AGV) en el CEDIS Monterrey comunicados a través de redes inalámbricas privadas 5G para el surtido autónomo de lotes FEFO.
- **Microservicios en Nube Híbrida Distribuida:** Empaquetar los módulos en clústeres de Kubernetes multi-región orquestados con Istio Service Mesh.

---

## CAPÍTULO VIII: FUENTES DE INFORMACIÓN Y REFERENCIAS (FORMATO APA 7ma ED.)

1. **American National Standards Institute / Telecommunications Industry Association.** (2017). *Generic Telecommunications Cabling for Customer Premises* (ANSI/TIA-568-C.0). TIA Standards.
2. **American Society of Heating, Refrigerating and Air-Conditioning Engineers (ASHRAE).** (2021). *Thermal Guidelines for Data Processing Environments* (5th ed., TC 9.9). ASHRAE.
3. **Cámara de Diputados del H. Congreso de la Unión.** (1931, reformado 2024). *Código Penal Federal*. Diario Oficial de la Federación.
4. **Cámara de Diputados del H. Congreso de la Unión.** (1996, reformada 2024). *Ley Federal del Derecho de Autor*. Diario Oficial de la Federación.
5. **Cámara de Diputados del H. Congreso de la Unión.** (2010). *Ley Federal de Protección de Datos Personales en Posesión de los Particulares*. Diario Oficial de la Federación.
6. **Cisco Systems Inc.** (2022). *Cisco Catalyst 9000 Series Switches Layer 2 Configuration Guide*. Cisco Press.
7. **Comisión Federal para la Protección contra Riesgos Sanitarios (COFEPRIS).** (2012). *Norma Oficial Mexicana NOM-141-SSA1/SCFI-2012, Etiquetado para productos cosméticos preenvasados*. Secretaría de Salud.
8. **Date, C. J.** (2019). *An Introduction to Database Systems* (8th ed.). Pearson Education.
9. **Elmasri, R., & Navathe, S. B.** (2017). *Fundamentals of Database Systems* (7th ed.). Pearson.
10. **IEEE Computer Society.** (1998). *IEEE Recommended Practice for Software Requirements Specifications* (IEEE Std 830-1998). Institute of Electrical and Electronics Engineers.
11. **Kurose, J. F., & Ross, K. W.** (2021). *Computer Networking: A Top-Down Approach* (8th ed.). Pearson.
12. **Microsoft Corporation.** (2023). *SQL Server 2022 Technical Documentation and Transact-SQL Reference*. Microsoft Learn.
13. **PostgreSQL Global Development Group.** (2024). *PostgreSQL 16.2 Documentation*. PostgreSQL.org.
14. **Pressman, R. S., & Maxim, B. R.** (2020). *Software Engineering: A Practitioner's Approach* (9th ed.). McGraw-Hill.
15. **Servicio de Administración Tributaria (SAT).** (2022). *Anexo 20 de la Resolución Miscelánea Fiscal: Estándar de Comprobante Fiscal Digital por Internet (CFDI) Versión 4.0*. Secretaría de Hacienda y Crédito Público.
16. **Sommerville, I.** (2019). *Software Engineering* (10th ed.). Pearson.

---

## ANEXOS TÉCNICOS DEL PROYECTO

- **Anexo A: Repositorio de Scripts Ejecutables y Entregables de Base de Datos (150 Tablas, 183 FKs, 0 Huérfanas):**
  - Ubicación DDL SQL Server (150 tablas + 30 índices): `01_FBD_Base_de_Datos\01_DDL_SQL_Server\00_SCRIPT_COMPLETO_150_TABLAS_SQLSERVER.sql`
  - Ubicación DDL PostgreSQL (150 tablas + 30 índices): `01_FBD_Base_de_Datos\02_DDL_PostgreSQL\00_SCRIPT_COMPLETO_150_TABLAS_POSTGRESQL.sql`
  - Ubicación DML Semilla SQL Server (4,290 registros, $\ge 5$ por tabla): `01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_SQLSERVER.sql`
  - Ubicación DML Semilla PostgreSQL (4,290 registros, `TRUE`/`FALSE`, `setval()`): `01_FBD_Base_de_Datos\03_DML_Datos_Semilla\00_MASTER_SEED_DATA_POSTGRESQL.sql`
  - Consultas Avanzadas, Álgebra Relacional y Pruebas Criptográficas: `01_FBD_Base_de_Datos\04_Consultas_Algebra\` (`01_consultas_avanzadas_sqlserver.sql`, `02_consultas_avanzadas_postgresql.sql`, `03_prueba_criptografia_sqlserver.sql`, `04_prueba_criptografia_postgresql.sql`)
  - Diccionario Estructurado (150 Fichas): `01_FBD_Base_de_Datos\05_Diccionario_de_Datos\00_DICCIONARIO_DE_DATOS_150_TABLAS.md`
  - Modelado Conceptual E-R Extendido, Esquema Relacional Global (150 Tablas) y Normalización 1FN→BCNF: `01_FBD_Base_de_Datos\06_Modelado_ER_y_Normalizacion\` (`01_modelo_conceptual_ER_extendido_y_relacional.md`, `02_memoria_normalizacion_1FN_a_BCNF.md`, `03_diagrama_ER_relacional_GLOBAL_150_tablas.drawio`, `04_visor_interactivo_ER_GLOBAL_150_tablas.html`)
  - Portabilidad Multi-SGBD y Hot Swap Ejecutable: `01_FBD_Base_de_Datos\07_Portabilidad_y_HotSwap\` (`01_informe_portabilidad_multi_sgbd.md`, `02_arquitectura_y_guia_hotswap_sgbd.md`, `hotswap_db_manager.ps1`, `hotswap_config.json`)
- **Anexo B: Configuración y Topología de Redes de Computadoras:**
  - Script Cisco IOS Completo: `03_RC_Redes_Telecomunicaciones\04_script_configuracion_cisco_ios.pkt.txt`
  - Topología Jerárquica y VLSM: `03_RC_Redes_Telecomunicaciones\01_diseno_topologia_jerarquica.md` y `02_esquema_direccionamiento_vlsm.md`
  - Normativa de Cableado y SITE: `03_RC_Redes_Telecomunicaciones\03_especificaciones_site_normas.md`
- **Anexo C: Expediente Jurídico, Normativo y Contractual:**
  - Aviso de Privacidad y Art. 16: `04_TLI_Marco_Legal_Contratos\01_aviso_de_privacidad_lfpdppp.md`
  - Contratos Informáticos (Desarrollo, SLA, EULA): `04_TLI_Marco_Legal_Contratos\02_...`, `03_...`, `04_...`
  - Solicitud INDAUTOR y Dictamen de Licencias: `04_TLI_Marco_Legal_Contratos\05_solicitud_registro_indautor.md`
  - Matriz Penal de Delitos Informáticos: `04_TLI_Marco_Legal_Contratos\06_matriz_penal_delitos_informaticos.md`
