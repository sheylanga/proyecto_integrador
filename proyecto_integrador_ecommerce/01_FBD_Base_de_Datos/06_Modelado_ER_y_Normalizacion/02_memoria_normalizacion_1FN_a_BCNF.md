# MEMORIA ANALÍTICA DEMOSTRATIVA DE NORMALIZACIÓN (1FN → 2FN → 3FN → BCNF / 4FN)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD — AEF-1031) — CRITERIO 2.2 (30%)
**Sistema:** DERMA-ECOM · **Total:** 150 Tablas Normalizadas · **Catálogos Simples:** 22 (14.6% ≤ 25%) · **Complejas/Transaccionales:** 128 (85.4% ≥ 75%) · **Tablas Huérfanas:** 0

---

## 1. FUNDAMENTO TEÓRICO Y CRITERIOS DE VERIFICACIÓN

Para garantizar la ausencia total de anomalías de **inserción, actualización y borrado**, cada una de las 150 relaciones del esquema DERMA-ECOM fue verificada contra las formas normales estándar:

1. **Primera Forma Normal (1FN):** Todos los dominios son atómicos e indivisibles; no existen grupos repetitivos ni listas multivaluadas en un mismo atributo.
2. **Segunda Forma Normal (2FN):** Cumple 1FN y ningún atributo no primo depende parcialmente de una subparte propia de una clave candidata compuesta.
3. **Tercera Forma Normal (3FN):** Cumple 2FN y no existen dependencias funcionales transitivas entre atributos no primos ( \rightarrow Y \rightarrow Z$ con $ no superclave).
4. **Forma Normal de Boyce-Codd (BCNF):** Para toda dependencia funcional no trivial  \rightarrow Y$ válida en la relación $, el determinante $ es obligatoriamente una **superclave** de $.
5. **Cuarta Forma Normal (4FN):** Ausencia de dependencias multivaluadas no triviales independientes ( \twoheadrightarrow Y \mid Z$).

---

## 2. DEMOSTRACIONES FORMALES PASO A PASO POR SUBMÓDULO

### 2.1 Caso Demostrativo 1 (Submódulo 1 — Identidad, Perfil Clínico y Formulación INCI)

#### Relación Universal No Normalizada (0FN):
> R_DERMO_RAW(id_cliente, nombre_completo, email, password_hash, [lista_condiciones_piel], id_producto, nombre_comercial, marca, pais_marca, laboratorio, licencia_lab, categoria, subcategoria, certificacion_sanitaria, [lista_ingredientes_inci_y_porcentajes], [lista_alergenos], [lista_advertencias])

**Anomalías detectadas en 0FN:**
- Grupos repetitivos multivaluados (lista_condiciones_piel, lista_ingredientes, lista_alergenos, lista_advertencias).
- Atributo compuesto 
ombre_completo sin atomicidad.
- Dependencias transitivas (id_producto → subcategoria → categoria; id_producto → laboratorio → licencia_lab; id_producto → marca → pais_marca).

#### Paso a 1FN (Atomicidad y eliminación de grupos repetitivos):
- Se descompone 
ombre_completo en (nombres, primer_apellido, segundo_apellido).
- Se extraen los grupos repetitivos en relaciones con clave compuesta:
  - cliente_condiciones(cliente, condicion_dermatologica, diagnosticada_por_medico, notas_paciente)
  - ormula_ingredientes(producto, ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo)
  - lergenos_ingrediente(ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta)

#### Paso a 2FN (Eliminación de dependencias parciales):
- En ormula_ingredientes, si se incluyera 
ombre_comercial o indice_comedogenico, dependerían parcialmente solo de producto o solo de ingrediente (y no de {producto, ingrediente}).
- Se separan estrictamente en catalogo.productos_maestros(id_producto, ...) y catalogo.ingredientes_inci(id_ingrediente, ...), dejando en ormula_ingredientes únicamente los atributos que dependen de la llave completa {producto, ingrediente} (porcentaje_concentracion, orden_en_etiqueta, es_principio_activo).

#### Paso a 3FN (Eliminación de dependencias transitivas):
Se detectaron y rompieron las siguientes dependencias transitivas:
- id_producto → subcategoria → categoria $\implies$ separadas en catalogo.categorias y catalogo.subcategorias.
- id_producto → laboratorio → {razon_social, licencia_sanitaria, pais} $\implies$ catalogo.laboratorios_fabricantes.
- id_producto → certificacion_sanitaria → {codigo_certificacion, organismo_certificador} $\implies$ catalogo.certificaciones_sanitarias.
- id_cliente → usuario → {email, password_hash, password_salt, mfa_habilitado} $\implies$ seguridad.usuarios (especialización 1:1).

#### Verificación en BCNF y 4FN:
- En todas las tablas resultantes, los únicos determinantes no triviales son la PK (id_*) y las llaves candidatas UNIQUE (email, codigo_producto, sku_codigo, (producto, ingrediente), (cliente, condicion_dermatologica)), todas ellas **superclaves** $\implies$ **BCNF cumplido**.
- Al separar catalogo.formula_ingredientes (producto ↠ ingrediente) de catalogo.advertencias_contraindicaciones (producto ↠ advertencia), se elimina la dependencia multivaluada independiente $\implies$ **4FN cumplido**.

---

### 2.2 Caso Demostrativo 2 (Submódulo 2 — Órdenes, Pagos, Antifraude y Facturación CFDI 4.0)

#### Relación Universal No Normalizada (0FN):
> R_VENTA_CFDI_RAW(id_orden, folio_orden, cliente, estado_orden, motivo_cancelacion, [partidas_sku_cantidad_precio], id_transaccion, pasarela, metodo_pago, regla_antifraude, puntaje_regla, score_total, uuid_sat, rfc_cliente, regimen_sat, descripcion_regimen, uso_cfdi, descripcion_uso, codigo_cupon, campania)

#### Paso 1FN → 2FN → 3FN → BCNF:
1. **1FN:** Se extrae el grupo repetitivo de partidas a entas.ordenes_detalles y iscal.facturas_partidas, y los pagos combinados a pagos.split_multipagos.
2. **2FN:** En entas.ordenes_detalles (llave candidata {orden, numero_partida}), ningún dato del producto ni del cliente se duplica; solo se conservan atributos históricos de la línea (cantidad_comprada, precio_unitario_venta, 	asa_iva_porcentual).
3. **3FN:** Se eliminan las dependencias transitivas:
   - id_orden → estado_orden → nombre_estado $\implies$ entas.estados_orden.
   - id_orden → motivo_cancelacion → descripcion_motivo $\implies$ entas.motivos_cancelacion_orden.
   - id_evaluacion_fraude → regla_antifraude → {codigo_regla, puntaje_riesgo_asignado} $\implies$ pagos.reglas_antifraude.
   - id_dato_fiscal → regimen_sat → descripcion_regimen y uso_cfdi → descripcion_uso $\implies$ iscal.regimenes_sat y iscal.usos_cfdi.
   - id_cupon → campania → presupuesto_maximo_descuentos y id_cupon → tipo_descuento → nombre $\implies$ promos.campanias y entas.tipos_descuento.
4. **BCNF:** Todas las llaves candidatas (olio_orden, uuid_sat_fiscal, codigo_cupon, orden en evaluaciones_antifraude) son superclaves de sus respectivas tablas.

---

### 2.3 Caso Demostrativo 3 (Submódulo 3 — Compras, WMS FEFO, Envíos y Postventa RMA)

#### Relación Universal No Normalizada (0FN):
> R_LOGISTICA_RAW(id_despacho, orden_split, transportista, endpoint_api, codigo_locker, almacen_cedis, ciudad_cedis, zona_almacen, temp_min, temp_max, codigo_ubicacion, numero_lote, fecha_caducidad, [bultos_dimensiones_y_lotes], folio_rma, motivo_rma, dictamen_retorno)

#### Paso 1FN → 2FN → 3FN → BCNF:
1. **1FN:** Se separan bultos y su contenido de lotes en envios.paquetes_bultos y envios.paquetes_contenido_lotes, y los eventos de rastreo en envios.eventos_tracking_bitacora.
2. **2FN:** En wms.inventario_lotes_ubicacion (llave candidata {lote, ubicacion}), solo residen stock_disponible y stock_apartado_pedidos; en compras.proveedor_productos ({proveedor, variante_sku}), solo el costo mayorista y tiempo de surtido negociado.
3. **3FN:** Se rompen las cadenas transitivas:
   - id_ubicacion → zona_almacen → almacen → {nombre_almacen, ciudad} $\implies$ wms.pasillos_ubicaciones, wms.zonas_almacen, wms.almacenes_cedis.
   - id_punto_pickup → transportista → {nombre_comercial, api_endpoint} y lmacen_origen → almacen_cedis $\implies$ envios.puntos_recoleccion_pickup vinculada por FK a envios.transportistas_paqueterias y wms.almacenes_cedis.
   - id_solicitud_rma → motivo_rma → requiere_dictamen_medico $\implies$ postventa.motivos_devolucion_rma.
4. **BCNF:** Todo determinante no trivial en las 50 tablas del Submódulo 3 es superclave; ninguna columna depende de un atributo no clave.

---

## 3. RESUMEN CUANTITATIVO DE CUMPLIMIENTO (RÚBRICA 2.2)

| Métrica de Rúbrica | Requisito TecNM | Valor Verificado DERMA-ECOM | Cumplimiento |
| :--- | :---: | :---: | :---: |
| Tablas normalizadas por integrante | 50 tablas / integrante | 50 × 3 integrantes = **150 tablas** | ✓ Cumple |
| Catálogos simples (código/descripción) | $\le 25\%$ del total | **22 tablas (14.6%)** | ✓ Cumple |
| Tablas transaccionales, maestras, $ y bitácoras | $\ge 75\%$ del total | **128 tablas (85.4%)** | ✓ Cumple |
| Entidades huérfanas o tablas aisladas | **0 (Prohibidas)** | **0 tablas huérfanas** (183 FKs, 1 componente conexo) | ✓ Cumple |
| Forma Normal alcanzada | Hasta **BCNF** | **1FN, 2FN, 3FN, BCNF** (y 4FN en tablas asociativas) | ✓ Cumple |

---

## 4. MATRIZ DE VERIFICACIÓN DE FORMAS NORMALES PARA LAS 150 TABLAS

| No. | Tabla Física (esquema.tabla) | Autor | Clasificación | PK (Superclave) | Integridad Referencial (FKs Salientes / Entrantes) | Estado NF |
| :---: | :--- | :---: | :---: | :--- | :--- | :---: |
| 001 | `seguridad.roles` | Int. 1 | Catálogo (1) | `id_rol` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 002 | `seguridad.permisos` | Int. 1 | Catálogo (2) | `id_permiso` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 003 | `seguridad.roles_permisos` | Int. 1 | Intermedia $N:M$ | `id_rol_permiso` | rol→seguridad.roles, permiso→seguridad.permisos | 1FN–BCNF ✓ |
| 004 | `seguridad.usuarios` | Int. 1 | Maestra | `id_usuario` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 005 | `seguridad.usuarios_roles` | Int. 1 | Intermedia $N:M$ | `id_usuario_rol` | usuario→seguridad.usuarios, rol→seguridad.roles | 1FN–BCNF ✓ |
| 006 | `seguridad.sesiones_activas` | Int. 1 | Transaccional | `id_sesion` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 007 | `seguridad.historial_passwords` | Int. 1 | Transaccional | `id_historial_pwd` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 008 | `seguridad.intentos_login` | Int. 1 | Bitácora Forense | `id_intento_login` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 009 | `seguridad.tokens_recuperacion` | Int. 1 | Transaccional | `id_token_recuperacion` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 010 | `seguridad.dispositivos_confianza` | Int. 1 | Transaccional | `id_dispositivo` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 011 | `clientes.tipos_piel` | Int. 1 | Catálogo (3) | `id_tipo_piel` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 012 | `clientes.condiciones_dermatologicas` | Int. 1 | Catálogo (4) | `id_condicion_dermatologica` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 013 | `clientes.clientes` | Int. 1 | Maestra | `id_cliente` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 014 | `clientes.direcciones` | Int. 1 | Transaccional | `id_direccion` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 015 | `clientes.perfil_cutaneo` | Int. 1 | Transaccional | `id_perfil_cutaneo` | cliente→clientes.clientes, tipo_piel→clientes.tipos_piel | 1FN–BCNF ✓ |
| 016 | `clientes.cliente_condiciones` | Int. 1 | Intermedia $N:M$ | `id_cliente_condicion` | cliente→clientes.clientes, condicion_dermatologica→clientes.condiciones_dermatologicas | 1FN–BCNF ✓ |
| 017 | `clientes.cuestionarios_diagnostico` | Int. 1 | Maestra | `id_cuestionario` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 018 | `clientes.preguntas_diagnostico` | Int. 1 | Maestra | `id_pregunta` | cuestionario→clientes.cuestionarios_diagnostico | 1FN–BCNF ✓ |
| 019 | `clientes.opciones_pregunta` | Int. 1 | Maestra | `id_opcion` | pregunta→clientes.preguntas_diagnostico | 1FN–BCNF ✓ |
| 020 | `clientes.evaluaciones_diagnostico` | Int. 1 | Transaccional | `id_evaluacion` | cliente→clientes.clientes, cuestionario→clientes.cuestionarios_diagnostico | 1FN–BCNF ✓ |
| 021 | `clientes.respuestas_evaluacion` | Int. 1 | Transaccional | `id_respuesta_evaluacion` | evaluacion→clientes.evaluaciones_diagnostico, pregunta→clientes.preguntas_diagnostico, opcion_seleccionada→clientes.opciones_pregunta | 1FN–BCNF ✓ |
| 022 | `clientes.consentimientos_privacidad` | Int. 1 | Transaccional | `id_consentimiento` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 023 | `clientes.solicitudes_arco` | Int. 1 | Transaccional | `id_solicitud_arco` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 024 | `clientes.preferencias_comunicacion` | Int. 1 | Transaccional | `id_preferencia` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 025 | `clientes.metodos_pago_tokenizados` | Int. 1 | Transaccional | `id_metodo_tokenizado` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 026 | `catalogo.marcas` | Int. 1 | Maestra | `id_marca` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 027 | `catalogo.laboratorios_fabricantes` | Int. 1 | Maestra | `id_laboratorio` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 028 | `catalogo.categorias` | Int. 1 | Maestra | `id_categoria` | categoria_padre→catalogo.categorias | 1FN–BCNF ✓ |
| 029 | `catalogo.subcategorias` | Int. 1 | Maestra | `id_subcategoria` | categoria→catalogo.categorias | 1FN–BCNF ✓ |
| 030 | `catalogo.tipos_aplicacion` | Int. 1 | Catálogo (5) | `id_tipo_aplicacion` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 031 | `catalogo.certificaciones_sanitarias` | Int. 1 | Catálogo (6) | `id_certificacion` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 032 | `catalogo.productos_maestros` | Int. 1 | Maestra | `id_producto` | marca→catalogo.marcas, subcategoria→catalogo.subcategorias, laboratorio→catalogo.laboratorios_fabricantes, tipo_aplicacion→catalogo.tipos_aplicacion, certificacion_sanitaria→catalogo.certificaciones_sanitarias | 1FN–BCNF ✓ |
| 033 | `catalogo.subtonos_maquillaje` | Int. 1 | Catálogo (7) | `id_subtono` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 034 | `catalogo.acabados_maquillaje` | Int. 1 | Catálogo (8) | `id_acabado` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 035 | `catalogo.variantes_sku` | Int. 1 | Transaccional | `id_variante_sku` | producto→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 036 | `catalogo.tonos_variante` | Int. 1 | Transaccional | `id_tono_variante` | variante_sku→catalogo.variantes_sku, subtono→catalogo.subtonos_maquillaje, acabado→catalogo.acabados_maquillaje | 1FN–BCNF ✓ |
| 037 | `catalogo.ingredientes_inci` | Int. 1 | Maestra | `id_ingrediente` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 038 | `catalogo.alergenos_ingrediente` | Int. 1 | Transaccional | `id_alergeno` | ingrediente→catalogo.ingredientes_inci | 1FN–BCNF ✓ |
| 039 | `catalogo.formula_ingredientes` | Int. 1 | Intermedia $N:M$ (4FN) | `id_formula_ingrediente` | producto→catalogo.productos_maestros, ingrediente→catalogo.ingredientes_inci | 1FN–BCNF ✓ |
| 040 | `catalogo.registros_sanitarios_cofepris` | Int. 1 | Transaccional | `id_registro_sanitario` | producto→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 041 | `catalogo.advertencias_contraindicaciones` | Int. 1 | Transaccional | `id_advertencia` | producto→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 042 | `catalogo.multimedia_variantes` | Int. 1 | Transaccional | `id_multimedia` | variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 043 | `catalogo.kits_sets` | Int. 1 | Maestra | `id_kit` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 044 | `catalogo.kits_items` | Int. 1 | Intermedia $N:M$ | `id_kit_item` | kit→catalogo.kits_sets, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 045 | `catalogo.productos_relacionados` | Int. 1 | Intermedia $N:M$ | `id_producto_relacionado` | producto_origen→catalogo.productos_maestros, producto_destino→catalogo.productos_maestros | 1FN–BCNF ✓ |
| 046 | `catalogo.historial_precios_base` | Int. 1 | Bitácora | `id_historial_precio` | variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 047 | `comunidad.rutinas_belleza` | Int. 1 | Maestra | `id_rutina` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 048 | `comunidad.rutinas_pasos` | Int. 1 | Transaccional | `id_rutina_paso` | rutina→comunidad.rutinas_belleza | 1FN–BCNF ✓ |
| 049 | `comunidad.rutinas_productos` | Int. 1 | Intermedia $N:M$ | `id_rutina_producto` | rutina_paso→comunidad.rutinas_pasos, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 050 | `comunidad.listas_deseos` | Int. 1 | Transaccional | `id_lista_deseos` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 051 | `ventas.tipos_descuento` | Int. 2 | Catálogo (9) | `id_tipo_descuento` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 052 | `ventas.estados_orden` | Int. 2 | Catálogo (10) | `id_estado_orden` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 053 | `ventas.motivos_cancelacion_orden` | Int. 2 | Catálogo (11) | `id_motivo_cancelacion` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 054 | `ventas.carritos` | Int. 2 | Transaccional | `id_carrito` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 055 | `ventas.items_carrito` | Int. 2 | Transaccional | `id_item_carrito` | carrito→ventas.carritos, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 056 | `ventas.carritos_abandonados_seguimiento` | Int. 2 | Transaccional | `id_seguimiento_carrito` | carrito→ventas.carritos | 1FN–BCNF ✓ |
| 057 | `ventas.planes_suscripcion` | Int. 2 | Maestra | `id_plan_suscripcion` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 058 | `ventas.frecuencias_suscripcion` | Int. 2 | Catálogo (12) | `id_frecuencia_suscripcion` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 059 | `ventas.suscripciones_cliente` | Int. 2 | Transaccional | `id_suscripcion_cliente` | cliente→clientes.clientes, plan_suscripcion→ventas.planes_suscripcion, frecuencia_suscripcion→ventas.frecuencias_suscripcion, direccion_entrega→clientes.direcciones, metodo_tokenizado→clientes.metodos_pago_tokenizados | 1FN–BCNF ✓ |
| 060 | `ventas.suscripciones_items` | Int. 2 | Intermedia $N:M$ | `id_suscripcion_item` | suscripcion_cliente→ventas.suscripciones_cliente, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 061 | `ventas.suscripciones_calendario_entregas` | Int. 2 | Transaccional | `id_entrega_programada` | suscripcion_cliente→ventas.suscripciones_cliente | 1FN–BCNF ✓ |
| 062 | `ventas.suscripciones_bitacora_estados` | Int. 2 | Bitácora | `id_bitacora_suscripcion` | suscripcion_cliente→ventas.suscripciones_cliente | 1FN–BCNF ✓ |
| 063 | `ventas.regalos_por_compra_gwp` | Int. 2 | Transaccional | `id_regalo_compra` | variante_sku_regalo→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 064 | `ventas.ordenes` | Int. 2 | Maestra Transaccional | `id_orden` | cliente→clientes.clientes, estado_orden→ventas.estados_orden, direccion_envio→clientes.direcciones, direccion_facturacion→clientes.direcciones, motivo_cancelacion→ventas.motivos_cancelacion_orden | 1FN–BCNF ✓ |
| 065 | `ventas.ordenes_detalles` | Int. 2 | Transaccional | `id_orden_detalle` | orden→ventas.ordenes, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 066 | `ventas.ordenes_historial_estados` | Int. 2 | Bitácora | `id_orden_historial` | orden→ventas.ordenes, estado_orden→ventas.estados_orden | 1FN–BCNF ✓ |
| 067 | `ventas.ordenes_splits_almacen` | Int. 2 | Transaccional | `id_orden_split` | orden→ventas.ordenes | 1FN–BCNF ✓ |
| 068 | `ventas.ordenes_impuestos` | Int. 2 | Transaccional | `id_orden_impuesto` | orden→ventas.ordenes | 1FN–BCNF ✓ |
| 069 | `ventas.ordenes_descuentos` | Int. 2 | Transaccional | `id_orden_descuento` | orden→ventas.ordenes, tipo_descuento→ventas.tipos_descuento | 1FN–BCNF ✓ |
| 070 | `ventas.ordenes_notas_instrucciones` | Int. 2 | Transaccional | `id_orden_nota` | orden→ventas.ordenes | 1FN–BCNF ✓ |
| 071 | `ventas.reservas_temporales_stock` | Int. 2 | Transaccional | `id_reserva_stock` | carrito→ventas.carritos, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 072 | `ventas.afiliados_influencers` | Int. 2 | Maestra | `id_afiliado` | usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 073 | `ventas.comisiones_afiliados` | Int. 2 | Transaccional | `id_comision_afiliado` | afiliado→ventas.afiliados_influencers, orden→ventas.ordenes | 1FN–BCNF ✓ |
| 074 | `pagos.proveedores_pasarela` | Int. 2 | Catálogo (13) | `id_proveedor_pasarela` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 075 | `pagos.metodos_pago` | Int. 2 | Catálogo (14) | `id_metodo_pago` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 076 | `pagos.transacciones` | Int. 2 | Maestra Transaccional | `id_transaccion` | orden→ventas.ordenes, proveedor_pasarela→pagos.proveedores_pasarela, metodo_pago→pagos.metodos_pago | 1FN–BCNF ✓ |
| 077 | `pagos.intentos_cobro` | Int. 2 | Bitácora API | `id_intento_cobro` | transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 078 | `pagos.split_multipagos` | Int. 2 | Transaccional | `id_split_pago` | orden→ventas.ordenes, metodo_pago→pagos.metodos_pago | 1FN–BCNF ✓ |
| 079 | `pagos.billetera_electronica` | Int. 2 | Maestra | `id_billetera` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 080 | `pagos.movimientos_billetera` | Int. 2 | Transaccional | `id_movimiento_billetera` | billetera→pagos.billetera_electronica | 1FN–BCNF ✓ |
| 081 | `pagos.tarjetas_regalo_giftcards` | Int. 2 | Maestra | `id_giftcard` | cliente_comprador→clientes.clientes | 1FN–BCNF ✓ |
| 082 | `pagos.redenciones_giftcards` | Int. 2 | Transaccional | `id_redencion_giftcard` | giftcard→pagos.tarjetas_regalo_giftcards, orden→ventas.ordenes | 1FN–BCNF ✓ |
| 083 | `pagos.reglas_antifraude` | Int. 2 | Maestra | `id_regla_antifraude` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 084 | `pagos.evaluaciones_antifraude` | Int. 2 | Transaccional | `id_evaluacion_fraude` | orden→ventas.ordenes, regla_antifraude→pagos.reglas_antifraude | 1FN–BCNF ✓ |
| 085 | `pagos.contracargos_chargebacks` | Int. 2 | Transaccional | `id_contracargo` | transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 086 | `pagos.reembolsos_transaccion` | Int. 2 | Transaccional | `id_reembolso` | transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 087 | `fiscal.regimenes_sat` | Int. 2 | Catálogo (15) | `id_regimen_sat` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 088 | `fiscal.usos_cfdi` | Int. 2 | Catálogo (16) | `id_uso_cfdi` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 089 | `fiscal.datos_fiscales_cliente` | Int. 2 | Transaccional | `id_dato_fiscal` | cliente→clientes.clientes, regimen_sat→fiscal.regimenes_sat, uso_cfdi_predeterminado→fiscal.usos_cfdi | 1FN–BCNF ✓ |
| 090 | `fiscal.facturas_cfdi` | Int. 2 | Maestra Transaccional | `id_factura` | orden→ventas.ordenes, dato_fiscal→fiscal.datos_fiscales_cliente | 1FN–BCNF ✓ |
| 091 | `fiscal.facturas_partidas` | Int. 2 | Transaccional | `id_factura_partida` | factura→fiscal.facturas_cfdi | 1FN–BCNF ✓ |
| 092 | `fiscal.complementos_pago` | Int. 2 | Transaccional | `id_complemento_pago` | factura→fiscal.facturas_cfdi, transaccion→pagos.transacciones | 1FN–BCNF ✓ |
| 093 | `fiscal.notas_credito` | Int. 2 | Transaccional | `id_nota_credito` | factura→fiscal.facturas_cfdi | 1FN–BCNF ✓ |
| 094 | `fiscal.cancelaciones_cfdi` | Int. 2 | Transaccional | `id_cancelacion_cfdi` | factura→fiscal.facturas_cfdi | 1FN–BCNF ✓ |
| 095 | `promos.campanias` | Int. 2 | Maestra | `id_campania` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 096 | `promos.cupones` | Int. 2 | Maestra | `id_cupon` | campania→promos.campanias, tipo_descuento→ventas.tipos_descuento | 1FN–BCNF ✓ |
| 097 | `promos.reglas_elegibilidad_cupon` | Int. 2 | Transaccional | `id_regla_cupon` | cupon→promos.cupones | 1FN–BCNF ✓ |
| 098 | `promos.cupones_categorias_excluidas` | Int. 2 | Intermedia $N:M$ | `id_cupon_exclusion` | cupon→promos.cupones, categoria→catalogo.categorias | 1FN–BCNF ✓ |
| 099 | `promos.redenciones_cupones` | Int. 2 | Transaccional | `id_redencion_cupon` | cupon→promos.cupones, cliente→clientes.clientes, orden→ventas.ordenes | 1FN–BCNF ✓ |
| 100 | `promos.ventas_flash_horarias` | Int. 2 | Transaccional | `id_venta_flash` | variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 101 | `compras.estados_orden_compra` | Int. 3 | Catálogo (17) | `id_estado_oc` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 102 | `compras.proveedores` | Int. 3 | Maestra | `id_proveedor` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 103 | `compras.contactos_proveedor` | Int. 3 | Transaccional | `id_contacto_proveedor` | proveedor→compras.proveedores | 1FN–BCNF ✓ |
| 104 | `compras.proveedor_slas` | Int. 3 | Transaccional | `id_proveedor_sla` | proveedor→compras.proveedores | 1FN–BCNF ✓ |
| 105 | `compras.proveedor_productos` | Int. 3 | Intermedia $N:M$ | `id_proveedor_producto` | proveedor→compras.proveedores, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 106 | `compras.requisiciones` | Int. 3 | Transaccional | `id_requisicion` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 107 | `compras.requisiciones_detalles` | Int. 3 | Transaccional | `id_requisicion_detalle` | requisicion→compras.requisiciones, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 108 | `compras.ordenes_compra` | Int. 3 | Maestra Transaccional | `id_orden_compra` | proveedor→compras.proveedores, estado_oc→compras.estados_orden_compra | 1FN–BCNF ✓ |
| 109 | `compras.ordenes_compra_detalles` | Int. 3 | Transaccional | `id_orden_compra_detalle` | orden_compra→compras.ordenes_compra, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 110 | `compras.recepciones_mercancia` | Int. 3 | Transaccional | `id_recepcion` | orden_compra→compras.ordenes_compra | 1FN–BCNF ✓ |
| 111 | `compras.recepciones_detalles` | Int. 3 | Transaccional | `id_recepcion_detalle` | recepcion→compras.recepciones_mercancia, variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 112 | `compras.inspecciones_sanitarias_qa` | Int. 3 | Transaccional | `id_inspeccion_qa` | recepcion_detalle→compras.recepciones_detalles | 1FN–BCNF ✓ |
| 113 | `wms.almacenes_cedis` | Int. 3 | Maestra | `id_almacen` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 114 | `wms.zonas_almacen` | Int. 3 | Maestra | `id_zona_almacen` | almacen→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 115 | `wms.pasillos_ubicaciones` | Int. 3 | Maestra | `id_ubicacion` | zona_almacen→wms.zonas_almacen | 1FN–BCNF ✓ |
| 116 | `wms.tipos_movimiento_inventario` | Int. 3 | Catálogo (18) | `id_tipo_movimiento` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 117 | `wms.lotes_fabricacion_sanitaria` | Int. 3 | Maestra | `id_lote` | variante_sku→catalogo.variantes_sku | 1FN–BCNF ✓ |
| 118 | `wms.inventario_lotes_ubicacion` | Int. 3 | Transaccional | `id_inventario_stock` | lote→wms.lotes_fabricacion_sanitaria, ubicacion→wms.pasillos_ubicaciones | 1FN–BCNF ✓ |
| 119 | `wms.kardex_movimientos` | Int. 3 | Bitácora Transaccional | `id_kardex` | inventario_stock→wms.inventario_lotes_ubicacion, tipo_movimiento→wms.tipos_movimiento_inventario | 1FN–BCNF ✓ |
| 120 | `wms.alertas_caducidad_proxima` | Int. 3 | Transaccional | `id_alerta_caducidad` | lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 121 | `wms.mermas_destruccion_sanitaria` | Int. 3 | Transaccional | `id_merma_destruccion` | lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 122 | `wms.transferencias_almacenes` | Int. 3 | Transaccional | `id_transferencia` | almacen_origen→wms.almacenes_cedis, almacen_destino→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 123 | `wms.transferencias_detalles` | Int. 3 | Transaccional | `id_transferencia_detalle` | transferencia→wms.transferencias_almacenes, lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 124 | `wms.conteos_ciclicos_auditoria` | Int. 3 | Transaccional | `id_conteo_ciclico` | almacen→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 125 | `wms.conteos_ciclicos_detalles` | Int. 3 | Transaccional | `id_conteo_detalle` | conteo_ciclico→wms.conteos_ciclicos_auditoria, inventario_stock→wms.inventario_lotes_ubicacion | 1FN–BCNF ✓ |
| 126 | `wms.monitoreo_temperatura_humedad` | Int. 3 | Transaccional | `id_telemetria_sensor` | zona_almacen→wms.zonas_almacen | 1FN–BCNF ✓ |
| 127 | `envios.transportistas_paqueterias` | Int. 3 | Catálogo (19) | `id_transportista` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 128 | `envios.tipos_servicio_envio` | Int. 3 | Catálogo (20) | `id_servicio_envio` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 129 | `envios.tarifas_zonas_postales` | Int. 3 | Transaccional | `id_tarifa_zona` | transportista→envios.transportistas_paqueterias, servicio_envio→envios.tipos_servicio_envio | 1FN–BCNF ✓ |
| 130 | `envios.despachos_orden` | Int. 3 | Maestra Transaccional | `id_despacho` | orden_split→ventas.ordenes_splits_almacen, transportista→envios.transportistas_paqueterias, servicio_envio→envios.tipos_servicio_envio | 1FN–BCNF ✓ |
| 131 | `envios.paquetes_bultos` | Int. 3 | Transaccional | `id_paquete_bulto` | despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 132 | `envios.paquetes_contenido_lotes` | Int. 3 | Transaccional | `id_contenido_paquete` | paquete_bulto→envios.paquetes_bultos, orden_detalle→ventas.ordenes_detalles, lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 133 | `envios.guias_rastreo` | Int. 3 | Transaccional | `id_guia_rastreo` | paquete_bulto→envios.paquetes_bultos | 1FN–BCNF ✓ |
| 134 | `envios.eventos_tracking_bitacora` | Int. 3 | Bitácora | `id_evento_tracking` | guia_rastreo→envios.guias_rastreo | 1FN–BCNF ✓ |
| 135 | `envios.intentos_entrega_fallidos` | Int. 3 | Transaccional | `id_intento_fallido` | despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 136 | `envios.incidencias_logisticas` | Int. 3 | Transaccional | `id_incidencia_logistica` | despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 137 | `envios.seguros_mercancia` | Int. 3 | Transaccional | `id_seguro_envio` | despacho→envios.despachos_orden | 1FN–BCNF ✓ |
| 138 | `envios.puntos_recoleccion_pickup` | Int. 3 | Maestra | `id_punto_pickup` | transportista→envios.transportistas_paqueterias, almacen_origen→wms.almacenes_cedis | 1FN–BCNF ✓ |
| 139 | `postventa.motivos_devolucion_rma` | Int. 3 | Catálogo (21) | `id_motivo_rma` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 140 | `postventa.solicitudes_rma` | Int. 3 | Maestra | `id_solicitud_rma` | orden→ventas.ordenes, motivo_rma→postventa.motivos_devolucion_rma | 1FN–BCNF ✓ |
| 141 | `postventa.rma_detalles` | Int. 3 | Transaccional | `id_rma_detalle` | solicitud_rma→postventa.solicitudes_rma, orden_detalle→ventas.ordenes_detalles | 1FN–BCNF ✓ |
| 142 | `postventa.inspeccion_sanitaria_retorno` | Int. 3 | Transaccional | `id_inspeccion_retorno` | rma_detalle→postventa.rma_detalles | 1FN–BCNF ✓ |
| 143 | `postventa.tickets_soporte` | Int. 3 | Maestra | `id_ticket` | cliente→clientes.clientes | 1FN–BCNF ✓ |
| 144 | `postventa.tickets_mensajes` | Int. 3 | Transaccional | `id_ticket_mensaje` | ticket→postventa.tickets_soporte, usuario_emisor→seguridad.usuarios | 1FN–BCNF ✓ |
| 145 | `postventa.reportes_farmacovigilancia` | Int. 3 | Transaccional | `id_reporte_farmacovigilancia` | cliente→clientes.clientes, producto→catalogo.productos_maestros, lote→wms.lotes_fabricacion_sanitaria | 1FN–BCNF ✓ |
| 146 | `auditoria.tipos_evento_sistema` | Int. 3 | Catálogo (22) | `id_tipo_evento` | Referenciada por FKs entrantes | 1FN–BCNF ✓ |
| 147 | `auditoria.bitacora_seguridad_global` | Int. 3 | Bitácora Forense | `id_log_seguridad` | tipo_evento→auditoria.tipos_evento_sistema, usuario→seguridad.usuarios | 1FN–BCNF ✓ |
| 148 | `auditoria.bitacora_cambios_datos` | Int. 3 | Bitácora DML | `id_cambio_dato` | creado_por→seguridad.usuarios | 1FN–BCNF ✓ |
| 149 | `sistema.parametros_configuracion` | Int. 3 | Maestra | `id_parametro` | creado_por→seguridad.usuarios | 1FN–BCNF ✓ |
| 150 | `sistema.notificaciones_push_email` | Int. 3 | Transaccional | `id_notificacion` | usuario_destinatario→seguridad.usuarios | 1FN–BCNF ✓ |