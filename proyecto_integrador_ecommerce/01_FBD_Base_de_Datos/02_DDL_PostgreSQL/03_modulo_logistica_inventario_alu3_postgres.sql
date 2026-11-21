-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVIOS, RMA Y AUDITORÍA FORENSE
-- AUTOR / INTEGRANTE 3: Estudiante 3 (Responsable de Tablas 101 a 150)
-- SGBD DESTINO: PostgreSQL 14 / 15 / 16 (Motor de Software Libre)
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

CREATE SCHEMA IF NOT EXISTS compras;
CREATE SCHEMA IF NOT EXISTS wms;
CREATE SCHEMA IF NOT EXISTS envios;
CREATE SCHEMA IF NOT EXISTS postventa;
CREATE SCHEMA IF NOT EXISTS auditoria;
CREATE SCHEMA IF NOT EXISTS sistema;

-- =================================================================================================
-- SECCIÓN 3.1: COMPRAS, PROVEEDORES Y RECEPCIÓN SANITARIA (TABLAS 101 - 112)
-- =================================================================================================

-- 101. TABLA: compras.estados_orden_compra (Catálogo 17)
DROP TABLE IF EXISTS compras.estados_orden_compra CASCADE;
CREATE TABLE compras.estados_orden_compra (
    id_estado_oc BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_estado VARCHAR(20) NOT NULL UNIQUE,
    nombre_estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 102. TABLA: compras.proveedores (Maestra)
DROP TABLE IF EXISTS compras.proveedores CASCADE;
CREATE TABLE compras.proveedores (
    id_proveedor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_proveedor VARCHAR(30) NOT NULL UNIQUE,
    razon_social VARCHAR(150) NOT NULL,
    nombre_comercial VARCHAR(120) NOT NULL,
    rfc_proveedor VARCHAR(13) NOT NULL UNIQUE,
    pais_origen VARCHAR(60) NOT NULL,
    dias_credito_pago INT NOT NULL DEFAULT 30,
    calificacion_calidad_sanitaria NUMERIC(3,2) NOT NULL DEFAULT 5.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 103. TABLA: compras.contactos_proveedor (Transaccional)
DROP TABLE IF EXISTS compras.contactos_proveedor CASCADE;
CREATE TABLE compras.contactos_proveedor (
    id_contacto_proveedor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proveedor BIGINT NOT NULL,
    nombre_contacto VARCHAR(100) NOT NULL,
    puesto_cargo VARCHAR(80) NOT NULL,
    email_contacto VARCHAR(150) NOT NULL,
    telefono_directo VARCHAR(20) NOT NULL,
    es_contacto_principal BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_cp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));

-- 104. TABLA: compras.proveedor_slas (Transaccional SLAs)
DROP TABLE IF EXISTS compras.proveedor_slas CASCADE;
CREATE TABLE compras.proveedor_slas (
    id_proveedor_sla BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proveedor BIGINT NOT NULL,
    tiempo_promedio_entrega_dias INT NOT NULL CHECK (tiempo_promedio_entrega_dias >= 1),
    porcentaje_tolerancia_mermas NUMERIC(4,2) NOT NULL DEFAULT 0.50,
    penalizacion_por_dia_retraso_porc NUMERIC(4,2) NOT NULL DEFAULT 1.00,
    vigencia_acuerdo_fin DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_sla_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));

-- 105. TABLA: compras.proveedor_productos (Intermedia N:M)
DROP TABLE IF EXISTS compras.proveedor_productos CASCADE;
CREATE TABLE compras.proveedor_productos (
    id_proveedor_producto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proveedor BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    codigo_articulo_proveedor VARCHAR(50) NOT NULL,
    costo_negociado_unitario NUMERIC(12,2) NOT NULL CHECK (costo_negociado_unitario > 0),
    lote_minimo_compra INT NOT NULL DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_compras_pp_prov_sku UNIQUE (proveedor, variante_sku),
    CONSTRAINT FK_compras_pp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_pp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 106. TABLA: compras.requisiciones (Transaccional)
DROP TABLE IF EXISTS compras.requisiciones CASCADE;
CREATE TABLE compras.requisiciones (
    id_requisicion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_requisicion VARCHAR(35) NOT NULL UNIQUE,
    departamento_solicitante VARCHAR(80) NOT NULL,
    prioridad VARCHAR(25) NOT NULL CHECK (prioridad IN ('BAJA', 'MEDIA', 'URGENTE_DESABASTO')),
    motivo_solicitud VARCHAR(300) NOT NULL,
    fecha_limite_requerida DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 107. TABLA: compras.requisiciones_detalles (Transaccional)
DROP TABLE IF EXISTS compras.requisiciones_detalles CASCADE;
CREATE TABLE compras.requisiciones_detalles (
    id_requisicion_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    requisicion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_requerida INT NOT NULL CHECK (cantidad_requerida >= 1),
    cantidad_aprobada INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_compras_rd_req_sku UNIQUE (requisicion, variante_sku),
    CONSTRAINT FK_compras_rd_requisicion FOREIGN KEY (requisicion) REFERENCES compras.requisiciones(id_requisicion),
    CONSTRAINT FK_compras_rd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 108. TABLA: compras.ordenes_compra (Maestra OC)
DROP TABLE IF EXISTS compras.ordenes_compra CASCADE;
CREATE TABLE compras.ordenes_compra (
    id_orden_compra BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_orden_compra VARCHAR(35) NOT NULL UNIQUE,
    proveedor BIGINT NOT NULL,
    estado_oc BIGINT NOT NULL,
    fecha_emision TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_entrega_esperada DATE NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    total_iva NUMERIC(12,2) NOT NULL,
    total_orden_compra NUMERIC(12,2) NOT NULL,
    condiciones_pago VARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_oc_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_oc_estado FOREIGN KEY (estado_oc) REFERENCES compras.estados_orden_compra(id_estado_oc));

-- 109. TABLA: compras.ordenes_compra_detalles (Transaccional)
DROP TABLE IF EXISTS compras.ordenes_compra_detalles CASCADE;
CREATE TABLE compras.ordenes_compra_detalles (
    id_orden_compra_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden_compra BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_pedida INT NOT NULL CHECK (cantidad_pedida >= 1),
    cantidad_recibida INT NOT NULL DEFAULT 0,
    costo_unitario_compra NUMERIC(12,2) NOT NULL,
    importe_total_linea NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_compras_ocd_oc_sku UNIQUE (orden_compra, variante_sku),
    CONSTRAINT FK_compras_ocd_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra),
    CONSTRAINT FK_compras_ocd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 110. TABLA: compras.recepciones_mercancia (Transaccional)
DROP TABLE IF EXISTS compras.recepciones_mercancia CASCADE;
CREATE TABLE compras.recepciones_mercancia (
    id_recepcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_recepcion VARCHAR(35) NOT NULL UNIQUE,
    orden_compra BIGINT NOT NULL,
    numero_remision_proveedor VARCHAR(60) NOT NULL,
    fecha_ingreso_muelle TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observaciones_chofer_transporte VARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_rm_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra));

-- 111. TABLA: compras.recepciones_detalles (Transaccional)
DROP TABLE IF EXISTS compras.recepciones_detalles CASCADE;
CREATE TABLE compras.recepciones_detalles (
    id_recepcion_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recepcion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_recibida_bultos INT NOT NULL,
    cantidad_unidades_inspeccionadas INT NOT NULL,
    temperatura_llegada_celsius NUMERIC(4,1) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_recd_recepcion FOREIGN KEY (recepcion) REFERENCES compras.recepciones_mercancia(id_recepcion),
    CONSTRAINT FK_compras_recd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 112. TABLA: compras.inspecciones_sanitarias_qa (Transaccional QA)
DROP TABLE IF EXISTS compras.inspecciones_sanitarias_qa CASCADE;
CREATE TABLE compras.inspecciones_sanitarias_qa (
    id_inspeccion_qa BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recepcion_detalle BIGINT NOT NULL,
    sellos_sanitarios_intactos BOOLEAN NOT NULL,
    empaque_sin_derrames BOOLEAN NOT NULL,
    codigo_lote_laboratorio VARCHAR(50) NOT NULL,
    fecha_caducidad_impresa DATE NOT NULL,
    dictamen_qa VARCHAR(25) NOT NULL CHECK (dictamen_qa IN ('APROBADO', 'RECHAZADO_DEVOLVER', 'RETENIDO_EN_CUARENTENA')),
    justificacion_sanitaria VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_qa_recdetalle FOREIGN KEY (recepcion_detalle) REFERENCES compras.recepciones_detalles(id_recepcion_detalle));

-- =================================================================================================
-- SECCIÓN 3.2: WMS, LOTES SANITARIOS, CADUCIDAD FEFO Y SENSORES (TABLAS 113 - 126)
-- =================================================================================================

-- 113. TABLA: wms.almacenes_cedis (Maestra CEDIS)
DROP TABLE IF EXISTS wms.almacenes_cedis CASCADE;
CREATE TABLE wms.almacenes_cedis (
    id_almacen BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_almacen VARCHAR(20) NOT NULL UNIQUE,
    nombre_almacen VARCHAR(100) NOT NULL,
    calle_numero VARCHAR(150) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    capacidad_volumetrica_m3 NUMERIC(10,2) NOT NULL,
    cuenta_con_cadena_frio BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 114. TABLA: wms.zonas_almacen (Maestra Zonas)
DROP TABLE IF EXISTS wms.zonas_almacen CASCADE;
CREATE TABLE wms.zonas_almacen (
    id_zona_almacen BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    almacen BIGINT NOT NULL,
    codigo_zona VARCHAR(25) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    temperatura_min_celsius NUMERIC(4,1) NOT NULL,
    temperatura_max_celsius NUMERIC(4,1) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_wms_za_almacen_zona UNIQUE (almacen, codigo_zona),
    CONSTRAINT FK_wms_za_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));

-- 115. TABLA: wms.pasillos_ubicaciones (Maestra Racks/Bines)
DROP TABLE IF EXISTS wms.pasillos_ubicaciones CASCADE;
CREATE TABLE wms.pasillos_ubicaciones (
    id_ubicacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    zona_almacen BIGINT NOT NULL,
    codigo_ubicacion VARCHAR(30) NOT NULL UNIQUE,
    peso_maximo_kg NUMERIC(8,2) NOT NULL,
    es_bloqueada_auditoria BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_pu_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));

-- 116. TABLA: wms.tipos_movimiento_inventario (Catálogo 18)
DROP TABLE IF EXISTS wms.tipos_movimiento_inventario CASCADE;
CREATE TABLE wms.tipos_movimiento_inventario (
    id_tipo_movimiento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_movimiento VARCHAR(25) NOT NULL UNIQUE,
    nombre_movimiento VARCHAR(60) NOT NULL,
    signo_afectacion INT NOT NULL CHECK (signo_afectacion IN (1, -1)),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 117. TABLA: wms.lotes_fabricacion_sanitaria (Maestra Lotes FEFO)
DROP TABLE IF EXISTS wms.lotes_fabricacion_sanitaria CASCADE;
CREATE TABLE wms.lotes_fabricacion_sanitaria (
    id_lote BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL,
    numero_lote_fabricante VARCHAR(60) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_caducidad DATE NOT NULL,
    certificado_calidad_lote_url VARCHAR(300) NOT NULL,
    cuarentena_sanitaria BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_wms_lfs_sku_lote UNIQUE (variante_sku, numero_lote_fabricante),
    CONSTRAINT FK_wms_lfs_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 118. TABLA: wms.inventario_lotes_ubicacion (Transaccional Stock)
DROP TABLE IF EXISTS wms.inventario_lotes_ubicacion CASCADE;
CREATE TABLE wms.inventario_lotes_ubicacion (
    id_inventario_stock BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lote BIGINT NOT NULL,
    ubicacion BIGINT NOT NULL,
    stock_disponible INT NOT NULL CHECK (stock_disponible >= 0),
    stock_apartado_pedidos INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_wms_ilu_lote_ubic UNIQUE (lote, ubicacion),
    CONSTRAINT FK_wms_ilu_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote),
    CONSTRAINT FK_wms_ilu_ubicacion FOREIGN KEY (ubicacion) REFERENCES wms.pasillos_ubicaciones(id_ubicacion));

-- 119. TABLA: wms.kardex_movimientos (Bitácora Transaccional)
DROP TABLE IF EXISTS wms.kardex_movimientos CASCADE;
CREATE TABLE wms.kardex_movimientos (
    id_kardex BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    inventario_stock BIGINT NOT NULL,
    tipo_movimiento BIGINT NOT NULL,
    cantidad_movimiento INT NOT NULL CHECK (cantidad_movimiento > 0),
    saldo_anterior INT NOT NULL,
    saldo_resultante INT NOT NULL,
    folio_documento_origen VARCHAR(50) NOT NULL,
    costo_unitario_movimiento NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_km_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock),
    CONSTRAINT FK_wms_km_tipo FOREIGN KEY (tipo_movimiento) REFERENCES wms.tipos_movimiento_inventario(id_tipo_movimiento));

-- 120. TABLA: wms.alertas_caducidad_proxima (Transaccional)
DROP TABLE IF EXISTS wms.alertas_caducidad_proxima CASCADE;
CREATE TABLE wms.alertas_caducidad_proxima (
    id_alerta_caducidad BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lote BIGINT NOT NULL,
    dias_restantes_vida_util INT NOT NULL,
    nivel_urgencia VARCHAR(25) NOT NULL CHECK (nivel_urgencia IN ('PREVENTIVA_90D', 'MODERADA_60D', 'CRITICA_30D', 'EXPIRADO')),
    accion_comercial_sugerida VARCHAR(150) NOT NULL,
    atendida BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_acp_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 121. TABLA: wms.mermas_destruccion_sanitaria (Transaccional Actas Sanitarias)
DROP TABLE IF EXISTS wms.mermas_destruccion_sanitaria CASCADE;
CREATE TABLE wms.mermas_destruccion_sanitaria (
    id_merma_destruccion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_acta_destruccion VARCHAR(35) NOT NULL UNIQUE,
    lote BIGINT NOT NULL,
    cantidad_unidades_destruidas INT NOT NULL CHECK (cantidad_unidades_destruidas >= 1),
    motivo_sanitario VARCHAR(200) NOT NULL,
    empresa_manifiesto_ecologico VARCHAR(120) NOT NULL,
    acta_circunstanciada_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_mds_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 122. TABLA: wms.transferencias_almacenes (Transaccional)
DROP TABLE IF EXISTS wms.transferencias_almacenes CASCADE;
CREATE TABLE wms.transferencias_almacenes (
    id_transferencia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_transferencia VARCHAR(35) NOT NULL UNIQUE,
    almacen_origen BIGINT NOT NULL,
    almacen_destino BIGINT NOT NULL,
    estado_transferencia VARCHAR(25) NOT NULL CHECK (estado_transferencia IN ('SOLICITADA', 'EN_TRANSITO', 'RECIBIDA_COMPLETA', 'DISCREPANCIA')),
    fecha_despacho TIMESTAMPTZ NULL,
    fecha_arribo TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_ta_origen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen),
    CONSTRAINT FK_wms_ta_destino FOREIGN KEY (almacen_destino) REFERENCES wms.almacenes_cedis(id_almacen));

-- 123. TABLA: wms.transferencias_detalles (Transaccional)
DROP TABLE IF EXISTS wms.transferencias_detalles CASCADE;
CREATE TABLE wms.transferencias_detalles (
    id_transferencia_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transferencia BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_enviada INT NOT NULL CHECK (cantidad_enviada >= 1),
    cantidad_recibida INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_td_transf FOREIGN KEY (transferencia) REFERENCES wms.transferencias_almacenes(id_transferencia),
    CONSTRAINT FK_wms_td_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 124. TABLA: wms.conteos_ciclicos_auditoria (Transaccional)
DROP TABLE IF EXISTS wms.conteos_ciclicos_auditoria CASCADE;
CREATE TABLE wms.conteos_ciclicos_auditoria (
    id_conteo_ciclico BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_auditoria VARCHAR(35) NOT NULL UNIQUE,
    almacen BIGINT NOT NULL,
    fecha_conteo DATE NOT NULL,
    tipo_conteo VARCHAR(25) NOT NULL CHECK (tipo_conteo IN ('ALEATORIO', 'ALTO_VALOR_SKU', 'PROXIMO_A_CADUCAR')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_cca_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));

-- 125. TABLA: wms.conteos_ciclicos_detalles (Transaccional)
DROP TABLE IF EXISTS wms.conteos_ciclicos_detalles CASCADE;
CREATE TABLE wms.conteos_ciclicos_detalles (
    id_conteo_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    conteo_ciclico BIGINT NOT NULL,
    inventario_stock BIGINT NOT NULL,
    stock_sistema_teorico INT NOT NULL,
    stock_conteo_fisico INT NOT NULL,
    diferencia_piezas INT NOT NULL,
    justificacion_ajuste VARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_ccd_conteo FOREIGN KEY (conteo_ciclico) REFERENCES wms.conteos_ciclicos_auditoria(id_conteo_ciclico),
    CONSTRAINT FK_wms_ccd_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock));

-- 126. TABLA: wms.monitoreo_temperatura_humedad (Transaccional IoT)
DROP TABLE IF EXISTS wms.monitoreo_temperatura_humedad CASCADE;
CREATE TABLE wms.monitoreo_temperatura_humedad (
    id_telemetria_sensor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    zona_almacen BIGINT NOT NULL,
    codigo_sensor_iot VARCHAR(30) NOT NULL,
    temperatura_registrada_celsius NUMERIC(4,1) NOT NULL,
    humedad_relativa_porcentaje NUMERIC(4,1) NOT NULL,
    alerta_fuera_de_rango BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_hora_lectura TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_mth_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));

-- =================================================================================================
-- SECCIÓN 3.3: LOGÍSTICA, ENVÍOS, ÚLTIMA MILLA Y PAQUETERÍAS (TABLAS 127 - 138)
-- =================================================================================================

-- 127. TABLA: envios.transportistas_paqueterias (Catálogo 19)
DROP TABLE IF EXISTS envios.transportistas_paqueterias CASCADE;
CREATE TABLE envios.transportistas_paqueterias (
    id_transportista BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_transportista VARCHAR(20) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(60) NOT NULL,
    api_endpoint_tracking VARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 128. TABLA: envios.tipos_servicio_envio (Catálogo 20)
DROP TABLE IF EXISTS envios.tipos_servicio_envio CASCADE;
CREATE TABLE envios.tipos_servicio_envio (
    id_servicio_envio BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_servicio VARCHAR(20) NOT NULL UNIQUE,
    nombre_servicio VARCHAR(60) NOT NULL,
    tiempo_garantizado_horas INT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 129. TABLA: envios.tarifas_zonas_postales (Transaccional)
DROP TABLE IF EXISTS envios.tarifas_zonas_postales CASCADE;
CREATE TABLE envios.tarifas_zonas_postales (
    id_tarifa_zona BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    codigo_postal_origen_prefijo VARCHAR(3) NOT NULL,
    codigo_postal_destino_prefijo VARCHAR(3) NOT NULL,
    peso_limite_kg NUMERIC(6,2) NOT NULL,
    costo_base_envio NUMERIC(12,2) NOT NULL,
    costo_kg_adicional NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_tzp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_tzp_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));

-- 130. TABLA: envios.despachos_orden (Maestra Envíos)
DROP TABLE IF EXISTS envios.despachos_orden CASCADE;
CREATE TABLE envios.despachos_orden (
    id_despacho BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_despacho VARCHAR(35) NOT NULL UNIQUE,
    orden_split BIGINT NOT NULL,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    fecha_recoleccion_paqueteria TIMESTAMPTZ NULL,
    fecha_promesa_entrega DATE NOT NULL,
    fecha_entrega_real TIMESTAMPTZ NULL,
    estado_envio VARCHAR(30) NOT NULL CHECK (estado_envio IN ('PREPARANDO_PAQUETE', 'RECOLECTADO', 'EN_TRANSITO', 'EN_RUTA_LOCAL', 'ENTREGADO', 'INCIDENCIA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_do_split FOREIGN KEY (orden_split) REFERENCES ventas.ordenes_splits_almacen(id_orden_split),
    CONSTRAINT FK_envios_do_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_do_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));

-- 131. TABLA: envios.paquetes_bultos (Transaccional)
DROP TABLE IF EXISTS envios.paquetes_bultos CASCADE;
CREATE TABLE envios.paquetes_bultos (
    id_paquete_bulto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL,
    codigo_bulto VARCHAR(40) NOT NULL UNIQUE,
    peso_bruto_kg NUMERIC(6,2) NOT NULL,
    alto_cm NUMERIC(5,1) NOT NULL,
    ancho_cm NUMERIC(5,1) NOT NULL,
    largo_cm NUMERIC(5,1) NOT NULL,
    peso_volumetrico_kg NUMERIC(8,2) GENERATED ALWAYS AS (alto_cm * ancho_cm * largo_cm / 5000.0) STORED,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_pb_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 132. TABLA: envios.paquetes_contenido_lotes (Transaccional)
DROP TABLE IF EXISTS envios.paquetes_contenido_lotes CASCADE;
CREATE TABLE envios.paquetes_contenido_lotes (
    id_contenido_paquete BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    paquete_bulto BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_piezas_en_paquete INT NOT NULL CHECK (cantidad_piezas_en_paquete >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_pcl_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto),
    CONSTRAINT FK_envios_pcl_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle),
    CONSTRAINT FK_envios_pcl_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 133. TABLA: envios.guias_rastreo (Transaccional)
DROP TABLE IF EXISTS envios.guias_rastreo CASCADE;
CREATE TABLE envios.guias_rastreo (
    id_guia_rastreo BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    paquete_bulto BIGINT NOT NULL,
    numero_guia_tracking VARCHAR(80) NOT NULL UNIQUE,
    url_rastreo_directo VARCHAR(300) NOT NULL,
    etiqueta_pdf_base64_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_gr_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto));

-- 134. TABLA: envios.eventos_tracking_bitacora (Bitácora)
DROP TABLE IF EXISTS envios.eventos_tracking_bitacora CASCADE;
CREATE TABLE envios.eventos_tracking_bitacora (
    id_evento_tracking BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    guia_rastreo BIGINT NOT NULL,
    codigo_estatus_paqueteria VARCHAR(40) NOT NULL,
    descripcion_evento VARCHAR(250) NOT NULL,
    ubicacion_ciudad_evento VARCHAR(100) NOT NULL,
    fecha_hora_evento TIMESTAMPTZ NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_etb_guia FOREIGN KEY (guia_rastreo) REFERENCES envios.guias_rastreo(id_guia_rastreo));

-- 135. TABLA: envios.intentos_entrega_fallidos (Transaccional)
DROP TABLE IF EXISTS envios.intentos_entrega_fallidos CASCADE;
CREATE TABLE envios.intentos_entrega_fallidos (
    id_intento_fallido BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL,
    numero_visita INT NOT NULL CHECK (numero_visita BETWEEN 1 AND 3),
    motivo_no_entrega VARCHAR(150) NOT NULL,
    fecha_intento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_ief_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 136. TABLA: envios.incidencias_logisticas (Transaccional)
DROP TABLE IF EXISTS envios.incidencias_logisticas CASCADE;
CREATE TABLE envios.incidencias_logisticas (
    id_incidencia_logistica BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL,
    tipo_incidencia VARCHAR(30) NOT NULL CHECK (tipo_incidencia IN ('EXTRAVIO_TOTAL', 'PAQUETE_DANADO_DERRAME', 'ROBO_EN_TRANSITO', 'DIRECCION_INEXISTENTE')),
    descripcion_hechos VARCHAR(500) NOT NULL,
    indemnizacion_reclamada NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_il_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 137. TABLA: envios.seguros_mercancia (Transaccional)
DROP TABLE IF EXISTS envios.seguros_mercancia CASCADE;
CREATE TABLE envios.seguros_mercancia (
    id_seguro_envio BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL UNIQUE,
    aseguradora VARCHAR(100) NOT NULL,
    numero_poliza VARCHAR(60) NOT NULL,
    valor_asegurado NUMERIC(12,2) NOT NULL,
    costo_prima NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_sm_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 138. TABLA: envios.puntos_recoleccion_pickup (Maestra)
DROP TABLE IF EXISTS envios.puntos_recoleccion_pickup CASCADE;
CREATE TABLE envios.puntos_recoleccion_pickup (
    id_punto_pickup BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transportista BIGINT NOT NULL,
    almacen_origen BIGINT NOT NULL,
    codigo_locker VARCHAR(30) NOT NULL UNIQUE,
    nombre_establecimiento VARCHAR(100) NOT NULL,
    direccion_completa VARCHAR(200) NOT NULL,
    horario_atencion VARCHAR(100) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_prp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_prp_almacen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen)
);

-- =================================================================================================
-- SECCIÓN 3.4: POSTVENTA, RMA, FARMACOVIGILANCIA Y AUDITORÍA FORENSE (TABLAS 139 - 150)
-- =================================================================================================

-- 139. TABLA: postventa.motivos_devolucion_rma (Catálogo 21)
DROP TABLE IF EXISTS postventa.motivos_devolucion_rma CASCADE;
CREATE TABLE postventa.motivos_devolucion_rma (
    id_motivo_rma BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_motivo VARCHAR(25) NOT NULL UNIQUE,
    descripcion_motivo VARCHAR(150) NOT NULL,
    requiere_dictamen_medico BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 140. TABLA: postventa.solicitudes_rma (Maestra RMA)
DROP TABLE IF EXISTS postventa.solicitudes_rma CASCADE;
CREATE TABLE postventa.solicitudes_rma (
    id_solicitud_rma BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_rma VARCHAR(35) NOT NULL UNIQUE,
    orden BIGINT NOT NULL,
    motivo_rma BIGINT NOT NULL,
    estado_rma VARCHAR(30) NOT NULL CHECK (estado_rma IN ('SOLICITADA', 'GUIA_RETORNO_EMITIDA', 'RECIBIDA_EN_QA', 'APROBADA_REEMBOLSAR', 'RECHAZADA_POR_HIGIENE')),
    fotografia_evidencia_url VARCHAR(300) NOT NULL,
    descripcion_caso_cliente VARCHAR(500) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_srma_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_postventa_srma_motivo FOREIGN KEY (motivo_rma) REFERENCES postventa.motivos_devolucion_rma(id_motivo_rma));

-- 141. TABLA: postventa.rma_detalles (Transaccional)
DROP TABLE IF EXISTS postventa.rma_detalles CASCADE;
CREATE TABLE postventa.rma_detalles (
    id_rma_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    solicitud_rma BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    cantidad_devuelta INT NOT NULL CHECK (cantidad_devuelta >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_rd_rma FOREIGN KEY (solicitud_rma) REFERENCES postventa.solicitudes_rma(id_solicitud_rma),
    CONSTRAINT FK_postventa_rd_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle));

-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (Transaccional)
DROP TABLE IF EXISTS postventa.inspeccion_sanitaria_retorno CASCADE;
CREATE TABLE postventa.inspeccion_sanitaria_retorno (
    id_inspeccion_retorno BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rma_detalle BIGINT NOT NULL UNIQUE,
    sello_seguridad_fue_abierto BOOLEAN NOT NULL,
    contenido_usado_porcentaje NUMERIC(4,1) NOT NULL,
    destino_sanitario_autorizado VARCHAR(40) NOT NULL CHECK (destino_sanitario_autorizado IN ('DESTRUCCION_INMEDIATA_RESIDUOS', 'DONACION_REACONDICIONADA', 'REINGRESO_STOCK_SELLADO')),
    dictamen_auditor VARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_isr_rmadetalle FOREIGN KEY (rma_detalle) REFERENCES postventa.rma_detalles(id_rma_detalle));

-- 143. TABLA: postventa.tickets_soporte (Maestra Soporte)
DROP TABLE IF EXISTS postventa.tickets_soporte CASCADE;
CREATE TABLE postventa.tickets_soporte (
    id_ticket BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_ticket VARCHAR(35) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    asunto VARCHAR(120) NOT NULL,
    categoria_ticket VARCHAR(30) NOT NULL CHECK (categoria_ticket IN ('ENVIO_DEMORADO', 'ASESORIA_DERMATOLOGICA', 'FACTURACION_CFDI', 'PRODUCTO_DEFECTUOSO')),
    prioridad VARCHAR(20) NOT NULL CHECK (prioridad IN ('BAJA', 'MEDIA', 'ALTA', 'URGENTE')),
    estado_ticket VARCHAR(25) NOT NULL CHECK (estado_ticket IN ('ABIERTO', 'EN_PROCESO', 'ESPERANDO_CLIENTE', 'RESUELTO', 'CERRADO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_ts_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 144. TABLA: postventa.tickets_mensajes (Transaccional)
DROP TABLE IF EXISTS postventa.tickets_mensajes CASCADE;
CREATE TABLE postventa.tickets_mensajes (
    id_ticket_mensaje BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ticket BIGINT NOT NULL,
    usuario_emisor BIGINT NOT NULL,
    mensaje_cuerpo TEXT NOT NULL,
    adjunto_url VARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_tm_ticket FOREIGN KEY (ticket) REFERENCES postventa.tickets_soporte(id_ticket),
    CONSTRAINT FK_postventa_tm_usuario FOREIGN KEY (usuario_emisor) REFERENCES seguridad.usuarios(id_usuario));

-- 145. TABLA: postventa.reportes_farmacovigilancia (Transaccional COFEPRIS)
DROP TABLE IF EXISTS postventa.reportes_farmacovigilancia CASCADE;
CREATE TABLE postventa.reportes_farmacovigilancia (
    id_reporte_farmacovigilancia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_cofepris_ram VARCHAR(45) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    producto BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    sintomas_reaccion_adversa TEXT NOT NULL,
    requirio_atencion_hospitalaria BOOLEAN NOT NULL,
    fecha_aparicion_sintomas DATE NOT NULL,
    notificado_a_autoridad_sanitaria BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_rf_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_postventa_rf_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_postventa_rf_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 146. TABLA: auditoria.tipos_evento_sistema (Catálogo 22)
DROP TABLE IF EXISTS auditoria.tipos_evento_sistema CASCADE;
CREATE TABLE auditoria.tipos_evento_sistema (
    id_tipo_evento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_evento VARCHAR(35) NOT NULL UNIQUE,
    nombre_evento VARCHAR(80) NOT NULL,
    nivel_severidad VARCHAR(25) NOT NULL CHECK (nivel_severidad IN ('INFO', 'ADVERTENCIA', 'CRITICO_SEGURIDAD')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 147. TABLA: auditoria.bitacora_seguridad_global (Bitácora Forense)
DROP TABLE IF EXISTS auditoria.bitacora_seguridad_global CASCADE;
CREATE TABLE auditoria.bitacora_seguridad_global (
    id_log_seguridad BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_evento BIGINT NOT NULL,
    usuario BIGINT NULL,
    direccion_ip VARCHAR(45) NOT NULL,
    user_agent VARCHAR(350) NOT NULL,
    modulo_origen VARCHAR(60) NOT NULL,
    descripcion_evento VARCHAR(500) NOT NULL,
    firma_integridad_hash VARCHAR(128) NOT NULL,
    fecha_evento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_auditoria_bsg_tipo FOREIGN KEY (tipo_evento) REFERENCES auditoria.tipos_evento_sistema(id_tipo_evento),
    CONSTRAINT FK_auditoria_bsg_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 148. TABLA: auditoria.bitacora_cambios_datos (Bitácora DML Forense)
DROP TABLE IF EXISTS auditoria.bitacora_cambios_datos CASCADE;
CREATE TABLE auditoria.bitacora_cambios_datos (
    id_cambio_dato BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_tabla VARCHAR(100) NOT NULL,
    id_registro_afectado BIGINT NOT NULL,
    tipo_operacion VARCHAR(15) NOT NULL CHECK (tipo_operacion IN ('INSERT', 'UPDATE', 'SOFT_DELETE')),
    valores_anteriores_json JSONB NULL,
    valores_nuevos_json JSONB NOT NULL,
    motivo_cambio VARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_auditoria_bcd_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);

-- 149. TABLA: sistema.parametros_configuracion (Maestra Parámetros)
DROP TABLE IF EXISTS sistema.parametros_configuracion CASCADE;
CREATE TABLE sistema.parametros_configuracion (
    id_parametro BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_parametro VARCHAR(60) NOT NULL UNIQUE,
    valor_parametro VARCHAR(500) NOT NULL,
    tipo_dato VARCHAR(20) NOT NULL CHECK (tipo_dato IN ('STRING', 'INTEGER', 'DECIMAL', 'BOOLEAN', 'JSON')),
    descripcion VARCHAR(250) NOT NULL,
    es_modificable_en_caliente BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_sistema_pc_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);

-- 150. TABLA: sistema.notificaciones_push_email (Transaccional)
DROP TABLE IF EXISTS sistema.notificaciones_push_email CASCADE;
CREATE TABLE sistema.notificaciones_push_email (
    id_notificacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario_destinatario BIGINT NOT NULL,
    tipo_canal VARCHAR(20) NOT NULL CHECK (tipo_canal IN ('EMAIL', 'PUSH_APP', 'SMS', 'WHATSAPP')),
    titulo_asunto VARCHAR(150) NOT NULL,
    cuerpo_mensaje TEXT NOT NULL,
    enviada BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_envio TIMESTAMPTZ NULL,
    error_envio VARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_sistema_npe_usuario FOREIGN KEY (usuario_destinatario) REFERENCES seguridad.usuarios(id_usuario));

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 3 (COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS Y AUDITORÍA)
-- =================================================================================================
CREATE INDEX IF NOT EXISTS IX_compras_oc_prov_fecha ON compras.ordenes_compra (proveedor, fecha_emision);
CREATE INDEX IF NOT EXISTS IX_compras_recep_oc_fecha ON compras.recepciones_mercancia (orden_compra, fecha_ingreso_muelle);
CREATE INDEX IF NOT EXISTS IX_compras_qa_detalle_dictamen ON compras.inspecciones_sanitarias_qa (recepcion_detalle, dictamen_qa);
CREATE INDEX IF NOT EXISTS IX_wms_lotes_sku_caducidad ON wms.lotes_fabricacion_sanitaria (variante_sku, fecha_caducidad);
CREATE INDEX IF NOT EXISTS IX_wms_inv_lote_ubicacion ON wms.inventario_lotes_ubicacion (lote, ubicacion);
CREATE INDEX IF NOT EXISTS IX_wms_alertas_lote_atendida ON wms.alertas_caducidad_proxima (lote, atendida, dias_restantes_vida_util);
CREATE INDEX IF NOT EXISTS IX_wms_telemetria_zona_fecha ON wms.monitoreo_temperatura_humedad (zona_almacen, alerta_fuera_de_rango, fecha_hora_lectura);
CREATE INDEX IF NOT EXISTS IX_envios_despachos_split_est ON envios.despachos_orden (orden_split, estado_envio);
CREATE INDEX IF NOT EXISTS IX_postventa_rma_orden_motivo ON postventa.solicitudes_rma (orden, motivo_rma, estado_rma);
CREATE INDEX IF NOT EXISTS IX_auditoria_cambios_tipo_fecha ON auditoria.bitacora_cambios_datos (tipo_operacion, fecha_creacion);
