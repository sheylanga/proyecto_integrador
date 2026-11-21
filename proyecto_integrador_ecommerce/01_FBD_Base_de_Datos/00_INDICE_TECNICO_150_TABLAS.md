# CATÁLOGO E ÍNDICE TÉCNICO DE LAS 150 TABLAS NORMALIZADAS
## PROYECTO INTEGRADOR V - TECNM / IT MONCLOVA
### SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE

**Resumen de Cumplimiento de Rúbrica:**
- **Total de Tablas:** 150 tablas normalizadas (1FN, 2FN, 3FN, BCNF, 4FN).
- **Distribución Equitativa (3 Integrantes):** 50 tablas por alumno (Integrante 1: 001–050, Integrante 2: 051–100, Integrante 3: 101–150).
- **Tope de Catálogos Simples:** 22 tablas catalogadas simples (14.6% del total, cumpliendo la regla de $\le 25\%$).
- **Tablas Complejas / Transaccionales:** 128 tablas maestras, transaccionales, intermedias $N:M$ y bitácoras forenses (85.4% del total, cumpliendo $\ge 75\%$).
- **Estándar de Auditoría y Soft Delete:** Presente en las 150 tablas (`activo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `fecha_baja`, `eliminado_por`).
- **Despliegue Multi-SGBD:** Scripts DDL compilables para Microsoft SQL Server y PostgreSQL.

---

### SUBMÓDULO 1: IDENTIDAD, CONTROL DE ACCESO, PERFIL DERMO-SALUD, CATÁLOGO Y COFEPRIS
**Autor Responsable:** Integrante 1 (Tablas 001 a 050)

| No. | Esquema | Nombre de Tabla | Tipo | Clasificación LFPDPPP | Propósito Funcional |
| :---: | :--- | :--- | :---: | :---: | :--- |
| 001 | `seguridad` | `roles` | Catálogo (1) | Sin Datos Personales | Perfiles de acceso en el sistema (Admin, Dermoconsultor, Cliente, etc.). |
| 002 | `seguridad` | `permisos` | Catálogo (2) | Sin Datos Personales | Permisos atómicos sobre módulos y operaciones del software. |
| 003 | `seguridad` | `roles_permisos` | Intermedia $N:M$ | Sin Datos Personales | Matriz RBAC de asignación de privilegios a roles. |
| 004 | `seguridad` | `usuarios` | Maestra | Dato Personal | Cuentas de usuario con hash seguro (bcrypt/Argon2id), salt y MFA. |
| 005 | `seguridad` | `usuarios_roles` | Intermedia $N:M$ | Sin Datos Personales | Asignación de roles a usuarios con historial de vigencia. |
| 006 | `seguridad` | `sesiones_activas` | Transaccional | Dato Personal | Control y revocación de tokens de sesión concurrentes e IP. |
| 007 | `seguridad` | `historial_passwords` | Transaccional | Dato Confidencial | Almacenamiento seguro de hashes previos para evitar reutilización. |
| 008 | `seguridad` | `intentos_login` | Bitácora Forense | Dato Personal | Auditoría de accesos fallidos y defensa contra ataques de fuerza bruta. |
| 009 | `seguridad` | `tokens_recuperacion` | Transaccional | Dato Confidencial | Tokens criptográficos para restablecimiento de clave o validación de correo. |
| 010 | `seguridad` | `dispositivos_confianza` | Transaccional | Dato Personal | Fingerprint de navegadores/equipos autorizados para inicio de sesión. |
| 011 | `clientes` | `tipos_piel` | Catálogo (3) | Sin Datos Personales | Clasificación dermatológica (Grasa, Seca, Mixta, Sensible, Madura). |
| 012 | `clientes` | `condiciones_dermatologicas` | Catálogo (4) | Sin Datos Personales | Afecciones cutáneas (Acné, Rosácea, Dermatitis, Melasma, etc.). |
| 013 | `clientes` | `clientes` | Maestra | Dato Personal | Información de perfil de clientes, aceptación de términos y RFC/CURP. |
| 014 | `clientes` | `direcciones` | Transaccional | Dato Personal | Domicilios de entrega y facturación con geolocalización postal. |
| 015 | `clientes` | `perfil_cutaneo` | Transaccional | **Dato Personal Sensible** | Datos de salud cutánea, sensibilidad solar, oleosidad y poros. |
| 016 | `clientes` | `cliente_condiciones` | Intermedia $N:M$ | **Dato Personal Sensible** | Diagnósticos dermatológicos padecidos por el cliente. |
| 017 | `clientes` | `cuestionarios_diagnostico` | Maestra | Sin Datos Personales | Cuestionarios clínicos interactivos de evaluación de la piel. |
| 018 | `clientes` | `preguntas_diagnostico` | Maestra | Sin Datos Personales | Reactivos y preguntas de test de piel/maquillaje. |
| 019 | `clientes` | `opciones_pregunta` | Maestra | Sin Datos Personales | Opciones de respuesta con puntaje dermatológico asociado. |
| 020 | `clientes` | `evaluaciones_diagnostico` | Transaccional | **Dato Personal Sensible** | Test resueltos por clientes con diagnóstico y sugerencia cosmética. |
| 021 | `clientes` | `respuestas_evaluacion` | Transaccional | **Dato Personal Sensible** | Detalle de respuestas seleccionadas en cada evaluación. |
| 022 | `clientes` | `consentimientos_privacidad` | Transaccional | Evidencia Legal | Registro formal de consentimiento expreso para datos de salud (LFPDPPP). |
| 023 | `clientes` | `solicitudes_arco` | Transaccional | Evidencia Legal | Trámites formales de Derechos ARCO (Acceso, Rectificación, Cancelación). |
| 024 | `clientes` | `preferencias_comunicacion` | Transaccional | Dato Personal | Opciones de contacto consentidas (Email, SMS, WhatsApp, Promos). |
| 025 | `clientes` | `metodos_pago_tokenizados` | Transaccional | Dato Financiero | Tokens seguros PCI-DSS de tarjetas de crédito/débito guardadas. |
| 026 | `catalogo` | `marcas` | Maestra | Sin Datos Personales | Marcas comerciales cosméticas y dermocosméticas. |
| 027 | `catalogo` | `laboratorios_fabricantes` | Maestra | Sin Datos Personales | Laboratorios farmacéuticos y cosméticos con licencias sanitarias. |
| 028 | `catalogo` | `categorias` | Maestra | Sin Datos Personales | Categorías jerárquicas de productos (Cuidado Facial, Maquillaje, etc.). |
| 029 | `catalogo` | `subcategorias` | Maestra | Sin Datos Personales | Subcategorías específicas (Sérums, Labiales, Bases, Protectores Solares). |
| 030 | `catalogo` | `tipos_aplicacion` | Catálogo (5) | Sin Datos Personales | Zonas de aplicación cosmética (Rostro, Ojos, Labios, Cuello, Cuerpo). |
| 031 | `catalogo` | `certificaciones_sanitarias` | Catálogo (6) | Sin Datos Personales | Sellos oficiales (Cruelty-Free, Vegano, Orgánico, Hipoalergénico). |
| 032 | `catalogo` | `productos_maestros` | Maestra | Sin Datos Personales | Ficha técnica principal del producto cosmético o de salud. |
| 033 | `catalogo` | `subtonos_maquillaje` | Catálogo (7) | Sin Datos Personales | Subtonos de piel para maquillaje (Cálido, Frío, Neutro, Oliva). |
| 034 | `catalogo` | `acabados_maquillaje` | Catálogo (8) | Sin Datos Personales | Acabados de maquillaje (Mate, Satinado, Glow, Terciopelo). |
| 035 | `catalogo` | `variantes_sku` | Transaccional | Sin Datos Personales | SKU específico por presentación, gramaje/mililitros, precio y código EAN. |
| 036 | `catalogo` | `tonos_variante` | Transaccional | Sin Datos Personales | Tono específico, nombre comercial y código hexadecimal del color. |
| 037 | `catalogo` | `ingredientes_inci` | Maestra | Sin Datos Personales | Nomenclatura Internacional de Ingredientes Cosméticos e índice comedogénico. |
| 038 | `catalogo` | `alergenos_ingrediente` | Transaccional | Sin Datos Personales | Clasificación de riesgo de reacciones alérgicas por componente químico. |
| 039 | `catalogo` | `formula_ingredientes` | Intermedia $N:M$ (4FN) | Sin Datos Personales | Composición porcentual y principios activos ordenados por concentración. |
| 040 | `catalogo` | `registros_sanitarios_cofepris` | Transaccional | Regulatoria Legal | Folios oficiales de registro sanitario COFEPRIS y fechas de vigencia. |
| 041 | `catalogo` | `advertencias_contraindicaciones`| Transaccional | Médica / Sanitaria | Contraindicaciones de uso (embarazo, fotosensibilidad, contacto ocular). |
| 042 | `catalogo` | `multimedia_variantes` | Transaccional | Sin Datos Personales | Fotos oficiales, muestras en piel (swatches) y videos demostrativos. |
| 043 | `catalogo` | `kits_sets` | Maestra | Sin Datos Personales | Sets armados de rutina o combos promocionales. |
| 044 | `catalogo` | `kits_items` | Intermedia $N:M$ | Sin Datos Personales | Desglose de SKUs y piezas que componen cada kit. |
| 045 | `catalogo` | `productos_relacionados` | Intermedia $N:M$ | Sin Datos Personales | Relaciones de cross-selling (sustitutos, complementarios, paso siguiente). |
| 046 | `catalogo` | `historial_precios_base` | Bitácora | Sin Datos Personales | Historial de variaciones de precio base y justificación comercial. |
| 047 | `comunidad` | `rutinas_belleza` | Maestra | Dato Personal | Rutinas de cuidado de la piel creadas por clientes o dermatólogos. |
| 048 | `comunidad` | `rutinas_pasos` | Transaccional | Sin Datos Personales | Fases cronológicas de la rutina (Limpieza, Sérum, Hidratación, FPS). |
| 049 | `comunidad` | `rutinas_productos` | Intermedia $N:M$ | Sin Datos Personales | SKUs asignados a cada paso de la rutina. |
| 050 | `comunidad` | `listas_deseos` | Transaccional | Dato Personal | Wishlists de productos favoritos guardados por el cliente. |

---

### SUBMÓDULO 2: MOTOR COMERCIAL, SUSCRIPCIONES, PASARELAS DE PAGO Y FACTURACIÓN CFDI 4.0
**Autor Responsable:** Integrante 2 (Tablas 051 a 100)

| No. | Esquema | Nombre de Tabla | Tipo | Clasificación LFPDPPP | Propósito Funcional |
| :---: | :--- | :--- | :---: | :---: | :--- |
| 051 | `ventas` | `tipos_descuento` | Catálogo (9) | Sin Datos Personales | Reglas de descuento (Porcentaje, Monto Fijo, Envío Gratis, 2x1). |
| 052 | `ventas` | `estados_orden` | Catálogo (10) | Sin Datos Personales | Flujo de estados de pedido (Pendiente, Pagada, Preparando, Entregada). |
| 053 | `ventas` | `motivos_cancelacion_orden` | Catálogo (11) | Sin Datos Personales | Razones documentadas de anulación de pedidos. |
| 054 | `ventas` | `carritos` | Transaccional | Dato Personal | Carritos de compra en línea persistentes por cliente. |
| 055 | `ventas` | `items_carrito` | Transaccional | Sin Datos Personales | Artículos, variantes y cantidades agregadas al carrito. |
| 056 | `ventas` | `carritos_abandonados_seguimiento` | Transaccional | Dato Personal | Registro para campañas de recuperación de carritos sin finalizar. |
| 057 | `ventas` | `planes_suscripcion` | Maestra | Sin Datos Personales | Planes recurrentes (Beauty Box mensual, reposición de dermocosmética). |
| 058 | `ventas` | `frecuencias_suscripcion`| Catálogo (12) | Sin Datos Personales | Frecuencias de entrega (Mensual, Bimestral, Trimestral). |
| 059 | `ventas` | `suscripciones_cliente` | Transaccional | Dato Personal / Financiero | Suscripciones activas con cargo automático y periodicidad. |
| 060 | `ventas` | `suscripciones_items` | Intermedia $N:M$ | Sin Datos Personales | Productos incluidos a precio congelado en la suscripción. |
| 061 | `ventas` | `suscripciones_calendario_entregas` | Transaccional | Sin Datos Personales | Cronograma de despachos periódicos proyectados. |
| 062 | `ventas` | `suscripciones_bitacora_estados` | Bitácora | Sin Datos Personales | Registro histórico de pausas, reactivaciones y cancelaciones. |
| 063 | `ventas` | `regalos_por_compra_gwp` | Transaccional | Sin Datos Personales | Promociones de muestras gratis (Gift With Purchase) por monto mínimo. |
| 064 | `ventas` | `ordenes` | Maestra Transaccional | Dato Personal / Financiero | Encabezado principal de la orden de compra con subtotales y totales. |
| 065 | `ventas` | `ordenes_detalles` | Transaccional | Sin Datos Personales | Partidas de productos comprados, precios históricos e IVA desglosado. |
| 066 | `ventas` | `ordenes_historial_estados`| Bitácora | Sin Datos Personales | Trazabilidad temporal de cada cambio de estatus de la orden. |
| 067 | `ventas` | `ordenes_splits_almacen` | Transaccional | Sin Datos Personales | División de una orden cuando se surte desde múltiples almacenes. |
| 068 | `ventas` | `ordenes_impuestos` | Transaccional | Fiscal | Desglose oficial de impuestos gravados (IVA 16%, IEPS). |
| 069 | `ventas` | `ordenes_descuentos` | Transaccional | Sin Datos Personales | Descuentos y cupones aplicados a nivel de orden. |
| 070 | `ventas` | `ordenes_notas_instrucciones`| Transaccional | Dato Personal | Indicaciones para paquetería, empaque ecológico y dedicatorias de regalo. |
| 071 | `ventas` | `reservas_temporales_stock` | Transaccional | Sin Datos Personales | Bloqueo temporal de inventario durante el proceso de pago (15 min). |
| 072 | `ventas` | `afiliados_influencers` | Maestra | Dato Personal / Financiero | Creadores de contenido afiliados con código y CLABE de dispersión. |
| 073 | `ventas` | `comisiones_afiliados` | Transaccional | Financiero | Cálculo de comisiones devengadas por venta de cosméticos. |
| 074 | `pagos` | `proveedores_pasarela` | Catálogo (13) | Sin Datos Personales | Conectores API (Stripe, MercadoPago, PayPal, SPEI). |
| 075 | `pagos` | `metodos_pago` | Catálogo (14) | Sin Datos Personales | Métodos soportados (Crédito, Débito, SPEI, Billetera, Puntos). |
| 076 | `pagos` | `transacciones` | Maestra Transaccional | Financiero | Registro central de cobros con folio bancario y estado de pago. |
| 077 | `pagos` | `intentos_cobro` | Bitácora API | Financiero | Log de peticiones sanitizadas y respuestas HTTP de las pasarelas. |
| 078 | `pagos` | `split_multipagos` | Transaccional | Financiero | Soporte de pago combinado (ej. Tarjeta de crédito + Saldo Wallet). |
| 079 | `pagos` | `billetera_electronica` | Maestra | Financiero | Saldo a favor y monedero electrónico por cliente. |
| 080 | `pagos` | `movimientos_billetera` | Transaccional | Financiero | Kardex de abonos, cargos y devoluciones a la billetera. |
| 081 | `pagos` | `tarjetas_regalo_giftcards`| Maestra | Financiero | Tarjetas de regalo digitales con código cifrado y saldo. |
| 082 | `pagos` | `redenciones_giftcards` | Transaccional | Financiero | Aplicación del saldo de giftcards en el pago de pedidos. |
| 083 | `pagos` | `reglas_antifraude` | Maestra | Ciberseguridad | Reglas de score de riesgo (IP sospechosa, montos altos, país emisor). |
| 084 | `pagos` | `evaluaciones_antifraude` | Transaccional | Ciberseguridad | Evaluación de riesgo transaccional previo al cobro bancario. |
| 085 | `pagos` | `contracargos_chargebacks`| Transaccional | Financiero / Legal | Gestión de disputas bancarias por cargos no reconocidos. |
| 086 | `pagos` | `reembolsos_transaccion` | Transaccional | Financiero | Bitácora de devoluciones monetarias emitidas hacia pasarelas. |
| 087 | `fiscal` | `regimenes_sat` | Catálogo (15) | Fiscal SAT | Catálogo oficial de regímenes fiscales del SAT (601, 605, 612, 626). |
| 088 | `fiscal` | `usos_cfdi` | Catálogo (16) | Fiscal SAT | Catálogo oficial de Uso de CFDI (G01, G03, CP01, S01). |
| 089 | `fiscal` | `datos_fiscales_cliente` | Transaccional | Dato Fiscal / LFPDPPP | RFC, Razón Social, Domicilio Fiscal y Correo para facturación 4.0. |
| 090 | `fiscal` | `facturas_cfdi` | Maestra Transaccional | Fiscal SAT | Facturas electrónicas timbradas con UUID SAT, sellos y XML/PDF. |
| 091 | `fiscal` | `facturas_partidas` | Transaccional | Fiscal SAT | Conceptos facturados con clave SAT 53131600 (Cosméticos). |
| 092 | `fiscal` | `complementos_pago` | Transaccional | Fiscal SAT | Recibos Electrónicos de Pago (REP) con UUID fiscal. |
| 093 | `fiscal` | `notas_credito` | Transaccional | Fiscal SAT | CFDI de egreso por devoluciones de mercancía y cancelaciones. |
| 094 | `fiscal` | `cancelaciones_cfdi` | Transaccional | Fiscal SAT | Motivos de cancelación SAT y acuses digitales de anulación. |
| 095 | `promos` | `campanias` | Maestra | Sin Datos Personales | Campañas promocionales (Hot Sale, Black Friday Dermocosmético). |
| 096 | `promos` | `cupones` | Maestra | Sin Datos Personales | Cupones de descuento, fechas límite y límites de uso. |
| 097 | `promos` | `reglas_elegibilidad_cupon`| Transaccional | Sin Datos Personales | Condiciones de validez (monto mínimo, exclusión de kits). |
| 098 | `promos` | `cupones_categorias_excluidas`| Intermedia $N:M$ | Sin Datos Personales | Categorías no aplicables para cupones específicos. |
| 099 | `promos` | `redenciones_cupones` | Transaccional | Dato Personal | Historial de cupones canjeados por cada cliente. |
| 100 | `promos` | `ventas_flash_horarias` | Transaccional | Sin Datos Personales | Promociones relámpago con stock limitado y cuenta regresiva. |

---

### SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVÍOS, RMA Y AUDITORÍA FORENSE
**Autor Responsable:** Integrante 3 (Tablas 101 a 150)

| No. | Esquema | Nombre de Tabla | Tipo | Clasificación LFPDPPP | Propósito Funcional |
| :---: | :--- | :--- | :---: | :---: | :--- |
| 101 | `compras` | `estados_orden_compra` | Catálogo (17) | Sin Datos Personales | Fases de la orden de compra a laboratorios (Borrador, Enviada, Recibida). |
| 102 | `compras` | `proveedores` | Maestra | Sin Datos Personales | Directorio de laboratorios proveedores con RFC y días de crédito. |
| 103 | `compras` | `contactos_proveedor` | Transaccional | Dato Personal Laboral | Ejecutivos de cuenta y responsables técnicos de laboratorios. |
| 104 | `compras` | `proveedor_slas` | Transaccional | Comercial / Legal | Acuerdos de nivel de servicio (tiempos de entrega y penalizaciones). |
| 105 | `compras` | `proveedor_productos` | Intermedia $N:M$ | Sin Datos Personales | Catálogo de precios mayoristas negociados por SKU y proveedor. |
| 106 | `compras` | `requisiciones` | Transaccional | Sin Datos Personales | Solicitudes de resurtido emitidas por el personal de almacén. |
| 107 | `compras` | `requisiciones_detalles` | Transaccional | Sin Datos Personales | Desglose de piezas requeridas por SKU en cada requisición. |
| 108 | `compras` | `ordenes_compra` | Maestra Transaccional | Comercial / Financiero | Contratos de compra formal a laboratorios proveedores. |
| 109 | `compras` | `ordenes_compra_detalles`| Transaccional | Sin Datos Personales | Líneas de producto pedidas, costos unitarios y cantidades. |
| 110 | `compras` | `recepciones_mercancia` | Transaccional | Sin Datos Personales | Registro de llegada de camiones al muelle de descarga del CEDIS. |
| 111 | `compras` | `recepciones_detalles` | Transaccional | Sanitaria | Bultos recibidos y control de temperatura de llegada en sueros. |
| 112 | `compras` | `inspecciones_sanitarias_qa`| Transaccional | Sanitaria COFEPRIS | Validación de sellos intactos, empaques sin fugas y dictamen de QA. |
| 113 | `wms` | `almacenes_cedis` | Maestra | Sin Datos Personales | CEDIS principales y almacenes con capacidad volumétrica. |
| 114 | `wms` | `zonas_almacen` | Maestra | Sanitaria | Zonas operativas (Refrigerada, Cosméticos, Inflamables, Cuarentena). |
| 115 | `wms` | `pasillos_ubicaciones` | Maestra | Sin Datos Personales | Racks y bines con código de ubicación y capacidad en kilogramos. |
| 116 | `wms` | `tipos_movimiento_inventario`| Catálogo (18) | Sin Datos Personales | Naturaleza del movimiento (Entrada, Venta, Merma, Ajuste). |
| 117 | `wms` | `lotes_fabricacion_sanitaria`| Maestra | Sanitaria FEFO | Lotes de laboratorio con fechas de caducidad para despacho FEFO. |
| 118 | `wms` | `inventario_lotes_ubicacion` | Transaccional | Sin Datos Personales | Stock físico disponible y apartado en cada rack por SKU y Lote. |
| 119 | `wms` | `kardex_movimientos` | Bitácora Transaccional | Sin Datos Personales | Kardex continuo de entradas y salidas con saldo resultante. |
| 120 | `wms` | `alertas_caducidad_proxima`| Transaccional | Sanitaria / Comercial | Alertas automáticas a 90, 60 y 30 días de vencer para venta flash. |
| 121 | `wms` | `mermas_destruccion_sanitaria`| Transaccional | Sanitaria COFEPRIS | Actas de destrucción de producto caducado con manifiesto ecológico. |
| 122 | `wms` | `transferencias_almacenes`| Transaccional | Sin Datos Personales | Traspaso de mercancía entre CEDIS Norte y CEDIS Centro. |
| 123 | `wms` | `transferencias_detalles`| Transaccional | Sin Datos Personales | Desglose de lotes y piezas enviadas vs recibidas en traspaso. |
| 124 | `wms` | `conteos_ciclicos_auditoria`| Transaccional | Auditoría FBD | Auditorías periódicas de inventario físico en almacén. |
| 125 | `wms` | `conteos_ciclicos_detalles`| Transaccional | Auditoría FBD | Discrepancias entre stock del sistema y conteo físico manual. |
| 126 | `wms` | `monitoreo_temperatura_humedad`| Transaccional | Sanitaria IoT | Telemetría IoT en tiempo real para preservar cadena de frío de sueros. |
| 127 | `envios` | `transportistas_paqueterias`| Catálogo (19) | Sin Datos Personales | Paqueterías integradas (DHL, FedEx, Estafeta, Flotilla Propia). |
| 128 | `envios` | `tipos_servicio_envio` | Catálogo (20) | Sin Datos Personales | Modalidades de entrega (Mismo Día, Día Siguiente, Estándar). |
| 129 | `envios` | `tarifas_zonas_postales` | Transaccional | Comercial | Matriz de costos de envío según código postal y peso volumétrico. |
| 130 | `envios` | `despachos_orden` | Maestra Transaccional | Dato Personal | Órdenes de despacho asignadas a transportista con fecha compromiso. |
| 131 | `envios` | `paquetes_bultos` | Transaccional | Logística | Dimensiones, peso bruto y peso volumétrico calculado de cada caja. |
| 132 | `envios` | `paquetes_contenido_lotes`| Transaccional | Trazabilidad Sanitaria | Registro de qué lote y SKU específico fue embalado en cada caja. |
| 133 | `envios` | `guias_rastreo` | Transaccional | Logística | Números de rastreo (tracking) y etiquetas generadas en PDF. |
| 134 | `envios` | `eventos_tracking_bitacora`| Bitácora | Logística | Webhooks de paqueterías reportando tránsitos y escalas. |
| 135 | `envios` | `intentos_entrega_fallidos`| Transaccional | Logística | Intentos no concretados por domicilio cerrado o cliente ausente. |
| 136 | `envios` | `incidencias_logisticas` | Transaccional | Legal / Seguros | Reportes formales de paquetes dañados, derrames o extravíos. |
| 137 | `envios` | `seguros_mercancia` | Transaccional | Financiero | Pólizas de cobertura de carga contra siniestros en tránsito. |
| 138 | `envios` | `puntos_recoleccion_pickup`| Maestra | Sin Datos Personales | Lockers inteligentes y puntos de entrega para recolección física. |
| 139 | `postventa` | `motivos_devolucion_rma` | Catálogo (21) | Sin Datos Personales | Motivos de retorno (Alergia cutánea, Tono incorrecto, Daño físico). |
| 140 | `postventa` | `solicitudes_rma` | Maestra | Dato Personal / Sanitario | Devoluciones solicitadas por clientes con fotografías de evidencia. |
| 141 | `postventa` | `rma_detalles` | Transaccional | Sin Datos Personales | SKUs y piezas reclamadas en la solicitud de devolución. |
| 142 | `postventa` | `inspeccion_sanitaria_retorno`| Transaccional | Sanitaria Higiénica | Dictamen técnico de cuarentena (destrucción obligatoria por higiene). |
| 143 | `postventa` | `tickets_soporte` | Maestra | Dato Personal | Casos de atención al cliente y reclamaciones de servicio. |
| 144 | `postventa` | `tickets_mensajes` | Transaccional | Dato Personal | Conversación y seguimiento entre agente y cliente. |
| 145 | `postventa` | `reportes_farmacovigilancia`| Transaccional | Sanitaria COFEPRIS | Notificación formal de reacciones adversas dermatológicas severas. |
| 146 | `auditoria` | `tipos_evento_sistema` | Catálogo (22) | Sin Datos Personales | Catálogo de eventos auditables (Login, Soft Delete, Cambio Precios). |
| 147 | `auditoria` | `bitacora_seguridad_global`| Bitácora Forense | Ciberseguridad Penal | Trazabilidad con firma HMAC/SHA-256 (Arts. 211 bis 1–7 CPF). |
| 148 | `auditoria` | `bitacora_cambios_datos` | Bitácora DML | Forense / Integridad | Historial de valores anteriores y nuevos en formato JSON. |
| 149 | `sistema` | `parametros_configuracion`| Maestra | Sin Datos Personales | Parámetros del sistema modificables en caliente. |
| 150 | `sistema` | `notificaciones_push_email`| Transaccional | Dato Personal | Cola de mensajería transaccional enviada a usuarios. |
