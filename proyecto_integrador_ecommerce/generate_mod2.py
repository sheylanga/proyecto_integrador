# -*- coding: utf-8 -*-
"""
Generador de Datos Semilla para Submódulo 2 (Tablas 051 a 100)
Autor: Integrante 2 (Ventas, Suscripciones Beauty-Box, Pagos, Fiscal CFDI 4.0 y Promociones)
"""
import sys

output_path = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\02_dml_modulo_comercial_pagos_alu2.sql"

out = []

def p(s):
    out.append(s + "\n")

p("-- =================================================================================================")
p("-- PROYECTO INTEGRADOR V - SISTEMA E-COMMERCE DE SALUD, BELLEZA Y CUIDADO DERMATOLÓGICO")
p("-- SUBMÓDULO 2: GESTIÓN COMERCIAL, CARRIZOS, SUSCRIPCIONES, ÓRDENES, PAGOS, FACTURACIÓN Y PROMOS")
p("-- AUTOR RESPONSABLE: INTEGRANTE 2 (TABLAS 051 A 100)")
p("-- ESTÁNDAR: IDENTITY_INSERT EXPLÍCITO, >= 30 REGISTROS POR TABLA, AUDITORÍA Y SOFT DELETE")
p("-- =================================================================================================")
p("USE ecom_belleza_salud;")
p("GO\n")

# 051. ventas.tipos_descuento (30 registros)
p("-- 051. TABLA: ventas.tipos_descuento")
p("SET IDENTITY_INSERT ventas.tipos_descuento ON;")
p("INSERT INTO ventas.tipos_descuento (id_tipo_descuento, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
tipos_desc = [
    (1, 'PORCENTAJE_DIRECTO', 'Descuento Porcentual Directo', 'Aplica un porcentaje de descuento sobre el precio de lista'),
    (2, 'MONTO_FIJO', 'Descuento de Monto Fijo en Moneda', 'Resta una cantidad monetaria fija en pesos al total'),
    (3, 'ENVIO_GRATIS', 'Cupón de Envío Sin Costo', 'Exención del 100% de la tarifa logística de paquetería'),
    (4, 'REGALO_GWP', 'Regalo por Compra (Gift with Purchase)', 'Obsequio de muestra o producto mini al superar monto mínimo'),
    (5, 'SEGUNDA_UNIDAD_DESC', 'Descuento en 2da Unidad (2x1.5)', 'Descuento especial del 50% al comprar la segunda unidad igual'),
    (6, 'COMBO_BUNDLE', 'Descuento de Set o Rutina Completa', 'Rebaja exclusiva al adquirir los 3 pasos de rutina juntos'),
    (7, 'LEALTAD_PUNTOS', 'Canje de Puntos Beauty Club', 'Conversión directa de saldo de fidelización acumulado'),
    (8, 'PRIMERA_COMPRA', 'Bono de Bienvenida Nuevos Usuarios', '15% de descuento en el primer pedido verificado'),
    (9, 'CUMPLEANOS', 'Cortesía de Cumpleaños Cliente', 'Cupón anual del 20% válido durante el mes de cumpleaños'),
    (10, 'VENTA_FLASH', 'Descuento Horario Relámpago', 'Precio promocional limitado a pocas horas de duración'),
    (11, 'SUSCRIPCION_RECURRENTE', 'Descuento por Suscripción Box', '10% de ahorro permanente en envíos periódicos automáticos'),
    (12, 'HOT_SALE_SPECIAL', 'Descuento Magno Hot Sale', 'Rebaja institucional durante evento nacional de comercio digital'),
    (13, 'BUEN_FIN_SPECIAL', 'Descuento Nacional El Buen Fin', 'Promoción oficial de temporada de descuentos mexicana'),
    (14, 'BLACK_FRIDAY', 'Rebaja Black Friday Belleza', 'Precios de liquidación en cosméticos seleccionados'),
    (15, 'CYBER_MONDAY', 'Descuento Cyber Monday Dermo', 'Ofertas exclusivas para canal web y móvil de cuidado de la piel'),
    (16, 'AFILIADO_INFLUENCER', 'Cupón Promocional Creador Contenido', 'Código asignado a embajador de marca dermatológico'),
    (17, 'RECUPERACION_CARRITO', 'Incentivo de Abandono de Carrito', 'Cupón enviado por correo tras 24 horas de abandono'),
    (18, 'LIQUIDACION_CADUCIDAD', 'Venta Especial Caducidad Próxima', 'Descuento de hasta 50% en lotes a 90 días de vencer (FEFO)'),
    (19, 'COMPRA_VOLUMEN', 'Descuento Mayoreo Profesional', 'Para dermatólogos y cosmetólogas con compras superiores a $10,000'),
    (20, 'CONVENIO_EMPRESARIAL', 'Beneficio Corporativo Empleados', 'Descuento vía convenio comercial con empresas aliadas'),
    (21, 'APO_DERMATOLOGICO', 'Subsidio por Receta Dermatológica', 'Bonificación al subir receta de médico especialista'),
    (22, 'CROSS_SELL_RUTINA', 'Descuento al Agregar Complemento', '10% en protector solar al comprar suero facial'),
    (23, 'PAGO_SPEI_EFECTIVO', 'Descuento por Pago de Contado SPEI', '3% de ahorro por no intermediación de tarjeta de crédito'),
    (24, 'LANZAMIENTO_MARCA', 'Descuento Introductorio Nueva Línea', 'Promoción de prueba para marca recién agregada al catálogo'),
    (25, 'RESEÑA_FOTO_VIDEO', 'Cupón por Reseña Verificada de Producto', 'Recompensa de $50 MXN tras compartir testimonio fotográfico'),
    (26, 'RETORNO_EMPAQUE_RECICLA', 'Crédito Verde por Reciclaje de Envases', 'Bonificación ambiental de $20 MXN por envase devuelto al CEDIS'),
    (27, 'FLASH_APP_EXCLUSIVO', 'Oferta Exclusiva Aplicación Móvil', 'Descuento relámpago válido únicamente en app Android/iOS'),
    (28, 'TARJETA_HABIENTE_PARTNER', 'Descuento Alianza Bancaria Exclusiva', 'Meses sin intereses y 10% adicional con bancos participantes'),
    (29, 'ANIVERSARIO_ECOMMERCE', 'Promoción Global Fin de Año Salud', 'Cupón festivo general para toda la base de clientes activos'),
    (30, 'DESC_PRUEBA_OBSOLETO', 'Cupón Descontinuado Fase Piloto', 'Descuento de calibración dado de baja del motor comercial')
]
rows = []
for i, (id_t, cod, nom, desc) in enumerate(tipos_desc):
    if i == 29:
        rows.append(f"({id_t}, N'{cod}', N'{nom}', N'{desc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_t}, N'{cod}', N'{nom}', N'{desc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.tipos_descuento OFF;")
p("GO\n")

# 052. ventas.estados_orden (10 reales + 20 adicionales descriptivos = 30)
p("-- 052. TABLA: ventas.estados_orden")
p("SET IDENTITY_INSERT ventas.estados_orden ON;")
p("INSERT INTO ventas.estados_orden (id_estado_orden, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
estados_ord = [
    (1, 'BORRADOR', 'Orden en Borrador', 'Orden iniciada por cliente en pasarela de checkout', 0),
    (2, 'PENDIENTE_PAGO', 'Pendiente de Pago', 'Esperando acreditación de SPEI o confirmación OXXO', 0),
    (3, 'PAGO_EN_REVISION', 'Pago en Revisión Antifraude', 'Transacción retenida preventivamente por evaluación de riesgo', 0),
    (4, 'PAGADA_CONFIRMADA', 'Pago Acreditado Exitosamente', 'Cobro completado y fondos autorizados por pasarela bancaria', 0),
    (5, 'EN_PREPARACION_CEDIS', 'Surtido en Almacén CEDIS', 'Orden asignada a personal de picking y packing en rack', 0),
    (6, 'EMPAQUETADA_LISTA', 'Empaque Terminado', 'Bultos sellados con guía logística adherida en espera de transporte', 0),
    (7, 'RECOLECTADA_TRANSPORTISTA', 'Recolectada por Paquetería', 'Paquete en manos de DHL, FedEx o paquetería asignada', 0),
    (8, 'EN_TRANSITO_LOCAL', 'En Tránsito Interurbano', 'Viajando entre centro de distribución y ciudad de destino', 0),
    (9, 'EN_REPARTO_ULTIMA_MILLA', 'En Ruta de Entrega Final', 'Unidad de reparto en camino al domicilio del destinatario', 0),
    (10, 'ENTREGADA_EXITOSA', 'Entregada al Destinatario', 'Entrega confirmada con firma y geolocalización por mensajero', 1),
    (11, 'INTENTO_FALLIDO_1', 'Primer Intento de Entrega Fallido', 'Domicilio cerrado o cliente ausente; se reprograma visita', 0),
    (12, 'INTENTO_FALLIDO_2', 'Segundo Intento de Entrega Fallido', 'Segundo aviso dejado en puerta; contactar soporte', 0),
    (13, 'DISPONIBLE_EN_SUCURSAL', 'Disponible para Recolección Ocurre', 'Paquete en locker o sucursal postal para retiro por cliente', 0),
    (14, 'DEVUELTA_A_CEDIS', 'Retornada a Centro de Distribución', 'Paquete no reclamado en plazo o dirección no localizada', 1),
    (15, 'CANCELADA_POR_CLIENTE', 'Cancelada por el Cliente', 'Cancelación voluntaria solicitada antes del despacho', 1),
    (16, 'CANCELADA_FALTA_STOCK', 'Cancelada por Agotamiento de Stock', 'Inventario insuficiente en almacén; reembolso integral', 1),
    (17, 'CANCELADA_POR_FRAUDE', 'Cancelada por Riesgo de Fraude', 'Transacción declinada por sistema de ciberseguridad', 1),
    (18, 'CANCELADA_EXPIRACION_PAGO', 'Cancelada por Vencimiento de Pago', 'Orden SPEI u OXXO no liquidada en plazo de 48 horas', 1),
    (19, 'EN_PROCESO_DEVOLUCION_RMA', 'En Proceso de Devolución RMA', 'Solicitud de retorno abierta por problema de calidad o alergia', 0),
    (20, 'REEMBOLSADA_PARCIAL', 'Reembolso Parcial Acreditado', 'Devolución de importe de una o varias partidas no entregadas', 0),
    (21, 'REEMBOLSADA_TOTAL', 'Reembolso Total Concretado', 'Fondos devueltos íntegramente a la tarjeta o billetera del cliente', 1),
    (22, 'INCIDENCIA_SINIESTRO', 'Siniestro en Tránsito Registrado', 'Pérdida, derrame o robo en ruta reportado por paquetería', 1),
    (23, 'RETENIDA_INVESTIGACION', 'Retenida para Verificación Legal', 'Revisión por aclaración formal bancaria o cargo no reconocido', 0),
    (24, 'RETENIDA_CONTROL_CALIDAD', 'Retenida en Cuarentena QA', 'Lote de cosmético detenido por alerta sanitaria interna', 0),
    (25, 'DIVIDIDA_EN_SPLITS', 'Dividida en Múltiples Almacenes', 'Surtido fragmentado entre CEDIS Norte y CEDIS Centro', 0),
    (26, 'PROGRAMADA_ENTREGA_FUTURA', 'Entrega en Fecha Programada', 'Pedido diferido por solicitud expresa del cliente', 0),
    (27, 'EN_REACONDICIONAMIENTO', 'Reempaque por Daño de Caja Exterior', 'Cambio de empaque secundario dañado antes de salir a ruta', 0),
    (28, 'RECLAMO_ABIERTO_PROFECO', 'Reclamación Formal en Trámite', 'Caso escalado a atención jurídica de servicio al consumidor', 0),
    (29, 'ORDEN_CERRADA_AUDITADA', 'Orden Completada y Auditada', 'Proceso logístico y contable fiscalmente cerrado', 1),
    (30, 'ESTADO_OBSOLETO_TEST', 'Estado de Prueba Descontinuado', 'Registro legado de pruebas de arquitectura inicial', 1)
]
rows = []
for i, (id_e, cod, nom, desc, es_term) in enumerate(estados_ord):
    if i == 29:
        rows.append(f"({id_e}, N'{cod}', N'{nom}', N'{desc}', {es_term}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_e}, N'{cod}', N'{nom}', N'{desc}', {es_term}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.estados_orden OFF;")
p("GO\n")

# 053. ventas.motivos_cancelacion_orden (30 registros)
p("-- 053. TABLA: ventas.motivos_cancelacion_orden")
p("SET IDENTITY_INSERT ventas.motivos_cancelacion_orden ON;")
p("INSERT INTO ventas.motivos_cancelacion_orden (id_motivo_cancelacion, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
motivos_canc = [
    (1, 'CLIENTE_ARREPENTIMIENTO', 'El cliente decidió cancelar voluntariamente antes del envío', 1),
    (2, 'CLIENTE_ERROR_PRODUCTO', 'Cliente seleccionó tono o presentación equivocada por equivocación', 1),
    (3, 'CLIENTE_DOMICILIO_ERRONEO', 'Dirección de envío incorrecta capturada por el usuario', 1),
    (4, 'CLIENTE_DUPLICADO', 'Cliente realizó por duplicado la misma orden por error de clic', 1),
    (5, 'SISTEMA_FALTA_STOCK', 'Discrepancia de inventario físico en CEDIS; producto agotado', 0),
    (6, 'SISTEMA_RECHAZO_ANTIFRAUDE', 'Calificación de riesgo crítico detonada por pasarela bancaria', 0),
    (7, 'SISTEMA_EXPIRACION_SPEI', 'Vencimiento de la referencia SPEI / OXXO tras 48 horas sin depósito', 1),
    (8, 'SISTEMA_FALLA_PASARELA', 'Error de comunicación técnica irrecuperable con API bancaria', 0),
    (9, 'LOGISTICA_ZONA_SIN_COBERTURA', 'Código postal fuera del alcance geográfico de los transportistas', 0),
    (10, 'CALIDAD_LOTE_CUARENTENA', 'Retiro preventivo del lote cosmético por reporte de control sanitario', 0),
    (11, 'PRECIO_ERROR_PUBLICACION', 'Error tipográfico evidente en precio de oferta del producto', 0),
    (12, 'CLIENTE_TIEMPO_EXCESIVO', 'Cliente inconforme con plazo estimado por demoras de transporte', 1),
    (13, 'CLIENTE_ENCONTRO_MEJOR_PRECIO', 'Cliente adquirió el producto en otro canal físico u online', 1),
    (14, 'CLIENTE_METODO_PAGO_PROBLEMA', 'Límite de tarjeta alcanzado o declinación de fondos por emisor', 1),
    (15, 'LOGISTICA_EXTRAVIO_PREVIO', 'Paquete extraviado en centro de clasificación antes de entrega', 0),
    (16, 'SISTEMA_CARRITO_EXPIRADO', 'Sesión de pago expirada durante el proceso de verificación 3DS', 1),
    (17, 'CLIENTE_SOLICITO_CAMBIO_FACTURA', 'Requerimiento de refacturación integral por cambio de RFC', 1),
    (18, 'CLIENTE_VIAJE_INESPERADO', 'Cliente ausente del domicilio durante las fechas estimadas', 1),
    (19, 'SISTEMA_CUPON_NO_APLICADO', 'Cliente cancela para reordenar aplicando cupón de descuento', 1),
    (20, 'CALIDAD_EMPAQUE_DANADO', 'Merma detectada en almacén durante el embalaje sin repuesto', 0),
    (21, 'LOGISTICA_CLIMA_SEVERO', 'Imposibilidad de acceso por contingencia climática o desastre natural', 0),
    (22, 'SISTEMA_CUENTA_BLOQUEADA', 'Usuario sancionado por violación a términos de servicio', 0),
    (23, 'CLIENTE_COMPRA_NO_RECONOCIDA', 'Titular de la tarjeta manifiesta no haber autorizado el pedido', 1),
    (24, 'CALIDAD_CADUCIDAD_MENOR_60D', 'Stock restante no cumple con el compromiso de caducidad mínima', 0),
    (25, 'LOGISTICA_RECHAZO_DESTINATARIO', 'Destinatario rechaza recibir el paquete en la puerta', 1),
    (26, 'SISTEMA_LIMITACION_LEGAL', 'Restricción regulatoria COFEPRIS sobrevenida para el cosmético', 0),
    (27, 'CLIENTE_MODIFICACION_PEDIDO', 'Cancelación técnica para añadir más piezas al mismo paquete', 1),
    (28, 'LOGISTICA_ASALTO_UNIDAD', 'Pérdida total por asalto a unidad de transporte en carretera', 0),
    (29, 'SISTEMA_DESCONEXION_ERP', 'Time-out en sincronización transaccional con WMS central', 0),
    (30, 'MOTIVO_OBSOLETO_TEST', 'Motivo de prueba de arquitectura legacy eliminado', 0)
]
rows = []
for i, (id_m, cod, desc, es_cli) in enumerate(motivos_canc):
    if i == 29:
        rows.append(f"({id_m}, N'{cod}', N'{desc}', {es_cli}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_m}, N'{cod}', N'{desc}', {es_cli}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.motivos_cancelacion_orden OFF;")
p("GO\n")

# 054. ventas.carritos (30 carritos)
p("-- 054. TABLA: ventas.carritos")
p("SET IDENTITY_INSERT ventas.carritos ON;")
p("INSERT INTO ventas.carritos (id_carrito, id_cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cli = i
    tok = f"CART-SES-TOKEN-{i:04d}-UUID4"
    conv = 1 if i <= 20 else 0
    if i == 30:
        rows.append(f"({i}, {cli}, N'{tok}', '2025-01-01 10:00:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cli}, N'{tok}', SYSDATETIME(), {conv}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.carritos OFF;")
p("GO\n")

# 055. ventas.items_carrito (30+ items)
p("-- 055. TABLA: ventas.items_carrito")
p("SET IDENTITY_INSERT ventas.items_carrito ON;")
p("INSERT INTO ventas.items_carrito (id_item_carrito, id_carrito, id_variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
prices = [899.00, 399.00, 269.00, 229.00, 389.00, 599.00, 3850.00, 560.00, 560.00, 560.00,
          840.00, 840.00, 840.00, 549.00, 549.00, 489.00, 399.00, 520.00, 789.00, 679.00,
          349.00, 890.00, 690.00, 920.00, 850.00, 1650.00, 640.00, 219.00, 490.00, 99.00]
for i in range(1, 31):
    cart_id = ((i - 1) % 30) + 1
    sku_id = ((i - 1) % 30) + 1
    cant = 1 if i % 3 != 0 else 2
    pr = prices[sku_id - 1]
    if i == 30:
        rows.append(f"({i}, {cart_id}, {sku_id}, {cant}, {pr:.2f}, '2025-01-01 10:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cart_id}, {sku_id}, {cant}, {pr:.2f}, SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.items_carrito OFF;")
p("GO\n")

# 056. ventas.carritos_abandonados_seguimiento (30 registros)
p("-- 056. TABLA: ventas.carritos_abandonados_seguimiento")
p("SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento ON;")
p("INSERT INTO ventas.carritos_abandonados_seguimiento (id_seguimiento_abandono, id_carrito, fecha_deteccion_abandono, email_recordatorio_enviado, fecha_envio_email, cupon_recuperacion_ofrecido, recuperado_con_exito, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cart_id = i
    em_env = 1 if i % 2 == 0 else 0
    cup = f"RECUPERA10-{i:02d}" if em_env else None
    cup_val = f"N'{cup}'" if cup else "NULL"
    recup = 1 if i % 4 == 0 else 0
    if i == 30:
        rows.append(f"({i}, {cart_id}, '2025-01-01 12:00:00', 1, '2025-01-01 14:00:00', N'RECUPERA10-30', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cart_id}, SYSDATETIME(), {em_env}, SYSDATETIME(), {cup_val}, {recup}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento OFF;")
p("GO\n")

# 057. ventas.planes_suscripcion (30 planes)
p("-- 057. TABLA: ventas.planes_suscripcion")
p("SET IDENTITY_INSERT ventas.planes_suscripcion ON;")
p("INSERT INTO ventas.planes_suscripcion (id_plan_suscripcion, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fijo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
planes = [
    (1, 'BOX-DERMO-BASIC', 'Beauty Box Dermo Esencial', 'Caja mensual con 3 productos básicos dermatológicos', 699.00, 10.00),
    (2, 'BOX-ANTI-ACNE', 'Beauty Box Control Grasa y Acné', 'Kit especializado en piel mixta a grasa con seborreguladores', 849.00, 12.00),
    (3, 'BOX-GLOW-KOREA', 'Beauty Box K-Beauty Glass Skin', 'Selección mensual de 4 productos de cosmética coreana viral', 999.00, 15.00),
    (4, 'BOX-ANTI-AGE-LUX', 'Beauty Box Antiedad Clínico VIP', 'Sueros avanzados de péptidos y retinol con cremas reconstructoras', 1499.00, 18.00),
    (5, 'BOX-MAKEUP-TREND', 'Beauty Box Tendencias Maquillaje', 'Edición bimestral con paletas, rubores virales y labiales indelebles', 799.00, 10.00),
    (6, 'BOX-SENSITIVE-CALM', 'Beauty Box Alivio Rosácea y Piel Sensible', 'Fórmulas puras sin fragancia con agua termal y cica', 899.00, 12.00),
    (7, 'BOX-SOLAR-365', 'Suscripción Fotoprotección Continua', 'Reposición automática de protectores solares dermatológicos', 599.00, 15.00),
    (8, 'BOX-CERAMIDAS-REPAIR', 'Suscripción Barrera Cutánea Fuerte', 'Limpiador syndet y emulsiones ricas en lípidos biomiméticos', 749.00, 10.00),
    (9, 'BOX-VITAMINA-C-BOOST', 'Suscripción Luminosidad Vitamina C', 'Goteros frescos bimestrales para evitar oxidación del activo', 899.00, 12.00),
    (10, 'BOX-EYE-LIP-SPA', 'Suscripción Cuidado Ojos y Labios', 'Parches de hidrogel, mascarillas labiales nocturnas y sueros', 649.00, 10.00),
    (11, 'BOX-MEN-GROOMING', 'Beauty Box Cuidado Masculino', 'Higiene facial, bálsamo post-afeitado y protección invisible', 699.00, 10.00),
    (12, 'BOX-EXFOLIANTE-AHA', 'Suscripción Renovación Queratolítica', 'Ácidos glicólico, láctico y salicílico para renovación suave', 799.00, 12.00),
    (13, 'BOX-HAIR-SCALP-DERMO', 'Suscripción Salud Capilar y Cuero Cabelludo', 'Shampoos dermatológicos y lociones anticaída certificadas', 850.00, 10.00),
    (14, 'BOX-BODY-HYDRA-MAX', 'Suscripción Hidratación Corporal Profunda', 'Lociones con urea al 10% y cremas de tarro de 400g', 580.00, 10.00),
    (15, 'BOX-PRE-MAMA-CARE', 'Suscripción Embarazo y Postparto Seguro', 'Productos 100% seguros libres de retinol y salicilatos', 920.00, 15.00),
    (16, 'BOX-TEEN-FIRST-SKIN', 'Suscripción Primer Skincare Jóvenes', 'Rutina no invasiva para prevención de brotes juveniles', 499.00, 10.00),
    (17, 'BOX-ORGANIC-VEGAN', 'Suscripción Belleza Vegana y Cruelty-Free', 'Cosmética con certificaciones internacionales ecológicas', 840.00, 12.00),
    (18, 'BOX-MAKEUP-MINIMAL', 'Suscripción Maquillaje Efecto No-Makeup', 'Tintas con color, máscaras ligeras y bálsamos nutritivos', 680.00, 10.00),
    (19, 'BOX-NOCHE-REPARACION', 'Suscripción Protocolo Sueño Reparador', 'Mascarillas nocturnas de noche y aromaterapia relajante', 750.00, 10.00),
    (20, 'BOX-MANCHAS-MELASMA', 'Suscripción Control de Hiperpigmentación', 'Alfa arbutina, ácido kójico y protección solar de alta gama', 1150.00, 15.00),
    (21, 'BOX-ANTIOXIDANTE-PRO', 'Suscripción Escudo Urbano Antipolución', 'Extractos de té verde, ubiquinona y resveratrol puro', 950.00, 12.00),
    (22, 'BOX-LIPSTICK-CLUB', 'Suscripción Club de Labiales Mensual', 'Dos tonos de labiales exclusivos por mes curados por expertos', 490.00, 10.00),
    (23, 'BOX-MASKS-DISCOVERY', 'Suscripción Multimascarillas de Tratamiento', '6 sheet masks variadas de bio-celulosa cada mes', 390.00, 8.00),
    (24, 'BOX-DERMOPEDIATRIA', 'Suscripción Cuidado Piel Infantil y Atópica', 'Syndets y cremas emolientes recomendadas por pediatras', 620.00, 10.00),
    (25, 'BOX-TRAVEL-MINIS', 'Suscripción Esenciales de Viaje Minis', 'Frascos de 30ml y 50ml aprobados para equipaje de mano', 520.00, 10.00),
    (26, 'BOX-POST-PROCEDIMIENTO', 'Suscripción Protocolo Médico Post-Láser', 'Cicatrizantes asépticos y pantallas 100% minerales', 1250.00, 15.00),
    (27, 'BOX-SUPER-FOODS-SKIN', 'Suscripción Fitocosmética Superalimentos', 'Fórmulas con espirulina, centella, chía y aguacate bio', 780.00, 10.00),
    (28, 'BOX-DIAGNOSTICO-CUSTOM', 'Suscripción Personalizada por Algoritmo', 'Caja formulada a la medida tras responder el test dermatológico', 1390.00, 20.00),
    (29, 'BOX-ESTUDIANTE-DERMO', 'Suscripción Descuento Joven Universitario', 'Ahorro máximo en básicos esenciales con credencial vigente', 450.00, 15.00),
    (30, 'BOX-OBSOLETO-PILOTO', 'Suscripción de Evaluación Piloto Inicial', 'Plan prototipo dado de baja comercial por reemplazo de catálogo', 299.00, 5.00)
]
rows = []
for i, (id_p, cod, nom, desc, prec, desc_p) in enumerate(planes):
    if i == 29:
        rows.append(f"({id_p}, N'{cod}', N'{nom}', N'{desc}', {prec:.2f}, {desc_p:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_p}, N'{cod}', N'{nom}', N'{desc}', {prec:.2f}, {desc_p:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.planes_suscripcion OFF;")
p("GO\n")

# 058. ventas.frecuencias_suscripcion (30 frecuencias)
p("-- 058. TABLA: ventas.frecuencias_suscripcion")
p("SET IDENTITY_INSERT ventas.frecuencias_suscripcion ON;")
p("INSERT INTO ventas.frecuencias_suscripcion (id_frecuencia_suscripcion, codigo_frecuencia, nombre_frecuencia, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
frecuencias = [
    (1, 'FREQ-15D', 'Quincenal (Cada 15 Días)', 15),
    (2, 'FREQ-21D', 'Cada 3 Semanas (21 Días)', 21),
    (3, 'FREQ-30D', 'Mensual Estándar (30 Días)', 30),
    (4, 'FREQ-45D', 'Cada Mes y Medio (45 Días)', 45),
    (5, 'FREQ-60D', 'Bimestral (Cada 60 Días)', 60),
    (6, 'FREQ-75D', 'Cada 2 Meses y Medio (75 Días)', 75),
    (7, 'FREQ-90D', 'Trimestral (Cada 90 Días)', 90),
    (8, 'FREQ-120D', 'Cuatrimestral (Cada 120 Días)', 120),
    (9, 'FREQ-180D', 'Semestral (Cada 180 Días)', 180),
]
for i in range(10, 31):
    dias = 15 + ((i - 10) * 8)
    if dias > 180: dias = 180
    frecuencias.append((i, f'FREQ-CUSTOM-{i:02d}D', f'Frecuencia Personalizada {dias} Días', dias))

rows = []
for i, (id_f, cod, nom, dias) in enumerate(frecuencias):
    if i == 29:
        rows.append(f"({id_f}, N'{cod}', N'{nom}', {dias}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_f}, N'{cod}', N'{nom}', {dias}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.frecuencias_suscripcion OFF;")
p("GO\n")

# 059. ventas.suscripciones_cliente (30 suscripciones)
p("-- 059. TABLA: ventas.suscripciones_cliente")
p("SET IDENTITY_INSERT ventas.suscripciones_cliente ON;")
p("INSERT INTO ventas.suscripciones_cliente (id_suscripcion_cliente, id_cliente, id_plan_suscripcion, id_frecuencia_suscripcion, id_direccion_entrega, id_metodo_tokenizado, fecha_inicio, fecha_proximo_cobro, fecha_cancelacion, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cli = i
    plan = ((i - 1) % 29) + 1
    freq = ((i - 1) % 9) + 1
    dir_id = i
    tok_id = i
    est = 'ACTIVA' if i <= 24 else ('PAUSADA' if i <= 27 else 'CANCELADA')
    fcanc = "'2026-02-15 10:00:00'" if est == 'CANCELADA' else "NULL"
    if i == 30:
        rows.append(f"({i}, {cli}, {plan}, {freq}, {dir_id}, {tok_id}, '2025-01-01', '2025-02-01', '2025-02-01', N'CANCELADA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cli}, {plan}, {freq}, {dir_id}, {tok_id}, '2026-01-15', '2026-12-15', {fcanc}, N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.suscripciones_cliente OFF;")
p("GO\n")

# 060. ventas.suscripciones_items (30 registros)
p("-- 060. TABLA: ventas.suscripciones_items")
p("SET IDENTITY_INSERT ventas.suscripciones_items ON;")
p("INSERT INTO ventas.suscripciones_items (id_suscripcion_item, id_suscripcion_cliente, id_variante_sku, cantidad, precio_unitario_congelado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    sub_id = i
    sku_id = ((i - 1) % 30) + 1
    cant = 1 if i % 2 == 0 else 2
    pr = prices[sku_id - 1] * 0.90
    if i == 30:
        rows.append(f"({i}, {sub_id}, {sku_id}, {cant}, {pr:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {sub_id}, {sku_id}, {cant}, {pr:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.suscripciones_items OFF;")
p("GO\n")

# 061. ventas.suscripciones_calendario_entregas (30 entregas)
p("-- 061. TABLA: ventas.suscripciones_calendario_entregas")
p("SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas ON;")
p("INSERT INTO ventas.suscripciones_calendario_entregas (id_entrega_programada, id_suscripcion_cliente, numero_entrega_consecutiva, fecha_programada, fecha_cobro_realizada, estado_despacho, id_orden_generada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    sub_id = i
    num = (i % 5) + 1
    est = 'DESPACHADO' if i <= 15 else ('PROGRAMADO' if i <= 25 else 'OMITIDO_POR_CLIENTE')
    ord_gen = i if est == 'DESPACHADO' else "NULL"
    fcob = "SYSDATETIME()" if est == 'DESPACHADO' else "NULL"
    if i == 30:
        rows.append(f"({i}, {sub_id}, {num}, '2025-02-01', NULL, N'OMITIDO_POR_CLIENTE', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {sub_id}, {num}, '2026-11-20', {fcob}, N'{est}', {ord_gen}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas OFF;")
p("GO\n")

# 062. ventas.suscripciones_bitacora_estados (30 registros)
p("-- 062. TABLA: ventas.suscripciones_bitacora_estados")
p("SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados ON;")
p("INSERT INTO ventas.suscripciones_bitacora_estados (id_bitacora_suscripcion, id_suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, id_usuario_responsable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    sub_id = i
    if i == 30:
        rows.append(f"({i}, {sub_id}, N'ACTIVA', N'CANCELADA', N'Cancelación por tarjeta bancaria expirada sin renovación', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {sub_id}, N'PROGRAMADA', N'ACTIVA', N'Activación exitosa tras validación del método de pago tokenizado', 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados OFF;")
p("GO\n")

# 063. ventas.regalos_por_compra_gwp (30 reglas GWP)
p("-- 063. TABLA: ventas.regalos_por_compra_gwp")
p("SET IDENTITY_INSERT ventas.regalos_por_compra_gwp ON;")
p("INSERT INTO ventas.regalos_por_compra_gwp (id_regalo_gwp, codigo_promo, descripcion_regalo, id_variante_sku_regalo, monto_minimo_orden, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_otorgados_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cod = f"GWP-REGALO-{i:02d}-2026"
    desc = f"Muestra de lujo de regalo dermatológico por compra mínima nivel {i}"
    sku_r = ((i - 1) % 30) + 1
    monto = 500.00 + (i * 50.00)
    if i == 30:
        rows.append(f"({i}, N'{cod}', N'{desc}', {sku_r}, {monto:.2f}, '2025-01-01', '2025-02-01', 50, 50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{cod}', N'{desc}', {sku_r}, {monto:.2f}, '2026-01-01', '2026-12-31', 500, {i * 10}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.regalos_por_compra_gwp OFF;")
p("GO\n")

# 064. ventas.ordenes (30 órdenes reales)
p("-- 064. TABLA: ventas.ordenes")
p("SET IDENTITY_INSERT ventas.ordenes ON;")
p("INSERT INTO ventas.ordenes (id_orden, numero_orden, id_cliente, id_direccion_envio, id_direccion_facturacion, id_estado_orden, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, requiere_factura, notas_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    nord = f"ORD-2026-{i:04d}"
    cli = i
    dir_e = i
    dir_f = i
    est = 10 if i <= 15 else (5 if i <= 25 else (15 if i <= 28 else 29))
    sub = 1500.00 + (i * 100.00)
    desc = 150.00 if i % 2 == 0 else 0.00
    iva = (sub - desc) * 0.16
    envio = 0.00 if sub > 1000.00 else 149.00
    tot = (sub - desc) + iva + envio
    req_f = 1 if i % 3 == 0 else 0
    nota = f"Favor de entregar en horario diurno al titular del pedido {i}"
    if i == 30:
        rows.append(f"({i}, N'{nord}', {cli}, {dir_e}, {dir_f}, 15, '2025-01-01 10:00:00', {sub:.2f}, {desc:.2f}, {iva:.2f}, {envio:.2f}, {tot:.2f}, 0, N'Cancelada por prueba', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{nord}', {cli}, {dir_e}, {dir_f}, {est}, SYSDATETIME(), {sub:.2f}, {desc:.2f}, {iva:.2f}, {envio:.2f}, {tot:.2f}, {req_f}, N'{nota}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes OFF;")
p("GO\n")

# 065. ventas.ordenes_detalles (30 partidas)
p("-- 065. TABLA: ventas.ordenes_detalles")
p("SET IDENTITY_INSERT ventas.ordenes_detalles ON;")
p("INSERT INTO ventas.ordenes_detalles (id_orden_detalle, id_orden, id_variante_sku, cantidad_comprada, precio_unitario, descuento_unitario, impuesto_unitario, subtotal_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    sku_id = ((i - 1) % 30) + 1
    cant = 1 if i % 2 != 0 else 2
    pr = prices[sku_id - 1]
    desc_u = 0.00
    imp_u = pr * 0.16
    sub_l = (pr * cant) + (imp_u * cant)
    if i == 30:
        rows.append(f"({i}, {ord_id}, {sku_id}, {cant}, {pr:.2f}, {desc_u:.2f}, {imp_u:.2f}, {sub_l:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {sku_id}, {cant}, {pr:.2f}, {desc_u:.2f}, {imp_u:.2f}, {sub_l:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes_detalles OFF;")
p("GO\n")

# 066. ventas.ordenes_historial_estados (30 registros)
p("-- 066. TABLA: ventas.ordenes_historial_estados")
p("SET IDENTITY_INSERT ventas.ordenes_historial_estados ON;")
p("INSERT INTO ventas.ordenes_historial_estados (id_historial_orden, id_orden, id_estado_orden, fecha_cambio_estado, comentario_operativo, id_usuario_operador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    est_id = 10 if i <= 15 else 5
    com = f"Transición automática a estado {est_id} tras confirmación de webhook"
    if i == 30:
        rows.append(f"({i}, {ord_id}, 15, '2025-01-01 11:00:00', N'Cancelación manual por solicitud de usuario en mesa de ayuda', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {est_id}, SYSDATETIME(), N'{com}', 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes_historial_estados OFF;")
p("GO\n")

# 067. ventas.ordenes_splits_almacen (30 registros)
p("-- 067. TABLA: ventas.ordenes_splits_almacen")
p("SET IDENTITY_INSERT ventas.ordenes_splits_almacen ON;")
p("INSERT INTO ventas.ordenes_splits_almacen (id_orden_split, id_orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    subf = f"SPLIT-{ord_id:04d}-A"
    est = 'EMPAQUETADO' if i <= 15 else ('SURTIENDO' if i <= 25 else 'PENDIENTE')
    if i == 30:
        rows.append(f"({i}, {ord_id}, N'{subf}', N'PENDIENTE', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, N'{subf}', N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes_splits_almacen OFF;")
p("GO\n")

# 068. ventas.ordenes_impuestos (30 registros)
p("-- 068. TABLA: ventas.ordenes_impuestos")
p("SET IDENTITY_INSERT ventas.ordenes_impuestos ON;")
p("INSERT INTO ventas.ordenes_impuestos (id_orden_impuesto, id_orden, tipo_impuesto, tasa_porcentual, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    base = 1500.00 + (i * 100.00)
    imp = base * 0.16
    if i == 30:
        rows.append(f"({i}, {ord_id}, '002_IVA', 16.00, {base:.2f}, {imp:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, '002_IVA', 16.00, {base:.2f}, {imp:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes_impuestos OFF;")
p("GO\n")

# 069. ventas.ordenes_descuentos (30 registros)
p("-- 069. TABLA: ventas.ordenes_descuentos")
p("SET IDENTITY_INSERT ventas.ordenes_descuentos ON;")
p("INSERT INTO ventas.ordenes_descuentos (id_orden_descuento, id_orden, id_tipo_descuento, codigo_descuento_aplicado, importe_descuento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    tdesc = ((i - 1) % 29) + 1
    cod = f"DESC-PROMO-{i:02d}"
    imp = 100.00 + (i * 5.00)
    if i == 30:
        rows.append(f"({i}, {ord_id}, {tdesc}, N'{cod}', {imp:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {tdesc}, N'{cod}', {imp:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes_descuentos OFF;")
p("GO\n")

# 070. ventas.ordenes_notas_instrucciones (30 registros)
p("-- 070. TABLA: ventas.ordenes_notas_instrucciones")
p("SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones ON;")
p("INSERT INTO ventas.ordenes_notas_instrucciones (id_orden_nota, id_orden, tipo_nota, contenido_nota, es_visible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    tnota = "ENTREGA" if i % 2 == 0 else "EMPAQUE"
    cnota = f"Instrucción para pedido {ord_id}: Manejar con cuidado frascos de vidrio y sueros tópicos"
    if i == 30:
        rows.append(f"({i}, {ord_id}, N'{tnota}', N'{cnota}', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, N'{tnota}', N'{cnota}', 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones OFF;")
p("GO\n")

# 071. ventas.reservas_temporales_stock (30 registros)
p("-- 071. TABLA: ventas.reservas_temporales_stock")
p("SET IDENTITY_INSERT ventas.reservas_temporales_stock ON;")
p("INSERT INTO ventas.reservas_temporales_stock (id_reserva_stock, id_carrito, id_variante_sku, cantidad_reservada, fecha_inicio_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cart_id = i
    sku_id = ((i - 1) % 30) + 1
    lib = 1 if i <= 20 else 0
    if i == 30:
        rows.append(f"({i}, {cart_id}, {sku_id}, 1, '2025-01-01 10:00:00', '2025-01-01 10:15:00', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cart_id}, {sku_id}, 1, SYSDATETIME(), DATEADD(minute, 15, SYSDATETIME()), {lib}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.reservas_temporales_stock OFF;")
p("GO\n")

# 072. ventas.afiliados_influencers (30 influencers)
p("-- 072. TABLA: ventas.afiliados_influencers")
p("SET IDENTITY_INSERT ventas.afiliados_influencers ON;")
p("INSERT INTO ventas.afiliados_influencers (id_afiliado, id_usuario, codigo_promotor_afiliado, porcentaje_comision, cuenta_clabe_interbancaria, banco_destino, total_acumulado_ventas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    usr_id = i
    cod = f"INFLUENCER-SKIN-{i:02d}"
    com = 10.00 + (i % 10)
    clabe = f"01218000{i:010d}"
    banco = "BBVA México" if i % 2 == 0 else "Santander México"
    tot_v = 50000.00 + (i * 2500.00)
    if i == 30:
        rows.append(f"({i}, {usr_id}, N'{cod}', {com:.2f}, '{clabe}', N'{banco}', {tot_v:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {usr_id}, N'{cod}', {com:.2f}, '{clabe}', N'{banco}', {tot_v:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.afiliados_influencers OFF;")
p("GO\n")

# 073. ventas.comisiones_afiliados (30 comisiones)
p("-- 073. TABLA: ventas.comisiones_afiliados")
p("SET IDENTITY_INSERT ventas.comisiones_afiliados ON;")
p("INSERT INTO ventas.comisiones_afiliados (id_comision_afiliado, id_afiliado, id_orden, monto_base_calculo, porcentaje_aplicado, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    afil_id = i
    ord_id = i
    base = 2000.00 + (i * 50.00)
    porc = 10.00
    monto_c = base * (porc / 100.00)
    est = 'PAGADA' if i <= 20 else 'APROBADA'
    fdisp = "SYSDATETIME()" if est == 'PAGADA' else "NULL"
    if i == 30:
        rows.append(f"({i}, {afil_id}, {ord_id}, {base:.2f}, {porc:.2f}, {monto_c:.2f}, N'CANCELADA_POR_DEVOLUCION', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {afil_id}, {ord_id}, {base:.2f}, {porc:.2f}, {monto_c:.2f}, N'{est}', {fdisp}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT ventas.comisiones_afiliados OFF;")
p("GO\n")

# 074. pagos.proveedores_pasarela (30 pasarelas / conectores)
p("-- 074. TABLA: pagos.proveedores_pasarela")
p("SET IDENTITY_INSERT pagos.proveedores_pasarela ON;")
p("INSERT INTO pagos.proveedores_pasarela (id_proveedor_pasarela, codigo_pasarela, nombre_pasarela, api_endpoint_produccion, soporta_tokenizacion, soporta_3d_secure, soporta_spei, soporta_oxxo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
pasarelas = [
    (1, 'STRIPE_MX', 'Stripe Payments México', 'https://api.stripe.com/v1', 1, 1, 0, 1),
    (2, 'MERCADOPAGO_MX', 'Mercado Pago Checkout Pro', 'https://api.mercadopago.com/v1', 1, 1, 1, 1),
    (3, 'OPENPAY_BBVA', 'Openpay by BBVA México', 'https://api.openpay.mx/v1', 1, 1, 1, 1),
    (4, 'CONEKTA_PAY', 'Conekta Pagos México', 'https://api.conekta.io/orders', 1, 1, 1, 1),
    (5, 'PAYPAL_PLUS', 'PayPal Complete Payments MX', 'https://api-m.paypal.com/v2', 1, 1, 0, 0),
    (6, 'STP_SPEI_DIRECT', 'Sistema de Transferencias y Pagos STP', 'https://efws.stp.com.mx/spei/v1', 0, 0, 1, 0),
    (7, 'APLAZO_BNPL', 'Aplazo Buy Now Pay Later', 'https://api.aplazo.mx/v1', 1, 0, 0, 0),
    (8, 'KUESKIPAY_BNPL', 'Kueski Pay Cuotas Sin Tarjeta', 'https://api.kueskipay.com/v1', 1, 0, 0, 0),
    (9, 'CLIP_BUSINESS', 'Clip Checkout Online MX', 'https://api.clip.mx/v2', 1, 1, 0, 0),
    (10, 'OXXO_PAY_API', 'OXXO Pay Referenciado Directo', 'https://api.oxxopay.com/v1', 0, 0, 0, 1),
]
for i in range(11, 31):
    pasarelas.append((i, f'GATEWAY_API_{i:02d}', f'Pasarela de Integración Segura {i}', f'https://api.gateway{i}.com/v1', 1, 1, 1, 1))

rows = []
for i, (id_p, cod, nom, ep, tok, s3d, spei, oxxo) in enumerate(pasarelas):
    if i == 29:
        rows.append(f"({id_p}, N'{cod}', N'{nom}', '{ep}', {tok}, {s3d}, {spei}, {oxxo}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_p}, N'{cod}', N'{nom}', '{ep}', {tok}, {s3d}, {spei}, {oxxo}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.proveedores_pasarela OFF;")
p("GO\n")

# 075. pagos.metodos_pago (30 métodos)
p("-- 075. TABLA: pagos.metodos_pago")
p("SET IDENTITY_INSERT pagos.metodos_pago ON;")
p("INSERT INTO pagos.metodos_pago (id_metodo_pago, codigo_metodo, nombre_metodo, requiere_pasarela, es_monedero_interno, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
metodos = [
    (1, 'TARJETA_CREDITO', 'Tarjeta de Crédito Visa/Mastercard/Amex', 1, 0),
    (2, 'TARJETA_DEBITO', 'Tarjeta de Débito Bancaria', 1, 0),
    (3, 'SPEI_TRANSFERENCIA', 'Transferencia Interbancaria SPEI 24/7', 1, 0),
    (4, 'OXXO_EFECTIVO', 'Pago en Efectivo OXXO Pay', 1, 0),
    (5, 'BILLETERA_SALDO', 'Saldo Monedero Electrónico Interno', 0, 1),
    (6, 'TARJETA_REGALO_GIFTCARD', 'Tarjeta de Regalo Digital', 0, 1),
    (7, 'PAYPAL_ACCOUNT', 'Saldo o Tarjeta vía Cuenta PayPal', 1, 0),
    (8, 'MERCADOPAGO_WALLET', 'Saldo en Cuenta Mercado Pago', 1, 0),
    (9, 'BNPL_APLAZO', 'Aplazo en 5 Quincenas', 1, 0),
    (10, 'BNPL_KUESKI', 'Kueski Pay en Quincenas', 1, 0),
]
for i in range(11, 31):
    metodos.append((i, f'METODO_ESPECIAL_{i:02d}', f'Método de Pago Específico {i}', 1, 0))

rows = []
for i, (id_m, cod, nom, req, es_m) in enumerate(metodos):
    if i == 29:
        rows.append(f"({id_m}, N'{cod}', N'{nom}', {req}, {es_m}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_m}, N'{cod}', N'{nom}', {req}, {es_m}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.metodos_pago OFF;")
p("GO\n")

# 076. pagos.transacciones (30 transacciones)
p("-- 076. TABLA: pagos.transacciones")
p("SET IDENTITY_INSERT pagos.transacciones ON;")
p("INSERT INTO pagos.transacciones (id_transaccion, id_orden, id_proveedor_pasarela, id_metodo_pago, token_autorizacion_pasarela, folio_operacion_bancaria, codigo_autorizacion_banco, monto_transaccion, moneda, codigo_respuesta_http, estado_pago, fecha_transaccion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    pas_id = ((i - 1) % 5) + 1
    met_id = ((i - 1) % 4) + 1
    tok = f"ch_stripe_authtok_{i:05d}_mxn"
    fol = f"FOL-BANXICO-{i:08d}"
    cod_aut = f"AUT{100000 + i}"
    monto = 1500.00 + (i * 100.00)
    est = 'APROBADA' if i <= 26 else ('RECHAZADA' if i <= 28 else 'PENDIENTE')
    code_http = 200 if est == 'APROBADA' else (402 if est == 'RECHAZADA' else 202)
    if i == 30:
        rows.append(f"({i}, {ord_id}, {pas_id}, {met_id}, '{tok}', '{fol}', '{cod_aut}', {monto:.2f}, 'MXN', 400, N'CANCELADA', '2025-01-01 10:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {pas_id}, {met_id}, '{tok}', '{fol}', '{cod_aut}', {monto:.2f}, 'MXN', {code_http}, N'{est}', SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.transacciones OFF;")
p("GO\n")

# 077. pagos.intentos_cobro (30 intentos)
p("-- 077. TABLA: pagos.intentos_cobro")
p("SET IDENTITY_INSERT pagos.intentos_cobro ON;")
p("INSERT INTO pagos.intentos_cobro (id_intento_cobro, id_transaccion, numero_intento, payload_request_sanitizado, payload_response_gateway, fecha_intento, fue_exitoso, mensaje_error_pasarela, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    tx_id = i
    ex = 1 if i <= 26 else 0
    err = "NULL" if ex else "N'Fondos insuficientes o declinación bancaria preventiva'"
    req = f'{{"monto": {1500 + i*100}, "moneda": "MXN", "tx_id": {i}}}'
    resp = f'{{"status": "{"approved" if ex else "failed"}", "code": {200 if ex else 402}}}'
    if i == 30:
        rows.append(f"({i}, {tx_id}, 1, '{req}', '{resp}', '2025-01-01 10:00:00', 0, N'Error de conexión pasarela', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {tx_id}, 1, '{req}', '{resp}', SYSDATETIME(), {ex}, {err}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.intentos_cobro OFF;")
p("GO\n")

# 078. pagos.split_multipagos (30 registros)
p("-- 078. TABLA: pagos.split_multipagos")
p("SET IDENTITY_INSERT pagos.split_multipagos ON;")
p("INSERT INTO pagos.split_multipagos (id_split_pago, id_orden, id_transaccion, monto_fraccionado, id_metodo_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    tx_id = i
    met_id = ((i - 1) % 4) + 1
    monto_f = 750.00 + (i * 50.00)
    if i == 30:
        rows.append(f"({i}, {ord_id}, {tx_id}, {monto_f:.2f}, {met_id}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {tx_id}, {monto_f:.2f}, {met_id}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.split_multipagos OFF;")
p("GO\n")

# 079. pagos.billetera_electronica (30 billeteras)
p("-- 079. TABLA: pagos.billetera_electronica")
p("SET IDENTITY_INSERT pagos.billetera_electronica ON;")
p("INSERT INTO pagos.billetera_electronica (id_billetera, id_cliente, saldo_disponible, fecha_ultima_actualizacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cli = i
    saldo = 100.00 + (i * 25.00)
    if i == 30:
        rows.append(f"({i}, {cli}, 0.00, '2025-01-01 10:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cli}, {saldo:.2f}, SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.billetera_electronica OFF;")
p("GO\n")

# 080. pagos.movimientos_billetera (30 movimientos)
p("-- 080. TABLA: pagos.movimientos_billetera")
p("SET IDENTITY_INSERT pagos.movimientos_billetera ON;")
p("INSERT INTO pagos.movimientos_billetera (id_movimiento_billetera, id_billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, motivo_descripcion, id_orden_referencia, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    b_id = i
    tmov = 'CARGA_SALDO' if i % 2 == 0 else 'BONIFICACION_FIDELIDAD'
    monto = 50.00 + (i * 10.00)
    ant = 100.00
    pos = ant + monto
    mot = f"Bonificación promocional Beauty Club para billetera {b_id}"
    if i == 30:
        rows.append(f"({i}, {b_id}, N'CARGA_SALDO', {monto:.2f}, {ant:.2f}, {pos:.2f}, N'{mot}', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {b_id}, N'{tmov}', {monto:.2f}, {ant:.2f}, {pos:.2f}, N'{mot}', {i}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.movimientos_billetera OFF;")
p("GO\n")

# 081. pagos.tarjetas_regalo_giftcards (30 giftcards)
p("-- 081. TABLA: pagos.tarjetas_regalo_giftcards")
p("SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards ON;")
p("INSERT INTO pagos.tarjetas_regalo_giftcards (id_giftcard, codigo_hash_giftcard, saldo_actual, monto_inicial, fecha_expiracion, id_cliente_comprador, id_cliente_beneficiario, mensaje_personalizado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    c_hash = f"HASH-SHA256-GC-SECRET-{i:04d}"
    ini = 500.00 + (i * 50.00)
    sal = ini - 100.00
    comprador = i
    benef = ((i % 30) + 1)
    msg = f"¡Felicidades! Disfruta de tus productos de cuidado de la piel y cosméticos favoritos."
    if i == 30:
        rows.append(f"({i}, '{c_hash}', 0.00, 500.00, '2025-12-31', {comprador}, {benef}, N'{msg}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, '{c_hash}', {sal:.2f}, {ini:.2f}, '2027-12-31', {comprador}, {benef}, N'{msg}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards OFF;")
p("GO\n")

# 082. pagos.redenciones_giftcards (30 redenciones)
p("-- 082. TABLA: pagos.redenciones_giftcards")
p("SET IDENTITY_INSERT pagos.redenciones_giftcards ON;")
p("INSERT INTO pagos.redenciones_giftcards (id_redencion_giftcard, id_giftcard, id_orden, monto_redimido, fecha_redencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    gc_id = i
    ord_id = i
    monto_r = 100.00
    if i == 30:
        rows.append(f"({i}, {gc_id}, {ord_id}, {monto_r:.2f}, '2025-01-01 10:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {gc_id}, {ord_id}, {monto_r:.2f}, SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.redenciones_giftcards OFF;")
p("GO\n")

# 083. pagos.reglas_antifraude (30 reglas de riesgo)
p("-- 083. TABLA: pagos.reglas_antifraude")
p("SET IDENTITY_INSERT pagos.reglas_antifraude ON;")
p("INSERT INTO pagos.reglas_antifraude (id_regla_antifraude, codigo_regla, nombre_regla, criterio_evaluacion, puntaje_riesgo_asignado, accion_sugerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
reglas = [
    (1, 'AF_IP_PAIS_DISTINTO', 'País de IP Distinto a Tarjeta', 'Dirección IP del cliente no coincide con país emisor del BIN', 35, 'REQUERIR_3D_SECURE'),
    (2, 'AF_VELOCIDAD_ORDENES', 'Velocidad Excesiva de Transacciones', 'Más de 3 pedidos generados en menos de 10 minutos', 50, 'BLOQUEO_TEMPORAL'),
    (3, 'AF_MONTO_ELEVADO', 'Importe Superior a Promedio Histórico', 'Monto de orden mayor a $15,000 MXN en primera compra', 40, 'REVISION_MANUAL'),
    (4, 'AF_TARJETA_INTERNACIONAL', 'Emisión Internacional No Nacional', 'Tarjeta emitida fuera del territorio mexicano', 20, 'SOLICITAR_CVV_DINAMICO'),
    (5, 'AF_INTENTOS_CVV_FALLIDOS', 'Múltiples Errores de Código CVV', 'Más de 2 intentos con código de seguridad incorrecto', 60, 'RECHAZO_AUTOMATICO'),
    (6, 'AF_BIN_PREPAGO_VIRTUAL', 'Tarjeta de Débito Prepago Virtual', 'BIN clasificado como tarjeta desechable no bancarizada', 25, 'VALIDAR_OTP_SMS'),
    (7, 'AF_CORREO_DOMINIO_TEMPORAL', 'Email Desechable o de 10 Minutos', 'Dominio de correo listado en listas negras de spoofing', 75, 'RECHAZO_INMEDIATO'),
    (8, 'AF_DIRECCION_DISCREPANTE', 'Discrepancia Código Postal Factura/Envío', 'Código postal fiscal a más de 500km de domicilio de entrega', 15, 'ALERTA_LOGISTICA'),
    (9, 'AF_DISPOSITIVO_DESCONOCIDO', 'Fingerprint de Dispositivo Nuevo', 'Navegador o equipo nunca antes utilizado por el cliente', 10, 'REGISTRAR_AUDITORIA'),
    (10, 'AF_PROXY_VPN_DETECTADO', 'Conexión vía Nodo Tor o VPN Comercial', 'Tráfico enrutado a través de centros de datos de anonimización', 45, 'REQUERIR_3D_SECURE')
]
for i in range(11, 31):
    reglas.append((i, f'AF_REGLA_ESPECIFICA_{i:02d}', f'Regla Antifraude Especializada {i}', f'Criterio de validación de riesgo biométrico y transaccional {i}', 20 + (i % 30), 'MONITOREO_ESTADISTICO'))

rows = []
for i, (id_r, cod, nom, crit, pts, acc) in enumerate(reglas):
    if i == 29:
        rows.append(f"({id_r}, N'{cod}', N'{nom}', N'{crit}', {pts}, N'{acc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_r}, N'{cod}', N'{nom}', N'{crit}', {pts}, N'{acc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.reglas_antifraude OFF;")
p("GO\n")

# 084. pagos.evaluaciones_antifraude (30 evaluaciones)
p("-- 084. TABLA: pagos.evaluaciones_antifraude")
p("SET IDENTITY_INSERT pagos.evaluaciones_antifraude ON;")
p("INSERT INTO pagos.evaluaciones_antifraude (id_evaluacion_antifraude, id_orden, id_transaccion, score_total_riesgo, nivel_riesgo, direccion_ip_origen, pais_emisor_tarjeta, decision_tomada, regla_detonante_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    tx_id = i
    score = 15 + (i * 2)
    nivel = 'BAJO' if score < 40 else ('MEDIO' if score < 65 else 'ALTO_REQUERIR_3DS')
    ip = f"187.189.{i}.{10 + i}"
    dec = "APROBAR_TRANSACCION" if nivel != 'CRITICO_RECHAZADO' else "DECLINAR_PAGO"
    regla = "AF_DISPOSITIVO_DESCONOCIDO" if nivel == 'BAJO' else "AF_MONTO_ELEVADO"
    if i == 30:
        rows.append(f"({i}, {ord_id}, {tx_id}, 85, N'CRITICO_RECHAZADO', '189.200.1.1', 'RU', N'DECLINAR_PAGO', N'AF_PROXY_VPN_DETECTADO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {tx_id}, {score}, N'{nivel}', '{ip}', 'MX', N'{dec}', N'{regla}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.evaluaciones_antifraude OFF;")
p("GO\n")

# 085. pagos.contracargos_chargebacks (30 contracargos)
p("-- 085. TABLA: pagos.contracargos_chargebacks")
p("SET IDENTITY_INSERT pagos.contracargos_chargebacks ON;")
p("INSERT INTO pagos.contracargos_chargebacks (id_contracargo, id_transaccion, folio_disputa_pasarela, motivo_contracargo, monto_en_disputa, fecha_notificacion_banco, fecha_limite_evidencia, estatus_disputa, documento_evidencia_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    tx_id = i
    fol = f"DISP-PASARELA-{i:06d}"
    mot = "Mercancía no recibida o cargo no reconocido por titular"
    monto = 1200.00 + (i * 50.00)
    est = 'GANADA_POR_COMERCIO' if i % 2 == 0 else 'EN_REVISION'
    doc = f"https://evidencias.ecommerce-salud.mx/contracargos/{i}.pdf"
    if i == 30:
        rows.append(f"({i}, {tx_id}, '{fol}', N'{mot}', {monto:.2f}, '2025-01-01', '2025-01-15', N'PERDIDA_POR_COMERCIO', '{doc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {tx_id}, '{fol}', N'{mot}', {monto:.2f}, '2026-02-01', '2026-02-15', N'{est}', '{doc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.contracargos_chargebacks OFF;")
p("GO\n")

# 086. pagos.reembolsos_transaccion (30 reembolsos)
p("-- 086. TABLA: pagos.reembolsos_transaccion")
p("SET IDENTITY_INSERT pagos.reembolsos_transaccion ON;")
p("INSERT INTO pagos.reembolsos_transaccion (id_reembolso, id_transaccion, monto_reembolsado, motivo_reembolso, folio_reembolso_pasarela, fecha_solicitud_reembolso, fecha_aplicacion_reembolso, id_usuario_aprobador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    tx_id = i
    monto = 500.00 + (i * 20.00)
    mot = f"Devolución parcial de mercancía por garantía de satisfacción {i}"
    fol = f"re_stripe_{i:06d}_refund"
    if i == 30:
        rows.append(f"({i}, {tx_id}, {monto:.2f}, N'{mot}', '{fol}', '2025-01-01', '2025-01-02', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {tx_id}, {monto:.2f}, N'{mot}', '{fol}', SYSDATETIME(), SYSDATETIME(), 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT pagos.reembolsos_transaccion OFF;")
p("GO\n")

# 087. fiscal.regimenes_sat (30 regímenes)
p("-- 087. TABLA: fiscal.regimenes_sat")
p("SET IDENTITY_INSERT fiscal.regimenes_sat ON;")
p("INSERT INTO fiscal.regimenes_sat (id_regimen_sat, clave_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
regimenes = [
    (1, '601', 'General de Ley Personas Morales', 0, 1),
    (2, '603', 'Personas Morales con Fines no Lucrativos', 0, 1),
    (3, '605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios', 1, 0),
    (4, '606', 'Arrendamiento', 1, 0),
    (5, '608', 'Demás ingresos', 1, 0),
    (6, '610', 'Residentes en el Extranjero sin Establecimiento Permanente en México', 1, 1),
    (7, '611', 'Ingresos por Dividendos (socios y accionistas)', 1, 0),
    (8, '612', 'Personas Físicas con Actividades Empresariales y Profesionales', 1, 0),
    (9, '614', 'Ingresos por intereses', 1, 0),
    (10, '616', 'Sin obligaciones fiscales', 1, 0),
    (11, '621', 'Incorporación Fiscal (RIF)', 1, 0),
    (12, '622', 'Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras', 0, 1),
    (13, '623', 'Opcional para Grupos de Sociedades', 0, 1),
    (14, '624', 'Coordinados', 0, 1),
    (15, '625', 'Régimen de las Actividades Empresariales con ingresos a través de Plataformas Tecnológicas', 1, 0),
    (16, '626', 'Régimen Simplificado de Confianza (RESICO)', 1, 1),
]
for i in range(17, 31):
    regimenes.append((i, f'REG-{i+600}', f'Régimen Fiscal Específico SAT {i}', 1, 1))

rows = []
for i, (id_r, clave, desc, pf, pm) in enumerate(regimenes):
    if i == 29:
        rows.append(f"({id_r}, '{clave}', N'{desc}', {pf}, {pm}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_r}, '{clave}', N'{desc}', {pf}, {pm}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.regimenes_sat OFF;")
p("GO\n")

# 088. fiscal.usos_cfdi (30 usos de CFDI)
p("-- 088. TABLA: fiscal.usos_cfdi")
p("SET IDENTITY_INSERT fiscal.usos_cfdi ON;")
p("INSERT INTO fiscal.usos_cfdi (id_uso_cfdi, clave_uso_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
usos = [
    (1, 'G01', 'Adquisición de mercancías', 1, 1),
    (2, 'G02', 'Devoluciones, descuentos o bonificaciones', 1, 1),
    (3, 'G03', 'Gastos en general', 1, 1),
    (4, 'I01', 'Construcciones', 1, 1),
    (5, 'I02', 'Mobiliario y equipo de oficina por inversiones', 1, 1),
    (6, 'I03', 'Equipo de transporte', 1, 1),
    (7, 'I04', 'Equipo de computo y accesorios', 1, 1),
    (8, 'I05', 'Dados, troqueles, moldes, matrices y herramental', 1, 1),
    (9, 'I06', 'Comunicaciones telefónicas', 1, 1),
    (10, 'I07', 'Comunicaciones satelitales', 1, 1),
    (11, 'I08', 'Otra maquinaria y equipo', 1, 1),
    (12, 'D01', 'Honorarios médicos, dentales y gastos hospitalarios', 1, 0),
    (13, 'D02', 'Gastos médicos por incapacidad o discapacidad', 1, 0),
    (14, 'D03', 'Gastos funerales', 1, 0),
    (15, 'D04', 'Donativos', 1, 0),
    (16, 'D05', 'Intereses reales efectivamente pagados por créditos hipotecarios', 1, 0),
    (17, 'D06', 'Aportaciones voluntarias al SAR', 1, 0),
    (18, 'D07', 'Primas por seguros de gastos médicos', 1, 0),
    (19, 'D08', 'Gastos de transportación escolar obligatoria', 1, 0),
    (20, 'D09', 'Depósitos en cuentas personales especiales para el ahorro', 1, 0),
    (21, 'D10', 'Pagos por servicios educativos (colegiaturas)', 1, 0),
    (22, 'S01', 'Sin efectos fiscales', 1, 1),
    (23, 'CP01', 'Pagos (Complemento de Recepción de Pagos REP)', 1, 1),
    (24, 'CN01', 'Nómina', 1, 0),
]
for i in range(25, 31):
    usos.append((i, f'U{i:02d}', f'Uso de CFDI Complementario {i}', 1, 1))

rows = []
for i, (id_u, clave, desc, pf, pm) in enumerate(usos):
    if i == 29:
        rows.append(f"({id_u}, '{clave}', N'{desc}', {pf}, {pm}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_u}, '{clave}', N'{desc}', {pf}, {pm}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.usos_cfdi OFF;")
p("GO\n")

# 089. fiscal.datos_fiscales_cliente (30 datos fiscales)
p("-- 089. TABLA: fiscal.datos_fiscales_cliente")
p("SET IDENTITY_INSERT fiscal.datos_fiscales_cliente ON;")
p("INSERT INTO fiscal.datos_fiscales_cliente (id_datos_fiscales, id_cliente, rfc_receptor, razon_social_receptor, codigo_postal_fiscal, id_regimen_sat, id_uso_cfdi_preferente, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rfcs = [
    ('XAXX010101000', 'PUBLICO EN GENERAL'),
    ('ROVV920315HR8', 'VALERIA RODRIGUEZ VAZQUEZ'),
    ('HEHS880720KL2', 'SANTIAGO HERNANDEZ SILVA'),
    ('LOMG951104PL9', 'GABRIELA LOPEZ MARTINEZ'),
    ('GARM900214MJ3', 'CARLOS GARCIA MORALES'),
    ('PEFR850930TR1', 'FERNANDA PEREZ RAMIREZ'),
    ('TOSA930612BV4', 'ALEJANDRO TORRES SALAZAR'),
    ('MOSL970405NB7', 'LUCIA MORENO SANCHEZ'),
    ('CAGR910818VC8', 'ROBERTO CASTILLO GONZALEZ'),
    ('RAME891225ZX9', 'ELENA RAMIREZ MEDINA'),
]
for i in range(11, 31):
    rfcs.append((f'RFC{i:02d}800101A{i%10}X', f'CLIENTE FISCAL EMPRESARIAL {i} SA DE CV'))

rows = []
for i in range(1, 31):
    cli = i
    rfc, rz = rfcs[i - 1]
    cp = f"{25700 + (i % 50)}"
    reg = 8 if i <= 15 else 16
    uso = 1 if i % 2 == 0 else 3
    email_f = f"facturacion.cliente{i}@correo.com"
    if i == 30:
        rows.append(f"({i}, {cli}, '{rfc}', N'{rz}', '{cp}', {reg}, {uso}, '{email_f}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cli}, '{rfc}', N'{rz}', '{cp}', {reg}, {uso}, '{email_f}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.datos_fiscales_cliente OFF;")
p("GO\n")

# 090. fiscal.facturas_cfdi (30 facturas CFDI 4.0)
p("-- 090. TABLA: fiscal.facturas_cfdi")
p("SET IDENTITY_INSERT fiscal.facturas_cfdi ON;")
p("INSERT INTO fiscal.facturas_cfdi (id_factura_cfdi, id_orden, id_datos_fiscales, serie_cfdi, folio_cfdi, uuid_sat, sello_digital_emisor, sello_digital_sat, cadena_original_sat, fecha_timbrado, rfc_proveedor_certificacion, version_cfdi, total_facturado, url_xml_almacenado, url_pdf_almacenado, estado_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    df_id = i
    serie = "FAC"
    folio = 1000 + i
    uuid_sat = f"4FA8E5B1-9C32-4E12-88B{i:02d}-7F18239A{i:04d}"
    sello_e = f"SELLO_EMISOR_RSA2048_{i:04d}_FIRMA_DIGITAL_SAT"
    sello_s = f"SELLO_TIMBRE_PAC_SAT_{i:04d}_CERTIFICADO"
    cadena = f"||4.0|FAC|{folio}|{uuid_sat}||"
    tot = 1740.00 + (i * 116.00)
    xml = f"https://cfdi.ecommerce-salud.mx/xml/{uuid_sat}.xml"
    pdf = f"https://cfdi.ecommerce-salud.mx/pdf/{uuid_sat}.pdf"
    est = 'TIMBRADA_VIGENTE' if i <= 28 else 'CANCELADA_SAT'
    if i == 30:
        rows.append(f"({i}, {ord_id}, {df_id}, '{serie}', {folio}, '{uuid_sat}', '{sello_e}', '{sello_s}', '{cadena}', '2025-01-01 10:00:00', 'SAT970701NN3', '4.0', {tot:.2f}, '{xml}', '{pdf}', N'CANCELADA_SAT', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, {df_id}, '{serie}', {folio}, '{uuid_sat}', '{sello_e}', '{sello_s}', '{cadena}', SYSDATETIME(), 'SAT970701NN3', '4.0', {tot:.2f}, '{xml}', '{pdf}', N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.facturas_cfdi OFF;")
p("GO\n")

# 091. fiscal.facturas_partidas (30 partidas CFDI)
p("-- 091. TABLA: fiscal.facturas_partidas")
p("SET IDENTITY_INSERT fiscal.facturas_partidas ON;")
p("INSERT INTO fiscal.facturas_partidas (id_factura_partida, id_factura_cfdi, clave_prod_serv_sat, clave_unidad_sat, cantidad, descripcion_concepto, valor_unitario, importe, descuento, objeto_impuesto_sat, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fac_id = i
    clave_sat = '53131600' # Clave SAT oficial: Cosméticos y productos de cuidado personal
    c_uni = 'H87' # Pieza
    cant = 1
    val = 1500.00 + (i * 100.00)
    desc = f"Venta de producto dermocosmético certificado según partida {i}"
    if i == 30:
        rows.append(f"({i}, {fac_id}, '{clave_sat}', '{c_uni}', {cant}, N'{desc}', {val:.2f}, {val:.2f}, 0.00, '02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {fac_id}, '{clave_sat}', '{c_uni}', {cant}, N'{desc}', {val:.2f}, {val:.2f}, 0.00, '02', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.facturas_partidas OFF;")
p("GO\n")

# 092. fiscal.complementos_pago (30 REP)
p("-- 092. TABLA: fiscal.complementos_pago")
p("SET IDENTITY_INSERT fiscal.complementos_pago ON;")
p("INSERT INTO fiscal.complementos_pago (id_complemento_pago, id_factura_cfdi, id_transaccion, folio_rep_cfdi, uuid_rep_sat, fecha_pago_real, monto_pagado_rep, numero_parcialidad, saldo_anterior_insoluto, saldo_insoluto_restante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fac_id = i
    tx_id = i
    folio_rep = f"REP-{i:06d}"
    uuid_rep = f"REP8E5B1-9C32-4E12-88B{i:02d}-7F18239A{i:04d}"
    monto_p = 1740.00 + (i * 116.00)
    if i == 30:
        rows.append(f"({i}, {fac_id}, {tx_id}, '{folio_rep}', '{uuid_rep}', '2025-01-01', {monto_p:.2f}, 1, {monto_p:.2f}, 0.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {fac_id}, {tx_id}, '{folio_rep}', '{uuid_rep}', SYSDATETIME(), {monto_p:.2f}, 1, {monto_p:.2f}, 0.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.complementos_pago OFF;")
p("GO\n")

# 093. fiscal.notas_credito (30 notas de crédito)
p("-- 093. TABLA: fiscal.notas_credito")
p("SET IDENTITY_INSERT fiscal.notas_credito ON;")
p("INSERT INTO fiscal.notas_credito (id_nota_credito, id_factura_cfdi, folio_nc_cfdi, uuid_nc_sat, fecha_timbrado_nc, monto_total_nc, motivo_emision, url_xml_nc, url_pdf_nc, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fac_id = i
    folio_nc = f"NC-{i:06d}"
    uuid_nc = f"NC08E5B1-9C32-4E12-88B{i:02d}-7F18239A{i:04d}"
    monto_nc = 250.00 + (i * 10.00)
    mot = f"Bonificación comercial o devolución de mercancía autorizada partida {i}"
    xml = f"https://cfdi.ecommerce-salud.mx/nc/xml/{uuid_nc}.xml"
    pdf = f"https://cfdi.ecommerce-salud.mx/nc/pdf/{uuid_nc}.pdf"
    if i == 30:
        rows.append(f"({i}, {fac_id}, '{folio_nc}', '{uuid_nc}', '2025-01-01', {monto_nc:.2f}, N'{mot}', '{xml}', '{pdf}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {fac_id}, '{folio_nc}', '{uuid_nc}', SYSDATETIME(), {monto_nc:.2f}, N'{mot}', '{xml}', '{pdf}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.notas_credito OFF;")
p("GO\n")

# 094. fiscal.cancelaciones_cfdi (30 cancelaciones SAT)
p("-- 094. TABLA: fiscal.cancelaciones_cfdi")
p("SET IDENTITY_INSERT fiscal.cancelaciones_cfdi ON;")
p("INSERT INTO fiscal.cancelaciones_cfdi (id_cancelacion_cfdi, id_factura_cfdi, motivo_cancelacion_sat, uuid_sustitucion_sat, fecha_solicitud_cancelacion, acuse_cancelacion_sat_url, estado_solicitud_sat, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fac_id = i
    mot_sat = '02' if i % 2 == 0 else '01'
    uuid_sust = f"SUST-UUID-SAT-{i:06d}-2026" if mot_sat == '01' else "NULL"
    uuid_sust_val = f"'{uuid_sust}'" if mot_sat == '01' else "NULL"
    acuse = f"https://cfdi.ecommerce-salud.mx/acuses/canc_{i}.pdf"
    est_sat = "CANCELADO_PLAZO_CUMPLIDO"
    if i == 30:
        rows.append(f"({i}, {fac_id}, '03', NULL, '2025-01-01', '{acuse}', N'NO_SE_LLEVO_A_CABO_LA_OPERACION', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {fac_id}, '{mot_sat}', {uuid_sust_val}, SYSDATETIME(), '{acuse}', N'{est_sat}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT fiscal.cancelaciones_cfdi OFF;")
p("GO\n")

# 095. promos.campanias (30 campañas)
p("-- 095. TABLA: promos.campanias")
p("SET IDENTITY_INSERT promos.campanias ON;")
p("INSERT INTO promos.campanias (id_campania, codigo_campania, nombre_campania, descripcion, fecha_inicio, fecha_fin, presupuesto_maximo_descuento, total_descuento_otorgado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
campanias = [
    (1, 'CAMP-HOTSALE-2026', 'Hot Sale Dermocosmética 2026', 'Campaña nacional de descuentos en protectores solares y sueros', '2026-05-15', '2026-05-23', 500000.00, 125000.00),
    (2, 'CAMP-BUENFIN-2026', 'El Buen Fin Salud y Belleza 2026', 'Promociones anuales en maquillaje y rutinas antiedad completas', '2026-11-13', '2026-11-16', 750000.00, 210000.00),
    (3, 'CAMP-SUMMER-SPF', 'Verano Seguro Blindaje Solar', 'Incentivos de fotoprotección y kits playeros dermatológicos', '2026-06-01', '2026-08-31', 300000.00, 85000.00),
    (4, 'CAMP-SPRING-GLOW', 'Primavera Radiante K-Beauty', 'Lanzamiento de hidratantes ligeros y esencias de baba de caracol', '2026-03-21', '2026-04-30', 250000.00, 45000.00),
    (5, 'CAMP-WINTER-BARRIER', 'Invierno Reparación de Barrera Cutánea', 'Foco en ceramidas y cremas humectantes contra resequedad extrema', '2026-12-01', '2027-02-28', 400000.00, 95000.00),
]
for i in range(6, 31):
    campanias.append((i, f'CAMP-PROMO-{i:02d}-2026', f'Campaña Promocional Especializada {i}', f'Promoción dirigida a nicho cosmético y de salud dermatológica nivel {i}', '2026-01-01', '2026-12-31', 150000.00, 20000.00))

rows = []
for i, (id_c, cod, nom, desc, fi, ff, pmax, tot_o) in enumerate(campanias):
    if i == 29:
        rows.append(f"({id_c}, N'{cod}', N'{nom}', N'{desc}', '{fi}', '{ff}', {pmax:.2f}, {tot_o:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_c}, N'{cod}', N'{nom}', N'{desc}', '{fi}', '{ff}', {pmax:.2f}, {tot_o:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT promos.campanias OFF;")
p("GO\n")

# 096. promos.cupones (30 cupones)
p("-- 096. TABLA: promos.cupones")
p("SET IDENTITY_INSERT promos.cupones ON;")
p("INSERT INTO promos.cupones (id_cupon, id_campania, codigo_cupon, descripcion, tipo_descuento_valor, valor_descuento, compra_minima_requerida, tope_maximo_descuento, limite_usos_global, usos_actuales_acumulados, limite_usos_por_cliente, fecha_vigencia_inicio, fecha_vigencia_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
cupones = [
    (1, 1, 'GLOW20', '20% de descuento en categoría de cuidado facial', 'PORCENTAJE', 20.00, 899.00, 500.00, 1000, 342, 1),
    (2, 1, 'DERMO15', '15% de descuento en protectores solares y agua micelar', 'PORCENTAJE', 15.00, 599.00, 300.00, 2000, 810, 2),
    (3, 2, 'BUENFIN100', '$100 MXN de descuento directo en compras mayores a $1,000', 'MONTO_FIJO', 100.00, 1000.00, 100.00, 5000, 1240, 1),
    (4, 3, 'FREESHIPVERANO', 'Envío gratis en protectores solares ISDIN y Beauty of Joseon', 'ENVIO_GRATIS', 149.00, 499.00, 149.00, 3000, 950, 3),
    (5, 4, 'KBEAUTY25', '25% de descuento en marcas coreanas Cosrx y Joseon', 'PORCENTAJE', 25.00, 799.00, 600.00, 1500, 420, 1),
]
for i in range(6, 31):
    cupones.append((i, ((i-1)%5)+1, f'CUPONPROMO{i:02d}', f'Cupón promocional de salud y belleza {i}', 'PORCENTAJE', 10.00 + (i%15), 500.00, 300.00, 1000, 50, 1))

rows = []
for i, (id_cup, id_camp, cod, desc, tval, val, cmin, tope, l_glob, u_acum, l_cli) in enumerate(cupones):
    if i == 29:
        rows.append(f"({id_cup}, {id_camp}, N'{cod}', N'{desc}', N'{tval}', {val:.2f}, {cmin:.2f}, {tope:.2f}, {l_glob}, {u_acum}, {l_cli}, '2025-01-01', '2025-02-01', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_cup}, {id_camp}, N'{cod}', N'{desc}', N'{tval}', {val:.2f}, {cmin:.2f}, {tope:.2f}, {l_glob}, {u_acum}, {l_cli}, '2026-01-01', '2026-12-31', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT promos.cupones OFF;")
p("GO\n")

# 097. promos.reglas_elegibilidad_cupon (30 registros)
p("-- 097. TABLA: promos.reglas_elegibilidad_cupon")
p("SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon ON;")
p("INSERT INTO promos.reglas_elegibilidad_cupon (id_regla_cupon, id_cupon, requiere_primera_compra, aplica_solo_clientes_vip, aplica_solo_marcas_seleccionadas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cup_id = i
    pcomp = 1 if i % 5 == 0 else 0
    vip = 1 if i % 7 == 0 else 0
    marcas = 1 if i % 3 == 0 else 0
    if i == 30:
        rows.append(f"({i}, {cup_id}, 1, 0, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cup_id}, {pcomp}, {vip}, {marcas}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon OFF;")
p("GO\n")

# 098. promos.cupones_categorias_excluidas (30 registros)
p("-- 098. TABLA: promos.cupones_categorias_excluidas")
p("SET IDENTITY_INSERT promos.cupones_categorias_excluidas ON;")
p("INSERT INTO promos.cupones_categorias_excluidas (id_cupon_exclusion, id_cupon, id_categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cup_id = i
    cat_id = ((i - 1) % 5) + 1 # Categorías 1 a 5 de catálogo
    if i == 30:
        rows.append(f"({i}, {cup_id}, {cat_id}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cup_id}, {cat_id}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT promos.cupones_categorias_excluidas OFF;")
p("GO\n")

# 099. promos.redenciones_cupones (30 registros)
p("-- 099. TABLA: promos.redenciones_cupones")
p("SET IDENTITY_INSERT promos.redenciones_cupones ON;")
p("INSERT INTO promos.redenciones_cupones (id_redencion_cupon, id_cupon, id_cliente, id_orden, fecha_redencion, monto_descuento_aplicado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cup_id = i
    cli = i
    ord_id = i
    monto_d = 100.00 + (i * 10.00)
    if i == 30:
        rows.append(f"({i}, {cup_id}, {cli}, {ord_id}, '2025-01-01 10:00:00', {monto_d:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {cup_id}, {cli}, {ord_id}, SYSDATETIME(), {monto_d:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT promos.redenciones_cupones OFF;")
p("GO\n")

# 100. promos.ventas_flash_horarias (30 ventas flash)
p("-- 100. TABLA: promos.ventas_flash_horarias")
p("SET IDENTITY_INSERT promos.ventas_flash_horarias ON;")
p("INSERT INTO promos.ventas_flash_horarias (id_venta_flash, id_variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, es_exclusivo_app, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    sku_id = ((i - 1) % 30) + 1
    precio_f = prices[sku_id - 1] * 0.70 # 30% off en venta flash
    stock_dest = 50 + (i * 5)
    stock_vend = 25 + (i * 2)
    es_app = 1 if i % 2 == 0 else 0
    if i == 30:
        rows.append(f"({i}, {sku_id}, {precio_f:.2f}, 20, 20, '2025-01-01 12:00:00', '2025-01-01 18:00:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {sku_id}, {precio_f:.2f}, {stock_dest}, {stock_vend}, '2026-11-13 12:00:00', '2026-11-13 18:00:00', {es_app}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT promos.ventas_flash_horarias OFF;")
p("GO\n")

p("PRINT '=================================================================================================';")
p("PRINT 'ÉXITO TOTAL: Se han insertado con éxito las 50 tablas del Submódulo 2 (Integrante 2).';")
p("PRINT 'Total de tablas pobladas: 50 (051 a 100) | Registros por tabla: >= 30 | Integridad y Auditoría Activa.';")
p("PRINT '=================================================================================================';")
p("GO\n")

with open(output_path, "w", encoding="utf-8") as f:
    f.writelines(out)

print(f"Submódulo 2 generado exitosamente: {output_path}")
print(f"Tamaño: {len(''.join(out))} caracteres.")
