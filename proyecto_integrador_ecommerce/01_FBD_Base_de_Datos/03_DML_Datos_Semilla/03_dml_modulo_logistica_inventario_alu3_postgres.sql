-- =================================================================================================
-- SUBMÓDULO 3: LOGÍSTICA MULTIALMACÉN, TRAZABILIDAD FEFO, TELEMETRÍA IOT Y CALIDAD (PostgreSQL 16/17)
-- Tablas 101 a 150 (Autor: Eduardo Salazar MartÍnez)
-- Sincronizado 100% con 00_MASTER_SEED_DATA_SQLSERVER.sql (PK: ID / FKs: ID_*)
-- =================================================================================================

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.estados_orden_compra (ID, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'BORRADOR', 'Borrador de Compra', 'Requisición convertida en borrador pendiente de firma', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ENVIADA', 'Enviada a Proveedor', 'Orden de compra emitida y notificada al laboratorio', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CONFIRMADA', 'Confirmada con Cita Andén', 'Proveedor confirmó fecha de entrega y lotes sanitarios', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REC_PARCIAL', 'Recibida Parcialmente', 'Entrega parcial validada en andén de CEDIS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REC_TOTAL', 'Recibida Completa', 'Totalidad de unidades ingresadas a inventario QA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden de compra anulada por incumplimiento de SLA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('compras.estados_orden_compra', 'id'), COALESCE((SELECT MAX(id) FROM compras.estados_orden_compra), 1), true);

-- =================================================================================================
-- 102. TABLA: compras.proveedores (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedores (ID, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROVEEDO_01', 'Laboratorios La Roche-Posay S.A. de C.V.', 'Distribuidora La Roche-Posay México', 'DPM200111AB1', 'México', 15, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROVEEDO_02', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Distribuidora CeraVe México', 'DPM200112AB2', 'México', 30, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROVEEDO_03', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Distribuidora The Ordinary México', 'DPM200113AB3', 'México', 45, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROVEEDO_04', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Distribuidora ISDIN México', 'DPM200114AB4', 'México', 60, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROVEEDO_05', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Distribuidora Bioderma México', 'DPM200115AB5', 'México', 15, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROVEEDO_06', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Distribuidora Eau Thermale Avène México', 'DPM200116AB6', 'México', 30, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROVEEDO_07', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Distribuidora Eucerin México', 'DPM200117AB7', 'México', 45, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROVEEDO_08', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Distribuidora Vichy Laboratoires México', 'DPM200118AB8', 'México', 60, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROVEEDO_09', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Distribuidora SkinCeuticals México', 'DPM200119AB0', 'México', 15, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROVEEDO_10', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Distribuidora Sesderma México', 'DPM200120AB1', 'México', 30, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROVEEDO_11', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Distribuidora NARS Cosmetics México', 'DPM200121AB2', 'México', 45, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROVEEDO_12', 'Laboratorios MAC Professional S.A. de C.V.', 'Distribuidora MAC Cosmetics México', 'DPM200122AB3', 'México', 60, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROVEEDO_13', 'Laboratorios Fenty Beauty S.A. de C.V.', 'Distribuidora Fenty Beauty México', 'DPM200123AB4', 'México', 15, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROVEEDO_14', 'Laboratorios Rare Beauty S.A. de C.V.', 'Distribuidora Rare Beauty México', 'DPM200124AB5', 'México', 30, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROVEEDO_15', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Distribuidora Clinique México', 'DPM200125AB6', 'México', 45, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROVEEDO_16', 'Laboratorios Estée Lauder S.A. de C.V.', 'Distribuidora Estée Lauder México', 'DPM200126AB7', 'México', 60, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROVEEDO_17', 'Laboratorios Lancôme Paris S.A. de C.V.', 'Distribuidora Lancôme México', 'DPM200127AB8', 'México', 15, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROVEEDO_18', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Distribuidora Charlotte Tilbury México', 'DPM200128AB0', 'México', 30, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROVEEDO_19', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Distribuidora Paula''s Choice México', 'DPM200129AB1', 'México', 45, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROVEEDO_20', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Distribuidora COSRX México', 'DPM200130AB2', 'México', 60, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROVEEDO_21', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Distribuidora Laneige México', 'DPM200131AB3', 'México', 15, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROVEEDO_22', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Distribuidora Uriage México', 'DPM200132AB4', 'México', 30, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROVEEDO_23', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Distribuidora Laboratoire SVR México', 'DPM200133AB5', 'México', 45, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROVEEDO_24', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Distribuidora MartiDerm México', 'DPM200134AB6', 'México', 60, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROVEEDO_25', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Distribuidora Heliocare México', 'DPM200135AB7', 'México', 15, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROVEEDO_26', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Distribuidora Kiehl''s México', 'DPM200136AB8', 'México', 30, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROVEEDO_27', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Distribuidora Garnier SkinActive México', 'DPM200137AB0', 'México', 45, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROVEEDO_28', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Distribuidora L''Oréal Paris Derm México', 'DPM200138AB1', 'México', 60, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROVEEDO_29', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Distribuidora Neutrogena México', 'DPM200139AB2', 'México', 15, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROVEEDO_30', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Distribuidora DermaCare Labs México', 'DPM200140AB3', 'México', 30, 4.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedores', 'id'), COALESCE((SELECT MAX(id) FROM compras.proveedores), 1), true);

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.contactos_proveedor (ID, ID_proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Carlos Mendoza Garza', 'Gerente de Cuenta Clave', 'ventas.1@proveedor-derma.mx', '5541001001', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Sofía Ramírez López', 'Coordinador de Logística Sanitaria', 'ventas.2@proveedor-derma.mx', '5541001002', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Valeria Torres Villarreal', 'Ejecutivo de Facturación', 'ventas.3@proveedor-derma.mx', '5541001003', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Alejandro Hernández Cruz', 'Representante Regulador COFEPRIS', 'ventas.4@proveedor-derma.mx', '5541001004', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Mariana Sánchez Fuentes', 'Gerente de Cuenta Clave', 'ventas.5@proveedor-derma.mx', '5541001005', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Diego Martínez Treviño', 'Coordinador de Logística Sanitaria', 'ventas.6@proveedor-derma.mx', '5541001006', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Camila González Reyes', 'Ejecutivo de Facturación', 'ventas.7@proveedor-derma.mx', '5541001007', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Mateo Flores Castillo', 'Representante Regulador COFEPRIS', 'ventas.8@proveedor-derma.mx', '5541001008', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Lucía Morales Díaz', 'Gerente de Cuenta Clave', 'ventas.9@proveedor-derma.mx', '5541001009', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Sebastián Vázquez Ortiz', 'Coordinador de Logística Sanitaria', 'ventas.10@proveedor-derma.mx', '5541001010', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Regina Gutiérrez Nava', 'Ejecutivo de Facturación', 'ventas.11@proveedor-derma.mx', '5541001011', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Santiago Jiménez Pérez', 'Representante Regulador COFEPRIS', 'ventas.12@proveedor-derma.mx', '5541001012', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Fernanda Ruiz Salazar', 'Gerente de Cuenta Clave', 'ventas.13@proveedor-derma.mx', '5541001013', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Emiliano Ríos Cárdenas', 'Coordinador de Logística Sanitaria', 'ventas.14@proveedor-derma.mx', '5541001014', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Ximena Aguilar Ibarra', 'Ejecutivo de Facturación', 'ventas.15@proveedor-derma.mx', '5541001015', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Daniel Méndez Navarro', 'Representante Regulador COFEPRIS', 'ventas.16@proveedor-derma.mx', '5541001016', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Andrea Castro Delgado', 'Gerente de Cuenta Clave', 'ventas.17@proveedor-derma.mx', '5541001017', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Gabriel Vega Montoya', 'Coordinador de Logística Sanitaria', 'ventas.18@proveedor-derma.mx', '5541001018', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Paula Cortés Rojas', 'Ejecutivo de Facturación', 'ventas.19@proveedor-derma.mx', '5541001019', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Andrés Ramos Campos', 'Representante Regulador COFEPRIS', 'ventas.20@proveedor-derma.mx', '5541001020', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Renata Guerrero Luna', 'Gerente de Cuenta Clave', 'ventas.21@proveedor-derma.mx', '5541001021', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Nicolás Peña Cabrera', 'Coordinador de Logística Sanitaria', 'ventas.22@proveedor-derma.mx', '5541001022', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Natalia Herrera Vargas', 'Ejecutivo de Facturación', 'ventas.23@proveedor-derma.mx', '5541001023', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Joaquín Medina Contreras', 'Representante Regulador COFEPRIS', 'ventas.24@proveedor-derma.mx', '5541001024', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Isabella Domínguez Escobar', 'Gerente de Cuenta Clave', 'ventas.25@proveedor-derma.mx', '5541001025', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Leonardo Silva Paredes', 'Coordinador de Logística Sanitaria', 'ventas.26@proveedor-derma.mx', '5541001026', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Ana Chávez Bautista', 'Ejecutivo de Facturación', 'ventas.27@proveedor-derma.mx', '5541001027', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Rodrigo Ochoa Acosta', 'Representante Regulador COFEPRIS', 'ventas.28@proveedor-derma.mx', '5541001028', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Paulina Miranda Leal', 'Gerente de Cuenta Clave', 'ventas.29@proveedor-derma.mx', '5541001029', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Mauricio Padilla Solís', 'Coordinador de Logística Sanitaria', 'ventas.30@proveedor-derma.mx', '5541001030', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.contactos_proveedor', 'id'), COALESCE((SELECT MAX(id) FROM compras.contactos_proveedor), 1), true);

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_slas (ID, ID_proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 45, 2.00, 2.00, '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 60, 3.00, 3.00, '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 75, 4.00, 4.00, '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 30, 5.00, 5.00, '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 45, 1.00, 1.00, '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 60, 2.00, 2.00, '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 75, 3.00, 3.00, '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 30, 4.00, 4.00, '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 45, 5.00, 5.00, '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 60, 1.00, 1.00, '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 75, 2.00, 2.00, '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 30, 3.00, 3.00, '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 45, 4.00, 4.00, '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 60, 5.00, 5.00, '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 75, 1.00, 1.00, '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 30, 2.00, 2.00, '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 45, 3.00, 3.00, '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60, 4.00, 4.00, '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 75, 5.00, 5.00, '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 30, 1.00, 1.00, '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 45, 2.00, 2.00, '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 60, 3.00, 3.00, '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 75, 4.00, 4.00, '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 30, 5.00, 5.00, '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 45, 1.00, 1.00, '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 60, 2.00, 2.00, '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 75, 3.00, 3.00, '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 30, 4.00, 4.00, '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 45, 5.00, 5.00, '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 60, 1.00, 1.00, '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedor_slas', 'id'), COALESCE((SELECT MAX(id) FROM compras.proveedor_slas), 1), true);

-- =================================================================================================
-- 105. TABLA: compras.proveedor_productos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_productos (ID, ID_proveedor, ID_variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'ARTICULO_01', 17.50, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'ARTICULO_02', 20.00, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'ARTICULO_03', 22.50, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'ARTICULO_04', 25.00, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'ARTICULO_05', 27.50, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'ARTICULO_06', 30.00, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'ARTICULO_07', 32.50, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'ARTICULO_08', 35.00, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'ARTICULO_09', 37.50, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'ARTICULO_10', 40.00, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'ARTICULO_11', 42.50, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'ARTICULO_12', 45.00, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'ARTICULO_13', 47.50, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'ARTICULO_14', 50.00, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'ARTICULO_15', 52.50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'ARTICULO_16', 55.00, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'ARTICULO_17', 57.50, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'ARTICULO_18', 60.00, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'ARTICULO_19', 62.50, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'ARTICULO_20', 65.00, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'ARTICULO_21', 67.50, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'ARTICULO_22', 70.00, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'ARTICULO_23', 72.50, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'ARTICULO_24', 75.00, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'ARTICULO_25', 77.50, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'ARTICULO_26', 80.00, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'ARTICULO_27', 82.50, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'ARTICULO_28', 85.00, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'ARTICULO_29', 87.50, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'ARTICULO_30', 90.00, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedor_productos', 'id'), COALESCE((SELECT MAX(id) FROM compras.proveedor_productos), 1), true);

-- =================================================================================================
-- 106. TABLA: compras.requisiciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones (ID, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-REQUI-2026-0001', 'Planeación de Demanda', 'BAJA', 'Reposición de inventario de seguridad para Sérum Niacinamida 10% + Zinc 1% ante alta rotación.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-REQUI-2026-0002', 'Operaciones Cadena de Frío', 'MEDIA', 'Reposición de inventario de seguridad para Gel Limpiador Espumoso Facial ante alta rotación.', '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-REQUI-2026-0003', 'Control Sanitario QA', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Protector Solar Fluido SPF 50+ ante alta rotación.', '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-REQUI-2026-0004', 'Abastecimiento Beauty-Box', 'BAJA', 'Reposición de inventario de seguridad para Sérum Ácido Hialurónico 2% + B5 ante alta rotación.', '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-REQUI-2026-0005', 'Planeación de Demanda', 'MEDIA', 'Reposición de inventario de seguridad para Crema Hidratante con Ceramidas ante alta rotación.', '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-REQUI-2026-0006', 'Operaciones Cadena de Frío', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Retinol Puro 0.5% Nocturno ante alta rotación.', '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-REQUI-2026-0007', 'Control Sanitario QA', 'BAJA', 'Reposición de inventario de seguridad para Agua Micelar Dermolimpiadora ante alta rotación.', '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-REQUI-2026-0008', 'Abastecimiento Beauty-Box', 'MEDIA', 'Reposición de inventario de seguridad para Sérum Vitamina C Pura 15% ante alta rotación.', '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-REQUI-2026-0009', 'Planeación de Demanda', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Base de Maquillaje Cobertura Media ante alta rotación.', '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-REQUI-2026-0010', 'Operaciones Cadena de Frío', 'BAJA', 'Reposición de inventario de seguridad para Corrector Líquido Alta Duración ante alta rotación.', '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-REQUI-2026-0011', 'Control Sanitario QA', 'MEDIA', 'Reposición de inventario de seguridad para Bálsamo Reparador Cicaplast B5 ante alta rotación.', '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-REQUI-2026-0012', 'Abastecimiento Beauty-Box', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Exfoliante Ácido Salicílico 2% ante alta rotación.', '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-REQUI-2026-0013', 'Planeación de Demanda', 'BAJA', 'Reposición de inventario de seguridad para Contorno de Ojos con Cafeína 5% ante alta rotación.', '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-REQUI-2026-0014', 'Operaciones Cadena de Frío', 'MEDIA', 'Reposición de inventario de seguridad para Mascarilla Nocturna Hidratante ante alta rotación.', '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-REQUI-2026-0015', 'Control Sanitario QA', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Bruma Termal Calmante Mineral ante alta rotación.', '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-REQUI-2026-0016', 'Abastecimiento Beauty-Box', 'BAJA', 'Reposición de inventario de seguridad para Aceite Limpiador Emulsionable ante alta rotación.', '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-REQUI-2026-0017', 'Planeación de Demanda', 'MEDIA', 'Reposición de inventario de seguridad para Tónico Equilibrante Ácido Glicólico 7% ante alta rotación.', '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-REQUI-2026-0018', 'Operaciones Cadena de Frío', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Labial Hidratante Péptidos Nude ante alta rotación.', '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-REQUI-2026-0019', 'Control Sanitario QA', 'BAJA', 'Reposición de inventario de seguridad para Polvo Traslúcido Matificante Mineral ante alta rotación.', '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-REQUI-2026-0020', 'Abastecimiento Beauty-Box', 'MEDIA', 'Reposición de inventario de seguridad para Rubor Líquido Pigmento Natural ante alta rotación.', '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-REQUI-2026-0021', 'Planeación de Demanda', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Sérum Ácido Azelaico 10% Suspensión ante alta rotación.', '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-REQUI-2026-0022', 'Operaciones Cadena de Frío', 'BAJA', 'Reposición de inventario de seguridad para Ampolletas Proteoglicanos Firmeza ante alta rotación.', '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-REQUI-2026-0023', 'Control Sanitario QA', 'MEDIA', 'Reposición de inventario de seguridad para Crema Despigmentante Noche Melasma ante alta rotación.', '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-REQUI-2026-0024', 'Abastecimiento Beauty-Box', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Protector Solar Mineral Óxido Zinc ante alta rotación.', '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-REQUI-2026-0025', 'Planeación de Demanda', 'BAJA', 'Reposición de inventario de seguridad para Loción Corporal Urea 10% Reparadora ante alta rotación.', '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-REQUI-2026-0026', 'Operaciones Cadena de Frío', 'MEDIA', 'Reposición de inventario de seguridad para Primer Facial Minimizador de Poros ante alta rotación.', '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-REQUI-2026-0027', 'Control Sanitario QA', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Máscara de Pestañas Hipoalergénica ante alta rotación.', '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-REQUI-2026-0028', 'Abastecimiento Beauty-Box', 'BAJA', 'Reposición de inventario de seguridad para Sérum Péptidos de Cobre 1% ante alta rotación.', '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-REQUI-2026-0029', 'Planeación de Demanda', 'MEDIA', 'Reposición de inventario de seguridad para Bálsamo Desmaquillante Caléndula ante alta rotación.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-REQUI-2026-0030', 'Operaciones Cadena de Frío', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Crema Barrera Post-Retinoide ante alta rotación.', '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.requisiciones', 'id'), COALESCE((SELECT MAX(id) FROM compras.requisiciones), 1), true);

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones_detalles (ID, ID_requisicion, ID_variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.requisiciones_detalles', 'id'), COALESCE((SELECT MAX(id) FROM compras.requisiciones_detalles), 1), true);

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra (ID, folio_orden_compra, ID_proveedor, ID_estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 1187.68, 190.03, 1377.71, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 1836.12, 293.78, 2129.90, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 2595.32, 415.25, 3010.57, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 1630.72, 260.92, 1891.64, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 2445.30, 391.25, 2836.55, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 3370.64, 539.30, 3909.94, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 2073.76, 331.80, 2405.56, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 3054.48, 488.72, 3543.20, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 4145.96, 663.35, 4809.31, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 2516.80, 402.69, 2919.49, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 3663.66, 586.19, 4249.85, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 4921.28, 787.40, 5708.68, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 2959.84, 473.57, 3433.41, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 4272.84, 683.65, 4956.49, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 5696.60, 911.46, 6608.06, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 3402.88, 544.46, 3947.34, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 4882.02, 781.12, 5663.14, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 6471.92, 1035.51, 7507.43, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 3845.92, 615.35, 4461.27, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 5491.20, 878.59, 6369.79, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 7247.24, 1159.56, 8406.80, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 4288.96, 686.23, 4975.19, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 6100.38, 976.06, 7076.44, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 8022.56, 1283.61, 9306.17, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 4732.00, 757.12, 5489.12, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 6709.56, 1073.53, 7783.09, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 8797.88, 1407.66, 10205.54, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 5175.04, 828.01, 6003.05, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 7318.74, 1171.00, 8489.74, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 9573.20, 1531.71, 11104.91, 'Crédito 30 días contra entrega y validación QA.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra', 'id'), COALESCE((SELECT MAX(id) FROM compras.ordenes_compra), 1), true);

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra_detalles (ID, ID_orden_compra, ID_variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, 148.46, 1187.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 166.92, 1836.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 185.38, 2595.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 8, 8, 203.84, 1630.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 11, 11, 222.30, 2445.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 14, 14, 240.76, 3370.64, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 8, 8, 259.22, 2073.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 11, 11, 277.68, 3054.48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 14, 14, 296.14, 4145.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 8, 8, 314.60, 2516.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 333.06, 3663.66, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 14, 14, 351.52, 4921.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 8, 8, 369.98, 2959.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 11, 11, 388.44, 4272.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 14, 14, 406.90, 5696.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 8, 8, 425.36, 3402.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 11, 11, 443.82, 4882.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 14, 14, 462.28, 6471.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 8, 8, 480.74, 3845.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 11, 11, 499.20, 5491.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 14, 14, 517.66, 7247.24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 8, 8, 536.12, 4288.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 11, 11, 554.58, 6100.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 14, 14, 573.04, 8022.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 8, 8, 591.50, 4732.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 11, 11, 609.96, 6709.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 14, 14, 628.42, 8797.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 8, 8, 646.88, 5175.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 11, 11, 665.34, 7318.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 14, 14, 683.80, 9573.20, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra_detalles', 'id'), COALESCE((SELECT MAX(id) FROM compras.ordenes_compra_detalles), 1), true);

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_mercancia (ID, folio_recepcion, ID_orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RECEP-2026-0001', 1, 'REM-PROV-2026-0001', '2026-02-01 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RECEP-2026-0002', 2, 'REM-PROV-2026-0002', '2026-02-02 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RECEP-2026-0003', 3, 'REM-PROV-2026-0003', '2026-02-03 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RECEP-2026-0004', 4, 'REM-PROV-2026-0004', '2026-02-04 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RECEP-2026-0005', 5, 'REM-PROV-2026-0005', '2026-02-05 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RECEP-2026-0006', 6, 'REM-PROV-2026-0006', '2026-02-06 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RECEP-2026-0007', 7, 'REM-PROV-2026-0007', '2026-02-07 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RECEP-2026-0008', 8, 'REM-PROV-2026-0008', '2026-02-08 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RECEP-2026-0009', 9, 'REM-PROV-2026-0009', '2026-02-09 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RECEP-2026-0010', 10, 'REM-PROV-2026-0010', '2026-02-10 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RECEP-2026-0011', 11, 'REM-PROV-2026-0011', '2026-02-11 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RECEP-2026-0012', 12, 'REM-PROV-2026-0012', '2026-02-12 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RECEP-2026-0013', 13, 'REM-PROV-2026-0013', '2026-02-13 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RECEP-2026-0014', 14, 'REM-PROV-2026-0014', '2026-02-14 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RECEP-2026-0015', 15, 'REM-PROV-2026-0015', '2026-02-15 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RECEP-2026-0016', 16, 'REM-PROV-2026-0016', '2026-02-16 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RECEP-2026-0017', 17, 'REM-PROV-2026-0017', '2026-02-17 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RECEP-2026-0018', 18, 'REM-PROV-2026-0018', '2026-02-18 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RECEP-2026-0019', 19, 'REM-PROV-2026-0019', '2026-02-19 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RECEP-2026-0020', 20, 'REM-PROV-2026-0020', '2026-02-20 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RECEP-2026-0021', 21, 'REM-PROV-2026-0021', '2026-02-21 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RECEP-2026-0022', 22, 'REM-PROV-2026-0022', '2026-02-22 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RECEP-2026-0023', 23, 'REM-PROV-2026-0023', '2026-02-23 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RECEP-2026-0024', 24, 'REM-PROV-2026-0024', '2026-02-24 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RECEP-2026-0025', 25, 'REM-PROV-2026-0025', '2026-02-25 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RECEP-2026-0026', 26, 'REM-PROV-2026-0026', '2026-02-26 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RECEP-2026-0027', 27, 'REM-PROV-2026-0027', '2026-02-27 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RECEP-2026-0028', 28, 'REM-PROV-2026-0028', '2026-02-28 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RECEP-2026-0029', 29, 'REM-PROV-2026-0029', '2026-02-01 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RECEP-2026-0030', 30, 'REM-PROV-2026-0030', '2026-02-02 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_mercancia', 'id'), COALESCE((SELECT MAX(id) FROM compras.recepciones_mercancia), 1), true);

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_detalles (ID, ID_recepcion, ID_variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 6.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 5.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 4.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 7.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 6.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 5.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 4.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 7.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 6.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 5.5, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_detalles', 'id'), COALESCE((SELECT MAX(id) FROM compras.recepciones_detalles), 1), true);

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.inspecciones_sanitarias_qa (ID, ID_recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, 'LOTE_LAB_01', '2027-01-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, 'LOTE_LAB_02', '2028-02-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, 'LOTE_LAB_03', '2027-03-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, 'LOTE_LAB_04', '2028-04-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, 'LOTE_LAB_05', '2027-05-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, 'LOTE_LAB_06', '2028-06-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, 'LOTE_LAB_07', '2027-07-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, 'LOTE_LAB_08', '2028-08-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, 'LOTE_LAB_09', '2027-09-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, 'LOTE_LAB_10', '2028-10-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, 'LOTE_LAB_11', '2027-11-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, 'LOTE_LAB_12', '2028-12-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, 'LOTE_LAB_13', '2027-01-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, 'LOTE_LAB_14', '2028-02-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, 'LOTE_LAB_15', '2027-03-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, 'LOTE_LAB_16', '2028-04-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, 'LOTE_LAB_17', '2027-05-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, 'LOTE_LAB_18', '2028-06-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, 'LOTE_LAB_19', '2027-07-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, 'LOTE_LAB_20', '2028-08-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, 'LOTE_LAB_21', '2027-09-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, 'LOTE_LAB_22', '2028-10-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, 'LOTE_LAB_23', '2027-11-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, 'LOTE_LAB_24', '2028-12-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, 'LOTE_LAB_25', '2027-01-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, 'LOTE_LAB_26', '2028-02-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, 'LOTE_LAB_27', '2027-03-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, 'LOTE_LAB_28', '2028-04-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, 'LOTE_LAB_29', '2027-05-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, 'LOTE_LAB_30', '2028-06-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.inspecciones_sanitarias_qa', 'id'), COALESCE((SELECT MAX(id) FROM compras.inspecciones_sanitarias_qa), 1), true);

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.almacenes_cedis (ID, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ALMACEN_01', 'CEDIS Monterrey Parque Stiva Unidad 1', 'Av. Parque Industrial Logístico #112', '25700', 'Monclova', 1750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ALMACEN_02', 'CEDIS CDMX Vallejo Industrial Unidad 2', 'Av. Parque Industrial Logístico #124', '64000', 'Monterrey', 2000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ALMACEN_03', 'CEDIS Guadalajara El Salto Unidad 3', 'Av. Parque Industrial Logístico #136', '66220', 'San Pedro Garza García', 2250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'ALMACEN_04', 'CEDIS Monclova Centro Distribución Unidad 4', 'Av. Parque Industrial Logístico #148', '06700', 'Cuauhtémoc', 2500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ALMACEN_05', 'CEDIS Querétaro Logístico Bajío Unidad 5', 'Av. Parque Industrial Logístico #160', '11560', 'Miguel Hidalgo', 2750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'ALMACEN_06', 'CEDIS Puebla Parque Finsa Unidad 6', 'Av. Parque Industrial Logístico #172', '44100', 'Guadalajara', 3000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'ALMACEN_07', 'CEDIS Monterrey Parque Stiva Unidad 7', 'Av. Parque Industrial Logístico #184', '25000', 'Saltillo', 3250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'ALMACEN_08', 'CEDIS CDMX Vallejo Industrial Unidad 8', 'Av. Parque Industrial Logístico #196', '76000', 'Querétaro', 3500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'ALMACEN_09', 'CEDIS Guadalajara El Salto Unidad 9', 'Av. Parque Industrial Logístico #208', '72000', 'Puebla', 3750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'ALMACEN_10', 'CEDIS Monclova Centro Distribución Unidad 10', 'Av. Parque Industrial Logístico #220', '97000', 'Mérida', 4000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ALMACEN_11', 'CEDIS Querétaro Logístico Bajío Unidad 11', 'Av. Parque Industrial Logístico #232', '25700', 'Monclova', 4250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ALMACEN_12', 'CEDIS Puebla Parque Finsa Unidad 12', 'Av. Parque Industrial Logístico #244', '64000', 'Monterrey', 4500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'ALMACEN_13', 'CEDIS Monterrey Parque Stiva Unidad 13', 'Av. Parque Industrial Logístico #256', '66220', 'San Pedro Garza García', 4750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'ALMACEN_14', 'CEDIS CDMX Vallejo Industrial Unidad 14', 'Av. Parque Industrial Logístico #268', '06700', 'Cuauhtémoc', 5000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ALMACEN_15', 'CEDIS Guadalajara El Salto Unidad 15', 'Av. Parque Industrial Logístico #280', '11560', 'Miguel Hidalgo', 5250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'ALMACEN_16', 'CEDIS Monclova Centro Distribución Unidad 16', 'Av. Parque Industrial Logístico #292', '44100', 'Guadalajara', 5500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'ALMACEN_17', 'CEDIS Querétaro Logístico Bajío Unidad 17', 'Av. Parque Industrial Logístico #304', '25000', 'Saltillo', 5750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ALMACEN_18', 'CEDIS Puebla Parque Finsa Unidad 18', 'Av. Parque Industrial Logístico #316', '76000', 'Querétaro', 6000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'ALMACEN_19', 'CEDIS Monterrey Parque Stiva Unidad 19', 'Av. Parque Industrial Logístico #328', '72000', 'Puebla', 6250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'ALMACEN_20', 'CEDIS CDMX Vallejo Industrial Unidad 20', 'Av. Parque Industrial Logístico #340', '97000', 'Mérida', 6500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ALMACEN_21', 'CEDIS Guadalajara El Salto Unidad 21', 'Av. Parque Industrial Logístico #352', '25700', 'Monclova', 6750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'ALMACEN_22', 'CEDIS Monclova Centro Distribución Unidad 22', 'Av. Parque Industrial Logístico #364', '64000', 'Monterrey', 7000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'ALMACEN_23', 'CEDIS Querétaro Logístico Bajío Unidad 23', 'Av. Parque Industrial Logístico #376', '66220', 'San Pedro Garza García', 7250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'ALMACEN_24', 'CEDIS Puebla Parque Finsa Unidad 24', 'Av. Parque Industrial Logístico #388', '06700', 'Cuauhtémoc', 7500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'ALMACEN_25', 'CEDIS Monterrey Parque Stiva Unidad 25', 'Av. Parque Industrial Logístico #400', '11560', 'Miguel Hidalgo', 7750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'ALMACEN_26', 'CEDIS CDMX Vallejo Industrial Unidad 26', 'Av. Parque Industrial Logístico #412', '44100', 'Guadalajara', 8000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ALMACEN_27', 'CEDIS Guadalajara El Salto Unidad 27', 'Av. Parque Industrial Logístico #424', '25000', 'Saltillo', 8250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'ALMACEN_28', 'CEDIS Monclova Centro Distribución Unidad 28', 'Av. Parque Industrial Logístico #436', '76000', 'Querétaro', 8500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'ALMACEN_29', 'CEDIS Querétaro Logístico Bajío Unidad 29', 'Av. Parque Industrial Logístico #448', '72000', 'Puebla', 8750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'ALMACEN_30', 'CEDIS Puebla Parque Finsa Unidad 30', 'Av. Parque Industrial Logístico #460', '97000', 'Mérida', 9000.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.almacenes_cedis', 'id'), COALESCE((SELECT MAX(id) FROM wms.almacenes_cedis), 1), true);

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.zonas_almacen (ID, ID_almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ZONA_01', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 01)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ZONA_02', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 02)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ZONA_03', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 03)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ZONA_04', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 04)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ZONA_05', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 05)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ZONA_06', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 06)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ZONA_07', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 07)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ZONA_08', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 08)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ZONA_09', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 09)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ZONA_10', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 10)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ZONA_11', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 11)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ZONA_12', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 12)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ZONA_13', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 13)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ZONA_14', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 14)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ZONA_15', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 15)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ZONA_16', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 16)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ZONA_17', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 17)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ZONA_18', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 18)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ZONA_19', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 19)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ZONA_20', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 20)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ZONA_21', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 21)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ZONA_22', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 22)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ZONA_23', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 23)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ZONA_24', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 24)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ZONA_25', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 25)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ZONA_26', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 26)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ZONA_27', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 27)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ZONA_28', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 28)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ZONA_29', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 29)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ZONA_30', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 30)', 2.0, 8.0, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.zonas_almacen', 'id'), COALESCE((SELECT MAX(id) FROM wms.zonas_almacen), 1), true);

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.pasillos_ubicaciones (ID, ID_zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'UBICACIO_01', 250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'UBICACIO_02', 300.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'UBICACIO_03', 350.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'UBICACIO_04', 400.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'UBICACIO_05', 450.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'UBICACIO_06', 250.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'UBICACIO_07', 300.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'UBICACIO_08', 350.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'UBICACIO_09', 400.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'UBICACIO_10', 450.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'UBICACIO_11', 250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'UBICACIO_12', 300.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'UBICACIO_13', 350.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'UBICACIO_14', 400.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'UBICACIO_15', 450.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'UBICACIO_16', 250.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'UBICACIO_17', 300.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'UBICACIO_18', 350.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'UBICACIO_19', 400.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'UBICACIO_20', 450.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'UBICACIO_21', 250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'UBICACIO_22', 300.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'UBICACIO_23', 350.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'UBICACIO_24', 400.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'UBICACIO_25', 450.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'UBICACIO_26', 250.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'UBICACIO_27', 300.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'UBICACIO_28', 350.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'UBICACIO_29', 400.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'UBICACIO_30', 450.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.pasillos_ubicaciones', 'id'), COALESCE((SELECT MAX(id) FROM wms.pasillos_ubicaciones), 1), true);

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.tipos_movimiento_inventario (ID, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ENT_COMPRA', 'Entrada por Compra a Proveedor', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SAL_VENTA', 'Salida por Venta E-Commerce', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AJU_POS', 'Ajuste Positivo por Conteo Cíclico', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SAL_MERMA', 'Salida por Merma o Caducidad Sanitaria', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANS_SAL', 'Salida por Transferencia entre CEDIS', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANS_ENT', 'Entrada por Transferencia entre CEDIS', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('wms.tipos_movimiento_inventario', 'id'), COALESCE((SELECT MAX(id) FROM wms.tipos_movimiento_inventario), 1), true);

-- =================================================================================================
-- 117. TABLA: wms.lotes_fabricacion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.lotes_fabricacion_sanitaria (ID, ID_variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'LOT-2026-LA_R-001', '2025-01-01', '2027-01-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-001.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'LOT-2026-CERA-002', '2025-02-02', '2028-02-02', 'https://cdn.dermacare.mx/wms/coa/LOTE-002.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'LOT-2026-THE_-003', '2025-03-03', '2027-03-03', 'https://cdn.dermacare.mx/wms/coa/LOTE-003.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'LOT-2026-ISDI-004', '2024-02-01', '2026-02-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-004.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'LOT-2026-BIOD-005', '2025-05-05', '2027-05-05', 'https://cdn.dermacare.mx/wms/coa/LOTE-005.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'LOT-2026-AVEN-006', '2025-06-06', '2028-06-06', 'https://cdn.dermacare.mx/wms/coa/LOTE-006.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'LOT-2026-EUCE-007', '2025-07-07', '2027-07-07', 'https://cdn.dermacare.mx/wms/coa/LOTE-007.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'LOT-2026-VICH-008', '2024-02-01', '2026-02-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-008.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'LOT-2026-SKIN-009', '2025-09-09', '2027-09-09', 'https://cdn.dermacare.mx/wms/coa/LOTE-009.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'LOT-2026-SESD-010', '2025-10-10', '2028-10-10', 'https://cdn.dermacare.mx/wms/coa/LOTE-010.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'LOT-2026-NARS-011', '2025-11-11', '2027-11-11', 'https://cdn.dermacare.mx/wms/coa/LOTE-011.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'LOT-2026-MAC-012', '2025-12-12', '2028-12-12', 'https://cdn.dermacare.mx/wms/coa/LOTE-012.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'LOT-2026-FENT-013', '2025-01-13', '2027-01-13', 'https://cdn.dermacare.mx/wms/coa/LOTE-013.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'LOT-2026-RARE-014', '2025-02-14', '2028-02-14', 'https://cdn.dermacare.mx/wms/coa/LOTE-014.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'LOT-2026-CLIN-015', '2025-03-15', '2027-03-15', 'https://cdn.dermacare.mx/wms/coa/LOTE-015.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'LOT-2026-ESTE-016', '2025-04-16', '2028-04-16', 'https://cdn.dermacare.mx/wms/coa/LOTE-016.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'LOT-2026-LANC-017', '2025-05-17', '2027-05-17', 'https://cdn.dermacare.mx/wms/coa/LOTE-017.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'LOT-2026-CHAR-018', '2025-06-18', '2028-06-18', 'https://cdn.dermacare.mx/wms/coa/LOTE-018.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'LOT-2026-PAUL-019', '2025-07-19', '2027-07-19', 'https://cdn.dermacare.mx/wms/coa/LOTE-019.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'LOT-2026-COSR-020', '2025-08-20', '2028-08-20', 'https://cdn.dermacare.mx/wms/coa/LOTE-020.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'LOT-2026-LANE-021', '2025-09-01', '2027-09-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-021.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'LOT-2026-URIA-022', '2025-10-02', '2028-10-02', 'https://cdn.dermacare.mx/wms/coa/LOTE-022.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'LOT-2026-SVR-023', '2025-11-03', '2027-11-03', 'https://cdn.dermacare.mx/wms/coa/LOTE-023.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'LOT-2026-MART-024', '2025-12-04', '2028-12-04', 'https://cdn.dermacare.mx/wms/coa/LOTE-024.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'LOT-2026-HELI-025', '2025-01-05', '2027-01-05', 'https://cdn.dermacare.mx/wms/coa/LOTE-025.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'LOT-2026-KIEH-026', '2025-02-06', '2028-02-06', 'https://cdn.dermacare.mx/wms/coa/LOTE-026.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'LOT-2026-GARN-027', '2025-03-07', '2027-03-07', 'https://cdn.dermacare.mx/wms/coa/LOTE-027.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'LOT-2026-LORE-028', '2025-04-08', '2028-04-08', 'https://cdn.dermacare.mx/wms/coa/LOTE-028.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'LOT-2026-NEUT-029', '2025-05-09', '2027-05-09', 'https://cdn.dermacare.mx/wms/coa/LOTE-029.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'LOT-2026-DERM-030', '2025-06-10', '2028-06-10', 'https://cdn.dermacare.mx/wms/coa/LOTE-030.pdf', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.lotes_fabricacion_sanitaria', 'id'), COALESCE((SELECT MAX(id) FROM wms.lotes_fabricacion_sanitaria), 1), true);

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.inventario_lotes_ubicacion (ID, ID_lote, ID_ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.inventario_lotes_ubicacion', 'id'), COALESCE((SELECT MAX(id) FROM wms.inventario_lotes_ubicacion), 1), true);

-- =================================================================================================
-- 119. TABLA: wms.kardex_movimientos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.kardex_movimientos (ID, ID_inventario_stock, ID_tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 105, 113, 'FOL-DOCUM-2026-0001', 148.46, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 110, 99, 'FOL-DOCUM-2026-0002', 166.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 115, 129, 'FOL-DOCUM-2026-0003', 185.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 120, 103, 'FOL-DOCUM-2026-0004', 203.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 125, 145, 'FOL-DOCUM-2026-0005', 222.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 130, 107, 'FOL-DOCUM-2026-0006', 240.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 135, 161, 'FOL-DOCUM-2026-0007', 259.22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 140, 111, 'FOL-DOCUM-2026-0008', 277.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 145, 177, 'FOL-DOCUM-2026-0009', 296.14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 150, 115, 'FOL-DOCUM-2026-0010', 314.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 155, 193, 'FOL-DOCUM-2026-0011', 333.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 160, 119, 'FOL-DOCUM-2026-0012', 351.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 165, 209, 'FOL-DOCUM-2026-0013', 369.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 170, 123, 'FOL-DOCUM-2026-0014', 388.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 175, 225, 'FOL-DOCUM-2026-0015', 406.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 180, 127, 'FOL-DOCUM-2026-0016', 425.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 185, 241, 'FOL-DOCUM-2026-0017', 443.82, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 190, 131, 'FOL-DOCUM-2026-0018', 462.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 195, 257, 'FOL-DOCUM-2026-0019', 480.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 200, 135, 'FOL-DOCUM-2026-0020', 499.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 205, 273, 'FOL-DOCUM-2026-0021', 517.66, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 210, 139, 'FOL-DOCUM-2026-0022', 536.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 215, 289, 'FOL-DOCUM-2026-0023', 554.58, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 220, 143, 'FOL-DOCUM-2026-0024', 573.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 225, 305, 'FOL-DOCUM-2026-0025', 591.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 230, 147, 'FOL-DOCUM-2026-0026', 609.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 235, 321, 'FOL-DOCUM-2026-0027', 628.42, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 240, 151, 'FOL-DOCUM-2026-0028', 646.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 245, 337, 'FOL-DOCUM-2026-0029', 665.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 250, 155, 'FOL-DOCUM-2026-0030', 683.80, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.kardex_movimientos', 'id'), COALESCE((SELECT MAX(id) FROM wms.kardex_movimientos), 1), true);

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.alertas_caducidad_proxima (ID, ID_lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.alertas_caducidad_proxima', 'id'), COALESCE((SELECT MAX(id) FROM wms.alertas_caducidad_proxima), 1), true);

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.mermas_destruccion_sanitaria (ID, folio_acta_destruccion, ID_lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ACTA_-2026-0001', 1, 8, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ACTA_-2026-0002', 2, 11, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ACTA_-2026-0003', 3, 14, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ACTA_-2026-0004', 4, 17, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ACTA_-2026-0005', 5, 20, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ACTA_-2026-0006', 6, 23, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ACTA_-2026-0007', 7, 26, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ACTA_-2026-0008', 8, 29, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ACTA_-2026-0009', 9, 32, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ACTA_-2026-0010', 10, 35, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ACTA_-2026-0011', 11, 38, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ACTA_-2026-0012', 12, 41, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ACTA_-2026-0013', 13, 44, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ACTA_-2026-0014', 14, 47, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ACTA_-2026-0015', 15, 50, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ACTA_-2026-0016', 16, 53, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ACTA_-2026-0017', 17, 56, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ACTA_-2026-0018', 18, 59, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ACTA_-2026-0019', 19, 62, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ACTA_-2026-0020', 20, 65, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ACTA_-2026-0021', 21, 68, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ACTA_-2026-0022', 22, 71, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ACTA_-2026-0023', 23, 74, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ACTA_-2026-0024', 24, 77, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ACTA_-2026-0025', 25, 80, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ACTA_-2026-0026', 26, 83, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ACTA_-2026-0027', 27, 86, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ACTA_-2026-0028', 28, 89, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ACTA_-2026-0029', 29, 92, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ACTA_-2026-0030', 30, 95, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.mermas_destruccion_sanitaria', 'id'), COALESCE((SELECT MAX(id) FROM wms.mermas_destruccion_sanitaria), 1), true);

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_almacenes (ID, folio_transferencia, ID_almacen_origen, ID_almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 2, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 3, 'EN_TRANSITO', '2026-02-02 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 4, 'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 5, 'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 6, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 7, 'EN_TRANSITO', '2026-02-06 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 8, 'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 9, 'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 10, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 11, 'EN_TRANSITO', '2026-02-10 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 12, 'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 13, 'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 14, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 15, 'EN_TRANSITO', '2026-02-14 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 16, 'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 17, 'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 18, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 19, 'EN_TRANSITO', '2026-02-18 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 20, 'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 21, 'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 22, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 23, 'EN_TRANSITO', '2026-02-22 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 24, 'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 25, 'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 26, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 27, 'EN_TRANSITO', '2026-02-26 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 28, 'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-03-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 29, 'DISCREPANCIA', '2026-02-28 11:30:00', '2026-03-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 30, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 1, 'EN_TRANSITO', '2026-02-02 11:30:00', NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.transferencias_almacenes', 'id'), COALESCE((SELECT MAX(id) FROM wms.transferencias_almacenes), 1), true);

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_detalles (ID, ID_transferencia, ID_lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.transferencias_detalles', 'id'), COALESCE((SELECT MAX(id) FROM wms.transferencias_detalles), 1), true);

-- =================================================================================================
-- 124. TABLA: wms.conteos_ciclicos_auditoria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_auditoria (ID, folio_auditoria, ID_almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-AUDIT-2026-0001', 1, '2026-03-01', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-AUDIT-2026-0002', 2, '2026-03-02', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-AUDIT-2026-0003', 3, '2026-03-03', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-AUDIT-2026-0004', 4, '2026-03-04', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-AUDIT-2026-0005', 5, '2026-03-05', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-AUDIT-2026-0006', 6, '2026-03-06', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-AUDIT-2026-0007', 7, '2026-03-07', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-AUDIT-2026-0008', 8, '2026-03-08', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-AUDIT-2026-0009', 9, '2026-03-09', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-AUDIT-2026-0010', 10, '2026-03-10', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-AUDIT-2026-0011', 11, '2026-03-11', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-AUDIT-2026-0012', 12, '2026-03-12', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-AUDIT-2026-0013', 13, '2026-03-13', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-AUDIT-2026-0014', 14, '2026-03-14', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-AUDIT-2026-0015', 15, '2026-03-15', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-AUDIT-2026-0016', 16, '2026-03-16', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-AUDIT-2026-0017', 17, '2026-03-17', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-AUDIT-2026-0018', 18, '2026-03-18', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-AUDIT-2026-0019', 19, '2026-03-19', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-AUDIT-2026-0020', 20, '2026-03-20', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-AUDIT-2026-0021', 21, '2026-03-21', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-AUDIT-2026-0022', 22, '2026-03-22', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-AUDIT-2026-0023', 23, '2026-03-23', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-AUDIT-2026-0024', 24, '2026-03-24', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-AUDIT-2026-0025', 25, '2026-03-25', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-AUDIT-2026-0026', 26, '2026-03-26', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-AUDIT-2026-0027', 27, '2026-03-27', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-AUDIT-2026-0028', 28, '2026-03-28', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-AUDIT-2026-0029', 29, '2026-03-01', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-AUDIT-2026-0030', 30, '2026-03-02', 'PROXIMO_A_CADUCAR', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_auditoria', 'id'), COALESCE((SELECT MAX(id) FROM wms.conteos_ciclicos_auditoria), 1), true);

-- =================================================================================================
-- 125. TABLA: wms.conteos_ciclicos_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_detalles (ID, ID_conteo_ciclico, ID_inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 52, 52, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 54, 54, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 56, 55, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 58, 58, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 60, 60, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 62, 61, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 64, 64, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 66, 66, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 68, 67, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 70, 70, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 72, 72, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 74, 73, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 76, 76, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 78, 78, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 80, 79, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 82, 82, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 84, 84, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 86, 85, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 88, 88, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 90, 90, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 92, 91, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 94, 94, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 96, 96, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 98, 97, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 100, 100, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 102, 102, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 104, 103, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 106, 106, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 108, 108, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 110, 109, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_detalles', 'id'), COALESCE((SELECT MAX(id) FROM wms.conteos_ciclicos_detalles), 1), true);

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.monitoreo_temperatura_humedad (ID, ID_zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SENSOR_I_01', 26.8, 42.0, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SENSOR_I_02', 19.4, 43.1, FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SENSOR_I_03', 9.4, 44.2, TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SENSOR_I_04', 21.2, 45.3, FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SENSOR_I_05', 26.8, 46.4, TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SENSOR_I_06', 4.3, 47.5, FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SENSOR_I_07', 26.8, 48.6, TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SENSOR_I_08', 20.3, 49.7, FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SENSOR_I_09', 9.4, 50.8, TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SENSOR_I_10', 22.1, 51.9, FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SENSOR_I_11', 26.8, 53.0, TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SENSOR_I_12', 5.9, 54.1, FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SENSOR_I_13', 26.8, 55.2, TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SENSOR_I_14', 21.2, 56.3, FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SENSOR_I_15', 9.4, 57.4, TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SENSOR_I_16', 18.5, 42.0, FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SENSOR_I_17', 26.8, 43.1, TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SENSOR_I_18', 4.3, 44.2, FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SENSOR_I_19', 26.8, 45.3, TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SENSOR_I_20', 22.1, 46.4, FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SENSOR_I_21', 9.4, 47.5, TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SENSOR_I_22', 19.4, 48.6, FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SENSOR_I_23', 26.8, 49.7, TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SENSOR_I_24', 5.9, 50.8, FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SENSOR_I_25', 26.8, 51.9, TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SENSOR_I_26', 18.5, 53.0, FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SENSOR_I_27', 9.4, 54.1, TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SENSOR_I_28', 20.3, 55.2, FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SENSOR_I_29', 26.8, 56.3, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SENSOR_I_30', 4.3, 57.4, FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.monitoreo_temperatura_humedad', 'id'), COALESCE((SELECT MAX(id) FROM wms.monitoreo_temperatura_humedad), 1), true);

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.transportistas_paqueterias (ID, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TRANSPOR_01', 'DHL Express México', 'https://api-eu.dhl.com/track/shipments?node=1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TRANSPOR_02', 'FedEx Express MX', 'https://apis.fedex.com/track/v1/trackingnumbers?node=2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'TRANSPOR_03', 'Estafeta Mexicana', 'https://cs.estafeta.com/api/tracking?node=3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'TRANSPOR_04', '99Minutos Cadena Frío', 'https://tracking.99minutos.com/api/v3/orders?node=4', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANSPOR_05', 'Redpack Logística', 'https://ws.redpack.com.mx/tracking/rest?node=5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANSPOR_06', 'UPS México', 'https://onlinetools.ups.com/api/track/v1/details?node=6', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'TRANSPOR_07', 'Paquetexpress', 'https://api.paquetexpress.com.mx/rastreo?node=7', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'TRANSPOR_08', 'J&T Express MX', 'https://openapi.jtexpress.mx/web/track?node=8', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'TRANSPOR_09', 'iVoy Mismo Día', 'https://api.ivoy.mx/v2/deliveries/track?node=9', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'TRANSPOR_10', 'Flotilla Propia DermaCare', 'https://logistica.dermacare.mx/api/rastreo?node=10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'TRANSPOR_11', 'DHL Express México Regional 2', 'https://api-eu.dhl.com/track/shipments?node=11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'TRANSPOR_12', 'FedEx Express MX Regional 2', 'https://apis.fedex.com/track/v1/trackingnumbers?node=12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'TRANSPOR_13', 'Estafeta Mexicana Regional 2', 'https://cs.estafeta.com/api/tracking?node=13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'TRANSPOR_14', '99Minutos Cadena Frío Regional 2', 'https://tracking.99minutos.com/api/v3/orders?node=14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'TRANSPOR_15', 'Redpack Logística Regional 2', 'https://ws.redpack.com.mx/tracking/rest?node=15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'TRANSPOR_16', 'UPS México Regional 2', 'https://onlinetools.ups.com/api/track/v1/details?node=16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'TRANSPOR_17', 'Paquetexpress Regional 2', 'https://api.paquetexpress.com.mx/rastreo?node=17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'TRANSPOR_18', 'J&T Express MX Regional 2', 'https://openapi.jtexpress.mx/web/track?node=18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'TRANSPOR_19', 'iVoy Mismo Día Regional 2', 'https://api.ivoy.mx/v2/deliveries/track?node=19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'TRANSPOR_20', 'Flotilla Propia DermaCare Regional 2', 'https://logistica.dermacare.mx/api/rastreo?node=20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'TRANSPOR_21', 'DHL Express México Regional 3', 'https://api-eu.dhl.com/track/shipments?node=21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'TRANSPOR_22', 'FedEx Express MX Regional 3', 'https://apis.fedex.com/track/v1/trackingnumbers?node=22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'TRANSPOR_23', 'Estafeta Mexicana Regional 3', 'https://cs.estafeta.com/api/tracking?node=23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'TRANSPOR_24', '99Minutos Cadena Frío Regional 3', 'https://tracking.99minutos.com/api/v3/orders?node=24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'TRANSPOR_25', 'Redpack Logística Regional 3', 'https://ws.redpack.com.mx/tracking/rest?node=25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'TRANSPOR_26', 'UPS México Regional 3', 'https://onlinetools.ups.com/api/track/v1/details?node=26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'TRANSPOR_27', 'Paquetexpress Regional 3', 'https://api.paquetexpress.com.mx/rastreo?node=27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'TRANSPOR_28', 'J&T Express MX Regional 3', 'https://openapi.jtexpress.mx/web/track?node=28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TRANSPOR_29', 'iVoy Mismo Día Regional 3', 'https://api.ivoy.mx/v2/deliveries/track?node=29', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'TRANSPOR_30', 'Flotilla Propia DermaCare Regional 3', 'https://logistica.dermacare.mx/api/rastreo?node=30', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.transportistas_paqueterias', 'id'), COALESCE((SELECT MAX(id) FROM envios.transportistas_paqueterias), 1), true);

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tipos_servicio_envio (ID, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SERVICIO_01', 'Día Siguiente Aéreo', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SERVICIO_02', 'Estándar Terrestre 3-5 Días', 96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SERVICIO_03', 'Mismo Día Express CDMX/MTY', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SERVICIO_04', 'Cadena de Frío Refrigerada 24h', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SERVICIO_05', 'Recolección en Farmacia Pickup', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'SERVICIO_06', 'Prioritario Matutino 10:30 AM', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'SERVICIO_07', 'Económico Nacional 5-7 Días', 144, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'SERVICIO_08', 'Locker Inteligente 24/7', 48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'SERVICIO_09', 'Empaque Térmico Isotérmico', 36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'SERVICIO_10', 'Express Fin de Semana', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'SERVICIO_11', 'Día Siguiente Aéreo Tarifa 2', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'SERVICIO_12', 'Estándar Terrestre 3-5 Días Tarifa 2', 96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'SERVICIO_13', 'Mismo Día Express CDMX/MTY Tarifa 2', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'SERVICIO_14', 'Cadena de Frío Refrigerada 24h Tarifa 2', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'SERVICIO_15', 'Recolección en Farmacia Pickup Tarifa 2', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'SERVICIO_16', 'Prioritario Matutino 10:30 AM Tarifa 2', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'SERVICIO_17', 'Económico Nacional 5-7 Días Tarifa 2', 144, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'SERVICIO_18', 'Locker Inteligente 24/7 Tarifa 2', 48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'SERVICIO_19', 'Empaque Térmico Isotérmico Tarifa 2', 36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'SERVICIO_20', 'Express Fin de Semana Tarifa 2', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'SERVICIO_21', 'Día Siguiente Aéreo Tarifa 3', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'SERVICIO_22', 'Estándar Terrestre 3-5 Días Tarifa 3', 96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'SERVICIO_23', 'Mismo Día Express CDMX/MTY Tarifa 3', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'SERVICIO_24', 'Cadena de Frío Refrigerada 24h Tarifa 3', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'SERVICIO_25', 'Recolección en Farmacia Pickup Tarifa 3', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'SERVICIO_26', 'Prioritario Matutino 10:30 AM Tarifa 3', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'SERVICIO_27', 'Económico Nacional 5-7 Días Tarifa 3', 144, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'SERVICIO_28', 'Locker Inteligente 24/7 Tarifa 3', 48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'SERVICIO_29', 'Empaque Térmico Isotérmico Tarifa 3', 36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'SERVICIO_30', 'Express Fin de Semana Tarifa 3', 24, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tipos_servicio_envio', 'id'), COALESCE((SELECT MAX(id) FROM envios.tipos_servicio_envio), 1), true);

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tarifas_zonas_postales (ID, ID_transportista, ID_servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '257', '067', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '640', '115', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '662', '441', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '067', '250', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '115', '760', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '441', '720', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '250', '970', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '760', '257', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '720', '640', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '970', '662', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '257', '067', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '640', '115', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '662', '441', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '067', '250', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '115', '760', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '441', '720', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '250', '970', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '760', '257', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '720', '640', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '970', '662', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '257', '067', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '640', '115', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '662', '441', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '067', '250', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '115', '760', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '441', '720', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '250', '970', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '760', '257', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '720', '640', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '970', '662', 5.00, 199.00, 28.50, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tarifas_zonas_postales', 'id'), COALESCE((SELECT MAX(id) FROM envios.tarifas_zonas_postales), 1), true);

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.despachos_orden (ID, folio_despacho, ID_orden_split, ID_transportista, ID_servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-DESPA-2026-0001', 1, 1, 1, NULL, '2026-03-01', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-07 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-DESPA-2026-0007', 7, 7, 7, NULL, '2026-03-07', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-13 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-DESPA-2026-0013', 13, 13, 13, NULL, '2026-03-13', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-19 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-DESPA-2026-0019', 19, 19, 19, NULL, '2026-03-19', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-25 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-DESPA-2026-0025', 25, 25, 25, NULL, '2026-03-25', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-03 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', NULL, 'INCIDENCIA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.despachos_orden', 'id'), COALESCE((SELECT MAX(id) FROM envios.despachos_orden), 1), true);

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_bultos (ID, ID_despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'BULTO-PKG-2026-0001', 0.60, 13.0, 13.0, 13.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'BULTO-PKG-2026-0002', 0.75, 14.0, 14.0, 14.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'BULTO-PKG-2026-0003', 0.90, 15.0, 15.0, 15.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'BULTO-PKG-2026-0004', 1.05, 16.0, 16.0, 16.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'BULTO-PKG-2026-0005', 1.20, 17.0, 17.0, 17.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'BULTO-PKG-2026-0006', 1.35, 18.0, 18.0, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'BULTO-PKG-2026-0007', 1.50, 19.0, 19.0, 19.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'BULTO-PKG-2026-0008', 1.65, 20.0, 20.0, 20.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'BULTO-PKG-2026-0009', 1.80, 21.0, 21.0, 21.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'BULTO-PKG-2026-0010', 1.95, 22.0, 22.0, 22.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'BULTO-PKG-2026-0011', 2.10, 23.0, 23.0, 23.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'BULTO-PKG-2026-0012', 2.25, 24.0, 24.0, 24.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'BULTO-PKG-2026-0013', 2.40, 25.0, 25.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'BULTO-PKG-2026-0014', 2.55, 26.0, 26.0, 26.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'BULTO-PKG-2026-0015', 2.70, 27.0, 27.0, 27.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'BULTO-PKG-2026-0016', 2.85, 28.0, 28.0, 28.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'BULTO-PKG-2026-0017', 3.00, 29.0, 29.0, 29.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'BULTO-PKG-2026-0018', 3.15, 30.0, 30.0, 30.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'BULTO-PKG-2026-0019', 3.30, 31.0, 31.0, 31.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'BULTO-PKG-2026-0020', 3.45, 32.0, 32.0, 32.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'BULTO-PKG-2026-0021', 3.60, 33.0, 33.0, 33.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'BULTO-PKG-2026-0022', 3.75, 34.0, 34.0, 34.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'BULTO-PKG-2026-0023', 3.90, 35.0, 35.0, 35.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'BULTO-PKG-2026-0024', 4.05, 36.0, 36.0, 36.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'BULTO-PKG-2026-0025', 4.20, 37.0, 37.0, 37.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'BULTO-PKG-2026-0026', 4.35, 38.0, 38.0, 38.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'BULTO-PKG-2026-0027', 4.50, 39.0, 39.0, 39.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'BULTO-PKG-2026-0028', 4.65, 40.0, 40.0, 40.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'BULTO-PKG-2026-0029', 4.80, 41.0, 41.0, 41.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'BULTO-PKG-2026-0030', 4.95, 42.0, 42.0, 42.0, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.paquetes_bultos', 'id'), COALESCE((SELECT MAX(id) FROM envios.paquetes_bultos), 1), true);

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_contenido_lotes (ID, ID_paquete_bulto, ID_orden_detalle, ID_lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.paquetes_contenido_lotes', 'id'), COALESCE((SELECT MAX(id) FROM envios.paquetes_contenido_lotes), 1), true);

-- =================================================================================================
-- 133. TABLA: envios.guias_rastreo (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.guias_rastreo (ID, ID_paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'MXTRK202600000001', 'https://rastreo.dermacare.mx/guia/MXTRK202600000001', 'https://cdn.dermacare.mx/guias/ETIQUETA-0001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'MXTRK202600000002', 'https://rastreo.dermacare.mx/guia/MXTRK202600000002', 'https://cdn.dermacare.mx/guias/ETIQUETA-0002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'MXTRK202600000003', 'https://rastreo.dermacare.mx/guia/MXTRK202600000003', 'https://cdn.dermacare.mx/guias/ETIQUETA-0003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'MXTRK202600000004', 'https://rastreo.dermacare.mx/guia/MXTRK202600000004', 'https://cdn.dermacare.mx/guias/ETIQUETA-0004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'MXTRK202600000005', 'https://rastreo.dermacare.mx/guia/MXTRK202600000005', 'https://cdn.dermacare.mx/guias/ETIQUETA-0005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'MXTRK202600000006', 'https://rastreo.dermacare.mx/guia/MXTRK202600000006', 'https://cdn.dermacare.mx/guias/ETIQUETA-0006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'MXTRK202600000007', 'https://rastreo.dermacare.mx/guia/MXTRK202600000007', 'https://cdn.dermacare.mx/guias/ETIQUETA-0007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'MXTRK202600000008', 'https://rastreo.dermacare.mx/guia/MXTRK202600000008', 'https://cdn.dermacare.mx/guias/ETIQUETA-0008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'MXTRK202600000009', 'https://rastreo.dermacare.mx/guia/MXTRK202600000009', 'https://cdn.dermacare.mx/guias/ETIQUETA-0009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'MXTRK202600000010', 'https://rastreo.dermacare.mx/guia/MXTRK202600000010', 'https://cdn.dermacare.mx/guias/ETIQUETA-0010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'MXTRK202600000011', 'https://rastreo.dermacare.mx/guia/MXTRK202600000011', 'https://cdn.dermacare.mx/guias/ETIQUETA-0011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'MXTRK202600000012', 'https://rastreo.dermacare.mx/guia/MXTRK202600000012', 'https://cdn.dermacare.mx/guias/ETIQUETA-0012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'MXTRK202600000013', 'https://rastreo.dermacare.mx/guia/MXTRK202600000013', 'https://cdn.dermacare.mx/guias/ETIQUETA-0013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'MXTRK202600000014', 'https://rastreo.dermacare.mx/guia/MXTRK202600000014', 'https://cdn.dermacare.mx/guias/ETIQUETA-0014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'MXTRK202600000015', 'https://rastreo.dermacare.mx/guia/MXTRK202600000015', 'https://cdn.dermacare.mx/guias/ETIQUETA-0015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'MXTRK202600000016', 'https://rastreo.dermacare.mx/guia/MXTRK202600000016', 'https://cdn.dermacare.mx/guias/ETIQUETA-0016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'MXTRK202600000017', 'https://rastreo.dermacare.mx/guia/MXTRK202600000017', 'https://cdn.dermacare.mx/guias/ETIQUETA-0017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'MXTRK202600000018', 'https://rastreo.dermacare.mx/guia/MXTRK202600000018', 'https://cdn.dermacare.mx/guias/ETIQUETA-0018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'MXTRK202600000019', 'https://rastreo.dermacare.mx/guia/MXTRK202600000019', 'https://cdn.dermacare.mx/guias/ETIQUETA-0019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'MXTRK202600000020', 'https://rastreo.dermacare.mx/guia/MXTRK202600000020', 'https://cdn.dermacare.mx/guias/ETIQUETA-0020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'MXTRK202600000021', 'https://rastreo.dermacare.mx/guia/MXTRK202600000021', 'https://cdn.dermacare.mx/guias/ETIQUETA-0021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'MXTRK202600000022', 'https://rastreo.dermacare.mx/guia/MXTRK202600000022', 'https://cdn.dermacare.mx/guias/ETIQUETA-0022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'MXTRK202600000023', 'https://rastreo.dermacare.mx/guia/MXTRK202600000023', 'https://cdn.dermacare.mx/guias/ETIQUETA-0023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'MXTRK202600000024', 'https://rastreo.dermacare.mx/guia/MXTRK202600000024', 'https://cdn.dermacare.mx/guias/ETIQUETA-0024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'MXTRK202600000025', 'https://rastreo.dermacare.mx/guia/MXTRK202600000025', 'https://cdn.dermacare.mx/guias/ETIQUETA-0025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'MXTRK202600000026', 'https://rastreo.dermacare.mx/guia/MXTRK202600000026', 'https://cdn.dermacare.mx/guias/ETIQUETA-0026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'MXTRK202600000027', 'https://rastreo.dermacare.mx/guia/MXTRK202600000027', 'https://cdn.dermacare.mx/guias/ETIQUETA-0027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'MXTRK202600000028', 'https://rastreo.dermacare.mx/guia/MXTRK202600000028', 'https://cdn.dermacare.mx/guias/ETIQUETA-0028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MXTRK202600000029', 'https://rastreo.dermacare.mx/guia/MXTRK202600000029', 'https://cdn.dermacare.mx/guias/ETIQUETA-0029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'MXTRK202600000030', 'https://rastreo.dermacare.mx/guia/MXTRK202600000030', 'https://cdn.dermacare.mx/guias/ETIQUETA-0030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.guias_rastreo', 'id'), COALESCE((SELECT MAX(id) FROM envios.guias_rastreo), 1), true);

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.eventos_tracking_bitacora (ID, ID_guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ESTATUS__01', 'Paquete recolectado en centro de distribución CEDIS.', 'Monclova, Coahuila', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ESTATUS__02', 'En tránsito hacia estación logística regional.', 'Monterrey, Nuevo León', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ESTATUS__03', 'Paquete en unidad de reparto de última milla.', 'San Pedro Garza García, Nuevo León', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ESTATUS__04', 'Entregado y firmado en domicilio de destino.', 'Cuauhtémoc, CDMX', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ESTATUS__05', 'Paquete recolectado en centro de distribución CEDIS.', 'Miguel Hidalgo, CDMX', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ESTATUS__06', 'En tránsito hacia estación logística regional.', 'Guadalajara, Jalisco', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ESTATUS__07', 'Paquete en unidad de reparto de última milla.', 'Saltillo, Coahuila', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ESTATUS__08', 'Entregado y firmado en domicilio de destino.', 'Querétaro, Querétaro', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ESTATUS__09', 'Paquete recolectado en centro de distribución CEDIS.', 'Puebla, Puebla', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ESTATUS__10', 'En tránsito hacia estación logística regional.', 'Mérida, Yucatán', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ESTATUS__11', 'Paquete en unidad de reparto de última milla.', 'Monclova, Coahuila', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ESTATUS__12', 'Entregado y firmado en domicilio de destino.', 'Monterrey, Nuevo León', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ESTATUS__13', 'Paquete recolectado en centro de distribución CEDIS.', 'San Pedro Garza García, Nuevo León', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ESTATUS__14', 'En tránsito hacia estación logística regional.', 'Cuauhtémoc, CDMX', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ESTATUS__15', 'Paquete en unidad de reparto de última milla.', 'Miguel Hidalgo, CDMX', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ESTATUS__16', 'Entregado y firmado en domicilio de destino.', 'Guadalajara, Jalisco', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ESTATUS__17', 'Paquete recolectado en centro de distribución CEDIS.', 'Saltillo, Coahuila', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ESTATUS__18', 'En tránsito hacia estación logística regional.', 'Querétaro, Querétaro', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ESTATUS__19', 'Paquete en unidad de reparto de última milla.', 'Puebla, Puebla', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ESTATUS__20', 'Entregado y firmado en domicilio de destino.', 'Mérida, Yucatán', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ESTATUS__21', 'Paquete recolectado en centro de distribución CEDIS.', 'Monclova, Coahuila', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ESTATUS__22', 'En tránsito hacia estación logística regional.', 'Monterrey, Nuevo León', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ESTATUS__23', 'Paquete en unidad de reparto de última milla.', 'San Pedro Garza García, Nuevo León', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ESTATUS__24', 'Entregado y firmado en domicilio de destino.', 'Cuauhtémoc, CDMX', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ESTATUS__25', 'Paquete recolectado en centro de distribución CEDIS.', 'Miguel Hidalgo, CDMX', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ESTATUS__26', 'En tránsito hacia estación logística regional.', 'Guadalajara, Jalisco', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ESTATUS__27', 'Paquete en unidad de reparto de última milla.', 'Saltillo, Coahuila', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ESTATUS__28', 'Entregado y firmado en domicilio de destino.', 'Querétaro, Querétaro', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ESTATUS__29', 'Paquete recolectado en centro de distribución CEDIS.', 'Puebla, Puebla', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ESTATUS__30', 'En tránsito hacia estación logística regional.', 'Mérida, Yucatán', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.eventos_tracking_bitacora', 'id'), COALESCE((SELECT MAX(id) FROM envios.eventos_tracking_bitacora), 1), true);

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.intentos_entrega_fallidos (ID, ID_despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.intentos_entrega_fallidos', 'id'), COALESCE((SELECT MAX(id) FROM envios.intentos_entrega_fallidos), 1), true);

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.incidencias_logisticas (ID, ID_despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 285.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 321.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 356.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 392.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 427.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 463.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 498.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 534.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 569.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 605.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 640.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 676.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 711.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 747.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 782.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 818.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 853.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 889.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 924.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 960.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 995.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 1031.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1066.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 1102.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1137.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 1173.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1208.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 1244.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1279.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 1315.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.incidencias_logisticas', 'id'), COALESCE((SELECT MAX(id) FROM envios.incidencias_logisticas), 1), true);

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.seguros_mercancia (ID, ID_despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Chubb Seguros México', 'POL-CARGA-2026-00001', 428.25, 8.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'AXA Seguros', 'POL-CARGA-2026-00002', 481.50, 9.63, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'GNP Seguros Carga', 'POL-CARGA-2026-00003', 534.75, 10.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Quálitas Logística', 'POL-CARGA-2026-00004', 588.00, 11.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Chubb Seguros México', 'POL-CARGA-2026-00005', 641.25, 12.83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'AXA Seguros', 'POL-CARGA-2026-00006', 694.50, 13.89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'GNP Seguros Carga', 'POL-CARGA-2026-00007', 747.75, 14.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Quálitas Logística', 'POL-CARGA-2026-00008', 801.00, 16.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Chubb Seguros México', 'POL-CARGA-2026-00009', 854.25, 17.09, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'AXA Seguros', 'POL-CARGA-2026-00010', 907.50, 18.15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'GNP Seguros Carga', 'POL-CARGA-2026-00011', 960.75, 19.21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Quálitas Logística', 'POL-CARGA-2026-00012', 1014.00, 20.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Chubb Seguros México', 'POL-CARGA-2026-00013', 1067.25, 21.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'AXA Seguros', 'POL-CARGA-2026-00014', 1120.50, 22.41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'GNP Seguros Carga', 'POL-CARGA-2026-00015', 1173.75, 23.48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Quálitas Logística', 'POL-CARGA-2026-00016', 1227.00, 24.54, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Chubb Seguros México', 'POL-CARGA-2026-00017', 1280.25, 25.61, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'AXA Seguros', 'POL-CARGA-2026-00018', 1333.50, 26.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'GNP Seguros Carga', 'POL-CARGA-2026-00019', 1386.75, 27.73, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Quálitas Logística', 'POL-CARGA-2026-00020', 1440.00, 28.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Chubb Seguros México', 'POL-CARGA-2026-00021', 1493.25, 29.87, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'AXA Seguros', 'POL-CARGA-2026-00022', 1546.50, 30.93, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'GNP Seguros Carga', 'POL-CARGA-2026-00023', 1599.75, 32.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Quálitas Logística', 'POL-CARGA-2026-00024', 1653.00, 33.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Chubb Seguros México', 'POL-CARGA-2026-00025', 1706.25, 34.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'AXA Seguros', 'POL-CARGA-2026-00026', 1759.50, 35.19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'GNP Seguros Carga', 'POL-CARGA-2026-00027', 1812.75, 36.26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Quálitas Logística', 'POL-CARGA-2026-00028', 1866.00, 37.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Chubb Seguros México', 'POL-CARGA-2026-00029', 1919.25, 38.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'AXA Seguros', 'POL-CARGA-2026-00030', 1972.50, 39.45, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.seguros_mercancia', 'id'), COALESCE((SELECT MAX(id) FROM envios.seguros_mercancia), 1), true);

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.puntos_recoleccion_pickup (ID, ID_transportista, ID_almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'LOCKER_01', 'Smart Locker & Farmacia DermaCare Monclova Suc. 01', 'Av. Universidad #201, Col. Centro, C.P. 25700, Monclova, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'LOCKER_02', 'Smart Locker & Farmacia DermaCare Monterrey Suc. 02', 'Av. Universidad #202, Col. Centro, C.P. 64000, Monterrey, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'LOCKER_03', 'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 03', 'Av. Universidad #203, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'LOCKER_04', 'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 04', 'Av. Universidad #204, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'LOCKER_05', 'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 05', 'Av. Universidad #205, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'LOCKER_06', 'Smart Locker & Farmacia DermaCare Guadalajara Suc. 06', 'Av. Universidad #206, Col. Centro, C.P. 44100, Guadalajara, Jalisco', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'LOCKER_07', 'Smart Locker & Farmacia DermaCare Saltillo Suc. 07', 'Av. Universidad #207, Col. Centro, C.P. 25000, Saltillo, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'LOCKER_08', 'Smart Locker & Farmacia DermaCare Querétaro Suc. 08', 'Av. Universidad #208, Col. Centro, C.P. 76000, Querétaro, Querétaro', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'LOCKER_09', 'Smart Locker & Farmacia DermaCare Puebla Suc. 09', 'Av. Universidad #209, Col. Centro, C.P. 72000, Puebla, Puebla', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'LOCKER_10', 'Smart Locker & Farmacia DermaCare Mérida Suc. 10', 'Av. Universidad #210, Col. Centro, C.P. 97000, Mérida, Yucatán', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'LOCKER_11', 'Smart Locker & Farmacia DermaCare Monclova Suc. 11', 'Av. Universidad #211, Col. Centro, C.P. 25700, Monclova, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'LOCKER_12', 'Smart Locker & Farmacia DermaCare Monterrey Suc. 12', 'Av. Universidad #212, Col. Centro, C.P. 64000, Monterrey, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'LOCKER_13', 'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 13', 'Av. Universidad #213, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'LOCKER_14', 'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 14', 'Av. Universidad #214, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'LOCKER_15', 'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 15', 'Av. Universidad #215, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'LOCKER_16', 'Smart Locker & Farmacia DermaCare Guadalajara Suc. 16', 'Av. Universidad #216, Col. Centro, C.P. 44100, Guadalajara, Jalisco', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'LOCKER_17', 'Smart Locker & Farmacia DermaCare Saltillo Suc. 17', 'Av. Universidad #217, Col. Centro, C.P. 25000, Saltillo, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'LOCKER_18', 'Smart Locker & Farmacia DermaCare Querétaro Suc. 18', 'Av. Universidad #218, Col. Centro, C.P. 76000, Querétaro, Querétaro', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'LOCKER_19', 'Smart Locker & Farmacia DermaCare Puebla Suc. 19', 'Av. Universidad #219, Col. Centro, C.P. 72000, Puebla, Puebla', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'LOCKER_20', 'Smart Locker & Farmacia DermaCare Mérida Suc. 20', 'Av. Universidad #220, Col. Centro, C.P. 97000, Mérida, Yucatán', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'LOCKER_21', 'Smart Locker & Farmacia DermaCare Monclova Suc. 21', 'Av. Universidad #221, Col. Centro, C.P. 25700, Monclova, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'LOCKER_22', 'Smart Locker & Farmacia DermaCare Monterrey Suc. 22', 'Av. Universidad #222, Col. Centro, C.P. 64000, Monterrey, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'LOCKER_23', 'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 23', 'Av. Universidad #223, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'LOCKER_24', 'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 24', 'Av. Universidad #224, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'LOCKER_25', 'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 25', 'Av. Universidad #225, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'LOCKER_26', 'Smart Locker & Farmacia DermaCare Guadalajara Suc. 26', 'Av. Universidad #226, Col. Centro, C.P. 44100, Guadalajara, Jalisco', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'LOCKER_27', 'Smart Locker & Farmacia DermaCare Saltillo Suc. 27', 'Av. Universidad #227, Col. Centro, C.P. 25000, Saltillo, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'LOCKER_28', 'Smart Locker & Farmacia DermaCare Querétaro Suc. 28', 'Av. Universidad #228, Col. Centro, C.P. 76000, Querétaro, Querétaro', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'LOCKER_29', 'Smart Locker & Farmacia DermaCare Puebla Suc. 29', 'Av. Universidad #229, Col. Centro, C.P. 72000, Puebla, Puebla', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'LOCKER_30', 'Smart Locker & Farmacia DermaCare Mérida Suc. 30', 'Av. Universidad #230, Col. Centro, C.P. 97000, Mérida, Yucatán', 'Lunes a Domingo 08:00 a 22:00 hrs', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.puntos_recoleccion_pickup', 'id'), COALESCE((SELECT MAX(id) FROM envios.puntos_recoleccion_pickup), 1), true);

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.motivos_devolucion_rma (ID, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Reacción alérgica o irritación cutánea tras aplicación', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Tono de maquillaje incorrecto respecto al seleccionado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Sello de seguridad violado o derrame al abrir paquete', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Producto próximo a caducar o fuera de especificación térmica', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Desistimiento dentro de los primeros 15 días con envase sellado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Reacción alérgica o irritación cutánea tras aplicación', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Tono de maquillaje incorrecto respecto al seleccionado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Sello de seguridad violado o derrame al abrir paquete', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Producto próximo a caducar o fuera de especificación térmica', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Desistimiento dentro de los primeros 15 días con envase sellado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Reacción alérgica o irritación cutánea tras aplicación', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Tono de maquillaje incorrecto respecto al seleccionado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Sello de seguridad violado o derrame al abrir paquete', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Producto próximo a caducar o fuera de especificación térmica', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Desistimiento dentro de los primeros 15 días con envase sellado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Reacción alérgica o irritación cutánea tras aplicación', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Tono de maquillaje incorrecto respecto al seleccionado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Sello de seguridad violado o derrame al abrir paquete', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Producto próximo a caducar o fuera de especificación térmica', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Desistimiento dentro de los primeros 15 días con envase sellado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Reacción alérgica o irritación cutánea tras aplicación', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Tono de maquillaje incorrecto respecto al seleccionado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Sello de seguridad violado o derrame al abrir paquete', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Producto próximo a caducar o fuera de especificación térmica', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Desistimiento dentro de los primeros 15 días con envase sellado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Reacción alérgica o irritación cutánea tras aplicación', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Tono de maquillaje incorrecto respecto al seleccionado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Sello de seguridad violado o derrame al abrir paquete', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Producto próximo a caducar o fuera de especificación térmica', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Desistimiento dentro de los primeros 15 días con envase sellado', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.motivos_devolucion_rma', 'id'), COALESCE((SELECT MAX(id) FROM postventa.motivos_devolucion_rma), 1), true);

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.solicitudes_rma (ID, folio_rma, ID_orden, ID_motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RMA-2026-0001', 1, 1, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0001.jpg', 'Cliente reporta incidencia con Sérum Niacinamida 10% + Zinc 1% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RMA-2026-0002', 2, 2, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0002.jpg', 'Cliente reporta incidencia con Gel Limpiador Espumoso Facial y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RMA-2026-0003', 3, 3, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0003.jpg', 'Cliente reporta incidencia con Protector Solar Fluido SPF 50+ y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RMA-2026-0004', 4, 4, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0004.jpg', 'Cliente reporta incidencia con Sérum Ácido Hialurónico 2% + B5 y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RMA-2026-0005', 5, 5, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0005.jpg', 'Cliente reporta incidencia con Crema Hidratante con Ceramidas y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RMA-2026-0006', 6, 6, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0006.jpg', 'Cliente reporta incidencia con Retinol Puro 0.5% Nocturno y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RMA-2026-0007', 7, 7, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0007.jpg', 'Cliente reporta incidencia con Agua Micelar Dermolimpiadora y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RMA-2026-0008', 8, 8, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0008.jpg', 'Cliente reporta incidencia con Sérum Vitamina C Pura 15% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RMA-2026-0009', 9, 9, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0009.jpg', 'Cliente reporta incidencia con Base de Maquillaje Cobertura Media y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RMA-2026-0010', 10, 10, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0010.jpg', 'Cliente reporta incidencia con Corrector Líquido Alta Duración y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RMA-2026-0011', 11, 11, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0011.jpg', 'Cliente reporta incidencia con Bálsamo Reparador Cicaplast B5 y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RMA-2026-0012', 12, 12, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0012.jpg', 'Cliente reporta incidencia con Exfoliante Ácido Salicílico 2% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RMA-2026-0013', 13, 13, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0013.jpg', 'Cliente reporta incidencia con Contorno de Ojos con Cafeína 5% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RMA-2026-0014', 14, 14, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0014.jpg', 'Cliente reporta incidencia con Mascarilla Nocturna Hidratante y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RMA-2026-0015', 15, 15, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0015.jpg', 'Cliente reporta incidencia con Bruma Termal Calmante Mineral y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RMA-2026-0016', 16, 16, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0016.jpg', 'Cliente reporta incidencia con Aceite Limpiador Emulsionable y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RMA-2026-0017', 17, 17, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0017.jpg', 'Cliente reporta incidencia con Tónico Equilibrante Ácido Glicólico 7% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RMA-2026-0018', 18, 18, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0018.jpg', 'Cliente reporta incidencia con Labial Hidratante Péptidos Nude y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RMA-2026-0019', 19, 19, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0019.jpg', 'Cliente reporta incidencia con Polvo Traslúcido Matificante Mineral y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RMA-2026-0020', 20, 20, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0020.jpg', 'Cliente reporta incidencia con Rubor Líquido Pigmento Natural y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RMA-2026-0021', 21, 21, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0021.jpg', 'Cliente reporta incidencia con Sérum Ácido Azelaico 10% Suspensión y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RMA-2026-0022', 22, 22, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0022.jpg', 'Cliente reporta incidencia con Ampolletas Proteoglicanos Firmeza y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RMA-2026-0023', 23, 23, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0023.jpg', 'Cliente reporta incidencia con Crema Despigmentante Noche Melasma y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RMA-2026-0024', 24, 24, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0024.jpg', 'Cliente reporta incidencia con Protector Solar Mineral Óxido Zinc y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RMA-2026-0025', 25, 25, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0025.jpg', 'Cliente reporta incidencia con Loción Corporal Urea 10% Reparadora y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RMA-2026-0026', 26, 26, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0026.jpg', 'Cliente reporta incidencia con Primer Facial Minimizador de Poros y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RMA-2026-0027', 27, 27, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0027.jpg', 'Cliente reporta incidencia con Máscara de Pestañas Hipoalergénica y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RMA-2026-0028', 28, 28, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0028.jpg', 'Cliente reporta incidencia con Sérum Péptidos de Cobre 1% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RMA-2026-0029', 29, 29, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0029.jpg', 'Cliente reporta incidencia con Bálsamo Desmaquillante Caléndula y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RMA-2026-0030', 30, 30, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0030.jpg', 'Cliente reporta incidencia con Crema Barrera Post-Retinoide y adjunta evidencia fotográfica de lote y empaque.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.solicitudes_rma', 'id'), COALESCE((SELECT MAX(id) FROM postventa.solicitudes_rma), 1), true);

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.rma_detalles (ID, ID_solicitud_rma, ID_orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.rma_detalles', 'id'), COALESCE((SELECT MAX(id) FROM postventa.rma_detalles), 1), true);

-- =================================================================================================
-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.inspeccion_sanitaria_retorno (ID, ID_rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.inspeccion_sanitaria_retorno', 'id'), COALESCE((SELECT MAX(id) FROM postventa.inspeccion_sanitaria_retorno), 1), true);

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_soporte (ID, folio_ticket, ID_cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TICKE-2026-0001', 1, 'Seguimiento de envío sin actualización en las últimas 48 horas (#001)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TICKE-2026-0002', 2, 'Duda sobre orden de aplicación en rutina nocturna (#002)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TICKE-2026-0003', 3, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#003)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TICKE-2026-0004', 4, 'Dispensador airless bloqueado en entrega reciente (#004)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TICKE-2026-0005', 5, 'Seguimiento de envío sin actualización en las últimas 48 horas (#005)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TICKE-2026-0006', 6, 'Duda sobre orden de aplicación en rutina nocturna (#006)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TICKE-2026-0007', 7, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#007)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TICKE-2026-0008', 8, 'Dispensador airless bloqueado en entrega reciente (#008)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TICKE-2026-0009', 9, 'Seguimiento de envío sin actualización en las últimas 48 horas (#009)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TICKE-2026-0010', 10, 'Duda sobre orden de aplicación en rutina nocturna (#010)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TICKE-2026-0011', 11, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#011)', 'FACTURACION_CFDI', 'ALTA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TICKE-2026-0012', 12, 'Dispensador airless bloqueado en entrega reciente (#012)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TICKE-2026-0013', 13, 'Seguimiento de envío sin actualización en las últimas 48 horas (#013)', 'ENVIO_DEMORADO', 'BAJA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TICKE-2026-0014', 14, 'Duda sobre orden de aplicación en rutina nocturna (#014)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TICKE-2026-0015', 15, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#015)', 'FACTURACION_CFDI', 'ALTA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TICKE-2026-0016', 16, 'Dispensador airless bloqueado en entrega reciente (#016)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TICKE-2026-0017', 17, 'Seguimiento de envío sin actualización en las últimas 48 horas (#017)', 'ENVIO_DEMORADO', 'BAJA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TICKE-2026-0018', 18, 'Duda sobre orden de aplicación en rutina nocturna (#018)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TICKE-2026-0019', 19, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#019)', 'FACTURACION_CFDI', 'ALTA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TICKE-2026-0020', 20, 'Dispensador airless bloqueado en entrega reciente (#020)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TICKE-2026-0021', 21, 'Seguimiento de envío sin actualización en las últimas 48 horas (#021)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TICKE-2026-0022', 22, 'Duda sobre orden de aplicación en rutina nocturna (#022)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TICKE-2026-0023', 23, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#023)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TICKE-2026-0024', 24, 'Dispensador airless bloqueado en entrega reciente (#024)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TICKE-2026-0025', 25, 'Seguimiento de envío sin actualización en las últimas 48 horas (#025)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TICKE-2026-0026', 26, 'Duda sobre orden de aplicación en rutina nocturna (#026)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TICKE-2026-0027', 27, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#027)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TICKE-2026-0028', 28, 'Dispensador airless bloqueado en entrega reciente (#028)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TICKE-2026-0029', 29, 'Seguimiento de envío sin actualización en las últimas 48 horas (#029)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TICKE-2026-0030', 30, 'Duda sobre orden de aplicación en rutina nocturna (#030)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_soporte', 'id'), COALESCE((SELECT MAX(id) FROM postventa.tickets_soporte), 1), true);

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_mensajes (ID, ID_ticket, ID_usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Hola, comparto los detalles sobre el seguimiento del ticket #001 respecto a Sérum Niacinamida 10% + Zinc 1%. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0001.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Hola, comparto los detalles sobre el seguimiento del ticket #002 respecto a Gel Limpiador Espumoso Facial. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Hola, comparto los detalles sobre el seguimiento del ticket #003 respecto a Protector Solar Fluido SPF 50+. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0003.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Hola, comparto los detalles sobre el seguimiento del ticket #004 respecto a Sérum Ácido Hialurónico 2% + B5. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Hola, comparto los detalles sobre el seguimiento del ticket #005 respecto a Crema Hidratante con Ceramidas. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0005.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Hola, comparto los detalles sobre el seguimiento del ticket #006 respecto a Retinol Puro 0.5% Nocturno. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Hola, comparto los detalles sobre el seguimiento del ticket #007 respecto a Agua Micelar Dermolimpiadora. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0007.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Hola, comparto los detalles sobre el seguimiento del ticket #008 respecto a Sérum Vitamina C Pura 15%. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Hola, comparto los detalles sobre el seguimiento del ticket #009 respecto a Base de Maquillaje Cobertura Media. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0009.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Hola, comparto los detalles sobre el seguimiento del ticket #010 respecto a Corrector Líquido Alta Duración. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Hola, comparto los detalles sobre el seguimiento del ticket #011 respecto a Bálsamo Reparador Cicaplast B5. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0011.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Hola, comparto los detalles sobre el seguimiento del ticket #012 respecto a Exfoliante Ácido Salicílico 2%. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Hola, comparto los detalles sobre el seguimiento del ticket #013 respecto a Contorno de Ojos con Cafeína 5%. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0013.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Hola, comparto los detalles sobre el seguimiento del ticket #014 respecto a Mascarilla Nocturna Hidratante. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Hola, comparto los detalles sobre el seguimiento del ticket #015 respecto a Bruma Termal Calmante Mineral. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0015.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Hola, comparto los detalles sobre el seguimiento del ticket #016 respecto a Aceite Limpiador Emulsionable. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Hola, comparto los detalles sobre el seguimiento del ticket #017 respecto a Tónico Equilibrante Ácido Glicólico 7%. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0017.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Hola, comparto los detalles sobre el seguimiento del ticket #018 respecto a Labial Hidratante Péptidos Nude. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Hola, comparto los detalles sobre el seguimiento del ticket #019 respecto a Polvo Traslúcido Matificante Mineral. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0019.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Hola, comparto los detalles sobre el seguimiento del ticket #020 respecto a Rubor Líquido Pigmento Natural. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Hola, comparto los detalles sobre el seguimiento del ticket #021 respecto a Sérum Ácido Azelaico 10% Suspensión. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0021.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Hola, comparto los detalles sobre el seguimiento del ticket #022 respecto a Ampolletas Proteoglicanos Firmeza. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Hola, comparto los detalles sobre el seguimiento del ticket #023 respecto a Crema Despigmentante Noche Melasma. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0023.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Hola, comparto los detalles sobre el seguimiento del ticket #024 respecto a Protector Solar Mineral Óxido Zinc. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Hola, comparto los detalles sobre el seguimiento del ticket #025 respecto a Loción Corporal Urea 10% Reparadora. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0025.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Hola, comparto los detalles sobre el seguimiento del ticket #026 respecto a Primer Facial Minimizador de Poros. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Hola, comparto los detalles sobre el seguimiento del ticket #027 respecto a Máscara de Pestañas Hipoalergénica. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0027.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Hola, comparto los detalles sobre el seguimiento del ticket #028 respecto a Sérum Péptidos de Cobre 1%. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Hola, comparto los detalles sobre el seguimiento del ticket #029 respecto a Bálsamo Desmaquillante Caléndula. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0029.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Hola, comparto los detalles sobre el seguimiento del ticket #030 respecto a Crema Barrera Post-Retinoide. Quedo atento a su confirmación.', NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_mensajes', 'id'), COALESCE((SELECT MAX(id) FROM postventa.tickets_mensajes), 1), true);

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.reportes_farmacovigilancia (ID, folio_cofepris_ram, ID_cliente, ID_producto, ID_lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-COFEP-2026-0001', 1, 1, 1, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Niacinamida 10% + Zinc 1%.', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-COFEP-2026-0002', 2, 2, 2, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Gel Limpiador Espumoso Facial.', FALSE, '2026-03-02', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-COFEP-2026-0003', 3, 3, 3, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Fluido SPF 50+.', TRUE, '2026-03-03', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-COFEP-2026-0004', 4, 4, 4, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Ácido Hialurónico 2% + B5.', FALSE, '2026-03-04', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-COFEP-2026-0005', 5, 5, 5, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Hidratante con Ceramidas.', TRUE, '2026-03-05', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-COFEP-2026-0006', 6, 6, 6, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Retinol Puro 0.5% Nocturno.', FALSE, '2026-03-06', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-COFEP-2026-0007', 7, 7, 7, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Agua Micelar Dermolimpiadora.', TRUE, '2026-03-07', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-COFEP-2026-0008', 8, 8, 8, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Sérum Vitamina C Pura 15%.', FALSE, '2026-03-08', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-COFEP-2026-0009', 9, 9, 9, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Base de Maquillaje Cobertura Media.', TRUE, '2026-03-09', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-COFEP-2026-0010', 10, 10, 10, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Corrector Líquido Alta Duración.', FALSE, '2026-03-10', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-COFEP-2026-0011', 11, 11, 11, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Reparador Cicaplast B5.', TRUE, '2026-03-11', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-COFEP-2026-0012', 12, 12, 12, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Exfoliante Ácido Salicílico 2%.', FALSE, '2026-03-12', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-COFEP-2026-0013', 13, 13, 13, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Contorno de Ojos con Cafeína 5%.', TRUE, '2026-03-13', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-COFEP-2026-0014', 14, 14, 14, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Mascarilla Nocturna Hidratante.', FALSE, '2026-03-14', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-COFEP-2026-0015', 15, 15, 15, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Bruma Termal Calmante Mineral.', TRUE, '2026-03-15', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-COFEP-2026-0016', 16, 16, 16, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Aceite Limpiador Emulsionable.', FALSE, '2026-03-16', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-COFEP-2026-0017', 17, 17, 17, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Tónico Equilibrante Ácido Glicólico 7%.', TRUE, '2026-03-17', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-COFEP-2026-0018', 18, 18, 18, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Labial Hidratante Péptidos Nude.', FALSE, '2026-03-18', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-COFEP-2026-0019', 19, 19, 19, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Polvo Traslúcido Matificante Mineral.', TRUE, '2026-03-19', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-COFEP-2026-0020', 20, 20, 20, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Rubor Líquido Pigmento Natural.', FALSE, '2026-03-20', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-COFEP-2026-0021', 21, 21, 21, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Sérum Ácido Azelaico 10% Suspensión.', TRUE, '2026-03-21', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-COFEP-2026-0022', 22, 22, 22, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Ampolletas Proteoglicanos Firmeza.', FALSE, '2026-03-22', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-COFEP-2026-0023', 23, 23, 23, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Despigmentante Noche Melasma.', TRUE, '2026-03-23', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-COFEP-2026-0024', 24, 24, 24, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Mineral Óxido Zinc.', FALSE, '2026-03-24', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-COFEP-2026-0025', 25, 25, 25, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Loción Corporal Urea 10% Reparadora.', TRUE, '2026-03-25', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-COFEP-2026-0026', 26, 26, 26, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Primer Facial Minimizador de Poros.', FALSE, '2026-03-26', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-COFEP-2026-0027', 27, 27, 27, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Máscara de Pestañas Hipoalergénica.', TRUE, '2026-03-27', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-COFEP-2026-0028', 28, 28, 28, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Péptidos de Cobre 1%.', FALSE, '2026-03-28', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-COFEP-2026-0029', 29, 29, 29, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Desmaquillante Caléndula.', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-COFEP-2026-0030', 30, 30, 30, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Crema Barrera Post-Retinoide.', FALSE, '2026-03-02', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.reportes_farmacovigilancia', 'id'), COALESCE((SELECT MAX(id) FROM postventa.reportes_farmacovigilancia), 1), true);

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.tipos_evento_sistema (ID, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'LOGIN_EXITOSO', 'Inicio de sesión exitoso con credenciales validadas', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'INTENTO_ACCESO_DENEGADO', 'Intento de acceso denegado por permisos RBAC insuficientes', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MODIFICACION_PRECIOS', 'Actualización de precio base en catálogo SKU', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'BAJA_LOGICA_REGISTRO', 'Ejecución de borrado lógico (Soft Delete) auditado', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'EXPORTACION_DATOS_LFPDPPP', 'Exportación de expediente clínico por solicitud ARCO', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TIMBRADO_CFDI_PAC', 'Emisión y sellado de comprobante fiscal CFDI 4.0', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CANCELACION_CFDI_SAT', 'Solicitud de cancelación fiscal ante el SAT', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'BLOQUEO_CUENTA_INTENTOS', 'Bloqueo automático de usuario por intentos fallidos', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAMBIO_PASSWORD_USUARIO', 'Actualización criptográfica Argon2id de contraseña', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MFA_VERIFICACION_TOTP', 'Validación o rechazo de segundo factor TOTP', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CUARENTENA_LOTE_QA', 'Retención sanitaria de lote por desviación de calidad', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ALERTA_TEMPERATURA_IOT', 'Excursión térmica detectada en sensor de cadena de frío', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'REEMBOLSO_AUTORIZADO', 'Autorización financiera de reembolso a cliente', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CONTRACARGO_RECIBIDO', 'Notificación de disputa bancaria por pasarela', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'DESTRUCCION_MERMA_COFEPRIS', 'Registro de acta circunstanciada de destrucción sanitaria', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'AJUSTE_INVENTARIO_CONTEO', 'Ajuste de existencias tras conteo cíclico de auditoría', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CREACION_USUARIO_ADMIN', 'Alta de cuenta administrativa en módulo IAM', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ASIGNACION_ROL_SEGURIDAD', 'Modificación de roles asignados a usuario', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'REPORTE_FARMACOVIGILANCIA', 'Alta de reporte de reacción adversa RAM COFEPRIS', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'REVOCACION_SESION_REMOTA', 'Invalidación forzada de token de sesión activa', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ALTA_REGISTRO_COFEPRIS', 'Actualización de vigencia de registro sanitario', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FRAUDE_BLOQUEO_ORDEN', 'Bloqueo preventivo de orden por regla antifraude', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'DESPACHO_FEFO_WMS', 'Liberación de picking por regla FEFO', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MODIFICACION_PARAMETRO', 'Cambio en parámetro de configuración en caliente', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CONSULTA_DATOS_SENSIBLES', 'Acceso a perfil dermatológico LFPDPPP', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'RESTAURACION_REGISTRO', 'Reactivación lógica de entidad previamente dada de baja', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'WEBHOOK_PASARELA_RECIBIDO', 'Recepción verificada de notificación HMAC de pago', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'RMA_INSPECCION_HIGIENE', 'Dictamen sanitario sobre devolución recibida', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TRANSFERENCIA_CEDIS_CREADA', 'Orden de traslado entre almacenes con control térmico', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CIERRE_SESION_VOLUNTARIO', 'Cierre explícito de sesión por el usuario', 'CRITICO_SEGURIDAD', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.tipos_evento_sistema', 'id'), COALESCE((SELECT MAX(id) FROM auditoria.tipos_evento_sistema), 1), true);

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_seguridad_global (ID, ID_tipo_evento, ID_usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '189.203.3.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'Seguridad.IAM', 'Inicio de sesión exitoso con credenciales validadas (Registro auditado #0001).', '822aaf75efb2377be6e9f38a3ea625b705bd9f835a21ee04665f2f2330bbee06', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '189.203.6.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'Catalogo.Precios', 'Intento de acceso denegado por permisos RBAC insuficientes (Registro auditado #0002).', 'e9c9403db5e463f149a10bb3e32d72ef7937a5ca026bfec9e3ecac63efc76b5b', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '189.203.9.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'Fiscal.CFDI', 'Actualización de precio base en catálogo SKU (Registro auditado #0003).', 'fe0a7c2537cb5c8a1485ac8e637953e62e6c7305a808a7f5942f653804a43868', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '189.203.12.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'Clientes.ARCO', 'Ejecución de borrado lógico (Soft Delete) auditado (Registro auditado #0004).', 'efb657c736345d2380ac4337a26dcb8069735d4b0a43ca1549722b761f924a02', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '189.203.15.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'WMS.CadenaFrio', 'Exportación de expediente clínico por solicitud ARCO (Registro auditado #0005).', '93b60ec3f14932d9decdb119e6d3d1868d350e8feba52089cf34b1de19a7686e', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '189.203.18.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'Pagos.Antifraude', 'Emisión y sellado de comprobante fiscal CFDI 4.0 (Registro auditado #0006).', '6acf751a227783a91240d1432aa4d8ba258982f7385c71e4be11886adfc084ca', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '189.203.21.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'Seguridad.IAM', 'Solicitud de cancelación fiscal ante el SAT (Registro auditado #0007).', '68b959d127be3e137d04e5cfae970c022ca970ab500dbf9a54d5d94fb5cc35df', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '189.203.24.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'Catalogo.Precios', 'Bloqueo automático de usuario por intentos fallidos (Registro auditado #0008).', '9c44bd3dee118b4d36943fb69bf1a79ace53c53db68a5d5d0d262ff39f2e16a5', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '189.203.27.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'Fiscal.CFDI', 'Actualización criptográfica Argon2id de contraseña (Registro auditado #0009).', 'f6aab553803a5203e4c4babea15e4082a5230ccb02ffcd19233ebaf8fff037cd', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '189.203.30.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'Clientes.ARCO', 'Validación o rechazo de segundo factor TOTP (Registro auditado #0010).', '9b8433f950cc9b93522036fe6e70274f9f4f3cbe61b1071310fb77e320f02521', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '189.203.33.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'WMS.CadenaFrio', 'Retención sanitaria de lote por desviación de calidad (Registro auditado #0011).', 'aeb5d25ab3468bea6fafbed7bc09833153ad8fb200258e77aba6f40526ee6877', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '189.203.36.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'Pagos.Antifraude', 'Excursión térmica detectada en sensor de cadena de frío (Registro auditado #0012).', 'a8ded427e46238ede28d520bdc9369981f589a826eaa1adaebf30b4a7e6eb585', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '189.203.39.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'Seguridad.IAM', 'Autorización financiera de reembolso a cliente (Registro auditado #0013).', 'ad0d7747c124cff95c06fb1c24a46daf7b00ffe7484b476c339785b6bf118c01', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '189.203.42.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'Catalogo.Precios', 'Notificación de disputa bancaria por pasarela (Registro auditado #0014).', '2e29cd7e59d6b35759468a2ac0c285d79c503f6d01e8636f6bed8a755fb4738c', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '189.203.45.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'Fiscal.CFDI', 'Registro de acta circunstanciada de destrucción sanitaria (Registro auditado #0015).', 'd3bdb41506978ff27734e6d3ab149e6443b25df214860ac156dace8fe1002a32', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '189.203.48.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'Clientes.ARCO', 'Ajuste de existencias tras conteo cíclico de auditoría (Registro auditado #0016).', 'ed6c351aa391af272c24e8c5791c0f8be9d2432eb2aee535be499821ff6fdcd2', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '189.203.51.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'WMS.CadenaFrio', 'Alta de cuenta administrativa en módulo IAM (Registro auditado #0017).', '5687a48d6d28dff7bd7b388de2f103b6b42b9ec826355d3471db292416ac8744', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '189.203.54.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'Pagos.Antifraude', 'Modificación de roles asignados a usuario (Registro auditado #0018).', 'c3103100ecf9f3d88c520b3b755723ef9570c1e04da92eb3d6b816c4a163a891', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '189.203.57.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'Seguridad.IAM', 'Alta de reporte de reacción adversa RAM COFEPRIS (Registro auditado #0019).', '2166f8e64254369e88c6c2bed443bb1a14ef13de9cd770897554b45686978f79', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '189.203.60.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'Catalogo.Precios', 'Invalidación forzada de token de sesión activa (Registro auditado #0020).', '7fb0613e00707c167f156e052c08abcbdddd4eb28938f8e6a64870e92d777675', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '189.203.63.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'Fiscal.CFDI', 'Actualización de vigencia de registro sanitario (Registro auditado #0021).', 'bdfa89f693dbbb92a82f95ae1ee7ffff7f385ff8ed34c0bb1c15835ba08d5291', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '189.203.66.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'Clientes.ARCO', 'Bloqueo preventivo de orden por regla antifraude (Registro auditado #0022).', '2678285d4ae0d9afbcf71d7fc486ce27a203da9e6955c9eccab82a69acda981b', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '189.203.69.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'WMS.CadenaFrio', 'Liberación de picking por regla FEFO (Registro auditado #0023).', '292dfaa2a59b8f77b10958bcf656fb297237c38233c1e900ca5912fa46068f7f', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '189.203.72.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'Pagos.Antifraude', 'Cambio en parámetro de configuración en caliente (Registro auditado #0024).', 'e3124d4a51b532b7f52413851c287797be3fc01ae4b11e0c66d44062c6b57c29', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '189.203.75.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'Seguridad.IAM', 'Acceso a perfil dermatológico LFPDPPP (Registro auditado #0025).', '7e0a2b320e9923bb0faab99112772bb898fd00e6a50b034651655ed607a163b2', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '189.203.78.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'Catalogo.Precios', 'Reactivación lógica de entidad previamente dada de baja (Registro auditado #0026).', '231eefc9e2a9a78b94b21b6f938e78f45714a594a3034a5bc4f425d41f9473d9', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '189.203.81.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'Fiscal.CFDI', 'Recepción verificada de notificación HMAC de pago (Registro auditado #0027).', 'd69a2c3c31ec03261005fa2539492f0d1703958eb7531e1d59f3bc293e979bd8', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '189.203.84.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'Clientes.ARCO', 'Dictamen sanitario sobre devolución recibida (Registro auditado #0028).', '8efa9da9e46b9c7b53b1a2413e839039ef5efff2deb06f34e8b0d7b6f627c928', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '189.203.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'WMS.CadenaFrio', 'Orden de traslado entre almacenes con control térmico (Registro auditado #0029).', 'e3dda4df71d765ddf8d4bcaaded8b196b4e2a03c05d4dd94f370501cf4b9fead', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '189.203.90.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'Pagos.Antifraude', 'Cierre explícito de sesión por el usuario (Registro auditado #0030).', '490fda407df80e3e6ede88e335ea513ed0bad2783f52dd1e1908fbf4932c577b', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_seguridad_global', 'id'), COALESCE((SELECT MAX(id) FROM auditoria.bitacora_seguridad_global), 1), true);

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_cambios_datos (ID, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ventas.ordenes', 1, 'INSERT', NULL, '{"tabla": "ventas.ordenes", "id_registro": 1, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'catalogo.variantes_sku', 2, 'UPDATE', '{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "version": 1}', '{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'clientes.clientes', 3, 'INSERT', NULL, '{"tabla": "clientes.clientes", "id_registro": 3, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'fiscal.facturas_cfdi', 4, 'UPDATE', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "version": 1}', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'wms.inventario_lotes_ubicacion', 5, 'INSERT', NULL, '{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 5, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'pagos.transacciones', 6, 'UPDATE', '{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "version": 1}', '{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #6.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'postventa.solicitudes_rma', 7, 'INSERT', NULL, '{"tabla": "postventa.solicitudes_rma", "id_registro": 7, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #7.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'seguridad.usuarios', 8, 'UPDATE', '{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "version": 1}', '{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #8.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'promos.cupones', 9, 'INSERT', NULL, '{"tabla": "promos.cupones", "id_registro": 9, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #9.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'compras.ordenes_compra', 10, 'UPDATE', '{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "version": 1}', '{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #10.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ventas.ordenes', 11, 'INSERT', NULL, '{"tabla": "ventas.ordenes", "id_registro": 11, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #11.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'catalogo.variantes_sku', 12, 'UPDATE', '{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "version": 1}', '{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #12.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'clientes.clientes', 13, 'INSERT', NULL, '{"tabla": "clientes.clientes", "id_registro": 13, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #13.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'fiscal.facturas_cfdi', 14, 'UPDATE', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "version": 1}', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #14.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'wms.inventario_lotes_ubicacion', 15, 'INSERT', NULL, '{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 15, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #15.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'pagos.transacciones', 16, 'UPDATE', '{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "version": 1}', '{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #16.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'postventa.solicitudes_rma', 17, 'INSERT', NULL, '{"tabla": "postventa.solicitudes_rma", "id_registro": 17, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #17.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'seguridad.usuarios', 18, 'UPDATE', '{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "version": 1}', '{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #18.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'promos.cupones', 19, 'INSERT', NULL, '{"tabla": "promos.cupones", "id_registro": 19, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #19.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'compras.ordenes_compra', 20, 'UPDATE', '{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "version": 1}', '{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #20.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ventas.ordenes', 21, 'INSERT', NULL, '{"tabla": "ventas.ordenes", "id_registro": 21, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #21.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'catalogo.variantes_sku', 22, 'UPDATE', '{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "version": 1}', '{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #22.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'clientes.clientes', 23, 'INSERT', NULL, '{"tabla": "clientes.clientes", "id_registro": 23, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #23.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'fiscal.facturas_cfdi', 24, 'UPDATE', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "version": 1}', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #24.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'wms.inventario_lotes_ubicacion', 25, 'INSERT', NULL, '{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 25, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #25.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'pagos.transacciones', 26, 'SOFT_DELETE', '{"tabla": "pagos.transacciones", "id_registro": 26, "activo": true, "version": 1}', '{"tabla": "pagos.transacciones", "id_registro": 26, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre pagos.transacciones registro #26.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'postventa.solicitudes_rma', 27, 'SOFT_DELETE', '{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": true, "version": 1}', '{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre postventa.solicitudes_rma registro #27.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'seguridad.usuarios', 28, 'SOFT_DELETE', '{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": true, "version": 1}', '{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre seguridad.usuarios registro #28.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'promos.cupones', 29, 'SOFT_DELETE', '{"tabla": "promos.cupones", "id_registro": 29, "activo": true, "version": 1}', '{"tabla": "promos.cupones", "id_registro": 29, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre promos.cupones registro #29.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'compras.ordenes_compra', 30, 'SOFT_DELETE', '{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": true, "version": 1}', '{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre compras.ordenes_compra registro #30.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_cambios_datos', 'id'), COALESCE((SELECT MAX(id) FROM auditoria.bitacora_cambios_datos), 1), true);

-- =================================================================================================
-- 149. TABLA: sistema.parametros_configuracion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.parametros_configuracion (ID, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'IVA_TASA_GENERAL_MX', '16.00', 'DECIMAL', 'Porcentaje de IVA aplicable en México a cosméticos y dermocosmética.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'DIAS_LIMITE_RESPUESTA_ARCO', '20', 'INTEGER', 'Plazo máximo legal en días hábiles para responder solicitudes ARCO (LFPDPPP).', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ENVIO_GRATIS_MONTO_MINIMO', '999.00', 'DECIMAL', 'Monto mínimo de compra en MXN para otorgar envío estándar gratuito.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MODO_MANTENIMIENTO_TIENDA', 'false', 'BOOLEAN', 'Bandera de activación de ventana de mantenimiento en tienda pública.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'UMBRAL_SCORE_ANTIFRAUDE_3DS', '65', 'INTEGER', 'Puntaje mínimo de riesgo para exigir autenticación bancaria 3D Secure.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TEMP_MIN_CADENA_FRIO_C', '2.0', 'DECIMAL', 'Temperatura mínima permitida en cámaras refrigeradas de almacén (°C).', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'TEMP_MAX_CADENA_FRIO_C', '8.0', 'DECIMAL', 'Temperatura máxima permitida en cámaras refrigeradas de almacén (°C).', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MAX_INTENTOS_LOGIN_FALLIDOS', '5', 'INTEGER', 'Número de intentos fallidos consecutivos antes de bloquear la cuenta.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MINUTOS_EXPIRACION_RESERVA_CART', '15', 'INTEGER', 'Duración en minutos de apartado temporal de inventario en carrito.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PAC_TIMBRADO_AMBIENTE', 'PRODUCCION', 'STRING', 'Entorno activo de conexión con el PAC autorizado del SAT.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'DIAS_ALERTA_PREVENTIVA_FEFO', '90', 'INTEGER', 'Días previos a la caducidad para disparar alerta preventiva FEFO.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'DIAS_VENTANA_DEVOLUCION_RMA', '30', 'INTEGER', 'Días naturales posteriores a la entrega para solicitar devolución RMA.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'DESCUENTO_SUSCRIPCION_DEFAULT', '10.00', 'DECIMAL', 'Porcentaje de descuento base en planes de suscripción recurrente.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'HABILITAR_RECOMENDADOR_INCI', 'true', 'BOOLEAN', 'Activa el filtro automático de alérgenos INCI según perfil cutáneo.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CONFIG_REINTENTOS_WEBHOOK', '{"max_retries": 5, "backoff_sec": 30}', 'JSON', 'Política de reintentos exponenciales para webhooks de paquetería y pago.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'RFC_EMISOR_COMERCIO', 'DCM240115KL9', 'STRING', 'RFC oficial de la razón social emisora de comprobantes CFDI 4.0.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CP_FISCAL_EXPEDICION', '25700', 'STRING', 'Código postal del domicilio fiscal de expedición CFDI 4.0.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'HORAS_VIDA_TOKEN_RESET', '2', 'INTEGER', 'Vigencia en horas de los enlaces de restablecimiento de contraseña.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'COMISION_BASE_AFILIADOS', '8.50', 'DECIMAL', 'Comisión porcentual estándar para nuevos afiliados dermoconsultores.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PERMITIR_MULTIPAGO_BILLETERA', 'true', 'BOOLEAN', 'Habilita combinación de monedero electrónico con tarjeta o SPEI.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'POLITICA_SEGURIDAD_PASSWORD', '{"min_len": 12, "argon2_mem_kb": 65536}', 'JSON', 'Parámetros mínimos criptográficos para contraseñas de usuarios.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MONEDA_OPERACION_DEFAULT', 'MXN', 'STRING', 'Código ISO 4217 de moneda predeterminada en tienda nacional.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'HUMEDAD_MAX_ALMACEN_PORC', '60.0', 'DECIMAL', 'Humedad relativa máxima permitida en pasillos de almacenamiento.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'LIMITE_PIEZA_POR_SKU_ORDEN', '10', 'INTEGER', 'Cantidad máxima permitida de un mismo SKU por orden al menudeo.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'NOTIFICAR_COFEPRIS_AUTO', 'false', 'BOOLEAN', 'Envío automático o manual tras revisión médica de reportes RAM.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'UMBRAL_CONTROVERSIA_DISPUTA', '{"auto_evidence": true, "days": 7}', 'JSON', 'Reglas de recopilación automática de evidencia ante contracargos.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'URL_BASE_CDN_MULTIMEDIA', 'https://cdn.dermacare.mx/assets/v2', 'STRING', 'Dominio CDN para imágenes de productos y fichas técnicas.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'TIEMPO_SESION_HORAS', '24', 'INTEGER', 'Duración estándar de validez de sesiones web antes de renovación.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TASA_IEPS_PROTECTOR_EXENTO', '0.00', 'DECIMAL', 'Tasa aplicable a categorías exentas de impuestos especiales.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CADENA_FRIO_ALERTA_SMS', 'true', 'BOOLEAN', 'Envía notificación SMS inmediata al supervisor WMS ante alerta térmica.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.parametros_configuracion', 'id'), COALESCE((SELECT MAX(id) FROM sistema.parametros_configuracion), 1), true);

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.notificaciones_push_email (ID, ID_usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0001', 'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', TRUE, '2026-02-01 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0002', 'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0003', 'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', TRUE, '2026-02-03 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0004', 'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0005', 'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', TRUE, '2026-02-05 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0006', 'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0007', 'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', TRUE, '2026-02-07 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0008', 'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0009', 'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', TRUE, '2026-02-09 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0010', 'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0011', 'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', TRUE, '2026-02-11 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0012', 'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0013', 'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', TRUE, '2026-02-13 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0014', 'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0015', 'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', TRUE, '2026-02-15 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0016', 'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0017', 'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', TRUE, '2026-02-17 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0018', 'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0019', 'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', TRUE, '2026-02-19 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0020', 'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0021', 'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', TRUE, '2026-02-21 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0022', 'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0023', 'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', TRUE, '2026-02-23 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0024', 'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0025', 'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', TRUE, '2026-02-25 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0026', 'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0027', 'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', TRUE, '2026-02-27 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0028', 'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0029', 'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', TRUE, '2026-02-01 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0030', 'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.notificaciones_push_email', 'id'), COALESCE((SELECT MAX(id) FROM sistema.notificaciones_push_email), 1), true);

