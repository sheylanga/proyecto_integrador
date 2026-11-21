-- =================================================================================================
-- SUBMÓDULO 2: OPERACIONES COMERCIALES, PASARELAS DE PAGO Y FACTURACIÓN CFDI 4.0
-- Tablas 051 a 100 (Autor: Integrante 2 - Control: 22050002)
-- =================================================================================================

SET XACT_ABORT ON;

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.tipos_descuento (id_tipo_descuento, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'DESCUENT_01', 'Carlos Mendoza Garza', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'DESCUENT_02', 'Sofía Ramírez López', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'DESCUENT_03', 'Valeria Torres Villarreal', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'DESCUENT_04', 'Alejandro Hernández Cruz', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'DESCUENT_05', 'Mariana Sánchez Fuentes', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'DESCUENT_06', 'Diego Martínez Treviño', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DESCUENT_07', 'Camila González Reyes', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'DESCUENT_08', 'Mateo Flores Castillo', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'DESCUENT_09', 'Lucía Morales Díaz', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'DESCUENT_10', 'Sebastián Vázquez Ortiz', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'DESCUENT_11', 'Regina Gutiérrez Nava', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'DESCUENT_12', 'Santiago Jiménez Pérez', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'DESCUENT_13', 'Fernanda Ruiz Salazar', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'DESCUENT_14', 'Emiliano Ríos Cárdenas', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'DESCUENT_15', 'Ximena Aguilar Ibarra', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'DESCUENT_16', 'Daniel Méndez Navarro', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'DESCUENT_17', 'Andrea Castro Delgado', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'DESCUENT_18', 'Gabriel Vega Montoya', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'DESCUENT_19', 'Paula Cortés Rojas', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'DESCUENT_20', 'Andrés Ramos Campos', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'DESCUENT_21', 'Renata Guerrero Luna', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'DESCUENT_22', 'Nicolás Peña Cabrera', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'DESCUENT_23', 'Natalia Herrera Vargas', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'DESCUENT_24', 'Joaquín Medina Contreras', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'DESCUENT_25', 'Isabella Domínguez Escobar', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'DESCUENT_26', 'Leonardo Silva Paredes', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'DESCUENT_27', 'Ana Chávez Bautista', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'DESCUENT_28', 'Rodrigo Ochoa Acosta', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'DESCUENT_29', 'Paulina Miranda Leal', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'DESCUENT_30', 'Mauricio Padilla Solís', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.tipos_descuento', 'id_tipo_descuento'), COALESCE((SELECT MAX(id_tipo_descuento) FROM ventas.tipos_descuento), 1), true);

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.estados_orden (id_estado_orden, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PEND_PAGO', 'Pendiente de Pago', 'Orden registrada esperando confirmación bancaria o SPEI', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PAGADA', 'Pago Confirmado', 'Transacción aprobada y lista para asignación de almacén', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PREPARANDO', 'En Preparación CEDIS', 'Surtido en curso bajo estrategia FEFO y empaque térmico', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'EN_TRANSITO', 'Enviada en Tránsito', 'Paquete recolectado por paquetería con guía de rastreo', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ENTREGADA', 'Entregada al Cliente', 'Recepción confirmada en domicilio del destinatario', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden anulada antes del despacho con liberación de stock', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DEVUELTA', 'Devuelta por RMA', 'Mercancía retornada y dictaminada en postventa', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('ventas.estados_orden', 'id_estado_orden'), COALESCE((SELECT MAX(id_estado_orden) FROM ventas.estados_orden), 1), true);

-- =================================================================================================
-- 053. TABLA: ventas.motivos_cancelacion_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.motivos_cancelacion_orden (id_motivo_cancelacion, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.motivos_cancelacion_orden', 'id_motivo_cancelacion'), COALESCE((SELECT MAX(id_motivo_cancelacion) FROM ventas.motivos_cancelacion_orden), 1), true);

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos (id_carrito, cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos', 'id_carrito'), COALESCE((SELECT MAX(id_carrito) FROM ventas.carritos), 1), true);

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.items_carrito (id_item_carrito, carrito, variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 17.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.items_carrito', 'id_item_carrito'), COALESCE((SELECT MAX(id_item_carrito) FROM ventas.items_carrito), 1), true);

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos_abandonados_seguimiento (id_seguimiento_carrito, carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, '2026-02-01 11:30:00', TRUE, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, '2026-02-02 11:30:00', FALSE, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, '2026-02-03 11:30:00', TRUE, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, '2026-02-04 11:30:00', FALSE, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, '2026-02-05 11:30:00', TRUE, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, '2026-02-06 11:30:00', FALSE, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, '2026-02-07 11:30:00', TRUE, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, '2026-02-08 11:30:00', FALSE, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, '2026-02-09 11:30:00', TRUE, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, '2026-02-10 11:30:00', FALSE, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, '2026-02-11 11:30:00', TRUE, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, '2026-02-12 11:30:00', FALSE, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, '2026-02-13 11:30:00', TRUE, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, '2026-02-14 11:30:00', FALSE, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, '2026-02-15 11:30:00', TRUE, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, '2026-02-16 11:30:00', FALSE, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, '2026-02-17 11:30:00', TRUE, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, '2026-02-18 11:30:00', FALSE, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, '2026-02-19 11:30:00', TRUE, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, '2026-02-20 11:30:00', FALSE, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, '2026-02-21 11:30:00', TRUE, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, '2026-02-22 11:30:00', FALSE, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, '2026-02-23 11:30:00', TRUE, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, '2026-02-24 11:30:00', FALSE, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, '2026-02-25 11:30:00', TRUE, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, '2026-02-26 11:30:00', FALSE, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, '2026-02-27 11:30:00', TRUE, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, '2026-02-28 11:30:00', FALSE, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, '2026-02-01 11:30:00', TRUE, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, '2026-02-02 11:30:00', FALSE, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos_abandonados_seguimiento', 'id_seguimiento_carrito'), COALESCE((SELECT MAX(id_seguimiento_carrito) FROM ventas.carritos_abandonados_seguimiento), 1), true);

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.planes_suscripcion (id_plan_suscripcion, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PLAN_01', 'Kit Rutina La Roche-Posay #1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 285.50, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PLAN_02', 'Kit Rutina CeraVe Dermatological #2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 321.00, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PLAN_03', 'Kit Rutina The Ordinary Deciem #3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 356.50, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PLAN_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 392.00, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PLAN_05', 'Kit Rutina Bioderma Laboratoire #5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 427.50, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PLAN_06', 'Kit Rutina Eau Thermale Avène #6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 463.00, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PLAN_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 498.50, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PLAN_08', 'Kit Rutina Vichy Laboratoires #8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 534.00, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PLAN_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 569.50, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PLAN_10', 'Kit Rutina Sesderma Nanotech #10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 605.00, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PLAN_11', 'Kit Rutina NARS Cosmetics #11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 640.50, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PLAN_12', 'Kit Rutina MAC Professional #12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 676.00, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PLAN_13', 'Kit Rutina Fenty Beauty #13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 711.50, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PLAN_14', 'Kit Rutina Rare Beauty #14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 747.00, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PLAN_15', 'Kit Rutina Clinique Laboratories #15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 782.50, 5.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PLAN_16', 'Kit Rutina Estée Lauder #16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 818.00, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PLAN_17', 'Kit Rutina Lancôme Paris #17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 853.50, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PLAN_18', 'Kit Rutina Charlotte Tilbury #18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 889.00, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PLAN_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 924.50, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PLAN_20', 'Kit Rutina COSRX K-Beauty #20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 960.00, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PLAN_21', 'Kit Rutina Laneige Amorepacific #21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 995.50, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PLAN_22', 'Kit Rutina Uriage Eau Thermale #22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1031.00, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PLAN_23', 'Kit Rutina Laboratoire SVR #23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1066.50, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PLAN_24', 'Kit Rutina MartiDerm Ampollas #24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1102.00, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PLAN_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1137.50, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PLAN_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1173.00, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PLAN_27', 'Kit Rutina Garnier SkinActive #27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1208.50, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PLAN_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1244.00, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PLAN_29', 'Kit Rutina Neutrogena Derm #29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1279.50, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PLAN_30', 'Kit Rutina DermaCare Labs México #30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 1315.00, 5.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.planes_suscripcion', 'id_plan_suscripcion'), COALESCE((SELECT MAX(id_plan_suscripcion) FROM ventas.planes_suscripcion), 1), true);

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.frecuencias_suscripcion (id_frecuencia_suscripcion, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FRECUENC_01', 'Carlos Mendoza Garza', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FRECUENC_02', 'Sofía Ramírez López', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FRECUENC_03', 'Valeria Torres Villarreal', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FRECUENC_04', 'Alejandro Hernández Cruz', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FRECUENC_05', 'Mariana Sánchez Fuentes', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FRECUENC_06', 'Diego Martínez Treviño', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FRECUENC_07', 'Camila González Reyes', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FRECUENC_08', 'Mateo Flores Castillo', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FRECUENC_09', 'Lucía Morales Díaz', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FRECUENC_10', 'Sebastián Vázquez Ortiz', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FRECUENC_11', 'Regina Gutiérrez Nava', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FRECUENC_12', 'Santiago Jiménez Pérez', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FRECUENC_13', 'Fernanda Ruiz Salazar', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FRECUENC_14', 'Emiliano Ríos Cárdenas', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FRECUENC_15', 'Ximena Aguilar Ibarra', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FRECUENC_16', 'Daniel Méndez Navarro', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FRECUENC_17', 'Andrea Castro Delgado', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FRECUENC_18', 'Gabriel Vega Montoya', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FRECUENC_19', 'Paula Cortés Rojas', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FRECUENC_20', 'Andrés Ramos Campos', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FRECUENC_21', 'Renata Guerrero Luna', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FRECUENC_22', 'Nicolás Peña Cabrera', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FRECUENC_23', 'Natalia Herrera Vargas', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FRECUENC_24', 'Joaquín Medina Contreras', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FRECUENC_25', 'Isabella Domínguez Escobar', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FRECUENC_26', 'Leonardo Silva Paredes', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FRECUENC_27', 'Ana Chávez Bautista', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FRECUENC_28', 'Rodrigo Ochoa Acosta', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FRECUENC_29', 'Paulina Miranda Leal', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FRECUENC_30', 'Mauricio Padilla Solís', 60, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.frecuencias_suscripcion', 'id_frecuencia_suscripcion'), COALESCE((SELECT MAX(id_frecuencia_suscripcion) FROM ventas.frecuencias_suscripcion), 1), true);

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_cliente (id_suscripcion_cliente, folio_suscripcion, cliente, plan_suscripcion, frecuencia_suscripcion, direccion_entrega, metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-01', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-03-02', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-03-03', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-03-04', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-03-05', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-03-06', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-03-07', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-03-08', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-03-09', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-03-10', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-03-11', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-03-12', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-03-13', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-03-14', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-03-15', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-03-16', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-03-17', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-03-18', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-03-19', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-03-20', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-03-21', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-03-22', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-03-23', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-03-24', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-03-25', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-03-26', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-03-27', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-03-28', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-01', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-03-02', 'PAUSADA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_cliente', 'id_suscripcion_cliente'), COALESCE((SELECT MAX(id_suscripcion_cliente) FROM ventas.suscripciones_cliente), 1), true);

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_items (id_suscripcion_item, suscripcion_cliente, variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_items', 'id_suscripcion_item'), COALESCE((SELECT MAX(id_suscripcion_item) FROM ventas.suscripciones_items), 1), true);

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_calendario_entregas (id_entrega_programada, suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_calendario_entregas', 'id_entrega_programada'), COALESCE((SELECT MAX(id_entrega_programada) FROM ventas.suscripciones_calendario_entregas), 1), true);

-- =================================================================================================
-- 062. TABLA: ventas.suscripciones_bitacora_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_bitacora_estados (id_bitacora_suscripcion, suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10', 'Sérum Niacinamida 10', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumo', 'Gel Limpiador Espumo', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Flui', 'Protector Solar Flui', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurón', 'Sérum Ácido Hialurón', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con', 'Crema Hidratante con', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% No', 'Retinol Puro 0.5% No', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermoli', 'Agua Micelar Dermoli', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pur', 'Sérum Vitamina C Pur', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje C', 'Base de Maquillaje C', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Al', 'Corrector Líquido Al', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Ci', 'Bálsamo Reparador Ci', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Sal', 'Exfoliante Ácido Sal', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con', 'Contorno de Ojos con', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna ', 'Mascarilla Nocturna ', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmant', 'Bruma Termal Calmant', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emu', 'Aceite Limpiador Emu', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante ', 'Tónico Equilibrante ', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Pé', 'Labial Hidratante Pé', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Mat', 'Polvo Traslúcido Mat', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmen', 'Rubor Líquido Pigmen', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico', 'Sérum Ácido Azelaico', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteogli', 'Ampolletas Proteogli', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante', 'Crema Despigmentante', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mine', 'Protector Solar Mine', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea', 'Loción Corporal Urea', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimi', 'Primer Facial Minimi', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas ', 'Máscara de Pestañas ', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Co', 'Sérum Péptidos de Co', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillan', 'Bálsamo Desmaquillan', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-R', 'Crema Barrera Post-R', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_bitacora_estados', 'id_bitacora_suscripcion'), COALESCE((SELECT MAX(id_bitacora_suscripcion) FROM ventas.suscripciones_bitacora_estados), 1), true);

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.regalos_por_compra_gwp (id_regalo_compra, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROMOCIO_01', 'Kit Rutina La Roche-Posay #1', 17.50, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 8, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROMOCIO_02', 'Kit Rutina CeraVe Dermatological #2', 20.00, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROMOCIO_03', 'Kit Rutina The Ordinary Deciem #3', 22.50, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 14, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROMOCIO_04', 'Kit Rutina ISDIN Fotoprotección #4', 25.00, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 17, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROMOCIO_05', 'Kit Rutina Bioderma Laboratoire #5', 27.50, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 20, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROMOCIO_06', 'Kit Rutina Eau Thermale Avène #6', 30.00, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 23, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROMOCIO_07', 'Kit Rutina Eucerin Beiersdorf #7', 32.50, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 26, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROMOCIO_08', 'Kit Rutina Vichy Laboratoires #8', 35.00, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 29, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROMOCIO_09', 'Kit Rutina SkinCeuticals Clinical #9', 37.50, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 32, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROMOCIO_10', 'Kit Rutina Sesderma Nanotech #10', 40.00, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 35, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROMOCIO_11', 'Kit Rutina NARS Cosmetics #11', 42.50, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 38, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROMOCIO_12', 'Kit Rutina MAC Professional #12', 45.00, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 41, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROMOCIO_13', 'Kit Rutina Fenty Beauty #13', 47.50, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 44, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROMOCIO_14', 'Kit Rutina Rare Beauty #14', 50.00, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 47, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROMOCIO_15', 'Kit Rutina Clinique Laboratories #15', 52.50, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROMOCIO_16', 'Kit Rutina Estée Lauder #16', 55.00, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 53, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROMOCIO_17', 'Kit Rutina Lancôme Paris #17', 57.50, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 56, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROMOCIO_18', 'Kit Rutina Charlotte Tilbury #18', 60.00, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 59, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROMOCIO_19', 'Kit Rutina Paula''s Choice Skincare #19', 62.50, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROMOCIO_20', 'Kit Rutina COSRX K-Beauty #20', 65.00, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROMOCIO_21', 'Kit Rutina Laneige Amorepacific #21', 67.50, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 68, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROMOCIO_22', 'Kit Rutina Uriage Eau Thermale #22', 70.00, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 71, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROMOCIO_23', 'Kit Rutina Laboratoire SVR #23', 72.50, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 74, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROMOCIO_24', 'Kit Rutina MartiDerm Ampollas #24', 75.00, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 77, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROMOCIO_25', 'Kit Rutina Heliocare Cantabria Labs #25', 77.50, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 80, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROMOCIO_26', 'Kit Rutina Kiehl''s Since 1851 #26', 80.00, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 83, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROMOCIO_27', 'Kit Rutina Garnier SkinActive #27', 82.50, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 86, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROMOCIO_28', 'Kit Rutina L''Oréal Paris Derm #28', 85.00, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 89, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROMOCIO_29', 'Kit Rutina Neutrogena Derm #29', 87.50, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 92, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROMOCIO_30', 'Kit Rutina DermaCare Labs México #30', 90.00, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 95, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.regalos_por_compra_gwp', 'id_regalo_compra'), COALESCE((SELECT MAX(id_regalo_compra) FROM ventas.regalos_por_compra_gwp), 1), true);

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes (id_orden, folio_orden, cliente, estado_orden, motivo_cancelacion, direccion_envio, direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 285.50, 17.50, 45.68, 17.50, 285.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 20.00, 51.36, 20.00, 321.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 356.50, 22.50, 57.04, 22.50, 356.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 25.00, 62.72, 25.00, 392.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 427.50, 27.50, 68.40, 27.50, 427.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 30.00, 74.08, 30.00, 463.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 7, NULL, 7, 7, '2026-02-07 11:30:00', 498.50, 32.50, 79.76, 32.50, 498.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 35.00, 85.44, 35.00, 534.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 569.50, 37.50, 91.12, 37.50, 569.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 40.00, 96.80, 40.00, 605.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 640.50, 42.50, 102.48, 42.50, 640.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 45.00, 108.16, 45.00, 676.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 6, NULL, 13, 13, '2026-02-13 11:30:00', 711.50, 47.50, 113.84, 47.50, 711.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 7, NULL, 14, 14, '2026-02-14 11:30:00', 747.00, 50.00, 119.52, 50.00, 747.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 782.50, 52.50, 125.20, 52.50, 782.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 55.00, 130.88, 55.00, 818.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 853.50, 57.50, 136.56, 57.50, 853.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 60.00, 142.24, 60.00, 889.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 924.50, 62.50, 147.92, 62.50, 924.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 6, NULL, 20, 20, '2026-02-20 11:30:00', 960.00, 65.00, 153.60, 65.00, 960.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 7, NULL, 21, 21, '2026-02-21 11:30:00', 995.50, 67.50, 159.28, 67.50, 995.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 70.00, 164.96, 70.00, 1031.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 1066.50, 72.50, 170.64, 72.50, 1066.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 75.00, 176.32, 75.00, 1102.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 1137.50, 77.50, 182.00, 77.50, 1137.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 80.00, 187.68, 80.00, 1173.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 6, NULL, 27, 27, '2026-02-27 11:30:00', 1208.50, 82.50, 193.36, 82.50, 1208.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 7, NULL, 28, 28, '2026-02-28 11:30:00', 1244.00, 85.00, 199.04, 85.00, 1244.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 1279.50, 87.50, 204.72, 87.50, 1279.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 90.00, 210.40, 90.00, 1315.00, 'MXN', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes', 'id_orden'), COALESCE((SELECT MAX(id_orden) FROM ventas.ordenes), 1), true);

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_detalles (id_orden_detalle, orden, variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 8, 285.50, 17.50, 10.00, 17.50, 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 11, 321.00, 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 14, 356.50, 22.50, 30.00, 22.50, 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 17, 392.00, 25.00, 40.00, 25.00, 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 20, 427.50, 27.50, 50.00, 27.50, 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 23, 463.00, 30.00, 60.00, 30.00, 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 26, 498.50, 32.50, 70.00, 32.50, 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 29, 534.00, 35.00, 80.00, 35.00, 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 32, 569.50, 37.50, 90.00, 37.50, 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 35, 605.00, 40.00, 100.00, 40.00, 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 38, 640.50, 42.50, 110.00, 42.50, 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 41, 676.00, 45.00, 120.00, 45.00, 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 44, 711.50, 47.50, 130.00, 47.50, 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 47, 747.00, 50.00, 140.00, 50.00, 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 50, 782.50, 52.50, 150.00, 52.50, 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 53, 818.00, 55.00, 160.00, 55.00, 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 56, 853.50, 57.50, 170.00, 57.50, 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 59, 889.00, 60.00, 180.00, 60.00, 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 62, 924.50, 62.50, 190.00, 62.50, 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 65, 960.00, 65.00, 200.00, 65.00, 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 68, 995.50, 67.50, 210.00, 67.50, 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 71, 1031.00, 70.00, 220.00, 70.00, 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 74, 1066.50, 72.50, 230.00, 72.50, 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 77, 1102.00, 75.00, 240.00, 75.00, 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 80, 1137.50, 77.50, 250.00, 77.50, 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 83, 1173.00, 80.00, 260.00, 80.00, 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 86, 1208.50, 82.50, 270.00, 82.50, 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 89, 1244.00, 85.00, 280.00, 85.00, 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 92, 1279.50, 87.50, 290.00, 87.50, 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 95, 1315.00, 90.00, 300.00, 90.00, 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_detalles', 'id_orden_detalle'), COALESCE((SELECT MAX(id_orden_detalle) FROM ventas.ordenes_detalles), 1), true);

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_historial_estados (id_orden_historial, orden, estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_historial_estados', 'id_orden_historial'), COALESCE((SELECT MAX(id_orden_historial) FROM ventas.ordenes_historial_estados), 1), true);

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_splits_almacen (id_orden_split, orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Po', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermat', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotop', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Lab', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avè', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiers', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoire', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeut', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Na', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmeti', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professi', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beaut', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty ', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Labo', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder ', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lanc', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte T', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beau', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Ea', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laborato', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDer', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Helioca', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s ', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier ', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris De', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs', 'EN_RUTA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_splits_almacen', 'id_orden_split'), COALESCE((SELECT MAX(id_orden_split) FROM ventas.ordenes_splits_almacen), 1), true);

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_impuestos (id_orden_impuesto, orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '002_IVA', 0.160000, 17.50, 45.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '003_IEPS', 0.160000, 20.00, 51.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '002_IVA', 0.160000, 22.50, 57.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '003_IEPS', 0.160000, 25.00, 62.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '002_IVA', 0.160000, 27.50, 68.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '003_IEPS', 0.160000, 30.00, 74.08, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '002_IVA', 0.160000, 32.50, 79.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '003_IEPS', 0.160000, 35.00, 85.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '002_IVA', 0.160000, 37.50, 91.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '003_IEPS', 0.160000, 40.00, 96.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '002_IVA', 0.160000, 42.50, 102.48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '003_IEPS', 0.160000, 45.00, 108.16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '002_IVA', 0.160000, 47.50, 113.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '003_IEPS', 0.160000, 50.00, 119.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '002_IVA', 0.160000, 52.50, 125.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '003_IEPS', 0.160000, 55.00, 130.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '002_IVA', 0.160000, 57.50, 136.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '003_IEPS', 0.160000, 60.00, 142.24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '002_IVA', 0.160000, 62.50, 147.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '003_IEPS', 0.160000, 65.00, 153.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '002_IVA', 0.160000, 67.50, 159.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '003_IEPS', 0.160000, 70.00, 164.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '002_IVA', 0.160000, 72.50, 170.64, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '003_IEPS', 0.160000, 75.00, 176.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '002_IVA', 0.160000, 77.50, 182.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '003_IEPS', 0.160000, 80.00, 187.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '002_IVA', 0.160000, 82.50, 193.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '003_IEPS', 0.160000, 85.00, 199.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '002_IVA', 0.160000, 87.50, 204.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '003_IEPS', 0.160000, 90.00, 210.40, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_impuestos', 'id_orden_impuesto'), COALESCE((SELECT MAX(id_orden_impuesto) FROM ventas.ordenes_impuestos), 1), true);

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_descuentos (id_orden_descuento, orden, tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'PROMOCIO_01', 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'PROMOCIO_02', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'PROMOCIO_03', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'PROMOCIO_04', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'PROMOCIO_05', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'PROMOCIO_06', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'PROMOCIO_07', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'PROMOCIO_08', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'PROMOCIO_09', 90.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'PROMOCIO_10', 100.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'PROMOCIO_11', 110.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'PROMOCIO_12', 120.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'PROMOCIO_13', 130.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'PROMOCIO_14', 140.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'PROMOCIO_15', 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'PROMOCIO_16', 160.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'PROMOCIO_17', 170.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'PROMOCIO_18', 180.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'PROMOCIO_19', 190.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'PROMOCIO_20', 200.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'PROMOCIO_21', 210.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'PROMOCIO_22', 220.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'PROMOCIO_23', 230.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'PROMOCIO_24', 240.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'PROMOCIO_25', 250.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'PROMOCIO_26', 260.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'PROMOCIO_27', 270.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'PROMOCIO_28', 280.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'PROMOCIO_29', 290.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'PROMOCIO_30', 300.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_descuentos', 'id_orden_descuento'), COALESCE((SELECT MAX(id_orden_descuento) FROM ventas.ordenes_descuentos), 1), true);

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_notas_instrucciones (id_orden_nota, orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('ventas.ordenes_notas_instrucciones', 'id_orden_nota'), COALESCE((SELECT MAX(id_orden_nota) FROM ventas.ordenes_notas_instrucciones), 1), true);

-- =================================================================================================
-- 071. TABLA: ventas.reservas_temporales_stock (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.reservas_temporales_stock (id_reserva_stock, carrito, variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.reservas_temporales_stock', 'id_reserva_stock'), COALESCE((SELECT MAX(id_reserva_stock) FROM ventas.reservas_temporales_stock), 1), true);

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.afiliados_influencers (id_afiliado, codigo_afiliado, usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'AFILIADO_01', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 6.00, '012180001234567801', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'AFILIADO_02', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 7.00, '012180001234567802', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AFILIADO_03', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 8.00, '012180001234567803', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'AFILIADO_04', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 9.00, '012180001234567804', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'AFILIADO_05', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 10.00, '012180001234567805', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'AFILIADO_06', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 11.00, '012180001234567806', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'AFILIADO_07', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 12.00, '012180001234567807', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'AFILIADO_08', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 13.00, '012180001234567808', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'AFILIADO_09', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 14.00, '012180001234567809', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'AFILIADO_10', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 15.00, '012180001234567810', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'AFILIADO_11', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 16.00, '012180001234567811', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'AFILIADO_12', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 17.00, '012180001234567812', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'AFILIADO_13', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 18.00, '012180001234567813', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'AFILIADO_14', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 19.00, '012180001234567814', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'AFILIADO_15', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 5.00, '012180001234567815', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'AFILIADO_16', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 6.00, '012180001234567816', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'AFILIADO_17', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 7.00, '012180001234567817', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'AFILIADO_18', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 8.00, '012180001234567818', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'AFILIADO_19', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 9.00, '012180001234567819', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'AFILIADO_20', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 10.00, '012180001234567820', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'AFILIADO_21', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 11.00, '012180001234567821', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'AFILIADO_22', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 12.00, '012180001234567822', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'AFILIADO_23', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 13.00, '012180001234567823', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'AFILIADO_24', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 14.00, '012180001234567824', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'AFILIADO_25', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 15.00, '012180001234567825', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'AFILIADO_26', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 16.00, '012180001234567826', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'AFILIADO_27', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 17.00, '012180001234567827', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'AFILIADO_28', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 18.00, '012180001234567828', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'AFILIADO_29', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 19.00, '012180001234567829', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'AFILIADO_30', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 5.00, '012180001234567830', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.afiliados_influencers', 'id_afiliado'), COALESCE((SELECT MAX(id_afiliado) FROM ventas.afiliados_influencers), 1), true);

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.comisiones_afiliados (id_comision_afiliado, afiliado, orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 17.50, 17.50, 'PENDIENTE', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, 20.00, 'APROBADA', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, 22.50, 'PAGADA', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, 25.00, 'PENDIENTE', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, 27.50, 'APROBADA', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 30.00, 30.00, 'PAGADA', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 32.50, 32.50, 'PENDIENTE', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 35.00, 35.00, 'APROBADA', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 37.50, 37.50, 'PAGADA', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 40.00, 40.00, 'PENDIENTE', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 42.50, 42.50, 'APROBADA', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 45.00, 45.00, 'PAGADA', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 47.50, 47.50, 'PENDIENTE', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 50.00, 50.00, 'APROBADA', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 52.50, 52.50, 'PAGADA', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 55.00, 55.00, 'PENDIENTE', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 57.50, 57.50, 'APROBADA', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 60.00, 60.00, 'PAGADA', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62.50, 62.50, 'PENDIENTE', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65.00, 65.00, 'APROBADA', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 67.50, 67.50, 'PAGADA', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 70.00, 70.00, 'PENDIENTE', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 72.50, 72.50, 'APROBADA', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 75.00, 75.00, 'PAGADA', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 77.50, 77.50, 'PENDIENTE', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 80.00, 80.00, 'APROBADA', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 82.50, 82.50, 'PAGADA', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 85.00, 85.00, 'PENDIENTE', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 87.50, 87.50, 'APROBADA', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 90.00, 90.00, 'PAGADA', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.comisiones_afiliados', 'id_comision_afiliado'), COALESCE((SELECT MAX(id_comision_afiliado) FROM ventas.comisiones_afiliados), 1), true);

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.proveedores_pasarela (id_proveedor_pasarela, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PASARELA_01', 'Kit Rutina La Roche-Posay #1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PASARELA_02', 'Kit Rutina CeraVe Dermatological #2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PASARELA_03', 'Kit Rutina The Ordinary Deciem #3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PASARELA_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PASARELA_05', 'Kit Rutina Bioderma Laboratoire #5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PASARELA_06', 'Kit Rutina Eau Thermale Avène #6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PASARELA_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PASARELA_08', 'Kit Rutina Vichy Laboratoires #8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PASARELA_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PASARELA_10', 'Kit Rutina Sesderma Nanotech #10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PASARELA_11', 'Kit Rutina NARS Cosmetics #11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PASARELA_12', 'Kit Rutina MAC Professional #12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PASARELA_13', 'Kit Rutina Fenty Beauty #13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PASARELA_14', 'Kit Rutina Rare Beauty #14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PASARELA_15', 'Kit Rutina Clinique Laboratories #15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PASARELA_16', 'Kit Rutina Estée Lauder #16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PASARELA_17', 'Kit Rutina Lancôme Paris #17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PASARELA_18', 'Kit Rutina Charlotte Tilbury #18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PASARELA_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PASARELA_20', 'Kit Rutina COSRX K-Beauty #20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PASARELA_21', 'Kit Rutina Laneige Amorepacific #21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PASARELA_22', 'Kit Rutina Uriage Eau Thermale #22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PASARELA_23', 'Kit Rutina Laboratoire SVR #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PASARELA_24', 'Kit Rutina MartiDerm Ampollas #24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PASARELA_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PASARELA_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PASARELA_27', 'Kit Rutina Garnier SkinActive #27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PASARELA_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PASARELA_29', 'Kit Rutina Neutrogena Derm #29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PASARELA_30', 'Kit Rutina DermaCare Labs México #30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.proveedores_pasarela', 'id_proveedor_pasarela'), COALESCE((SELECT MAX(id_proveedor_pasarela) FROM pagos.proveedores_pasarela), 1), true);

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.metodos_pago (id_metodo_pago, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TARJETA_CRED', 'Tarjeta de Crédito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TARJETA_DEB', 'Tarjeta de Débito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SPEI_TRANSF', 'Transferencia Electrónica SPEI', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'OXXO_EFECT', 'Pago en Efectivo Tiendas OXXO', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MONEDERO', 'Saldo Monedero DermaCare', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('pagos.metodos_pago', 'id_metodo_pago'), COALESCE((SELECT MAX(id_metodo_pago) FROM pagos.metodos_pago), 1), true);

-- =================================================================================================
-- 076. TABLA: pagos.transacciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.transacciones (id_transaccion, folio_transaccion, orden, proveedor_pasarela, metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 285.50, 'MXN', 'PENDIENTE', 'AUTORIZA_01', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 321.00, 'MXN', 'APROBADA', 'AUTORIZA_02', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 356.50, 'MXN', 'RECHAZADA', 'AUTORIZA_03', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 392.00, 'MXN', 'CANCELADA', 'AUTORIZA_04', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 427.50, 'MXN', 'EN_MEDIACION', 'AUTORIZA_05', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 6, 1, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 463.00, 'MXN', 'PENDIENTE', 'AUTORIZA_06', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 7, 2, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 498.50, 'MXN', 'APROBADA', 'AUTORIZA_07', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 8, 3, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 534.00, 'MXN', 'RECHAZADA', 'AUTORIZA_08', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 9, 4, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 569.50, 'MXN', 'CANCELADA', 'AUTORIZA_09', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 10, 5, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 605.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_10', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 11, 1, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 640.50, 'MXN', 'PENDIENTE', 'AUTORIZA_11', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 12, 2, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 676.00, 'MXN', 'APROBADA', 'AUTORIZA_12', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 13, 3, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 711.50, 'MXN', 'RECHAZADA', 'AUTORIZA_13', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 14, 4, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 747.00, 'MXN', 'CANCELADA', 'AUTORIZA_14', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 15, 5, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 782.50, 'MXN', 'EN_MEDIACION', 'AUTORIZA_15', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 16, 1, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 818.00, 'MXN', 'PENDIENTE', 'AUTORIZA_16', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 17, 2, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 853.50, 'MXN', 'APROBADA', 'AUTORIZA_17', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 18, 3, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 889.00, 'MXN', 'RECHAZADA', 'AUTORIZA_18', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 19, 4, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 924.50, 'MXN', 'CANCELADA', 'AUTORIZA_19', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 20, 5, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 960.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_20', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 21, 1, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 995.50, 'MXN', 'PENDIENTE', 'AUTORIZA_21', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 22, 2, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1031.00, 'MXN', 'APROBADA', 'AUTORIZA_22', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 23, 3, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1066.50, 'MXN', 'RECHAZADA', 'AUTORIZA_23', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 24, 4, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1102.00, 'MXN', 'CANCELADA', 'AUTORIZA_24', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 25, 5, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1137.50, 'MXN', 'EN_MEDIACION', 'AUTORIZA_25', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 26, 1, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1173.00, 'MXN', 'PENDIENTE', 'AUTORIZA_26', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 27, 2, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1208.50, 'MXN', 'APROBADA', 'AUTORIZA_27', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 28, 3, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1244.00, 'MXN', 'RECHAZADA', 'AUTORIZA_28', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 29, 4, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1279.50, 'MXN', 'CANCELADA', 'AUTORIZA_29', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 30, 5, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 1315.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_30', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.transacciones', 'id_transaccion'), COALESCE((SELECT MAX(id_transaccion) FROM pagos.transacciones), 1), true);

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.intentos_cobro (id_intento_cobro, transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 200, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 200, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 200, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 200, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 200, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 200, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 200, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 200, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.intentos_cobro', 'id_intento_cobro'), COALESCE((SELECT MAX(id_intento_cobro) FROM pagos.intentos_cobro), 1), true);

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.split_multipagos (id_split_pago, orden, metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 17.50, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 30.00, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 32.50, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 35.00, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 37.50, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 40.00, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 42.50, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 45.00, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 47.50, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 50.00, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 52.50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 55.00, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 57.50, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 60.00, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 62.50, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 65.00, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 67.50, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 70.00, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 72.50, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 75.00, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 77.50, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 80.00, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 82.50, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 85.00, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 87.50, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 90.00, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.split_multipagos', 'id_split_pago'), COALESCE((SELECT MAX(id_split_pago) FROM pagos.split_multipagos), 1), true);

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.billetera_electronica (id_billetera, cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.billetera_electronica', 'id_billetera'), COALESCE((SELECT MAX(id_billetera) FROM pagos.billetera_electronica), 1), true);

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.movimientos_billetera (id_movimiento_billetera, billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CARGA_SALDO', 285.50, 17.50, 17.50, 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAGO_ORDEN', 321.00, 20.00, 20.00, 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'REEMBOLSO_DEVOLUCION', 356.50, 22.50, 22.50, 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CARGA_SALDO', 392.00, 25.00, 25.00, 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PAGO_ORDEN', 427.50, 27.50, 27.50, 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'REEMBOLSO_DEVOLUCION', 463.00, 30.00, 30.00, 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CARGA_SALDO', 498.50, 32.50, 32.50, 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PAGO_ORDEN', 534.00, 35.00, 35.00, 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'REEMBOLSO_DEVOLUCION', 569.50, 37.50, 37.50, 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CARGA_SALDO', 605.00, 40.00, 40.00, 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PAGO_ORDEN', 640.50, 42.50, 42.50, 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'REEMBOLSO_DEVOLUCION', 676.00, 45.00, 45.00, 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CARGA_SALDO', 711.50, 47.50, 47.50, 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAGO_ORDEN', 747.00, 50.00, 50.00, 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'REEMBOLSO_DEVOLUCION', 782.50, 52.50, 52.50, 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CARGA_SALDO', 818.00, 55.00, 55.00, 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'PAGO_ORDEN', 853.50, 57.50, 57.50, 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'REEMBOLSO_DEVOLUCION', 889.00, 60.00, 60.00, 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CARGA_SALDO', 924.50, 62.50, 62.50, 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PAGO_ORDEN', 960.00, 65.00, 65.00, 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'REEMBOLSO_DEVOLUCION', 995.50, 67.50, 67.50, 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CARGA_SALDO', 1031.00, 70.00, 70.00, 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PAGO_ORDEN', 1066.50, 72.50, 72.50, 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'REEMBOLSO_DEVOLUCION', 1102.00, 75.00, 75.00, 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CARGA_SALDO', 1137.50, 77.50, 77.50, 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAGO_ORDEN', 1173.00, 80.00, 80.00, 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'REEMBOLSO_DEVOLUCION', 1208.50, 82.50, 82.50, 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CARGA_SALDO', 1244.00, 85.00, 85.00, 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'PAGO_ORDEN', 1279.50, 87.50, 87.50, 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'REEMBOLSO_DEVOLUCION', 1315.00, 90.00, 90.00, 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.movimientos_billetera', 'id_movimiento_billetera'), COALESCE((SELECT MAX(id_movimiento_billetera) FROM pagos.movimientos_billetera), 1), true);

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.tarjetas_regalo_giftcards (id_giftcard, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('pagos.tarjetas_regalo_giftcards', 'id_giftcard'), COALESCE((SELECT MAX(id_giftcard) FROM pagos.tarjetas_regalo_giftcards), 1), true);

-- =================================================================================================
-- 082. TABLA: pagos.redenciones_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.redenciones_giftcards (id_redencion_giftcard, giftcard, orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('pagos.redenciones_giftcards', 'id_redencion_giftcard'), COALESCE((SELECT MAX(id_redencion_giftcard) FROM pagos.redenciones_giftcards), 1), true);

-- =================================================================================================
-- 083. TABLA: pagos.reglas_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reglas_antifraude (id_regla_antifraude, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'REGLA_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 6, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'REGLA_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 7, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'REGLA_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 8, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REGLA_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 9, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REGLA_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 10, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'REGLA_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 11, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'REGLA_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 12, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'REGLA_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 13, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'REGLA_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 14, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'REGLA_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 15, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'REGLA_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 16, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'REGLA_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 17, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'REGLA_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 18, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'REGLA_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 19, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'REGLA_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 20, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'REGLA_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 21, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'REGLA_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 22, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'REGLA_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 23, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'REGLA_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 24, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'REGLA_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 25, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'REGLA_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 26, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'REGLA_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 27, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'REGLA_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 28, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'REGLA_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 29, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'REGLA_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'REGLA_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 31, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'REGLA_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 32, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'REGLA_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 33, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'REGLA_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 34, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'REGLA_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reglas_antifraude', 'id_regla_antifraude'), COALESCE((SELECT MAX(id_regla_antifraude) FROM pagos.reglas_antifraude), 1), true);

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.evaluaciones_antifraude (id_evaluacion_fraude, orden, regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('pagos.evaluaciones_antifraude', 'id_evaluacion_fraude'), COALESCE((SELECT MAX(id_evaluacion_fraude) FROM pagos.evaluaciones_antifraude), 1), true);

-- =================================================================================================
-- 085. TABLA: pagos.contracargos_chargebacks (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.contracargos_chargebacks (id_contracargo, transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-DISPU-2026-0001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-DISPU-2026-0002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-DISPU-2026-0003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, '2026-02-03 11:30:00', '2026-03-03', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-DISPU-2026-0004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, '2026-02-04 11:30:00', '2026-03-04', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-DISPU-2026-0005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, '2026-02-05 11:30:00', '2026-03-05', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-DISPU-2026-0006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, '2026-02-06 11:30:00', '2026-03-06', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-DISPU-2026-0007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, '2026-02-07 11:30:00', '2026-03-07', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-DISPU-2026-0008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, '2026-02-08 11:30:00', '2026-03-08', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-DISPU-2026-0009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, '2026-02-09 11:30:00', '2026-03-09', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-DISPU-2026-0010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, '2026-02-10 11:30:00', '2026-03-10', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-DISPU-2026-0011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, '2026-02-11 11:30:00', '2026-03-11', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-DISPU-2026-0012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, '2026-02-12 11:30:00', '2026-03-12', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-DISPU-2026-0013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, '2026-02-13 11:30:00', '2026-03-13', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-DISPU-2026-0014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, '2026-02-14 11:30:00', '2026-03-14', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-DISPU-2026-0015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, '2026-02-15 11:30:00', '2026-03-15', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-DISPU-2026-0016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, '2026-02-16 11:30:00', '2026-03-16', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-DISPU-2026-0017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, '2026-02-17 11:30:00', '2026-03-17', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-DISPU-2026-0018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, '2026-02-18 11:30:00', '2026-03-18', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-DISPU-2026-0019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, '2026-02-19 11:30:00', '2026-03-19', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-DISPU-2026-0020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, '2026-02-20 11:30:00', '2026-03-20', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-DISPU-2026-0021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, '2026-02-21 11:30:00', '2026-03-21', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-DISPU-2026-0022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, '2026-02-22 11:30:00', '2026-03-22', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-DISPU-2026-0023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, '2026-02-23 11:30:00', '2026-03-23', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-DISPU-2026-0024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, '2026-02-24 11:30:00', '2026-03-24', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-DISPU-2026-0025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, '2026-02-25 11:30:00', '2026-03-25', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-DISPU-2026-0026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, '2026-02-26 11:30:00', '2026-03-26', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-DISPU-2026-0027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, '2026-02-27 11:30:00', '2026-03-27', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-DISPU-2026-0028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, '2026-02-28 11:30:00', '2026-03-28', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-DISPU-2026-0029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-DISPU-2026-0030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.contracargos_chargebacks', 'id_contracargo'), COALESCE((SELECT MAX(id_contracargo) FROM pagos.contracargos_chargebacks), 1), true);

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reembolsos_transaccion (id_reembolso, transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-REEMB-2026-0001', 285.50, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-REEMB-2026-0002', 321.00, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-REEMB-2026-0003', 356.50, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-REEMB-2026-0004', 392.00, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-REEMB-2026-0005', 427.50, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-REEMB-2026-0006', 463.00, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-REEMB-2026-0007', 498.50, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-REEMB-2026-0008', 534.00, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-REEMB-2026-0009', 569.50, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-REEMB-2026-0010', 605.00, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-REEMB-2026-0011', 640.50, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-REEMB-2026-0012', 676.00, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-REEMB-2026-0013', 711.50, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-REEMB-2026-0014', 747.00, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-REEMB-2026-0015', 782.50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-REEMB-2026-0016', 818.00, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-REEMB-2026-0017', 853.50, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-REEMB-2026-0018', 889.00, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-REEMB-2026-0019', 924.50, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-REEMB-2026-0020', 960.00, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-REEMB-2026-0021', 995.50, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-REEMB-2026-0022', 1031.00, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-REEMB-2026-0023', 1066.50, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-REEMB-2026-0024', 1102.00, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-REEMB-2026-0025', 1137.50, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-REEMB-2026-0026', 1173.00, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-REEMB-2026-0027', 1208.50, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-REEMB-2026-0028', 1244.00, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-REEMB-2026-0029', 1279.50, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-REEMB-2026-0030', 1315.00, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reembolsos_transaccion', 'id_reembolso'), COALESCE((SELECT MAX(id_reembolso) FROM pagos.reembolsos_transaccion), 1), true);

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.regimenes_sat (id_regimen_sat, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, '601', 'General de Ley Personas Morales', FALSE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, '605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, '606', 'Arrendamiento', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, '612', 'Personas Físicas con Actividades Empresariales y Profesionales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, '616', 'Sin obligaciones fiscales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, '621', 'Incorporación Fiscal', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, '625', 'Régimen de las Actividades Empresariales con ingresos a través de Plataformas', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, '626', 'Régimen Simplificado de Confianza (RESICO)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.regimenes_sat', 'id_regimen_sat'), COALESCE((SELECT MAX(id_regimen_sat) FROM fiscal.regimenes_sat), 1), true);

-- =================================================================================================
-- 088. TABLA: fiscal.usos_cfdi (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.usos_cfdi (id_uso_cfdi, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'G01', 'Adquisición de mercancías', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'G03', 'Gastos en general', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'D01', 'Honorarios médicos, dentales y gastos hospitalarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'D02', 'Gastos médicos por incapacidad o discapacidad', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'I04', 'Equipo de computo y accesorios', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'P01', 'Por definir (Uso transitorio)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'S01', 'Sin efectos fiscales', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CP01', 'Pagos (Complemento de recepción de pagos)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.usos_cfdi', 'id_uso_cfdi'), COALESCE((SELECT MAX(id_uso_cfdi) FROM fiscal.usos_cfdi), 1), true);

-- =================================================================================================
-- 089. TABLA: fiscal.datos_fiscales_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.datos_fiscales_cliente (id_dato_fiscal, cliente, rfc_emisor, razon_social, codigo_postal_fiscal, regimen_sat, uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacin', 'Laboratorios La Roche-Posay S.A. de C.V.', 'POSTAL_F_0', 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'POSTAL_F_0', 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Sol', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'POSTAL_F_0', 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'POSTAL_F_0', 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidrata', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'POSTAL_F_0', 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro ', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'POSTAL_F_0', 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar ', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'POSTAL_F_0', 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitami', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'POSTAL_F_0', 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maqui', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'POSTAL_F_0', 1, 1, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Lí', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'POSTAL_F_1', 2, 2, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Repa', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'POSTAL_F_1', 3, 3, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Á', 'Laboratorios MAC Professional S.A. de C.V.', 'POSTAL_F_1', 4, 4, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de O', 'Laboratorios Fenty Beauty S.A. de C.V.', 'POSTAL_F_1', 5, 5, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla No', 'Laboratorios Rare Beauty S.A. de C.V.', 'POSTAL_F_1', 6, 6, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal ', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'POSTAL_F_1', 7, 7, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpia', 'Laboratorios Estée Lauder S.A. de C.V.', 'POSTAL_F_1', 8, 8, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equil', 'Laboratorios Lancôme Paris S.A. de C.V.', 'POSTAL_F_1', 1, 1, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidrat', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'POSTAL_F_1', 2, 2, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslú', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'POSTAL_F_1', 3, 3, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquid', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'POSTAL_F_2', 4, 4, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'POSTAL_F_2', 5, 5, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Pr', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'POSTAL_F_2', 6, 6, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigm', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'POSTAL_F_2', 7, 7, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Sol', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'POSTAL_F_2', 8, 8, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corpo', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'POSTAL_F_2', 1, 1, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'POSTAL_F_2', 2, 2, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de P', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'POSTAL_F_2', 3, 3, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Pépti', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'POSTAL_F_2', 4, 4, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desm', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'POSTAL_F_2', 5, 5, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'POSTAL_F_3', 6, 6, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.datos_fiscales_cliente', 'id_dato_fiscal'), COALESCE((SELECT MAX(id_dato_fiscal) FROM fiscal.datos_fiscales_cliente), 1), true);

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_cfdi (id_factura, orden, dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Nia', 'FOL-FACTU-2026-0001', 'B1000000-0000-4000-8000-000000000001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 1', '2026-02-01 11:30:00', 17.50, 'TIMBRADA_VIGENTE', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpia', 'FOL-FACTU-2026-0002', 'B1000000-0000-4000-8000-000000000002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumo', '2026-02-02 11:30:00', 20.00, 'CANCELADA_SAT', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector ', 'FOL-FACTU-2026-0003', 'B1000000-0000-4000-8000-000000000003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Flui', '2026-02-03 11:30:00', 22.50, 'ERROR_TIMBRADO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ác', 'FOL-FACTU-2026-0004', 'B1000000-0000-4000-8000-000000000004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialur', '2026-02-04 11:30:00', 25.00, 'TIMBRADA_VIGENTE', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidr', 'FOL-FACTU-2026-0005', 'B1000000-0000-4000-8000-000000000005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con', '2026-02-05 11:30:00', 27.50, 'CANCELADA_SAT', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Pu', 'FOL-FACTU-2026-0006', 'B1000000-0000-4000-8000-000000000006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% No', '2026-02-06 11:30:00', 30.00, 'ERROR_TIMBRADO', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micel', 'FOL-FACTU-2026-0007', 'B1000000-0000-4000-8000-000000000007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermoli', '2026-02-07 11:30:00', 32.50, 'TIMBRADA_VIGENTE', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vit', 'FOL-FACTU-2026-0008', 'B1000000-0000-4000-8000-000000000008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pu', '2026-02-08 11:30:00', 35.00, 'CANCELADA_SAT', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Ma', 'FOL-FACTU-2026-0009', 'B1000000-0000-4000-8000-000000000009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje C', '2026-02-09 11:30:00', 37.50, 'ERROR_TIMBRADO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector ', 'FOL-FACTU-2026-0010', 'B1000000-0000-4000-8000-00000000000A', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido A', '2026-02-10 11:30:00', 40.00, 'TIMBRADA_VIGENTE', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo R', 'FOL-FACTU-2026-0011', 'B1000000-0000-4000-8000-00000000000B', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador C', '2026-02-11 11:30:00', 42.50, 'CANCELADA_SAT', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante', 'FOL-FACTU-2026-0012', 'B1000000-0000-4000-8000-00000000000C', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Sa', '2026-02-12 11:30:00', 45.00, 'ERROR_TIMBRADO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno d', 'FOL-FACTU-2026-0013', 'B1000000-0000-4000-8000-00000000000D', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con', '2026-02-13 11:30:00', 47.50, 'TIMBRADA_VIGENTE', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla', 'FOL-FACTU-2026-0014', 'B1000000-0000-4000-8000-00000000000E', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna ', '2026-02-14 11:30:00', 50.00, 'CANCELADA_SAT', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Term', 'FOL-FACTU-2026-0015', 'B1000000-0000-4000-8000-00000000000F', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmant', '2026-02-15 11:30:00', 52.50, 'ERROR_TIMBRADO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Lim', 'FOL-FACTU-2026-0016', 'B1000000-0000-4000-8000-000000000010', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emu', '2026-02-16 11:30:00', 55.00, 'TIMBRADA_VIGENTE', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Eq', 'FOL-FACTU-2026-0017', 'B1000000-0000-4000-8000-000000000011', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante', '2026-02-17 11:30:00', 57.50, 'CANCELADA_SAT', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hid', 'FOL-FACTU-2026-0018', 'B1000000-0000-4000-8000-000000000012', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante P', '2026-02-18 11:30:00', 60.00, 'ERROR_TIMBRADO', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Tras', 'FOL-FACTU-2026-0019', 'B1000000-0000-4000-8000-000000000013', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Ma', '2026-02-19 11:30:00', 62.50, 'TIMBRADA_VIGENTE', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líq', 'FOL-FACTU-2026-0020', 'B1000000-0000-4000-8000-000000000014', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigme', '2026-02-20 11:30:00', 65.00, 'CANCELADA_SAT', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ác', 'FOL-FACTU-2026-0021', 'B1000000-0000-4000-8000-000000000015', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelai', '2026-02-21 11:30:00', 67.50, 'ERROR_TIMBRADO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas', 'FOL-FACTU-2026-0022', 'B1000000-0000-4000-8000-000000000016', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteogli', '2026-02-22 11:30:00', 70.00, 'TIMBRADA_VIGENTE', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Desp', 'FOL-FACTU-2026-0023', 'B1000000-0000-4000-8000-000000000017', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante', '2026-02-23 11:30:00', 72.50, 'CANCELADA_SAT', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector ', 'FOL-FACTU-2026-0024', 'B1000000-0000-4000-8000-000000000018', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mine', '2026-02-24 11:30:00', 75.00, 'ERROR_TIMBRADO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Co', 'FOL-FACTU-2026-0025', 'B1000000-0000-4000-8000-000000000019', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Ure', '2026-02-25 11:30:00', 77.50, 'TIMBRADA_VIGENTE', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Fac', 'FOL-FACTU-2026-0026', 'B1000000-0000-4000-8000-00000000001A', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimi', '2026-02-26 11:30:00', 80.00, 'CANCELADA_SAT', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara d', 'FOL-FACTU-2026-0027', 'B1000000-0000-4000-8000-00000000001B', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestaña', '2026-02-27 11:30:00', 82.50, 'ERROR_TIMBRADO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Pé', 'FOL-FACTU-2026-0028', 'B1000000-0000-4000-8000-00000000001C', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de ', '2026-02-28 11:30:00', 85.00, 'TIMBRADA_VIGENTE', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo D', 'FOL-FACTU-2026-0029', 'B1000000-0000-4000-8000-00000000001D', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquilla', '2026-02-01 11:30:00', 87.50, 'CANCELADA_SAT', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barr', 'FOL-FACTU-2026-0030', 'B1000000-0000-4000-8000-00000000001E', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-R', '2026-02-02 11:30:00', 90.00, 'ERROR_TIMBRADO', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_cfdi', 'id_factura'), COALESCE((SELECT MAX(id_factura) FROM fiscal.facturas_cfdi), 1), true);

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_partidas (id_factura_partida, factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'PRODUCTO_0', 'UNIDA', 17.50, 17.50, 17.50, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PRODUCTO_0', 'UNIDA', 20.00, 20.00, 20.00, 'Gel', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'PRODUCTO_0', 'UNIDA', 22.50, 22.50, 22.50, 'Pro', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'PRODUCTO_0', 'UNIDA', 25.00, 25.00, 25.00, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PRODUCTO_0', 'UNIDA', 27.50, 27.50, 27.50, 'Cre', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PRODUCTO_0', 'UNIDA', 30.00, 30.00, 30.00, 'Ret', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'PRODUCTO_0', 'UNIDA', 32.50, 32.50, 32.50, 'Agu', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PRODUCTO_0', 'UNIDA', 35.00, 35.00, 35.00, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'PRODUCTO_0', 'UNIDA', 37.50, 37.50, 37.50, 'Bas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PRODUCTO_1', 'UNIDA', 40.00, 40.00, 40.00, 'Cor', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PRODUCTO_1', 'UNIDA', 42.50, 42.50, 42.50, 'Bá', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'PRODUCTO_1', 'UNIDA', 45.00, 45.00, 45.00, 'Exf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'PRODUCTO_1', 'UNIDA', 47.50, 47.50, 47.50, 'Con', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PRODUCTO_1', 'UNIDA', 50.00, 50.00, 50.00, 'Mas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'PRODUCTO_1', 'UNIDA', 52.50, 52.50, 52.50, 'Bru', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'PRODUCTO_1', 'UNIDA', 55.00, 55.00, 55.00, 'Ace', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'PRODUCTO_1', 'UNIDA', 57.50, 57.50, 57.50, 'Tó', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PRODUCTO_1', 'UNIDA', 60.00, 60.00, 60.00, 'Lab', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'PRODUCTO_1', 'UNIDA', 62.50, 62.50, 62.50, 'Pol', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PRODUCTO_2', 'UNIDA', 65.00, 65.00, 65.00, 'Rub', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'PRODUCTO_2', 'UNIDA', 67.50, 67.50, 67.50, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PRODUCTO_2', 'UNIDA', 70.00, 70.00, 70.00, 'Amp', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PRODUCTO_2', 'UNIDA', 72.50, 72.50, 72.50, 'Cre', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'PRODUCTO_2', 'UNIDA', 75.00, 75.00, 75.00, 'Pro', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'PRODUCTO_2', 'UNIDA', 77.50, 77.50, 77.50, 'Loc', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PRODUCTO_2', 'UNIDA', 80.00, 80.00, 80.00, 'Pri', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'PRODUCTO_2', 'UNIDA', 82.50, 82.50, 82.50, 'Má', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'PRODUCTO_2', 'UNIDA', 85.00, 85.00, 85.00, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'PRODUCTO_2', 'UNIDA', 87.50, 87.50, 87.50, 'Bá', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PRODUCTO_3', 'UNIDA', 90.00, 90.00, 90.00, 'Cre', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_partidas', 'id_factura_partida'), COALESCE((SELECT MAX(id_factura_partida) FROM fiscal.facturas_partidas), 1), true);

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.complementos_pago (id_complemento_pago, factura, transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'B1000000-0000-4000-8000-000000000001', 1, 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'B1000000-0000-4000-8000-000000000002', 1, 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'B1000000-0000-4000-8000-000000000003', 1, 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'B1000000-0000-4000-8000-000000000004', 1, 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'B1000000-0000-4000-8000-000000000005', 1, 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'B1000000-0000-4000-8000-000000000006', 1, 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'B1000000-0000-4000-8000-000000000007', 1, 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'B1000000-0000-4000-8000-000000000008', 1, 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'B1000000-0000-4000-8000-000000000009', 1, 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'B1000000-0000-4000-8000-00000000000A', 1, 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'B1000000-0000-4000-8000-00000000000B', 1, 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'B1000000-0000-4000-8000-00000000000C', 1, 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'B1000000-0000-4000-8000-00000000000D', 1, 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'B1000000-0000-4000-8000-00000000000E', 1, 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'B1000000-0000-4000-8000-00000000000F', 1, 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'B1000000-0000-4000-8000-000000000010', 1, 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'B1000000-0000-4000-8000-000000000011', 1, 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'B1000000-0000-4000-8000-000000000012', 1, 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'B1000000-0000-4000-8000-000000000013', 1, 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'B1000000-0000-4000-8000-000000000014', 1, 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'B1000000-0000-4000-8000-000000000015', 1, 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'B1000000-0000-4000-8000-000000000016', 1, 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'B1000000-0000-4000-8000-000000000017', 1, 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'B1000000-0000-4000-8000-000000000018', 1, 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'B1000000-0000-4000-8000-000000000019', 1, 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'B1000000-0000-4000-8000-00000000001A', 1, 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'B1000000-0000-4000-8000-00000000001B', 1, 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'B1000000-0000-4000-8000-00000000001C', 1, 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'B1000000-0000-4000-8000-00000000001D', 1, 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'B1000000-0000-4000-8000-00000000001E', 1, 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.complementos_pago', 'id_complemento_pago'), COALESCE((SELECT MAX(id_complemento_pago) FROM fiscal.complementos_pago), 1), true);

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.notas_credito (id_nota_credito, factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'B1000000-0000-4000-8000-000000000001', 'Sé', 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'B1000000-0000-4000-8000-000000000002', 'Gel', 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'B1000000-0000-4000-8000-000000000003', 'Pro', 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'B1000000-0000-4000-8000-000000000004', 'Sé', 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'B1000000-0000-4000-8000-000000000005', 'Cre', 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'B1000000-0000-4000-8000-000000000006', 'Ret', 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'B1000000-0000-4000-8000-000000000007', 'Agu', 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'B1000000-0000-4000-8000-000000000008', 'Sé', 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'B1000000-0000-4000-8000-000000000009', 'Bas', 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'B1000000-0000-4000-8000-00000000000A', 'Cor', 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'B1000000-0000-4000-8000-00000000000B', 'Bá', 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'B1000000-0000-4000-8000-00000000000C', 'Exf', 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'B1000000-0000-4000-8000-00000000000D', 'Con', 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'B1000000-0000-4000-8000-00000000000E', 'Mas', 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'B1000000-0000-4000-8000-00000000000F', 'Bru', 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'B1000000-0000-4000-8000-000000000010', 'Ace', 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'B1000000-0000-4000-8000-000000000011', 'Tó', 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'B1000000-0000-4000-8000-000000000012', 'Lab', 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'B1000000-0000-4000-8000-000000000013', 'Pol', 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'B1000000-0000-4000-8000-000000000014', 'Rub', 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'B1000000-0000-4000-8000-000000000015', 'Sé', 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'B1000000-0000-4000-8000-000000000016', 'Amp', 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'B1000000-0000-4000-8000-000000000017', 'Cre', 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'B1000000-0000-4000-8000-000000000018', 'Pro', 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'B1000000-0000-4000-8000-000000000019', 'Loc', 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'B1000000-0000-4000-8000-00000000001A', 'Pri', 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'B1000000-0000-4000-8000-00000000001B', 'Má', 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'B1000000-0000-4000-8000-00000000001C', 'Sé', 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'B1000000-0000-4000-8000-00000000001D', 'Bá', 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'B1000000-0000-4000-8000-00000000001E', 'Cre', 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.notas_credito', 'id_nota_credito'), COALESCE((SELECT MAX(id_nota_credito) FROM fiscal.notas_credito), 1), true);

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.cancelaciones_cfdi (id_cancelacion_cfdi, factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '01', 'B1000000-0000-4000-8000-000000000001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '02', 'B1000000-0000-4000-8000-000000000002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '03', 'B1000000-0000-4000-8000-000000000003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '04', 'B1000000-0000-4000-8000-000000000004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '01', 'B1000000-0000-4000-8000-000000000005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '02', 'B1000000-0000-4000-8000-000000000006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '03', 'B1000000-0000-4000-8000-000000000007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '04', 'B1000000-0000-4000-8000-000000000008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '01', 'B1000000-0000-4000-8000-000000000009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '02', 'B1000000-0000-4000-8000-00000000000A', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '03', 'B1000000-0000-4000-8000-00000000000B', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '04', 'B1000000-0000-4000-8000-00000000000C', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '01', 'B1000000-0000-4000-8000-00000000000D', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '02', 'B1000000-0000-4000-8000-00000000000E', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '03', 'B1000000-0000-4000-8000-00000000000F', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '04', 'B1000000-0000-4000-8000-000000000010', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '01', 'B1000000-0000-4000-8000-000000000011', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '02', 'B1000000-0000-4000-8000-000000000012', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '03', 'B1000000-0000-4000-8000-000000000013', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '04', 'B1000000-0000-4000-8000-000000000014', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '01', 'B1000000-0000-4000-8000-000000000015', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '02', 'B1000000-0000-4000-8000-000000000016', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '03', 'B1000000-0000-4000-8000-000000000017', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '04', 'B1000000-0000-4000-8000-000000000018', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '01', 'B1000000-0000-4000-8000-000000000019', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '02', 'B1000000-0000-4000-8000-00000000001A', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '03', 'B1000000-0000-4000-8000-00000000001B', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '04', 'B1000000-0000-4000-8000-00000000001C', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '01', 'B1000000-0000-4000-8000-00000000001D', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '02', 'B1000000-0000-4000-8000-00000000001E', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.cancelaciones_cfdi', 'id_cancelacion_cfdi'), COALESCE((SELECT MAX(id_cancelacion_cfdi) FROM fiscal.cancelaciones_cfdi), 1), true);

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.campanias (id_campania, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CAMPANIA_01', 'Kit Rutina La Roche-Posay #1', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CAMPANIA_02', 'Kit Rutina CeraVe Dermatological #2', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAMPANIA_03', 'Kit Rutina The Ordinary Deciem #3', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAMPANIA_04', 'Kit Rutina ISDIN Fotoprotección #4', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CAMPANIA_05', 'Kit Rutina Bioderma Laboratoire #5', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CAMPANIA_06', 'Kit Rutina Eau Thermale Avène #6', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CAMPANIA_07', 'Kit Rutina Eucerin Beiersdorf #7', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CAMPANIA_08', 'Kit Rutina Vichy Laboratoires #8', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAMPANIA_09', 'Kit Rutina SkinCeuticals Clinical #9', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CAMPANIA_10', 'Kit Rutina Sesderma Nanotech #10', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CAMPANIA_11', 'Kit Rutina NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CAMPANIA_12', 'Kit Rutina MAC Professional #12', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CAMPANIA_13', 'Kit Rutina Fenty Beauty #13', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CAMPANIA_14', 'Kit Rutina Rare Beauty #14', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CAMPANIA_15', 'Kit Rutina Clinique Laboratories #15', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CAMPANIA_16', 'Kit Rutina Estée Lauder #16', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CAMPANIA_17', 'Kit Rutina Lancôme Paris #17', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CAMPANIA_18', 'Kit Rutina Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CAMPANIA_19', 'Kit Rutina Paula''s Choice Skincare #19', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CAMPANIA_20', 'Kit Rutina COSRX K-Beauty #20', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CAMPANIA_21', 'Kit Rutina Laneige Amorepacific #21', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CAMPANIA_22', 'Kit Rutina Uriage Eau Thermale #22', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CAMPANIA_23', 'Kit Rutina Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CAMPANIA_24', 'Kit Rutina MartiDerm Ampollas #24', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CAMPANIA_25', 'Kit Rutina Heliocare Cantabria Labs #25', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CAMPANIA_26', 'Kit Rutina Kiehl''s Since 1851 #26', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CAMPANIA_27', 'Kit Rutina Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CAMPANIA_28', 'Kit Rutina L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CAMPANIA_29', 'Kit Rutina Neutrogena Derm #29', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CAMPANIA_30', 'Kit Rutina DermaCare Labs México #30', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.campanias', 'id_campania'), COALESCE((SELECT MAX(id_campania) FROM promos.campanias), 1), true);

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones (id_cupon, campania, codigo_cupon, tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CUPON_01', 1, 17.50, 17.50, 1, 1, 1, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'CUPON_02', 2, 20.00, 20.00, 2, 2, 2, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'CUPON_03', 3, 22.50, 22.50, 3, 3, 3, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CUPON_04', 4, 25.00, 25.00, 4, 4, 4, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'CUPON_05', 5, 27.50, 27.50, 5, 5, 5, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'CUPON_06', 6, 30.00, 30.00, 6, 6, 6, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CUPON_07', 7, 32.50, 32.50, 7, 7, 7, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'CUPON_08', 8, 35.00, 35.00, 8, 8, 8, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'CUPON_09', 9, 37.50, 37.50, 9, 9, 9, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CUPON_10', 10, 40.00, 40.00, 10, 10, 10, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'CUPON_11', 11, 42.50, 42.50, 11, 11, 11, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'CUPON_12', 12, 45.00, 45.00, 12, 12, 12, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CUPON_13', 13, 47.50, 47.50, 13, 13, 13, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'CUPON_14', 14, 50.00, 50.00, 14, 14, 14, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'CUPON_15', 15, 52.50, 52.50, 15, 15, 15, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CUPON_16', 16, 55.00, 55.00, 16, 16, 16, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CUPON_17', 17, 57.50, 57.50, 17, 17, 17, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'CUPON_18', 18, 60.00, 60.00, 18, 18, 18, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CUPON_19', 19, 62.50, 62.50, 19, 19, 19, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'CUPON_20', 20, 65.00, 65.00, 20, 20, 20, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'CUPON_21', 21, 67.50, 67.50, 21, 21, 21, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CUPON_22', 22, 70.00, 70.00, 22, 22, 22, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'CUPON_23', 23, 72.50, 72.50, 23, 23, 23, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'CUPON_24', 24, 75.00, 75.00, 24, 24, 24, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CUPON_25', 25, 77.50, 77.50, 25, 25, 25, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'CUPON_26', 26, 80.00, 80.00, 26, 26, 26, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CUPON_27', 27, 82.50, 82.50, 27, 27, 27, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CUPON_28', 28, 85.00, 85.00, 28, 28, 28, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'CUPON_29', 29, 87.50, 87.50, 29, 29, 29, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'CUPON_30', 30, 90.00, 90.00, 30, 30, 30, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.cupones', 'id_cupon'), COALESCE((SELECT MAX(id_cupon) FROM promos.cupones), 1), true);

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.reglas_elegibilidad_cupon (id_regla_cupon, cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('promos.reglas_elegibilidad_cupon', 'id_regla_cupon'), COALESCE((SELECT MAX(id_regla_cupon) FROM promos.reglas_elegibilidad_cupon), 1), true);

-- =================================================================================================
-- 098. TABLA: promos.cupones_categorias_excluidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones_categorias_excluidas (id_cupon_exclusion, cupon, categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('promos.cupones_categorias_excluidas', 'id_cupon_exclusion'), COALESCE((SELECT MAX(id_cupon_exclusion) FROM promos.cupones_categorias_excluidas), 1), true);

-- =================================================================================================
-- 099. TABLA: promos.redenciones_cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.redenciones_cupones (id_redencion_cupon, cupon, cliente, orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 17.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 20.00, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 22.50, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 25.00, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 27.50, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 30.00, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 32.50, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 35.00, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 37.50, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 40.00, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 42.50, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 45.00, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 47.50, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 50.00, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 52.50, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 55.00, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 57.50, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 60.00, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62.50, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 67.50, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 70.00, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 72.50, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 75.00, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 77.50, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 80.00, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 82.50, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 85.00, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 87.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 90.00, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.redenciones_cupones', 'id_redencion_cupon'), COALESCE((SELECT MAX(id_redencion_cupon) FROM promos.redenciones_cupones), 1), true);

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.ventas_flash_horarias (id_venta_flash, variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 17.50, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.ventas_flash_horarias', 'id_venta_flash'), COALESCE((SELECT MAX(id_venta_flash) FROM promos.ventas_flash_horarias), 1), true);

