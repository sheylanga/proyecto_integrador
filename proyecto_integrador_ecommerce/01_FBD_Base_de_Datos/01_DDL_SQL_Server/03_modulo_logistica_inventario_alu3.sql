-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVIOS, RMA Y AUDITORÍA FORENSE
-- AUTOR / INTEGRANTE 3: Estudiante 3 (Responsable de Tablas 101 a 150)
-- SGBD DESTINO: Microsoft SQL Server 2019 / 2022
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

USE EcommerceSaludBellezaDB;
GO

-- Crear esquemas lógicos para el submódulo de cadena de suministro, almacenes, logística y auditoría
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'compras') EXEC('CREATE SCHEMA compras');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'wms') EXEC('CREATE SCHEMA wms');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'envios') EXEC('CREATE SCHEMA envios');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'postventa') EXEC('CREATE SCHEMA postventa');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'auditoria') EXEC('CREATE SCHEMA auditoria');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'sistema') EXEC('CREATE SCHEMA sistema');
GO

-- =================================================================================================
-- SECCIÓN 3.1: COMPRAS, PROVEEDORES Y RECEPCIÓN SANITARIA (TABLAS 101 - 112)
-- =================================================================================================

-- 101. TABLA: compras.estados_orden_compra (Catálogo 17)
IF OBJECT_ID(N'compras.estados_orden_compra', N'U') IS NOT NULL DROP TABLE compras.estados_orden_compra;
CREATE TABLE compras.estados_orden_compra (
    id_estado_oc BIGINT IDENTITY(1,1) NOT NULL,
    codigo_estado NVARCHAR(20) NOT NULL,
    nombre_estado NVARCHAR(50) NOT NULL, -- BORRADOR, AUTORIZADA, ENVIADA_PROVEEDOR, RECIBIDA_PARCIAL, RECIBIDA_TOTAL, CANCELADA
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_eoc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_eoc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_estados_oc PRIMARY KEY CLUSTERED (id_estado_oc),
    CONSTRAINT UQ_compras_eoc_codigo UNIQUE (codigo_estado)
);
GO

-- 102. TABLA: compras.proveedores (Maestra)
IF OBJECT_ID(N'compras.proveedores', N'U') IS NOT NULL DROP TABLE compras.proveedores;
CREATE TABLE compras.proveedores (
    id_proveedor BIGINT IDENTITY(1,1) NOT NULL,
    codigo_proveedor NVARCHAR(30) NOT NULL,
    razon_social NVARCHAR(150) NOT NULL,
    nombre_comercial NVARCHAR(120) NOT NULL,
    rfc_proveedor VARCHAR(13) NOT NULL,
    pais_origen NVARCHAR(60) NOT NULL,
    dias_credito_pago INT NOT NULL CONSTRAINT DF_compras_prov_cred DEFAULT 30,
    calificacion_calidad_sanitaria DECIMAL(3,2) NOT NULL CONSTRAINT DF_compras_prov_calif DEFAULT 5.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_prov_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_prov_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_proveedores PRIMARY KEY CLUSTERED (id_proveedor),
    CONSTRAINT UQ_compras_prov_codigo UNIQUE (codigo_proveedor),
    CONSTRAINT UQ_compras_prov_rfc UNIQUE (rfc_proveedor)
);
GO

-- 103. TABLA: compras.contactos_proveedor (Transaccional)
IF OBJECT_ID(N'compras.contactos_proveedor', N'U') IS NOT NULL DROP TABLE compras.contactos_proveedor;
CREATE TABLE compras.contactos_proveedor (
    id_contacto_proveedor BIGINT IDENTITY(1,1) NOT NULL,
    proveedor BIGINT NOT NULL,
    nombre_contacto NVARCHAR(100) NOT NULL,
    puesto_cargo NVARCHAR(80) NOT NULL,
    email_contacto NVARCHAR(150) NOT NULL,
    telefono_directo NVARCHAR(20) NOT NULL,
    es_contacto_principal BIT NOT NULL CONSTRAINT DF_compras_cp_princ DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_cp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_cp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_contactos_prov PRIMARY KEY CLUSTERED (id_contacto_proveedor),
    CONSTRAINT FK_compras_cp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));
GO

-- 104. TABLA: compras.proveedor_slas (Transaccional Acuerdos de Nivel de Servicio)
IF OBJECT_ID(N'compras.proveedor_slas', N'U') IS NOT NULL DROP TABLE compras.proveedor_slas;
CREATE TABLE compras.proveedor_slas (
    id_proveedor_sla BIGINT IDENTITY(1,1) NOT NULL,
    proveedor BIGINT NOT NULL,
    tiempo_promedio_entrega_dias INT NOT NULL CONSTRAINT CK_compras_sla_dias CHECK (tiempo_promedio_entrega_dias >= 1),
    porcentaje_tolerancia_mermas DECIMAL(4,2) NOT NULL CONSTRAINT DF_compras_sla_mermas DEFAULT 0.50,
    penalizacion_por_dia_retraso_porc DECIMAL(4,2) NOT NULL CONSTRAINT DF_compras_sla_penal DEFAULT 1.00,
    vigencia_acuerdo_fin DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_sla_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_sla_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_slas PRIMARY KEY CLUSTERED (id_proveedor_sla),
    CONSTRAINT FK_compras_sla_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));
GO

-- 105. TABLA: compras.proveedor_productos (Intermedia N:M Catálogo de Precios de Compra)
IF OBJECT_ID(N'compras.proveedor_productos', N'U') IS NOT NULL DROP TABLE compras.proveedor_productos;
CREATE TABLE compras.proveedor_productos (
    id_proveedor_producto BIGINT IDENTITY(1,1) NOT NULL,
    proveedor BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    codigo_articulo_proveedor NVARCHAR(50) NOT NULL,
    costo_negociado_unitario DECIMAL(12,2) NOT NULL CONSTRAINT CK_compras_pp_costo CHECK (costo_negociado_unitario > 0),
    lote_minimo_compra INT NOT NULL CONSTRAINT DF_compras_pp_lmin DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_pp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_pp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_proveedor_sku PRIMARY KEY CLUSTERED (id_proveedor_producto),
    CONSTRAINT UQ_compras_pp_prov_sku UNIQUE (proveedor, variante_sku),
    CONSTRAINT FK_compras_pp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_pp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 106. TABLA: compras.requisiciones (Transaccional Requisiciones Internas)
IF OBJECT_ID(N'compras.requisiciones', N'U') IS NOT NULL DROP TABLE compras.requisiciones;
CREATE TABLE compras.requisiciones (
    id_requisicion BIGINT IDENTITY(1,1) NOT NULL,
    folio_requisicion NVARCHAR(35) NOT NULL,
    departamento_solicitante NVARCHAR(80) NOT NULL, -- Ej: Almacén WMS Resurtido, Dermocosmética
    prioridad NVARCHAR(20) NOT NULL CONSTRAINT CK_compras_req_prio CHECK (prioridad IN (N'BAJA', N'MEDIA', N'URGENTE_DESABASTO')),
    motivo_solicitud NVARCHAR(300) NOT NULL,
    fecha_limite_requerida DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_req_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_req_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_requisiciones PRIMARY KEY CLUSTERED (id_requisicion),
    CONSTRAINT UQ_compras_req_folio UNIQUE (folio_requisicion)
);
GO

-- 107. TABLA: compras.requisiciones_detalles (Transaccional)
IF OBJECT_ID(N'compras.requisiciones_detalles', N'U') IS NOT NULL DROP TABLE compras.requisiciones_detalles;
CREATE TABLE compras.requisiciones_detalles (
    id_requisicion_detalle BIGINT IDENTITY(1,1) NOT NULL,
    requisicion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_requerida INT NOT NULL CONSTRAINT CK_compras_rd_cant CHECK (cantidad_requerida >= 1),
    cantidad_aprobada INT NOT NULL CONSTRAINT DF_compras_rd_aprob DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_rd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_rd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_requisiciones_det PRIMARY KEY CLUSTERED (id_requisicion_detalle),
    CONSTRAINT UQ_compras_rd_req_sku UNIQUE (requisicion, variante_sku),
    CONSTRAINT FK_compras_rd_requisicion FOREIGN KEY (requisicion) REFERENCES compras.requisiciones(id_requisicion),
    CONSTRAINT FK_compras_rd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 108. TABLA: compras.ordenes_compra (Maestra Órdenes de Compra a Proveedores)
IF OBJECT_ID(N'compras.ordenes_compra', N'U') IS NOT NULL DROP TABLE compras.ordenes_compra;
CREATE TABLE compras.ordenes_compra (
    id_orden_compra BIGINT IDENTITY(1,1) NOT NULL,
    folio_orden_compra NVARCHAR(35) NOT NULL,
    proveedor BIGINT NOT NULL,
    estado_oc BIGINT NOT NULL,
    fecha_emision DATETIME2(3) NOT NULL CONSTRAINT DF_compras_oc_fe DEFAULT SYSDATETIME(),
    fecha_entrega_esperada DATE NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    total_iva DECIMAL(12,2) NOT NULL,
    total_orden_compra DECIMAL(12,2) NOT NULL,
    condiciones_pago NVARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_oc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_oc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_ordenes_compra PRIMARY KEY CLUSTERED (id_orden_compra),
    CONSTRAINT UQ_compras_oc_folio UNIQUE (folio_orden_compra),
    CONSTRAINT FK_compras_oc_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_oc_estado FOREIGN KEY (estado_oc) REFERENCES compras.estados_orden_compra(id_estado_oc));
GO

-- 109. TABLA: compras.ordenes_compra_detalles (Transaccional)
IF OBJECT_ID(N'compras.ordenes_compra_detalles', N'U') IS NOT NULL DROP TABLE compras.ordenes_compra_detalles;
CREATE TABLE compras.ordenes_compra_detalles (
    id_orden_compra_detalle BIGINT IDENTITY(1,1) NOT NULL,
    orden_compra BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_pedida INT NOT NULL CONSTRAINT CK_compras_ocd_cp CHECK (cantidad_pedida >= 1),
    cantidad_recibida INT NOT NULL CONSTRAINT DF_compras_ocd_cr DEFAULT 0,
    costo_unitario_compra DECIMAL(12,2) NOT NULL,
    importe_total_linea DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_ocd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_ocd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_oc_detalles PRIMARY KEY CLUSTERED (id_orden_compra_detalle),
    CONSTRAINT UQ_compras_ocd_oc_sku UNIQUE (orden_compra, variante_sku),
    CONSTRAINT FK_compras_ocd_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra),
    CONSTRAINT FK_compras_ocd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 110. TABLA: compras.recepciones_mercancia (Transaccional Muelle CEDIS)
IF OBJECT_ID(N'compras.recepciones_mercancia', N'U') IS NOT NULL DROP TABLE compras.recepciones_mercancia;
CREATE TABLE compras.recepciones_mercancia (
    id_recepcion BIGINT IDENTITY(1,1) NOT NULL,
    folio_recepcion NVARCHAR(35) NOT NULL,
    orden_compra BIGINT NOT NULL,
    numero_remision_proveedor NVARCHAR(60) NOT NULL,
    fecha_ingreso_muelle DATETIME2(3) NOT NULL CONSTRAINT DF_compras_rm_fim DEFAULT SYSDATETIME(),
    observaciones_chofer_transporte NVARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_rm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_rm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_recepciones PRIMARY KEY CLUSTERED (id_recepcion),
    CONSTRAINT UQ_compras_rm_folio UNIQUE (folio_recepcion),
    CONSTRAINT FK_compras_rm_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra));
GO

-- 111. TABLA: compras.recepciones_detalles (Transaccional)
IF OBJECT_ID(N'compras.recepciones_detalles', N'U') IS NOT NULL DROP TABLE compras.recepciones_detalles;
CREATE TABLE compras.recepciones_detalles (
    id_recepcion_detalle BIGINT IDENTITY(1,1) NOT NULL,
    recepcion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_recibida_bultos INT NOT NULL,
    cantidad_unidades_inspeccionadas INT NOT NULL,
    temperatura_llegada_celsius DECIMAL(4,1) NULL, -- Crítico para dermocosmética y sueros
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_recd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_recd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_recepciones_det PRIMARY KEY CLUSTERED (id_recepcion_detalle),
    CONSTRAINT FK_compras_recd_recepcion FOREIGN KEY (recepcion) REFERENCES compras.recepciones_mercancia(id_recepcion),
    CONSTRAINT FK_compras_recd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 112. TABLA: compras.inspecciones_sanitarias_qa (Transaccional Control de Calidad)
IF OBJECT_ID(N'compras.inspecciones_sanitarias_qa', N'U') IS NOT NULL DROP TABLE compras.inspecciones_sanitarias_qa;
CREATE TABLE compras.inspecciones_sanitarias_qa (
    id_inspeccion_qa BIGINT IDENTITY(1,1) NOT NULL,
    recepcion_detalle BIGINT NOT NULL,
    sellos_sanitarios_intactos BIT NOT NULL,
    empaque_sin_derrames BIT NOT NULL,
    codigo_lote_laboratorio NVARCHAR(50) NOT NULL,
    fecha_caducidad_impresa DATE NOT NULL,
    dictamen_qa NVARCHAR(20) NOT NULL CONSTRAINT CK_compras_qa_dict CHECK (dictamen_qa IN (N'APROBADO', N'RECHAZADO_DEVOLVER', N'RETENIDO_EN_CUARENTENA')),
    justificacion_sanitaria NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_qa_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_qa_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_inspecciones_qa PRIMARY KEY CLUSTERED (id_inspeccion_qa),
    CONSTRAINT FK_compras_qa_recdetalle FOREIGN KEY (recepcion_detalle) REFERENCES compras.recepciones_detalles(id_recepcion_detalle));
GO

-- =================================================================================================
-- SECCIÓN 3.2: WMS, LOTES SANITARIOS, CADUCIDAD FEFO Y SENSORES (TABLAS 113 - 126)
-- =================================================================================================

-- 113. TABLA: wms.almacenes_cedis (Maestra Centros de Distribución)
IF OBJECT_ID(N'wms.almacenes_cedis', N'U') IS NOT NULL DROP TABLE wms.almacenes_cedis;
CREATE TABLE wms.almacenes_cedis (
    id_almacen BIGINT IDENTITY(1,1) NOT NULL,
    codigo_almacen NVARCHAR(20) NOT NULL,
    nombre_almacen NVARCHAR(100) NOT NULL, -- CEDIS Norte Monclova, CEDIS Centro CDMX
    calle_numero NVARCHAR(150) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    ciudad NVARCHAR(80) NOT NULL,
    capacidad_volumetrica_m3 DECIMAL(10,2) NOT NULL,
    cuenta_con_cadena_frio BIT NOT NULL CONSTRAINT DF_wms_cedis_frio DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_cedis_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_cedis_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_almacenes PRIMARY KEY CLUSTERED (id_almacen),
    CONSTRAINT UQ_wms_cedis_codigo UNIQUE (codigo_almacen)
);
GO

-- 114. TABLA: wms.zonas_almacen (Maestra Zonas Operativas)
IF OBJECT_ID(N'wms.zonas_almacen', N'U') IS NOT NULL DROP TABLE wms.zonas_almacen;
CREATE TABLE wms.zonas_almacen (
    id_zona_almacen BIGINT IDENTITY(1,1) NOT NULL,
    almacen BIGINT NOT NULL,
    codigo_zona NVARCHAR(20) NOT NULL, -- ZONA_REFRIGERADA, ZONA_COSMETICA_SECA, ZONA_ESMALTES_INFLAMABLE, ZONA_CUARENTENA
    descripcion NVARCHAR(150) NOT NULL,
    temperatura_min_celsius DECIMAL(4,1) NOT NULL,
    temperatura_max_celsius DECIMAL(4,1) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_za_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_za_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_zonas PRIMARY KEY CLUSTERED (id_zona_almacen),
    CONSTRAINT UQ_wms_za_almacen_zona UNIQUE (almacen, codigo_zona),
    CONSTRAINT FK_wms_za_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));
GO

-- 115. TABLA: wms.pasillos_ubicaciones (Maestra Racks y Bines)
IF OBJECT_ID(N'wms.pasillos_ubicaciones', N'U') IS NOT NULL DROP TABLE wms.pasillos_ubicaciones;
CREATE TABLE wms.pasillos_ubicaciones (
    id_ubicacion BIGINT IDENTITY(1,1) NOT NULL,
    zona_almacen BIGINT NOT NULL,
    codigo_ubicacion NVARCHAR(30) NOT NULL, -- P01-R04-N02-B01 (Pasillo-Rack-Nivel-Bin)
    peso_maximo_kg DECIMAL(8,2) NOT NULL,
    es_bloqueada_auditoria BIT NOT NULL CONSTRAINT DF_wms_pu_bloq DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_pu_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_pu_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_ubicaciones PRIMARY KEY CLUSTERED (id_ubicacion),
    CONSTRAINT UQ_wms_pu_codigo UNIQUE (codigo_ubicacion),
    CONSTRAINT FK_wms_pu_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));
GO

-- 116. TABLA: wms.tipos_movimiento_inventario (Catálogo 18)
IF OBJECT_ID(N'wms.tipos_movimiento_inventario', N'U') IS NOT NULL DROP TABLE wms.tipos_movimiento_inventario;
CREATE TABLE wms.tipos_movimiento_inventario (
    id_tipo_movimiento BIGINT IDENTITY(1,1) NOT NULL,
    codigo_movimiento NVARCHAR(20) NOT NULL,
    nombre_movimiento NVARCHAR(60) NOT NULL, -- ENTRADA_RECEPCION_OC, SALIDA_VENTA_ORDEN, AJUSTE_CONTEO_FISICO, MERMA_CADUCIDAD, TRASPASO_CEDIS
    signo_afectacion INT NOT NULL CONSTRAINT CK_wms_tmi_signo CHECK (signo_afectacion IN (1, -1)),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_tmi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_tmi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_tipos_movimiento PRIMARY KEY CLUSTERED (id_tipo_movimiento),
    CONSTRAINT UQ_wms_tmi_codigo UNIQUE (codigo_movimiento)
);
GO

-- 117. TABLA: wms.lotes_fabricacion_sanitaria (Maestra Lotes de Laboratorio - Control FEFO)
IF OBJECT_ID(N'wms.lotes_fabricacion_sanitaria', N'U') IS NOT NULL DROP TABLE wms.lotes_fabricacion_sanitaria;
CREATE TABLE wms.lotes_fabricacion_sanitaria (
    id_lote BIGINT IDENTITY(1,1) NOT NULL,
    variante_sku BIGINT NOT NULL,
    numero_lote_fabricante NVARCHAR(60) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_caducidad DATE NOT NULL, -- Clave para algoritmo FEFO (First Expired, First Out)
    certificado_calidad_lote_url NVARCHAR(300) NOT NULL,
    cuarentena_sanitaria BIT NOT NULL CONSTRAINT DF_wms_lfs_cuarentena DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_lfs_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_lfs_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_lotes PRIMARY KEY CLUSTERED (id_lote),
    CONSTRAINT UQ_wms_lfs_sku_lote UNIQUE (variante_sku, numero_lote_fabricante),
    CONSTRAINT FK_wms_lfs_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 118. TABLA: wms.inventario_lotes_ubicacion (Transaccional Stock Físico)
IF OBJECT_ID(N'wms.inventario_lotes_ubicacion', N'U') IS NOT NULL DROP TABLE wms.inventario_lotes_ubicacion;
CREATE TABLE wms.inventario_lotes_ubicacion (
    id_inventario_stock BIGINT IDENTITY(1,1) NOT NULL,
    lote BIGINT NOT NULL,
    ubicacion BIGINT NOT NULL,
    stock_disponible INT NOT NULL CONSTRAINT CK_wms_ilu_disp CHECK (stock_disponible >= 0),
    stock_apartado_pedidos INT NOT NULL CONSTRAINT DF_wms_ilu_apart DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_ilu_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_ilu_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_inventario_stock PRIMARY KEY CLUSTERED (id_inventario_stock),
    CONSTRAINT UQ_wms_ilu_lote_ubic UNIQUE (lote, ubicacion),
    CONSTRAINT FK_wms_ilu_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote),
    CONSTRAINT FK_wms_ilu_ubicacion FOREIGN KEY (ubicacion) REFERENCES wms.pasillos_ubicaciones(id_ubicacion));
GO

-- 119. TABLA: wms.kardex_movimientos (Bitácora Transaccional de Movimientos)
IF OBJECT_ID(N'wms.kardex_movimientos', N'U') IS NOT NULL DROP TABLE wms.kardex_movimientos;
CREATE TABLE wms.kardex_movimientos (
    id_kardex BIGINT IDENTITY(1,1) NOT NULL,
    inventario_stock BIGINT NOT NULL,
    tipo_movimiento BIGINT NOT NULL,
    cantidad_movimiento INT NOT NULL CONSTRAINT CK_wms_km_cant CHECK (cantidad_movimiento > 0),
    saldo_anterior INT NOT NULL,
    saldo_resultante INT NOT NULL,
    folio_documento_origen NVARCHAR(50) NOT NULL, -- Folio de OC, Orden Venta, o Acta Merma
    costo_unitario_movimiento DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_km_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_km_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_kardex PRIMARY KEY CLUSTERED (id_kardex),
    CONSTRAINT FK_wms_km_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock),
    CONSTRAINT FK_wms_km_tipo FOREIGN KEY (tipo_movimiento) REFERENCES wms.tipos_movimiento_inventario(id_tipo_movimiento));
GO

-- 120. TABLA: wms.alertas_caducidad_proxima (Transaccional Alertas FEFO Sanitarias)
IF OBJECT_ID(N'wms.alertas_caducidad_proxima', N'U') IS NOT NULL DROP TABLE wms.alertas_caducidad_proxima;
CREATE TABLE wms.alertas_caducidad_proxima (
    id_alerta_caducidad BIGINT IDENTITY(1,1) NOT NULL,
    lote BIGINT NOT NULL,
    dias_restantes_vida_util INT NOT NULL,
    nivel_urgencia NVARCHAR(20) NOT NULL CONSTRAINT CK_wms_acp_urg CHECK (nivel_urgencia IN (N'PREVENTIVA_90D', N'MODERADA_60D', N'CRITICA_30D', N'EXPIRADO')),
    accion_comercial_sugerida NVARCHAR(150) NOT NULL, -- Poner en venta flash con descuento o retirar
    atendida BIT NOT NULL CONSTRAINT DF_wms_acp_atendida DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_acp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_acp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_alertas_caducidad PRIMARY KEY CLUSTERED (id_alerta_caducidad),
    CONSTRAINT FK_wms_acp_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 121. TABLA: wms.mermas_destruccion_sanitaria (Transaccional Actas Sanitarias COFEPRIS)
IF OBJECT_ID(N'wms.mermas_destruccion_sanitaria', N'U') IS NOT NULL DROP TABLE wms.mermas_destruccion_sanitaria;
CREATE TABLE wms.mermas_destruccion_sanitaria (
    id_merma_destruccion BIGINT IDENTITY(1,1) NOT NULL,
    folio_acta_destruccion NVARCHAR(35) NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_unidades_destruidas INT NOT NULL CONSTRAINT CK_wms_mds_cant CHECK (cantidad_unidades_destruidas >= 1),
    motivo_sanitario NVARCHAR(200) NOT NULL, -- Caducado, Contaminación microbiana, Envase quebrado
    empresa_manifiesto_ecologico NVARCHAR(120) NOT NULL, -- Empresa de residuos biológico-químicos
    acta_circunstanciada_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_mds_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_mds_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_mermas_destruccion PRIMARY KEY CLUSTERED (id_merma_destruccion),
    CONSTRAINT UQ_wms_mds_folio UNIQUE (folio_acta_destruccion),
    CONSTRAINT FK_wms_mds_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 122. TABLA: wms.transferencias_almacenes (Transaccional)
IF OBJECT_ID(N'wms.transferencias_almacenes', N'U') IS NOT NULL DROP TABLE wms.transferencias_almacenes;
CREATE TABLE wms.transferencias_almacenes (
    id_transferencia BIGINT IDENTITY(1,1) NOT NULL,
    folio_transferencia NVARCHAR(35) NOT NULL,
    almacen_origen BIGINT NOT NULL,
    almacen_destino BIGINT NOT NULL,
    estado_transferencia NVARCHAR(20) NOT NULL CONSTRAINT CK_wms_ta_est CHECK (estado_transferencia IN (N'SOLICITADA', N'EN_TRANSITO', N'RECIBIDA_COMPLETA', N'DISCREPANCIA')),
    fecha_despacho DATETIME2(3) NULL,
    fecha_arribo DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_ta_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_ta_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_transferencias PRIMARY KEY CLUSTERED (id_transferencia),
    CONSTRAINT UQ_wms_ta_folio UNIQUE (folio_transferencia),
    CONSTRAINT FK_wms_ta_origen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen),
    CONSTRAINT FK_wms_ta_destino FOREIGN KEY (almacen_destino) REFERENCES wms.almacenes_cedis(id_almacen));
GO

-- 123. TABLA: wms.transferencias_detalles (Transaccional)
IF OBJECT_ID(N'wms.transferencias_detalles', N'U') IS NOT NULL DROP TABLE wms.transferencias_detalles;
CREATE TABLE wms.transferencias_detalles (
    id_transferencia_detalle BIGINT IDENTITY(1,1) NOT NULL,
    transferencia BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_enviada INT NOT NULL CONSTRAINT CK_wms_td_cant CHECK (cantidad_enviada >= 1),
    cantidad_recibida INT NOT NULL CONSTRAINT DF_wms_td_recib DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_td_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_td_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_transferencias_det PRIMARY KEY CLUSTERED (id_transferencia_detalle),
    CONSTRAINT FK_wms_td_transf FOREIGN KEY (transferencia) REFERENCES wms.transferencias_almacenes(id_transferencia),
    CONSTRAINT FK_wms_td_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 124. TABLA: wms.conteos_ciclicos_auditoria (Transaccional Auditoría FBD)
IF OBJECT_ID(N'wms.conteos_ciclicos_auditoria', N'U') IS NOT NULL DROP TABLE wms.conteos_ciclicos_auditoria;
CREATE TABLE wms.conteos_ciclicos_auditoria (
    id_conteo_ciclico BIGINT IDENTITY(1,1) NOT NULL,
    folio_auditoria NVARCHAR(35) NOT NULL,
    almacen BIGINT NOT NULL,
    fecha_conteo DATE NOT NULL,
    tipo_conteo NVARCHAR(20) NOT NULL CONSTRAINT CK_wms_cca_tipo CHECK (tipo_conteo IN (N'ALEATORIO', N'ALTO_VALOR_SKU', N'PROXIMO_A_CADUCAR')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_cca_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_cca_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_conteos_auditoria PRIMARY KEY CLUSTERED (id_conteo_ciclico),
    CONSTRAINT UQ_wms_cca_folio UNIQUE (folio_auditoria),
    CONSTRAINT FK_wms_cca_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));
GO

-- 125. TABLA: wms.conteos_ciclicos_detalles (Transaccional)
IF OBJECT_ID(N'wms.conteos_ciclicos_detalles', N'U') IS NOT NULL DROP TABLE wms.conteos_ciclicos_detalles;
CREATE TABLE wms.conteos_ciclicos_detalles (
    id_conteo_detalle BIGINT IDENTITY(1,1) NOT NULL,
    conteo_ciclico BIGINT NOT NULL,
    inventario_stock BIGINT NOT NULL,
    stock_sistema_teorico INT NOT NULL,
    stock_conteo_fisico INT NOT NULL,
    diferencia_piezas INT NOT NULL,
    justificacion_ajuste NVARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_ccd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_ccd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_conteos_detalles PRIMARY KEY CLUSTERED (id_conteo_detalle),
    CONSTRAINT FK_wms_ccd_conteo FOREIGN KEY (conteo_ciclico) REFERENCES wms.conteos_ciclicos_auditoria(id_conteo_ciclico),
    CONSTRAINT FK_wms_ccd_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock));
GO

-- 126. TABLA: wms.monitoreo_temperatura_humedad (Transaccional IoT Dermocosmética)
IF OBJECT_ID(N'wms.monitoreo_temperatura_humedad', N'U') IS NOT NULL DROP TABLE wms.monitoreo_temperatura_humedad;
CREATE TABLE wms.monitoreo_temperatura_humedad (
    id_telemetria_sensor BIGINT IDENTITY(1,1) NOT NULL,
    zona_almacen BIGINT NOT NULL,
    codigo_sensor_iot NVARCHAR(30) NOT NULL,
    temperatura_registrada_celsius DECIMAL(4,1) NOT NULL,
    humedad_relativa_porcentaje DECIMAL(4,1) NOT NULL,
    alerta_fuera_de_rango BIT NOT NULL CONSTRAINT DF_wms_mth_alerta DEFAULT 0,
    fecha_hora_lectura DATETIME2(3) NOT NULL CONSTRAINT DF_wms_mth_fhl DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_mth_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_mth_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_monitoreo_iot PRIMARY KEY CLUSTERED (id_telemetria_sensor),
    CONSTRAINT FK_wms_mth_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));
GO

-- =================================================================================================
-- SECCIÓN 3.3: LOGÍSTICA, ENVÍOS, ÚLTIMA MILLA Y PAQUETERÍAS (TABLAS 127 - 138)
-- =================================================================================================

-- 127. TABLA: envios.transportistas_paqueterias (Catálogo 19)
IF OBJECT_ID(N'envios.transportistas_paqueterias', N'U') IS NOT NULL DROP TABLE envios.transportistas_paqueterias;
CREATE TABLE envios.transportistas_paqueterias (
    id_transportista BIGINT IDENTITY(1,1) NOT NULL,
    codigo_transportista NVARCHAR(20) NOT NULL,
    nombre_comercial NVARCHAR(60) NOT NULL, -- DHL_EXPRESS, FEDEX, ESTAFETA, REDPACK, REPARTO_LOCAL_PROPIO
    api_endpoint_tracking NVARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_tp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_tp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_transportistas PRIMARY KEY CLUSTERED (id_transportista),
    CONSTRAINT UQ_envios_tp_codigo UNIQUE (codigo_transportista)
);
GO

-- 128. TABLA: envios.tipos_servicio_envio (Catálogo 20)
IF OBJECT_ID(N'envios.tipos_servicio_envio', N'U') IS NOT NULL DROP TABLE envios.tipos_servicio_envio;
CREATE TABLE envios.tipos_servicio_envio (
    id_servicio_envio BIGINT IDENTITY(1,1) NOT NULL,
    codigo_servicio NVARCHAR(20) NOT NULL,
    nombre_servicio NVARCHAR(60) NOT NULL, -- DIA_SIGUIENTE, ESTANDAR_TERRESTRE_3_5_DIAS, MISMO_DIA_EXPRESS
    tiempo_garantizado_horas INT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_tse_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_tse_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_tipos_servicio PRIMARY KEY CLUSTERED (id_servicio_envio),
    CONSTRAINT UQ_envios_tse_codigo UNIQUE (codigo_servicio)
);
GO

-- 129. TABLA: envios.tarifas_zonas_postales (Transaccional Matriz Tarifaria)
IF OBJECT_ID(N'envios.tarifas_zonas_postales', N'U') IS NOT NULL DROP TABLE envios.tarifas_zonas_postales;
CREATE TABLE envios.tarifas_zonas_postales (
    id_tarifa_zona BIGINT IDENTITY(1,1) NOT NULL,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    codigo_postal_origen_prefijo VARCHAR(3) NOT NULL,
    codigo_postal_destino_prefijo VARCHAR(3) NOT NULL,
    peso_limite_kg DECIMAL(6,2) NOT NULL,
    costo_base_envio DECIMAL(12,2) NOT NULL,
    costo_kg_adicional DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_tzp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_tzp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_tarifas PRIMARY KEY CLUSTERED (id_tarifa_zona),
    CONSTRAINT FK_envios_tzp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_tzp_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));
GO

-- 130. TABLA: envios.despachos_orden (Maestra Transaccional de Envíos)
IF OBJECT_ID(N'envios.despachos_orden', N'U') IS NOT NULL DROP TABLE envios.despachos_orden;
CREATE TABLE envios.despachos_orden (
    id_despacho BIGINT IDENTITY(1,1) NOT NULL,
    folio_despacho NVARCHAR(35) NOT NULL,
    orden_split BIGINT NOT NULL,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    fecha_recoleccion_paqueteria DATETIME2(3) NULL,
    fecha_promesa_entrega DATE NOT NULL,
    fecha_entrega_real DATETIME2(3) NULL,
    estado_envio NVARCHAR(25) NOT NULL CONSTRAINT CK_envios_do_est CHECK (estado_envio IN (N'PREPARANDO_PAQUETE', N'RECOLECTADO', N'EN_TRANSITO', N'EN_RUTA_LOCAL', N'ENTREGADO', N'INCIDENCIA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_do_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_do_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_despachos PRIMARY KEY CLUSTERED (id_despacho),
    CONSTRAINT UQ_envios_do_folio UNIQUE (folio_despacho),
    CONSTRAINT FK_envios_do_split FOREIGN KEY (orden_split) REFERENCES ventas.ordenes_splits_almacen(id_orden_split),
    CONSTRAINT FK_envios_do_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_do_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));
GO

-- 131. TABLA: envios.paquetes_bultos (Transaccional)
IF OBJECT_ID(N'envios.paquetes_bultos', N'U') IS NOT NULL DROP TABLE envios.paquetes_bultos;
CREATE TABLE envios.paquetes_bultos (
    id_paquete_bulto BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    codigo_bulto NVARCHAR(40) NOT NULL,
    peso_bruto_kg DECIMAL(6,2) NOT NULL,
    alto_cm DECIMAL(5,1) NOT NULL,
    ancho_cm DECIMAL(5,1) NOT NULL,
    largo_cm DECIMAL(5,1) NOT NULL,
    peso_volumetrico_kg AS (alto_cm * ancho_cm * largo_cm / 5000.0) PERSISTED,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_pb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_pb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_paquetes PRIMARY KEY CLUSTERED (id_paquete_bulto),
    CONSTRAINT UQ_envios_pb_codigo UNIQUE (codigo_bulto),
    CONSTRAINT FK_envios_pb_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 132. TABLA: envios.paquetes_contenido_lotes (Transaccional Trazabilidad Sanitaria en Envío)
IF OBJECT_ID(N'envios.paquetes_contenido_lotes', N'U') IS NOT NULL DROP TABLE envios.paquetes_contenido_lotes;
CREATE TABLE envios.paquetes_contenido_lotes (
    id_contenido_paquete BIGINT IDENTITY(1,1) NOT NULL,
    paquete_bulto BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_piezas_en_paquete INT NOT NULL CONSTRAINT CK_envios_pcl_cant CHECK (cantidad_piezas_en_paquete >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_pcl_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_pcl_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_contenido_lotes PRIMARY KEY CLUSTERED (id_contenido_paquete),
    CONSTRAINT FK_envios_pcl_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto),
    CONSTRAINT FK_envios_pcl_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle),
    CONSTRAINT FK_envios_pcl_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 133. TABLA: envios.guias_rastreo (Transaccional Guías de Paquetería)
IF OBJECT_ID(N'envios.guias_rastreo', N'U') IS NOT NULL DROP TABLE envios.guias_rastreo;
CREATE TABLE envios.guias_rastreo (
    id_guia_rastreo BIGINT IDENTITY(1,1) NOT NULL,
    paquete_bulto BIGINT NOT NULL,
    numero_guia_tracking NVARCHAR(80) NOT NULL,
    url_rastreo_directo NVARCHAR(300) NOT NULL,
    etiqueta_pdf_base64_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_gr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_gr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_guias PRIMARY KEY CLUSTERED (id_guia_rastreo),
    CONSTRAINT UQ_envios_gr_guia UNIQUE (numero_guia_tracking),
    CONSTRAINT FK_envios_gr_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto));
GO

-- 134. TABLA: envios.eventos_tracking_bitacora (Bitácora de Webhooks)
IF OBJECT_ID(N'envios.eventos_tracking_bitacora', N'U') IS NOT NULL DROP TABLE envios.eventos_tracking_bitacora;
CREATE TABLE envios.eventos_tracking_bitacora (
    id_evento_tracking BIGINT IDENTITY(1,1) NOT NULL,
    guia_rastreo BIGINT NOT NULL,
    codigo_estatus_paqueteria NVARCHAR(40) NOT NULL,
    descripcion_evento NVARCHAR(250) NOT NULL,
    ubicacion_ciudad_evento NVARCHAR(100) NOT NULL,
    fecha_hora_evento DATETIME2(3) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_etb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_etb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_eventos_tracking PRIMARY KEY CLUSTERED (id_evento_tracking),
    CONSTRAINT FK_envios_etb_guia FOREIGN KEY (guia_rastreo) REFERENCES envios.guias_rastreo(id_guia_rastreo));
GO

-- 135. TABLA: envios.intentos_entrega_fallidos (Transaccional)
IF OBJECT_ID(N'envios.intentos_entrega_fallidos', N'U') IS NOT NULL DROP TABLE envios.intentos_entrega_fallidos;
CREATE TABLE envios.intentos_entrega_fallidos (
    id_intento_fallido BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    numero_visita INT NOT NULL CONSTRAINT CK_envios_ief_visita CHECK (numero_visita BETWEEN 1 AND 3),
    motivo_no_entrega NVARCHAR(150) NOT NULL, -- Domicilio cerrado, Destinatario ausente
    fecha_intento DATETIME2(3) NOT NULL CONSTRAINT DF_envios_ief_fi DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_ief_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_ief_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_intentos_fallidos PRIMARY KEY CLUSTERED (id_intento_fallido),
    CONSTRAINT FK_envios_ief_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 136. TABLA: envios.incidencias_logisticas (Transaccional Siniestros)
IF OBJECT_ID(N'envios.incidencias_logisticas', N'U') IS NOT NULL DROP TABLE envios.incidencias_logisticas;
CREATE TABLE envios.incidencias_logisticas (
    id_incidencia_logistica BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    tipo_incidencia NVARCHAR(30) NOT NULL CONSTRAINT CK_envios_il_tipo CHECK (tipo_incidencia IN (N'EXTRAVIO_TOTAL', N'PAQUETE_DANADO_DERRAME', N'ROBO_EN_TRANSITO', N'DIRECCION_INEXISTENTE')),
    descripcion_hechos NVARCHAR(500) NOT NULL,
    indemnizacion_reclamada DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_il_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_il_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_incidencias PRIMARY KEY CLUSTERED (id_incidencia_logistica),
    CONSTRAINT FK_envios_il_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 137. TABLA: envios.seguros_mercancia (Transaccional Pólizas de Carga)
IF OBJECT_ID(N'envios.seguros_mercancia', N'U') IS NOT NULL DROP TABLE envios.seguros_mercancia;
CREATE TABLE envios.seguros_mercancia (
    id_seguro_envio BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    aseguradora NVARCHAR(100) NOT NULL,
    numero_poliza NVARCHAR(60) NOT NULL,
    valor_asegurado DECIMAL(12,2) NOT NULL,
    costo_prima DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_sm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_sm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_seguros PRIMARY KEY CLUSTERED (id_seguro_envio),
    CONSTRAINT UQ_envios_sm_despacho UNIQUE (despacho),
    CONSTRAINT FK_envios_sm_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 138. TABLA: envios.puntos_recoleccion_pickup (Maestra Lockers y Puntos de Entrega)
IF OBJECT_ID(N'envios.puntos_recoleccion_pickup', N'U') IS NOT NULL DROP TABLE envios.puntos_recoleccion_pickup;
CREATE TABLE envios.puntos_recoleccion_pickup (
    id_punto_pickup BIGINT IDENTITY(1,1) NOT NULL,
    transportista BIGINT NOT NULL,
    almacen_origen BIGINT NOT NULL,
    codigo_locker NVARCHAR(30) NOT NULL,
    nombre_establecimiento NVARCHAR(100) NOT NULL,
    direccion_completa NVARCHAR(200) NOT NULL,
    horario_atencion NVARCHAR(100) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_prp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_prp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_pickup PRIMARY KEY CLUSTERED (id_punto_pickup),
    CONSTRAINT UQ_envios_prp_codigo UNIQUE (codigo_locker),
    CONSTRAINT FK_envios_prp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_prp_almacen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen)
);
GO

-- =================================================================================================
-- SECCIÓN 3.4: POSTVENTA, RMA, FARMACOVIGILANCIA Y AUDITORÍA FORENSE (TABLAS 139 - 150)
-- =================================================================================================

-- 139. TABLA: postventa.motivos_devolucion_rma (Catálogo 21)
IF OBJECT_ID(N'postventa.motivos_devolucion_rma', N'U') IS NOT NULL DROP TABLE postventa.motivos_devolucion_rma;
CREATE TABLE postventa.motivos_devolucion_rma (
    id_motivo_rma BIGINT IDENTITY(1,1) NOT NULL,
    codigo_motivo NVARCHAR(20) NOT NULL,
    descripcion_motivo NVARCHAR(150) NOT NULL, -- REACCION_ALERGICA_CUTANEA, TONO_INCORRECTO, PRODUCTO_CADUCADO, SELLO_ROTO, NO_SATISFECHO
    requiere_dictamen_medico BIT NOT NULL CONSTRAINT DF_postventa_mr_medico DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_mr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_mr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_motivos_rma PRIMARY KEY CLUSTERED (id_motivo_rma),
    CONSTRAINT UQ_postventa_mr_codigo UNIQUE (codigo_motivo)
);
GO

-- 140. TABLA: postventa.solicitudes_rma (Maestra Devoluciones Sanitarias)
IF OBJECT_ID(N'postventa.solicitudes_rma', N'U') IS NOT NULL DROP TABLE postventa.solicitudes_rma;
CREATE TABLE postventa.solicitudes_rma (
    id_solicitud_rma BIGINT IDENTITY(1,1) NOT NULL,
    folio_rma NVARCHAR(35) NOT NULL,
    orden BIGINT NOT NULL,
    motivo_rma BIGINT NOT NULL,
    estado_rma NVARCHAR(20) NOT NULL CONSTRAINT CK_postventa_srma_est CHECK (estado_rma IN (N'SOLICITADA', N'GUIA_RETORNO_EMITIDA', N'RECIBIDA_EN_QA', N'APROBADA_REEMBOLSAR', N'RECHAZADA_POR_HIGIENE')),
    fotografia_evidencia_url NVARCHAR(300) NOT NULL,
    descripcion_caso_cliente NVARCHAR(500) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_srma_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_srma_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_solicitudes_rma PRIMARY KEY CLUSTERED (id_solicitud_rma),
    CONSTRAINT UQ_postventa_srma_folio UNIQUE (folio_rma),
    CONSTRAINT FK_postventa_srma_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_postventa_srma_motivo FOREIGN KEY (motivo_rma) REFERENCES postventa.motivos_devolucion_rma(id_motivo_rma));
GO

-- 141. TABLA: postventa.rma_detalles (Transaccional)
IF OBJECT_ID(N'postventa.rma_detalles', N'U') IS NOT NULL DROP TABLE postventa.rma_detalles;
CREATE TABLE postventa.rma_detalles (
    id_rma_detalle BIGINT IDENTITY(1,1) NOT NULL,
    solicitud_rma BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    cantidad_devuelta INT NOT NULL CONSTRAINT CK_postventa_rd_cant CHECK (cantidad_devuelta >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_rd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_rd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_rma_detalles PRIMARY KEY CLUSTERED (id_rma_detalle),
    CONSTRAINT FK_postventa_rd_rma FOREIGN KEY (solicitud_rma) REFERENCES postventa.solicitudes_rma(id_solicitud_rma),
    CONSTRAINT FK_postventa_rd_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle));
GO

-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (Transaccional Higiene y Destino)
IF OBJECT_ID(N'postventa.inspeccion_sanitaria_retorno', N'U') IS NOT NULL DROP TABLE postventa.inspeccion_sanitaria_retorno;
CREATE TABLE postventa.inspeccion_sanitaria_retorno (
    id_inspeccion_retorno BIGINT IDENTITY(1,1) NOT NULL,
    rma_detalle BIGINT NOT NULL,
    sello_seguridad_fue_abierto BIT NOT NULL,
    contenido_usado_porcentaje DECIMAL(4,1) NOT NULL,
    destino_sanitario_autorizado NVARCHAR(30) NOT NULL CONSTRAINT CK_postventa_isr_dest CHECK (destino_sanitario_autorizado IN (N'DESTRUCCION_INMEDIATA_RESIDUOS', N'DONACION_REACONDICIONADA', N'REINGRESO_STOCK_SELLADO')),
    dictamen_auditor NVARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_isr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_isr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_inspeccion_retorno PRIMARY KEY CLUSTERED (id_inspeccion_retorno),
    CONSTRAINT UQ_postventa_isr_rmadetalle UNIQUE (rma_detalle),
    CONSTRAINT FK_postventa_isr_rmadetalle FOREIGN KEY (rma_detalle) REFERENCES postventa.rma_detalles(id_rma_detalle));
GO

-- 143. TABLA: postventa.tickets_soporte (Maestra Atención al Cliente)
IF OBJECT_ID(N'postventa.tickets_soporte', N'U') IS NOT NULL DROP TABLE postventa.tickets_soporte;
CREATE TABLE postventa.tickets_soporte (
    id_ticket BIGINT IDENTITY(1,1) NOT NULL,
    folio_ticket NVARCHAR(35) NOT NULL,
    cliente BIGINT NOT NULL,
    asunto NVARCHAR(120) NOT NULL,
    categoria_ticket NVARCHAR(30) NOT NULL CONSTRAINT CK_postventa_ts_cat CHECK (categoria_ticket IN (N'ENVIO_DEMORADO', N'ASESORIA_DERMATOLOGICA', N'FACTURACION_CFDI', N'PRODUCTO_DEFECTUOSO')),
    prioridad NVARCHAR(20) NOT NULL CONSTRAINT CK_postventa_ts_prio CHECK (prioridad IN (N'BAJA', N'MEDIA', N'ALTA', N'URGENTE')),
    estado_ticket NVARCHAR(20) NOT NULL CONSTRAINT CK_postventa_ts_est CHECK (estado_ticket IN (N'ABIERTO', N'EN_PROCESO', N'ESPERANDO_CLIENTE', N'RESUELTO', N'CERRADO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_ts_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_ts_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_tickets PRIMARY KEY CLUSTERED (id_ticket),
    CONSTRAINT UQ_postventa_ts_folio UNIQUE (folio_ticket),
    CONSTRAINT FK_postventa_ts_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 144. TABLA: postventa.tickets_mensajes (Transaccional)
IF OBJECT_ID(N'postventa.tickets_mensajes', N'U') IS NOT NULL DROP TABLE postventa.tickets_mensajes;
CREATE TABLE postventa.tickets_mensajes (
    id_ticket_mensaje BIGINT IDENTITY(1,1) NOT NULL,
    ticket BIGINT NOT NULL,
    usuario_emisor BIGINT NOT NULL,
    mensaje_cuerpo NVARCHAR(MAX) NOT NULL,
    adjunto_url NVARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_tm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_tm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_tickets_mensajes PRIMARY KEY CLUSTERED (id_ticket_mensaje),
    CONSTRAINT FK_postventa_tm_ticket FOREIGN KEY (ticket) REFERENCES postventa.tickets_soporte(id_ticket),
    CONSTRAINT FK_postventa_tm_usuario FOREIGN KEY (usuario_emisor) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 145. TABLA: postventa.reportes_farmacovigilancia (Transaccional Regulatoria COFEPRIS)
IF OBJECT_ID(N'postventa.reportes_farmacovigilancia', N'U') IS NOT NULL DROP TABLE postventa.reportes_farmacovigilancia;
CREATE TABLE postventa.reportes_farmacovigilancia (
    id_reporte_farmacovigilancia BIGINT IDENTITY(1,1) NOT NULL,
    folio_cofepris_ram NVARCHAR(45) NOT NULL, -- Reporte de Reacciones Adversas a Medicamentos / Cosméticos
    cliente BIGINT NOT NULL,
    producto BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    sintomas_reaccion_adversa NVARCHAR(MAX) NOT NULL,
    requirio_atencion_hospitalaria BIT NOT NULL,
    fecha_aparicion_sintomas DATE NOT NULL,
    notificado_a_autoridad_sanitaria BIT NOT NULL CONSTRAINT DF_postventa_rf_notif DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_rf_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_rf_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_farmacovigilancia PRIMARY KEY CLUSTERED (id_reporte_farmacovigilancia),
    CONSTRAINT UQ_postventa_rf_folio UNIQUE (folio_cofepris_ram),
    CONSTRAINT FK_postventa_rf_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_postventa_rf_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_postventa_rf_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 146. TABLA: auditoria.tipos_evento_sistema (Catálogo 22)
IF OBJECT_ID(N'auditoria.tipos_evento_sistema', N'U') IS NOT NULL DROP TABLE auditoria.tipos_evento_sistema;
CREATE TABLE auditoria.tipos_evento_sistema (
    id_tipo_evento BIGINT IDENTITY(1,1) NOT NULL,
    codigo_evento NVARCHAR(30) NOT NULL,
    nombre_evento NVARCHAR(80) NOT NULL, -- LOGIN_EXITOSO, INTENTO_ACCESO_DENEGADO, MODIFICACION_PRECIOS, BAJA_LOGICA_REGISTRO, EXPORTACION_DATOS_CLIENTES
    nivel_severidad NVARCHAR(20) NOT NULL CONSTRAINT CK_auditoria_tes_sev CHECK (nivel_severidad IN (N'INFO', N'ADVERTENCIA', N'CRITICO_SEGURIDAD')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_auditoria_tes_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_tes_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_auditoria_tipos_evento PRIMARY KEY CLUSTERED (id_tipo_evento),
    CONSTRAINT UQ_auditoria_tes_codigo UNIQUE (codigo_evento)
);
GO

-- 147. TABLA: auditoria.bitacora_seguridad_global (Bitácora Forense Penal Art. 211 bis)
IF OBJECT_ID(N'auditoria.bitacora_seguridad_global', N'U') IS NOT NULL DROP TABLE auditoria.bitacora_seguridad_global;
CREATE TABLE auditoria.bitacora_seguridad_global (
    id_log_seguridad BIGINT IDENTITY(1,1) NOT NULL,
    tipo_evento BIGINT NOT NULL,
    usuario BIGINT NULL,
    direccion_ip NVARCHAR(45) NOT NULL,
    user_agent NVARCHAR(350) NOT NULL,
    modulo_origen NVARCHAR(60) NOT NULL,
    descripcion_evento NVARCHAR(500) NOT NULL,
    firma_integridad_hash NVARCHAR(128) NOT NULL, -- Hash SHA-256 de los datos de la fila para evitar manipulación de logs periciales
    fecha_evento DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_bsg_fev DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_auditoria_bsg_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_bsg_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_auditoria_seguridad PRIMARY KEY CLUSTERED (id_log_seguridad),
    CONSTRAINT FK_auditoria_bsg_tipo FOREIGN KEY (tipo_evento) REFERENCES auditoria.tipos_evento_sistema(id_tipo_evento),
    CONSTRAINT FK_auditoria_bsg_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 148. TABLA: auditoria.bitacora_cambios_datos (Bitácora DML Trazabilidad Total)
IF OBJECT_ID(N'auditoria.bitacora_cambios_datos', N'U') IS NOT NULL DROP TABLE auditoria.bitacora_cambios_datos;
CREATE TABLE auditoria.bitacora_cambios_datos (
    id_cambio_dato BIGINT IDENTITY(1,1) NOT NULL,
    nombre_tabla NVARCHAR(100) NOT NULL,
    id_registro_afectado BIGINT NOT NULL,
    tipo_operacion NVARCHAR(15) NOT NULL CONSTRAINT CK_auditoria_bcd_tipo CHECK (tipo_operacion IN (N'INSERT', N'UPDATE', N'SOFT_DELETE')),
    valores_anteriores_json NVARCHAR(MAX) NULL,
    valores_nuevos_json NVARCHAR(MAX) NOT NULL,
    motivo_cambio NVARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_auditoria_bcd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_bcd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_auditoria_cambios PRIMARY KEY CLUSTERED (id_cambio_dato),
    CONSTRAINT FK_auditoria_bcd_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);
GO

-- 149. TABLA: sistema.parametros_configuracion (Maestra Parámetros del Sistema)
IF OBJECT_ID(N'sistema.parametros_configuracion', N'U') IS NOT NULL DROP TABLE sistema.parametros_configuracion;
CREATE TABLE sistema.parametros_configuracion (
    id_parametro BIGINT IDENTITY(1,1) NOT NULL,
    clave_parametro NVARCHAR(60) NOT NULL,
    valor_parametro NVARCHAR(500) NOT NULL,
    tipo_dato NVARCHAR(20) NOT NULL CONSTRAINT CK_sistema_pc_tipo CHECK (tipo_dato IN (N'STRING', N'INTEGER', N'DECIMAL', N'BOOLEAN', N'JSON')),
    descripcion NVARCHAR(250) NOT NULL,
    es_modificable_en_caliente BIT NOT NULL CONSTRAINT DF_sistema_pc_mc DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_sistema_pc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_sistema_pc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_sistema_parametros PRIMARY KEY CLUSTERED (id_parametro),
    CONSTRAINT UQ_sistema_pc_clave UNIQUE (clave_parametro),
    CONSTRAINT FK_sistema_pc_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);
GO

-- 150. TABLA: sistema.notificaciones_push_email (Transaccional Cola de Mensajes)
IF OBJECT_ID(N'sistema.notificaciones_push_email', N'U') IS NOT NULL DROP TABLE sistema.notificaciones_push_email;
CREATE TABLE sistema.notificaciones_push_email (
    id_notificacion BIGINT IDENTITY(1,1) NOT NULL,
    usuario_destinatario BIGINT NOT NULL,
    tipo_canal NVARCHAR(20) NOT NULL CONSTRAINT CK_sistema_npe_canal CHECK (tipo_canal IN (N'EMAIL', N'PUSH_APP', N'SMS', N'WHATSAPP')),
    titulo_asunto NVARCHAR(150) NOT NULL,
    cuerpo_mensaje NVARCHAR(MAX) NOT NULL,
    enviada BIT NOT NULL CONSTRAINT DF_sistema_npe_env DEFAULT 0,
    fecha_envio DATETIME2(3) NULL,
    error_envio NVARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_sistema_npe_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_sistema_npe_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_sistema_notificaciones PRIMARY KEY CLUSTERED (id_notificacion),
    CONSTRAINT FK_sistema_npe_usuario FOREIGN KEY (usuario_destinatario) REFERENCES seguridad.usuarios(id_usuario));
GO

PRINT '====================================================================================';
PRINT 'ÉXITO TOTAL: Se completó la creación de las 150 TABLAS del Proyecto Integrador';
PRINT '50 Tablas por integrante (Integrante 1, 2 y 3).';
PRINT 'Todas cuentan con ID autoincrementable y las 7 columnas de auditoría / soft delete.';
PRINT 'Cumplimiento estricto: Cero tablas huérfanas y catálogos por debajo del 25%.';
PRINT '====================================================================================';
GO

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 3 (COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS Y AUDITORÍA)
-- =================================================================================================
CREATE NONCLUSTERED INDEX IX_compras_oc_prov_fecha ON compras.ordenes_compra (proveedor, fecha_emision);
CREATE NONCLUSTERED INDEX IX_compras_recep_oc_fecha ON compras.recepciones_mercancia (orden_compra, fecha_ingreso_muelle);
CREATE NONCLUSTERED INDEX IX_compras_qa_detalle_dictamen ON compras.inspecciones_sanitarias_qa (recepcion_detalle, dictamen_qa);
CREATE NONCLUSTERED INDEX IX_wms_lotes_sku_caducidad ON wms.lotes_fabricacion_sanitaria (variante_sku, fecha_caducidad);
CREATE NONCLUSTERED INDEX IX_wms_inv_lote_ubicacion ON wms.inventario_lotes_ubicacion (lote, ubicacion);
CREATE NONCLUSTERED INDEX IX_wms_alertas_lote_atendida ON wms.alertas_caducidad_proxima (lote, atendida, dias_restantes_vida_util);
CREATE NONCLUSTERED INDEX IX_wms_telemetria_zona_fecha ON wms.monitoreo_temperatura_humedad (zona_almacen, alerta_fuera_de_rango, fecha_hora_lectura);
CREATE NONCLUSTERED INDEX IX_envios_despachos_split_est ON envios.despachos_orden (orden_split, estado_envio);
CREATE NONCLUSTERED INDEX IX_postventa_rma_orden_motivo ON postventa.solicitudes_rma (orden, motivo_rma, estado_rma);
CREATE NONCLUSTERED INDEX IX_auditoria_cambios_tipo_fecha ON auditoria.bitacora_cambios_datos (tipo_operacion, fecha_creacion);
GO
