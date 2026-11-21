# CAPÍTULO II: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI - IFE-1005)
## Entregable 2.4: Modelado de Interacción y Diagramas de Secuencia Criptográfica y Transaccional

---

### 1. Introducción y Arquitectura de Capas de Interacción

Conforme a las directrices de la rúbrica oficial del Tecnológico Nacional de México (TecNM) para la asignatura **Análisis y Modelado de Sistemas de Información (IFE-1005)**, se modela el comportamiento dinámico del sistema a través de diagramas de secuencia UML en notación Mermaid. 

Cada diagrama formaliza el flujo de mensajes sincrónicos y asincrónicos, llamadas de métodos, validaciones criptográficas y delimitación estricta de responsabilidades entre capas:
- **Capa de Presentación / Vista (UI / Frontend SPA)**
- **Capa de Control y Orquestación (API Controller / Middleware)**
- **Capa de Lógica de Negocio y Servicios Criptográficos (Domain & Security Services)**
- **Capa de Persistencia y Acceso a Datos (Data Repositories / Cache Layer)**
- **Entidades Externas Reguladas (Gateways Bancarios, PAC SAT, Sensores IoT, COFEPRIS)**

---

### 2. Diagrama de Secuencia 1: Autenticación Criptográfica con MFA TOTP y Bloqueo por Fuerza Bruta (CU-01)

Este diagrama satisface con rigor máximo el Criterio 1.3 de la rúbrica, demostrando el hashing de contraseñas mediante derivación de claves Argon2id/bcrypt, verificación temporal de contraseñas de un solo uso (TOTP RFC 6238), mitigación de ataques de diccionario mediante rate-limiting en Redis y registro inmutable en bitácora de auditoría.

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Usuario / Navegador
    participant UI as Vista (LoginSPA)
    participant AuthCtrl as AuthController
    participant RateLimit as SecurityMiddleware (Redis)
    participant CryptoSvc as CryptoHashingService (Argon2id)
    participant UserRepo as UsuarioRepository
    participant AuditRepo as BitacoraSeguridadRepository

    Cliente->>UI: Ingresa email y contraseña en claro
    UI->>AuthCtrl: POST /api/v1/auth/login {email, password}
    
    AuthCtrl->>RateLimit: verificarIntentosFallidos(email, IP)
    alt Umbral Excedido (>= 5 intentos fallidos en 15 min)
        RateLimit-->>AuthCtrl: Bloqueo Temporal Activo (HTTP 429)
        AuthCtrl-->>UI: Error: "Cuenta temporalmente bloqueada por seguridad"
        UI-->>Cliente: Notificación de bloqueo y solicitud de recuperación
    else Intentos dentro del umbral permitido
        RateLimit-->>AuthCtrl: Acceso Permitido (Continuar)
        
        AuthCtrl->>UserRepo: obtenerPorEmail(email)
        alt Usuario No Existe
            UserRepo-->>AuthCtrl: null
            AuthCtrl->>CryptoSvc: simularHashDummy() (Mitigación Timing Attack)
            AuthCtrl->>AuditRepo: registrarEvento(email, IP, "FALLO_USUARIO_INEXISTENTE")
            AuthCtrl-->>UI: HTTP 401 "Credenciales Inválidas"
        else Usuario Localizado
            UserRepo-->>AuthCtrl: EntidadUsuario {id, hashAlmacenado, salt, mfaActivo, secretMFA}
            
            AuthCtrl->>CryptoSvc: verificarPassword(password, hashAlmacenado, salt)
            alt Contraseña Incorrecta
                CryptoSvc-->>AuthCtrl: False (Hash no coincide)
                AuthCtrl->>RateLimit: incrementarFallo(email, IP)
                AuthCtrl->>AuditRepo: registrarEvento(id, IP, "FALLO_CONTRASENA_INCORRECTA")
                AuthCtrl-->>UI: HTTP 401 "Credenciales Inválidas"
            else Contraseña Correcta
                CryptoSvc-->>AuthCtrl: True (Hash validado exitosamente)
                
                alt MFA TOTP Habilitado en la Cuenta
                    AuthCtrl-->>UI: HTTP 206 "Partial Content: Requiere Token TOTP"
                    UI-->>Cliente: Solicitar Código de 6 Dígitos (Google Authenticator)
                    Cliente->>UI: Ingresa Token TOTP (ej. "849201")
                    UI->>AuthCtrl: POST /api/v1/auth/mfa-verify {tempSessionId, totpCode}
                    AuthCtrl->>CryptoSvc: validarTotpRFC6238(secretMFA, totpCode)
                    alt Token TOTP Inválido o Expirado
                        CryptoSvc-->>AuthCtrl: False
                        AuthCtrl->>AuditRepo: registrarEvento(id, IP, "FALLO_MFA_EXPIRADO")
                        AuthCtrl-->>UI: HTTP 401 "Código MFA Inválido"
                    else Token TOTP Válido
                        CryptoSvc-->>AuthCtrl: True
                    end
                end
                
                AuthCtrl->>RateLimit: resetearIntentos(email)
                AuthCtrl->>CryptoSvc: firmarTokenJWT(id, roles, permisos)
                CryptoSvc-->>AuthCtrl: tokenJwtFirmado (RS256)
                AuthCtrl->>AuditRepo: registrarEvento(id, IP, "LOGIN_EXITOSO_MFA")
                AuthCtrl->>UserRepo: actualizarUltimoLogin(id, timestamp)
                AuthCtrl-->>UI: HTTP 200 {tokenJwt, refreshToken, perfilUsuario}
                UI-->>Cliente: Redirección al Dashboard Protegido
            end
        end
    end
```

---

### 3. Diagrama de Secuencia 2: Diagnóstico Clínico Cutáneo y Consentimiento LFPDPPP (CU-02)

Representa la recolección de datos de salud y dermatología protegidos por el Art. 16 Constitucional y la LFPDPPP, con captura de consentimiento firmado digitalmente y formulación de rutinas cosmecéuticas compatibles.

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Paciente / Cliente
    actor Medico as Dermatólogo Consultor
    participant QuizUI as Interfaz Diagnóstico Cutáneo
    participant DiagCtrl as DiagnosticoController
    participant ConsentSvc as ConsentimientoLegalService
    participant SkinEngine as MotorReglasDermatologicas
    participant PerfilRepo as PerfilCutaneoRepository
    participant AuditRepo as BitacoraAuditoriaRepository

    Cliente->>QuizUI: Completa cuestionario (Biotipo, Fototipo, Alergias, Fotos)
    QuizUI->>Cliente: Muestra Aviso de Privacidad Integral (Datos Sensibles de Salud)
    Cliente->>QuizUI: Marca Checkbox Consentimiento Expreso y Firma Digital
    
    QuizUI->>DiagCtrl: POST /api/v1/diagnostico/enviar {respuestas, firmaBase64, fotosHash}
    DiagCtrl->>ConsentSvc: registrarConsentimientoArt16(idCliente, "TRATAMIENTO_DATOS_SALUD", firmaBase64)
    ConsentSvc->>AuditRepo: persistirTrazabilidadLegal(idCliente, timestamp, hashDocumento)
    
    DiagCtrl->>SkinEngine: evaluarPerfilClinico(respuestasCutaneas)
    SkinEngine->>SkinEngine: clasificarFitzpatrick() y detectarContraindicaciones()
    SkinEngine-->>DiagCtrl: PerfilGenerado {fototipo: IV, biotipo: "Graso-Sensible", incompatibilidades: ["Ácido Glicólico > 10%"]}
    
    DiagCtrl->>PerfilRepo: guardarPerfilCutaneo(idCliente, PerfilGenerado)
    
    opt Requiere Validación Médica por Ingredientes Restringidos (COFEPRIS)
        DiagCtrl->>Medico: Notificar expediente para dictamen profesional
        Medico->>DiagCtrl: POST /api/v1/diagnostico/aprobar-medico {folioCedula, observaciones}
    end
    
    DiagCtrl->>SkinEngine: generarRutinaCosmeceutica(PerfilGenerado)
    SkinEngine-->>DiagCtrl: RutinaPersonalizada {limpiadorPhNeutro, serumNiacinamida, fotoprotectorMineral}
    DiagCtrl-->>QuizUI: HTTP 200 {diagnosticoId, rutinaRecomendada, selloCertificacion}
    QuizUI-->>Cliente: Visualización del Reporte Clínico y Productos Habilitados
```

---

### 4. Diagrama de Secuencia 3: Checkout Seguro, Tokenización Bancaria y Split Multialmacén (CU-03)

Ilustra la adquisición transaccional de productos cosméticos con segregación de inventario en múltiples CEDIS (Monterrey / CDMX) y tokenización sin almacenar números de tarjeta en la base de datos (cumplimiento PCI-DSS).

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Comprador
    participant WebUI as Interfaz de Checkout
    participant GateJS as Gateway SDK (Stripe/Openpay)
    participant OrderCtrl as OrdenesController
    participant PaySvc as PasarelaPagoService
    participant SplitSvc as MultiCedisSplitService
    participant WmsRepo as InventarioLotesRepository
    participant OrderRepo as OrdenesCompraRepository

    Cliente->>WebUI: Clic en "Pagar Pedido" e ingresa datos de tarjeta
    WebUI->>GateJS: tokenizarTarjeta(numero, cvv, vigencia)
    GateJS-->>WebUI: tokenBancarioSeguro ("tok_visa_8f3a992") (Sin guardar PAN)
    
    WebUI->>OrderCtrl: POST /api/v1/ordenes/crear {carritoId, direccionEnvio, tokenBancarioSeguro}
    
    OrderCtrl->>SplitSvc: determinarAlmacenesOptimos(carritoId, direccionEnvio)
    SplitSvc->>WmsRepo: consultarStockPorLotesFEFO(items)
    WmsRepo-->>SplitSvc: Disponibilidad: [CEDIS-MTY: 2 items, CEDIS-CDMX: 1 item]
    SplitSvc-->>OrderCtrl: PlanDeDivisionEnvios (Split en 2 Envíos)
    
    OrderCtrl->>PaySvc: procesarCobroTokenizado(montoTotal, tokenBancarioSeguro)
    PaySvc->>GateJS: cobrar(token, monto, monedaMXN)
    
    alt Cobro Declinado por el Banco Emisor
        GateJS-->>PaySvc: Declinado (Fondos Insuficientes / 3D Secure Requerido)
        PaySvc-->>OrderCtrl: ErrorTransaccion
        OrderCtrl-->>WebUI: HTTP 402 "Transacción Declinada por su Banco"
        WebUI-->>Cliente: Solicitar otro método de pago
    else Cobro Exitoso y Aprobado
        GateJS-->>PaySvc: Aprobado {authCode: "AUTH_748291", transId: "ch_912830"}
        PaySvc-->>OrderCtrl: PagoConfirmado
        
        OrderCtrl->>OrderRepo: guardarOrdenMaestraConSplits(Orden, Envíos, TransaccionPago)
        OrderCtrl->>WmsRepo: reservarLotesFEFO(items, splitAlmacenes)
        OrderCtrl-->>WebUI: HTTP 201 Created {numeroOrden: "ORD-2026-9482", splits: 2}
        WebUI-->>Cliente: Pantalla de Confirmación de Compra y Seguimiento
    end
```

---

### 5. Diagrama de Secuencia 4: Cobro Recurrente y Personalización de Beauty-Box (CU-04)

Muestra la orquestación asincrónica de suscripciones automatizadas, donde un proceso por lotes (*cron job*) ejecuta el cobro periódico y ensambla una caja personalizada de productos de acuerdo al estado evolutivo del perfil cutáneo.

```mermaid
sequenceDiagram
    autonumber
    participant Cron as CronJob Suscripciones (Worker)
    participant SubCtrl as SuscripcionEngineService
    participant SubRepo as SuscripcionRepository
    participant PayGateway as PasarelaRecurrente (Openpay API)
    participant PerfilRepo as PerfilCutaneoRepository
    participant BoxCurator as AlgoritmoCuraduriaBox
    participant WmsQueue as ColaMensajeria RabbitMQ (WMS)

    Cron->>SubCtrl: dispararCorteMensual(fechaHoy)
    SubCtrl->>SubRepo: obtenerSuscripcionesPendientesCobro(fechaHoy)
    SubRepo-->>SubCtrl: ListaSuscripcionesActivas
    
    loop Para cada Suscripción Activa
        SubCtrl->>PayGateway: ejecutarCargoRecurrente(customerId, customerCardToken, montoPlan)
        alt Cargo Fallido
            PayGateway-->>SubCtrl: Error (Tarjeta Expirada o Bloqueada)
            SubCtrl->>SubRepo: marcarIntentoFallido(idSuscripcion)
            SubCtrl->>SubCtrl: programarNotificacionReintento(emailCliente)
        else Cargo Exitoso
            PayGateway-->>SubCtrl: CargoAprobado {transaccionId, autorizacion}
            SubCtrl->>SubRepo: actualizarProximaFechaCorte(idSuscripcion, +30_dias)
            
            SubCtrl->>PerfilRepo: obtenerUltimoPerfilCutaneo(idCliente)
            PerfilRepo-->>SubCtrl: PerfilCutaneoVigente
            
            SubCtrl->>BoxCurator: ensamblarCajaPersonalizada(PerfilCutaneoVigente, mesActual)
            BoxCurator-->>SubCtrl: SeleccionProductos [Sérum Hialurónico, Bloqueador Toque Seco, Mascarilla Arcilla]
            
            SubCtrl->>WmsQueue: publicarEvento("ORDEN_BEAUTYBOX_LISTA_SURTIDO", datosCaja)
            SubCtrl->>SubRepo: registrarOrdenGenerada(idSuscripcion, folioOrden)
        end
    end
```

---

### 6. Diagrama de Secuencia 5: Emisión y Timbrado SAT de Factura CFDI 4.0 (CU-05)

Modelado de la integración fiscal obligatoria en México con Proveedor Autorizado de Certificación (PAC), validación de sello digital mediante CSD y generación de XML/PDF con UUID fiscal.

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Cliente Fiscal
    participant WebUI as Portal de Facturación
    participant FiscalCtrl as FacturacionController
    participant CfdiSvc as GeneradorXmlCfdiService
    participant CryptoKey as SelladoDigitalCSD (OpenSSL)
    participant PacSat as PAC Autorizado (WebService SOAP/REST)
    participant InvoiceRepo as FacturasRepository
    participant S3Storage as RepositorioArchivosSeguros

    Cliente->>WebUI: Solicita Factura (RFC, Razón Social, Régimen, CP, Uso CFDI)
    WebUI->>FiscalCtrl: POST /api/v1/facturas/timbrar {numeroOrden, datosFiscales}
    
    FiscalCtrl->>FiscalCtrl: validarCatalogoSat(Regimen, UsoCfdi, CodigoPostal)
    FiscalCtrl->>CfdiSvc: construirXmlSinSello(Orden, Cliente, Conceptos)
    CfdiSvc-->>FiscalCtrl: xmlPreFactura
    
    FiscalCtrl->>CryptoKey: generarCadenaOriginal(xmlPreFactura)
    CryptoKey-->>FiscalCtrl: cadenaOriginalUTF8
    
    FiscalCtrl->>CryptoKey: firmarConCertificadoCSD(cadenaOriginalUTF8, llavePrivadaPem, pass)
    CryptoKey-->>FiscalCtrl: selloDigitalEmisor (SHA256withRSA)
    
    FiscalCtrl->>CfdiSvc: incrustarSello(xmlPreFactura, selloDigitalEmisor)
    CfdiSvc-->>FiscalCtrl: xmlListoParaTimbre
    
    FiscalCtrl->>PacSat: timbrarDocumento(xmlListoParaTimbre, tokenPac)
    alt Error de Validación SAT (ej. RFC no inscrito en LCO o CP no coincide)
        PacSat-->>FiscalCtrl: ErrorTimbrado {codigoError: "CFDI40145", descripcion: "RFC Inválido"}
        FiscalCtrl-->>WebUI: HTTP 422 "Datos Fiscales Rechazados por el SAT"
        WebUI-->>Cliente: Muestra error específico para corrección
    else Timbrado Exitoso
        PacSat-->>FiscalCtrl: TimbreFiscalDigital {uuidSat, selloSat, noCertificadoSat, xmlTimbrado}
        
        FiscalCtrl->>CfdiSvc: compilarRepresentacionImpresaPdf(xmlTimbrado, qrCodeSat)
        CfdiSvc-->>FiscalCtrl: bufferPdfBytes
        
        FiscalCtrl->>S3Storage: guardarArchivosFiscales(uuidSat, xmlTimbrado, bufferPdfBytes)
        S3Storage-->>FiscalCtrl: urlsSegurasDescarga
        
        FiscalCtrl->>InvoiceRepo: registrarFacturaEmitida(uuidSat, folio, xmlUrl, pdfUrl)
        FiscalCtrl-->>WebUI: HTTP 200 {uuidSat, xmlUrl, pdfUrl, estatus: "TIMBRADA"}
        WebUI-->>Cliente: Descarga directa de archivos XML y PDF certificados
    end
```

---

### 7. Diagrama de Secuencia 6: Recepción en Andén, Dictamen QA y Alta de Lote FEFO (CU-06)

Representa la verificación física de insumos y cosméticos en almacén, validando la cadena de frío mediante telemetría IoT antes de ingresar productos al stock comercializable.

```mermaid
sequenceDiagram
    autonumber
    actor Operador as Operador Almacén CEDIS
    actor Inspector as Químico Inspector QA
    participant AppMovil as Terminal Móvil WMS (PDA)
    participant WmsCtrl as RecepcionMercanciaController
    participant IoTBroker as Servidor Telemetria IoT
    participant QaEngine as ControlCalidadCosmeticaService
    participant BatchRepo as LotesInventarioRepository
    participant AuditRepo as BitacoraSeguridadRepository

    Operador->>AppMovil: Escanea Guía de Embarque y Código de Lote de Insumos
    AppMovil->>WmsCtrl: GET /api/v1/wms/orden-compra-lote/{codigoLote}
    WmsCtrl-->>AppMovil: Especificaciones (Temperatura Exigida: 2°C - 8°C, Muestreo QA)
    
    Operador->>AppMovil: Vincula Sensor Datalogger Bluetooth del Contenedor
    AppMovil->>IoTBroker: extraerCurvaTermicaEmbarque(macSensor)
    IoTBroker-->>AppMovil: HistorialTemperaturas (Lecturas cada 5 min durante tránsito)
    
    AppMovil->>WmsCtrl: POST /api/v1/wms/dictamen-frio {codigoLote, telemetria}
    WmsCtrl->>QaEngine: validarExcursionTermica(telemetria)
    alt Excursión Térmica Detectada (> 8°C por más de 30 minutos)
        QaEngine-->>WmsCtrl: RECHAZADO: "Ruptura de Cadena de Frío - Producto Inviable"
        WmsCtrl->>BatchRepo: marcarLoteComoDestruccion(codigoLote, motivo)
        WmsCtrl->>AuditRepo: registrarIncidenteSanitario(codigoLote, "CADENA_FRIO_ROTA")
        WmsCtrl-->>AppMovil: ALERTA ROJA: Proceder a Cuarentena para Desecho
    else Parámetros Térmicos Normales
        QaEngine-->>WmsCtrl: APROBADO: "Cadena de Frío Íntegra"
        WmsCtrl-->>AppMovil: Solicitar Dictamen Físico-Químico a Inspector QA
        
        Inspector->>AppMovil: Registra pruebas de laboratorio (pH, textura, viscosidad, sello intacto)
        AppMovil->>WmsCtrl: POST /api/v1/wms/aprobar-qa {codigoLote, cedulaQuimico, dictamen}
        WmsCtrl->>BatchRepo: darDeAltaLoteDisponible(codigoLote, fechaCaducidad, ubicacionRack)
        WmsCtrl-->>AppMovil: Lote Aprobado y Asignado a Estrategia FEFO
    end
```

---

### 8. Diagrama de Secuencia 7: Devolución RMA por Alergia Cutánea y Farmacovigilancia COFEPRIS (CU-07)

Modelado del flujo médico-legal de devoluciones de productos cosméticos ante reacciones cutáneas adversas, activando el reporte obligatorio ante las autoridades sanitarias.

```mermaid
sequenceDiagram
    autonumber
    actor Cliente as Consumidor / Paciente
    actor Medico as Responsable Sanitario
    participant WebUI as Portal de Devoluciones RMA
    participant RmaCtrl as FarmacovigilanciaController
    participant RmaRepo as DevolucionesRmaRepository
    participant CofeprisAPI as WebService COFEPRIS (Reporte RAM)
    participant ReverseSvc as LogisticaInversaService
    participant AuditRepo as BitacoraAuditoriaRepository

    Cliente->>WebUI: Solicita devolución por "Reacción Alérgica Severa" y sube fotos clínicas
    WebUI->>RmaCtrl: POST /api/v1/rma/crear-alergia {ordenDetalleId, sintomas, fotosBase64}
    
    RmaCtrl->>RmaRepo: crearExpedienteRma(RmaData, estatus: "EN_EVALUACION_CLINICA")
    RmaCtrl->>AuditRepo: registrarIncidenteSanitario(ordenDetalleId, "REPORTE_REACCION_ADVERSA")
    RmaCtrl-->>WebUI: HTTP 201 {folioRma: "RMA-2026-0812", mensaje: "Expediente en análisis médico"}
    
    RmaCtrl->>Medico: Alerta urgente: Revisar caso de reacción cosmética adversa
    Medico->>RmaCtrl: POST /api/v1/rma/dictaminar-medico {folioRma, severidad: "MODERADA", causa: "Retinol"}
    
    alt Dictamen Médico Aprobado
        RmaCtrl->>ReverseSvc: emitirGuiaRetornoPaqueteria(folioRma, direccionCliente)
        ReverseSvc-->>RmaCtrl: guiaEnvioPDF
        
        RmaCtrl->>CofeprisAPI: emitirReporteFarmacovigilancia(folioRma, skuProducto, loteProduccion, sintomas)
        CofeprisAPI-->>RmaCtrl: AcuseRecepcionCofepris {folioOficialCOFEPRIS: "RAM-COF-2026-993"}
        
        RmaCtrl->>RmaRepo: actualizarEstadoRma(folioRma, "RETORNO_AUTORIZADO", folioOficialCOFEPRIS)
        RmaCtrl-->>WebUI: Notificar al cliente: Guía de envío prepagada generada y reembolso en proceso
    end
```
