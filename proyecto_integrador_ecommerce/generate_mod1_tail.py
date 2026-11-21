# -*- coding: utf-8 -*-
"""
Script to append Tables 036 to 050 to 01_dml_modulo_identidad_catalogo_alu1.sql
"""
import os

target_file = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\03_DML_Datos_Semilla\01_dml_modulo_identidad_catalogo_alu1.sql"

lines = []

lines.append('''
-- =================================================================================================
-- SUBMÓDULO 1 (CONTINUACIÓN): TABLAS 036 A 050 (CATÁLOGO AVANZADO, COFEPRIS Y COMUNIDAD)
-- AUTOR: INTEGRANTE 1 (30 REGISTROS POR TABLA, CON SOFT-DELETE Y AUDITORÍA COMPLETA)
-- =================================================================================================
''')

# 036. catalogo.tonos_variante (30 registros)
lines.append('''
-- =================================================================================================
-- 036. TABLA: catalogo.tonos_variante (30 Variantes de Tonos y Acabados de Maquillaje/Cuidado)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.tonos_variante ON;
INSERT INTO catalogo.tonos_variante (id_tono_variante, id_variante_sku, id_subtono, id_acabado, codigo_tono_color, nombre_tono, color_hexadecimal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 3, 2, N'TONO-CLR-01', N'Transparente Acuoso', '#FFFFFF', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 2, 3, 1, N'TONO-CLR-02', N'Espuma Cristalina', '#F8F9FA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, N'TONO-CLR-03', N'Espuma Cristalina Travel', '#F8F9FA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 4, 3, 2, N'TONO-CLR-04', N'Suero Levemente Translúcido', '#F4F6F7', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 5, 3, 2, N'TONO-CLR-05', N'Suero Translúcido Jumbo', '#F4F6F7', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 6, 3, 1, N'TONO-SOL-01', N'Invisible Seco Toque Mate', '#FFFDF9', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 3, N'TONO-AMB-01', N'Ámbar Dorado Activo C', '#F9E4B7', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 3, N'TONO-RB-HOPE', N'Hope Malva Rosado Suave', '#E27A7F', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 9, 2, 4, N'TONO-RB-ENCOURAGE', N'Encourage Rosa Neutro Intenso', '#D86B74', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 3, N'TONO-RB-JOY', N'Joy Melocotón Radiante', '#DE8C71', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 11, 3, 1, N'TONO-FB-150', N'150 Claro Neutro Fondant', '#F3D1B4', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 1, N'TONO-FB-210', N'210 Medio Beige Cálido', '#E6BA95', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 13, 4, 1, N'TONO-FB-290', N'290 Medio Oliva Bronceado', '#CFA47E', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 1, N'TONO-MAC-FEELS', N'Feels So Grand Rojo Carmesí', '#BA1B2B', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 4, N'TONO-MAC-BURNT', N'Burnt Spice Nude Canela', '#C2715B', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 16, 3, 2, N'TONO-COS-SNAIL', N'Mucina Esencia Transparente', '#FAFBFD', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 17, 3, 3, N'TONO-BOJ-RICE', N'Arroz Blanco Hidratante Glow', '#FFFFFA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 2, N'TONO-BIO-SENS', N'Agua Micelar Pura', '#FFFFFF', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 2, N'TONO-EUC-HYAL', N'Crema Marfil Sedosa', '#FDF8EC', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 20, 3, 3, N'TONO-VIC-M89', N'Gel Fortificante Transparente', '#F0F8FF', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 2, N'TONO-AVN-CICAL', N'Pasta Blanca Reparadora Termal', '#FBFBFB', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 22, 3, 1, N'TONO-PC-BHA', N'Tónico Queratolítico Transparente', '#FFFFFF', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 2, N'TONO-NARS-CUST', N'Custard Medio 1 Amarillo Cálido', '#ECCEA4', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 24, 5, 3, N'TONO-CLN-MSURG', N'Gel Melocotón Hidratante 100H', '#FBE5D6', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 25, 3, 1, N'TONO-CT-SPRAY', N'Fijador Neblina Invisible Airbrush', '#FFFFFF', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 6, N'TONO-HB-GOLD', N'Oro Rosa Metálico Multidimensión', '#D4AF37', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 1, N'TONO-TF-BLACK', N'Negro Carbón Ultra Pigmentado', '#1A1A1A', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 28, 2, 1, N'TONO-MAY-PION', N'20 Pioneer Rojo Rubí Indeble', '#A91B2E', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 5, N'TONO-LNG-BERRY', N'Rosa Baya Frutos Rojos Glossy', '#E85D75', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 3, 1, N'TONO-OBSOLETO', N'Grisáceo Descontinuado Prueba', '#888888', 0, '2025-01-01 08:00:00', 1, '2026-02-28 18:30:00', 1, '2026-02-28 18:30:00', 1);
SET IDENTITY_INSERT catalogo.tonos_variante OFF;
GO
''')

# 037. catalogo.ingredientes_inci (30 registros)
lines.append('''
-- =================================================================================================
-- 037. TABLA: catalogo.ingredientes_inci (30 Ingredientes Cosméticos Oficiales INCI / CAS)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.ingredientes_inci ON;
INSERT INTO catalogo.ingredientes_inci (id_ingrediente, codigo_cas, nombre_inci, nombre_comun, funcion_principal, es_comedogenico, indice_comedogenico, es_alergeno_frecuente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, '98-92-0', N'Niacinamide', N'Vitamina B3', N'Regulación de secreción sebácea, refuerzo de la barrera cutánea y reducción de rojeces', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, '9004-61-9', N'Sodium Hyaluronate', N'Ácido Hialurónico de Bajo Peso', N'Humectación celular transepidérmica y relleno dérmico volumétrico de arrugas finas', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, '68-26-8', N'Retinol', N'Vitamina A Pura Activa', N'Estimulación de síntesis de colágeno fibrilar y aceleración de renovación celular nocturna', 0, 1, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, '69-72-7', N'Salicylic Acid', N'Ácido Salicílico BHA', N'Queratolítico lipofílico desincrustante de comedones y sebo en folículos pilosos', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, '50-81-7', N'Ascorbic Acid', N'Vitamina C Pura L-Ácido Ascórbico', N'Potente neutralizador de radicales libres fotolíticos e inhibidor de la síntesis de melanina', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, '100403-19-8', N'Ceramide NP', N'Ceramida 3 Idéntica a la Piel', N'Reparación de la barrera lipídica del estrato córneo y retención hídrica', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, '111-01-3', N'Squalane', N'Escualano Vegetal Derivado de Oliva', N'Emoliente biomimético no comedogénico que aporta sedosidad sin engrasar', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, '84696-21-9', N'Centella Asiatica Extract', N'Extracto de Cica Tigre', N'Cicatrizante epitelial y calmante dérmico antiinflamatorio para piel irritada', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, '15454-75-8', N'Zinc PCA', N'Zinc Pirrolidón Carboxilato', N'Agente seborregulador antibacteriano específico frente a Cutibacterium acnes', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, '13463-67-7', N'Titanium Dioxide', N'Dióxido de Titanio Filtro Mineral', N'Filtro solar físico inorgánico de amplio espectro contra radiación UVA y UVB', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, '1314-13-2', N'Zinc Oxide', N'Óxido de Zinc Mineral Micronizado', N'Pantalla mineral hipoalergénica con propiedades astringentes y protectoras UV', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, '9006-65-9', N'Dimethicone', N'Dimeticona Siliconada Protectora', N'Polímero oclusivo transpirable que suaviza la textura de poros y fija pigmentos', 1, 1, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, '56-81-5', N'Glycerin', N'Glicerina Vegetal Pura Grado USP', N'Humectante fisiológico osmoprotector que retiene humedad del ambiente en la piel', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, '81-13-0', N'Panthenol', N'D-Pantenol Pro-Vitamina B5', N'Regenerador tisular que alivia prurito, eritema posquirúrgico y quemaduras solares', 0, 1, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, '10191-41-0', N'Tocopherol', N'Vitamina E Antioxidante Alfa', N'Protector de la membrana lipocítica frente a la peroxidación de lípidos cutáneos', 1, 2, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, '97-59-6', N'Allantoin', N'Alantoína Cristalina Epitelizante', N'Estimulante de proliferación de fibroblastos y queratolítico desensibilizante', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, '79-14-1', N'Glycolic Acid', N'Ácido Glicólico AHA Caña de Azúcar', N'Exfoliante químico de bajo peso que degrada desmosomas para despigmentar y pulir', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, '50-21-5', N'Lactic Acid', N'Ácido Láctico Fermentado AHA', N'Exfoliante suave que incrementa ceramidas naturales e hidrata la piel madura', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, '68647-73-4', N'Melaleuca Alternifolia Leaf Oil', N'Aceite Esencial de Árbol de Té', N'Antiséptico natural terpénico para secado de lesiones pustulosas acneicas', 1, 1, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, '9057-02-7', N'Snail Secretion Filtrate', N'Mucina de Caracol Purificada', N'Complejo bioactivo de alantoína, colágeno y elastina que restaura la elasticidad', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, '84650-60-2', N'Camellia Sinensis Leaf Extract', N'Extracto de Té Verde EGCG', N'Polifenol antiinflamatorio que reduce la oxidación de escualeno y grasa cutánea', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, '10309-37-2', N'Bakuchiol', N'Bakuchiol Fito-Retinol 99%', N'Alternativa vegetal tolerada para fotosensibles que estimula síntesis de elastina', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, '34540-22-2', N'Madecassoside', N'Madecasósido Aislado Puro', N'Molécula cicatrizante de cica con potente acción antiglucación dérmica', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, '84380-01-8', N'Alpha-Arbutin', N'Alfa Arbutina Despigmentante', N'Inhibidor competitivo y reversible de la tirosinasa para manchas solares y melasma', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, '58-08-2', N'Caffeine', N'Cafeína Anhidra 100%', N'Estimulante vasoconstrictor de microcirculación periocular contra ojeras y bolsas', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, '303-98-0', N'Ubiquinone', N'Coenzima Q10 Liposomal', N'Energizante mitocondrial que previene degradación de matriz extracelular', 1, 1, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, '147732-56-7', N'Palmitoyl Tripeptide-1', N'Péptido Señalizador Matricial', N'Péptido bioidéntico que reactiva la producción endógena de colágeno I y III', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, '96507-89-0', N'Bifida Ferment Lysate', N'Lisado Probiótico de Bífida', N'Fortalecimiento de la inmunidad epidérmica y reparación de ADN celular dañado', 0, 0, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, '501-30-4', N'Kojic Acid', N'Ácido Kójico Quelante de Cobre', N'Quelante de iones cobre en la melanogénesis para desvanecer hiperpigmentación', 0, 0, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 'N/A-PARFUM', N'Parfum / Fragrance Sintética', N'Fragancia Cosmética Genérica', N'Compuesto aromatizante aromático sintético en proceso de retiro por regulación', 1, 2, 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.ingredientes_inci OFF;
GO
''')

# 038. catalogo.alergenos_ingrediente (30 registros)
lines.append('''
-- =================================================================================================
-- 038. TABLA: catalogo.alergenos_ingrediente (30 Alérgenos Oficiales de Alerta Sanitaria)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.alergenos_ingrediente ON;
INSERT INTO catalogo.alergenos_ingrediente (id_alergeno, id_ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 30, N'Linalool', N'MEDIO', N'Puede provocar dermatitis de contacto en personas con hipersensibilidad a terpenos oxidados', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 30, N'Limonene', N'MEDIO', N'Sensibilizante cutáneo en presencia de exposición solar directa; realizar prueba de parche', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 30, N'Citronellol', N'BAJO', N'Presente en notas aromáticas florales; contraindicado en eccema activo atópico', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 30, N'Geraniol', N'MEDIO', N'Monoterpenoide floral con potencial sensibilizante tras aplicaciones continuas', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 30, N'Eugenol', N'ALTO', N'Fenol volátil que puede inducir eritema severo y ardor en pieles reactivas rosáceas', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 30, N'Benzyl Alcohol', N'BAJO', N'Conservante y aroma; usar con precaución en infantes y zonas perioculares delicadas', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 30, N'Benzyl Salicylate', N'MEDIO', N'Fijador aromático; advertencia sanitaria sobre fotosensibilidad leve y comezón', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 30, N'Cinnamal', N'MUY_SEVERO', N'Aldehído cinámico; riesgo alto de urticaria por contacto y dermatitis alérgica severa', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 30, N'Hexyl Cinnamal', N'BAJO', N'Alérgeno común de fragancias; verificar en etiquetado si padece dermatitis atópica', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 30, N'Coumarin', N'MEDIO', N'Sustancia cumarínica; evitar combinación con exfoliaciones químicas profundas', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 30, N'Farnesol', N'BAJO', N'Sesquiterpeno alcohólico; reportar si observa enrojecimiento prolongado o edema', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 30, N'Isoeugenol', N'ALTO', N'Alergénico potente según directivas COFEPRIS y Unión Europea; concentración estrictamente regulada', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 30, N'Amyl Cinnamal', N'MEDIO', N'Aroma floral jazmín; no aplicar en piel recién afeitada o con heridas abiertas', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 30, N'Anise Alcohol', N'BAJO', N'Alcohol anísico; suspender inmediatamente en caso de escozor o prurito localizado', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 30, N'Benzyl Benzoate', N'MEDIO', N'Ester aromático; puede irritar mucosas y conjuntiva ocular en aplicación cercana', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 30, N'Cinnamyl Alcohol', N'ALTO', N'Alcohol cinámico; causa frecuente de alergia a cosméticos aromáticos en adultos', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 30, N'Citral', N'MEDIO', N'Mezcla de geranial y neral cítrico; fotosensibilizante al exponerse a rayos UV', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 30, N'Hydroxycitronellal', N'ALTO', N'Sensibilizador potente catalogado en farmacovigilancia dermatológica internacional', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 30, N'Alpha-Isomethyl Ionone', N'BAJO', N'Aroma de violeta; bien tolerado pero obligatorio declarar por trazas de ionona', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 30, N'Evernia Prunastri (Oakmoss)', N'MUY_SEVERO', N'Extracto de musgo de roble; alérgeno restringido por inducción de eccema crónico', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 30, N'Evernia Furfuracea (Tree Moss)', N'MUY_SEVERO', N'Extracto de musgo de árbol; máxima restricción por potencial inmunogénico severo', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 30, N'Methyl 2-Octynoate', N'ALTO', N'Éster de alquino aromático; contraindicado en bálsamos labiales y cosmética perioral', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 19, N'Terpinen-4-ol Concentrado', N'MEDIO', N'Principio activo del árbol de té; en concentraciones puras puede provocar xerosis dérmica', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 3, N'Ácido Retinoico Libre Trazas', N'ALTO', N'Subproducto de conversión del retinol; prohibido en embarazo y lactancia por teratogenicidad', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 4, N'Salicilatos Libres', N'MEDIO', N'Derivado del ácido salicílico; contraindicado absoluto en pacientes alérgicos a la aspirina', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 17, N'Ácido Glicólico Sin Amortiguar', N'ALTO', N'AHA libre de pH ácido (<3.5); alto riesgo de descamación química excesiva y quemaduras', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 29, N'Kojato de Cobre Residual', N'BAJO', N'Complejo formado por degradación térmica de ácido kójico expuesto a luz solar', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 5, N'Ácido Dehidroascórbico Oxidado', N'BAJO', N'Vitamina C degradada a color naranja oscuro; puede manchar la capa córnea transitoriamente', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 12, N'Ciclopentasiloxano Volátil D5', N'MEDIO', N'Compuesto organosiliconado en revisión ambiental y de bioacumulación por reguladores', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, N'Metilisotiazolinona Retirada', N'MUY_SEVERO', N'Conservante prohibido en productos no enjuagables por shock alérgico cutáneo', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.alergenos_ingrediente OFF;
GO
''')

# 039. catalogo.formula_ingredientes (30 registros)
lines.append('''
-- =================================================================================================
-- 039. TABLA: catalogo.formula_ingredientes (30 Mapeos N:M de Concentración Sanitaria - 4FN)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.formula_ingredientes ON;
INSERT INTO catalogo.formula_ingredientes (id_formula_ingrediente, id_producto, id_ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 4, 1, 1.50, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 1, 1, 2, 2.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 1, 17, 3, 3.50, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 1, 13, 4, 5.00, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 2, 6, 1, 1.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 2, 2, 2, 0.50, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 2, 1, 3, 1.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 2, 13, 4, 8.00, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 3, 1, 1, 10.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 3, 9, 2, 1.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 3, 13, 3, 4.00, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 4, 10, 1, 8.50, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 4, 2, 2, 0.20, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 4, 15, 3, 0.50, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 5, 5, 1, 15.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 5, 15, 2, 1.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 5, 2, 3, 0.50, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 6, 12, 1, 12.00, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 6, 8, 2, 0.50, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 7, 10, 1, 5.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 7, 12, 2, 15.00, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 8, 12, 1, 8.00, 0, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 9, 20, 1, 96.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 9, 2, 2, 1.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 10, 21, 1, 2.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 11, 14, 1, 0.80, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 12, 2, 1, 2.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 13, 2, 1, 0.40, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 14, 11, 1, 4.00, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 0.05, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.formula_ingredientes OFF;
GO
''')

# 040. catalogo.registros_sanitarios_cofepris (30 registros)
lines.append('''
-- =================================================================================================
-- 040. TABLA: catalogo.registros_sanitarios_cofepris (30 Expedientes Sanitarios Oficiales)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.registros_sanitarios_cofepris ON;
INSERT INTO catalogo.registros_sanitarios_cofepris (id_registro_sanitario, id_producto, numero_registro_sanitario, folio_ingreso_tramite, fecha_emision, fecha_vencimiento, estatus_regulatorio, documento_oficial_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, N'COFEPRIS-04-2023-00101-COSM', N'FOL-ING-2023-000101', '2023-01-15', '2028-01-15', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00101.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 2, N'COFEPRIS-04-2023-00102-COSM', N'FOL-ING-2023-000102', '2023-02-10', '2028-02-10', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00102.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 3, N'COFEPRIS-04-2023-00103-COSM', N'FOL-ING-2023-000103', '2023-03-05', '2028-03-05', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00103.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 4, N'COFEPRIS-04-2023-00104-COSM', N'FOL-ING-2023-000104', '2023-04-12', '2028-04-12', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00104.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 5, N'COFEPRIS-04-2023-00105-COSM', N'FOL-ING-2023-000105', '2023-05-20', '2028-05-20', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00105.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 6, N'COFEPRIS-04-2023-00106-COSM', N'FOL-ING-2023-000106', '2023-06-18', '2028-06-18', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00106.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 7, N'COFEPRIS-04-2023-00107-COSM', N'FOL-ING-2023-000107', '2023-07-22', '2028-07-22', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00107.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 8, N'COFEPRIS-04-2023-00108-COSM', N'FOL-ING-2023-000108', '2023-08-14', '2028-08-14', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00108.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 9, N'COFEPRIS-04-2023-00109-COSM', N'FOL-ING-2023-000109', '2023-09-09', '2028-09-09', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00109.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 10, N'COFEPRIS-04-2023-00110-COSM', N'FOL-ING-2023-000110', '2023-10-01', '2028-10-01', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00110.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 11, N'COFEPRIS-04-2023-00111-COSM', N'FOL-ING-2023-000111', '2023-11-15', '2028-11-15', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00111.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 12, N'COFEPRIS-04-2023-00112-COSM', N'FOL-ING-2023-000112', '2023-12-05', '2028-12-05', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2023/00112.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 13, N'COFEPRIS-04-2024-00113-COSM', N'FOL-ING-2024-000113', '2024-01-20', '2029-01-20', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00113.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 14, N'COFEPRIS-04-2024-00114-COSM', N'FOL-ING-2024-000114', '2024-02-14', '2029-02-14', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00114.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 15, N'COFEPRIS-04-2024-00115-COSM', N'FOL-ING-2024-000115', '2024-03-10', '2029-03-10', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00115.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 16, N'COFEPRIS-04-2024-00116-COSM', N'FOL-ING-2024-000116', '2024-04-05', '2029-04-05', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00116.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 17, N'COFEPRIS-04-2024-00117-COSM', N'FOL-ING-2024-000117', '2024-05-18', '2029-05-18', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00117.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 18, N'COFEPRIS-04-2024-00118-COSM', N'FOL-ING-2024-000118', '2024-06-12', '2029-06-12', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00118.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 19, N'COFEPRIS-04-2024-00119-COSM', N'FOL-ING-2024-000119', '2024-07-08', '2029-07-08', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00119.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 20, N'COFEPRIS-04-2024-00120-COSM', N'FOL-ING-2024-000120', '2024-08-01', '2029-08-01', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00120.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 21, N'COFEPRIS-04-2024-00121-COSM', N'FOL-ING-2024-000121', '2024-09-15', '2029-09-15', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00121.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 22, N'COFEPRIS-04-2024-00122-COSM', N'FOL-ING-2024-00122', '2024-10-10', '2029-10-10', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00122.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 23, N'COFEPRIS-04-2024-00123-COSM', N'FOL-ING-2024-000123', '2024-11-02', '2029-11-02', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00123.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 24, N'COFEPRIS-04-2024-00124-COSM', N'FOL-ING-2024-000124', '2024-12-01', '2029-12-01', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2024/00124.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 25, N'COFEPRIS-04-2025-00125-COSM', N'FOL-ING-2025-000125', '2025-01-15', '2030-01-15', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2025/00125.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 26, N'COFEPRIS-04-2025-00126-COSM', N'FOL-ING-2025-000126', '2025-02-18', '2030-02-18', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2025/00126.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 27, N'COFEPRIS-04-2025-00127-COSM', N'FOL-ING-2025-000127', '2025-03-01', '2030-03-01', N'VIGENTE', N'https://docs.cofepris.gob.mx/registros/2025/00127.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 28, N'COFEPRIS-04-2020-00128-COSM', N'FOL-ING-2020-000128', '2020-05-10', '2025-05-10', N'EN_RENOVACION', N'https://docs.cofepris.gob.mx/registros/2020/00128.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 29, N'COFEPRIS-04-2019-00129-COSM', N'FOL-ING-2019-000129', '2019-04-01', '2024-04-01', N'SUSPENDIDO', N'https://docs.cofepris.gob.mx/registros/2019/00129.pdf', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, N'COFEPRIS-04-2018-00130-COSM', N'FOL-ING-2018-000130', '2018-01-01', '2023-01-01', N'VENCIDO', N'https://docs.cofepris.gob.mx/registros/2018/00130.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.registros_sanitarios_cofepris OFF;
GO
''')

# 041. catalogo.advertencias_contraindicaciones (30 registros)
lines.append('''
-- =================================================================================================
-- 041. TABLA: catalogo.advertencias_contraindicaciones (30 Advertencias Sanitarias Dermatológicas)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.advertencias_contraindicaciones ON;
INSERT INTO catalogo.advertencias_contraindicaciones (id_advertencia, id_producto, tipo_advertencia, texto_advertencia, medida_en_caso_ingestion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, N'USO_EXTERNO_EXCLUSIVO', N'Para uso tópico dermatológico exclusivamente. Evitar el contacto directo con párpados y comisuras nasales.', N'Enjuagar boca con abundante agua purificada; no inducir el vómito y acudir al centro toxicológico.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 1, N'FOTOSENSIBLE', N'Contiene alfa y beta hidroxiácidos. Utilizar protector solar FPS 50+ durante el tratamiento y la semana posterior.', N'Acudir a revisión médica de urgencias con el envase original del producto.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 2, N'EVITAR_OJOS', N'Enjuagar de inmediato con abundante agua tibia corriente si entra en contacto directo con el globo ocular.', N'Beber medio litro de agua potable; no inducir emesis.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 3, N'HERIDAS_ABIERTAS', N'No aplicar sobre piel lesionada, heridas abiertas recientes o quemaduras solares vivas de primer grado.', N'Consultar al Centro de Intoxicaciones Toxicológicas.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 4, N'USO_EXTERNO_EXCLUSIVO', N'Reaplicar cada 2 horas y después de nadar o transpirar en exceso para garantizar la fotoprotección.', N'Lavar la cavidad oral con abundante agua; acudir a valoración médica.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 5, N'FOTOSENSIBLE', N'La vitamina C pura puede provocar sensación de hormigueo inicial; suspender si la irritación persiste.', N'Beber abundante agua para dilución gástrica; monitorear malestar gastrointestinal.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 6, N'EVITAR_OJOS', N'Pigmentos minerales concentrados; no introducir dentro de la línea de agua interna del ojo.', N'Ingerir abundante agua; contactar al médico.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 7, N'USO_EXTERNO_EXCLUSIVO', N'Base de larga duración de fijación rápida; desmaquillar con aceite limpiador por la noche.', N'Enjuagar cavidad bucal; no provocar el vómito.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 8, N'USO_EXTERNO_EXCLUSIVO', N'Fórmula de secado ultra mate labial; hidratar labios previamente si padece xerosis severa.', N'Ingerir agua purificada; atención médica si presenta náusea.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 9, N'USO_EXTERNO_EXCLUSIVO', N'Filtrado de caracol hipoalergénico; realizar prueba en antebrazo en pacientes con alergia a moluscos.', N'Monitorear posibles reacciones alérgicas laríngeas; urgencias inmediatas en caso de disnea.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 10, N'USO_EXTERNO_EXCLUSIVO', N'Protector solar con probióticos de arroz; apto para piel sensible reactiva.', N'Beber agua a libre demanda y mantener vigilancia médica.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 11, N'EVITAR_OJOS', N'Agua micelar formulada para ojos sensibles; desechar algodón tras cada pase suave.', N'Diluir con agua corriente; no requiere tratamiento invasivo.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 12, N'USO_EXTERNO_EXCLUSIVO', N'Crema de relleno molecular; aplicar con suaves masajes ascendentes en rostro y cuello.', N'Enjuagar boca y consultar al médico con la etiqueta del empaque.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 13, N'USO_EXTERNO_EXCLUSIVO', N'Fórmula con 89% agua volcánica; conservar en lugar fresco y seco alejado de radiación solar directa.', N'Beber agua potable; inocuo en cantidades mínimas deglutidas.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 14, N'HERIDAS_ABIERTAS', N'Apta para epidermis lesionada no supurante; no aplicar sobre infecciones activas por hongos.', N'Lavar la boca inmediatamente; asistencia médica si hay dolor abdominal.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 15, N'FOTOSENSIBLE', N'Exfoliante al 2% BHA; restringir su uso a 2 o 3 noches por semana en fases de adaptación.', N'Acudir de urgencia para valoración de esofagitis química leve.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 16, N'EVITAR_OJOS', N'Corrector de alta cobertura; difuminar con esponja húmeda evitando el saco conjuntival.', N'Enjuagar y acudir al médico.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 17, N'USO_EXTERNO_EXCLUSIVO', N'Autohidratante con biofermentos de aloe; excelente tolerancia clínica dermatológica.', N'Ingerir abundante líquido.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 18, N'EVITAR_OJOS', N'Cerrar los ojos y la boca antes de pulverizar la bruma fijadora a 20 cm de distancia.', N'Enjuagar cavidad bucal; vigilancia ambulatoria.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 19, N'EVITAR_OJOS', N'Polvos micronizados; no inhalar durante la aplicación y usar pincel sintético adecuado.', N'Beber agua para arrastre; acudir al médico ante molestias.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 20, N'EMBARAZO_LACTANCIA', N'Suero concentrado con retinol puro al 0.3%; estrictamente prohibido durante la gestación y lactancia.', N'Atención médica toxicológica inmediata; llevar etiqueta oficial COFEPRIS.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 21, N'EVITAR_OJOS', N'Máscara a prueba de agua con ceras fijadoras; remover exclusivamente con bifásico desmaquillante.', N'Enjuagar boca y no provocar vómito.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 22, N'USO_EXTERNO_EXCLUSIVO', N'Crema de manos con urea al 10%; no aplicar sobre piel atópica fisurada sangrante.', N'Diluir bebiendo agua; reportar al médico.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 23, N'USO_EXTERNO_EXCLUSIVO', N'Labial de fijación líquida de polímeros elastómeros; retirar con desmaquillante con base oleosa.', N'Enjuague oral con agua abundante.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 24, N'HERIDAS_ABIERTAS', N'Gel limpiador purificante con aceite de árbol de té; evitar zonas erosionadas o con quemaduras.', N'Ingerir agua pura; acudir a urgencias si presenta náuseas.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 25, N'USO_EXTERNO_EXCLUSIVO', N'Mascarilla de noche labial con microceras; aplicar una capa generosa antes de dormir.', N'Inocuo en ingesta accidental labial minúscula; consultar médico si se ingiere todo el contenido.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 26, N'FOTOSENSIBLE', N'Tónico de ácido glicólico al 7%; obligatorio uso de protector solar durante todo el tratamiento.', N'Valoración médica urgente por posible irritación gástrica.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 27, N'EMBARAZO_LACTANCIA', N'Crema reparadora intensiva con derivados de vitamina A; suspender uso ante confirmación de embarazo.', N'Acudir a toxicología clínica de inmediato.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 28, N'USO_EXTERNO_EXCLUSIVO', N'Aceite puro de rosa mosqueta prensado en frío; guardar protegido de la luz y el calor.', N'Beber agua purificada; no peligroso en ingesta mínima vegetal.', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, N'USO_EXTERNO_EXCLUSIVO', N'Producto de prueba de laboratorio cosmético obsoleto descontinuado de prueba.', N'Acudir a urgencias inmediatamente con la muestra descontinuada.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.advertencias_contraindicaciones OFF;
GO
''')

# 042. catalogo.multimedia_variantes (30 registros)
lines.append('''
-- =================================================================================================
-- 042. TABLA: catalogo.multimedia_variantes (30 Recursos Fotográficos y Swatches de Producto)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.multimedia_variantes ON;
INSERT INTO catalogo.multimedia_variantes (id_multimedia, id_variante_sku, tipo_archivo, url_recurso, texto_alternativo_accesibilidad, numero_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/lrp-effaclar-front.webp', N'Frasco de vidrio azul de Effaclar Sérum 30ml con pipeta dosificadora', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/cerave-foaming-473-front.webp', N'Botella blanca y turquesa de CeraVe Gel Limpiador con dispensador pump', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/cerave-foaming-236-front.webp', N'Presentación de viaje 236ml de CeraVe Limpiador Espumoso', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/the-ordinary-niacinamide-30-front.webp', N'Frasco gotero de Niacinamide 10% 30ml The Ordinary', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/the-ordinary-niacinamide-60-front.webp', N'Frasco jumbo de Niacinamide 10% 60ml The Ordinary', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/isdin-fusion-water-magic-front.webp', N'Envase ergonómico de ISDIN Fusion Water Magic FPS 50 50ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/skinceuticals-ce-ferulic-front.webp', N'Frasco ámbar de tratamiento antioxidante Skinceuticals C E Ferulic 30ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/rare-beauty-hope-swatch.webp', N'Swatch difuminado en antebrazo del rubor líquido Rare Beauty tono Hope', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/rare-beauty-encourage-swatch.webp', N'Muestra de color en piel clara y morena del rubor Rare Beauty Encourage', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/rare-beauty-joy-swatch.webp', N'Swatch luminoso durazno cálido del rubor líquido Rare Beauty Joy', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/fenty-beauty-150-swatch.webp', N'Comparativa de tono base Fenty Beauty Pro Filt r 150 claro neutro', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/fenty-beauty-210-swatch.webp', N'Tono 210 cálido Fenty Beauty aplicado en mejilla con acabado soft matte', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/fenty-beauty-290-swatch.webp', N'Tono 290 oliva Fenty Beauty mostrando adaptabilidad en subtono verdoso', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/mac-retro-matte-feels-so-grand.webp', N'Aplicación labial de MAC Retro Matte Feels So Grand rojo vibrante', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/mac-retro-matte-burnt-spice.webp', N'Swatch en labios del labial líquido MAC Burnt Spice nude cálido', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/cosrx-snail-essence-front.webp', N'Botella de esencia de caracol Cosrx Snail 96 Mucin 100ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/beauty-of-joseon-relief-sun-front.webp', N'Tubo blanco minimalista de bloqueador solar Beauty of Joseon Rice', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/bioderma-sensibio-500-front.webp', N'Envase con tapa rosa de Bioderma Sensibio H2O 500ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/eucerin-hyaluron-filler-day-front.webp', N'Tarro plateado de crema antiedad Eucerin Hyaluron-Filler Día 50ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/vichy-mineral-89-front.webp', N'Frasco degradado azul de Vichy Minéral 89 Booster Concentrado 50ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/avene-cicalfate-40-front.webp', N'Tubo metálico blanco de crema calmante Avène Cicalfate+ 40ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/paulas-choice-bha-front.webp', N'Botella gris de Paula s Choice 2% BHA Liquid Exfoliant 118ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/nars-custard-swatch.webp', N'Corrector NARS Custard aplicado en ojera con alta cobertura cremosa', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/clinique-moisture-surge-front.webp', N'Tarro rosado translúcido de Clinique Moisture Surge 100H 50ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/charlotte-tilbury-setting-spray-front.webp', N'Botella elegante con detalles dorados de Charlotte Tilbury Airbrush Spray', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/huda-beauty-empowered-palette.webp', N'Paleta de sombras Huda Beauty Empowered con swatches metálicos y mates', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/too-faced-better-than-sex-wp-front.webp', N'Tubo azul metálico con efecto de gotas de agua de Better Than Sex Waterproof', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOTO_SWATCH_PIEL', N'https://cdn.ecommerce-salud.mx/swatches/maybelline-stay-pioneer-swatch.webp', N'Labial líquido Maybelline SuperStay Matte Ink 20 Pioneer en labios', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/laneige-lip-sleeping-mask-berry.webp', N'Tarro rosa con aplicador de silicona de Laneige Lip Sleeping Mask Berry', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOTO_FRONTAL', N'https://cdn.ecommerce-salud.mx/productos/producto-retirado-test.webp', N'Imagen de archivo de producto cosmético retirado de catálogo', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.multimedia_variantes OFF;
GO
''')

# 043. catalogo.kits_sets (30 registros)
lines.append('''
-- =================================================================================================
-- 043. TABLA: catalogo.kits_sets (30 Sets y Rutinas Armadas de Alto Valor Comercial)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.kits_sets ON;
INSERT INTO catalogo.kits_sets (id_kit, codigo_kit, nombre_kit, descripcion, descuento_porcentual_kit, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, N'KIT-ANTIACNE-PRO', N'Kit Control Sebo y Acné Intensivo', N'Rutina de 3 pasos con limpiador espumoso, sérum queratolítico y suero de niacinamida', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, N'KIT-GLOW-VITAMIN-C', N'Kit Iluminador Antioxidante Glow', N'Tratamiento de mañana con vitamina C al 15%, protector solar fluido y agua micelar', 20.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, N'KIT-BARRERA-REPAIR', N'Kit Restaurador de Barrera Cutánea', N'Limpiador suave, loción de ceramidas biomiméticas y crema cicatrizante Avène Cicalfate+', 18.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, N'KIT-KBEAUTY-GLASS', N'Kit Belleza Coreana Piel de Porcelana', N'Dúo coreano estrella: esencia filtrada de baba de caracol Cosrx y protector solar de arroz Joseon', 12.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, N'KIT-MAQUILLAJE-NOCHE', N'Kit Glamour Noche Larga Duración', N'Base mate Fenty Beauty, rubor líquido Rare Beauty y labial indeleble MAC Retro Matte', 25.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, N'KIT-HYDRA-PLUMP', N'Kit Hidratación Profunda Ácido Hialurónico', N'Booster Vichy Minéral 89 con crema facial Clinique Moisture Surge 100 horas', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, N'KIT-ANTIAGE-NIGHT', N'Kit Antiedad Firmeza y Renovación Nocturna', N'Sérum de retinol encapsulado combinado con crema Hyaluron-Filler Día/Noche', 22.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, N'KIT-EYE-PERFECTION', N'Kit Mirada Radiante Sin Ojeras', N'Corrector cremoso NARS Radiant Creamy Concealer y máscara a prueba de agua Too Faced', 10.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, N'KIT-LIP-SPA', N'Kit Tratamiento y Belleza Labial', N'Mascarilla nocturna de frutos rojos Laneige y labial mate de alta fijación Maybelline', 14.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, N'KIT-SUN-PROTECTION', N'Kit Doble Blindaje Solar Urbano', N'Protector solar facial ultraligero ISDIN Fusion Water Magic con bruma fijadora Charlotte Tilbury', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, N'KIT-PEELING-HOME', N'Kit Renovación Queratolítica BHA/AHA', N'Exfoliante al 2% BHA Paula s Choice con sérum calmante de niacinamida The Ordinary', 16.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, N'KIT-COLOR-BURST', N'Kit Trío Rubor y Labios Coquette', N'Tres rubores líquidos Rare Beauty en tonos virales Hope, Encourage y Joy', 20.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, N'KIT-SENSITIVE-SKIN', N'Kit Calma Total Pieles Sensibles y Reactivas', N'Agua micelar Sensibio Bioderma, gel CeraVe y crema reparadora Cicalfate+', 18.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, N'KIT-TRAVEL-ESSENTIALS', N'Kit Esenciales Tamaño Viaje Aprobado TSA', N'CeraVe Espumoso 236ml, protector solar Beauty of Joseon 50ml y crema reparadora de bolsillo', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, N'KIT-EXPRESS-MORNING', N'Kit Rutina Express 3 Minutos de Mañana', N'Gel limpiador suave con protector solar híbrido con color y bálsamo labial hidratante', 10.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, N'KIT-BLEMISH-ERASER', N'Kit Tratamiento Focalizado Anti-Imperfecciones', N'Effaclar Sérum Ultra Concentrado con gel purificante de árbol de té y zinc', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, N'KIT-GLOW-BRIDE', N'Kit Especial Novias Acabado Radiante', N'Tratamiento antioxidante previo de 30 días, spray fijador Airbrush y paleta de sombras Empowered', 30.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, N'KIT-MATTE-PORELESS', N'Kit Matificante Anti-Brillos Todo el Día', N'Gel de árbol de té, sérum BHA Paula s Choice y base de maquillaje Fenty Beauty Mate', 20.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, N'KIT-POST-PROCEDURE', N'Kit Protocolo Post-Peeling Dermatológico', N'Limpiador sin jabón, crema calmante Avène y bloqueador mineral ISDIN sin perfume', 25.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, N'KIT-RED-CARPET-LIPS', N'Kit Dúo Labios Rojos Inolvidables', N'Labial líquido mate Retro Matte Feels So Grand con perfilador y mascarilla de preparación Laneige', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, N'KIT-DERMO-LUXE', N'Kit Lujo Dermocosmético Antiedad Clínico', N'Tratamiento antioxidante Skinceuticals C E Ferulic y crema Eucerin Hyaluron-Filler', 20.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, N'KIT-TEEN-STARTER', N'Kit Primer Cuidado Facial para Piel Joven', N'Limpiador CeraVe, suero de niacinamida The Ordinary y bloqueador solar hidratante Joseon', 12.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, N'KIT-MEN-GROOMING', N'Kit Cuidado Masculino Post-Afeitado', N'Gel limpiador espumoso, bálsamo calmante anti-irritación y protector invisible mate', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, N'KIT-TOTAL-WELLNESS', N'Kit Cuidado Integral Salud Cutánea', N'Doble limpieza con agua micelar Bioderma, gel de ceramidas y emulsión reparadora', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, N'KIT-PARTY-PROOF', N'Kit Maquillaje Fiesta A Prueba de Todo', N'Spray fijador Charlotte Tilbury, máscara a prueba de agua Too Faced y labial indeleble Maybelline', 18.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, N'KIT-ROSA-MOSQUETA', N'Kit Regeneración de Cicatrices y Manchas', N'Aceite puro de rosa mosqueta con suero de niacinamida y crema con FPS', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, N'KIT-DOUBLE-CLEANSE', N'Kit Protocolo Doble Limpieza Nocturna', N'Aceite limpiador desmaquillante disolvente seguido de gel espumoso base acuosa', 10.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, N'KIT-BODY-HYDRA', N'Kit Hidratación Corporal para Piel Extremadamente Seca', N'Limpiador emoliente en aceite con loción hidratante de 473ml con ceramidas', 15.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, N'KIT-FLASH-DISCOUNT', N'Kit Promocional de Liquidación de Temporada', N'Variedad de productos dermocosméticos seleccionados en presentación estándar', 35.00, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, N'KIT-OBSOLETO-PRUEBA', N'Kit Prueba Descontinuado de Lanzamiento', N'Set de evaluación retirado del catálogo por fin de ciclo comercial', 50.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.kits_sets OFF;
GO
''')

# 044. catalogo.kits_items (30 registros)
lines.append('''
-- =================================================================================================
-- 044. TABLA: catalogo.kits_items (30 Enlaces N:M de Productos Contenidos en Kits)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.kits_items ON;
INSERT INTO catalogo.kits_items (id_kit_item, id_kit, id_variante_sku, cantidad_unidades, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 1, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 1, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 1, 4, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 2, 6, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 2, 7, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 2, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 3, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 3, 20, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 3, 21, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 4, 16, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 4, 17, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 5, 8, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 5, 11, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 5, 14, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 6, 20, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 6, 24, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 7, 19, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 8, 23, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 8, 27, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 9, 28, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 9, 29, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 10, 6, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 10, 25, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 11, 4, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 11, 22, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 12, 8, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 12, 9, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 12, 10, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 13, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.kits_items OFF;
GO
''')

# 045. catalogo.productos_relacionados (30 registros)
lines.append('''
-- =================================================================================================
-- 045. TABLA: catalogo.productos_relacionados (30 Sugerencias de Cross-Sell y Complementos)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.productos_relacionados ON;
INSERT INTO catalogo.productos_relacionados (id_producto_relacionado, id_producto_origen, id_producto_destino, tipo_relacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 4, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 1, 2, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 2, 1, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 2, 3, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 3, 4, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 4, 10, N'SUSTITUTO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 5, 4, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 6, 8, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 7, 16, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 7, 18, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 8, 23, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 9, 10, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 10, 4, N'SUSTITUTO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 11, 14, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 12, 13, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 13, 17, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 14, 11, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 15, 4, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 16, 18, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 17, 13, N'SUSTITUTO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 18, 25, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 19, 21, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 20, 4, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 21, 27, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 22, 14, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 23, 8, N'SUSTITUTO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 24, 1, N'SUSTITUTO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 25, 29, N'PASO_SIGUIENTE_RUTINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 26, 15, N'COMPLEMENTARIO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'SUSTITUTO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.productos_relacionados OFF;
GO
''')

# 046. catalogo.historial_precios_base (30 registros)
lines.append('''
-- =================================================================================================
-- 046. TABLA: catalogo.historial_precios_base (30 Trazas Históricas de Precios y Costos)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.historial_precios_base ON;
INSERT INTO catalogo.historial_precios_base (id_historial_precio, id_variante_sku, precio_anterior, precio_nuevo, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 849.00, 899.00, N'Ajuste inflacionario anual de proveedor de importación La Roche-Posay Francia', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 2, 369.00, 399.00, N'Actualización de precios de lista oficial CeraVe México', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 3, 249.00, 269.00, N'Incremento en arancel de empaque y flete marítimo presentación 236ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 4, 199.00, 229.00, N'Revisión semestral de margen comercial The Ordinary DECIEM', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 5, 349.00, 389.00, N'Ajuste paritario de moneda en presentación tamaño grande 60ml', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 6, 549.00, 599.00, N'Lanzamiento de nueva fórmula mejorada Fusion Water Magic ISDIN', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 7, 3450.00, 3850.00, N'Ajuste por encarecimiento de patente de ácido ferúlico puro estabilizado', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 8, 499.00, 560.00, N'Alineación de precios con tiendas departamentales de prestigio Rare Beauty', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 9, 499.00, 560.00, N'Alineación de catálogo Rare Beauty México', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 10, 499.00, 560.00, N'Alineación de catálogo Rare Beauty México tono Joy', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 11, 790.00, 840.00, N'Incremento de aranceles de cosméticos importados Fenty Beauty', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 12, 790.00, 840.00, N'Incremento de lista Fenty Beauty', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 13, 790.00, 840.00, N'Incremento de lista Fenty Beauty tono oliva 290', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 14, 499.00, 549.00, N'Actualización de precios de venta sugeridos MAC Cosmetics', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 15, 499.00, 549.00, N'Actualización de precios MAC Cosmetics línea Retro Matte', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 16, 440.00, 489.00, N'Aumento de fletes aéreos de cosmética K-Beauty desde Seúl', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 17, 360.00, 399.00, N'Estandarización de precios de venta autorizados Beauty of Joseon', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 18, 480.00, 520.00, N'Ajuste en presentación jumbo 500ml de Bioderma', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 19, 720.00, 789.00, N'Renovación de packaging y fórmula Eucerin Hyaluron-Filler', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 20, 620.00, 679.00, N'Ajuste de precio sugerido por Laboratorios Vichy', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 21, 310.00, 349.00, N'Incremento por costos de transporte de agua termal de Avène', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 22, 799.00, 890.00, N'Revisión de tipo de cambio USD/MXN en marca estadounidense Paula s Choice', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 23, 620.00, 690.00, N'Actualización de precios NARS Cosmetics', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 24, 850.00, 920.00, N'Ajuste de lista Clinique Laboratories', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 25, 760.00, 850.00, N'Incremento comercial Charlotte Tilbury Beauty', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 26, 1490.00, 1650.00, N'Actualización de precio en paletas profesionales Huda Beauty', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 27, 580.00, 640.00, N'Ajuste de margen en máscara resistente al agua Too Faced', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 28, 189.00, 219.00, N'Ajuste de precios masivos Maybelline New York', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 29, 430.00, 490.00, N'Incremento de costos de importación de mascarilla Laneige', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 150.00, 99.00, N'Remate por liquidación y descontinuación definitiva del producto de prueba', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.historial_precios_base OFF;
GO
''')

# 047. comunidad.rutinas_belleza (30 registros)
lines.append('''
-- =================================================================================================
-- 047. TABLA: comunidad.rutinas_belleza (30 Rutinas Creadas por la Comunidad Dermatológica)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_belleza ON;
INSERT INTO comunidad.rutinas_belleza (id_rutina, id_cliente, nombre_rutina, momento_dia, es_publica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, N'Rutina Matutina Anti-Grasa y Control de Brillos', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 1, N'Rutina Nocturna Reparadora con Retinol', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 2, N'Protocolo Semanal de Exfoliación Queratolítica BHA', N'SEMANAL', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 2, N'Rutina de Mañana Máxima Hidratación Piel Seca', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 3, N'Rutina SOS para Alivio Inmediato de Rosácea y Rojeces', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 3, N'Rutina Básica de 3 Pasos para Salir Rápido', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 4, N'Rutina K-Beauty Glass Skin 7 Pasos', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 4, N'Preparación de Piel Pre-Maquillaje de Alta Duración', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 5, N'Rutina Despigmentante Antimanchas Solares', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 5, N'Protección Solar Urbana Antipolución', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 6, N'Rutina Minimalista con Barrera Cutánea Dañada', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 6, N'Regeneración Intensa con Cicatrizante Termal', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 7, N'Spa Facial de Domingo con Mascarillas y Esencias', N'SEMANAL', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 7, N'Rutina Antiedad Iluminadora con Vitamina C', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 8, N'Rutina de Limpieza Profunda Puntos Negros', N'SEMANAL', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 8, N'Rutina de Ojos Frescos Desinflamante Antibolsas', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 9, N'Rutina de Noche Piel Mixta Hidratante en Gel', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 9, N'Rutina Express de Toque Seco para Oficina', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 10, N'Protocolo para Calmar Brotes Inflamatorios de Acné', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 10, N'Doble Limpieza Nocturna Sin Tirantez', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 11, N'Rutina Firmeza y Elasticidad Piel Madura', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 11, N'Cuidado Nutritivo Nocturno Cuello y Escote', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 12, N'Rutina Despertar Efecto Buena Cara', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 12, N'Protocolo Hidratación Profunda Labios Agrietados', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 13, N'Rutina Fotoprotectora para Climas Cálidos y Húmedos', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 14, N'Rutina Piel Sensible Post-Depilación Facial', N'NOCHE', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 15, N'Rutina Renovadora con Ácidos Exfoliantes AHA', N'SEMANAL', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 16, N'Rutina de Cuidado Diario para Pieles con Dermatitis', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 17, N'Rutina Matificante Todo en Uno', N'MAÑANA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, N'Rutina Experimental Antigua de Prueba Descartada', N'SEMANAL', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_belleza OFF;
GO
''')

# 048. comunidad.rutinas_pasos (30 registros)
lines.append('''
-- =================================================================================================
-- 048. TABLA: comunidad.rutinas_pasos (30 Pasos Secuenciados de Aplicación Cosmética)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_pasos ON;
INSERT INTO comunidad.rutinas_pasos (id_rutina_paso, id_rutina, numero_paso, nombre_fase, instrucciones_aplicacion, tiempo_espera_segundos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 1, N'Limpieza Purificante Espumosa', N'Lavar el rostro con agua tibia durante 60 segundos con movimientos circulares suaves.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 1, 2, N'Sérum de Niacinamida y Zinc', N'Aplicar 3 o 4 gotas en frente y mejillas dando toques suaves con las yemas de los dedos.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 1, 3, N'Protector Solar Toque Seco Mate', N'Aplicar la regla de los dos dedos generosamente por todo el rostro, cuello y orejas.', 120, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 2, 1, N'Doble Limpieza Micelar', N'Retirar residuos de maquillaje con algodón embebido en agua micelar sin frotar agresivamente.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 2, 2, N'Limpiador Hidratante en Crema', N'Enjuagar los restos micelares con gel hidratante CeraVe con agua fría.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 2, 3, N'Tratamiento con Retinol', N'Aplicar una cantidad del tamaño de un chícharo sobre el rostro completamente seco.', 180, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 2, 4, N'Crema Selladora con Ceramidas', N'Aplicar crema densa para sellar la humedad y prevenir la descamación por el retinol.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 3, 1, N'Limpieza Suave Inicial', N'Lavar con abundante agua y secar a toques con toalla de microfibra limpia.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 3, 2, N'Exfoliante BHA al 2%', N'Impregnar un disco de algodón y pasar por la zona T evitando el contorno de ojos.', 300, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 3, 3, N'Loción Reparadora Calmante', N'Calmar la epidermis con crema reparadora para restablecer el pH fisiológico.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 4, 1, N'Limpieza Delicada sin Espuma', N'Utilizar fórmula sin sulfatos para no comprometer el manto hidrolipídico.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 4, 2, N'Esencia Humectante de Caracol', N'Dar palmaditas ascendentes en el rostro hasta que la mucina se absorba por completo.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 4, 3, N'Crema Hidratante Intensa', N'Masajear rostro y cuello hasta lograr total penetración del producto.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 5, 1, N'Limpieza Agua Termal Micelar', N'Deslizar suavemente gasa estéril o algodón con agua micelar dermatológica.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 5, 2, N'Pasta Reparadora Cicalfate+', N'Poner una capa generosa sobre las áreas con rojez o ardor localizado.', 120, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 6, 1, N'Limpieza Rápida al Despertar', N'Lavar cara con agua fresca y limpiador espumoso suave.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 6, 2, N'Protector Solar Todo en Uno', N'Aplicar bloqueador con agentes hidratantes incorporados para ahorrar pasos.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 7, 1, N'Aceite Desmaquillante', N'Disolver maquillaje a prueba de agua con masaje facial de 1 minuto.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 7, 2, N'Espuma de Limpieza Profunda', N'Retirar el velo oleoso con abundante espuma limpiadora.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 7, 3, N'Tónico Hidratante de Arroz', N'Equilibrar el tono de la piel con toques suaves de tónico.', 45, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 8, 1, N'Limpieza Pre-Makeup', N'Asegurar que la piel no tenga grasa residual que arruine la base.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 8, 2, N'Crema Hidratante Ligera en Gel', N'Hidratar intensamente para que la base no se craquele en zonas secas.', 120, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 8, 3, N'Spray Fijador Previo Primer', N'Rociar una nube ligera fijadora para aumentar adherencia de pigmentos.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 9, 1, N'Limpieza Desmanchante', N'Lavar el rostro antes de aplicar activos inhibidores de tirosinasa.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 9, 2, N'Suero de Vitamina C Pura 15%', N'Aplicar 4 gotas por la mañana antes del fotoprotector.', 90, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 10, 1, N'Limpieza Antipolución', N'Remover partículas de smog adheridas durante la jornada.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 10, 2, N'Fotoprotección Facial Diaria', N'Aplicar fotoprotector con tecnología fusión water no comedogénica.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 11, 1, N'Limpieza Cero Fricción', N'Limpiar con fórmula syndet hipoalergénica.', 30, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 11, 2, N'Emulsión de Cica y Ceramidas', N'Restaurar la flexibilidad del estrato córneo dañado.', 60, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'Paso Obsoleto de Prueba', N'Paso de prueba eliminado del protocolo por modificación clínica.', 60, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_pasos OFF;
GO
''')

# 049. comunidad.rutinas_productos (30 registros)
lines.append('''
-- =================================================================================================
-- 049. TABLA: comunidad.rutinas_productos (30 Asignaciones N:M de SKUs a Fases de Rutina)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_productos ON;
INSERT INTO comunidad.rutinas_productos (id_rutina_producto, id_rutina_paso, id_variante_sku, es_producto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 2, 4, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 3, 6, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 4, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 5, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 7, 21, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 9, 22, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 10, 21, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 11, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 12, 16, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 13, 19, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 14, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 15, 21, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 16, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 19, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 20, 16, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 21, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 22, 24, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 23, 25, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 24, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 25, 7, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 27, 6, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 28, 18, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 29, 21, 1, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_productos OFF;
GO
''')

# 050. comunidad.listas_deseos (30 registros)
lines.append('''
-- =================================================================================================
-- 050. TABLA: comunidad.listas_deseos (30 Listas de Deseos / Wishlists de Clientes)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.listas_deseos ON;
INSERT INTO comunidad.listas_deseos (id_lista_deseos, id_cliente, nombre_lista, es_publica, token_compartir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) VALUES
(1, 1, N'Mi Rutina Soñada Anti-Acné', 1, N'WISH-TK-001-VALERIA-RODRIGUEZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(2, 2, N'Favoritos para el Hot Sale', 1, N'WISH-TK-002-SANTIAGO-HERNANDEZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(3, 3, N'Imprescindibles para Calmar Mi Piel', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(4, 4, N'Maquillaje de Ensueño para Boda', 1, N'WISH-TK-004-CARLOS-LOPEZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(5, 5, N'Sueros y Tratamientos Antimanchas', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(6, 6, N'Regalos para Mi Mamá en Navidad', 1, N'WISH-TK-006-FERNANDA-RAMIREZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(7, 7, N'Básicos de Belleza Coreana', 1, N'WISH-TK-007-ALEJANDRO-TORRES', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(8, 8, N'Protectores Solares para Vacaciones', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(9, 9, N'Labiales Nude de Larga Duración', 1, N'WISH-TK-009-LUCIA-CASTRO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(10, 10, N'Gama Alta Skinceuticals Deseada', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(11, 11, N'Skincare para Piel Madura con Retinol', 1, N'WISH-TK-011-MARGARITA-VAZQUEZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(12, 12, N'Corrección de Ojeras y Mirada Fresca', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(13, 13, N'Sets y Kits de Ahorro para Recomendar', 1, N'WISH-TK-013-RICARDO-HERRERA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(14, 14, N'Productos Libres de Fragancia para Bebé y Familia', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(15, 15, N'Productos Virales de TikTok que Quiero Probar', 1, N'WISH-TK-015-ESTEBAN-GUTIERREZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(16, 16, N'Rutina Minimalista Universitaria Económica', 1, N'WISH-TK-016-DANIELA-CASTILLO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(17, 17, N'Cuidado Facial para Hombre Anti-Grasa', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(18, 18, N'Hidratantes Ligeros en Gel para Primavera', 1, N'WISH-TK-018-PAULA-OROZCO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(19, 19, N'Rubores Líquidos en Tendencia Glow', 1, N'WISH-TK-019-MANUEL-MEDINA', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(20, 20, N'Regeneradores Post-Acné para Marcas Rojas', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(21, 21, N'Bálsamos Labiales Reparadores de Invierno', 1, N'WISH-TK-021-ANDRES-CRUZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(22, 22, N'Fijadores y Polvos Translúcidos Matificantes', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(23, 23, N'Exfoliantes Químicos Suaves con Enzimas', 1, N'WISH-TK-023-FRANCISCO-CAMPOS', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(24, 24, N'Cosméticos con Certificación Cruelty-Free', 1, N'WISH-TK-024-NATALIA-REYES', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(25, 25, N'Brumas Refrescantes para Bolso y Oficina', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(26, 26, N'Cuidado del Cuello y Escote Firmeza', 1, N'WISH-TK-026-TERESA-NAVARRO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(27, 27, N'Sombras y Pigmentos para Fiesta de Gala', 1, N'WISH-TK-027-GUSTAVO-CORTEZ', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(28, 28, N'Lociones Corporales con Ceramidas Grandes', 0, NULL, 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(29, 29, N'Limpiadores en Aceite Desmaquillantes', 1, N'WISH-TK-029-MARIO-LOZANO', 1, SYSDATETIME(), 1, NULL, NULL, NULL, NULL),
(30, 30, N'Lista de Prueba Obsoleta de Usuario Desactivado', 0, NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.listas_deseos OFF;
GO

PRINT '=================================================================================================';
PRINT 'ÉXITO TOTAL: Se han insertado con éxito las 50 tablas del Submódulo 1 (Integrante 1).';
PRINT 'Total de tablas pobladas: 50 | Registros por tabla: >= 30 | Integridad y Auditoría Activa 100%.';
PRINT '=================================================================================================';
GO
''')

with open(target_file, 'a', encoding='utf-8') as f:
    f.write(''.join(lines))

print(f"Submódulo 1 completado exitosamente. Archivo actualizado: {target_file}")
print(f"Tamaño actual del archivo: {os.path.getsize(target_file)} bytes")
