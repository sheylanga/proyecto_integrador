# CAPÍTULO VI: GESTIÓN NORMATIVA, JURÍDICA Y CONTRACTUAL (TLI — IFR-1024)
## Entregable 6.3: Contrato de Desarrollo de Software a Medida y Prestación de Servicios Informáticos

---

### CONTRATO DE PRESTACIÓN DE SERVICIOS PROFESIONALES DE DESARROLLO DE SOFTWARE A MEDIDA, PROPIEDAD DE BASE DE DATOS Y CESIÓN DE DERECHOS PATRIMONIALES

En la ciudad de **Monclova, Estado de Coahuila de Zaragoza**, a los 15 días del mes de enero de 2026, celebran el presente instrumento jurídico:

**DE UNA PARTE:**  
**DERMA-ECOM COSMECÉUTICA Y SALUD DIGITAL S.A.P.I. DE C.V.**, representada en este acto por el Lic. Fernando Villarreal Guajardo en su calidad de Apoderado Legal, con domicilio fiscal en Av. Tecnológico #1200, Col. Tecnológico, C.P. 25700, Monclova, Coahuila, con RFC `DEC260115XX1`, a quien en lo sucesivo se le denominará **"EL CLIENTE"**; y

**DE OTRA PARTE:**  
El equipo desarrollador en coautoría equitativa (33.33% cada integrante), conformado por:
1. **C. JOSÉ LUIS LUNA GARCÍA**, de nacionalidad mexicana, estudiante de Ingeniería Informática del TecNM / Instituto Tecnológico Superior de Monclova, especialista en Seguridad Criptográfica, Identidad RBAC, Perfil Cutáneo y Catálogo COFEPRIS (**Tablas 001 a 050**);
2. **C. SHEYLA ESTEFANÍA MONCADA GUEL**, de nacionalidad mexicana, estudiante de Ingeniería Informática del TecNM / Instituto Tecnológico Superior de Monclova, especialista en Motor Comercial, Suscripciones Beauty-Box, Pasarelas Tokenizadas y Facturación Fiscal SAT CFDI 4.0 (**Tablas 051 a 100**); y
3. **C. EDUARDO SALAZAR MARTÍNEZ**, de nacionalidad mexicana, estudiante de Ingeniería Informática del TecNM / Instituto Tecnológico Superior de Monclova, especialista en Logística Multialmacén CEDIS, Trazabilidad FEFO, Telemetría IoT, Postventa RMA, Auditoría Forense e Infraestructura de Red LAN (**Tablas 101 a 150**);

A quienes en forma conjunta se les denominará **"LOS DESARROLLADORES"** o **"LOS COAUTORES"**.

Las partes se reconocen recíprocamente personalidad y capacidad jurídica suficiente para obligarse al tenor de las siguientes declaraciones y cláusulas:

---

### DECLARACIONES

**I. DECLARA "EL CLIENTE":**
a) Ser una sociedad mercantil legalmente constituida conforme a las leyes de los Estados Unidos Mexicanos.  
b) Requerir para la operación de su plataforma digital el diseño, normalización, desarrollo, despliegue multi-SGBD y aseguramiento de red del sistema **DERMA-ECOM** especializado en dermocosmética, diagnóstico cutáneo, facturación CFDI 4.0 y logística multialmacén FEFO.  
c) Contar con suficiencia presupuestaria y facultades legales para celebrar este contrato y cubrir los honorarios pactados.

**II. DECLARAN "LOS DESARROLLADORES":**
a) Ser profesionistas en formación de Ingeniería Informática del Tecnológico Nacional de México / Instituto Tecnológico Superior de Monclova.  
b) Contar con la capacidad técnica comprobada para diseñar e implementar un esquema relacional normalizado de **150 tablas (183 llaves foráneas, 0 tablas huérfanas)**, soporte multi-SGBD con **Hot Swap**, modelado UML 2.5, infraestructura LAN jerárquica con *Port Security* y cumplimiento normativo mexicano.  
c) Que la obra será original, inédita y libre de gravámenes o dependencias con licencias de código abierto virales (*copyleft* fuerte) que comprometan la titularidad comercial del software.

---

### CLÁUSULAS

#### **PRIMERA. OBJETO DEL CONTRATO Y ENTREGABLES**
"LOS DESARROLLADORES" se obligan a diseñar, construir, documentar, probar y entregar a entera satisfacción de "EL CLIENTE" el sistema informático a medida **"DERMA-ECOM"**, integrado por los siguientes entregables formales (Anexo Técnico "A"):
1. **Modelado de Software (AMSI):** Especificación IEEE 830 (45 RF y 18 RNF), diagramas y especificaciones de Casos de Uso, Diagrama de Clases, 7 Diagramas de Secuencia (incluyendo autenticación criptográfica), Arquitectura de Componentes/Despliegue y prototipos UX.
2. **Base de Datos Multi-SGBD (FBD):** Diagrama E-R Extendido, transformación al Esquema Relacional, Memoria demostrativa de normalización (1FN → BCNF/4FN), Diccionario de Datos de 150 tablas con clasificación LFPDPPP, scripts DDL y DML ejecutables en **Microsoft SQL Server 2022** y **PostgreSQL 16/17** (150 tablas, 183 FKs, 30 índices secundarios, 4,290 registros semilla con mínimo 5 filas/tabla), 10 consultas de Álgebra Relacional/SQL, pruebas criptográficas (`HASHBYTES`/`pgcrypto`), informe de portabilidad y gestor ejecutable de **Hot Swap Multi-SGBD**.
3. **Infraestructura de Red Corporativa (RC):** Topología jerárquica de 3 capas, plan de direccionamiento IPv4 con VLSM (`10.40.0.0/16`), especificaciones de SITE bajo ANSI/TIA-568/569/606/607 y configuración Cisco IOS con *Port Security* y ACLs.
4. **Marco Jurídico y Contractual (TLI):** Aviso de Privacidad Integral LFPDPPP, dictamen del Art. 16 Constitucional, contratos (Desarrollo, SLA, EULA), expediente simulado INDAUTOR (RPDA-01), dictamen de licenciamiento y matriz penal CPF/Coahuila.

#### **SEGUNDA. PRECIO, CALENDARIO DE PAGOS Y HITOS DE ACEPTACIÓN**
"EL CLIENTE" pagará como contraprestación total la cantidad neta de **$600,000.00 MXN (Seiscientos Mil Pesos 00/100 M.N.)** más IVA, dividida equitativamente al **33.33%** entre los tres coautores y cubierta contra acta de validación técnica en tres ministraciones:

| Hito / Ministración | Entregables Validados para Liberación de Pago | % | Monto Global (MXN) | Pago por Coautor (MXN) |
| :---: | :--- | :---: | :---: | :---: |
| **Hito 1 (Anticipo — Día 1)** | Firma de contrato, IEEE 830, E-R Extendido, Normalización y DDL de 150 tablas (183 FKs, 30 índices). | 30% | $180,000.00 | $60,000.00 |
| **Hito 2 (Avance — Día 45)** | DML completo en SQL Server y PostgreSQL (4,290 filas), 10 consultas SQL, Diccionario LFPDPPP, Hot Swap y Diseño LAN VLSM/SITE. | 40% | $240,000.00 | $80,000.00 |
| **Hito 3 (Finiquito — Día 90)** | Pruebas funcionales integrales, validación criptográfica, configuración *Port Security*, expediente INDAUTOR y transferencia de repositorios. | 30% | $180,000.00 | $60,000.00 |

#### **TERCERA. PROPIEDAD DE LA BASE DE DATOS, DERECHOS MORALES Y CESIÓN DE DERECHOS PATRIMONIALES**
1. **Propiedad Exclusiva de la Base de Datos y Datos de Negocio:** Las partes convienen expresamente que "EL CLIENTE" es el **propietario único y exclusivo** de todos los datos de clientes, historiales dermatológicos, catálogos comerciales, registros fiscales CFDI, bitácoras de auditoría y del esquema físico de la base de datos una vez liquidado el contrato. "LOS DESARROLLADORES" no podrán retener copias productivas, respaldos ni subconjuntos de datos tras la entrega final.
2. **Derechos Morales Inalienables (Arts. 18, 19 y 21 LFDA):** **José Luis Luna García**, **Sheyla Estefanía Moncada Guel** y **Eduardo Salazar Martínez** conservan de manera perpetua, inalienable e imprescriptible sus derechos morales de paternidad sobre la obra de software y diseño de base de datos.
3. **Cesión Onerosa de Derechos Patrimoniales (Arts. 27, 30, 31 y 103 LFDA):** Condicionado al pago total del Hito 3, "LOS DESARROLLADORES" ceden de forma exclusiva a favor de "EL CLIENTE" la totalidad de los derechos patrimoniales de reproducción, adaptación, distribución y explotación comercial/SaaS sobre el código fuente, scripts SQL, configuración de red y documentación técnica por el plazo máximo legal.

#### **CUARTA. CONFIDENCIALIDAD Y ACUERDO DE NO DIVULGACIÓN (NDA)**
Conforme a la **Ley Federal de Protección a la Propiedad Industrial (Arts. 163–169, Secreto Industrial)** y la LFPDPPP, "LOS DESARROLLADORES" se obligan a guardar estricta secrecía sobre fórmulas dermocosméticas, algoritmos, claves de API, información financiera y datos personales durante la vigencia del contrato y por **cinco (5) años** posteriores a su terminación. Cualquier filtración o uso indebido acarreará responsabilidad civil por daños y perjuicios, además de denuncia penal conforme a los Artículos 211 bis 1 al 211 bis 7 del Código Penal Federal.

#### **QUINTA. ACUERDOS DE NIVEL DE SERVICIO (SLA)**
Las métricas vinculantes de disponibilidad (**99.9% uptime mensual**), tiempos máximos de respuesta ($\le 150\text{ ms}$ en BD OLTP), clasificación de incidentes (Severidad 1 a 4), **RPO $\le 15\text{ min}$**, **RTO $\le 2\text{ h}$** mediante conmutación **Hot Swap Multi-SGBD**, y créditos de servicio forman parte integrante de este contrato conforme al **Anexo SLA (`03_contrato_sla_servicios_cloud.md`)**.

#### **SEXTA. GARANTÍA DE VICIOS OCULTOS Y RESPONSABILIDAD CIVIL POR FALLAS DEL SOFTWARE**
1. **Garantía de Calidad:** "LOS DESARROLLADORES" otorgan una garantía de **doce (12) meses** a partir del Acta de Entrega-Recepción para corregir sin costo adicional defectos de programación (*bugs*), fallos de integridad referencial, vulnerabilidades de seguridad imputables al código entregado o errores de portabilidad entre SQL Server y PostgreSQL.
2. **Responsabilidad Civil (Arts. 1910 y 2104 del Código Civil Federal):** En caso de fallas críticas atribuibles a dolo, negligencia grave o incumplimiento de estándares criptográficos por parte de "LOS DESARROLLADORES" que ocasionen daño patrimonial comprobado a "EL CLIENTE", responderán solidariamente hasta por un límite equivalente al **100% del monto total contratado** ($600,000.00 MXN), salvo supuestos de caso fortuito, fuerza mayor o modificaciones realizadas por terceros no autorizados.

#### **SÉPTIMA. PENAS CONVENCIONALES POR MORA Y RESCISIÓN**
1. Por cada día natural de retraso injustificado en la entrega de cualquier hito, se aplicará una pena convencional del **0.5% diario** sobre el monto de la ministración vencida, con un tope máximo del **15%** del valor total del contrato.
2. Superado dicho tope, o ante incumplimiento de la cláusula de confidencialidad o entrega de credenciales en texto plano, "EL CLIENTE" podrá rescindir administrativamente el contrato sin responsabilidad, exigiendo la devolución de anticipos no devengados y el resarcimiento de daños.

#### **OCTAVA. JURISDICCIÓN Y LEGISLACIÓN APLICABLE**
Para la interpretación, cumplimiento y ejecución del presente contrato, las partes se someten a las leyes federales mexicanas (Código de Comercio, Código Civil Federal, LFDA y LFPDPPP) y a la jurisdicción de los Tribunales Competentes de **Monclova, Coahuila de Zaragoza**, renunciando a cualquier otro fuero.

Leído que fue y enteradas las partes de su contenido y alcance legal, lo firman por cuadruplicado en el lugar y fecha de su encabezado.

```
________________________________________       ________________________________________
POR "EL CLIENTE":                              POR "LOS DESARROLLADORES" (33.33%):
LIC. FERNANDO VILLARREAL GUAJARDO              C. JOSÉ LUIS LUNA GARCÍA
Apoderado Legal                                Módulo 1: Seguridad, Clientes y Catálogo
DERMA-ECOM S.A.P.I. DE C.V.                    (Tablas 001 – 050)


________________________________________       ________________________________________
POR "LOS DESARROLLADORES" (33.33%):            POR "LOS DESARROLLADORES" (33.33%):
C. SHEYLA ESTEFANÍA MONCADA GUEL               C. EDUARDO SALAZAR MARTÍNEZ
Módulo 2: Comercial, Pagos y CFDI 4.0          Módulo 3: Logística WMS, RMA y Redes
(Tablas 051 – 100)                             (Tablas 101 – 150)
```
