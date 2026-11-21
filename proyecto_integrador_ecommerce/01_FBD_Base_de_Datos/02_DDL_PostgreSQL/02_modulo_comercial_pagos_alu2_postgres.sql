-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 2: MOTOR TRANSACCIONAL, SUSCRIPCIONES, PASARELAS DE PAGO, ANTIFRAUDE Y CFDI 4.0
-- AUTOR / INTEGRANTE 2: Estudiante 2 (Responsable de Tablas 051 a 100)
-- SGBD DESTINO: PostgreSQL 14 / 15 / 16 (Motor de Software Libre)
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

CREATE SCHEMA IF NOT EXISTS ventas;
CREATE SCHEMA IF NOT EXISTS pagos;
CREATE SCHEMA IF NOT EXISTS fiscal;
CREATE SCHEMA IF NOT EXISTS promos;

-- =================================================================================================
-- SECCIÓN 2.1: CARRO, SUSCRIPCIONES Y PROMOCIONES DE CLIENTE (TABLAS 051 - 063)
-- =================================================================================================

-- 051. TABLA: ventas.tipos_descuento (Catálogo 9)
DROP TABLE IF EXISTS ventas.tipos_descuento CASCADE;
CREATE TABLE ventas.tipos_descuento (
    id_tipo_descuento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_descuento VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
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

-- 052. TABLA: ventas.estados_orden (Catálogo 10)
DROP TABLE IF EXISTS ventas.estados_orden CASCADE;
CREATE TABLE ventas.estados_orden (
    id_estado_orden BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_estado VARCHAR(30) NOT NULL UNIQUE,
    nombre_estado VARCHAR(60) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    es_terminal BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 053. TABLA: ventas.motivos_cancelacion_orden (Catálogo 11)
DROP TABLE IF EXISTS ventas.motivos_cancelacion_orden CASCADE;
CREATE TABLE ventas.motivos_cancelacion_orden (
    id_motivo_cancelacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_motivo VARCHAR(30) NOT NULL UNIQUE,
    descripcion_motivo VARCHAR(200) NOT NULL,
    es_atribuible_cliente BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 054. TABLA: ventas.carritos (Transaccional)
DROP TABLE IF EXISTS ventas.carritos CASCADE;
CREATE TABLE ventas.carritos (
    id_carrito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    token_sesion_carrito VARCHAR(128) NOT NULL UNIQUE,
    fecha_ultima_actividad TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    convertido_a_orden BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_carr_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 055. TABLA: ventas.items_carrito (Transaccional)
DROP TABLE IF EXISTS ventas.items_carrito CASCADE;
CREATE TABLE ventas.items_carrito (
    id_item_carrito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carrito BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad >= 1),
    precio_unitario_capturado NUMERIC(12,2) NOT NULL,
    fecha_agregado TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_ic_carrito_sku UNIQUE (carrito, variante_sku),
    CONSTRAINT FK_ventas_ic_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito),
    CONSTRAINT FK_ventas_ic_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 056. TABLA: ventas.carritos_abandonados_seguimiento (Transaccional)
DROP TABLE IF EXISTS ventas.carritos_abandonados_seguimiento CASCADE;
CREATE TABLE ventas.carritos_abandonados_seguimiento (
    id_seguimiento_carrito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carrito BIGINT NOT NULL UNIQUE,
    correo_recordatorio_enviado BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_envio_recordatorio TIMESTAMPTZ NULL,
    recuperado BOOLEAN NOT NULL DEFAULT FALSE,
    monto_estimado_recuperable NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_cas_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito));

-- 057. TABLA: ventas.planes_suscripcion (Maestra Beauty Box / Resurtido)
DROP TABLE IF EXISTS ventas.planes_suscripcion CASCADE;
CREATE TABLE ventas.planes_suscripcion (
    id_plan_suscripcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_plan VARCHAR(30) NOT NULL UNIQUE,
    nombre_plan VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    precio_recurrente_base NUMERIC(12,2) NOT NULL CHECK (precio_recurrente_base > 0),
    descuento_porcentual_fidelidad NUMERIC(5,2) NOT NULL DEFAULT 10.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 058. TABLA: ventas.frecuencias_suscripcion (Catálogo 12)
DROP TABLE IF EXISTS ventas.frecuencias_suscripcion CASCADE;
CREATE TABLE ventas.frecuencias_suscripcion (
    id_frecuencia_suscripcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_frecuencia VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    intervalo_dias INT NOT NULL CHECK (intervalo_dias BETWEEN 15 AND 180),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 059. TABLA: ventas.suscripciones_cliente (Transaccional)
DROP TABLE IF EXISTS ventas.suscripciones_cliente CASCADE;
CREATE TABLE ventas.suscripciones_cliente (
    id_suscripcion_cliente BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_suscripcion VARCHAR(35) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    plan_suscripcion BIGINT NOT NULL,
    frecuencia_suscripcion BIGINT NOT NULL,
    direccion_entrega BIGINT NOT NULL,
    metodo_tokenizado BIGINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    proxima_fecha_cobro DATE NOT NULL,
    estado_suscripcion VARCHAR(20) NOT NULL CHECK (estado_suscripcion IN ('ACTIVA', 'PAUSADA', 'CANCELADA', 'PAGO_FALLIDO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_sc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_ventas_sc_plan FOREIGN KEY (plan_suscripcion) REFERENCES ventas.planes_suscripcion(id_plan_suscripcion),
    CONSTRAINT FK_ventas_sc_frecuencia FOREIGN KEY (frecuencia_suscripcion) REFERENCES ventas.frecuencias_suscripcion(id_frecuencia_suscripcion),
    CONSTRAINT FK_ventas_sc_direccion FOREIGN KEY (direccion_entrega) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_sc_metodo FOREIGN KEY (metodo_tokenizado) REFERENCES clientes.metodos_pago_tokenizados(id_metodo_tokenizado));

-- 060. TABLA: ventas.suscripciones_items (Intermedia N:M)
DROP TABLE IF EXISTS ventas.suscripciones_items CASCADE;
CREATE TABLE ventas.suscripciones_items (
    id_suscripcion_item BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    suscripcion_cliente BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad >= 1),
    precio_congelado_suscripcion NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_si_susc_sku UNIQUE (suscripcion_cliente, variante_sku),
    CONSTRAINT FK_ventas_si_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente),
    CONSTRAINT FK_ventas_si_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 061. TABLA: ventas.suscripciones_calendario_entregas (Transaccional)
DROP TABLE IF EXISTS ventas.suscripciones_calendario_entregas CASCADE;
CREATE TABLE ventas.suscripciones_calendario_entregas (
    id_entrega_programada BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    suscripcion_cliente BIGINT NOT NULL,
    fecha_programada_despacho DATE NOT NULL,
    numero_ciclo_periodo INT NOT NULL,
    estado_despacho VARCHAR(30) NOT NULL CHECK (estado_despacho IN ('PROGRAMADO', 'COBRADO_PROCESANDO', 'DESPACHADO', 'OMITIDO_POR_CLIENTE')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_sce_susc_ciclo UNIQUE (suscripcion_cliente, numero_ciclo_periodo),
    CONSTRAINT FK_ventas_sce_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente));

-- 062. TABLA: ventas.suscripciones_bitacora_estados (Bitácora)
DROP TABLE IF EXISTS ventas.suscripciones_bitacora_estados CASCADE;
CREATE TABLE ventas.suscripciones_bitacora_estados (
    id_bitacora_suscripcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    suscripcion_cliente BIGINT NOT NULL,
    estado_anterior VARCHAR(20) NOT NULL,
    estado_nuevo VARCHAR(20) NOT NULL,
    motivo_cambio VARCHAR(255) NOT NULL,
    fecha_cambio TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_sbe_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente));

-- 063. TABLA: ventas.regalos_por_compra_gwp (Transaccional)
DROP TABLE IF EXISTS ventas.regalos_por_compra_gwp CASCADE;
CREATE TABLE ventas.regalos_por_compra_gwp (
    id_regalo_compra BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_promocion_gwp VARCHAR(30) NOT NULL UNIQUE,
    nombre_promocion VARCHAR(100) NOT NULL,
    monto_minimo_requerido NUMERIC(12,2) NOT NULL,
    variante_sku_regalo BIGINT NOT NULL,
    fecha_inicio TIMESTAMPTZ NOT NULL,
    fecha_fin TIMESTAMPTZ NOT NULL,
    stock_maximo_regalos INT NOT NULL,
    regalos_entregados INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_gwp_sku FOREIGN KEY (variante_sku_regalo) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- =================================================================================================
-- SECCIÓN 2.2: MOTOR TRANSACCIONAL DE ÓRDENES Y CHECKOUT (TABLAS 064 - 073)
-- =================================================================================================

-- 064. TABLA: ventas.ordenes (Maestra Transaccional de Ventas)
DROP TABLE IF EXISTS ventas.ordenes CASCADE;
CREATE TABLE ventas.ordenes (
    id_orden BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_orden VARCHAR(40) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    estado_orden BIGINT NOT NULL,
    motivo_cancelacion BIGINT NULL,
    direccion_envio BIGINT NOT NULL,
    direccion_facturacion BIGINT NULL,
    fecha_orden TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    subtotal_bruto NUMERIC(12,2) NOT NULL CHECK (subtotal_bruto >= 0),
    total_descuentos NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    total_impuestos_iva NUMERIC(12,2) NOT NULL CHECK (total_impuestos_iva >= 0),
    costo_envio NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    total_neto NUMERIC(12,2) NOT NULL CHECK (total_neto > 0),
    moneda VARCHAR(3) NOT NULL DEFAULT 'MXN',
    requiere_factura BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ord_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_ventas_ord_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden),
    CONSTRAINT FK_ventas_ord_direnvio FOREIGN KEY (direccion_envio) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_ord_dirfact FOREIGN KEY (direccion_facturacion) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_ord_motivo_cancel FOREIGN KEY (motivo_cancelacion) REFERENCES ventas.motivos_cancelacion_orden(id_motivo_cancelacion));

-- 065. TABLA: ventas.ordenes_detalles (Transaccional Líneas de Producto)
DROP TABLE IF EXISTS ventas.ordenes_detalles CASCADE;
CREATE TABLE ventas.ordenes_detalles (
    id_orden_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    numero_partida INT NOT NULL,
    cantidad_comprada INT NOT NULL CHECK (cantidad_comprada >= 1),
    precio_unitario_venta NUMERIC(12,2) NOT NULL,
    costo_unitario_historico NUMERIC(12,2) NOT NULL,
    monto_descuento_aplicado NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    subtotal_linea NUMERIC(12,2) NOT NULL,
    tasa_iva_porcentual NUMERIC(5,2) NOT NULL DEFAULT 16.00,
    monto_iva_linea NUMERIC(12,2) NOT NULL,
    total_linea NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_od_partida UNIQUE (orden, numero_partida),
    CONSTRAINT FK_ventas_od_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_od_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 066. TABLA: ventas.ordenes_historial_estados (Bitácora de Estados)
DROP TABLE IF EXISTS ventas.ordenes_historial_estados CASCADE;
CREATE TABLE ventas.ordenes_historial_estados (
    id_orden_historial BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    estado_orden BIGINT NOT NULL,
    comentario_operativo VARCHAR(300) NOT NULL,
    fecha_registro TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ohe_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_ohe_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden));

-- 067. TABLA: ventas.ordenes_splits_almacen (Transaccional Splits)
DROP TABLE IF EXISTS ventas.ordenes_splits_almacen CASCADE;
CREATE TABLE ventas.ordenes_splits_almacen (
    id_orden_split BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    sub_folio_split VARCHAR(45) NOT NULL UNIQUE,
    estado_split VARCHAR(30) NOT NULL CHECK (estado_split IN ('PENDIENTE', 'ASIGNADO', 'SURTIENDO', 'EMPAQUETADO', 'EN_RUTA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_osa_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 068. TABLA: ventas.ordenes_impuestos (Transaccional Impuestos)
DROP TABLE IF EXISTS ventas.ordenes_impuestos CASCADE;
CREATE TABLE ventas.ordenes_impuestos (
    id_orden_impuesto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    tipo_impuesto VARCHAR(10) NOT NULL CHECK (tipo_impuesto IN ('002_IVA', '003_IEPS')),
    tasa_o_cuota NUMERIC(6,4) NOT NULL,
    base_gravable NUMERIC(12,2) NOT NULL,
    importe_impuesto NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_oi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 069. TABLA: ventas.ordenes_descuentos (Transaccional)
DROP TABLE IF EXISTS ventas.ordenes_descuentos CASCADE;
CREATE TABLE ventas.ordenes_descuentos (
    id_orden_descuento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    tipo_descuento BIGINT NOT NULL,
    codigo_promocion_aplicado VARCHAR(40) NOT NULL,
    monto_descontado NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_odesc_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_odesc_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento));

-- 070. TABLA: ventas.ordenes_notas_instrucciones (Transaccional)
DROP TABLE IF EXISTS ventas.ordenes_notas_instrucciones CASCADE;
CREATE TABLE ventas.ordenes_notas_instrucciones (
    id_orden_nota BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL UNIQUE,
    es_para_regalo BOOLEAN NOT NULL DEFAULT FALSE,
    mensaje_tarjeta_regalo VARCHAR(300) NULL,
    instrucciones_entrega_repartidor VARCHAR(300) NULL,
    empaque_especial_ecologico BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_oni_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 071. TABLA: ventas.reservas_temporales_stock (Transaccional)
DROP TABLE IF EXISTS ventas.reservas_temporales_stock CASCADE;
CREATE TABLE ventas.reservas_temporales_stock (
    id_reserva_stock BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carrito BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_reservada INT NOT NULL CHECK (cantidad_reservada >= 1),
    fecha_reserva TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion_reserva TIMESTAMPTZ NOT NULL,
    liberada BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_rts_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito),
    CONSTRAINT FK_ventas_rts_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 072. TABLA: ventas.afiliados_influencers (Maestra)
DROP TABLE IF EXISTS ventas.afiliados_influencers CASCADE;
CREATE TABLE ventas.afiliados_influencers (
    id_afiliado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_afiliado VARCHAR(30) NOT NULL UNIQUE,
    usuario BIGINT NOT NULL,
    nombre_canal_red_social VARCHAR(100) NOT NULL,
    porcentaje_comision NUMERIC(5,2) NOT NULL CHECK (porcentaje_comision BETWEEN 1.00 AND 30.00),
    clabe_interbancaria VARCHAR(18) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ai_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 073. TABLA: ventas.comisiones_afiliados (Transaccional)
DROP TABLE IF EXISTS ventas.comisiones_afiliados CASCADE;
CREATE TABLE ventas.comisiones_afiliados (
    id_comision_afiliado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    afiliado BIGINT NOT NULL,
    orden BIGINT NOT NULL UNIQUE,
    monto_base_calculo NUMERIC(12,2) NOT NULL,
    monto_comision NUMERIC(12,2) NOT NULL,
    estado_pago VARCHAR(30) NOT NULL CHECK (estado_pago IN ('PENDIENTE', 'APROBADA', 'PAGADA', 'CANCELADA_POR_DEVOLUCION')),
    fecha_dispersion_pago TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ca_afiliado FOREIGN KEY (afiliado) REFERENCES ventas.afiliados_influencers(id_afiliado),
    CONSTRAINT FK_ventas_ca_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- =================================================================================================
-- SECCIÓN 2.3: PASARELAS DE PAGO, WALLET, ANTIFRAUDE Y REEMBOLSOS (TABLAS 074 - 086)
-- =================================================================================================

-- 074. TABLA: pagos.proveedores_pasarela (Catálogo 13)
DROP TABLE IF EXISTS pagos.proveedores_pasarela CASCADE;
CREATE TABLE pagos.proveedores_pasarela (
    id_proveedor_pasarela BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_pasarela VARCHAR(20) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(60) NOT NULL,
    url_webhook VARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 075. TABLA: pagos.metodos_pago (Catálogo 14)
DROP TABLE IF EXISTS pagos.metodos_pago CASCADE;
CREATE TABLE pagos.metodos_pago (
    id_metodo_pago BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_metodo VARCHAR(20) NOT NULL UNIQUE,
    nombre_metodo VARCHAR(60) NOT NULL,
    comision_porcentual_fija NUMERIC(5,2) NOT NULL DEFAULT 2.90,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 076. TABLA: pagos.transacciones (Maestra Transaccional de Pagos)
DROP TABLE IF EXISTS pagos.transacciones CASCADE;
CREATE TABLE pagos.transacciones (
    id_transaccion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_transaccion VARCHAR(45) NOT NULL UNIQUE,
    orden BIGINT NOT NULL,
    proveedor_pasarela BIGINT NOT NULL,
    metodo_pago BIGINT NOT NULL,
    id_transaccion_externa_pasarela VARCHAR(100) NOT NULL,
    monto_transaccion NUMERIC(12,2) NOT NULL CHECK (monto_transaccion > 0),
    moneda VARCHAR(3) NOT NULL DEFAULT 'MXN',
    estado_pago VARCHAR(25) NOT NULL CHECK (estado_pago IN ('PENDIENTE', 'APROBADA', 'RECHAZADA', 'CANCELADA', 'EN_MEDIACION')),
    codigo_autorizacion_bancaria VARCHAR(30) NULL,
    fecha_pago_efectuado TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_tx_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_tx_pasarela FOREIGN KEY (proveedor_pasarela) REFERENCES pagos.proveedores_pasarela(id_proveedor_pasarela),
    CONSTRAINT FK_pagos_tx_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago));

-- 077. TABLA: pagos.intentos_cobro (Bitácora API)
DROP TABLE IF EXISTS pagos.intentos_cobro CASCADE;
CREATE TABLE pagos.intentos_cobro (
    id_intento_cobro BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaccion BIGINT NOT NULL,
    numero_intento INT NOT NULL,
    codigo_respuesta_http INT NOT NULL,
    payload_solicitud_sanitizado TEXT NOT NULL,
    payload_respuesta_pasarela TEXT NOT NULL,
    mensaje_error_banco VARCHAR(250) NULL,
    fecha_intento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_ic_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- 078. TABLA: pagos.split_multipagos (Transaccional)
DROP TABLE IF EXISTS pagos.split_multipagos CASCADE;
CREATE TABLE pagos.split_multipagos (
    id_split_pago BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    metodo_pago BIGINT NOT NULL,
    monto_asignado NUMERIC(12,2) NOT NULL,
    referencia_comprobante VARCHAR(80) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_smp_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_smp_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago));

-- 079. TABLA: pagos.billetera_electronica (Maestra Wallet)
DROP TABLE IF EXISTS pagos.billetera_electronica CASCADE;
CREATE TABLE pagos.billetera_electronica (
    id_billetera BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL UNIQUE,
    saldo_disponible NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    saldo_bloqueado_retenido NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_be_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 080. TABLA: pagos.movimientos_billetera (Transaccional)
DROP TABLE IF EXISTS pagos.movimientos_billetera CASCADE;
CREATE TABLE pagos.movimientos_billetera (
    id_movimiento_billetera BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    billetera BIGINT NOT NULL,
    tipo_movimiento VARCHAR(25) NOT NULL CHECK (tipo_movimiento IN ('CARGA_SALDO', 'PAGO_ORDEN', 'REEMBOLSO_DEVOLUCION', 'BONIFICACION_FIDELIDAD')),
    monto NUMERIC(12,2) NOT NULL CHECK (monto > 0),
    saldo_anterior NUMERIC(12,2) NOT NULL,
    saldo_posterior NUMERIC(12,2) NOT NULL,
    descripcion_motivo VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_mb_billetera FOREIGN KEY (billetera) REFERENCES pagos.billetera_electronica(id_billetera));

-- 081. TABLA: pagos.tarjetas_regalo_giftcards (Maestra)
DROP TABLE IF EXISTS pagos.tarjetas_regalo_giftcards CASCADE;
CREATE TABLE pagos.tarjetas_regalo_giftcards (
    id_giftcard BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_giftcard_hash VARCHAR(128) NOT NULL UNIQUE,
    monto_inicial NUMERIC(12,2) NOT NULL CHECK (monto_inicial > 0),
    saldo_actual NUMERIC(12,2) NOT NULL CHECK (saldo_actual >= 0),
    fecha_vencimiento DATE NOT NULL,
    cliente_comprador BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_gc_comprador FOREIGN KEY (cliente_comprador) REFERENCES clientes.clientes(id_cliente));

-- 082. TABLA: pagos.redenciones_giftcards (Transaccional)
DROP TABLE IF EXISTS pagos.redenciones_giftcards CASCADE;
CREATE TABLE pagos.redenciones_giftcards (
    id_redencion_giftcard BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    giftcard BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_redimido NUMERIC(12,2) NOT NULL CHECK (monto_redimido > 0),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_rg_giftcard FOREIGN KEY (giftcard) REFERENCES pagos.tarjetas_regalo_giftcards(id_giftcard),
    CONSTRAINT FK_pagos_rg_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 083. TABLA: pagos.reglas_antifraude (Maestra)
DROP TABLE IF EXISTS pagos.reglas_antifraude CASCADE;
CREATE TABLE pagos.reglas_antifraude (
    id_regla_antifraude BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_regla VARCHAR(30) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL,
    puntaje_riesgo_asignado INT NOT NULL CHECK (puntaje_riesgo_asignado BETWEEN 1 AND 100),
    bloqueo_automatico BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 084. TABLA: pagos.evaluaciones_antifraude (Transaccional)
DROP TABLE IF EXISTS pagos.evaluaciones_antifraude CASCADE;
CREATE TABLE pagos.evaluaciones_antifraude (
    id_evaluacion_fraude BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL UNIQUE,
    regla_antifraude BIGINT NULL,
    score_riesgo_total INT NOT NULL,
    nivel_riesgo VARCHAR(25) NOT NULL CHECK (nivel_riesgo IN ('BAJO', 'MEDIO', 'ALTO_REQUERIR_3DS', 'CRITICO_RECHAZADO')),
    ip_origen VARCHAR(45) NOT NULL,
    distancia_geografica_km INT NULL,
    dispositivo_sospechoso BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_ea_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_ea_regla FOREIGN KEY (regla_antifraude) REFERENCES pagos.reglas_antifraude(id_regla_antifraude));

-- 085. TABLA: pagos.contracargos_chargebacks (Transaccional Disputas)
DROP TABLE IF EXISTS pagos.contracargos_chargebacks CASCADE;
CREATE TABLE pagos.contracargos_chargebacks (
    id_contracargo BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaccion BIGINT NOT NULL,
    folio_disputa_pasarela VARCHAR(60) NOT NULL UNIQUE,
    motivo_disputa VARCHAR(150) NOT NULL,
    monto_disputado NUMERIC(12,2) NOT NULL,
    fecha_notificacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_limite_evidencia DATE NOT NULL,
    estatus_disputa VARCHAR(30) NOT NULL CHECK (estatus_disputa IN ('ABIERTA', 'EN_REVISION', 'GANADA_POR_COMERCIO', 'PERDIDA_POR_COMERCIO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_cc_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- 086. TABLA: pagos.reembolsos_transaccion (Transaccional)
DROP TABLE IF EXISTS pagos.reembolsos_transaccion CASCADE;
CREATE TABLE pagos.reembolsos_transaccion (
    id_reembolso BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaccion BIGINT NOT NULL,
    folio_reembolso_pasarela VARCHAR(80) NOT NULL UNIQUE,
    monto_reembolsado NUMERIC(12,2) NOT NULL CHECK (monto_reembolsado > 0),
    motivo_reembolso VARCHAR(250) NOT NULL,
    fecha_reembolso TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_reemb_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- =================================================================================================
-- SECCIÓN 2.4: FACTURACIÓN ELECTRÓNICA CFDI 4.0 Y MOTOR DE PROMOCIONES (TABLAS 087 - 100)
-- =================================================================================================

-- 087. TABLA: fiscal.regimenes_sat (Catálogo 15)
DROP TABLE IF EXISTS fiscal.regimenes_sat CASCADE;
CREATE TABLE fiscal.regimenes_sat (
    id_regimen_sat BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_regimen_sat VARCHAR(4) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL,
    aplica_persona_fisica BOOLEAN NOT NULL,
    aplica_persona_moral BOOLEAN NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 088. TABLA: fiscal.usos_cfdi (Catálogo 16)
DROP TABLE IF EXISTS fiscal.usos_cfdi CASCADE;
CREATE TABLE fiscal.usos_cfdi (
    id_uso_cfdi BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_uso_cfdi VARCHAR(5) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL,
    aplica_fisica BOOLEAN NOT NULL,
    aplica_moral BOOLEAN NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 089. TABLA: fiscal.datos_fiscales_cliente (Transaccional)
DROP TABLE IF EXISTS fiscal.datos_fiscales_cliente CASCADE;
CREATE TABLE fiscal.datos_fiscales_cliente (
    id_dato_fiscal BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    rfc_emisor VARCHAR(13) NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    codigo_postal_fiscal VARCHAR(10) NOT NULL,
    regimen_sat BIGINT NOT NULL,
    uso_cfdi_predeterminado BIGINT NOT NULL,
    correo_envio_cfdi VARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_dfc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_fiscal_dfc_regimen FOREIGN KEY (regimen_sat) REFERENCES fiscal.regimenes_sat(id_regimen_sat),
    CONSTRAINT FK_fiscal_dfc_uso FOREIGN KEY (uso_cfdi_predeterminado) REFERENCES fiscal.usos_cfdi(id_uso_cfdi));

-- 090. TABLA: fiscal.facturas_cfdi (Maestra Transaccional CFDI 4.0)
DROP TABLE IF EXISTS fiscal.facturas_cfdi CASCADE;
CREATE TABLE fiscal.facturas_cfdi (
    id_factura BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    dato_fiscal BIGINT NOT NULL,
    serie_factura VARCHAR(10) NOT NULL,
    folio_factura VARCHAR(20) NOT NULL,
    uuid_sat_fiscal UUID NOT NULL UNIQUE,
    sello_digital_cfdi TEXT NOT NULL,
    sello_sat TEXT NOT NULL,
    cadena_original_timbre TEXT NOT NULL,
    numero_certificado_sat VARCHAR(20) NOT NULL,
    fecha_timbrado TIMESTAMPTZ NOT NULL,
    monto_total_facturado NUMERIC(12,2) NOT NULL,
    estado_cfdi VARCHAR(25) NOT NULL CHECK (estado_cfdi IN ('TIMBRADA_VIGENTE', 'CANCELADA_SAT', 'ERROR_TIMBRADO')),
    xml_comprobante_url VARCHAR(300) NOT NULL,
    pdf_representacion_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_fcfdi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_fiscal_fcfdi_df FOREIGN KEY (dato_fiscal) REFERENCES fiscal.datos_fiscales_cliente(id_dato_fiscal));

-- 091. TABLA: fiscal.facturas_partidas (Transaccional)
DROP TABLE IF EXISTS fiscal.facturas_partidas CASCADE;
CREATE TABLE fiscal.facturas_partidas (
    id_factura_partida BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    clave_producto_servicio_sat VARCHAR(10) NOT NULL,
    clave_unidad_sat VARCHAR(5) NOT NULL,
    cantidad NUMERIC(12,2) NOT NULL,
    valor_unitario NUMERIC(12,2) NOT NULL,
    importe_neto NUMERIC(12,2) NOT NULL,
    objeto_impuesto VARCHAR(3) NOT NULL DEFAULT '02',
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_fp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));

-- 092. TABLA: fiscal.complementos_pago (Transaccional)
DROP TABLE IF EXISTS fiscal.complementos_pago CASCADE;
CREATE TABLE fiscal.complementos_pago (
    id_complemento_pago BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    transaccion BIGINT NOT NULL,
    uuid_sat_complemento UUID NOT NULL UNIQUE,
    numero_parcialidad INT NOT NULL DEFAULT 1,
    saldo_anterior NUMERIC(12,2) NOT NULL,
    monto_pagado NUMERIC(12,2) NOT NULL,
    saldo_insoluto NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_cp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura),
    CONSTRAINT FK_fiscal_cp_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- 093. TABLA: fiscal.notas_credito (Transaccional)
DROP TABLE IF EXISTS fiscal.notas_credito CASCADE;
CREATE TABLE fiscal.notas_credito (
    id_nota_credito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    uuid_sat_nota_credito UUID NOT NULL UNIQUE,
    motivo_devolucion_sat VARCHAR(3) NOT NULL,
    subtotal_acreditado NUMERIC(12,2) NOT NULL,
    iva_acreditado NUMERIC(12,2) NOT NULL,
    total_acreditado NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_nc_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));

-- 094. TABLA: fiscal.cancelaciones_cfdi (Transaccional)
DROP TABLE IF EXISTS fiscal.cancelaciones_cfdi CASCADE;
CREATE TABLE fiscal.cancelaciones_cfdi (
    id_cancelacion_cfdi BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    motivo_cancelacion_sat VARCHAR(4) NOT NULL CHECK (motivo_cancelacion_sat IN ('01', '02', '03', '04')),
    uuid_sustitucion UUID NULL,
    acuse_cancelacion_sat TEXT NOT NULL,
    fecha_solicitud_cancelacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_ccfdi_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));

-- 095. TABLA: promos.campanias (Maestra)
DROP TABLE IF EXISTS promos.campanias CASCADE;
CREATE TABLE promos.campanias (
    id_campania BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_campania VARCHAR(30) NOT NULL UNIQUE,
    nombre_campania VARCHAR(100) NOT NULL,
    fecha_inicio TIMESTAMPTZ NOT NULL,
    fecha_fin TIMESTAMPTZ NOT NULL,
    presupuesto_maximo_descuentos NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 096. TABLA: promos.cupones (Maestra)
DROP TABLE IF EXISTS promos.cupones CASCADE;
CREATE TABLE promos.cupones (
    id_cupon BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    campania BIGINT NOT NULL,
    codigo_cupon VARCHAR(30) NOT NULL UNIQUE,
    tipo_descuento BIGINT NOT NULL,
    valor_descuento NUMERIC(12,2) NOT NULL CHECK (valor_descuento > 0),
    monto_minimo_compra NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    limite_usos_totales INT NOT NULL,
    usos_actuales INT NOT NULL DEFAULT 0,
    limite_usos_por_cliente INT NOT NULL DEFAULT 1,
    fecha_expiracion TIMESTAMPTZ NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_cup_campania FOREIGN KEY (campania) REFERENCES promos.campanias(id_campania),
    CONSTRAINT FK_promos_cup_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento));

-- 097. TABLA: promos.reglas_elegibilidad_cupon (Transaccional)
DROP TABLE IF EXISTS promos.reglas_elegibilidad_cupon CASCADE;
CREATE TABLE promos.reglas_elegibilidad_cupon (
    id_regla_cupon BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cupon BIGINT NOT NULL UNIQUE,
    solo_primera_compra BOOLEAN NOT NULL DEFAULT FALSE,
    excluye_kits_promocionales BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_rec_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon));

-- 098. TABLA: promos.cupones_categorias_excluidas (Intermedia N:M)
DROP TABLE IF EXISTS promos.cupones_categorias_excluidas CASCADE;
CREATE TABLE promos.cupones_categorias_excluidas (
    id_cupon_exclusion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cupon BIGINT NOT NULL,
    categoria BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_promos_cce_cupon_cat UNIQUE (cupon, categoria),
    CONSTRAINT FK_promos_cce_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon),
    CONSTRAINT FK_promos_cce_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria));

-- 099. TABLA: promos.redenciones_cupones (Transaccional)
DROP TABLE IF EXISTS promos.redenciones_cupones CASCADE;
CREATE TABLE promos.redenciones_cupones (
    id_redencion_cupon BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cupon BIGINT NOT NULL,
    cliente BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_ahorrado NUMERIC(12,2) NOT NULL,
    fecha_aplicacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_rcup_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon),
    CONSTRAINT FK_promos_rcup_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_promos_rcup_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 100. TABLA: promos.ventas_flash_horarias (Transaccional)
DROP TABLE IF EXISTS promos.ventas_flash_horarias CASCADE;
CREATE TABLE promos.ventas_flash_horarias (
    id_venta_flash BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL,
    precio_oferta_flash NUMERIC(12,2) NOT NULL CHECK (precio_oferta_flash > 0),
    stock_destinado_flash INT NOT NULL CHECK (stock_destinado_flash >= 1),
    stock_vendido_flash INT NOT NULL DEFAULT 0,
    fecha_hora_inicio TIMESTAMPTZ NOT NULL,
    fecha_hora_fin TIMESTAMPTZ NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_vfh_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 2 (VENTAS, SUSCRIPCIONES, PAGOS, CFDI Y PROMOCIONES)
-- =================================================================================================
CREATE INDEX IF NOT EXISTS IX_ventas_ordenes_cliente_fecha ON ventas.ordenes (cliente, fecha_orden);
CREATE INDEX IF NOT EXISTS IX_ventas_ordenes_estado_activo ON ventas.ordenes (estado_orden, activo);
CREATE INDEX IF NOT EXISTS IX_ventas_ordenes_det_orden_sku ON ventas.ordenes_detalles (orden, variante_sku);
CREATE INDEX IF NOT EXISTS IX_ventas_suscrip_cliente_est ON ventas.suscripciones_cliente (cliente, estado_suscripcion);
CREATE INDEX IF NOT EXISTS IX_ventas_suscrip_cal_susc_est ON ventas.suscripciones_calendario_entregas (suscripcion_cliente, estado_despacho);
CREATE INDEX IF NOT EXISTS IX_pagos_tx_orden_estado ON pagos.transacciones (orden, estado_pago);
CREATE INDEX IF NOT EXISTS IX_pagos_antifraude_orden_riesgo ON pagos.evaluaciones_antifraude (orden, nivel_riesgo, score_riesgo_total);
CREATE INDEX IF NOT EXISTS IX_fiscal_facturas_orden_estado ON fiscal.facturas_cfdi (orden, estado_cfdi);
CREATE INDEX IF NOT EXISTS IX_promos_cupones_camp_activo ON promos.cupones (campania, activo);
CREATE INDEX IF NOT EXISTS IX_promos_redenciones_cup_ord ON promos.redenciones_cupones (cupon, orden);
