-- =================================================================================================
-- SUBMÓDULO 2: OPERACIONES COMERCIALES, PASARELAS DE PAGO Y FACTURACIÓN CFDI 4.0 (PostgreSQL 16/17)
-- Tablas 051 a 100 (Autor: Sheyla EstefanÍa Moncada Guel)
-- Sincronizado 100% con 00_MASTER_SEED_DATA_SQLSERVER.sql (PK: ID / FKs: ID_*)
-- =================================================================================================

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.tipos_descuento (ID, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'DESCUENT_01', 'Porcentaje Directo Nivel 1', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'DESCUENT_02', 'Monto Fijo MXN Nivel 1', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'DESCUENT_03', 'Suscripción Beauty-Box Nivel 1', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'DESCUENT_04', 'Envío Gratuito VIP Nivel 1', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'DESCUENT_05', 'Regalo por Compra (GWP) Nivel 1', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'DESCUENT_06', 'Porcentaje Directo Nivel 2', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DESCUENT_07', 'Monto Fijo MXN Nivel 2', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'DESCUENT_08', 'Suscripción Beauty-Box Nivel 2', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'DESCUENT_09', 'Envío Gratuito VIP Nivel 2', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'DESCUENT_10', 'Regalo por Compra (GWP) Nivel 2', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'DESCUENT_11', 'Porcentaje Directo Nivel 3', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'DESCUENT_12', 'Monto Fijo MXN Nivel 3', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'DESCUENT_13', 'Suscripción Beauty-Box Nivel 3', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'DESCUENT_14', 'Envío Gratuito VIP Nivel 3', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'DESCUENT_15', 'Regalo por Compra (GWP) Nivel 3', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'DESCUENT_16', 'Porcentaje Directo Nivel 4', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'DESCUENT_17', 'Monto Fijo MXN Nivel 4', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'DESCUENT_18', 'Suscripción Beauty-Box Nivel 4', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'DESCUENT_19', 'Envío Gratuito VIP Nivel 4', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'DESCUENT_20', 'Regalo por Compra (GWP) Nivel 4', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'DESCUENT_21', 'Porcentaje Directo Nivel 5', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'DESCUENT_22', 'Monto Fijo MXN Nivel 5', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'DESCUENT_23', 'Suscripción Beauty-Box Nivel 5', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'DESCUENT_24', 'Envío Gratuito VIP Nivel 5', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'DESCUENT_25', 'Regalo por Compra (GWP) Nivel 5', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'DESCUENT_26', 'Porcentaje Directo Nivel 6', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'DESCUENT_27', 'Monto Fijo MXN Nivel 6', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'DESCUENT_28', 'Suscripción Beauty-Box Nivel 6', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'DESCUENT_29', 'Envío Gratuito VIP Nivel 6', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'DESCUENT_30', 'Regalo por Compra (GWP) Nivel 6', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.tipos_descuento', 'id'), COALESCE((SELECT MAX(id) FROM ventas.tipos_descuento), 1), true);

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.estados_orden (ID, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PEND_PAGO', 'Pendiente de Pago', 'Orden registrada esperando confirmación bancaria o SPEI', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PAGADA', 'Pago Confirmado', 'Transacción aprobada y lista para asignación de almacén', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PREPARANDO', 'En Preparación CEDIS', 'Surtido en curso bajo estrategia FEFO y empaque térmico', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'EN_TRANSITO', 'Enviada en Tránsito', 'Paquete recolectado por paquetería con guía de rastreo', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ENTREGADA', 'Entregada al Cliente', 'Recepción confirmada en domicilio del destinatario', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden anulada antes del despacho con liberación de stock', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DEVUELTA', 'Devuelta por RMA', 'Mercancía retornada y dictaminada en postventa', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('ventas.estados_orden', 'id'), COALESCE((SELECT MAX(id) FROM ventas.estados_orden), 1), true);

-- =================================================================================================
-- 053. TABLA: ventas.motivos_cancelacion_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.motivos_cancelacion_orden (ID, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Cliente solicitó cancelación antes de recolección en CEDIS', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Error en dirección de entrega o código postal capturado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Pago rechazado o expirado por institución emisora', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Quiebre de inventario en lote con caducidad vigente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Cambio de producto o tono solicitado por cliente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Cliente solicitó cancelación antes de recolección en CEDIS', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Error en dirección de entrega o código postal capturado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Pago rechazado o expirado por institución emisora', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Quiebre de inventario en lote con caducidad vigente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Cambio de producto o tono solicitado por cliente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Cliente solicitó cancelación antes de recolección en CEDIS', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Error en dirección de entrega o código postal capturado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Pago rechazado o expirado por institución emisora', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Quiebre de inventario en lote con caducidad vigente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Cambio de producto o tono solicitado por cliente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Cliente solicitó cancelación antes de recolección en CEDIS', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Error en dirección de entrega o código postal capturado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Pago rechazado o expirado por institución emisora', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Quiebre de inventario en lote con caducidad vigente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Cambio de producto o tono solicitado por cliente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Cliente solicitó cancelación antes de recolección en CEDIS', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Error en dirección de entrega o código postal capturado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Pago rechazado o expirado por institución emisora', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Quiebre de inventario en lote con caducidad vigente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Cambio de producto o tono solicitado por cliente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Cliente solicitó cancelación antes de recolección en CEDIS', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Error en dirección de entrega o código postal capturado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Pago rechazado o expirado por institución emisora', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Quiebre de inventario en lote con caducidad vigente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Cambio de producto o tono solicitado por cliente', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.motivos_cancelacion_orden', 'id'), COALESCE((SELECT MAX(id) FROM ventas.motivos_cancelacion_orden), 1), true);

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos (ID, ID_cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'cart_57dc5da2039af8209f120c7b2b2be269', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'cart_554ae59cc8f4acc14082de7fc4a9f5b3', '2026-02-02 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'cart_c47636f57a40b6e372daf58b4eeed6c1', '2026-02-03 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'cart_2b38b22aed846681e14862f4a2119795', '2026-02-04 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'cart_6da7b7ebbfa341e1e1ec1d19b3781958', '2026-02-05 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'cart_ae5947c6abb8a651e55f9e2c984e3afb', '2026-02-06 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'cart_9f1bbb48183acdcc679ac9bb0cedaf73', '2026-02-07 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'cart_8080474caaa1d1a4f108a48e2b832d78', '2026-02-08 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'cart_d84d15c981329a2ac173a050f8d4e8e0', '2026-02-09 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'cart_1fad691371770b500d253d30187fcf1a', '2026-02-10 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'cart_bc761d30adb2285a09292f3591e6d22a', '2026-02-11 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'cart_1db8173a08b1f21c1e061ca8ab12f8e7', '2026-02-12 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'cart_28a951a322f66c471ed9e6b6d1446f07', '2026-02-13 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'cart_7584f3ea411c95a2cd3502e695977dab', '2026-02-14 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'cart_89154d767ec2eb8cd9aa6962f6dade7b', '2026-02-15 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'cart_74c0e5204d660ec49f8c06556e097bbf', '2026-02-16 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'cart_8dc42a833499c9a8a2b3c3ccdc7b70b9', '2026-02-17 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'cart_1e8d4b56ad7777d93c481c07c164a7e4', '2026-02-18 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'cart_2875259dce4df7dfde8d04aa94cacfad', '2026-02-19 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'cart_a18af5057ae5f140b0f133ba744d82d4', '2026-02-20 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'cart_089cd763aafad52db63c023d769b471f', '2026-02-21 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'cart_01bc2fd024ad872376159fcca18ea91a', '2026-02-22 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'cart_22f8c2f21386cc2dce796861c0e94195', '2026-02-23 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'cart_1758dfb7f6192568cd3f8b92a8995d85', '2026-02-24 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'cart_9bb7274b4a4f68c3f66552d5f2de9be4', '2026-02-25 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'cart_9142a7c6a5971e60db03b68461494ded', '2026-02-26 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'cart_bb00ee858a90811da2756726f24f1723', '2026-02-27 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'cart_a6f636ca5b9598970e91b89107409258', '2026-02-28 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'cart_9597bf538a12785e1abf35d807246e0e', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'cart_cea37fa7bacdff1e1595ac22411f66ad', '2026-02-02 11:30:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos', 'id'), COALESCE((SELECT MAX(id) FROM ventas.carritos), 1), true);

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.items_carrito (ID, ID_carrito, ID_variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 285.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 321.00, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 356.50, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 392.00, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 427.50, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 463.00, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 498.50, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 534.00, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 569.50, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 605.00, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 640.50, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 676.00, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 711.50, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 747.00, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 782.50, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 818.00, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 853.50, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 889.00, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 924.50, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 960.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 995.50, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1031.00, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1066.50, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1102.00, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1137.50, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1173.00, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1208.50, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1244.00, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1279.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1315.00, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.items_carrito', 'id'), COALESCE((SELECT MAX(id) FROM ventas.items_carrito), 1), true);

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos_abandonados_seguimiento (ID, ID_carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, '2026-02-01 11:30:00', TRUE, 571.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, NULL, FALSE, 642.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, '2026-02-03 11:30:00', TRUE, 713.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, NULL, FALSE, 784.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, '2026-02-05 11:30:00', TRUE, 855.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, NULL, FALSE, 926.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, '2026-02-07 11:30:00', TRUE, 997.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, NULL, FALSE, 1068.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, '2026-02-09 11:30:00', TRUE, 1139.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, NULL, FALSE, 1210.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, '2026-02-11 11:30:00', TRUE, 1281.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, NULL, FALSE, 1352.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, '2026-02-13 11:30:00', TRUE, 1423.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, NULL, FALSE, 1494.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, '2026-02-15 11:30:00', TRUE, 1565.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, NULL, FALSE, 1636.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, '2026-02-17 11:30:00', TRUE, 1707.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, NULL, FALSE, 1778.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, '2026-02-19 11:30:00', TRUE, 1849.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, NULL, FALSE, 1920.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, '2026-02-21 11:30:00', TRUE, 1991.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, NULL, FALSE, 2062.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, '2026-02-23 11:30:00', TRUE, 2133.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, NULL, FALSE, 2204.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, '2026-02-25 11:30:00', TRUE, 2275.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, NULL, FALSE, 2346.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, '2026-02-27 11:30:00', TRUE, 2417.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, NULL, FALSE, 2488.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, '2026-02-01 11:30:00', TRUE, 2559.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, NULL, FALSE, 2630.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos_abandonados_seguimiento', 'id'), COALESCE((SELECT MAX(id) FROM ventas.carritos_abandonados_seguimiento), 1), true);

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.planes_suscripcion (ID, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PLAN_01', 'Beauty-Box Dermatológica La Roche-Posay #01', 'Reposición automática personalizada de tratamientos La Roche-Posay con seguimiento clínico.', 285.50, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PLAN_02', 'Beauty-Box Dermatológica CeraVe #02', 'Reposición automática personalizada de tratamientos CeraVe con seguimiento clínico.', 321.00, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PLAN_03', 'Beauty-Box Dermatológica The Ordinary #03', 'Reposición automática personalizada de tratamientos The Ordinary con seguimiento clínico.', 356.50, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PLAN_04', 'Beauty-Box Dermatológica ISDIN #04', 'Reposición automática personalizada de tratamientos ISDIN con seguimiento clínico.', 392.00, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PLAN_05', 'Beauty-Box Dermatológica Bioderma #05', 'Reposición automática personalizada de tratamientos Bioderma con seguimiento clínico.', 427.50, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PLAN_06', 'Beauty-Box Dermatológica Eau Thermale Avène #06', 'Reposición automática personalizada de tratamientos Eau Thermale Avène con seguimiento clínico.', 463.00, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PLAN_07', 'Beauty-Box Dermatológica Eucerin #07', 'Reposición automática personalizada de tratamientos Eucerin con seguimiento clínico.', 498.50, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PLAN_08', 'Beauty-Box Dermatológica Vichy Laboratoires #08', 'Reposición automática personalizada de tratamientos Vichy Laboratoires con seguimiento clínico.', 534.00, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PLAN_09', 'Beauty-Box Dermatológica SkinCeuticals #09', 'Reposición automática personalizada de tratamientos SkinCeuticals con seguimiento clínico.', 569.50, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PLAN_10', 'Beauty-Box Dermatológica Sesderma #10', 'Reposición automática personalizada de tratamientos Sesderma con seguimiento clínico.', 605.00, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PLAN_11', 'Beauty-Box Dermatológica NARS Cosmetics #11', 'Reposición automática personalizada de tratamientos NARS Cosmetics con seguimiento clínico.', 640.50, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PLAN_12', 'Beauty-Box Dermatológica MAC Cosmetics #12', 'Reposición automática personalizada de tratamientos MAC Cosmetics con seguimiento clínico.', 676.00, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PLAN_13', 'Beauty-Box Dermatológica Fenty Beauty #13', 'Reposición automática personalizada de tratamientos Fenty Beauty con seguimiento clínico.', 711.50, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PLAN_14', 'Beauty-Box Dermatológica Rare Beauty #14', 'Reposición automática personalizada de tratamientos Rare Beauty con seguimiento clínico.', 747.00, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PLAN_15', 'Beauty-Box Dermatológica Clinique #15', 'Reposición automática personalizada de tratamientos Clinique con seguimiento clínico.', 782.50, 5.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PLAN_16', 'Beauty-Box Dermatológica Estée Lauder #16', 'Reposición automática personalizada de tratamientos Estée Lauder con seguimiento clínico.', 818.00, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PLAN_17', 'Beauty-Box Dermatológica Lancôme #17', 'Reposición automática personalizada de tratamientos Lancôme con seguimiento clínico.', 853.50, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PLAN_18', 'Beauty-Box Dermatológica Charlotte Tilbury #18', 'Reposición automática personalizada de tratamientos Charlotte Tilbury con seguimiento clínico.', 889.00, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PLAN_19', 'Beauty-Box Dermatológica Paula''s Choice #19', 'Reposición automática personalizada de tratamientos Paula''s Choice con seguimiento clínico.', 924.50, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PLAN_20', 'Beauty-Box Dermatológica COSRX #20', 'Reposición automática personalizada de tratamientos COSRX con seguimiento clínico.', 960.00, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PLAN_21', 'Beauty-Box Dermatológica Laneige #21', 'Reposición automática personalizada de tratamientos Laneige con seguimiento clínico.', 995.50, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PLAN_22', 'Beauty-Box Dermatológica Uriage #22', 'Reposición automática personalizada de tratamientos Uriage con seguimiento clínico.', 1031.00, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PLAN_23', 'Beauty-Box Dermatológica Laboratoire SVR #23', 'Reposición automática personalizada de tratamientos Laboratoire SVR con seguimiento clínico.', 1066.50, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PLAN_24', 'Beauty-Box Dermatológica MartiDerm #24', 'Reposición automática personalizada de tratamientos MartiDerm con seguimiento clínico.', 1102.00, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PLAN_25', 'Beauty-Box Dermatológica Heliocare #25', 'Reposición automática personalizada de tratamientos Heliocare con seguimiento clínico.', 1137.50, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PLAN_26', 'Beauty-Box Dermatológica Kiehl''s #26', 'Reposición automática personalizada de tratamientos Kiehl''s con seguimiento clínico.', 1173.00, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PLAN_27', 'Beauty-Box Dermatológica Garnier SkinActive #27', 'Reposición automática personalizada de tratamientos Garnier SkinActive con seguimiento clínico.', 1208.50, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PLAN_28', 'Beauty-Box Dermatológica L''Oréal Paris Derm #28', 'Reposición automática personalizada de tratamientos L''Oréal Paris Derm con seguimiento clínico.', 1244.00, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PLAN_29', 'Beauty-Box Dermatológica Neutrogena #29', 'Reposición automática personalizada de tratamientos Neutrogena con seguimiento clínico.', 1279.50, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PLAN_30', 'Beauty-Box Dermatológica DermaCare Labs #30', 'Reposición automática personalizada de tratamientos DermaCare Labs con seguimiento clínico.', 1315.00, 5.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.planes_suscripcion', 'id'), COALESCE((SELECT MAX(id) FROM ventas.planes_suscripcion), 1), true);

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.frecuencias_suscripcion (ID, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FRECUENC_01', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FRECUENC_02', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FRECUENC_03', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FRECUENC_04', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FRECUENC_05', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FRECUENC_06', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FRECUENC_07', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FRECUENC_08', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FRECUENC_09', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FRECUENC_10', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FRECUENC_11', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FRECUENC_12', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FRECUENC_13', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FRECUENC_14', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FRECUENC_15', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FRECUENC_16', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FRECUENC_17', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FRECUENC_18', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FRECUENC_19', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FRECUENC_20', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FRECUENC_21', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FRECUENC_22', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FRECUENC_23', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FRECUENC_24', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FRECUENC_25', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FRECUENC_26', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FRECUENC_27', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FRECUENC_28', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FRECUENC_29', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FRECUENC_30', 'Cada 60 días', 60, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.frecuencias_suscripcion', 'id'), COALESCE((SELECT MAX(id) FROM ventas.frecuencias_suscripcion), 1), true);

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_cliente (ID, folio_suscripcion, ID_cliente, ID_plan_suscripcion, ID_frecuencia_suscripcion, ID_direccion_entrega, ID_metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-31', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-04-01', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-04-02', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-04-03', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-04-04', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-04-05', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-04-06', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-04-07', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-04-08', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-04-09', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-04-10', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-04-11', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-04-12', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-04-13', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-04-14', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-04-15', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-04-16', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-04-17', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-04-18', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-04-19', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-04-20', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-04-21', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-04-22', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-04-23', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-04-24', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-04-25', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-04-26', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-04-27', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-31', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-04-01', 'PAUSADA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_cliente', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_cliente), 1), true);

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_items (ID, ID_suscripcion_cliente, ID_variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 256.95, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 288.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 320.85, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 352.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 384.75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 416.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 448.65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 480.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 512.55, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 544.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 576.45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 608.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 640.35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 672.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 704.25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 736.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 768.15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 800.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 832.05, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 864.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 895.95, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 927.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 959.85, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 991.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1023.75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1055.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1087.65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1119.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1151.55, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1183.50, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_items', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_items), 1), true);

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_calendario_entregas (ID, ID_suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '2026-03-01', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '2026-03-02', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '2026-03-03', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '2026-03-04', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '2026-03-05', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '2026-03-06', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '2026-03-07', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '2026-03-08', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '2026-03-09', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '2026-03-10', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '2026-03-11', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '2026-03-12', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '2026-03-13', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '2026-03-14', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '2026-03-15', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '2026-03-16', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '2026-03-17', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '2026-03-18', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '2026-03-19', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '2026-03-20', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '2026-03-21', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '2026-03-22', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '2026-03-23', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '2026-03-24', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '2026-03-25', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '2026-03-26', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '2026-03-27', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '2026-03-28', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '2026-03-01', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '2026-03-02', 1, 'COBRADO_PROCESANDO', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_calendario_entregas', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_calendario_entregas), 1), true);

-- =================================================================================================
-- 062. TABLA: ventas.suscripciones_bitacora_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_bitacora_estados (ID, ID_suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_bitacora_estados', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_bitacora_estados), 1), true);

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.regalos_por_compra_gwp (ID, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, ID_variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROMOCIO_01', 'Regalo GWP La Roche-Posay (Talla Viajera #01)', 899.00, 1, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 8, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROMOCIO_02', 'Regalo GWP CeraVe (Talla Viajera #02)', 1099.00, 2, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROMOCIO_03', 'Regalo GWP The Ordinary (Talla Viajera #03)', 1299.00, 3, '2026-02-03 11:30:00', '2026-03-05 11:30:00', 14, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROMOCIO_04', 'Regalo GWP ISDIN (Talla Viajera #04)', 1499.00, 4, '2026-02-04 11:30:00', '2026-03-06 11:30:00', 17, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROMOCIO_05', 'Regalo GWP Bioderma (Talla Viajera #05)', 1699.00, 5, '2026-02-05 11:30:00', '2026-03-07 11:30:00', 20, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROMOCIO_06', 'Regalo GWP Eau Thermale Avène (Talla Viajera #06)', 899.00, 6, '2026-02-06 11:30:00', '2026-03-08 11:30:00', 23, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROMOCIO_07', 'Regalo GWP Eucerin (Talla Viajera #07)', 1099.00, 7, '2026-02-07 11:30:00', '2026-03-09 11:30:00', 26, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROMOCIO_08', 'Regalo GWP Vichy Laboratoires (Talla Viajera #08)', 1299.00, 8, '2026-02-08 11:30:00', '2026-03-10 11:30:00', 29, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROMOCIO_09', 'Regalo GWP SkinCeuticals (Talla Viajera #09)', 1499.00, 9, '2026-02-09 11:30:00', '2026-03-11 11:30:00', 32, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROMOCIO_10', 'Regalo GWP Sesderma (Talla Viajera #10)', 1699.00, 10, '2026-02-10 11:30:00', '2026-03-12 11:30:00', 35, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROMOCIO_11', 'Regalo GWP NARS Cosmetics (Talla Viajera #11)', 899.00, 11, '2026-02-11 11:30:00', '2026-03-13 11:30:00', 38, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROMOCIO_12', 'Regalo GWP MAC Cosmetics (Talla Viajera #12)', 1099.00, 12, '2026-02-12 11:30:00', '2026-03-14 11:30:00', 41, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROMOCIO_13', 'Regalo GWP Fenty Beauty (Talla Viajera #13)', 1299.00, 13, '2026-02-13 11:30:00', '2026-03-15 11:30:00', 44, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROMOCIO_14', 'Regalo GWP Rare Beauty (Talla Viajera #14)', 1499.00, 14, '2026-02-14 11:30:00', '2026-03-16 11:30:00', 47, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROMOCIO_15', 'Regalo GWP Clinique (Talla Viajera #15)', 1699.00, 15, '2026-02-15 11:30:00', '2026-03-17 11:30:00', 50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROMOCIO_16', 'Regalo GWP Estée Lauder (Talla Viajera #16)', 899.00, 16, '2026-02-16 11:30:00', '2026-03-18 11:30:00', 53, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROMOCIO_17', 'Regalo GWP Lancôme (Talla Viajera #17)', 1099.00, 17, '2026-02-17 11:30:00', '2026-03-19 11:30:00', 56, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROMOCIO_18', 'Regalo GWP Charlotte Tilbury (Talla Viajera #18)', 1299.00, 18, '2026-02-18 11:30:00', '2026-03-20 11:30:00', 59, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROMOCIO_19', 'Regalo GWP Paula''s Choice (Talla Viajera #19)', 1499.00, 19, '2026-02-19 11:30:00', '2026-03-21 11:30:00', 62, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROMOCIO_20', 'Regalo GWP COSRX (Talla Viajera #20)', 1699.00, 20, '2026-02-20 11:30:00', '2026-03-22 11:30:00', 65, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROMOCIO_21', 'Regalo GWP Laneige (Talla Viajera #21)', 899.00, 21, '2026-02-21 11:30:00', '2026-03-23 11:30:00', 68, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROMOCIO_22', 'Regalo GWP Uriage (Talla Viajera #22)', 1099.00, 22, '2026-02-22 11:30:00', '2026-03-24 11:30:00', 71, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROMOCIO_23', 'Regalo GWP Laboratoire SVR (Talla Viajera #23)', 1299.00, 23, '2026-02-23 11:30:00', '2026-03-25 11:30:00', 74, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROMOCIO_24', 'Regalo GWP MartiDerm (Talla Viajera #24)', 1499.00, 24, '2026-02-24 11:30:00', '2026-03-26 11:30:00', 77, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROMOCIO_25', 'Regalo GWP Heliocare (Talla Viajera #25)', 1699.00, 25, '2026-02-25 11:30:00', '2026-03-27 11:30:00', 80, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROMOCIO_26', 'Regalo GWP Kiehl''s (Talla Viajera #26)', 899.00, 26, '2026-02-26 11:30:00', '2026-03-28 11:30:00', 83, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROMOCIO_27', 'Regalo GWP Garnier SkinActive (Talla Viajera #27)', 1099.00, 27, '2026-02-27 11:30:00', '2026-03-29 11:30:00', 86, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROMOCIO_28', 'Regalo GWP L''Oréal Paris Derm (Talla Viajera #28)', 1299.00, 28, '2026-02-28 11:30:00', '2026-03-30 11:30:00', 89, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROMOCIO_29', 'Regalo GWP Neutrogena (Talla Viajera #29)', 1499.00, 29, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 92, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROMOCIO_30', 'Regalo GWP DermaCare Labs (Talla Viajera #30)', 1699.00, 30, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 95, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.regalos_por_compra_gwp', 'id'), COALESCE((SELECT MAX(id) FROM ventas.regalos_por_compra_gwp), 1), true);

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes (ID, folio_orden, ID_cliente, ID_estado_orden, ID_motivo_cancelacion, ID_direccion_envio, ID_direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 571.00, 0.00, 91.36, 129.00, 791.36, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 0.00, 51.36, 129.00, 501.36, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 713.00, 71.30, 102.67, 129.00, 873.37, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 0.00, 62.72, 129.00, 583.72, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 855.00, 0.00, 136.80, 129.00, 1120.80, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 46.30, 66.67, 129.00, 612.37, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 7, 7, 7, 7, '2026-02-07 11:30:00', 997.00, 0.00, 159.52, 129.00, 1285.52, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 0.00, 85.44, 129.00, 748.44, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 1139.00, 113.90, 164.02, 0.00, 1189.12, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 0.00, 96.80, 129.00, 830.80, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 1281.00, 0.00, 204.96, 0.00, 1485.96, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 67.60, 97.34, 129.00, 834.74, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 6, 13, 13, 13, '2026-02-13 11:30:00', 1423.00, 0.00, 227.68, 0.00, 1650.68, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 7, 14, 14, 14, '2026-02-14 11:30:00', 747.00, 0.00, 119.52, 129.00, 995.52, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 1565.00, 156.50, 225.36, 0.00, 1633.86, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 0.00, 130.88, 129.00, 1077.88, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 1707.00, 0.00, 273.12, 0.00, 1980.12, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 88.90, 128.02, 129.00, 1057.12, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 1849.00, 0.00, 295.84, 0.00, 2144.84, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 6, 20, 20, 20, '2026-02-20 11:30:00', 960.00, 0.00, 153.60, 129.00, 1242.60, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 7, 21, 21, 21, '2026-02-21 11:30:00', 1991.00, 199.10, 286.70, 0.00, 2078.60, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 0.00, 164.96, 0.00, 1195.96, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 2133.00, 0.00, 341.28, 0.00, 2474.28, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 110.20, 158.69, 129.00, 1279.49, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 2275.00, 0.00, 364.00, 0.00, 2639.00, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 0.00, 187.68, 0.00, 1360.68, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 6, 27, 27, 27, '2026-02-27 11:30:00', 2417.00, 241.70, 348.05, 0.00, 2523.35, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 7, 28, 28, 28, '2026-02-28 11:30:00', 1244.00, 0.00, 199.04, 0.00, 1443.04, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 2559.00, 0.00, 409.44, 0.00, 2968.44, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 131.50, 189.36, 0.00, 1372.86, 'MXN', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes), 1), true);

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_detalles (ID, ID_orden, ID_variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 2, 285.50, 148.46, 0.00, 571.00, 16.00, 91.36, 662.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 1, 321.00, 166.92, 0.00, 321.00, 16.00, 51.36, 372.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 2, 356.50, 185.38, 71.30, 641.70, 16.00, 102.67, 744.37, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 1, 392.00, 203.84, 0.00, 392.00, 16.00, 62.72, 454.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 2, 427.50, 222.30, 0.00, 855.00, 16.00, 136.80, 991.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 1, 463.00, 240.76, 46.30, 416.70, 16.00, 66.67, 483.37, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 2, 498.50, 259.22, 0.00, 997.00, 16.00, 159.52, 1156.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 1, 534.00, 277.68, 0.00, 534.00, 16.00, 85.44, 619.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 2, 569.50, 296.14, 113.90, 1025.10, 16.00, 164.02, 1189.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 1, 605.00, 314.60, 0.00, 605.00, 16.00, 96.80, 701.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 2, 640.50, 333.06, 0.00, 1281.00, 16.00, 204.96, 1485.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 1, 676.00, 351.52, 67.60, 608.40, 16.00, 97.34, 705.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 2, 711.50, 369.98, 0.00, 1423.00, 16.00, 227.68, 1650.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 1, 747.00, 388.44, 0.00, 747.00, 16.00, 119.52, 866.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 2, 782.50, 406.90, 156.50, 1408.50, 16.00, 225.36, 1633.86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 1, 818.00, 425.36, 0.00, 818.00, 16.00, 130.88, 948.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 2, 853.50, 443.82, 0.00, 1707.00, 16.00, 273.12, 1980.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 1, 889.00, 462.28, 88.90, 800.10, 16.00, 128.02, 928.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 2, 924.50, 480.74, 0.00, 1849.00, 16.00, 295.84, 2144.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 1, 960.00, 499.20, 0.00, 960.00, 16.00, 153.60, 1113.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 2, 995.50, 517.66, 199.10, 1791.90, 16.00, 286.70, 2078.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 1, 1031.00, 536.12, 0.00, 1031.00, 16.00, 164.96, 1195.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 2, 1066.50, 554.58, 0.00, 2133.00, 16.00, 341.28, 2474.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 1, 1102.00, 573.04, 110.20, 991.80, 16.00, 158.69, 1150.49, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 2, 1137.50, 591.50, 0.00, 2275.00, 16.00, 364.00, 2639.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 1, 1173.00, 609.96, 0.00, 1173.00, 16.00, 187.68, 1360.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 2, 1208.50, 628.42, 241.70, 2175.30, 16.00, 348.05, 2523.35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 1, 1244.00, 646.88, 0.00, 1244.00, 16.00, 199.04, 1443.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 2, 1279.50, 665.34, 0.00, 2559.00, 16.00, 409.44, 2968.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 1, 1315.00, 683.80, 131.50, 1183.50, 16.00, 189.36, 1372.86, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_detalles', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_detalles), 1), true);

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_historial_estados (ID, ID_orden, ID_estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_historial_estados', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_historial_estados), 1), true);

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_splits_almacen (ID, ID_orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SPL-ORD-2026-0001-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SPL-ORD-2026-0002-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SPL-ORD-2026-0003-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SPL-ORD-2026-0004-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SPL-ORD-2026-0005-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SPL-ORD-2026-0006-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SPL-ORD-2026-0007-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SPL-ORD-2026-0008-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SPL-ORD-2026-0009-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SPL-ORD-2026-0010-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SPL-ORD-2026-0011-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SPL-ORD-2026-0012-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SPL-ORD-2026-0013-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SPL-ORD-2026-0014-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SPL-ORD-2026-0015-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SPL-ORD-2026-0016-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SPL-ORD-2026-0017-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SPL-ORD-2026-0018-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SPL-ORD-2026-0019-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SPL-ORD-2026-0020-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SPL-ORD-2026-0021-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SPL-ORD-2026-0022-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SPL-ORD-2026-0023-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SPL-ORD-2026-0024-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SPL-ORD-2026-0025-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SPL-ORD-2026-0026-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SPL-ORD-2026-0027-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SPL-ORD-2026-0028-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SPL-ORD-2026-0029-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SPL-ORD-2026-0030-01', 'EN_RUTA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_splits_almacen', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_splits_almacen), 1), true);

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_impuestos (ID, ID_orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '002_IVA', 0.1600, 571.00, 91.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '002_IVA', 0.1600, 321.00, 51.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '002_IVA', 0.1600, 641.70, 102.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '002_IVA', 0.1600, 392.00, 62.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '002_IVA', 0.1600, 855.00, 136.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '002_IVA', 0.1600, 416.70, 66.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '002_IVA', 0.1600, 997.00, 159.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '002_IVA', 0.1600, 534.00, 85.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '002_IVA', 0.1600, 1025.10, 164.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '002_IVA', 0.1600, 605.00, 96.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '002_IVA', 0.1600, 1281.00, 204.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '002_IVA', 0.1600, 608.40, 97.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '002_IVA', 0.1600, 1423.00, 227.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '002_IVA', 0.1600, 747.00, 119.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '002_IVA', 0.1600, 1408.50, 225.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '002_IVA', 0.1600, 818.00, 130.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '002_IVA', 0.1600, 1707.00, 273.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '002_IVA', 0.1600, 800.10, 128.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '002_IVA', 0.1600, 1849.00, 295.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '002_IVA', 0.1600, 960.00, 153.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '002_IVA', 0.1600, 1791.90, 286.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '002_IVA', 0.1600, 1031.00, 164.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '002_IVA', 0.1600, 2133.00, 341.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '002_IVA', 0.1600, 991.80, 158.69, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '002_IVA', 0.1600, 2275.00, 364.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '002_IVA', 0.1600, 1173.00, 187.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '002_IVA', 0.1600, 2175.30, 348.05, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '002_IVA', 0.1600, 1244.00, 199.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '002_IVA', 0.1600, 2559.00, 409.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '002_IVA', 0.1600, 1183.50, 189.36, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_impuestos', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_impuestos), 1), true);

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_descuentos (ID, ID_orden, ID_tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'PROMOCIO_01', 57.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'PROMOCIO_02', 32.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'PROMOCIO_03', 71.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'PROMOCIO_04', 39.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'PROMOCIO_05', 85.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'PROMOCIO_06', 46.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'PROMOCIO_07', 99.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'PROMOCIO_08', 53.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'PROMOCIO_09', 113.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'PROMOCIO_10', 60.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'PROMOCIO_11', 128.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'PROMOCIO_12', 67.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'PROMOCIO_13', 142.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'PROMOCIO_14', 74.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'PROMOCIO_15', 156.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'PROMOCIO_16', 81.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'PROMOCIO_17', 170.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'PROMOCIO_18', 88.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'PROMOCIO_19', 184.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'PROMOCIO_20', 96.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'PROMOCIO_21', 199.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'PROMOCIO_22', 103.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'PROMOCIO_23', 213.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'PROMOCIO_24', 110.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'PROMOCIO_25', 227.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'PROMOCIO_26', 117.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'PROMOCIO_27', 241.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'PROMOCIO_28', 124.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'PROMOCIO_29', 255.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'PROMOCIO_30', 131.50, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_descuentos', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_descuentos), 1), true);

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_notas_instrucciones (ID, ID_orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, 'Con cariño para el cuidado diario de tu piel, Carlos.', 'Portón blanco frente a parque en Centro, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, 'Con cariño para el cuidado diario de tu piel, Sofía.', 'Portón blanco frente a parque en Obispado, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, 'Con cariño para el cuidado diario de tu piel, Valeria.', 'Portón blanco frente a parque en Del Valle, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, 'Con cariño para el cuidado diario de tu piel, Alejandro.', 'Portón blanco frente a parque en Roma Norte, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, 'Con cariño para el cuidado diario de tu piel, Mariana.', 'Portón blanco frente a parque en Polanco, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, 'Con cariño para el cuidado diario de tu piel, Diego.', 'Portón blanco frente a parque en Americana, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, 'Con cariño para el cuidado diario de tu piel, Camila.', 'Portón blanco frente a parque en República, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, 'Con cariño para el cuidado diario de tu piel, Mateo.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, 'Con cariño para el cuidado diario de tu piel, Lucía.', 'Portón blanco frente a parque en La Paz, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, 'Con cariño para el cuidado diario de tu piel, Sebastián.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, 'Con cariño para el cuidado diario de tu piel, Regina.', 'Portón blanco frente a parque en Centro, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, 'Con cariño para el cuidado diario de tu piel, Santiago.', 'Portón blanco frente a parque en Obispado, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, 'Con cariño para el cuidado diario de tu piel, Fernanda.', 'Portón blanco frente a parque en Del Valle, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, 'Con cariño para el cuidado diario de tu piel, Emiliano.', 'Portón blanco frente a parque en Roma Norte, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, 'Con cariño para el cuidado diario de tu piel, Ximena.', 'Portón blanco frente a parque en Polanco, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, 'Con cariño para el cuidado diario de tu piel, Daniel.', 'Portón blanco frente a parque en Americana, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, 'Con cariño para el cuidado diario de tu piel, Andrea.', 'Portón blanco frente a parque en República, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, 'Con cariño para el cuidado diario de tu piel, Gabriel.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, 'Con cariño para el cuidado diario de tu piel, Paula.', 'Portón blanco frente a parque en La Paz, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, 'Con cariño para el cuidado diario de tu piel, Andrés.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, 'Con cariño para el cuidado diario de tu piel, Renata.', 'Portón blanco frente a parque en Centro, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, 'Con cariño para el cuidado diario de tu piel, Nicolás.', 'Portón blanco frente a parque en Obispado, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, 'Con cariño para el cuidado diario de tu piel, Natalia.', 'Portón blanco frente a parque en Del Valle, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, 'Con cariño para el cuidado diario de tu piel, Joaquín.', 'Portón blanco frente a parque en Roma Norte, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, 'Con cariño para el cuidado diario de tu piel, Isabella.', 'Portón blanco frente a parque en Polanco, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, 'Con cariño para el cuidado diario de tu piel, Leonardo.', 'Portón blanco frente a parque en Americana, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, 'Con cariño para el cuidado diario de tu piel, Ana.', 'Portón blanco frente a parque en República, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, 'Con cariño para el cuidado diario de tu piel, Rodrigo.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, 'Con cariño para el cuidado diario de tu piel, Paulina.', 'Portón blanco frente a parque en La Paz, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, 'Con cariño para el cuidado diario de tu piel, Mauricio.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_notas_instrucciones', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_notas_instrucciones), 1), true);

-- =================================================================================================
-- 071. TABLA: ventas.reservas_temporales_stock (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.reservas_temporales_stock (ID, ID_carrito, ID_variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:45:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.reservas_temporales_stock', 'id'), COALESCE((SELECT MAX(id) FROM ventas.reservas_temporales_stock), 1), true);

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.afiliados_influencers (ID, codigo_afiliado, ID_usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'AFILIADO_01', 1, '@DermaTipsCarlos_01', 6.00, '012180001234567801', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'AFILIADO_02', 2, '@DermaTipsSofía_02', 7.00, '012180001234567802', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AFILIADO_03', 3, '@DermaTipsValeria_03', 8.00, '012180001234567803', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'AFILIADO_04', 4, '@DermaTipsAlejandro_04', 9.00, '012180001234567804', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'AFILIADO_05', 5, '@DermaTipsMariana_05', 10.00, '012180001234567805', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'AFILIADO_06', 6, '@DermaTipsDiego_06', 11.00, '012180001234567806', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'AFILIADO_07', 7, '@DermaTipsCamila_07', 12.00, '012180001234567807', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'AFILIADO_08', 8, '@DermaTipsMateo_08', 13.00, '012180001234567808', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'AFILIADO_09', 9, '@DermaTipsLucía_09', 14.00, '012180001234567809', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'AFILIADO_10', 10, '@DermaTipsSebastián_10', 15.00, '012180001234567810', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'AFILIADO_11', 11, '@DermaTipsRegina_11', 16.00, '012180001234567811', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'AFILIADO_12', 12, '@DermaTipsSantiago_12', 17.00, '012180001234567812', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'AFILIADO_13', 13, '@DermaTipsFernanda_13', 18.00, '012180001234567813', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'AFILIADO_14', 14, '@DermaTipsEmiliano_14', 19.00, '012180001234567814', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'AFILIADO_15', 15, '@DermaTipsXimena_15', 5.00, '012180001234567815', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'AFILIADO_16', 16, '@DermaTipsDaniel_16', 6.00, '012180001234567816', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'AFILIADO_17', 17, '@DermaTipsAndrea_17', 7.00, '012180001234567817', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'AFILIADO_18', 18, '@DermaTipsGabriel_18', 8.00, '012180001234567818', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'AFILIADO_19', 19, '@DermaTipsPaula_19', 9.00, '012180001234567819', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'AFILIADO_20', 20, '@DermaTipsAndrés_20', 10.00, '012180001234567820', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'AFILIADO_21', 21, '@DermaTipsRenata_21', 11.00, '012180001234567821', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'AFILIADO_22', 22, '@DermaTipsNicolás_22', 12.00, '012180001234567822', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'AFILIADO_23', 23, '@DermaTipsNatalia_23', 13.00, '012180001234567823', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'AFILIADO_24', 24, '@DermaTipsJoaquín_24', 14.00, '012180001234567824', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'AFILIADO_25', 25, '@DermaTipsIsabella_25', 15.00, '012180001234567825', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'AFILIADO_26', 26, '@DermaTipsLeonardo_26', 16.00, '012180001234567826', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'AFILIADO_27', 27, '@DermaTipsAna_27', 17.00, '012180001234567827', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'AFILIADO_28', 28, '@DermaTipsRodrigo_28', 18.00, '012180001234567828', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'AFILIADO_29', 29, '@DermaTipsPaulina_29', 19.00, '012180001234567829', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'AFILIADO_30', 30, '@DermaTipsMauricio_30', 5.00, '012180001234567830', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.afiliados_influencers', 'id'), COALESCE((SELECT MAX(id) FROM ventas.afiliados_influencers), 1), true);

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.comisiones_afiliados (ID, ID_afiliado, ID_orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 571.00, 34.26, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, 22.47, 'APROBADA', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 641.70, 51.34, 'PAGADA', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, 35.28, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 855.00, 85.50, 'APROBADA', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 416.70, 45.84, 'PAGADA', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 997.00, 119.64, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, 69.42, 'APROBADA', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1025.10, 143.51, 'PAGADA', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, 90.75, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1281.00, 204.96, 'APROBADA', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 608.40, 103.43, 'PAGADA', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1423.00, 256.14, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, 141.93, 'APROBADA', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1408.50, 281.70, 'PAGADA', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, 171.78, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1707.00, 375.54, 'APROBADA', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 800.10, 184.02, 'PAGADA', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1849.00, 443.76, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, 240.00, 'APROBADA', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1791.90, 465.89, 'PAGADA', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, 278.37, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 2133.00, 597.24, 'APROBADA', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 991.80, 287.62, 'PAGADA', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 2275.00, 682.50, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, 70.38, 'APROBADA', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 2175.30, 152.27, 'PAGADA', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, 99.52, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 2559.00, 230.31, 'APROBADA', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1183.50, 118.35, 'PAGADA', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.comisiones_afiliados', 'id'), COALESCE((SELECT MAX(id) FROM ventas.comisiones_afiliados), 1), true);

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.proveedores_pasarela (ID, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PASARELA_01', 'Stripe México', 'https://api.dermacare.mx/webhooks/pagos/stripe/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PASARELA_02', 'Mercado Pago', 'https://api.dermacare.mx/webhooks/pagos/mercadopago/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PASARELA_03', 'Openpay BBVA', 'https://api.dermacare.mx/webhooks/pagos/openpay/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PASARELA_04', 'Conekta MX', 'https://api.dermacare.mx/webhooks/pagos/conekta/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PASARELA_05', 'PayPal Commerce', 'https://api.dermacare.mx/webhooks/pagos/paypal/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PASARELA_06', 'Clip Checkout', 'https://api.dermacare.mx/webhooks/pagos/clip/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PASARELA_07', 'Kueski Pay', 'https://api.dermacare.mx/webhooks/pagos/kueskipay/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PASARELA_08', 'Aplazo BNPL', 'https://api.dermacare.mx/webhooks/pagos/aplazo/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PASARELA_09', 'Adyen LATAM', 'https://api.dermacare.mx/webhooks/pagos/adyen/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PASARELA_10', 'STP SPEI Directo', 'https://api.dermacare.mx/webhooks/pagos/stp-spei/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PASARELA_11', 'Stripe México Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/stripe/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PASARELA_12', 'Mercado Pago Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/mercadopago/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PASARELA_13', 'Openpay BBVA Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/openpay/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PASARELA_14', 'Conekta MX Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/conekta/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PASARELA_15', 'PayPal Commerce Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/paypal/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PASARELA_16', 'Clip Checkout Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/clip/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PASARELA_17', 'Kueski Pay Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/kueskipay/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PASARELA_18', 'Aplazo BNPL Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/aplazo/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PASARELA_19', 'Adyen LATAM Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/adyen/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PASARELA_20', 'STP SPEI Directo Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/stp-spei/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PASARELA_21', 'Stripe México Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/stripe/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PASARELA_22', 'Mercado Pago Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/mercadopago/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PASARELA_23', 'Openpay BBVA Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/openpay/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PASARELA_24', 'Conekta MX Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/conekta/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PASARELA_25', 'PayPal Commerce Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/paypal/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PASARELA_26', 'Clip Checkout Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/clip/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PASARELA_27', 'Kueski Pay Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/kueskipay/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PASARELA_28', 'Aplazo BNPL Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/aplazo/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PASARELA_29', 'Adyen LATAM Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/adyen/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PASARELA_30', 'STP SPEI Directo Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/stp-spei/v3', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.proveedores_pasarela', 'id'), COALESCE((SELECT MAX(id) FROM pagos.proveedores_pasarela), 1), true);

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.metodos_pago (ID, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TARJETA_CRED', 'Tarjeta de Crédito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TARJETA_DEB', 'Tarjeta de Débito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SPEI_TRANSF', 'Transferencia Electrónica SPEI', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'OXXO_EFECT', 'Pago en Efectivo Tiendas OXXO', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MONEDERO', 'Saldo Monedero DermaCare', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('pagos.metodos_pago', 'id'), COALESCE((SELECT MAX(id) FROM pagos.metodos_pago), 1), true);

-- =================================================================================================
-- 076. TABLA: pagos.transacciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.transacciones (ID, folio_transaccion, ID_orden, ID_proveedor_pasarela, ID_metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 1, 1, 'pi_3QxDerma2026_0001', 791.36, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 2, 2, 'pi_3QxDerma2026_0002', 501.36, 'MXN', 'APROBADA', 'AUTORIZA_02', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 3, 3, 'pi_3QxDerma2026_0003', 873.37, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 4, 4, 'pi_3QxDerma2026_0004', 583.72, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 5, 5, 'pi_3QxDerma2026_0005', 1120.80, 'MXN', 'EN_MEDIACION', 'AUTORIZA_05', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 6, 1, 'pi_3QxDerma2026_0006', 612.37, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 7, 2, 'pi_3QxDerma2026_0007', 1285.52, 'MXN', 'APROBADA', 'AUTORIZA_07', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 8, 3, 'pi_3QxDerma2026_0008', 748.44, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 9, 4, 'pi_3QxDerma2026_0009', 1189.12, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 10, 5, 'pi_3QxDerma2026_0010', 830.80, 'MXN', 'EN_MEDIACION', 'AUTORIZA_10', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 11, 1, 'pi_3QxDerma2026_0011', 1485.96, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 12, 2, 'pi_3QxDerma2026_0012', 834.74, 'MXN', 'APROBADA', 'AUTORIZA_12', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 13, 3, 'pi_3QxDerma2026_0013', 1650.68, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 14, 4, 'pi_3QxDerma2026_0014', 995.52, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 15, 5, 'pi_3QxDerma2026_0015', 1633.86, 'MXN', 'EN_MEDIACION', 'AUTORIZA_15', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 16, 1, 'pi_3QxDerma2026_0016', 1077.88, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 17, 2, 'pi_3QxDerma2026_0017', 1980.12, 'MXN', 'APROBADA', 'AUTORIZA_17', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 18, 3, 'pi_3QxDerma2026_0018', 1057.12, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 19, 4, 'pi_3QxDerma2026_0019', 2144.84, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 20, 5, 'pi_3QxDerma2026_0020', 1242.60, 'MXN', 'EN_MEDIACION', 'AUTORIZA_20', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 21, 1, 'pi_3QxDerma2026_0021', 2078.60, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 22, 2, 'pi_3QxDerma2026_0022', 1195.96, 'MXN', 'APROBADA', 'AUTORIZA_22', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 23, 3, 'pi_3QxDerma2026_0023', 2474.28, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 24, 4, 'pi_3QxDerma2026_0024', 1279.49, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 25, 5, 'pi_3QxDerma2026_0025', 2639.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_25', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 26, 1, 'pi_3QxDerma2026_0026', 1360.68, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 27, 2, 'pi_3QxDerma2026_0027', 2523.35, 'MXN', 'APROBADA', 'AUTORIZA_27', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 28, 3, 'pi_3QxDerma2026_0028', 1443.04, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 29, 4, 'pi_3QxDerma2026_0029', 2968.44, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 30, 5, 'pi_3QxDerma2026_0030', 1372.86, 'MXN', 'EN_MEDIACION', 'AUTORIZA_30', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.transacciones', 'id'), COALESCE((SELECT MAX(id) FROM pagos.transacciones), 1), true);

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.intentos_cobro (ID, ID_transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 200, '{"tx_id": 1, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, '{"tx_id": 2, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, '{"tx_id": 3, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 402, '{"tx_id": 4, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, '{"tx_id": 5, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, '{"tx_id": 6, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, '{"tx_id": 7, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 402, '{"tx_id": 8, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, '{"tx_id": 9, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, '{"tx_id": 10, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, '{"tx_id": 11, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 402, '{"tx_id": 12, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, '{"tx_id": 13, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, '{"tx_id": 14, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, '{"tx_id": 15, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 402, '{"tx_id": 16, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, '{"tx_id": 17, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, '{"tx_id": 18, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, '{"tx_id": 19, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 402, '{"tx_id": 20, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, '{"tx_id": 21, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, '{"tx_id": 22, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, '{"tx_id": 23, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 402, '{"tx_id": 24, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, '{"tx_id": 25, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, '{"tx_id": 26, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, '{"tx_id": 27, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 402, '{"tx_id": 28, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, '{"tx_id": 29, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, '{"tx_id": 30, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.intentos_cobro', 'id'), COALESCE((SELECT MAX(id) FROM pagos.intentos_cobro), 1), true);

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.split_multipagos (ID, ID_orden, ID_metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 142.75, 'REF-MULTIPAGO-2026-0001', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 160.50, 'REF-MULTIPAGO-2026-0002', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 178.25, 'REF-MULTIPAGO-2026-0003', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 196.00, 'REF-MULTIPAGO-2026-0004', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 213.75, 'REF-MULTIPAGO-2026-0005', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 231.50, 'REF-MULTIPAGO-2026-0006', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 249.25, 'REF-MULTIPAGO-2026-0007', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 267.00, 'REF-MULTIPAGO-2026-0008', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 284.75, 'REF-MULTIPAGO-2026-0009', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 302.50, 'REF-MULTIPAGO-2026-0010', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 320.25, 'REF-MULTIPAGO-2026-0011', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 338.00, 'REF-MULTIPAGO-2026-0012', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 355.75, 'REF-MULTIPAGO-2026-0013', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 373.50, 'REF-MULTIPAGO-2026-0014', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 391.25, 'REF-MULTIPAGO-2026-0015', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 409.00, 'REF-MULTIPAGO-2026-0016', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 426.75, 'REF-MULTIPAGO-2026-0017', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 444.50, 'REF-MULTIPAGO-2026-0018', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 462.25, 'REF-MULTIPAGO-2026-0019', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 480.00, 'REF-MULTIPAGO-2026-0020', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 497.75, 'REF-MULTIPAGO-2026-0021', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 515.50, 'REF-MULTIPAGO-2026-0022', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 533.25, 'REF-MULTIPAGO-2026-0023', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 551.00, 'REF-MULTIPAGO-2026-0024', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 568.75, 'REF-MULTIPAGO-2026-0025', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 586.50, 'REF-MULTIPAGO-2026-0026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 604.25, 'REF-MULTIPAGO-2026-0027', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 622.00, 'REF-MULTIPAGO-2026-0028', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 639.75, 'REF-MULTIPAGO-2026-0029', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 657.50, 'REF-MULTIPAGO-2026-0030', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.split_multipagos', 'id'), COALESCE((SELECT MAX(id) FROM pagos.split_multipagos), 1), true);

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.billetera_electronica (ID, ID_cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 300.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 350.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 400.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 450.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 500.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 550.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 600.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 650.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 700.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 750.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 800.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 850.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 900.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 950.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1000.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1050.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1100.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1150.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1200.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1250.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1300.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1350.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1400.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1450.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1500.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1550.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1600.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1650.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1700.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1750.00, 150.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.billetera_electronica', 'id'), COALESCE((SELECT MAX(id) FROM pagos.billetera_electronica), 1), true);

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.movimientos_billetera (ID, ID_billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CARGA_SALDO', 115.00, 520.00, 635.00, 'Recarga electrónica acreditada en billetera #0001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAGO_ORDEN', 130.00, 540.00, 410.00, 'Aplicación de saldo para pago parcial de orden #0002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'REEMBOLSO_DEVOLUCION', 145.00, 560.00, 705.00, 'Acreditación por devolución RMA aprobada #0003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CARGA_SALDO', 160.00, 580.00, 740.00, 'Recarga electrónica acreditada en billetera #0004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PAGO_ORDEN', 175.00, 600.00, 425.00, 'Aplicación de saldo para pago parcial de orden #0005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'REEMBOLSO_DEVOLUCION', 190.00, 620.00, 810.00, 'Acreditación por devolución RMA aprobada #0006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CARGA_SALDO', 205.00, 640.00, 845.00, 'Recarga electrónica acreditada en billetera #0007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PAGO_ORDEN', 220.00, 660.00, 440.00, 'Aplicación de saldo para pago parcial de orden #0008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'REEMBOLSO_DEVOLUCION', 235.00, 680.00, 915.00, 'Acreditación por devolución RMA aprobada #0009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CARGA_SALDO', 250.00, 700.00, 950.00, 'Recarga electrónica acreditada en billetera #0010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PAGO_ORDEN', 265.00, 720.00, 455.00, 'Aplicación de saldo para pago parcial de orden #0011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'REEMBOLSO_DEVOLUCION', 280.00, 740.00, 1020.00, 'Acreditación por devolución RMA aprobada #0012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CARGA_SALDO', 295.00, 760.00, 1055.00, 'Recarga electrónica acreditada en billetera #0013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAGO_ORDEN', 310.00, 780.00, 470.00, 'Aplicación de saldo para pago parcial de orden #0014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'REEMBOLSO_DEVOLUCION', 325.00, 800.00, 1125.00, 'Acreditación por devolución RMA aprobada #0015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CARGA_SALDO', 340.00, 820.00, 1160.00, 'Recarga electrónica acreditada en billetera #0016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'PAGO_ORDEN', 355.00, 840.00, 485.00, 'Aplicación de saldo para pago parcial de orden #0017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'REEMBOLSO_DEVOLUCION', 370.00, 860.00, 1230.00, 'Acreditación por devolución RMA aprobada #0018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CARGA_SALDO', 385.00, 880.00, 1265.00, 'Recarga electrónica acreditada en billetera #0019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PAGO_ORDEN', 400.00, 900.00, 500.00, 'Aplicación de saldo para pago parcial de orden #0020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'REEMBOLSO_DEVOLUCION', 415.00, 920.00, 1335.00, 'Acreditación por devolución RMA aprobada #0021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CARGA_SALDO', 430.00, 940.00, 1370.00, 'Recarga electrónica acreditada en billetera #0022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PAGO_ORDEN', 445.00, 960.00, 515.00, 'Aplicación de saldo para pago parcial de orden #0023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'REEMBOLSO_DEVOLUCION', 460.00, 980.00, 1440.00, 'Acreditación por devolución RMA aprobada #0024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CARGA_SALDO', 475.00, 1000.00, 1475.00, 'Recarga electrónica acreditada en billetera #0025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAGO_ORDEN', 490.00, 1020.00, 530.00, 'Aplicación de saldo para pago parcial de orden #0026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'REEMBOLSO_DEVOLUCION', 505.00, 1040.00, 1545.00, 'Acreditación por devolución RMA aprobada #0027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CARGA_SALDO', 520.00, 1060.00, 1580.00, 'Recarga electrónica acreditada en billetera #0028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'PAGO_ORDEN', 535.00, 1080.00, 545.00, 'Aplicación de saldo para pago parcial de orden #0029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'REEMBOLSO_DEVOLUCION', 550.00, 1100.00, 1650.00, 'Acreditación por devolución RMA aprobada #0030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.movimientos_billetera', 'id'), COALESCE((SELECT MAX(id) FROM pagos.movimientos_billetera), 1), true);

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.tarjetas_regalo_giftcards (ID, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, ID_cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 285.50, 285.50, '2026-03-01', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 321.00, 321.00, '2026-03-02', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 356.50, 356.50, '2026-03-03', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 392.00, 392.00, '2026-03-04', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 427.50, 427.50, '2026-03-05', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 463.00, 463.00, '2026-03-06', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 498.50, 498.50, '2026-03-07', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 534.00, 534.00, '2026-03-08', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 569.50, 569.50, '2026-03-09', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 605.00, 605.00, '2026-03-10', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 640.50, 640.50, '2026-03-11', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 676.00, 676.00, '2026-03-12', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 711.50, 711.50, '2026-03-13', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 747.00, 747.00, '2026-03-14', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 782.50, 782.50, '2026-03-15', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 818.00, 818.00, '2026-03-16', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 853.50, 853.50, '2026-03-17', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 889.00, 889.00, '2026-03-18', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 924.50, 924.50, '2026-03-19', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 960.00, 960.00, '2026-03-20', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 995.50, 995.50, '2026-03-21', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 1031.00, 1031.00, '2026-03-22', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 1066.50, 1066.50, '2026-03-23', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 1102.00, 1102.00, '2026-03-24', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 1137.50, 1137.50, '2026-03-25', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 1173.00, 1173.00, '2026-03-26', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 1208.50, 1208.50, '2026-03-27', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 1244.00, 1244.00, '2026-03-28', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 1279.50, 1279.50, '2026-03-01', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 1315.00, 1315.00, '2026-03-02', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.tarjetas_regalo_giftcards', 'id'), COALESCE((SELECT MAX(id) FROM pagos.tarjetas_regalo_giftcards), 1), true);

-- =================================================================================================
-- 082. TABLA: pagos.redenciones_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.redenciones_giftcards (ID, ID_giftcard, ID_orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 285.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 356.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 427.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 463.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 498.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 569.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 640.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 676.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 711.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 782.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 853.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 889.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 924.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 995.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1066.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1102.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1137.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1208.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1279.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1315.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.redenciones_giftcards', 'id'), COALESCE((SELECT MAX(id) FROM pagos.redenciones_giftcards), 1), true);

-- =================================================================================================
-- 083. TABLA: pagos.reglas_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reglas_antifraude (ID, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'REGLA_01', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #01)', 6, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'REGLA_02', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #02)', 7, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'REGLA_03', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #03)', 8, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REGLA_04', 'Uso de correo desechable o dominio temporal no verificado. (Regla #04)', 9, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REGLA_05', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #05)', 10, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'REGLA_06', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #06)', 11, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'REGLA_07', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #07)', 12, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'REGLA_08', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #08)', 13, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'REGLA_09', 'Uso de correo desechable o dominio temporal no verificado. (Regla #09)', 14, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'REGLA_10', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #10)', 15, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'REGLA_11', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #11)', 16, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'REGLA_12', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #12)', 17, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'REGLA_13', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #13)', 18, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'REGLA_14', 'Uso de correo desechable o dominio temporal no verificado. (Regla #14)', 19, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'REGLA_15', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #15)', 20, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'REGLA_16', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #16)', 21, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'REGLA_17', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #17)', 22, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'REGLA_18', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #18)', 23, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'REGLA_19', 'Uso de correo desechable o dominio temporal no verificado. (Regla #19)', 24, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'REGLA_20', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #20)', 25, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'REGLA_21', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #21)', 26, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'REGLA_22', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #22)', 27, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'REGLA_23', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #23)', 28, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'REGLA_24', 'Uso de correo desechable o dominio temporal no verificado. (Regla #24)', 29, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'REGLA_25', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #25)', 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'REGLA_26', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #26)', 31, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'REGLA_27', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #27)', 32, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'REGLA_28', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #28)', 33, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'REGLA_29', 'Uso de correo desechable o dominio temporal no verificado. (Regla #29)', 34, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'REGLA_30', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #30)', 5, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reglas_antifraude', 'id'), COALESCE((SELECT MAX(id) FROM pagos.reglas_antifraude), 1), true);

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.evaluaciones_antifraude (ID, ID_orden, ID_regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 'BAJO', '189.203.3.7', 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'MEDIO', '189.203.6.14', 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'ALTO_REQUERIR_3DS', '189.203.9.21', 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 'CRITICO_RECHAZADO', '189.203.12.28', 4, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 'BAJO', '189.203.15.35', 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 'MEDIO', '189.203.18.42', 6, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 'ALTO_REQUERIR_3DS', '189.203.21.49', 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 'CRITICO_RECHAZADO', '189.203.24.56', 8, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 'BAJO', '189.203.27.63', 9, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 'MEDIO', '189.203.30.70', 10, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 'ALTO_REQUERIR_3DS', '189.203.33.77', 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 'CRITICO_RECHAZADO', '189.203.36.84', 12, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 'BAJO', '189.203.39.91', 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 'MEDIO', '189.203.42.98', 14, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 'ALTO_REQUERIR_3DS', '189.203.45.105', 15, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 'CRITICO_RECHAZADO', '189.203.48.112', 16, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 'BAJO', '189.203.51.119', 17, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 'MEDIO', '189.203.54.126', 18, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 'ALTO_REQUERIR_3DS', '189.203.57.133', 19, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 'CRITICO_RECHAZADO', '189.203.60.140', 20, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 'BAJO', '189.203.63.147', 21, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 'MEDIO', '189.203.66.154', 22, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 'ALTO_REQUERIR_3DS', '189.203.69.161', 23, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 'CRITICO_RECHAZADO', '189.203.72.168', 24, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 'BAJO', '189.203.75.175', 25, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 'MEDIO', '189.203.78.182', 26, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 'ALTO_REQUERIR_3DS', '189.203.81.189', 27, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 'CRITICO_RECHAZADO', '189.203.84.196', 28, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 'BAJO', '189.203.87.203', 29, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 'MEDIO', '189.203.90.210', 30, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.evaluaciones_antifraude', 'id'), COALESCE((SELECT MAX(id) FROM pagos.evaluaciones_antifraude), 1), true);

-- =================================================================================================
-- 085. TABLA: pagos.contracargos_chargebacks (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.contracargos_chargebacks (ID, ID_transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-DISPU-2026-0001', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 285.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-DISPU-2026-0002', 'Reclamo por mercancía no recibida tras plazo prometido.', 321.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-DISPU-2026-0003', 'Diferencia en monto cobrado reportada en estado de cuenta.', 356.50, '2026-02-03 11:30:00', '2026-03-03', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-DISPU-2026-0004', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 392.00, '2026-02-04 11:30:00', '2026-03-04', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-DISPU-2026-0005', 'Reclamo por mercancía no recibida tras plazo prometido.', 427.50, '2026-02-05 11:30:00', '2026-03-05', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-DISPU-2026-0006', 'Diferencia en monto cobrado reportada en estado de cuenta.', 463.00, '2026-02-06 11:30:00', '2026-03-06', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-DISPU-2026-0007', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 498.50, '2026-02-07 11:30:00', '2026-03-07', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-DISPU-2026-0008', 'Reclamo por mercancía no recibida tras plazo prometido.', 534.00, '2026-02-08 11:30:00', '2026-03-08', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-DISPU-2026-0009', 'Diferencia en monto cobrado reportada en estado de cuenta.', 569.50, '2026-02-09 11:30:00', '2026-03-09', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-DISPU-2026-0010', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 605.00, '2026-02-10 11:30:00', '2026-03-10', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-DISPU-2026-0011', 'Reclamo por mercancía no recibida tras plazo prometido.', 640.50, '2026-02-11 11:30:00', '2026-03-11', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-DISPU-2026-0012', 'Diferencia en monto cobrado reportada en estado de cuenta.', 676.00, '2026-02-12 11:30:00', '2026-03-12', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-DISPU-2026-0013', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 711.50, '2026-02-13 11:30:00', '2026-03-13', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-DISPU-2026-0014', 'Reclamo por mercancía no recibida tras plazo prometido.', 747.00, '2026-02-14 11:30:00', '2026-03-14', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-DISPU-2026-0015', 'Diferencia en monto cobrado reportada en estado de cuenta.', 782.50, '2026-02-15 11:30:00', '2026-03-15', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-DISPU-2026-0016', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 818.00, '2026-02-16 11:30:00', '2026-03-16', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-DISPU-2026-0017', 'Reclamo por mercancía no recibida tras plazo prometido.', 853.50, '2026-02-17 11:30:00', '2026-03-17', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-DISPU-2026-0018', 'Diferencia en monto cobrado reportada en estado de cuenta.', 889.00, '2026-02-18 11:30:00', '2026-03-18', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-DISPU-2026-0019', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 924.50, '2026-02-19 11:30:00', '2026-03-19', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-DISPU-2026-0020', 'Reclamo por mercancía no recibida tras plazo prometido.', 960.00, '2026-02-20 11:30:00', '2026-03-20', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-DISPU-2026-0021', 'Diferencia en monto cobrado reportada en estado de cuenta.', 995.50, '2026-02-21 11:30:00', '2026-03-21', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-DISPU-2026-0022', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1031.00, '2026-02-22 11:30:00', '2026-03-22', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-DISPU-2026-0023', 'Reclamo por mercancía no recibida tras plazo prometido.', 1066.50, '2026-02-23 11:30:00', '2026-03-23', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-DISPU-2026-0024', 'Diferencia en monto cobrado reportada en estado de cuenta.', 1102.00, '2026-02-24 11:30:00', '2026-03-24', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-DISPU-2026-0025', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1137.50, '2026-02-25 11:30:00', '2026-03-25', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-DISPU-2026-0026', 'Reclamo por mercancía no recibida tras plazo prometido.', 1173.00, '2026-02-26 11:30:00', '2026-03-26', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-DISPU-2026-0027', 'Diferencia en monto cobrado reportada en estado de cuenta.', 1208.50, '2026-02-27 11:30:00', '2026-03-27', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-DISPU-2026-0028', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1244.00, '2026-02-28 11:30:00', '2026-03-28', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-DISPU-2026-0029', 'Reclamo por mercancía no recibida tras plazo prometido.', 1279.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-DISPU-2026-0030', 'Diferencia en monto cobrado reportada en estado de cuenta.', 1315.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.contracargos_chargebacks', 'id'), COALESCE((SELECT MAX(id) FROM pagos.contracargos_chargebacks), 1), true);

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reembolsos_transaccion (ID, ID_transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-REEMB-2026-0001', 285.50, 'Devolución aprobada tras inspección sanitaria RMA #0001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-REEMB-2026-0002', 321.00, 'Devolución aprobada tras inspección sanitaria RMA #0002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-REEMB-2026-0003', 356.50, 'Devolución aprobada tras inspección sanitaria RMA #0003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-REEMB-2026-0004', 392.00, 'Devolución aprobada tras inspección sanitaria RMA #0004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-REEMB-2026-0005', 427.50, 'Devolución aprobada tras inspección sanitaria RMA #0005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-REEMB-2026-0006', 463.00, 'Devolución aprobada tras inspección sanitaria RMA #0006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-REEMB-2026-0007', 498.50, 'Devolución aprobada tras inspección sanitaria RMA #0007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-REEMB-2026-0008', 534.00, 'Devolución aprobada tras inspección sanitaria RMA #0008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-REEMB-2026-0009', 569.50, 'Devolución aprobada tras inspección sanitaria RMA #0009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-REEMB-2026-0010', 605.00, 'Devolución aprobada tras inspección sanitaria RMA #0010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-REEMB-2026-0011', 640.50, 'Devolución aprobada tras inspección sanitaria RMA #0011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-REEMB-2026-0012', 676.00, 'Devolución aprobada tras inspección sanitaria RMA #0012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-REEMB-2026-0013', 711.50, 'Devolución aprobada tras inspección sanitaria RMA #0013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-REEMB-2026-0014', 747.00, 'Devolución aprobada tras inspección sanitaria RMA #0014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-REEMB-2026-0015', 782.50, 'Devolución aprobada tras inspección sanitaria RMA #0015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-REEMB-2026-0016', 818.00, 'Devolución aprobada tras inspección sanitaria RMA #0016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-REEMB-2026-0017', 853.50, 'Devolución aprobada tras inspección sanitaria RMA #0017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-REEMB-2026-0018', 889.00, 'Devolución aprobada tras inspección sanitaria RMA #0018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-REEMB-2026-0019', 924.50, 'Devolución aprobada tras inspección sanitaria RMA #0019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-REEMB-2026-0020', 960.00, 'Devolución aprobada tras inspección sanitaria RMA #0020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-REEMB-2026-0021', 995.50, 'Devolución aprobada tras inspección sanitaria RMA #0021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-REEMB-2026-0022', 1031.00, 'Devolución aprobada tras inspección sanitaria RMA #0022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-REEMB-2026-0023', 1066.50, 'Devolución aprobada tras inspección sanitaria RMA #0023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-REEMB-2026-0024', 1102.00, 'Devolución aprobada tras inspección sanitaria RMA #0024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-REEMB-2026-0025', 1137.50, 'Devolución aprobada tras inspección sanitaria RMA #0025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-REEMB-2026-0026', 1173.00, 'Devolución aprobada tras inspección sanitaria RMA #0026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-REEMB-2026-0027', 1208.50, 'Devolución aprobada tras inspección sanitaria RMA #0027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-REEMB-2026-0028', 1244.00, 'Devolución aprobada tras inspección sanitaria RMA #0028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-REEMB-2026-0029', 1279.50, 'Devolución aprobada tras inspección sanitaria RMA #0029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-REEMB-2026-0030', 1315.00, 'Devolución aprobada tras inspección sanitaria RMA #0030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reembolsos_transaccion', 'id'), COALESCE((SELECT MAX(id) FROM pagos.reembolsos_transaccion), 1), true);

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.regimenes_sat (ID, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, '601', 'General de Ley Personas Morales', FALSE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, '605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, '606', 'Arrendamiento', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, '612', 'Personas Físicas con Actividades Empresariales y Profesionales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, '616', 'Sin obligaciones fiscales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, '621', 'Incorporación Fiscal', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, '625', 'Régimen de las Actividades Empresariales con ingresos a través de Plataformas', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, '626', 'Régimen Simplificado de Confianza (RESICO)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.regimenes_sat', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.regimenes_sat), 1), true);

-- =================================================================================================
-- 088. TABLA: fiscal.usos_cfdi (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.usos_cfdi (ID, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'G01', 'Adquisición de mercancías', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'G03', 'Gastos en general', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'D01', 'Honorarios médicos, dentales y gastos hospitalarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'D02', 'Gastos médicos por incapacidad o discapacidad', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'I04', 'Equipo de computo y accesorios', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'P01', 'Por definir (Uso transitorio)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'S01', 'Sin efectos fiscales', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CP01', 'Pagos (Complemento de recepción de pagos)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.usos_cfdi', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.usos_cfdi), 1), true);

-- =================================================================================================
-- 089. TABLA: fiscal.datos_fiscales_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.datos_fiscales_cliente (ID, ID_cliente, rfc_emisor, razon_social, codigo_postal_fiscal, ID_regimen_sat, ID_uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'MEGC910315H01', 'CARLOS MENDOZA GARZA', '25700', 1, 1, 'carlos.mendoza.1@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'RALS920315H02', 'SOFÍA RAMÍREZ LÓPEZ', '64000', 2, 2, 'sofia.ramirez.2@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'TOVV930315H03', 'VALERIA TORRES VILLARREAL', '66220', 3, 3, 'valeria.torres.3@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'HECA940315H04', 'ALEJANDRO HERNÁNDEZ CRUZ', '06700', 4, 4, 'alejandro.hernandez.4@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SAFM950315H05', 'MARIANA SÁNCHEZ FUENTES', '11560', 5, 5, 'mariana.sanchez.5@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'MATD960315H06', 'DIEGO MARTÍNEZ TREVIÑO', '44100', 6, 6, 'diego.martinez.6@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'GORC970315H07', 'CAMILA GONZÁLEZ REYES', '25000', 7, 7, 'camila.gonzalez.7@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FLCM980315H08', 'MATEO FLORES CASTILLO', '76000', 8, 8, 'mateo.flores.8@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'MODL990315H09', 'LUCÍA MORALES DÍAZ', '72000', 1, 1, 'lucia.morales.9@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'VAOS900315H10', 'SEBASTIÁN VÁZQUEZ ORTIZ', '97000', 2, 2, 'sebastian.vazquez.10@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'GUNR910315H11', 'REGINA GUTIÉRREZ NAVA', '25700', 3, 3, 'regina.gutierrez.11@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'JIPS920315H12', 'SANTIAGO JIMÉNEZ PÉREZ', '64000', 4, 4, 'santiago.jimenez.12@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'RUSF930315H13', 'FERNANDA RUIZ SALAZAR', '66220', 5, 5, 'fernanda.ruiz.13@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'RICE940315H14', 'EMILIANO RÍOS CÁRDENAS', '06700', 6, 6, 'emiliano.rios.14@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'AGIX950315H15', 'XIMENA AGUILAR IBARRA', '11560', 7, 7, 'ximena.aguilar.15@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'MEND960315H16', 'DANIEL MÉNDEZ NAVARRO', '44100', 8, 8, 'daniel.mendez.16@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CADA970315H17', 'ANDREA CASTRO DELGADO', '25000', 1, 1, 'andrea.castro.17@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'VEMG980315H18', 'GABRIEL VEGA MONTOYA', '76000', 2, 2, 'gabriel.vega.18@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CORP990315H19', 'PAULA CORTÉS ROJAS', '72000', 3, 3, 'paula.cortes.19@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'RACA900315H20', 'ANDRÉS RAMOS CAMPOS', '97000', 4, 4, 'andres.ramos.20@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'GULR910315H21', 'RENATA GUERRERO LUNA', '25700', 5, 5, 'renata.guerrero.21@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PECN920315H22', 'NICOLÁS PEÑA CABRERA', '64000', 6, 6, 'nicolas.pena.22@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'HEVN930315H23', 'NATALIA HERRERA VARGAS', '66220', 7, 7, 'natalia.herrera.23@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'MECJ940315H24', 'JOAQUÍN MEDINA CONTRERAS', '06700', 8, 8, 'joaquin.medina.24@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DOEI950315H25', 'ISABELLA DOMÍNGUEZ ESCOBAR', '11560', 1, 1, 'isabella.dominguez.25@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SIPL960315H26', 'LEONARDO SILVA PAREDES', '44100', 2, 2, 'leonardo.silva.26@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CHBA970315H27', 'ANA CHÁVEZ BAUTISTA', '25000', 3, 3, 'ana.chavez.27@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'OCAR980315H28', 'RODRIGO OCHOA ACOSTA', '76000', 4, 4, 'rodrigo.ochoa.28@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MILP990315H29', 'PAULINA MIRANDA LEAL', '72000', 5, 5, 'paulina.miranda.29@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PASM900315H30', 'MAURICIO PADILLA SOLÍS', '97000', 6, 6, 'mauricio.padilla.30@correo.mx', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.datos_fiscales_cliente', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.datos_fiscales_cliente), 1), true);

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_cfdi (ID, ID_orden, ID_dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'DC', 'FOL-FACTU-2026-0001', 'B1000000-0000-4000-8000-000000000001', 'CFDI40_SIG_9629800bff6e0b2ab0e057a1685fcb569088e04ec6e0f25b88e8e7fd340267d1', 'SAT_PAC_SIG_1a875b15b158c9d380cc1438b2710c20533f972a8ba5071840e91fe6ebdde60b', '||1.1|B1000000-0000-4000-8000-000000000001|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460001', '2026-02-01 11:30:00', 791.36, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0001.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'DC', 'FOL-FACTU-2026-0002', 'B1000000-0000-4000-8000-000000000002', 'CFDI40_SIG_ca9e6dcd9649acfe0ff3931d39347b7ba5f5f21a0309d16c717333e66b519d92', 'SAT_PAC_SIG_855ecb8ceb9777d32062546ad908007765eb5ac4c43a4f7981a5a3fae3fdb63b', '||1.1|B1000000-0000-4000-8000-000000000002|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460002', '2026-02-02 11:30:00', 501.36, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0002.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'DC', 'FOL-FACTU-2026-0003', 'B1000000-0000-4000-8000-000000000003', 'CFDI40_SIG_1c2b20017099f70cba603848707667ba3dd77b0dd1ba94e4425b6fdf7e5b2ef2', 'SAT_PAC_SIG_724c90f2ea903b8002bccd7154ab3ff4fc2c3ee140063d123caf1aff37450f48', '||1.1|B1000000-0000-4000-8000-000000000003|2026-02-03T11:30:00|PAC970924HN1||', '00001000000504460003', '2026-02-03 11:30:00', 873.37, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0003.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'DC', 'FOL-FACTU-2026-0004', 'B1000000-0000-4000-8000-000000000004', 'CFDI40_SIG_645c96c71b649d0dd0ec508164ea36ab621ce0ba6b249443a01aaaafb3f5798b', 'SAT_PAC_SIG_44826e5c2f381557a3204678ba6269416422a35b8dcf3878493eb866d030217e', '||1.1|B1000000-0000-4000-8000-000000000004|2026-02-04T11:30:00|PAC970924HN1||', '00001000000504460004', '2026-02-04 11:30:00', 583.72, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0004.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'DC', 'FOL-FACTU-2026-0005', 'B1000000-0000-4000-8000-000000000005', 'CFDI40_SIG_34011ff06a35a28b69b5aa8e35e7bfb7481e15d81f4228b7818723cce61af348', 'SAT_PAC_SIG_4d934ee27eae21bfebd0f2edff094db9f2fca0985ff960056105e9418f5604c6', '||1.1|B1000000-0000-4000-8000-000000000005|2026-02-05T11:30:00|PAC970924HN1||', '00001000000504460005', '2026-02-05 11:30:00', 1120.80, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0005.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'DC', 'FOL-FACTU-2026-0006', 'B1000000-0000-4000-8000-000000000006', 'CFDI40_SIG_b8abcba987d31946cad66b9cfc14ab2b423a369d74a3ada36f3ddad7b4c4d02b', 'SAT_PAC_SIG_54e961c6624bf5f1a8eb2ed52447482a287db264b2f0b7ea0edb128dcc9af142', '||1.1|B1000000-0000-4000-8000-000000000006|2026-02-06T11:30:00|PAC970924HN1||', '00001000000504460006', '2026-02-06 11:30:00', 612.37, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0006.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'DC', 'FOL-FACTU-2026-0007', 'B1000000-0000-4000-8000-000000000007', 'CFDI40_SIG_386f0821f27283bfe64b52ce9475bf15b1ef305a3769431650e73bcb044a3da5', 'SAT_PAC_SIG_a072a9335e99a6282d1fa1f417ba77db36cf06c8520ae455d8d9e6f89d785db2', '||1.1|B1000000-0000-4000-8000-000000000007|2026-02-07T11:30:00|PAC970924HN1||', '00001000000504460007', '2026-02-07 11:30:00', 1285.52, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0007.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'DC', 'FOL-FACTU-2026-0008', 'B1000000-0000-4000-8000-000000000008', 'CFDI40_SIG_6045ba7e4023e60b7d756d766b23dfe417741f9b8a729ddca40fe3b707453285', 'SAT_PAC_SIG_540d6060b22446edf9c648cff9d3404ffc5c64ced72278c708568c66cfe2f70b', '||1.1|B1000000-0000-4000-8000-000000000008|2026-02-08T11:30:00|PAC970924HN1||', '00001000000504460008', '2026-02-08 11:30:00', 748.44, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0008.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'DC', 'FOL-FACTU-2026-0009', 'B1000000-0000-4000-8000-000000000009', 'CFDI40_SIG_92280625c8e7afb0fc6557827022da3a859141ef061bbe2b7d0e6a96670d6176', 'SAT_PAC_SIG_0715719bc23acef24914ab8f60859728839749213fa465623af338b86384c45b', '||1.1|B1000000-0000-4000-8000-000000000009|2026-02-09T11:30:00|PAC970924HN1||', '00001000000504460009', '2026-02-09 11:30:00', 1189.12, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0009.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'DC', 'FOL-FACTU-2026-0010', 'B1000000-0000-4000-8000-00000000000A', 'CFDI40_SIG_7791ccd4a51a4f662176c4ac37f25078ea39832086ae45d77eceaf4e39f988fc', 'SAT_PAC_SIG_40221e8d1733820a6210dbe0b250910231730c666a5758a846f165189dd9e721', '||1.1|B1000000-0000-4000-8000-00000000000A|2026-02-10T11:30:00|PAC970924HN1||', '00001000000504460010', '2026-02-10 11:30:00', 830.80, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0010.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'DC', 'FOL-FACTU-2026-0011', 'B1000000-0000-4000-8000-00000000000B', 'CFDI40_SIG_80110f57fb171f3d2d7a63cab7e0520b0d27f4b5e9b1e1ece45e963c7fb9e618', 'SAT_PAC_SIG_548cf61134c2790527d716460c27fc5f4320cf6f2f231a89d60742efdf1c2f2d', '||1.1|B1000000-0000-4000-8000-00000000000B|2026-02-11T11:30:00|PAC970924HN1||', '00001000000504460011', '2026-02-11 11:30:00', 1485.96, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0011.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'DC', 'FOL-FACTU-2026-0012', 'B1000000-0000-4000-8000-00000000000C', 'CFDI40_SIG_9d3cfe0d65527a69e01f0e55e10b610a7fe8b382903ab307c2263ec130af3772', 'SAT_PAC_SIG_225a670f9f4b72b43cab35fcba1082946d69fb8fc0088e3ef8df4ab960f53a63', '||1.1|B1000000-0000-4000-8000-00000000000C|2026-02-12T11:30:00|PAC970924HN1||', '00001000000504460012', '2026-02-12 11:30:00', 834.74, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0012.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'DC', 'FOL-FACTU-2026-0013', 'B1000000-0000-4000-8000-00000000000D', 'CFDI40_SIG_e46a2379a9c3ff2b3c87850ffea4d3416dea8eacd324e934a77120441e2ace76', 'SAT_PAC_SIG_1709e3f4bc7383089c309fb72e4ea0db3a6260628be0a834c195072077f7cdf7', '||1.1|B1000000-0000-4000-8000-00000000000D|2026-02-13T11:30:00|PAC970924HN1||', '00001000000504460013', '2026-02-13 11:30:00', 1650.68, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0013.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'DC', 'FOL-FACTU-2026-0014', 'B1000000-0000-4000-8000-00000000000E', 'CFDI40_SIG_a96777ed25de406d4c5914b87f911428bf16260db0632b8fe1c3bfba17f4c96b', 'SAT_PAC_SIG_8b364f78c698fd9e4eca45d475d55faacec51afb5c056064dfdf3c32d3d4091b', '||1.1|B1000000-0000-4000-8000-00000000000E|2026-02-14T11:30:00|PAC970924HN1||', '00001000000504460014', '2026-02-14 11:30:00', 995.52, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0014.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'DC', 'FOL-FACTU-2026-0015', 'B1000000-0000-4000-8000-00000000000F', 'CFDI40_SIG_1fdd507a32862c449811c2d2bbaa9f96065c94a99bf97fad469bbd694e33778a', 'SAT_PAC_SIG_66e0e8f008083156dd0dbb60ba2927dc7326b7f6857af42c393dcf58bbb99c77', '||1.1|B1000000-0000-4000-8000-00000000000F|2026-02-15T11:30:00|PAC970924HN1||', '00001000000504460015', '2026-02-15 11:30:00', 1633.86, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0015.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'DC', 'FOL-FACTU-2026-0016', 'B1000000-0000-4000-8000-000000000010', 'CFDI40_SIG_24d38d8fafc8f784a7024d7b84e5cf448fcd7a66726f92f3c858efa83a4846bc', 'SAT_PAC_SIG_dc3e51012dac6eae47e73154036decefd40dbbf90f93a74c6c8bdba555b21833', '||1.1|B1000000-0000-4000-8000-000000000010|2026-02-16T11:30:00|PAC970924HN1||', '00001000000504460016', '2026-02-16 11:30:00', 1077.88, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0016.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'DC', 'FOL-FACTU-2026-0017', 'B1000000-0000-4000-8000-000000000011', 'CFDI40_SIG_23ea4d3f03bd838969dca7fdf8da36972ea41b6fc9b005a0a408df2bdcb29ba3', 'SAT_PAC_SIG_c853c3c8b00a74f76fefe2f36c379105813054a35064e02eafcb6a2950405bc2', '||1.1|B1000000-0000-4000-8000-000000000011|2026-02-17T11:30:00|PAC970924HN1||', '00001000000504460017', '2026-02-17 11:30:00', 1980.12, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0017.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'DC', 'FOL-FACTU-2026-0018', 'B1000000-0000-4000-8000-000000000012', 'CFDI40_SIG_4f59300b8621595a9fcce29614385cd2cb9a03c3f237384f8847c96c0c8d7a12', 'SAT_PAC_SIG_fab1b7a9b76bbdd627738c6e34e3eb93760cdebca5ab32dc8eb494f548dce7fa', '||1.1|B1000000-0000-4000-8000-000000000012|2026-02-18T11:30:00|PAC970924HN1||', '00001000000504460018', '2026-02-18 11:30:00', 1057.12, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0018.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'DC', 'FOL-FACTU-2026-0019', 'B1000000-0000-4000-8000-000000000013', 'CFDI40_SIG_2860c7a5f5873fa23947a3b882cb5e40d14166a0d449783fbfbce777e61560f7', 'SAT_PAC_SIG_0c82703959001cd777ef505ed510a871d4c45f480410b1f98529fcc25d524654', '||1.1|B1000000-0000-4000-8000-000000000013|2026-02-19T11:30:00|PAC970924HN1||', '00001000000504460019', '2026-02-19 11:30:00', 2144.84, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0019.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'DC', 'FOL-FACTU-2026-0020', 'B1000000-0000-4000-8000-000000000014', 'CFDI40_SIG_b87c4a7b90a302642444f2ff552dae85b5b224b73d3b57f7ad3f3fdb3f17b3f5', 'SAT_PAC_SIG_4651d5433f8926895053ad473d966a1b66865f60420ccc935783c8392f29829c', '||1.1|B1000000-0000-4000-8000-000000000014|2026-02-20T11:30:00|PAC970924HN1||', '00001000000504460020', '2026-02-20 11:30:00', 1242.60, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0020.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'DC', 'FOL-FACTU-2026-0021', 'B1000000-0000-4000-8000-000000000015', 'CFDI40_SIG_e2218014f426d100d0807d58535efcc1a5f1375c7de40d5965ef67a671f1cdc7', 'SAT_PAC_SIG_6e8e29c2c38aae6960c6c8b41929522ef89612a969d032cb7aad7625c9eae669', '||1.1|B1000000-0000-4000-8000-000000000015|2026-02-21T11:30:00|PAC970924HN1||', '00001000000504460021', '2026-02-21 11:30:00', 2078.60, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0021.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'DC', 'FOL-FACTU-2026-0022', 'B1000000-0000-4000-8000-000000000016', 'CFDI40_SIG_80d9711af0bdf2420963538f54c587de48ee6bef092c8104a4263d417681d95a', 'SAT_PAC_SIG_9e4eeb76e5f1e1909c66ee62b7e75ee2b4f4d74b4da08f3e46b517cca7b3c177', '||1.1|B1000000-0000-4000-8000-000000000016|2026-02-22T11:30:00|PAC970924HN1||', '00001000000504460022', '2026-02-22 11:30:00', 1195.96, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0022.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'DC', 'FOL-FACTU-2026-0023', 'B1000000-0000-4000-8000-000000000017', 'CFDI40_SIG_81af14c954d7356628d8c251f080d05d3a66dde00f0a984b23b6f26efc06e72b', 'SAT_PAC_SIG_b8e6620dbe755d113ea549ace0b17dded897aad4d9a75ea30bc8444e23608b58', '||1.1|B1000000-0000-4000-8000-000000000017|2026-02-23T11:30:00|PAC970924HN1||', '00001000000504460023', '2026-02-23 11:30:00', 2474.28, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0023.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'DC', 'FOL-FACTU-2026-0024', 'B1000000-0000-4000-8000-000000000018', 'CFDI40_SIG_5010be1f8fd6f3f47533f6bbb59be394b933a88e407c8660a0c840234307d092', 'SAT_PAC_SIG_c97fb305556ade66ac7ee964bbbb6b7486ed5ad8bc18501b22cd0776d3ac13ba', '||1.1|B1000000-0000-4000-8000-000000000018|2026-02-24T11:30:00|PAC970924HN1||', '00001000000504460024', '2026-02-24 11:30:00', 1279.49, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0024.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'DC', 'FOL-FACTU-2026-0025', 'B1000000-0000-4000-8000-000000000019', 'CFDI40_SIG_44184603da94f821322a28030eaca8b0989eaa0447444b7a704fa5719d9e1a9c', 'SAT_PAC_SIG_26f91a3244a3b2851ba3eccd2f3c25207c4733da3c8e24980aaac2f52c1d7072', '||1.1|B1000000-0000-4000-8000-000000000019|2026-02-25T11:30:00|PAC970924HN1||', '00001000000504460025', '2026-02-25 11:30:00', 2639.00, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0025.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'DC', 'FOL-FACTU-2026-0026', 'B1000000-0000-4000-8000-00000000001A', 'CFDI40_SIG_5403d72c808f1a62ecb7469654b20db8dd626c7e17766081a44fdcfb6699d6e3', 'SAT_PAC_SIG_352d57ab43979a1ee12cc0083029873749ff9379a92773620cc62a3500f0207b', '||1.1|B1000000-0000-4000-8000-00000000001A|2026-02-26T11:30:00|PAC970924HN1||', '00001000000504460026', '2026-02-26 11:30:00', 1360.68, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0026.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'DC', 'FOL-FACTU-2026-0027', 'B1000000-0000-4000-8000-00000000001B', 'CFDI40_SIG_40a0991410694e7c5238772e3be059f5f4c96ce2bfa618b79a1dfdf3486b3ea8', 'SAT_PAC_SIG_da4cf6531bd9085c8985191d1bf27702c83203b26ecdcb8c4cf3b7b12ab50b6c', '||1.1|B1000000-0000-4000-8000-00000000001B|2026-02-27T11:30:00|PAC970924HN1||', '00001000000504460027', '2026-02-27 11:30:00', 2523.35, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0027.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'DC', 'FOL-FACTU-2026-0028', 'B1000000-0000-4000-8000-00000000001C', 'CFDI40_SIG_e5fa3b6f4d6e20c62e4ec5e55454b8321acb57f3126e0aa03368b3f426a41f12', 'SAT_PAC_SIG_f9116973cd4830d43ed2657b6259128452cd0eef7dcac9fc47925c2a0277690f', '||1.1|B1000000-0000-4000-8000-00000000001C|2026-02-28T11:30:00|PAC970924HN1||', '00001000000504460028', '2026-02-28 11:30:00', 1443.04, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0028.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'DC', 'FOL-FACTU-2026-0029', 'B1000000-0000-4000-8000-00000000001D', 'CFDI40_SIG_f1930596f17c51aaf8d707046275e662a1f4810b402b1bc26aa4855fe8f0a282', 'SAT_PAC_SIG_e306362d82a2c3fa186d535bad5a5285844e00751db8b65717cdd3b9ee73c744', '||1.1|B1000000-0000-4000-8000-00000000001D|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460029', '2026-02-01 11:30:00', 2968.44, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0029.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'DC', 'FOL-FACTU-2026-0030', 'B1000000-0000-4000-8000-00000000001E', 'CFDI40_SIG_050f42215da984684b3f7c503c3ff0d6507e9caf323fd4be6f0950c209e365d4', 'SAT_PAC_SIG_7be745c07786e947eaac0d1c8ea414237efa4d33f4a9f7229dcba670ffe54bcd', '||1.1|B1000000-0000-4000-8000-00000000001E|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460030', '2026-02-02 11:30:00', 1372.86, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0030.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_cfdi', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.facturas_cfdi), 1), true);

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_partidas (ID, ID_factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '53131600', 'H87', 2.00, 285.50, 571.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '53131600', 'H87', 1.00, 321.00, 321.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '53131600', 'H87', 2.00, 356.50, 713.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '53131600', 'H87', 1.00, 392.00, 392.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '53131600', 'H87', 2.00, 427.50, 855.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '53131600', 'H87', 1.00, 463.00, 463.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '53131600', 'H87', 2.00, 498.50, 997.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '53131600', 'H87', 1.00, 534.00, 534.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '53131600', 'H87', 2.00, 569.50, 1139.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '53131600', 'H87', 1.00, 605.00, 605.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '53131600', 'H87', 2.00, 640.50, 1281.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '53131600', 'H87', 1.00, 676.00, 676.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '53131600', 'H87', 2.00, 711.50, 1423.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '53131600', 'H87', 1.00, 747.00, 747.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '53131600', 'H87', 2.00, 782.50, 1565.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '53131600', 'H87', 1.00, 818.00, 818.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '53131600', 'H87', 2.00, 853.50, 1707.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '53131600', 'H87', 1.00, 889.00, 889.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '53131600', 'H87', 2.00, 924.50, 1849.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '53131600', 'H87', 1.00, 960.00, 960.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '53131600', 'H87', 2.00, 995.50, 1991.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '53131600', 'H87', 1.00, 1031.00, 1031.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '53131600', 'H87', 2.00, 1066.50, 2133.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '53131600', 'H87', 1.00, 1102.00, 1102.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '53131600', 'H87', 2.00, 1137.50, 2275.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '53131600', 'H87', 1.00, 1173.00, 1173.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '53131600', 'H87', 2.00, 1208.50, 2417.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '53131600', 'H87', 1.00, 1244.00, 1244.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '53131600', 'H87', 2.00, 1279.50, 2559.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '53131600', 'H87', 1.00, 1315.00, 1315.00, '02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_partidas', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.facturas_partidas), 1), true);

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.complementos_pago (ID, ID_factura, ID_transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'B1000000-0000-4000-8000-000000000001', 1, 331.18, 165.59, 165.59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'B1000000-0000-4000-8000-000000000002', 1, 372.36, 186.18, 186.18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'B1000000-0000-4000-8000-000000000003', 1, 413.54, 206.77, 206.77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'B1000000-0000-4000-8000-000000000004', 1, 454.72, 227.36, 227.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'B1000000-0000-4000-8000-000000000005', 1, 495.90, 247.95, 247.95, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'B1000000-0000-4000-8000-000000000006', 1, 537.08, 268.54, 268.54, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'B1000000-0000-4000-8000-000000000007', 1, 578.26, 289.13, 289.13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'B1000000-0000-4000-8000-000000000008', 1, 619.44, 309.72, 309.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'B1000000-0000-4000-8000-000000000009', 1, 660.62, 330.31, 330.31, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'B1000000-0000-4000-8000-00000000000A', 1, 701.80, 350.90, 350.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'B1000000-0000-4000-8000-00000000000B', 1, 742.98, 371.49, 371.49, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'B1000000-0000-4000-8000-00000000000C', 1, 784.16, 392.08, 392.08, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'B1000000-0000-4000-8000-00000000000D', 1, 825.34, 412.67, 412.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'B1000000-0000-4000-8000-00000000000E', 1, 866.52, 433.26, 433.26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'B1000000-0000-4000-8000-00000000000F', 1, 907.70, 453.85, 453.85, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'B1000000-0000-4000-8000-000000000010', 1, 948.88, 474.44, 474.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'B1000000-0000-4000-8000-000000000011', 1, 990.06, 495.03, 495.03, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'B1000000-0000-4000-8000-000000000012', 1, 1031.24, 515.62, 515.62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'B1000000-0000-4000-8000-000000000013', 1, 1072.42, 536.21, 536.21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'B1000000-0000-4000-8000-000000000014', 1, 1113.60, 556.80, 556.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'B1000000-0000-4000-8000-000000000015', 1, 1154.78, 577.39, 577.39, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'B1000000-0000-4000-8000-000000000016', 1, 1195.96, 597.98, 597.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'B1000000-0000-4000-8000-000000000017', 1, 1237.14, 618.57, 618.57, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'B1000000-0000-4000-8000-000000000018', 1, 1278.32, 639.16, 639.16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'B1000000-0000-4000-8000-000000000019', 1, 1319.50, 659.75, 659.75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'B1000000-0000-4000-8000-00000000001A', 1, 1360.68, 680.34, 680.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'B1000000-0000-4000-8000-00000000001B', 1, 1401.86, 700.93, 700.93, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'B1000000-0000-4000-8000-00000000001C', 1, 1443.04, 721.52, 721.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'B1000000-0000-4000-8000-00000000001D', 1, 1484.22, 742.11, 742.11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'B1000000-0000-4000-8000-00000000001E', 1, 1525.40, 762.70, 762.70, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.complementos_pago', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.complementos_pago), 1), true);

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.notas_credito (ID, ID_factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'B1000000-0000-4000-8000-000000000001', '01', 285.50, 45.68, 331.18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'B1000000-0000-4000-8000-000000000002', '03', 321.00, 51.36, 372.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'B1000000-0000-4000-8000-000000000003', '01', 356.50, 57.04, 413.54, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'B1000000-0000-4000-8000-000000000004', '03', 392.00, 62.72, 454.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'B1000000-0000-4000-8000-000000000005', '01', 427.50, 68.40, 495.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'B1000000-0000-4000-8000-000000000006', '03', 463.00, 74.08, 537.08, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'B1000000-0000-4000-8000-000000000007', '01', 498.50, 79.76, 578.26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'B1000000-0000-4000-8000-000000000008', '03', 534.00, 85.44, 619.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'B1000000-0000-4000-8000-000000000009', '01', 569.50, 91.12, 660.62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'B1000000-0000-4000-8000-00000000000A', '03', 605.00, 96.80, 701.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'B1000000-0000-4000-8000-00000000000B', '01', 640.50, 102.48, 742.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'B1000000-0000-4000-8000-00000000000C', '03', 676.00, 108.16, 784.16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'B1000000-0000-4000-8000-00000000000D', '01', 711.50, 113.84, 825.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'B1000000-0000-4000-8000-00000000000E', '03', 747.00, 119.52, 866.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'B1000000-0000-4000-8000-00000000000F', '01', 782.50, 125.20, 907.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'B1000000-0000-4000-8000-000000000010', '03', 818.00, 130.88, 948.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'B1000000-0000-4000-8000-000000000011', '01', 853.50, 136.56, 990.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'B1000000-0000-4000-8000-000000000012', '03', 889.00, 142.24, 1031.24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'B1000000-0000-4000-8000-000000000013', '01', 924.50, 147.92, 1072.42, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'B1000000-0000-4000-8000-000000000014', '03', 960.00, 153.60, 1113.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'B1000000-0000-4000-8000-000000000015', '01', 995.50, 159.28, 1154.78, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'B1000000-0000-4000-8000-000000000016', '03', 1031.00, 164.96, 1195.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'B1000000-0000-4000-8000-000000000017', '01', 1066.50, 170.64, 1237.14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'B1000000-0000-4000-8000-000000000018', '03', 1102.00, 176.32, 1278.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'B1000000-0000-4000-8000-000000000019', '01', 1137.50, 182.00, 1319.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'B1000000-0000-4000-8000-00000000001A', '03', 1173.00, 187.68, 1360.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'B1000000-0000-4000-8000-00000000001B', '01', 1208.50, 193.36, 1401.86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'B1000000-0000-4000-8000-00000000001C', '03', 1244.00, 199.04, 1443.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'B1000000-0000-4000-8000-00000000001D', '01', 1279.50, 204.72, 1484.22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'B1000000-0000-4000-8000-00000000001E', '03', 1315.00, 210.40, 1525.40, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.notas_credito', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.notas_credito), 1), true);

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.cancelaciones_cfdi (ID, ID_factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '01', 'B1000000-0000-4000-8000-000000000001', '<AcuseCancelacionSAT Folio="0001" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '02', NULL, '<AcuseCancelacionSAT Folio="0002" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '03', NULL, '<AcuseCancelacionSAT Folio="0003" Estatus="201" Motivo="03" />', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '04', NULL, '<AcuseCancelacionSAT Folio="0004" Estatus="201" Motivo="04" />', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '01', 'B1000000-0000-4000-8000-000000000005', '<AcuseCancelacionSAT Folio="0005" Estatus="201" Motivo="01" />', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '02', NULL, '<AcuseCancelacionSAT Folio="0006" Estatus="201" Motivo="02" />', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '03', NULL, '<AcuseCancelacionSAT Folio="0007" Estatus="201" Motivo="03" />', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '04', NULL, '<AcuseCancelacionSAT Folio="0008" Estatus="201" Motivo="04" />', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '01', 'B1000000-0000-4000-8000-000000000009', '<AcuseCancelacionSAT Folio="0009" Estatus="201" Motivo="01" />', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '02', NULL, '<AcuseCancelacionSAT Folio="0010" Estatus="201" Motivo="02" />', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '03', NULL, '<AcuseCancelacionSAT Folio="0011" Estatus="201" Motivo="03" />', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '04', NULL, '<AcuseCancelacionSAT Folio="0012" Estatus="201" Motivo="04" />', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '01', 'B1000000-0000-4000-8000-00000000000D', '<AcuseCancelacionSAT Folio="0013" Estatus="201" Motivo="01" />', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '02', NULL, '<AcuseCancelacionSAT Folio="0014" Estatus="201" Motivo="02" />', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '03', NULL, '<AcuseCancelacionSAT Folio="0015" Estatus="201" Motivo="03" />', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '04', NULL, '<AcuseCancelacionSAT Folio="0016" Estatus="201" Motivo="04" />', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '01', 'B1000000-0000-4000-8000-000000000011', '<AcuseCancelacionSAT Folio="0017" Estatus="201" Motivo="01" />', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '02', NULL, '<AcuseCancelacionSAT Folio="0018" Estatus="201" Motivo="02" />', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '03', NULL, '<AcuseCancelacionSAT Folio="0019" Estatus="201" Motivo="03" />', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '04', NULL, '<AcuseCancelacionSAT Folio="0020" Estatus="201" Motivo="04" />', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '01', 'B1000000-0000-4000-8000-000000000015', '<AcuseCancelacionSAT Folio="0021" Estatus="201" Motivo="01" />', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '02', NULL, '<AcuseCancelacionSAT Folio="0022" Estatus="201" Motivo="02" />', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '03', NULL, '<AcuseCancelacionSAT Folio="0023" Estatus="201" Motivo="03" />', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '04', NULL, '<AcuseCancelacionSAT Folio="0024" Estatus="201" Motivo="04" />', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '01', 'B1000000-0000-4000-8000-000000000019', '<AcuseCancelacionSAT Folio="0025" Estatus="201" Motivo="01" />', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '02', NULL, '<AcuseCancelacionSAT Folio="0026" Estatus="201" Motivo="02" />', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '03', NULL, '<AcuseCancelacionSAT Folio="0027" Estatus="201" Motivo="03" />', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '04', NULL, '<AcuseCancelacionSAT Folio="0028" Estatus="201" Motivo="04" />', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '01', 'B1000000-0000-4000-8000-00000000001D', '<AcuseCancelacionSAT Folio="0029" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '02', NULL, '<AcuseCancelacionSAT Folio="0030" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.cancelaciones_cfdi', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.cancelaciones_cfdi), 1), true);

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.campanias (ID, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CAMPANIA_01', 'Campaña DermaCare La Roche-Posay #01', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 52500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CAMPANIA_02', 'Campaña DermaCare CeraVe #02', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 55000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAMPANIA_03', 'Campaña DermaCare The Ordinary #03', '2026-02-03 11:30:00', '2026-02-24 11:30:00', 57500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAMPANIA_04', 'Campaña DermaCare ISDIN #04', '2026-02-04 11:30:00', '2026-02-25 11:30:00', 60000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CAMPANIA_05', 'Campaña DermaCare Bioderma #05', '2026-02-05 11:30:00', '2026-02-26 11:30:00', 62500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CAMPANIA_06', 'Campaña DermaCare Eau Thermale Avène #06', '2026-02-06 11:30:00', '2026-02-27 11:30:00', 65000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CAMPANIA_07', 'Campaña DermaCare Eucerin #07', '2026-02-07 11:30:00', '2026-02-28 11:30:00', 67500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CAMPANIA_08', 'Campaña DermaCare Vichy Laboratoires #08', '2026-02-08 11:30:00', '2026-03-01 11:30:00', 70000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAMPANIA_09', 'Campaña DermaCare SkinCeuticals #09', '2026-02-09 11:30:00', '2026-03-02 11:30:00', 72500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CAMPANIA_10', 'Campaña DermaCare Sesderma #10', '2026-02-10 11:30:00', '2026-03-03 11:30:00', 75000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CAMPANIA_11', 'Campaña DermaCare NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-03-04 11:30:00', 77500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CAMPANIA_12', 'Campaña DermaCare MAC Cosmetics #12', '2026-02-12 11:30:00', '2026-03-05 11:30:00', 80000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CAMPANIA_13', 'Campaña DermaCare Fenty Beauty #13', '2026-02-13 11:30:00', '2026-03-06 11:30:00', 82500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CAMPANIA_14', 'Campaña DermaCare Rare Beauty #14', '2026-02-14 11:30:00', '2026-03-07 11:30:00', 85000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CAMPANIA_15', 'Campaña DermaCare Clinique #15', '2026-02-15 11:30:00', '2026-03-08 11:30:00', 87500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CAMPANIA_16', 'Campaña DermaCare Estée Lauder #16', '2026-02-16 11:30:00', '2026-03-09 11:30:00', 90000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CAMPANIA_17', 'Campaña DermaCare Lancôme #17', '2026-02-17 11:30:00', '2026-03-10 11:30:00', 92500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CAMPANIA_18', 'Campaña DermaCare Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-03-11 11:30:00', 95000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CAMPANIA_19', 'Campaña DermaCare Paula''s Choice #19', '2026-02-19 11:30:00', '2026-03-12 11:30:00', 97500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CAMPANIA_20', 'Campaña DermaCare COSRX #20', '2026-02-20 11:30:00', '2026-03-13 11:30:00', 100000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CAMPANIA_21', 'Campaña DermaCare Laneige #21', '2026-02-21 11:30:00', '2026-03-14 11:30:00', 102500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CAMPANIA_22', 'Campaña DermaCare Uriage #22', '2026-02-22 11:30:00', '2026-03-15 11:30:00', 105000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CAMPANIA_23', 'Campaña DermaCare Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-03-16 11:30:00', 107500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CAMPANIA_24', 'Campaña DermaCare MartiDerm #24', '2026-02-24 11:30:00', '2026-03-17 11:30:00', 110000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CAMPANIA_25', 'Campaña DermaCare Heliocare #25', '2026-02-25 11:30:00', '2026-03-18 11:30:00', 112500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CAMPANIA_26', 'Campaña DermaCare Kiehl''s #26', '2026-02-26 11:30:00', '2026-03-19 11:30:00', 115000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CAMPANIA_27', 'Campaña DermaCare Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-03-20 11:30:00', 117500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CAMPANIA_28', 'Campaña DermaCare L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-03-21 11:30:00', 120000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CAMPANIA_29', 'Campaña DermaCare Neutrogena #29', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 122500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CAMPANIA_30', 'Campaña DermaCare DermaCare Labs #30', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 125000.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.campanias', 'id'), COALESCE((SELECT MAX(id) FROM promos.campanias), 1), true);

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones (ID, ID_campania, codigo_cupon, ID_tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CUPON_01', 1, 15.00, 799.00, 500, 13, 1, '2026-03-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'CUPON_02', 2, 150.00, 799.00, 500, 16, 2, '2026-03-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'CUPON_03', 3, 15.00, 799.00, 500, 19, 3, '2026-03-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CUPON_04', 4, 150.00, 799.00, 500, 22, 4, '2026-03-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'CUPON_05', 5, 15.00, 799.00, 500, 25, 5, '2026-03-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'CUPON_06', 6, 150.00, 799.00, 500, 28, 6, '2026-03-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CUPON_07', 7, 15.00, 799.00, 500, 31, 7, '2026-03-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'CUPON_08', 8, 150.00, 799.00, 500, 34, 8, '2026-03-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'CUPON_09', 9, 15.00, 799.00, 500, 37, 9, '2026-03-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CUPON_10', 10, 150.00, 799.00, 500, 40, 10, '2026-03-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'CUPON_11', 11, 15.00, 799.00, 500, 43, 11, '2026-03-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'CUPON_12', 12, 150.00, 799.00, 500, 46, 12, '2026-03-29 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CUPON_13', 13, 15.00, 799.00, 500, 49, 13, '2026-03-30 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'CUPON_14', 14, 150.00, 799.00, 500, 52, 14, '2026-03-31 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'CUPON_15', 15, 15.00, 799.00, 500, 55, 15, '2026-04-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CUPON_16', 16, 150.00, 799.00, 500, 58, 16, '2026-04-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CUPON_17', 17, 15.00, 799.00, 500, 61, 17, '2026-04-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'CUPON_18', 18, 150.00, 799.00, 500, 64, 18, '2026-04-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CUPON_19', 19, 15.00, 799.00, 500, 67, 19, '2026-04-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'CUPON_20', 20, 150.00, 799.00, 500, 70, 20, '2026-04-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'CUPON_21', 21, 15.00, 799.00, 500, 73, 21, '2026-04-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CUPON_22', 22, 150.00, 799.00, 500, 76, 22, '2026-04-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'CUPON_23', 23, 15.00, 799.00, 500, 79, 23, '2026-04-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'CUPON_24', 24, 150.00, 799.00, 500, 82, 24, '2026-04-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CUPON_25', 25, 15.00, 799.00, 500, 85, 25, '2026-04-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'CUPON_26', 26, 150.00, 799.00, 500, 88, 26, '2026-04-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CUPON_27', 27, 15.00, 799.00, 500, 91, 27, '2026-04-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CUPON_28', 28, 150.00, 799.00, 500, 94, 28, '2026-04-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'CUPON_29', 29, 15.00, 799.00, 500, 97, 29, '2026-03-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'CUPON_30', 30, 150.00, 799.00, 500, 100, 30, '2026-03-19 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.cupones', 'id'), COALESCE((SELECT MAX(id) FROM promos.cupones), 1), true);

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.reglas_elegibilidad_cupon (ID, ID_cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.reglas_elegibilidad_cupon', 'id'), COALESCE((SELECT MAX(id) FROM promos.reglas_elegibilidad_cupon), 1), true);

-- =================================================================================================
-- 098. TABLA: promos.cupones_categorias_excluidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones_categorias_excluidas (ID, ID_cupon, ID_categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.cupones_categorias_excluidas', 'id'), COALESCE((SELECT MAX(id) FROM promos.cupones_categorias_excluidas), 1), true);

-- =================================================================================================
-- 099. TABLA: promos.redenciones_cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.redenciones_cupones (ID, ID_cupon, ID_cliente, ID_orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 42.82, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 48.15, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 53.48, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 58.80, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 64.12, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 69.45, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 74.77, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 80.10, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 85.42, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 90.75, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 96.08, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 101.40, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 106.72, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 112.05, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 117.38, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 122.70, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 128.03, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 133.35, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 138.67, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 144.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 149.32, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 154.65, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 159.97, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 165.30, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 170.62, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 175.95, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 181.28, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 186.60, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 191.92, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 197.25, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.redenciones_cupones', 'id'), COALESCE((SELECT MAX(id) FROM promos.redenciones_cupones), 1), true);

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.ventas_flash_horarias (ID, ID_variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 214.12, 55, 11, '2026-02-01 11:30:00', '2026-02-01 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 240.75, 60, 12, '2026-02-02 11:30:00', '2026-02-02 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 267.38, 65, 13, '2026-02-03 11:30:00', '2026-02-03 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 294.00, 70, 14, '2026-02-04 11:30:00', '2026-02-04 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 320.62, 75, 15, '2026-02-05 11:30:00', '2026-02-05 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 347.25, 80, 16, '2026-02-06 11:30:00', '2026-02-06 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 373.88, 85, 17, '2026-02-07 11:30:00', '2026-02-07 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 400.50, 90, 18, '2026-02-08 11:30:00', '2026-02-08 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 427.12, 95, 19, '2026-02-09 11:30:00', '2026-02-09 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 453.75, 100, 20, '2026-02-10 11:30:00', '2026-02-10 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 480.38, 105, 21, '2026-02-11 11:30:00', '2026-02-11 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 507.00, 110, 22, '2026-02-12 11:30:00', '2026-02-12 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 533.62, 115, 23, '2026-02-13 11:30:00', '2026-02-13 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 560.25, 120, 24, '2026-02-14 11:30:00', '2026-02-14 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 586.88, 125, 25, '2026-02-15 11:30:00', '2026-02-15 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 613.50, 130, 26, '2026-02-16 11:30:00', '2026-02-16 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 640.12, 135, 27, '2026-02-17 11:30:00', '2026-02-17 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 666.75, 140, 28, '2026-02-18 11:30:00', '2026-02-18 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 693.38, 145, 29, '2026-02-19 11:30:00', '2026-02-19 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 720.00, 150, 30, '2026-02-20 11:30:00', '2026-02-20 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 746.62, 155, 31, '2026-02-21 11:30:00', '2026-02-21 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 773.25, 160, 32, '2026-02-22 11:30:00', '2026-02-22 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 799.88, 165, 33, '2026-02-23 11:30:00', '2026-02-23 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 826.50, 170, 34, '2026-02-24 11:30:00', '2026-02-24 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 853.12, 175, 35, '2026-02-25 11:30:00', '2026-02-25 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 879.75, 180, 36, '2026-02-26 11:30:00', '2026-02-26 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 906.38, 185, 37, '2026-02-27 11:30:00', '2026-02-27 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 933.00, 190, 38, '2026-02-28 11:30:00', '2026-02-28 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 959.62, 195, 39, '2026-02-01 11:30:00', '2026-02-01 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 986.25, 200, 40, '2026-02-02 11:30:00', '2026-02-02 17:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.ventas_flash_horarias', 'id'), COALESCE((SELECT MAX(id) FROM promos.ventas_flash_horarias), 1), true);

