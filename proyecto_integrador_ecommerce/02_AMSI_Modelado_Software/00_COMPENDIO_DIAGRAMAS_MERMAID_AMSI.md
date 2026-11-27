# COMPENDIO MAESTRO DE DIAGRAMAS UML 2.5 EN MERMAID — DERMA-ECOM

- **Asignatura:** Análisis y Modelado de Sistemas de Información (AMSI — IFE-1005)
- **Docente Titular:** Ing. Mayela del C. Valadez Zamarrón
- **Institución:** Tecnológico Nacional de México — Instituto Tecnológico Superior de Monclova
- **Equipo:** José Luis Luna García (SM1) · Sheyla Estefanía Moncada Guel (SM2) · Eduardo Salazar Martínez (SM3)
- **Total de diagramas incluidos:** **31 diagramas Mermaid** (consolidados desde los 8 entregables de modelado UML).

## Índice General de Diagramas

| # | Ref. | Nombre del Diagrama | Archivo Fuente |
|---:|:---:|---|---|
| 1 | 1.1 | 1.1 Diagrama de Generalización de Actores (UML) | `02_diagramas_casos_de_uso.md` |
| 2 | 1.2 | 2. MODELADO DEL NEGOCIO: DIAGRAMA DE CASOS DE USO DEL NEGOCIO (DCU DE NEGOCIO) | `02_diagramas_casos_de_uso.md` |
| 3 | 1.3 | 3.1 Diagrama General de Casos de Uso del Sistema (Vista Integrada — 18 Casos de Uso) | `02_diagramas_casos_de_uso.md` |
| 4 | 1.4 | 3.2 DCU del Submódulo 1: Identidad, Perfil Dermo-Salud, Catálogo INCI y Comunidad (Tablas 001–050) | `02_diagramas_casos_de_uso.md` |
| 5 | 1.5 | 3.3 DCU del Submódulo 2: Motor Comercial, Suscripciones, Pagos, Antifraude, CFDI 4.0 y Promociones (Tablas 051–100) | `02_diagramas_casos_de_uso.md` |
| 6 | 1.6 | 3.4 DCU del Submódulo 3: Compras, WMS FEFO, Cadena de Frío IoT, Envíos, Postventa RMA y Auditoría Forense (Tablas 101–150) | `02_diagramas_casos_de_uso.md` |
| 7 | 2.1 | 1.2 DIAGRAMA DE PAQUETES DEL SISTEMA (UML 2.5 — 3 SUBMÓDULOS Y 14 PAQUETES) | `03_diagrama_de_clases.md` |
| 8 | 2.2 | 2. DIAGRAMA DE CLASES DEL SUBMÓDULO 1: SEGURIDAD, IDENTIDAD, PERFIL CLÍNICO Y CATÁLOGO INCI | `03_diagrama_de_clases.md` |
| 9 | 2.3 | 3. DIAGRAMA DE CLASES DEL SUBMÓDULO 2: VENTAS, SUSCRIPCIONES, PAGOS, ANTIFRAUDE Y CFDI 4.0 | `03_diagrama_de_clases.md` |
| 10 | 2.4 | 4. DIAGRAMA DE CLASES DEL SUBMÓDULO 3: COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS, RMA Y FORENSE | `03_diagrama_de_clases.md` |
| 11 | 3.1 | 2. DS-01: AUTENTICACIÓN SEGURA DE USUARIO (LOGIN CRIPTOGRÁFICO, MFA TOTP Y BLOQUEO POR FUERZA BRUTA) — CU-01 *(OBLIGATORIO)* | `04_diagramas_de_secuencia.md` |
| 12 | 3.2 | 3. DS-02: DIAGNÓSTICO CLÍNICO CUTÁNEO Y CONSENTIMIENTO EXPRESO LFPDPPP — CU-02 | `04_diagramas_de_secuencia.md` |
| 13 | 3.3 | 4. DS-03: CHECKOUT SEGURO, RESERVA 15 MIN, ANTIFRAUDE, PAGO PCI-DSS Y SPLIT MULTIALMACÉN — CU-03 | `04_diagramas_de_secuencia.md` |
| 14 | 3.4 | 5. DS-04: COBRO RECURRENTE Y PROGRAMACIÓN DE SUSCRIPCIÓN BEAUTY-BOX — CU-04 | `04_diagramas_de_secuencia.md` |
| 15 | 3.5 | 6. DS-05: EMISIÓN, SELLADO CSD Y TIMBRADO DE FACTURA ELECTRÓNICA CFDI 4.0 — CU-05 | `04_diagramas_de_secuencia.md` |
| 16 | 3.6 | 7. DS-06: RECEPCIÓN EN CEDIS, TELEMETRÍA IOT, DICTAMEN QA Y ALTA DE LOTE FEFO — CU-06 | `04_diagramas_de_secuencia.md` |
| 17 | 3.7 | 8. DS-07: DEVOLUCIÓN RMA, INSPECCIÓN HIGIÉNICA Y FARMACOVIGILANCIA COFEPRIS — CU-07 | `04_diagramas_de_secuencia.md` |
| 18 | 3.8 | 9. DS-08: EJERCICIO DE DERECHOS ARCO Y AUDITORÍA FORENSE CON SOFT-DELETE JSON — CU-08 / CU-12 | `04_diagramas_de_secuencia.md` |
| 19 | 4.1 | 1. DIAGRAMA DE COMPONENTES DE SOFTWARE (ARQUITECTURA POR CAPAS) | `05_diagrama_de_componentes.md` |
| 20 | 5.1 | 1. DIAGRAMA DE DESPLIEGUE FÍSICO Y TOPOLOGÍA REAL DE RED (VLSM `10.40.0.0/16`) | `06_diagrama_de_despliegue.md` |
| 21 | 6.1 | 1. DA-01: AUTENTICACIÓN SEGURA (LOGIN), MFA TOTP, BLOQUEO POR FUERZA BRUTA Y DIAGNÓSTICO LFPDPPP | `08_diagramas_de_actividades.md` |
| 22 | 6.2 | 2. DA-02: CHECKOUT SEGURO, RESERVA 15 MIN, ANTIFRAUDE, PAGO PCI-DSS, SPLIT MULTIALMACÉN Y CFDI 4.0 | `08_diagramas_de_actividades.md` |
| 23 | 6.3 | 3. DA-03: RECEPCIÓN EN CEDIS, TELEMETRÍA IOT (2–8 °C), DICTAMEN QA Y ALTA/DESPACHO FEFO | `08_diagramas_de_actividades.md` |
| 24 | 6.4 | 4. DA-04: DEVOLUCIÓN RMA, INSPECCIÓN HIGIÉNICA, FARMACOVIGILANCIA COFEPRIS Y REEMBOLSO | `08_diagramas_de_actividades.md` |
| 25 | 7.1 | 1. DE-01: MÁQUINA DE ESTADOS DE CUENTA DE USUARIO Y SESIÓN (`seguridad.usuarios`) | `09_diagramas_de_estados.md` |
| 26 | 7.2 | 2. DE-02: MÁQUINA DE ESTADOS DE ORDEN DE VENTA (`ventas.ordenes`) | `09_diagramas_de_estados.md` |
| 27 | 7.3 | 3. DE-03: MÁQUINA DE ESTADOS DE LOTE SANITARIO FEFO (`wms.lotes_fabricacion_sanitaria`) | `09_diagramas_de_estados.md` |
| 28 | 7.4 | 4. DE-04: MÁQUINA DE ESTADOS DE SOLICITUD RMA Y FARMACOVIGILANCIA (`postventa.solicitudes_rma`) | `09_diagramas_de_estados.md` |
| 29 | 8.1 | 2. DC-01: COMUNICACIÓN DE AUTENTICACIÓN SEGURA (LOGIN CRIPTOGRÁFICO, MFA Y BLOQUEO HMAC) — CU-01 | `10_diagramas_de_comunicacion.md` |
| 30 | 8.2 | 3. DC-02: COMUNICACIÓN DE CHECKOUT, ANTIFRAUDE, PAGO PCI-DSS, SPLIT Y CFDI 4.0 — CU-03 / CU-05 | `10_diagramas_de_comunicacion.md` |
| 31 | 8.3 | 4. DC-03: COMUNICACIÓN DE RECEPCIÓN CEDIS, IOT CADENA DE FRÍO, QA Y ALTA FEFO — CU-06 | `10_diagramas_de_comunicacion.md` |

---

## 1. Diagramas de Casos de Uso (Negocio, Actores y Sistema)
> Archivo fuente: `02_diagramas_casos_de_uso.md`

### Diagrama 1 — 1.1 Diagrama de Generalización de Actores (UML)

```mermaid
flowchart BT
    CLI["Cliente / Paciente Dermo"] -->|Generalización| USR["Usuario del Sistema\n(seguridad.usuarios)"]
    AFI["Afiliado / Influencer"] -->|Generalización| USR
    OPE["Operador Interno\n(RBAC)"] -->|Generalización| USR

    ADM["Admin de Seguridad\n(ADMIN)"] -->|Generalización| OPE
    DER["Dermoconsultor\n(DERMOCONSULTOR)"] -->|Generalización| OPE
    FAC["Especialista Fiscal\n(FACTURACION)"] -->|Generalización| OPE
    WMS["Operador WMS CEDIS\n(ALMACEN_WMS)"] -->|Generalización| OPE
    QA["Químico QA Sanitario\n(AUDITOR_COFEPRIS)"] -->|Generalización| OPE
```

### Diagrama 2 — 2. MODELADO DEL NEGOCIO: DIAGRAMA DE CASOS DE USO DEL NEGOCIO (DCU DE NEGOCIO)

```mermaid
flowchart LR
    subgraph ActoresNegocio["Actores del Negocio"]
        BN_CLI(["Cliente / Paciente"])
        BN_AFI(["Afiliado / Influencer"])
        BN_PROV(["Proveedor / Laboratorio"])
        BN_SAT(["SAT / PAC"])
        BN_COF(["COFEPRIS / INAI"])
    end

    subgraph Negocio["Frontera del Negocio: DERMA-ECOM (Dermocosmética con Cadena de Frío)"]
        CUN1(("CUN-01: Gestionar Identidad,\nExpediente Cutáneo y Privacidad"))
        CUN2(("CUN-02: Comercializar Catálogo\nINCI, Ventas y Suscripciones"))
        CUN3(("CUN-03: Cobrar, Prevenir Fraude\ny Cumplir Facturación SAT"))
        CUN4(("CUN-04: Abastecer, Controlar\nCalidad QA y Almacenar FEFO"))
        CUN5(("CUN-05: Despachar Multialmacén,\nAtender RMA y Farmacovigilancia"))
        CUN6(("CUN-06: Auditar Seguridad Forense\ny Cumplimiento Normativo"))

        CUN2 -. "&laquo;include&raquo;" .-> CUN3
        CUN2 -. "&laquo;include&raquo;" .-> CUN5
        CUN4 -. "&laquo;include&raquo;" .-> CUN6
        CUN5 -. "&laquo;extend&raquo;" .-> CUN3
        CUN1 -. "&laquo;include&raquo;" .-> CUN6
    end

    BN_CLI --- CUN1
    BN_CLI --- CUN2
    BN_CLI --- CUN5
    BN_AFI --- CUN2
    BN_PROV --- CUN4
    CUN3 --- BN_SAT
    CUN4 --- BN_COF
    CUN5 --- BN_COF
    CUN1 --- BN_COF
```

### Diagrama 3 — 3.1 Diagrama General de Casos de Uso del Sistema (Vista Integrada — 18 Casos de Uso)

```mermaid
flowchart LR
    USR(["Usuario"])
    CLI(["Cliente / Paciente"])
    AFI(["Afiliado"])
    DER(["Dermoconsultor"])
    ADM(["Admin Seguridad"])
    FAC(["Especialista Fiscal"])
    WMS(["Operador WMS"])
    QA(["Químico QA"])
    PAS(["Pasarela PCI-DSS"])
    SAT(["PAC / SAT 4.0"])
    LOG(["API Paquetería"])
    IOT(["Sensores IoT"])

    subgraph DERMA_SYS["Sistema DERMA-ECOM (150 Tablas · 14 Esquemas)"]
        subgraph SM1["Submódulo 1 — José Luis Luna García (001–050)"]
            CU01(("CU-01: Autenticar Usuario\nLogin + MFA"))
            CU02(("CU-02: Diagnóstico Cutáneo\ny Perfil Dermo"))
            CU08(("CU-08: Ejercer y Resolver\nDerechos ARCO"))
            CU09(("CU-09: Consultar Catálogo\nINCI y COFEPRIS"))
            CU13(("CU-13: Gestionar Rutinas,\nKits y Wishlist"))
        end

        subgraph SM2["Submódulo 2 — Sheyla Estefanía Moncada Guel (051–100)"]
            CU03(("CU-03: Checkout, Split\ny Pago Seguro"))
            CU04(("CU-04: Suscripción\nBeauty-Box"))
            CU05(("CU-05: Emitir / Cancelar\nCFDI 4.0"))
            CU10(("CU-10: Cupones, GWP\ny Ventas Flash"))
            CU14(("CU-14: Gestionar Afiliados\ny Comisiones"))
        end

        subgraph SM3["Submódulo 3 — Eduardo Salazar Martínez (101–150)"]
            CU06(("CU-06: Compras, QA\ny Lotes FEFO"))
            CU07(("CU-07: Devoluciones RMA\ny Farmacovigilancia"))
            CU11(("CU-11: Despacho, Tracking\ny Pickup"))
            CU12(("CU-12: Auditoría Forense\ny Soft-Delete"))
            CU15(("CU-15: Monitoreo IoT Frío\ny Alertas FEFO"))
        end
    end

    USR --- CU01
    CLI --- CU02
    CLI --- CU03
    CLI --- CU04
    CLI --- CU05
    CLI --- CU07
    CLI --- CU08
    CLI --- CU09
    CLI --- CU10
    CLI --- CU13
    AFI --- CU14
    DER --- CU02
    DER --- CU09
    DER --- CU13
    ADM --- CU08
    ADM --- CU12
    FAC --- CU05
    WMS --- CU06
    WMS --- CU11
    WMS --- CU15
    QA --- CU06
    QA --- CU07
    QA --- CU15

    CU03 --- PAS
    CU04 --- PAS
    CU05 --- SAT
    CU11 --- LOG
    CU15 --- IOT
```

### Diagrama 4 — 3.2 DCU del Submódulo 1: Identidad, Perfil Dermo-Salud, Catálogo INCI y Comunidad (Tablas 001–050)

```mermaid
flowchart LR
    USR(["Usuario"])
    CLI(["Cliente / Paciente"])
    DER(["Dermoconsultor"])
    ADM(["Admin Seguridad"])
    QA(["Químico QA"])

    subgraph FronteraSM1["Submódulo 1: Identidad, Dermo-Salud y Catálogo (Tablas 001–050)"]
        CU01(("CU-01: Iniciar Sesión\nSeguro - Login"))
        CU01_H(("CU-01.1: Verificar Hash\ny Salt Criptográfico"))
        CU01_S(("CU-01.2: Emitir Sesión\ny Registrar Acceso"))
        CU01_M(("CU-01.3: Validar Código\nMFA TOTP"))
        CU01_B(("CU-01.4: Bloquear Cuenta\npor Fuerza Bruta"))
        CU01_R(("CU-01.5: Recuperar\nContraseña con Token"))

        CU02(("CU-02: Realizar Diagnóstico\nClínico Cutáneo"))
        CU02_C(("CU-02.1: Recabar Consentimiento\nExpreso LFPDPPP"))
        CU02_A(("CU-02.2: Alertar Alérgenos\nINCI Incompatibles"))

        CU08(("CU-08: Tramitar y Resolver\nDerechos ARCO"))
        CU09(("CU-09: Consultar Catálogo,\nINCI y Registro COFEPRIS"))
        CU09_P(("CU-09.1: Auditar Historial\nde Precios Base"))
        CU13(("CU-13: Gestionar Rutinas,\nKits y Lista de Deseos"))

        CU01 -. "&laquo;include&raquo;" .-> CU01_H
        CU01 -. "&laquo;include&raquo;" .-> CU01_S
        CU01_M -. "&laquo;extend&raquo;" .-> CU01
        CU01_B -. "&laquo;extend&raquo;" .-> CU01
        CU01_R -. "&laquo;extend&raquo;" .-> CU01

        CU02 -. "&laquo;include&raquo;" .-> CU02_C
        CU02_A -. "&laquo;extend&raquo;" .-> CU02
        CU13 -. "&laquo;include&raquo;" .-> CU09
        CU09_P -. "&laquo;extend&raquo;" .-> CU09
    end

    USR --- CU01
    CLI --- CU02
    CLI --- CU08
    CLI --- CU09
    CLI --- CU13
    DER --- CU02
    DER --- CU09
    DER --- CU13
    ADM --- CU08
    ADM --- CU09_P
    QA --- CU09
```

### Diagrama 5 — 3.3 DCU del Submódulo 2: Motor Comercial, Suscripciones, Pagos, Antifraude, CFDI 4.0 y Promociones (Tablas 051–100)

```mermaid
flowchart LR
    CLI(["Cliente"])
    AFI(["Afiliado"])
    FAC(["Especialista Fiscal"])
    PAS(["Pasarela PCI-DSS"])
    SAT(["PAC / SAT CFDI 4.0"])

    subgraph FronteraSM2["Submódulo 2: Ventas, Pagos, Antifraude y CFDI 4.0 (Tablas 051–100)"]
        CU03(("CU-03: Realizar Checkout\ny Generar Orden"))
        CU03_R(("CU-03.1: Reservar Stock\nTemporal 15 min"))
        CU03_F(("CU-03.2: Evaluar Riesgo\nAntifraude 0-100"))
        CU03_S(("CU-03.3: Generar Split\nMultialmacén"))
        CU03_3DS(("CU-03.4: Validar Reto\nBancario 3D-Secure"))
        CU03_AB(("CU-03.5: Recuperar Carrito\nAbandonado 24h"))

        CU_PAG(("CU-PAG: Procesar Pago\nElectrónico"))
        CU_PT(("Pago con Tarjeta\nTokenizada PCI-DSS"))
        CU_PB(("Pago con Billetera\nElectrónica"))
        CU_PG(("Pago con Tarjeta\nde Regalo GiftCard"))
        CU_PS(("Split Multipago\nCombinado"))

        CU04(("CU-04: Contratar Suscripción\nBeauty-Box"))
        CU05(("CU-05: Emitir Factura\nElectrónica CFDI 4.0"))
        CU05_V(("CU-05.1: Validar RFC, LCO\ny Régimen SAT"))
        CU05_NC(("CU-05.2: Emitir Nota de Crédito\no Cancelación CFDI"))
        CU05_REP(("CU-05.3: Emitir Complemento\nde Pago REP"))

        CU10(("CU-10: Redimir Cupón,\nGWP y Venta Flash"))
        CU14(("CU-14: Atribuir y Liquidar\nComisiones de Afiliado"))

        CU03 -. "&laquo;include&raquo;" .-> CU03_R
        CU03 -. "&laquo;include&raquo;" .-> CU03_F
        CU03 -. "&laquo;include&raquo;" .-> CU_PAG
        CU03 -. "&laquo;include&raquo;" .-> CU03_S
        CU03_3DS -. "&laquo;extend&raquo;" .-> CU03_F
        CU03_AB -. "&laquo;extend&raquo;" .-> CU03
        CU10 -. "&laquo;extend&raquo;" .-> CU03
        CU14 -. "&laquo;extend&raquo;" .-> CU03

        CU_PT -->|Generalización| CU_PAG
        CU_PB -->|Generalización| CU_PAG
        CU_PG -->|Generalización| CU_PAG
        CU_PS -->|Generalización| CU_PAG

        CU04 -. "&laquo;include&raquo;" .-> CU_PAG
        CU05 -. "&laquo;include&raquo;" .-> CU05_V
        CU05_NC -. "&laquo;extend&raquo;" .-> CU05
        CU05_REP -. "&laquo;extend&raquo;" .-> CU05
    end

    CLI --- CU03
    CLI --- CU04
    CLI --- CU05
    CLI --- CU10
    AFI --- CU14
    FAC --- CU05
    FAC --- CU05_NC
    CU_PAG --- PAS
    CU05 --- SAT
    CU05_NC --- SAT
```

### Diagrama 6 — 3.4 DCU del Submódulo 3: Compras, WMS FEFO, Cadena de Frío IoT, Envíos, Postventa RMA y Auditoría Forense (Tablas 101–150)

```mermaid
flowchart LR
    CLI(["Cliente"])
    WMS(["Operador WMS"])
    QA(["Químico QA"])
    ADM(["Admin Seguridad"])
    LOG(["API Paquetería"])
    IOT(["Sensores IoT"])
    COF(["Portal COFEPRIS"])

    subgraph FronteraSM3["Submódulo 3: Compras, WMS FEFO, Envíos, RMA y Forense (Tablas 101–150)"]
        CU06(("CU-06: Recepcionar OC\ne Ingresar Lote FEFO"))
        CU06_QA(("CU-06.1: Ejecutar Inspección\nSanitaria QA y COA"))
        CU06_K(("CU-06.2: Registrar Asiento\nen Kardex de Inventario"))
        CU06_M(("CU-06.3: Cuarentena y Acta de\nDestrucción COFEPRIS"))

        CU15(("CU-15: Monitorear Telemetría IoT\ny Alertas de Caducidad"))
        CU15_A(("CU-15.1: Detonar Alerta\nFuera de Rango 2-8 C"))
        CU15_C(("CU-15.2: Ejecutar Conteo\nCíclico y Transferencia"))

        CU11(("CU-11: Despachar Bultos\ny Rastrear Envíos"))
        CU11_L(("CU-11.1: Trazar Lotes FEFO\npor Paquete"))
        CU11_P(("CU-11.2: Gestionar Entrega\nen Locker Pickup"))
        CU11_I(("CU-11.3: Registrar Incidencia\no Intento Fallido"))

        CU07(("CU-07: Gestionar Devolución\nRMA y Retorno"))
        CU07_H(("CU-07.1: Dictaminar Higiene\nde Retorno en Cuarentena"))
        CU07_F(("CU-07.2: Notificar Farmacovigilancia\nRAM a COFEPRIS"))

        CU12(("CU-12: Auditar Bitácora Forense\ny Aplicar Soft-Delete"))
        CU12_S(("CU-12.1: Sellar Evento con\nFirma HMAC-SHA256"))

        CU06 -. "&laquo;include&raquo;" .-> CU06_QA
        CU06 -. "&laquo;include&raquo;" .-> CU06_K
        CU06_M -. "&laquo;extend&raquo;" .-> CU06_QA

        CU15_A -. "&laquo;extend&raquo;" .-> CU15
        CU15_C -. "&laquo;extend&raquo;" .-> CU15

        CU11 -. "&laquo;include&raquo;" .-> CU11_L
        CU11 -. "&laquo;include&raquo;" .-> CU06_K
        CU11_P -. "&laquo;extend&raquo;" .-> CU11
        CU11_I -. "&laquo;extend&raquo;" .-> CU11

        CU07 -. "&laquo;include&raquo;" .-> CU07_H
        CU07_F -. "&laquo;extend&raquo;" .-> CU07

        CU12 -. "&laquo;include&raquo;" .-> CU12_S
    end

    WMS --- CU06
    WMS --- CU11
    WMS --- CU15
    QA --- CU06_QA
    QA --- CU07_H
    QA --- CU07_F
    QA --- CU15
    CLI --- CU07
    ADM --- CU12
    CU11 --- LOG
    CU15 --- IOT
    CU07_F --- COF
```

---

## 2. Diagramas de Clases y Paquetes (Dominio y Seguridad RBAC)
> Archivo fuente: `03_diagrama_de_clases.md`

### Diagrama 7 — 1.2 DIAGRAMA DE PAQUETES DEL SISTEMA (UML 2.5 — 3 SUBMÓDULOS Y 14 PAQUETES)

```mermaid
flowchart TB
    subgraph PKG_CORE["&laquo;package&raquo; derma_ecom.core (Transversal)"]
        P_BASE["EntidadAuditable (PK=ID)\nICryptoHashingService\nIDataRepositoryMultiSGBD"]
    end

    subgraph PKG_SM1["&laquo;package&raquo; modulo1_identidad_catalogo — José Luis Luna García (001–050)"]
        P_SEG["&laquo;package&raquo; seguridad\n(Usuario, Rol, Permiso, BitacoraAcceso)"]
        P_CLI["&laquo;package&raquo; clientes\n(Cliente, PerfilCutaneo, SolicitudARCO)"]
        P_CAT["&laquo;package&raquo; catalogo\n(Categoria, ProductoMaestro, VarianteSKU, INCI)"]
        P_COM["&laquo;package&raquo; comunidad\n(RutinaBelleza, ListaDeseos)"]
        P_CLI -. "&laquo;import&raquo;" .-> P_SEG
        P_COM -. "&laquo;import&raquo;" .-> P_CLI
        P_COM -. "&laquo;import&raquo;" .-> P_CAT
    end

    subgraph PKG_SM2["&laquo;package&raquo; modulo2_comercial_fiscal — Sheyla Estefanía Moncada Guel (051–100)"]
        P_VEN["&laquo;package&raquo; ventas\n(OrdenVenta, OrdenDetalle, Split, Suscripcion)"]
        P_PAG["&laquo;package&raquo; pagos\n(TransaccionPago, Antifraude, IPaymentGateway)"]
        P_FIS["&laquo;package&raquo; fiscal\n(FacturaCFDI, NotaCredito, ITaxStampingPAC)"]
        P_PRO["&laquo;package&raquo; promos\n(Campania, CuponPromocion, VentaFlash)"]
        P_PAG -. "&laquo;import&raquo;" .-> P_VEN
        P_FIS -. "&laquo;import&raquo;" .-> P_VEN
        P_FIS -. "&laquo;import&raquo;" .-> P_PAG
        P_VEN -. "&laquo;import&raquo;" .-> P_PRO
    end

    subgraph PKG_SM3["&laquo;package&raquo; modulo3_logistica_forense — Eduardo Salazar Martínez (101–150)"]
        P_CMP["&laquo;package&raquo; compras\n(Proveedor, OrdenCompraProveedor, InspeccionQA)"]
        P_WMS["&laquo;package&raquo; wms\n(AlmacenCEDIS, LoteSanitario, TelemetriaIoT, IFefo)"]
        P_ENV["&laquo;package&raquo; envios\n(DespachoOrden, GuiaRastreo, PuntoPickup)"]
        P_PVT["&laquo;package&raquo; postventa\n(SolicitudRMA, ReporteFarmacovigilancia)"]
        P_AUD["&laquo;package&raquo; auditoria & sistema\n(BitacoraSeguridadGlobal, CambiosJSON)"]
        P_WMS -. "&laquo;import&raquo;" .-> P_CMP
        P_ENV -. "&laquo;import&raquo;" .-> P_WMS
        P_PVT -. "&laquo;import&raquo;" .-> P_WMS
    end

    PKG_SM1 -. "&laquo;import&raquo;" .-> PKG_CORE
    PKG_SM2 -. "&laquo;import&raquo;" .-> PKG_CORE
    PKG_SM3 -. "&laquo;import&raquo;" .-> PKG_CORE
    P_VEN -. "&laquo;access&raquo;" .-> P_CLI
    P_VEN -. "&laquo;access&raquo;" .-> P_CAT
    P_WMS -. "&laquo;access&raquo;" .-> P_CAT
    P_ENV -. "&laquo;access&raquo;" .-> P_VEN
    P_PVT -. "&laquo;access&raquo;" .-> P_VEN
    P_AUD -. "&laquo;access&raquo;" .-> P_SEG
```

### Diagrama 8 — 2. DIAGRAMA DE CLASES DEL SUBMÓDULO 1: SEGURIDAD, IDENTIDAD, PERFIL CLÍNICO Y CATÁLOGO INCI

```mermaid
classDiagram
    class EntidadAuditable {
        <<abstract>>
        #Long ID
        #Boolean activo
        #DateTime fechaCreacion
        #Long creadoPor
        #DateTime fechaModificacion
        #Long modificadoPor
        #DateTime fechaBaja
        #Long eliminadoPor
        +activar() void
        +desactivar(Long idOperador, String motivo) void
        +estaActivo() Boolean
    }

    class ICryptoHashingService {
        <<interface>>
        +generarSalt(Int bytes) String
        +calcularHash(String passPlano, String salt) String
        +verificarHash(String passPlano, String salt, String hash) Boolean
        +validarTotp(String secreto, String codigo) Boolean
        +generarFirmaHMAC(String payload) String
    }

    class Usuario {
        -UUID uuidUsuario
        -String email
        -String passwordHash
        -String passwordSalt
        -Boolean emailVerificado
        -Boolean cuentaBloqueada
        -Int intentosFallidosConsecutivos
        -Boolean mfaHabilitado
        -String mfaSecreto
        +autenticar(String passPlano, ICryptoHashingService svc) Boolean
        +bloquearPorFuerzaBruta() void
        +reiniciarIntentos() void
    }

    class Rol {
        -String codigoRol
        -String nombreRol
        -Int nivelJerarquico
        +asignarPermiso(Permiso p) void
        +revocarPermiso(Permiso p) void
    }

    class Permiso {
        -String clavePermiso
        -String moduloSistema
        -String accion
        +validarAcceso(String accion) Boolean
    }

    class BitacoraAcceso {
        -Long ID_usuario
        -String emailIngresado
        -String direccionIp
        -String userAgent
        -String resultado
        +registrarIntento() void
    }

    class Cliente {
        -Long ID_usuario
        -String nombres
        -String primerApellido
        -String segundoApellido
        -String curp
        -String rfc
        +otorgarConsentimientoLFPDPPP() void
        +tramitarSolicitudARCO(String tipoDerecho) void
    }

    class PerfilCutaneo {
        -Long ID_cliente
        -Long ID_tipo_piel
        -String sensibilidadSolar
        -String nivelOleosidad
        -Boolean propensionAcne
        -Boolean consentimientoDatosSensibles
        +evaluarCompatibilidad(ProductoMaestro prod) Boolean
    }

    class Categoria {
        -String codigoCategoria
        -String nombreCategoria
        -Long ID_categoria_padre
        -Int nivelArbol
        +obtenerSubcategorias() List~Categoria~
    }

    class ProductoMaestro {
        -Long ID_marca
        -Long ID_subcategoria
        -Long ID_laboratorio
        -Long ID_certificacion_sanitaria
        -String codigoProducto
        -String nombreComercial
        -Boolean esSensibleTemperatura
        +validarRegistroCOFEPRIS() Boolean
    }

    class VarianteSKU {
        -Long ID_producto
        -String skuCodigo
        -String codigoBarrasEan13
        -Decimal precioBaseMenudeo
        -Decimal costoEstandarCompra
        +actualizarPrecio(Decimal nuevoPrecio) void
    }

    class IngredienteINCI {
        -String codigoCas
        -String nombreInci
        -Boolean esComedogenico
        -Boolean esAlergenoFrecuente
        +verificarContraindicacion(PerfilCutaneo perfil) Boolean
    }

    EntidadAuditable <|-- Usuario
    EntidadAuditable <|-- Rol
    EntidadAuditable <|-- Permiso
    EntidadAuditable <|-- BitacoraAcceso
    EntidadAuditable <|-- Cliente
    EntidadAuditable <|-- PerfilCutaneo
    EntidadAuditable <|-- Categoria
    EntidadAuditable <|-- ProductoMaestro
    EntidadAuditable <|-- VarianteSKU
    EntidadAuditable <|-- IngredienteINCI

    Usuario ..> ICryptoHashingService : usa
    Usuario "1..*" o-- "1..*" Rol : posee
    Rol "1..*" o-- "1..*" Permiso : autoriza
    Usuario "1" *-- "0..*" BitacoraAcceso : registra
    Usuario "1" -- "0..1" Cliente : especializa
    Cliente "1" *-- "0..1" PerfilCutaneo : define
    Categoria "0..1" o-- "0..*" Categoria : categoria_padre
    Categoria "1" o-- "0..*" ProductoMaestro : clasifica
    ProductoMaestro "1" *-- "1..*" VarianteSKU : presenta
    ProductoMaestro "1..*" o-- "1..*" IngredienteINCI : formula_con
```

### Diagrama 9 — 3. DIAGRAMA DE CLASES DEL SUBMÓDULO 2: VENTAS, SUSCRIPCIONES, PAGOS, ANTIFRAUDE Y CFDI 4.0

```mermaid
classDiagram
    class IPaymentGateway {
        <<interface>>
        +tokenizarInstrumento(String payload) String
        +ejecutarCobro(String token, Decimal monto, String idempotencyKey) Boolean
        +procesarReembolso(String refPasarela, Decimal monto) Boolean
    }

    class ITaxStampingPAC {
        <<interface>>
        +validarLCO(String rfc, String cp) Boolean
        +timbrarXmlCFDI40(String xmlSellado) String
        +cancelarCFDI(String uuidSat, String motivoSat) Boolean
    }

    class OrdenVenta {
        -Long ID_cliente
        -Long ID_estado_orden
        -Long ID_direccion_envio
        -Long ID_motivo_cancelacion
        -String folioOrden
        -Decimal subtotalMercancia
        -Decimal totalImpuestos
        -Decimal totalNeto
        +calcularTotales() void
        +generarSplitsAlmacen() List~OrdenSplitAlmacen~
        +cancelar(Long idMotivo) void
    }

    class OrdenDetalle {
        -Long ID_orden
        -Long ID_variante_sku
        -Int numeroPartida
        -Int cantidadComprada
        -Decimal precioUnitarioVenta
        -Decimal tasaIvaPorcentual
        +calcularSubtotalLinea() Decimal
    }

    class OrdenSplitAlmacen {
        -Long ID_orden
        -String codigoSplit
        -String almacenAsignado
        -String estadoSplit
        +despacharSplit() void
    }

    class EvaluacionAntifraude {
        -Long ID_orden
        -Long ID_regla_antifraude
        -Int scoreRiesgoTotal
        -String nivelRiesgo
        -Boolean requiere3DS
        +evaluarReglas() Int
    }

    class TransaccionPago {
        -Long ID_orden
        -Long ID_proveedor_pasarela
        -Long ID_metodo_pago
        -String referenciaPasarela
        -Decimal montoCobrado
        -String estadoPago
        +procesarConPasarela(IPaymentGateway gw) Boolean
    }

    class SuscripcionCliente {
        -Long ID_cliente
        -Long ID_plan_suscripcion
        -Long ID_frecuencia_suscripcion
        -String estadoSuscripcion
        -Date fechaProximoCobro
        +ejecutarCobroRecurrente(IPaymentGateway gw) Boolean
        +pausarSuscripcion() void
    }

    class FacturaCFDI {
        -Long ID_orden
        -Long ID_dato_fiscal
        -UUID uuidSatFiscal
        -String serieFactura
        -String folioFactura
        -String estadoCfdi
        +generarXmlAnexo20() String
        +timbrar(ITaxStampingPAC pac) Boolean
    }

    class CuponPromocion {
        -Long ID_campania
        -Long ID_tipo_descuento
        -String codigoCupon
        -Decimal valorDescuento
        -Int usosActuales
        +validarElegibilidad(OrdenVenta orden) Boolean
    }

    OrdenVenta "1" *-- "1..*" OrdenDetalle : desglosa
    OrdenVenta "1" *-- "1..*" OrdenSplitAlmacen : divide_en
    OrdenVenta "1" *-- "0..1" EvaluacionAntifraude : evalua
    OrdenVenta "1" *-- "1..*" TransaccionPago : cobra_con
    OrdenVenta "1" -- "0..1" FacturaCFDI : factura_como
    CuponPromocion "0..*" --> "0..*" OrdenVenta : aplica_descuento
    TransaccionPago ..> IPaymentGateway : depende
    SuscripcionCliente ..> IPaymentGateway : depende
    FacturaCFDI ..> ITaxStampingPAC : depende
```

### Diagrama 10 — 4. DIAGRAMA DE CLASES DEL SUBMÓDULO 3: COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS, RMA Y FORENSE

```mermaid
classDiagram
    class IFefoAllocationService {
        <<interface>>
        +seleccionarLotesFEFO(Long idVarianteSku, Int cantidad) List~LoteSanitario~
        +verificarExcursionTermica(Long idZona) Boolean
    }

    class Proveedor {
        -String codigoProveedor
        -String razonSocial
        -String rfcProveedor
        -String paisOrigen
        +evaluarSLA() Decimal
    }

    class OrdenCompraProveedor {
        -Long ID_proveedor
        -Long ID_estado_oc
        -String folioOc
        -Decimal totalOc
        +emitirAProveedor() void
    }

    class InspeccionSanitariaQA {
        -Long ID_recepcion_detalle
        -Decimal temperaturaArriboC
        -String dictamenQa
        -String certificadoCoaUrl
        +aprobarOLlevarACuarentena() Boolean
    }

    class AlmacenCEDIS {
        -String codigoAlmacen
        -String nombreAlmacen
        -String ciudad
        -Boolean tieneCamaraFria
        +consultarCapacidad() Int
    }

    class LoteSanitario {
        -Long ID_variante_sku
        -String numeroLoteFabricante
        -Date fechaFabricacion
        -Date fechaCaducidad
        -String estatusSanitario
        +diasRestantesVidaUtil() Int
        +marcarDestruccionCOFEPRIS() void
    }

    class TelemetriaIoT {
        -Long ID_zona_almacen
        -Decimal temperaturaCelsius
        -Decimal humedadRelativaPorc
        -Boolean alertaFueraDeRango
        +evaluarRango2a8C() Boolean
    }

    class DespachoOrden {
        -Long ID_orden_split
        -Long ID_transportista
        -Long ID_servicio_envio
        -String estadoEnvio
        +generarGuiaRastreo() String
    }

    class SolicitudRMA {
        -Long ID_orden
        -Long ID_motivo_rma
        -String folioRma
        -String estadoRma
        +dictaminarHigieneRetorno() void
    }

    class ReporteFarmacovigilancia {
        -Long ID_cliente
        -Long ID_producto
        -Long ID_lote
        -String severidadClinica
        -Boolean notificadoACofepris
        +enviarNotificacionCOFEPRIS() Boolean
    }

    class BitacoraSeguridadGlobal {
        -Long ID_tipo_evento
        -Long ID_usuario
        -String direccionIp
        -String firmaIntegridadHash
        +verificarIntegridadHMAC() Boolean
    }

    Proveedor "1" --> "0..*" OrdenCompraProveedor : recibe
    OrdenCompraProveedor "1" *-- "0..*" InspeccionSanitariaQA : valida_recepcion
    AlmacenCEDIS "1" o-- "0..*" LoteSanitario : almacena
    AlmacenCEDIS "1" *-- "0..*" TelemetriaIoT : monitorea
    DespachoOrden ..> IFefoAllocationService : asigna_lotes
    DespachoOrden "1" o-- "1..*" LoteSanitario : traza_en_bulto
    SolicitudRMA "1" -- "0..1" ReporteFarmacovigilancia : escala_ram
    ReporteFarmacovigilancia "0..*" --> "1" LoteSanitario : investiga_lote
    BitacoraSeguridadGlobal ..> SolicitudRMA : audita
```

---

## 3. Diagramas de Secuencia (Login Criptográfico y Transacciones Críticas)
> Archivo fuente: `04_diagramas_de_secuencia.md`

### Diagrama 11 — 2. DS-01: AUTENTICACIÓN SEGURA DE USUARIO (LOGIN CRIPTOGRÁFICO, MFA TOTP Y BLOQUEO POR FUERZA BRUTA) — CU-01 *(OBLIGATORIO)*

```mermaid
sequenceDiagram
    autonumber
    actor Usuario as Usuario / Navegador
    participant Vista as Vista (LoginSPA)
    participant Ctrl as Controlador (AuthController)
    participant Crypto as Servicio Criptográfico (CryptoHashingService)
    participant UserRepo as Repositorio Datos (UsuarioRepository)
    participant AuditRepo as Repositorio Auditoría (BitacoraSeguridadRepository)

    Usuario->>Vista: Ingresa email y contraseña (TLS 1.3)
    activate Vista
    Vista->>Ctrl: POST /api/v1/auth/login {email, password}
    activate Ctrl

    Ctrl->>UserRepo: obtenerUsuarioPorEmail(email) [seguridad.usuarios]
    activate UserRepo
    alt Usuario no existe o activo = 0
        UserRepo-->>Ctrl: null
        deactivate UserRepo
        Ctrl->>Crypto: simularHashDummy() [Mitigación Timing Attack]
        activate Crypto
        Crypto-->>Ctrl: ok
        deactivate Crypto
        Ctrl->>AuditRepo: registrarIntentoLogin(ID_usuario=NULL, IP, "FALLIDO_CREDENCIALES")
        Ctrl-->>Vista: HTTP 401 "Credenciales inválidas"
        Vista-->>Usuario: Muestra error genérico de autenticación
    else Usuario encontrado
        UserRepo-->>Ctrl: Usuario {ID, password_hash, password_salt, cuenta_bloqueada, intentos_fallidos_consecutivos, mfa_habilitado, mfa_secreto}
        deactivate UserRepo
        alt cuenta_bloqueada = 1 y (ahora - fecha_bloqueo < 15 min)
            Ctrl->>AuditRepo: registrarIntentoLogin(ID, IP, "BLOQUEADO_FUERZA_BRUTA")
            Ctrl-->>Vista: HTTP 429 "Cuenta bloqueada temporalmente (15 min)"
            Vista-->>Usuario: Notifica bloqueo preventivo y enlace de recuperación
        else Cuenta habilitada
            Ctrl->>Crypto: verificarPassword(password, password_salt, password_hash)
            activate Crypto
            Note over Crypto: Hash iterativo con salt individual<br/>(PBKDF2-SHA512 / bcrypt / Argon2id)<br/>Comparación en tiempo constante
            alt Contraseña incorrecta
                Crypto-->>Ctrl: false
                deactivate Crypto
                Ctrl->>UserRepo: incrementarIntentosFallidos(ID) [seguridad.usuarios]
                Ctrl->>AuditRepo: registrarIntentoLogin(ID, IP, "FALLIDO_PASSWORD") [seguridad.intentos_login]
                opt intentos_fallidos_consecutivos >= 5
                    Ctrl->>UserRepo: bloquearCuenta(ID, cuenta_bloqueada=1, fecha_bloqueo=NOW)
                    Ctrl->>Crypto: generarFirmaHMAC_SHA256(payloadEvento)
                    activate Crypto
                    Crypto-->>Ctrl: firma_integridad_hash
                    deactivate Crypto
                    Ctrl->>AuditRepo: insertarBitacoraForense(ID, "BLOQUEO_FUERZA_BRUTA", firma_integridad_hash) [auditoria.bitacora_seguridad_global]
                end
                Ctrl-->>Vista: HTTP 401 "Credenciales inválidas"
                Vista-->>Usuario: Solicita reintento o recuperación de contraseña
            else Contraseña correcta
                Crypto-->>Ctrl: true
                deactivate Crypto
                opt mfa_habilitado = 1
                    Ctrl-->>Vista: HTTP 206 "Requiere código MFA TOTP (6 dígitos)"
                    Vista-->>Usuario: Solicita código de app autenticadora
                    Usuario->>Vista: Ingresa totpCode ("849201")
                    Vista->>Ctrl: POST /api/v1/auth/mfa-verify {tempId, totpCode}
                    Ctrl->>Crypto: validarTotpRFC6238(mfa_secreto, totpCode, +-30s)
                    activate Crypto
                    alt TOTP inválido o expirado
                        Crypto-->>Ctrl: false
                        deactivate Crypto
                        Ctrl->>AuditRepo: registrarIntentoLogin(ID, IP, "FALLIDO_MFA")
                        Ctrl-->>Vista: HTTP 401 "Código MFA inválido"
                        Vista-->>Usuario: Permite hasta 2 reintentos
                    else TOTP válido
                        Crypto-->>Ctrl: true
                        deactivate Crypto
                    end
                end
                Ctrl->>UserRepo: cargarRolesPermisosRBAC(ID) [seguridad.usuarios_roles + roles_permisos]
                UserRepo-->>Ctrl: permisosRBAC[]
                Ctrl->>Crypto: firmarJWT_RS256(ID, permisosRBAC) + hashTokenSesion()
                activate Crypto
                Crypto-->>Ctrl: {jwt, token_sesion_hash}
                deactivate Crypto
                Ctrl->>UserRepo: resetearIntentosYActualizarUltimoLogin(ID)
                Ctrl->>UserRepo: crearSesionActiva(ID_usuario=ID, token_sesion_hash, IP) [seguridad.sesiones_activas]
                Ctrl->>AuditRepo: registrarIntentoLogin(ID, IP, "EXITOSO") [seguridad.intentos_login]
                Ctrl-->>Vista: HTTP 200 {jwt, perfil, permisosRBAC}
                Vista-->>Usuario: Redirige al portal según rol RBAC
            end
        end
    end
    deactivate Ctrl
    deactivate Vista
```

### Diagrama 12 — 3. DS-02: DIAGNÓSTICO CLÍNICO CUTÁNEO Y CONSENTIMIENTO EXPRESO LFPDPPP — CU-02

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Cliente / Paciente
    actor Dermo as Dermoconsultor Clínico
    participant QuizUI as Vista (QuizCutaneoUI)
    participant DiagCtrl as DiagnosticoController
    participant LegalSvc as ConsentimientoLFPDPPPService
    participant SkinEngine as MotorReglasDermatologicas
    participant PerfilRepo as PerfilCutaneoRepository
    participant AuditRepo as BitacoraAuditoriaRepository

    Cliente->>QuizUI: Inicia Test Dermatológico de Piel
    QuizUI-->>Cliente: Despliega Aviso de Privacidad Integral (Datos Sensibles Art. 9 LFPDPPP)
    Cliente->>QuizUI: Acepta consentimiento expreso y responde cuestionario
    QuizUI->>DiagCtrl: POST /api/v1/diagnostico {ID_cliente, aceptaSensibles, respuestas[]}

    alt Cliente rechaza consentimiento de datos sensibles
        DiagCtrl-->>QuizUI: HTTP 403 "Sin consentimiento expreso no se almacenan datos de salud"
        QuizUI-->>Cliente: Redirige a catálogo público sin perfilado clínico
    else Consentimiento otorgado
        DiagCtrl->>LegalSvc: registrarConsentimiento(ID_cliente, IP, versionAviso)
        LegalSvc->>PerfilRepo: insertarConsentimiento() [clientes.consentimientos_privacidad]
        LegalSvc->>AuditRepo: registrarEventoLegal(ID_cliente, "CONSENTIMIENTO_SALUD_LFPDPPP")

        DiagCtrl->>SkinEngine: evaluarCuestionario(respuestas[])
        SkinEngine->>PerfilRepo: obtenerPesosClinicos() [clientes.opciones_pregunta]
        SkinEngine-->>DiagCtrl: Diagnostico {ID_tipo_piel, puntaje_total, condiciones[], alergenosEvitar[]}

        DiagCtrl->>PerfilRepo: guardarEvaluacionYPerfil(ID_cliente, Diagnostico) [evaluaciones_diagnostico, respuestas_evaluacion, perfil_cutaneo, cliente_condiciones]
        opt Condición severa o ingredientes regulados COFEPRIS
            DiagCtrl->>Dermo: Notifica expediente para validación clínica
            Dermo->>DiagCtrl: POST /api/v1/diagnostico/validar {observaciones_dermoconsultor}
        end
        DiagCtrl->>SkinEngine: filtrarProductosCompatibles(alergenosEvitar[]) [catalogo.alergenos_ingrediente]
        SkinEngine-->>DiagCtrl: rutinaRecomendada[]
        DiagCtrl-->>QuizUI: HTTP 200 {ID_evaluacion, diagnostico_sugerido, rutinaRecomendada[]}
        QuizUI-->>Cliente: Muestra diagnóstico cutáneo y rutina personalizada
    end
```

### Diagrama 13 — 4. DS-03: CHECKOUT SEGURO, RESERVA 15 MIN, ANTIFRAUDE, PAGO PCI-DSS Y SPLIT MULTIALMACÉN — CU-03

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Cliente Comprador
    participant WebUI as Vista (CheckoutUI)
    participant GateSDK as Pasarela SDK (PCI-DSS)
    participant OrderCtrl as OrdenesController
    participant FraudSvc as AntifraudeService
    participant SplitSvc as MultiCedisSplitService
    participant WmsRepo as InventarioLotesRepository
    participant OrderRepo as OrdenesVentaRepository

    Cliente->>WebUI: Pulsa "Proceder al Pago"
    WebUI->>OrderCtrl: POST /api/v1/checkout/reservar {ID_carrito}
    OrderCtrl->>WmsRepo: reservarStock15Min(items) [ventas.reservas_temporales_stock]
    WmsRepo-->>OrderCtrl: reservaActiva (expira +15 min)
    OrderCtrl-->>WebUI: HTTP 200 {totales, IVA_16, descuentos}

    Cliente->>WebUI: Selecciona dirección y captura datos de pago en iframe PCI-DSS
    WebUI->>GateSDK: tokenizarTarjeta(PAN, CVV, vigencia)
    GateSDK-->>WebUI: tokenEfimero ("tok_pci_9a8f") [Sin PAN/CVV en BD]
    WebUI->>OrderCtrl: POST /api/v1/ordenes/confirmar {ID_carrito, ID_direccion_envio, tokenEfimero, idempotencyKey}

    OrderCtrl->>FraudSvc: evaluarRiesgo(ID_cliente, monto, IP, reglas) [pagos.reglas_antifraude]
    FraudSvc-->>OrderCtrl: Evaluacion {score_riesgo_total, nivel_riesgo}
    OrderCtrl->>OrderRepo: guardarEvaluacionAntifraude() [pagos.evaluaciones_antifraude]

    alt Score >= 85 (Alto Riesgo / Fraude)
        OrderCtrl->>WmsRepo: liberarReservaStock(ID_carrito)
        OrderCtrl-->>WebUI: HTTP 403 "Operación rechazada por seguridad antifraude"
    else Score < 85 (Continuar; 3DS si >= 65)
        opt score_riesgo_total >= 65
            OrderCtrl->>GateSDK: iniciarReto3DSecure(tokenEfimero)
            GateSDK-->>OrderCtrl: 3DS_VERIFICADO
        end
        OrderCtrl->>GateSDK: ejecutarCobro(tokenEfimero, monto, MXN, idempotencyKey)
        alt Cobro declinado por banco
            GateSDK-->>OrderCtrl: HTTP 402 Declinado
            OrderCtrl->>OrderRepo: registrarIntentoFallido() [pagos.intentos_cobro]
            OrderCtrl-->>WebUI: HTTP 402 "Pago declinado; puede elegir otro método o Split Multipago"
        else Cobro aprobado
            GateSDK-->>OrderCtrl: Aprobado {referencia_pasarela, codigo_autorizacion}
            OrderCtrl->>SplitSvc: calcularSplitsPorCEDIS(items, ID_direccion_envio) [wms.inventario_lotes_ubicacion]
            SplitSvc-->>OrderCtrl: splits[] (ej. CEDIS MTY + CEDIS CDMX)
            OrderCtrl->>OrderRepo: guardarOrdenDetallesSplitsYPago() [ventas.ordenes, ordenes_detalles, ordenes_splits_almacen, pagos.transacciones]
            OrderCtrl->>WmsRepo: confirmarReservaComoVendido(ID_carrito)
            OrderCtrl-->>WebUI: HTTP 201 {ID_orden, folio_orden, splits}
            WebUI-->>Cliente: Confirmación de compra y seguimiento por almacén
        end
    end
```

### Diagrama 14 — 5. DS-04: COBRO RECURRENTE Y PROGRAMACIÓN DE SUSCRIPCIÓN BEAUTY-BOX — CU-04

```mermaid
sequenceDiagram
    autonumber
    participant Cron as Worker Cron Suscripciones
    participant SubSvc as SuscripcionEngineService
    participant SubRepo as SuscripcionesRepository
    participant PayGate as Pasarela Recurrente PCI-DSS
    participant PerfilRepo as PerfilCutaneoRepository
    participant NotifSvc as NotificacionesService

    Cron->>SubSvc: ejecutarCorteProgramado(fechaHoy)
    SubSvc->>SubRepo: obtenerEntregasPendientes(fechaHoy) [ventas.suscripciones_calendario_entregas]
    SubRepo-->>SubSvc: entregasProgramadas[]

    loop Para cada suscripción activa con corte hoy
        SubSvc->>PayGate: cobrarTokenRecurrente(token_tarjeta_pasarela, montoPlan, idempotencyKey)
        alt Cargo recurrente rechazado
            PayGate-->>SubSvc: Error (Fondos insuficientes / tarjeta vencida)
            SubSvc->>SubRepo: registrarIntentoYBitacora(ID_suscripcion_cliente, "PAUSADA_PAGO") [pagos.intentos_cobro, ventas.suscripciones_bitacora_estados]
            SubSvc->>NotifSvc: encolarAvisoReintento(ID_usuario) [sistema.notificaciones_push_email]
        else Cargo aprobado
            PayGate-->>SubSvc: PagoAprobado {referencia_pasarela}
            SubSvc->>PerfilRepo: consultarPerfilCutaneoVigente(ID_cliente) [clientes.perfil_cutaneo]
            PerfilRepo-->>SubSvc: perfilVigente
            SubSvc->>SubRepo: registrarOrdenTransaccionYProximaEntrega(+ciclo) [ventas.ordenes, pagos.transacciones, ventas.suscripciones_calendario_entregas]
            SubSvc->>NotifSvc: encolarConfirmacionBeautyBox(ID_usuario) [sistema.notificaciones_push_email]
        end
    end
```

### Diagrama 15 — 6. DS-05: EMISIÓN, SELLADO CSD Y TIMBRADO DE FACTURA ELECTRÓNICA CFDI 4.0 — CU-05

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Cliente Fiscal
    participant Portal as Vista (PortalFacturacion)
    participant FiscalCtrl as FacturacionController
    participant CfdiSvc as GeneradorXmlCfdiService
    participant CsdSvc as SelladoDigitalCSD
    participant PacSat as PAC Autorizado / SAT 4.0
    participant FiscalRepo as FacturasRepository

    Cliente->>Portal: Solicita factura CFDI 4.0 {ID_orden, ID_uso_cfdi}
    Portal->>FiscalCtrl: POST /api/v1/facturas/timbrar {ID_orden, ID_dato_fiscal, ID_uso_cfdi}
    FiscalCtrl->>FiscalRepo: obtenerDatosFiscalesYCatalogosSAT(ID_dato_fiscal) [fiscal.datos_fiscales_cliente, regimenes_sat, usos_cfdi]
    FiscalRepo-->>FiscalCtrl: datosFiscales + ordenPagada

    FiscalCtrl->>CfdiSvc: construirXmlAnexo20(orden, datosFiscales, claveSAT="53131600")
    CfdiSvc-->>FiscalCtrl: xmlSinSello
    FiscalCtrl->>CsdSvc: generarCadenaOriginalYFirmarCSD(xmlSinSello) [SHA256withRSA]
    CsdSvc-->>FiscalCtrl: selloDigitalEmisor
    FiscalCtrl->>PacSat: timbrarCFDI40(xmlSellado)

    alt Rechazo SAT (RFC fuera de LCO o CP/Régimen inconsistente)
        PacSat-->>FiscalCtrl: ErrorSAT {codigo: "CFDI40145"}
        FiscalCtrl-->>Portal: HTTP 422 "Corrija datos conforme a su Constancia Fiscal"
        Portal-->>Cliente: Muestra detalle del campo rechazado
    else Timbrado exitoso (< 2.0 s)
        PacSat-->>FiscalCtrl: Timbre {uuid_sat_fiscal, fecha_timbrado, xmlTimbrado}
        FiscalCtrl->>CfdiSvc: generarPdfConQR(xmlTimbrado)
        CfdiSvc-->>FiscalCtrl: pdfBytes
        FiscalCtrl->>FiscalRepo: guardarFacturaYPartidas(uuid_sat_fiscal, xmlUrl, pdfUrl) [fiscal.facturas_cfdi, fiscal.facturas_partidas]
        FiscalCtrl-->>Portal: HTTP 200 {uuid_sat_fiscal, xmlUrl, pdfUrl}
        Portal-->>Cliente: Descarga inmediata de XML y PDF timbrados
    end
```

### Diagrama 16 — 7. DS-06: RECEPCIÓN EN CEDIS, TELEMETRÍA IOT, DICTAMEN QA Y ALTA DE LOTE FEFO — CU-06

```mermaid
sequenceDiagram
    autonumber
    actor WMS as Operador WMS CEDIS
    actor QA as Químico Inspector QA
    participant PDA as Vista (Terminal Móvil PDA)
    participant WmsCtrl as RecepcionWmsController
    participant IoTSvc as TelemetriaIoTService
    participant QaSvc as ControlCalidadService
    participant WmsRepo as ComprasWmsRepository

    WMS->>PDA: Escanea folio de OC y realiza conteo ciego de tarimas
    PDA->>WmsCtrl: POST /api/v1/wms/recepciones {ID_orden_compra, detalles[]}
    WmsCtrl->>WmsRepo: crearRecepcionEnCuarentena() [compras.recepciones_mercancia, recepciones_detalles]
    WmsCtrl->>IoTSvc: consultarCurvaTermica(ID_zona_almacen) [wms.monitoreo_temperatura_humedad]
    IoTSvc-->>WmsCtrl: lecturasTemperatura (rango exigido 2-8 °C)
    WmsCtrl->>QaSvc: validarCadenaDeFrio(lecturasTemperatura)

    alt Excursión térmica (> 8 °C) o dictamen QA RECHAZADO
        QaSvc-->>WmsCtrl: RECHAZADO ("Ruptura de cadena de frío / empaque alterado")
        WmsCtrl->>WmsRepo: registrarDictamenRechazoYMerma() [compras.inspecciones_sanitarias_qa, wms.mermas_destruccion_sanitaria]
        WmsCtrl-->>PDA: ALERTA ROJA: Aislar lote en cuarentena para destrucción COFEPRIS
    else Cadena de frío íntegra y dictamen QA APROBADO
        QA->>PDA: Captura pH, integridad de sellos, COA y dictamen "APROBADO"
        PDA->>WmsCtrl: POST /api/v1/wms/qa-aprobar {ID_recepcion_detalle, dictamen_qa="APROBADO"}
        WmsCtrl->>WmsRepo: registrarInspeccionYCrearLoteFEFO() [compras.inspecciones_sanitarias_qa, wms.lotes_fabricacion_sanitaria]
        WmsCtrl->>WmsRepo: ubicarStockYRegistrarKardex() [wms.inventario_lotes_ubicacion, wms.kardex_movimientos]
        WmsCtrl-->>PDA: HTTP 201 "Lote liberado en ubicación WMS bajo estrategia FEFO"
    end
```

### Diagrama 17 — 8. DS-07: DEVOLUCIÓN RMA, INSPECCIÓN HIGIÉNICA Y FARMACOVIGILANCIA COFEPRIS — CU-07

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Cliente / Paciente
    actor QA as Químico QA Sanitario
    participant Portal as Vista (PortalRMA)
    participant RmaCtrl as PostventaRmaController
    participant RmaRepo as PostventaRmaRepository
    participant LogAPI as API Paquetería (Retorno)
    participant CofAPI as Portal COFEPRIS (RAM)
    participant PayCtrl as ReembolsosFiscalService

    Cliente->>Portal: Solicita RMA por reacción alérgica + adjunta evidencia fotográfica
    Portal->>RmaCtrl: POST /api/v1/rma {ID_orden, ID_motivo_rma, ID_orden_detalle, sintomas}
    RmaCtrl->>RmaRepo: crearSolicitudRma() [postventa.solicitudes_rma, rma_detalles]
    RmaCtrl->>LogAPI: generarGuiaRetornoPrepagada(ID_orden)
    LogAPI-->>RmaCtrl: guiaRetornoPDF
    RmaCtrl-->>Portal: HTTP 201 {folio_rma, guiaRetornoPDF}

    QA->>Portal: Inspecciona envase devuelto en laboratorio del CEDIS
    Portal->>RmaCtrl: POST /api/v1/rma/dictamen {ID_rma_detalle, destino="DESTRUCCION_INMEDIATA_RESIDUOS"}
    RmaCtrl->>RmaRepo: guardarInspeccionRetorno() [postventa.inspeccion_sanitaria_retorno]

    opt Motivo corresponde a Reacción Adversa Cutánea (RAM)
        RmaCtrl->>RmaRepo: crearExpedienteFarmacovigilancia(ID_cliente, ID_producto, ID_lote) [postventa.reportes_farmacovigilancia]
        RmaCtrl->>CofAPI: notificarEventoAdverso(expedienteRAM)
        CofAPI-->>RmaCtrl: acuseCOFEPRIS (notificado_a_cofepris = 1)
    end

    RmaCtrl->>PayCtrl: procesarReembolsoYNotaCredito(ID_orden) [pagos.reembolsos_transaccion, fiscal.notas_credito]
    PayCtrl-->>RmaCtrl: reembolsoConfirmado
    RmaCtrl-->>Portal: HTTP 200 "RMA resuelta, reporte sanitario registrado y reembolso emitido"
```

### Diagrama 18 — 9. DS-08: EJERCICIO DE DERECHOS ARCO Y AUDITORÍA FORENSE CON SOFT-DELETE JSON — CU-08 / CU-12

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Titular de Datos
    actor Admin as Oficial de Privacidad (ADMIN)
    participant Portal as Vista (PortalARCO)
    participant ArcoCtrl as PrivacidadAuditoriaController
    participant Crypto as CryptoHashingService (HMAC)
    participant DataRepo as ClientesAuditoriaRepository

    Cliente->>Portal: Registra solicitud ARCO (tipo_derecho = "CANCELACION")
    Portal->>ArcoCtrl: POST /api/v1/arco {ID_cliente, tipo_derecho, motivo_solicitud}
    ArcoCtrl->>DataRepo: crearSolicitudArco(fecha_limite=+20_dias_habiles) [clientes.solicitudes_arco]
    ArcoCtrl-->>Portal: HTTP 201 {folio_solicitud, fecha_limite_respuesta}

    Admin->>Portal: Dictamina procedencia y ejecuta cancelación lógica (Soft-Delete)
    Portal->>ArcoCtrl: POST /api/v1/arco/resolver {ID_solicitud_arco, resolucion_juridica}
    ArcoCtrl->>DataRepo: aplicarSoftDelete(activo=0, fecha_baja=NOW, eliminado_por=ID_admin)
    Note over DataRepo: Prohibido DELETE físico (ON DELETE NO ACTION)<br/>Datos fiscales retenidos bloqueados 5 años (Art. 30 CFF)
    ArcoCtrl->>DataRepo: insertarCambioDmlJson(tipo_operacion="SOFT_DELETE", valores_json) [auditoria.bitacora_cambios_datos]
    ArcoCtrl->>Crypto: firmarEventoForenseHMAC_SHA256(ID_admin, folio_solicitud)
    Crypto-->>ArcoCtrl: firma_integridad_hash
    ArcoCtrl->>DataRepo: registrarBitacoraSeguridad(firma_integridad_hash) [auditoria.bitacora_seguridad_global]
    ArcoCtrl->>DataRepo: actualizarSolicitudResuelta() [clientes.solicitudes_arco]
    ArcoCtrl-->>Portal: HTTP 200 "Derecho ARCO resuelto y sellado forense HMAC registrado"
```

---

## 4. Diagrama de Componentes (Arquitectura de 5 Capas y Hot-Swap)
> Archivo fuente: `05_diagrama_de_componentes.md`

### Diagrama 19 — 1. DIAGRAMA DE COMPONENTES DE SOFTWARE (ARQUITECTURA POR CAPAS)

```mermaid
flowchart TD
    subgraph Capa_Cliente["1. Capa de Presentación (Clientes)"]
        SPA["&laquo;component&raquo;\nWeb SPA Storefront\n(React / Next.js)"]
        PWA["&laquo;component&raquo;\nPortal Clínico, Fiscal y ARCO\n(Web PWA)"]
        PDA["&laquo;component&raquo;\nTerminal Móvil WMS / QA\n(Android / Flutter)"]
    end

    subgraph Capa_Perimetro["2. Capa Perimetral y Seguridad"]
        WAF["&laquo;component&raquo;\nWAF & Reverse Proxy\n(TLS 1.3 / OWASP)"]
        APIGW["&laquo;component&raquo;\nAPI Gateway\n(NGINX / Kong · Rate Limit)"]
        AUTH_MOD["&laquo;component&raquo;\nCrypto & Auth Service\n(PBKDF2/bcrypt · TOTP · JWT · HMAC)"]
    end

    subgraph Capa_Dominio["3. Capa de Lógica de Negocio (Microservicios por Submódulo)"]
        subgraph SM1_C["Submódulo 1 — José Luis Luna García"]
            MS_IAM["&laquo;component&raquo;\nIAM & RBAC Service"]
            MS_DERMO["&laquo;component&raquo;\nDiagnóstico Cutáneo & ARCO"]
            MS_CAT["&laquo;component&raquo;\nCatálogo INCI & COFEPRIS"]
        end
        subgraph SM2_C["Submódulo 2 — Sheyla Estefanía Moncada Guel"]
            MS_ORD["&laquo;component&raquo;\nCheckout, Split & Promos"]
            MS_PAY["&laquo;component&raquo;\nPagos PCI-DSS & Antifraude"]
            MS_TAX["&laquo;component&raquo;\nFacturación CFDI 4.0 SAT"]
        end
        subgraph SM3_C["Submódulo 3 — Eduardo Salazar Martínez"]
            MS_WMS["&laquo;component&raquo;\nCompras, QA & WMS FEFO"]
            MS_IOT["&laquo;component&raquo;\nIngesta Telemetría IoT 2-8 C"]
            MS_RMA["&laquo;component&raquo;\nEnvíos, RMA & Auditoría Forense"]
        end
    end

    subgraph Capa_Integracion["4. Capa de Integración y Mensajería"]
        REDIS["&laquo;component&raquo;\nRedis Cluster\n(Sesiones / Rate-Limit / Reservas)"]
        BROKER["&laquo;component&raquo;\nRabbitMQ / Kafka\n(Eventos Split, CFDI, IoT, COFEPRIS)"]
    end

    subgraph Capa_Persistencia["5. Capa de Persistencia Multi-SGBD (Hot-Swap)"]
        HOTSWAP["&laquo;component&raquo;\nHot-Swap DB Abstraction Layer\n(SQL Server ↔ PostgreSQL)"]
        DB_SS[("&laquo;database&raquo;\nSQL Server 2022\nEcommerceSaludBellezaDB\n(150 Tablas · 183 FKs)")]
        DB_PG[("&laquo;database&raquo;\nPostgreSQL 17\nEcommerceSaludBellezaDB\n(150 Tablas · 183 FKs)")]
        OBJ[("&laquo;storage&raquo;\nObject Storage S3/MinIO\n(XML/PDF CFDI, COA, Fotos RMA)")]
    end

    SPA --> WAF
    PWA --> WAF
    PDA --> WAF
    WAF --> APIGW
    APIGW --> AUTH_MOD
    APIGW --> MS_IAM
    APIGW --> MS_DERMO
    APIGW --> MS_CAT
    APIGW --> MS_ORD
    APIGW --> MS_PAY
    APIGW --> MS_TAX
    APIGW --> MS_WMS
    APIGW --> MS_RMA

    MS_IAM --> REDIS
    MS_ORD --> REDIS
    MS_ORD --> BROKER
    MS_PAY --> BROKER
    MS_WMS --> BROKER
    MS_IOT --> BROKER
    MS_RMA --> BROKER

    MS_IAM --> HOTSWAP
    MS_DERMO --> HOTSWAP
    MS_CAT --> HOTSWAP
    MS_ORD --> HOTSWAP
    MS_PAY --> HOTSWAP
    MS_TAX --> HOTSWAP
    MS_WMS --> HOTSWAP
    MS_IOT --> HOTSWAP
    MS_RMA --> HOTSWAP

    HOTSWAP -->|"Activo (TCP 1433)"| DB_SS
    HOTSWAP -.->|"Failover Hot-Swap (TCP 5432)"| DB_PG
    MS_TAX --> OBJ
    MS_WMS --> OBJ
    MS_RMA --> OBJ
```

---

## 5. Diagrama de Despliegue Físico (Topología VLSM 10.40.0.0/16)
> Archivo fuente: `06_diagrama_de_despliegue.md`

### Diagrama 20 — 1. DIAGRAMA DE DESPLIEGUE FÍSICO Y TOPOLOGÍA REAL DE RED (VLSM `10.40.0.0/16`)

```mermaid
flowchart TD
    subgraph WAN["Red Pública WAN / Servicios Externos"]
        CLI_EXT(["Clientes Web / Móvil\nHTTPS :443 TLS 1.3"])
        PAS_EXT["&laquo;external&raquo;\nPasarela PCI-DSS\n(Stripe / Mercado Pago)"]
        SAT_EXT["&laquo;external&raquo;\nPAC Autorizado SAT\n(CFDI 4.0)"]
        LOG_EXT["&laquo;external&raquo;\nAPI Paqueterías\n(DHL / FedEx / Estafeta)"]
        COF_EXT["&laquo;external&raquo;\nPortal COFEPRIS\n(Farmacovigilancia)"]
    end

    subgraph EDGE["Perímetro y Núcleo Jerárquico (10.40.5.128/30 · 10.40.5.132/30)"]
        FW_EDGE["&laquo;device&raquo;\nFirewall Perimetral / Router Borde\n(Cisco ISR 4331 · ACL + VPN IPsec)"]
        CORE["&laquo;device&raquo;\nCapa Núcleo & Distribución L3\n(Core-01/02 + Dist-01/02 · HSRP)"]
    end

    subgraph VLAN20["VLAN 20 — DMZ Web y Aplicaciones (10.40.4.0/25 · GW 10.40.4.1)"]
        LB_WAF["&laquo;executionEnvironment&raquo;\nNGINX / WAF Ingress\n(10.40.4.10 · TLS 1.3)"]
        APP_N1["&laquo;executionEnvironment&raquo;\nApp Server / Docker Node 01\n(SM1 + SM2 Microservicios · 10.40.4.20)"]
        APP_N2["&laquo;executionEnvironment&raquo;\nApp Server / Docker Node 02\n(SM3 + Redis + RabbitMQ · 10.40.4.21)"]
    end

    subgraph VLAN10["VLAN 10 — Granja Base de Datos Multi-SGBD Aislada (10.40.5.0/26 · GW 10.40.5.1)"]
        DB_S1[("&laquo;device&raquo;\nServidor SQL Server 2022\nPrimario OLTP\n(10.40.5.10 :1433)")]
        DB_S2[("&laquo;device&raquo;\nServidor PostgreSQL 17\nHot-Swap / SGBD Libre\n(10.40.5.11 :5432)")]
        SAN[("&laquo;device&raquo;\nAlmacenamiento SAN RAID 10\n+ Object Storage S3/MinIO\n(10.40.5.20)")]
    end

    subgraph VLAN30["VLAN 30 — CEDIS WMS, Andén e IoT Cadena de Frío (10.40.2.0/24 · GW 10.40.2.1)"]
        SW_WMS["&laquo;device&raquo;\nSwitch Acceso Catalyst 2960\n(Port Security Sticky MAC)"]
        IOT_GW["&laquo;device&raquo;\nGateway Industrial IoT\n(MQTT/TLS · Cámara Fría 2-8 °C)"]
        PDA_DEV(["Terminales PDA Zebra\nLectura Códigos FEFO"])
        SENS_IOT(["Sensores BLE 5.0\nTemp / Humedad"])
    end

    subgraph VLAN40["VLAN 40 — Administración TI, SOC/NOC (10.40.5.64/27) & VLAN 99 Mgmt (10.40.5.96/27)"]
        BASTION["&laquo;device&raquo;\nHost Bastión SSH / VPN\n(10.40.5.70)"]
        SIEM["&laquo;device&raquo;\nServidor SIEM / Syslog\n(Wazuh · 10.40.5.71)"]
    end

    subgraph VLAN50_60["VLAN 50 Corporativo / Dermoconsultores (10.40.0.0/23) & VLAN 60 CCTV (10.40.4.128/25)"]
        CORP_PC(["Estaciones Dermoconsultores,\nFacturación y QA"])
        CCTV(["Cámaras CCTV y Control\nBiométrico SITE/CEDIS"])
    end

    CLI_EXT -->|"HTTPS :443"| FW_EDGE
    FW_EDGE --> CORE
    CORE --> LB_WAF
    LB_WAF --> APP_N1
    LB_WAF --> APP_N2

    APP_N1 -->|"ACL Permit TDS :1433 / PG :5432"| DB_S1
    APP_N2 -->|"ACL Permit TDS :1433 / PG :5432"| DB_S1
    APP_N1 -.->|"Hot-Swap Failover :5432"| DB_S2
    APP_N2 -.->|"Hot-Swap Failover :5432"| DB_S2
    DB_S1 --- SAN
    DB_S2 --- SAN

    APP_N1 -->|"HTTPS REST"| PAS_EXT
    APP_N1 -->|"HTTPS SOAP"| SAT_EXT
    APP_N2 -->|"HTTPS Webhooks"| LOG_EXT
    APP_N2 -->|"HTTPS"| COF_EXT

    CORE --> SW_WMS
    SW_WMS --> IOT_GW
    SW_WMS --> PDA_DEV
    IOT_GW -.->|"BLE 2.4 GHz"| SENS_IOT
    IOT_GW -->|"MQTT/TLS :8883"| APP_N2

    CORE --> BASTION
    CORE --> SIEM
    CORE --> CORP_PC
    CORE --> CCTV
    SIEM -.->|"Syslog TLS :6514"| DB_S1
    SIEM -.->|"Syslog TLS :6514"| APP_N1
```

---

## 6. Diagramas de Actividades (Carriles y Paralelismo Fork/Join)
> Archivo fuente: `08_diagramas_de_actividades.md`

### Diagrama 21 — 1. DA-01: AUTENTICACIÓN SEGURA (LOGIN), MFA TOTP, BLOQUEO POR FUERZA BRUTA Y DIAGNÓSTICO LFPDPPP

```mermaid
flowchart TD
    START(("● Inicio")) --> A1["Ingresar email y contraseña\n(Canal TLS 1.3)"]
    A1 --> A2["Consultar cuenta en seguridad.usuarios\ny verificar bloqueo vigente"]
    A2 --> D1{"¿Cuenta activa y\nno bloqueada?"}
    D1 -->|"[No: bloqueada 15 min]"| A_BLK["Registrar intento en seguridad.intentos_login\nMostrar aviso de bloqueo temporal"]
    A_BLK --> END1(("◉ Fin"))

    D1 -->|"[Sí]"| A3["Recalcular hash con password_salt\n(PBKDF2-SHA512 / bcrypt / Argon2id)"]
    A3 --> D2{"¿Hash coincide?"}
    D2 -->|"[No]"| A4["Incrementar intentos_fallidos_consecutivos\ne insertar en seguridad.intentos_login"]
    A4 --> D3{"¿Intentos >= 5?"}
    D3 -->|"[Sí]"| A5["Bloquear cuenta 15 min + Firmar HMAC-SHA256\nen auditoria.bitacora_seguridad_global"]
    A5 --> END1
    D3 -->|"[No]"| A1

    D2 -->|"[Sí]"| D4{"¿mfa_habilitado = 1?"}
    D4 -->|"[Sí]"| A6["Solicitar y validar código TOTP\n6 dígitos (RFC 6238 +-30s)"]
    A6 --> D5{"¿TOTP válido?"}
    D5 -->|"[No]"| A4
    D5 -->|"[Sí]"| A7["Cargar permisos RBAC, crear sesión\nen seguridad.sesiones_activas y reiniciar intentos"]
    D4 -->|"[No]"| A7

    A7 --> D6{"¿Desea Diagnóstico\nCutáneo?"}
    D6 -->|"[No]"| END2(("◉ Fin: Acceso Portal"))
    D6 -->|"[Sí]"| A8["Desplegar Aviso de Privacidad Integral\n(Art. 9 LFPDPPP — Datos Sensibles)"]
    A8 --> D7{"¿Otorga consentimiento\nexpreso?"}
    D7 -->|"[No]"| A9["Navegar catálogo público\nsin almacenar perfil clínico"]
    A9 --> END2
    D7 -->|"[Sí]"| A10["Guardar consentimiento + Evaluar cuestionario\nGuardar clientes.perfil_cutaneo y filtrar alérgenos INCI"]
    A10 --> END2
```

### Diagrama 22 — 2. DA-02: CHECKOUT SEGURO, RESERVA 15 MIN, ANTIFRAUDE, PAGO PCI-DSS, SPLIT MULTIALMACÉN Y CFDI 4.0

```mermaid
flowchart TD
    START(("● Inicio")) --> B1["Confirmar carrito (ventas.carritos)\ny reservar stock 15 min (ventas.reservas_temporales_stock)"]
    B1 --> B2["Seleccionar dirección, cupón/GWP opcional\n(promos.cupones) y calcular IVA 16%"]
    B2 --> B3["Tokenizar instrumento en SDK PCI-DSS\n(sin almacenar PAN ni CVV)"]
    B3 --> B4["Evaluar reglas antifraude (pagos.reglas_antifraude)\ny persistir en pagos.evaluaciones_antifraude"]
    B4 --> D1{"Score de riesgo"}
    D1 -->|"[>= 85: Fraude]"| B_REJ["Cancelar orden (ventas.motivos_cancelacion_orden)\ny liberar reserva de stock"]
    B_REJ --> END_F(("◉ Fin: Rechazada"))

    D1 -->|"[65..84: Reto 3DS]"| B5["Ejecutar reto bancario 3D-Secure"]
    B5 --> D2{"¿3DS aprobado?"}
    D2 -->|"[No]"| B_REJ
    D2 -->|"[Sí]"| B6["Ejecutar cobro idempotente en Pasarela\n(Tarjeta / Billetera / GiftCard / Split Multipago)"]
    D1 -->|"[< 65: Bajo riesgo]"| B6

    B6 --> D3{"¿Pago aprobado?"}
    D3 -->|"[No: HTTP 402]"| B7["Registrar en pagos.intentos_cobro\nPermitir cambiar método dentro de los 15 min"]
    B7 --> B3

    D3 -->|"[Sí: HTTP 200]"| FORK["▬▬▬▬ FORK (Ejecución Paralela) ▬▬▬▬"]
    FORK --> P1["Crear ventas.ordenes + ordenes_detalles\ny pagos.transacciones"]
    FORK --> P2["Generar splits CEDIS Monterrey/CDMX\n(ventas.ordenes_splits_almacen)"]
    FORK --> P3["Confirmar reserva como vendida\nen wms.inventario_lotes_ubicacion"]
    FORK --> P4["Emitir y timbrar CFDI 4.0 si fue solicitado\n(fiscal.facturas_cfdi + PAC SAT)"]
    P1 --> JOIN["▬▬▬▬ JOIN (Sincronización) ▬▬▬▬"]
    P2 --> JOIN
    P3 --> JOIN
    P4 --> JOIN
    JOIN --> B8["Enviar confirmación y XML/PDF vía\nsistema.notificaciones_push_email"]
    B8 --> END_OK(("◉ Fin: Orden Confirmada"))
```

### Diagrama 23 — 3. DA-03: RECEPCIÓN EN CEDIS, TELEMETRÍA IOT (2–8 °C), DICTAMEN QA Y ALTA/DESPACHO FEFO

```mermaid
flowchart TD
    START(("● Inicio")) --> C1["Arribo de proveedor a CEDIS\nValidar compras.ordenes_compra"]
    C1 --> C2["Conteo ciego de piezas y registro en\ncompras.recepciones_mercancia (Estado: CUARENTENA_QA)"]
    C2 --> C3["Extraer curva térmica IoT\n(wms.monitoreo_temperatura_humedad)"]
    C3 --> D1{"¿Temperatura dentro\nde 2 °C a 8 °C?"}
    D1 -->|"[No: Excursión térmica]"| C_QUA["Marcar alerta_fuera_de_rango = 1\nAislar lote en cuarentena"]
    C_QUA --> C_DES["Emitir acta de destrucción COFEPRIS\n(wms.mermas_destruccion_sanitaria)"]
    C_DES --> END_R(("◉ Fin: Lote Rechazado"))

    D1 -->|"[Sí: Cadena de frío íntegra]"| C4["Químico QA inspecciona pH, sellos y COA\n(compras.inspecciones_sanitarias_qa)"]
    C4 --> D2{"¿Dictamen QA\nAPROBADO?"}
    D2 -->|"[No: Rechazado]"| C_QUA
    D2 -->|"[Sí]"| C5["Crear lote en wms.lotes_fabricacion_sanitaria\ncon fecha_fabricacion y fecha_caducidad"]
    C5 --> C6["Ubicar en wms.pasillos_ubicaciones\nActualizar wms.inventario_lotes_ubicacion"]
    C6 --> C7["Registrar asiento positivo en\nwms.kardex_movimientos"]
    C7 --> C8["Habilitar lote para algoritmo FEFO\ny monitoreo de alertas 90/60/30 días"]
    C8 --> END_OK(("◉ Fin: Stock Disponible FEFO"))
```

### Diagrama 24 — 4. DA-04: DEVOLUCIÓN RMA, INSPECCIÓN HIGIÉNICA, FARMACOVIGILANCIA COFEPRIS Y REEMBOLSO

```mermaid
flowchart TD
    START(("● Inicio")) --> R1["Cliente solicita devolución RMA con evidencia\n(postventa.solicitudes_rma + rma_detalles)"]
    R1 --> R2["Generar guía prepagada de retorno\nvía API Paquetería (envios.guias_rastreo)"]
    R2 --> R3["Arribo físico al laboratorio CEDIS\nInspección higiénica QA (postventa.inspeccion_sanitaria_retorno)"]
    R3 --> D1{"¿Motivo es Reacción\nAdversa Cutánea (RAM)?"}

    D1 -->|"[Sí]"| R4["Crear expediente en postventa.reportes_farmacovigilancia\ncruzando ID_cliente + ID_producto + ID_lote"]
    R4 --> R5["Notificar a Portal COFEPRIS (notificado_a_cofepris = 1)\ny decretar DESTRUCCION_INMEDIATA_RESIDUOS"]
    R5 --> R6["Autorizar reembolso y Nota de Crédito"]

    D1 -->|"[No]"| D2{"¿Producto sellado\ne intacto?"}
    D2 -->|"[Sí]"| R7["Autorizar REINGRESO_STOCK al WMS\ny registrar entrada en wms.kardex_movimientos"]
    R7 --> R6
    D2 -->|"[No: Abierto/Dañado]"| R8["Destrucción sanitaria por norma higiénica\n(wms.mermas_destruccion_sanitaria)"]
    R8 --> R6

    R6 --> FORK["▬▬▬▬ FORK (Cierre Financiero) ▬▬▬▬"]
    FORK --> F1["Procesar reembolso bancario o Billetera\n(pagos.reembolsos_transaccion)"]
    FORK --> F2["Emitir Nota de Crédito CFDI Egreso\n(fiscal.notas_credito)"]
    F1 --> JOIN["▬▬▬▬ JOIN ▬▬▬▬"]
    F2 --> JOIN
    JOIN --> R9["Notificar resolución final y cerrar ticket\n(postventa.tickets_soporte)"]
    R9 --> END(("◉ Fin: RMA Cerrada"))
```

---

## 7. Diagramas de Estados (Máquinas de Estado / Ciclos de Vida)
> Archivo fuente: `09_diagramas_de_estados.md`

### Diagrama 25 — 1. DE-01: MÁQUINA DE ESTADOS DE CUENTA DE USUARIO Y SESIÓN (`seguridad.usuarios`)

```mermaid
stateDiagram-v2
    [*] --> PendienteVerificacion : registrarUsuario() / generarHashSalt()
    PendienteVerificacion --> Activa : validarCorreo() [tokenValido] / email_verificado=1
    PendienteVerificacion --> BajaLogica : cancelarRegistro() / activo=0

    Activa --> DesafioMFA : loginExitoso() [mfa_habilitado=1]
    DesafioMFA --> SesionAutenticada : validarTOTP() [codigoValido] / crearSesion()
    DesafioMFA --> Activa : falloMFA() [intentos < 3]
    Activa --> SesionAutenticada : loginExitoso() [mfa_habilitado=0] / crearSesion()
    SesionAutenticada --> Activa : cerrarORevocarSesion() / revocada=1

    Activa --> BloqueadaFuerzaBruta : loginFallido() [intentos >= 5] / cuenta_bloqueada=1 + HMAC
    BloqueadaFuerzaBruta --> Activa : expirar15MinORecuperar() / reiniciarIntentos()

    Activa --> BajaLogica : solicitudARCO_Cancelacion() / activo=0, fecha_baja=NOW
    BloqueadaFuerzaBruta --> BajaLogica : revocacionAdmin() / activo=0
    BajaLogica --> [*]
```

### Diagrama 26 — 2. DE-02: MÁQUINA DE ESTADOS DE ORDEN DE VENTA (`ventas.ordenes`)

```mermaid
stateDiagram-v2
    [*] --> Creada : iniciarCheckout()
    Creada --> StockReservado15m : reservarStock() / crearReserva15m()
    StockReservado15m --> Cancelada : timeout15Min() / liberarStock()

    StockReservado15m --> EvaluacionAntifraude : enviarPagoTokenizado() / evaluarReglas()
    EvaluacionAntifraude --> Reto3DSecure : scoreEnRango65a84()
    EvaluacionAntifraude --> CanceladaFraude : scoreMayorIgual85() / liberarStock()
    Reto3DSecure --> CanceladaFraude : rechazo3DS() / liberarStock()
    Reto3DSecure --> PagadaConfirmada : aprobacion3DS_y_Cobro() / registrarTransaccion()
    EvaluacionAntifraude --> PagadaConfirmada : scoreMenor65_y_CobroOK() / registrarTransaccion()

    PagadaConfirmada --> EnSurtidoCEDIS : generarSplitsAlmacen() / asignarLotesFEFO()
    EnSurtidoCEDIS --> EnTransito : emitirGuiaPaqueteria() / descontarKardex()
    EnTransito --> Entregada : webhookEntregaOK() / registrarFechaEntrega()
    Entregada --> EnDevolucionRMA : solicitarRMA() [dentroGarantia]
    EnDevolucionRMA --> Reembolsada : aprobarRMA() / emitirNotaCredito()

    Entregada --> [*]
    Reembolsada --> [*]
    Cancelada --> [*]
    CanceladaFraude --> [*]
```

### Diagrama 27 — 3. DE-03: MÁQUINA DE ESTADOS DE LOTE SANITARIO FEFO (`wms.lotes_fabricacion_sanitaria`)

```mermaid
stateDiagram-v2
    [*] --> CuarentenaQA : recepcionarOC() / conteoCiego()
    CuarentenaQA --> RechazadoSanitario : dictamenQA_Rechazado() / excursionTermicaIoT()
    CuarentenaQA --> DisponibleFEFO : dictamenQA_Aprobado() [temp 2-8C y COA OK] / altaKardex()

    DisponibleFEFO --> AlertaCaducidad : diasRestantes <= 90 / crearAlertaFEFO()
    DisponibleFEFO --> CuarentenaPreventiva : excursionIoT_o_RAM() / bloquearStock()
    AlertaCaducidad --> EnVentaFlash : asignarPromocion() [diasRestantes >= 30]
    EnVentaFlash --> Agotado : stockDisponible == 0
    DisponibleFEFO --> Agotado : surtidoFEFO() [stockDisponible == 0]

    AlertaCaducidad --> Caducado : fechaActual > fecha_caducidad / bloquearVenta()
    CuarentenaPreventiva --> DisponibleFEFO : liberacionQA()
    CuarentenaPreventiva --> DestruidoCOFEPRIS : dictamenInviable() / actaDestruccion()
    RechazadoSanitario --> DestruidoCOFEPRIS : emitirManifiestoResiduos()
    Caducado --> DestruidoCOFEPRIS : emitirManifiestoResiduos()

    Agotado --> [*]
    DestruidoCOFEPRIS --> [*]
```

### Diagrama 28 — 4. DE-04: MÁQUINA DE ESTADOS DE SOLICITUD RMA Y FARMACOVIGILANCIA (`postventa.solicitudes_rma`)

```mermaid
stateDiagram-v2
    [*] --> Solicitada : registrarRMA() / adjuntarEvidencia()
    Solicitada --> GuiaRetornoEmitida : aprobarRetorno() / generarGuiaPrepagada()
    Solicitada --> RechazadaPolitica : fueraDePlazo() / cerrarTicket()

    GuiaRetornoEmitida --> EnInspeccionHigienica : recibirPaqueteEnCEDIS()
    EnInspeccionHigienica --> NotificadaCOFEPRIS : motivoRAM() / crearReporteFarmacovigilancia()
    EnInspeccionHigienica --> ReingresoWMS : selloIntacto() / entradaKardex()
    EnInspeccionHigienica --> DestruccionHigienica : envaseAbiertoODaniado() / actaMerma()

    NotificadaCOFEPRIS --> ReembolsadaYCerrada : reembolsarPago() + emitirNotaCredito()
    ReingresoWMS --> ReembolsadaYCerrada : reembolsarPago() + emitirNotaCredito()
    DestruccionHigienica --> ReembolsadaYCerrada : reembolsarPago() + emitirNotaCredito()

    ReembolsadaYCerrada --> [*]
    RechazadaPolitica --> [*]
```

---

## 8. Diagramas de Comunicación (Colaboración con Numeración Decimal)
> Archivo fuente: `10_diagramas_de_comunicacion.md`

### Diagrama 29 — 2. DC-01: COMUNICACIÓN DE AUTENTICACIÓN SEGURA (LOGIN CRIPTOGRÁFICO, MFA Y BLOQUEO HMAC) — CU-01

```mermaid
flowchart LR
    USR([":Usuario"])
    SPA[":LoginSPA"]
    CTRL[":AuthController"]
    CRYP[":CryptoHashingService"]
    UREP[":UsuarioRepository"]
    AREP[":BitacoraSeguridadRepository"]

    USR -->|"1: ingresarCredenciales(email, pass)"| SPA
    SPA -->|"1.1: POST /auth/login"| CTRL
    CTRL -->|"1.1.1: obtenerPorEmail(email)"| UREP
    CTRL -->|"1.1.2: verificarHash(pass, salt, hash)"| CRYP
    CTRL -->|"1.1.3 [mfa=1]: validarTotp(secreto, cod)"| CRYP
    CTRL -->|"1.1.4 [fallo>=5]: generarHMAC()"| CRYP
    CTRL -->|"1.1.5 [fallo>=5]: bloquearCuenta(ID)"| UREP
    CTRL -->|"1.1.6: registrarEvento(ID, IP, resultado)"| AREP
    CTRL -->|"1.1.7 [ok]: crearSesionYCargarRBAC(ID)"| UREP
    CTRL -->|"1.2: retornarHTTP200(jwt, permisos)"| SPA
```

### Diagrama 30 — 3. DC-02: COMUNICACIÓN DE CHECKOUT, ANTIFRAUDE, PAGO PCI-DSS, SPLIT Y CFDI 4.0 — CU-03 / CU-05

```mermaid
flowchart LR
    CLI([":Cliente"])
    UI[":CheckoutUI"]
    SDK[":PasarelaSDK_PCI"]
    CTRL[":OrdenesController"]
    FRD[":AntifraudeService"]
    SPL[":MultiCedisSplitService"]
    PAC[":FacturacionCFDI_PAC"]
    REP[":OrdenesPagosRepository"]

    CLI -->|"1: iniciarPago()"| UI
    UI -->|"1.1: tokenizarTarjeta()"| SDK
    UI -->|"2: POST /ordenes/confirmar(tok, key)"| CTRL
    CTRL -->|"2.1: reservarStock15m(ID_carrito)"| REP
    CTRL -->|"2.2: evaluarRiesgo(ID_cliente, monto)"| FRD
    CTRL -->|"2.3 [score<85]: cobrar(tok, monto, key)"| SDK
    CTRL -->|"2.4 [ok]: calcularSplitsCEDIS(items)"| SPL
    CTRL -->|"2.5: persistirOrdenSplitsYPago()"| REP
    CTRL -->|"2.6 [factura]: timbrarCFDI40(ID_orden)"| PAC
    CTRL -->|"3: confirmarOrden(folio, splits, uuid)"| UI
```

### Diagrama 31 — 4. DC-03: COMUNICACIÓN DE RECEPCIÓN CEDIS, IOT CADENA DE FRÍO, QA Y ALTA FEFO — CU-06

```mermaid
flowchart LR
    WMS([":OperadorWMS"])
    QA([":QuimicoQA"])
    PDA[":TerminalPDA"]
    CTRL[":RecepcionWmsController"]
    IOT[":TelemetriaIoTService"]
    QAS[":ControlCalidadService"]
    REP[":ComprasWmsRepository"]

    WMS -->|"1: escanearOC_y_ConteoCiego()"| PDA
    PDA -->|"1.1: POST /wms/recepciones"| CTRL
    CTRL -->|"1.1.1: crearRecepcionCuarentena()"| REP
    CTRL -->|"1.1.2: obtenerCurvaTermica(ID_zona)"| IOT
    CTRL -->|"1.1.3: validarRango2a8C(lecturas)"| QAS
    QA -->|"2: registrarDictamenQA_y_COA()"| PDA
    PDA -->|"2.1: POST /wms/qa-aprobar"| CTRL
    CTRL -->|"2.1.1 [aprobado]: crearLoteFEFO_y_Kardex()"| REP
    CTRL -->|"2.1.2 [rechazado]: registrarActaCOFEPRIS()"| REP
    CTRL -->|"2.2: notificarUbicacionRack()"| PDA
```

