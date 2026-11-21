-- =================================================================================================
-- SUBMÓDULO 2: OPERACIONES COMERCIALES, PASARELAS DE PAGO Y FACTURACIÓN CFDI 4.0
-- Tablas 051 a 100 (Autor: Integrante 2 - Control: 22050002)
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
INSERT INTO ventas.tipos_descuento (id_tipo_descuento, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'DESCUENT_01', N'Carlos Mendoza Garza', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'DESCUENT_02', N'Sofía Ramírez López', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'DESCUENT_03', N'Valeria Torres Villarreal', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'DESCUENT_04', N'Alejandro Hernández Cruz', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'DESCUENT_05', N'Mariana Sánchez Fuentes', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'DESCUENT_06', N'Diego Martínez Treviño', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'DESCUENT_07', N'Camila González Reyes', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'DESCUENT_08', N'Mateo Flores Castillo', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'DESCUENT_09', N'Lucía Morales Díaz', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'DESCUENT_10', N'Sebastián Vázquez Ortiz', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'DESCUENT_11', N'Regina Gutiérrez Nava', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'DESCUENT_12', N'Santiago Jiménez Pérez', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'DESCUENT_13', N'Fernanda Ruiz Salazar', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'DESCUENT_14', N'Emiliano Ríos Cárdenas', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'DESCUENT_15', N'Ximena Aguilar Ibarra', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'DESCUENT_16', N'Daniel Méndez Navarro', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'DESCUENT_17', N'Andrea Castro Delgado', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'DESCUENT_18', N'Gabriel Vega Montoya', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'DESCUENT_19', N'Paula Cortés Rojas', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'DESCUENT_20', N'Andrés Ramos Campos', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'DESCUENT_21', N'Renata Guerrero Luna', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'DESCUENT_22', N'Nicolás Peña Cabrera', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'DESCUENT_23', N'Natalia Herrera Vargas', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'DESCUENT_24', N'Joaquín Medina Contreras', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'DESCUENT_25', N'Isabella Domínguez Escobar', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'DESCUENT_26', N'Leonardo Silva Paredes', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'DESCUENT_27', N'Ana Chávez Bautista', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'DESCUENT_28', N'Rodrigo Ochoa Acosta', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'DESCUENT_29', N'Paulina Miranda Leal', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'DESCUENT_30', N'Mauricio Padilla Solís', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.tipos_descuento OFF;
GO

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.estados_orden ON;
INSERT INTO ventas.estados_orden (id_estado_orden, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO ventas.motivos_cancelacion_orden (id_motivo_cancelacion, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.motivos_cancelacion_orden OFF;
GO

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos ON;
INSERT INTO ventas.carritos (id_carrito, cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos OFF;
GO

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.items_carrito ON;
INSERT INTO ventas.items_carrito (id_item_carrito, carrito, variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 17.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.items_carrito OFF;
GO

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento ON;
INSERT INTO ventas.carritos_abandonados_seguimiento (id_seguimiento_carrito, carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, '2026-02-02 11:30:00', 0, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, '2026-02-03 11:30:00', 1, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, '2026-02-04 11:30:00', 0, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, '2026-02-05 11:30:00', 1, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, '2026-02-06 11:30:00', 0, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, '2026-02-07 11:30:00', 1, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, '2026-02-08 11:30:00', 0, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, '2026-02-09 11:30:00', 1, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, '2026-02-10 11:30:00', 0, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, '2026-02-11 11:30:00', 1, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, '2026-02-12 11:30:00', 0, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, '2026-02-13 11:30:00', 1, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, '2026-02-14 11:30:00', 0, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, '2026-02-15 11:30:00', 1, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, '2026-02-16 11:30:00', 0, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, '2026-02-17 11:30:00', 1, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, '2026-02-18 11:30:00', 0, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, '2026-02-19 11:30:00', 1, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, '2026-02-20 11:30:00', 0, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, '2026-02-21 11:30:00', 1, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, '2026-02-22 11:30:00', 0, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, '2026-02-23 11:30:00', 1, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, '2026-02-24 11:30:00', 0, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, '2026-02-25 11:30:00', 1, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, '2026-02-26 11:30:00', 0, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, '2026-02-27 11:30:00', 1, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, '2026-02-28 11:30:00', 0, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, '2026-02-01 11:30:00', 1, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, '2026-02-02 11:30:00', 0, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento OFF;
GO

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.planes_suscripcion ON;
INSERT INTO ventas.planes_suscripcion (id_plan_suscripcion, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PLAN_01', N'Kit Rutina La Roche-Posay #1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 285.50, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PLAN_02', N'Kit Rutina CeraVe Dermatological #2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 321.00, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PLAN_03', N'Kit Rutina The Ordinary Deciem #3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 356.50, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PLAN_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 392.00, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PLAN_05', N'Kit Rutina Bioderma Laboratoire #5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 427.50, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PLAN_06', N'Kit Rutina Eau Thermale Avène #6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 463.00, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PLAN_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 498.50, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PLAN_08', N'Kit Rutina Vichy Laboratoires #8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 534.00, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PLAN_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 569.50, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PLAN_10', N'Kit Rutina Sesderma Nanotech #10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 605.00, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PLAN_11', N'Kit Rutina NARS Cosmetics #11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 640.50, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PLAN_12', N'Kit Rutina MAC Professional #12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 676.00, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PLAN_13', N'Kit Rutina Fenty Beauty #13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 711.50, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PLAN_14', N'Kit Rutina Rare Beauty #14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 747.00, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PLAN_15', N'Kit Rutina Clinique Laboratories #15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 782.50, 5.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PLAN_16', N'Kit Rutina Estée Lauder #16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 818.00, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PLAN_17', N'Kit Rutina Lancôme Paris #17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 853.50, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PLAN_18', N'Kit Rutina Charlotte Tilbury #18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 889.00, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PLAN_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 924.50, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PLAN_20', N'Kit Rutina COSRX K-Beauty #20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 960.00, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PLAN_21', N'Kit Rutina Laneige Amorepacific #21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 995.50, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PLAN_22', N'Kit Rutina Uriage Eau Thermale #22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1031.00, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PLAN_23', N'Kit Rutina Laboratoire SVR #23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1066.50, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PLAN_24', N'Kit Rutina MartiDerm Ampollas #24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1102.00, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PLAN_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1137.50, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PLAN_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1173.00, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PLAN_27', N'Kit Rutina Garnier SkinActive #27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1208.50, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PLAN_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1244.00, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PLAN_29', N'Kit Rutina Neutrogena Derm #29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1279.50, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PLAN_30', N'Kit Rutina DermaCare Labs México #30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 1315.00, 5.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.planes_suscripcion OFF;
GO

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.frecuencias_suscripcion ON;
INSERT INTO ventas.frecuencias_suscripcion (id_frecuencia_suscripcion, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FRECUENC_01', N'Carlos Mendoza Garza', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FRECUENC_02', N'Sofía Ramírez López', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FRECUENC_03', N'Valeria Torres Villarreal', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FRECUENC_04', N'Alejandro Hernández Cruz', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FRECUENC_05', N'Mariana Sánchez Fuentes', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FRECUENC_06', N'Diego Martínez Treviño', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FRECUENC_07', N'Camila González Reyes', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FRECUENC_08', N'Mateo Flores Castillo', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FRECUENC_09', N'Lucía Morales Díaz', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FRECUENC_10', N'Sebastián Vázquez Ortiz', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FRECUENC_11', N'Regina Gutiérrez Nava', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FRECUENC_12', N'Santiago Jiménez Pérez', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FRECUENC_13', N'Fernanda Ruiz Salazar', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FRECUENC_14', N'Emiliano Ríos Cárdenas', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FRECUENC_15', N'Ximena Aguilar Ibarra', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FRECUENC_16', N'Daniel Méndez Navarro', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FRECUENC_17', N'Andrea Castro Delgado', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FRECUENC_18', N'Gabriel Vega Montoya', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FRECUENC_19', N'Paula Cortés Rojas', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FRECUENC_20', N'Andrés Ramos Campos', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FRECUENC_21', N'Renata Guerrero Luna', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FRECUENC_22', N'Nicolás Peña Cabrera', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FRECUENC_23', N'Natalia Herrera Vargas', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FRECUENC_24', N'Joaquín Medina Contreras', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FRECUENC_25', N'Isabella Domínguez Escobar', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FRECUENC_26', N'Leonardo Silva Paredes', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FRECUENC_27', N'Ana Chávez Bautista', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FRECUENC_28', N'Rodrigo Ochoa Acosta', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FRECUENC_29', N'Paulina Miranda Leal', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FRECUENC_30', N'Mauricio Padilla Solís', 60, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.frecuencias_suscripcion OFF;
GO

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_cliente ON;
INSERT INTO ventas.suscripciones_cliente (id_suscripcion_cliente, folio_suscripcion, cliente, plan_suscripcion, frecuencia_suscripcion, direccion_entrega, metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-01', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-03-02', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-03-03', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-03-04', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-03-05', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-03-06', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-03-07', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-03-08', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-03-09', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-03-10', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-03-11', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-03-12', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-03-13', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-03-14', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-03-15', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-03-16', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-03-17', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-03-18', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-03-19', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-03-20', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-03-21', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-03-22', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-03-23', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-03-24', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-03-25', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-03-26', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-03-27', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-03-28', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-01', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-03-02', N'PAUSADA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_cliente OFF;
GO

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_items ON;
INSERT INTO ventas.suscripciones_items (id_suscripcion_item, suscripcion_cliente, variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_items OFF;
GO

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas ON;
INSERT INTO ventas.suscripciones_calendario_entregas (id_entrega_programada, suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO ventas.suscripciones_bitacora_estados (id_bitacora_suscripcion, suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10', N'Sérum Niacinamida 10', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumo', N'Gel Limpiador Espumo', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Flui', N'Protector Solar Flui', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurón', N'Sérum Ácido Hialurón', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con', N'Crema Hidratante con', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% No', N'Retinol Puro 0.5% No', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermoli', N'Agua Micelar Dermoli', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pur', N'Sérum Vitamina C Pur', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje C', N'Base de Maquillaje C', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Al', N'Corrector Líquido Al', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Ci', N'Bálsamo Reparador Ci', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Sal', N'Exfoliante Ácido Sal', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con', N'Contorno de Ojos con', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna ', N'Mascarilla Nocturna ', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmant', N'Bruma Termal Calmant', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emu', N'Aceite Limpiador Emu', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante ', N'Tónico Equilibrante ', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Pé', N'Labial Hidratante Pé', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Mat', N'Polvo Traslúcido Mat', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmen', N'Rubor Líquido Pigmen', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico', N'Sérum Ácido Azelaico', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteogli', N'Ampolletas Proteogli', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante', N'Crema Despigmentante', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mine', N'Protector Solar Mine', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea', N'Loción Corporal Urea', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimi', N'Primer Facial Minimi', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas ', N'Máscara de Pestañas ', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Co', N'Sérum Péptidos de Co', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillan', N'Bálsamo Desmaquillan', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-R', N'Crema Barrera Post-R', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados OFF;
GO

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp ON;
INSERT INTO ventas.regalos_por_compra_gwp (id_regalo_compra, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROMOCIO_01', N'Kit Rutina La Roche-Posay #1', 17.50, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROMOCIO_02', N'Kit Rutina CeraVe Dermatological #2', 20.00, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROMOCIO_03', N'Kit Rutina The Ordinary Deciem #3', 22.50, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 14, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROMOCIO_04', N'Kit Rutina ISDIN Fotoprotección #4', 25.00, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 17, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROMOCIO_05', N'Kit Rutina Bioderma Laboratoire #5', 27.50, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 20, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROMOCIO_06', N'Kit Rutina Eau Thermale Avène #6', 30.00, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 23, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROMOCIO_07', N'Kit Rutina Eucerin Beiersdorf #7', 32.50, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 26, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROMOCIO_08', N'Kit Rutina Vichy Laboratoires #8', 35.00, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 29, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROMOCIO_09', N'Kit Rutina SkinCeuticals Clinical #9', 37.50, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 32, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROMOCIO_10', N'Kit Rutina Sesderma Nanotech #10', 40.00, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 35, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROMOCIO_11', N'Kit Rutina NARS Cosmetics #11', 42.50, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 38, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROMOCIO_12', N'Kit Rutina MAC Professional #12', 45.00, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 41, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROMOCIO_13', N'Kit Rutina Fenty Beauty #13', 47.50, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 44, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROMOCIO_14', N'Kit Rutina Rare Beauty #14', 50.00, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 47, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROMOCIO_15', N'Kit Rutina Clinique Laboratories #15', 52.50, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROMOCIO_16', N'Kit Rutina Estée Lauder #16', 55.00, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 53, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROMOCIO_17', N'Kit Rutina Lancôme Paris #17', 57.50, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 56, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROMOCIO_18', N'Kit Rutina Charlotte Tilbury #18', 60.00, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 59, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROMOCIO_19', N'Kit Rutina Paula''s Choice Skincare #19', 62.50, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROMOCIO_20', N'Kit Rutina COSRX K-Beauty #20', 65.00, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROMOCIO_21', N'Kit Rutina Laneige Amorepacific #21', 67.50, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 68, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROMOCIO_22', N'Kit Rutina Uriage Eau Thermale #22', 70.00, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 71, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROMOCIO_23', N'Kit Rutina Laboratoire SVR #23', 72.50, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 74, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROMOCIO_24', N'Kit Rutina MartiDerm Ampollas #24', 75.00, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 77, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROMOCIO_25', N'Kit Rutina Heliocare Cantabria Labs #25', 77.50, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 80, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROMOCIO_26', N'Kit Rutina Kiehl''s Since 1851 #26', 80.00, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 83, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROMOCIO_27', N'Kit Rutina Garnier SkinActive #27', 82.50, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 86, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROMOCIO_28', N'Kit Rutina L''Oréal Paris Derm #28', 85.00, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 89, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROMOCIO_29', N'Kit Rutina Neutrogena Derm #29', 87.50, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 92, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROMOCIO_30', N'Kit Rutina DermaCare Labs México #30', 90.00, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 95, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp OFF;
GO

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes ON;
INSERT INTO ventas.ordenes (id_orden, folio_orden, cliente, estado_orden, motivo_cancelacion, direccion_envio, direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 285.50, 17.50, 45.68, 17.50, 285.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 20.00, 51.36, 20.00, 321.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 356.50, 22.50, 57.04, 22.50, 356.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 25.00, 62.72, 25.00, 392.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 427.50, 27.50, 68.40, 27.50, 427.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 30.00, 74.08, 30.00, 463.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 7, NULL, 7, 7, '2026-02-07 11:30:00', 498.50, 32.50, 79.76, 32.50, 498.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 35.00, 85.44, 35.00, 534.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 569.50, 37.50, 91.12, 37.50, 569.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 40.00, 96.80, 40.00, 605.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 640.50, 42.50, 102.48, 42.50, 640.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 45.00, 108.16, 45.00, 676.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 6, NULL, 13, 13, '2026-02-13 11:30:00', 711.50, 47.50, 113.84, 47.50, 711.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 7, NULL, 14, 14, '2026-02-14 11:30:00', 747.00, 50.00, 119.52, 50.00, 747.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 782.50, 52.50, 125.20, 52.50, 782.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 55.00, 130.88, 55.00, 818.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 853.50, 57.50, 136.56, 57.50, 853.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 60.00, 142.24, 60.00, 889.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 924.50, 62.50, 147.92, 62.50, 924.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 6, NULL, 20, 20, '2026-02-20 11:30:00', 960.00, 65.00, 153.60, 65.00, 960.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 7, NULL, 21, 21, '2026-02-21 11:30:00', 995.50, 67.50, 159.28, 67.50, 995.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 70.00, 164.96, 70.00, 1031.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 1066.50, 72.50, 170.64, 72.50, 1066.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 75.00, 176.32, 75.00, 1102.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 1137.50, 77.50, 182.00, 77.50, 1137.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 80.00, 187.68, 80.00, 1173.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 6, NULL, 27, 27, '2026-02-27 11:30:00', 1208.50, 82.50, 193.36, 82.50, 1208.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 7, NULL, 28, 28, '2026-02-28 11:30:00', 1244.00, 85.00, 199.04, 85.00, 1244.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 1279.50, 87.50, 204.72, 87.50, 1279.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 90.00, 210.40, 90.00, 1315.00, 'MXN', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes OFF;
GO

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_detalles ON;
INSERT INTO ventas.ordenes_detalles (id_orden_detalle, orden, variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 8, 285.50, 17.50, 10.00, 17.50, 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 11, 321.00, 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 14, 356.50, 22.50, 30.00, 22.50, 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 17, 392.00, 25.00, 40.00, 25.00, 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 20, 427.50, 27.50, 50.00, 27.50, 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 23, 463.00, 30.00, 60.00, 30.00, 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 26, 498.50, 32.50, 70.00, 32.50, 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 29, 534.00, 35.00, 80.00, 35.00, 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 32, 569.50, 37.50, 90.00, 37.50, 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 35, 605.00, 40.00, 100.00, 40.00, 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 38, 640.50, 42.50, 110.00, 42.50, 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 41, 676.00, 45.00, 120.00, 45.00, 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 44, 711.50, 47.50, 130.00, 47.50, 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 47, 747.00, 50.00, 140.00, 50.00, 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 50, 782.50, 52.50, 150.00, 52.50, 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 53, 818.00, 55.00, 160.00, 55.00, 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 56, 853.50, 57.50, 170.00, 57.50, 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 59, 889.00, 60.00, 180.00, 60.00, 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 62, 924.50, 62.50, 190.00, 62.50, 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 65, 960.00, 65.00, 200.00, 65.00, 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 68, 995.50, 67.50, 210.00, 67.50, 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 71, 1031.00, 70.00, 220.00, 70.00, 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 74, 1066.50, 72.50, 230.00, 72.50, 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 77, 1102.00, 75.00, 240.00, 75.00, 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 80, 1137.50, 77.50, 250.00, 77.50, 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 83, 1173.00, 80.00, 260.00, 80.00, 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 86, 1208.50, 82.50, 270.00, 82.50, 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 89, 1244.00, 85.00, 280.00, 85.00, 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 92, 1279.50, 87.50, 290.00, 87.50, 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 95, 1315.00, 90.00, 300.00, 90.00, 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_detalles OFF;
GO

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_historial_estados ON;
INSERT INTO ventas.ordenes_historial_estados (id_orden_historial, orden, estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_historial_estados OFF;
GO

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_splits_almacen ON;
INSERT INTO ventas.ordenes_splits_almacen (id_orden_split, orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Po', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermat', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotop', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Lab', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avè', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiers', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoire', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeut', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Na', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmeti', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professi', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beaut', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty ', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Labo', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder ', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lanc', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte T', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beau', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Ea', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laborato', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDer', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Helioca', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s ', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier ', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris De', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs', N'EN_RUTA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_splits_almacen OFF;
GO

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_impuestos ON;
INSERT INTO ventas.ordenes_impuestos (id_orden_impuesto, orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'002_IVA', 0.160000, 17.50, 45.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'003_IEPS', 0.160000, 20.00, 51.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'002_IVA', 0.160000, 22.50, 57.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'003_IEPS', 0.160000, 25.00, 62.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'002_IVA', 0.160000, 27.50, 68.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'003_IEPS', 0.160000, 30.00, 74.08, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'002_IVA', 0.160000, 32.50, 79.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'003_IEPS', 0.160000, 35.00, 85.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'002_IVA', 0.160000, 37.50, 91.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'003_IEPS', 0.160000, 40.00, 96.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'002_IVA', 0.160000, 42.50, 102.48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'003_IEPS', 0.160000, 45.00, 108.16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'002_IVA', 0.160000, 47.50, 113.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'003_IEPS', 0.160000, 50.00, 119.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'002_IVA', 0.160000, 52.50, 125.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'003_IEPS', 0.160000, 55.00, 130.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'002_IVA', 0.160000, 57.50, 136.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'003_IEPS', 0.160000, 60.00, 142.24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'002_IVA', 0.160000, 62.50, 147.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'003_IEPS', 0.160000, 65.00, 153.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'002_IVA', 0.160000, 67.50, 159.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'003_IEPS', 0.160000, 70.00, 164.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'002_IVA', 0.160000, 72.50, 170.64, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'003_IEPS', 0.160000, 75.00, 176.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'002_IVA', 0.160000, 77.50, 182.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'003_IEPS', 0.160000, 80.00, 187.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'002_IVA', 0.160000, 82.50, 193.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'003_IEPS', 0.160000, 85.00, 199.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'002_IVA', 0.160000, 87.50, 204.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'003_IEPS', 0.160000, 90.00, 210.40, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_impuestos OFF;
GO

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_descuentos ON;
INSERT INTO ventas.ordenes_descuentos (id_orden_descuento, orden, tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'PROMOCIO_01', 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'PROMOCIO_02', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'PROMOCIO_03', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'PROMOCIO_04', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'PROMOCIO_05', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'PROMOCIO_06', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'PROMOCIO_07', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'PROMOCIO_08', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'PROMOCIO_09', 90.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'PROMOCIO_10', 100.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'PROMOCIO_11', 110.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'PROMOCIO_12', 120.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'PROMOCIO_13', 130.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'PROMOCIO_14', 140.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'PROMOCIO_15', 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'PROMOCIO_16', 160.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'PROMOCIO_17', 170.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'PROMOCIO_18', 180.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'PROMOCIO_19', 190.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'PROMOCIO_20', 200.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'PROMOCIO_21', 210.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'PROMOCIO_22', 220.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'PROMOCIO_23', 230.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'PROMOCIO_24', 240.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'PROMOCIO_25', 250.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'PROMOCIO_26', 260.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'PROMOCIO_27', 270.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'PROMOCIO_28', 280.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'PROMOCIO_29', 290.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'PROMOCIO_30', 300.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_descuentos OFF;
GO

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones ON;
INSERT INTO ventas.ordenes_notas_instrucciones (id_orden_nota, orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO ventas.reservas_temporales_stock (id_reserva_stock, carrito, variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.reservas_temporales_stock OFF;
GO

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.afiliados_influencers ON;
INSERT INTO ventas.afiliados_influencers (id_afiliado, codigo_afiliado, usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'AFILIADO_01', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 6.00, '012180001234567801', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'AFILIADO_02', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 7.00, '012180001234567802', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'AFILIADO_03', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 8.00, '012180001234567803', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'AFILIADO_04', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 9.00, '012180001234567804', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'AFILIADO_05', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 10.00, '012180001234567805', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'AFILIADO_06', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 11.00, '012180001234567806', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'AFILIADO_07', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 12.00, '012180001234567807', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'AFILIADO_08', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 13.00, '012180001234567808', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'AFILIADO_09', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 14.00, '012180001234567809', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'AFILIADO_10', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 15.00, '012180001234567810', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'AFILIADO_11', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 16.00, '012180001234567811', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'AFILIADO_12', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 17.00, '012180001234567812', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'AFILIADO_13', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 18.00, '012180001234567813', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'AFILIADO_14', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 19.00, '012180001234567814', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'AFILIADO_15', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 5.00, '012180001234567815', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'AFILIADO_16', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 6.00, '012180001234567816', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'AFILIADO_17', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 7.00, '012180001234567817', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'AFILIADO_18', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 8.00, '012180001234567818', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'AFILIADO_19', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 9.00, '012180001234567819', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'AFILIADO_20', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 10.00, '012180001234567820', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'AFILIADO_21', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 11.00, '012180001234567821', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'AFILIADO_22', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 12.00, '012180001234567822', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'AFILIADO_23', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 13.00, '012180001234567823', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'AFILIADO_24', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 14.00, '012180001234567824', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'AFILIADO_25', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 15.00, '012180001234567825', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'AFILIADO_26', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 16.00, '012180001234567826', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'AFILIADO_27', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 17.00, '012180001234567827', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'AFILIADO_28', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 18.00, '012180001234567828', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'AFILIADO_29', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 19.00, '012180001234567829', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'AFILIADO_30', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 5.00, '012180001234567830', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.afiliados_influencers OFF;
GO

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.comisiones_afiliados ON;
INSERT INTO ventas.comisiones_afiliados (id_comision_afiliado, afiliado, orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 17.50, 17.50, N'PENDIENTE', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, 20.00, N'APROBADA', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, 22.50, N'PAGADA', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, 25.00, N'PENDIENTE', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, 27.50, N'APROBADA', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 30.00, 30.00, N'PAGADA', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 32.50, 32.50, N'PENDIENTE', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 35.00, 35.00, N'APROBADA', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 37.50, 37.50, N'PAGADA', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 40.00, 40.00, N'PENDIENTE', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 42.50, 42.50, N'APROBADA', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 45.00, 45.00, N'PAGADA', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 47.50, 47.50, N'PENDIENTE', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 50.00, 50.00, N'APROBADA', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 52.50, 52.50, N'PAGADA', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 55.00, 55.00, N'PENDIENTE', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 57.50, 57.50, N'APROBADA', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 60.00, 60.00, N'PAGADA', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62.50, 62.50, N'PENDIENTE', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65.00, 65.00, N'APROBADA', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 67.50, 67.50, N'PAGADA', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 70.00, 70.00, N'PENDIENTE', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 72.50, 72.50, N'APROBADA', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 75.00, 75.00, N'PAGADA', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 77.50, 77.50, N'PENDIENTE', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 80.00, 80.00, N'APROBADA', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 82.50, 82.50, N'PAGADA', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 85.00, 85.00, N'PENDIENTE', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 87.50, 87.50, N'APROBADA', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 90.00, 90.00, N'PAGADA', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.comisiones_afiliados OFF;
GO

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.proveedores_pasarela ON;
INSERT INTO pagos.proveedores_pasarela (id_proveedor_pasarela, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PASARELA_01', N'Kit Rutina La Roche-Posay #1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PASARELA_02', N'Kit Rutina CeraVe Dermatological #2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PASARELA_03', N'Kit Rutina The Ordinary Deciem #3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PASARELA_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PASARELA_05', N'Kit Rutina Bioderma Laboratoire #5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PASARELA_06', N'Kit Rutina Eau Thermale Avène #6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PASARELA_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PASARELA_08', N'Kit Rutina Vichy Laboratoires #8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PASARELA_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PASARELA_10', N'Kit Rutina Sesderma Nanotech #10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PASARELA_11', N'Kit Rutina NARS Cosmetics #11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PASARELA_12', N'Kit Rutina MAC Professional #12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PASARELA_13', N'Kit Rutina Fenty Beauty #13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PASARELA_14', N'Kit Rutina Rare Beauty #14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PASARELA_15', N'Kit Rutina Clinique Laboratories #15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PASARELA_16', N'Kit Rutina Estée Lauder #16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PASARELA_17', N'Kit Rutina Lancôme Paris #17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PASARELA_18', N'Kit Rutina Charlotte Tilbury #18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PASARELA_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PASARELA_20', N'Kit Rutina COSRX K-Beauty #20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PASARELA_21', N'Kit Rutina Laneige Amorepacific #21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PASARELA_22', N'Kit Rutina Uriage Eau Thermale #22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PASARELA_23', N'Kit Rutina Laboratoire SVR #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PASARELA_24', N'Kit Rutina MartiDerm Ampollas #24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PASARELA_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PASARELA_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PASARELA_27', N'Kit Rutina Garnier SkinActive #27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PASARELA_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PASARELA_29', N'Kit Rutina Neutrogena Derm #29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PASARELA_30', N'Kit Rutina DermaCare Labs México #30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.proveedores_pasarela OFF;
GO

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.metodos_pago ON;
INSERT INTO pagos.metodos_pago (id_metodo_pago, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.transacciones (id_transaccion, folio_transaccion, orden, proveedor_pasarela, metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 285.50, 'MXN', N'PENDIENTE', N'AUTORIZA_01', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 321.00, 'MXN', N'APROBADA', N'AUTORIZA_02', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 356.50, 'MXN', N'RECHAZADA', N'AUTORIZA_03', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 392.00, 'MXN', N'CANCELADA', N'AUTORIZA_04', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 427.50, 'MXN', N'EN_MEDIACION', N'AUTORIZA_05', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 6, 1, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 463.00, 'MXN', N'PENDIENTE', N'AUTORIZA_06', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 7, 2, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 498.50, 'MXN', N'APROBADA', N'AUTORIZA_07', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 8, 3, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 534.00, 'MXN', N'RECHAZADA', N'AUTORIZA_08', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 9, 4, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 569.50, 'MXN', N'CANCELADA', N'AUTORIZA_09', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 10, 5, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 605.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_10', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 11, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 640.50, 'MXN', N'PENDIENTE', N'AUTORIZA_11', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 12, 2, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 676.00, 'MXN', N'APROBADA', N'AUTORIZA_12', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 13, 3, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 711.50, 'MXN', N'RECHAZADA', N'AUTORIZA_13', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 14, 4, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 747.00, 'MXN', N'CANCELADA', N'AUTORIZA_14', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 15, 5, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 782.50, 'MXN', N'EN_MEDIACION', N'AUTORIZA_15', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 16, 1, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 818.00, 'MXN', N'PENDIENTE', N'AUTORIZA_16', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 17, 2, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 853.50, 'MXN', N'APROBADA', N'AUTORIZA_17', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 18, 3, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 889.00, 'MXN', N'RECHAZADA', N'AUTORIZA_18', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 19, 4, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 924.50, 'MXN', N'CANCELADA', N'AUTORIZA_19', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 20, 5, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 960.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_20', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 21, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 995.50, 'MXN', N'PENDIENTE', N'AUTORIZA_21', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 22, 2, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1031.00, 'MXN', N'APROBADA', N'AUTORIZA_22', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 23, 3, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1066.50, 'MXN', N'RECHAZADA', N'AUTORIZA_23', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 24, 4, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1102.00, 'MXN', N'CANCELADA', N'AUTORIZA_24', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 25, 5, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1137.50, 'MXN', N'EN_MEDIACION', N'AUTORIZA_25', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 26, 1, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1173.00, 'MXN', N'PENDIENTE', N'AUTORIZA_26', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 27, 2, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1208.50, 'MXN', N'APROBADA', N'AUTORIZA_27', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 28, 3, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1244.00, 'MXN', N'RECHAZADA', N'AUTORIZA_28', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 29, 4, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1279.50, 'MXN', N'CANCELADA', N'AUTORIZA_29', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 30, 5, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 1315.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_30', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.transacciones OFF;
GO

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.intentos_cobro ON;
INSERT INTO pagos.intentos_cobro (id_intento_cobro, transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 200, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 200, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 200, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 200, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 200, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 200, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 200, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 200, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.intentos_cobro OFF;
GO

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.split_multipagos ON;
INSERT INTO pagos.split_multipagos (id_split_pago, orden, metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 17.50, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 30.00, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 32.50, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 35.00, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 37.50, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 40.00, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 42.50, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 45.00, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 47.50, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 50.00, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 52.50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 55.00, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 57.50, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 60.00, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 62.50, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 65.00, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 67.50, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 70.00, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 72.50, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 75.00, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 77.50, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 80.00, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 82.50, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 85.00, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 87.50, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 90.00, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.split_multipagos OFF;
GO

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.billetera_electronica ON;
INSERT INTO pagos.billetera_electronica (id_billetera, cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.billetera_electronica OFF;
GO

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.movimientos_billetera ON;
INSERT INTO pagos.movimientos_billetera (id_movimiento_billetera, billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CARGA_SALDO', 285.50, 17.50, 17.50, N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAGO_ORDEN', 321.00, 20.00, 20.00, N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'REEMBOLSO_DEVOLUCION', 356.50, 22.50, 22.50, N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CARGA_SALDO', 392.00, 25.00, 25.00, N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PAGO_ORDEN', 427.50, 27.50, 27.50, N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'REEMBOLSO_DEVOLUCION', 463.00, 30.00, 30.00, N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CARGA_SALDO', 498.50, 32.50, 32.50, N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PAGO_ORDEN', 534.00, 35.00, 35.00, N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'REEMBOLSO_DEVOLUCION', 569.50, 37.50, 37.50, N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CARGA_SALDO', 605.00, 40.00, 40.00, N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PAGO_ORDEN', 640.50, 42.50, 42.50, N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'REEMBOLSO_DEVOLUCION', 676.00, 45.00, 45.00, N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CARGA_SALDO', 711.50, 47.50, 47.50, N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAGO_ORDEN', 747.00, 50.00, 50.00, N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'REEMBOLSO_DEVOLUCION', 782.50, 52.50, 52.50, N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CARGA_SALDO', 818.00, 55.00, 55.00, N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'PAGO_ORDEN', 853.50, 57.50, 57.50, N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'REEMBOLSO_DEVOLUCION', 889.00, 60.00, 60.00, N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CARGA_SALDO', 924.50, 62.50, 62.50, N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PAGO_ORDEN', 960.00, 65.00, 65.00, N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'REEMBOLSO_DEVOLUCION', 995.50, 67.50, 67.50, N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CARGA_SALDO', 1031.00, 70.00, 70.00, N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PAGO_ORDEN', 1066.50, 72.50, 72.50, N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'REEMBOLSO_DEVOLUCION', 1102.00, 75.00, 75.00, N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CARGA_SALDO', 1137.50, 77.50, 77.50, N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAGO_ORDEN', 1173.00, 80.00, 80.00, N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'REEMBOLSO_DEVOLUCION', 1208.50, 82.50, 82.50, N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CARGA_SALDO', 1244.00, 85.00, 85.00, N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'PAGO_ORDEN', 1279.50, 87.50, 87.50, N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'REEMBOLSO_DEVOLUCION', 1315.00, 90.00, 90.00, N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.movimientos_billetera OFF;
GO

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards ON;
INSERT INTO pagos.tarjetas_regalo_giftcards (id_giftcard, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.redenciones_giftcards (id_redencion_giftcard, giftcard, orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.reglas_antifraude (id_regla_antifraude, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'REGLA_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 6, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'REGLA_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 7, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'REGLA_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'REGLA_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 9, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'REGLA_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 10, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'REGLA_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 11, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'REGLA_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 12, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'REGLA_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 13, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'REGLA_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 14, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'REGLA_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 15, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'REGLA_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 16, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'REGLA_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 17, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'REGLA_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 18, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'REGLA_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 19, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'REGLA_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 20, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'REGLA_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 21, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'REGLA_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 22, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'REGLA_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 23, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'REGLA_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 24, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'REGLA_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 25, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'REGLA_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 26, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'REGLA_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 27, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'REGLA_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 28, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'REGLA_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 29, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'REGLA_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'REGLA_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 31, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'REGLA_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 32, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'REGLA_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 33, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'REGLA_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 34, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'REGLA_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reglas_antifraude OFF;
GO

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.evaluaciones_antifraude ON;
INSERT INTO pagos.evaluaciones_antifraude (id_evaluacion_fraude, orden, regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.contracargos_chargebacks (id_contracargo, transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-DISPU-2026-0001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-DISPU-2026-0002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-DISPU-2026-0003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, '2026-02-03 11:30:00', '2026-03-03', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-DISPU-2026-0004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, '2026-02-04 11:30:00', '2026-03-04', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-DISPU-2026-0005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, '2026-02-05 11:30:00', '2026-03-05', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-DISPU-2026-0006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, '2026-02-06 11:30:00', '2026-03-06', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-DISPU-2026-0007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, '2026-02-07 11:30:00', '2026-03-07', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-DISPU-2026-0008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, '2026-02-08 11:30:00', '2026-03-08', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-DISPU-2026-0009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, '2026-02-09 11:30:00', '2026-03-09', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-DISPU-2026-0010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, '2026-02-10 11:30:00', '2026-03-10', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-DISPU-2026-0011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, '2026-02-11 11:30:00', '2026-03-11', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-DISPU-2026-0012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, '2026-02-12 11:30:00', '2026-03-12', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-DISPU-2026-0013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, '2026-02-13 11:30:00', '2026-03-13', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-DISPU-2026-0014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, '2026-02-14 11:30:00', '2026-03-14', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-DISPU-2026-0015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, '2026-02-15 11:30:00', '2026-03-15', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-DISPU-2026-0016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, '2026-02-16 11:30:00', '2026-03-16', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-DISPU-2026-0017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, '2026-02-17 11:30:00', '2026-03-17', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-DISPU-2026-0018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, '2026-02-18 11:30:00', '2026-03-18', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-DISPU-2026-0019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, '2026-02-19 11:30:00', '2026-03-19', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-DISPU-2026-0020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, '2026-02-20 11:30:00', '2026-03-20', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-DISPU-2026-0021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, '2026-02-21 11:30:00', '2026-03-21', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-DISPU-2026-0022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, '2026-02-22 11:30:00', '2026-03-22', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-DISPU-2026-0023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, '2026-02-23 11:30:00', '2026-03-23', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-DISPU-2026-0024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, '2026-02-24 11:30:00', '2026-03-24', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-DISPU-2026-0025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, '2026-02-25 11:30:00', '2026-03-25', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-DISPU-2026-0026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, '2026-02-26 11:30:00', '2026-03-26', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-DISPU-2026-0027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, '2026-02-27 11:30:00', '2026-03-27', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-DISPU-2026-0028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, '2026-02-28 11:30:00', '2026-03-28', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-DISPU-2026-0029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-DISPU-2026-0030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.contracargos_chargebacks OFF;
GO

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.reembolsos_transaccion ON;
INSERT INTO pagos.reembolsos_transaccion (id_reembolso, transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-REEMB-2026-0001', 285.50, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-REEMB-2026-0002', 321.00, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-REEMB-2026-0003', 356.50, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-REEMB-2026-0004', 392.00, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-REEMB-2026-0005', 427.50, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-REEMB-2026-0006', 463.00, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-REEMB-2026-0007', 498.50, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-REEMB-2026-0008', 534.00, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-REEMB-2026-0009', 569.50, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-REEMB-2026-0010', 605.00, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-REEMB-2026-0011', 640.50, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-REEMB-2026-0012', 676.00, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-REEMB-2026-0013', 711.50, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-REEMB-2026-0014', 747.00, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-REEMB-2026-0015', 782.50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-REEMB-2026-0016', 818.00, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-REEMB-2026-0017', 853.50, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-REEMB-2026-0018', 889.00, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-REEMB-2026-0019', 924.50, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-REEMB-2026-0020', 960.00, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-REEMB-2026-0021', 995.50, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-REEMB-2026-0022', 1031.00, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-REEMB-2026-0023', 1066.50, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-REEMB-2026-0024', 1102.00, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-REEMB-2026-0025', 1137.50, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-REEMB-2026-0026', 1173.00, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-REEMB-2026-0027', 1208.50, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-REEMB-2026-0028', 1244.00, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-REEMB-2026-0029', 1279.50, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-REEMB-2026-0030', 1315.00, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reembolsos_transaccion OFF;
GO

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.regimenes_sat ON;
INSERT INTO fiscal.regimenes_sat (id_regimen_sat, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO fiscal.usos_cfdi (id_uso_cfdi, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO fiscal.datos_fiscales_cliente (id_dato_fiscal, cliente, rfc_emisor, razon_social, codigo_postal_fiscal, regimen_sat, uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 'Sérum Niacin', N'Laboratorios La Roche-Posay S.A. de C.V.', N'POSTAL_F_0', 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'POSTAL_F_0', 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Sol', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'POSTAL_F_0', 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'POSTAL_F_0', 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidrata', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'POSTAL_F_0', 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro ', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'POSTAL_F_0', 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar ', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'POSTAL_F_0', 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitami', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'POSTAL_F_0', 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maqui', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'POSTAL_F_0', 1, 1, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Lí', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'POSTAL_F_1', 2, 2, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Repa', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'POSTAL_F_1', 3, 3, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Á', N'Laboratorios MAC Professional S.A. de C.V.', N'POSTAL_F_1', 4, 4, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de O', N'Laboratorios Fenty Beauty S.A. de C.V.', N'POSTAL_F_1', 5, 5, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla No', N'Laboratorios Rare Beauty S.A. de C.V.', N'POSTAL_F_1', 6, 6, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal ', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'POSTAL_F_1', 7, 7, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpia', N'Laboratorios Estée Lauder S.A. de C.V.', N'POSTAL_F_1', 8, 8, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equil', N'Laboratorios Lancôme Paris S.A. de C.V.', N'POSTAL_F_1', 1, 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidrat', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'POSTAL_F_1', 2, 2, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslú', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'POSTAL_F_1', 3, 3, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquid', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'POSTAL_F_2', 4, 4, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'POSTAL_F_2', 5, 5, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Pr', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'POSTAL_F_2', 6, 6, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigm', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'POSTAL_F_2', 7, 7, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Sol', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'POSTAL_F_2', 8, 8, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corpo', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'POSTAL_F_2', 1, 1, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'POSTAL_F_2', 2, 2, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de P', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'POSTAL_F_2', 3, 3, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Pépti', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'POSTAL_F_2', 4, 4, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desm', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'POSTAL_F_2', 5, 5, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'POSTAL_F_3', 6, 6, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.datos_fiscales_cliente OFF;
GO

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_cfdi ON;
INSERT INTO fiscal.facturas_cfdi (id_factura, orden, dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 'Sérum Nia', N'FOL-FACTU-2026-0001', N'B1000000-0000-4000-8000-000000000001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 1', '2026-02-01 11:30:00', 17.50, N'TIMBRADA_VIGENTE', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpia', N'FOL-FACTU-2026-0002', N'B1000000-0000-4000-8000-000000000002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumo', '2026-02-02 11:30:00', 20.00, N'CANCELADA_SAT', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector ', N'FOL-FACTU-2026-0003', N'B1000000-0000-4000-8000-000000000003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Flui', '2026-02-03 11:30:00', 22.50, N'ERROR_TIMBRADO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ác', N'FOL-FACTU-2026-0004', N'B1000000-0000-4000-8000-000000000004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialur', '2026-02-04 11:30:00', 25.00, N'TIMBRADA_VIGENTE', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidr', N'FOL-FACTU-2026-0005', N'B1000000-0000-4000-8000-000000000005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con', '2026-02-05 11:30:00', 27.50, N'CANCELADA_SAT', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Pu', N'FOL-FACTU-2026-0006', N'B1000000-0000-4000-8000-000000000006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% No', '2026-02-06 11:30:00', 30.00, N'ERROR_TIMBRADO', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micel', N'FOL-FACTU-2026-0007', N'B1000000-0000-4000-8000-000000000007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermoli', '2026-02-07 11:30:00', 32.50, N'TIMBRADA_VIGENTE', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vit', N'FOL-FACTU-2026-0008', N'B1000000-0000-4000-8000-000000000008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pu', '2026-02-08 11:30:00', 35.00, N'CANCELADA_SAT', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Ma', N'FOL-FACTU-2026-0009', N'B1000000-0000-4000-8000-000000000009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje C', '2026-02-09 11:30:00', 37.50, N'ERROR_TIMBRADO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector ', N'FOL-FACTU-2026-0010', N'B1000000-0000-4000-8000-00000000000A', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido A', '2026-02-10 11:30:00', 40.00, N'TIMBRADA_VIGENTE', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo R', N'FOL-FACTU-2026-0011', N'B1000000-0000-4000-8000-00000000000B', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador C', '2026-02-11 11:30:00', 42.50, N'CANCELADA_SAT', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante', N'FOL-FACTU-2026-0012', N'B1000000-0000-4000-8000-00000000000C', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Sa', '2026-02-12 11:30:00', 45.00, N'ERROR_TIMBRADO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno d', N'FOL-FACTU-2026-0013', N'B1000000-0000-4000-8000-00000000000D', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con', '2026-02-13 11:30:00', 47.50, N'TIMBRADA_VIGENTE', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla', N'FOL-FACTU-2026-0014', N'B1000000-0000-4000-8000-00000000000E', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna ', '2026-02-14 11:30:00', 50.00, N'CANCELADA_SAT', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Term', N'FOL-FACTU-2026-0015', N'B1000000-0000-4000-8000-00000000000F', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmant', '2026-02-15 11:30:00', 52.50, N'ERROR_TIMBRADO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Lim', N'FOL-FACTU-2026-0016', N'B1000000-0000-4000-8000-000000000010', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emu', '2026-02-16 11:30:00', 55.00, N'TIMBRADA_VIGENTE', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Eq', N'FOL-FACTU-2026-0017', N'B1000000-0000-4000-8000-000000000011', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante', '2026-02-17 11:30:00', 57.50, N'CANCELADA_SAT', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hid', N'FOL-FACTU-2026-0018', N'B1000000-0000-4000-8000-000000000012', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante P', '2026-02-18 11:30:00', 60.00, N'ERROR_TIMBRADO', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Tras', N'FOL-FACTU-2026-0019', N'B1000000-0000-4000-8000-000000000013', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Ma', '2026-02-19 11:30:00', 62.50, N'TIMBRADA_VIGENTE', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líq', N'FOL-FACTU-2026-0020', N'B1000000-0000-4000-8000-000000000014', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigme', '2026-02-20 11:30:00', 65.00, N'CANCELADA_SAT', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ác', N'FOL-FACTU-2026-0021', N'B1000000-0000-4000-8000-000000000015', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelai', '2026-02-21 11:30:00', 67.50, N'ERROR_TIMBRADO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas', N'FOL-FACTU-2026-0022', N'B1000000-0000-4000-8000-000000000016', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteogli', '2026-02-22 11:30:00', 70.00, N'TIMBRADA_VIGENTE', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Desp', N'FOL-FACTU-2026-0023', N'B1000000-0000-4000-8000-000000000017', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante', '2026-02-23 11:30:00', 72.50, N'CANCELADA_SAT', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector ', N'FOL-FACTU-2026-0024', N'B1000000-0000-4000-8000-000000000018', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mine', '2026-02-24 11:30:00', 75.00, N'ERROR_TIMBRADO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Co', N'FOL-FACTU-2026-0025', N'B1000000-0000-4000-8000-000000000019', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Ure', '2026-02-25 11:30:00', 77.50, N'TIMBRADA_VIGENTE', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Fac', N'FOL-FACTU-2026-0026', N'B1000000-0000-4000-8000-00000000001A', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimi', '2026-02-26 11:30:00', 80.00, N'CANCELADA_SAT', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara d', N'FOL-FACTU-2026-0027', N'B1000000-0000-4000-8000-00000000001B', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestaña', '2026-02-27 11:30:00', 82.50, N'ERROR_TIMBRADO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Pé', N'FOL-FACTU-2026-0028', N'B1000000-0000-4000-8000-00000000001C', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de ', '2026-02-28 11:30:00', 85.00, N'TIMBRADA_VIGENTE', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo D', N'FOL-FACTU-2026-0029', N'B1000000-0000-4000-8000-00000000001D', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquilla', '2026-02-01 11:30:00', 87.50, N'CANCELADA_SAT', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barr', N'FOL-FACTU-2026-0030', N'B1000000-0000-4000-8000-00000000001E', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-R', '2026-02-02 11:30:00', 90.00, N'ERROR_TIMBRADO', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_cfdi OFF;
GO

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_partidas ON;
INSERT INTO fiscal.facturas_partidas (id_factura_partida, factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'PRODUCTO_0', N'UNIDA', 17.50, 17.50, 17.50, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PRODUCTO_0', N'UNIDA', 20.00, 20.00, 20.00, 'Gel', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'PRODUCTO_0', N'UNIDA', 22.50, 22.50, 22.50, 'Pro', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'PRODUCTO_0', N'UNIDA', 25.00, 25.00, 25.00, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PRODUCTO_0', N'UNIDA', 27.50, 27.50, 27.50, 'Cre', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PRODUCTO_0', N'UNIDA', 30.00, 30.00, 30.00, 'Ret', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'PRODUCTO_0', N'UNIDA', 32.50, 32.50, 32.50, 'Agu', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PRODUCTO_0', N'UNIDA', 35.00, 35.00, 35.00, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'PRODUCTO_0', N'UNIDA', 37.50, 37.50, 37.50, 'Bas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PRODUCTO_1', N'UNIDA', 40.00, 40.00, 40.00, 'Cor', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PRODUCTO_1', N'UNIDA', 42.50, 42.50, 42.50, 'Bá', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'PRODUCTO_1', N'UNIDA', 45.00, 45.00, 45.00, 'Exf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'PRODUCTO_1', N'UNIDA', 47.50, 47.50, 47.50, 'Con', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PRODUCTO_1', N'UNIDA', 50.00, 50.00, 50.00, 'Mas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'PRODUCTO_1', N'UNIDA', 52.50, 52.50, 52.50, 'Bru', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'PRODUCTO_1', N'UNIDA', 55.00, 55.00, 55.00, 'Ace', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'PRODUCTO_1', N'UNIDA', 57.50, 57.50, 57.50, 'Tó', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PRODUCTO_1', N'UNIDA', 60.00, 60.00, 60.00, 'Lab', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'PRODUCTO_1', N'UNIDA', 62.50, 62.50, 62.50, 'Pol', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PRODUCTO_2', N'UNIDA', 65.00, 65.00, 65.00, 'Rub', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'PRODUCTO_2', N'UNIDA', 67.50, 67.50, 67.50, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PRODUCTO_2', N'UNIDA', 70.00, 70.00, 70.00, 'Amp', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PRODUCTO_2', N'UNIDA', 72.50, 72.50, 72.50, 'Cre', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'PRODUCTO_2', N'UNIDA', 75.00, 75.00, 75.00, 'Pro', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'PRODUCTO_2', N'UNIDA', 77.50, 77.50, 77.50, 'Loc', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PRODUCTO_2', N'UNIDA', 80.00, 80.00, 80.00, 'Pri', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'PRODUCTO_2', N'UNIDA', 82.50, 82.50, 82.50, 'Má', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'PRODUCTO_2', N'UNIDA', 85.00, 85.00, 85.00, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'PRODUCTO_2', N'UNIDA', 87.50, 87.50, 87.50, 'Bá', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PRODUCTO_3', N'UNIDA', 90.00, 90.00, 90.00, 'Cre', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_partidas OFF;
GO

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.complementos_pago ON;
INSERT INTO fiscal.complementos_pago (id_complemento_pago, factura, transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'B1000000-0000-4000-8000-000000000001', 1, 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'B1000000-0000-4000-8000-000000000002', 1, 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'B1000000-0000-4000-8000-000000000003', 1, 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'B1000000-0000-4000-8000-000000000004', 1, 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'B1000000-0000-4000-8000-000000000005', 1, 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'B1000000-0000-4000-8000-000000000006', 1, 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'B1000000-0000-4000-8000-000000000007', 1, 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'B1000000-0000-4000-8000-000000000008', 1, 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'B1000000-0000-4000-8000-000000000009', 1, 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'B1000000-0000-4000-8000-00000000000A', 1, 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'B1000000-0000-4000-8000-00000000000B', 1, 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'B1000000-0000-4000-8000-00000000000C', 1, 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'B1000000-0000-4000-8000-00000000000D', 1, 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'B1000000-0000-4000-8000-00000000000E', 1, 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'B1000000-0000-4000-8000-00000000000F', 1, 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'B1000000-0000-4000-8000-000000000010', 1, 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'B1000000-0000-4000-8000-000000000011', 1, 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'B1000000-0000-4000-8000-000000000012', 1, 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'B1000000-0000-4000-8000-000000000013', 1, 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'B1000000-0000-4000-8000-000000000014', 1, 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'B1000000-0000-4000-8000-000000000015', 1, 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'B1000000-0000-4000-8000-000000000016', 1, 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'B1000000-0000-4000-8000-000000000017', 1, 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'B1000000-0000-4000-8000-000000000018', 1, 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'B1000000-0000-4000-8000-000000000019', 1, 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'B1000000-0000-4000-8000-00000000001A', 1, 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'B1000000-0000-4000-8000-00000000001B', 1, 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'B1000000-0000-4000-8000-00000000001C', 1, 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'B1000000-0000-4000-8000-00000000001D', 1, 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'B1000000-0000-4000-8000-00000000001E', 1, 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.complementos_pago OFF;
GO

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.notas_credito ON;
INSERT INTO fiscal.notas_credito (id_nota_credito, factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'B1000000-0000-4000-8000-000000000001', 'Sé', 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'B1000000-0000-4000-8000-000000000002', 'Gel', 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'B1000000-0000-4000-8000-000000000003', 'Pro', 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'B1000000-0000-4000-8000-000000000004', 'Sé', 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'B1000000-0000-4000-8000-000000000005', 'Cre', 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'B1000000-0000-4000-8000-000000000006', 'Ret', 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'B1000000-0000-4000-8000-000000000007', 'Agu', 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'B1000000-0000-4000-8000-000000000008', 'Sé', 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'B1000000-0000-4000-8000-000000000009', 'Bas', 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'B1000000-0000-4000-8000-00000000000A', 'Cor', 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'B1000000-0000-4000-8000-00000000000B', 'Bá', 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'B1000000-0000-4000-8000-00000000000C', 'Exf', 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'B1000000-0000-4000-8000-00000000000D', 'Con', 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'B1000000-0000-4000-8000-00000000000E', 'Mas', 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'B1000000-0000-4000-8000-00000000000F', 'Bru', 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'B1000000-0000-4000-8000-000000000010', 'Ace', 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'B1000000-0000-4000-8000-000000000011', 'Tó', 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'B1000000-0000-4000-8000-000000000012', 'Lab', 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'B1000000-0000-4000-8000-000000000013', 'Pol', 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'B1000000-0000-4000-8000-000000000014', 'Rub', 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'B1000000-0000-4000-8000-000000000015', 'Sé', 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'B1000000-0000-4000-8000-000000000016', 'Amp', 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'B1000000-0000-4000-8000-000000000017', 'Cre', 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'B1000000-0000-4000-8000-000000000018', 'Pro', 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'B1000000-0000-4000-8000-000000000019', 'Loc', 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'B1000000-0000-4000-8000-00000000001A', 'Pri', 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'B1000000-0000-4000-8000-00000000001B', 'Má', 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'B1000000-0000-4000-8000-00000000001C', 'Sé', 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'B1000000-0000-4000-8000-00000000001D', 'Bá', 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'B1000000-0000-4000-8000-00000000001E', 'Cre', 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.notas_credito OFF;
GO

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi ON;
INSERT INTO fiscal.cancelaciones_cfdi (id_cancelacion_cfdi, factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'01', N'B1000000-0000-4000-8000-000000000001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'02', N'B1000000-0000-4000-8000-000000000002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'03', N'B1000000-0000-4000-8000-000000000003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'04', N'B1000000-0000-4000-8000-000000000004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'01', N'B1000000-0000-4000-8000-000000000005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'02', N'B1000000-0000-4000-8000-000000000006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'03', N'B1000000-0000-4000-8000-000000000007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'04', N'B1000000-0000-4000-8000-000000000008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'01', N'B1000000-0000-4000-8000-000000000009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'02', N'B1000000-0000-4000-8000-00000000000A', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'03', N'B1000000-0000-4000-8000-00000000000B', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'04', N'B1000000-0000-4000-8000-00000000000C', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'01', N'B1000000-0000-4000-8000-00000000000D', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'02', N'B1000000-0000-4000-8000-00000000000E', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'03', N'B1000000-0000-4000-8000-00000000000F', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'04', N'B1000000-0000-4000-8000-000000000010', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'01', N'B1000000-0000-4000-8000-000000000011', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'02', N'B1000000-0000-4000-8000-000000000012', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'03', N'B1000000-0000-4000-8000-000000000013', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'04', N'B1000000-0000-4000-8000-000000000014', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'01', N'B1000000-0000-4000-8000-000000000015', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'02', N'B1000000-0000-4000-8000-000000000016', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'03', N'B1000000-0000-4000-8000-000000000017', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'04', N'B1000000-0000-4000-8000-000000000018', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'01', N'B1000000-0000-4000-8000-000000000019', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'02', N'B1000000-0000-4000-8000-00000000001A', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'03', N'B1000000-0000-4000-8000-00000000001B', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'04', N'B1000000-0000-4000-8000-00000000001C', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'01', N'B1000000-0000-4000-8000-00000000001D', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'02', N'B1000000-0000-4000-8000-00000000001E', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi OFF;
GO

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.campanias ON;
INSERT INTO promos.campanias (id_campania, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CAMPANIA_01', N'Kit Rutina La Roche-Posay #1', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CAMPANIA_02', N'Kit Rutina CeraVe Dermatological #2', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAMPANIA_03', N'Kit Rutina The Ordinary Deciem #3', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAMPANIA_04', N'Kit Rutina ISDIN Fotoprotección #4', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CAMPANIA_05', N'Kit Rutina Bioderma Laboratoire #5', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CAMPANIA_06', N'Kit Rutina Eau Thermale Avène #6', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CAMPANIA_07', N'Kit Rutina Eucerin Beiersdorf #7', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CAMPANIA_08', N'Kit Rutina Vichy Laboratoires #8', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAMPANIA_09', N'Kit Rutina SkinCeuticals Clinical #9', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CAMPANIA_10', N'Kit Rutina Sesderma Nanotech #10', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CAMPANIA_11', N'Kit Rutina NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CAMPANIA_12', N'Kit Rutina MAC Professional #12', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CAMPANIA_13', N'Kit Rutina Fenty Beauty #13', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CAMPANIA_14', N'Kit Rutina Rare Beauty #14', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CAMPANIA_15', N'Kit Rutina Clinique Laboratories #15', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CAMPANIA_16', N'Kit Rutina Estée Lauder #16', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CAMPANIA_17', N'Kit Rutina Lancôme Paris #17', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CAMPANIA_18', N'Kit Rutina Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CAMPANIA_19', N'Kit Rutina Paula''s Choice Skincare #19', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CAMPANIA_20', N'Kit Rutina COSRX K-Beauty #20', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CAMPANIA_21', N'Kit Rutina Laneige Amorepacific #21', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CAMPANIA_22', N'Kit Rutina Uriage Eau Thermale #22', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CAMPANIA_23', N'Kit Rutina Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CAMPANIA_24', N'Kit Rutina MartiDerm Ampollas #24', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CAMPANIA_25', N'Kit Rutina Heliocare Cantabria Labs #25', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CAMPANIA_26', N'Kit Rutina Kiehl''s Since 1851 #26', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CAMPANIA_27', N'Kit Rutina Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CAMPANIA_28', N'Kit Rutina L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CAMPANIA_29', N'Kit Rutina Neutrogena Derm #29', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CAMPANIA_30', N'Kit Rutina DermaCare Labs México #30', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.campanias OFF;
GO

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.cupones ON;
INSERT INTO promos.cupones (id_cupon, campania, codigo_cupon, tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CUPON_01', 1, 17.50, 17.50, 1, 1, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'CUPON_02', 2, 20.00, 20.00, 2, 2, 2, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'CUPON_03', 3, 22.50, 22.50, 3, 3, 3, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CUPON_04', 4, 25.00, 25.00, 4, 4, 4, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'CUPON_05', 5, 27.50, 27.50, 5, 5, 5, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'CUPON_06', 6, 30.00, 30.00, 6, 6, 6, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CUPON_07', 7, 32.50, 32.50, 7, 7, 7, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'CUPON_08', 8, 35.00, 35.00, 8, 8, 8, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'CUPON_09', 9, 37.50, 37.50, 9, 9, 9, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CUPON_10', 10, 40.00, 40.00, 10, 10, 10, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'CUPON_11', 11, 42.50, 42.50, 11, 11, 11, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'CUPON_12', 12, 45.00, 45.00, 12, 12, 12, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CUPON_13', 13, 47.50, 47.50, 13, 13, 13, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'CUPON_14', 14, 50.00, 50.00, 14, 14, 14, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'CUPON_15', 15, 52.50, 52.50, 15, 15, 15, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CUPON_16', 16, 55.00, 55.00, 16, 16, 16, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'CUPON_17', 17, 57.50, 57.50, 17, 17, 17, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'CUPON_18', 18, 60.00, 60.00, 18, 18, 18, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CUPON_19', 19, 62.50, 62.50, 19, 19, 19, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'CUPON_20', 20, 65.00, 65.00, 20, 20, 20, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'CUPON_21', 21, 67.50, 67.50, 21, 21, 21, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CUPON_22', 22, 70.00, 70.00, 22, 22, 22, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'CUPON_23', 23, 72.50, 72.50, 23, 23, 23, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'CUPON_24', 24, 75.00, 75.00, 24, 24, 24, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CUPON_25', 25, 77.50, 77.50, 25, 25, 25, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'CUPON_26', 26, 80.00, 80.00, 26, 26, 26, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'CUPON_27', 27, 82.50, 82.50, 27, 27, 27, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CUPON_28', 28, 85.00, 85.00, 28, 28, 28, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'CUPON_29', 29, 87.50, 87.50, 29, 29, 29, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'CUPON_30', 30, 90.00, 90.00, 30, 30, 30, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.cupones OFF;
GO

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon ON;
INSERT INTO promos.reglas_elegibilidad_cupon (id_regla_cupon, cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO promos.cupones_categorias_excluidas (id_cupon_exclusion, cupon, categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO promos.redenciones_cupones (id_redencion_cupon, cupon, cliente, orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 17.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 20.00, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 22.50, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 25.00, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 27.50, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 30.00, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 32.50, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 35.00, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 37.50, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 40.00, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 42.50, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 45.00, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 47.50, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 50.00, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 52.50, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 55.00, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 57.50, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 60.00, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62.50, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 67.50, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 70.00, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 72.50, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 75.00, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 77.50, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 80.00, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 82.50, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 85.00, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 87.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 90.00, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.redenciones_cupones OFF;
GO

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.ventas_flash_horarias ON;
INSERT INTO promos.ventas_flash_horarias (id_venta_flash, variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 17.50, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.ventas_flash_horarias OFF;
GO

PRINT '>>> SUBMÓDULO 2: Tablas 051 a 100 pobladas exitosamente.';
GO
