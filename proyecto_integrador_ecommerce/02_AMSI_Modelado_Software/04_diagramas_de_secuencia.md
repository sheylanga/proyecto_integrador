# MODELADO DE INTERACCIÓN Y DIAGRAMAS DE SECUENCIA CRIPTOGRÁFICA Y TRANSACCIONAL (UML 2.5)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI — IFE-1005) — CRITERIO 1.3 (25%)
**Sistema:** DERMA-ECOM (E-Commerce de Salud Cutánea, Belleza y Maquillaje con Trazabilidad FEFO y Cadena de Frío)  
**Autores y Distribución Equitativa:**
- **Submódulo 1 (`DS-01`, `DS-02`, `DS-08` · Tablas `001–050`):** José Luis Luna García
- **Submódulo 2 (`DS-03`, `DS-04`, `DS-05` · Tablas `051–100`):** Sheyla Estefanía Moncada Guel
- **Submódulo 3 (`DS-06`, `DS-07`, `DS-08` · Tablas `101–150`):** Eduardo Salazar Martínez

> [!IMPORTANT]
> **Diagramas de Secuencia UML 2.5 Visuales Editables (Líneas de vida, barras de activación, fragmentos `alt`/`opt` y mensajes síncronos/retorno):**
> - Editable `.drawio` (3 pestañas: Login Criptográfico, Checkout/Antifraude/Split y Recepción QA/IoT/FEFO): [`04a_diagrama_secuencia_UML.drawio`](./04a_diagrama_secuencia_UML.drawio)
> - Visor Interactivo HTML/SVG (con zoom y exportación SVG): [`04b_visor_interactivo_secuencias_UML.html`](./04b_visor_interactivo_secuencias_UML.html)

---

## 1. ARQUITECTURA DE CAPAS DE INTERACCIÓN

Conforme al **Criterio 1.3 (25%)** de la rúbrica oficial del TecNM, cada diagrama de secuencia modela rigurosamente la separación de responsabilidades por capas y su persistencia real en `EcommerceSaludBellezaDB` (`150` tablas, `PK = ID`, `FK = ID_*`):

1. **Capa de Presentación / Vista:** Interfaz SPA Web / Terminal Móvil WMS (`LoginSPA`, `QuizUI`, `CheckoutUI`, `PortalFiscal`, `TerminalPDA`).
2. **Capa de Control y Orquestación:** Controladores REST y middleware (`AuthController`, `SecurityMiddleware`, `DiagnosticoController`, `OrdenesController`, `FacturacionController`, `RecepcionWmsController`, `FarmacovigilanciaController`).
3. **Capa de Servicios de Dominio y Criptografía:** `CryptoHashingService` (PBKDF2-SHA512 / bcrypt / Argon2id + TOTP RFC 6238 + JWT RS256 + HMAC-SHA256), `AntifraudeService`, `MultiCedisSplitService`, `GeneradorXmlCfdiService`, `ControlCalidadService`.
4. **Capa de Repositorios de Datos (Multi-SGBD SQL Server / PostgreSQL):** `UsuarioRepository`, `BitacoraSeguridadRepository`, `PerfilCutaneoRepository`, `OrdenesVentaRepository`, `InventarioLotesRepository`, `FacturasRepository`, `DevolucionesRmaRepository`.
5. **Sistemas Externos Regulados:** Pasarela PCI-DSS (Stripe/Mercado Pago), PAC/SAT CFDI 4.0, API Paquetería, Sensores IoT 2–8 °C y Portal COFEPRIS.

---

## 2. DS-01: AUTENTICACIÓN SEGURA DE USUARIO (LOGIN CRIPTOGRÁFICO, MFA TOTP Y BLOQUEO POR FUERZA BRUTA) — CU-01 *(OBLIGATORIO)*
**Autor Responsable:** José Luis Luna García (Submódulo 1)  
**Tablas BD:** `seguridad.usuarios`, `seguridad.usuarios_roles`, `seguridad.roles_permisos`, `seguridad.intentos_login`, `seguridad.sesiones_activas`, `auditoria.bitacora_seguridad_global`, `sistema.notificaciones_push_email`.

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
                    Crypto-->>Ctrl: firma_integridad_hash
                    Ctrl->>AuditRepo: insertarBitacoraForense(ID, "BLOQUEO_FUERZA_BRUTA", firma_integridad_hash) [auditoria.bitacora_seguridad_global]
                end
                Ctrl-->>Vista: HTTP 401 "Credenciales inválidas"
                Vista-->>Usuario: Solicita reintento o recuperación de contraseña
            else Contraseña correcta
                Crypto-->>Ctrl: true
                opt mfa_habilitado = 1
                    Ctrl-->>Vista: HTTP 206 "Requiere código MFA TOTP (6 dígitos)"
                    Vista-->>Usuario: Solicita código de app autenticadora
                    Usuario->>Vista: Ingresa totpCode ("849201")
                    Vista->>Ctrl: POST /api/v1/auth/mfa-verify {tempId, totpCode}
                    Ctrl->>Crypto: validarTotpRFC6238(mfa_secreto, totpCode, +-30s)
                    alt TOTP inválido o expirado
                        Crypto-->>Ctrl: false
                        Ctrl->>AuditRepo: registrarIntentoLogin(ID, IP, "FALLIDO_MFA")
                        Ctrl-->>Vista: HTTP 401 "Código MFA inválido"
                        Vista-->>Usuario: Permite hasta 2 reintentos
                    else TOTP válido
                        Crypto-->>Ctrl: true
                    end
                end
                Ctrl->>UserRepo: cargarRolesPermisosRBAC(ID) [seguridad.usuarios_roles + roles_permisos]
                UserRepo-->>Ctrl: permisosRBAC[]
                Ctrl->>Crypto: firmarJWT_RS256(ID, permisosRBAC) + hashTokenSesion()
                Crypto-->>Ctrl: {jwt, token_sesion_hash}
                Ctrl->>UserRepo: resetearIntentosYActualizarUltimoLogin(ID)
                Ctrl->>UserRepo: crearSesionActiva(ID_usuario=ID, token_sesion_hash, IP) [seguridad.sesiones_activas]
                Ctrl->>AuditRepo: registrarIntentoLogin(ID, IP, "EXITOSO") [seguridad.intentos_login]
                Ctrl-->>Vista: HTTP 200 {jwt, perfil, permisosRBAC}
                deactivate Ctrl
                Vista-->>Usuario: Redirige al portal según rol RBAC
                deactivate Vista
            end
        end
    end
```

---

## 3. DS-02: DIAGNÓSTICO CLÍNICO CUTÁNEO Y CONSENTIMIENTO EXPRESO LFPDPPP — CU-02
**Autor Responsable:** José Luis Luna García (Submódulo 1)  
**Tablas BD:** `clientes.consentimientos_privacidad`, `clientes.cuestionarios_diagnostico`, `clientes.preguntas_diagnostico`, `clientes.opciones_pregunta`, `clientes.evaluaciones_diagnostico`, `clientes.respuestas_evaluacion`, `clientes.perfil_cutaneo`, `clientes.cliente_condiciones`, `catalogo.alergenos_ingrediente`.

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

---

## 4. DS-03: CHECKOUT SEGURO, RESERVA 15 MIN, ANTIFRAUDE, PAGO PCI-DSS Y SPLIT MULTIALMACÉN — CU-03
**Autor Responsable:** Sheyla Estefanía Moncada Guel (Submódulo 2)  
**Tablas BD:** `ventas.carritos`, `ventas.reservas_temporales_stock`, `ventas.ordenes`, `ventas.ordenes_detalles`, `ventas.ordenes_impuestos`, `ventas.ordenes_descuentos`, `ventas.ordenes_splits_almacen`, `pagos.reglas_antifraude`, `pagos.evaluaciones_antifraude`, `pagos.transacciones`, `pagos.intentos_cobro`, `wms.inventario_lotes_ubicacion`.

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

---

## 5. DS-04: COBRO RECURRENTE Y PROGRAMACIÓN DE SUSCRIPCIÓN BEAUTY-BOX — CU-04
**Autor Responsable:** Sheyla Estefanía Moncada Guel (Submódulo 2)  
**Tablas BD:** `ventas.suscripciones_cliente`, `ventas.suscripciones_items`, `ventas.suscripciones_calendario_entregas`, `ventas.suscripciones_bitacora_estados`, `clientes.metodos_pago_tokenizados`, `pagos.transacciones`, `pagos.intentos_cobro`.

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

---

## 6. DS-05: EMISIÓN, SELLADO CSD Y TIMBRADO DE FACTURA ELECTRÓNICA CFDI 4.0 — CU-05
**Autor Responsable:** Sheyla Estefanía Moncada Guel (Submódulo 2)  
**Tablas BD:** `fiscal.datos_fiscales_cliente`, `fiscal.regimenes_sat`, `fiscal.usos_cfdi`, `fiscal.facturas_cfdi`, `fiscal.facturas_partidas`, `fiscal.cancelaciones_cfdi`, `fiscal.notas_credito`.

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

---

## 7. DS-06: RECEPCIÓN EN CEDIS, TELEMETRÍA IOT, DICTAMEN QA Y ALTA DE LOTE FEFO — CU-06
**Autor Responsable:** Eduardo Salazar Martínez (Submódulo 3)  
**Tablas BD:** `compras.ordenes_compra`, `compras.recepciones_mercancia`, `compras.recepciones_detalles`, `compras.inspecciones_sanitarias_qa`, `wms.monitoreo_temperatura_humedad`, `wms.lotes_fabricacion_sanitaria`, `wms.inventario_lotes_ubicacion`, `wms.kardex_movimientos`, `wms.mermas_destruccion_sanitaria`.

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

---

## 8. DS-07: DEVOLUCIÓN RMA, INSPECCIÓN HIGIÉNICA Y FARMACOVIGILANCIA COFEPRIS — CU-07
**Autor Responsable:** Eduardo Salazar Martínez (Submódulo 3)  
**Tablas BD:** `postventa.solicitudes_rma`, `postventa.rma_detalles`, `postventa.inspeccion_sanitaria_retorno`, `postventa.reportes_farmacovigilancia`, `pagos.reembolsos_transaccion`, `fiscal.notas_credito`.

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

---

## 9. DS-08: EJERCICIO DE DERECHOS ARCO Y AUDITORÍA FORENSE CON SOFT-DELETE JSON — CU-08 / CU-12
**Autores Responsables:** José Luis Luna García (SM1) y Eduardo Salazar Martínez (SM3)  
**Tablas BD:** `clientes.solicitudes_arco`, `auditoria.bitacora_cambios_datos`, `auditoria.bitacora_seguridad_global`, `sistema.notificaciones_push_email`.

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

## 10. MATRIZ DE CUMPLIMIENTO DEL CRITERIO 1.3 (RÚBRICA AMSI)

| Diagrama | Caso de Uso | Capas Modeladas | Autor Responsable | Evidencia Técnica Verificada |
| :---: | :---: | :--- | :--- | :--- |
| **DS-01** *(Obligatorio)* | CU-01 (Login) | Vista → Controlador → Servicio Criptográfico → Repositorio Datos/Auditoría | José Luis Luna García | Hashing + salt, timing-attack mitigation, MFA TOTP RFC 6238, bloqueo 5 intentos + HMAC-SHA256 |
| **DS-02** | CU-02 (Dermo) | Vista → Controlador → Servicio Legal LFPDPPP → Motor Reglas → Repositorio | José Luis Luna García | Consentimiento expreso Art. 9 LFPDPPP antes de persistir datos sensibles |
| **DS-03** | CU-03 (Checkout) | Vista → SDK PCI-DSS → Controlador → Antifraude → Split CEDIS → Repositorios | Sheyla Estefanía Moncada Guel | Reserva 15 min, Antifraude/3DS, Tokenización sin PAN/CVV, Split multialmacén |
| **DS-04** | CU-04 (Beauty-Box) | Worker Cron → Motor Suscripciones → Pasarela Recurrente → Repositorios | Sheyla Estefanía Moncada Guel | Cobro recurrente idempotente, manejo de fallos y curaduría cutánea |
| **DS-05** | CU-05 (CFDI 4.0) | Portal → Controlador → XML Anexo 20 → Sellado CSD → PAC SAT → Repositorio | Sheyla Estefanía Moncada Guel | Validación LCO/Régimen, sellado SHA256withRSA y timbrado UUID < 2 s |
| **DS-06** | CU-06 (WMS/QA) | Terminal PDA → Controlador → Telemetría IoT → Servicio QA → Repositorio | Eduardo Salazar Martínez | Cadena de frío 2–8 °C, dictamen QA/COA, cuarentena/destrucción y alta FEFO |
| **DS-07** | CU-07 (RMA/RAM) | Portal → Controlador → API Retorno → QA → Portal COFEPRIS → Reembolso | Eduardo Salazar Martínez | Inspección higiénica, notificación farmacovigilancia COFEPRIS y Nota de Crédito |
| **DS-08** | CU-08 / CU-12 | Portal ARCO → Controlador → Servicio HMAC → Repositorio Auditoría | J. L. Luna / E. Salazar | Plazo 20 días LFPDPPP, Soft-Delete JSON válido y firma HMAC (Arts. 211 bis CPF) |
