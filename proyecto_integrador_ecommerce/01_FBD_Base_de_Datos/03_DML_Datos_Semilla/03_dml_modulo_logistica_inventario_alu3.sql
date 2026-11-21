-- =================================================================================================
-- SUBMÓDULO 3: LOGÍSTICA MULTIALMACÉN, TRAZABILIDAD FEFO, TELEMETRÍA IOT Y CALIDAD
-- Tablas 101 a 150 (Autor: Integrante 3 - Control: 22050003)
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
INSERT INTO compras.estados_orden_compra (id_estado_oc, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO compras.proveedores (id_proveedor, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROVEEDO_01', N'Laboratorios La Roche-Posay S.A. de C.V.', N'Kit Rutina La Roche-Posay #1', 'MEGC910315H01', N'México', 1, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROVEEDO_02', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Kit Rutina CeraVe Dermatological #2', 'RALS920315H02', N'México', 2, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROVEEDO_03', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Kit Rutina The Ordinary Deciem #3', 'TOVV930315H03', N'México', 3, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROVEEDO_04', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Kit Rutina ISDIN Fotoprotección #4', 'HECA940315H04', N'México', 4, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROVEEDO_05', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Kit Rutina Bioderma Laboratoire #5', 'SAFM950315H05', N'México', 5, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROVEEDO_06', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Kit Rutina Eau Thermale Avène #6', 'MATD960315H06', N'México', 6, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROVEEDO_07', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Kit Rutina Eucerin Beiersdorf #7', 'GORC970315H07', N'México', 7, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROVEEDO_08', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Kit Rutina Vichy Laboratoires #8', 'FLCM980315H08', N'México', 8, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROVEEDO_09', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Kit Rutina SkinCeuticals Clinical #9', 'MODL990315H09', N'México', 9, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROVEEDO_10', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Kit Rutina Sesderma Nanotech #10', 'VAOS900315H10', N'México', 10, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROVEEDO_11', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Kit Rutina NARS Cosmetics #11', 'GUNR910315H11', N'México', 11, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROVEEDO_12', N'Laboratorios MAC Professional S.A. de C.V.', N'Kit Rutina MAC Professional #12', 'JIPS920315H12', N'México', 12, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROVEEDO_13', N'Laboratorios Fenty Beauty S.A. de C.V.', N'Kit Rutina Fenty Beauty #13', 'RUSF930315H13', N'México', 13, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROVEEDO_14', N'Laboratorios Rare Beauty S.A. de C.V.', N'Kit Rutina Rare Beauty #14', 'RICE940315H14', N'México', 14, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROVEEDO_15', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Kit Rutina Clinique Laboratories #15', 'AGIX950315H15', N'México', 15, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROVEEDO_16', N'Laboratorios Estée Lauder S.A. de C.V.', N'Kit Rutina Estée Lauder #16', 'MEND960315H16', N'México', 16, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROVEEDO_17', N'Laboratorios Lancôme Paris S.A. de C.V.', N'Kit Rutina Lancôme Paris #17', 'CADA970315H17', N'México', 17, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROVEEDO_18', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Kit Rutina Charlotte Tilbury #18', 'VEMG980315H18', N'México', 18, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROVEEDO_19', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Kit Rutina Paula''s Choice Skincare #19', 'CORP990315H19', N'México', 19, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROVEEDO_20', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Kit Rutina COSRX K-Beauty #20', 'RACA900315H20', N'México', 20, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROVEEDO_21', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Kit Rutina Laneige Amorepacific #21', 'GULR910315H21', N'México', 21, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROVEEDO_22', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Kit Rutina Uriage Eau Thermale #22', 'PECN920315H22', N'México', 22, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROVEEDO_23', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Kit Rutina Laboratoire SVR #23', 'HEVN930315H23', N'México', 23, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROVEEDO_24', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Kit Rutina MartiDerm Ampollas #24', 'MECJ940315H24', N'México', 24, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROVEEDO_25', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Kit Rutina Heliocare Cantabria Labs #25', 'DOEI950315H25', N'México', 25, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROVEEDO_26', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Kit Rutina Kiehl''s Since 1851 #26', 'SIPL960315H26', N'México', 26, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROVEEDO_27', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Kit Rutina Garnier SkinActive #27', 'CHBA970315H27', N'México', 27, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROVEEDO_28', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Kit Rutina L''Oréal Paris Derm #28', 'OCAR980315H28', N'México', 28, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROVEEDO_29', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Kit Rutina Neutrogena Derm #29', 'MILP990315H29', N'México', 29, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROVEEDO_30', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Kit Rutina DermaCare Labs México #30', 'PASM900315H30', N'México', 30, 4.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedores OFF;
GO

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.contactos_proveedor ON;
INSERT INTO compras.contactos_proveedor (id_contacto_proveedor, proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Laboratorios La Roche-Posay S.A. de C.V.', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumo', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Flui', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurón', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% No', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermoli', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pur', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje C', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Al', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Ci', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Laboratorios MAC Professional S.A. de C.V.', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Sal', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Laboratorios Fenty Beauty S.A. de C.V.', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Laboratorios Rare Beauty S.A. de C.V.', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna ', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmant', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Laboratorios Estée Lauder S.A. de C.V.', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emu', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Laboratorios Lancôme Paris S.A. de C.V.', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante ', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Pé', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Mat', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmen', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteogli', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mine', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimi', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas ', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Co', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillan', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-R', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.contactos_proveedor OFF;
GO

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedor_slas ON;
INSERT INTO compras.proveedor_slas (id_proveedor_sla, proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO compras.proveedor_productos (id_proveedor_producto, proveedor, variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO compras.requisiciones (id_requisicion, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-REQUI-2026-0001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'BAJA', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-REQUI-2026-0002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'MEDIA', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-REQUI-2026-0003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', N'URGENTE_DESABASTO', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-REQUI-2026-0004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'BAJA', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-REQUI-2026-0005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'MEDIA', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-REQUI-2026-0006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'URGENTE_DESABASTO', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-REQUI-2026-0007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'BAJA', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-REQUI-2026-0008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'MEDIA', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-REQUI-2026-0009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'URGENTE_DESABASTO', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-REQUI-2026-0010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'BAJA', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-REQUI-2026-0011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'MEDIA', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-REQUI-2026-0012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'URGENTE_DESABASTO', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-REQUI-2026-0013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'BAJA', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-REQUI-2026-0014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'MEDIA', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-REQUI-2026-0015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'URGENTE_DESABASTO', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-REQUI-2026-0016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'BAJA', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-REQUI-2026-0017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'MEDIA', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-REQUI-2026-0018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'URGENTE_DESABASTO', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-REQUI-2026-0019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'BAJA', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-REQUI-2026-0020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'MEDIA', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-REQUI-2026-0021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'URGENTE_DESABASTO', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-REQUI-2026-0022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'BAJA', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-REQUI-2026-0023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', N'MEDIA', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-REQUI-2026-0024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'URGENTE_DESABASTO', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-REQUI-2026-0025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', N'BAJA', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-REQUI-2026-0026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'MEDIA', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-REQUI-2026-0027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'URGENTE_DESABASTO', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-REQUI-2026-0028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'BAJA', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-REQUI-2026-0029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'MEDIA', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-REQUI-2026-0030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'URGENTE_DESABASTO', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.requisiciones OFF;
GO

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.requisiciones_detalles ON;
INSERT INTO compras.requisiciones_detalles (id_requisicion_detalle, requisicion, variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
SET IDENTITY_INSERT compras.requisiciones_detalles OFF;
GO

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra ON;
INSERT INTO compras.ordenes_compra (id_orden_compra, folio_orden_compra, proveedor, estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 285.50, 45.68, 17.50, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 321.00, 51.36, 20.00, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 356.50, 57.04, 22.50, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 392.00, 62.72, 25.00, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 427.50, 68.40, 27.50, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 463.00, 74.08, 30.00, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 498.50, 79.76, 32.50, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 534.00, 85.44, 35.00, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 569.50, 91.12, 37.50, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 605.00, 96.80, 40.00, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 640.50, 102.48, 42.50, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 676.00, 108.16, 45.00, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 711.50, 113.84, 47.50, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 747.00, 119.52, 50.00, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 782.50, 125.20, 52.50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 818.00, 130.88, 55.00, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 853.50, 136.56, 57.50, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 889.00, 142.24, 60.00, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 924.50, 147.92, 62.50, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 960.00, 153.60, 65.00, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 995.50, 159.28, 67.50, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 1031.00, 164.96, 70.00, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 1066.50, 170.64, 72.50, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 1102.00, 176.32, 75.00, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 1137.50, 182.00, 77.50, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 1173.00, 187.68, 80.00, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 1208.50, 193.36, 82.50, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 1244.00, 199.04, 85.00, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 1279.50, 204.72, 87.50, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 1315.00, 210.40, 90.00, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra OFF;
GO

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra_detalles ON;
INSERT INTO compras.ordenes_compra_detalles (id_orden_compra_detalle, orden_compra, variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 285.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 321.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 356.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 392.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 427.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 463.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 498.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 534.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 569.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 605.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 640.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 676.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 711.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 747.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 782.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 818.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 853.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 889.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 924.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 960.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 995.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1031.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1066.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1102.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1137.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1173.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1208.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1244.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1279.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 1315.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra_detalles OFF;
GO

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_mercancia ON;
INSERT INTO compras.recepciones_mercancia (id_recepcion, folio_recepcion, orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RECEP-2026-0001', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', '2026-02-01 11:30:00', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RECEP-2026-0002', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', '2026-02-02 11:30:00', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RECEP-2026-0003', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', '2026-02-03 11:30:00', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RECEP-2026-0004', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', '2026-02-04 11:30:00', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RECEP-2026-0005', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', '2026-02-05 11:30:00', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RECEP-2026-0006', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', '2026-02-06 11:30:00', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RECEP-2026-0007', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', '2026-02-07 11:30:00', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RECEP-2026-0008', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', '2026-02-08 11:30:00', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RECEP-2026-0009', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', '2026-02-09 11:30:00', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RECEP-2026-0010', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', '2026-02-10 11:30:00', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RECEP-2026-0011', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', '2026-02-11 11:30:00', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RECEP-2026-0012', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', '2026-02-12 11:30:00', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RECEP-2026-0013', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', '2026-02-13 11:30:00', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RECEP-2026-0014', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', '2026-02-14 11:30:00', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RECEP-2026-0015', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', '2026-02-15 11:30:00', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RECEP-2026-0016', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', '2026-02-16 11:30:00', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RECEP-2026-0017', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', '2026-02-17 11:30:00', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RECEP-2026-0018', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', '2026-02-18 11:30:00', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RECEP-2026-0019', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', '2026-02-19 11:30:00', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RECEP-2026-0020', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RECEP-2026-0021', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', '2026-02-21 11:30:00', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RECEP-2026-0022', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', '2026-02-22 11:30:00', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RECEP-2026-0023', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', '2026-02-23 11:30:00', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RECEP-2026-0024', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', '2026-02-24 11:30:00', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RECEP-2026-0025', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', '2026-02-25 11:30:00', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RECEP-2026-0026', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', '2026-02-26 11:30:00', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RECEP-2026-0027', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', '2026-02-27 11:30:00', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RECEP-2026-0028', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', '2026-02-28 11:30:00', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RECEP-2026-0029', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', '2026-02-01 11:30:00', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RECEP-2026-0030', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', '2026-02-02 11:30:00', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_mercancia OFF;
GO

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_detalles ON;
INSERT INTO compras.recepciones_detalles (id_recepcion_detalle, recepcion, variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_detalles OFF;
GO

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa ON;
INSERT INTO compras.inspecciones_sanitarias_qa (id_inspeccion_qa, recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'LOTE_LAB_01', '2026-03-01', N'APROBADO', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, N'LOTE_LAB_02', '2026-03-02', N'RECHAZADO_DEVOLVER', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, N'LOTE_LAB_03', '2026-03-03', N'APROBADO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, N'LOTE_LAB_04', '2026-03-04', N'RECHAZADO_DEVOLVER', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, N'LOTE_LAB_05', '2026-03-05', N'APROBADO', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, N'LOTE_LAB_06', '2026-03-06', N'RECHAZADO_DEVOLVER', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, N'LOTE_LAB_07', '2026-03-07', N'APROBADO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, N'LOTE_LAB_08', '2026-03-08', N'RECHAZADO_DEVOLVER', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, N'LOTE_LAB_09', '2026-03-09', N'APROBADO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, N'LOTE_LAB_10', '2026-03-10', N'RECHAZADO_DEVOLVER', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, N'LOTE_LAB_11', '2026-03-11', N'APROBADO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, N'LOTE_LAB_12', '2026-03-12', N'RECHAZADO_DEVOLVER', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, N'LOTE_LAB_13', '2026-03-13', N'APROBADO', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, N'LOTE_LAB_14', '2026-03-14', N'RECHAZADO_DEVOLVER', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, N'LOTE_LAB_15', '2026-03-15', N'APROBADO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, N'LOTE_LAB_16', '2026-03-16', N'RECHAZADO_DEVOLVER', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, N'LOTE_LAB_17', '2026-03-17', N'APROBADO', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, N'LOTE_LAB_18', '2026-03-18', N'RECHAZADO_DEVOLVER', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, N'LOTE_LAB_19', '2026-03-19', N'APROBADO', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, N'LOTE_LAB_20', '2026-03-20', N'RECHAZADO_DEVOLVER', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, N'LOTE_LAB_21', '2026-03-21', N'APROBADO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, N'LOTE_LAB_22', '2026-03-22', N'RECHAZADO_DEVOLVER', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, N'LOTE_LAB_23', '2026-03-23', N'APROBADO', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, N'LOTE_LAB_24', '2026-03-24', N'RECHAZADO_DEVOLVER', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, N'LOTE_LAB_25', '2026-03-25', N'APROBADO', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, N'LOTE_LAB_26', '2026-03-26', N'RECHAZADO_DEVOLVER', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, N'LOTE_LAB_27', '2026-03-27', N'APROBADO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, N'LOTE_LAB_28', '2026-03-28', N'RECHAZADO_DEVOLVER', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, N'LOTE_LAB_29', '2026-03-01', N'APROBADO', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, N'LOTE_LAB_30', '2026-03-02', N'RECHAZADO_DEVOLVER', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa OFF;
GO

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.almacenes_cedis ON;
INSERT INTO wms.almacenes_cedis (id_almacen, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ALMACEN_01', N'CEDIS Monterrey Parque Stiva Unidad 1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'25700', N'Monclova', 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ALMACEN_02', N'CEDIS CDMX Vallejo Industrial Unidad 2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'64000', N'Monterrey', 20.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ALMACEN_03', N'CEDIS Guadalajara El Salto Unidad 3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'66220', N'San Pedro Garza García', 22.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'ALMACEN_04', N'CEDIS Monclova Centro Distribución Unidad 4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'06700', N'Ciudad de México', 25.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ALMACEN_05', N'CEDIS Querétaro Logístico Bajío Unidad 5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'11560', N'Ciudad de México', 27.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'ALMACEN_06', N'CEDIS Puebla Parque Finsa Unidad 6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'44100', N'Guadalajara', 30.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'ALMACEN_07', N'CEDIS Monterrey Parque Stiva Unidad 7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'25000', N'Saltillo', 32.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'ALMACEN_08', N'CEDIS CDMX Vallejo Industrial Unidad 8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'76000', N'Querétaro', 35.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'ALMACEN_09', N'CEDIS Guadalajara El Salto Unidad 9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'72000', N'Puebla', 37.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'ALMACEN_10', N'CEDIS Monclova Centro Distribución Unidad 10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'97000', N'Mérida', 40.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ALMACEN_11', N'CEDIS Querétaro Logístico Bajío Unidad 11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'25700', N'Monclova', 42.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ALMACEN_12', N'CEDIS Puebla Parque Finsa Unidad 12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'64000', N'Monterrey', 45.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'ALMACEN_13', N'CEDIS Monterrey Parque Stiva Unidad 13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'66220', N'San Pedro Garza García', 47.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'ALMACEN_14', N'CEDIS CDMX Vallejo Industrial Unidad 14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'06700', N'Ciudad de México', 50.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ALMACEN_15', N'CEDIS Guadalajara El Salto Unidad 15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'11560', N'Ciudad de México', 52.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'ALMACEN_16', N'CEDIS Monclova Centro Distribución Unidad 16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'44100', N'Guadalajara', 55.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'ALMACEN_17', N'CEDIS Querétaro Logístico Bajío Unidad 17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'25000', N'Saltillo', 57.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ALMACEN_18', N'CEDIS Puebla Parque Finsa Unidad 18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'76000', N'Querétaro', 60.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'ALMACEN_19', N'CEDIS Monterrey Parque Stiva Unidad 19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'72000', N'Puebla', 62.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'ALMACEN_20', N'CEDIS CDMX Vallejo Industrial Unidad 20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'97000', N'Mérida', 65.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ALMACEN_21', N'CEDIS Guadalajara El Salto Unidad 21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'25700', N'Monclova', 67.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'ALMACEN_22', N'CEDIS Monclova Centro Distribución Unidad 22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'64000', N'Monterrey', 70.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'ALMACEN_23', N'CEDIS Querétaro Logístico Bajío Unidad 23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'66220', N'San Pedro Garza García', 72.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'ALMACEN_24', N'CEDIS Puebla Parque Finsa Unidad 24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'06700', N'Ciudad de México', 75.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'ALMACEN_25', N'CEDIS Monterrey Parque Stiva Unidad 25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'11560', N'Ciudad de México', 77.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'ALMACEN_26', N'CEDIS CDMX Vallejo Industrial Unidad 26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'44100', N'Guadalajara', 80.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ALMACEN_27', N'CEDIS Guadalajara El Salto Unidad 27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'25000', N'Saltillo', 82.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'ALMACEN_28', N'CEDIS Monclova Centro Distribución Unidad 28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'76000', N'Querétaro', 85.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'ALMACEN_29', N'CEDIS Querétaro Logístico Bajío Unidad 29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'72000', N'Puebla', 87.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'ALMACEN_30', N'CEDIS Puebla Parque Finsa Unidad 30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'97000', N'Mérida', 90.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.almacenes_cedis OFF;
GO

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.zonas_almacen ON;
INSERT INTO wms.zonas_almacen (id_zona_almacen, almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ZONA_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ZONA_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ZONA_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ZONA_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ZONA_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ZONA_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ZONA_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ZONA_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ZONA_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ZONA_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ZONA_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ZONA_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ZONA_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ZONA_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ZONA_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ZONA_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ZONA_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ZONA_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ZONA_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ZONA_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ZONA_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ZONA_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ZONA_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ZONA_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ZONA_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ZONA_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ZONA_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ZONA_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ZONA_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ZONA_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.zonas_almacen OFF;
GO

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.pasillos_ubicaciones ON;
INSERT INTO wms.pasillos_ubicaciones (id_ubicacion, zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'UBICACIO_01', 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'UBICACIO_02', 20.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'UBICACIO_03', 22.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'UBICACIO_04', 25.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'UBICACIO_05', 27.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'UBICACIO_06', 30.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'UBICACIO_07', 32.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'UBICACIO_08', 35.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'UBICACIO_09', 37.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'UBICACIO_10', 40.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'UBICACIO_11', 42.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'UBICACIO_12', 45.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'UBICACIO_13', 47.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'UBICACIO_14', 50.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'UBICACIO_15', 52.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'UBICACIO_16', 55.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'UBICACIO_17', 57.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'UBICACIO_18', 60.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'UBICACIO_19', 62.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'UBICACIO_20', 65.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'UBICACIO_21', 67.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'UBICACIO_22', 70.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'UBICACIO_23', 72.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'UBICACIO_24', 75.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'UBICACIO_25', 77.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'UBICACIO_26', 80.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'UBICACIO_27', 82.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'UBICACIO_28', 85.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'UBICACIO_29', 87.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'UBICACIO_30', 90.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.pasillos_ubicaciones OFF;
GO

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.tipos_movimiento_inventario ON;
INSERT INTO wms.tipos_movimiento_inventario (id_tipo_movimiento, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.lotes_fabricacion_sanitaria (id_lote, variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'LOT-2026-LA_R-001', '2026-03-01', '2026-03-01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'LOT-2026-CERA-002', '2026-03-02', '2026-03-02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'LOT-2026-THE_-003', '2026-03-03', '2026-03-03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'LOT-2026-ISDI-004', '2026-03-04', '2026-03-04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'LOT-2026-BIOD-005', '2026-03-05', '2026-03-05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'LOT-2026-AVEN-006', '2026-03-06', '2026-03-06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'LOT-2026-EUCE-007', '2026-03-07', '2026-03-07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'LOT-2026-VICH-008', '2026-03-08', '2026-03-08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'LOT-2026-SKIN-009', '2026-03-09', '2026-03-09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'LOT-2026-SESD-010', '2026-03-10', '2026-03-10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'LOT-2026-NARS-011', '2026-03-11', '2026-03-11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'LOT-2026-MAC-012', '2026-03-12', '2026-03-12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'LOT-2026-FENT-013', '2026-03-13', '2026-03-13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'LOT-2026-RARE-014', '2026-03-14', '2026-03-14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'LOT-2026-CLIN-015', '2026-03-15', '2026-03-15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'LOT-2026-ESTE-016', '2026-03-16', '2026-03-16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'LOT-2026-LANC-017', '2026-03-17', '2026-03-17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'LOT-2026-CHAR-018', '2026-03-18', '2026-03-18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'LOT-2026-PAUL-019', '2026-03-19', '2026-03-19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'LOT-2026-COSR-020', '2026-03-20', '2026-03-20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'LOT-2026-LANE-021', '2026-03-21', '2026-03-21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'LOT-2026-URIA-022', '2026-03-22', '2026-03-22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'LOT-2026-SVR-023', '2026-03-23', '2026-03-23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'LOT-2026-MART-024', '2026-03-24', '2026-03-24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'LOT-2026-HELI-025', '2026-03-25', '2026-03-25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'LOT-2026-KIEH-026', '2026-03-26', '2026-03-26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'LOT-2026-GARN-027', '2026-03-27', '2026-03-27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'LOT-2026-LORE-028', '2026-03-28', '2026-03-28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'LOT-2026-NEUT-029', '2026-03-01', '2026-03-01', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'LOT-2026-DERM-030', '2026-03-02', '2026-03-02', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria OFF;
GO

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.inventario_lotes_ubicacion ON;
INSERT INTO wms.inventario_lotes_ubicacion (id_inventario_stock, lote, ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.kardex_movimientos (id_kardex, inventario_stock, tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, 1, N'FOL-DOCUM-2026-0001', 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, 2, N'FOL-DOCUM-2026-0002', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, 3, N'FOL-DOCUM-2026-0003', 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, 4, N'FOL-DOCUM-2026-0004', 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, 5, N'FOL-DOCUM-2026-0005', 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, 6, N'FOL-DOCUM-2026-0006', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 7, 7, N'FOL-DOCUM-2026-0007', 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 8, 8, N'FOL-DOCUM-2026-0008', 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 9, 9, N'FOL-DOCUM-2026-0009', 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 10, 10, N'FOL-DOCUM-2026-0010', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 11, 11, N'FOL-DOCUM-2026-0011', 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 12, 12, N'FOL-DOCUM-2026-0012', 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 13, 13, N'FOL-DOCUM-2026-0013', 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 14, 14, N'FOL-DOCUM-2026-0014', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 15, 15, N'FOL-DOCUM-2026-0015', 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 16, 16, N'FOL-DOCUM-2026-0016', 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 17, 17, N'FOL-DOCUM-2026-0017', 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 18, 18, N'FOL-DOCUM-2026-0018', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 19, 19, N'FOL-DOCUM-2026-0019', 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 20, 20, N'FOL-DOCUM-2026-0020', 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 21, 21, N'FOL-DOCUM-2026-0021', 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 22, 22, N'FOL-DOCUM-2026-0022', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 23, 23, N'FOL-DOCUM-2026-0023', 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 24, 24, N'FOL-DOCUM-2026-0024', 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 25, 25, N'FOL-DOCUM-2026-0025', 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 26, 26, N'FOL-DOCUM-2026-0026', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 27, 27, N'FOL-DOCUM-2026-0027', 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 28, 28, N'FOL-DOCUM-2026-0028', 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 29, 29, N'FOL-DOCUM-2026-0029', 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 30, 30, N'FOL-DOCUM-2026-0030', 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.kardex_movimientos OFF;
GO

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.alertas_caducidad_proxima ON;
INSERT INTO wms.alertas_caducidad_proxima (id_alerta_caducidad, lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'PREVENTIVA_90D', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'MODERADA_60D', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'CRITICA_30D', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'EXPIRADO', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'PREVENTIVA_90D', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'MODERADA_60D', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'CRITICA_30D', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'EXPIRADO', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'PREVENTIVA_90D', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'MODERADA_60D', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'CRITICA_30D', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'EXPIRADO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'PREVENTIVA_90D', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'MODERADA_60D', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'CRITICA_30D', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'EXPIRADO', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'PREVENTIVA_90D', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'MODERADA_60D', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'CRITICA_30D', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'EXPIRADO', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'PREVENTIVA_90D', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'MODERADA_60D', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'CRITICA_30D', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'EXPIRADO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'PREVENTIVA_90D', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'MODERADA_60D', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'CRITICA_30D', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'EXPIRADO', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'PREVENTIVA_90D', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'MODERADA_60D', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.alertas_caducidad_proxima OFF;
GO

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria ON;
INSERT INTO wms.mermas_destruccion_sanitaria (id_merma_destruccion, folio_acta_destruccion, lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ACTA_-2026-0001', 1, 8, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ACTA_-2026-0002', 2, 11, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ACTA_-2026-0003', 3, 14, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ACTA_-2026-0004', 4, 17, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ACTA_-2026-0005', 5, 20, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ACTA_-2026-0006', 6, 23, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ACTA_-2026-0007', 7, 26, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ACTA_-2026-0008', 8, 29, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ACTA_-2026-0009', 9, 32, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ACTA_-2026-0010', 10, 35, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ACTA_-2026-0011', 11, 38, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ACTA_-2026-0012', 12, 41, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ACTA_-2026-0013', 13, 44, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ACTA_-2026-0014', 14, 47, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ACTA_-2026-0015', 15, 50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ACTA_-2026-0016', 16, 53, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ACTA_-2026-0017', 17, 56, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ACTA_-2026-0018', 18, 59, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ACTA_-2026-0019', 19, 62, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ACTA_-2026-0020', 20, 65, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ACTA_-2026-0021', 21, 68, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ACTA_-2026-0022', 22, 71, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ACTA_-2026-0023', 23, 74, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ACTA_-2026-0024', 24, 77, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ACTA_-2026-0025', 25, 80, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ACTA_-2026-0026', 26, 83, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ACTA_-2026-0027', 27, 86, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ACTA_-2026-0028', 28, 89, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ACTA_-2026-0029', 29, 92, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ACTA_-2026-0030', 30, 95, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria OFF;
GO

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_almacenes ON;
INSERT INTO wms.transferencias_almacenes (id_transferencia, folio_transferencia, almacen_origen, almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 1, N'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 2, N'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 3, N'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 4, N'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 5, N'SOLICITADA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 6, N'EN_TRANSITO', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 7, N'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 8, N'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 9, N'SOLICITADA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 10, N'EN_TRANSITO', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 11, N'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 12, N'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 13, N'SOLICITADA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 14, N'EN_TRANSITO', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 15, N'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 16, N'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 17, N'SOLICITADA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 18, N'EN_TRANSITO', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 19, N'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 20, N'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 21, N'SOLICITADA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 22, N'EN_TRANSITO', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 23, N'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 24, N'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 25, N'SOLICITADA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 26, N'EN_TRANSITO', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 27, N'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 28, N'DISCREPANCIA', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 29, N'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 30, N'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.transferencias_almacenes OFF;
GO

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_detalles ON;
INSERT INTO wms.transferencias_detalles (id_transferencia_detalle, transferencia, lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.conteos_ciclicos_auditoria (id_conteo_ciclico, folio_auditoria, almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.conteos_ciclicos_detalles (id_conteo_detalle, conteo_ciclico, inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.conteos_ciclicos_detalles OFF;
GO

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad ON;
INSERT INTO wms.monitoreo_temperatura_humedad (id_telemetria_sensor, zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SENSOR_I_01', 17.50, 17.50, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SENSOR_I_02', 20.00, 20.00, 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SENSOR_I_03', 22.50, 22.50, 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SENSOR_I_04', 25.00, 25.00, 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SENSOR_I_05', 27.50, 27.50, 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SENSOR_I_06', 30.00, 30.00, 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SENSOR_I_07', 32.50, 32.50, 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SENSOR_I_08', 35.00, 35.00, 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SENSOR_I_09', 37.50, 37.50, 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SENSOR_I_10', 40.00, 40.00, 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SENSOR_I_11', 42.50, 42.50, 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SENSOR_I_12', 45.00, 45.00, 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SENSOR_I_13', 47.50, 47.50, 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SENSOR_I_14', 50.00, 50.00, 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SENSOR_I_15', 52.50, 52.50, 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SENSOR_I_16', 55.00, 55.00, 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SENSOR_I_17', 57.50, 57.50, 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SENSOR_I_18', 60.00, 60.00, 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SENSOR_I_19', 62.50, 62.50, 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SENSOR_I_20', 65.00, 65.00, 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SENSOR_I_21', 67.50, 67.50, 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SENSOR_I_22', 70.00, 70.00, 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SENSOR_I_23', 72.50, 72.50, 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SENSOR_I_24', 75.00, 75.00, 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SENSOR_I_25', 77.50, 77.50, 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SENSOR_I_26', 80.00, 80.00, 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SENSOR_I_27', 82.50, 82.50, 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SENSOR_I_28', 85.00, 85.00, 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SENSOR_I_29', 87.50, 87.50, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SENSOR_I_30', 90.00, 90.00, 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad OFF;
GO

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.transportistas_paqueterias ON;
INSERT INTO envios.transportistas_paqueterias (id_transportista, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'TRANSPOR_01', N'Kit Rutina La Roche-Posay #1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'TRANSPOR_02', N'Kit Rutina CeraVe Dermatological #2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'TRANSPOR_03', N'Kit Rutina The Ordinary Deciem #3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'TRANSPOR_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'TRANSPOR_05', N'Kit Rutina Bioderma Laboratoire #5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TRANSPOR_06', N'Kit Rutina Eau Thermale Avène #6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'TRANSPOR_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'TRANSPOR_08', N'Kit Rutina Vichy Laboratoires #8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'TRANSPOR_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'TRANSPOR_10', N'Kit Rutina Sesderma Nanotech #10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'TRANSPOR_11', N'Kit Rutina NARS Cosmetics #11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'TRANSPOR_12', N'Kit Rutina MAC Professional #12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'TRANSPOR_13', N'Kit Rutina Fenty Beauty #13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'TRANSPOR_14', N'Kit Rutina Rare Beauty #14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'TRANSPOR_15', N'Kit Rutina Clinique Laboratories #15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'TRANSPOR_16', N'Kit Rutina Estée Lauder #16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'TRANSPOR_17', N'Kit Rutina Lancôme Paris #17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'TRANSPOR_18', N'Kit Rutina Charlotte Tilbury #18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'TRANSPOR_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'TRANSPOR_20', N'Kit Rutina COSRX K-Beauty #20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'TRANSPOR_21', N'Kit Rutina Laneige Amorepacific #21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'TRANSPOR_22', N'Kit Rutina Uriage Eau Thermale #22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'TRANSPOR_23', N'Kit Rutina Laboratoire SVR #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'TRANSPOR_24', N'Kit Rutina MartiDerm Ampollas #24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'TRANSPOR_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'TRANSPOR_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'TRANSPOR_27', N'Kit Rutina Garnier SkinActive #27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'TRANSPOR_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TRANSPOR_29', N'Kit Rutina Neutrogena Derm #29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'TRANSPOR_30', N'Kit Rutina DermaCare Labs México #30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.transportistas_paqueterias OFF;
GO

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tipos_servicio_envio ON;
INSERT INTO envios.tipos_servicio_envio (id_servicio_envio, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SERVICIO_01', N'Zona Refrigerada B-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SERVICIO_02', N'Zona Refrigerada B-02', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SERVICIO_03', N'Zona Refrigerada B-03', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SERVICIO_04', N'Zona Refrigerada B-04', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SERVICIO_05', N'Zona Refrigerada B-05', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'SERVICIO_06', N'Zona Refrigerada B-06', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'SERVICIO_07', N'Zona Refrigerada B-07', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'SERVICIO_08', N'Zona Refrigerada B-08', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'SERVICIO_09', N'Zona Refrigerada B-09', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'SERVICIO_10', N'Zona Refrigerada B-10', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'SERVICIO_11', N'Zona Refrigerada B-11', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'SERVICIO_12', N'Zona Refrigerada B-12', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'SERVICIO_13', N'Zona Refrigerada B-13', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'SERVICIO_14', N'Zona Refrigerada B-14', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'SERVICIO_15', N'Zona Refrigerada B-15', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'SERVICIO_16', N'Zona Refrigerada B-16', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'SERVICIO_17', N'Zona Refrigerada B-17', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'SERVICIO_18', N'Zona Refrigerada B-18', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'SERVICIO_19', N'Zona Refrigerada B-19', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'SERVICIO_20', N'Zona Refrigerada B-20', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'SERVICIO_21', N'Zona Refrigerada B-21', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'SERVICIO_22', N'Zona Refrigerada B-22', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'SERVICIO_23', N'Zona Refrigerada B-23', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'SERVICIO_24', N'Zona Refrigerada B-24', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'SERVICIO_25', N'Zona Refrigerada B-25', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'SERVICIO_26', N'Zona Refrigerada B-26', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'SERVICIO_27', N'Zona Refrigerada B-27', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'SERVICIO_28', N'Zona Refrigerada B-28', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'SERVICIO_29', N'Zona Refrigerada B-29', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'SERVICIO_30', N'Zona Refrigerada B-30', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tipos_servicio_envio OFF;
GO

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tarifas_zonas_postales ON;
INSERT INTO envios.tarifas_zonas_postales (id_tarifa_zona, transportista, servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'POS', N'POS', 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'POS', N'POS', 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'POS', N'POS', 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'POS', N'POS', 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'POS', N'POS', 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'POS', N'POS', 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'POS', N'POS', 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'POS', N'POS', 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'POS', N'POS', 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'POS', N'POS', 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'POS', N'POS', 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'POS', N'POS', 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'POS', N'POS', 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'POS', N'POS', 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'POS', N'POS', 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'POS', N'POS', 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'POS', N'POS', 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'POS', N'POS', 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'POS', N'POS', 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'POS', N'POS', 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'POS', N'POS', 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'POS', N'POS', 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'POS', N'POS', 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'POS', N'POS', 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'POS', N'POS', 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'POS', N'POS', 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'POS', N'POS', 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'POS', N'POS', 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'POS', N'POS', 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'POS', N'POS', 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tarifas_zonas_postales OFF;
GO

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.despachos_orden ON;
INSERT INTO envios.despachos_orden (id_despacho, folio_despacho, orden_split, transportista, servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-DESPA-2026-0001', 1, 1, 1, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', '2026-02-03 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', '2026-02-04 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-05 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', '2026-02-06 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-DESPA-2026-0007', 7, 7, 7, '2026-02-07 11:30:00', '2026-03-07', '2026-02-07 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', '2026-02-08 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', '2026-02-09 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', '2026-02-10 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-11 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', '2026-02-12 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-DESPA-2026-0013', 13, 13, 13, '2026-02-13 11:30:00', '2026-03-13', '2026-02-13 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', '2026-02-14 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', '2026-02-15 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', '2026-02-16 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-17 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', '2026-02-18 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-DESPA-2026-0019', 19, 19, 19, '2026-02-19 11:30:00', '2026-03-19', '2026-02-19 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', '2026-02-20 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', '2026-02-21 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', '2026-02-22 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-23 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', '2026-02-24 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-DESPA-2026-0025', 25, 25, 25, '2026-02-25 11:30:00', '2026-03-25', '2026-02-25 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', '2026-02-26 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', '2026-02-27 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', '2026-02-28 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', N'INCIDENCIA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.despachos_orden OFF;
GO

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_bultos ON;
INSERT INTO envios.paquetes_bultos (id_paquete_bulto, despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'DERMA-SKU-1001', 0.60, 13.0, 13.0, 13.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'DERMA-SKU-1002', 0.75, 14.0, 14.0, 14.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'DERMA-SKU-1003', 0.90, 15.0, 15.0, 15.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DERMA-SKU-1004', 1.05, 16.0, 16.0, 16.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'DERMA-SKU-1005', 1.20, 17.0, 17.0, 17.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'DERMA-SKU-1006', 1.35, 18.0, 18.0, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'DERMA-SKU-1007', 1.50, 19.0, 19.0, 19.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DERMA-SKU-1008', 1.65, 20.0, 20.0, 20.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'DERMA-SKU-1009', 1.80, 21.0, 21.0, 21.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'DERMA-SKU-1010', 1.95, 22.0, 22.0, 22.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'DERMA-SKU-1011', 2.10, 23.0, 23.0, 23.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DERMA-SKU-1012', 2.25, 24.0, 24.0, 24.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'DERMA-SKU-1013', 2.40, 25.0, 25.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'DERMA-SKU-1014', 2.55, 26.0, 26.0, 26.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'DERMA-SKU-1015', 2.70, 27.0, 27.0, 27.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DERMA-SKU-1016', 2.85, 28.0, 28.0, 28.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'DERMA-SKU-1017', 3.00, 29.0, 29.0, 29.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'DERMA-SKU-1018', 3.15, 30.0, 30.0, 30.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'DERMA-SKU-1019', 3.30, 31.0, 31.0, 31.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DERMA-SKU-1020', 3.45, 32.0, 32.0, 32.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'DERMA-SKU-1021', 3.60, 33.0, 33.0, 33.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'DERMA-SKU-1022', 3.75, 34.0, 34.0, 34.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'DERMA-SKU-1023', 3.90, 35.0, 35.0, 35.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DERMA-SKU-1024', 4.05, 36.0, 36.0, 36.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'DERMA-SKU-1025', 4.20, 37.0, 37.0, 37.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'DERMA-SKU-1026', 4.35, 38.0, 38.0, 38.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'DERMA-SKU-1027', 4.50, 39.0, 39.0, 39.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DERMA-SKU-1028', 4.65, 40.0, 40.0, 40.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'DERMA-SKU-1029', 4.80, 41.0, 41.0, 41.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'DERMA-SKU-1030', 4.95, 42.0, 42.0, 42.0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.paquetes_bultos OFF;
GO

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_contenido_lotes ON;
INSERT INTO envios.paquetes_contenido_lotes (id_contenido_paquete, paquete_bulto, orden_detalle, lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO envios.guias_rastreo (id_guia_rastreo, paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'DERMA-SKU-1001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'DERMA-SKU-1002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'DERMA-SKU-1003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DERMA-SKU-1004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'DERMA-SKU-1005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'DERMA-SKU-1006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'DERMA-SKU-1007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DERMA-SKU-1008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'DERMA-SKU-1009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'DERMA-SKU-1010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'DERMA-SKU-1011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DERMA-SKU-1012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'DERMA-SKU-1013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'DERMA-SKU-1014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'DERMA-SKU-1015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DERMA-SKU-1016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'DERMA-SKU-1017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'DERMA-SKU-1018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'DERMA-SKU-1019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DERMA-SKU-1020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'DERMA-SKU-1021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'DERMA-SKU-1022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'DERMA-SKU-1023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DERMA-SKU-1024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'DERMA-SKU-1025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'DERMA-SKU-1026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'DERMA-SKU-1027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DERMA-SKU-1028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'DERMA-SKU-1029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'DERMA-SKU-1030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.guias_rastreo OFF;
GO

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.eventos_tracking_bitacora ON;
INSERT INTO envios.eventos_tracking_bitacora (id_evento_tracking, guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ESTATUS__01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ESTATUS__02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ESTATUS__03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ESTATUS__04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ESTATUS__05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ESTATUS__06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ESTATUS__07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ESTATUS__08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ESTATUS__09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ESTATUS__10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ESTATUS__11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ESTATUS__12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ESTATUS__13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ESTATUS__14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ESTATUS__15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ESTATUS__16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ESTATUS__17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ESTATUS__18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ESTATUS__19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ESTATUS__20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ESTATUS__21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ESTATUS__22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ESTATUS__23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ESTATUS__24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ESTATUS__25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ESTATUS__26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ESTATUS__27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ESTATUS__28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ESTATUS__29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ESTATUS__30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.eventos_tracking_bitacora OFF;
GO

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.intentos_entrega_fallidos ON;
INSERT INTO envios.intentos_entrega_fallidos (id_intento_fallido, despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.intentos_entrega_fallidos OFF;
GO

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.incidencias_logisticas ON;
INSERT INTO envios.incidencias_logisticas (id_incidencia_logistica, despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EXTRAVIO_TOTAL', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAQUETE_DANADO_DERRAME', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ROBO_EN_TRANSITO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DIRECCION_INEXISTENTE', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EXTRAVIO_TOTAL', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PAQUETE_DANADO_DERRAME', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ROBO_EN_TRANSITO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DIRECCION_INEXISTENTE', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EXTRAVIO_TOTAL', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PAQUETE_DANADO_DERRAME', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ROBO_EN_TRANSITO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DIRECCION_INEXISTENTE', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EXTRAVIO_TOTAL', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAQUETE_DANADO_DERRAME', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ROBO_EN_TRANSITO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DIRECCION_INEXISTENTE', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EXTRAVIO_TOTAL', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PAQUETE_DANADO_DERRAME', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ROBO_EN_TRANSITO', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DIRECCION_INEXISTENTE', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EXTRAVIO_TOTAL', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PAQUETE_DANADO_DERRAME', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ROBO_EN_TRANSITO', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DIRECCION_INEXISTENTE', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EXTRAVIO_TOTAL', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAQUETE_DANADO_DERRAME', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ROBO_EN_TRANSITO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DIRECCION_INEXISTENTE', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EXTRAVIO_TOTAL', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PAQUETE_DANADO_DERRAME', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.incidencias_logisticas OFF;
GO

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.seguros_mercancia ON;
INSERT INTO envios.seguros_mercancia (id_seguro_envio, despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.seguros_mercancia OFF;
GO

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup ON;
INSERT INTO envios.puntos_recoleccion_pickup (id_punto_pickup, transportista, almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'LOCKER_01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'LOCKER_02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'LOCKER_03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'LOCKER_04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'LOCKER_05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'LOCKER_06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'LOCKER_07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'LOCKER_08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'LOCKER_09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'LOCKER_10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'LOCKER_11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'LOCKER_12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'LOCKER_13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'LOCKER_14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'LOCKER_15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'LOCKER_16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'LOCKER_17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'LOCKER_18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'LOCKER_19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'LOCKER_20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'LOCKER_21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'LOCKER_22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'LOCKER_23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'LOCKER_24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'LOCKER_25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'LOCKER_26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'LOCKER_27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'LOCKER_28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'LOCKER_29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'LOCKER_30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup OFF;
GO

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.motivos_devolucion_rma ON;
INSERT INTO postventa.motivos_devolucion_rma (id_motivo_rma, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
SET IDENTITY_INSERT postventa.motivos_devolucion_rma OFF;
GO

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.solicitudes_rma ON;
INSERT INTO postventa.solicitudes_rma (id_solicitud_rma, folio_rma, orden, motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RMA-2026-0001', 1, 1, N'SOLICITADA', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RMA-2026-0002', 2, 2, N'GUIA_RETORNO_EMITIDA', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RMA-2026-0003', 3, 3, N'RECIBIDA_EN_QA', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RMA-2026-0004', 4, 4, N'APROBADA_REEMBOLSAR', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RMA-2026-0005', 5, 5, N'SOLICITADA', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RMA-2026-0006', 6, 6, N'GUIA_RETORNO_EMITIDA', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RMA-2026-0007', 7, 7, N'RECIBIDA_EN_QA', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RMA-2026-0008', 8, 8, N'APROBADA_REEMBOLSAR', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RMA-2026-0009', 9, 9, N'SOLICITADA', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RMA-2026-0010', 10, 10, N'GUIA_RETORNO_EMITIDA', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RMA-2026-0011', 11, 11, N'RECIBIDA_EN_QA', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RMA-2026-0012', 12, 12, N'APROBADA_REEMBOLSAR', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RMA-2026-0013', 13, 13, N'SOLICITADA', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RMA-2026-0014', 14, 14, N'GUIA_RETORNO_EMITIDA', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RMA-2026-0015', 15, 15, N'RECIBIDA_EN_QA', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RMA-2026-0016', 16, 16, N'APROBADA_REEMBOLSAR', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RMA-2026-0017', 17, 17, N'SOLICITADA', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RMA-2026-0018', 18, 18, N'GUIA_RETORNO_EMITIDA', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RMA-2026-0019', 19, 19, N'RECIBIDA_EN_QA', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RMA-2026-0020', 20, 20, N'APROBADA_REEMBOLSAR', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RMA-2026-0021', 21, 21, N'SOLICITADA', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RMA-2026-0022', 22, 22, N'GUIA_RETORNO_EMITIDA', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RMA-2026-0023', 23, 23, N'RECIBIDA_EN_QA', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RMA-2026-0024', 24, 24, N'APROBADA_REEMBOLSAR', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RMA-2026-0025', 25, 25, N'SOLICITADA', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RMA-2026-0026', 26, 26, N'GUIA_RETORNO_EMITIDA', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RMA-2026-0027', 27, 27, N'RECIBIDA_EN_QA', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RMA-2026-0028', 28, 28, N'APROBADA_REEMBOLSAR', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RMA-2026-0029', 29, 29, N'SOLICITADA', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RMA-2026-0030', 30, 30, N'GUIA_RETORNO_EMITIDA', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.solicitudes_rma OFF;
GO

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.rma_detalles ON;
INSERT INTO postventa.rma_detalles (id_rma_detalle, solicitud_rma, orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO postventa.inspeccion_sanitaria_retorno (id_inspeccion_retorno, rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 17.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 20.00, N'DONACION_REACONDICIONADA', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 22.50, N'REINGRESO_STOCK_SELLADO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 25.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 27.50, N'DONACION_REACONDICIONADA', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 30.00, N'REINGRESO_STOCK_SELLADO', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 32.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 35.00, N'DONACION_REACONDICIONADA', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 37.50, N'REINGRESO_STOCK_SELLADO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 40.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 42.50, N'DONACION_REACONDICIONADA', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 45.00, N'REINGRESO_STOCK_SELLADO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 47.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 50.00, N'DONACION_REACONDICIONADA', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 52.50, N'REINGRESO_STOCK_SELLADO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 55.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 57.50, N'DONACION_REACONDICIONADA', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 60.00, N'REINGRESO_STOCK_SELLADO', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 65.00, N'DONACION_REACONDICIONADA', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 67.50, N'REINGRESO_STOCK_SELLADO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 70.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 72.50, N'DONACION_REACONDICIONADA', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 75.00, N'REINGRESO_STOCK_SELLADO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 77.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 80.00, N'DONACION_REACONDICIONADA', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 82.50, N'REINGRESO_STOCK_SELLADO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 85.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 87.50, N'DONACION_REACONDICIONADA', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 90.00, N'REINGRESO_STOCK_SELLADO', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno OFF;
GO

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_soporte ON;
INSERT INTO postventa.tickets_soporte (id_ticket, folio_ticket, cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TICKE-2026-0001', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TICKE-2026-0002', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TICKE-2026-0003', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TICKE-2026-0004', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TICKE-2026-0005', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TICKE-2026-0006', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TICKE-2026-0007', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TICKE-2026-0008', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TICKE-2026-0009', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TICKE-2026-0010', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TICKE-2026-0011', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'FACTURACION_CFDI', N'ALTA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TICKE-2026-0012', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TICKE-2026-0013', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'ENVIO_DEMORADO', N'BAJA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TICKE-2026-0014', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TICKE-2026-0015', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'FACTURACION_CFDI', N'ALTA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TICKE-2026-0016', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TICKE-2026-0017', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'ENVIO_DEMORADO', N'BAJA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TICKE-2026-0018', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TICKE-2026-0019', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'FACTURACION_CFDI', N'ALTA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TICKE-2026-0020', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TICKE-2026-0021', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TICKE-2026-0022', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TICKE-2026-0023', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TICKE-2026-0024', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TICKE-2026-0025', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TICKE-2026-0026', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TICKE-2026-0027', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TICKE-2026-0028', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TICKE-2026-0029', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TICKE-2026-0030', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_soporte OFF;
GO

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_mensajes ON;
INSERT INTO postventa.tickets_mensajes (id_ticket_mensaje, ticket, usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_mensajes OFF;
GO

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia ON;
INSERT INTO postventa.reportes_farmacovigilancia (id_reporte_farmacovigilancia, folio_cofepris_ram, cliente, producto, lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-COFEP-2026-0001', 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-COFEP-2026-0002', 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, '2026-03-02', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-COFEP-2026-0003', 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-03-03', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-COFEP-2026-0004', 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, '2026-03-04', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-COFEP-2026-0005', 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-03-05', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-COFEP-2026-0006', 6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, '2026-03-06', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-COFEP-2026-0007', 7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-03-07', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-COFEP-2026-0008', 8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, '2026-03-08', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-COFEP-2026-0009', 9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-03-09', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-COFEP-2026-0010', 10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, '2026-03-10', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-COFEP-2026-0011', 11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-03-11', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-COFEP-2026-0012', 12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, '2026-03-12', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-COFEP-2026-0013', 13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-03-13', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-COFEP-2026-0014', 14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, '2026-03-14', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-COFEP-2026-0015', 15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-03-15', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-COFEP-2026-0016', 16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, '2026-03-16', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-COFEP-2026-0017', 17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-03-17', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-COFEP-2026-0018', 18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, '2026-03-18', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-COFEP-2026-0019', 19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-03-19', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-COFEP-2026-0020', 20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, '2026-03-20', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-COFEP-2026-0021', 21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-03-21', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-COFEP-2026-0022', 22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, '2026-03-22', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-COFEP-2026-0023', 23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-03-23', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-COFEP-2026-0024', 24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, '2026-03-24', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-COFEP-2026-0025', 25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-03-25', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-COFEP-2026-0026', 26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, '2026-03-26', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-COFEP-2026-0027', 27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-03-27', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-COFEP-2026-0028', 28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, '2026-03-28', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-COFEP-2026-0029', 29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-COFEP-2026-0030', 30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2026-03-02', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia OFF;
GO

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.tipos_evento_sistema ON;
INSERT INTO auditoria.tipos_evento_sistema (id_tipo_evento, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'EVENTO_01', N'Sueros Concentrados Nivel 1', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'EVENTO_02', N'Limpiadores Faciales Nivel 2', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'EVENTO_03', N'Fotoprotección Solar Nivel 3', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'EVENTO_04', N'Maquillaje Mineral Nivel 4', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'EVENTO_05', N'Cuidado Anti-Edad Nivel 5', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'EVENTO_06', N'Barrera Cutánea Nivel 6', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'EVENTO_07', N'Contorno de Ojos Nivel 7', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'EVENTO_08', N'Tratamiento Acné Nivel 8', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'EVENTO_09', N'Hidratantes Ceramidas Nivel 9', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'EVENTO_10', N'Exfoliantes Químicos Nivel 10', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'EVENTO_11', N'Sueros Concentrados Nivel 11', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'EVENTO_12', N'Limpiadores Faciales Nivel 12', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'EVENTO_13', N'Fotoprotección Solar Nivel 13', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'EVENTO_14', N'Maquillaje Mineral Nivel 14', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'EVENTO_15', N'Cuidado Anti-Edad Nivel 15', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'EVENTO_16', N'Barrera Cutánea Nivel 16', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'EVENTO_17', N'Contorno de Ojos Nivel 17', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'EVENTO_18', N'Tratamiento Acné Nivel 18', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'EVENTO_19', N'Hidratantes Ceramidas Nivel 19', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'EVENTO_20', N'Exfoliantes Químicos Nivel 20', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'EVENTO_21', N'Sueros Concentrados Nivel 21', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'EVENTO_22', N'Limpiadores Faciales Nivel 22', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'EVENTO_23', N'Fotoprotección Solar Nivel 23', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'EVENTO_24', N'Maquillaje Mineral Nivel 24', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'EVENTO_25', N'Cuidado Anti-Edad Nivel 25', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'EVENTO_26', N'Barrera Cutánea Nivel 26', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'EVENTO_27', N'Contorno de Ojos Nivel 27', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'EVENTO_28', N'Tratamiento Acné Nivel 28', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'EVENTO_29', N'Hidratantes Ceramidas Nivel 29', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'EVENTO_30', N'Exfoliantes Químicos Nivel 30', N'CRITICO_SEGURIDAD', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.tipos_evento_sistema OFF;
GO

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global ON;
INSERT INTO auditoria.bitacora_seguridad_global (id_log_seguridad, tipo_evento, usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'189.203.3.7', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'189.203.6.14', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'189.203.9.21', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'189.203.12.28', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'189.203.15.35', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'189.203.18.42', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'189.203.21.49', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'189.203.24.56', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'189.203.27.63', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'189.203.30.70', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'189.203.33.77', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'189.203.36.84', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'189.203.39.91', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'189.203.42.98', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'189.203.45.105', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'189.203.48.112', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'189.203.51.119', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'189.203.54.126', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'189.203.57.133', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'189.203.60.140', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'189.203.63.147', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'189.203.66.154', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'189.203.69.161', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'189.203.72.168', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'189.203.75.175', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'189.203.78.182', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'189.203.81.189', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'189.203.84.196', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'189.203.87.203', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'189.203.90.210', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global OFF;
GO

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_cambios_datos ON;
INSERT INTO auditoria.bitacora_cambios_datos (id_cambio_dato, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO sistema.parametros_configuracion (id_parametro, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PARAMETR_01', N'31', N'STRING', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PARAMETR_02', N'32', N'INTEGER', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PARAMETR_03', N'33', N'DECIMAL', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PARAMETR_04', N'34', N'BOOLEAN', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PARAMETR_05', N'35', N'JSON', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PARAMETR_06', N'36', N'STRING', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PARAMETR_07', N'37', N'INTEGER', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PARAMETR_08', N'38', N'DECIMAL', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PARAMETR_09', N'39', N'BOOLEAN', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PARAMETR_10', N'40', N'JSON', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PARAMETR_11', N'41', N'STRING', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PARAMETR_12', N'42', N'INTEGER', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PARAMETR_13', N'43', N'DECIMAL', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PARAMETR_14', N'44', N'BOOLEAN', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PARAMETR_15', N'45', N'JSON', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PARAMETR_16', N'46', N'STRING', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PARAMETR_17', N'47', N'INTEGER', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PARAMETR_18', N'48', N'DECIMAL', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PARAMETR_19', N'49', N'BOOLEAN', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PARAMETR_20', N'50', N'JSON', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PARAMETR_21', N'51', N'STRING', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PARAMETR_22', N'52', N'INTEGER', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PARAMETR_23', N'53', N'DECIMAL', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PARAMETR_24', N'54', N'BOOLEAN', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PARAMETR_25', N'55', N'JSON', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PARAMETR_26', N'56', N'STRING', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PARAMETR_27', N'57', N'INTEGER', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PARAMETR_28', N'58', N'DECIMAL', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PARAMETR_29', N'59', N'BOOLEAN', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PARAMETR_30', N'60', N'JSON', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.parametros_configuracion OFF;
GO

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT sistema.notificaciones_push_email ON;
INSERT INTO sistema.notificaciones_push_email (id_notificacion, usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EMAIL', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', 1, '2026-02-01 11:30:00', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PUSH_APP', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', 0, '2026-02-02 11:30:00', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SMS', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', 1, '2026-02-03 11:30:00', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'WHATSAPP', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', 0, '2026-02-04 11:30:00', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EMAIL', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', 1, '2026-02-05 11:30:00', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PUSH_APP', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', 0, '2026-02-06 11:30:00', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SMS', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', 1, '2026-02-07 11:30:00', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'WHATSAPP', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', 0, '2026-02-08 11:30:00', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EMAIL', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', 1, '2026-02-09 11:30:00', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PUSH_APP', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', 0, '2026-02-10 11:30:00', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SMS', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', 1, '2026-02-11 11:30:00', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'WHATSAPP', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', 0, '2026-02-12 11:30:00', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EMAIL', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', 1, '2026-02-13 11:30:00', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PUSH_APP', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', 0, '2026-02-14 11:30:00', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SMS', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', 1, '2026-02-15 11:30:00', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'WHATSAPP', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', 0, '2026-02-16 11:30:00', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EMAIL', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', 1, '2026-02-17 11:30:00', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PUSH_APP', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', 0, '2026-02-18 11:30:00', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SMS', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', 1, '2026-02-19 11:30:00', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'WHATSAPP', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', 0, '2026-02-20 11:30:00', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EMAIL', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', 1, '2026-02-21 11:30:00', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PUSH_APP', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', 0, '2026-02-22 11:30:00', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SMS', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', 1, '2026-02-23 11:30:00', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'WHATSAPP', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', 0, '2026-02-24 11:30:00', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EMAIL', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', 1, '2026-02-25 11:30:00', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PUSH_APP', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', 0, '2026-02-26 11:30:00', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SMS', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', 1, '2026-02-27 11:30:00', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'WHATSAPP', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', 0, '2026-02-28 11:30:00', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EMAIL', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', 1, '2026-02-01 11:30:00', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PUSH_APP', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', 0, '2026-02-02 11:30:00', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.notificaciones_push_email OFF;
GO

PRINT '>>> SUBMÓDULO 3: Tablas 101 a 150 pobladas exitosamente.';
GO
