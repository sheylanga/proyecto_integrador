# CAPÍTULO II: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI - IFE-1005)
## Entregable 2.6: Prototipos de Interfaces de Usuario (Mockups y Especificación de Experiencia de Usuario UX)

---

### 1. Introducción y Principios de Diseño de Interfaz

En estricto cumplimiento de los requerimientos de la asignatura **Análisis y Modelado de Sistemas de Información (IFE-1005)** y los lineamientos de accesibilidad web (WCAG 2.1 AA) e ingeniería de software, se presentan los prototipos estructurales de alta fidelidad para las vistas nodales del sistema integral de comercio electrónico de salud, belleza y cosmecéutica.

Cada pantalla refleja los controles funcionales, campos de captura, sellos de cumplimiento regulatorio (COFEPRIS), mecanismos de salvaguarda de datos personales sensibles (LFPDPPP) y retroalimentación interactiva del sistema.

---

### 2. Prototipo 1: Storefront y Catálogo Clínico con Filtro Dermatológico

```
+----------------------------------------------------------------------------------------------------+
|  [LOGO DERMA-ECOM]     [ Buscar sueros, protectores solares, activos...       [Q] ]   [Mi Cuenta v] [Carrito (2)] |
+----------------------------------------------------------------------------------------------------+
| INICIO  |  SKIN-TEST CLINICO  |  SERUMS ACTIVOS  |  PROTECCION SOLAR  |  BEAUTY-BOX  |  REGISTRO COFEPRIS  |
+----------------------------------------------------------------------------------------------------+
| FILTROS DERMATOLOGICOS               | CATALOGO DE FORMULAS CLINICAS CERTIFICADAS (150 Formulas)   |
|--------------------------------------+-------------------------------------------------------------|
| [*] Biotipo Cutaneo:                 | Ordenar por: [ Recomendados para tu Perfil Cutaneo v ]      |
|   [X] Graso / Tendencia Acneica      |-------------------------------------------------------------|
|   [ ] Seco / Deshidratado            | +---------------------------+ +---------------------------+ |
|   [ ] Mixto                          | | [FOTO PRODUCTO EN ENVASE] | | [FOTO PRODUCTO EN ENVASE] | |
|   [ ] Sensible / Rosacea             | | CLINICAL FORMULA 01       | | DERMA-BARRIER REPAIR 02   | |
|                                      | | Serum Niacinamida 10% +   | | Ceramide Complex + Lipidos| |
| [*] Fototipo (Fitzpatrick):          | | Zinc PCA 1% (pH 5.5)      | | Phyto-Esteroles (pH 5.2)  | |
|   ( ) I  ( ) II  ( ) III             | | Reg. COFEPRIS: 243300COF  | | Reg. COFEPRIS: 243301COF  | |
|   (*) IV ( ) V   ( ) VI              | | Sello: [Hipoalergenico]   | | Sello: [Cadena de Frio]   | |
|                                      | | Stock: 42 uds (CEDIS MTY) | | Stock: 18 uds (CEDIS CDMX)| |
| [*] Ingredientes Clave:              | | Precio: $489.00 MXN       | | Precio: $620.00 MXN       | |
|   [X] Niacinamida  [X] Ac. Salicilico| | [Ver Detalle Formula]     | | [Ver Detalle Formula]     | |
|   [ ] Ac. Hialuronico [ ] Retinol    | | [ AGREGAR AL CARRITO ]    | | [ AGREGAR AL CARRITO ]    | |
|                                      | +---------------------------+ +---------------------------+ |
| [*] Restriccion Sanitaria:           |                                                             |
|   [ ] Venta Libre Cosmética          | +---------------------------+ +---------------------------+ |
|   [X] Dermocosmetico Especializado   | | [FOTO PRODUCTO EN ENVASE] | | [FOTO PRODUCTO EN ENVASE] | |
|   [ ] Requiere Receta Medica         | | RETINOL PURO 0.5% NOCHE   | | MINERAL SUNSCREEN SPF 50+ | |
|--------------------------------------+ | Microencapsulado Lenta Lib| | Dioxido Titanio / Ox. Zinc| |
| [!] ALERTA MEDICA PERSONALIZADA:     | | Reg. COFEPRIS: 243302COF  | | Reg. COFEPRIS: 243303COF  | |
| Has seleccionado perfil con piel     | | [!] Requiere Cuestionario | | Sello: [Resistente Agua]  | |
| sensible. Se han ocultado 14 formulas| | Precio: $750.00 MXN       | | Precio: $530.00 MXN       | |
| fotosensibilizantes o con alta       | | [Ver Detalle Formula]     | | [Ver Detalle Formula]     | |
| concentracion de alfa-hidroxiacidos. | | [ AGREGAR AL CARRITO ]    | | [ AGREGAR AL CARRITO ]    | |
|                                      | +---------------------------+ +---------------------------+ |
+----------------------------------------------------------------------------------------------------+
| Footer: Aviso de Privacidad LFPDPPP | Terminos EULA | Responsable Sanitario Ced. Prof. 8492019-COFEPRIS    |
+----------------------------------------------------------------------------------------------------+
```

---

### 3. Prototipo 2: Cuestionario Clínico Cutáneo (Diagnóstico y Consentimiento LFPDPPP)

```
+----------------------------------------------------------------------------------------------------+
| [DERMA-ECOM] > DIAGNOSTICO CLINICO DERMATOLOGICO PERSONALIZADO                 Paso 3 de 4 [=====---]
+----------------------------------------------------------------------------------------------------+
| EVALUACION DE SENSIBILIDAD Y COMPATIBILIDAD BIOLOGICA                                              |
|                                                                                                    |
| 1. ¿Cual es la reaccion habitual de tu rostro tras 15 minutos de exposicion solar sin protector?   |
|    ( ) Siempre se quema de inmediato, nunca se broncea (Fototipo I)                                |
|    ( ) Se quema facilmente, adquiere ligero bronceado despues (Fototipo II)                        |
|    (*) Se quema moderadamente, se broncea de forma uniforme (Fototipo III / IV)                     |
|    ( ) Raramente se quema, se broncea intensamente con facilidad (Fototipo V / VI)                 |
|                                                                                                    |
| 2. Selecciona las condiciones cutaneas que te hayan sido diagnosticadas por un profesional:        |
|    [X] Dermatitis Atopica o Eczema             [ ] Psoriasis                                       |
|    [X] Rosacea o Cuperosis facial              [ ] Melasma / Hiperpigmentacion hormonal            |
|    [ ] Acne Grado II o superior                [ ] Ninguna de las anteriores                       |
|                                                                                                    |
| 3. ¿Presentas alergia comprobada a alguno de los siguientes conservadores o vehiculos?             |
|    [X] Parabenos y Liberadores de Formaldehido [ ] Fragancias sinteticas                           |
|    [ ] Aceites Minerales / Comedogenicos       [ ] Sulfatos y Tensoactivos anionicos               |
|                                                                                                    |
| 4. Subir Fotografia Facial en Luz Natural (Opcional - Procesada con Hashing y Cifrado AES-256):    |
|    [ Seleccionar Archivo... ]  Archivo: rostro_frontal_luz_dia.jpg (Verificado: SHA-256 Valido)   |
|----------------------------------------------------------------------------------------------------+
| CLAUSULA DE CONSENTIMIENTO EXPRESO PARA EL TRATAMIENTO DE DATOS SENSIBLES DE SALUD (LFPDPPP)      |
| "De conformidad con los articulos 8, 9 y 16 de la Ley Federal de Proteccion de Datos Personales en |
| Posesion de los Particulares, autorizo expresamente el tratamiento de mis datos de salud cutanea y |
| registros fotograficos unicamente para el diseno de mi protocolo cosmetico individualizado..."     |
|                                                                                                    |
| [X] He leido y otorgo mi consentimiento expreso e informado para el tratamiento de datos de salud. |
| Firma Digital / Token de Aprobacion: [ FIRMA REGISTRADA MEDIANTE DISPOSITIVO DIGITAL - ID: 8942 ] |
|----------------------------------------------------------------------------------------------------+
| [ << Paso Anterior ]                                            [ GUARDAR Y EVALUAR FORMULAS >> ]  |
+----------------------------------------------------------------------------------------------------+
```

---

### 4. Prototipo 3: Checkout Transaccional Seguro con Tokenización Bancaria y Split Multialmacén

```
+----------------------------------------------------------------------------------------------------+
|  DERMA-ECOM | PROCESO DE PAGO SEGURO (CONEXION CIFRADA TLS 1.3 / TOKENIZACION PCI-DSS)            |
+----------------------------------------------------------------------------------------------------+
| RESUMEN DE TU PEDIDO (2 PRODUCTOS)             | INFORMACION DE ENVIO Y SPLIT DE ALMACENES         |
|------------------------------------------------+---------------------------------------------------|
| Producto 1: Serum Niacinamida 10% (1 ud)       | Domicilio: Av. Tecnologico #1200, Col. Centro     |
|   Surtido desde: CEDIS MONTERREY (Lote FEFO)   | Ciudad: Monclova, Coahuila. C.P. 25700            |
|   Precio: $489.00 MXN                          |                                                   |
|                                                | [!] AVISO LOGISTICO DE DIVISION DE ORDEN:         |
| Producto 2: Derma-Barrier Repair (1 ud)        | Para garantizar la frescura y la cadena de frio   |
|   Surtido desde: CEDIS CDMX (Lote FEFO)        | de tu formula, este pedido se enviara en 2 partes:|
|   Precio: $620.00 MXN                          |   * Paquete 1: CEDIS Monterrey (Est. 24 hrs)      |
|------------------------------------------------+   * Paquete 2: CEDIS CDMX (Est. 48 hrs)          |
| Subtotal Bruto:                 $1,109.00 MXN  | Sin costo adicional por division de envio.        |
| Descuento Cupon Clinico (-10%):  -$110.90 MXN  |---------------------------------------------------|
| IVA Trasladado (16%):             $159.70 MXN  | METODO DE PAGO (TOKENIZACION SIN GUARDAR TARJETA) |
| Costo Envio Refrigerado:          $120.00 MXN  |---------------------------------------------------|
| TOTAL A PAGAR:                  $1,277.80 MXN  | (*) Tarjeta de Credito / Debito (Visa, MC, AMEX)  |
|                                                |     Numero: [ 4152 ******* 9821 ]                 |
| [X] Requiero Factura Fiscal CFDI 4.0 (SAT)     |     Expira: [ 08 / 28 ]    CVV: [ *** ]           |
|     RFC: TEC981215AB1 | Reg: 601 General Ley   |     Titular: [ CARLOS MARTINEZ LOPEZ ]            |
|     Uso CFDI: G03 Gastos en General            |     Token Criptografico: [ tok_1Ng8F42eZvKYlo2... ]|
|                                                | ( ) Transferencia SPEI Codi (Sin comision)        |
|                                                | ( ) Pagar con Saldo Monedero Clinico ($0.00)      |
|------------------------------------------------+---------------------------------------------------|
| [Candado SSL] Transaccion 100% Segura          | [  CONFIRMAR Y PAGAR ORDEN $1,277.80 MXN  ]       |
+----------------------------------------------------------------------------------------------------+
```

---

### 5. Prototipo 4: Dashboard Móvil WMS (PDA Handheld - Recepción y Control Cadena de Frío IoT)

```
+-----------------------------------------------+
| WMS LOGISTICA CEDIS MTY           [Wifi: 100%]|
| Operador: J. HERNANDEZ (ID: 042)  Hora: 14:32 |
+-----------------------------------------------+
| > MODULO: RECEPCION EN ANDEN Y CONTROL TERMICO|
+-----------------------------------------------+
| Codigo Embarque: [ EMB-2026-00492           ] |
| SKU / Lote:      [ LOT-DERMA-2026-08        ] |
| Descripcion:     Serum Ceramide Liposomado    |
| Cantidad:        500 Unidades Clínicas        |
+-----------------------------------------------+
| ESTADO DE TELEMETRIA IOT CADENA DE FRIO:      |
| Sensor Bluetooth Vinculado: MAC AA:BB:CC:11:04|
|                                               |
| Temperatura Actual:      +4.2 °C  [OPTIMO]    |
| Limite Permitido:        +2.0 °C a +8.0 °C    |
| Humedad Relativa:        48%      [NORMAL]    |
|                                               |
| Historial 72h Transporte:                     |
|  Minima: +3.1 °C  |  Maxima: +6.8 °C          |
|  Excursiones Termicas Criticas: CERO (0)      |
|  [ DICTAMEN IOT: CADENA DE FRIO CONFORME ]    |
+-----------------------------------------------+
| INSPECCION DE CONTROL DE CALIDAD (QA):        |
| Quimico Responsable: [ Q.F.B. LAURA TREVINO ] |
| Sello de Seguridad:  [X] Intacto sin fugas    |
| Certificado COFEPRIS:[X] Aprobado No. 98402   |
| Asignacion FEFO:     Vence: 14-OCT-2027       |
| Ubicacion Asignada:  Rack Frío B-04-Nivel 2   |
+-----------------------------------------------+
| [ RECHAZAR EMBARQUE ]  |  [ APROBAR E INGRESAR]
+-----------------------------------------------+
```

---

### 6. Prototipo 5: Portal de Farmacovigilancia y Gestión de Devoluciones RMA

```
+----------------------------------------------------------------------------------------------------+
| DERMA-ECOM > PORTAL MEDICO > FARMACOVIGILANCIA Y GESTION DE ALERTAS SANITARIAS                     |
+----------------------------------------------------------------------------------------------------+
| EXPEDIENTE RMA: #RMA-2026-0812 | FECHA: 12-FEB-2026 | ESTATUS: [ EN REVISION MEDICA COFEPRIS ]     |
|----------------------------------------------------------------------------------------------------+
| DATOS DEL CONSUMIDOR AFECTADO:             | INFORMACION DEL PRODUCTO REPORTADO:                   |
| Titular: Mariana Sanchez Fuentes           | SKU: COS-RET-005 (Retinol Puro 0.5% Noche)            |
| Telefono: (866) 142-9988                   | Numero Lote: LOT-2026-RET-019 (Fab: 10-ENE-2026)      |
| Alergias Registradas: Sulfatos             | Orden de Compra Origen: #ORD-2026-8812                |
|--------------------------------------------+-------------------------------------------------------|
| REPORTE DE REACCION CUTANEA ADVERSA (RAM):                                                         |
| Sintomas: Eritema difuso en mejillas, prurito intenso y sensacion de ardor a las 2 hrs de aplicacion.|
| Severidad Percibida: Moderada a Severa. Requiere atencion topica con corticoides suaves.           |
| Evidencia Fotografica Adjunta: [ Ver Foto 1: Lesion_Facial.jpg ] [ Ver Foto 2: Lote_Frasco.jpg ]     |
|----------------------------------------------------------------------------------------------------+
| DICTAMEN DE RESPONSABLE SANITARIO (MEDICO DERMATOLOGO):                                            |
| Medico Asignado: Dr. Alejandro Mendez G. | Cedula Profesional: 7492019-SESP                        |
| Dictamen Clinico:                                                                                  |
| [X] Reaccion confirmada por hipersensibilidad al retinoide en paciente con barrera comprometida.   |
| Resolucion del Caso:                                                                               |
|   (*) PROCEDE REEMBOLSO TOTAL INMEDIATO ($750.00 MXN)                                              |
|   (*) EMITIR GUIA DE RETORNO PARA ANALISIS CLINICO DEL REMANENTE EN LABORATORIO                    |
|   (*) NOTIFICAR A LA BASE NACIONAL DE FARMACOVIGILANCIA COFEPRIS (NORMA NOM-220-SSA1-2012)        |
|                                                                                                    |
| Folio Oficial COFEPRIS Generado: [ RAM-COFEPRIS-2026-MEX-009182 ]                                  |
|----------------------------------------------------------------------------------------------------+
| [ IMPRIMIR EXPEDIENTE SANITARIO ]                 [ CONFIRMAR RESOLUCION Y NOTIFICAR AL PACIENTE ] |
+----------------------------------------------------------------------------------------------------+
```
