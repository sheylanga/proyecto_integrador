# ESPECIFICACIÓN DE REQUISITOS DE SOFTWARE (SRS) - IEEE 830
## PROYECTO INTEGRADOR V - TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI - IFE-1005)
**Sistema E-Commerce de Cuidado de la Salud, Belleza y Maquillaje**
**Autores:** Equipo de 3 Alumnos (Distribución Equitativa de Responsabilidades)

---

## 1. INTRODUCCIÓN

### 1.1 Propósito
El presente documento describe la especificación formal de requisitos del sistema de software e-commerce especializado en dermocosmética, cuidado de la salud cutánea, maquillaje y formulaciones dermatológicas, integrando cumplimiento de la normativa sanitaria mexicana (COFEPRIS), protección de datos personales y sensibles (LFPDPPP) y facturación digital 4.0 (SAT).

### 1.2 Alcance del Sistema
El sistema proporciona una plataforma web y móvil transaccional que cubre:
1. Autenticación robusta (Argon2id, MFA TOTP, control de fuerza bruta) y expediente clínico-cutáneo con consentimiento explícito y ejercicio de Derechos ARCO.
2. Catálogo maestro de productos con registro sanitario COFEPRIS, nomenclaturas INCI y contraindicaciones médicas.
3. Comercio electrónico avanzado: carritos persistentes, suscripciones periódicas *Beauty-Box*, pasarelas de pago tokenizadas PCI-DSS, evaluación de riesgo antifraude y timbrado CFDI 4.0.
4. Cadena de suministro: WMS con caducidad FEFO, monitoreo IoT de temperatura/humedad en cadena de frío (2–8°C), logística de última milla, trazabilidad RMA y bitácora forense de seguridad.

---

## 2. REQUISITOS FUNCIONALES DEL SISTEMA (45 RF DIVIDIDOS EQUITATIVAMENTE)

### SUBMÓDULO 1: IDENTIDAD, CONTROL DE ACCESO, PERFIL DERMO-SALUD Y CATÁLOGO
**Autor Responsable:** Integrante 1 (RF-01 al RF-15)

| ID | Nombre del Requisito | Descripción Detallada | Prioridad | Criterio de Aceptación |
| :--- | :--- | :--- | :---: | :--- |
| **RF-01** | Registro Seguro de Usuario | El sistema debe registrar usuarios validando correo institucional/personal único, complejidad de clave (mínimo 10 caracteres, mayúsculas, minúsculas, dígitos y símbolos) y almacenar contraseñas utilizando hash seguro Argon2id con salt criptográfico individual. | Alta | La clave nunca viaja en texto claro y el hash se almacena en `seguridad.usuarios`. |
| **RF-02** | Autenticación con MFA | El sistema debe permitir autenticación en dos factores (MFA) mediante estándar TOTP (Google Authenticator, Microsoft Authenticator) con código numérico de 6 dígitos con ventana de tiempo de 30 segundos. | Alta | El acceso se autoriza únicamente tras validar contraseña y TOTP correcto. |
| **RF-03** | Bloqueo por Fuerza Bruta | El sistema debe bloquear temporalmente una cuenta de usuario al registrarse 5 intentos fallidos consecutivos de login durante un lapso de 15 minutos, registrando la IP de origen y notificando al titular. | Alta | Bloqueo registrado en `seguridad.usuarios` con marca de tiempo en `fecha_bloqueo`. |
| **RF-04** | Matriz de Permisos RBAC | El sistema debe controlar el acceso a los módulos y acciones del sistema mediante una matriz de roles y permisos atómicos (Admin, Químico QA, Almacenista, Dermoconsultor, Cliente). | Alta | Ningún usuario puede ejecutar acciones no concedidas en `seguridad.roles_permisos`. |
| **RF-05** | Gestión de Sesiones Activas | El sistema debe registrar tokens de sesión concurrentes con fecha de inicio, última actividad, IP y user agent, permitiendo la revocación remota de sesiones desconocidas. | Media | Al cerrar sesión o revocar, el token se invalida inmediatamente. |
| **RF-06** | Cuestionario Diagnóstico Cutáneo | El sistema debe desplegar un cuestionario interactivo clínico de evaluación dermatológica que permita clasificar el tipo de piel (Grasa, Seca, Mixta, Sensible) y condiciones activas (Acné, Rosácea, Melasma). | Alta | Las respuestas ponderadas determinan el `id_tipo_piel` en el perfil cutáneo del cliente. |
| **RF-07** | Consentimiento de Salud LFPDPPP | El sistema debe recabar y registrar formalmente el consentimiento expreso y por escrito del cliente para el tratamiento de sus datos sensibles de salud cutánea, con fecha, hora, IP y versión del Aviso de Privacidad. | Crítica | Queda evidencia inalterable en `clientes.consentimientos_privacidad` antes de guardar datos de piel. |
| **RF-08** | Tramitación de Derechos ARCO | El sistema debe proveer una interfaz para que el usuario solicite sus derechos de Acceso, Rectificación, Cancelación u Oposición de datos personales, con asignación de folio y plazo máximo de respuesta de 20 días hábiles. | Alta | Solicitudes registradas en `clientes.solicitudes_arco` con seguimiento de estado. |
| **RF-09** | Gestión de Direcciones de Entrega | El sistema debe almacenar múltiples domicilios de entrega y facturación por cliente con código postal validado ante SEPOMEX y geolocalización. | Media | Validación estricta de estructura postal en `clientes.direcciones`. |
| **RF-10** | Catálogo con Nomenclatura INCI | El sistema debe desplegar la lista completa de ingredientes de cada cosmético bajo la Nomenclatura Internacional de Ingredientes Cosméticos (INCI) y código CAS, indicando si son comedogénicos o alérgenos. | Alta | Desglose en orden decreciente de concentración según norma sanitaria en `catalogo.formula_ingredientes`. |
| **RF-11** | Registro Sanitario COFEPRIS | El sistema debe vincular cada producto a su expediente de registro sanitario emitido por COFEPRIS, incluyendo número de registro oficial, fecha de vigencia y URL al documento de autorización. | Alta | Productos sin registro vigente se restringen para comercialización en `catalogo.registros_sanitarios_cofepris`. |
| **RF-12** | Advertencias y Contraindicaciones | El sistema debe mostrar advertencias dermatológicas visibles (Fotosensible, Contraindicado en Embarazo, Evitar Ojos) y protocolos de primeros auxilios en caso de ingesta accidental. | Alta | Alertas obligatorias visibles en ficha de producto según `catalogo.advertencias_contraindicaciones`. |
| **RF-13** | Selector de Tonos y Acabados | El sistema debe ofrecer un catálogo interactivo de variantes de color con código hexadecimal exacto `#RRGGBB`, subtono de piel (cálido, frío, neutro, oliva) y acabado cosmético (mate, satinado, glow). | Media | Mapeo 1:1 en `catalogo.tonos_variante` con vista previa de swatch. |
| **RF-14** | Kits y Rutinas Armadas | El sistema debe permitir la creación de bundles o sets promocionales vinculando múltiples SKUs con descuento automático porcentual por paquete. | Media | Consolidación de artículos en `catalogo.kits_sets` y `catalogo.kits_items`. |
| **RF-15** | Historial de Precios y Costos | El sistema debe auditar cualquier cambio en el precio base o costo estándar de las variantes SKU, registrando precio anterior, precio nuevo, usuario autorizador y justificación comercial. | Alta | Cada modificación se inserta en `catalogo.historial_precios_base`. |

---

### SUBMÓDULO 2: GESTIÓN COMERCIAL, CARRIZOS, SUSCRIPCIONES, ÓRDENES, PAGOS Y CFDI 4.0
**Autor Responsable:** Integrante 2 (RF-16 al RF-30)

| ID | Nombre del Requisito | Descripción Detallada | Prioridad | Criterio de Aceptación |
| :--- | :--- | :--- | :---: | :--- |
| **RF-16** | Carrito de Compras Persistente | El sistema debe mantener el carrito de compras persistente sincronizado entre sesiones autenticadas y anónimas vía token de sesión seguro, actualizando precios y disponibilidad en tiempo real. | Alta | Carrito almacenado en `ventas.carritos` y `ventas.items_carrito`. |
| **RF-17** | Seguimiento de Carritos Abandonados | El sistema debe identificar carritos inactivos por más de 24 horas y detonar automáticamente correos de recuperación con cupones de incentivo del 10% de descuento. | Media | Registro de auditoría en `ventas.carritos_abandonados_seguimiento`. |
| **RF-18** | Motor de Suscripciones Beauty-Box | El sistema debe gestionar suscripciones periódicas de cajas de belleza con frecuencias quincenales, mensuales o bimestrales, procesando el cobro recurrente automático y programando entregas. | Alta | Control de calendario y estados en `ventas.suscripciones_cliente` y entregas programadas. |
| **RF-19** | Regalos por Compra (GWP) | El sistema debe añadir automáticamente al pedido muestras gratuitas o miniaturas de lujo cuando el monto del carrito supere los umbrales promocionales definidos en las campañas activas. | Media | Asignación automática validando stock en `ventas.regalos_por_compra_gwp`. |
| **RF-20** | Generación de Órdenes de Venta | El sistema debe crear la orden de compra consolidando desglose de precios, descuentos aplicados, desglose de impuestos federales (IVA 16%, IEPS) y cálculo logístico de envío. | Alta | Registro maestro en `ventas.ordenes` con sub-partidas en `ventas.ordenes_detalles`. |
| **RF-21** | Split de Órdenes Multialmacén | Cuando una orden contenga productos ubicados en diferentes almacenes (CEDIS Monterrey y CEDIS CDMX), el sistema debe fragmentar la orden en sub-splits logísticos independientes. | Alta | Generación de folios derivados en `ventas.ordenes_splits_almacen`. |
| **RF-22** | Reserva Temporal de Inventario | Al iniciar el flujo de pago en checkout, el sistema debe bloquear temporalmente el stock de los productos del carrito durante 15 minutos para evitar sobreventa (overbooking). | Alta | Si el pago no se completa en 15 minutos, el stock se libera en `ventas.reservas_temporales_stock`. |
| **RF-23** | Red de Afiliados e Influencers | El sistema debe permitir el registro de embajadores de marca dermatológicos con código promocional propio, calculando comisiones porcentuales (10–20%) sobre ventas netas atribuidas. | Media | Acumulación de comisiones en `ventas.afiliados_influencers` y dispersión contable. |
| **RF-24** | Procesamiento de Pagos Tokenizados | El sistema debe procesar pagos con tarjeta de crédito/débito a través de pasarelas certificadas PCI-DSS (Stripe, Mercado Pago) almacenando únicamente tokens criptográficos seguros. | Crítica | Ningún dato de tarjeta bancaria (PAN, CVV) se almacena en base de datos (`pagos.transacciones`). |
| **RF-25** | Soporte de Pagos Divididos (Split) | El sistema debe soportar transacciones con pago combinado, permitiendo cubrir parte del pedido con saldo de monedero electrónico y el resto con tarjeta o SPEI. | Media | Desglose transaccional en `pagos.split_multipagos`. |
| **RF-26** | Monedero y Tarjetas de Regalo | El sistema debe administrar saldos a favor en billetera digital y redención de tarjetas de regalo (gift cards) mediante códigos alfanuméricos protegidos con hash SHA-256. | Media | Kardex de movimientos en `pagos.billetera_electronica` y `pagos.tarjetas_regalo_giftcards`. |
| **RF-27** | Motor Antifraude Transaccional | El sistema debe evaluar el riesgo de cada cobro mediante reglas heurísticas (IP vs país emisor, velocidad de transacciones, montos atípicos), asignando un score de 1 a 100 y exigiendo 3D-Secure si supera 65 puntos. | Alta | Evaluación almacenada en `pagos.evaluaciones_antifraude` previo al cargo bancario. |
| **RF-28** | Gestión de Facturación CFDI 4.0 | El sistema debe generar y timbrar facturas electrónicas bajo el estándar CFDI 4.0 del SAT, validando RFC, Razón Social, Régimen Fiscal y Código Postal del receptor. | Alta | Facturas timbradas con UUID SAT y sellos en `fiscal.facturas_cfdi` y conceptos con clave SAT `53131600`. |
| **RF-29** | Cancelación y Notas de Crédito | El sistema debe permitir la emisión de notas de crédito (CFDI de Egreso) por devoluciones de mercancía y gestionar cancelaciones fiscales con los motivos SAT '01' al '04'. | Alta | Acuses y registros fiscales en `fiscal.notas_credito` y `fiscal.cancelaciones_cfdi`. |
| **RF-30** | Ventas Flash Horarias | El sistema debe programar promociones relámpago con cuenta regresiva, stock exclusivo acotado y precios promocionales con horario estricto de inicio y fin. | Media | Control de inventario dedicado en `promos.ventas_flash_horarias`. |

---

### SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVÍOS, RMA Y FORENSE
**Autor Responsable:** Integrante 3 (RF-31 al RF-45)

| ID | Nombre del Requisito | Descripción Detallada | Prioridad | Criterio de Aceptación |
| :--- | :--- | :--- | :---: | :--- |
| **RF-31** | Gestión de Proveedores Farmacéuticos | El sistema debe gestionar el catálogo de laboratorios y fabricantes cosméticos, registrando licencias sanitarias, RFC, días de crédito y calificación de calidad histórica. | Alta | Registro en `compras.proveedores` con evaluación continua de desempeño. |
| **RF-32** | Órdenes de Compra a Proveedores | El sistema debe emitir órdenes de compra a proveedores basadas en cálculo automático de puntos de reorden y stock mínimo de seguridad del CEDIS. | Alta | Flujo formal en `compras.ordenes_compra` con detalle de partidas y costos pactados. |
| **RF-33** | Recepción e Inspección QA Sanitaria | El sistema debe registrar la descarga de mercancía en CEDIS y exigir un dictamen de control de calidad (temperatura, pH, integridad de empaque, certificado COA) antes de liberar el producto al stock. | Crítica | Aprobación en `compras.inspecciones_sanitarias_qa`; lotes no aprobados van a cuarentena. |
| **RF-34** | Control de Almacenes y Zonas WMS | El sistema debe estructurar los CEDIS en zonas especializadas (Cámara fría 2–8°C, Racks de alta densidad, Zona de inflamables, Jaula de alto valor). | Alta | Jerarquía espacial en `wms.almacenes_cedis`, `wms.zonas_almacen` y `wms.pasillos_ubicaciones`. |
| **RF-35** | Trazabilidad de Lotes y Caducidad FEFO | El sistema debe gestionar cada ingreso de producto asignándole su número de lote de fabricante, fecha de fabricación y fecha de caducidad, aplicando algoritmo FEFO (*First Expired, First Out*) en el surtido. | Crítica | Asignación obligatoria en `wms.lotes_fabricacion_sanitaria`. |
| **RF-36** | Kardex Continuo de Movimientos | El sistema debe mantener una bitácora inalterable de todos los movimientos de inventario (entradas, salidas por venta, mermas, transferencias), calculando en tiempo real el saldo resultante. | Alta | Registro auditable en `wms.kardex_movimientos` con tipo de afectación (+/-). |
| **RF-37** | Alertas Preventivas de Caducidad | El sistema debe generar alertas automáticas cuando un lote alcance 90, 60 y 30 días previos a su vencimiento, sugiriendo su asignación a ventas flash o canje con el proveedor. | Alta | Alertas en `wms.alertas_caducidad_proxima` para evitar mermas sanitarias. |
| **RF-38** | Mermas y Destrucción COFEPRIS | El sistema debe documentar actas de destrucción de producto caducado o alterado, registrando folio oficial de manifiesto y empresa recolectora de residuos peligrosos/ecológicos. | Alta | Trazabilidad legal en `wms.mermas_destruccion_sanitaria`. |
| **RF-39** | Conteos Cíclicos de Inventario | El sistema debe programar auditorías periódicas de inventario físico en racks para conciliar el stock del sistema con el conteo físico, registrando faltantes o sobrantes. | Media | Auditoría en `wms.conteos_ciclicos_auditoria` y ajustes justificados. |
| **RF-40** | Telemetría IoT en Cadena de Frío | El sistema debe recibir y almacenar lecturas continuas de sensores IoT de temperatura y humedad en cámaras frías de sueros biológicos, detonando alertas ante variaciones fuera del rango 2–8°C. | Crítica | Historial de telemetría en `wms.monitoreo_temperatura_humedad`. |
| **RF-41** | Integración con Paqueterías (Tracking) | El sistema debe conectarse a las APIs de paqueterías (DHL, FedEx, Estafeta), generando guías de envío en formato PDF e ingestando eventos de rastreo mediante webhooks. | Alta | Guías en `envios.guias_rastreo` y bitácora de escalas en `envios.eventos_tracking_bitacora`. |
| **RF-42** | Gestión de Devoluciones RMA | El sistema debe procesar solicitudes de retorno de mercancía (RMA) por daño en transporte, error de tono o reacción cutánea, exigiendo fotografías de evidencia y dictamen sanitario. | Alta | Flujo en `postventa.solicitudes_rma` e inspección obligatoria de cuarentena. |
| **RF-43** | Farmacovigilancia Sanitaria COFEPRIS | Cuando un cliente reporte una reacción adversa alérgica severa, el sistema debe generar una ficha técnica formal de farmacovigilancia para notificación a la autoridad sanitaria COFEPRIS. | Crítica | Expediente clínico en `postventa.reportes_farmacovigilancia` con lote y producto. |
| **RF-44** | Bitácora de Auditoría Forense HMAC | El sistema debe registrar todos los eventos críticos de seguridad con dirección IP, usuario, acción y sello criptográfico HMAC-SHA256 inalterable conforme a los Arts. 211 bis 1 al 7 del Código Penal Federal. | Crítica | Registro forense en `auditoria.bitacora_seguridad_global`. |
| **RF-45** | Auditoría DML y Soft-Delete | El sistema debe capturar el valor anterior y nuevo en formato JSON de cualquier modificación de datos y garantizar que ninguna tabla permita eliminación física (DELETE), ejecutando exclusivamente bajas lógicas (`activo = 0`). | Crítica | Trazabilidad completa en `auditoria.bitacora_cambios_datos` y columnas de auditoría estándar. |

---

## 3. REQUISITOS NO FUNCIONALES (18 RNF DIVIDIDOS EQUITATIVAMENTE)

### SUBMÓDULO 1: ARQUITECTURA DE SEGURIDAD, ACCESO Y RENDIMIENTO
**Autor Responsable:** Integrante 1 (RNF-01 al RNF-06)

| ID | Nombre del Requisito | Categoría | Especificación Técnica |
| :--- | :--- | :---: | :--- |
| **RNF-01** | Criptografía en Reposo y Tránsito | Seguridad | Todas las contraseñas se almacenan mediante el algoritmo Argon2id con factor de memoria de 64 MB. Todas las comunicaciones cliente-servidor se cifran bajo TLS 1.3 con certificados RSA/ECC de 2048/256 bits. |
| **RNF-02** | Tiempo de Respuesta en Consultas | Rendimiento | El 95% de las consultas de catálogo y búsqueda de productos deben responder en menos de 250 milisegundos bajo una carga concurrente de 500 usuarios activos. |
| **RNF-03** | Cumplimiento LFPDPPP | Legal | El sistema debe aislar lógicamente los datos de salud cutánea (datos sensibles) mediante roles RBAC restringidos, registrando en bitácora todo acceso de lectura o exportación. |
| **RNF-04** | Usabilidad y Accesibilidad WCAG | Ergonomía | La interfaz web debe cumplir con las pautas de accesibilidad para contenido web WCAG 2.1 nivel AA, garantizando soporte para lectores de pantalla y contraste mínimo de 4.5:1. |
| **RNF-05** | Disponibilidad del Servicio (SLA) | Confiabilidad | La infraestructura cloud debe garantizar una disponibilidad mensual no menor al 99.9% (máximo 43 minutos de indisponibilidad imprevista al mes). |
| **RNF-06** | Prevención de Vulnerabilidades OWASP | Ciberseguridad | La arquitectura debe estar blindada contra el Top 10 de OWASP (SQL Injection mediante parámetros tipados, Cross-Site Scripting [XSS] con CSP estricto y protección anti-CSRF). |

---

### SUBMÓDULO 2: TRANSACCIONALIDAD, FISCALIDAD Y CONCURRENCIA
**Autor Responsable:** Integrante 2 (RNF-07 al RNF-12)

| ID | Nombre del Requisito | Categoría | Especificación Técnica |
| :--- | :--- | :---: | :--- |
| **RNF-07** | Integridad ACID en Checkout | Transaccionalidad | Las transacciones de venta, pago y reserva de inventario deben ejecutarse bajo nivel de aislamiento `READ COMMITTED SNAPSHOT` en SQL Server y `READ COMMITTED` en PostgreSQL, evitando lecturas sucias. |
| **RNF-08** | Cumplimiento Estándar PCI-DSS | Financiera | El sistema debe operar en nivel de cumplimiento SAQ A-EP, prohibiendo expresamente la persistencia o almacenamiento temporal del código CVV o número completo de tarjeta de crédito/débito. |
| **RNF-09** | Escalabilidad Horizontal en Ventas Flash | Escalabilidad | El motor de carritos y reservas debe soportar picos de concurrencia de hasta 2,500 solicitudes de checkout por minuto durante campañas masivas (Hot Sale, Buen Fin) sin degradar la persistencia de stock. |
| **RNF-10** | Tiempos de Timbrado CFDI 4.0 | Rendimiento | La comunicación con el Proveedor Autorizado de Certificación (PAC) y recepción del XML timbrado por el SAT debe completarse en menos de 2.0 segundos por comprobante fiscal. |
| **RNF-11** | Idempotencia en Pagos | Fiabilidad | Todos los endpoints de cobro deben implementar llaves de idempotencia (*Idempotency Keys*) para evitar cobros dobles accidentales ante desconexiones de red del cliente. |
| **RNF-12** | Respaldo y Recuperación Fiscal (RPO/RTO) | Continuidad | Los comprobantes fiscales digitales (XML y PDF) deben contar con replicación geográfica continua, garantizando un RPO (*Recovery Point Objective*) de 0 minutos y RTO (*Recovery Time Objective*) < 15 minutos. |

---

### SUBMÓDULO 3: TRAZABILIDAD SANITARIA, RESILIENCIA Y GOBERNANZA FORENSE
**Autor Responsable:** Integrante 3 (RNF-13 al RNF-18)

| ID | Nombre del Requisito | Categoría | Especificación Técnica |
| :--- | :--- | :---: | :--- |
| **RNF-13** | Inalterabilidad de Bitácora Forense | Seguridad Legal | Los registros de la bitácora de seguridad global deben incorporar una firma criptográfica HMAC-SHA256 encadenada, de tal modo que cualquier alteración manual de la base de datos sea detectable ante peritaje judicial (Arts. 211 bis CPF). |
| **RNF-14** | Política Estricta de Soft-Delete | Integridad | Queda estrictamente revocado el privilegio de `DELETE` físico en tablas de datos de producción; la depuración de entidades se realiza exclusivamente mediante desactivación lógica (`activo = 0`). |
| **RNF-15** | Latencia de Telemetría IoT en Frío | Rendimiento | Las lecturas de los sensores IoT de temperatura y humedad en zonas de refrigeración (2–8°C) deben procesarse e insertarse en menos de 500 ms tras su emisión MQTT/HTTP. |
| **RNF-16** | Resiliencia de Despacho y Webhooks | Robustez | El sistema de integración con paqueterías debe contar con cola de reintentos exponenciales (*Exponential Backoff*) para absorber caídas temporales de las APIs de DHL o FedEx. |
| **RNF-17** | Mantenibilidad y Normalización | Arquitectura | La base de datos debe mantener normalización estricta hasta 4FN en relaciones con dependencias multivaluadas (`catalogo.formula_ingredientes`), garantizando cero redundancia anómala. |
| **RNF-18** | Portabilidad Multi-SGBD | Portabilidad | Toda la lógica de datos y tipos de columna debe ser compatible y ejecutable tanto en Microsoft SQL Server 2019+ como en PostgreSQL 15+, sin dependencias propietarias no encapsulables. |
