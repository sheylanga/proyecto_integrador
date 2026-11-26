# MODELADO DE PROCESOS DE NEGOCIO: DIAGRAMAS DE ACTIVIDADES (UML 2.5)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI — IFE-1005)
**Sistema:** DERMA-ECOM (E-Commerce de Salud Cutánea, Belleza y Maquillaje con Trazabilidad FEFO y Cadena de Frío)  
**Autores y Distribución Equitativa:**
- **Submódulo 1 (`DA-01` · Tablas `001–050`):** José Luis Luna García
- **Submódulo 2 (`DA-02` · Tablas `051–100`):** Sheyla Estefanía Moncada Guel
- **Submódulo 3 (`DA-03`, `DA-04` · Tablas `101–150`):** Eduardo Salazar Martínez

> [!IMPORTANT]
> **Diagramas de Actividades UML 2.5 Visuales Editables (Nodo Inicial `●`, Nodo Final `◉`, Carriles/*Swimlanes*, Rombos de Decisión `◇`, Barras Paralelas *Fork/Join* `▬`):**
> - Editable `.drawio` (4 pestañas: Login/Dermo, Checkout/CFDI, Recepción QA/FEFO y RMA/COFEPRIS): [`08a_diagrama_actividades_UML.drawio`](./08a_diagrama_actividades_UML.drawio)
> - Visor Interactivo HTML/SVG (con pestañas, zoom y exportación SVG): [`08b_visor_interactivo_actividades_UML.html`](./08b_visor_interactivo_actividades_UML.html)

---

## 1. DA-01: AUTENTICACIÓN SEGURA (LOGIN), MFA TOTP, BLOQUEO POR FUERZA BRUTA Y DIAGNÓSTICO LFPDPPP
**Autor Responsable:** José Luis Luna García (Submódulo 1 — `seguridad.*`, `clientes.*`, `auditoria.bitacora_seguridad_global`)

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

---

## 2. DA-02: CHECKOUT SEGURO, RESERVA 15 MIN, ANTIFRAUDE, PAGO PCI-DSS, SPLIT MULTIALMACÉN Y CFDI 4.0
**Autor Responsable:** Sheyla Estefanía Moncada Guel (Submódulo 2 — `ventas.*`, `pagos.*`, `fiscal.*`, `promos.*`)  
Incluye **bifurcación paralela (*Fork / Join*)** tras la autorización del cobro para ejecutar concurrentemente el Split Multialmacén, la liberación/confirmación de reserva, el timbrado CFDI 4.0 y la notificación al cliente.

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

---

## 3. DA-03: RECEPCIÓN EN CEDIS, TELEMETRÍA IOT (2–8 °C), DICTAMEN QA Y ALTA/DESPACHO FEFO
**Autor Responsable:** Eduardo Salazar Martínez (Submódulo 3 — `compras.*`, `wms.*`, `envios.*`)

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

---

## 4. DA-04: DEVOLUCIÓN RMA, INSPECCIÓN HIGIÉNICA, FARMACOVIGILANCIA COFEPRIS Y REEMBOLSO
**Autores Responsables:** Eduardo Salazar Martínez (SM3) y Sheyla Estefanía Moncada Guel (SM2)

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

## 5. MATRIZ DE TRAZABILIDAD DE ACTIVIDADES ↔ CASOS DE USO ↔ BASE DE DATOS

| Diagrama | Submódulo / Autor | Casos de Uso | Constructos UML 2.5 Aplicados | Tablas BD Impactadas (`PK = ID`, `FK = ID_*`) |
| :---: | :--- | :---: | :--- | :--- |
| **DA-01** | SM1 · José Luis Luna García | CU-01, CU-02 | Inicio/Fin, 7 Decisiones con guardas, ciclo de reintento | `seguridad.usuarios`, `intentos_login`, `sesiones_activas`, `clientes.consentimientos_privacidad`, `perfil_cutaneo`, `auditoria.bitacora_seguridad_global` |
| **DA-02** | SM2 · Sheyla E. Moncada Guel | CU-03, CU-05, CU-10 | Decisiones antifraude/3DS, **Fork/Join paralelo** (4 ramas) | `ventas.carritos`, `reservas_temporales_stock`, `ordenes`, `ordenes_splits_almacen`, `pagos.evaluaciones_antifraude`, `transacciones`, `fiscal.facturas_cfdi` |
| **DA-03** | SM3 · Eduardo Salazar Martínez | CU-06, CU-15 | Decisiones térmicas IoT y QA, cuarentena/destrucción vs FEFO | `compras.ordenes_compra`, `recepciones_mercancia`, `inspecciones_sanitarias_qa`, `wms.monitoreo_temperatura_humedad`, `lotes_fabricacion_sanitaria`, `kardex_movimientos`, `mermas_destruccion_sanitaria` |
| **DA-04** | SM3 + SM2 · E. Salazar / S. Moncada | CU-07, CU-05 | Decisiones RAM/higiene, **Fork/Join paralelo** (Reembolso + CFDI Egreso) | `postventa.solicitudes_rma`, `inspeccion_sanitaria_retorno`, `reportes_farmacovigilancia`, `pagos.reembolsos_transaccion`, `fiscal.notas_credito` |
