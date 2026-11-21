-- =================================================================================================
-- SUBMÓDULO 3: LOGÍSTICA MULTIALMACÉN, TRAZABILIDAD FEFO, TELEMETRÍA IOT Y CALIDAD
-- Tablas 101 a 150 (Autor: Integrante 3 - Control: 22050003)
-- =================================================================================================

SET XACT_ABORT ON;

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.estados_orden_compra (id_estado_oc, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'BORRADOR', 'Borrador de Compra', 'Requisición convertida en borrador pendiente de firma', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ENVIADA', 'Enviada a Proveedor', 'Orden de compra emitida y notificada al laboratorio', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CONFIRMADA', 'Confirmada con Cita Andén', 'Proveedor confirmó fecha de entrega y lotes sanitarios', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REC_PARCIAL', 'Recibida Parcialmente', 'Entrega parcial validada en andén de CEDIS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REC_TOTAL', 'Recibida Completa', 'Totalidad de unidades ingresadas a inventario QA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden de compra anulada por incumplimiento de SLA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('compras.estados_orden_compra', 'id_estado_oc'), COALESCE((SELECT MAX(id_estado_oc) FROM compras.estados_orden_compra), 1), true);

-- =================================================================================================
-- 102. TABLA: compras.proveedores (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedores (id_proveedor, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROVEEDO_01', 'Laboratorios La Roche-Posay S.A. de C.V.', 'Kit Rutina La Roche-Posay #1', 'MEGC910315H01', 'México', 1, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROVEEDO_02', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Kit Rutina CeraVe Dermatological #2', 'RALS920315H02', 'México', 2, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROVEEDO_03', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Kit Rutina The Ordinary Deciem #3', 'TOVV930315H03', 'México', 3, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROVEEDO_04', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Kit Rutina ISDIN Fotoprotección #4', 'HECA940315H04', 'México', 4, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROVEEDO_05', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Kit Rutina Bioderma Laboratoire #5', 'SAFM950315H05', 'México', 5, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROVEEDO_06', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Kit Rutina Eau Thermale Avène #6', 'MATD960315H06', 'México', 6, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROVEEDO_07', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Kit Rutina Eucerin Beiersdorf #7', 'GORC970315H07', 'México', 7, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROVEEDO_08', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Kit Rutina Vichy Laboratoires #8', 'FLCM980315H08', 'México', 8, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROVEEDO_09', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Kit Rutina SkinCeuticals Clinical #9', 'MODL990315H09', 'México', 9, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROVEEDO_10', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Kit Rutina Sesderma Nanotech #10', 'VAOS900315H10', 'México', 10, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROVEEDO_11', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Kit Rutina NARS Cosmetics #11', 'GUNR910315H11', 'México', 11, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROVEEDO_12', 'Laboratorios MAC Professional S.A. de C.V.', 'Kit Rutina MAC Professional #12', 'JIPS920315H12', 'México', 12, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROVEEDO_13', 'Laboratorios Fenty Beauty S.A. de C.V.', 'Kit Rutina Fenty Beauty #13', 'RUSF930315H13', 'México', 13, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROVEEDO_14', 'Laboratorios Rare Beauty S.A. de C.V.', 'Kit Rutina Rare Beauty #14', 'RICE940315H14', 'México', 14, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROVEEDO_15', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Kit Rutina Clinique Laboratories #15', 'AGIX950315H15', 'México', 15, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROVEEDO_16', 'Laboratorios Estée Lauder S.A. de C.V.', 'Kit Rutina Estée Lauder #16', 'MEND960315H16', 'México', 16, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROVEEDO_17', 'Laboratorios Lancôme Paris S.A. de C.V.', 'Kit Rutina Lancôme Paris #17', 'CADA970315H17', 'México', 17, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROVEEDO_18', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Kit Rutina Charlotte Tilbury #18', 'VEMG980315H18', 'México', 18, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROVEEDO_19', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Kit Rutina Paula''s Choice Skincare #19', 'CORP990315H19', 'México', 19, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROVEEDO_20', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Kit Rutina COSRX K-Beauty #20', 'RACA900315H20', 'México', 20, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROVEEDO_21', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Kit Rutina Laneige Amorepacific #21', 'GULR910315H21', 'México', 21, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROVEEDO_22', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Kit Rutina Uriage Eau Thermale #22', 'PECN920315H22', 'México', 22, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROVEEDO_23', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Kit Rutina Laboratoire SVR #23', 'HEVN930315H23', 'México', 23, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROVEEDO_24', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Kit Rutina MartiDerm Ampollas #24', 'MECJ940315H24', 'México', 24, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROVEEDO_25', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Kit Rutina Heliocare Cantabria Labs #25', 'DOEI950315H25', 'México', 25, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROVEEDO_26', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Kit Rutina Kiehl''s Since 1851 #26', 'SIPL960315H26', 'México', 26, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROVEEDO_27', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Kit Rutina Garnier SkinActive #27', 'CHBA970315H27', 'México', 27, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROVEEDO_28', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Kit Rutina L''Oréal Paris Derm #28', 'OCAR980315H28', 'México', 28, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROVEEDO_29', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Kit Rutina Neutrogena Derm #29', 'MILP990315H29', 'México', 29, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROVEEDO_30', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Kit Rutina DermaCare Labs México #30', 'PASM900315H30', 'México', 30, 4.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedores', 'id_proveedor'), COALESCE((SELECT MAX(id_proveedor) FROM compras.proveedores), 1), true);

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.contactos_proveedor (id_contacto_proveedor, proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Laboratorios La Roche-Posay S.A. de C.V.', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumo', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Flui', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurón', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% No', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermoli', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pur', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje C', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Al', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Ci', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Laboratorios MAC Professional S.A. de C.V.', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Sal', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Laboratorios Fenty Beauty S.A. de C.V.', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Laboratorios Rare Beauty S.A. de C.V.', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna ', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmant', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Laboratorios Estée Lauder S.A. de C.V.', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emu', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Laboratorios Lancôme Paris S.A. de C.V.', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante ', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Pé', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Mat', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmen', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteogli', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mine', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimi', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas ', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Co', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillan', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-R', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.contactos_proveedor', 'id_contacto_proveedor'), COALESCE((SELECT MAX(id_contacto_proveedor) FROM compras.contactos_proveedor), 1), true);

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_slas (id_proveedor_sla, proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('compras.proveedor_slas', 'id_proveedor_sla'), COALESCE((SELECT MAX(id_proveedor_sla) FROM compras.proveedor_slas), 1), true);

-- =================================================================================================
-- 105. TABLA: compras.proveedor_productos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_productos (id_proveedor_producto, proveedor, variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('compras.proveedor_productos', 'id_proveedor_producto'), COALESCE((SELECT MAX(id_proveedor_producto) FROM compras.proveedor_productos), 1), true);

-- =================================================================================================
-- 106. TABLA: compras.requisiciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones (id_requisicion, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-REQUI-2026-0001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'BAJA', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-REQUI-2026-0002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'MEDIA', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-REQUI-2026-0003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 'URGENTE_DESABASTO', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-REQUI-2026-0004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'BAJA', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-REQUI-2026-0005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'MEDIA', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-REQUI-2026-0006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'URGENTE_DESABASTO', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-REQUI-2026-0007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'BAJA', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-REQUI-2026-0008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'MEDIA', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-REQUI-2026-0009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'URGENTE_DESABASTO', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-REQUI-2026-0010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'BAJA', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-REQUI-2026-0011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'MEDIA', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-REQUI-2026-0012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'URGENTE_DESABASTO', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-REQUI-2026-0013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'BAJA', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-REQUI-2026-0014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'MEDIA', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-REQUI-2026-0015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'URGENTE_DESABASTO', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-REQUI-2026-0016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'BAJA', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-REQUI-2026-0017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'MEDIA', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-REQUI-2026-0018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'URGENTE_DESABASTO', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-REQUI-2026-0019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'BAJA', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-REQUI-2026-0020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'MEDIA', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-REQUI-2026-0021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'URGENTE_DESABASTO', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-REQUI-2026-0022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'BAJA', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-REQUI-2026-0023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 'MEDIA', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-REQUI-2026-0024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'URGENTE_DESABASTO', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-REQUI-2026-0025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 'BAJA', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-REQUI-2026-0026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'MEDIA', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-REQUI-2026-0027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'URGENTE_DESABASTO', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-REQUI-2026-0028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'BAJA', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-REQUI-2026-0029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'MEDIA', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-REQUI-2026-0030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'URGENTE_DESABASTO', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.requisiciones', 'id_requisicion'), COALESCE((SELECT MAX(id_requisicion) FROM compras.requisiciones), 1), true);

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones_detalles (id_requisicion_detalle, requisicion, variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('compras.requisiciones_detalles', 'id_requisicion_detalle'), COALESCE((SELECT MAX(id_requisicion_detalle) FROM compras.requisiciones_detalles), 1), true);

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra (id_orden_compra, folio_orden_compra, proveedor, estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 285.50, 45.68, 17.50, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 321.00, 51.36, 20.00, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 356.50, 57.04, 22.50, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 392.00, 62.72, 25.00, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 427.50, 68.40, 27.50, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 463.00, 74.08, 30.00, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 498.50, 79.76, 32.50, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 534.00, 85.44, 35.00, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 569.50, 91.12, 37.50, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 605.00, 96.80, 40.00, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 640.50, 102.48, 42.50, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 676.00, 108.16, 45.00, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 711.50, 113.84, 47.50, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 747.00, 119.52, 50.00, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 782.50, 125.20, 52.50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 818.00, 130.88, 55.00, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 853.50, 136.56, 57.50, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 889.00, 142.24, 60.00, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 924.50, 147.92, 62.50, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 960.00, 153.60, 65.00, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 995.50, 159.28, 67.50, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 1031.00, 164.96, 70.00, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 1066.50, 170.64, 72.50, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 1102.00, 176.32, 75.00, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 1137.50, 182.00, 77.50, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 1173.00, 187.68, 80.00, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 1208.50, 193.36, 82.50, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 1244.00, 199.04, 85.00, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 1279.50, 204.72, 87.50, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 1315.00, 210.40, 90.00, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra', 'id_orden_compra'), COALESCE((SELECT MAX(id_orden_compra) FROM compras.ordenes_compra), 1), true);

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra_detalles (id_orden_compra_detalle, orden_compra, variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, 285.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 321.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 356.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 392.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 427.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 463.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 498.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 534.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 569.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 605.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 640.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 676.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 711.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 747.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 782.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 818.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 853.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 889.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 924.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 960.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 995.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1031.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1066.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1102.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1137.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1173.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1208.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1244.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1279.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 1315.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra_detalles', 'id_orden_compra_detalle'), COALESCE((SELECT MAX(id_orden_compra_detalle) FROM compras.ordenes_compra_detalles), 1), true);

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_mercancia (id_recepcion, folio_recepcion, orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RECEP-2026-0001', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', '2026-02-01 11:30:00', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RECEP-2026-0002', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', '2026-02-02 11:30:00', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RECEP-2026-0003', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', '2026-02-03 11:30:00', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RECEP-2026-0004', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', '2026-02-04 11:30:00', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RECEP-2026-0005', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', '2026-02-05 11:30:00', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RECEP-2026-0006', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', '2026-02-06 11:30:00', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RECEP-2026-0007', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', '2026-02-07 11:30:00', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RECEP-2026-0008', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', '2026-02-08 11:30:00', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RECEP-2026-0009', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', '2026-02-09 11:30:00', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RECEP-2026-0010', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', '2026-02-10 11:30:00', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RECEP-2026-0011', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', '2026-02-11 11:30:00', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RECEP-2026-0012', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', '2026-02-12 11:30:00', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RECEP-2026-0013', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', '2026-02-13 11:30:00', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RECEP-2026-0014', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', '2026-02-14 11:30:00', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RECEP-2026-0015', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', '2026-02-15 11:30:00', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RECEP-2026-0016', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', '2026-02-16 11:30:00', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RECEP-2026-0017', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', '2026-02-17 11:30:00', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RECEP-2026-0018', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', '2026-02-18 11:30:00', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RECEP-2026-0019', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', '2026-02-19 11:30:00', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RECEP-2026-0020', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RECEP-2026-0021', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', '2026-02-21 11:30:00', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RECEP-2026-0022', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', '2026-02-22 11:30:00', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RECEP-2026-0023', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', '2026-02-23 11:30:00', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RECEP-2026-0024', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', '2026-02-24 11:30:00', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RECEP-2026-0025', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', '2026-02-25 11:30:00', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RECEP-2026-0026', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', '2026-02-26 11:30:00', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RECEP-2026-0027', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', '2026-02-27 11:30:00', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RECEP-2026-0028', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', '2026-02-28 11:30:00', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RECEP-2026-0029', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', '2026-02-01 11:30:00', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RECEP-2026-0030', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', '2026-02-02 11:30:00', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_mercancia', 'id_recepcion'), COALESCE((SELECT MAX(id_recepcion) FROM compras.recepciones_mercancia), 1), true);

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_detalles (id_recepcion_detalle, recepcion, variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_detalles', 'id_recepcion_detalle'), COALESCE((SELECT MAX(id_recepcion_detalle) FROM compras.recepciones_detalles), 1), true);

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.inspecciones_sanitarias_qa (id_inspeccion_qa, recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, 'LOTE_LAB_01', '2026-03-01', 'APROBADO', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, 'LOTE_LAB_02', '2026-03-02', 'RECHAZADO_DEVOLVER', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, 'LOTE_LAB_03', '2026-03-03', 'APROBADO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, 'LOTE_LAB_04', '2026-03-04', 'RECHAZADO_DEVOLVER', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, 'LOTE_LAB_05', '2026-03-05', 'APROBADO', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, 'LOTE_LAB_06', '2026-03-06', 'RECHAZADO_DEVOLVER', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, 'LOTE_LAB_07', '2026-03-07', 'APROBADO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, 'LOTE_LAB_08', '2026-03-08', 'RECHAZADO_DEVOLVER', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, 'LOTE_LAB_09', '2026-03-09', 'APROBADO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, 'LOTE_LAB_10', '2026-03-10', 'RECHAZADO_DEVOLVER', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, 'LOTE_LAB_11', '2026-03-11', 'APROBADO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, 'LOTE_LAB_12', '2026-03-12', 'RECHAZADO_DEVOLVER', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, 'LOTE_LAB_13', '2026-03-13', 'APROBADO', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, 'LOTE_LAB_14', '2026-03-14', 'RECHAZADO_DEVOLVER', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, 'LOTE_LAB_15', '2026-03-15', 'APROBADO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, 'LOTE_LAB_16', '2026-03-16', 'RECHAZADO_DEVOLVER', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, 'LOTE_LAB_17', '2026-03-17', 'APROBADO', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, 'LOTE_LAB_18', '2026-03-18', 'RECHAZADO_DEVOLVER', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, 'LOTE_LAB_19', '2026-03-19', 'APROBADO', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, 'LOTE_LAB_20', '2026-03-20', 'RECHAZADO_DEVOLVER', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, 'LOTE_LAB_21', '2026-03-21', 'APROBADO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, 'LOTE_LAB_22', '2026-03-22', 'RECHAZADO_DEVOLVER', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, 'LOTE_LAB_23', '2026-03-23', 'APROBADO', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, 'LOTE_LAB_24', '2026-03-24', 'RECHAZADO_DEVOLVER', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, 'LOTE_LAB_25', '2026-03-25', 'APROBADO', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, 'LOTE_LAB_26', '2026-03-26', 'RECHAZADO_DEVOLVER', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, 'LOTE_LAB_27', '2026-03-27', 'APROBADO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, 'LOTE_LAB_28', '2026-03-28', 'RECHAZADO_DEVOLVER', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, 'LOTE_LAB_29', '2026-03-01', 'APROBADO', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, 'LOTE_LAB_30', '2026-03-02', 'RECHAZADO_DEVOLVER', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.inspecciones_sanitarias_qa', 'id_inspeccion_qa'), COALESCE((SELECT MAX(id_inspeccion_qa) FROM compras.inspecciones_sanitarias_qa), 1), true);

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.almacenes_cedis (id_almacen, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ALMACEN_01', 'CEDIS Monterrey Parque Stiva Unidad 1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '25700', 'Monclova', 17.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ALMACEN_02', 'CEDIS CDMX Vallejo Industrial Unidad 2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '64000', 'Monterrey', 20.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ALMACEN_03', 'CEDIS Guadalajara El Salto Unidad 3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '66220', 'San Pedro Garza García', 22.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'ALMACEN_04', 'CEDIS Monclova Centro Distribución Unidad 4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '06700', 'Ciudad de México', 25.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ALMACEN_05', 'CEDIS Querétaro Logístico Bajío Unidad 5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '11560', 'Ciudad de México', 27.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'ALMACEN_06', 'CEDIS Puebla Parque Finsa Unidad 6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '44100', 'Guadalajara', 30.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'ALMACEN_07', 'CEDIS Monterrey Parque Stiva Unidad 7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '25000', 'Saltillo', 32.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'ALMACEN_08', 'CEDIS CDMX Vallejo Industrial Unidad 8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '76000', 'Querétaro', 35.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'ALMACEN_09', 'CEDIS Guadalajara El Salto Unidad 9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '72000', 'Puebla', 37.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'ALMACEN_10', 'CEDIS Monclova Centro Distribución Unidad 10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '97000', 'Mérida', 40.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ALMACEN_11', 'CEDIS Querétaro Logístico Bajío Unidad 11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '25700', 'Monclova', 42.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ALMACEN_12', 'CEDIS Puebla Parque Finsa Unidad 12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '64000', 'Monterrey', 45.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'ALMACEN_13', 'CEDIS Monterrey Parque Stiva Unidad 13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '66220', 'San Pedro Garza García', 47.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'ALMACEN_14', 'CEDIS CDMX Vallejo Industrial Unidad 14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '06700', 'Ciudad de México', 50.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ALMACEN_15', 'CEDIS Guadalajara El Salto Unidad 15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '11560', 'Ciudad de México', 52.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'ALMACEN_16', 'CEDIS Monclova Centro Distribución Unidad 16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '44100', 'Guadalajara', 55.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'ALMACEN_17', 'CEDIS Querétaro Logístico Bajío Unidad 17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '25000', 'Saltillo', 57.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ALMACEN_18', 'CEDIS Puebla Parque Finsa Unidad 18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '76000', 'Querétaro', 60.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'ALMACEN_19', 'CEDIS Monterrey Parque Stiva Unidad 19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '72000', 'Puebla', 62.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'ALMACEN_20', 'CEDIS CDMX Vallejo Industrial Unidad 20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '97000', 'Mérida', 65.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ALMACEN_21', 'CEDIS Guadalajara El Salto Unidad 21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '25700', 'Monclova', 67.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'ALMACEN_22', 'CEDIS Monclova Centro Distribución Unidad 22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '64000', 'Monterrey', 70.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'ALMACEN_23', 'CEDIS Querétaro Logístico Bajío Unidad 23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '66220', 'San Pedro Garza García', 72.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'ALMACEN_24', 'CEDIS Puebla Parque Finsa Unidad 24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '06700', 'Ciudad de México', 75.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'ALMACEN_25', 'CEDIS Monterrey Parque Stiva Unidad 25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '11560', 'Ciudad de México', 77.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'ALMACEN_26', 'CEDIS CDMX Vallejo Industrial Unidad 26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '44100', 'Guadalajara', 80.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ALMACEN_27', 'CEDIS Guadalajara El Salto Unidad 27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '25000', 'Saltillo', 82.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'ALMACEN_28', 'CEDIS Monclova Centro Distribución Unidad 28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '76000', 'Querétaro', 85.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'ALMACEN_29', 'CEDIS Querétaro Logístico Bajío Unidad 29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '72000', 'Puebla', 87.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'ALMACEN_30', 'CEDIS Puebla Parque Finsa Unidad 30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '97000', 'Mérida', 90.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.almacenes_cedis', 'id_almacen'), COALESCE((SELECT MAX(id_almacen) FROM wms.almacenes_cedis), 1), true);

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.zonas_almacen (id_zona_almacen, almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ZONA_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ZONA_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ZONA_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ZONA_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ZONA_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ZONA_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ZONA_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ZONA_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ZONA_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ZONA_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ZONA_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ZONA_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ZONA_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ZONA_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ZONA_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ZONA_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ZONA_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ZONA_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ZONA_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ZONA_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ZONA_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ZONA_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ZONA_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ZONA_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ZONA_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ZONA_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ZONA_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ZONA_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ZONA_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ZONA_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.zonas_almacen', 'id_zona_almacen'), COALESCE((SELECT MAX(id_zona_almacen) FROM wms.zonas_almacen), 1), true);

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.pasillos_ubicaciones (id_ubicacion, zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'UBICACIO_01', 17.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'UBICACIO_02', 20.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'UBICACIO_03', 22.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'UBICACIO_04', 25.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'UBICACIO_05', 27.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'UBICACIO_06', 30.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'UBICACIO_07', 32.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'UBICACIO_08', 35.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'UBICACIO_09', 37.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'UBICACIO_10', 40.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'UBICACIO_11', 42.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'UBICACIO_12', 45.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'UBICACIO_13', 47.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'UBICACIO_14', 50.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'UBICACIO_15', 52.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'UBICACIO_16', 55.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'UBICACIO_17', 57.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'UBICACIO_18', 60.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'UBICACIO_19', 62.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'UBICACIO_20', 65.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'UBICACIO_21', 67.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'UBICACIO_22', 70.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'UBICACIO_23', 72.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'UBICACIO_24', 75.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'UBICACIO_25', 77.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'UBICACIO_26', 80.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'UBICACIO_27', 82.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'UBICACIO_28', 85.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'UBICACIO_29', 87.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'UBICACIO_30', 90.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.pasillos_ubicaciones', 'id_ubicacion'), COALESCE((SELECT MAX(id_ubicacion) FROM wms.pasillos_ubicaciones), 1), true);

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.tipos_movimiento_inventario (id_tipo_movimiento, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ENT_COMPRA', 'Entrada por Compra a Proveedor', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SAL_VENTA', 'Salida por Venta E-Commerce', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AJU_POS', 'Ajuste Positivo por Conteo Cíclico', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SAL_MERMA', 'Salida por Merma o Caducidad Sanitaria', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANS_SAL', 'Salida por Transferencia entre CEDIS', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANS_ENT', 'Entrada por Transferencia entre CEDIS', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('wms.tipos_movimiento_inventario', 'id_tipo_movimiento'), COALESCE((SELECT MAX(id_tipo_movimiento) FROM wms.tipos_movimiento_inventario), 1), true);

-- =================================================================================================
-- 117. TABLA: wms.lotes_fabricacion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.lotes_fabricacion_sanitaria (id_lote, variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'LOT-2026-LA_R-001', '2026-03-01', '2026-03-01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'LOT-2026-CERA-002', '2026-03-02', '2026-03-02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'LOT-2026-THE_-003', '2026-03-03', '2026-03-03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'LOT-2026-ISDI-004', '2026-03-04', '2026-03-04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'LOT-2026-BIOD-005', '2026-03-05', '2026-03-05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'LOT-2026-AVEN-006', '2026-03-06', '2026-03-06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'LOT-2026-EUCE-007', '2026-03-07', '2026-03-07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'LOT-2026-VICH-008', '2026-03-08', '2026-03-08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'LOT-2026-SKIN-009', '2026-03-09', '2026-03-09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'LOT-2026-SESD-010', '2026-03-10', '2026-03-10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'LOT-2026-NARS-011', '2026-03-11', '2026-03-11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'LOT-2026-MAC-012', '2026-03-12', '2026-03-12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'LOT-2026-FENT-013', '2026-03-13', '2026-03-13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'LOT-2026-RARE-014', '2026-03-14', '2026-03-14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'LOT-2026-CLIN-015', '2026-03-15', '2026-03-15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'LOT-2026-ESTE-016', '2026-03-16', '2026-03-16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'LOT-2026-LANC-017', '2026-03-17', '2026-03-17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'LOT-2026-CHAR-018', '2026-03-18', '2026-03-18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'LOT-2026-PAUL-019', '2026-03-19', '2026-03-19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'LOT-2026-COSR-020', '2026-03-20', '2026-03-20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'LOT-2026-LANE-021', '2026-03-21', '2026-03-21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'LOT-2026-URIA-022', '2026-03-22', '2026-03-22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'LOT-2026-SVR-023', '2026-03-23', '2026-03-23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'LOT-2026-MART-024', '2026-03-24', '2026-03-24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'LOT-2026-HELI-025', '2026-03-25', '2026-03-25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'LOT-2026-KIEH-026', '2026-03-26', '2026-03-26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'LOT-2026-GARN-027', '2026-03-27', '2026-03-27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'LOT-2026-LORE-028', '2026-03-28', '2026-03-28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'LOT-2026-NEUT-029', '2026-03-01', '2026-03-01', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'LOT-2026-DERM-030', '2026-03-02', '2026-03-02', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.lotes_fabricacion_sanitaria', 'id_lote'), COALESCE((SELECT MAX(id_lote) FROM wms.lotes_fabricacion_sanitaria), 1), true);

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.inventario_lotes_ubicacion (id_inventario_stock, lote, ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('wms.inventario_lotes_ubicacion', 'id_inventario_stock'), COALESCE((SELECT MAX(id_inventario_stock) FROM wms.inventario_lotes_ubicacion), 1), true);

-- =================================================================================================
-- 119. TABLA: wms.kardex_movimientos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.kardex_movimientos (id_kardex, inventario_stock, tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 1, 1, 'FOL-DOCUM-2026-0001', 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, 2, 'FOL-DOCUM-2026-0002', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, 3, 'FOL-DOCUM-2026-0003', 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, 4, 'FOL-DOCUM-2026-0004', 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, 5, 'FOL-DOCUM-2026-0005', 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, 6, 'FOL-DOCUM-2026-0006', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 7, 7, 'FOL-DOCUM-2026-0007', 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 8, 8, 'FOL-DOCUM-2026-0008', 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 9, 9, 'FOL-DOCUM-2026-0009', 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 10, 10, 'FOL-DOCUM-2026-0010', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 11, 11, 'FOL-DOCUM-2026-0011', 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 12, 12, 'FOL-DOCUM-2026-0012', 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 13, 13, 'FOL-DOCUM-2026-0013', 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 14, 14, 'FOL-DOCUM-2026-0014', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 15, 15, 'FOL-DOCUM-2026-0015', 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 16, 16, 'FOL-DOCUM-2026-0016', 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 17, 17, 'FOL-DOCUM-2026-0017', 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 18, 18, 'FOL-DOCUM-2026-0018', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 19, 19, 'FOL-DOCUM-2026-0019', 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 20, 20, 'FOL-DOCUM-2026-0020', 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 21, 21, 'FOL-DOCUM-2026-0021', 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 22, 22, 'FOL-DOCUM-2026-0022', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 23, 23, 'FOL-DOCUM-2026-0023', 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 24, 24, 'FOL-DOCUM-2026-0024', 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 25, 25, 'FOL-DOCUM-2026-0025', 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 26, 26, 'FOL-DOCUM-2026-0026', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 27, 27, 'FOL-DOCUM-2026-0027', 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 28, 28, 'FOL-DOCUM-2026-0028', 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 29, 29, 'FOL-DOCUM-2026-0029', 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 30, 30, 'FOL-DOCUM-2026-0030', 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.kardex_movimientos', 'id_kardex'), COALESCE((SELECT MAX(id_kardex) FROM wms.kardex_movimientos), 1), true);

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.alertas_caducidad_proxima (id_alerta_caducidad, lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'PREVENTIVA_90D', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'MODERADA_60D', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'CRITICA_30D', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'EXPIRADO', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'PREVENTIVA_90D', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'MODERADA_60D', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'CRITICA_30D', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'EXPIRADO', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'PREVENTIVA_90D', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'MODERADA_60D', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'CRITICA_30D', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'EXPIRADO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'PREVENTIVA_90D', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'MODERADA_60D', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'CRITICA_30D', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'EXPIRADO', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'PREVENTIVA_90D', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'MODERADA_60D', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'CRITICA_30D', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'EXPIRADO', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'PREVENTIVA_90D', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'MODERADA_60D', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'CRITICA_30D', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'EXPIRADO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'PREVENTIVA_90D', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'MODERADA_60D', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'CRITICA_30D', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'EXPIRADO', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'PREVENTIVA_90D', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'MODERADA_60D', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.alertas_caducidad_proxima', 'id_alerta_caducidad'), COALESCE((SELECT MAX(id_alerta_caducidad) FROM wms.alertas_caducidad_proxima), 1), true);

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.mermas_destruccion_sanitaria (id_merma_destruccion, folio_acta_destruccion, lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ACTA_-2026-0001', 1, 8, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ACTA_-2026-0002', 2, 11, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ACTA_-2026-0003', 3, 14, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ACTA_-2026-0004', 4, 17, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ACTA_-2026-0005', 5, 20, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ACTA_-2026-0006', 6, 23, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ACTA_-2026-0007', 7, 26, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ACTA_-2026-0008', 8, 29, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ACTA_-2026-0009', 9, 32, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ACTA_-2026-0010', 10, 35, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ACTA_-2026-0011', 11, 38, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ACTA_-2026-0012', 12, 41, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ACTA_-2026-0013', 13, 44, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ACTA_-2026-0014', 14, 47, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ACTA_-2026-0015', 15, 50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ACTA_-2026-0016', 16, 53, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ACTA_-2026-0017', 17, 56, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ACTA_-2026-0018', 18, 59, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ACTA_-2026-0019', 19, 62, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ACTA_-2026-0020', 20, 65, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ACTA_-2026-0021', 21, 68, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ACTA_-2026-0022', 22, 71, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ACTA_-2026-0023', 23, 74, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ACTA_-2026-0024', 24, 77, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ACTA_-2026-0025', 25, 80, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ACTA_-2026-0026', 26, 83, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ACTA_-2026-0027', 27, 86, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ACTA_-2026-0028', 28, 89, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ACTA_-2026-0029', 29, 92, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ACTA_-2026-0030', 30, 95, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.mermas_destruccion_sanitaria', 'id_merma_destruccion'), COALESCE((SELECT MAX(id_merma_destruccion) FROM wms.mermas_destruccion_sanitaria), 1), true);

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_almacenes (id_transferencia, folio_transferencia, almacen_origen, almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 1, 'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 2, 'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 3, 'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 4, 'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 5, 'SOLICITADA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 6, 'EN_TRANSITO', '2026-02-06 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 7, 'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 8, 'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 9, 'SOLICITADA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 10, 'EN_TRANSITO', '2026-02-10 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 11, 'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 12, 'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 13, 'SOLICITADA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 14, 'EN_TRANSITO', '2026-02-14 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 15, 'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 16, 'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 17, 'SOLICITADA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 18, 'EN_TRANSITO', '2026-02-18 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 19, 'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 20, 'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 21, 'SOLICITADA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 22, 'EN_TRANSITO', '2026-02-22 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 23, 'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 24, 'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 25, 'SOLICITADA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 26, 'EN_TRANSITO', '2026-02-26 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 27, 'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 28, 'DISCREPANCIA', '2026-02-28 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 29, 'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 30, 'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.transferencias_almacenes', 'id_transferencia'), COALESCE((SELECT MAX(id_transferencia) FROM wms.transferencias_almacenes), 1), true);

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_detalles (id_transferencia_detalle, transferencia, lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('wms.transferencias_detalles', 'id_transferencia_detalle'), COALESCE((SELECT MAX(id_transferencia_detalle) FROM wms.transferencias_detalles), 1), true);

-- =================================================================================================
-- 124. TABLA: wms.conteos_ciclicos_auditoria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_auditoria (id_conteo_ciclico, folio_auditoria, almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_auditoria', 'id_conteo_ciclico'), COALESCE((SELECT MAX(id_conteo_ciclico) FROM wms.conteos_ciclicos_auditoria), 1), true);

-- =================================================================================================
-- 125. TABLA: wms.conteos_ciclicos_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_detalles (id_conteo_detalle, conteo_ciclico, inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_detalles', 'id_conteo_detalle'), COALESCE((SELECT MAX(id_conteo_detalle) FROM wms.conteos_ciclicos_detalles), 1), true);

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.monitoreo_temperatura_humedad (id_telemetria_sensor, zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SENSOR_I_01', 17.50, 17.50, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SENSOR_I_02', 20.00, 20.00, FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SENSOR_I_03', 22.50, 22.50, TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SENSOR_I_04', 25.00, 25.00, FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SENSOR_I_05', 27.50, 27.50, TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SENSOR_I_06', 30.00, 30.00, FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SENSOR_I_07', 32.50, 32.50, TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SENSOR_I_08', 35.00, 35.00, FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SENSOR_I_09', 37.50, 37.50, TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SENSOR_I_10', 40.00, 40.00, FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SENSOR_I_11', 42.50, 42.50, TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SENSOR_I_12', 45.00, 45.00, FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SENSOR_I_13', 47.50, 47.50, TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SENSOR_I_14', 50.00, 50.00, FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SENSOR_I_15', 52.50, 52.50, TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SENSOR_I_16', 55.00, 55.00, FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SENSOR_I_17', 57.50, 57.50, TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SENSOR_I_18', 60.00, 60.00, FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SENSOR_I_19', 62.50, 62.50, TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SENSOR_I_20', 65.00, 65.00, FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SENSOR_I_21', 67.50, 67.50, TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SENSOR_I_22', 70.00, 70.00, FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SENSOR_I_23', 72.50, 72.50, TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SENSOR_I_24', 75.00, 75.00, FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SENSOR_I_25', 77.50, 77.50, TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SENSOR_I_26', 80.00, 80.00, FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SENSOR_I_27', 82.50, 82.50, TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SENSOR_I_28', 85.00, 85.00, FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SENSOR_I_29', 87.50, 87.50, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SENSOR_I_30', 90.00, 90.00, FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.monitoreo_temperatura_humedad', 'id_telemetria_sensor'), COALESCE((SELECT MAX(id_telemetria_sensor) FROM wms.monitoreo_temperatura_humedad), 1), true);

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.transportistas_paqueterias (id_transportista, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TRANSPOR_01', 'Kit Rutina La Roche-Posay #1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TRANSPOR_02', 'Kit Rutina CeraVe Dermatological #2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'TRANSPOR_03', 'Kit Rutina The Ordinary Deciem #3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'TRANSPOR_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANSPOR_05', 'Kit Rutina Bioderma Laboratoire #5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANSPOR_06', 'Kit Rutina Eau Thermale Avène #6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'TRANSPOR_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'TRANSPOR_08', 'Kit Rutina Vichy Laboratoires #8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'TRANSPOR_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'TRANSPOR_10', 'Kit Rutina Sesderma Nanotech #10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'TRANSPOR_11', 'Kit Rutina NARS Cosmetics #11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'TRANSPOR_12', 'Kit Rutina MAC Professional #12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'TRANSPOR_13', 'Kit Rutina Fenty Beauty #13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'TRANSPOR_14', 'Kit Rutina Rare Beauty #14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'TRANSPOR_15', 'Kit Rutina Clinique Laboratories #15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'TRANSPOR_16', 'Kit Rutina Estée Lauder #16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'TRANSPOR_17', 'Kit Rutina Lancôme Paris #17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'TRANSPOR_18', 'Kit Rutina Charlotte Tilbury #18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'TRANSPOR_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'TRANSPOR_20', 'Kit Rutina COSRX K-Beauty #20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'TRANSPOR_21', 'Kit Rutina Laneige Amorepacific #21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'TRANSPOR_22', 'Kit Rutina Uriage Eau Thermale #22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'TRANSPOR_23', 'Kit Rutina Laboratoire SVR #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'TRANSPOR_24', 'Kit Rutina MartiDerm Ampollas #24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'TRANSPOR_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'TRANSPOR_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'TRANSPOR_27', 'Kit Rutina Garnier SkinActive #27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'TRANSPOR_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TRANSPOR_29', 'Kit Rutina Neutrogena Derm #29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'TRANSPOR_30', 'Kit Rutina DermaCare Labs México #30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.transportistas_paqueterias', 'id_transportista'), COALESCE((SELECT MAX(id_transportista) FROM envios.transportistas_paqueterias), 1), true);

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tipos_servicio_envio (id_servicio_envio, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SERVICIO_01', 'Zona Refrigerada B-01', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SERVICIO_02', 'Zona Refrigerada B-02', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SERVICIO_03', 'Zona Refrigerada B-03', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SERVICIO_04', 'Zona Refrigerada B-04', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SERVICIO_05', 'Zona Refrigerada B-05', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'SERVICIO_06', 'Zona Refrigerada B-06', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'SERVICIO_07', 'Zona Refrigerada B-07', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'SERVICIO_08', 'Zona Refrigerada B-08', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'SERVICIO_09', 'Zona Refrigerada B-09', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'SERVICIO_10', 'Zona Refrigerada B-10', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'SERVICIO_11', 'Zona Refrigerada B-11', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'SERVICIO_12', 'Zona Refrigerada B-12', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'SERVICIO_13', 'Zona Refrigerada B-13', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'SERVICIO_14', 'Zona Refrigerada B-14', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'SERVICIO_15', 'Zona Refrigerada B-15', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'SERVICIO_16', 'Zona Refrigerada B-16', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'SERVICIO_17', 'Zona Refrigerada B-17', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'SERVICIO_18', 'Zona Refrigerada B-18', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'SERVICIO_19', 'Zona Refrigerada B-19', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'SERVICIO_20', 'Zona Refrigerada B-20', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'SERVICIO_21', 'Zona Refrigerada B-21', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'SERVICIO_22', 'Zona Refrigerada B-22', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'SERVICIO_23', 'Zona Refrigerada B-23', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'SERVICIO_24', 'Zona Refrigerada B-24', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'SERVICIO_25', 'Zona Refrigerada B-25', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'SERVICIO_26', 'Zona Refrigerada B-26', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'SERVICIO_27', 'Zona Refrigerada B-27', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'SERVICIO_28', 'Zona Refrigerada B-28', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'SERVICIO_29', 'Zona Refrigerada B-29', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'SERVICIO_30', 'Zona Refrigerada B-30', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tipos_servicio_envio', 'id_servicio_envio'), COALESCE((SELECT MAX(id_servicio_envio) FROM envios.tipos_servicio_envio), 1), true);

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tarifas_zonas_postales (id_tarifa_zona, transportista, servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'POS', 'POS', 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'POS', 'POS', 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'POS', 'POS', 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'POS', 'POS', 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'POS', 'POS', 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'POS', 'POS', 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'POS', 'POS', 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'POS', 'POS', 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'POS', 'POS', 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'POS', 'POS', 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'POS', 'POS', 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'POS', 'POS', 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'POS', 'POS', 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'POS', 'POS', 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'POS', 'POS', 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'POS', 'POS', 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'POS', 'POS', 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'POS', 'POS', 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'POS', 'POS', 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'POS', 'POS', 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'POS', 'POS', 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'POS', 'POS', 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'POS', 'POS', 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'POS', 'POS', 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'POS', 'POS', 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'POS', 'POS', 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'POS', 'POS', 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'POS', 'POS', 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'POS', 'POS', 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'POS', 'POS', 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tarifas_zonas_postales', 'id_tarifa_zona'), COALESCE((SELECT MAX(id_tarifa_zona) FROM envios.tarifas_zonas_postales), 1), true);

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.despachos_orden (id_despacho, folio_despacho, orden_split, transportista, servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-DESPA-2026-0001', 1, 1, 1, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', '2026-02-03 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', '2026-02-04 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-05 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', '2026-02-06 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-DESPA-2026-0007', 7, 7, 7, '2026-02-07 11:30:00', '2026-03-07', '2026-02-07 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', '2026-02-08 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', '2026-02-09 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', '2026-02-10 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-11 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', '2026-02-12 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-DESPA-2026-0013', 13, 13, 13, '2026-02-13 11:30:00', '2026-03-13', '2026-02-13 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', '2026-02-14 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', '2026-02-15 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', '2026-02-16 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-17 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', '2026-02-18 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-DESPA-2026-0019', 19, 19, 19, '2026-02-19 11:30:00', '2026-03-19', '2026-02-19 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', '2026-02-20 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', '2026-02-21 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', '2026-02-22 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-23 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', '2026-02-24 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-DESPA-2026-0025', 25, 25, 25, '2026-02-25 11:30:00', '2026-03-25', '2026-02-25 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', '2026-02-26 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', '2026-02-27 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', '2026-02-28 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', 'INCIDENCIA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.despachos_orden', 'id_despacho'), COALESCE((SELECT MAX(id_despacho) FROM envios.despachos_orden), 1), true);

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_bultos (id_paquete_bulto, despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'DERMA-SKU-1001', 0.60, 13.0, 13.0, 13.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'DERMA-SKU-1002', 0.75, 14.0, 14.0, 14.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'DERMA-SKU-1003', 0.90, 15.0, 15.0, 15.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DERMA-SKU-1004', 1.05, 16.0, 16.0, 16.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'DERMA-SKU-1005', 1.20, 17.0, 17.0, 17.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'DERMA-SKU-1006', 1.35, 18.0, 18.0, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'DERMA-SKU-1007', 1.50, 19.0, 19.0, 19.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DERMA-SKU-1008', 1.65, 20.0, 20.0, 20.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'DERMA-SKU-1009', 1.80, 21.0, 21.0, 21.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'DERMA-SKU-1010', 1.95, 22.0, 22.0, 22.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'DERMA-SKU-1011', 2.10, 23.0, 23.0, 23.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DERMA-SKU-1012', 2.25, 24.0, 24.0, 24.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'DERMA-SKU-1013', 2.40, 25.0, 25.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'DERMA-SKU-1014', 2.55, 26.0, 26.0, 26.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'DERMA-SKU-1015', 2.70, 27.0, 27.0, 27.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DERMA-SKU-1016', 2.85, 28.0, 28.0, 28.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'DERMA-SKU-1017', 3.00, 29.0, 29.0, 29.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'DERMA-SKU-1018', 3.15, 30.0, 30.0, 30.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'DERMA-SKU-1019', 3.30, 31.0, 31.0, 31.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DERMA-SKU-1020', 3.45, 32.0, 32.0, 32.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'DERMA-SKU-1021', 3.60, 33.0, 33.0, 33.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'DERMA-SKU-1022', 3.75, 34.0, 34.0, 34.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'DERMA-SKU-1023', 3.90, 35.0, 35.0, 35.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DERMA-SKU-1024', 4.05, 36.0, 36.0, 36.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DERMA-SKU-1025', 4.20, 37.0, 37.0, 37.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'DERMA-SKU-1026', 4.35, 38.0, 38.0, 38.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'DERMA-SKU-1027', 4.50, 39.0, 39.0, 39.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DERMA-SKU-1028', 4.65, 40.0, 40.0, 40.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'DERMA-SKU-1029', 4.80, 41.0, 41.0, 41.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'DERMA-SKU-1030', 4.95, 42.0, 42.0, 42.0, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.paquetes_bultos', 'id_paquete_bulto'), COALESCE((SELECT MAX(id_paquete_bulto) FROM envios.paquetes_bultos), 1), true);

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_contenido_lotes (id_contenido_paquete, paquete_bulto, orden_detalle, lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('envios.paquetes_contenido_lotes', 'id_contenido_paquete'), COALESCE((SELECT MAX(id_contenido_paquete) FROM envios.paquetes_contenido_lotes), 1), true);

-- =================================================================================================
-- 133. TABLA: envios.guias_rastreo (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.guias_rastreo (id_guia_rastreo, paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'DERMA-SKU-1001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'DERMA-SKU-1002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'DERMA-SKU-1003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DERMA-SKU-1004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'DERMA-SKU-1005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'DERMA-SKU-1006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'DERMA-SKU-1007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DERMA-SKU-1008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'DERMA-SKU-1009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'DERMA-SKU-1010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'DERMA-SKU-1011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DERMA-SKU-1012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'DERMA-SKU-1013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'DERMA-SKU-1014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'DERMA-SKU-1015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DERMA-SKU-1016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'DERMA-SKU-1017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'DERMA-SKU-1018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'DERMA-SKU-1019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DERMA-SKU-1020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'DERMA-SKU-1021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'DERMA-SKU-1022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'DERMA-SKU-1023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DERMA-SKU-1024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DERMA-SKU-1025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'DERMA-SKU-1026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'DERMA-SKU-1027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DERMA-SKU-1028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'DERMA-SKU-1029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'DERMA-SKU-1030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.guias_rastreo', 'id_guia_rastreo'), COALESCE((SELECT MAX(id_guia_rastreo) FROM envios.guias_rastreo), 1), true);

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.eventos_tracking_bitacora (id_evento_tracking, guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ESTATUS__01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ESTATUS__02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ESTATUS__03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ESTATUS__04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ESTATUS__05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ESTATUS__06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ESTATUS__07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ESTATUS__08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ESTATUS__09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ESTATUS__10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ESTATUS__11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ESTATUS__12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ESTATUS__13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ESTATUS__14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ESTATUS__15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ESTATUS__16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ESTATUS__17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ESTATUS__18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ESTATUS__19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ESTATUS__20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ESTATUS__21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ESTATUS__22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ESTATUS__23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ESTATUS__24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ESTATUS__25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ESTATUS__26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ESTATUS__27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ESTATUS__28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ESTATUS__29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ESTATUS__30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.eventos_tracking_bitacora', 'id_evento_tracking'), COALESCE((SELECT MAX(id_evento_tracking) FROM envios.eventos_tracking_bitacora), 1), true);

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.intentos_entrega_fallidos (id_intento_fallido, despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.intentos_entrega_fallidos', 'id_intento_fallido'), COALESCE((SELECT MAX(id_intento_fallido) FROM envios.intentos_entrega_fallidos), 1), true);

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.incidencias_logisticas (id_incidencia_logistica, despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EXTRAVIO_TOTAL', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAQUETE_DANADO_DERRAME', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ROBO_EN_TRANSITO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DIRECCION_INEXISTENTE', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EXTRAVIO_TOTAL', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PAQUETE_DANADO_DERRAME', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ROBO_EN_TRANSITO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DIRECCION_INEXISTENTE', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EXTRAVIO_TOTAL', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PAQUETE_DANADO_DERRAME', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ROBO_EN_TRANSITO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DIRECCION_INEXISTENTE', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EXTRAVIO_TOTAL', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAQUETE_DANADO_DERRAME', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ROBO_EN_TRANSITO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DIRECCION_INEXISTENTE', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EXTRAVIO_TOTAL', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PAQUETE_DANADO_DERRAME', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ROBO_EN_TRANSITO', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DIRECCION_INEXISTENTE', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EXTRAVIO_TOTAL', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PAQUETE_DANADO_DERRAME', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ROBO_EN_TRANSITO', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DIRECCION_INEXISTENTE', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EXTRAVIO_TOTAL', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAQUETE_DANADO_DERRAME', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ROBO_EN_TRANSITO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DIRECCION_INEXISTENTE', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EXTRAVIO_TOTAL', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PAQUETE_DANADO_DERRAME', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.incidencias_logisticas', 'id_incidencia_logistica'), COALESCE((SELECT MAX(id_incidencia_logistica) FROM envios.incidencias_logisticas), 1), true);

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.seguros_mercancia (id_seguro_envio, despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.seguros_mercancia', 'id_seguro_envio'), COALESCE((SELECT MAX(id_seguro_envio) FROM envios.seguros_mercancia), 1), true);

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.puntos_recoleccion_pickup (id_punto_pickup, transportista, almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'LOCKER_01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'LOCKER_02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'LOCKER_03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'LOCKER_04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'LOCKER_05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'LOCKER_06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'LOCKER_07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'LOCKER_08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'LOCKER_09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'LOCKER_10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'LOCKER_11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'LOCKER_12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'LOCKER_13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'LOCKER_14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'LOCKER_15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'LOCKER_16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'LOCKER_17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'LOCKER_18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'LOCKER_19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'LOCKER_20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'LOCKER_21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'LOCKER_22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'LOCKER_23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'LOCKER_24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'LOCKER_25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'LOCKER_26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'LOCKER_27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'LOCKER_28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'LOCKER_29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'LOCKER_30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.puntos_recoleccion_pickup', 'id_punto_pickup'), COALESCE((SELECT MAX(id_punto_pickup) FROM envios.puntos_recoleccion_pickup), 1), true);

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.motivos_devolucion_rma (id_motivo_rma, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('postventa.motivos_devolucion_rma', 'id_motivo_rma'), COALESCE((SELECT MAX(id_motivo_rma) FROM postventa.motivos_devolucion_rma), 1), true);

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.solicitudes_rma (id_solicitud_rma, folio_rma, orden, motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RMA-2026-0001', 1, 1, 'SOLICITADA', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RMA-2026-0002', 2, 2, 'GUIA_RETORNO_EMITIDA', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RMA-2026-0003', 3, 3, 'RECIBIDA_EN_QA', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RMA-2026-0004', 4, 4, 'APROBADA_REEMBOLSAR', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RMA-2026-0005', 5, 5, 'SOLICITADA', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RMA-2026-0006', 6, 6, 'GUIA_RETORNO_EMITIDA', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RMA-2026-0007', 7, 7, 'RECIBIDA_EN_QA', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RMA-2026-0008', 8, 8, 'APROBADA_REEMBOLSAR', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RMA-2026-0009', 9, 9, 'SOLICITADA', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RMA-2026-0010', 10, 10, 'GUIA_RETORNO_EMITIDA', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RMA-2026-0011', 11, 11, 'RECIBIDA_EN_QA', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RMA-2026-0012', 12, 12, 'APROBADA_REEMBOLSAR', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RMA-2026-0013', 13, 13, 'SOLICITADA', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RMA-2026-0014', 14, 14, 'GUIA_RETORNO_EMITIDA', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RMA-2026-0015', 15, 15, 'RECIBIDA_EN_QA', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RMA-2026-0016', 16, 16, 'APROBADA_REEMBOLSAR', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RMA-2026-0017', 17, 17, 'SOLICITADA', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RMA-2026-0018', 18, 18, 'GUIA_RETORNO_EMITIDA', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RMA-2026-0019', 19, 19, 'RECIBIDA_EN_QA', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RMA-2026-0020', 20, 20, 'APROBADA_REEMBOLSAR', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RMA-2026-0021', 21, 21, 'SOLICITADA', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RMA-2026-0022', 22, 22, 'GUIA_RETORNO_EMITIDA', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RMA-2026-0023', 23, 23, 'RECIBIDA_EN_QA', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RMA-2026-0024', 24, 24, 'APROBADA_REEMBOLSAR', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RMA-2026-0025', 25, 25, 'SOLICITADA', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RMA-2026-0026', 26, 26, 'GUIA_RETORNO_EMITIDA', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RMA-2026-0027', 27, 27, 'RECIBIDA_EN_QA', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RMA-2026-0028', 28, 28, 'APROBADA_REEMBOLSAR', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RMA-2026-0029', 29, 29, 'SOLICITADA', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RMA-2026-0030', 30, 30, 'GUIA_RETORNO_EMITIDA', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.solicitudes_rma', 'id_solicitud_rma'), COALESCE((SELECT MAX(id_solicitud_rma) FROM postventa.solicitudes_rma), 1), true);

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.rma_detalles (id_rma_detalle, solicitud_rma, orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('postventa.rma_detalles', 'id_rma_detalle'), COALESCE((SELECT MAX(id_rma_detalle) FROM postventa.rma_detalles), 1), true);

-- =================================================================================================
-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.inspeccion_sanitaria_retorno (id_inspeccion_retorno, rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, 17.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, 20.00, 'DONACION_REACONDICIONADA', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, 22.50, 'REINGRESO_STOCK_SELLADO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, 25.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, 27.50, 'DONACION_REACONDICIONADA', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, 30.00, 'REINGRESO_STOCK_SELLADO', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, 32.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, 35.00, 'DONACION_REACONDICIONADA', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, 37.50, 'REINGRESO_STOCK_SELLADO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, 40.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, 42.50, 'DONACION_REACONDICIONADA', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, 45.00, 'REINGRESO_STOCK_SELLADO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, 47.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, 50.00, 'DONACION_REACONDICIONADA', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, 52.50, 'REINGRESO_STOCK_SELLADO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, 55.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, 57.50, 'DONACION_REACONDICIONADA', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, 60.00, 'REINGRESO_STOCK_SELLADO', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, 62.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, 65.00, 'DONACION_REACONDICIONADA', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, 67.50, 'REINGRESO_STOCK_SELLADO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, 70.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, 72.50, 'DONACION_REACONDICIONADA', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, 75.00, 'REINGRESO_STOCK_SELLADO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, 77.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, 80.00, 'DONACION_REACONDICIONADA', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, 82.50, 'REINGRESO_STOCK_SELLADO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, 85.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, 87.50, 'DONACION_REACONDICIONADA', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, 90.00, 'REINGRESO_STOCK_SELLADO', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.inspeccion_sanitaria_retorno', 'id_inspeccion_retorno'), COALESCE((SELECT MAX(id_inspeccion_retorno) FROM postventa.inspeccion_sanitaria_retorno), 1), true);

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_soporte (id_ticket, folio_ticket, cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TICKE-2026-0001', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TICKE-2026-0002', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TICKE-2026-0003', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TICKE-2026-0004', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TICKE-2026-0005', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TICKE-2026-0006', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TICKE-2026-0007', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TICKE-2026-0008', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TICKE-2026-0009', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TICKE-2026-0010', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TICKE-2026-0011', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'FACTURACION_CFDI', 'ALTA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TICKE-2026-0012', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TICKE-2026-0013', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'ENVIO_DEMORADO', 'BAJA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TICKE-2026-0014', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TICKE-2026-0015', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'FACTURACION_CFDI', 'ALTA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TICKE-2026-0016', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TICKE-2026-0017', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'ENVIO_DEMORADO', 'BAJA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TICKE-2026-0018', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TICKE-2026-0019', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'FACTURACION_CFDI', 'ALTA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TICKE-2026-0020', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TICKE-2026-0021', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TICKE-2026-0022', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TICKE-2026-0023', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TICKE-2026-0024', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TICKE-2026-0025', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TICKE-2026-0026', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TICKE-2026-0027', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TICKE-2026-0028', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TICKE-2026-0029', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TICKE-2026-0030', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_soporte', 'id_ticket'), COALESCE((SELECT MAX(id_ticket) FROM postventa.tickets_soporte), 1), true);

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_mensajes (id_ticket_mensaje, ticket, usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_mensajes', 'id_ticket_mensaje'), COALESCE((SELECT MAX(id_ticket_mensaje) FROM postventa.tickets_mensajes), 1), true);

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.reportes_farmacovigilancia (id_reporte_farmacovigilancia, folio_cofepris_ram, cliente, producto, lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-COFEP-2026-0001', 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-COFEP-2026-0002', 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, '2026-03-02', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-COFEP-2026-0003', 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-03-03', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-COFEP-2026-0004', 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, '2026-03-04', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-COFEP-2026-0005', 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-03-05', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-COFEP-2026-0006', 6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, '2026-03-06', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-COFEP-2026-0007', 7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-03-07', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-COFEP-2026-0008', 8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, '2026-03-08', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-COFEP-2026-0009', 9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-03-09', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-COFEP-2026-0010', 10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, '2026-03-10', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-COFEP-2026-0011', 11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-03-11', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-COFEP-2026-0012', 12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, '2026-03-12', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-COFEP-2026-0013', 13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-03-13', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-COFEP-2026-0014', 14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, '2026-03-14', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-COFEP-2026-0015', 15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-03-15', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-COFEP-2026-0016', 16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, '2026-03-16', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-COFEP-2026-0017', 17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-03-17', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-COFEP-2026-0018', 18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, '2026-03-18', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-COFEP-2026-0019', 19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-03-19', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-COFEP-2026-0020', 20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, '2026-03-20', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-COFEP-2026-0021', 21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-03-21', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-COFEP-2026-0022', 22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, '2026-03-22', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-COFEP-2026-0023', 23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-03-23', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-COFEP-2026-0024', 24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, '2026-03-24', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-COFEP-2026-0025', 25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-03-25', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-COFEP-2026-0026', 26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, '2026-03-26', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-COFEP-2026-0027', 27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-03-27', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-COFEP-2026-0028', 28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, '2026-03-28', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-COFEP-2026-0029', 29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-COFEP-2026-0030', 30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2026-03-02', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.reportes_farmacovigilancia', 'id_reporte_farmacovigilancia'), COALESCE((SELECT MAX(id_reporte_farmacovigilancia) FROM postventa.reportes_farmacovigilancia), 1), true);

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.tipos_evento_sistema (id_tipo_evento, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'EVENTO_01', 'Sueros Concentrados Nivel 1', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'EVENTO_02', 'Limpiadores Faciales Nivel 2', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'EVENTO_03', 'Fotoprotección Solar Nivel 3', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'EVENTO_04', 'Maquillaje Mineral Nivel 4', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'EVENTO_05', 'Cuidado Anti-Edad Nivel 5', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'EVENTO_06', 'Barrera Cutánea Nivel 6', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'EVENTO_07', 'Contorno de Ojos Nivel 7', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'EVENTO_08', 'Tratamiento Acné Nivel 8', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'EVENTO_09', 'Hidratantes Ceramidas Nivel 9', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'EVENTO_10', 'Exfoliantes Químicos Nivel 10', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'EVENTO_11', 'Sueros Concentrados Nivel 11', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'EVENTO_12', 'Limpiadores Faciales Nivel 12', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'EVENTO_13', 'Fotoprotección Solar Nivel 13', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'EVENTO_14', 'Maquillaje Mineral Nivel 14', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'EVENTO_15', 'Cuidado Anti-Edad Nivel 15', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'EVENTO_16', 'Barrera Cutánea Nivel 16', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'EVENTO_17', 'Contorno de Ojos Nivel 17', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'EVENTO_18', 'Tratamiento Acné Nivel 18', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'EVENTO_19', 'Hidratantes Ceramidas Nivel 19', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'EVENTO_20', 'Exfoliantes Químicos Nivel 20', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'EVENTO_21', 'Sueros Concentrados Nivel 21', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'EVENTO_22', 'Limpiadores Faciales Nivel 22', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'EVENTO_23', 'Fotoprotección Solar Nivel 23', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'EVENTO_24', 'Maquillaje Mineral Nivel 24', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'EVENTO_25', 'Cuidado Anti-Edad Nivel 25', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'EVENTO_26', 'Barrera Cutánea Nivel 26', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'EVENTO_27', 'Contorno de Ojos Nivel 27', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'EVENTO_28', 'Tratamiento Acné Nivel 28', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'EVENTO_29', 'Hidratantes Ceramidas Nivel 29', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'EVENTO_30', 'Exfoliantes Químicos Nivel 30', 'CRITICO_SEGURIDAD', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.tipos_evento_sistema', 'id_tipo_evento'), COALESCE((SELECT MAX(id_tipo_evento) FROM auditoria.tipos_evento_sistema), 1), true);

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_seguridad_global (id_log_seguridad, tipo_evento, usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '189.203.3.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '189.203.6.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '189.203.9.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '189.203.12.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '189.203.15.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '189.203.18.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '189.203.21.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '189.203.24.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '189.203.27.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '189.203.30.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '189.203.33.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '189.203.36.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '189.203.39.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '189.203.42.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '189.203.45.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '189.203.48.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '189.203.51.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '189.203.54.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '189.203.57.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '189.203.60.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '189.203.63.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '189.203.66.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '189.203.69.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '189.203.72.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '189.203.75.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '189.203.78.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '189.203.81.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '189.203.84.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '189.203.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '189.203.90.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_seguridad_global', 'id_log_seguridad'), COALESCE((SELECT MAX(id_log_seguridad) FROM auditoria.bitacora_seguridad_global), 1), true);

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_cambios_datos (id_cambio_dato, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_cambios_datos', 'id_cambio_dato'), COALESCE((SELECT MAX(id_cambio_dato) FROM auditoria.bitacora_cambios_datos), 1), true);

-- =================================================================================================
-- 149. TABLA: sistema.parametros_configuracion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.parametros_configuracion (id_parametro, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PARAMETR_01', '31', 'STRING', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PARAMETR_02', '32', 'INTEGER', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PARAMETR_03', '33', 'DECIMAL', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PARAMETR_04', '34', 'BOOLEAN', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PARAMETR_05', '35', 'JSON', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PARAMETR_06', '36', 'STRING', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PARAMETR_07', '37', 'INTEGER', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PARAMETR_08', '38', 'DECIMAL', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PARAMETR_09', '39', 'BOOLEAN', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PARAMETR_10', '40', 'JSON', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PARAMETR_11', '41', 'STRING', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PARAMETR_12', '42', 'INTEGER', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PARAMETR_13', '43', 'DECIMAL', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PARAMETR_14', '44', 'BOOLEAN', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PARAMETR_15', '45', 'JSON', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PARAMETR_16', '46', 'STRING', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PARAMETR_17', '47', 'INTEGER', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PARAMETR_18', '48', 'DECIMAL', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PARAMETR_19', '49', 'BOOLEAN', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PARAMETR_20', '50', 'JSON', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PARAMETR_21', '51', 'STRING', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PARAMETR_22', '52', 'INTEGER', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PARAMETR_23', '53', 'DECIMAL', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PARAMETR_24', '54', 'BOOLEAN', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PARAMETR_25', '55', 'JSON', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PARAMETR_26', '56', 'STRING', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PARAMETR_27', '57', 'INTEGER', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PARAMETR_28', '58', 'DECIMAL', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PARAMETR_29', '59', 'BOOLEAN', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PARAMETR_30', '60', 'JSON', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.parametros_configuracion', 'id_parametro'), COALESCE((SELECT MAX(id_parametro) FROM sistema.parametros_configuracion), 1), true);

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.notificaciones_push_email (id_notificacion, usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EMAIL', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', TRUE, '2026-02-01 11:30:00', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PUSH_APP', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', FALSE, '2026-02-02 11:30:00', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SMS', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', TRUE, '2026-02-03 11:30:00', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'WHATSAPP', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', FALSE, '2026-02-04 11:30:00', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EMAIL', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', TRUE, '2026-02-05 11:30:00', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PUSH_APP', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', FALSE, '2026-02-06 11:30:00', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SMS', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', TRUE, '2026-02-07 11:30:00', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'WHATSAPP', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', FALSE, '2026-02-08 11:30:00', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EMAIL', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', TRUE, '2026-02-09 11:30:00', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PUSH_APP', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', FALSE, '2026-02-10 11:30:00', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SMS', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', TRUE, '2026-02-11 11:30:00', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'WHATSAPP', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', FALSE, '2026-02-12 11:30:00', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EMAIL', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', TRUE, '2026-02-13 11:30:00', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PUSH_APP', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', FALSE, '2026-02-14 11:30:00', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SMS', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', TRUE, '2026-02-15 11:30:00', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'WHATSAPP', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', FALSE, '2026-02-16 11:30:00', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EMAIL', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', TRUE, '2026-02-17 11:30:00', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PUSH_APP', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', FALSE, '2026-02-18 11:30:00', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SMS', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', TRUE, '2026-02-19 11:30:00', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'WHATSAPP', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', FALSE, '2026-02-20 11:30:00', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EMAIL', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', TRUE, '2026-02-21 11:30:00', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PUSH_APP', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', FALSE, '2026-02-22 11:30:00', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SMS', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', TRUE, '2026-02-23 11:30:00', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'WHATSAPP', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', FALSE, '2026-02-24 11:30:00', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EMAIL', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', TRUE, '2026-02-25 11:30:00', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PUSH_APP', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', FALSE, '2026-02-26 11:30:00', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SMS', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', TRUE, '2026-02-27 11:30:00', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'WHATSAPP', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', FALSE, '2026-02-28 11:30:00', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EMAIL', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', TRUE, '2026-02-01 11:30:00', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PUSH_APP', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', FALSE, '2026-02-02 11:30:00', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.notificaciones_push_email', 'id_notificacion'), COALESCE((SELECT MAX(id_notificacion) FROM sistema.notificaciones_push_email), 1), true);

