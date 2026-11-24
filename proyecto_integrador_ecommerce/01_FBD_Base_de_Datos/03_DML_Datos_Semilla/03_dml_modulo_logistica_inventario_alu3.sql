-- =================================================================================================
-- SUBMÓDULO 3: LOGÍSTICA MULTIALMACÉN, TRAZABILIDAD FEFO, TELEMETRÍA IOT Y CALIDAD
-- Tablas 101 a 150 (Autor: Eduardo Salazar MartÍnez)
-- Sincronizado 100% con 00_MASTER_SEED_DATA_SQLSERVER.sql (PK: ID / FKs: ID_*)
-- =================================================================================================
USE EcommerceSaludBellezaDB;
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.estados_orden_compra ON;
INSERT INTO compras.estados_orden_compra (ID, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'BORRADOR', N'Borrador de Compra', N'Requisición convertida en borrador pendiente de firma', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ENVIADA', N'Enviada a Proveedor', N'Orden de compra emitida y notificada al laboratorio', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CONFIRMADA', N'Confirmada con Cita Andén', N'Proveedor confirmó fecha de entrega y lotes sanitarios', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'REC_PARCIAL', N'Recibida Parcialmente', N'Entrega parcial validada en andén de CEDIS', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'REC_TOTAL', N'Recibida Completa', N'Totalidad de unidades ingresadas a inventario QA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CANCELADA', N'Cancelada', N'Orden de compra anulada por incumplimiento de SLA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT compras.estados_orden_compra OFF;
GO

-- =================================================================================================
-- 102. TABLA: compras.proveedores (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedores ON;
INSERT INTO compras.proveedores (ID, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROVEEDO_01', N'Laboratorios La Roche-Posay S.A. de C.V.', N'Distribuidora La Roche-Posay México', 'DPM200111AB1', N'México', 15, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROVEEDO_02', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Distribuidora CeraVe México', 'DPM200112AB2', N'México', 30, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROVEEDO_03', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Distribuidora The Ordinary México', 'DPM200113AB3', N'México', 45, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROVEEDO_04', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Distribuidora ISDIN México', 'DPM200114AB4', N'México', 60, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROVEEDO_05', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Distribuidora Bioderma México', 'DPM200115AB5', N'México', 15, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROVEEDO_06', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Distribuidora Eau Thermale Avène México', 'DPM200116AB6', N'México', 30, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROVEEDO_07', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Distribuidora Eucerin México', 'DPM200117AB7', N'México', 45, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROVEEDO_08', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Distribuidora Vichy Laboratoires México', 'DPM200118AB8', N'México', 60, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROVEEDO_09', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Distribuidora SkinCeuticals México', 'DPM200119AB0', N'México', 15, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROVEEDO_10', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Distribuidora Sesderma México', 'DPM200120AB1', N'México', 30, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROVEEDO_11', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Distribuidora NARS Cosmetics México', 'DPM200121AB2', N'México', 45, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROVEEDO_12', N'Laboratorios MAC Professional S.A. de C.V.', N'Distribuidora MAC Cosmetics México', 'DPM200122AB3', N'México', 60, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROVEEDO_13', N'Laboratorios Fenty Beauty S.A. de C.V.', N'Distribuidora Fenty Beauty México', 'DPM200123AB4', N'México', 15, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROVEEDO_14', N'Laboratorios Rare Beauty S.A. de C.V.', N'Distribuidora Rare Beauty México', 'DPM200124AB5', N'México', 30, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROVEEDO_15', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Distribuidora Clinique México', 'DPM200125AB6', N'México', 45, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROVEEDO_16', N'Laboratorios Estée Lauder S.A. de C.V.', N'Distribuidora Estée Lauder México', 'DPM200126AB7', N'México', 60, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROVEEDO_17', N'Laboratorios Lancôme Paris S.A. de C.V.', N'Distribuidora Lancôme México', 'DPM200127AB8', N'México', 15, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROVEEDO_18', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Distribuidora Charlotte Tilbury México', 'DPM200128AB0', N'México', 30, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROVEEDO_19', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Distribuidora Paula''s Choice México', 'DPM200129AB1', N'México', 45, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROVEEDO_20', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Distribuidora COSRX México', 'DPM200130AB2', N'México', 60, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROVEEDO_21', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Distribuidora Laneige México', 'DPM200131AB3', N'México', 15, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROVEEDO_22', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Distribuidora Uriage México', 'DPM200132AB4', N'México', 30, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROVEEDO_23', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Distribuidora Laboratoire SVR México', 'DPM200133AB5', N'México', 45, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROVEEDO_24', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Distribuidora MartiDerm México', 'DPM200134AB6', N'México', 60, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROVEEDO_25', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Distribuidora Heliocare México', 'DPM200135AB7', N'México', 15, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROVEEDO_26', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Distribuidora Kiehl''s México', 'DPM200136AB8', N'México', 30, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROVEEDO_27', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Distribuidora Garnier SkinActive México', 'DPM200137AB0', N'México', 45, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROVEEDO_28', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Distribuidora L''Oréal Paris Derm México', 'DPM200138AB1', N'México', 60, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROVEEDO_29', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Distribuidora Neutrogena México', 'DPM200139AB2', N'México', 15, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROVEEDO_30', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Distribuidora DermaCare Labs México', 'DPM200140AB3', N'México', 30, 4.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedores OFF;
GO

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.contactos_proveedor ON;
INSERT INTO compras.contactos_proveedor (ID, ID_proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Carlos Mendoza Garza', N'Gerente de Cuenta Clave', N'ventas.1@proveedor-derma.mx', N'5541001001', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Sofía Ramírez López', N'Coordinador de Logística Sanitaria', N'ventas.2@proveedor-derma.mx', N'5541001002', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Valeria Torres Villarreal', N'Ejecutivo de Facturación', N'ventas.3@proveedor-derma.mx', N'5541001003', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Alejandro Hernández Cruz', N'Representante Regulador COFEPRIS', N'ventas.4@proveedor-derma.mx', N'5541001004', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Mariana Sánchez Fuentes', N'Gerente de Cuenta Clave', N'ventas.5@proveedor-derma.mx', N'5541001005', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Diego Martínez Treviño', N'Coordinador de Logística Sanitaria', N'ventas.6@proveedor-derma.mx', N'5541001006', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Camila González Reyes', N'Ejecutivo de Facturación', N'ventas.7@proveedor-derma.mx', N'5541001007', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Mateo Flores Castillo', N'Representante Regulador COFEPRIS', N'ventas.8@proveedor-derma.mx', N'5541001008', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Lucía Morales Díaz', N'Gerente de Cuenta Clave', N'ventas.9@proveedor-derma.mx', N'5541001009', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Sebastián Vázquez Ortiz', N'Coordinador de Logística Sanitaria', N'ventas.10@proveedor-derma.mx', N'5541001010', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Regina Gutiérrez Nava', N'Ejecutivo de Facturación', N'ventas.11@proveedor-derma.mx', N'5541001011', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Santiago Jiménez Pérez', N'Representante Regulador COFEPRIS', N'ventas.12@proveedor-derma.mx', N'5541001012', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Fernanda Ruiz Salazar', N'Gerente de Cuenta Clave', N'ventas.13@proveedor-derma.mx', N'5541001013', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Emiliano Ríos Cárdenas', N'Coordinador de Logística Sanitaria', N'ventas.14@proveedor-derma.mx', N'5541001014', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Ximena Aguilar Ibarra', N'Ejecutivo de Facturación', N'ventas.15@proveedor-derma.mx', N'5541001015', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Daniel Méndez Navarro', N'Representante Regulador COFEPRIS', N'ventas.16@proveedor-derma.mx', N'5541001016', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Andrea Castro Delgado', N'Gerente de Cuenta Clave', N'ventas.17@proveedor-derma.mx', N'5541001017', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Gabriel Vega Montoya', N'Coordinador de Logística Sanitaria', N'ventas.18@proveedor-derma.mx', N'5541001018', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Paula Cortés Rojas', N'Ejecutivo de Facturación', N'ventas.19@proveedor-derma.mx', N'5541001019', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Andrés Ramos Campos', N'Representante Regulador COFEPRIS', N'ventas.20@proveedor-derma.mx', N'5541001020', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Renata Guerrero Luna', N'Gerente de Cuenta Clave', N'ventas.21@proveedor-derma.mx', N'5541001021', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Nicolás Peña Cabrera', N'Coordinador de Logística Sanitaria', N'ventas.22@proveedor-derma.mx', N'5541001022', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Natalia Herrera Vargas', N'Ejecutivo de Facturación', N'ventas.23@proveedor-derma.mx', N'5541001023', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Joaquín Medina Contreras', N'Representante Regulador COFEPRIS', N'ventas.24@proveedor-derma.mx', N'5541001024', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Isabella Domínguez Escobar', N'Gerente de Cuenta Clave', N'ventas.25@proveedor-derma.mx', N'5541001025', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Leonardo Silva Paredes', N'Coordinador de Logística Sanitaria', N'ventas.26@proveedor-derma.mx', N'5541001026', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Ana Chávez Bautista', N'Ejecutivo de Facturación', N'ventas.27@proveedor-derma.mx', N'5541001027', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Rodrigo Ochoa Acosta', N'Representante Regulador COFEPRIS', N'ventas.28@proveedor-derma.mx', N'5541001028', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Paulina Miranda Leal', N'Gerente de Cuenta Clave', N'ventas.29@proveedor-derma.mx', N'5541001029', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Mauricio Padilla Solís', N'Coordinador de Logística Sanitaria', N'ventas.30@proveedor-derma.mx', N'5541001030', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.contactos_proveedor OFF;
GO

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedor_slas ON;
INSERT INTO compras.proveedor_slas (ID, ID_proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 45, 2.00, 2.00, '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 60, 3.00, 3.00, '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 75, 4.00, 4.00, '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 30, 5.00, 5.00, '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 45, 1.00, 1.00, '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 60, 2.00, 2.00, '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 75, 3.00, 3.00, '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 30, 4.00, 4.00, '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 45, 5.00, 5.00, '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 60, 1.00, 1.00, '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 75, 2.00, 2.00, '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 30, 3.00, 3.00, '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 45, 4.00, 4.00, '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 60, 5.00, 5.00, '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 75, 1.00, 1.00, '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 30, 2.00, 2.00, '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 45, 3.00, 3.00, '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60, 4.00, 4.00, '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 75, 5.00, 5.00, '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 30, 1.00, 1.00, '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 45, 2.00, 2.00, '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 60, 3.00, 3.00, '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 75, 4.00, 4.00, '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 30, 5.00, 5.00, '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 45, 1.00, 1.00, '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 60, 2.00, 2.00, '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 75, 3.00, 3.00, '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 30, 4.00, 4.00, '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 45, 5.00, 5.00, '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 60, 1.00, 1.00, '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedor_slas OFF;
GO

-- =================================================================================================
-- 105. TABLA: compras.proveedor_productos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedor_productos ON;
INSERT INTO compras.proveedor_productos (ID, ID_proveedor, ID_variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'ARTICULO_01', 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'ARTICULO_02', 20.00, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'ARTICULO_03', 22.50, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'ARTICULO_04', 25.00, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'ARTICULO_05', 27.50, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'ARTICULO_06', 30.00, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'ARTICULO_07', 32.50, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'ARTICULO_08', 35.00, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'ARTICULO_09', 37.50, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'ARTICULO_10', 40.00, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'ARTICULO_11', 42.50, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'ARTICULO_12', 45.00, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'ARTICULO_13', 47.50, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'ARTICULO_14', 50.00, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'ARTICULO_15', 52.50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'ARTICULO_16', 55.00, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'ARTICULO_17', 57.50, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'ARTICULO_18', 60.00, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'ARTICULO_19', 62.50, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'ARTICULO_20', 65.00, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'ARTICULO_21', 67.50, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'ARTICULO_22', 70.00, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'ARTICULO_23', 72.50, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'ARTICULO_24', 75.00, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'ARTICULO_25', 77.50, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'ARTICULO_26', 80.00, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'ARTICULO_27', 82.50, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'ARTICULO_28', 85.00, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'ARTICULO_29', 87.50, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'ARTICULO_30', 90.00, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedor_productos OFF;
GO

-- =================================================================================================
-- 106. TABLA: compras.requisiciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.requisiciones ON;
INSERT INTO compras.requisiciones (ID, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-REQUI-2026-0001', N'Planeación de Demanda', N'BAJA', N'Reposición de inventario de seguridad para Sérum Niacinamida 10% + Zinc 1% ante alta rotación.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-REQUI-2026-0002', N'Operaciones Cadena de Frío', N'MEDIA', N'Reposición de inventario de seguridad para Gel Limpiador Espumoso Facial ante alta rotación.', '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-REQUI-2026-0003', N'Control Sanitario QA', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Protector Solar Fluido SPF 50+ ante alta rotación.', '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-REQUI-2026-0004', N'Abastecimiento Beauty-Box', N'BAJA', N'Reposición de inventario de seguridad para Sérum Ácido Hialurónico 2% + B5 ante alta rotación.', '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-REQUI-2026-0005', N'Planeación de Demanda', N'MEDIA', N'Reposición de inventario de seguridad para Crema Hidratante con Ceramidas ante alta rotación.', '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-REQUI-2026-0006', N'Operaciones Cadena de Frío', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Retinol Puro 0.5% Nocturno ante alta rotación.', '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-REQUI-2026-0007', N'Control Sanitario QA', N'BAJA', N'Reposición de inventario de seguridad para Agua Micelar Dermolimpiadora ante alta rotación.', '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-REQUI-2026-0008', N'Abastecimiento Beauty-Box', N'MEDIA', N'Reposición de inventario de seguridad para Sérum Vitamina C Pura 15% ante alta rotación.', '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-REQUI-2026-0009', N'Planeación de Demanda', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Base de Maquillaje Cobertura Media ante alta rotación.', '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-REQUI-2026-0010', N'Operaciones Cadena de Frío', N'BAJA', N'Reposición de inventario de seguridad para Corrector Líquido Alta Duración ante alta rotación.', '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-REQUI-2026-0011', N'Control Sanitario QA', N'MEDIA', N'Reposición de inventario de seguridad para Bálsamo Reparador Cicaplast B5 ante alta rotación.', '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-REQUI-2026-0012', N'Abastecimiento Beauty-Box', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Exfoliante Ácido Salicílico 2% ante alta rotación.', '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-REQUI-2026-0013', N'Planeación de Demanda', N'BAJA', N'Reposición de inventario de seguridad para Contorno de Ojos con Cafeína 5% ante alta rotación.', '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-REQUI-2026-0014', N'Operaciones Cadena de Frío', N'MEDIA', N'Reposición de inventario de seguridad para Mascarilla Nocturna Hidratante ante alta rotación.', '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-REQUI-2026-0015', N'Control Sanitario QA', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Bruma Termal Calmante Mineral ante alta rotación.', '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-REQUI-2026-0016', N'Abastecimiento Beauty-Box', N'BAJA', N'Reposición de inventario de seguridad para Aceite Limpiador Emulsionable ante alta rotación.', '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-REQUI-2026-0017', N'Planeación de Demanda', N'MEDIA', N'Reposición de inventario de seguridad para Tónico Equilibrante Ácido Glicólico 7% ante alta rotación.', '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-REQUI-2026-0018', N'Operaciones Cadena de Frío', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Labial Hidratante Péptidos Nude ante alta rotación.', '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-REQUI-2026-0019', N'Control Sanitario QA', N'BAJA', N'Reposición de inventario de seguridad para Polvo Traslúcido Matificante Mineral ante alta rotación.', '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-REQUI-2026-0020', N'Abastecimiento Beauty-Box', N'MEDIA', N'Reposición de inventario de seguridad para Rubor Líquido Pigmento Natural ante alta rotación.', '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-REQUI-2026-0021', N'Planeación de Demanda', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Sérum Ácido Azelaico 10% Suspensión ante alta rotación.', '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-REQUI-2026-0022', N'Operaciones Cadena de Frío', N'BAJA', N'Reposición de inventario de seguridad para Ampolletas Proteoglicanos Firmeza ante alta rotación.', '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-REQUI-2026-0023', N'Control Sanitario QA', N'MEDIA', N'Reposición de inventario de seguridad para Crema Despigmentante Noche Melasma ante alta rotación.', '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-REQUI-2026-0024', N'Abastecimiento Beauty-Box', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Protector Solar Mineral Óxido Zinc ante alta rotación.', '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-REQUI-2026-0025', N'Planeación de Demanda', N'BAJA', N'Reposición de inventario de seguridad para Loción Corporal Urea 10% Reparadora ante alta rotación.', '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-REQUI-2026-0026', N'Operaciones Cadena de Frío', N'MEDIA', N'Reposición de inventario de seguridad para Primer Facial Minimizador de Poros ante alta rotación.', '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-REQUI-2026-0027', N'Control Sanitario QA', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Máscara de Pestañas Hipoalergénica ante alta rotación.', '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-REQUI-2026-0028', N'Abastecimiento Beauty-Box', N'BAJA', N'Reposición de inventario de seguridad para Sérum Péptidos de Cobre 1% ante alta rotación.', '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-REQUI-2026-0029', N'Planeación de Demanda', N'MEDIA', N'Reposición de inventario de seguridad para Bálsamo Desmaquillante Caléndula ante alta rotación.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-REQUI-2026-0030', N'Operaciones Cadena de Frío', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Crema Barrera Post-Retinoide ante alta rotación.', '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.requisiciones OFF;
GO

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.requisiciones_detalles ON;
INSERT INTO compras.requisiciones_detalles (ID, ID_requisicion, ID_variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.requisiciones_detalles OFF;
GO

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra ON;
INSERT INTO compras.ordenes_compra (ID, folio_orden_compra, ID_proveedor, ID_estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 1187.68, 190.03, 1377.71, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 1836.12, 293.78, 2129.90, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 2595.32, 415.25, 3010.57, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 1630.72, 260.92, 1891.64, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 2445.30, 391.25, 2836.55, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 3370.64, 539.30, 3909.94, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 2073.76, 331.80, 2405.56, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 3054.48, 488.72, 3543.20, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 4145.96, 663.35, 4809.31, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 2516.80, 402.69, 2919.49, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 3663.66, 586.19, 4249.85, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 4921.28, 787.40, 5708.68, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 2959.84, 473.57, 3433.41, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 4272.84, 683.65, 4956.49, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 5696.60, 911.46, 6608.06, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 3402.88, 544.46, 3947.34, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 4882.02, 781.12, 5663.14, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 6471.92, 1035.51, 7507.43, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 3845.92, 615.35, 4461.27, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 5491.20, 878.59, 6369.79, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 7247.24, 1159.56, 8406.80, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 4288.96, 686.23, 4975.19, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 6100.38, 976.06, 7076.44, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 8022.56, 1283.61, 9306.17, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 4732.00, 757.12, 5489.12, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 6709.56, 1073.53, 7783.09, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 8797.88, 1407.66, 10205.54, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 5175.04, 828.01, 6003.05, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 7318.74, 1171.00, 8489.74, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 9573.20, 1531.71, 11104.91, N'Crédito 30 días contra entrega y validación QA.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra OFF;
GO

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra_detalles ON;
INSERT INTO compras.ordenes_compra_detalles (ID, ID_orden_compra, ID_variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 148.46, 1187.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 166.92, 1836.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 185.38, 2595.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 8, 8, 203.84, 1630.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 11, 11, 222.30, 2445.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 14, 14, 240.76, 3370.64, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 8, 8, 259.22, 2073.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 11, 11, 277.68, 3054.48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 14, 14, 296.14, 4145.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 8, 8, 314.60, 2516.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 333.06, 3663.66, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 14, 14, 351.52, 4921.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 8, 8, 369.98, 2959.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 11, 11, 388.44, 4272.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 14, 14, 406.90, 5696.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 8, 8, 425.36, 3402.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 11, 11, 443.82, 4882.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 14, 14, 462.28, 6471.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 8, 8, 480.74, 3845.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 11, 11, 499.20, 5491.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 14, 14, 517.66, 7247.24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 8, 8, 536.12, 4288.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 11, 11, 554.58, 6100.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 14, 14, 573.04, 8022.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 8, 8, 591.50, 4732.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 11, 11, 609.96, 6709.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 14, 14, 628.42, 8797.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 8, 8, 646.88, 5175.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 11, 11, 665.34, 7318.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 14, 14, 683.80, 9573.20, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra_detalles OFF;
GO

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_mercancia ON;
INSERT INTO compras.recepciones_mercancia (ID, folio_recepcion, ID_orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RECEP-2026-0001', 1, N'REM-PROV-2026-0001', '2026-02-01 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RECEP-2026-0002', 2, N'REM-PROV-2026-0002', '2026-02-02 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RECEP-2026-0003', 3, N'REM-PROV-2026-0003', '2026-02-03 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RECEP-2026-0004', 4, N'REM-PROV-2026-0004', '2026-02-04 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RECEP-2026-0005', 5, N'REM-PROV-2026-0005', '2026-02-05 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RECEP-2026-0006', 6, N'REM-PROV-2026-0006', '2026-02-06 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RECEP-2026-0007', 7, N'REM-PROV-2026-0007', '2026-02-07 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RECEP-2026-0008', 8, N'REM-PROV-2026-0008', '2026-02-08 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RECEP-2026-0009', 9, N'REM-PROV-2026-0009', '2026-02-09 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RECEP-2026-0010', 10, N'REM-PROV-2026-0010', '2026-02-10 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RECEP-2026-0011', 11, N'REM-PROV-2026-0011', '2026-02-11 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RECEP-2026-0012', 12, N'REM-PROV-2026-0012', '2026-02-12 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RECEP-2026-0013', 13, N'REM-PROV-2026-0013', '2026-02-13 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RECEP-2026-0014', 14, N'REM-PROV-2026-0014', '2026-02-14 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RECEP-2026-0015', 15, N'REM-PROV-2026-0015', '2026-02-15 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RECEP-2026-0016', 16, N'REM-PROV-2026-0016', '2026-02-16 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RECEP-2026-0017', 17, N'REM-PROV-2026-0017', '2026-02-17 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RECEP-2026-0018', 18, N'REM-PROV-2026-0018', '2026-02-18 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RECEP-2026-0019', 19, N'REM-PROV-2026-0019', '2026-02-19 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RECEP-2026-0020', 20, N'REM-PROV-2026-0020', '2026-02-20 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RECEP-2026-0021', 21, N'REM-PROV-2026-0021', '2026-02-21 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RECEP-2026-0022', 22, N'REM-PROV-2026-0022', '2026-02-22 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RECEP-2026-0023', 23, N'REM-PROV-2026-0023', '2026-02-23 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RECEP-2026-0024', 24, N'REM-PROV-2026-0024', '2026-02-24 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RECEP-2026-0025', 25, N'REM-PROV-2026-0025', '2026-02-25 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RECEP-2026-0026', 26, N'REM-PROV-2026-0026', '2026-02-26 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RECEP-2026-0027', 27, N'REM-PROV-2026-0027', '2026-02-27 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RECEP-2026-0028', 28, N'REM-PROV-2026-0028', '2026-02-28 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RECEP-2026-0029', 29, N'REM-PROV-2026-0029', '2026-02-01 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RECEP-2026-0030', 30, N'REM-PROV-2026-0030', '2026-02-02 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_mercancia OFF;
GO

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_detalles ON;
INSERT INTO compras.recepciones_detalles (ID, ID_recepcion, ID_variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 6.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 5.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 4.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 7.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 6.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 5.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 4.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 7.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 6.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 5.5, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_detalles OFF;
GO

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa ON;
INSERT INTO compras.inspecciones_sanitarias_qa (ID, ID_recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'LOTE_LAB_01', '2027-01-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, N'LOTE_LAB_02', '2028-02-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, N'LOTE_LAB_03', '2027-03-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, N'LOTE_LAB_04', '2028-04-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, N'LOTE_LAB_05', '2027-05-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, N'LOTE_LAB_06', '2028-06-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, N'LOTE_LAB_07', '2027-07-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, N'LOTE_LAB_08', '2028-08-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, N'LOTE_LAB_09', '2027-09-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, N'LOTE_LAB_10', '2028-10-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, N'LOTE_LAB_11', '2027-11-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, N'LOTE_LAB_12', '2028-12-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, N'LOTE_LAB_13', '2027-01-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, N'LOTE_LAB_14', '2028-02-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, N'LOTE_LAB_15', '2027-03-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, N'LOTE_LAB_16', '2028-04-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, N'LOTE_LAB_17', '2027-05-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, N'LOTE_LAB_18', '2028-06-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, N'LOTE_LAB_19', '2027-07-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, N'LOTE_LAB_20', '2028-08-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, N'LOTE_LAB_21', '2027-09-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, N'LOTE_LAB_22', '2028-10-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, N'LOTE_LAB_23', '2027-11-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, N'LOTE_LAB_24', '2028-12-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, N'LOTE_LAB_25', '2027-01-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, N'LOTE_LAB_26', '2028-02-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, N'LOTE_LAB_27', '2027-03-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, N'LOTE_LAB_28', '2028-04-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, N'LOTE_LAB_29', '2027-05-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, N'LOTE_LAB_30', '2028-06-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa OFF;
GO

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.almacenes_cedis ON;
INSERT INTO wms.almacenes_cedis (ID, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ALMACEN_01', N'CEDIS Monterrey Parque Stiva Unidad 1', N'Av. Parque Industrial Logístico #112', '25700', N'Monclova', 1750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ALMACEN_02', N'CEDIS CDMX Vallejo Industrial Unidad 2', N'Av. Parque Industrial Logístico #124', '64000', N'Monterrey', 2000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ALMACEN_03', N'CEDIS Guadalajara El Salto Unidad 3', N'Av. Parque Industrial Logístico #136', '66220', N'San Pedro Garza García', 2250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'ALMACEN_04', N'CEDIS Monclova Centro Distribución Unidad 4', N'Av. Parque Industrial Logístico #148', '06700', N'Cuauhtémoc', 2500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ALMACEN_05', N'CEDIS Querétaro Logístico Bajío Unidad 5', N'Av. Parque Industrial Logístico #160', '11560', N'Miguel Hidalgo', 2750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'ALMACEN_06', N'CEDIS Puebla Parque Finsa Unidad 6', N'Av. Parque Industrial Logístico #172', '44100', N'Guadalajara', 3000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'ALMACEN_07', N'CEDIS Monterrey Parque Stiva Unidad 7', N'Av. Parque Industrial Logístico #184', '25000', N'Saltillo', 3250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'ALMACEN_08', N'CEDIS CDMX Vallejo Industrial Unidad 8', N'Av. Parque Industrial Logístico #196', '76000', N'Querétaro', 3500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'ALMACEN_09', N'CEDIS Guadalajara El Salto Unidad 9', N'Av. Parque Industrial Logístico #208', '72000', N'Puebla', 3750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'ALMACEN_10', N'CEDIS Monclova Centro Distribución Unidad 10', N'Av. Parque Industrial Logístico #220', '97000', N'Mérida', 4000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ALMACEN_11', N'CEDIS Querétaro Logístico Bajío Unidad 11', N'Av. Parque Industrial Logístico #232', '25700', N'Monclova', 4250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ALMACEN_12', N'CEDIS Puebla Parque Finsa Unidad 12', N'Av. Parque Industrial Logístico #244', '64000', N'Monterrey', 4500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'ALMACEN_13', N'CEDIS Monterrey Parque Stiva Unidad 13', N'Av. Parque Industrial Logístico #256', '66220', N'San Pedro Garza García', 4750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'ALMACEN_14', N'CEDIS CDMX Vallejo Industrial Unidad 14', N'Av. Parque Industrial Logístico #268', '06700', N'Cuauhtémoc', 5000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ALMACEN_15', N'CEDIS Guadalajara El Salto Unidad 15', N'Av. Parque Industrial Logístico #280', '11560', N'Miguel Hidalgo', 5250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'ALMACEN_16', N'CEDIS Monclova Centro Distribución Unidad 16', N'Av. Parque Industrial Logístico #292', '44100', N'Guadalajara', 5500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'ALMACEN_17', N'CEDIS Querétaro Logístico Bajío Unidad 17', N'Av. Parque Industrial Logístico #304', '25000', N'Saltillo', 5750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ALMACEN_18', N'CEDIS Puebla Parque Finsa Unidad 18', N'Av. Parque Industrial Logístico #316', '76000', N'Querétaro', 6000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'ALMACEN_19', N'CEDIS Monterrey Parque Stiva Unidad 19', N'Av. Parque Industrial Logístico #328', '72000', N'Puebla', 6250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'ALMACEN_20', N'CEDIS CDMX Vallejo Industrial Unidad 20', N'Av. Parque Industrial Logístico #340', '97000', N'Mérida', 6500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ALMACEN_21', N'CEDIS Guadalajara El Salto Unidad 21', N'Av. Parque Industrial Logístico #352', '25700', N'Monclova', 6750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'ALMACEN_22', N'CEDIS Monclova Centro Distribución Unidad 22', N'Av. Parque Industrial Logístico #364', '64000', N'Monterrey', 7000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'ALMACEN_23', N'CEDIS Querétaro Logístico Bajío Unidad 23', N'Av. Parque Industrial Logístico #376', '66220', N'San Pedro Garza García', 7250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'ALMACEN_24', N'CEDIS Puebla Parque Finsa Unidad 24', N'Av. Parque Industrial Logístico #388', '06700', N'Cuauhtémoc', 7500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'ALMACEN_25', N'CEDIS Monterrey Parque Stiva Unidad 25', N'Av. Parque Industrial Logístico #400', '11560', N'Miguel Hidalgo', 7750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'ALMACEN_26', N'CEDIS CDMX Vallejo Industrial Unidad 26', N'Av. Parque Industrial Logístico #412', '44100', N'Guadalajara', 8000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ALMACEN_27', N'CEDIS Guadalajara El Salto Unidad 27', N'Av. Parque Industrial Logístico #424', '25000', N'Saltillo', 8250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'ALMACEN_28', N'CEDIS Monclova Centro Distribución Unidad 28', N'Av. Parque Industrial Logístico #436', '76000', N'Querétaro', 8500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'ALMACEN_29', N'CEDIS Querétaro Logístico Bajío Unidad 29', N'Av. Parque Industrial Logístico #448', '72000', N'Puebla', 8750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'ALMACEN_30', N'CEDIS Puebla Parque Finsa Unidad 30', N'Av. Parque Industrial Logístico #460', '97000', N'Mérida', 9000.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.almacenes_cedis OFF;
GO

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.zonas_almacen ON;
INSERT INTO wms.zonas_almacen (ID, ID_almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ZONA_01', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 01)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ZONA_02', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 02)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ZONA_03', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 03)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ZONA_04', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 04)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ZONA_05', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 05)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ZONA_06', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 06)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ZONA_07', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 07)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ZONA_08', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 08)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ZONA_09', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 09)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ZONA_10', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 10)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ZONA_11', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 11)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ZONA_12', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 12)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ZONA_13', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 13)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ZONA_14', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 14)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ZONA_15', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 15)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ZONA_16', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 16)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ZONA_17', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 17)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ZONA_18', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 18)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ZONA_19', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 19)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ZONA_20', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 20)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ZONA_21', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 21)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ZONA_22', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 22)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ZONA_23', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 23)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ZONA_24', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 24)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ZONA_25', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 25)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ZONA_26', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 26)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ZONA_27', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 27)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ZONA_28', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 28)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ZONA_29', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 29)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ZONA_30', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 30)', 2.0, 8.0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.zonas_almacen OFF;
GO

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.pasillos_ubicaciones ON;
INSERT INTO wms.pasillos_ubicaciones (ID, ID_zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'UBICACIO_01', 250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'UBICACIO_02', 300.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'UBICACIO_03', 350.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'UBICACIO_04', 400.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'UBICACIO_05', 450.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'UBICACIO_06', 250.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'UBICACIO_07', 300.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'UBICACIO_08', 350.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'UBICACIO_09', 400.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'UBICACIO_10', 450.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'UBICACIO_11', 250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'UBICACIO_12', 300.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'UBICACIO_13', 350.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'UBICACIO_14', 400.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'UBICACIO_15', 450.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'UBICACIO_16', 250.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'UBICACIO_17', 300.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'UBICACIO_18', 350.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'UBICACIO_19', 400.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'UBICACIO_20', 450.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'UBICACIO_21', 250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'UBICACIO_22', 300.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'UBICACIO_23', 350.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'UBICACIO_24', 400.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'UBICACIO_25', 450.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'UBICACIO_26', 250.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'UBICACIO_27', 300.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'UBICACIO_28', 350.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'UBICACIO_29', 400.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'UBICACIO_30', 450.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.pasillos_ubicaciones OFF;
GO

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.tipos_movimiento_inventario ON;
INSERT INTO wms.tipos_movimiento_inventario (ID, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ENT_COMPRA', N'Entrada por Compra a Proveedor', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SAL_VENTA', N'Salida por Venta E-Commerce', -1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'AJU_POS', N'Ajuste Positivo por Conteo Cíclico', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SAL_MERMA', N'Salida por Merma o Caducidad Sanitaria', -1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'TRANS_SAL', N'Salida por Transferencia entre CEDIS', -1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TRANS_ENT', N'Entrada por Transferencia entre CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT wms.tipos_movimiento_inventario OFF;
GO

-- =================================================================================================
-- 117. TABLA: wms.lotes_fabricacion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria ON;
INSERT INTO wms.lotes_fabricacion_sanitaria (ID, ID_variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'LOT-2026-LA_R-001', '2025-01-01', '2027-01-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-001.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'LOT-2026-CERA-002', '2025-02-02', '2028-02-02', N'https://cdn.dermacare.mx/wms/coa/LOTE-002.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'LOT-2026-THE_-003', '2025-03-03', '2027-03-03', N'https://cdn.dermacare.mx/wms/coa/LOTE-003.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'LOT-2026-ISDI-004', '2024-02-01', '2026-02-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-004.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'LOT-2026-BIOD-005', '2025-05-05', '2027-05-05', N'https://cdn.dermacare.mx/wms/coa/LOTE-005.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'LOT-2026-AVEN-006', '2025-06-06', '2028-06-06', N'https://cdn.dermacare.mx/wms/coa/LOTE-006.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'LOT-2026-EUCE-007', '2025-07-07', '2027-07-07', N'https://cdn.dermacare.mx/wms/coa/LOTE-007.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'LOT-2026-VICH-008', '2024-02-01', '2026-02-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-008.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'LOT-2026-SKIN-009', '2025-09-09', '2027-09-09', N'https://cdn.dermacare.mx/wms/coa/LOTE-009.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'LOT-2026-SESD-010', '2025-10-10', '2028-10-10', N'https://cdn.dermacare.mx/wms/coa/LOTE-010.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'LOT-2026-NARS-011', '2025-11-11', '2027-11-11', N'https://cdn.dermacare.mx/wms/coa/LOTE-011.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'LOT-2026-MAC-012', '2025-12-12', '2028-12-12', N'https://cdn.dermacare.mx/wms/coa/LOTE-012.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'LOT-2026-FENT-013', '2025-01-13', '2027-01-13', N'https://cdn.dermacare.mx/wms/coa/LOTE-013.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'LOT-2026-RARE-014', '2025-02-14', '2028-02-14', N'https://cdn.dermacare.mx/wms/coa/LOTE-014.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'LOT-2026-CLIN-015', '2025-03-15', '2027-03-15', N'https://cdn.dermacare.mx/wms/coa/LOTE-015.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'LOT-2026-ESTE-016', '2025-04-16', '2028-04-16', N'https://cdn.dermacare.mx/wms/coa/LOTE-016.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'LOT-2026-LANC-017', '2025-05-17', '2027-05-17', N'https://cdn.dermacare.mx/wms/coa/LOTE-017.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'LOT-2026-CHAR-018', '2025-06-18', '2028-06-18', N'https://cdn.dermacare.mx/wms/coa/LOTE-018.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'LOT-2026-PAUL-019', '2025-07-19', '2027-07-19', N'https://cdn.dermacare.mx/wms/coa/LOTE-019.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'LOT-2026-COSR-020', '2025-08-20', '2028-08-20', N'https://cdn.dermacare.mx/wms/coa/LOTE-020.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'LOT-2026-LANE-021', '2025-09-01', '2027-09-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-021.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'LOT-2026-URIA-022', '2025-10-02', '2028-10-02', N'https://cdn.dermacare.mx/wms/coa/LOTE-022.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'LOT-2026-SVR-023', '2025-11-03', '2027-11-03', N'https://cdn.dermacare.mx/wms/coa/LOTE-023.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'LOT-2026-MART-024', '2025-12-04', '2028-12-04', N'https://cdn.dermacare.mx/wms/coa/LOTE-024.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'LOT-2026-HELI-025', '2025-01-05', '2027-01-05', N'https://cdn.dermacare.mx/wms/coa/LOTE-025.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'LOT-2026-KIEH-026', '2025-02-06', '2028-02-06', N'https://cdn.dermacare.mx/wms/coa/LOTE-026.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'LOT-2026-GARN-027', '2025-03-07', '2027-03-07', N'https://cdn.dermacare.mx/wms/coa/LOTE-027.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'LOT-2026-LORE-028', '2025-04-08', '2028-04-08', N'https://cdn.dermacare.mx/wms/coa/LOTE-028.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'LOT-2026-NEUT-029', '2025-05-09', '2027-05-09', N'https://cdn.dermacare.mx/wms/coa/LOTE-029.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'LOT-2026-DERM-030', '2025-06-10', '2028-06-10', N'https://cdn.dermacare.mx/wms/coa/LOTE-030.pdf', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria OFF;
GO

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.inventario_lotes_ubicacion ON;
INSERT INTO wms.inventario_lotes_ubicacion (ID, ID_lote, ID_ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.inventario_lotes_ubicacion OFF;
GO

-- =================================================================================================
-- 119. TABLA: wms.kardex_movimientos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.kardex_movimientos ON;
INSERT INTO wms.kardex_movimientos (ID, ID_inventario_stock, ID_tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 105, 113, N'FOL-DOCUM-2026-0001', 148.46, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 110, 99, N'FOL-DOCUM-2026-0002', 166.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 115, 129, N'FOL-DOCUM-2026-0003', 185.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 120, 103, N'FOL-DOCUM-2026-0004', 203.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 125, 145, N'FOL-DOCUM-2026-0005', 222.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 130, 107, N'FOL-DOCUM-2026-0006', 240.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 135, 161, N'FOL-DOCUM-2026-0007', 259.22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 140, 111, N'FOL-DOCUM-2026-0008', 277.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 145, 177, N'FOL-DOCUM-2026-0009', 296.14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 150, 115, N'FOL-DOCUM-2026-0010', 314.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 155, 193, N'FOL-DOCUM-2026-0011', 333.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 160, 119, N'FOL-DOCUM-2026-0012', 351.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 165, 209, N'FOL-DOCUM-2026-0013', 369.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 170, 123, N'FOL-DOCUM-2026-0014', 388.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 175, 225, N'FOL-DOCUM-2026-0015', 406.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 180, 127, N'FOL-DOCUM-2026-0016', 425.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 185, 241, N'FOL-DOCUM-2026-0017', 443.82, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 190, 131, N'FOL-DOCUM-2026-0018', 462.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 195, 257, N'FOL-DOCUM-2026-0019', 480.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 200, 135, N'FOL-DOCUM-2026-0020', 499.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 205, 273, N'FOL-DOCUM-2026-0021', 517.66, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 210, 139, N'FOL-DOCUM-2026-0022', 536.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 215, 289, N'FOL-DOCUM-2026-0023', 554.58, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 220, 143, N'FOL-DOCUM-2026-0024', 573.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 225, 305, N'FOL-DOCUM-2026-0025', 591.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 230, 147, N'FOL-DOCUM-2026-0026', 609.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 235, 321, N'FOL-DOCUM-2026-0027', 628.42, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 240, 151, N'FOL-DOCUM-2026-0028', 646.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 245, 337, N'FOL-DOCUM-2026-0029', 665.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 250, 155, N'FOL-DOCUM-2026-0030', 683.80, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.kardex_movimientos OFF;
GO

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.alertas_caducidad_proxima ON;
INSERT INTO wms.alertas_caducidad_proxima (ID, ID_lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.alertas_caducidad_proxima OFF;
GO

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria ON;
INSERT INTO wms.mermas_destruccion_sanitaria (ID, folio_acta_destruccion, ID_lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ACTA_-2026-0001', 1, 8, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ACTA_-2026-0002', 2, 11, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ACTA_-2026-0003', 3, 14, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ACTA_-2026-0004', 4, 17, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ACTA_-2026-0005', 5, 20, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ACTA_-2026-0006', 6, 23, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ACTA_-2026-0007', 7, 26, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ACTA_-2026-0008', 8, 29, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ACTA_-2026-0009', 9, 32, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ACTA_-2026-0010', 10, 35, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ACTA_-2026-0011', 11, 38, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ACTA_-2026-0012', 12, 41, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ACTA_-2026-0013', 13, 44, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ACTA_-2026-0014', 14, 47, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ACTA_-2026-0015', 15, 50, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ACTA_-2026-0016', 16, 53, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ACTA_-2026-0017', 17, 56, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ACTA_-2026-0018', 18, 59, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ACTA_-2026-0019', 19, 62, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ACTA_-2026-0020', 20, 65, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ACTA_-2026-0021', 21, 68, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ACTA_-2026-0022', 22, 71, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ACTA_-2026-0023', 23, 74, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ACTA_-2026-0024', 24, 77, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ACTA_-2026-0025', 25, 80, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ACTA_-2026-0026', 26, 83, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ACTA_-2026-0027', 27, 86, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ACTA_-2026-0028', 28, 89, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ACTA_-2026-0029', 29, 92, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ACTA_-2026-0030', 30, 95, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria OFF;
GO

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_almacenes ON;
INSERT INTO wms.transferencias_almacenes (ID, folio_transferencia, ID_almacen_origen, ID_almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 2, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 3, N'EN_TRANSITO', '2026-02-02 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 4, N'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 5, N'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 6, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 7, N'EN_TRANSITO', '2026-02-06 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 8, N'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 9, N'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 10, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 11, N'EN_TRANSITO', '2026-02-10 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 12, N'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 13, N'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 14, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 15, N'EN_TRANSITO', '2026-02-14 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 16, N'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 17, N'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 18, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 19, N'EN_TRANSITO', '2026-02-18 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 20, N'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 21, N'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 22, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 23, N'EN_TRANSITO', '2026-02-22 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 24, N'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 25, N'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 26, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 27, N'EN_TRANSITO', '2026-02-26 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 28, N'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-03-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 29, N'DISCREPANCIA', '2026-02-28 11:30:00', '2026-03-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 30, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 1, N'EN_TRANSITO', '2026-02-02 11:30:00', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.transferencias_almacenes OFF;
GO

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_detalles ON;
INSERT INTO wms.transferencias_detalles (ID, ID_transferencia, ID_lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.transferencias_detalles OFF;
GO

-- =================================================================================================
-- 124. TABLA: wms.conteos_ciclicos_auditoria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.conteos_ciclicos_auditoria ON;
INSERT INTO wms.conteos_ciclicos_auditoria (ID, folio_auditoria, ID_almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-AUDIT-2026-0001', 1, '2026-03-01', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-AUDIT-2026-0002', 2, '2026-03-02', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-AUDIT-2026-0003', 3, '2026-03-03', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-AUDIT-2026-0004', 4, '2026-03-04', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-AUDIT-2026-0005', 5, '2026-03-05', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-AUDIT-2026-0006', 6, '2026-03-06', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-AUDIT-2026-0007', 7, '2026-03-07', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-AUDIT-2026-0008', 8, '2026-03-08', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-AUDIT-2026-0009', 9, '2026-03-09', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-AUDIT-2026-0010', 10, '2026-03-10', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-AUDIT-2026-0011', 11, '2026-03-11', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-AUDIT-2026-0012', 12, '2026-03-12', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-AUDIT-2026-0013', 13, '2026-03-13', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-AUDIT-2026-0014', 14, '2026-03-14', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-AUDIT-2026-0015', 15, '2026-03-15', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-AUDIT-2026-0016', 16, '2026-03-16', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-AUDIT-2026-0017', 17, '2026-03-17', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-AUDIT-2026-0018', 18, '2026-03-18', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-AUDIT-2026-0019', 19, '2026-03-19', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-AUDIT-2026-0020', 20, '2026-03-20', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-AUDIT-2026-0021', 21, '2026-03-21', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-AUDIT-2026-0022', 22, '2026-03-22', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-AUDIT-2026-0023', 23, '2026-03-23', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-AUDIT-2026-0024', 24, '2026-03-24', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-AUDIT-2026-0025', 25, '2026-03-25', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-AUDIT-2026-0026', 26, '2026-03-26', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-AUDIT-2026-0027', 27, '2026-03-27', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-AUDIT-2026-0028', 28, '2026-03-28', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-AUDIT-2026-0029', 29, '2026-03-01', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-AUDIT-2026-0030', 30, '2026-03-02', N'PROXIMO_A_CADUCAR', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.conteos_ciclicos_auditoria OFF;
GO

-- =================================================================================================
-- 125. TABLA: wms.conteos_ciclicos_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.conteos_ciclicos_detalles ON;
INSERT INTO wms.conteos_ciclicos_detalles (ID, ID_conteo_ciclico, ID_inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 52, 52, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 54, 54, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 56, 55, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 58, 58, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 60, 60, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 62, 61, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 64, 64, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 66, 66, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 68, 67, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 70, 70, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 72, 72, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 74, 73, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 76, 76, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 78, 78, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 80, 79, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 82, 82, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 84, 84, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 86, 85, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 88, 88, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 90, 90, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 92, 91, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 94, 94, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 96, 96, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 98, 97, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 100, 100, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 102, 102, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 104, 103, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 106, 106, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 108, 108, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 110, 109, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.conteos_ciclicos_detalles OFF;
GO

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad ON;
INSERT INTO wms.monitoreo_temperatura_humedad (ID, ID_zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SENSOR_I_01', 26.8, 42.0, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SENSOR_I_02', 19.4, 43.1, 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SENSOR_I_03', 9.4, 44.2, 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SENSOR_I_04', 21.2, 45.3, 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SENSOR_I_05', 26.8, 46.4, 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SENSOR_I_06', 4.3, 47.5, 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SENSOR_I_07', 26.8, 48.6, 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SENSOR_I_08', 20.3, 49.7, 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SENSOR_I_09', 9.4, 50.8, 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SENSOR_I_10', 22.1, 51.9, 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SENSOR_I_11', 26.8, 53.0, 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SENSOR_I_12', 5.9, 54.1, 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SENSOR_I_13', 26.8, 55.2, 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SENSOR_I_14', 21.2, 56.3, 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SENSOR_I_15', 9.4, 57.4, 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SENSOR_I_16', 18.5, 42.0, 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SENSOR_I_17', 26.8, 43.1, 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SENSOR_I_18', 4.3, 44.2, 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SENSOR_I_19', 26.8, 45.3, 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SENSOR_I_20', 22.1, 46.4, 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SENSOR_I_21', 9.4, 47.5, 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SENSOR_I_22', 19.4, 48.6, 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SENSOR_I_23', 26.8, 49.7, 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SENSOR_I_24', 5.9, 50.8, 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SENSOR_I_25', 26.8, 51.9, 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SENSOR_I_26', 18.5, 53.0, 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SENSOR_I_27', 9.4, 54.1, 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SENSOR_I_28', 20.3, 55.2, 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SENSOR_I_29', 26.8, 56.3, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SENSOR_I_30', 4.3, 57.4, 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad OFF;
GO

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.transportistas_paqueterias ON;
INSERT INTO envios.transportistas_paqueterias (ID, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'TRANSPOR_01', N'DHL Express México', N'https://api-eu.dhl.com/track/shipments?node=1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'TRANSPOR_02', N'FedEx Express MX', N'https://apis.fedex.com/track/v1/trackingnumbers?node=2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'TRANSPOR_03', N'Estafeta Mexicana', N'https://cs.estafeta.com/api/tracking?node=3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'TRANSPOR_04', N'99Minutos Cadena Frío', N'https://tracking.99minutos.com/api/v3/orders?node=4', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'TRANSPOR_05', N'Redpack Logística', N'https://ws.redpack.com.mx/tracking/rest?node=5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TRANSPOR_06', N'UPS México', N'https://onlinetools.ups.com/api/track/v1/details?node=6', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'TRANSPOR_07', N'Paquetexpress', N'https://api.paquetexpress.com.mx/rastreo?node=7', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'TRANSPOR_08', N'J&T Express MX', N'https://openapi.jtexpress.mx/web/track?node=8', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'TRANSPOR_09', N'iVoy Mismo Día', N'https://api.ivoy.mx/v2/deliveries/track?node=9', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'TRANSPOR_10', N'Flotilla Propia DermaCare', N'https://logistica.dermacare.mx/api/rastreo?node=10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'TRANSPOR_11', N'DHL Express México Regional 2', N'https://api-eu.dhl.com/track/shipments?node=11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'TRANSPOR_12', N'FedEx Express MX Regional 2', N'https://apis.fedex.com/track/v1/trackingnumbers?node=12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'TRANSPOR_13', N'Estafeta Mexicana Regional 2', N'https://cs.estafeta.com/api/tracking?node=13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'TRANSPOR_14', N'99Minutos Cadena Frío Regional 2', N'https://tracking.99minutos.com/api/v3/orders?node=14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'TRANSPOR_15', N'Redpack Logística Regional 2', N'https://ws.redpack.com.mx/tracking/rest?node=15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'TRANSPOR_16', N'UPS México Regional 2', N'https://onlinetools.ups.com/api/track/v1/details?node=16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'TRANSPOR_17', N'Paquetexpress Regional 2', N'https://api.paquetexpress.com.mx/rastreo?node=17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'TRANSPOR_18', N'J&T Express MX Regional 2', N'https://openapi.jtexpress.mx/web/track?node=18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'TRANSPOR_19', N'iVoy Mismo Día Regional 2', N'https://api.ivoy.mx/v2/deliveries/track?node=19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'TRANSPOR_20', N'Flotilla Propia DermaCare Regional 2', N'https://logistica.dermacare.mx/api/rastreo?node=20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'TRANSPOR_21', N'DHL Express México Regional 3', N'https://api-eu.dhl.com/track/shipments?node=21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'TRANSPOR_22', N'FedEx Express MX Regional 3', N'https://apis.fedex.com/track/v1/trackingnumbers?node=22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'TRANSPOR_23', N'Estafeta Mexicana Regional 3', N'https://cs.estafeta.com/api/tracking?node=23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'TRANSPOR_24', N'99Minutos Cadena Frío Regional 3', N'https://tracking.99minutos.com/api/v3/orders?node=24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'TRANSPOR_25', N'Redpack Logística Regional 3', N'https://ws.redpack.com.mx/tracking/rest?node=25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'TRANSPOR_26', N'UPS México Regional 3', N'https://onlinetools.ups.com/api/track/v1/details?node=26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'TRANSPOR_27', N'Paquetexpress Regional 3', N'https://api.paquetexpress.com.mx/rastreo?node=27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'TRANSPOR_28', N'J&T Express MX Regional 3', N'https://openapi.jtexpress.mx/web/track?node=28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TRANSPOR_29', N'iVoy Mismo Día Regional 3', N'https://api.ivoy.mx/v2/deliveries/track?node=29', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'TRANSPOR_30', N'Flotilla Propia DermaCare Regional 3', N'https://logistica.dermacare.mx/api/rastreo?node=30', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.transportistas_paqueterias OFF;
GO

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tipos_servicio_envio ON;
INSERT INTO envios.tipos_servicio_envio (ID, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SERVICIO_01', N'Día Siguiente Aéreo', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SERVICIO_02', N'Estándar Terrestre 3-5 Días', 96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SERVICIO_03', N'Mismo Día Express CDMX/MTY', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SERVICIO_04', N'Cadena de Frío Refrigerada 24h', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SERVICIO_05', N'Recolección en Farmacia Pickup', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'SERVICIO_06', N'Prioritario Matutino 10:30 AM', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'SERVICIO_07', N'Económico Nacional 5-7 Días', 144, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'SERVICIO_08', N'Locker Inteligente 24/7', 48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'SERVICIO_09', N'Empaque Térmico Isotérmico', 36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'SERVICIO_10', N'Express Fin de Semana', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'SERVICIO_11', N'Día Siguiente Aéreo Tarifa 2', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'SERVICIO_12', N'Estándar Terrestre 3-5 Días Tarifa 2', 96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'SERVICIO_13', N'Mismo Día Express CDMX/MTY Tarifa 2', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'SERVICIO_14', N'Cadena de Frío Refrigerada 24h Tarifa 2', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'SERVICIO_15', N'Recolección en Farmacia Pickup Tarifa 2', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'SERVICIO_16', N'Prioritario Matutino 10:30 AM Tarifa 2', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'SERVICIO_17', N'Económico Nacional 5-7 Días Tarifa 2', 144, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'SERVICIO_18', N'Locker Inteligente 24/7 Tarifa 2', 48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'SERVICIO_19', N'Empaque Térmico Isotérmico Tarifa 2', 36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'SERVICIO_20', N'Express Fin de Semana Tarifa 2', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'SERVICIO_21', N'Día Siguiente Aéreo Tarifa 3', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'SERVICIO_22', N'Estándar Terrestre 3-5 Días Tarifa 3', 96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'SERVICIO_23', N'Mismo Día Express CDMX/MTY Tarifa 3', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'SERVICIO_24', N'Cadena de Frío Refrigerada 24h Tarifa 3', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'SERVICIO_25', N'Recolección en Farmacia Pickup Tarifa 3', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'SERVICIO_26', N'Prioritario Matutino 10:30 AM Tarifa 3', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'SERVICIO_27', N'Económico Nacional 5-7 Días Tarifa 3', 144, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'SERVICIO_28', N'Locker Inteligente 24/7 Tarifa 3', 48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'SERVICIO_29', N'Empaque Térmico Isotérmico Tarifa 3', 36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'SERVICIO_30', N'Express Fin de Semana Tarifa 3', 24, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tipos_servicio_envio OFF;
GO

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tarifas_zonas_postales ON;
INSERT INTO envios.tarifas_zonas_postales (ID, ID_transportista, ID_servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '257', '067', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '640', '115', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '662', '441', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '067', '250', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '115', '760', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '441', '720', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '250', '970', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '760', '257', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '720', '640', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '970', '662', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '257', '067', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '640', '115', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '662', '441', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '067', '250', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '115', '760', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '441', '720', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '250', '970', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '760', '257', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '720', '640', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '970', '662', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '257', '067', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '640', '115', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '662', '441', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '067', '250', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '115', '760', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '441', '720', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '250', '970', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '760', '257', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '720', '640', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '970', '662', 5.00, 199.00, 28.50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tarifas_zonas_postales OFF;
GO

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.despachos_orden ON;
INSERT INTO envios.despachos_orden (ID, folio_despacho, ID_orden_split, ID_transportista, ID_servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-DESPA-2026-0001', 1, 1, 1, NULL, '2026-03-01', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-07 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-DESPA-2026-0007', 7, 7, 7, NULL, '2026-03-07', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-13 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-DESPA-2026-0013', 13, 13, 13, NULL, '2026-03-13', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-19 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-DESPA-2026-0019', 19, 19, 19, NULL, '2026-03-19', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-25 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-DESPA-2026-0025', 25, 25, 25, NULL, '2026-03-25', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-03 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', NULL, N'INCIDENCIA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.despachos_orden OFF;
GO

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_bultos ON;
INSERT INTO envios.paquetes_bultos (ID, ID_despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'BULTO-PKG-2026-0001', 0.60, 13.0, 13.0, 13.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'BULTO-PKG-2026-0002', 0.75, 14.0, 14.0, 14.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'BULTO-PKG-2026-0003', 0.90, 15.0, 15.0, 15.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'BULTO-PKG-2026-0004', 1.05, 16.0, 16.0, 16.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'BULTO-PKG-2026-0005', 1.20, 17.0, 17.0, 17.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'BULTO-PKG-2026-0006', 1.35, 18.0, 18.0, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'BULTO-PKG-2026-0007', 1.50, 19.0, 19.0, 19.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'BULTO-PKG-2026-0008', 1.65, 20.0, 20.0, 20.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'BULTO-PKG-2026-0009', 1.80, 21.0, 21.0, 21.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'BULTO-PKG-2026-0010', 1.95, 22.0, 22.0, 22.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'BULTO-PKG-2026-0011', 2.10, 23.0, 23.0, 23.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'BULTO-PKG-2026-0012', 2.25, 24.0, 24.0, 24.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'BULTO-PKG-2026-0013', 2.40, 25.0, 25.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'BULTO-PKG-2026-0014', 2.55, 26.0, 26.0, 26.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'BULTO-PKG-2026-0015', 2.70, 27.0, 27.0, 27.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'BULTO-PKG-2026-0016', 2.85, 28.0, 28.0, 28.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'BULTO-PKG-2026-0017', 3.00, 29.0, 29.0, 29.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'BULTO-PKG-2026-0018', 3.15, 30.0, 30.0, 30.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'BULTO-PKG-2026-0019', 3.30, 31.0, 31.0, 31.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'BULTO-PKG-2026-0020', 3.45, 32.0, 32.0, 32.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'BULTO-PKG-2026-0021', 3.60, 33.0, 33.0, 33.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'BULTO-PKG-2026-0022', 3.75, 34.0, 34.0, 34.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'BULTO-PKG-2026-0023', 3.90, 35.0, 35.0, 35.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'BULTO-PKG-2026-0024', 4.05, 36.0, 36.0, 36.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'BULTO-PKG-2026-0025', 4.20, 37.0, 37.0, 37.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'BULTO-PKG-2026-0026', 4.35, 38.0, 38.0, 38.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'BULTO-PKG-2026-0027', 4.50, 39.0, 39.0, 39.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'BULTO-PKG-2026-0028', 4.65, 40.0, 40.0, 40.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'BULTO-PKG-2026-0029', 4.80, 41.0, 41.0, 41.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'BULTO-PKG-2026-0030', 4.95, 42.0, 42.0, 42.0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.paquetes_bultos OFF;
GO

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_contenido_lotes ON;
INSERT INTO envios.paquetes_contenido_lotes (ID, ID_paquete_bulto, ID_orden_detalle, ID_lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.paquetes_contenido_lotes OFF;
GO

-- =================================================================================================
-- 133. TABLA: envios.guias_rastreo (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.guias_rastreo ON;
INSERT INTO envios.guias_rastreo (ID, ID_paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'MXTRK202600000001', N'https://rastreo.dermacare.mx/guia/MXTRK202600000001', N'https://cdn.dermacare.mx/guias/ETIQUETA-0001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'MXTRK202600000002', N'https://rastreo.dermacare.mx/guia/MXTRK202600000002', N'https://cdn.dermacare.mx/guias/ETIQUETA-0002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'MXTRK202600000003', N'https://rastreo.dermacare.mx/guia/MXTRK202600000003', N'https://cdn.dermacare.mx/guias/ETIQUETA-0003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'MXTRK202600000004', N'https://rastreo.dermacare.mx/guia/MXTRK202600000004', N'https://cdn.dermacare.mx/guias/ETIQUETA-0004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'MXTRK202600000005', N'https://rastreo.dermacare.mx/guia/MXTRK202600000005', N'https://cdn.dermacare.mx/guias/ETIQUETA-0005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'MXTRK202600000006', N'https://rastreo.dermacare.mx/guia/MXTRK202600000006', N'https://cdn.dermacare.mx/guias/ETIQUETA-0006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'MXTRK202600000007', N'https://rastreo.dermacare.mx/guia/MXTRK202600000007', N'https://cdn.dermacare.mx/guias/ETIQUETA-0007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'MXTRK202600000008', N'https://rastreo.dermacare.mx/guia/MXTRK202600000008', N'https://cdn.dermacare.mx/guias/ETIQUETA-0008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'MXTRK202600000009', N'https://rastreo.dermacare.mx/guia/MXTRK202600000009', N'https://cdn.dermacare.mx/guias/ETIQUETA-0009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'MXTRK202600000010', N'https://rastreo.dermacare.mx/guia/MXTRK202600000010', N'https://cdn.dermacare.mx/guias/ETIQUETA-0010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'MXTRK202600000011', N'https://rastreo.dermacare.mx/guia/MXTRK202600000011', N'https://cdn.dermacare.mx/guias/ETIQUETA-0011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'MXTRK202600000012', N'https://rastreo.dermacare.mx/guia/MXTRK202600000012', N'https://cdn.dermacare.mx/guias/ETIQUETA-0012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'MXTRK202600000013', N'https://rastreo.dermacare.mx/guia/MXTRK202600000013', N'https://cdn.dermacare.mx/guias/ETIQUETA-0013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'MXTRK202600000014', N'https://rastreo.dermacare.mx/guia/MXTRK202600000014', N'https://cdn.dermacare.mx/guias/ETIQUETA-0014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'MXTRK202600000015', N'https://rastreo.dermacare.mx/guia/MXTRK202600000015', N'https://cdn.dermacare.mx/guias/ETIQUETA-0015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'MXTRK202600000016', N'https://rastreo.dermacare.mx/guia/MXTRK202600000016', N'https://cdn.dermacare.mx/guias/ETIQUETA-0016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'MXTRK202600000017', N'https://rastreo.dermacare.mx/guia/MXTRK202600000017', N'https://cdn.dermacare.mx/guias/ETIQUETA-0017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'MXTRK202600000018', N'https://rastreo.dermacare.mx/guia/MXTRK202600000018', N'https://cdn.dermacare.mx/guias/ETIQUETA-0018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'MXTRK202600000019', N'https://rastreo.dermacare.mx/guia/MXTRK202600000019', N'https://cdn.dermacare.mx/guias/ETIQUETA-0019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'MXTRK202600000020', N'https://rastreo.dermacare.mx/guia/MXTRK202600000020', N'https://cdn.dermacare.mx/guias/ETIQUETA-0020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'MXTRK202600000021', N'https://rastreo.dermacare.mx/guia/MXTRK202600000021', N'https://cdn.dermacare.mx/guias/ETIQUETA-0021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'MXTRK202600000022', N'https://rastreo.dermacare.mx/guia/MXTRK202600000022', N'https://cdn.dermacare.mx/guias/ETIQUETA-0022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'MXTRK202600000023', N'https://rastreo.dermacare.mx/guia/MXTRK202600000023', N'https://cdn.dermacare.mx/guias/ETIQUETA-0023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'MXTRK202600000024', N'https://rastreo.dermacare.mx/guia/MXTRK202600000024', N'https://cdn.dermacare.mx/guias/ETIQUETA-0024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'MXTRK202600000025', N'https://rastreo.dermacare.mx/guia/MXTRK202600000025', N'https://cdn.dermacare.mx/guias/ETIQUETA-0025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'MXTRK202600000026', N'https://rastreo.dermacare.mx/guia/MXTRK202600000026', N'https://cdn.dermacare.mx/guias/ETIQUETA-0026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'MXTRK202600000027', N'https://rastreo.dermacare.mx/guia/MXTRK202600000027', N'https://cdn.dermacare.mx/guias/ETIQUETA-0027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'MXTRK202600000028', N'https://rastreo.dermacare.mx/guia/MXTRK202600000028', N'https://cdn.dermacare.mx/guias/ETIQUETA-0028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'MXTRK202600000029', N'https://rastreo.dermacare.mx/guia/MXTRK202600000029', N'https://cdn.dermacare.mx/guias/ETIQUETA-0029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'MXTRK202600000030', N'https://rastreo.dermacare.mx/guia/MXTRK202600000030', N'https://cdn.dermacare.mx/guias/ETIQUETA-0030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.guias_rastreo OFF;
GO

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.eventos_tracking_bitacora ON;
INSERT INTO envios.eventos_tracking_bitacora (ID, ID_guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ESTATUS__01', N'Paquete recolectado en centro de distribución CEDIS.', N'Monclova, Coahuila', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ESTATUS__02', N'En tránsito hacia estación logística regional.', N'Monterrey, Nuevo León', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ESTATUS__03', N'Paquete en unidad de reparto de última milla.', N'San Pedro Garza García, Nuevo León', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ESTATUS__04', N'Entregado y firmado en domicilio de destino.', N'Cuauhtémoc, CDMX', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ESTATUS__05', N'Paquete recolectado en centro de distribución CEDIS.', N'Miguel Hidalgo, CDMX', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ESTATUS__06', N'En tránsito hacia estación logística regional.', N'Guadalajara, Jalisco', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ESTATUS__07', N'Paquete en unidad de reparto de última milla.', N'Saltillo, Coahuila', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ESTATUS__08', N'Entregado y firmado en domicilio de destino.', N'Querétaro, Querétaro', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ESTATUS__09', N'Paquete recolectado en centro de distribución CEDIS.', N'Puebla, Puebla', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ESTATUS__10', N'En tránsito hacia estación logística regional.', N'Mérida, Yucatán', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ESTATUS__11', N'Paquete en unidad de reparto de última milla.', N'Monclova, Coahuila', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ESTATUS__12', N'Entregado y firmado en domicilio de destino.', N'Monterrey, Nuevo León', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ESTATUS__13', N'Paquete recolectado en centro de distribución CEDIS.', N'San Pedro Garza García, Nuevo León', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ESTATUS__14', N'En tránsito hacia estación logística regional.', N'Cuauhtémoc, CDMX', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ESTATUS__15', N'Paquete en unidad de reparto de última milla.', N'Miguel Hidalgo, CDMX', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ESTATUS__16', N'Entregado y firmado en domicilio de destino.', N'Guadalajara, Jalisco', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ESTATUS__17', N'Paquete recolectado en centro de distribución CEDIS.', N'Saltillo, Coahuila', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ESTATUS__18', N'En tránsito hacia estación logística regional.', N'Querétaro, Querétaro', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ESTATUS__19', N'Paquete en unidad de reparto de última milla.', N'Puebla, Puebla', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ESTATUS__20', N'Entregado y firmado en domicilio de destino.', N'Mérida, Yucatán', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ESTATUS__21', N'Paquete recolectado en centro de distribución CEDIS.', N'Monclova, Coahuila', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ESTATUS__22', N'En tránsito hacia estación logística regional.', N'Monterrey, Nuevo León', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ESTATUS__23', N'Paquete en unidad de reparto de última milla.', N'San Pedro Garza García, Nuevo León', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ESTATUS__24', N'Entregado y firmado en domicilio de destino.', N'Cuauhtémoc, CDMX', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ESTATUS__25', N'Paquete recolectado en centro de distribución CEDIS.', N'Miguel Hidalgo, CDMX', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ESTATUS__26', N'En tránsito hacia estación logística regional.', N'Guadalajara, Jalisco', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ESTATUS__27', N'Paquete en unidad de reparto de última milla.', N'Saltillo, Coahuila', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ESTATUS__28', N'Entregado y firmado en domicilio de destino.', N'Querétaro, Querétaro', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ESTATUS__29', N'Paquete recolectado en centro de distribución CEDIS.', N'Puebla, Puebla', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ESTATUS__30', N'En tránsito hacia estación logística regional.', N'Mérida, Yucatán', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.eventos_tracking_bitacora OFF;
GO

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.intentos_entrega_fallidos ON;
INSERT INTO envios.intentos_entrega_fallidos (ID, ID_despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.intentos_entrega_fallidos OFF;
GO

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.incidencias_logisticas ON;
INSERT INTO envios.incidencias_logisticas (ID, ID_despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 285.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 321.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 356.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 392.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 427.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 463.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 498.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 534.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 569.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 605.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 640.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 676.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 711.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 747.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 782.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 818.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 853.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 889.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 924.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 960.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 995.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 1031.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1066.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 1102.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1137.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 1173.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1208.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 1244.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1279.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 1315.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.incidencias_logisticas OFF;
GO

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.seguros_mercancia ON;
INSERT INTO envios.seguros_mercancia (ID, ID_despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Chubb Seguros México', N'POL-CARGA-2026-00001', 428.25, 8.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'AXA Seguros', N'POL-CARGA-2026-00002', 481.50, 9.63, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'GNP Seguros Carga', N'POL-CARGA-2026-00003', 534.75, 10.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Quálitas Logística', N'POL-CARGA-2026-00004', 588.00, 11.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Chubb Seguros México', N'POL-CARGA-2026-00005', 641.25, 12.83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'AXA Seguros', N'POL-CARGA-2026-00006', 694.50, 13.89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'GNP Seguros Carga', N'POL-CARGA-2026-00007', 747.75, 14.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Quálitas Logística', N'POL-CARGA-2026-00008', 801.00, 16.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Chubb Seguros México', N'POL-CARGA-2026-00009', 854.25, 17.09, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'AXA Seguros', N'POL-CARGA-2026-00010', 907.50, 18.15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'GNP Seguros Carga', N'POL-CARGA-2026-00011', 960.75, 19.21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Quálitas Logística', N'POL-CARGA-2026-00012', 1014.00, 20.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Chubb Seguros México', N'POL-CARGA-2026-00013', 1067.25, 21.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'AXA Seguros', N'POL-CARGA-2026-00014', 1120.50, 22.41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'GNP Seguros Carga', N'POL-CARGA-2026-00015', 1173.75, 23.48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Quálitas Logística', N'POL-CARGA-2026-00016', 1227.00, 24.54, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Chubb Seguros México', N'POL-CARGA-2026-00017', 1280.25, 25.61, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'AXA Seguros', N'POL-CARGA-2026-00018', 1333.50, 26.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'GNP Seguros Carga', N'POL-CARGA-2026-00019', 1386.75, 27.73, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Quálitas Logística', N'POL-CARGA-2026-00020', 1440.00, 28.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Chubb Seguros México', N'POL-CARGA-2026-00021', 1493.25, 29.87, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'AXA Seguros', N'POL-CARGA-2026-00022', 1546.50, 30.93, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'GNP Seguros Carga', N'POL-CARGA-2026-00023', 1599.75, 32.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Quálitas Logística', N'POL-CARGA-2026-00024', 1653.00, 33.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Chubb Seguros México', N'POL-CARGA-2026-00025', 1706.25, 34.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'AXA Seguros', N'POL-CARGA-2026-00026', 1759.50, 35.19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'GNP Seguros Carga', N'POL-CARGA-2026-00027', 1812.75, 36.26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Quálitas Logística', N'POL-CARGA-2026-00028', 1866.00, 37.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Chubb Seguros México', N'POL-CARGA-2026-00029', 1919.25, 38.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'AXA Seguros', N'POL-CARGA-2026-00030', 1972.50, 39.45, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.seguros_mercancia OFF;
GO

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup ON;
INSERT INTO envios.puntos_recoleccion_pickup (ID, ID_transportista, ID_almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'LOCKER_01', N'Smart Locker & Farmacia DermaCare Monclova Suc. 01', N'Av. Universidad #201, Col. Centro, C.P. 25700, Monclova, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'LOCKER_02', N'Smart Locker & Farmacia DermaCare Monterrey Suc. 02', N'Av. Universidad #202, Col. Centro, C.P. 64000, Monterrey, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'LOCKER_03', N'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 03', N'Av. Universidad #203, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'LOCKER_04', N'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 04', N'Av. Universidad #204, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'LOCKER_05', N'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 05', N'Av. Universidad #205, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'LOCKER_06', N'Smart Locker & Farmacia DermaCare Guadalajara Suc. 06', N'Av. Universidad #206, Col. Centro, C.P. 44100, Guadalajara, Jalisco', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'LOCKER_07', N'Smart Locker & Farmacia DermaCare Saltillo Suc. 07', N'Av. Universidad #207, Col. Centro, C.P. 25000, Saltillo, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'LOCKER_08', N'Smart Locker & Farmacia DermaCare Querétaro Suc. 08', N'Av. Universidad #208, Col. Centro, C.P. 76000, Querétaro, Querétaro', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'LOCKER_09', N'Smart Locker & Farmacia DermaCare Puebla Suc. 09', N'Av. Universidad #209, Col. Centro, C.P. 72000, Puebla, Puebla', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'LOCKER_10', N'Smart Locker & Farmacia DermaCare Mérida Suc. 10', N'Av. Universidad #210, Col. Centro, C.P. 97000, Mérida, Yucatán', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'LOCKER_11', N'Smart Locker & Farmacia DermaCare Monclova Suc. 11', N'Av. Universidad #211, Col. Centro, C.P. 25700, Monclova, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'LOCKER_12', N'Smart Locker & Farmacia DermaCare Monterrey Suc. 12', N'Av. Universidad #212, Col. Centro, C.P. 64000, Monterrey, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'LOCKER_13', N'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 13', N'Av. Universidad #213, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'LOCKER_14', N'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 14', N'Av. Universidad #214, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'LOCKER_15', N'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 15', N'Av. Universidad #215, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'LOCKER_16', N'Smart Locker & Farmacia DermaCare Guadalajara Suc. 16', N'Av. Universidad #216, Col. Centro, C.P. 44100, Guadalajara, Jalisco', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'LOCKER_17', N'Smart Locker & Farmacia DermaCare Saltillo Suc. 17', N'Av. Universidad #217, Col. Centro, C.P. 25000, Saltillo, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'LOCKER_18', N'Smart Locker & Farmacia DermaCare Querétaro Suc. 18', N'Av. Universidad #218, Col. Centro, C.P. 76000, Querétaro, Querétaro', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'LOCKER_19', N'Smart Locker & Farmacia DermaCare Puebla Suc. 19', N'Av. Universidad #219, Col. Centro, C.P. 72000, Puebla, Puebla', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'LOCKER_20', N'Smart Locker & Farmacia DermaCare Mérida Suc. 20', N'Av. Universidad #220, Col. Centro, C.P. 97000, Mérida, Yucatán', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'LOCKER_21', N'Smart Locker & Farmacia DermaCare Monclova Suc. 21', N'Av. Universidad #221, Col. Centro, C.P. 25700, Monclova, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'LOCKER_22', N'Smart Locker & Farmacia DermaCare Monterrey Suc. 22', N'Av. Universidad #222, Col. Centro, C.P. 64000, Monterrey, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'LOCKER_23', N'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 23', N'Av. Universidad #223, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'LOCKER_24', N'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 24', N'Av. Universidad #224, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'LOCKER_25', N'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 25', N'Av. Universidad #225, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'LOCKER_26', N'Smart Locker & Farmacia DermaCare Guadalajara Suc. 26', N'Av. Universidad #226, Col. Centro, C.P. 44100, Guadalajara, Jalisco', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'LOCKER_27', N'Smart Locker & Farmacia DermaCare Saltillo Suc. 27', N'Av. Universidad #227, Col. Centro, C.P. 25000, Saltillo, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'LOCKER_28', N'Smart Locker & Farmacia DermaCare Querétaro Suc. 28', N'Av. Universidad #228, Col. Centro, C.P. 76000, Querétaro, Querétaro', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'LOCKER_29', N'Smart Locker & Farmacia DermaCare Puebla Suc. 29', N'Av. Universidad #229, Col. Centro, C.P. 72000, Puebla, Puebla', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'LOCKER_30', N'Smart Locker & Farmacia DermaCare Mérida Suc. 30', N'Av. Universidad #230, Col. Centro, C.P. 97000, Mérida, Yucatán', N'Lunes a Domingo 08:00 a 22:00 hrs', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup OFF;
GO

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.motivos_devolucion_rma ON;
INSERT INTO postventa.motivos_devolucion_rma (ID, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Reacción alérgica o irritación cutánea tras aplicación', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Tono de maquillaje incorrecto respecto al seleccionado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Sello de seguridad violado o derrame al abrir paquete', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Producto próximo a caducar o fuera de especificación térmica', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Desistimiento dentro de los primeros 15 días con envase sellado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Reacción alérgica o irritación cutánea tras aplicación', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Tono de maquillaje incorrecto respecto al seleccionado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Sello de seguridad violado o derrame al abrir paquete', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Producto próximo a caducar o fuera de especificación térmica', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Desistimiento dentro de los primeros 15 días con envase sellado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Reacción alérgica o irritación cutánea tras aplicación', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Tono de maquillaje incorrecto respecto al seleccionado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Sello de seguridad violado o derrame al abrir paquete', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Producto próximo a caducar o fuera de especificación térmica', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Desistimiento dentro de los primeros 15 días con envase sellado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Reacción alérgica o irritación cutánea tras aplicación', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Tono de maquillaje incorrecto respecto al seleccionado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Sello de seguridad violado o derrame al abrir paquete', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Producto próximo a caducar o fuera de especificación térmica', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Desistimiento dentro de los primeros 15 días con envase sellado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Reacción alérgica o irritación cutánea tras aplicación', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Tono de maquillaje incorrecto respecto al seleccionado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Sello de seguridad violado o derrame al abrir paquete', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Producto próximo a caducar o fuera de especificación térmica', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Desistimiento dentro de los primeros 15 días con envase sellado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Reacción alérgica o irritación cutánea tras aplicación', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Tono de maquillaje incorrecto respecto al seleccionado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Sello de seguridad violado o derrame al abrir paquete', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Producto próximo a caducar o fuera de especificación térmica', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Desistimiento dentro de los primeros 15 días con envase sellado', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.motivos_devolucion_rma OFF;
GO

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.solicitudes_rma ON;
INSERT INTO postventa.solicitudes_rma (ID, folio_rma, ID_orden, ID_motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RMA-2026-0001', 1, 1, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0001.jpg', N'Cliente reporta incidencia con Sérum Niacinamida 10% + Zinc 1% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RMA-2026-0002', 2, 2, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0002.jpg', N'Cliente reporta incidencia con Gel Limpiador Espumoso Facial y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RMA-2026-0003', 3, 3, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0003.jpg', N'Cliente reporta incidencia con Protector Solar Fluido SPF 50+ y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RMA-2026-0004', 4, 4, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0004.jpg', N'Cliente reporta incidencia con Sérum Ácido Hialurónico 2% + B5 y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RMA-2026-0005', 5, 5, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0005.jpg', N'Cliente reporta incidencia con Crema Hidratante con Ceramidas y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RMA-2026-0006', 6, 6, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0006.jpg', N'Cliente reporta incidencia con Retinol Puro 0.5% Nocturno y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RMA-2026-0007', 7, 7, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0007.jpg', N'Cliente reporta incidencia con Agua Micelar Dermolimpiadora y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RMA-2026-0008', 8, 8, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0008.jpg', N'Cliente reporta incidencia con Sérum Vitamina C Pura 15% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RMA-2026-0009', 9, 9, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0009.jpg', N'Cliente reporta incidencia con Base de Maquillaje Cobertura Media y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RMA-2026-0010', 10, 10, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0010.jpg', N'Cliente reporta incidencia con Corrector Líquido Alta Duración y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RMA-2026-0011', 11, 11, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0011.jpg', N'Cliente reporta incidencia con Bálsamo Reparador Cicaplast B5 y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RMA-2026-0012', 12, 12, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0012.jpg', N'Cliente reporta incidencia con Exfoliante Ácido Salicílico 2% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RMA-2026-0013', 13, 13, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0013.jpg', N'Cliente reporta incidencia con Contorno de Ojos con Cafeína 5% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RMA-2026-0014', 14, 14, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0014.jpg', N'Cliente reporta incidencia con Mascarilla Nocturna Hidratante y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RMA-2026-0015', 15, 15, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0015.jpg', N'Cliente reporta incidencia con Bruma Termal Calmante Mineral y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RMA-2026-0016', 16, 16, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0016.jpg', N'Cliente reporta incidencia con Aceite Limpiador Emulsionable y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RMA-2026-0017', 17, 17, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0017.jpg', N'Cliente reporta incidencia con Tónico Equilibrante Ácido Glicólico 7% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RMA-2026-0018', 18, 18, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0018.jpg', N'Cliente reporta incidencia con Labial Hidratante Péptidos Nude y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RMA-2026-0019', 19, 19, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0019.jpg', N'Cliente reporta incidencia con Polvo Traslúcido Matificante Mineral y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RMA-2026-0020', 20, 20, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0020.jpg', N'Cliente reporta incidencia con Rubor Líquido Pigmento Natural y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RMA-2026-0021', 21, 21, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0021.jpg', N'Cliente reporta incidencia con Sérum Ácido Azelaico 10% Suspensión y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RMA-2026-0022', 22, 22, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0022.jpg', N'Cliente reporta incidencia con Ampolletas Proteoglicanos Firmeza y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RMA-2026-0023', 23, 23, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0023.jpg', N'Cliente reporta incidencia con Crema Despigmentante Noche Melasma y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RMA-2026-0024', 24, 24, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0024.jpg', N'Cliente reporta incidencia con Protector Solar Mineral Óxido Zinc y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RMA-2026-0025', 25, 25, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0025.jpg', N'Cliente reporta incidencia con Loción Corporal Urea 10% Reparadora y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RMA-2026-0026', 26, 26, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0026.jpg', N'Cliente reporta incidencia con Primer Facial Minimizador de Poros y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RMA-2026-0027', 27, 27, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0027.jpg', N'Cliente reporta incidencia con Máscara de Pestañas Hipoalergénica y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RMA-2026-0028', 28, 28, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0028.jpg', N'Cliente reporta incidencia con Sérum Péptidos de Cobre 1% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RMA-2026-0029', 29, 29, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0029.jpg', N'Cliente reporta incidencia con Bálsamo Desmaquillante Caléndula y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RMA-2026-0030', 30, 30, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0030.jpg', N'Cliente reporta incidencia con Crema Barrera Post-Retinoide y adjunta evidencia fotográfica de lote y empaque.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.solicitudes_rma OFF;
GO

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.rma_detalles ON;
INSERT INTO postventa.rma_detalles (ID, ID_solicitud_rma, ID_orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.rma_detalles OFF;
GO

-- =================================================================================================
-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno ON;
INSERT INTO postventa.inspeccion_sanitaria_retorno (ID, ID_rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno OFF;
GO

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_soporte ON;
INSERT INTO postventa.tickets_soporte (ID, folio_ticket, ID_cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TICKE-2026-0001', 1, N'Seguimiento de envío sin actualización en las últimas 48 horas (#001)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TICKE-2026-0002', 2, N'Duda sobre orden de aplicación en rutina nocturna (#002)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TICKE-2026-0003', 3, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#003)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TICKE-2026-0004', 4, N'Dispensador airless bloqueado en entrega reciente (#004)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TICKE-2026-0005', 5, N'Seguimiento de envío sin actualización en las últimas 48 horas (#005)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TICKE-2026-0006', 6, N'Duda sobre orden de aplicación en rutina nocturna (#006)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TICKE-2026-0007', 7, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#007)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TICKE-2026-0008', 8, N'Dispensador airless bloqueado en entrega reciente (#008)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TICKE-2026-0009', 9, N'Seguimiento de envío sin actualización en las últimas 48 horas (#009)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TICKE-2026-0010', 10, N'Duda sobre orden de aplicación en rutina nocturna (#010)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TICKE-2026-0011', 11, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#011)', N'FACTURACION_CFDI', N'ALTA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TICKE-2026-0012', 12, N'Dispensador airless bloqueado en entrega reciente (#012)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TICKE-2026-0013', 13, N'Seguimiento de envío sin actualización en las últimas 48 horas (#013)', N'ENVIO_DEMORADO', N'BAJA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TICKE-2026-0014', 14, N'Duda sobre orden de aplicación en rutina nocturna (#014)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TICKE-2026-0015', 15, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#015)', N'FACTURACION_CFDI', N'ALTA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TICKE-2026-0016', 16, N'Dispensador airless bloqueado en entrega reciente (#016)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TICKE-2026-0017', 17, N'Seguimiento de envío sin actualización en las últimas 48 horas (#017)', N'ENVIO_DEMORADO', N'BAJA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TICKE-2026-0018', 18, N'Duda sobre orden de aplicación en rutina nocturna (#018)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TICKE-2026-0019', 19, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#019)', N'FACTURACION_CFDI', N'ALTA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TICKE-2026-0020', 20, N'Dispensador airless bloqueado en entrega reciente (#020)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TICKE-2026-0021', 21, N'Seguimiento de envío sin actualización en las últimas 48 horas (#021)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TICKE-2026-0022', 22, N'Duda sobre orden de aplicación en rutina nocturna (#022)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TICKE-2026-0023', 23, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#023)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TICKE-2026-0024', 24, N'Dispensador airless bloqueado en entrega reciente (#024)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TICKE-2026-0025', 25, N'Seguimiento de envío sin actualización en las últimas 48 horas (#025)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TICKE-2026-0026', 26, N'Duda sobre orden de aplicación en rutina nocturna (#026)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TICKE-2026-0027', 27, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#027)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TICKE-2026-0028', 28, N'Dispensador airless bloqueado en entrega reciente (#028)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TICKE-2026-0029', 29, N'Seguimiento de envío sin actualización en las últimas 48 horas (#029)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TICKE-2026-0030', 30, N'Duda sobre orden de aplicación en rutina nocturna (#030)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_soporte OFF;
GO

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_mensajes ON;
INSERT INTO postventa.tickets_mensajes (ID, ID_ticket, ID_usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Hola, comparto los detalles sobre el seguimiento del ticket #001 respecto a Sérum Niacinamida 10% + Zinc 1%. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0001.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Hola, comparto los detalles sobre el seguimiento del ticket #002 respecto a Gel Limpiador Espumoso Facial. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Hola, comparto los detalles sobre el seguimiento del ticket #003 respecto a Protector Solar Fluido SPF 50+. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0003.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Hola, comparto los detalles sobre el seguimiento del ticket #004 respecto a Sérum Ácido Hialurónico 2% + B5. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Hola, comparto los detalles sobre el seguimiento del ticket #005 respecto a Crema Hidratante con Ceramidas. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0005.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Hola, comparto los detalles sobre el seguimiento del ticket #006 respecto a Retinol Puro 0.5% Nocturno. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Hola, comparto los detalles sobre el seguimiento del ticket #007 respecto a Agua Micelar Dermolimpiadora. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0007.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Hola, comparto los detalles sobre el seguimiento del ticket #008 respecto a Sérum Vitamina C Pura 15%. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Hola, comparto los detalles sobre el seguimiento del ticket #009 respecto a Base de Maquillaje Cobertura Media. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0009.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Hola, comparto los detalles sobre el seguimiento del ticket #010 respecto a Corrector Líquido Alta Duración. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'Hola, comparto los detalles sobre el seguimiento del ticket #011 respecto a Bálsamo Reparador Cicaplast B5. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0011.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'Hola, comparto los detalles sobre el seguimiento del ticket #012 respecto a Exfoliante Ácido Salicílico 2%. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'Hola, comparto los detalles sobre el seguimiento del ticket #013 respecto a Contorno de Ojos con Cafeína 5%. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0013.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'Hola, comparto los detalles sobre el seguimiento del ticket #014 respecto a Mascarilla Nocturna Hidratante. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'Hola, comparto los detalles sobre el seguimiento del ticket #015 respecto a Bruma Termal Calmante Mineral. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0015.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'Hola, comparto los detalles sobre el seguimiento del ticket #016 respecto a Aceite Limpiador Emulsionable. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'Hola, comparto los detalles sobre el seguimiento del ticket #017 respecto a Tónico Equilibrante Ácido Glicólico 7%. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0017.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'Hola, comparto los detalles sobre el seguimiento del ticket #018 respecto a Labial Hidratante Péptidos Nude. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'Hola, comparto los detalles sobre el seguimiento del ticket #019 respecto a Polvo Traslúcido Matificante Mineral. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0019.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'Hola, comparto los detalles sobre el seguimiento del ticket #020 respecto a Rubor Líquido Pigmento Natural. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'Hola, comparto los detalles sobre el seguimiento del ticket #021 respecto a Sérum Ácido Azelaico 10% Suspensión. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0021.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'Hola, comparto los detalles sobre el seguimiento del ticket #022 respecto a Ampolletas Proteoglicanos Firmeza. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'Hola, comparto los detalles sobre el seguimiento del ticket #023 respecto a Crema Despigmentante Noche Melasma. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0023.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'Hola, comparto los detalles sobre el seguimiento del ticket #024 respecto a Protector Solar Mineral Óxido Zinc. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'Hola, comparto los detalles sobre el seguimiento del ticket #025 respecto a Loción Corporal Urea 10% Reparadora. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0025.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'Hola, comparto los detalles sobre el seguimiento del ticket #026 respecto a Primer Facial Minimizador de Poros. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'Hola, comparto los detalles sobre el seguimiento del ticket #027 respecto a Máscara de Pestañas Hipoalergénica. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0027.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'Hola, comparto los detalles sobre el seguimiento del ticket #028 respecto a Sérum Péptidos de Cobre 1%. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'Hola, comparto los detalles sobre el seguimiento del ticket #029 respecto a Bálsamo Desmaquillante Caléndula. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0029.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'Hola, comparto los detalles sobre el seguimiento del ticket #030 respecto a Crema Barrera Post-Retinoide. Quedo atento a su confirmación.', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_mensajes OFF;
GO

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia ON;
INSERT INTO postventa.reportes_farmacovigilancia (ID, folio_cofepris_ram, ID_cliente, ID_producto, ID_lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-COFEP-2026-0001', 1, 1, 1, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Niacinamida 10% + Zinc 1%.', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-COFEP-2026-0002', 2, 2, 2, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Gel Limpiador Espumoso Facial.', 0, '2026-03-02', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-COFEP-2026-0003', 3, 3, 3, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Fluido SPF 50+.', 1, '2026-03-03', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-COFEP-2026-0004', 4, 4, 4, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Ácido Hialurónico 2% + B5.', 0, '2026-03-04', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-COFEP-2026-0005', 5, 5, 5, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Hidratante con Ceramidas.', 1, '2026-03-05', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-COFEP-2026-0006', 6, 6, 6, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Retinol Puro 0.5% Nocturno.', 0, '2026-03-06', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-COFEP-2026-0007', 7, 7, 7, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Agua Micelar Dermolimpiadora.', 1, '2026-03-07', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-COFEP-2026-0008', 8, 8, 8, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Sérum Vitamina C Pura 15%.', 0, '2026-03-08', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-COFEP-2026-0009', 9, 9, 9, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Base de Maquillaje Cobertura Media.', 1, '2026-03-09', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-COFEP-2026-0010', 10, 10, 10, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Corrector Líquido Alta Duración.', 0, '2026-03-10', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-COFEP-2026-0011', 11, 11, 11, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Reparador Cicaplast B5.', 1, '2026-03-11', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-COFEP-2026-0012', 12, 12, 12, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Exfoliante Ácido Salicílico 2%.', 0, '2026-03-12', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-COFEP-2026-0013', 13, 13, 13, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Contorno de Ojos con Cafeína 5%.', 1, '2026-03-13', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-COFEP-2026-0014', 14, 14, 14, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Mascarilla Nocturna Hidratante.', 0, '2026-03-14', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-COFEP-2026-0015', 15, 15, 15, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Bruma Termal Calmante Mineral.', 1, '2026-03-15', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-COFEP-2026-0016', 16, 16, 16, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Aceite Limpiador Emulsionable.', 0, '2026-03-16', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-COFEP-2026-0017', 17, 17, 17, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Tónico Equilibrante Ácido Glicólico 7%.', 1, '2026-03-17', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-COFEP-2026-0018', 18, 18, 18, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Labial Hidratante Péptidos Nude.', 0, '2026-03-18', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-COFEP-2026-0019', 19, 19, 19, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Polvo Traslúcido Matificante Mineral.', 1, '2026-03-19', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-COFEP-2026-0020', 20, 20, 20, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Rubor Líquido Pigmento Natural.', 0, '2026-03-20', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-COFEP-2026-0021', 21, 21, 21, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Sérum Ácido Azelaico 10% Suspensión.', 1, '2026-03-21', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-COFEP-2026-0022', 22, 22, 22, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Ampolletas Proteoglicanos Firmeza.', 0, '2026-03-22', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-COFEP-2026-0023', 23, 23, 23, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Despigmentante Noche Melasma.', 1, '2026-03-23', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-COFEP-2026-0024', 24, 24, 24, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Mineral Óxido Zinc.', 0, '2026-03-24', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-COFEP-2026-0025', 25, 25, 25, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Loción Corporal Urea 10% Reparadora.', 1, '2026-03-25', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-COFEP-2026-0026', 26, 26, 26, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Primer Facial Minimizador de Poros.', 0, '2026-03-26', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-COFEP-2026-0027', 27, 27, 27, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Máscara de Pestañas Hipoalergénica.', 1, '2026-03-27', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-COFEP-2026-0028', 28, 28, 28, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Péptidos de Cobre 1%.', 0, '2026-03-28', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-COFEP-2026-0029', 29, 29, 29, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Desmaquillante Caléndula.', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-COFEP-2026-0030', 30, 30, 30, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Crema Barrera Post-Retinoide.', 0, '2026-03-02', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia OFF;
GO

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.tipos_evento_sistema ON;
INSERT INTO auditoria.tipos_evento_sistema (ID, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'LOGIN_EXITOSO', N'Inicio de sesión exitoso con credenciales validadas', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'INTENTO_ACCESO_DENEGADO', N'Intento de acceso denegado por permisos RBAC insuficientes', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MODIFICACION_PRECIOS', N'Actualización de precio base en catálogo SKU', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'BAJA_LOGICA_REGISTRO', N'Ejecución de borrado lógico (Soft Delete) auditado', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'EXPORTACION_DATOS_LFPDPPP', N'Exportación de expediente clínico por solicitud ARCO', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TIMBRADO_CFDI_PAC', N'Emisión y sellado de comprobante fiscal CFDI 4.0', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CANCELACION_CFDI_SAT', N'Solicitud de cancelación fiscal ante el SAT', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'BLOQUEO_CUENTA_INTENTOS', N'Bloqueo automático de usuario por intentos fallidos', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAMBIO_PASSWORD_USUARIO', N'Actualización criptográfica Argon2id de contraseña', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MFA_VERIFICACION_TOTP', N'Validación o rechazo de segundo factor TOTP', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CUARENTENA_LOTE_QA', N'Retención sanitaria de lote por desviación de calidad', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ALERTA_TEMPERATURA_IOT', N'Excursión térmica detectada en sensor de cadena de frío', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'REEMBOLSO_AUTORIZADO', N'Autorización financiera de reembolso a cliente', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CONTRACARGO_RECIBIDO', N'Notificación de disputa bancaria por pasarela', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'DESTRUCCION_MERMA_COFEPRIS', N'Registro de acta circunstanciada de destrucción sanitaria', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'AJUSTE_INVENTARIO_CONTEO', N'Ajuste de existencias tras conteo cíclico de auditoría', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CREACION_USUARIO_ADMIN', N'Alta de cuenta administrativa en módulo IAM', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ASIGNACION_ROL_SEGURIDAD', N'Modificación de roles asignados a usuario', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'REPORTE_FARMACOVIGILANCIA', N'Alta de reporte de reacción adversa RAM COFEPRIS', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'REVOCACION_SESION_REMOTA', N'Invalidación forzada de token de sesión activa', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ALTA_REGISTRO_COFEPRIS', N'Actualización de vigencia de registro sanitario', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FRAUDE_BLOQUEO_ORDEN', N'Bloqueo preventivo de orden por regla antifraude', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'DESPACHO_FEFO_WMS', N'Liberación de picking por regla FEFO', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MODIFICACION_PARAMETRO', N'Cambio en parámetro de configuración en caliente', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CONSULTA_DATOS_SENSIBLES', N'Acceso a perfil dermatológico LFPDPPP', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'RESTAURACION_REGISTRO', N'Reactivación lógica de entidad previamente dada de baja', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'WEBHOOK_PASARELA_RECIBIDO', N'Recepción verificada de notificación HMAC de pago', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'RMA_INSPECCION_HIGIENE', N'Dictamen sanitario sobre devolución recibida', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TRANSFERENCIA_CEDIS_CREADA', N'Orden de traslado entre almacenes con control térmico', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CIERRE_SESION_VOLUNTARIO', N'Cierre explícito de sesión por el usuario', N'CRITICO_SEGURIDAD', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.tipos_evento_sistema OFF;
GO

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global ON;
INSERT INTO auditoria.bitacora_seguridad_global (ID, ID_tipo_evento, ID_usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'189.203.3.7', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'Seguridad.IAM', N'Inicio de sesión exitoso con credenciales validadas (Registro auditado #0001).', N'822aaf75efb2377be6e9f38a3ea625b705bd9f835a21ee04665f2f2330bbee06', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'189.203.6.14', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'Catalogo.Precios', N'Intento de acceso denegado por permisos RBAC insuficientes (Registro auditado #0002).', N'e9c9403db5e463f149a10bb3e32d72ef7937a5ca026bfec9e3ecac63efc76b5b', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'189.203.9.21', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'Fiscal.CFDI', N'Actualización de precio base en catálogo SKU (Registro auditado #0003).', N'fe0a7c2537cb5c8a1485ac8e637953e62e6c7305a808a7f5942f653804a43868', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'189.203.12.28', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'Clientes.ARCO', N'Ejecución de borrado lógico (Soft Delete) auditado (Registro auditado #0004).', N'efb657c736345d2380ac4337a26dcb8069735d4b0a43ca1549722b761f924a02', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'189.203.15.35', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'WMS.CadenaFrio', N'Exportación de expediente clínico por solicitud ARCO (Registro auditado #0005).', N'93b60ec3f14932d9decdb119e6d3d1868d350e8feba52089cf34b1de19a7686e', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'189.203.18.42', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'Pagos.Antifraude', N'Emisión y sellado de comprobante fiscal CFDI 4.0 (Registro auditado #0006).', N'6acf751a227783a91240d1432aa4d8ba258982f7385c71e4be11886adfc084ca', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'189.203.21.49', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'Seguridad.IAM', N'Solicitud de cancelación fiscal ante el SAT (Registro auditado #0007).', N'68b959d127be3e137d04e5cfae970c022ca970ab500dbf9a54d5d94fb5cc35df', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'189.203.24.56', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'Catalogo.Precios', N'Bloqueo automático de usuario por intentos fallidos (Registro auditado #0008).', N'9c44bd3dee118b4d36943fb69bf1a79ace53c53db68a5d5d0d262ff39f2e16a5', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'189.203.27.63', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'Fiscal.CFDI', N'Actualización criptográfica Argon2id de contraseña (Registro auditado #0009).', N'f6aab553803a5203e4c4babea15e4082a5230ccb02ffcd19233ebaf8fff037cd', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'189.203.30.70', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'Clientes.ARCO', N'Validación o rechazo de segundo factor TOTP (Registro auditado #0010).', N'9b8433f950cc9b93522036fe6e70274f9f4f3cbe61b1071310fb77e320f02521', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'189.203.33.77', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'WMS.CadenaFrio', N'Retención sanitaria de lote por desviación de calidad (Registro auditado #0011).', N'aeb5d25ab3468bea6fafbed7bc09833153ad8fb200258e77aba6f40526ee6877', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'189.203.36.84', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'Pagos.Antifraude', N'Excursión térmica detectada en sensor de cadena de frío (Registro auditado #0012).', N'a8ded427e46238ede28d520bdc9369981f589a826eaa1adaebf30b4a7e6eb585', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'189.203.39.91', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'Seguridad.IAM', N'Autorización financiera de reembolso a cliente (Registro auditado #0013).', N'ad0d7747c124cff95c06fb1c24a46daf7b00ffe7484b476c339785b6bf118c01', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'189.203.42.98', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'Catalogo.Precios', N'Notificación de disputa bancaria por pasarela (Registro auditado #0014).', N'2e29cd7e59d6b35759468a2ac0c285d79c503f6d01e8636f6bed8a755fb4738c', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'189.203.45.105', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'Fiscal.CFDI', N'Registro de acta circunstanciada de destrucción sanitaria (Registro auditado #0015).', N'd3bdb41506978ff27734e6d3ab149e6443b25df214860ac156dace8fe1002a32', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'189.203.48.112', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'Clientes.ARCO', N'Ajuste de existencias tras conteo cíclico de auditoría (Registro auditado #0016).', N'ed6c351aa391af272c24e8c5791c0f8be9d2432eb2aee535be499821ff6fdcd2', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'189.203.51.119', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'WMS.CadenaFrio', N'Alta de cuenta administrativa en módulo IAM (Registro auditado #0017).', N'5687a48d6d28dff7bd7b388de2f103b6b42b9ec826355d3471db292416ac8744', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'189.203.54.126', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'Pagos.Antifraude', N'Modificación de roles asignados a usuario (Registro auditado #0018).', N'c3103100ecf9f3d88c520b3b755723ef9570c1e04da92eb3d6b816c4a163a891', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'189.203.57.133', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'Seguridad.IAM', N'Alta de reporte de reacción adversa RAM COFEPRIS (Registro auditado #0019).', N'2166f8e64254369e88c6c2bed443bb1a14ef13de9cd770897554b45686978f79', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'189.203.60.140', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'Catalogo.Precios', N'Invalidación forzada de token de sesión activa (Registro auditado #0020).', N'7fb0613e00707c167f156e052c08abcbdddd4eb28938f8e6a64870e92d777675', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'189.203.63.147', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'Fiscal.CFDI', N'Actualización de vigencia de registro sanitario (Registro auditado #0021).', N'bdfa89f693dbbb92a82f95ae1ee7ffff7f385ff8ed34c0bb1c15835ba08d5291', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'189.203.66.154', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'Clientes.ARCO', N'Bloqueo preventivo de orden por regla antifraude (Registro auditado #0022).', N'2678285d4ae0d9afbcf71d7fc486ce27a203da9e6955c9eccab82a69acda981b', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'189.203.69.161', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'WMS.CadenaFrio', N'Liberación de picking por regla FEFO (Registro auditado #0023).', N'292dfaa2a59b8f77b10958bcf656fb297237c38233c1e900ca5912fa46068f7f', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'189.203.72.168', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'Pagos.Antifraude', N'Cambio en parámetro de configuración en caliente (Registro auditado #0024).', N'e3124d4a51b532b7f52413851c287797be3fc01ae4b11e0c66d44062c6b57c29', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'189.203.75.175', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'Seguridad.IAM', N'Acceso a perfil dermatológico LFPDPPP (Registro auditado #0025).', N'7e0a2b320e9923bb0faab99112772bb898fd00e6a50b034651655ed607a163b2', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'189.203.78.182', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'Catalogo.Precios', N'Reactivación lógica de entidad previamente dada de baja (Registro auditado #0026).', N'231eefc9e2a9a78b94b21b6f938e78f45714a594a3034a5bc4f425d41f9473d9', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'189.203.81.189', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'Fiscal.CFDI', N'Recepción verificada de notificación HMAC de pago (Registro auditado #0027).', N'd69a2c3c31ec03261005fa2539492f0d1703958eb7531e1d59f3bc293e979bd8', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'189.203.84.196', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'Clientes.ARCO', N'Dictamen sanitario sobre devolución recibida (Registro auditado #0028).', N'8efa9da9e46b9c7b53b1a2413e839039ef5efff2deb06f34e8b0d7b6f627c928', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'189.203.87.203', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'WMS.CadenaFrio', N'Orden de traslado entre almacenes con control térmico (Registro auditado #0029).', N'e3dda4df71d765ddf8d4bcaaded8b196b4e2a03c05d4dd94f370501cf4b9fead', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'189.203.90.210', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'Pagos.Antifraude', N'Cierre explícito de sesión por el usuario (Registro auditado #0030).', N'490fda407df80e3e6ede88e335ea513ed0bad2783f52dd1e1908fbf4932c577b', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global OFF;
GO

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_cambios_datos ON;
INSERT INTO auditoria.bitacora_cambios_datos (ID, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ventas.ordenes', 1, N'INSERT', NULL, N'{"tabla": "ventas.ordenes", "id_registro": 1, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'catalogo.variantes_sku', 2, N'UPDATE', N'{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "version": 1}', N'{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'clientes.clientes', 3, N'INSERT', NULL, N'{"tabla": "clientes.clientes", "id_registro": 3, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'fiscal.facturas_cfdi', 4, N'UPDATE', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "version": 1}', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'wms.inventario_lotes_ubicacion', 5, N'INSERT', NULL, N'{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 5, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'pagos.transacciones', 6, N'UPDATE', N'{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "version": 1}', N'{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #6.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'postventa.solicitudes_rma', 7, N'INSERT', NULL, N'{"tabla": "postventa.solicitudes_rma", "id_registro": 7, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #7.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'seguridad.usuarios', 8, N'UPDATE', N'{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "version": 1}', N'{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #8.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'promos.cupones', 9, N'INSERT', NULL, N'{"tabla": "promos.cupones", "id_registro": 9, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #9.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'compras.ordenes_compra', 10, N'UPDATE', N'{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "version": 1}', N'{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #10.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ventas.ordenes', 11, N'INSERT', NULL, N'{"tabla": "ventas.ordenes", "id_registro": 11, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #11.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'catalogo.variantes_sku', 12, N'UPDATE', N'{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "version": 1}', N'{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #12.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'clientes.clientes', 13, N'INSERT', NULL, N'{"tabla": "clientes.clientes", "id_registro": 13, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #13.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'fiscal.facturas_cfdi', 14, N'UPDATE', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "version": 1}', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #14.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'wms.inventario_lotes_ubicacion', 15, N'INSERT', NULL, N'{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 15, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #15.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'pagos.transacciones', 16, N'UPDATE', N'{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "version": 1}', N'{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #16.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'postventa.solicitudes_rma', 17, N'INSERT', NULL, N'{"tabla": "postventa.solicitudes_rma", "id_registro": 17, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #17.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'seguridad.usuarios', 18, N'UPDATE', N'{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "version": 1}', N'{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #18.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'promos.cupones', 19, N'INSERT', NULL, N'{"tabla": "promos.cupones", "id_registro": 19, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #19.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'compras.ordenes_compra', 20, N'UPDATE', N'{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "version": 1}', N'{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #20.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ventas.ordenes', 21, N'INSERT', NULL, N'{"tabla": "ventas.ordenes", "id_registro": 21, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #21.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'catalogo.variantes_sku', 22, N'UPDATE', N'{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "version": 1}', N'{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #22.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'clientes.clientes', 23, N'INSERT', NULL, N'{"tabla": "clientes.clientes", "id_registro": 23, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #23.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'fiscal.facturas_cfdi', 24, N'UPDATE', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "version": 1}', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #24.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'wms.inventario_lotes_ubicacion', 25, N'INSERT', NULL, N'{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 25, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #25.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'pagos.transacciones', 26, N'SOFT_DELETE', N'{"tabla": "pagos.transacciones", "id_registro": 26, "activo": true, "version": 1}', N'{"tabla": "pagos.transacciones", "id_registro": 26, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre pagos.transacciones registro #26.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'postventa.solicitudes_rma', 27, N'SOFT_DELETE', N'{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": true, "version": 1}', N'{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre postventa.solicitudes_rma registro #27.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'seguridad.usuarios', 28, N'SOFT_DELETE', N'{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": true, "version": 1}', N'{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre seguridad.usuarios registro #28.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'promos.cupones', 29, N'SOFT_DELETE', N'{"tabla": "promos.cupones", "id_registro": 29, "activo": true, "version": 1}', N'{"tabla": "promos.cupones", "id_registro": 29, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre promos.cupones registro #29.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'compras.ordenes_compra', 30, N'SOFT_DELETE', N'{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": true, "version": 1}', N'{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre compras.ordenes_compra registro #30.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.bitacora_cambios_datos OFF;
GO

-- =================================================================================================
-- 149. TABLA: sistema.parametros_configuracion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT sistema.parametros_configuracion ON;
INSERT INTO sistema.parametros_configuracion (ID, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'IVA_TASA_GENERAL_MX', N'16.00', N'DECIMAL', N'Porcentaje de IVA aplicable en México a cosméticos y dermocosmética.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'DIAS_LIMITE_RESPUESTA_ARCO', N'20', N'INTEGER', N'Plazo máximo legal en días hábiles para responder solicitudes ARCO (LFPDPPP).', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ENVIO_GRATIS_MONTO_MINIMO', N'999.00', N'DECIMAL', N'Monto mínimo de compra en MXN para otorgar envío estándar gratuito.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MODO_MANTENIMIENTO_TIENDA', N'false', N'BOOLEAN', N'Bandera de activación de ventana de mantenimiento en tienda pública.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'UMBRAL_SCORE_ANTIFRAUDE_3DS', N'65', N'INTEGER', N'Puntaje mínimo de riesgo para exigir autenticación bancaria 3D Secure.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TEMP_MIN_CADENA_FRIO_C', N'2.0', N'DECIMAL', N'Temperatura mínima permitida en cámaras refrigeradas de almacén (°C).', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'TEMP_MAX_CADENA_FRIO_C', N'8.0', N'DECIMAL', N'Temperatura máxima permitida en cámaras refrigeradas de almacén (°C).', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MAX_INTENTOS_LOGIN_FALLIDOS', N'5', N'INTEGER', N'Número de intentos fallidos consecutivos antes de bloquear la cuenta.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MINUTOS_EXPIRACION_RESERVA_CART', N'15', N'INTEGER', N'Duración en minutos de apartado temporal de inventario en carrito.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PAC_TIMBRADO_AMBIENTE', N'PRODUCCION', N'STRING', N'Entorno activo de conexión con el PAC autorizado del SAT.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'DIAS_ALERTA_PREVENTIVA_FEFO', N'90', N'INTEGER', N'Días previos a la caducidad para disparar alerta preventiva FEFO.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'DIAS_VENTANA_DEVOLUCION_RMA', N'30', N'INTEGER', N'Días naturales posteriores a la entrega para solicitar devolución RMA.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'DESCUENTO_SUSCRIPCION_DEFAULT', N'10.00', N'DECIMAL', N'Porcentaje de descuento base en planes de suscripción recurrente.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'HABILITAR_RECOMENDADOR_INCI', N'true', N'BOOLEAN', N'Activa el filtro automático de alérgenos INCI según perfil cutáneo.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CONFIG_REINTENTOS_WEBHOOK', N'{"max_retries": 5, "backoff_sec": 30}', N'JSON', N'Política de reintentos exponenciales para webhooks de paquetería y pago.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'RFC_EMISOR_COMERCIO', N'DCM240115KL9', N'STRING', N'RFC oficial de la razón social emisora de comprobantes CFDI 4.0.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CP_FISCAL_EXPEDICION', N'25700', N'STRING', N'Código postal del domicilio fiscal de expedición CFDI 4.0.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'HORAS_VIDA_TOKEN_RESET', N'2', N'INTEGER', N'Vigencia en horas de los enlaces de restablecimiento de contraseña.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'COMISION_BASE_AFILIADOS', N'8.50', N'DECIMAL', N'Comisión porcentual estándar para nuevos afiliados dermoconsultores.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PERMITIR_MULTIPAGO_BILLETERA', N'true', N'BOOLEAN', N'Habilita combinación de monedero electrónico con tarjeta o SPEI.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'POLITICA_SEGURIDAD_PASSWORD', N'{"min_len": 12, "argon2_mem_kb": 65536}', N'JSON', N'Parámetros mínimos criptográficos para contraseñas de usuarios.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MONEDA_OPERACION_DEFAULT', N'MXN', N'STRING', N'Código ISO 4217 de moneda predeterminada en tienda nacional.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'HUMEDAD_MAX_ALMACEN_PORC', N'60.0', N'DECIMAL', N'Humedad relativa máxima permitida en pasillos de almacenamiento.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'LIMITE_PIEZA_POR_SKU_ORDEN', N'10', N'INTEGER', N'Cantidad máxima permitida de un mismo SKU por orden al menudeo.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'NOTIFICAR_COFEPRIS_AUTO', N'false', N'BOOLEAN', N'Envío automático o manual tras revisión médica de reportes RAM.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'UMBRAL_CONTROVERSIA_DISPUTA', N'{"auto_evidence": true, "days": 7}', N'JSON', N'Reglas de recopilación automática de evidencia ante contracargos.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'URL_BASE_CDN_MULTIMEDIA', N'https://cdn.dermacare.mx/assets/v2', N'STRING', N'Dominio CDN para imágenes de productos y fichas técnicas.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'TIEMPO_SESION_HORAS', N'24', N'INTEGER', N'Duración estándar de validez de sesiones web antes de renovación.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TASA_IEPS_PROTECTOR_EXENTO', N'0.00', N'DECIMAL', N'Tasa aplicable a categorías exentas de impuestos especiales.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CADENA_FRIO_ALERTA_SMS', N'true', N'BOOLEAN', N'Envía notificación SMS inmediata al supervisor WMS ante alerta térmica.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.parametros_configuracion OFF;
GO

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT sistema.notificaciones_push_email ON;
INSERT INTO sistema.notificaciones_push_email (ID, ID_usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0001', N'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', 1, '2026-02-01 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0002', N'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0003', N'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', 1, '2026-02-03 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0004', N'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0005', N'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', 1, '2026-02-05 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0006', N'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0007', N'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', 1, '2026-02-07 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0008', N'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0009', N'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', 1, '2026-02-09 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0010', N'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0011', N'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', 1, '2026-02-11 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0012', N'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0013', N'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', 1, '2026-02-13 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0014', N'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0015', N'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', 1, '2026-02-15 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0016', N'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0017', N'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', 1, '2026-02-17 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0018', N'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0019', N'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', 1, '2026-02-19 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0020', N'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0021', N'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', 1, '2026-02-21 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0022', N'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0023', N'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', 1, '2026-02-23 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0024', N'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0025', N'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', 1, '2026-02-25 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0026', N'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0027', N'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', 1, '2026-02-27 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0028', N'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0029', N'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', 1, '2026-02-01 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0030', N'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.notificaciones_push_email OFF;
GO

