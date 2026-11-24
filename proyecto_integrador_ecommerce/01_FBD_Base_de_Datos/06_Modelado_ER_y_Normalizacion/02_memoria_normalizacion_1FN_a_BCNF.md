# MEMORIA ANALÍTICA DEMOSTRATIVA DE NORMALIZACIÓN (1FN → 2FN → 3FN → BCNF / 4FN)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD — AEF-1031) — CRITERIO 2.2 (30%)
**Sistema:** DERMA-ECOM · **Total:** 150 Tablas Normalizadas · **Catálogos Simples:** 22 (14.6% ≤ 25%) · **Complejas/Transaccionales:** 128 (85.4% ≥ 75%) · **Tablas Huérfanas:** 0 · **Convención de Llaves:** `PK = ID` · `FKs = ID_*`

---

## 1. FUNDAMENTO TEÓRICO Y CRITERIOS DE VERIFICACIÓN

Para garantizar la ausencia total de anomalías de **inserción, actualización y borrado**, cada una de las 150 relaciones del esquema DERMA-ECOM fue verificada contra las formas normales estándar:

1. **Primera Forma Normal (1FN):** Todos los dominios son atómicos e indivisibles; no existen grupos repetitivos ni listas multivaluadas en un mismo atributo.
2. **Segunda Forma Normal (2FN):** Cumple 1FN y ningún atributo no primo depende parcialmente de una subparte propia de una clave candidata compuesta.
3. **Tercera Forma Normal (3FN):** Cumple 2FN y no existen dependencias funcionales transitivas entre atributos no primos ($X \rightarrow Y \rightarrow Z$ con $Y$ no superclave).
4. **Forma Normal de Boyce-Codd (BCNF):** Para toda dependencia funcional no trivial $X \rightarrow Y$ válida en la relación $R$, el determinante $X$ es obligatoriamente una **superclave** de $R$.
5. **Cuarta Forma Normal (4FN):** Ausencia de dependencias multivaluadas no triviales independientes ($X \twoheadrightarrow Y \mid Z$).

---

## 2. DEMOSTRACIONES FORMALES PASO A PASO POR SUBMÓDULO

### 2.1 Caso Demostrativo 1 (Submódulo 1 — Identidad, Perfil Clínico y Formulación INCI · José Luis Luna García)

#### Relación Universal No Normalizada (0FN):
> `R_DERMO_RAW(ID_cliente, nombre_completo, email, password_hash, [lista_condiciones_piel], ID_producto, nombre_comercial, marca, pais_marca, laboratorio, licencia_lab, categoria, subcategoria, certificacion_sanitaria, [lista_ingredientes_inci_y_porcentajes], [lista_alergenos], [lista_advertencias])`

**Anomalías detectadas en 0FN:**
- Grupos repetitivos multivaluados (`lista_condiciones_piel`, `lista_ingredientes`, `lista_alergenos`, `lista_advertencias`).
- Atributo compuesto `nombre_completo` sin atomicidad.
- Dependencias transitivas (`ID_producto → ID_subcategoria → ID_categoria`; `ID_producto → ID_laboratorio → licencia_lab`; `ID_producto → ID_marca → pais_marca`).

#### Paso a 1FN (Atomicidad y eliminación de grupos repetitivos):
- Se descompone `nombre_completo` en `(nombres, primer_apellido, segundo_apellido)`.
- Se extraen los grupos repetitivos en relaciones con clave primaria subrogada `ID` y clave candidata compuesta:
  - `clientes.cliente_condiciones(ID, ID_cliente, ID_condicion_dermatologica, diagnosticada_por_medico, notas_paciente)`
  - `catalogo.formula_ingredientes(ID, ID_producto, ID_ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo)`
  - `catalogo.alergenos_ingrediente(ID, ID_ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta)`

#### Paso a 2FN (Eliminación de dependencias parciales):
- En `catalogo.formula_ingredientes`, si se incluyera `nombre_comercial` o `indice_comedogenico`, dependerían parcialmente solo de `ID_producto` o solo de `ID_ingrediente` (y no de `{ID_producto, ID_ingrediente}`).
- Se separan estrictamente en `catalogo.productos_maestros(ID, ...)` y `catalogo.ingredientes_inci(ID, ...)`, dejando en `catalogo.formula_ingredientes` únicamente los atributos que dependen de la llave completa `{ID_producto, ID_ingrediente}` (`porcentaje_concentracion`, `orden_en_etiqueta`, `es_principio_activo`).

#### Paso a 3FN (Eliminación de dependencias transitivas):
Se detectaron y rompieron las siguientes dependencias transitivas:
- `productos_maestros.ID → ID_subcategoria → ID_categoria` $\implies$ separadas en `catalogo.categorias` y `catalogo.subcategorias`.
- `productos_maestros.ID → ID_laboratorio → {razon_social, licencia_sanitaria, pais}` $\implies$ `catalogo.laboratorios_fabricantes`.
- `productos_maestros.ID → ID_certificacion_sanitaria → {codigo_certificacion, organismo_certificador}` $\implies$ `catalogo.certificaciones_sanitarias`.
- `clientes.ID → ID_usuario → {email, password_hash, password_salt, mfa_habilitado}` $\implies$ `seguridad.usuarios` (especialización 1:1).

#### Verificación en BCNF y 4FN:
- En todas las tablas resultantes, los únicos determinantes no triviales son la PK (`ID`) y las llaves candidatas `UNIQUE` (`email`, `codigo_producto`, `sku_codigo`, `(ID_producto, ID_ingrediente)`, `(ID_cliente, ID_condicion_dermatologica)`), todas ellas **superclaves** $\implies$ **BCNF cumplido**.
- Al separar `catalogo.formula_ingredientes` (`ID_producto` ↠ `ID_ingrediente`) de `catalogo.advertencias_contraindicaciones` (`ID_producto` ↠ `advertencia`), se elimina la dependencia multivaluada independiente $\implies$ **4FN cumplido**.

---

### 2.2 Caso Demostrativo 2 (Submódulo 2 — Órdenes, Pagos, Antifraude y Facturación CFDI 4.0 · Sheyla Estefanía Moncada Guel)

#### Relación Universal No Normalizada (0FN):
> `R_VENTA_CFDI_RAW(ID_orden, folio_orden, ID_cliente, ID_estado_orden, ID_motivo_cancelacion, [partidas_sku_cantidad_precio], ID_transaccion, pasarela, metodo_pago, ID_regla_antifraude, puntaje_regla, score_total, uuid_sat, rfc_cliente, ID_regimen_sat, descripcion_regimen, ID_uso_cfdi, descripcion_uso, codigo_cupon, ID_campania)`

#### Paso 1FN → 2FN → 3FN → BCNF:
1. **1FN:** Se extrae el grupo repetitivo de partidas a `ventas.ordenes_detalles` y `fiscal.facturas_partidas`, y los pagos combinados a `pagos.split_multipagos`.
2. **2FN:** En `ventas.ordenes_detalles` (llave candidata `{ID_orden, numero_partida}`), ningún dato del producto ni del cliente se duplica; solo se conservan atributos históricos de la línea (`cantidad_comprada`, `precio_unitario_venta`, `tasa_iva_porcentual`).
3. **3FN:** Se eliminan las dependencias transitivas:
   - `ordenes.ID → ID_estado_orden → nombre_estado` $\implies$ `ventas.estados_orden`.
   - `ordenes.ID → ID_motivo_cancelacion → descripcion_motivo` $\implies$ `ventas.motivos_cancelacion_orden`.
   - `evaluaciones_antifraude.ID → ID_regla_antifraude → {codigo_regla, puntaje_riesgo_asignado}` $\implies$ `pagos.reglas_antifraude`.
   - `datos_fiscales_cliente.ID → ID_regimen_sat → descripcion_regimen` y `ID_uso_cfdi_predeterminado → descripcion_uso` $\implies$ `fiscal.regimenes_sat` y `fiscal.usos_cfdi`.
   - `cupones.ID → ID_campania → presupuesto_maximo_descuentos` y `cupones.ID → ID_tipo_descuento → nombre` $\implies$ `promos.campanias` y `ventas.tipos_descuento`.
4. **BCNF:** Todas las llaves candidatas (`folio_orden`, `uuid_sat_fiscal`, `codigo_cupon`, `ID_orden` en `pagos.evaluaciones_antifraude`) son superclaves de sus respectivas tablas.

---

### 2.3 Caso Demostrativo 3 (Submódulo 3 — Compras, WMS FEFO, Envíos y Postventa RMA · Eduardo Salazar Martínez)

#### Relación Universal No Normalizada (0FN):
> `R_LOGISTICA_RAW(ID_despacho, ID_orden_split, ID_transportista, endpoint_api, codigo_locker, ID_almacen, ciudad_cedis, ID_zona_almacen, temp_min, temp_max, codigo_ubicacion, numero_lote, fecha_caducidad, [bultos_dimensiones_y_lotes], folio_rma, ID_motivo_rma, dictamen_retorno)`

#### Paso 1FN → 2FN → 3FN → BCNF:
1. **1FN:** Se separan bultos y su contenido de lotes en `envios.paquetes_bultos` y `envios.paquetes_contenido_lotes`, y los eventos de rastreo en `envios.eventos_tracking_bitacora`.
2. **2FN:** En `wms.inventario_lotes_ubicacion` (llave candidata `{ID_lote, ID_ubicacion}`), solo residen `stock_disponible` y `stock_apartado_pedidos`; en `compras.proveedor_productos` (`{ID_proveedor, ID_variante_sku}`), solo el costo mayorista y tiempo de surtido negociado.
3. **3FN:** Se rompen las cadenas transitivas:
   - `pasillos_ubicaciones.ID → ID_zona_almacen → ID_almacen → {nombre_almacen, ciudad}` $\implies$ `wms.pasillos_ubicaciones`, `wms.zonas_almacen`, `wms.almacenes_cedis`.
   - `puntos_recoleccion_pickup.ID → ID_transportista → {nombre_comercial, api_endpoint}` y `ID_almacen_origen → wms.almacenes_cedis` $\implies$ `envios.puntos_recoleccion_pickup` vinculada por FK a `envios.transportistas_paqueterias` y `wms.almacenes_cedis`.
   - `solicitudes_rma.ID → ID_motivo_rma → requiere_dictamen_medico` $\implies$ `postventa.motivos_devolucion_rma`.
4. **BCNF:** Todo determinante no trivial en las 50 tablas del Submódulo 3 es superclave; ninguna columna depende de un atributo no clave.

---

## 3. RESUMEN CUANTITATIVO DE CUMPLIMIENTO (RÚBRICA 2.2)

| Métrica de Rúbrica | Requisito TecNM | Valor Verificado DERMA-ECOM | Cumplimiento |
| :--- | :---: | :---: | :---: |
| Tablas normalizadas por integrante | 50 tablas / integrante | 50 × 3 integrantes = **150 tablas** | ✓ Cumple |
| Catálogos simples (código/descripción) | ≤ 25% del total | **22 tablas (14.6%)** | ✓ Cumple |
| Tablas transaccionales, maestras, N:M y bitácoras | ≥ 75% del total | **128 tablas (85.4%)** | ✓ Cumple |
| Entidades huérfanas o tablas aisladas | **0 (Prohibidas)** | **0 tablas huérfanas** (183 FKs, 1 componente conexo) | ✓ Cumple |
| Forma Normal alcanzada | Hasta **BCNF** | **1FN, 2FN, 3FN, BCNF** (y 4FN en tablas asociativas) | ✓ Cumple |

---

## 4. MATRIZ DE VERIFICACIÓN DE FORMAS NORMALES PARA LAS 150 TABLAS

| No. | Tabla Física (`esquema.tabla`) | Autor | Clasificación | PK (Superclave) | Integridad Referencial (FKs Salientes / Entrantes) | Estado NF |
| :---: | :--- | :---: | :---: | :---: | :--- | :---: |
| 001 | `seguridad.roles` | José Luis Luna | Catálogo (1) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 002 | `seguridad.permisos` | José Luis Luna | Catálogo (2) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 003 | `seguridad.roles_permisos` | José Luis Luna | Intermedia $N:M$ | `ID` | ID_rol→seguridad.roles, ID_permiso→seguridad.permisos | 1FN–BCNF ✓ |
| 004 | `seguridad.usuarios` | José Luis Luna | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 005 | `seguridad.usuarios_roles` | José Luis Luna | Intermedia $N:M$ | `ID` | ID_usuario→seguridad.usuarios, ID_rol→seguridad.roles | 1FN–BCNF ✓ |
| 006 | `seguridad.sesiones_activas` | José Luis Luna | Transaccional | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 007 | `seguridad.historial_passwords` | José Luis Luna | Transaccional | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 008 | `seguridad.intentos_login` | José Luis Luna | Bitácora Forense | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 009 | `seguridad.tokens_recuperacion` | José Luis Luna | Transaccional | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 010 | `seguridad.dispositivos_confianza` | José Luis Luna | Transaccional | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 011 | `clientes.tipos_piel` | José Luis Luna | Catálogo (3) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 012 | `clientes.condiciones_dermatologicas` | José Luis Luna | Catálogo (4) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 013 | `clientes.clientes` | José Luis Luna | Maestra | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 014 | `clientes.direcciones` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 015 | `clientes.perfil_cutaneo` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes, ID_tipo_piel→clientes.tipos_piel | 1FN–BCNF ✓ |
| 016 | `clientes.cliente_condiciones` | José Luis Luna | Intermedia $N:M$ | `ID` | ID_cliente→clientes.clientes, ID_condicion_dermatologica→clientes.condiciones_dermatologicas | 1FN–BCNF ✓ |
| 017 | `clientes.cuestionarios_diagnostico` | José Luis Luna | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 018 | `clientes.preguntas_diagnostico` | José Luis Luna | Maestra | `ID` | ID_cuestionario→clientes.cuestionarios_diagnostico | 1FN–BCNF ✓ |
| 019 | `clientes.opciones_pregunta` | José Luis Luna | Maestra | `ID` | ID_pregunta→clientes.preguntas_diagnostico | 1FN–BCNF ✓ |
| 020 | `clientes.evaluaciones_diagnostico` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes, ID_cuestionario→clientes.cuestionarios_diagnostico | 1FN–BCNF ✓ |
| 021 | `clientes.respuestas_evaluacion` | José Luis Luna | Transaccional | `ID` | ID_evaluacion→clientes.evaluaciones_diagnostico, ID_pregunta→clientes.preguntas_diagnostico, ID_opcion_seleccionada→clientes.opciones_pregunta | 1FN–BCNF ✓ |
| 022 | `clientes.consentimientos_privacidad` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 023 | `clientes.solicitudes_arco` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 024 | `clientes.preferencias_comunicacion` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 025 | `clientes.metodos_pago_tokenizados` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 026 | `catalogo.marcas` | José Luis Luna | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 027 | `catalogo.laboratorios_fabricantes` | José Luis Luna | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 028 | `catalogo.categorias` | José Luis Luna | Maestra | `ID` | ID_categoria_padre→catalogo.categorias | 1FN–BCNF ✓ |
| 029 | `catalogo.subcategorias` | José Luis Luna | Maestra | `ID` | ID_categoria→catalogo.categorias | 1FN–BCNF ✓ |
| 030 | `catalogo.tipos_aplicacion` | José Luis Luna | Catálogo (5) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 031 | `catalogo.certificaciones_sanitarias` | José Luis Luna | Catálogo (6) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 032 | `catalogo.productos_maestros` | José Luis Luna | Maestra | `ID` | ID_marca→catalogo.marcas, ID_subcategoria→catalogo.subcategorias, ID_laboratorio→catalogo.laboratorios_fabricantes, ID_tipo_aplicacion→catalogo.tipos_aplicacion, ID_certificacion_sanitaria→catalogo.certificaciones_sanitarias | 1FN–BCNF ✓ |
| 033 | `catalogo.subtonos_maquillaje` | José Luis Luna | Catálogo (7) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 034 | `catalogo.acabados_maquillaje` | José Luis Luna | Catálogo (8) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 035 | `catalogo.variantes_sku` | José Luis Luna | Transaccional | `ID` | ID_producto→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 036 | `catalogo.tonos_variante` | José Luis Luna | Transaccional | `ID` | ID_variante_sku→catalogo.variantes_sku, ID_subtono→catalogo.subtonos_maquillaje, ID_acabado→catalogo.acabados_maquillaje | 1FN–BCNF ✓ |
| 037 | `catalogo.ingredientes_inci` | José Luis Luna | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 038 | `catalogo.alergenos_ingrediente` | José Luis Luna | Transaccional | `ID` | ID_ingrediente→catalogo.ingredientes_inci | 1FN–BCNF ✓ |
| 039 | `catalogo.formula_ingredientes` | José Luis Luna | Intermedia $N:M$ (4FN) | `ID` | ID_producto→catalogo.productos_maestros, ID_ingrediente→catalogo.ingredientes_inci | 1FN–BCNF ✓ |
| 040 | `catalogo.registros_sanitarios_cofepris` | José Luis Luna | Transaccional | `ID` | ID_producto→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 041 | `catalogo.advertencias_contraindicaciones` | José Luis Luna | Transaccional | `ID` | ID_producto→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 042 | `catalogo.multimedia_variantes` | José Luis Luna | Transaccional | `ID` | ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 043 | `catalogo.kits_sets` | José Luis Luna | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 044 | `catalogo.kits_items` | José Luis Luna | Intermedia $N:M$ | `ID` | ID_kit→catalogo.kits_sets, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 045 | `catalogo.productos_relacionados` | José Luis Luna | Intermedia $N:M$ | `ID` | ID_producto_origen→catalogo.productos_maestros, ID_producto_destino→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 046 | `catalogo.historial_precios_base` | José Luis Luna | Bitácora | `ID` | ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 047 | `comunidad.rutinas_belleza` | José Luis Luna | Maestra | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 048 | `comunidad.rutinas_pasos` | José Luis Luna | Transaccional | `ID` | ID_rutina→comunidad.rutinas_belleza | 1FN–BCNF ✓ |
| 049 | `comunidad.rutinas_productos` | José Luis Luna | Intermedia $N:M$ | `ID` | ID_rutina_paso→comunidad.rutinas_pasos, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 050 | `comunidad.listas_deseos` | José Luis Luna | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 051 | `ventas.tipos_descuento` | Sheyla Moncada | Catálogo (9) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 052 | `ventas.estados_orden` | Sheyla Moncada | Catálogo (10) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 053 | `ventas.motivos_cancelacion_orden` | Sheyla Moncada | Catálogo (11) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 054 | `ventas.carritos` | Sheyla Moncada | Transaccional | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 055 | `ventas.items_carrito` | Sheyla Moncada | Transaccional | `ID` | ID_carrito→ventas.carritos, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 056 | `ventas.carritos_abandonados_seguimiento` | Sheyla Moncada | Transaccional | `ID` | ID_carrito→ventas.carritos | 1FN–BCNF ✓ |
| 057 | `ventas.planes_suscripcion` | Sheyla Moncada | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 058 | `ventas.frecuencias_suscripcion` | Sheyla Moncada | Catálogo (12) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 059 | `ventas.suscripciones_cliente` | Sheyla Moncada | Transaccional | `ID` | ID_cliente→clientes.clientes, ID_plan_suscripcion→ventas.planes_suscripcion, ID_frecuencia_suscripcion→ventas.frecuencias_suscripcion, ID_direccion_entrega→clientes.direcciones, ID_metodo_tokenizado→clientes.metodos_pago_tokenizados | 1FN–BCNF ✓ |
| 060 | `ventas.suscripciones_items` | Sheyla Moncada | Intermedia $N:M$ | `ID` | ID_suscripcion_cliente→ventas.suscripciones_cliente, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 061 | `ventas.suscripciones_calendario_entregas` | Sheyla Moncada | Transaccional | `ID` | ID_suscripcion_cliente→ventas.suscripciones_cliente | 1FN–BCNF ✓ |
| 062 | `ventas.suscripciones_bitacora_estados` | Sheyla Moncada | Bitácora | `ID` | ID_suscripcion_cliente→ventas.suscripciones_cliente | 1FN–BCNF ✓ |
| 063 | `ventas.regalos_por_compra_gwp` | Sheyla Moncada | Transaccional | `ID` | ID_variante_sku_regalo→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 064 | `ventas.ordenes` | Sheyla Moncada | Maestra Transaccional | `ID` | ID_cliente→clientes.clientes, ID_estado_orden→ventas.estados_orden, ID_direccion_envio→clientes.direcciones, ID_direccion_facturacion→clientes.direcciones, ID_motivo_cancelacion→ventas.motivos_cancelacion_orden | 1FN–BCNF ✓ |
| 065 | `ventas.ordenes_detalles` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 066 | `ventas.ordenes_historial_estados` | Sheyla Moncada | Bitácora | `ID` | ID_orden→ventas.ordenes, ID_estado_orden→ventas.estados_orden | 1FN–BCNF ✓ |
| 067 | `ventas.ordenes_splits_almacen` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes | 1FN–BCNF ✓ |
| 068 | `ventas.ordenes_impuestos` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes | 1FN–BCNF ✓ |
| 069 | `ventas.ordenes_descuentos` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes, ID_tipo_descuento→ventas.tipos_descuento | 1FN–BCNF ✓ |
| 070 | `ventas.ordenes_notas_instrucciones` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes | 1FN–BCNF ✓ |
| 071 | `ventas.reservas_temporales_stock` | Sheyla Moncada | Transaccional | `ID` | ID_carrito→ventas.carritos, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 072 | `ventas.afiliados_influencers` | Sheyla Moncada | Maestra | `ID` | ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 073 | `ventas.comisiones_afiliados` | Sheyla Moncada | Transaccional | `ID` | ID_afiliado→ventas.afiliados_influencers, ID_orden→ventas.ordenes | 1FN–BCNF ✓ |
| 074 | `pagos.proveedores_pasarela` | Sheyla Moncada | Catálogo (13) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 075 | `pagos.metodos_pago` | Sheyla Moncada | Catálogo (14) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 076 | `pagos.transacciones` | Sheyla Moncada | Maestra Transaccional | `ID` | ID_orden→ventas.ordenes, ID_proveedor_pasarela→pagos.proveedores_pasarela, ID_metodo_pago→pagos.metodos_pago | 1FN–BCNF ✓ |
| 077 | `pagos.intentos_cobro` | Sheyla Moncada | Bitácora API | `ID` | ID_transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 078 | `pagos.split_multipagos` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes, ID_metodo_pago→pagos.metodos_pago | 1FN–BCNF ✓ |
| 079 | `pagos.billetera_electronica` | Sheyla Moncada | Maestra | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 080 | `pagos.movimientos_billetera` | Sheyla Moncada | Transaccional | `ID` | ID_billetera→pagos.billetera_electronica | 1FN–BCNF ✓ |
| 081 | `pagos.tarjetas_regalo_giftcards` | Sheyla Moncada | Maestra | `ID` | ID_cliente_comprador→clientes.clientes | 1FN–BCNF ✓ |
| 082 | `pagos.redenciones_giftcards` | Sheyla Moncada | Transaccional | `ID` | ID_giftcard→pagos.tarjetas_regalo_giftcards, ID_orden→ventas.ordenes | 1FN–BCNF ✓ |
| 083 | `pagos.reglas_antifraude` | Sheyla Moncada | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 084 | `pagos.evaluaciones_antifraude` | Sheyla Moncada | Transaccional | `ID` | ID_orden→ventas.ordenes, ID_regla_antifraude→pagos.reglas_antifraude | 1FN–BCNF ✓ |
| 085 | `pagos.contracargos_chargebacks` | Sheyla Moncada | Transaccional | `ID` | ID_transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 086 | `pagos.reembolsos_transaccion` | Sheyla Moncada | Transaccional | `ID` | ID_transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 087 | `fiscal.regimenes_sat` | Sheyla Moncada | Catálogo (15) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 088 | `fiscal.usos_cfdi` | Sheyla Moncada | Catálogo (16) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 089 | `fiscal.datos_fiscales_cliente` | Sheyla Moncada | Transaccional | `ID` | ID_cliente→clientes.clientes, ID_regimen_sat→fiscal.regimenes_sat, ID_uso_cfdi_predeterminado→fiscal.usos_cfdi | 1FN–BCNF ✓ |
| 090 | `fiscal.facturas_cfdi` | Sheyla Moncada | Maestra Transaccional | `ID` | ID_orden→ventas.ordenes, ID_dato_fiscal→fiscal.datos_fiscales_cliente | 1FN–BCNF ✓ |
| 091 | `fiscal.facturas_partidas` | Sheyla Moncada | Transaccional | `ID` | ID_factura→fiscal.facturas_cfdi | 1FN–BCNF ✓ |
| 092 | `fiscal.complementos_pago` | Sheyla Moncada | Transaccional | `ID` | ID_factura→fiscal.facturas_cfdi, ID_transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 093 | `fiscal.notas_credito` | Sheyla Moncada | Transaccional | `ID` | ID_factura→fiscal.facturas_cfdi | 1FN–BCNF ✓ |
| 094 | `fiscal.cancelaciones_cfdi` | Sheyla Moncada | Transaccional | `ID` | ID_factura→fiscal.facturas_cfdi | 1FN–BCNF ✓ |
| 095 | `promos.campanias` | Sheyla Moncada | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 096 | `promos.cupones` | Sheyla Moncada | Maestra | `ID` | ID_campania→promos.campanias, ID_tipo_descuento→ventas.tipos_descuento | 1FN–BCNF ✓ |
| 097 | `promos.reglas_elegibilidad_cupon` | Sheyla Moncada | Transaccional | `ID` | ID_cupon→promos.cupones | 1FN–BCNF ✓ |
| 098 | `promos.cupones_categorias_excluidas` | Sheyla Moncada | Intermedia $N:M$ | `ID` | ID_cupon→promos.cupones, ID_categoria→catalogo.categorias | 1FN–BCNF ✓ |
| 099 | `promos.redenciones_cupones` | Sheyla Moncada | Transaccional | `ID` | ID_cupon→promos.cupones, ID_cliente→clientes.clientes, ID_orden→ventas.ordenes | 1FN–BCNF ✓ |
| 100 | `promos.ventas_flash_horarias` | Sheyla Moncada | Transaccional | `ID` | ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 101 | `compras.estados_orden_compra` | Eduardo Salazar | Catálogo (17) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 102 | `compras.proveedores` | Eduardo Salazar | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 103 | `compras.contactos_proveedor` | Eduardo Salazar | Transaccional | `ID` | ID_proveedor→compras.proveedores | 1FN–BCNF ✓ |
| 104 | `compras.proveedor_slas` | Eduardo Salazar | Transaccional | `ID` | ID_proveedor→compras.proveedores | 1FN–BCNF ✓ |
| 105 | `compras.proveedor_productos` | Eduardo Salazar | Intermedia $N:M$ | `ID` | ID_proveedor→compras.proveedores, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 106 | `compras.requisiciones` | Eduardo Salazar | Transaccional | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 107 | `compras.requisiciones_detalles` | Eduardo Salazar | Transaccional | `ID` | ID_requisicion→compras.requisiciones, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 108 | `compras.ordenes_compra` | Eduardo Salazar | Maestra Transaccional | `ID` | ID_proveedor→compras.proveedores, ID_estado_oc→compras.estados_orden_compra | 1FN–BCNF ✓ |
| 109 | `compras.ordenes_compra_detalles` | Eduardo Salazar | Transaccional | `ID` | ID_orden_compra→compras.ordenes_compra, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 110 | `compras.recepciones_mercancia` | Eduardo Salazar | Transaccional | `ID` | ID_orden_compra→compras.ordenes_compra | 1FN–BCNF ✓ |
| 111 | `compras.recepciones_detalles` | Eduardo Salazar | Transaccional | `ID` | ID_recepcion→compras.recepciones_mercancia, ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 112 | `compras.inspecciones_sanitarias_qa` | Eduardo Salazar | Transaccional | `ID` | ID_recepcion_detalle→compras.recepciones_detalles | 1FN–BCNF ✓ |
| 113 | `wms.almacenes_cedis` | Eduardo Salazar | Maestra | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 114 | `wms.zonas_almacen` | Eduardo Salazar | Maestra | `ID` | ID_almacen→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 115 | `wms.pasillos_ubicaciones` | Eduardo Salazar | Maestra | `ID` | ID_zona_almacen→wms.zonas_almacen | 1FN–BCNF ✓ |
| 116 | `wms.tipos_movimiento_inventario` | Eduardo Salazar | Catálogo (18) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 117 | `wms.lotes_fabricacion_sanitaria` | Eduardo Salazar | Maestra | `ID` | ID_variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 118 | `wms.inventario_lotes_ubicacion` | Eduardo Salazar | Transaccional | `ID` | ID_lote→wms.lotes_fabricacion_sanitaria, ID_ubicacion→wms.pasillos_ubicaciones | 1FN–BCNF ✓ |
| 119 | `wms.kardex_movimientos` | Eduardo Salazar | Bitácora Transaccional | `ID` | ID_inventario_stock→wms.inventario_lotes_ubicacion, ID_tipo_movimiento→wms.tipos_movimiento_inventario | 1FN–BCNF ✓ |
| 120 | `wms.alertas_caducidad_proxima` | Eduardo Salazar | Transaccional | `ID` | ID_lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 121 | `wms.mermas_destruccion_sanitaria` | Eduardo Salazar | Transaccional | `ID` | ID_lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 122 | `wms.transferencias_almacenes` | Eduardo Salazar | Transaccional | `ID` | ID_almacen_origen→wms.almacenes_cedis, ID_almacen_destino→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 123 | `wms.transferencias_detalles` | Eduardo Salazar | Transaccional | `ID` | ID_transferencia→wms.transferencias_almacenes, ID_lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 124 | `wms.conteos_ciclicos_auditoria` | Eduardo Salazar | Transaccional | `ID` | ID_almacen→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 125 | `wms.conteos_ciclicos_detalles` | Eduardo Salazar | Transaccional | `ID` | ID_conteo_ciclico→wms.conteos_ciclicos_auditoria, ID_inventario_stock→wms.inventario_lotes_ubicacion | 1FN–BCNF ✓ |
| 126 | `wms.monitoreo_temperatura_humedad` | Eduardo Salazar | Transaccional | `ID` | ID_zona_almacen→wms.zonas_almacen | 1FN–BCNF ✓ |
| 127 | `envios.transportistas_paqueterias` | Eduardo Salazar | Catálogo (19) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 128 | `envios.tipos_servicio_envio` | Eduardo Salazar | Catálogo (20) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 129 | `envios.tarifas_zonas_postales` | Eduardo Salazar | Transaccional | `ID` | ID_transportista→envios.transportistas_paqueterias, ID_servicio_envio→envios.tipos_servicio_envio | 1FN–BCNF ✓ |
| 130 | `envios.despachos_orden` | Eduardo Salazar | Maestra Transaccional | `ID` | ID_orden_split→ventas.ordenes_splits_almacen, ID_transportista→envios.transportistas_paqueterias, ID_servicio_envio→envios.tipos_servicio_envio | 1FN–BCNF ✓ |
| 131 | `envios.paquetes_bultos` | Eduardo Salazar | Transaccional | `ID` | ID_despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 132 | `envios.paquetes_contenido_lotes` | Eduardo Salazar | Transaccional | `ID` | ID_paquete_bulto→envios.paquetes_bultos, ID_orden_detalle→ventas.ordenes_detalles, ID_lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 133 | `envios.guias_rastreo` | Eduardo Salazar | Transaccional | `ID` | ID_paquete_bulto→envios.paquetes_bultos | 1FN–BCNF ✓ |
| 134 | `envios.eventos_tracking_bitacora` | Eduardo Salazar | Bitácora | `ID` | ID_guia_rastreo→envios.guias_rastreo | 1FN–BCNF ✓ |
| 135 | `envios.intentos_entrega_fallidos` | Eduardo Salazar | Transaccional | `ID` | ID_despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 136 | `envios.incidencias_logisticas` | Eduardo Salazar | Transaccional | `ID` | ID_despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 137 | `envios.seguros_mercancia` | Eduardo Salazar | Transaccional | `ID` | ID_despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 138 | `envios.puntos_recoleccion_pickup` | Eduardo Salazar | Maestra | `ID` | ID_transportista→envios.transportistas_paqueterias, ID_almacen_origen→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 139 | `postventa.motivos_devolucion_rma` | Eduardo Salazar | Catálogo (21) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 140 | `postventa.solicitudes_rma` | Eduardo Salazar | Maestra | `ID` | ID_orden→ventas.ordenes, ID_motivo_rma→postventa.motivos_devolucion_rma | 1FN–BCNF ✓ |
| 141 | `postventa.rma_detalles` | Eduardo Salazar | Transaccional | `ID` | ID_solicitud_rma→postventa.solicitudes_rma, ID_orden_detalle→ventas.ordenes_detalles | 1FN–BCNF ✓ |
| 142 | `postventa.inspeccion_sanitaria_retorno` | Eduardo Salazar | Transaccional | `ID` | ID_rma_detalle→postventa.rma_detalles | 1FN–BCNF ✓ |
| 143 | `postventa.tickets_soporte` | Eduardo Salazar | Maestra | `ID` | ID_cliente→clientes.clientes | 1FN–BCNF ✓ |
| 144 | `postventa.tickets_mensajes` | Eduardo Salazar | Transaccional | `ID` | ID_ticket→postventa.tickets_soporte, ID_usuario_emisor→seguridad.usuarios | 1FN–BCNF ✓ |
| 145 | `postventa.reportes_farmacovigilancia` | Eduardo Salazar | Transaccional | `ID` | ID_cliente→clientes.clientes, ID_producto→catalogo.productos_maestros, ID_lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 146 | `auditoria.tipos_evento_sistema` | Eduardo Salazar | Catálogo (22) | `ID` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 147 | `auditoria.bitacora_seguridad_global` | Eduardo Salazar | Bitácora Forense | `ID` | ID_tipo_evento→auditoria.tipos_evento_sistema, ID_usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 148 | `auditoria.bitacora_cambios_datos` | Eduardo Salazar | Bitácora DML | `ID` | creado_por→seguridad.usuarios | 1FN–BCNF ✓ |
| 149 | `sistema.parametros_configuracion` | Eduardo Salazar | Maestra | `ID` | creado_por→seguridad.usuarios | 1FN–BCNF ✓ |
| 150 | `sistema.notificaciones_push_email` | Eduardo Salazar | Transaccional | `ID` | ID_usuario_destinatario→seguridad.usuarios | 1FN–BCNF ✓ |
