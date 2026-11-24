-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 2: MOTOR TRANSACCIONAL, SUSCRIPCIONES, PASARELAS DE PAGO, ANTIFRAUDE Y CFDI 4.0
-- AUTOR / INTEGRANTE 2: Sheyla EstefanÍa Moncada Guel (Responsable de Tablas 051 a 100)
-- SGBD DESTINO: Microsoft SQL Server 2019 / 2022
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

USE EcommerceSaludBellezaDB;
GO

-- Crear esquemas lógicos para el submódulo comercial, financiero y fiscal
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ventas') EXEC('CREATE SCHEMA ventas');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'pagos') EXEC('CREATE SCHEMA pagos');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'fiscal') EXEC('CREATE SCHEMA fiscal');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'promos') EXEC('CREATE SCHEMA promos');
GO

-- =================================================================================================
-- SECCIÓN 2.1: CARRO, SUSCRIPCIONES Y PROMOCIONES DE CLIENTE (TABLAS 051 - 063)
-- =================================================================================================

-- 051. TABLA: ventas.tipos_descuento (Catálogo 9)
IF OBJECT_ID(N'ventas.tipos_descuento', N'U') IS NOT NULL DROP TABLE ventas.tipos_descuento;
CREATE TABLE ventas.tipos_descuento (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_descuento NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(50) NOT NULL, -- Porcentual, Monto Fijo, 2x1, Envío Gratis
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_td_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_td_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_tipos_descuento PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_td_codigo UNIQUE (codigo_descuento)
);
GO

-- 052. TABLA: ventas.estados_orden (Catálogo 10)
IF OBJECT_ID(N'ventas.estados_orden', N'U') IS NOT NULL DROP TABLE ventas.estados_orden;
CREATE TABLE ventas.estados_orden (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_estado NVARCHAR(30) NOT NULL,
    nombre_estado NVARCHAR(60) NOT NULL, -- PENDIENTE_PAGO, PAGADA, EN_PREPARACION_WMS, EN_TRANSITO, ENTREGADA, CANCELADA, REEMBOLSADA
    descripcion NVARCHAR(255) NOT NULL,
    es_terminal BIT NOT NULL CONSTRAINT DF_ventas_eo_term DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_eo_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_eo_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_estados_orden PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_eo_codigo UNIQUE (codigo_estado)
);
GO

-- 053. TABLA: ventas.motivos_cancelacion_orden (Catálogo 11)
IF OBJECT_ID(N'ventas.motivos_cancelacion_orden', N'U') IS NOT NULL DROP TABLE ventas.motivos_cancelacion_orden;
CREATE TABLE ventas.motivos_cancelacion_orden (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_motivo NVARCHAR(30) NOT NULL,
    descripcion_motivo NVARCHAR(200) NOT NULL,
    es_atribuible_cliente BIT NOT NULL CONSTRAINT DF_ventas_mc_cli DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_mc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_mc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_motivos_cancelacion_orden PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_mc_codigo UNIQUE (codigo_motivo)
);
GO

-- 054. TABLA: ventas.carritos (Transaccional)
IF OBJECT_ID(N'ventas.carritos', N'U') IS NOT NULL DROP TABLE ventas.carritos;
CREATE TABLE ventas.carritos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    token_sesion_carrito NVARCHAR(128) NOT NULL,
    fecha_ultima_actividad DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_carr_fua DEFAULT SYSDATETIME(),
    convertido_a_orden BIT NOT NULL CONSTRAINT DF_ventas_carr_conv DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_carr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_carr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_carritos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_carr_token UNIQUE (token_sesion_carrito),
    CONSTRAINT FK_ventas_carr_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 055. TABLA: ventas.items_carrito (Transaccional)
IF OBJECT_ID(N'ventas.items_carrito', N'U') IS NOT NULL DROP TABLE ventas.items_carrito;
CREATE TABLE ventas.items_carrito (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_carrito BIGINT NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT CK_ventas_ic_cant CHECK (cantidad >= 1),
    precio_unitario_capturado DECIMAL(12,2) NOT NULL,
    fecha_agregado DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ic_fa DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ic_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ic_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_items_carrito PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_ic_carrito_sku UNIQUE (ID_carrito, ID_variante_sku),
    CONSTRAINT FK_ventas_ic_carrito FOREIGN KEY (ID_carrito) REFERENCES ventas.carritos(ID),
    CONSTRAINT FK_ventas_ic_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 056. TABLA: ventas.carritos_abandonados_seguimiento (Transaccional Marketing)
IF OBJECT_ID(N'ventas.carritos_abandonados_seguimiento', N'U') IS NOT NULL DROP TABLE ventas.carritos_abandonados_seguimiento;
CREATE TABLE ventas.carritos_abandonados_seguimiento (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_carrito BIGINT NOT NULL,
    correo_recordatorio_enviado BIT NOT NULL CONSTRAINT DF_ventas_cas_correo DEFAULT 0,
    fecha_envio_recordatorio DATETIME2(3) NULL,
    recuperado BIT NOT NULL CONSTRAINT DF_ventas_cas_recup DEFAULT 0,
    monto_estimado_recuperable DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_cas_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_cas_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_carritos_abandonados PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_cas_carrito UNIQUE (ID_carrito),
    CONSTRAINT FK_ventas_cas_carrito FOREIGN KEY (ID_carrito) REFERENCES ventas.carritos(ID));
GO

-- 057. TABLA: ventas.planes_suscripcion (Maestra Beauty Box / Resurtido Dermocosmético)
IF OBJECT_ID(N'ventas.planes_suscripcion', N'U') IS NOT NULL DROP TABLE ventas.planes_suscripcion;
CREATE TABLE ventas.planes_suscripcion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_plan NVARCHAR(30) NOT NULL,
    nombre_plan NVARCHAR(100) NOT NULL, -- Ej: Beauty Box Salud Piel, Resurtido Sérums Ácido Hialurónico
    descripcion NVARCHAR(300) NOT NULL,
    precio_recurrente_base DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ps_precio CHECK (precio_recurrente_base > 0),
    descuento_porcentual_fidelidad DECIMAL(5,2) NOT NULL CONSTRAINT DF_ventas_ps_desc DEFAULT 10.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ps_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ps_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_planes_suscripcion PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_ps_codigo UNIQUE (codigo_plan)
);
GO

-- 058. TABLA: ventas.frecuencias_suscripcion (Catálogo 12)
IF OBJECT_ID(N'ventas.frecuencias_suscripcion', N'U') IS NOT NULL DROP TABLE ventas.frecuencias_suscripcion;
CREATE TABLE ventas.frecuencias_suscripcion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_frecuencia NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(50) NOT NULL, -- Mensual, Bimestral, Trimestral
    intervalo_dias INT NOT NULL CONSTRAINT CK_ventas_fs_dias CHECK (intervalo_dias BETWEEN 15 AND 180),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_fs_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_fs_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_frecuencias_suscripcion PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_fs_codigo UNIQUE (codigo_frecuencia)
);
GO

-- 059. TABLA: ventas.suscripciones_cliente (Transaccional)
IF OBJECT_ID(N'ventas.suscripciones_cliente', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_cliente;
CREATE TABLE ventas.suscripciones_cliente (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    folio_suscripcion NVARCHAR(35) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    ID_plan_suscripcion BIGINT NOT NULL,
    ID_frecuencia_suscripcion BIGINT NOT NULL,
    ID_direccion_entrega BIGINT NOT NULL,
    ID_metodo_tokenizado BIGINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    proxima_fecha_cobro DATE NOT NULL,
    estado_suscripcion NVARCHAR(20) NOT NULL CONSTRAINT CK_ventas_sc_est CHECK (estado_suscripcion IN (N'ACTIVA', N'PAUSADA', N'CANCELADA', N'PAGO_FALLIDO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_sc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_cliente PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_sc_folio UNIQUE (folio_suscripcion),
    CONSTRAINT FK_ventas_sc_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_ventas_sc_plan FOREIGN KEY (ID_plan_suscripcion) REFERENCES ventas.planes_suscripcion(ID),
    CONSTRAINT FK_ventas_sc_frecuencia FOREIGN KEY (ID_frecuencia_suscripcion) REFERENCES ventas.frecuencias_suscripcion(ID),
    CONSTRAINT FK_ventas_sc_direccion FOREIGN KEY (ID_direccion_entrega) REFERENCES clientes.direcciones(ID),
    CONSTRAINT FK_ventas_sc_metodo FOREIGN KEY (ID_metodo_tokenizado) REFERENCES clientes.metodos_pago_tokenizados(ID));
GO

-- 060. TABLA: ventas.suscripciones_items (Intermedia N:M)
IF OBJECT_ID(N'ventas.suscripciones_items', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_items;
CREATE TABLE ventas.suscripciones_items (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_suscripcion_cliente BIGINT NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT CK_ventas_si_cant CHECK (cantidad >= 1),
    precio_congelado_suscripcion DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_si_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_si_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_items PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_si_susc_sku UNIQUE (ID_suscripcion_cliente, ID_variante_sku),
    CONSTRAINT FK_ventas_si_suscripcion FOREIGN KEY (ID_suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(ID),
    CONSTRAINT FK_ventas_si_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 061. TABLA: ventas.suscripciones_calendario_entregas (Transaccional)
IF OBJECT_ID(N'ventas.suscripciones_calendario_entregas', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_calendario_entregas;
CREATE TABLE ventas.suscripciones_calendario_entregas (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_suscripcion_cliente BIGINT NOT NULL,
    fecha_programada_despacho DATE NOT NULL,
    numero_ciclo_periodo INT NOT NULL,
    estado_despacho NVARCHAR(30) NOT NULL CONSTRAINT CK_ventas_sce_est CHECK (estado_despacho IN (N'PROGRAMADO', N'COBRADO_PROCESANDO', N'DESPACHADO', N'OMITIDO_POR_CLIENTE')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_sce_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sce_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_cal PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_sce_susc_ciclo UNIQUE (ID_suscripcion_cliente, numero_ciclo_periodo),
    CONSTRAINT FK_ventas_sce_suscripcion FOREIGN KEY (ID_suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(ID));
GO

-- 062. TABLA: ventas.suscripciones_bitacora_estados (Bitácora)
IF OBJECT_ID(N'ventas.suscripciones_bitacora_estados', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_bitacora_estados;
CREATE TABLE ventas.suscripciones_bitacora_estados (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_suscripcion_cliente BIGINT NOT NULL,
    estado_anterior NVARCHAR(20) NOT NULL,
    estado_nuevo NVARCHAR(20) NOT NULL,
    motivo_cambio NVARCHAR(255) NOT NULL,
    fecha_cambio DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sbe_fcamb DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_sbe_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sbe_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_bitacora PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ventas_sbe_suscripcion FOREIGN KEY (ID_suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(ID));
GO

-- 063. TABLA: ventas.regalos_por_compra_gwp (Transaccional Gift With Purchase)
IF OBJECT_ID(N'ventas.regalos_por_compra_gwp', N'U') IS NOT NULL DROP TABLE ventas.regalos_por_compra_gwp;
CREATE TABLE ventas.regalos_por_compra_gwp (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_promocion_gwp NVARCHAR(30) NOT NULL,
    nombre_promocion NVARCHAR(100) NOT NULL, -- Ej: Muestra de Sérum Gratis en compras > $899
    monto_minimo_requerido DECIMAL(12,2) NOT NULL,
    ID_variante_sku_regalo BIGINT NOT NULL,
    fecha_inicio DATETIME2(3) NOT NULL,
    fecha_fin DATETIME2(3) NOT NULL,
    stock_maximo_regalos INT NOT NULL,
    regalos_entregados INT NOT NULL CONSTRAINT DF_ventas_gwp_entregados DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_gwp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_gwp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_regalos_gwp PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_gwp_codigo UNIQUE (codigo_promocion_gwp),
    CONSTRAINT FK_ventas_gwp_sku FOREIGN KEY (ID_variante_sku_regalo) REFERENCES catalogo.variantes_sku(ID));
GO

-- =================================================================================================
-- SECCIÓN 2.2: MOTOR TRANSACCIONAL DE ÓRDENES Y CHECKOUT (TABLAS 064 - 073)
-- =================================================================================================

-- 064. TABLA: ventas.ordenes (Maestra Transaccional de Ventas)
IF OBJECT_ID(N'ventas.ordenes', N'U') IS NOT NULL DROP TABLE ventas.ordenes;
CREATE TABLE ventas.ordenes (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    folio_orden NVARCHAR(40) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    ID_estado_orden BIGINT NOT NULL,
    ID_motivo_cancelacion BIGINT NULL,
    ID_direccion_envio BIGINT NOT NULL,
    ID_direccion_facturacion BIGINT NULL,
    fecha_orden DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ord_fo DEFAULT SYSDATETIME(),
    subtotal_bruto DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ord_sub CHECK (subtotal_bruto >= 0),
    total_descuentos DECIMAL(12,2) NOT NULL CONSTRAINT DF_ventas_ord_desc DEFAULT 0.00,
    total_impuestos_iva DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ord_iva CHECK (total_impuestos_iva >= 0),
    costo_envio DECIMAL(12,2) NOT NULL CONSTRAINT DF_ventas_ord_envio DEFAULT 0.00,
    total_neto DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ord_total CHECK (total_neto > 0),
    moneda VARCHAR(3) NOT NULL CONSTRAINT DF_ventas_ord_moneda DEFAULT 'MXN',
    requiere_factura BIT NOT NULL CONSTRAINT DF_ventas_ord_rf DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ord_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ord_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_ord_folio UNIQUE (folio_orden),
    CONSTRAINT FK_ventas_ord_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_ventas_ord_estado FOREIGN KEY (ID_estado_orden) REFERENCES ventas.estados_orden(ID),
    CONSTRAINT FK_ventas_ord_direnvio FOREIGN KEY (ID_direccion_envio) REFERENCES clientes.direcciones(ID),
    CONSTRAINT FK_ventas_ord_dirfact FOREIGN KEY (ID_direccion_facturacion) REFERENCES clientes.direcciones(ID),
    CONSTRAINT FK_ventas_ord_motivo_cancel FOREIGN KEY (ID_motivo_cancelacion) REFERENCES ventas.motivos_cancelacion_orden(ID));
GO

-- 065. TABLA: ventas.ordenes_detalles (Transaccional Líneas de Producto)
IF OBJECT_ID(N'ventas.ordenes_detalles', N'U') IS NOT NULL DROP TABLE ventas.ordenes_detalles;
CREATE TABLE ventas.ordenes_detalles (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    numero_partida INT NOT NULL,
    cantidad_comprada INT NOT NULL CONSTRAINT CK_ventas_od_cant CHECK (cantidad_comprada >= 1),
    precio_unitario_venta DECIMAL(12,2) NOT NULL,
    costo_unitario_historico DECIMAL(12,2) NOT NULL,
    monto_descuento_aplicado DECIMAL(12,2) NOT NULL CONSTRAINT DF_ventas_od_desc DEFAULT 0.00,
    subtotal_linea DECIMAL(12,2) NOT NULL,
    tasa_iva_porcentual DECIMAL(5,2) NOT NULL CONSTRAINT DF_ventas_od_tasa DEFAULT 16.00,
    monto_iva_linea DECIMAL(12,2) NOT NULL,
    total_linea DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_od_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_od_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_detalles PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_od_partida UNIQUE (ID_orden, numero_partida),
    CONSTRAINT FK_ventas_od_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_ventas_od_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 066. TABLA: ventas.ordenes_historial_estados (Bitácora de Estados)
IF OBJECT_ID(N'ventas.ordenes_historial_estados', N'U') IS NOT NULL DROP TABLE ventas.ordenes_historial_estados;
CREATE TABLE ventas.ordenes_historial_estados (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_estado_orden BIGINT NOT NULL,
    comentario_operativo NVARCHAR(300) NOT NULL,
    fecha_registro DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ohe_fr DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ohe_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ohe_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_historial PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ventas_ohe_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_ventas_ohe_estado FOREIGN KEY (ID_estado_orden) REFERENCES ventas.estados_orden(ID));
GO

-- 067. TABLA: ventas.ordenes_splits_almacen (Transaccional División por Almacén)
IF OBJECT_ID(N'ventas.ordenes_splits_almacen', N'U') IS NOT NULL DROP TABLE ventas.ordenes_splits_almacen;
CREATE TABLE ventas.ordenes_splits_almacen (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    sub_folio_split NVARCHAR(45) NOT NULL, -- Ej: ORD-9921-A (CEDIS Norte), ORD-9921-B (CEDIS Centro)
    estado_split NVARCHAR(30) NOT NULL CONSTRAINT CK_ventas_osa_est CHECK (estado_split IN (N'PENDIENTE', N'ASIGNADO', N'SURTIENDO', N'EMPAQUETADO', N'EN_RUTA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_osa_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_osa_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_splits PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_osa_subfolio UNIQUE (sub_folio_split),
    CONSTRAINT FK_ventas_osa_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID));
GO

-- 068. TABLA: ventas.ordenes_impuestos (Transaccional Desglose SAT)
IF OBJECT_ID(N'ventas.ordenes_impuestos', N'U') IS NOT NULL DROP TABLE ventas.ordenes_impuestos;
CREATE TABLE ventas.ordenes_impuestos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    tipo_impuesto VARCHAR(10) NOT NULL CONSTRAINT CK_ventas_oi_tipo CHECK (tipo_impuesto IN ('002_IVA', '003_IEPS')),
    tasa_o_cuota DECIMAL(6,4) NOT NULL,
    base_gravable DECIMAL(12,2) NOT NULL,
    importe_impuesto DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_oi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_oi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_impuestos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ventas_oi_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID));
GO

-- 069. TABLA: ventas.ordenes_descuentos (Transaccional)
IF OBJECT_ID(N'ventas.ordenes_descuentos', N'U') IS NOT NULL DROP TABLE ventas.ordenes_descuentos;
CREATE TABLE ventas.ordenes_descuentos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_tipo_descuento BIGINT NOT NULL,
    codigo_promocion_aplicado NVARCHAR(40) NOT NULL,
    monto_descontado DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_odesc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_odesc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_descuentos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ventas_odesc_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_ventas_odesc_tipo FOREIGN KEY (ID_tipo_descuento) REFERENCES ventas.tipos_descuento(ID));
GO

-- 070. TABLA: ventas.ordenes_notas_instrucciones (Transaccional)
IF OBJECT_ID(N'ventas.ordenes_notas_instrucciones', N'U') IS NOT NULL DROP TABLE ventas.ordenes_notas_instrucciones;
CREATE TABLE ventas.ordenes_notas_instrucciones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    es_para_regalo BIT NOT NULL CONSTRAINT DF_ventas_oni_regalo DEFAULT 0,
    mensaje_tarjeta_regalo NVARCHAR(300) NULL,
    instrucciones_entrega_repartidor NVARCHAR(300) NULL,
    empaque_especial_ecologico BIT NOT NULL CONSTRAINT DF_ventas_oni_eco DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_oni_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_oni_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_notas PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_oni_orden UNIQUE (ID_orden),
    CONSTRAINT FK_ventas_oni_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID));
GO

-- 071. TABLA: ventas.reservas_temporales_stock (Transaccional Bloqueo Concurrente)
IF OBJECT_ID(N'ventas.reservas_temporales_stock', N'U') IS NOT NULL DROP TABLE ventas.reservas_temporales_stock;
CREATE TABLE ventas.reservas_temporales_stock (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_carrito BIGINT NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    cantidad_reservada INT NOT NULL CONSTRAINT CK_ventas_rts_cant CHECK (cantidad_reservada >= 1),
    fecha_reserva DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_rts_fres DEFAULT SYSDATETIME(),
    fecha_expiracion_reserva DATETIME2(3) NOT NULL, -- 15 minutos para completar pago
    liberada BIT NOT NULL CONSTRAINT DF_ventas_rts_lib DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_rts_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_rts_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_reservas_stock PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_ventas_rts_carrito FOREIGN KEY (ID_carrito) REFERENCES ventas.carritos(ID),
    CONSTRAINT FK_ventas_rts_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 072. TABLA: ventas.afiliados_influencers (Maestra Programa de Creadores)
IF OBJECT_ID(N'ventas.afiliados_influencers', N'U') IS NOT NULL DROP TABLE ventas.afiliados_influencers;
CREATE TABLE ventas.afiliados_influencers (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_afiliado NVARCHAR(30) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    nombre_canal_red_social NVARCHAR(100) NOT NULL,
    porcentaje_comision DECIMAL(5,2) NOT NULL CONSTRAINT CK_ventas_ai_com CHECK (porcentaje_comision BETWEEN 1.00 AND 30.00),
    clabe_interbancaria VARCHAR(18) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ai_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ai_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_afiliados PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_ai_codigo UNIQUE (codigo_afiliado),
    CONSTRAINT FK_ventas_ai_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- 073. TABLA: ventas.comisiones_afiliados (Transaccional)
IF OBJECT_ID(N'ventas.comisiones_afiliados', N'U') IS NOT NULL DROP TABLE ventas.comisiones_afiliados;
CREATE TABLE ventas.comisiones_afiliados (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_afiliado BIGINT NOT NULL,
    ID_orden BIGINT NOT NULL,
    monto_base_calculo DECIMAL(12,2) NOT NULL,
    monto_comision DECIMAL(12,2) NOT NULL,
    estado_pago NVARCHAR(20) NOT NULL CONSTRAINT CK_ventas_ca_est CHECK (estado_pago IN (N'PENDIENTE', N'APROBADA', N'PAGADA', N'CANCELADA_POR_DEVOLUCION')),
    fecha_dispersion_pago DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ca_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ca_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_comisiones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_ventas_ca_orden UNIQUE (ID_orden),
    CONSTRAINT FK_ventas_ca_afiliado FOREIGN KEY (ID_afiliado) REFERENCES ventas.afiliados_influencers(ID),
    CONSTRAINT FK_ventas_ca_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID));
GO

-- =================================================================================================
-- SECCIÓN 2.3: PASARELAS DE PAGO, WALLET, ANTIFRAUDE Y REEMBOLSOS (TABLAS 074 - 086)
-- =================================================================================================

-- 074. TABLA: pagos.proveedores_pasarela (Catálogo 13)
IF OBJECT_ID(N'pagos.proveedores_pasarela', N'U') IS NOT NULL DROP TABLE pagos.proveedores_pasarela;
CREATE TABLE pagos.proveedores_pasarela (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_pasarela NVARCHAR(20) NOT NULL,
    nombre_comercial NVARCHAR(60) NOT NULL, -- STRIPE, MERCADOPAGO, PAYPAL, OPENPAY, SPEI_DIRECTO
    url_webhook NVARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_pp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_pp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_proveedores_pasarela PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_pp_codigo UNIQUE (codigo_pasarela)
);
GO

-- 075. TABLA: pagos.metodos_pago (Catálogo 14)
IF OBJECT_ID(N'pagos.metodos_pago', N'U') IS NOT NULL DROP TABLE pagos.metodos_pago;
CREATE TABLE pagos.metodos_pago (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_metodo NVARCHAR(20) NOT NULL,
    nombre_metodo NVARCHAR(60) NOT NULL, -- TARJETA_CREDITO, TARJETA_DEBITO, TRANSFERENCIA_SPEI, BILLETERA_WALLET, PUNTOS_BEAUTY
    comision_porcentual_fija DECIMAL(5,2) NOT NULL CONSTRAINT DF_pagos_mp_comfija DEFAULT 2.90,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_mp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_mp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_metodos_pago PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_mp_codigo UNIQUE (codigo_metodo)
);
GO

-- 076. TABLA: pagos.transacciones (Maestra Transaccional de Pagos)
IF OBJECT_ID(N'pagos.transacciones', N'U') IS NOT NULL DROP TABLE pagos.transacciones;
CREATE TABLE pagos.transacciones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    folio_transaccion NVARCHAR(45) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_proveedor_pasarela BIGINT NOT NULL,
    ID_metodo_pago BIGINT NOT NULL,
    id_transaccion_externa_pasarela NVARCHAR(100) NOT NULL, -- ID devuelto por Stripe/MercadoPago
    monto_transaccion DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_tx_monto CHECK (monto_transaccion > 0),
    moneda VARCHAR(3) NOT NULL CONSTRAINT DF_pagos_tx_mon DEFAULT 'MXN',
    estado_pago NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_tx_est CHECK (estado_pago IN (N'PENDIENTE', N'APROBADA', N'RECHAZADA', N'CANCELADA', N'EN_MEDIACION')),
    codigo_autorizacion_bancaria NVARCHAR(30) NULL,
    fecha_pago_efectuado DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_tx_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_tx_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_transacciones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_tx_folio UNIQUE (folio_transaccion),
    CONSTRAINT FK_pagos_tx_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_pagos_tx_pasarela FOREIGN KEY (ID_proveedor_pasarela) REFERENCES pagos.proveedores_pasarela(ID),
    CONSTRAINT FK_pagos_tx_metodo FOREIGN KEY (ID_metodo_pago) REFERENCES pagos.metodos_pago(ID));
GO

-- 077. TABLA: pagos.intentos_cobro (Bitácora de Comunicación de API Pasarelas)
IF OBJECT_ID(N'pagos.intentos_cobro', N'U') IS NOT NULL DROP TABLE pagos.intentos_cobro;
CREATE TABLE pagos.intentos_cobro (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_transaccion BIGINT NOT NULL,
    numero_intento INT NOT NULL,
    codigo_respuesta_http INT NOT NULL,
    payload_solicitud_sanitizado NVARCHAR(MAX) NOT NULL, -- Sin CVV ni datos sensibles
    payload_respuesta_pasarela NVARCHAR(MAX) NOT NULL,
    mensaje_error_banco NVARCHAR(250) NULL,
    fecha_intento DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ic_fi DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_ic_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ic_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_intentos_cobro PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_pagos_ic_transaccion FOREIGN KEY (ID_transaccion) REFERENCES pagos.transacciones(ID));
GO

-- 078. TABLA: pagos.split_multipagos (Transaccional Multipago)
IF OBJECT_ID(N'pagos.split_multipagos', N'U') IS NOT NULL DROP TABLE pagos.split_multipagos;
CREATE TABLE pagos.split_multipagos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_metodo_pago BIGINT NOT NULL,
    monto_asignado DECIMAL(12,2) NOT NULL,
    referencia_comprobante NVARCHAR(80) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_smp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_smp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_split_multipagos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_pagos_smp_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_pagos_smp_metodo FOREIGN KEY (ID_metodo_pago) REFERENCES pagos.metodos_pago(ID));
GO

-- 079. TABLA: pagos.billetera_electronica (Maestra Wallet Cliente)
IF OBJECT_ID(N'pagos.billetera_electronica', N'U') IS NOT NULL DROP TABLE pagos.billetera_electronica;
CREATE TABLE pagos.billetera_electronica (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    saldo_disponible DECIMAL(12,2) NOT NULL CONSTRAINT DF_pagos_be_saldo DEFAULT 0.00,
    saldo_bloqueado_retenido DECIMAL(12,2) NOT NULL CONSTRAINT DF_pagos_be_bloq DEFAULT 0.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_be_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_be_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_billetera PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_be_cliente UNIQUE (ID_cliente),
    CONSTRAINT FK_pagos_be_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 080. TABLA: pagos.movimientos_billetera (Transaccional)
IF OBJECT_ID(N'pagos.movimientos_billetera', N'U') IS NOT NULL DROP TABLE pagos.movimientos_billetera;
CREATE TABLE pagos.movimientos_billetera (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_billetera BIGINT NOT NULL,
    tipo_movimiento NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_mb_tipo CHECK (tipo_movimiento IN (N'CARGA_SALDO', N'PAGO_ORDEN', N'REEMBOLSO_DEVOLUCION', N'BONIFICACION_FIDELIDAD')),
    monto DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_mb_monto CHECK (monto > 0),
    saldo_anterior DECIMAL(12,2) NOT NULL,
    saldo_posterior DECIMAL(12,2) NOT NULL,
    descripcion_motivo NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_mb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_mb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_movimientos_billetera PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_pagos_mb_billetera FOREIGN KEY (ID_billetera) REFERENCES pagos.billetera_electronica(ID));
GO

-- 081. TABLA: pagos.tarjetas_regalo_giftcards (Maestra)
IF OBJECT_ID(N'pagos.tarjetas_regalo_giftcards', N'U') IS NOT NULL DROP TABLE pagos.tarjetas_regalo_giftcards;
CREATE TABLE pagos.tarjetas_regalo_giftcards (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_giftcard_hash NVARCHAR(128) NOT NULL,
    monto_inicial DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_gc_ini CHECK (monto_inicial > 0),
    saldo_actual DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_gc_saldo CHECK (saldo_actual >= 0),
    fecha_vencimiento DATE NOT NULL,
    ID_cliente_comprador BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_gc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_gc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_giftcards PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_gc_hash UNIQUE (codigo_giftcard_hash),
    CONSTRAINT FK_pagos_gc_comprador FOREIGN KEY (ID_cliente_comprador) REFERENCES clientes.clientes(ID));
GO

-- 082. TABLA: pagos.redenciones_giftcards (Transaccional)
IF OBJECT_ID(N'pagos.redenciones_giftcards', N'U') IS NOT NULL DROP TABLE pagos.redenciones_giftcards;
CREATE TABLE pagos.redenciones_giftcards (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_giftcard BIGINT NOT NULL,
    ID_orden BIGINT NOT NULL,
    monto_redimido DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_rg_monto CHECK (monto_redimido > 0),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_rg_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_rg_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_redenciones_giftcard PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_pagos_rg_giftcard FOREIGN KEY (ID_giftcard) REFERENCES pagos.tarjetas_regalo_giftcards(ID),
    CONSTRAINT FK_pagos_rg_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID));
GO

-- 083. TABLA: pagos.reglas_antifraude (Maestra)
IF OBJECT_ID(N'pagos.reglas_antifraude', N'U') IS NOT NULL DROP TABLE pagos.reglas_antifraude;
CREATE TABLE pagos.reglas_antifraude (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_regla NVARCHAR(30) NOT NULL,
    descripcion NVARCHAR(200) NOT NULL,
    puntaje_riesgo_asignado INT NOT NULL CONSTRAINT CK_pagos_ra_pts CHECK (puntaje_riesgo_asignado BETWEEN 1 AND 100),
    bloqueo_automatico BIT NOT NULL CONSTRAINT DF_pagos_ra_bloq DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_ra_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ra_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_reglas_antifraude PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_ra_codigo UNIQUE (codigo_regla)
);
GO

-- 084. TABLA: pagos.evaluaciones_antifraude (Transaccional)
IF OBJECT_ID(N'pagos.evaluaciones_antifraude', N'U') IS NOT NULL DROP TABLE pagos.evaluaciones_antifraude;
CREATE TABLE pagos.evaluaciones_antifraude (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_regla_antifraude BIGINT NULL,
    score_riesgo_total INT NOT NULL,
    nivel_riesgo NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_ea_nivel CHECK (nivel_riesgo IN (N'BAJO', N'MEDIO', N'ALTO_REQUERIR_3DS', N'CRITICO_RECHAZADO')),
    ip_origen NVARCHAR(45) NOT NULL,
    distancia_geografica_km INT NULL,
    dispositivo_sospechoso BIT NOT NULL CONSTRAINT DF_pagos_ea_disp DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_ea_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ea_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_evaluaciones_fraude PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_ea_orden UNIQUE (ID_orden),
    CONSTRAINT FK_pagos_ea_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_pagos_ea_regla FOREIGN KEY (ID_regla_antifraude) REFERENCES pagos.reglas_antifraude(ID));
GO

-- 085. TABLA: pagos.contracargos_chargebacks (Transaccional Disputas)
IF OBJECT_ID(N'pagos.contracargos_chargebacks', N'U') IS NOT NULL DROP TABLE pagos.contracargos_chargebacks;
CREATE TABLE pagos.contracargos_chargebacks (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_transaccion BIGINT NOT NULL,
    folio_disputa_pasarela NVARCHAR(60) NOT NULL,
    motivo_disputa NVARCHAR(150) NOT NULL, -- Tarjeta no presente, Mercancía no recibida, No reconocida
    monto_disputado DECIMAL(12,2) NOT NULL,
    fecha_notificacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_cc_fn DEFAULT SYSDATETIME(),
    fecha_limite_evidencia DATE NOT NULL,
    estatus_disputa NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_cc_est CHECK (estatus_disputa IN (N'ABIERTA', N'EN_REVISION', N'GANADA_POR_COMERCIO', N'PERDIDA_POR_COMERCIO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_cc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_cc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_contracargos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_cc_disputa UNIQUE (folio_disputa_pasarela),
    CONSTRAINT FK_pagos_cc_transaccion FOREIGN KEY (ID_transaccion) REFERENCES pagos.transacciones(ID));
GO

-- 086. TABLA: pagos.reembolsos_transaccion (Transaccional)
IF OBJECT_ID(N'pagos.reembolsos_transaccion', N'U') IS NOT NULL DROP TABLE pagos.reembolsos_transaccion;
CREATE TABLE pagos.reembolsos_transaccion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_transaccion BIGINT NOT NULL,
    folio_reembolso_pasarela NVARCHAR(80) NOT NULL,
    monto_reembolsado DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_reemb_monto CHECK (monto_reembolsado > 0),
    motivo_reembolso NVARCHAR(250) NOT NULL,
    fecha_reembolso DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_reemb_fr DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_reemb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_reemb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_reembolsos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_pagos_reemb_folio UNIQUE (folio_reembolso_pasarela),
    CONSTRAINT FK_pagos_reemb_transaccion FOREIGN KEY (ID_transaccion) REFERENCES pagos.transacciones(ID));
GO

-- =================================================================================================
-- SECCIÓN 2.4: FACTURACIÓN ELECTRÓNICA CFDI 4.0 Y MOTOR DE PROMOCIONES (TABLAS 087 - 100)
-- =================================================================================================

-- 087. TABLA: fiscal.regimenes_sat (Catálogo 15)
IF OBJECT_ID(N'fiscal.regimenes_sat', N'U') IS NOT NULL DROP TABLE fiscal.regimenes_sat;
CREATE TABLE fiscal.regimenes_sat (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    clave_regimen_sat VARCHAR(4) NOT NULL, -- Ej: 601 General de Ley, 605 Sueldos, 612 Actividad Empresarial, 626 RESICO
    descripcion NVARCHAR(200) NOT NULL,
    aplica_persona_fisica BIT NOT NULL,
    aplica_persona_moral BIT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_rs_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_rs_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_regimenes_sat PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_fiscal_rs_clave UNIQUE (clave_regimen_sat)
);
GO

-- 088. TABLA: fiscal.usos_cfdi (Catálogo 16)
IF OBJECT_ID(N'fiscal.usos_cfdi', N'U') IS NOT NULL DROP TABLE fiscal.usos_cfdi;
CREATE TABLE fiscal.usos_cfdi (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    clave_uso_cfdi VARCHAR(5) NOT NULL, -- G01 Adquisición de mercancías, G03 Gastos en general, CP01 Pagos, S01 Sin efectos fiscales
    descripcion NVARCHAR(150) NOT NULL,
    aplica_fisica BIT NOT NULL,
    aplica_moral BIT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_uc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_uc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_usos_cfdi PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_fiscal_uc_clave UNIQUE (clave_uso_cfdi)
);
GO

-- 089. TABLA: fiscal.datos_fiscales_cliente (Transaccional)
IF OBJECT_ID(N'fiscal.datos_fiscales_cliente', N'U') IS NOT NULL DROP TABLE fiscal.datos_fiscales_cliente;
CREATE TABLE fiscal.datos_fiscales_cliente (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    rfc_emisor VARCHAR(13) NOT NULL,
    razon_social NVARCHAR(150) NOT NULL,
    codigo_postal_fiscal VARCHAR(10) NOT NULL,
    ID_regimen_sat BIGINT NOT NULL,
    ID_uso_cfdi_predeterminado BIGINT NOT NULL,
    correo_envio_cfdi NVARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_dfc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_dfc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_datos_fiscales PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_fiscal_dfc_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_fiscal_dfc_regimen FOREIGN KEY (ID_regimen_sat) REFERENCES fiscal.regimenes_sat(ID),
    CONSTRAINT FK_fiscal_dfc_uso FOREIGN KEY (ID_uso_cfdi_predeterminado) REFERENCES fiscal.usos_cfdi(ID));
GO

-- 090. TABLA: fiscal.facturas_cfdi (Maestra Transaccional CFDI 4.0)
IF OBJECT_ID(N'fiscal.facturas_cfdi', N'U') IS NOT NULL DROP TABLE fiscal.facturas_cfdi;
CREATE TABLE fiscal.facturas_cfdi (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_orden BIGINT NOT NULL,
    ID_dato_fiscal BIGINT NOT NULL,
    serie_factura VARCHAR(10) NOT NULL,
    folio_factura VARCHAR(20) NOT NULL,
    uuid_sat_fiscal UNIQUEIDENTIFIER NOT NULL, -- UUID de timbrado fiscal SAT
    sello_digital_cfdi NVARCHAR(MAX) NOT NULL,
    sello_sat NVARCHAR(MAX) NOT NULL,
    cadena_original_timbre NVARCHAR(MAX) NOT NULL,
    numero_certificado_sat VARCHAR(20) NOT NULL,
    fecha_timbrado DATETIME2(3) NOT NULL,
    monto_total_facturado DECIMAL(12,2) NOT NULL,
    estado_cfdi NVARCHAR(20) NOT NULL CONSTRAINT CK_fiscal_fcfdi_est CHECK (estado_cfdi IN (N'TIMBRADA_VIGENTE', N'CANCELADA_SAT', N'ERROR_TIMBRADO')),
    xml_comprobante_url NVARCHAR(300) NOT NULL,
    pdf_representacion_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_fcfdi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_fcfdi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_facturas PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_fiscal_fcfdi_uuid UNIQUE (uuid_sat_fiscal),
    CONSTRAINT FK_fiscal_fcfdi_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID),
    CONSTRAINT FK_fiscal_fcfdi_df FOREIGN KEY (ID_dato_fiscal) REFERENCES fiscal.datos_fiscales_cliente(ID));
GO

-- 091. TABLA: fiscal.facturas_partidas (Transaccional)
IF OBJECT_ID(N'fiscal.facturas_partidas', N'U') IS NOT NULL DROP TABLE fiscal.facturas_partidas;
CREATE TABLE fiscal.facturas_partidas (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_factura BIGINT NOT NULL,
    clave_producto_servicio_sat VARCHAR(10) NOT NULL, -- Ej: 53131600 Cosméticos y cuidado de la piel
    clave_unidad_sat VARCHAR(5) NOT NULL, -- H87 Pieza
    cantidad DECIMAL(12,2) NOT NULL,
    valor_unitario DECIMAL(12,2) NOT NULL,
    importe_neto DECIMAL(12,2) NOT NULL,
    objeto_impuesto VARCHAR(3) NOT NULL CONSTRAINT DF_fiscal_fp_obj DEFAULT '02', -- 02 Sí objeto de impuesto
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_fp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_fp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_facturas_partidas PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_fiscal_fp_factura FOREIGN KEY (ID_factura) REFERENCES fiscal.facturas_cfdi(ID));
GO

-- 092. TABLA: fiscal.complementos_pago (Transaccional Recibos Electrónicos de Pago)
IF OBJECT_ID(N'fiscal.complementos_pago', N'U') IS NOT NULL DROP TABLE fiscal.complementos_pago;
CREATE TABLE fiscal.complementos_pago (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_factura BIGINT NOT NULL,
    ID_transaccion BIGINT NOT NULL,
    uuid_sat_complemento UNIQUEIDENTIFIER NOT NULL,
    numero_parcialidad INT NOT NULL CONSTRAINT DF_fiscal_cp_parc DEFAULT 1,
    saldo_anterior DECIMAL(12,2) NOT NULL,
    monto_pagado DECIMAL(12,2) NOT NULL,
    saldo_insoluto DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_cp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_cp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_complementos_pago PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_fiscal_cp_uuid UNIQUE (uuid_sat_complemento),
    CONSTRAINT FK_fiscal_cp_factura FOREIGN KEY (ID_factura) REFERENCES fiscal.facturas_cfdi(ID),
    CONSTRAINT FK_fiscal_cp_transaccion FOREIGN KEY (ID_transaccion) REFERENCES pagos.transacciones(ID));
GO

-- 093. TABLA: fiscal.notas_credito (Transaccional)
IF OBJECT_ID(N'fiscal.notas_credito', N'U') IS NOT NULL DROP TABLE fiscal.notas_credito;
CREATE TABLE fiscal.notas_credito (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_factura BIGINT NOT NULL,
    uuid_sat_nota_credito UNIQUEIDENTIFIER NOT NULL,
    motivo_devolucion_sat VARCHAR(3) NOT NULL, -- 01 Devolución de mercancías
    subtotal_acreditado DECIMAL(12,2) NOT NULL,
    iva_acreditado DECIMAL(12,2) NOT NULL,
    total_acreditado DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_nc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_nc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_notas_credito PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_fiscal_nc_uuid UNIQUE (uuid_sat_nota_credito),
    CONSTRAINT FK_fiscal_nc_factura FOREIGN KEY (ID_factura) REFERENCES fiscal.facturas_cfdi(ID));
GO

-- 094. TABLA: fiscal.cancelaciones_cfdi (Transaccional Auditoría Fiscal)
IF OBJECT_ID(N'fiscal.cancelaciones_cfdi', N'U') IS NOT NULL DROP TABLE fiscal.cancelaciones_cfdi;
CREATE TABLE fiscal.cancelaciones_cfdi (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_factura BIGINT NOT NULL,
    motivo_cancelacion_sat VARCHAR(4) NOT NULL CONSTRAINT CK_fiscal_ccfdi_mot CHECK (motivo_cancelacion_sat IN ('01', '02', '03', '04')),
    uuid_sustitucion UNIQUEIDENTIFIER NULL,
    acuse_cancelacion_sat NVARCHAR(MAX) NOT NULL,
    fecha_solicitud_cancelacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_ccfdi_fsol DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_ccfdi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_ccfdi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_cancelaciones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_fiscal_ccfdi_factura FOREIGN KEY (ID_factura) REFERENCES fiscal.facturas_cfdi(ID));
GO

-- 095. TABLA: promos.campanias (Maestra)
IF OBJECT_ID(N'promos.campanias', N'U') IS NOT NULL DROP TABLE promos.campanias;
CREATE TABLE promos.campanias (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_campania NVARCHAR(30) NOT NULL,
    nombre_campania NVARCHAR(100) NOT NULL, -- Ej: Hot Sale Belleza, Black Friday Dermocosmética
    fecha_inicio DATETIME2(3) NOT NULL,
    fecha_fin DATETIME2(3) NOT NULL,
    presupuesto_maximo_descuentos DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_camp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_camp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_campanias PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_promos_camp_codigo UNIQUE (codigo_campania)
);
GO

-- 096. TABLA: promos.cupones (Maestra Cupones)
IF OBJECT_ID(N'promos.cupones', N'U') IS NOT NULL DROP TABLE promos.cupones;
CREATE TABLE promos.cupones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_campania BIGINT NOT NULL,
    codigo_cupon NVARCHAR(30) NOT NULL, -- Ej: PIELRADIANTE20, BIENVENIDA10
    ID_tipo_descuento BIGINT NOT NULL,
    valor_descuento DECIMAL(12,2) NOT NULL CONSTRAINT CK_promos_cup_val CHECK (valor_descuento > 0),
    monto_minimo_compra DECIMAL(12,2) NOT NULL CONSTRAINT DF_promos_cup_min DEFAULT 0.00,
    limite_usos_totales INT NOT NULL,
    usos_actuales INT NOT NULL CONSTRAINT DF_promos_cup_usos DEFAULT 0,
    limite_usos_por_cliente INT NOT NULL CONSTRAINT DF_promos_cup_ucli DEFAULT 1,
    fecha_expiracion DATETIME2(3) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_cup_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_cup_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_cupones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_promos_cup_codigo UNIQUE (codigo_cupon),
    CONSTRAINT FK_promos_cup_campania FOREIGN KEY (ID_campania) REFERENCES promos.campanias(ID),
    CONSTRAINT FK_promos_cup_tipo FOREIGN KEY (ID_tipo_descuento) REFERENCES ventas.tipos_descuento(ID));
GO

-- 097. TABLA: promos.reglas_elegibilidad_cupon (Transaccional)
IF OBJECT_ID(N'promos.reglas_elegibilidad_cupon', N'U') IS NOT NULL DROP TABLE promos.reglas_elegibilidad_cupon;
CREATE TABLE promos.reglas_elegibilidad_cupon (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cupon BIGINT NOT NULL,
    solo_primera_compra BIT NOT NULL CONSTRAINT DF_promos_rec_pc DEFAULT 0,
    excluye_kits_promocionales BIT NOT NULL CONSTRAINT DF_promos_rec_ek DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_rec_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_rec_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_reglas_cupon PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_promos_rec_cupon UNIQUE (ID_cupon),
    CONSTRAINT FK_promos_rec_cupon FOREIGN KEY (ID_cupon) REFERENCES promos.cupones(ID));
GO

-- 098. TABLA: promos.cupones_categorias_excluidas (Intermedia N:M)
IF OBJECT_ID(N'promos.cupones_categorias_excluidas', N'U') IS NOT NULL DROP TABLE promos.cupones_categorias_excluidas;
CREATE TABLE promos.cupones_categorias_excluidas (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cupon BIGINT NOT NULL,
    ID_categoria BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_cce_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_cce_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_cupones_exclusiones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_promos_cce_cupon_cat UNIQUE (ID_cupon, ID_categoria),
    CONSTRAINT FK_promos_cce_cupon FOREIGN KEY (ID_cupon) REFERENCES promos.cupones(ID),
    CONSTRAINT FK_promos_cce_categoria FOREIGN KEY (ID_categoria) REFERENCES catalogo.categorias(ID));
GO

-- 099. TABLA: promos.redenciones_cupones (Transaccional)
IF OBJECT_ID(N'promos.redenciones_cupones', N'U') IS NOT NULL DROP TABLE promos.redenciones_cupones;
CREATE TABLE promos.redenciones_cupones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cupon BIGINT NOT NULL,
    ID_cliente BIGINT NOT NULL,
    ID_orden BIGINT NOT NULL,
    monto_ahorrado DECIMAL(12,2) NOT NULL,
    fecha_aplicacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_rcup_fa DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_rcup_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_rcup_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_redenciones_cupones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_promos_rcup_cupon FOREIGN KEY (ID_cupon) REFERENCES promos.cupones(ID),
    CONSTRAINT FK_promos_rcup_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_promos_rcup_orden FOREIGN KEY (ID_orden) REFERENCES ventas.ordenes(ID));
GO

-- 100. TABLA: promos.ventas_flash_horarias (Transaccional Promociones Relámpago)
IF OBJECT_ID(N'promos.ventas_flash_horarias', N'U') IS NOT NULL DROP TABLE promos.ventas_flash_horarias;
CREATE TABLE promos.ventas_flash_horarias (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    precio_oferta_flash DECIMAL(12,2) NOT NULL CONSTRAINT CK_promos_vfh_precio CHECK (precio_oferta_flash > 0),
    stock_destinado_flash INT NOT NULL CONSTRAINT CK_promos_vfh_stock CHECK (stock_destinado_flash >= 1),
    stock_vendido_flash INT NOT NULL CONSTRAINT DF_promos_vfh_vend DEFAULT 0,
    fecha_hora_inicio DATETIME2(3) NOT NULL,
    fecha_hora_fin DATETIME2(3) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_vfh_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_vfh_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_ventas_flash PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_promos_vfh_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

PRINT '====================================================================================';
PRINT 'ÉXITO: Se crearon satisfactoriamente las 50 Tablas del Submódulo 2 (Integrante 2)';
PRINT 'Tablas acumuladas en el sistema: 100 Tablas.';
PRINT 'Todas cuentan con ID autoincrementable y las 7 columnas de auditoría / soft delete.';
PRINT '====================================================================================';
GO

-- =================================================================================================
-- ÍNDICES SECUNDARIOS DEL SUBMÓDULO 2 (10 Índices de Rendimiento)
-- =================================================================================================
CREATE NONCLUSTERED INDEX IX_ventas_ordenes_cliente_fecha ON ventas.ordenes (ID_cliente, fecha_orden);
CREATE NONCLUSTERED INDEX IX_ventas_ordenes_estado_activo ON ventas.ordenes (ID_estado_orden, activo);
CREATE NONCLUSTERED INDEX IX_ventas_ordenes_det_orden_sku ON ventas.ordenes_detalles (ID_orden, ID_variante_sku);
CREATE NONCLUSTERED INDEX IX_ventas_suscrip_cliente_est ON ventas.suscripciones_cliente (ID_cliente, estado_suscripcion);
CREATE NONCLUSTERED INDEX IX_ventas_suscrip_cal_susc_est ON ventas.suscripciones_calendario_entregas (ID_suscripcion_cliente, estado_despacho);
CREATE NONCLUSTERED INDEX IX_pagos_tx_orden_estado ON pagos.transacciones (ID_orden, estado_pago);
CREATE NONCLUSTERED INDEX IX_pagos_antifraude_orden_riesgo ON pagos.evaluaciones_antifraude (ID_orden, nivel_riesgo, score_riesgo_total);
CREATE NONCLUSTERED INDEX IX_fiscal_facturas_orden_estado ON fiscal.facturas_cfdi (ID_orden, estado_cfdi);
CREATE NONCLUSTERED INDEX IX_promos_cupones_camp_activo ON promos.cupones (ID_campania, activo);
CREATE NONCLUSTERED INDEX IX_promos_redenciones_cup_ord ON promos.redenciones_cupones (ID_cupon, ID_orden);
GO
