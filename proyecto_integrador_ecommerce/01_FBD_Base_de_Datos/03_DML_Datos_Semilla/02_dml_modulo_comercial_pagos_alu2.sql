-- =================================================================================================
-- SUBMÓDULO 2: OPERACIONES COMERCIALES, PASARELAS DE PAGO Y FACTURACIÓN CFDI 4.0
-- Tablas 051 a 100 (Autor: Sheyla EstefanÍa Moncada Guel)
-- Sincronizado 100% con 00_MASTER_SEED_DATA_SQLSERVER.sql (PK: ID / FKs: ID_*)
-- =================================================================================================
USE EcommerceSaludBellezaDB;
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.tipos_descuento ON;
INSERT INTO ventas.tipos_descuento (ID, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'DESCUENT_01', N'Porcentaje Directo Nivel 1', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'DESCUENT_02', N'Monto Fijo MXN Nivel 1', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'DESCUENT_03', N'Suscripción Beauty-Box Nivel 1', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'DESCUENT_04', N'Envío Gratuito VIP Nivel 1', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'DESCUENT_05', N'Regalo por Compra (GWP) Nivel 1', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'DESCUENT_06', N'Porcentaje Directo Nivel 2', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'DESCUENT_07', N'Monto Fijo MXN Nivel 2', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'DESCUENT_08', N'Suscripción Beauty-Box Nivel 2', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'DESCUENT_09', N'Envío Gratuito VIP Nivel 2', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'DESCUENT_10', N'Regalo por Compra (GWP) Nivel 2', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'DESCUENT_11', N'Porcentaje Directo Nivel 3', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'DESCUENT_12', N'Monto Fijo MXN Nivel 3', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'DESCUENT_13', N'Suscripción Beauty-Box Nivel 3', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'DESCUENT_14', N'Envío Gratuito VIP Nivel 3', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'DESCUENT_15', N'Regalo por Compra (GWP) Nivel 3', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'DESCUENT_16', N'Porcentaje Directo Nivel 4', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'DESCUENT_17', N'Monto Fijo MXN Nivel 4', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'DESCUENT_18', N'Suscripción Beauty-Box Nivel 4', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'DESCUENT_19', N'Envío Gratuito VIP Nivel 4', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'DESCUENT_20', N'Regalo por Compra (GWP) Nivel 4', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'DESCUENT_21', N'Porcentaje Directo Nivel 5', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'DESCUENT_22', N'Monto Fijo MXN Nivel 5', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'DESCUENT_23', N'Suscripción Beauty-Box Nivel 5', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'DESCUENT_24', N'Envío Gratuito VIP Nivel 5', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'DESCUENT_25', N'Regalo por Compra (GWP) Nivel 5', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'DESCUENT_26', N'Porcentaje Directo Nivel 6', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'DESCUENT_27', N'Monto Fijo MXN Nivel 6', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'DESCUENT_28', N'Suscripción Beauty-Box Nivel 6', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'DESCUENT_29', N'Envío Gratuito VIP Nivel 6', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'DESCUENT_30', N'Regalo por Compra (GWP) Nivel 6', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.tipos_descuento OFF;
GO

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.estados_orden ON;
INSERT INTO ventas.estados_orden (ID, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PEND_PAGO', N'Pendiente de Pago', N'Orden registrada esperando confirmación bancaria o SPEI', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PAGADA', N'Pago Confirmado', N'Transacción aprobada y lista para asignación de almacén', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PREPARANDO', N'En Preparación CEDIS', N'Surtido en curso bajo estrategia FEFO y empaque térmico', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'EN_TRANSITO', N'Enviada en Tránsito', N'Paquete recolectado por paquetería con guía de rastreo', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ENTREGADA', N'Entregada al Cliente', N'Recepción confirmada en domicilio del destinatario', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CANCELADA', N'Cancelada', N'Orden anulada antes del despacho con liberación de stock', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'DEVUELTA', N'Devuelta por RMA', N'Mercancía retornada y dictaminada en postventa', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT ventas.estados_orden OFF;
GO

-- =================================================================================================
-- 053. TABLA: ventas.motivos_cancelacion_orden (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.motivos_cancelacion_orden ON;
INSERT INTO ventas.motivos_cancelacion_orden (ID, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Cliente solicitó cancelación antes de recolección en CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Error en dirección de entrega o código postal capturado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Pago rechazado o expirado por institución emisora', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Quiebre de inventario en lote con caducidad vigente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Cambio de producto o tono solicitado por cliente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Cliente solicitó cancelación antes de recolección en CEDIS', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Error en dirección de entrega o código postal capturado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Pago rechazado o expirado por institución emisora', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Quiebre de inventario en lote con caducidad vigente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Cambio de producto o tono solicitado por cliente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Cliente solicitó cancelación antes de recolección en CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Error en dirección de entrega o código postal capturado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Pago rechazado o expirado por institución emisora', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Quiebre de inventario en lote con caducidad vigente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Cambio de producto o tono solicitado por cliente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Cliente solicitó cancelación antes de recolección en CEDIS', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Error en dirección de entrega o código postal capturado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Pago rechazado o expirado por institución emisora', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Quiebre de inventario en lote con caducidad vigente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Cambio de producto o tono solicitado por cliente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Cliente solicitó cancelación antes de recolección en CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Error en dirección de entrega o código postal capturado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Pago rechazado o expirado por institución emisora', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Quiebre de inventario en lote con caducidad vigente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Cambio de producto o tono solicitado por cliente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Cliente solicitó cancelación antes de recolección en CEDIS', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Error en dirección de entrega o código postal capturado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Pago rechazado o expirado por institución emisora', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Quiebre de inventario en lote con caducidad vigente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Cambio de producto o tono solicitado por cliente', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.motivos_cancelacion_orden OFF;
GO

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos ON;
INSERT INTO ventas.carritos (ID, ID_cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'cart_57dc5da2039af8209f120c7b2b2be269', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'cart_554ae59cc8f4acc14082de7fc4a9f5b3', '2026-02-02 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'cart_c47636f57a40b6e372daf58b4eeed6c1', '2026-02-03 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'cart_2b38b22aed846681e14862f4a2119795', '2026-02-04 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'cart_6da7b7ebbfa341e1e1ec1d19b3781958', '2026-02-05 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'cart_ae5947c6abb8a651e55f9e2c984e3afb', '2026-02-06 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'cart_9f1bbb48183acdcc679ac9bb0cedaf73', '2026-02-07 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'cart_8080474caaa1d1a4f108a48e2b832d78', '2026-02-08 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'cart_d84d15c981329a2ac173a050f8d4e8e0', '2026-02-09 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'cart_1fad691371770b500d253d30187fcf1a', '2026-02-10 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'cart_bc761d30adb2285a09292f3591e6d22a', '2026-02-11 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'cart_1db8173a08b1f21c1e061ca8ab12f8e7', '2026-02-12 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'cart_28a951a322f66c471ed9e6b6d1446f07', '2026-02-13 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'cart_7584f3ea411c95a2cd3502e695977dab', '2026-02-14 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'cart_89154d767ec2eb8cd9aa6962f6dade7b', '2026-02-15 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'cart_74c0e5204d660ec49f8c06556e097bbf', '2026-02-16 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'cart_8dc42a833499c9a8a2b3c3ccdc7b70b9', '2026-02-17 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'cart_1e8d4b56ad7777d93c481c07c164a7e4', '2026-02-18 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'cart_2875259dce4df7dfde8d04aa94cacfad', '2026-02-19 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'cart_a18af5057ae5f140b0f133ba744d82d4', '2026-02-20 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'cart_089cd763aafad52db63c023d769b471f', '2026-02-21 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'cart_01bc2fd024ad872376159fcca18ea91a', '2026-02-22 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'cart_22f8c2f21386cc2dce796861c0e94195', '2026-02-23 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'cart_1758dfb7f6192568cd3f8b92a8995d85', '2026-02-24 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'cart_9bb7274b4a4f68c3f66552d5f2de9be4', '2026-02-25 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'cart_9142a7c6a5971e60db03b68461494ded', '2026-02-26 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'cart_bb00ee858a90811da2756726f24f1723', '2026-02-27 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'cart_a6f636ca5b9598970e91b89107409258', '2026-02-28 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'cart_9597bf538a12785e1abf35d807246e0e', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'cart_cea37fa7bacdff1e1595ac22411f66ad', '2026-02-02 11:30:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos OFF;
GO

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.items_carrito ON;
INSERT INTO ventas.items_carrito (ID, ID_carrito, ID_variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 285.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 321.00, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 356.50, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 392.00, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 427.50, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 463.00, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 498.50, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 534.00, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 569.50, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 605.00, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 640.50, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 676.00, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 711.50, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 747.00, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 782.50, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 818.00, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 853.50, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 889.00, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 924.50, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 960.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 995.50, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1031.00, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1066.50, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1102.00, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1137.50, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1173.00, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1208.50, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1244.00, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1279.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1315.00, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.items_carrito OFF;
GO

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento ON;
INSERT INTO ventas.carritos_abandonados_seguimiento (ID, ID_carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, 571.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, NULL, 0, 642.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, '2026-02-03 11:30:00', 1, 713.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, NULL, 0, 784.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, '2026-02-05 11:30:00', 1, 855.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, NULL, 0, 926.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, '2026-02-07 11:30:00', 1, 997.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, NULL, 0, 1068.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, '2026-02-09 11:30:00', 1, 1139.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, NULL, 0, 1210.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, '2026-02-11 11:30:00', 1, 1281.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, NULL, 0, 1352.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, '2026-02-13 11:30:00', 1, 1423.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, NULL, 0, 1494.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, '2026-02-15 11:30:00', 1, 1565.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, NULL, 0, 1636.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, '2026-02-17 11:30:00', 1, 1707.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, NULL, 0, 1778.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, '2026-02-19 11:30:00', 1, 1849.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, NULL, 0, 1920.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, '2026-02-21 11:30:00', 1, 1991.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, NULL, 0, 2062.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, '2026-02-23 11:30:00', 1, 2133.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, NULL, 0, 2204.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, '2026-02-25 11:30:00', 1, 2275.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, NULL, 0, 2346.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, '2026-02-27 11:30:00', 1, 2417.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, NULL, 0, 2488.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, '2026-02-01 11:30:00', 1, 2559.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, NULL, 0, 2630.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento OFF;
GO

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.planes_suscripcion ON;
INSERT INTO ventas.planes_suscripcion (ID, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PLAN_01', N'Beauty-Box Dermatológica La Roche-Posay #01', N'Reposición automática personalizada de tratamientos La Roche-Posay con seguimiento clínico.', 285.50, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PLAN_02', N'Beauty-Box Dermatológica CeraVe #02', N'Reposición automática personalizada de tratamientos CeraVe con seguimiento clínico.', 321.00, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PLAN_03', N'Beauty-Box Dermatológica The Ordinary #03', N'Reposición automática personalizada de tratamientos The Ordinary con seguimiento clínico.', 356.50, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PLAN_04', N'Beauty-Box Dermatológica ISDIN #04', N'Reposición automática personalizada de tratamientos ISDIN con seguimiento clínico.', 392.00, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PLAN_05', N'Beauty-Box Dermatológica Bioderma #05', N'Reposición automática personalizada de tratamientos Bioderma con seguimiento clínico.', 427.50, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PLAN_06', N'Beauty-Box Dermatológica Eau Thermale Avène #06', N'Reposición automática personalizada de tratamientos Eau Thermale Avène con seguimiento clínico.', 463.00, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PLAN_07', N'Beauty-Box Dermatológica Eucerin #07', N'Reposición automática personalizada de tratamientos Eucerin con seguimiento clínico.', 498.50, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PLAN_08', N'Beauty-Box Dermatológica Vichy Laboratoires #08', N'Reposición automática personalizada de tratamientos Vichy Laboratoires con seguimiento clínico.', 534.00, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PLAN_09', N'Beauty-Box Dermatológica SkinCeuticals #09', N'Reposición automática personalizada de tratamientos SkinCeuticals con seguimiento clínico.', 569.50, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PLAN_10', N'Beauty-Box Dermatológica Sesderma #10', N'Reposición automática personalizada de tratamientos Sesderma con seguimiento clínico.', 605.00, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PLAN_11', N'Beauty-Box Dermatológica NARS Cosmetics #11', N'Reposición automática personalizada de tratamientos NARS Cosmetics con seguimiento clínico.', 640.50, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PLAN_12', N'Beauty-Box Dermatológica MAC Cosmetics #12', N'Reposición automática personalizada de tratamientos MAC Cosmetics con seguimiento clínico.', 676.00, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PLAN_13', N'Beauty-Box Dermatológica Fenty Beauty #13', N'Reposición automática personalizada de tratamientos Fenty Beauty con seguimiento clínico.', 711.50, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PLAN_14', N'Beauty-Box Dermatológica Rare Beauty #14', N'Reposición automática personalizada de tratamientos Rare Beauty con seguimiento clínico.', 747.00, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PLAN_15', N'Beauty-Box Dermatológica Clinique #15', N'Reposición automática personalizada de tratamientos Clinique con seguimiento clínico.', 782.50, 5.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PLAN_16', N'Beauty-Box Dermatológica Estée Lauder #16', N'Reposición automática personalizada de tratamientos Estée Lauder con seguimiento clínico.', 818.00, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PLAN_17', N'Beauty-Box Dermatológica Lancôme #17', N'Reposición automática personalizada de tratamientos Lancôme con seguimiento clínico.', 853.50, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PLAN_18', N'Beauty-Box Dermatológica Charlotte Tilbury #18', N'Reposición automática personalizada de tratamientos Charlotte Tilbury con seguimiento clínico.', 889.00, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PLAN_19', N'Beauty-Box Dermatológica Paula''s Choice #19', N'Reposición automática personalizada de tratamientos Paula''s Choice con seguimiento clínico.', 924.50, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PLAN_20', N'Beauty-Box Dermatológica COSRX #20', N'Reposición automática personalizada de tratamientos COSRX con seguimiento clínico.', 960.00, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PLAN_21', N'Beauty-Box Dermatológica Laneige #21', N'Reposición automática personalizada de tratamientos Laneige con seguimiento clínico.', 995.50, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PLAN_22', N'Beauty-Box Dermatológica Uriage #22', N'Reposición automática personalizada de tratamientos Uriage con seguimiento clínico.', 1031.00, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PLAN_23', N'Beauty-Box Dermatológica Laboratoire SVR #23', N'Reposición automática personalizada de tratamientos Laboratoire SVR con seguimiento clínico.', 1066.50, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PLAN_24', N'Beauty-Box Dermatológica MartiDerm #24', N'Reposición automática personalizada de tratamientos MartiDerm con seguimiento clínico.', 1102.00, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PLAN_25', N'Beauty-Box Dermatológica Heliocare #25', N'Reposición automática personalizada de tratamientos Heliocare con seguimiento clínico.', 1137.50, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PLAN_26', N'Beauty-Box Dermatológica Kiehl''s #26', N'Reposición automática personalizada de tratamientos Kiehl''s con seguimiento clínico.', 1173.00, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PLAN_27', N'Beauty-Box Dermatológica Garnier SkinActive #27', N'Reposición automática personalizada de tratamientos Garnier SkinActive con seguimiento clínico.', 1208.50, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PLAN_28', N'Beauty-Box Dermatológica L''Oréal Paris Derm #28', N'Reposición automática personalizada de tratamientos L''Oréal Paris Derm con seguimiento clínico.', 1244.00, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PLAN_29', N'Beauty-Box Dermatológica Neutrogena #29', N'Reposición automática personalizada de tratamientos Neutrogena con seguimiento clínico.', 1279.50, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PLAN_30', N'Beauty-Box Dermatológica DermaCare Labs #30', N'Reposición automática personalizada de tratamientos DermaCare Labs con seguimiento clínico.', 1315.00, 5.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.planes_suscripcion OFF;
GO

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.frecuencias_suscripcion ON;
INSERT INTO ventas.frecuencias_suscripcion (ID, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FRECUENC_01', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FRECUENC_02', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FRECUENC_03', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FRECUENC_04', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FRECUENC_05', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FRECUENC_06', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FRECUENC_07', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FRECUENC_08', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FRECUENC_09', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FRECUENC_10', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FRECUENC_11', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FRECUENC_12', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FRECUENC_13', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FRECUENC_14', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FRECUENC_15', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FRECUENC_16', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FRECUENC_17', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FRECUENC_18', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FRECUENC_19', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FRECUENC_20', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FRECUENC_21', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FRECUENC_22', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FRECUENC_23', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FRECUENC_24', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FRECUENC_25', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FRECUENC_26', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FRECUENC_27', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FRECUENC_28', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FRECUENC_29', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FRECUENC_30', N'Cada 60 días', 60, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.frecuencias_suscripcion OFF;
GO

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_cliente ON;
INSERT INTO ventas.suscripciones_cliente (ID, folio_suscripcion, ID_cliente, ID_plan_suscripcion, ID_frecuencia_suscripcion, ID_direccion_entrega, ID_metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-31', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-04-01', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-04-02', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-04-03', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-04-04', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-04-05', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-04-06', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-04-07', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-04-08', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-04-09', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-04-10', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-04-11', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-04-12', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-04-13', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-04-14', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-04-15', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-04-16', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-04-17', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-04-18', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-04-19', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-04-20', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-04-21', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-04-22', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-04-23', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-04-24', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-04-25', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-04-26', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-04-27', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-31', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-04-01', N'PAUSADA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_cliente OFF;
GO

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_items ON;
INSERT INTO ventas.suscripciones_items (ID, ID_suscripcion_cliente, ID_variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 256.95, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 288.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 320.85, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 352.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 384.75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 416.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 448.65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 480.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 512.55, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 544.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 576.45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 608.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 640.35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 672.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 704.25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 736.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 768.15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 800.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 832.05, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 864.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 895.95, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 927.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 959.85, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 991.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1023.75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1055.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1087.65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1119.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1151.55, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1183.50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_items OFF;
GO

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas ON;
INSERT INTO ventas.suscripciones_calendario_entregas (ID, ID_suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, '2026-03-01', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '2026-03-02', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '2026-03-03', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '2026-03-04', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '2026-03-05', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '2026-03-06', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '2026-03-07', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '2026-03-08', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '2026-03-09', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '2026-03-10', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '2026-03-11', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '2026-03-12', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '2026-03-13', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '2026-03-14', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '2026-03-15', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '2026-03-16', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '2026-03-17', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '2026-03-18', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '2026-03-19', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '2026-03-20', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '2026-03-21', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '2026-03-22', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '2026-03-23', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '2026-03-24', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '2026-03-25', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '2026-03-26', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '2026-03-27', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '2026-03-28', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '2026-03-01', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '2026-03-02', 1, N'COBRADO_PROCESANDO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas OFF;
GO

-- =================================================================================================
-- 062. TABLA: ventas.suscripciones_bitacora_estados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados ON;
INSERT INTO ventas.suscripciones_bitacora_estados (ID, ID_suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados OFF;
GO

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp ON;
INSERT INTO ventas.regalos_por_compra_gwp (ID, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, ID_variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROMOCIO_01', N'Regalo GWP La Roche-Posay (Talla Viajera #01)', 899.00, 1, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROMOCIO_02', N'Regalo GWP CeraVe (Talla Viajera #02)', 1099.00, 2, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROMOCIO_03', N'Regalo GWP The Ordinary (Talla Viajera #03)', 1299.00, 3, '2026-02-03 11:30:00', '2026-03-05 11:30:00', 14, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROMOCIO_04', N'Regalo GWP ISDIN (Talla Viajera #04)', 1499.00, 4, '2026-02-04 11:30:00', '2026-03-06 11:30:00', 17, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROMOCIO_05', N'Regalo GWP Bioderma (Talla Viajera #05)', 1699.00, 5, '2026-02-05 11:30:00', '2026-03-07 11:30:00', 20, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROMOCIO_06', N'Regalo GWP Eau Thermale Avène (Talla Viajera #06)', 899.00, 6, '2026-02-06 11:30:00', '2026-03-08 11:30:00', 23, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROMOCIO_07', N'Regalo GWP Eucerin (Talla Viajera #07)', 1099.00, 7, '2026-02-07 11:30:00', '2026-03-09 11:30:00', 26, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROMOCIO_08', N'Regalo GWP Vichy Laboratoires (Talla Viajera #08)', 1299.00, 8, '2026-02-08 11:30:00', '2026-03-10 11:30:00', 29, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROMOCIO_09', N'Regalo GWP SkinCeuticals (Talla Viajera #09)', 1499.00, 9, '2026-02-09 11:30:00', '2026-03-11 11:30:00', 32, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROMOCIO_10', N'Regalo GWP Sesderma (Talla Viajera #10)', 1699.00, 10, '2026-02-10 11:30:00', '2026-03-12 11:30:00', 35, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROMOCIO_11', N'Regalo GWP NARS Cosmetics (Talla Viajera #11)', 899.00, 11, '2026-02-11 11:30:00', '2026-03-13 11:30:00', 38, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROMOCIO_12', N'Regalo GWP MAC Cosmetics (Talla Viajera #12)', 1099.00, 12, '2026-02-12 11:30:00', '2026-03-14 11:30:00', 41, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROMOCIO_13', N'Regalo GWP Fenty Beauty (Talla Viajera #13)', 1299.00, 13, '2026-02-13 11:30:00', '2026-03-15 11:30:00', 44, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROMOCIO_14', N'Regalo GWP Rare Beauty (Talla Viajera #14)', 1499.00, 14, '2026-02-14 11:30:00', '2026-03-16 11:30:00', 47, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROMOCIO_15', N'Regalo GWP Clinique (Talla Viajera #15)', 1699.00, 15, '2026-02-15 11:30:00', '2026-03-17 11:30:00', 50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROMOCIO_16', N'Regalo GWP Estée Lauder (Talla Viajera #16)', 899.00, 16, '2026-02-16 11:30:00', '2026-03-18 11:30:00', 53, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROMOCIO_17', N'Regalo GWP Lancôme (Talla Viajera #17)', 1099.00, 17, '2026-02-17 11:30:00', '2026-03-19 11:30:00', 56, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROMOCIO_18', N'Regalo GWP Charlotte Tilbury (Talla Viajera #18)', 1299.00, 18, '2026-02-18 11:30:00', '2026-03-20 11:30:00', 59, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROMOCIO_19', N'Regalo GWP Paula''s Choice (Talla Viajera #19)', 1499.00, 19, '2026-02-19 11:30:00', '2026-03-21 11:30:00', 62, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROMOCIO_20', N'Regalo GWP COSRX (Talla Viajera #20)', 1699.00, 20, '2026-02-20 11:30:00', '2026-03-22 11:30:00', 65, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROMOCIO_21', N'Regalo GWP Laneige (Talla Viajera #21)', 899.00, 21, '2026-02-21 11:30:00', '2026-03-23 11:30:00', 68, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROMOCIO_22', N'Regalo GWP Uriage (Talla Viajera #22)', 1099.00, 22, '2026-02-22 11:30:00', '2026-03-24 11:30:00', 71, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROMOCIO_23', N'Regalo GWP Laboratoire SVR (Talla Viajera #23)', 1299.00, 23, '2026-02-23 11:30:00', '2026-03-25 11:30:00', 74, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROMOCIO_24', N'Regalo GWP MartiDerm (Talla Viajera #24)', 1499.00, 24, '2026-02-24 11:30:00', '2026-03-26 11:30:00', 77, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROMOCIO_25', N'Regalo GWP Heliocare (Talla Viajera #25)', 1699.00, 25, '2026-02-25 11:30:00', '2026-03-27 11:30:00', 80, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROMOCIO_26', N'Regalo GWP Kiehl''s (Talla Viajera #26)', 899.00, 26, '2026-02-26 11:30:00', '2026-03-28 11:30:00', 83, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROMOCIO_27', N'Regalo GWP Garnier SkinActive (Talla Viajera #27)', 1099.00, 27, '2026-02-27 11:30:00', '2026-03-29 11:30:00', 86, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROMOCIO_28', N'Regalo GWP L''Oréal Paris Derm (Talla Viajera #28)', 1299.00, 28, '2026-02-28 11:30:00', '2026-03-30 11:30:00', 89, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROMOCIO_29', N'Regalo GWP Neutrogena (Talla Viajera #29)', 1499.00, 29, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 92, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROMOCIO_30', N'Regalo GWP DermaCare Labs (Talla Viajera #30)', 1699.00, 30, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 95, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp OFF;
GO

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes ON;
INSERT INTO ventas.ordenes (ID, folio_orden, ID_cliente, ID_estado_orden, ID_motivo_cancelacion, ID_direccion_envio, ID_direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 571.00, 0.00, 91.36, 129.00, 791.36, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 0.00, 51.36, 129.00, 501.36, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 713.00, 71.30, 102.67, 129.00, 873.37, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 0.00, 62.72, 129.00, 583.72, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 855.00, 0.00, 136.80, 129.00, 1120.80, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 46.30, 66.67, 129.00, 612.37, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 7, 7, 7, 7, '2026-02-07 11:30:00', 997.00, 0.00, 159.52, 129.00, 1285.52, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 0.00, 85.44, 129.00, 748.44, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 1139.00, 113.90, 164.02, 0.00, 1189.12, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 0.00, 96.80, 129.00, 830.80, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 1281.00, 0.00, 204.96, 0.00, 1485.96, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 67.60, 97.34, 129.00, 834.74, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 6, 13, 13, 13, '2026-02-13 11:30:00', 1423.00, 0.00, 227.68, 0.00, 1650.68, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 7, 14, 14, 14, '2026-02-14 11:30:00', 747.00, 0.00, 119.52, 129.00, 995.52, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 1565.00, 156.50, 225.36, 0.00, 1633.86, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 0.00, 130.88, 129.00, 1077.88, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 1707.00, 0.00, 273.12, 0.00, 1980.12, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 88.90, 128.02, 129.00, 1057.12, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 1849.00, 0.00, 295.84, 0.00, 2144.84, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 6, 20, 20, 20, '2026-02-20 11:30:00', 960.00, 0.00, 153.60, 129.00, 1242.60, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 7, 21, 21, 21, '2026-02-21 11:30:00', 1991.00, 199.10, 286.70, 0.00, 2078.60, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 0.00, 164.96, 0.00, 1195.96, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 2133.00, 0.00, 341.28, 0.00, 2474.28, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 110.20, 158.69, 129.00, 1279.49, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 2275.00, 0.00, 364.00, 0.00, 2639.00, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 0.00, 187.68, 0.00, 1360.68, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 6, 27, 27, 27, '2026-02-27 11:30:00', 2417.00, 241.70, 348.05, 0.00, 2523.35, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 7, 28, 28, 28, '2026-02-28 11:30:00', 1244.00, 0.00, 199.04, 0.00, 1443.04, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 2559.00, 0.00, 409.44, 0.00, 2968.44, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 131.50, 189.36, 0.00, 1372.86, 'MXN', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes OFF;
GO

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_detalles ON;
INSERT INTO ventas.ordenes_detalles (ID, ID_orden, ID_variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 2, 285.50, 148.46, 0.00, 571.00, 16.00, 91.36, 662.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 1, 321.00, 166.92, 0.00, 321.00, 16.00, 51.36, 372.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 2, 356.50, 185.38, 71.30, 641.70, 16.00, 102.67, 744.37, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 1, 392.00, 203.84, 0.00, 392.00, 16.00, 62.72, 454.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 2, 427.50, 222.30, 0.00, 855.00, 16.00, 136.80, 991.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 1, 463.00, 240.76, 46.30, 416.70, 16.00, 66.67, 483.37, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 2, 498.50, 259.22, 0.00, 997.00, 16.00, 159.52, 1156.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 1, 534.00, 277.68, 0.00, 534.00, 16.00, 85.44, 619.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 2, 569.50, 296.14, 113.90, 1025.10, 16.00, 164.02, 1189.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 1, 605.00, 314.60, 0.00, 605.00, 16.00, 96.80, 701.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 2, 640.50, 333.06, 0.00, 1281.00, 16.00, 204.96, 1485.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 1, 676.00, 351.52, 67.60, 608.40, 16.00, 97.34, 705.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 2, 711.50, 369.98, 0.00, 1423.00, 16.00, 227.68, 1650.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 1, 747.00, 388.44, 0.00, 747.00, 16.00, 119.52, 866.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 2, 782.50, 406.90, 156.50, 1408.50, 16.00, 225.36, 1633.86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 1, 818.00, 425.36, 0.00, 818.00, 16.00, 130.88, 948.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 2, 853.50, 443.82, 0.00, 1707.00, 16.00, 273.12, 1980.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 1, 889.00, 462.28, 88.90, 800.10, 16.00, 128.02, 928.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 2, 924.50, 480.74, 0.00, 1849.00, 16.00, 295.84, 2144.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 1, 960.00, 499.20, 0.00, 960.00, 16.00, 153.60, 1113.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 2, 995.50, 517.66, 199.10, 1791.90, 16.00, 286.70, 2078.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 1, 1031.00, 536.12, 0.00, 1031.00, 16.00, 164.96, 1195.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 2, 1066.50, 554.58, 0.00, 2133.00, 16.00, 341.28, 2474.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 1, 1102.00, 573.04, 110.20, 991.80, 16.00, 158.69, 1150.49, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 2, 1137.50, 591.50, 0.00, 2275.00, 16.00, 364.00, 2639.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 1, 1173.00, 609.96, 0.00, 1173.00, 16.00, 187.68, 1360.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 2, 1208.50, 628.42, 241.70, 2175.30, 16.00, 348.05, 2523.35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 1, 1244.00, 646.88, 0.00, 1244.00, 16.00, 199.04, 1443.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 2, 1279.50, 665.34, 0.00, 2559.00, 16.00, 409.44, 2968.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 1, 1315.00, 683.80, 131.50, 1183.50, 16.00, 189.36, 1372.86, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_detalles OFF;
GO

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_historial_estados ON;
INSERT INTO ventas.ordenes_historial_estados (ID, ID_orden, ID_estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_historial_estados OFF;
GO

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_splits_almacen ON;
INSERT INTO ventas.ordenes_splits_almacen (ID, ID_orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SPL-ORD-2026-0001-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SPL-ORD-2026-0002-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SPL-ORD-2026-0003-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SPL-ORD-2026-0004-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SPL-ORD-2026-0005-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SPL-ORD-2026-0006-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SPL-ORD-2026-0007-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SPL-ORD-2026-0008-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SPL-ORD-2026-0009-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SPL-ORD-2026-0010-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SPL-ORD-2026-0011-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SPL-ORD-2026-0012-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SPL-ORD-2026-0013-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SPL-ORD-2026-0014-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SPL-ORD-2026-0015-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SPL-ORD-2026-0016-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SPL-ORD-2026-0017-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SPL-ORD-2026-0018-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SPL-ORD-2026-0019-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SPL-ORD-2026-0020-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SPL-ORD-2026-0021-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SPL-ORD-2026-0022-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SPL-ORD-2026-0023-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SPL-ORD-2026-0024-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SPL-ORD-2026-0025-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SPL-ORD-2026-0026-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SPL-ORD-2026-0027-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SPL-ORD-2026-0028-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SPL-ORD-2026-0029-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SPL-ORD-2026-0030-01', N'EN_RUTA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_splits_almacen OFF;
GO

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_impuestos ON;
INSERT INTO ventas.ordenes_impuestos (ID, ID_orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, '002_IVA', 0.1600, 571.00, 91.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '002_IVA', 0.1600, 321.00, 51.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '002_IVA', 0.1600, 641.70, 102.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '002_IVA', 0.1600, 392.00, 62.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '002_IVA', 0.1600, 855.00, 136.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '002_IVA', 0.1600, 416.70, 66.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '002_IVA', 0.1600, 997.00, 159.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '002_IVA', 0.1600, 534.00, 85.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '002_IVA', 0.1600, 1025.10, 164.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '002_IVA', 0.1600, 605.00, 96.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '002_IVA', 0.1600, 1281.00, 204.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '002_IVA', 0.1600, 608.40, 97.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '002_IVA', 0.1600, 1423.00, 227.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '002_IVA', 0.1600, 747.00, 119.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '002_IVA', 0.1600, 1408.50, 225.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '002_IVA', 0.1600, 818.00, 130.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '002_IVA', 0.1600, 1707.00, 273.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '002_IVA', 0.1600, 800.10, 128.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '002_IVA', 0.1600, 1849.00, 295.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '002_IVA', 0.1600, 960.00, 153.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '002_IVA', 0.1600, 1791.90, 286.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '002_IVA', 0.1600, 1031.00, 164.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '002_IVA', 0.1600, 2133.00, 341.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '002_IVA', 0.1600, 991.80, 158.69, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '002_IVA', 0.1600, 2275.00, 364.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '002_IVA', 0.1600, 1173.00, 187.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '002_IVA', 0.1600, 2175.30, 348.05, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '002_IVA', 0.1600, 1244.00, 199.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '002_IVA', 0.1600, 2559.00, 409.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '002_IVA', 0.1600, 1183.50, 189.36, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_impuestos OFF;
GO

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_descuentos ON;
INSERT INTO ventas.ordenes_descuentos (ID, ID_orden, ID_tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'PROMOCIO_01', 57.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'PROMOCIO_02', 32.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'PROMOCIO_03', 71.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'PROMOCIO_04', 39.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'PROMOCIO_05', 85.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'PROMOCIO_06', 46.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'PROMOCIO_07', 99.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'PROMOCIO_08', 53.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'PROMOCIO_09', 113.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'PROMOCIO_10', 60.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'PROMOCIO_11', 128.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'PROMOCIO_12', 67.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'PROMOCIO_13', 142.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'PROMOCIO_14', 74.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'PROMOCIO_15', 156.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'PROMOCIO_16', 81.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'PROMOCIO_17', 170.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'PROMOCIO_18', 88.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'PROMOCIO_19', 184.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'PROMOCIO_20', 96.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'PROMOCIO_21', 199.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'PROMOCIO_22', 103.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'PROMOCIO_23', 213.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'PROMOCIO_24', 110.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'PROMOCIO_25', 227.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'PROMOCIO_26', 117.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'PROMOCIO_27', 241.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'PROMOCIO_28', 124.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'PROMOCIO_29', 255.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'PROMOCIO_30', 131.50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_descuentos OFF;
GO

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones ON;
INSERT INTO ventas.ordenes_notas_instrucciones (ID, ID_orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Con cariño para el cuidado diario de tu piel, Carlos.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, N'Con cariño para el cuidado diario de tu piel, Sofía.', N'Portón blanco frente a parque en Obispado, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, N'Con cariño para el cuidado diario de tu piel, Valeria.', N'Portón blanco frente a parque en Del Valle, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, N'Con cariño para el cuidado diario de tu piel, Alejandro.', N'Portón blanco frente a parque en Roma Norte, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, N'Con cariño para el cuidado diario de tu piel, Mariana.', N'Portón blanco frente a parque en Polanco, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, N'Con cariño para el cuidado diario de tu piel, Diego.', N'Portón blanco frente a parque en Americana, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'Con cariño para el cuidado diario de tu piel, Camila.', N'Portón blanco frente a parque en República, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, N'Con cariño para el cuidado diario de tu piel, Mateo.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, N'Con cariño para el cuidado diario de tu piel, Lucía.', N'Portón blanco frente a parque en La Paz, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, N'Con cariño para el cuidado diario de tu piel, Sebastián.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Con cariño para el cuidado diario de tu piel, Regina.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, N'Con cariño para el cuidado diario de tu piel, Santiago.', N'Portón blanco frente a parque en Obispado, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'Con cariño para el cuidado diario de tu piel, Fernanda.', N'Portón blanco frente a parque en Del Valle, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, N'Con cariño para el cuidado diario de tu piel, Emiliano.', N'Portón blanco frente a parque en Roma Norte, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Con cariño para el cuidado diario de tu piel, Ximena.', N'Portón blanco frente a parque en Polanco, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, N'Con cariño para el cuidado diario de tu piel, Daniel.', N'Portón blanco frente a parque en Americana, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, N'Con cariño para el cuidado diario de tu piel, Andrea.', N'Portón blanco frente a parque en República, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, N'Con cariño para el cuidado diario de tu piel, Gabriel.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'Con cariño para el cuidado diario de tu piel, Paula.', N'Portón blanco frente a parque en La Paz, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, N'Con cariño para el cuidado diario de tu piel, Andrés.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Con cariño para el cuidado diario de tu piel, Renata.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, N'Con cariño para el cuidado diario de tu piel, Nicolás.', N'Portón blanco frente a parque en Obispado, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, N'Con cariño para el cuidado diario de tu piel, Natalia.', N'Portón blanco frente a parque en Del Valle, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, N'Con cariño para el cuidado diario de tu piel, Joaquín.', N'Portón blanco frente a parque en Roma Norte, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'Con cariño para el cuidado diario de tu piel, Isabella.', N'Portón blanco frente a parque en Polanco, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, N'Con cariño para el cuidado diario de tu piel, Leonardo.', N'Portón blanco frente a parque en Americana, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, N'Con cariño para el cuidado diario de tu piel, Ana.', N'Portón blanco frente a parque en República, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, N'Con cariño para el cuidado diario de tu piel, Rodrigo.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Con cariño para el cuidado diario de tu piel, Paulina.', N'Portón blanco frente a parque en La Paz, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, N'Con cariño para el cuidado diario de tu piel, Mauricio.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones OFF;
GO

-- =================================================================================================
-- 071. TABLA: ventas.reservas_temporales_stock (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.reservas_temporales_stock ON;
INSERT INTO ventas.reservas_temporales_stock (ID, ID_carrito, ID_variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:45:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.reservas_temporales_stock OFF;
GO

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.afiliados_influencers ON;
INSERT INTO ventas.afiliados_influencers (ID, codigo_afiliado, ID_usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'AFILIADO_01', 1, N'@DermaTipsCarlos_01', 6.00, '012180001234567801', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'AFILIADO_02', 2, N'@DermaTipsSofía_02', 7.00, '012180001234567802', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'AFILIADO_03', 3, N'@DermaTipsValeria_03', 8.00, '012180001234567803', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'AFILIADO_04', 4, N'@DermaTipsAlejandro_04', 9.00, '012180001234567804', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'AFILIADO_05', 5, N'@DermaTipsMariana_05', 10.00, '012180001234567805', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'AFILIADO_06', 6, N'@DermaTipsDiego_06', 11.00, '012180001234567806', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'AFILIADO_07', 7, N'@DermaTipsCamila_07', 12.00, '012180001234567807', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'AFILIADO_08', 8, N'@DermaTipsMateo_08', 13.00, '012180001234567808', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'AFILIADO_09', 9, N'@DermaTipsLucía_09', 14.00, '012180001234567809', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'AFILIADO_10', 10, N'@DermaTipsSebastián_10', 15.00, '012180001234567810', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'AFILIADO_11', 11, N'@DermaTipsRegina_11', 16.00, '012180001234567811', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'AFILIADO_12', 12, N'@DermaTipsSantiago_12', 17.00, '012180001234567812', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'AFILIADO_13', 13, N'@DermaTipsFernanda_13', 18.00, '012180001234567813', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'AFILIADO_14', 14, N'@DermaTipsEmiliano_14', 19.00, '012180001234567814', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'AFILIADO_15', 15, N'@DermaTipsXimena_15', 5.00, '012180001234567815', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'AFILIADO_16', 16, N'@DermaTipsDaniel_16', 6.00, '012180001234567816', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'AFILIADO_17', 17, N'@DermaTipsAndrea_17', 7.00, '012180001234567817', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'AFILIADO_18', 18, N'@DermaTipsGabriel_18', 8.00, '012180001234567818', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'AFILIADO_19', 19, N'@DermaTipsPaula_19', 9.00, '012180001234567819', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'AFILIADO_20', 20, N'@DermaTipsAndrés_20', 10.00, '012180001234567820', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'AFILIADO_21', 21, N'@DermaTipsRenata_21', 11.00, '012180001234567821', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'AFILIADO_22', 22, N'@DermaTipsNicolás_22', 12.00, '012180001234567822', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'AFILIADO_23', 23, N'@DermaTipsNatalia_23', 13.00, '012180001234567823', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'AFILIADO_24', 24, N'@DermaTipsJoaquín_24', 14.00, '012180001234567824', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'AFILIADO_25', 25, N'@DermaTipsIsabella_25', 15.00, '012180001234567825', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'AFILIADO_26', 26, N'@DermaTipsLeonardo_26', 16.00, '012180001234567826', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'AFILIADO_27', 27, N'@DermaTipsAna_27', 17.00, '012180001234567827', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'AFILIADO_28', 28, N'@DermaTipsRodrigo_28', 18.00, '012180001234567828', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'AFILIADO_29', 29, N'@DermaTipsPaulina_29', 19.00, '012180001234567829', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'AFILIADO_30', 30, N'@DermaTipsMauricio_30', 5.00, '012180001234567830', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.afiliados_influencers OFF;
GO

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.comisiones_afiliados ON;
INSERT INTO ventas.comisiones_afiliados (ID, ID_afiliado, ID_orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 571.00, 34.26, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, 22.47, N'APROBADA', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 641.70, 51.34, N'PAGADA', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, 35.28, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 855.00, 85.50, N'APROBADA', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 416.70, 45.84, N'PAGADA', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 997.00, 119.64, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, 69.42, N'APROBADA', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1025.10, 143.51, N'PAGADA', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, 90.75, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1281.00, 204.96, N'APROBADA', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 608.40, 103.43, N'PAGADA', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1423.00, 256.14, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, 141.93, N'APROBADA', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1408.50, 281.70, N'PAGADA', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, 171.78, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1707.00, 375.54, N'APROBADA', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 800.10, 184.02, N'PAGADA', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1849.00, 443.76, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, 240.00, N'APROBADA', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1791.90, 465.89, N'PAGADA', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, 278.37, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 2133.00, 597.24, N'APROBADA', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 991.80, 287.62, N'PAGADA', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 2275.00, 682.50, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, 70.38, N'APROBADA', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 2175.30, 152.27, N'PAGADA', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, 99.52, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 2559.00, 230.31, N'APROBADA', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1183.50, 118.35, N'PAGADA', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.comisiones_afiliados OFF;
GO

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.proveedores_pasarela ON;
INSERT INTO pagos.proveedores_pasarela (ID, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PASARELA_01', N'Stripe México', N'https://api.dermacare.mx/webhooks/pagos/stripe/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PASARELA_02', N'Mercado Pago', N'https://api.dermacare.mx/webhooks/pagos/mercadopago/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PASARELA_03', N'Openpay BBVA', N'https://api.dermacare.mx/webhooks/pagos/openpay/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PASARELA_04', N'Conekta MX', N'https://api.dermacare.mx/webhooks/pagos/conekta/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PASARELA_05', N'PayPal Commerce', N'https://api.dermacare.mx/webhooks/pagos/paypal/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PASARELA_06', N'Clip Checkout', N'https://api.dermacare.mx/webhooks/pagos/clip/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PASARELA_07', N'Kueski Pay', N'https://api.dermacare.mx/webhooks/pagos/kueskipay/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PASARELA_08', N'Aplazo BNPL', N'https://api.dermacare.mx/webhooks/pagos/aplazo/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PASARELA_09', N'Adyen LATAM', N'https://api.dermacare.mx/webhooks/pagos/adyen/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PASARELA_10', N'STP SPEI Directo', N'https://api.dermacare.mx/webhooks/pagos/stp-spei/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PASARELA_11', N'Stripe México Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/stripe/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PASARELA_12', N'Mercado Pago Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/mercadopago/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PASARELA_13', N'Openpay BBVA Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/openpay/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PASARELA_14', N'Conekta MX Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/conekta/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PASARELA_15', N'PayPal Commerce Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/paypal/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PASARELA_16', N'Clip Checkout Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/clip/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PASARELA_17', N'Kueski Pay Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/kueskipay/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PASARELA_18', N'Aplazo BNPL Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/aplazo/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PASARELA_19', N'Adyen LATAM Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/adyen/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PASARELA_20', N'STP SPEI Directo Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/stp-spei/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PASARELA_21', N'Stripe México Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/stripe/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PASARELA_22', N'Mercado Pago Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/mercadopago/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PASARELA_23', N'Openpay BBVA Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/openpay/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PASARELA_24', N'Conekta MX Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/conekta/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PASARELA_25', N'PayPal Commerce Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/paypal/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PASARELA_26', N'Clip Checkout Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/clip/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PASARELA_27', N'Kueski Pay Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/kueskipay/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PASARELA_28', N'Aplazo BNPL Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/aplazo/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PASARELA_29', N'Adyen LATAM Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/adyen/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PASARELA_30', N'STP SPEI Directo Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/stp-spei/v3', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.proveedores_pasarela OFF;
GO

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.metodos_pago ON;
INSERT INTO pagos.metodos_pago (ID, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'TARJETA_CRED', N'Tarjeta de Crédito', 1.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'TARJETA_DEB', N'Tarjeta de Débito', 1.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SPEI_TRANSF', N'Transferencia Electrónica SPEI', 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'OXXO_EFECT', N'Pago en Efectivo Tiendas OXXO', 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MONEDERO', N'Saldo Monedero DermaCare', 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT pagos.metodos_pago OFF;
GO

-- =================================================================================================
-- 076. TABLA: pagos.transacciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.transacciones ON;
INSERT INTO pagos.transacciones (ID, folio_transaccion, ID_orden, ID_proveedor_pasarela, ID_metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 1, 1, N'pi_3QxDerma2026_0001', 791.36, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 2, 2, N'pi_3QxDerma2026_0002', 501.36, 'MXN', N'APROBADA', N'AUTORIZA_02', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 3, 3, N'pi_3QxDerma2026_0003', 873.37, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 4, 4, N'pi_3QxDerma2026_0004', 583.72, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 5, 5, N'pi_3QxDerma2026_0005', 1120.80, 'MXN', N'EN_MEDIACION', N'AUTORIZA_05', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 6, 1, N'pi_3QxDerma2026_0006', 612.37, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 7, 2, N'pi_3QxDerma2026_0007', 1285.52, 'MXN', N'APROBADA', N'AUTORIZA_07', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 8, 3, N'pi_3QxDerma2026_0008', 748.44, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 9, 4, N'pi_3QxDerma2026_0009', 1189.12, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 10, 5, N'pi_3QxDerma2026_0010', 830.80, 'MXN', N'EN_MEDIACION', N'AUTORIZA_10', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 11, 1, N'pi_3QxDerma2026_0011', 1485.96, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 12, 2, N'pi_3QxDerma2026_0012', 834.74, 'MXN', N'APROBADA', N'AUTORIZA_12', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 13, 3, N'pi_3QxDerma2026_0013', 1650.68, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 14, 4, N'pi_3QxDerma2026_0014', 995.52, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 15, 5, N'pi_3QxDerma2026_0015', 1633.86, 'MXN', N'EN_MEDIACION', N'AUTORIZA_15', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 16, 1, N'pi_3QxDerma2026_0016', 1077.88, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 17, 2, N'pi_3QxDerma2026_0017', 1980.12, 'MXN', N'APROBADA', N'AUTORIZA_17', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 18, 3, N'pi_3QxDerma2026_0018', 1057.12, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 19, 4, N'pi_3QxDerma2026_0019', 2144.84, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 20, 5, N'pi_3QxDerma2026_0020', 1242.60, 'MXN', N'EN_MEDIACION', N'AUTORIZA_20', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 21, 1, N'pi_3QxDerma2026_0021', 2078.60, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 22, 2, N'pi_3QxDerma2026_0022', 1195.96, 'MXN', N'APROBADA', N'AUTORIZA_22', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 23, 3, N'pi_3QxDerma2026_0023', 2474.28, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 24, 4, N'pi_3QxDerma2026_0024', 1279.49, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 25, 5, N'pi_3QxDerma2026_0025', 2639.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_25', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 26, 1, N'pi_3QxDerma2026_0026', 1360.68, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 27, 2, N'pi_3QxDerma2026_0027', 2523.35, 'MXN', N'APROBADA', N'AUTORIZA_27', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 28, 3, N'pi_3QxDerma2026_0028', 1443.04, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 29, 4, N'pi_3QxDerma2026_0029', 2968.44, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 30, 5, N'pi_3QxDerma2026_0030', 1372.86, 'MXN', N'EN_MEDIACION', N'AUTORIZA_30', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.transacciones OFF;
GO

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.intentos_cobro ON;
INSERT INTO pagos.intentos_cobro (ID, ID_transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 200, N'{"tx_id": 1, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, N'{"tx_id": 2, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, N'{"tx_id": 3, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 402, N'{"tx_id": 4, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, N'{"tx_id": 5, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, N'{"tx_id": 6, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, N'{"tx_id": 7, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 402, N'{"tx_id": 8, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, N'{"tx_id": 9, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, N'{"tx_id": 10, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, N'{"tx_id": 11, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 402, N'{"tx_id": 12, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, N'{"tx_id": 13, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, N'{"tx_id": 14, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, N'{"tx_id": 15, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 402, N'{"tx_id": 16, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, N'{"tx_id": 17, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, N'{"tx_id": 18, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, N'{"tx_id": 19, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 402, N'{"tx_id": 20, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, N'{"tx_id": 21, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, N'{"tx_id": 22, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, N'{"tx_id": 23, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 402, N'{"tx_id": 24, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, N'{"tx_id": 25, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, N'{"tx_id": 26, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, N'{"tx_id": 27, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 402, N'{"tx_id": 28, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, N'{"tx_id": 29, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, N'{"tx_id": 30, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.intentos_cobro OFF;
GO

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.split_multipagos ON;
INSERT INTO pagos.split_multipagos (ID, ID_orden, ID_metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 142.75, N'REF-MULTIPAGO-2026-0001', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 160.50, N'REF-MULTIPAGO-2026-0002', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 178.25, N'REF-MULTIPAGO-2026-0003', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 196.00, N'REF-MULTIPAGO-2026-0004', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 213.75, N'REF-MULTIPAGO-2026-0005', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 231.50, N'REF-MULTIPAGO-2026-0006', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 249.25, N'REF-MULTIPAGO-2026-0007', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 267.00, N'REF-MULTIPAGO-2026-0008', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 284.75, N'REF-MULTIPAGO-2026-0009', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 302.50, N'REF-MULTIPAGO-2026-0010', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 320.25, N'REF-MULTIPAGO-2026-0011', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 338.00, N'REF-MULTIPAGO-2026-0012', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 355.75, N'REF-MULTIPAGO-2026-0013', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 373.50, N'REF-MULTIPAGO-2026-0014', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 391.25, N'REF-MULTIPAGO-2026-0015', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 409.00, N'REF-MULTIPAGO-2026-0016', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 426.75, N'REF-MULTIPAGO-2026-0017', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 444.50, N'REF-MULTIPAGO-2026-0018', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 462.25, N'REF-MULTIPAGO-2026-0019', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 480.00, N'REF-MULTIPAGO-2026-0020', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 497.75, N'REF-MULTIPAGO-2026-0021', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 515.50, N'REF-MULTIPAGO-2026-0022', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 533.25, N'REF-MULTIPAGO-2026-0023', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 551.00, N'REF-MULTIPAGO-2026-0024', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 568.75, N'REF-MULTIPAGO-2026-0025', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 586.50, N'REF-MULTIPAGO-2026-0026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 604.25, N'REF-MULTIPAGO-2026-0027', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 622.00, N'REF-MULTIPAGO-2026-0028', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 639.75, N'REF-MULTIPAGO-2026-0029', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 657.50, N'REF-MULTIPAGO-2026-0030', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.split_multipagos OFF;
GO

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.billetera_electronica ON;
INSERT INTO pagos.billetera_electronica (ID, ID_cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 300.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 350.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 400.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 450.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 500.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 550.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 600.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 650.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 700.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 750.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 800.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 850.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 900.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 950.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1000.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1050.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1100.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1150.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1200.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1250.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1300.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1350.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1400.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1450.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1500.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1550.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1600.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1650.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1700.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1750.00, 150.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.billetera_electronica OFF;
GO

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.movimientos_billetera ON;
INSERT INTO pagos.movimientos_billetera (ID, ID_billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CARGA_SALDO', 115.00, 520.00, 635.00, N'Recarga electrónica acreditada en billetera #0001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAGO_ORDEN', 130.00, 540.00, 410.00, N'Aplicación de saldo para pago parcial de orden #0002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'REEMBOLSO_DEVOLUCION', 145.00, 560.00, 705.00, N'Acreditación por devolución RMA aprobada #0003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CARGA_SALDO', 160.00, 580.00, 740.00, N'Recarga electrónica acreditada en billetera #0004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PAGO_ORDEN', 175.00, 600.00, 425.00, N'Aplicación de saldo para pago parcial de orden #0005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'REEMBOLSO_DEVOLUCION', 190.00, 620.00, 810.00, N'Acreditación por devolución RMA aprobada #0006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CARGA_SALDO', 205.00, 640.00, 845.00, N'Recarga electrónica acreditada en billetera #0007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PAGO_ORDEN', 220.00, 660.00, 440.00, N'Aplicación de saldo para pago parcial de orden #0008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'REEMBOLSO_DEVOLUCION', 235.00, 680.00, 915.00, N'Acreditación por devolución RMA aprobada #0009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CARGA_SALDO', 250.00, 700.00, 950.00, N'Recarga electrónica acreditada en billetera #0010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PAGO_ORDEN', 265.00, 720.00, 455.00, N'Aplicación de saldo para pago parcial de orden #0011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'REEMBOLSO_DEVOLUCION', 280.00, 740.00, 1020.00, N'Acreditación por devolución RMA aprobada #0012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CARGA_SALDO', 295.00, 760.00, 1055.00, N'Recarga electrónica acreditada en billetera #0013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAGO_ORDEN', 310.00, 780.00, 470.00, N'Aplicación de saldo para pago parcial de orden #0014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'REEMBOLSO_DEVOLUCION', 325.00, 800.00, 1125.00, N'Acreditación por devolución RMA aprobada #0015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CARGA_SALDO', 340.00, 820.00, 1160.00, N'Recarga electrónica acreditada en billetera #0016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'PAGO_ORDEN', 355.00, 840.00, 485.00, N'Aplicación de saldo para pago parcial de orden #0017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'REEMBOLSO_DEVOLUCION', 370.00, 860.00, 1230.00, N'Acreditación por devolución RMA aprobada #0018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CARGA_SALDO', 385.00, 880.00, 1265.00, N'Recarga electrónica acreditada en billetera #0019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PAGO_ORDEN', 400.00, 900.00, 500.00, N'Aplicación de saldo para pago parcial de orden #0020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'REEMBOLSO_DEVOLUCION', 415.00, 920.00, 1335.00, N'Acreditación por devolución RMA aprobada #0021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CARGA_SALDO', 430.00, 940.00, 1370.00, N'Recarga electrónica acreditada en billetera #0022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PAGO_ORDEN', 445.00, 960.00, 515.00, N'Aplicación de saldo para pago parcial de orden #0023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'REEMBOLSO_DEVOLUCION', 460.00, 980.00, 1440.00, N'Acreditación por devolución RMA aprobada #0024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CARGA_SALDO', 475.00, 1000.00, 1475.00, N'Recarga electrónica acreditada en billetera #0025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAGO_ORDEN', 490.00, 1020.00, 530.00, N'Aplicación de saldo para pago parcial de orden #0026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'REEMBOLSO_DEVOLUCION', 505.00, 1040.00, 1545.00, N'Acreditación por devolución RMA aprobada #0027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CARGA_SALDO', 520.00, 1060.00, 1580.00, N'Recarga electrónica acreditada en billetera #0028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'PAGO_ORDEN', 535.00, 1080.00, 545.00, N'Aplicación de saldo para pago parcial de orden #0029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'REEMBOLSO_DEVOLUCION', 550.00, 1100.00, 1650.00, N'Acreditación por devolución RMA aprobada #0030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.movimientos_billetera OFF;
GO

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards ON;
INSERT INTO pagos.tarjetas_regalo_giftcards (ID, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, ID_cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 285.50, 285.50, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 321.00, 321.00, '2026-03-02', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 356.50, 356.50, '2026-03-03', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 392.00, 392.00, '2026-03-04', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 427.50, 427.50, '2026-03-05', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 463.00, 463.00, '2026-03-06', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 498.50, 498.50, '2026-03-07', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 534.00, 534.00, '2026-03-08', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 569.50, 569.50, '2026-03-09', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 605.00, 605.00, '2026-03-10', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 640.50, 640.50, '2026-03-11', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 676.00, 676.00, '2026-03-12', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 711.50, 711.50, '2026-03-13', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 747.00, 747.00, '2026-03-14', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 782.50, 782.50, '2026-03-15', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 818.00, 818.00, '2026-03-16', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 853.50, 853.50, '2026-03-17', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 889.00, 889.00, '2026-03-18', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 924.50, 924.50, '2026-03-19', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 960.00, 960.00, '2026-03-20', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 995.50, 995.50, '2026-03-21', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 1031.00, 1031.00, '2026-03-22', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 1066.50, 1066.50, '2026-03-23', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 1102.00, 1102.00, '2026-03-24', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 1137.50, 1137.50, '2026-03-25', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 1173.00, 1173.00, '2026-03-26', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 1208.50, 1208.50, '2026-03-27', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 1244.00, 1244.00, '2026-03-28', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 1279.50, 1279.50, '2026-03-01', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 1315.00, 1315.00, '2026-03-02', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards OFF;
GO

-- =================================================================================================
-- 082. TABLA: pagos.redenciones_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.redenciones_giftcards ON;
INSERT INTO pagos.redenciones_giftcards (ID, ID_giftcard, ID_orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 285.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 356.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 427.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 463.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 498.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 569.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 640.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 676.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 711.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 782.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 853.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 889.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 924.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 995.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1066.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1102.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1137.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1208.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1279.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1315.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.redenciones_giftcards OFF;
GO

-- =================================================================================================
-- 083. TABLA: pagos.reglas_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.reglas_antifraude ON;
INSERT INTO pagos.reglas_antifraude (ID, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'REGLA_01', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #01)', 6, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'REGLA_02', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #02)', 7, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'REGLA_03', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #03)', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'REGLA_04', N'Uso de correo desechable o dominio temporal no verificado. (Regla #04)', 9, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'REGLA_05', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #05)', 10, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'REGLA_06', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #06)', 11, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'REGLA_07', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #07)', 12, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'REGLA_08', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #08)', 13, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'REGLA_09', N'Uso de correo desechable o dominio temporal no verificado. (Regla #09)', 14, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'REGLA_10', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #10)', 15, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'REGLA_11', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #11)', 16, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'REGLA_12', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #12)', 17, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'REGLA_13', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #13)', 18, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'REGLA_14', N'Uso de correo desechable o dominio temporal no verificado. (Regla #14)', 19, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'REGLA_15', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #15)', 20, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'REGLA_16', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #16)', 21, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'REGLA_17', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #17)', 22, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'REGLA_18', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #18)', 23, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'REGLA_19', N'Uso de correo desechable o dominio temporal no verificado. (Regla #19)', 24, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'REGLA_20', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #20)', 25, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'REGLA_21', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #21)', 26, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'REGLA_22', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #22)', 27, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'REGLA_23', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #23)', 28, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'REGLA_24', N'Uso de correo desechable o dominio temporal no verificado. (Regla #24)', 29, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'REGLA_25', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #25)', 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'REGLA_26', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #26)', 31, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'REGLA_27', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #27)', 32, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'REGLA_28', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #28)', 33, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'REGLA_29', N'Uso de correo desechable o dominio temporal no verificado. (Regla #29)', 34, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'REGLA_30', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #30)', 5, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reglas_antifraude OFF;
GO

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.evaluaciones_antifraude ON;
INSERT INTO pagos.evaluaciones_antifraude (ID, ID_orden, ID_regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'BAJO', N'189.203.3.7', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, N'MEDIO', N'189.203.6.14', 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, N'ALTO_REQUERIR_3DS', N'189.203.9.21', 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, N'CRITICO_RECHAZADO', N'189.203.12.28', 4, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, N'BAJO', N'189.203.15.35', 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, N'MEDIO', N'189.203.18.42', 6, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, N'ALTO_REQUERIR_3DS', N'189.203.21.49', 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, N'CRITICO_RECHAZADO', N'189.203.24.56', 8, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, N'BAJO', N'189.203.27.63', 9, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, N'MEDIO', N'189.203.30.70', 10, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, N'ALTO_REQUERIR_3DS', N'189.203.33.77', 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, N'CRITICO_RECHAZADO', N'189.203.36.84', 12, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, N'BAJO', N'189.203.39.91', 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, N'MEDIO', N'189.203.42.98', 14, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, N'ALTO_REQUERIR_3DS', N'189.203.45.105', 15, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, N'CRITICO_RECHAZADO', N'189.203.48.112', 16, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, N'BAJO', N'189.203.51.119', 17, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, N'MEDIO', N'189.203.54.126', 18, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, N'ALTO_REQUERIR_3DS', N'189.203.57.133', 19, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, N'CRITICO_RECHAZADO', N'189.203.60.140', 20, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, N'BAJO', N'189.203.63.147', 21, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, N'MEDIO', N'189.203.66.154', 22, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, N'ALTO_REQUERIR_3DS', N'189.203.69.161', 23, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, N'CRITICO_RECHAZADO', N'189.203.72.168', 24, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, N'BAJO', N'189.203.75.175', 25, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, N'MEDIO', N'189.203.78.182', 26, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, N'ALTO_REQUERIR_3DS', N'189.203.81.189', 27, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, N'CRITICO_RECHAZADO', N'189.203.84.196', 28, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, N'BAJO', N'189.203.87.203', 29, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, N'MEDIO', N'189.203.90.210', 30, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.evaluaciones_antifraude OFF;
GO

-- =================================================================================================
-- 085. TABLA: pagos.contracargos_chargebacks (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.contracargos_chargebacks ON;
INSERT INTO pagos.contracargos_chargebacks (ID, ID_transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-DISPU-2026-0001', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 285.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-DISPU-2026-0002', N'Reclamo por mercancía no recibida tras plazo prometido.', 321.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-DISPU-2026-0003', N'Diferencia en monto cobrado reportada en estado de cuenta.', 356.50, '2026-02-03 11:30:00', '2026-03-03', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-DISPU-2026-0004', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 392.00, '2026-02-04 11:30:00', '2026-03-04', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-DISPU-2026-0005', N'Reclamo por mercancía no recibida tras plazo prometido.', 427.50, '2026-02-05 11:30:00', '2026-03-05', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-DISPU-2026-0006', N'Diferencia en monto cobrado reportada en estado de cuenta.', 463.00, '2026-02-06 11:30:00', '2026-03-06', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-DISPU-2026-0007', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 498.50, '2026-02-07 11:30:00', '2026-03-07', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-DISPU-2026-0008', N'Reclamo por mercancía no recibida tras plazo prometido.', 534.00, '2026-02-08 11:30:00', '2026-03-08', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-DISPU-2026-0009', N'Diferencia en monto cobrado reportada en estado de cuenta.', 569.50, '2026-02-09 11:30:00', '2026-03-09', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-DISPU-2026-0010', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 605.00, '2026-02-10 11:30:00', '2026-03-10', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-DISPU-2026-0011', N'Reclamo por mercancía no recibida tras plazo prometido.', 640.50, '2026-02-11 11:30:00', '2026-03-11', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-DISPU-2026-0012', N'Diferencia en monto cobrado reportada en estado de cuenta.', 676.00, '2026-02-12 11:30:00', '2026-03-12', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-DISPU-2026-0013', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 711.50, '2026-02-13 11:30:00', '2026-03-13', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-DISPU-2026-0014', N'Reclamo por mercancía no recibida tras plazo prometido.', 747.00, '2026-02-14 11:30:00', '2026-03-14', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-DISPU-2026-0015', N'Diferencia en monto cobrado reportada en estado de cuenta.', 782.50, '2026-02-15 11:30:00', '2026-03-15', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-DISPU-2026-0016', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 818.00, '2026-02-16 11:30:00', '2026-03-16', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-DISPU-2026-0017', N'Reclamo por mercancía no recibida tras plazo prometido.', 853.50, '2026-02-17 11:30:00', '2026-03-17', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-DISPU-2026-0018', N'Diferencia en monto cobrado reportada en estado de cuenta.', 889.00, '2026-02-18 11:30:00', '2026-03-18', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-DISPU-2026-0019', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 924.50, '2026-02-19 11:30:00', '2026-03-19', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-DISPU-2026-0020', N'Reclamo por mercancía no recibida tras plazo prometido.', 960.00, '2026-02-20 11:30:00', '2026-03-20', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-DISPU-2026-0021', N'Diferencia en monto cobrado reportada en estado de cuenta.', 995.50, '2026-02-21 11:30:00', '2026-03-21', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-DISPU-2026-0022', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1031.00, '2026-02-22 11:30:00', '2026-03-22', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-DISPU-2026-0023', N'Reclamo por mercancía no recibida tras plazo prometido.', 1066.50, '2026-02-23 11:30:00', '2026-03-23', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-DISPU-2026-0024', N'Diferencia en monto cobrado reportada en estado de cuenta.', 1102.00, '2026-02-24 11:30:00', '2026-03-24', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-DISPU-2026-0025', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1137.50, '2026-02-25 11:30:00', '2026-03-25', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-DISPU-2026-0026', N'Reclamo por mercancía no recibida tras plazo prometido.', 1173.00, '2026-02-26 11:30:00', '2026-03-26', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-DISPU-2026-0027', N'Diferencia en monto cobrado reportada en estado de cuenta.', 1208.50, '2026-02-27 11:30:00', '2026-03-27', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-DISPU-2026-0028', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1244.00, '2026-02-28 11:30:00', '2026-03-28', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-DISPU-2026-0029', N'Reclamo por mercancía no recibida tras plazo prometido.', 1279.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-DISPU-2026-0030', N'Diferencia en monto cobrado reportada en estado de cuenta.', 1315.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.contracargos_chargebacks OFF;
GO

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.reembolsos_transaccion ON;
INSERT INTO pagos.reembolsos_transaccion (ID, ID_transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-REEMB-2026-0001', 285.50, N'Devolución aprobada tras inspección sanitaria RMA #0001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-REEMB-2026-0002', 321.00, N'Devolución aprobada tras inspección sanitaria RMA #0002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-REEMB-2026-0003', 356.50, N'Devolución aprobada tras inspección sanitaria RMA #0003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-REEMB-2026-0004', 392.00, N'Devolución aprobada tras inspección sanitaria RMA #0004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-REEMB-2026-0005', 427.50, N'Devolución aprobada tras inspección sanitaria RMA #0005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-REEMB-2026-0006', 463.00, N'Devolución aprobada tras inspección sanitaria RMA #0006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-REEMB-2026-0007', 498.50, N'Devolución aprobada tras inspección sanitaria RMA #0007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-REEMB-2026-0008', 534.00, N'Devolución aprobada tras inspección sanitaria RMA #0008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-REEMB-2026-0009', 569.50, N'Devolución aprobada tras inspección sanitaria RMA #0009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-REEMB-2026-0010', 605.00, N'Devolución aprobada tras inspección sanitaria RMA #0010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-REEMB-2026-0011', 640.50, N'Devolución aprobada tras inspección sanitaria RMA #0011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-REEMB-2026-0012', 676.00, N'Devolución aprobada tras inspección sanitaria RMA #0012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-REEMB-2026-0013', 711.50, N'Devolución aprobada tras inspección sanitaria RMA #0013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-REEMB-2026-0014', 747.00, N'Devolución aprobada tras inspección sanitaria RMA #0014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-REEMB-2026-0015', 782.50, N'Devolución aprobada tras inspección sanitaria RMA #0015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-REEMB-2026-0016', 818.00, N'Devolución aprobada tras inspección sanitaria RMA #0016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-REEMB-2026-0017', 853.50, N'Devolución aprobada tras inspección sanitaria RMA #0017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-REEMB-2026-0018', 889.00, N'Devolución aprobada tras inspección sanitaria RMA #0018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-REEMB-2026-0019', 924.50, N'Devolución aprobada tras inspección sanitaria RMA #0019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-REEMB-2026-0020', 960.00, N'Devolución aprobada tras inspección sanitaria RMA #0020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-REEMB-2026-0021', 995.50, N'Devolución aprobada tras inspección sanitaria RMA #0021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-REEMB-2026-0022', 1031.00, N'Devolución aprobada tras inspección sanitaria RMA #0022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-REEMB-2026-0023', 1066.50, N'Devolución aprobada tras inspección sanitaria RMA #0023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-REEMB-2026-0024', 1102.00, N'Devolución aprobada tras inspección sanitaria RMA #0024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-REEMB-2026-0025', 1137.50, N'Devolución aprobada tras inspección sanitaria RMA #0025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-REEMB-2026-0026', 1173.00, N'Devolución aprobada tras inspección sanitaria RMA #0026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-REEMB-2026-0027', 1208.50, N'Devolución aprobada tras inspección sanitaria RMA #0027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-REEMB-2026-0028', 1244.00, N'Devolución aprobada tras inspección sanitaria RMA #0028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-REEMB-2026-0029', 1279.50, N'Devolución aprobada tras inspección sanitaria RMA #0029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-REEMB-2026-0030', 1315.00, N'Devolución aprobada tras inspección sanitaria RMA #0030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reembolsos_transaccion OFF;
GO

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.regimenes_sat ON;
INSERT INTO fiscal.regimenes_sat (ID, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'601', N'General de Ley Personas Morales', 0, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'605', N'Sueldos y Salarios e Ingresos Asimilados a Salarios', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'606', N'Arrendamiento', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'612', N'Personas Físicas con Actividades Empresariales y Profesionales', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'616', N'Sin obligaciones fiscales', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'621', N'Incorporación Fiscal', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'625', N'Régimen de las Actividades Empresariales con ingresos a través de Plataformas', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'626', N'Régimen Simplificado de Confianza (RESICO)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT fiscal.regimenes_sat OFF;
GO

-- =================================================================================================
-- 088. TABLA: fiscal.usos_cfdi (8 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.usos_cfdi ON;
INSERT INTO fiscal.usos_cfdi (ID, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'G01', N'Adquisición de mercancías', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'G03', N'Gastos en general', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'D01', N'Honorarios médicos, dentales y gastos hospitalarios', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'D02', N'Gastos médicos por incapacidad o discapacidad', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'I04', N'Equipo de computo y accesorios', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'P01', N'Por definir (Uso transitorio)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'S01', N'Sin efectos fiscales', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CP01', N'Pagos (Complemento de recepción de pagos)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT fiscal.usos_cfdi OFF;
GO

-- =================================================================================================
-- 089. TABLA: fiscal.datos_fiscales_cliente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.datos_fiscales_cliente ON;
INSERT INTO fiscal.datos_fiscales_cliente (ID, ID_cliente, rfc_emisor, razon_social, codigo_postal_fiscal, ID_regimen_sat, ID_uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 'MEGC910315H01', N'CARLOS MENDOZA GARZA', '25700', 1, 1, N'carlos.mendoza.1@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'RALS920315H02', N'SOFÍA RAMÍREZ LÓPEZ', '64000', 2, 2, N'sofia.ramirez.2@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'TOVV930315H03', N'VALERIA TORRES VILLARREAL', '66220', 3, 3, N'valeria.torres.3@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'HECA940315H04', N'ALEJANDRO HERNÁNDEZ CRUZ', '06700', 4, 4, N'alejandro.hernandez.4@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SAFM950315H05', N'MARIANA SÁNCHEZ FUENTES', '11560', 5, 5, N'mariana.sanchez.5@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'MATD960315H06', N'DIEGO MARTÍNEZ TREVIÑO', '44100', 6, 6, N'diego.martinez.6@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'GORC970315H07', N'CAMILA GONZÁLEZ REYES', '25000', 7, 7, N'camila.gonzalez.7@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FLCM980315H08', N'MATEO FLORES CASTILLO', '76000', 8, 8, N'mateo.flores.8@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'MODL990315H09', N'LUCÍA MORALES DÍAZ', '72000', 1, 1, N'lucia.morales.9@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'VAOS900315H10', N'SEBASTIÁN VÁZQUEZ ORTIZ', '97000', 2, 2, N'sebastian.vazquez.10@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'GUNR910315H11', N'REGINA GUTIÉRREZ NAVA', '25700', 3, 3, N'regina.gutierrez.11@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'JIPS920315H12', N'SANTIAGO JIMÉNEZ PÉREZ', '64000', 4, 4, N'santiago.jimenez.12@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'RUSF930315H13', N'FERNANDA RUIZ SALAZAR', '66220', 5, 5, N'fernanda.ruiz.13@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'RICE940315H14', N'EMILIANO RÍOS CÁRDENAS', '06700', 6, 6, N'emiliano.rios.14@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'AGIX950315H15', N'XIMENA AGUILAR IBARRA', '11560', 7, 7, N'ximena.aguilar.15@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'MEND960315H16', N'DANIEL MÉNDEZ NAVARRO', '44100', 8, 8, N'daniel.mendez.16@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CADA970315H17', N'ANDREA CASTRO DELGADO', '25000', 1, 1, N'andrea.castro.17@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'VEMG980315H18', N'GABRIEL VEGA MONTOYA', '76000', 2, 2, N'gabriel.vega.18@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CORP990315H19', N'PAULA CORTÉS ROJAS', '72000', 3, 3, N'paula.cortes.19@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'RACA900315H20', N'ANDRÉS RAMOS CAMPOS', '97000', 4, 4, N'andres.ramos.20@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'GULR910315H21', N'RENATA GUERRERO LUNA', '25700', 5, 5, N'renata.guerrero.21@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PECN920315H22', N'NICOLÁS PEÑA CABRERA', '64000', 6, 6, N'nicolas.pena.22@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'HEVN930315H23', N'NATALIA HERRERA VARGAS', '66220', 7, 7, N'natalia.herrera.23@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'MECJ940315H24', N'JOAQUÍN MEDINA CONTRERAS', '06700', 8, 8, N'joaquin.medina.24@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DOEI950315H25', N'ISABELLA DOMÍNGUEZ ESCOBAR', '11560', 1, 1, N'isabella.dominguez.25@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SIPL960315H26', N'LEONARDO SILVA PAREDES', '44100', 2, 2, N'leonardo.silva.26@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CHBA970315H27', N'ANA CHÁVEZ BAUTISTA', '25000', 3, 3, N'ana.chavez.27@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'OCAR980315H28', N'RODRIGO OCHOA ACOSTA', '76000', 4, 4, N'rodrigo.ochoa.28@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MILP990315H29', N'PAULINA MIRANDA LEAL', '72000', 5, 5, N'paulina.miranda.29@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PASM900315H30', N'MAURICIO PADILLA SOLÍS', '97000', 6, 6, N'mauricio.padilla.30@correo.mx', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.datos_fiscales_cliente OFF;
GO

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_cfdi ON;
INSERT INTO fiscal.facturas_cfdi (ID, ID_orden, ID_dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 'DC', N'FOL-FACTU-2026-0001', N'B1000000-0000-4000-8000-000000000001', N'CFDI40_SIG_9629800bff6e0b2ab0e057a1685fcb569088e04ec6e0f25b88e8e7fd340267d1', N'SAT_PAC_SIG_1a875b15b158c9d380cc1438b2710c20533f972a8ba5071840e91fe6ebdde60b', N'||1.1|B1000000-0000-4000-8000-000000000001|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460001', '2026-02-01 11:30:00', 791.36, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0001.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'DC', N'FOL-FACTU-2026-0002', N'B1000000-0000-4000-8000-000000000002', N'CFDI40_SIG_ca9e6dcd9649acfe0ff3931d39347b7ba5f5f21a0309d16c717333e66b519d92', N'SAT_PAC_SIG_855ecb8ceb9777d32062546ad908007765eb5ac4c43a4f7981a5a3fae3fdb63b', N'||1.1|B1000000-0000-4000-8000-000000000002|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460002', '2026-02-02 11:30:00', 501.36, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0002.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'DC', N'FOL-FACTU-2026-0003', N'B1000000-0000-4000-8000-000000000003', N'CFDI40_SIG_1c2b20017099f70cba603848707667ba3dd77b0dd1ba94e4425b6fdf7e5b2ef2', N'SAT_PAC_SIG_724c90f2ea903b8002bccd7154ab3ff4fc2c3ee140063d123caf1aff37450f48', N'||1.1|B1000000-0000-4000-8000-000000000003|2026-02-03T11:30:00|PAC970924HN1||', '00001000000504460003', '2026-02-03 11:30:00', 873.37, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0003.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'DC', N'FOL-FACTU-2026-0004', N'B1000000-0000-4000-8000-000000000004', N'CFDI40_SIG_645c96c71b649d0dd0ec508164ea36ab621ce0ba6b249443a01aaaafb3f5798b', N'SAT_PAC_SIG_44826e5c2f381557a3204678ba6269416422a35b8dcf3878493eb866d030217e', N'||1.1|B1000000-0000-4000-8000-000000000004|2026-02-04T11:30:00|PAC970924HN1||', '00001000000504460004', '2026-02-04 11:30:00', 583.72, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0004.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'DC', N'FOL-FACTU-2026-0005', N'B1000000-0000-4000-8000-000000000005', N'CFDI40_SIG_34011ff06a35a28b69b5aa8e35e7bfb7481e15d81f4228b7818723cce61af348', N'SAT_PAC_SIG_4d934ee27eae21bfebd0f2edff094db9f2fca0985ff960056105e9418f5604c6', N'||1.1|B1000000-0000-4000-8000-000000000005|2026-02-05T11:30:00|PAC970924HN1||', '00001000000504460005', '2026-02-05 11:30:00', 1120.80, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0005.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'DC', N'FOL-FACTU-2026-0006', N'B1000000-0000-4000-8000-000000000006', N'CFDI40_SIG_b8abcba987d31946cad66b9cfc14ab2b423a369d74a3ada36f3ddad7b4c4d02b', N'SAT_PAC_SIG_54e961c6624bf5f1a8eb2ed52447482a287db264b2f0b7ea0edb128dcc9af142', N'||1.1|B1000000-0000-4000-8000-000000000006|2026-02-06T11:30:00|PAC970924HN1||', '00001000000504460006', '2026-02-06 11:30:00', 612.37, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0006.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'DC', N'FOL-FACTU-2026-0007', N'B1000000-0000-4000-8000-000000000007', N'CFDI40_SIG_386f0821f27283bfe64b52ce9475bf15b1ef305a3769431650e73bcb044a3da5', N'SAT_PAC_SIG_a072a9335e99a6282d1fa1f417ba77db36cf06c8520ae455d8d9e6f89d785db2', N'||1.1|B1000000-0000-4000-8000-000000000007|2026-02-07T11:30:00|PAC970924HN1||', '00001000000504460007', '2026-02-07 11:30:00', 1285.52, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0007.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'DC', N'FOL-FACTU-2026-0008', N'B1000000-0000-4000-8000-000000000008', N'CFDI40_SIG_6045ba7e4023e60b7d756d766b23dfe417741f9b8a729ddca40fe3b707453285', N'SAT_PAC_SIG_540d6060b22446edf9c648cff9d3404ffc5c64ced72278c708568c66cfe2f70b', N'||1.1|B1000000-0000-4000-8000-000000000008|2026-02-08T11:30:00|PAC970924HN1||', '00001000000504460008', '2026-02-08 11:30:00', 748.44, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0008.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'DC', N'FOL-FACTU-2026-0009', N'B1000000-0000-4000-8000-000000000009', N'CFDI40_SIG_92280625c8e7afb0fc6557827022da3a859141ef061bbe2b7d0e6a96670d6176', N'SAT_PAC_SIG_0715719bc23acef24914ab8f60859728839749213fa465623af338b86384c45b', N'||1.1|B1000000-0000-4000-8000-000000000009|2026-02-09T11:30:00|PAC970924HN1||', '00001000000504460009', '2026-02-09 11:30:00', 1189.12, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0009.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'DC', N'FOL-FACTU-2026-0010', N'B1000000-0000-4000-8000-00000000000A', N'CFDI40_SIG_7791ccd4a51a4f662176c4ac37f25078ea39832086ae45d77eceaf4e39f988fc', N'SAT_PAC_SIG_40221e8d1733820a6210dbe0b250910231730c666a5758a846f165189dd9e721', N'||1.1|B1000000-0000-4000-8000-00000000000A|2026-02-10T11:30:00|PAC970924HN1||', '00001000000504460010', '2026-02-10 11:30:00', 830.80, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0010.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'DC', N'FOL-FACTU-2026-0011', N'B1000000-0000-4000-8000-00000000000B', N'CFDI40_SIG_80110f57fb171f3d2d7a63cab7e0520b0d27f4b5e9b1e1ece45e963c7fb9e618', N'SAT_PAC_SIG_548cf61134c2790527d716460c27fc5f4320cf6f2f231a89d60742efdf1c2f2d', N'||1.1|B1000000-0000-4000-8000-00000000000B|2026-02-11T11:30:00|PAC970924HN1||', '00001000000504460011', '2026-02-11 11:30:00', 1485.96, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0011.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'DC', N'FOL-FACTU-2026-0012', N'B1000000-0000-4000-8000-00000000000C', N'CFDI40_SIG_9d3cfe0d65527a69e01f0e55e10b610a7fe8b382903ab307c2263ec130af3772', N'SAT_PAC_SIG_225a670f9f4b72b43cab35fcba1082946d69fb8fc0088e3ef8df4ab960f53a63', N'||1.1|B1000000-0000-4000-8000-00000000000C|2026-02-12T11:30:00|PAC970924HN1||', '00001000000504460012', '2026-02-12 11:30:00', 834.74, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0012.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'DC', N'FOL-FACTU-2026-0013', N'B1000000-0000-4000-8000-00000000000D', N'CFDI40_SIG_e46a2379a9c3ff2b3c87850ffea4d3416dea8eacd324e934a77120441e2ace76', N'SAT_PAC_SIG_1709e3f4bc7383089c309fb72e4ea0db3a6260628be0a834c195072077f7cdf7', N'||1.1|B1000000-0000-4000-8000-00000000000D|2026-02-13T11:30:00|PAC970924HN1||', '00001000000504460013', '2026-02-13 11:30:00', 1650.68, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0013.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'DC', N'FOL-FACTU-2026-0014', N'B1000000-0000-4000-8000-00000000000E', N'CFDI40_SIG_a96777ed25de406d4c5914b87f911428bf16260db0632b8fe1c3bfba17f4c96b', N'SAT_PAC_SIG_8b364f78c698fd9e4eca45d475d55faacec51afb5c056064dfdf3c32d3d4091b', N'||1.1|B1000000-0000-4000-8000-00000000000E|2026-02-14T11:30:00|PAC970924HN1||', '00001000000504460014', '2026-02-14 11:30:00', 995.52, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0014.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'DC', N'FOL-FACTU-2026-0015', N'B1000000-0000-4000-8000-00000000000F', N'CFDI40_SIG_1fdd507a32862c449811c2d2bbaa9f96065c94a99bf97fad469bbd694e33778a', N'SAT_PAC_SIG_66e0e8f008083156dd0dbb60ba2927dc7326b7f6857af42c393dcf58bbb99c77', N'||1.1|B1000000-0000-4000-8000-00000000000F|2026-02-15T11:30:00|PAC970924HN1||', '00001000000504460015', '2026-02-15 11:30:00', 1633.86, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0015.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'DC', N'FOL-FACTU-2026-0016', N'B1000000-0000-4000-8000-000000000010', N'CFDI40_SIG_24d38d8fafc8f784a7024d7b84e5cf448fcd7a66726f92f3c858efa83a4846bc', N'SAT_PAC_SIG_dc3e51012dac6eae47e73154036decefd40dbbf90f93a74c6c8bdba555b21833', N'||1.1|B1000000-0000-4000-8000-000000000010|2026-02-16T11:30:00|PAC970924HN1||', '00001000000504460016', '2026-02-16 11:30:00', 1077.88, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0016.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'DC', N'FOL-FACTU-2026-0017', N'B1000000-0000-4000-8000-000000000011', N'CFDI40_SIG_23ea4d3f03bd838969dca7fdf8da36972ea41b6fc9b005a0a408df2bdcb29ba3', N'SAT_PAC_SIG_c853c3c8b00a74f76fefe2f36c379105813054a35064e02eafcb6a2950405bc2', N'||1.1|B1000000-0000-4000-8000-000000000011|2026-02-17T11:30:00|PAC970924HN1||', '00001000000504460017', '2026-02-17 11:30:00', 1980.12, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0017.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'DC', N'FOL-FACTU-2026-0018', N'B1000000-0000-4000-8000-000000000012', N'CFDI40_SIG_4f59300b8621595a9fcce29614385cd2cb9a03c3f237384f8847c96c0c8d7a12', N'SAT_PAC_SIG_fab1b7a9b76bbdd627738c6e34e3eb93760cdebca5ab32dc8eb494f548dce7fa', N'||1.1|B1000000-0000-4000-8000-000000000012|2026-02-18T11:30:00|PAC970924HN1||', '00001000000504460018', '2026-02-18 11:30:00', 1057.12, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0018.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'DC', N'FOL-FACTU-2026-0019', N'B1000000-0000-4000-8000-000000000013', N'CFDI40_SIG_2860c7a5f5873fa23947a3b882cb5e40d14166a0d449783fbfbce777e61560f7', N'SAT_PAC_SIG_0c82703959001cd777ef505ed510a871d4c45f480410b1f98529fcc25d524654', N'||1.1|B1000000-0000-4000-8000-000000000013|2026-02-19T11:30:00|PAC970924HN1||', '00001000000504460019', '2026-02-19 11:30:00', 2144.84, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0019.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'DC', N'FOL-FACTU-2026-0020', N'B1000000-0000-4000-8000-000000000014', N'CFDI40_SIG_b87c4a7b90a302642444f2ff552dae85b5b224b73d3b57f7ad3f3fdb3f17b3f5', N'SAT_PAC_SIG_4651d5433f8926895053ad473d966a1b66865f60420ccc935783c8392f29829c', N'||1.1|B1000000-0000-4000-8000-000000000014|2026-02-20T11:30:00|PAC970924HN1||', '00001000000504460020', '2026-02-20 11:30:00', 1242.60, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0020.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'DC', N'FOL-FACTU-2026-0021', N'B1000000-0000-4000-8000-000000000015', N'CFDI40_SIG_e2218014f426d100d0807d58535efcc1a5f1375c7de40d5965ef67a671f1cdc7', N'SAT_PAC_SIG_6e8e29c2c38aae6960c6c8b41929522ef89612a969d032cb7aad7625c9eae669', N'||1.1|B1000000-0000-4000-8000-000000000015|2026-02-21T11:30:00|PAC970924HN1||', '00001000000504460021', '2026-02-21 11:30:00', 2078.60, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0021.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'DC', N'FOL-FACTU-2026-0022', N'B1000000-0000-4000-8000-000000000016', N'CFDI40_SIG_80d9711af0bdf2420963538f54c587de48ee6bef092c8104a4263d417681d95a', N'SAT_PAC_SIG_9e4eeb76e5f1e1909c66ee62b7e75ee2b4f4d74b4da08f3e46b517cca7b3c177', N'||1.1|B1000000-0000-4000-8000-000000000016|2026-02-22T11:30:00|PAC970924HN1||', '00001000000504460022', '2026-02-22 11:30:00', 1195.96, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0022.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'DC', N'FOL-FACTU-2026-0023', N'B1000000-0000-4000-8000-000000000017', N'CFDI40_SIG_81af14c954d7356628d8c251f080d05d3a66dde00f0a984b23b6f26efc06e72b', N'SAT_PAC_SIG_b8e6620dbe755d113ea549ace0b17dded897aad4d9a75ea30bc8444e23608b58', N'||1.1|B1000000-0000-4000-8000-000000000017|2026-02-23T11:30:00|PAC970924HN1||', '00001000000504460023', '2026-02-23 11:30:00', 2474.28, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0023.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'DC', N'FOL-FACTU-2026-0024', N'B1000000-0000-4000-8000-000000000018', N'CFDI40_SIG_5010be1f8fd6f3f47533f6bbb59be394b933a88e407c8660a0c840234307d092', N'SAT_PAC_SIG_c97fb305556ade66ac7ee964bbbb6b7486ed5ad8bc18501b22cd0776d3ac13ba', N'||1.1|B1000000-0000-4000-8000-000000000018|2026-02-24T11:30:00|PAC970924HN1||', '00001000000504460024', '2026-02-24 11:30:00', 1279.49, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0024.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'DC', N'FOL-FACTU-2026-0025', N'B1000000-0000-4000-8000-000000000019', N'CFDI40_SIG_44184603da94f821322a28030eaca8b0989eaa0447444b7a704fa5719d9e1a9c', N'SAT_PAC_SIG_26f91a3244a3b2851ba3eccd2f3c25207c4733da3c8e24980aaac2f52c1d7072', N'||1.1|B1000000-0000-4000-8000-000000000019|2026-02-25T11:30:00|PAC970924HN1||', '00001000000504460025', '2026-02-25 11:30:00', 2639.00, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0025.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'DC', N'FOL-FACTU-2026-0026', N'B1000000-0000-4000-8000-00000000001A', N'CFDI40_SIG_5403d72c808f1a62ecb7469654b20db8dd626c7e17766081a44fdcfb6699d6e3', N'SAT_PAC_SIG_352d57ab43979a1ee12cc0083029873749ff9379a92773620cc62a3500f0207b', N'||1.1|B1000000-0000-4000-8000-00000000001A|2026-02-26T11:30:00|PAC970924HN1||', '00001000000504460026', '2026-02-26 11:30:00', 1360.68, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0026.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'DC', N'FOL-FACTU-2026-0027', N'B1000000-0000-4000-8000-00000000001B', N'CFDI40_SIG_40a0991410694e7c5238772e3be059f5f4c96ce2bfa618b79a1dfdf3486b3ea8', N'SAT_PAC_SIG_da4cf6531bd9085c8985191d1bf27702c83203b26ecdcb8c4cf3b7b12ab50b6c', N'||1.1|B1000000-0000-4000-8000-00000000001B|2026-02-27T11:30:00|PAC970924HN1||', '00001000000504460027', '2026-02-27 11:30:00', 2523.35, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0027.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'DC', N'FOL-FACTU-2026-0028', N'B1000000-0000-4000-8000-00000000001C', N'CFDI40_SIG_e5fa3b6f4d6e20c62e4ec5e55454b8321acb57f3126e0aa03368b3f426a41f12', N'SAT_PAC_SIG_f9116973cd4830d43ed2657b6259128452cd0eef7dcac9fc47925c2a0277690f', N'||1.1|B1000000-0000-4000-8000-00000000001C|2026-02-28T11:30:00|PAC970924HN1||', '00001000000504460028', '2026-02-28 11:30:00', 1443.04, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0028.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'DC', N'FOL-FACTU-2026-0029', N'B1000000-0000-4000-8000-00000000001D', N'CFDI40_SIG_f1930596f17c51aaf8d707046275e662a1f4810b402b1bc26aa4855fe8f0a282', N'SAT_PAC_SIG_e306362d82a2c3fa186d535bad5a5285844e00751db8b65717cdd3b9ee73c744', N'||1.1|B1000000-0000-4000-8000-00000000001D|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460029', '2026-02-01 11:30:00', 2968.44, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0029.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'DC', N'FOL-FACTU-2026-0030', N'B1000000-0000-4000-8000-00000000001E', N'CFDI40_SIG_050f42215da984684b3f7c503c3ff0d6507e9caf323fd4be6f0950c209e365d4', N'SAT_PAC_SIG_7be745c07786e947eaac0d1c8ea414237efa4d33f4a9f7229dcba670ffe54bcd', N'||1.1|B1000000-0000-4000-8000-00000000001E|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460030', '2026-02-02 11:30:00', 1372.86, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0030.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_cfdi OFF;
GO

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_partidas ON;
INSERT INTO fiscal.facturas_partidas (ID, ID_factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, '53131600', 'H87', 2.00, 285.50, 571.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '53131600', 'H87', 1.00, 321.00, 321.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '53131600', 'H87', 2.00, 356.50, 713.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '53131600', 'H87', 1.00, 392.00, 392.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '53131600', 'H87', 2.00, 427.50, 855.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '53131600', 'H87', 1.00, 463.00, 463.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '53131600', 'H87', 2.00, 498.50, 997.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '53131600', 'H87', 1.00, 534.00, 534.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '53131600', 'H87', 2.00, 569.50, 1139.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '53131600', 'H87', 1.00, 605.00, 605.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '53131600', 'H87', 2.00, 640.50, 1281.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '53131600', 'H87', 1.00, 676.00, 676.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '53131600', 'H87', 2.00, 711.50, 1423.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '53131600', 'H87', 1.00, 747.00, 747.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '53131600', 'H87', 2.00, 782.50, 1565.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '53131600', 'H87', 1.00, 818.00, 818.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '53131600', 'H87', 2.00, 853.50, 1707.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '53131600', 'H87', 1.00, 889.00, 889.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '53131600', 'H87', 2.00, 924.50, 1849.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '53131600', 'H87', 1.00, 960.00, 960.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '53131600', 'H87', 2.00, 995.50, 1991.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '53131600', 'H87', 1.00, 1031.00, 1031.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '53131600', 'H87', 2.00, 1066.50, 2133.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '53131600', 'H87', 1.00, 1102.00, 1102.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '53131600', 'H87', 2.00, 1137.50, 2275.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '53131600', 'H87', 1.00, 1173.00, 1173.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '53131600', 'H87', 2.00, 1208.50, 2417.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '53131600', 'H87', 1.00, 1244.00, 1244.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '53131600', 'H87', 2.00, 1279.50, 2559.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '53131600', 'H87', 1.00, 1315.00, 1315.00, '02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_partidas OFF;
GO

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.complementos_pago ON;
INSERT INTO fiscal.complementos_pago (ID, ID_factura, ID_transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'B1000000-0000-4000-8000-000000000001', 1, 331.18, 165.59, 165.59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'B1000000-0000-4000-8000-000000000002', 1, 372.36, 186.18, 186.18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'B1000000-0000-4000-8000-000000000003', 1, 413.54, 206.77, 206.77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'B1000000-0000-4000-8000-000000000004', 1, 454.72, 227.36, 227.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'B1000000-0000-4000-8000-000000000005', 1, 495.90, 247.95, 247.95, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'B1000000-0000-4000-8000-000000000006', 1, 537.08, 268.54, 268.54, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'B1000000-0000-4000-8000-000000000007', 1, 578.26, 289.13, 289.13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'B1000000-0000-4000-8000-000000000008', 1, 619.44, 309.72, 309.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'B1000000-0000-4000-8000-000000000009', 1, 660.62, 330.31, 330.31, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'B1000000-0000-4000-8000-00000000000A', 1, 701.80, 350.90, 350.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'B1000000-0000-4000-8000-00000000000B', 1, 742.98, 371.49, 371.49, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'B1000000-0000-4000-8000-00000000000C', 1, 784.16, 392.08, 392.08, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'B1000000-0000-4000-8000-00000000000D', 1, 825.34, 412.67, 412.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'B1000000-0000-4000-8000-00000000000E', 1, 866.52, 433.26, 433.26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'B1000000-0000-4000-8000-00000000000F', 1, 907.70, 453.85, 453.85, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'B1000000-0000-4000-8000-000000000010', 1, 948.88, 474.44, 474.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'B1000000-0000-4000-8000-000000000011', 1, 990.06, 495.03, 495.03, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'B1000000-0000-4000-8000-000000000012', 1, 1031.24, 515.62, 515.62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'B1000000-0000-4000-8000-000000000013', 1, 1072.42, 536.21, 536.21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'B1000000-0000-4000-8000-000000000014', 1, 1113.60, 556.80, 556.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'B1000000-0000-4000-8000-000000000015', 1, 1154.78, 577.39, 577.39, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'B1000000-0000-4000-8000-000000000016', 1, 1195.96, 597.98, 597.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'B1000000-0000-4000-8000-000000000017', 1, 1237.14, 618.57, 618.57, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'B1000000-0000-4000-8000-000000000018', 1, 1278.32, 639.16, 639.16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'B1000000-0000-4000-8000-000000000019', 1, 1319.50, 659.75, 659.75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'B1000000-0000-4000-8000-00000000001A', 1, 1360.68, 680.34, 680.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'B1000000-0000-4000-8000-00000000001B', 1, 1401.86, 700.93, 700.93, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'B1000000-0000-4000-8000-00000000001C', 1, 1443.04, 721.52, 721.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'B1000000-0000-4000-8000-00000000001D', 1, 1484.22, 742.11, 742.11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'B1000000-0000-4000-8000-00000000001E', 1, 1525.40, 762.70, 762.70, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.complementos_pago OFF;
GO

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.notas_credito ON;
INSERT INTO fiscal.notas_credito (ID, ID_factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'B1000000-0000-4000-8000-000000000001', '01', 285.50, 45.68, 331.18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'B1000000-0000-4000-8000-000000000002', '03', 321.00, 51.36, 372.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'B1000000-0000-4000-8000-000000000003', '01', 356.50, 57.04, 413.54, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'B1000000-0000-4000-8000-000000000004', '03', 392.00, 62.72, 454.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'B1000000-0000-4000-8000-000000000005', '01', 427.50, 68.40, 495.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'B1000000-0000-4000-8000-000000000006', '03', 463.00, 74.08, 537.08, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'B1000000-0000-4000-8000-000000000007', '01', 498.50, 79.76, 578.26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'B1000000-0000-4000-8000-000000000008', '03', 534.00, 85.44, 619.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'B1000000-0000-4000-8000-000000000009', '01', 569.50, 91.12, 660.62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'B1000000-0000-4000-8000-00000000000A', '03', 605.00, 96.80, 701.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'B1000000-0000-4000-8000-00000000000B', '01', 640.50, 102.48, 742.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'B1000000-0000-4000-8000-00000000000C', '03', 676.00, 108.16, 784.16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'B1000000-0000-4000-8000-00000000000D', '01', 711.50, 113.84, 825.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'B1000000-0000-4000-8000-00000000000E', '03', 747.00, 119.52, 866.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'B1000000-0000-4000-8000-00000000000F', '01', 782.50, 125.20, 907.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'B1000000-0000-4000-8000-000000000010', '03', 818.00, 130.88, 948.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'B1000000-0000-4000-8000-000000000011', '01', 853.50, 136.56, 990.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'B1000000-0000-4000-8000-000000000012', '03', 889.00, 142.24, 1031.24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'B1000000-0000-4000-8000-000000000013', '01', 924.50, 147.92, 1072.42, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'B1000000-0000-4000-8000-000000000014', '03', 960.00, 153.60, 1113.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'B1000000-0000-4000-8000-000000000015', '01', 995.50, 159.28, 1154.78, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'B1000000-0000-4000-8000-000000000016', '03', 1031.00, 164.96, 1195.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'B1000000-0000-4000-8000-000000000017', '01', 1066.50, 170.64, 1237.14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'B1000000-0000-4000-8000-000000000018', '03', 1102.00, 176.32, 1278.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'B1000000-0000-4000-8000-000000000019', '01', 1137.50, 182.00, 1319.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'B1000000-0000-4000-8000-00000000001A', '03', 1173.00, 187.68, 1360.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'B1000000-0000-4000-8000-00000000001B', '01', 1208.50, 193.36, 1401.86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'B1000000-0000-4000-8000-00000000001C', '03', 1244.00, 199.04, 1443.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'B1000000-0000-4000-8000-00000000001D', '01', 1279.50, 204.72, 1484.22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'B1000000-0000-4000-8000-00000000001E', '03', 1315.00, 210.40, 1525.40, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.notas_credito OFF;
GO

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi ON;
INSERT INTO fiscal.cancelaciones_cfdi (ID, ID_factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'01', N'B1000000-0000-4000-8000-000000000001', N'<AcuseCancelacionSAT Folio="0001" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'02', NULL, N'<AcuseCancelacionSAT Folio="0002" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'03', NULL, N'<AcuseCancelacionSAT Folio="0003" Estatus="201" Motivo="03" />', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'04', NULL, N'<AcuseCancelacionSAT Folio="0004" Estatus="201" Motivo="04" />', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'01', N'B1000000-0000-4000-8000-000000000005', N'<AcuseCancelacionSAT Folio="0005" Estatus="201" Motivo="01" />', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'02', NULL, N'<AcuseCancelacionSAT Folio="0006" Estatus="201" Motivo="02" />', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'03', NULL, N'<AcuseCancelacionSAT Folio="0007" Estatus="201" Motivo="03" />', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'04', NULL, N'<AcuseCancelacionSAT Folio="0008" Estatus="201" Motivo="04" />', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'01', N'B1000000-0000-4000-8000-000000000009', N'<AcuseCancelacionSAT Folio="0009" Estatus="201" Motivo="01" />', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'02', NULL, N'<AcuseCancelacionSAT Folio="0010" Estatus="201" Motivo="02" />', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'03', NULL, N'<AcuseCancelacionSAT Folio="0011" Estatus="201" Motivo="03" />', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'04', NULL, N'<AcuseCancelacionSAT Folio="0012" Estatus="201" Motivo="04" />', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'01', N'B1000000-0000-4000-8000-00000000000D', N'<AcuseCancelacionSAT Folio="0013" Estatus="201" Motivo="01" />', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'02', NULL, N'<AcuseCancelacionSAT Folio="0014" Estatus="201" Motivo="02" />', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'03', NULL, N'<AcuseCancelacionSAT Folio="0015" Estatus="201" Motivo="03" />', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'04', NULL, N'<AcuseCancelacionSAT Folio="0016" Estatus="201" Motivo="04" />', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'01', N'B1000000-0000-4000-8000-000000000011', N'<AcuseCancelacionSAT Folio="0017" Estatus="201" Motivo="01" />', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'02', NULL, N'<AcuseCancelacionSAT Folio="0018" Estatus="201" Motivo="02" />', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'03', NULL, N'<AcuseCancelacionSAT Folio="0019" Estatus="201" Motivo="03" />', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'04', NULL, N'<AcuseCancelacionSAT Folio="0020" Estatus="201" Motivo="04" />', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'01', N'B1000000-0000-4000-8000-000000000015', N'<AcuseCancelacionSAT Folio="0021" Estatus="201" Motivo="01" />', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'02', NULL, N'<AcuseCancelacionSAT Folio="0022" Estatus="201" Motivo="02" />', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'03', NULL, N'<AcuseCancelacionSAT Folio="0023" Estatus="201" Motivo="03" />', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'04', NULL, N'<AcuseCancelacionSAT Folio="0024" Estatus="201" Motivo="04" />', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'01', N'B1000000-0000-4000-8000-000000000019', N'<AcuseCancelacionSAT Folio="0025" Estatus="201" Motivo="01" />', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'02', NULL, N'<AcuseCancelacionSAT Folio="0026" Estatus="201" Motivo="02" />', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'03', NULL, N'<AcuseCancelacionSAT Folio="0027" Estatus="201" Motivo="03" />', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'04', NULL, N'<AcuseCancelacionSAT Folio="0028" Estatus="201" Motivo="04" />', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'01', N'B1000000-0000-4000-8000-00000000001D', N'<AcuseCancelacionSAT Folio="0029" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'02', NULL, N'<AcuseCancelacionSAT Folio="0030" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi OFF;
GO

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.campanias ON;
INSERT INTO promos.campanias (ID, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CAMPANIA_01', N'Campaña DermaCare La Roche-Posay #01', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 52500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CAMPANIA_02', N'Campaña DermaCare CeraVe #02', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 55000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAMPANIA_03', N'Campaña DermaCare The Ordinary #03', '2026-02-03 11:30:00', '2026-02-24 11:30:00', 57500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAMPANIA_04', N'Campaña DermaCare ISDIN #04', '2026-02-04 11:30:00', '2026-02-25 11:30:00', 60000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CAMPANIA_05', N'Campaña DermaCare Bioderma #05', '2026-02-05 11:30:00', '2026-02-26 11:30:00', 62500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CAMPANIA_06', N'Campaña DermaCare Eau Thermale Avène #06', '2026-02-06 11:30:00', '2026-02-27 11:30:00', 65000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CAMPANIA_07', N'Campaña DermaCare Eucerin #07', '2026-02-07 11:30:00', '2026-02-28 11:30:00', 67500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CAMPANIA_08', N'Campaña DermaCare Vichy Laboratoires #08', '2026-02-08 11:30:00', '2026-03-01 11:30:00', 70000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAMPANIA_09', N'Campaña DermaCare SkinCeuticals #09', '2026-02-09 11:30:00', '2026-03-02 11:30:00', 72500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CAMPANIA_10', N'Campaña DermaCare Sesderma #10', '2026-02-10 11:30:00', '2026-03-03 11:30:00', 75000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CAMPANIA_11', N'Campaña DermaCare NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-03-04 11:30:00', 77500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CAMPANIA_12', N'Campaña DermaCare MAC Cosmetics #12', '2026-02-12 11:30:00', '2026-03-05 11:30:00', 80000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CAMPANIA_13', N'Campaña DermaCare Fenty Beauty #13', '2026-02-13 11:30:00', '2026-03-06 11:30:00', 82500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CAMPANIA_14', N'Campaña DermaCare Rare Beauty #14', '2026-02-14 11:30:00', '2026-03-07 11:30:00', 85000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CAMPANIA_15', N'Campaña DermaCare Clinique #15', '2026-02-15 11:30:00', '2026-03-08 11:30:00', 87500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CAMPANIA_16', N'Campaña DermaCare Estée Lauder #16', '2026-02-16 11:30:00', '2026-03-09 11:30:00', 90000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CAMPANIA_17', N'Campaña DermaCare Lancôme #17', '2026-02-17 11:30:00', '2026-03-10 11:30:00', 92500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CAMPANIA_18', N'Campaña DermaCare Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-03-11 11:30:00', 95000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CAMPANIA_19', N'Campaña DermaCare Paula''s Choice #19', '2026-02-19 11:30:00', '2026-03-12 11:30:00', 97500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CAMPANIA_20', N'Campaña DermaCare COSRX #20', '2026-02-20 11:30:00', '2026-03-13 11:30:00', 100000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CAMPANIA_21', N'Campaña DermaCare Laneige #21', '2026-02-21 11:30:00', '2026-03-14 11:30:00', 102500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CAMPANIA_22', N'Campaña DermaCare Uriage #22', '2026-02-22 11:30:00', '2026-03-15 11:30:00', 105000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CAMPANIA_23', N'Campaña DermaCare Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-03-16 11:30:00', 107500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CAMPANIA_24', N'Campaña DermaCare MartiDerm #24', '2026-02-24 11:30:00', '2026-03-17 11:30:00', 110000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CAMPANIA_25', N'Campaña DermaCare Heliocare #25', '2026-02-25 11:30:00', '2026-03-18 11:30:00', 112500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CAMPANIA_26', N'Campaña DermaCare Kiehl''s #26', '2026-02-26 11:30:00', '2026-03-19 11:30:00', 115000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CAMPANIA_27', N'Campaña DermaCare Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-03-20 11:30:00', 117500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CAMPANIA_28', N'Campaña DermaCare L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-03-21 11:30:00', 120000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CAMPANIA_29', N'Campaña DermaCare Neutrogena #29', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 122500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CAMPANIA_30', N'Campaña DermaCare DermaCare Labs #30', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 125000.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.campanias OFF;
GO

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.cupones ON;
INSERT INTO promos.cupones (ID, ID_campania, codigo_cupon, ID_tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CUPON_01', 1, 15.00, 799.00, 500, 13, 1, '2026-03-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'CUPON_02', 2, 150.00, 799.00, 500, 16, 2, '2026-03-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'CUPON_03', 3, 15.00, 799.00, 500, 19, 3, '2026-03-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CUPON_04', 4, 150.00, 799.00, 500, 22, 4, '2026-03-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'CUPON_05', 5, 15.00, 799.00, 500, 25, 5, '2026-03-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'CUPON_06', 6, 150.00, 799.00, 500, 28, 6, '2026-03-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CUPON_07', 7, 15.00, 799.00, 500, 31, 7, '2026-03-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'CUPON_08', 8, 150.00, 799.00, 500, 34, 8, '2026-03-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'CUPON_09', 9, 15.00, 799.00, 500, 37, 9, '2026-03-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CUPON_10', 10, 150.00, 799.00, 500, 40, 10, '2026-03-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'CUPON_11', 11, 15.00, 799.00, 500, 43, 11, '2026-03-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'CUPON_12', 12, 150.00, 799.00, 500, 46, 12, '2026-03-29 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CUPON_13', 13, 15.00, 799.00, 500, 49, 13, '2026-03-30 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'CUPON_14', 14, 150.00, 799.00, 500, 52, 14, '2026-03-31 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'CUPON_15', 15, 15.00, 799.00, 500, 55, 15, '2026-04-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CUPON_16', 16, 150.00, 799.00, 500, 58, 16, '2026-04-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'CUPON_17', 17, 15.00, 799.00, 500, 61, 17, '2026-04-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'CUPON_18', 18, 150.00, 799.00, 500, 64, 18, '2026-04-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CUPON_19', 19, 15.00, 799.00, 500, 67, 19, '2026-04-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'CUPON_20', 20, 150.00, 799.00, 500, 70, 20, '2026-04-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'CUPON_21', 21, 15.00, 799.00, 500, 73, 21, '2026-04-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CUPON_22', 22, 150.00, 799.00, 500, 76, 22, '2026-04-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'CUPON_23', 23, 15.00, 799.00, 500, 79, 23, '2026-04-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'CUPON_24', 24, 150.00, 799.00, 500, 82, 24, '2026-04-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CUPON_25', 25, 15.00, 799.00, 500, 85, 25, '2026-04-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'CUPON_26', 26, 150.00, 799.00, 500, 88, 26, '2026-04-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'CUPON_27', 27, 15.00, 799.00, 500, 91, 27, '2026-04-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CUPON_28', 28, 150.00, 799.00, 500, 94, 28, '2026-04-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'CUPON_29', 29, 15.00, 799.00, 500, 97, 29, '2026-03-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'CUPON_30', 30, 150.00, 799.00, 500, 100, 30, '2026-03-19 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.cupones OFF;
GO

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon ON;
INSERT INTO promos.reglas_elegibilidad_cupon (ID, ID_cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon OFF;
GO

-- =================================================================================================
-- 098. TABLA: promos.cupones_categorias_excluidas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.cupones_categorias_excluidas ON;
INSERT INTO promos.cupones_categorias_excluidas (ID, ID_cupon, ID_categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.cupones_categorias_excluidas OFF;
GO

-- =================================================================================================
-- 099. TABLA: promos.redenciones_cupones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.redenciones_cupones ON;
INSERT INTO promos.redenciones_cupones (ID, ID_cupon, ID_cliente, ID_orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 42.82, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 48.15, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 53.48, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 58.80, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 64.12, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 69.45, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 74.77, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 80.10, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 85.42, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 90.75, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 96.08, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 101.40, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 106.72, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 112.05, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 117.38, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 122.70, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 128.03, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 133.35, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 138.67, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 144.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 149.32, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 154.65, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 159.97, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 165.30, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 170.62, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 175.95, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 181.28, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 186.60, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 191.92, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 197.25, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.redenciones_cupones OFF;
GO

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.ventas_flash_horarias ON;
INSERT INTO promos.ventas_flash_horarias (ID, ID_variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 214.12, 55, 11, '2026-02-01 11:30:00', '2026-02-01 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 240.75, 60, 12, '2026-02-02 11:30:00', '2026-02-02 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 267.38, 65, 13, '2026-02-03 11:30:00', '2026-02-03 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 294.00, 70, 14, '2026-02-04 11:30:00', '2026-02-04 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 320.62, 75, 15, '2026-02-05 11:30:00', '2026-02-05 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 347.25, 80, 16, '2026-02-06 11:30:00', '2026-02-06 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 373.88, 85, 17, '2026-02-07 11:30:00', '2026-02-07 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 400.50, 90, 18, '2026-02-08 11:30:00', '2026-02-08 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 427.12, 95, 19, '2026-02-09 11:30:00', '2026-02-09 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 453.75, 100, 20, '2026-02-10 11:30:00', '2026-02-10 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 480.38, 105, 21, '2026-02-11 11:30:00', '2026-02-11 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 507.00, 110, 22, '2026-02-12 11:30:00', '2026-02-12 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 533.62, 115, 23, '2026-02-13 11:30:00', '2026-02-13 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 560.25, 120, 24, '2026-02-14 11:30:00', '2026-02-14 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 586.88, 125, 25, '2026-02-15 11:30:00', '2026-02-15 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 613.50, 130, 26, '2026-02-16 11:30:00', '2026-02-16 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 640.12, 135, 27, '2026-02-17 11:30:00', '2026-02-17 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 666.75, 140, 28, '2026-02-18 11:30:00', '2026-02-18 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 693.38, 145, 29, '2026-02-19 11:30:00', '2026-02-19 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 720.00, 150, 30, '2026-02-20 11:30:00', '2026-02-20 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 746.62, 155, 31, '2026-02-21 11:30:00', '2026-02-21 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 773.25, 160, 32, '2026-02-22 11:30:00', '2026-02-22 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 799.88, 165, 33, '2026-02-23 11:30:00', '2026-02-23 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 826.50, 170, 34, '2026-02-24 11:30:00', '2026-02-24 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 853.12, 175, 35, '2026-02-25 11:30:00', '2026-02-25 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 879.75, 180, 36, '2026-02-26 11:30:00', '2026-02-26 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 906.38, 185, 37, '2026-02-27 11:30:00', '2026-02-27 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 933.00, 190, 38, '2026-02-28 11:30:00', '2026-02-28 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 959.62, 195, 39, '2026-02-01 11:30:00', '2026-02-01 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 986.25, 200, 40, '2026-02-02 11:30:00', '2026-02-02 17:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.ventas_flash_horarias OFF;
GO

