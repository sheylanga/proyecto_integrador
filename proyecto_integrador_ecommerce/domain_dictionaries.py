import json
import re
import os

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

# Realistic domain pools
NOMBRES_MX = [
    ("Carlos", "Mendoza", "Garza"), ("Sofía", "Ramírez", "López"), ("Valeria", "Torres", "Villarreal"),
    ("Alejandro", "Hernández", "Cruz"), ("Mariana", "Sánchez", "Fuentes"), ("Diego", "Martínez", "Treviño"),
    ("Camila", "González", "Reyes"), ("Mateo", "Flores", "Castillo"), ("Lucía", "Morales", "Díaz"),
    ("Sebastián", "Vázquez", "Ortiz"), ("Regina", "Gutiérrez", "Nava"), ("Santiago", "Jiménez", "Pérez"),
    ("Fernanda", "Ruiz", "Salazar"), ("Emiliano", "Ríos", "Cárdenas"), ("Ximena", "Aguilar", "Ibarra"),
    ("Daniel", "Méndez", "Navarro"), ("Andrea", "Castro", "Delgado"), ("Gabriel", "Vega", "Montoya"),
    ("Paula", "Cortés", "Rojas"), ("Andrés", "Ramos", "Campos"), ("Renata", "Guerrero", "Luna"),
    ("Nicolás", "Peña", "Cabrera"), ("Natalia", "Herrera", "Vargas"), ("Joaquín", "Medina", "Contreras"),
    ("Isabella", "Domínguez", "Escobar"), ("Leonardo", "Silva", "Paredes"), ("Ana", "Chávez", "Bautista"),
    ("Rodrigo", "Ochoa", "Acosta"), ("Paulina", "Miranda", "Leal"), ("Mauricio", "Padilla", "Solís")
]

CIUDADES_MX = [
    ("Monclova", "Coahuila", "25700", "Blvd. Harold R. Pape", "Centro"),
    ("Monterrey", "Nuevo León", "64000", "Av. Constitución", "Obispado"),
    ("San Pedro Garza García", "Nuevo León", "66220", "Calz. del Valle", "Del Valle"),
    ("Ciudad de México", "CDMX", "06700", "Av. Álvaro Obregón", "Roma Norte"),
    ("Ciudad de México", "CDMX", "11560", "Av. Presidente Masaryk", "Polanco"),
    ("Guadalajara", "Jalisco", "44100", "Av. Vallarta", "Americana"),
    ("Saltillo", "Coahuila", "25000", "Blvd. Venustiano Carranza", "República"),
    ("Querétaro", "Querétaro", "76000", "Av. 5 de Febrero", "Centro"),
    ("Puebla", "Puebla", "72000", "Av. Juárez", "La Paz"),
    ("Mérida", "Yucatán", "97000", "Paseo de Montejo", "Centro")
]

MARCAS_COSMETICA = [
    ("LA_ROCHE", "La Roche-Posay", "Francia"), ("CERAVE", "CeraVe Dermatological", "Estados Unidos"),
    ("THE_ORD", "The Ordinary Deciem", "Canadá"), ("ISDIN", "ISDIN Fotoprotección", "España"),
    ("BIODERMA", "Bioderma Laboratoire", "Francia"), ("AVENE", "Eau Thermale Avène", "Francia"),
    ("EUCERIN", "Eucerin Beiersdorf", "Alemania"), ("VICHY", "Vichy Laboratoires", "Francia"),
    ("SKINC", "SkinCeuticals Clinical", "Estados Unidos"), ("SESDERMA", "Sesderma Nanotech", "España"),
    ("NARS", "NARS Cosmetics", "Estados Unidos"), ("MAC", "MAC Professional", "Canadá"),
    ("FENTY", "Fenty Beauty", "Estados Unidos"), ("RARE", "Rare Beauty", "Estados Unidos"),
    ("CLINIQUE", "Clinique Laboratories", "Estados Unidos"), ("ESTEE", "Estée Lauder", "Estados Unidos"),
    ("LANCOME", "Lancôme Paris", "Francia"), ("CHARLOTTE", "Charlotte Tilbury", "Reino Unido"),
    ("PAULA", "Paula's Choice Skincare", "Estados Unidos"), ("COSRX", "COSRX K-Beauty", "Corea del Sur"),
    ("LANEIGE", "Laneige Amorepacific", "Corea del Sur"), ("URIAGE", "Uriage Eau Thermale", "Francia"),
    ("SVR", "Laboratoire SVR", "Francia"), ("MARTIDERM", "MartiDerm Ampollas", "España"),
    ("HELIOCARE", "Heliocare Cantabria Labs", "España"), ("KIEHLS", "Kiehl's Since 1851", "Estados Unidos"),
    ("GARNIER", "Garnier SkinActive", "Francia"), ("LOREAL", "L'Oréal Paris Derm", "Francia"),
    ("NEUTROG", "Neutrogena Derm", "Estados Unidos"), ("DERMA_MX", "DermaCare Labs México", "México")
]

PRODUCTOS_COSMETICA = [
    ("Sérum Niacinamida 10% + Zinc 1%", "Control seborregulador y minimizador de poros"),
    ("Gel Limpiador Espumoso Facial", "Limpieza profunda para piel mixta a grasa"),
    ("Protector Solar Fluido SPF 50+", "Fotoprotección UVA/UVB toque seco invisible"),
    ("Sérum Ácido Hialurónico 2% + B5", "Hidratación multicapa y reparación de barrera"),
    ("Crema Hidratante con Ceramidas", "Restauración intensiva para piel seca y sensible"),
    ("Retinol Puro 0.5% Nocturno", "Renovación celular anti-edad microencapsulada"),
    ("Agua Micelar Dermolimpiadora", "Desmaquillante suave sin fragancia ni alcohol"),
    ("Sérum Vitamina C Pura 15%", "Antioxidante iluminador con ácido ferúlico"),
    ("Base de Maquillaje Cobertura Media", "Fórmula no comedogénica con ácido hialurónico"),
    ("Corrector Líquido Alta Duración", "Acabado natural resistente al agua y sudor"),
    ("Bálsamo Reparador Cicaplast B5", "Calmante intensivo para irritaciones cutáneas"),
    ("Exfoliante Ácido Salicílico 2%", "Desobstrucción de poros y control de brotes"),
    ("Contorno de Ojos con Cafeína 5%", "Reducción de bolsas y ojeras vasculares"),
    ("Mascarilla Nocturna Hidratante", "Recuperación dérmica intensiva durante el sueño"),
    ("Bruma Termal Calmante Mineral", "Alivio inmediato para rosácea y post-procedimiento"),
    ("Aceite Limpiador Emulsionable", "Remoción de protector solar y maquillaje waterproof"),
    ("Tónico Equilibrante Ácido Glicólico 7%", "Luminosidad y mejora de textura superficial"),
    ("Labial Hidratante Péptidos Nude", "Color modulable con tratamiento reparador labial"),
    ("Polvo Traslúcido Matificante Mineral", "Sellado de maquillaje sin obstrucción de poros"),
    ("Rubor Líquido Pigmento Natural", "Fórmula sedosa apta para pieles reactivas"),
    ("Sérum Ácido Azelaico 10% Suspensión", "Control de rojeces, rosácea y marcas post-acné"),
    ("Ampolletas Proteoglicanos Firmeza", "Efecto tensor inmediato y elasticidad dérmica"),
    ("Crema Despigmentante Noche Melasma", "Regulación de tirosinasa sin hidroquinona"),
    ("Protector Solar Mineral Óxido Zinc", "Filtro 100% físico para piel atópica o pediátrica"),
    ("Loción Corporal Urea 10% Reparadora", "Alivio de xerosis severa y descamación"),
    ("Primer Facial Minimizador de Poros", "Prebase libre de siliconas comedogénicas"),
    ("Máscara de Pestañas Hipoalergénica", "Testada oftalmológicamente para ojos sensibles"),
    ("Sérum Péptidos de Cobre 1%", "Estimulación de colágeno y firmeza avanzada"),
    ("Bálsamo Desmaquillante Caléndula", "Limpieza lipídica suave para barrera comprometida"),
    ("Crema Barrera Post-Retinoide", "Emulsión lipídica ceramidas-colesterol-ácidos grasos")
]

INGREDIENTES_INCI = [
    ("Niacinamide", "Vitamina B3 seborreguladora"), ("Sodium Hyaluronate", "Sal sódica de ácido hialurónico"),
    ("Retinol", "Vitamina A pura renovadora"), ("Salicylic Acid", "Beta-hidroxiácido queratolítico"),
    ("Ascorbic Acid", "Vitamina C antioxidante pura"), ("Ceramide NP", "Lípido estructural de barrera"),
    ("Panthenol", "Provitamina B5 calmante"), ("Azelaic Acid", "Ácido dicarboxílico anti-rojeces"),
    ("Glycolic Acid", "Alfa-hidroxiácido exfoliante"), ("Zinc Oxide", "Filtro solar mineral físico"),
    ("Titanium Dioxide", "Filtro solar mineral UVA/UVB"), ("Tocopherol", "Vitamina E antioxidante"),
    ("Madecassoside", "Extracto de centella asiática"), ("Squalane", "Emoliente biomimético ligero"),
    ("Allantoin", "Agente calmante y cicatrizante"), ("Caffeine", "Vasoconstrictor descongestivo"),
    ("Urea", "Factor hidratante natural queratolítico"), ("Ferulic Acid", "Estabilizador antioxidante"),
    ("Lactic Acid", "Alfa-hidroxiácido hidratante suave"), ("Bisabolol", "Calmante derivado de manzanilla"),
    ("Bakuchiol", "Alternativa vegetal al retinol"), ("Tranexamic Acid", "Inhibidor de hiperpigmentación"),
    ("Copper Tripeptide-1", "Péptido regenerador dérmico"), ("Glycerin", "Humectante higroscópico básico"),
    ("Dimethicone", "Polímero protector no comedogénico"), ("Shea Butter", "Manteca emoliente rica en lípidos"),
    ("Thermal Spring Water", "Agua minero-medicinal isotónica"), ("Zinc PCA", "Complejo regulador de sebo"),
    ("Kojic Acid", "Agente despigmentante suave"), ("Peptide Matrixyl 3000", "Complejo pro-colágeno")
]

PAQUETERIAS = [
    ("ESTAFETA", "Estafeta Mexicana S.A."), ("DHL", "DHL Express México"), ("FEDEX", "FedEx Express México"),
    ("99MIN", "99Minutos Logística Urbana"), ("UPS", "UPS de México"), ("REDPACK", "Redpack Mensajería"),
    ("PAQUETEXP", "Paquetexpress"), ("J_AND_T", "J&T Express México"), ("AMP_M", "AMPM Mensajería"),
    ("IVOY", "iVoy Entrega Mismo Día")
]

ALMACENES = [
    ("CEDIS-MTY", "CEDIS Monterrey Parque Stiva"),
    ("CEDIS-CDMX", "CEDIS CDMX Vallejo Industrial"),
    ("CEDIS-GDL", "CEDIS Guadalajara El Salto"),
    ("CEDIS-MVA", "CEDIS Monclova Centro Distribución"),
    ("CEDIS-QRO", "CEDIS Querétaro Logístico Bajío"),
    ("CEDIS-PUE", "CEDIS Puebla Parque Finsa")
]

# Custom seed rows for closed catalogs
CUSTOM_SEEDS = {
    "seguridad.roles": [
        (1, "ADMIN", "Administrador del Sistema", "Control total sobre catálogo, usuarios, seguridad, inventarios y auditoría global.", 10),
        (2, "CLIENTE", "Cliente Comprador", "Acceso a tienda en línea, perfil cutáneo, compras, suscripciones Beauty-Box y facturación.", 1),
        (3, "FACTURACION", "Especialista en Facturación CFDI", "Gestión de timbrado CFDI 4.0 ante el SAT, complementos de pago y notas de crédito.", 5),
    ],
    "seguridad.permisos": [
        (1, "SEG_USUARIOS_CRUD", "Seguridad", "ADMINISTRAR", "Administrar cuentas de usuarios, contraseñas y bloqueos"),
        (2, "SEG_ROLES_ASIGNAR", "Seguridad", "ASIGNAR", "Asignar roles y permisos a usuarios del sistema"),
        (3, "CAT_PRODUCTOS_CRUD", "Catálogo", "ESCRIBIR", "Crear, editar y desactivar productos cosméticos y fórmulas"),
        (4, "CAT_CATALOGO_VER", "Catálogo", "LEER", "Consultar catálogo público de productos, precios y existencias"),
        (5, "CLI_PERFIL_CUTANEO", "Clientes", "ESCRIBIR", "Gestionar perfil dermatológico y consentimiento LFPDPPP"),
        (6, "CLI_ARCO_RESOLVER", "Clientes", "APROBAR", "Atender y dictaminar solicitudes de derechos ARCO"),
        (7, "VEN_ORDEN_CREAR", "Ventas", "CREAR", "Generar carritos, órdenes de compra y suscripciones Beauty-Box"),
        (8, "VEN_ORDEN_CANCELAR", "Ventas", "ACTUALIZAR", "Autorizar cancelaciones y ajustes comerciales de órdenes"),
        (9, "PAG_COBRO_EJECUTAR", "Pagos", "EJECUTAR", "Procesar pagos tokenizados y validaciones antifraude"),
        (10, "PAG_REEMBOLSO_APROBAR", "Pagos", "APROBAR", "Autorizar reembolsos y gestionar contracargos bancarios"),
        (11, "FIS_CFDI_TIMBRAR", "Fiscal", "EJECUTAR", "Emitir y timbrar facturas CFDI 4.0 ante el PAC autorizado del SAT"),
        (12, "FIS_CFDI_CANCELAR", "Fiscal", "CANCELAR", "Solicitar cancelación de comprobantes fiscales ante el SAT"),
        (13, "FIS_CFDI_CONSULTAR", "Fiscal", "LEER", "Descargar archivos XML/PDF y consultar historial de facturación"),
        (14, "WMS_LOTES_FEFO", "Almacén", "ESCRIBIR", "Controlar lotes sanitarios FEFO, cuarentena QA y cadena de frío"),
        (15, "AUD_BITACORA_VER", "Auditoría", "LEER", "Consultar bitácoras inmutables de seguridad y cambios de datos"),
    ],
    "seguridad.roles_permisos": [
        # ADMIN (rol=1) -> permisos 1..15
        *[(idx + 1, 1, idx + 1, 1) for idx in range(15)],
        # CLIENTE (rol=2) -> permisos 4, 5, 7, 13
        (16, 2, 4, 1),
        (17, 2, 5, 1),
        (18, 2, 7, 1),
        (19, 2, 13, 1),
        # FACTURACION (rol=3) -> permisos 10, 11, 12, 13
        (20, 3, 10, 1),
        (21, 3, 11, 1),
        (22, 3, 12, 1),
        (23, 3, 13, 1),
    ],
    "clientes.tipos_piel": [
        (1, "EUDERMICA", "Piel Normal / Eudérmica", "Equilibrio óptimo entre hidratación y secreción sebácea"),
        (2, "SECA_ALIPICA", "Piel Seca / Deshidratada", "Déficit de lípidos epidérmicos y tendencia a tirantez"),
        (3, "GRASA_SEBORR", "Piel Grasa / Tendencia Acnéica", "Hipersecreción sebácea, brillo facial y poros dilatados"),
        (4, "MIXTA_ZONAT", "Piel Mixta", "Zona T grasa (frente, nariz, mentón) y mejillas secas o normales"),
        (5, "SENSIBLE_REAC", "Piel Sensible / Reactiva", "Alta reactividad neurosensorial, eritema fácil y barrera frágil"),
        (6, "MADURA_FOTO", "Piel Madura / Fotoenvejecida", "Pérdida de firmeza, elastosis solar y líneas de expresión marcadas"),
    ],
    "fiscal.regimenes_sat": [
        (1, "601", "General de Ley Personas Morales", 0, 1),
        (2, "605", "Sueldos y Salarios e Ingresos Asimilados a Salarios", 1, 0),
        (3, "606", "Arrendamiento", 1, 0),
        (4, "612", "Personas Físicas con Actividades Empresariales y Profesionales", 1, 0),
        (5, "616", "Sin obligaciones fiscales", 1, 0),
        (6, "621", "Incorporación Fiscal", 1, 0),
        (7, "625", "Régimen de las Actividades Empresariales con ingresos a través de Plataformas", 1, 0),
        (8, "626", "Régimen Simplificado de Confianza (RESICO)", 1, 1),
    ],
    "fiscal.usos_cfdi": [
        (1, "G01", "Adquisición de mercancías", 1, 1),
        (2, "G03", "Gastos en general", 1, 1),
        (3, "D01", "Honorarios médicos, dentales y gastos hospitalarios", 1, 0),
        (4, "D02", "Gastos médicos por incapacidad o discapacidad", 1, 0),
        (5, "I04", "Equipo de computo y accesorios", 1, 1),
        (6, "P01", "Por definir (Uso transitorio)", 1, 1),
        (7, "S01", "Sin efectos fiscales", 1, 1),
        (8, "CP01", "Pagos (Complemento de recepción de pagos)", 1, 1),
    ],
    "ventas.estados_orden": [
        (1, "PEND_PAGO", "Pendiente de Pago", "Orden registrada esperando confirmación bancaria o SPEI", 0),
        (2, "PAGADA", "Pago Confirmado", "Transacción aprobada y lista para asignación de almacén", 0),
        (3, "PREPARANDO", "En Preparación CEDIS", "Surtido en curso bajo estrategia FEFO y empaque térmico", 0),
        (4, "EN_TRANSITO", "Enviada en Tránsito", "Paquete recolectado por paquetería con guía de rastreo", 0),
        (5, "ENTREGADA", "Entregada al Cliente", "Recepción confirmada en domicilio del destinatario", 1),
        (6, "CANCELADA", "Cancelada", "Orden anulada antes del despacho con liberación de stock", 1),
        (7, "DEVUELTA", "Devuelta por RMA", "Mercancía retornada y dictaminada en postventa", 1),
    ],
    "pagos.metodos_pago": [
        (1, "TARJETA_CRED", "Tarjeta de Crédito", 1),
        (2, "TARJETA_DEB", "Tarjeta de Débito", 1),
        (3, "SPEI_TRANSF", "Transferencia Electrónica SPEI", 0),
        (4, "OXXO_EFECT", "Pago en Efectivo Tiendas OXXO", 0),
        (5, "MONEDERO", "Saldo Monedero DermaCare", 0),
    ],
    "compras.estados_orden_compra": [
        (1, "BORRADOR", "Borrador de Compra", "Requisición convertida en borrador pendiente de firma"),
        (2, "ENVIADA", "Enviada a Proveedor", "Orden de compra emitida y notificada al laboratorio"),
        (3, "CONFIRMADA", "Confirmada con Cita Andén", "Proveedor confirmó fecha de entrega y lotes sanitarios"),
        (4, "REC_PARCIAL", "Recibida Parcialmente", "Entrega parcial validada en andén de CEDIS"),
        (5, "REC_TOTAL", "Recibida Completa", "Totalidad de unidades ingresadas a inventario QA"),
        (6, "CANCELADA", "Cancelada", "Orden de compra anulada por incumplimiento de SLA"),
    ],
    "wms.tipos_movimiento_inventario": [
        (1, "ENT_COMPRA", "Entrada por Compra a Proveedor", 1, 1),
        (2, "SAL_VENTA", "Salida por Venta E-Commerce", -1, 1),
        (3, "AJU_POS", "Ajuste Positivo por Conteo Cíclico", 1, 1),
        (4, "SAL_MERMA", "Salida por Merma o Caducidad Sanitaria", -1, 1),
        (5, "TRANS_SAL", "Salida por Transferencia entre CEDIS", -1, 1),
        (6, "TRANS_ENT", "Entrada por Transferencia entre CEDIS", 1, 1),
    ],
}

print("Custom seeds & domain dictionaries prepared.")
