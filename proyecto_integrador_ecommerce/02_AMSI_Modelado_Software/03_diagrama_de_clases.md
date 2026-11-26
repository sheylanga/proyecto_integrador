# ARQUITECTURA DEL DOMINIO Y DIAGRAMA DE CLASES UML 2.5
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI — IFE-1005) — CRITERIO 1.4 (30%)
**Sistema:** DERMA-ECOM (E-Commerce de Salud Cutánea, Belleza y Maquillaje con Trazabilidad FEFO y Cadena de Frío)  
**Autores y Distribución Equitativa:**
- **Submódulo 1 (`seguridad`, `clientes`, `catalogo`, `comunidad` · Tablas `001–050`):** José Luis Luna García
- **Submódulo 2 (`ventas`, `pagos`, `fiscal`, `promos` · Tablas `051–100`):** Sheyla Estefanía Moncada Guel
- **Submódulo 3 (`compras`, `wms`, `envios`, `postventa`, `auditoria`, `sistema` · Tablas `101–150`):** Eduardo Salazar Martínez

> [!IMPORTANT]
> **Diagramas de Clases UML 2.5 Visuales Editables (Clases en 3 compartimentos, `<<abstract>>`, `<<interface>>`, Herencia, Realización, Composición, Agregación, Asociación y Dependencia):**
> - Editable `.drawio` (4 pestañas: Capa Base/Interfaces + SM1 + SM2 + SM3): [`03a_diagrama_clases_UML.drawio`](./03a_diagrama_clases_UML.drawio)
> - Visor Interactivo HTML/SVG (con pestañas, zoom y exportación SVG): [`03b_visor_interactivo_clases_UML.html`](./03b_visor_interactivo_clases_UML.html)

---

## 1. MARCO ARQUITECTÓNICO Y PATRÓN *LAYER SUPERTYPE*

La arquitectura orientada a objetos de **DERMA-ECOM** desacopla el modelo de dominio de la persistencia multi-SGBD (Microsoft SQL Server / PostgreSQL) y garantiza la trazabilidad legal (LFPDPPP, CFF, COFEPRIS, CPF Arts. 211 bis 1–7) mediante la clase base abstracta **`EntidadAuditable`**, de la cual heredan las entidades correspondientes a las **150 tablas** de `EcommerceSaludBellezaDB`.

### 1.1 Clase Base Abstracta `EntidadAuditable` (`PK = ID` + 7 Columnas de Auditoría / Soft-Delete)
- `#ID: Long` — Llave primaria subrogada autoincrementable (`BIGINT IDENTITY` / `GENERATED ALWAYS AS IDENTITY`).
- `#activo: Boolean` — Estado lógico (`1` = vigente, `0` = baja lógica *Soft-Delete*).
- `#fechaCreacion: DateTime` · `#creadoPor: Long`
- `#fechaModificacion: DateTime?` · `#modificadoPor: Long?`
- `#fechaBaja: DateTime?` · `#eliminadoPor: Long?`
- Métodos polimórficos: `+activar(): void`, `+desactivar(idOperador: Long, motivo: String): void`, `+auditarCambio(idOperador: Long): void`, `+estaActivo(): Boolean`.

---

## 1.2 DIAGRAMA DE PAQUETES DEL SISTEMA (UML 2.5 — 3 SUBMÓDULOS Y 14 PAQUETES)

El **Diagrama de Paquetes** organiza las clases del dominio, interfaces de servicio y repositorios en los 3 submódulos de autoría equitativa y sus 14 paquetes lógicos (correspondientes 1:1 a los 14 esquemas SQL de `EcommerceSaludBellezaDB`), mostrando las dependencias `«import»` / `«access»` sin ciclos.

```mermaid
flowchart TB
    subgraph PKG_CORE["<<package>> derma_ecom.core (Transversal)"]
        P_BASE["EntidadAuditable (PK=ID)\nICryptoHashingService\nIDataRepositoryMultiSGBD"]
    end

    subgraph PKG_SM1["<<package>> modulo1_identidad_catalogo — José Luis Luna García (001–050)"]
        P_SEG["<<package>> seguridad\n(Usuario, Rol, Permiso, BitacoraAcceso)"]
        P_CLI["<<package>> clientes\n(Cliente, PerfilCutaneo, SolicitudARCO)"]
        P_CAT["<<package>> catalogo\n(Categoria, ProductoMaestro, VarianteSKU, INCI)"]
        P_COM["<<package>> comunidad\n(RutinaBelleza, ListaDeseos)"]
        P_CLI -. "<<import>>" .-> P_SEG
        P_COM -. "<<import>>" .-> P_CLI
        P_COM -. "<<import>>" .-> P_CAT
    end

    subgraph PKG_SM2["<<package>> modulo2_comercial_fiscal — Sheyla Estefanía Moncada Guel (051–100)"]
        P_VEN["<<package>> ventas\n(OrdenVenta, OrdenDetalle, Split, Suscripcion)"]
        P_PAG["<<package>> pagos\n(TransaccionPago, Antifraude, IPaymentGateway)"]
        P_FIS["<<package>> fiscal\n(FacturaCFDI, NotaCredito, ITaxStampingPAC)"]
        P_PRO["<<package>> promos\n(Campania, CuponPromocion, VentaFlash)"]
        P_PAG -. "<<import>>" .-> P_VEN
        P_FIS -. "<<import>>" .-> P_VEN
        P_FIS -. "<<import>>" .-> P_PAG
        P_VEN -. "<<import>>" .-> P_PRO
    end

    subgraph PKG_SM3["<<package>> modulo3_logistica_forense — Eduardo Salazar Martínez (101–150)"]
        P_CMP["<<package>> compras\n(Proveedor, OrdenCompraProveedor, InspeccionQA)"]
        P_WMS["<<package>> wms\n(AlmacenCEDIS, LoteSanitario, TelemetriaIoT, IFefo)"]
        P_ENV["<<package>> envios\n(DespachoOrden, GuiaRastreo, PuntoPickup)"]
        P_PVT["<<package>> postventa\n(SolicitudRMA, ReporteFarmacovigilancia)"]
        P_AUD["<<package>> auditoria & sistema\n(BitacoraSeguridadGlobal, CambiosJSON)"]
        P_WMS -. "<<import>>" .-> P_CMP
        P_ENV -. "<<import>>" .-> P_WMS
        P_PVT -. "<<import>>" .-> P_WMS
    end

    PKG_SM1 -. "<<import>>" .-> PKG_CORE
    PKG_SM2 -. "<<import>>" .-> PKG_CORE
    PKG_SM3 -. "<<import>>" .-> PKG_CORE
    P_VEN -. "<<access>>" .-> P_CLI
    P_VEN -. "<<access>>" .-> P_CAT
    P_WMS -. "<<access>>" .-> P_CAT
    P_ENV -. "<<access>>" .-> P_VEN
    P_PVT -. "<<access>>" .-> P_VEN
    P_AUD -. "<<access>>" .-> P_SEG
```

---

## 2. DIAGRAMA DE CLASES DEL SUBMÓDULO 1: SEGURIDAD, IDENTIDAD, PERFIL CLÍNICO Y CATÁLOGO INCI
**Autor Responsable:** José Luis Luna García (`Tablas 001–050`)  
Incluye obligatoriamente las **4 entidades de seguridad** exigidas por la rúbrica (`Usuario`, `Rol`, `Permiso`, `BitacoraAcceso`), el servicio criptográfico `ICryptoHashingService`, el expediente dermatológico LFPDPPP y la asociación reflexiva en `Categoria` (`ID_categoria_padre`).

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

---

## 3. DIAGRAMA DE CLASES DEL SUBMÓDULO 2: VENTAS, SUSCRIPCIONES, PAGOS, ANTIFRAUDE Y CFDI 4.0
**Autor Responsable:** Sheyla Estefanía Moncada Guel (`Tablas 051–100`)  
Modela la separación limpia entre `OrdenVenta` (`ventas.ordenes`), sus líneas débiles (`OrdenDetalle`), los splits logísticos (`OrdenSplitAlmacen`), la evaluación antifraude (`EvaluacionAntifraude`), los pagos tokenizados (`TransaccionPago`), la facturación SAT (`FacturaCFDI`) y las interfaces externas (`IPaymentGateway`, `ITaxStampingPAC`).

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

---

## 4. DIAGRAMA DE CLASES DEL SUBMÓDULO 3: COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS, RMA Y FORENSE
**Autor Responsable:** Eduardo Salazar Martínez (`Tablas 101–150`)  
Modela el flujo físico de abastecimiento (`Proveedor`, `OrdenCompraProveedor`), control de calidad (`InspeccionSanitariaQA`), gestión multialmacén (`AlmacenCEDIS`, `LoteSanitario`, `TelemetriaIoT`), última milla (`DespachoOrden`, `PuntoPickup`), postventa sanitaria (`SolicitudRMA`, `ReporteFarmacovigilancia`) y auditoría forense (`BitacoraSeguridadGlobal`).

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

## 5. MATRIZ TÉCNICA DE RELACIONES UML, MULTIPLICIDADES Y TRAZABILIDAD A BD

| Origen | Multiplicidad | Destino | Relación UML | Tabla(s) Físicas en BD (`PK = ID`, `FK = ID_*`) | Justificación de Diseño |
| :--- | :---: | :--- | :---: | :--- | :--- |
| `EntidadAuditable` | `—` | Todas las entidades | **Herencia (`<\|--`)** | 150 tablas (`ID` + 7 cols auditoría) | Patrón *Layer Supertype*: estandariza `PK = ID` y baja lógica *Soft-Delete*. |
| `Usuario` | `1..*` ↔ `1..*` | `Rol` | **Agregación (`o--`)** | `seguridad.usuarios_roles` (`ID_usuario`, `ID_rol`) | RBAC flexible: un usuario puede acumular varios roles sin destruir el catálogo de roles. |
| `Rol` | `1..*` ↔ `1..*` | `Permiso` | **Agregación (`o--`)** | `seguridad.roles_permisos` (`ID_rol`, `ID_permiso`) | Matriz de privilegios atómicos reutilizable entre roles. |
| `Usuario` | `1` → `0..*` | `BitacoraAcceso` | **Composición (`*--`)** | `seguridad.intentos_login` (`ID_usuario`) | Registro forense ligado al ciclo de vida de la cuenta autenticada. |
| `Cliente` | `1` → `0..1` | `PerfilCutaneo` | **Composición (`*--`)** | `clientes.perfil_cutaneo` (`ID_cliente UQ`) | Expediente clínico sensible dependiente existencialmente del cliente (LFPDPPP). |
| `Categoria` | `0..1` → `0..*` | `Categoria` | **Asociación Reflexiva** | `catalogo.categorias` (`ID_categoria_padre`) | Árbol jerárquico multinivel de categorías cosméticas. |
| `ProductoMaestro` | `1` → `1..*` | `VarianteSKU` | **Composición (`*--`)** | `catalogo.variantes_sku` (`ID_producto`) | Una variante SKU no existe sin su producto maestro COFEPRIS. |
| `OrdenVenta` | `1` → `1..*` | `OrdenDetalle` | **Composición (`*--`)** | `ventas.ordenes_detalles` (`ID_orden`) | Entidad débil: las partidas dependen existencialmente de la orden. |
| `OrdenVenta` | `1` → `1..*` | `OrdenSplitAlmacen` | **Composición (`*--`)** | `ventas.ordenes_splits_almacen` (`ID_orden`) | Fragmentación logística por CEDIS Monterrey / CDMX. |
| `OrdenVenta` | `1` → `1..*` | `TransaccionPago` | **Composición (`*--`)** | `pagos.transacciones` (`ID_orden`) | Soporta pagos divididos (`split_multipagos`) y reintentos idempotentes. |
| `OrdenVenta` | `1` → `0..1` | `FacturaCFDI` | **Asociación (`--`)** | `fiscal.facturas_cfdi` (`ID_orden`) | Facturación electrónica CFDI 4.0 bajo demanda ante el PAC/SAT. |
| `AlmacenCEDIS` | `1` → `0..*` | `LoteSanitario` | **Agregación (`o--`)** | `wms.inventario_lotes_ubicacion` (`ID_lote`, `ID_ubicacion`) | Un lote puede transferirse entre CEDIS (`wms.transferencias_almacenes`) sin destruirse. |
| `AlmacenCEDIS` | `1` → `0..*` | `TelemetriaIoT` | **Composición (`*--`)** | `wms.monitoreo_temperatura_humedad` (`ID_zona_almacen`) | Lecturas térmicas 2–8 °C vinculadas a la infraestructura física del almacén. |
| `TransaccionPago` | `—` | `IPaymentGateway` | **Dependencia (`..>`)** | `pagos.proveedores_pasarela` | Desacoplamiento PCI-DSS respecto a Stripe / Mercado Pago. |
| `FacturaCFDI` | `—` | `ITaxStampingPAC` | **Dependencia (`..>`)** | `fiscal.facturas_cfdi` | Desacoplamiento de timbrado XML Anexo 20 frente al PAC autorizado. |
