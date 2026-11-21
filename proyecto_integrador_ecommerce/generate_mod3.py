# -*- coding: utf-8 -*-
"""
Generador de Datos Semilla para Submódulo 3 (Tablas 101 a 150)
Autor: Integrante 3 (Compras, WMS, Cadena de Frío, Envíos, RMA, Farmacovigilancia COFEPRIS y Auditoría Forense)
"""
import sys

output_path = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\03_dml_modulo_logistica_inventario_alu3.sql"

out = []

def p(s):
    out.append(s + "\n")

p("-- =================================================================================================")
p("-- PROYECTO INTEGRADOR V - SISTEMA E-COMMERCE DE SALUD, BELLEZA Y CUIDADO DERMATOLÓGICO")
p("-- SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVÍOS, RMA Y AUDITORÍA FORENSE")
p("-- AUTOR RESPONSABLE: INTEGRANTE 3 (TABLAS 101 A 150)")
p("-- ESTÁNDAR: IDENTITY_INSERT EXPLÍCITO, >= 30 REGISTROS POR TABLA, AUDITORÍA Y SOFT DELETE")
p("-- =================================================================================================")
p("USE ecom_belleza_salud;")
p("GO\n")

# 101. compras.estados_orden_compra (30 estados de OC)
p("-- 101. TABLA: compras.estados_orden_compra")
p("SET IDENTITY_INSERT compras.estados_orden_compra ON;")
p("INSERT INTO compras.estados_orden_compra (id_estado_oc, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
estados_oc = [
    (1, 'BORRADOR', 'Orden de Compra en Borrador', 'Requisición aprobada en proceso de consolidación de partidas'),
    (2, 'EMITIDA_A_PROVEEDOR', 'Emitida y Enviada a Proveedor', 'Orden transmitida formalmente al laboratorio fabricante vía EDI/PDF'),
    (3, 'CONFIRMADA_POR_PROVEEDOR', 'Confirmada con Fecha Promesa', 'Laboratorio confirma existencia de materias primas y fecha de embarque'),
    (4, 'EN_FABRICACION_LOTE', 'En Producción y Envasado', 'Productos en línea de llenado estéril y loteado en planta'),
    (5, 'EN_INSPECCION_ORIGEN', 'Inspección de Calidad en Origen', 'Auditoría microbiológica previa a liberación del embarque internacional'),
    (6, 'EN_TRANSITO_MARITIMO', 'En Tránsito Marítimo Internacional', 'Contenedor en ruta hacia puerto de Manzanillo o Veracruz'),
    (7, 'EN_TRANSITO_AEREO', 'En Tránsito Aéreo Express', 'Embarque de alta urgencia en vuelo internacional de carga'),
    (8, 'EN_DESPACHO_ADUANAL', 'En Aduana / Reconocimiento Aduanero', 'Revisión arancelaria y de etiquetado sanitario COFEPRIS en frontera'),
    (9, 'LIBERADA_DE_ADUANA', 'Pedimento Aduanal Concluido', 'Mercancía importada legalmente en traslado carretero a CEDIS'),
    (10, 'ARRIBO_A_CEDIS', 'Arribada a Andén de CEDIS', 'Transportista en patio de maniobras en espera de turno de descarga'),
    (11, 'EN_DESCARGA_Y_CONTEO', 'En Descarga y Cotejo de Bultos', 'Personal de almacén validando tarimas contra remisión oficial'),
    (12, 'RETENIDA_CUARENTENA_QA', 'Retenida en Cuarentena Sanitaria', 'Muestreo aleatorio de control de calidad por químicos farmacéuticos'),
    (13, 'APROBADA_POR_QA', 'Dictamen Sanitario Favorable', 'Lote liberado microbiológicamente con COA (Certificate of Analysis)'),
    (14, 'RECHAZADA_POR_QA', 'Rechazada por No Conformidad', 'Producto retenido por contaminación, envase fracturado o caducidad corta'),
    (15, 'RECIBIDA_COMPLETA', 'Recibida Íntegramente al 100%', 'Todas las unidades pactadas ingresadas al inventario disponible'),
    (16, 'RECIBIDA_CON_FALTANTE', 'Recibida con Faltante de Piezas', 'Recepción parcial con nota de crédito requerida al proveedor'),
    (17, 'RECIBIDA_CON_MERMA', 'Recibida con Daño de Frascos', 'Frascos rotos o derrames de sueros durante el transporte'),
    (18, 'CERRADA_LIQUIDADA', 'Cerrada y Factura Contabilizada', 'Factura de compra autorizada y dispersada por cuentas por pagar'),
    (19, 'CANCELADA_POR_PROVEEDOR', 'Cancelada por Desabasto Fabricante', 'Proveedor declara falta de ingredientes activos INCI'),
    (20, 'CANCELADA_POR_COMPRADOR', 'Cancelada por Retraso Injustificado', 'Incumplimiento de SLA contractual superior a 30 días'),
    (21, 'DISPUTA_COMERCIAL_ABIERTA', 'En Mediación por Discrepancia', 'Diferencia en costos unitarios negociados vs factura final'),
    (22, 'EN_CUARENTENA_CADUCIDAD', 'Retenida por Caducidad Límite', 'Vida de anaquel menor a 12 meses; sujeta a descuento extraordinario'),
    (23, 'REORDEN_AUTOMATICA_MINMAX', 'Reorden por Algoritmo Min/Max', 'Generada automáticamente al cruzar punto de reorden en WMS'),
    (24, 'PROGRAMADA_ENTREGA_CONSIGNACION', 'Bajo Esquema de Consignación', 'Stock custodiado en CEDIS con pago contra venta efectiva'),
    (25, 'AUDITADA_POR_COFEPRIS', 'Muestra Retenida por Autoridad Sanitaria', 'Lote sujeto a verificación oficial aleatoria del gobierno'),
    (26, 'EN_REACONDICIONAMIENTO_ETIQUETA', 'Reetiquetado Norma NOM-141', 'Pegado de marbetes en español de ingredientes y advertencias'),
    (27, 'EN_TRASLADO_INTERNO_CEDIS', 'Traslado entre Almacenes Centrales', 'Movimiento en tránsito entre CEDIS Monterrey y CEDIS CDMX'),
    (28, 'RECEPCION_EXTEMPORANEA', 'Aceptada Fuera de Plazo Contractual', 'Ingresada con penalización pactada por día de mora'),
    (29, 'EXPEDIENTE_ARCHIVADO_HISTORICO', 'Expediente Físico y Fiscal Archivado', 'Trazabilidad concluida y guardada por 5 años conforme al CFF'),
    (30, 'ESTADO_OC_OBSOLETO_TEST', 'Estado de Compra Descontinuado', 'Registro legado de arquitectura anterior dado de baja')
]
rows = []
for i, (id_e, cod, nom, desc) in enumerate(estados_oc):
    if i == 29:
        rows.append(f"({id_e}, N'{cod}', N'{nom}', N'{desc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_e}, N'{cod}', N'{nom}', N'{desc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.estados_orden_compra OFF;")
p("GO\n")

# 102. compras.proveedores (30 proveedores)
p("-- 102. TABLA: compras.proveedores")
p("SET IDENTITY_INSERT compras.proveedores ON;")
p("INSERT INTO compras.proveedores (id_proveedor, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
proveedores = [
    (1, 'PROV-LOREAL-MX', 'L OREAL MEXICO SA DE CV', 'L Oréal Cosmética Activa', 'OME820512KL1', 'MEX', 60, 98.50),
    (2, 'PROV-ISDIN-CORP', 'ISDIN MEXICO DISTRIBUIDORA SA DE CV', 'Laboratorios ISDIN', 'ISD950314HR2', 'ESP', 45, 99.00),
    (3, 'PROV-DECIEM-CA', 'DECIEM THE ORDINARY AMERICAS INC', 'DECIEM The Ordinary', 'DEC160822PL9', 'CAN', 30, 95.00),
    (4, 'PROV-PIERRE-FABRE', 'PIERRE FABRE DERMO-COSMETIQUE SA', 'Laboratorios Avène / Ducray', 'PFD901103BC4', 'FRA', 60, 99.50),
    (5, 'PROV-NAOS-BIODERMA', 'NAOS BIODERMA MEXICO SA DE CV', 'Bioderma Laboratoire', 'NBM010419TR8', 'FRA', 45, 98.00),
    (6, 'PROV-BEIERSDORF', 'BEIERSDORF SA DE CV', 'Eucerin México', 'BEI601025JH7', 'DEU', 60, 97.50),
    (7, 'PROV-ESTEE-LAUDER', 'ESTEE LAUDER COSMETICOS SA DE CV', 'Estée Lauder / Clinique / MAC', 'ELC700215MN3', 'USA', 60, 98.00),
    (8, 'PROV-KBEAUTY-SEOUL', 'SEOUL COSMETICS GLOBAL TRADING CO', 'Cosrx & Beauty of Joseon Global', 'SCG180910KL4', 'KOR', 30, 96.50),
    (9, 'PROV-FENTY-CORP', 'FENTY BEAUTY INTERNATIONAL LLC', 'Fenty Beauty by Rihanna', 'FBI170908AB1', 'USA', 45, 95.50),
    (10, 'PROV-RARE-BEAUTY', 'RARE BEAUTY BRANDS INC', 'Rare Beauty by Selena Gomez', 'RBB200222CD5', 'USA', 45, 96.00),
]
for i in range(11, 31):
    proveedores.append((i, f'PROV-ESPECIAL-{i:02d}', f'DISTRIBUIDORA FARMACEUTICA Y DERMO {i} SA DE CV', f'Dermo Distribuciones {i}', f'DFD{i:02d}0101AB{i%10}', 'MEX', 30 + (i%30), 90.00 + (i%10)))

rows = []
for i, (id_p, cod, rz, nc, rfc, pais, dias, calif) in enumerate(proveedores):
    if i == 29:
        rows.append(f"({id_p}, N'{cod}', N'{rz}', N'{nc}', '{rfc}', '{pais}', {dias}, {calif:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_p}, N'{cod}', N'{rz}', N'{nc}', '{rfc}', '{pais}', {dias}, {calif:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.proveedores OFF;")
p("GO\n")

# 103. compras.contactos_proveedor (30 contactos)
p("-- 103. TABLA: compras.contactos_proveedor")
p("SET IDENTITY_INSERT compras.contactos_proveedor ON;")
p("INSERT INTO compras.contactos_proveedor (id_contacto_proveedor, id_proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    prov_id = i
    nom = f"Lic. Representante Comercial {i}"
    cargo = "Gerente de Cuentas Clave Retail" if i % 2 == 0 else "Director de Cadena de Suministro"
    email = f"contacto.comercial{i}@proveedor.com"
    tel = f"+52 55 5000 {1000 + i}"
    if i == 30:
        rows.append(f"({i}, {prov_id}, N'{nom}', N'{cargo}', '{email}', '{tel}', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {prov_id}, N'{nom}', N'{cargo}', '{email}', '{tel}', 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.contactos_proveedor OFF;")
p("GO\n")

# 104. compras.proveedor_slas (30 acuerdos SLA)
p("-- 104. TABLA: compras.proveedor_slas")
p("SET IDENTITY_INSERT compras.proveedor_slas ON;")
p("INSERT INTO compras.proveedor_slas (id_proveedor_sla, id_proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    prov_id = i
    dias = 5 + (i % 15)
    tol = 1.00 + (i % 3) * 0.5
    pen = 0.50 + (i % 4) * 0.25
    if i == 30:
        rows.append(f"({i}, {prov_id}, {dias}, {tol:.2f}, {pen:.2f}, '2025-12-31', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {prov_id}, {dias}, {tol:.2f}, {pen:.2f}, '2027-12-31', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.proveedor_slas OFF;")
p("GO\n")

# 105. compras.proveedor_productos (30 vínculos comerciales)
p("-- 105. TABLA: compras.proveedor_productos")
p("SET IDENTITY_INSERT compras.proveedor_productos ON;")
p("INSERT INTO compras.proveedor_productos (id_proveedor_producto, id_proveedor, id_variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    prov_id = i
    sku_id = ((i - 1) % 30) + 1
    cod_art = f"ART-PROV-{prov_id:03d}-SKU{sku_id:03d}"
    costo = 250.00 + (i * 20.00)
    lote_min = 24 if i % 2 == 0 else 48
    if i == 30:
        rows.append(f"({i}, {prov_id}, {sku_id}, N'{cod_art}', {costo:.2f}, {lote_min}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {prov_id}, {sku_id}, N'{cod_art}', {costo:.2f}, {lote_min}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.proveedor_productos OFF;")
p("GO\n")

# 106. compras.requisiciones (30 requisiciones)
p("-- 106. TABLA: compras.requisiciones")
p("SET IDENTITY_INSERT compras.requisiciones ON;")
p("INSERT INTO compras.requisiciones (id_requisicion, folio_requisicion, id_almacen_solicitante, id_usuario_solicitante, fecha_solicitud, prioridad, justificacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fol = f"REQ-2026-{i:05d}"
    alm_id = ((i - 1) % 5) + 1
    usr_id = 1
    prio = 'URGENTE_DESABASTO' if i % 5 == 0 else ('MEDIA' if i % 2 == 0 else 'BAJA')
    just = f"Reabastecimiento de stock de seguridad para temporada de alta demanda dermatológica requerimiento {i}"
    if i == 30:
        rows.append(f"({i}, N'{fol}', {alm_id}, {usr_id}, '2025-01-01', N'BAJA', N'Requisición obsoleta de prueba', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{fol}', {alm_id}, {usr_id}, '2026-02-01', N'{prio}', N'{just}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.requisiciones OFF;")
p("GO\n")

# 107. compras.requisiciones_detalles (30 partidas de requisición)
p("-- 107. TABLA: compras.requisiciones_detalles")
p("SET IDENTITY_INSERT compras.requisiciones_detalles ON;")
p("INSERT INTO compras.requisiciones_detalles (id_requisicion_detalle, id_requisicion, id_variante_sku, cantidad_requerida, fecha_requerida_en_cedis, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    req_id = i
    sku_id = ((i - 1) % 30) + 1
    cant = 50 + (i * 10)
    if i == 30:
        rows.append(f"({i}, {req_id}, {sku_id}, {cant}, '2025-01-15', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {req_id}, {sku_id}, {cant}, '2026-03-01', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.requisiciones_detalles OFF;")
p("GO\n")

# 108. compras.ordenes_compra (30 órdenes de compra a proveedores)
p("-- 108. TABLA: compras.ordenes_compra")
p("SET IDENTITY_INSERT compras.ordenes_compra ON;")
p("INSERT INTO compras.ordenes_compra (id_orden_compra, folio_oc, id_proveedor, id_estado_oc, fecha_emision_oc, fecha_compromiso_entrega, subtotal_oc, iva_oc, total_oc, notas_oc, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fol = f"OC-2026-{i:05d}"
    prov_id = i
    est_id = 15 if i <= 20 else (2 if i <= 28 else 19)
    sub = 25000.00 + (i * 1000.00)
    iva = sub * 0.16
    tot = sub + iva
    notas = f"Entrega con tarimas selladas y COA original de laboratorio lote {i}"
    if i == 30:
        rows.append(f"({i}, N'{fol}', {prov_id}, 19, '2025-01-01', '2025-01-20', {sub:.2f}, {iva:.2f}, {tot:.2f}, N'Cancelada por desabasto', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{fol}', {prov_id}, {est_id}, '2026-02-05', '2026-02-25', {sub:.2f}, {iva:.2f}, {tot:.2f}, N'{notas}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.ordenes_compra OFF;")
p("GO\n")

# 109. compras.ordenes_compra_detalles (30 partidas de OC)
p("-- 109. TABLA: compras.ordenes_compra_detalles")
p("SET IDENTITY_INSERT compras.ordenes_compra_detalles ON;")
p("INSERT INTO compras.ordenes_compra_detalles (id_orden_compra_detalle, id_orden_compra, id_variante_sku, cantidad_pedida, costo_unitario_pactado, subtotal_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    oc_id = i
    sku_id = ((i - 1) % 30) + 1
    cant = 100
    costo = 250.00 + (i * 10.00)
    sub = cant * costo
    if i == 30:
        rows.append(f"({i}, {oc_id}, {sku_id}, {cant}, {costo:.2f}, {sub:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {oc_id}, {sku_id}, {cant}, {costo:.2f}, {sub:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.ordenes_compra_detalles OFF;")
p("GO\n")

# 110. compras.recepciones_mercancia (30 recepciones)
p("-- 110. TABLA: compras.recepciones_mercancia")
p("SET IDENTITY_INSERT compras.recepciones_mercancia ON;")
p("INSERT INTO compras.recepciones_mercancia (id_recepcion, id_orden_compra, folio_recepcion_cedis, fecha_recepcion, remision_proveedor_folio, pedimento_aduanal_importacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    oc_id = i
    fol_rec = f"REC-CEDIS-{i:06d}"
    rem = f"REM-PROV-{i:06d}"
    ped = f"26-24-3001-{i:07d}" # Formato oficial pedimento aduanal SAT
    if i == 30:
        rows.append(f"({i}, {oc_id}, N'{fol_rec}', '2025-01-20', N'{rem}', '{ped}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {oc_id}, N'{fol_rec}', SYSDATETIME(), N'{rem}', '{ped}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.recepciones_mercancia OFF;")
p("GO\n")

# 111. compras.recepciones_detalles (30 partidas recibidas)
p("-- 111. TABLA: compras.recepciones_detalles")
p("SET IDENTITY_INSERT compras.recepciones_detalles ON;")
p("INSERT INTO compras.recepciones_detalles (id_recepcion_detalle, id_recepcion, id_variante_sku, cantidad_recibida, cantidad_danada_rechazada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    rec_id = i
    sku_id = ((i - 1) % 30) + 1
    rec = 100
    dan = 0 if i % 5 != 0 else 2
    if i == 30:
        rows.append(f"({i}, {rec_id}, {sku_id}, {rec}, 10, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {rec_id}, {sku_id}, {rec}, {dan}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.recepciones_detalles OFF;")
p("GO\n")

# 112. compras.inspecciones_sanitarias_qa (30 dictámenes QA)
p("-- 112. TABLA: compras.inspecciones_sanitarias_qa")
p("SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa ON;")
p("INSERT INTO compras.inspecciones_sanitarias_qa (id_inspeccion_qa, id_recepcion_detalle, numero_dictamen_qa, dictamen_qa, temperatura_muestra_celsius, ph_muestra_medido, lote_inspeccionado_aprobado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    recd_id = i
    dict_num = f"DICT-QA-LAB-{i:06d}"
    dictamen = 'APROBADO' if i <= 27 else 'RETENIDO_EN_CUARENTENA'
    temp = 21.50 + (i % 3)
    ph = 5.50 + (i % 2) * 0.2
    aprob = 1 if dictamen == 'APROBADO' else 0
    if i == 30:
        rows.append(f"({i}, {recd_id}, N'{dict_num}', N'RECHAZADO_DEVOLVER', 28.00, 3.20, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {recd_id}, N'{dict_num}', N'{dictamen}', {temp:.2f}, {ph:.2f}, {aprob}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa OFF;")
p("GO\n")

# 113. wms.almacenes_cedis (30 almacenes / CEDIS / Hubs)
p("-- 113. TABLA: wms.almacenes_cedis")
p("SET IDENTITY_INSERT wms.almacenes_cedis ON;")
p("INSERT INTO wms.almacenes_cedis (id_almacen, codigo_almacen, nombre_almacen, tipo_almacen, capacidad_m2, calle, numero_exterior, colonia, codigo_postal, ciudad, estado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
cedis = [
    (1, 'CEDIS-MTY-NORTE', 'CEDIS Central Monterrey Norte', 'CEDIS_MACRO', 15000.00, 'Av. Parque Industrial San Jerónimo', '500', 'San Jerónimo', '64640', 'Monterrey', 'Nuevo León'),
    (2, 'CEDIS-CDMX-VALLEJO', 'CEDIS Centro de Distribución Vallejo', 'CEDIS_MACRO', 22000.00, 'Calzada Vallejo', '1250', 'Industrial Vallejo', '02300', 'Ciudad de México', 'CDMX'),
    (3, 'CEDIS-GDL-SALTO', 'CEDIS Occidente El Salto', 'CEDIS_REGIONAL', 12000.00, 'Carretera a El Salto', 'Km 4.5', 'Corredor Industrial', '45680', 'Guadalajara', 'Jalisco'),
    (4, 'HUB-TIJUANA-FRONTERA', 'Hub Logístico Transfronterizo Tijuana', 'HUB_CROSSDOCK', 6000.00, 'Blvd. Bellas Artes', '20100', 'Ciudad Industrial', '22444', 'Tijuana', 'Baja California'),
    (5, 'CEDIS-MONCLOVA-COAH', 'CEDIS Regional Monclova Acero', 'CEDIS_REGIONAL', 5000.00, 'Blvd. Harold R. Pape', '1800', 'Centro Industrial', '25700', 'Monclova', 'Coahuila'),
]
for i in range(6, 31):
    cedis.append((i, f'HUB-LOGISTICO-{i:02d}', f'Almacén Satélite y Centro de Despacho {i}', 'HUB_CROSSDOCK', 2500.00, f'Av. Principal Logística {i}', f'{100+i}', 'Zona Industrial', '25000', 'Saltillo', 'Coahuila'))

rows = []
for i, (id_a, cod, nom, tipo, cap, calle, num, col, cp, cd, est) in enumerate(cedis):
    if i == 29:
        rows.append(f"({id_a}, N'{cod}', N'{nom}', N'{tipo}', {cap:.2f}, N'{calle}', N'{num}', N'{col}', '{cp}', N'{cd}', N'{est}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_a}, N'{cod}', N'{nom}', N'{tipo}', {cap:.2f}, N'{calle}', N'{num}', N'{col}', '{cp}', N'{cd}', N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.almacenes_cedis OFF;")
p("GO\n")

# 114. wms.zonas_almacen (30 zonas de almacén)
p("-- 114. TABLA: wms.zonas_almacen")
p("SET IDENTITY_INSERT wms.zonas_almacen ON;")
p("INSERT INTO wms.zonas_almacen (id_zona_almacen, id_almacen, codigo_zona, nombre_zona, tipo_almacenamiento, control_temperatura_requerido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
zonas = [
    (1, 1, 'ZONA-FRIO-01', 'Cámara Fría Sueros y Biológicos 2-8°C', 'REFRIGERADO_2_8C', 1),
    (2, 1, 'ZONA-RACK-ALTO', 'Racks Pallet Alta Densidad Skincare', 'RACK_PALLET_ESTANDAR', 0),
    (3, 1, 'ZONA-PICK-MAKEUP', 'Mezanine de Picking Cosmético Maquillaje', 'ESTANTERIA_MANUAL_PICKING', 0),
    (4, 1, 'ZONA-VALOR-ALTO', 'Jaula de Seguridad Skinceuticals VIP', 'ALTA_SEGURIDAD_CERRADA', 0),
    (5, 1, 'ZONA-INFLAMABLE', 'Área de Perfumería y Solventes Alcohol', 'ANTIDEFLAGRANTE_QUIMICO', 0),
]
for i in range(6, 31):
    alm_ref = ((i - 1) % 5) + 1
    zonas.append((i, alm_ref, f'ZONA-WMS-{i:02d}', f'Zona Operativa de Almacenamiento {i}', 'RACK_PALLET_ESTANDAR', 0))

rows = []
for i, (id_z, alm_id, cod, nom, talm, ctemp) in enumerate(zonas):
    if i == 29:
        rows.append(f"({id_z}, {alm_id}, N'{cod}', N'{nom}', N'{talm}', {ctemp}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_z}, {alm_id}, N'{cod}', N'{nom}', N'{talm}', {ctemp}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.zonas_almacen OFF;")
p("GO\n")

# 115. wms.pasillos_ubicaciones (30 ubicaciones / racks)
p("-- 115. TABLA: wms.pasillos_ubicaciones")
p("SET IDENTITY_INSERT wms.pasillos_ubicaciones ON;")
p("INSERT INTO wms.pasillos_ubicaciones (id_ubicacion, id_zona_almacen, codigo_ubicacion, pasillo, rack, nivel, posicion, es_bloqueada_para_picking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    zona_id = ((i - 1) % 5) + 1
    pasillo = f"P{(i%10)+1:02d}"
    rack = f"R{(i%5)+1:02d}"
    nivel = (i % 4) + 1
    pos = (i % 6) + 1
    cod_u = f"UBIC-{zona_id:02d}-{pasillo}-{rack}-N{nivel}-P{pos}"
    bloq = 1 if i == 30 else 0
    if i == 30:
        rows.append(f"({i}, {zona_id}, N'{cod_u}', '{pasillo}', '{rack}', {nivel}, {pos}, {bloq}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {zona_id}, N'{cod_u}', '{pasillo}', '{rack}', {nivel}, {pos}, {bloq}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.pasillos_ubicaciones OFF;")
p("GO\n")

# 116. wms.tipos_movimiento_inventario (30 tipos de movimiento)
p("-- 116. TABLA: wms.tipos_movimiento_inventario")
p("SET IDENTITY_INSERT wms.tipos_movimiento_inventario ON;")
p("INSERT INTO wms.tipos_movimiento_inventario (id_tipo_movimiento, codigo_tipo_mov, nombre_tipo_mov, signo_afectacion, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
movimientos = [
    (1, 'ENT_COMPRA_PROV', 'Entrada por Compra a Proveedor', 1, 'Ingreso formal al almacén tras inspección y aprobación QA'),
    (2, 'SAL_VENTA_ORDEN', 'Salida por Venta de Pedido', -1, 'Descuento de stock por surtido de orden de cliente'),
    (3, 'SAL_MERMA_ROTURA', 'Salida por Merma de Envase Roto', -1, 'Baja por rotura accidental de frasco de vidrio en estantería'),
    (4, 'SAL_CADUCIDAD_FEFO', 'Salida por Caducidad Vencida COFEPRIS', -1, 'Retiro de inventario expirado para destrucción sanitaria'),
    (5, 'ENT_DEVOLUCION_CLIENTE', 'Entrada por Devolución de Cliente', 1, 'Reingreso de producto sellado y verificado en postventa'),
    (6, 'AJUSTE_POSITIVO_AUDIT', 'Ajuste de Inventario Positivo (+)', 1, 'Sobrante detectado durante conteo cíclico periódico'),
    (7, 'AJUSTE_NEGATIVO_AUDIT', 'Ajuste de Inventario Negativo (-)', -1, 'Faltante no aclarado en conteo físico de rack'),
    (8, 'ENT_TRASPASO_CEDIS', 'Entrada por Traspaso entre CEDIS', 1, 'Recepción de transferencia interalmacén'),
    (9, 'SAL_TRASPASO_CEDIS', 'Salida por Traspaso entre CEDIS', -1, 'Despacho de mercancía transferida a otro centro logístico'),
    (10, 'SAL_MUESTRA_MARKETING', 'Salida de Muestra para Influencer', -1, 'Producto entregado a departamento de relaciones públicas'),
]
for i in range(11, 31):
    signo = 1 if i % 2 == 0 else -1
    movimientos.append((i, f'MOV_ESPECIFICO_{i:02d}', f'Movimiento Operativo WMS {i}', signo, f'Movimiento de control de existencias en almacén {i}'))

rows = []
for i, (id_m, cod, nom, sig, desc) in enumerate(movimientos):
    if i == 29:
        rows.append(f"({id_m}, N'{cod}', N'{nom}', {sig}, N'{desc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_m}, N'{cod}', N'{nom}', {sig}, N'{desc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.tipos_movimiento_inventario OFF;")
p("GO\n")

# 117. wms.lotes_fabricacion_sanitaria (30 lotes sanitarios)
p("-- 117. TABLA: wms.lotes_fabricacion_sanitaria")
p("SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria ON;")
p("INSERT INTO wms.lotes_fabricacion_sanitaria (id_lote, id_variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad_fefo, certificado_analisis_calidad_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    sku_id = ((i - 1) % 30) + 1
    nlote = f"LOT-2024-COSM-{i:04d}"
    ffab = "2024-02-15"
    fcad = f"202{7 + (i%2)}-02-15"
    coa = f"https://calidad.ecommerce-salud.mx/coa/{nlote}.pdf"
    if i == 30:
        rows.append(f"({i}, {sku_id}, N'{nlote}', '2023-01-01', '2024-01-01', '{coa}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {sku_id}, N'{nlote}', '{ffab}', '{fcad}', '{coa}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria OFF;")
p("GO\n")

# 118. wms.inventario_lotes_ubicacion (30 existencias de lotes en ubicaciones)
p("-- 118. TABLA: wms.inventario_lotes_ubicacion")
p("SET IDENTITY_INSERT wms.inventario_lotes_ubicacion ON;")
p("INSERT INTO wms.inventario_lotes_ubicacion (id_inventario_stock, id_lote, id_ubicacion, stock_disponible, stock_apartado_reservas, fecha_ultimo_recuento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    lote_id = i
    ubic_id = i
    disp = 200 + (i * 20)
    apart = 15 + (i * 2)
    if i == 30:
        rows.append(f"({i}, {lote_id}, {ubic_id}, 0, 0, '2025-01-01', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {lote_id}, {ubic_id}, {disp}, {apart}, SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.inventario_lotes_ubicacion OFF;")
p("GO\n")

# 119. wms.kardex_movimientos (30 transacciones continuas)
p("-- 119. TABLA: wms.kardex_movimientos")
p("SET IDENTITY_INSERT wms.kardex_movimientos ON;")
p("INSERT INTO wms.kardex_movimientos (id_kardex, id_inventario_stock, id_tipo_movimiento, folio_documento_origen, cantidad_movimiento, saldo_resultante_unidades, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    stock_id = i
    tmov_id = 1 if i % 2 == 0 else 2
    fol_doc = f"DOC-KARDEX-{i:06d}"
    cant = 100 if tmov_id == 1 else 2
    saldo = 300 + (i * 10)
    if i == 30:
        rows.append(f"({i}, {stock_id}, 4, N'DOC-BAJA-EXPIRADO', 50, 0, '2025-01-01 12:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {stock_id}, {tmov_id}, N'{fol_doc}', {cant}, {saldo}, SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.kardex_movimientos OFF;")
p("GO\n")

# 120. wms.alertas_caducidad_proxima (30 alertas sanitarias FEFO)
p("-- 120. TABLA: wms.alertas_caducidad_proxima")
p("SET IDENTITY_INSERT wms.alertas_caducidad_proxima ON;")
p("INSERT INTO wms.alertas_caducidad_proxima (id_alerta_caducidad, id_lote, dias_para_caducar, nivel_urgencia, accion_comercial_sugerida, resuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    lote_id = i
    dias = 90 - (i * 2)
    urg = 'PREVENTIVA_90D' if dias > 60 else ('MODERADA_60D' if dias > 30 else 'CRITICA_30D')
    acc = f"Asignar a venta flash horaria con 30% de descuento lote {lote_id}"
    res = 1 if i <= 15 else 0
    if i == 30:
        rows.append(f"({i}, {lote_id}, 0, N'EXPIRADO', N'Destrucción sanitaria obligatoria', 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {lote_id}, {dias}, N'{urg}', N'{acc}', {res}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.alertas_caducidad_proxima OFF;")
p("GO\n")

# 121. wms.mermas_destruccion_sanitaria (30 actas COFEPRIS)
p("-- 121. TABLA: wms.mermas_destruccion_sanitaria")
p("SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria ON;")
p("INSERT INTO wms.mermas_destruccion_sanitaria (id_merma, id_lote, cantidad_unidades_destruidas, motivo_merma_destruccion, acta_destruccion_sanitaria_folio, empresa_recolectora_ecologica, costo_total_merma, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    lote_id = i
    cant_d = 5 + (i % 10)
    mot = "Caducidad de formulación líquida o desestabilización térmica"
    folio_acta = f"ACTA-COFEPRIS-DEST-{i:06d}"
    emp = "Ecorecolecta Ambiental de Residuos SA de CV"
    costo_m = cant_d * 250.00
    if i == 30:
        rows.append(f"({i}, {lote_id}, 50, N'Lote piloto descontinuado destruido en horno incinerador', N'{folio_acta}', N'{emp}', 12500.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {lote_id}, {cant_d}, N'{mot}', N'{folio_acta}', N'{emp}', {costo_m:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria OFF;")
p("GO\n")

# 122. wms.transferencias_almacenes (30 traspasos entre CEDIS)
p("-- 122. TABLA: wms.transferencias_almacenes")
p("SET IDENTITY_INSERT wms.transferencias_almacenes ON;")
p("INSERT INTO wms.transferencias_almacenes (id_transferencia, folio_transferencia, id_almacen_origen, id_almacen_destino, fecha_solicitud, fecha_despacho, fecha_recepcion, estado_transferencia, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fol_t = f"TRASF-2026-{i:05d}"
    a_orig = 1 if i % 2 == 0 else 2
    a_dest = 3 if i % 2 == 0 else 5
    est = 'RECIBIDA_COMPLETA' if i <= 20 else 'EN_TRANSITO'
    frec = "SYSDATETIME()" if est == 'RECIBIDA_COMPLETA' else "NULL"
    if i == 30:
        rows.append(f"({i}, N'{fol_t}', 1, 2, '2025-01-01', '2025-01-02', '2025-01-03', N'DISCREPANCIA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{fol_t}', {a_orig}, {a_dest}, '2026-02-01', SYSDATETIME(), {frec}, N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.transferencias_almacenes OFF;")
p("GO\n")

# 123. wms.transferencias_detalles (30 partidas traspaso)
p("-- 123. TABLA: wms.transferencias_detalles")
p("SET IDENTITY_INSERT wms.transferencias_detalles ON;")
p("INSERT INTO wms.transferencias_detalles (id_transferencia_detalle, id_transferencia, id_lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    tr_id = i
    lote_id = i
    cant_e = 50
    cant_r = 50 if i <= 20 else 0
    if i == 30:
        rows.append(f"({i}, {tr_id}, {lote_id}, 50, 48, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {tr_id}, {lote_id}, {cant_e}, {cant_r}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.transferencias_detalles OFF;")
p("GO\n")

# 124. wms.conteos_ciclicos_auditoria (30 auditorías de stock)
p("-- 124. TABLA: wms.conteos_ciclicos_auditoria")
p("SET IDENTITY_INSERT wms.conteos_ciclicos_auditoria ON;")
p("INSERT INTO wms.conteos_ciclicos_auditoria (id_conteo_ciclico, folio_conteo, id_almacen, fecha_programada, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fol_c = f"AUD-CICLICA-{i:05d}"
    alm_id = ((i - 1) % 5) + 1
    tconteo = 'ALTO_VALOR_SKU' if i % 2 == 0 else 'PROXIMO_A_CADUCAR'
    if i == 30:
        rows.append(f"({i}, N'{fol_c}', {alm_id}, '2025-01-01', N'ALEATORIO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{fol_c}', {alm_id}, '2026-02-15', N'{tconteo}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.conteos_ciclicos_auditoria OFF;")
p("GO\n")

# 125. wms.conteos_ciclicos_detalles (30 discrepancias)
p("-- 125. TABLA: wms.conteos_ciclicos_detalles")
p("SET IDENTITY_INSERT wms.conteos_ciclicos_detalles ON;")
p("INSERT INTO wms.conteos_ciclicos_detalles (id_conteo_detalle, id_conteo_ciclico, id_inventario_stock, stock_sistema_teorico, stock_fisico_contado, discrepancia_unidades, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    conteo_id = i
    stock_id = i
    teo = 200
    fis = 200 if i % 4 != 0 else 199
    disc = fis - teo
    just = "Conteo exacto sin diferencia" if disc == 0 else "Merma no reportada por empaque aplastado"
    if i == 30:
        rows.append(f"({i}, {conteo_id}, {stock_id}, 50, 45, -5, N'Diferencia aclarada por retiro de prueba', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {conteo_id}, {stock_id}, {teo}, {fis}, {disc}, N'{just}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.conteos_ciclicos_detalles OFF;")
p("GO\n")

# 126. wms.monitoreo_temperatura_humedad (30 lecturas IoT)
p("-- 126. TABLA: wms.monitoreo_temperatura_humedad")
p("SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad ON;")
p("INSERT INTO wms.monitoreo_temperatura_humedad (id_telemetria_sensor, id_zona_almacen, codigo_sensor_iot, temperatura_celsius, porcentaje_humedad_relativa, alerta_fuera_rango_disparada, fecha_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    zona_id = 1 if i <= 15 else 2 # Zona 1 es fría
    sensor = f"IOT-SENS-{zona_id:02d}-{i:03d}"
    temp = 4.50 + (i % 3) * 0.5 if zona_id == 1 else 22.00 + (i % 2)
    hum = 50.00 + (i % 10)
    alerta = 0
    if i == 30:
        rows.append(f"({i}, 1, N'IOT-SENS-01-ERR', 12.80, 75.00, 1, '2025-01-01 12:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {zona_id}, N'{sensor}', {temp:.2f}, {hum:.2f}, {alerta}, SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad OFF;")
p("GO\n")

# 127. envios.transportistas_paqueterias (30 transportistas)
p("-- 127. TABLA: envios.transportistas_paqueterias")
p("SET IDENTITY_INSERT envios.transportistas_paqueterias ON;")
p("INSERT INTO envios.transportistas_paqueterias (id_transportista, codigo_transportista, nombre_comercial, razon_social, api_tracking_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
transportistas = [
    (1, 'DHL_EXPRESS_MX', 'DHL Express México', 'DHL EXPRESS MEXICO SA DE CV', 'https://api-eu.dhl.com/track/shipments'),
    (2, 'FEDEX_MEXICO', 'FedEx Express México', 'FEDERAL EXPRESS DE MEXICO SA DE CV', 'https://apis.fedex.com/track/v1/trackingnumbers'),
    (3, 'ESTAFETA_MEX', 'Estafeta Mexicana', 'ESTAFETA MEXICANA SA DE CV', 'https://api.estafeta.com/v1/tracking'),
    (4, 'PAQUETEXPRESS', 'Paquetexpress', 'PAQUETEXPRESS SA DE CV', 'https://api.paquetexpress.com.mx/tracking'),
    (5, '99_MINUTOS', '99 Minutos Envíos Mismo Día', '99 MINUTOS SA DE CV', 'https://delivery.99minutos.com/api/v3/tracking'),
    (6, 'REDPACK_LOG', 'Redpack México', 'REDPACK SA DE CV', 'https://api.redpack.com.mx/tracking'),
    (7, 'SENDEX_NORTE', 'Sendex Mensajería Norte', 'SERVICIOS SENDEX SA DE CV', 'https://api.sendex.mx/track'),
    (8, 'AMPM_LOGISTICA', 'AMPM Logística Especializada', 'DISTRIBUCION AMPM SA DE CV', 'https://api.ampm.com.mx/tracking'),
    (9, 'FLOTILLA_INTERNA_ECOM', 'Flotilla Propia Refrigerada eCom', 'ECOMMERCE SALUD Y BELLEZA SA DE CV', 'https://rastreo.ecommerce-salud.mx/flotilla'),
    (10, 'IVOY_EXPRESS_LOCAL', 'iVoy Mensajería Urbana Motos', 'IVOY SMART COURIER SA DE CV', 'https://api.ivoy.mx/orders/track'),
]
for i in range(11, 31):
    transportistas.append((i, f'TRANSPORTISTA_{i:02d}', f'Mensajería Local y Regional {i}', f'LOGISTICA REGIONAL {i} SA DE CV', f'https://api.transp{i}.com/track'))

rows = []
for i, (id_t, cod, nom, rz, url) in enumerate(transportistas):
    if i == 29:
        rows.append(f"({id_t}, N'{cod}', N'{nom}', N'{rz}', '{url}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_t}, N'{cod}', N'{nom}', N'{rz}', '{url}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.transportistas_paqueterias OFF;")
p("GO\n")

# 128. envios.tipos_servicio_envio (30 servicios logísticos)
p("-- 128. TABLA: envios.tipos_servicio_envio")
p("SET IDENTITY_INSERT envios.tipos_servicio_envio ON;")
p("INSERT INTO envios.tipos_servicio_envio (id_servicio_envio, codigo_servicio, nombre_servicio, tiempo_promedio_entrega_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
servicios = [
    (1, 'SAME_DAY_URBAN', 'Entrega Mismo Día Urgente (Same Day)', 6),
    (2, 'NEXT_DAY_AIR', 'Día Siguiente Garantizado (Next Day)', 24),
    (3, 'STANDARD_GROUND', 'Terrestre Estándar Nacional', 72),
    (4, 'COLD_CHAIN_EXP', 'Cadena de Frío Garantizada 2-8°C', 24),
    (5, 'ECONOMY_SAVER', 'Económico Consolidado 5 Días', 120),
    (6, 'PICKUP_LOCKER', 'Recolección en Smart Locker Autónomo', 24),
    (7, 'SUCURSAL_OCURRE', 'Entrega en Sucursal Ocurre de Paquetería', 48),
]
for i in range(8, 31):
    servicios.append((i, f'SERVICIO_LOG_{i:02d}', f'Modalidad Logística de Entrega {i}', 24 + (i * 2)))

rows = []
for i, (id_s, cod, nom, hrs) in enumerate(servicios):
    if i == 29:
        rows.append(f"({id_s}, N'{cod}', N'{nom}', {hrs}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_s}, N'{cod}', N'{nom}', {hrs}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.tipos_servicio_envio OFF;")
p("GO\n")

# 129. envios.tarifas_zonas_postales (30 matrices de tarifa)
p("-- 129. TABLA: envios.tarifas_zonas_postales")
p("SET IDENTITY_INSERT envios.tarifas_zonas_postales ON;")
p("INSERT INTO envios.tarifas_zonas_postales (id_tarifa_postal, id_transportista, id_servicio_envio, codigo_postal_origen, codigo_postal_destino, peso_minimo_kg, peso_maximo_kg, tarifa_base_mxn, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    t_id = ((i - 1) % 5) + 1
    s_id = ((i - 1) % 3) + 1
    cp_o = '64640'
    cp_d = f"{25700 + (i % 100)}"
    tarifa = 129.00 + (i * 5.00)
    if i == 30:
        rows.append(f"({i}, {t_id}, {s_id}, '{cp_o}', '{cp_d}', 0.10, 5.00, {tarifa:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {t_id}, {s_id}, '{cp_o}', '{cp_d}', 0.10, 5.00, {tarifa:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.tarifas_zonas_postales OFF;")
p("GO\n")

# 130. envios.despachos_orden (30 despachos)
p("-- 130. TABLA: envios.despachos_orden")
p("SET IDENTITY_INSERT envios.despachos_orden ON;")
p("INSERT INTO envios.despachos_orden (id_despacho, id_orden_split, id_transportista, id_servicio_envio, fecha_compromiso_entrega, fecha_recoleccion_real, fecha_entrega_final, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    split_id = i
    t_id = ((i - 1) % 5) + 1
    s_id = ((i - 1) % 3) + 1
    est = 'ENTREGADO' if i <= 15 else ('EN_TRANSITO' if i <= 25 else 'PREPARANDO_PAQUETE')
    f_ent = "SYSDATETIME()" if est == 'ENTREGADO' else "NULL"
    f_rec = "SYSDATETIME()" if est != 'PREPARANDO_PAQUETE' else "NULL"
    if i == 30:
        rows.append(f"({i}, {split_id}, {t_id}, {s_id}, '2025-01-05', '2025-01-02', NULL, N'INCIDENCIA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {split_id}, {t_id}, {s_id}, '2026-02-28', {f_rec}, {f_ent}, N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.despachos_orden OFF;")
p("GO\n")

# 131. envios.paquetes_bultos (30 cajas / bultos)
p("-- 131. TABLA: envios.paquetes_bultos")
p("SET IDENTITY_INSERT envios.paquetes_bultos ON;")
p("INSERT INTO envios.paquetes_bultos (id_paquete_bulto, id_despacho, numero_bulto_consecutivo, peso_bruto_kg, largo_cm, ancho_cm, alto_cm, peso_volumetrico_calculado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    desp_id = i
    peso_b = 0.85 + (i * 0.05)
    l, w, h = 25.00, 20.00, 15.00
    p_vol = (l * w * h) / 5000.00 # Fórmula estándar courier IATA
    if i == 30:
        rows.append(f"({i}, {desp_id}, 1, {peso_b:.2f}, {l:.2f}, {w:.2f}, {h:.2f}, {p_vol:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {desp_id}, 1, {peso_b:.2f}, {l:.2f}, {w:.2f}, {h:.2f}, {p_vol:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.paquetes_bultos OFF;")
p("GO\n")

# 132. envios.paquetes_contenido_lotes (30 embalajes trazables)
p("-- 132. TABLA: envios.paquetes_contenido_lotes")
p("SET IDENTITY_INSERT envios.paquetes_contenido_lotes ON;")
p("INSERT INTO envios.paquetes_contenido_lotes (id_paquete_contenido, id_paquete_bulto, id_orden_detalle, id_lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    bulto_id = i
    od_id = i
    lote_id = i
    cant_p = 1 if i % 2 != 0 else 2
    if i == 30:
        rows.append(f"({i}, {bulto_id}, {od_id}, {lote_id}, {cant_p}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {bulto_id}, {od_id}, {lote_id}, {cant_p}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.paquetes_contenido_lotes OFF;")
p("GO\n")

# 133. envios.guias_rastreo (30 números de guía)
p("-- 133. TABLA: envios.guias_rastreo")
p("SET IDENTITY_INSERT envios.guias_rastreo ON;")
p("INSERT INTO envios.guias_rastreo (id_guia_rastreo, id_paquete_bulto, numero_guia_tracking, etiqueta_pdf_url, url_rastreo_externo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    bulto_id = i
    guia = f"DHL-MX-TRACK-{i:010d}"
    pdf = f"https://guias.ecommerce-salud.mx/pdf/{guia}.pdf"
    url = f"https://www.dhl.com/mx-es/home/tracking.html?tracking-id={guia}"
    if i == 30:
        rows.append(f"({i}, {bulto_id}, '{guia}', '{pdf}', '{url}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {bulto_id}, '{guia}', '{pdf}', '{url}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.guias_rastreo OFF;")
p("GO\n")

# 134. envios.eventos_tracking_bitacora (30 checkpoints de rastreo)
p("-- 134. TABLA: envios.eventos_tracking_bitacora")
p("SET IDENTITY_INSERT envios.eventos_tracking_bitacora ON;")
p("INSERT INTO envios.eventos_tracking_bitacora (id_evento_tracking, id_guia_rastreo, codigo_evento, descripcion_evento, ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    guia_id = i
    cod_ev = 'ENTREGADO' if i <= 15 else 'EN_RUTA_LOCAL'
    desc = 'Paquete entregado satisfactoriamente al titular' if i <= 15 else 'Unidad de mensajería en ruta de última milla'
    ciudad = 'Monterrey, NL' if i % 2 == 0 else 'Monclova, COAH'
    if i == 30:
        rows.append(f"({i}, {guia_id}, 'INCIDENCIA_DIRECCION', N'Dirección no localizada por mensajero', N'Monclova, COAH', '2025-01-03 14:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {guia_id}, '{cod_ev}', N'{desc}', N'{ciudad}', SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.eventos_tracking_bitacora OFF;")
p("GO\n")

# 135. envios.intentos_entrega_fallidos (30 intentos no concretados)
p("-- 135. TABLA: envios.intentos_entrega_fallidos")
p("SET IDENTITY_INSERT envios.intentos_entrega_fallidos ON;")
p("INSERT INTO envios.intentos_entrega_fallidos (id_intento_fallido, id_despacho, numero_visita, fecha_hora_intento, motivo_imposibilidad, fotografia_fachada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    desp_id = i
    num_v = (i % 2) + 1
    mot = "Domicilio cerrado sin respuesta tras tocar timbre en 3 ocasiones"
    foto = f"https://evidencias.ecommerce-salud.mx/visitas/fachada_{i}.jpg"
    if i == 30:
        rows.append(f"({i}, {desp_id}, 3, '2025-01-03 16:00:00', N'Rechazo explícito del destinatario en puerta', '{foto}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {desp_id}, {num_v}, SYSDATETIME(), N'{mot}', '{foto}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.intentos_entrega_fallidos OFF;")
p("GO\n")

# 136. envios.incidencias_logisticas (30 incidencias)
p("-- 136. TABLA: envios.incidencias_logisticas")
p("SET IDENTITY_INSERT envios.incidencias_logisticas ON;")
p("INSERT INTO envios.incidencias_logisticas (id_incidencia, id_despacho, tipo_incidencia, descripcion_incidencia, acta_hechos_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    desp_id = i
    tinc = 'PAQUETE_DANADO_DERRAME' if i % 2 == 0 else 'DIRECCION_INEXISTENTE'
    desc = "Frasco de vidrio roto con filtración en empaque secundario" if tinc == 'PAQUETE_DANADO_DERRAME' else "Número exterior no coincide con nomenclatura oficial de la calle"
    acta = f"https://legal.ecommerce-salud.mx/actas/incidencia_{i}.pdf"
    if i == 30:
        rows.append(f"({i}, {desp_id}, N'EXTRAVIO_TOTAL', N'Paquete extraviado en centro de clasificación nacional', '{acta}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {desp_id}, N'{tinc}', N'{desc}', '{acta}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.incidencias_logisticas OFF;")
p("GO\n")

# 137. envios.seguros_mercancia (30 pólizas)
p("-- 137. TABLA: envios.seguros_mercancia")
p("SET IDENTITY_INSERT envios.seguros_mercancia ON;")
p("INSERT INTO envios.seguros_mercancia (id_seguro, id_despacho, numero_poliza_seguro, aseguradora_razon_social, valor_asegurado_mxn, costo_prima_seguro_mxn, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    desp_id = i
    poliza = f"POLIZA-CHUBB-CARGA-{i:06d}"
    aseg = "Chubb Seguros México SA de CV" if i % 2 == 0 else "AXA Seguros México SA de CV"
    val = 1500.00 + (i * 100.00)
    prima = val * 0.015 # 1.5% del valor declarado
    if i == 30:
        rows.append(f"({i}, {desp_id}, '{poliza}', N'{aseg}', {val:.2f}, {prima:.2f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {desp_id}, '{poliza}', N'{aseg}', {val:.2f}, {prima:.2f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.seguros_mercancia OFF;")
p("GO\n")

# 138. envios.puntos_recoleccion_pickup (30 puntos de entrega inteligente)
p("-- 138. TABLA: envios.puntos_recoleccion_pickup")
p("SET IDENTITY_INSERT envios.puntos_recoleccion_pickup ON;")
p("INSERT INTO envios.puntos_recoleccion_pickup (id_punto_pickup, codigo_locker_pickup, nombre_punto, direccion_completa, codigo_postal, latitud_gps, longitud_gps, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
lockers = [
    (1, 'LCK-MTY-GALERIAS', 'Smart Locker Galerías Monterrey', 'Av. Insurgentes 2500, Vista Hermosa', '64620', 25.681234, -100.354123),
    (2, 'LCK-MTY-VALLE-OESTE', 'Smart Locker Punto Valle San Pedro', 'Río Missouri 555, Del Valle', '66220', 25.654321, -100.365432),
    (3, 'LCK-CDMX-ANTARA', 'Smart Locker Antara Polanco', 'Av. Ejército Nacional 843, Polanco', '11520', 19.439876, -99.204567),
    (4, 'LCK-GDL-ANDAREZ', 'Smart Locker Plaza Andares Zapopan', 'Blvd. Puerta de Hierro 4965', '45116', 20.709876, -103.412345),
    (5, 'LCK-MVA-PAPE-CENTRO', 'Smart Locker Monclova Pape Centro', 'Blvd. Harold R. Pape 1200, Obrera', '25700', 26.908765, -101.423456),
]
for i in range(6, 31):
    lockers.append((i, f'LCK-LOCAL-{i:02d}', f'Punto de Recolección Seguro {i}', f'Av. Comercial de Enlace {i}', '25750', 25.500000 + (i*0.01), -101.000000 - (i*0.01)))

rows = []
for i, (id_p, cod, nom, dir_c, cp, lat, lon) in enumerate(lockers):
    if i == 29:
        rows.append(f"({id_p}, N'{cod}', N'{nom}', N'{dir_c}', '{cp}', {lat:.6f}, {lon:.6f}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_p}, N'{cod}', N'{nom}', N'{dir_c}', '{cp}', {lat:.6f}, {lon:.6f}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT envios.puntos_recoleccion_pickup OFF;")
p("GO\n")

# 139. postventa.motivos_devolucion_rma (30 motivos de devolución)
p("-- 139. TABLA: postventa.motivos_devolucion_rma")
p("SET IDENTITY_INSERT postventa.motivos_devolucion_rma ON;")
p("INSERT INTO postventa.motivos_devolucion_rma (id_motivo_rma, codigo_motivo, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
motivos_rma = [
    (1, 'RMA_ALERGIA_CUTANEA', 'Reacción alérgica severa cutánea o eritema tras uso de producto dermatológico'),
    (2, 'RMA_ENVASE_ROTO_DERRAME', 'Frasco de suero o tónico roto con derrame completo dentro del paquete'),
    (3, 'RMA_TONO_MAQUILLAJE_EQUIVOCADO', 'El tono recibido no coincide con el ordenado en el portal e-commerce'),
    (4, 'RMA_CADUCIDAD_VENCIDA', 'Fecha de caducidad en etiqueta expirada o inferior a 60 días'),
    (5, 'RMA_SELLO_VIOLADO', 'Producto recibido con el sello de garantía roto o sin celofán protector'),
    (6, 'RMA_MAL_ESTADO_FORMULA', 'Textura separada, grumos, mal olor o decoloración química evidente'),
    (7, 'RMA_DISPENSADOR_DEFECTUOSO', 'Bomba dispensadora / gotero mecánico no dosifica el líquido'),
    (8, 'RMA_PRODUCTO_NO_SOLICITADO', 'Envío de SKU incorrecto por error de picking en CEDIS'),
    (9, 'RMA_FALTA_PIEZA_KIT', 'Set de rutina incompleto al que le falta uno de los componentes'),
    (10, 'RMA_GARANTIA_SATISFACCION', 'Garantía incondicional de 30 días de satisfacción en línea exclusiva')
]
for i in range(11, 31):
    motivos_rma.append((i, f'RMA_MOTIVO_ESPECIFICO_{i:02d}', f'Causal técnica de retorno y reclamación de cliente {i}'))

rows = []
for i, (id_m, cod, desc) in enumerate(motivos_rma):
    if i == 29:
        rows.append(f"({id_m}, N'{cod}', N'{desc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_m}, N'{cod}', N'{desc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.motivos_devolucion_rma OFF;")
p("GO\n")

# 140. postventa.solicitudes_rma (30 solicitudes de devolución)
p("-- 140. TABLA: postventa.solicitudes_rma")
p("SET IDENTITY_INSERT postventa.solicitudes_rma ON;")
p("INSERT INTO postventa.solicitudes_rma (id_solicitud_rma, id_orden, folio_rma, fecha_solicitud, id_motivo_rma, explicacion_cliente, fotografia_evidencia_url, estado_rma, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ord_id = i
    fol = f"RMA-2026-{i:05d}"
    mot_id = ((i - 1) % 10) + 1
    exp = f"El producto me provocó ardor inmediato en mejillas; adjunto fotografía médica caso {i}"
    foto = f"https://evidencias.ecommerce-salud.mx/rma/{fol}.jpg"
    est = 'APROBADA_REEMBOLSAR' if i <= 15 else ('RECIBIDA_EN_QA' if i <= 25 else 'SOLICITADA')
    if i == 30:
        rows.append(f"({i}, {ord_id}, N'{fol}', '2025-01-01', 1, N'{exp}', '{foto}', N'RECHAZADA_POR_HIGIENE', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ord_id}, N'{fol}', SYSDATETIME(), {mot_id}, N'{exp}', '{foto}', N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.solicitudes_rma OFF;")
p("GO\n")

# 141. postventa.rma_detalles (30 partidas de RMA)
p("-- 141. TABLA: postventa.rma_detalles")
p("SET IDENTITY_INSERT postventa.rma_detalles ON;")
p("INSERT INTO postventa.rma_detalles (id_rma_detalle, id_solicitud_rma, id_orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    rma_id = i
    od_id = i
    cant = 1
    if i == 30:
        rows.append(f"({i}, {rma_id}, {od_id}, {cant}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {rma_id}, {od_id}, {cant}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.rma_detalles OFF;")
p("GO\n")

# 142. postventa.inspeccion_sanitaria_retorno (30 dictámenes de cuarentena)
p("-- 142. TABLA: postventa.inspeccion_sanitaria_retorno")
p("SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno ON;")
p("INSERT INTO postventa.inspeccion_sanitaria_retorno (id_inspeccion_retorno, id_rma_detalle, sello_original_intacto, empaque_violado, fecha_inspeccion, dictamen_sanitario_retorno, destino_sanitario_autorizado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    rmad_id = i
    sello = 0 if i % 2 == 0 else 1
    viol = 1 if sello == 0 else 0
    dest = 'DESTRUCCION_INMEDIATA_RESIDUOS' if viol == 1 else 'REINGRESO_STOCK_SELLADO'
    dictam = f"Dictamen de inspección higiénica: Por regulación sanitaria COFEPRIS los cosméticos abiertos no pueden reintegrarse" if viol == 1 else "Producto sellado íntegro en caja virgen; apto para reingreso a inventario"
    if i == 30:
        rows.append(f"({i}, {rmad_id}, 0, 1, '2025-01-05', N'Producto de prueba destruido', N'DESTRUCCION_INMEDIATA_RESIDUOS', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {rmad_id}, {sello}, {viol}, SYSDATETIME(), N'{dictam}', N'{dest}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno OFF;")
p("GO\n")

# 143. postventa.tickets_soporte (30 tickets)
p("-- 143. TABLA: postventa.tickets_soporte")
p("SET IDENTITY_INSERT postventa.tickets_soporte ON;")
p("INSERT INTO postventa.tickets_soporte (id_ticket, folio_ticket, id_cliente, categoria_ticket, asunto, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    cli = i
    fol = f"TCK-2026-{i:05d}"
    cat = 'ASESORIA_DERMATOLOGICA' if i % 3 == 0 else ('ENVIO_DEMORADO' if i % 2 == 0 else 'FACTURACION_CFDI')
    asunto = f"Duda sobre aplicación de sérum facial o seguimiento a pedido caso {i}"
    prio = 'ALTA' if cat == 'ASESORIA_DERMATOLOGICA' else 'MEDIA'
    est = 'RESUELTO' if i <= 20 else 'ABIERTO'
    if i == 30:
        rows.append(f"({i}, N'{fol}', {cli}, N'FACTURACION_CFDI', N'Cancelación de factura CFDI test', N'BAJA', N'CERRADO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{fol}', {cli}, N'{cat}', N'{asunto}', N'{prio}', N'{est}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.tickets_soporte OFF;")
p("GO\n")

# 144. postventa.tickets_mensajes (30 mensajes en hilo)
p("-- 144. TABLA: postventa.tickets_mensajes")
p("SET IDENTITY_INSERT postventa.tickets_mensajes ON;")
p("INSERT INTO postventa.tickets_mensajes (id_ticket_mensaje, id_ticket, id_usuario_emisor, es_mensaje_interno, mensaje_texto, fecha_hora_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    tck_id = i
    usr_id = 1
    es_int = 0
    msg = f"Estimado cliente, hemos revisado su consulta dermatológica y recomendamos pausar el activo durante 48 horas e hidratar con Cicalfate+."
    if i == 30:
        rows.append(f"({i}, {tck_id}, {usr_id}, 1, N'Mensaje interno de soporte de prueba archivado', '2025-01-01 10:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {tck_id}, {usr_id}, {es_int}, N'{msg}', SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.tickets_mensajes OFF;")
p("GO\n")

# 145. postventa.reportes_farmacovigilancia (30 reportes sanitarios COFEPRIS)
p("-- 145. TABLA: postventa.reportes_farmacovigilancia")
p("SET IDENTITY_INSERT postventa.reportes_farmacovigilancia ON;")
p("INSERT INTO postventa.reportes_farmacovigilancia (id_reporte_farmacovigilancia, folio_cofepris_farmacovigilancia, id_cliente, id_producto, id_lote, descripcion_reaccion_adversa, severidad_reaccion, atencion_medica_urgencias_requerida, notificado_a_cofepris, fecha_notificacion_cofepris, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    fol_c = f"COFEPRIS-FARMACOVIG-{i:06d}-2026"
    cli = i
    prod_id = ((i - 1) % 30) + 1
    lote_id = i
    desc = f"Reporte de reacción adversa dermatológica: eritema y prurito tras aplicación tópica continua caso {i}"
    sev = "MODERADA" if i % 2 == 0 else "LEVE"
    urg = 0
    notif = 1
    fnotif = "SYSDATETIME()"
    if i == 30:
        rows.append(f"({i}, N'{fol_c}', {cli}, {prod_id}, {lote_id}, N'Caso de prueba cerrado', N'LEVE', 0, 1, '2025-01-01', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{fol_c}', {cli}, {prod_id}, {lote_id}, N'{desc}', N'{sev}', {urg}, {notif}, {fnotif}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT postventa.reportes_farmacovigilancia OFF;")
p("GO\n")

# 146. auditoria.tipos_evento_sistema (30 eventos auditables)
p("-- 146. TABLA: auditoria.tipos_evento_sistema")
p("SET IDENTITY_INSERT auditoria.tipos_evento_sistema ON;")
p("INSERT INTO auditoria.tipos_evento_sistema (id_tipo_evento, codigo_tipo_evento, nombre_evento, nivel_severidad, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
eventos_aud = [
    (1, 'AUTH_LOGIN_SUCCESS', 'Inicio de Sesión Exitoso', 'INFO', 'Autenticación correcta con credenciales y MFA'),
    (2, 'AUTH_LOGIN_FAILED', 'Intento Fallido de Acceso', 'ADVERTENCIA', 'Contraseña incorrecta detectada en portal'),
    (3, 'AUTH_ACCOUNT_LOCKED', 'Bloqueo Preventivo de Cuenta', 'CRITICO_SEGURIDAD', 'Superado el límite de 5 intentos fallidos consecutivos'),
    (4, 'AUTH_PASSWORD_CHANGE', 'Cambio de Contraseña Criptográfica', 'INFO', 'Actualización de hash de clave por el usuario'),
    (5, 'AUTH_MFA_DISABLED', 'Desactivación de Doble Factor MFA', 'CRITICO_SEGURIDAD', 'Baja de protección 2FA autorizada o anómala'),
    (6, 'DATA_EXPORT_SENSITIVE', 'Descarga de Reporte con Datos de Salud', 'CRITICO_SEGURIDAD', 'Exportación masiva de expedientes dermatológicos (LFPDPPP)'),
    (7, 'DATA_SOFT_DELETE', 'Eliminación Lógica de Registro (Soft Delete)', 'ADVERTENCIA', 'Inactivación de entidad marcando activo=0 y fecha_baja'),
    (8, 'DATA_RESTORE', 'Restauración de Registro Inactivo', 'INFO', 'Reactivación de fila previamente dada de baja'),
    (9, 'PRICE_OVERRIDE_ADMIN', 'Modificación de Precio Base de Producto', 'ADVERTENCIA', 'Ajuste manual de costo o precio de menudeo en catálogo'),
    (10, 'PAYMENT_FRAUD_BLOCK', 'Transacción Bloqueada por Antifraude', 'CRITICO_SEGURIDAD', 'Score de riesgo crítico detectado por reglas de seguridad')
]
for i in range(11, 31):
    eventos_aud.append((i, f'SYS_EVENT_TYPE_{i:02d}', f'Evento de Auditoría Operativo {i}', 'INFO', f'Registro de trazabilidad y telemetría de arquitectura {i}'))

rows = []
for i, (id_ev, cod, nom, sev, desc) in enumerate(eventos_aud):
    if i == 29:
        rows.append(f"({id_ev}, N'{cod}', N'{nom}', N'{sev}', N'{desc}', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_ev}, N'{cod}', N'{nom}', N'{sev}', N'{desc}', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT auditoria.tipos_evento_sistema OFF;")
p("GO\n")

# 147. auditoria.bitacora_seguridad_global (30 logs con hash HMAC-SHA256 - Arts 211 bis 1-7 CPF)
p("-- 147. TABLA: auditoria.bitacora_seguridad_global")
p("SET IDENTITY_INSERT auditoria.bitacora_seguridad_global ON;")
p("INSERT INTO auditoria.bitacora_seguridad_global (id_bitacora_seguridad, id_tipo_evento, id_usuario, direccion_ip, user_agent, accion_ejecutada, datos_contexto_hash_hmac256, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    ev_id = ((i - 1) % 10) + 1
    usr_id = i
    ip = f"189.155.{i}.{20 + i}"
    ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0"
    acc = f"Ejecución de consulta forense autenticada y validada por token JWT {i}"
    hmac_hash = f"HMAC-SHA256-FORENSIC-SEAL-INTEGRITY-RECORD-{i:05d}-LEGAL"
    if i == 30:
        rows.append(f"({i}, {ev_id}, {usr_id}, '{ip}', '{ua}', N'{acc}', '{hmac_hash}', '2025-01-01 10:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {ev_id}, {usr_id}, '{ip}', '{ua}', N'{acc}', '{hmac_hash}', SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT auditoria.bitacora_seguridad_global OFF;")
p("GO\n")

# 148. auditoria.bitacora_cambios_datos (30 registros DML con JSON de auditoría)
p("-- 148. TABLA: auditoria.bitacora_cambios_datos")
p("SET IDENTITY_INSERT auditoria.bitacora_cambios_datos ON;")
p("INSERT INTO auditoria.bitacora_cambios_datos (id_cambio_dato, esquema_afectado, tabla_afectada, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, fecha_modificacion_dato, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    esq = "catalogo" if i % 2 == 0 else "ventas"
    tab = "variantes_sku" if esq == "catalogo" else "ordenes"
    top = "UPDATE" if i % 3 != 0 else "SOFT_DELETE"
    json_ant = f'{{"id": {i}, "precio": {500 + i*10}, "activo": 1}}'
    json_nue = f'{{"id": {i}, "precio": {550 + i*10}, "activo": {0 if top == "SOFT_DELETE" else 1}}}'
    if i == 30:
        rows.append(f"({i}, 'seguridad', 'usuarios', 30, N'SOFT_DELETE', '{json_ant}', '{json_nue}', '2025-01-01 12:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, N'{esq}', N'{tab}', {i}, N'{top}', '{json_ant}', '{json_nue}', SYSDATETIME(), 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT auditoria.bitacora_cambios_datos OFF;")
p("GO\n")

# 149. sistema.parametros_configuracion (30 parámetros)
p("-- 149. TABLA: sistema.parametros_configuracion")
p("SET IDENTITY_INSERT sistema.parametros_configuracion ON;")
p("INSERT INTO sistema.parametros_configuracion (id_parametro, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
parametros = [
    (1, 'TASA_IVA_NACIONAL', '16.00', 'DECIMAL', 'Porcentaje de impuesto al valor agregado general para México', 1),
    (2, 'MONTO_MINIMO_ENVIO_GRATIS', '999.00', 'DECIMAL', 'Importe del carrito a partir del cual se exenta el costo logístico', 1),
    (3, 'MAX_INTENTOS_LOGIN_FALLIDOS', '5', 'INTEGER', 'Número de intentos antes del bloqueo temporal de seguridad de la cuenta', 1),
    (4, 'DURACION_TOKEN_JWT_MINUTOS', '120', 'INTEGER', 'Tiempo de expiración de la sesión activa de usuario', 1),
    (5, 'DIAS_EXPIRACION_ORDEN_SPEI', '2', 'INTEGER', 'Plazo en días hábiles para liquidar referencia bancaria SPEI u OXXO', 1),
    (6, 'CADUCIDAD_MINIMA_VENTA_DIAS', '90', 'INTEGER', 'Umbral mínimo de caducidad en almacén para permitir venta ordinaria (FEFO)', 1),
    (7, 'CORREO_NOTIFICACIONES_SISTEMA', 'notificaciones@ecommerce-salud.mx', 'STRING', 'Dirección de correo de salida transaccional SMTP / SES', 1),
    (8, 'SCORE_MAXIMO_ANTIFRAUDE_PERMITIDO', '70', 'INTEGER', 'Puntaje de corte de riesgo transaccional para requerir validación 3DS', 1),
    (9, 'POLITICA_REEMBOLSOS_GARANTIA_DIAS', '30', 'INTEGER', 'Plazo legal y comercial para solicitar devolución RMA de satisfacción', 1),
    (10, 'HABILITAR_COMPRA_SIN_REGISTRO', 'false', 'BOOLEAN', 'Obligatoriedad de crear cuenta para cumplir con consentimiento LFPDPPP', 1),
]
for i in range(11, 31):
    parametros.append((i, f'CONFIG_PARAM_SISTEMA_{i:02d}', f'VALOR_{i}', 'STRING', f'Parámetro dinámico de arquitectura de microservicios {i}', 1))

rows = []
for i, (id_p, clave, val, tdato, desc, mod) in enumerate(parametros):
    if i == 29:
        rows.append(f"({id_p}, N'{clave}', N'{val}', N'{tdato}', N'{desc}', {mod}, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({id_p}, N'{clave}', N'{val}', N'{tdato}', N'{desc}', {mod}, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT sistema.parametros_configuracion OFF;")
p("GO\n")

# 150. sistema.notificaciones_push_email (30 notificaciones)
p("-- 150. TABLA: sistema.notificaciones_push_email")
p("SET IDENTITY_INSERT sistema.notificaciones_push_email ON;")
p("INSERT INTO sistema.notificaciones_push_email (id_notificacion, id_usuario_destinatario, tipo_canal, plantilla_codigo, asunto, destinatario_contacto, fecha_envio_programada, enviada_con_exito, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES")
rows = []
for i in range(1, 31):
    usr_id = i
    canal = 'EMAIL' if i % 2 == 0 else 'PUSH_APP'
    plantilla = 'PLANTILLA_ORDEN_CONFIRMADA' if i <= 15 else 'PLANTILLA_GUIA_RASTREO'
    asunto = f"Actualización sobre tu pedido dermatológico #{1000 + i}"
    dest = f"usuario{i}@correo.com" if canal == 'EMAIL' else f"DEVICE-PUSH-TOKEN-{i:06d}"
    if i == 30:
        rows.append(f"({i}, {usr_id}, N'SMS', N'PLANTILLA_MFA_OTP', N'Código de verificación', '+525550000030', '2025-01-01 10:00:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1)")
    else:
        rows.append(f"({i}, {usr_id}, N'{canal}', N'{plantilla}', N'{asunto}', N'{dest}', SYSDATETIME(), 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL)")
p(",\n".join(rows) + ";")
p("SET IDENTITY_INSERT sistema.notificaciones_push_email OFF;")
p("GO\n")

p("PRINT '=================================================================================================';")
p("PRINT 'ÉXITO TOTAL: Se han insertado con éxito las 50 tablas del Submódulo 3 (Integrante 3).';")
p("PRINT 'Total de tablas pobladas: 50 (101 a 150) | Registros por tabla: >= 30 | Integridad y Auditoría Activa.';")
p("PRINT '=================================================================================================';")
p("GO\n")

with open(output_path, "w", encoding="utf-8") as f:
    f.writelines(out)

print(f"Submódulo 3 generado exitosamente: {output_path}")
print(f"Tamaño: {len(''.join(out))} caracteres.")
