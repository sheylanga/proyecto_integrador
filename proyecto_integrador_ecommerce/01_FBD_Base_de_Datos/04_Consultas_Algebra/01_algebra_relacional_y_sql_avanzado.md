# CONSULTAS FORMALES EN ÁLGEBRA RELACIONAL Y SQL AVANZADO
## PROYECTO INTEGRADOR V - TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD - AEF-1031) - CRITERIO 2.4 (35%)
**Sistema E-Commerce de Cuidado de la Salud, Belleza y Maquillaje (DERMA-ECOM)**

Scripts ejecutables validados contra el esquema DDL de 150 tablas:
- **Microsoft SQL Server:** `01_consultas_avanzadas_sqlserver.sql`
- **PostgreSQL (Motor Libre):** `02_consultas_avanzadas_postgresql.sql`
- **Pruebas de Criptografía:** `03_prueba_criptografia_sqlserver.sql` y `04_prueba_criptografia_postgresql.sql`

---

## 1. INTRODUCCIÓN Y CONVENCIONES MATEMÁTICAS

En cumplimiento del **Criterio 2.4 de la Rúbrica de Evaluación de FBD (35%)**, se presentan **10 consultas complejas** expresadas formalmente en **Álgebra Relacional clásica y extendida** junto con sus sentencias SQL compilables tanto en **Microsoft SQL Server** como en **PostgreSQL**:

- Selección: $\sigma_{\text{condición}}(R)$
- Proyección: $\pi_{\text{atributos}}(R)$
- Reunión Natural y Theta Join: $R \bowtie_{\text{condición}} S$
- Renombramiento: $\rho_{S}(R)$
- Unión, Diferencia e Intersección: $\cup, -, \cap$
- Agregación y Agrupamiento: $_{atributos}\mathcal{G}_{\text{funciones}}(R)$

---

### CONSULTA 1: Clientes con Condiciones Dermatológicas Moderadas/Severas que Adquirieron Productos Libres de Alérgenos de Alto Riesgo (Módulo 1 $\bowtie$ Módulo 2)

**Objetivo del Negocio:**
Identificar a clientes con afecciones dermatológicas de severidad `MODERADA` o `SEVERA` que hayan comprado productos cuya formulación INCI esté libre de alérgenos clasificados como `ALTO` o `MUY_SEVERO`.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{nivel\_severidad\_tipica} \in \{\text{'MODERADA'}, \text{'SEVERA'}\}}(\text{condiciones\_dermatologicas})$$
$$R_2 \leftarrow \text{cliente\_condiciones} \bowtie_{\text{condicion\_dermatologica} = \text{id\_condicion\_dermatologica}} R_1$$
$$R_3 \leftarrow \pi_{\text{ingrediente}}\left(\sigma_{\text{clasificacion\_riesgo} \in \{\text{'ALTO'}, \text{'MUY\_SEVERO'}\} \land \text{activo}=1}(\text{alergenos\_ingrediente})\right)$$
$$R_4 \leftarrow \pi_{\text{id\_producto}}(\text{productos\_maestros}) - \pi_{\text{producto}}(\text{formula\_ingredientes} \bowtie R_3)$$
$$R_5 \leftarrow \text{clientes} \bowtie \text{usuarios} \bowtie R_2 \bowtie \text{ordenes} \bowtie \text{ordenes\_detalles} \bowtie \text{variantes\_sku} \bowtie R_4$$
$$\text{Resultado} \leftarrow {}_{\text{id\_cliente}, \text{nombres}, \text{primer\_apellido}, \text{email}, \text{nombre\_condicion}}\mathcal{G}_{\text{COUNT}(\text{DISTINCT id\_orden}) \rightarrow \text{total\_pedidos\_seguros}}(R_5)$$

#### Sentencia SQL (T-SQL — ver `02_consultas_avanzadas_postgresql.sql` para PostgreSQL):
```sql
SELECT
    c.id_cliente,
    c.nombres,
    c.primer_apellido,
    u.email,
    cd.nombre_condicion,
    cd.nivel_severidad_tipica,
    COUNT(DISTINCT o.id_orden) AS total_pedidos_seguros
FROM clientes.clientes c
INNER JOIN seguridad.usuarios u ON c.usuario = u.id_usuario
INNER JOIN clientes.cliente_condiciones cc ON c.id_cliente = cc.cliente
INNER JOIN clientes.condiciones_dermatologicas cd ON cc.condicion_dermatologica = cd.id_condicion_dermatologica
INNER JOIN ventas.ordenes o ON c.id_cliente = o.cliente
INNER JOIN ventas.ordenes_detalles od ON o.id_orden = od.orden
INNER JOIN catalogo.variantes_sku vs ON od.variante_sku = vs.id_variante_sku
INNER JOIN catalogo.productos_maestros pm ON vs.producto = pm.id_producto
WHERE cd.nivel_severidad_tipica IN (N'MODERADA', N'SEVERA')
  AND pm.id_producto NOT IN (
      SELECT DISTINCT fi.producto
      FROM catalogo.formula_ingredientes fi
      INNER JOIN catalogo.alergenos_ingrediente ai ON fi.ingrediente = ai.ingrediente
      WHERE ai.clasificacion_riesgo IN (N'ALTO', N'MUY_SEVERO')
        AND ai.activo = 1
  )
  AND c.activo = 1
  AND o.activo = 1
GROUP BY c.id_cliente, c.nombres, c.primer_apellido, u.email, cd.nombre_condicion, cd.nivel_severidad_tipica
HAVING COUNT(DISTINCT o.id_orden) >= 1
ORDER BY total_pedidos_seguros DESC, c.id_cliente ASC;
```

---

### CONSULTA 2: Control de Caducidades FEFO y Capital en Riesgo en Almacén CEDIS (Módulo 1 $\bowtie$ Módulo 3)

**Objetivo del Negocio:**
Calcular por almacén CEDIS y laboratorio fabricante el total de lotes y unidades con alerta de caducidad próxima no atendida (`atendida = 0`), cuantificando el capital inmovilizado y los días mínimos de vida útil restantes.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{atendida} = 0 \land \text{activo} = 1}(\text{alertas\_caducidad\_proxima})$$
$$R_2 \leftarrow R_1 \bowtie \text{lotes\_fabricacion\_sanitaria} \bowtie \sigma_{\text{stock\_disponible} > 0}(\text{inventario\_lotes\_ubicacion})$$
$$R_3 \leftarrow R_2 \bowtie \text{pasillos\_ubicaciones} \bowtie \text{zonas\_almacen} \bowtie \text{almacenes\_cedis}$$
$$R_4 \leftarrow R_3 \bowtie \text{variantes\_sku} \bowtie \text{productos\_maestros} \bowtie \text{laboratorios\_fabricantes}$$
$$\text{Resultado} \leftarrow {}_{\text{nombre\_almacen}, \text{razon\_social}}\mathcal{G}_{\text{COUNT}(\text{DISTINCT id\_lote}),\; \text{SUM}(\text{stock\_disponible}),\; \text{SUM}(\text{stock\_disponible} \times \text{costo\_estandar\_compra}),\; \text{MIN}(\text{dias\_restantes\_vida\_util})}(R_4)$$

#### Sentencia SQL:
```sql
SELECT
    ac.nombre_almacen,
    lf.razon_social AS laboratorio_fabricante,
    COUNT(DISTINCT wls.id_lote) AS total_lotes_en_riesgo,
    SUM(ilu.stock_disponible) AS total_piezas_expirando,
    CAST(SUM(ilu.stock_disponible * vs.costo_estandar_compra) AS DECIMAL(14,2)) AS capital_en_riesgo_mxn,
    MIN(acp.dias_restantes_vida_util) AS dias_minimos_caducidad
FROM wms.alertas_caducidad_proxima acp
INNER JOIN wms.lotes_fabricacion_sanitaria wls ON acp.lote = wls.id_lote
INNER JOIN wms.inventario_lotes_ubicacion ilu ON wls.id_lote = ilu.lote
INNER JOIN wms.pasillos_ubicaciones pu ON ilu.ubicacion = pu.id_ubicacion
INNER JOIN wms.zonas_almacen za ON pu.zona_almacen = za.id_zona_almacen
INNER JOIN wms.almacenes_cedis ac ON za.almacen = ac.id_almacen
INNER JOIN catalogo.variantes_sku vs ON wls.variante_sku = vs.id_variante_sku
INNER JOIN catalogo.productos_maestros pm ON vs.producto = pm.id_producto
INNER JOIN catalogo.laboratorios_fabricantes lf ON pm.laboratorio = lf.id_laboratorio
WHERE acp.atendida = 0
  AND acp.activo = 1
  AND ilu.stock_disponible > 0
GROUP BY ac.nombre_almacen, lf.razon_social
HAVING SUM(ilu.stock_disponible) > 0
ORDER BY capital_en_riesgo_mxn DESC;
```

---

### CONSULTA 3: Facturación Electrónica CFDI 4.0 Timbrada vs Despacho Logístico (Módulo 2 $\bowtie$ Módulo 3)

**Objetivo del Negocio:**
Conciliar las órdenes con factura CFDI 4.0 vigente (`TIMBRADA_VIGENTE`) frente a su guía de rastreo y tiempos reales de tránsito logístico.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{estado\_cfdi} = \text{'TIMBRADA\_VIGENTE'} \land \text{activo}=1}(\text{facturas\_cfdi})$$
$$R_2 \leftarrow \sigma_{\text{estado\_pago} \in \{\text{'APROBADA'}, \text{'PENDIENTE'}\}}(\text{transacciones})$$
$$R_3 \leftarrow R_1 \bowtie \text{ordenes} \bowtie R_2 \bowtie \text{ordenes\_splits\_almacen} \bowtie \text{despachos\_orden} \bowtie \text{transportistas\_paqueterias} \bowtie \text{paquetes\_bultos} \bowtie \text{guias\_rastreo}$$
$$\text{Resultado} \leftarrow \pi_{\text{folio\_orden}, \text{serie\_factura}, \text{folio\_factura}, \text{uuid\_sat\_fiscal}, \text{monto\_total\_facturado}, \text{numero\_guia\_tracking}, \text{estado\_envio}}(R_3)$$

#### Sentencia SQL:
```sql
SELECT
    o.folio_orden,
    f.serie_factura + '-' + f.folio_factura AS folio_cfdi_completo,
    f.uuid_sat_fiscal,
    f.monto_total_facturado,
    tp.nombre_comercial AS paqueteria,
    gr.numero_guia_tracking,
    d.estado_envio,
    d.fecha_recoleccion_paqueteria,
    d.fecha_entrega_real,
    DATEDIFF(HOUR, d.fecha_recoleccion_paqueteria, d.fecha_entrega_real) AS tiempo_transito_horas
FROM fiscal.facturas_cfdi f
INNER JOIN ventas.ordenes o ON f.orden = o.id_orden
INNER JOIN pagos.transacciones tx ON o.id_orden = tx.orden
INNER JOIN ventas.ordenes_splits_almacen osa ON o.id_orden = osa.orden
INNER JOIN envios.despachos_orden d ON osa.id_orden_split = d.orden_split
INNER JOIN envios.transportistas_paqueterias tp ON d.transportista = tp.id_transportista
INNER JOIN envios.paquetes_bultos pb ON d.id_despacho = pb.despacho
INNER JOIN envios.guias_rastreo gr ON pb.id_paquete_bulto = gr.paquete_bulto
WHERE f.estado_cfdi = N'TIMBRADA_VIGENTE'
  AND tx.estado_pago IN (N'APROBADA', N'PENDIENTE')
  AND f.activo = 1
ORDER BY o.id_orden ASC;
```

---

### CONSULTA 4: Detección y Análisis Forense de Riesgo Antifraude y Sesiones (Módulo 1 $\bowtie$ Módulo 2)

**Objetivo del Negocio:**
Detectar operaciones con evaluación de riesgo `MEDIO`, `ALTO_REQUERIR_3DS` o `CRITICO_RECHAZADO` donde la IP de la transacción difiere de la sesión del usuario o el dispositivo fue marcado como sospechoso.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{nivel\_riesgo} \in \{\text{'MEDIO'}, \text{'ALTO\_REQUERIR\_3DS'}, \text{'CRITICO\_RECHAZADO'}\}}(\text{evaluaciones\_antifraude})$$
$$R_2 \leftarrow R_1 \bowtie \text{ordenes} \bowtie \text{transacciones} \bowtie \text{clientes} \bowtie \text{usuarios}$$
$$R_3 \leftarrow R_2 \mathbin{\text{⟕}} \text{sesiones\_activas}$$
$$\text{Resultado} \leftarrow \pi_{\text{id\_transaccion}, \text{codigo\_autorizacion\_bancaria}, \text{score\_riesgo\_total}, \text{nivel\_riesgo}, \text{ip\_origen}, \text{email}, \text{direccion\_ip}}\left(\sigma_{\text{ip\_origen} \neq \text{direccion\_ip} \lor \text{dispositivo\_sospechoso}=1}(R_3)\right)$$

#### Sentencia SQL:
```sql
SELECT
    tx.id_transaccion,
    tx.codigo_autorizacion_bancaria,
    ea.score_riesgo_total,
    ea.nivel_riesgo,
    ea.ip_origen AS ip_transaccion,
    ea.distancia_geografica_km,
    ea.dispositivo_sospechoso,
    u.email AS cuenta_usuario,
    sa.direccion_ip AS ip_sesion_registrada,
    tx.fecha_pago_efectuado
FROM pagos.evaluaciones_antifraude ea
INNER JOIN ventas.ordenes o ON ea.orden = o.id_orden
INNER JOIN pagos.transacciones tx ON o.id_orden = tx.orden
INNER JOIN clientes.clientes c ON o.cliente = c.id_cliente
INNER JOIN seguridad.usuarios u ON c.usuario = u.id_usuario
LEFT JOIN seguridad.sesiones_activas sa ON u.id_usuario = sa.usuario
WHERE ea.nivel_riesgo IN (N'MEDIO', N'ALTO_REQUERIR_3DS', N'CRITICO_RECHAZADO')
  AND (sa.direccion_ip IS NULL OR ea.ip_origen <> sa.direccion_ip OR ea.dispositivo_sospechoso = 1)
  AND tx.activo = 1
ORDER BY ea.score_riesgo_total DESC;
```

---

### CONSULTA 5: Rentabilidad y Retención del Modelo de Suscripciones Beauty-Box (Módulo 2)

**Objetivo del Negocio:**
Medir los ingresos facturados, ciclos promedio de entrega y retención (`ACTIVA` vs `CANCELADA`) por cada plan y frecuencia de suscripción Beauty-Box.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{activo}=1}(\text{planes\_suscripcion}) \bowtie \text{suscripciones\_cliente} \bowtie \text{frecuencias\_suscripcion} \bowtie \text{suscripciones\_calendario\_entregas}$$
$$\text{Resultado} \leftarrow {}_{\text{nombre\_plan}, \text{nombre}}\mathcal{G}_{\text{COUNT}(\text{DISTINCT id\_suscripcion\_cliente}),\; \text{AVG}(\text{numero\_ciclo\_periodo}),\; \text{SUM}(\text{ingreso\_neto})}(R_1)$$

#### Sentencia SQL:
```sql
SELECT
    ps.nombre_plan,
    fs.nombre AS nombre_frecuencia,
    COUNT(DISTINCT sc.id_suscripcion_cliente) AS total_suscriptores,
    SUM(CASE WHEN sc.estado_suscripcion = N'ACTIVA' THEN 1 ELSE 0 END) AS suscriptores_activos,
    SUM(CASE WHEN sc.estado_suscripcion = N'CANCELADA' THEN 1 ELSE 0 END) AS cancelaciones,
    CAST(AVG(CAST(sce.numero_ciclo_periodo AS FLOAT)) AS DECIMAL(5,2)) AS promedio_ciclos_entrega,
    CAST(
        SUM(
            CASE
                WHEN sce.estado_despacho = N'DESPACHADO'
                THEN ps.precio_recurrente_base * (1.00 - (ps.descuento_porcentual_fidelidad / 100.00))
                ELSE 0
            END
        ) AS DECIMAL(14,2)
    ) AS ingresos_totales_facturados_mxn
FROM ventas.planes_suscripcion ps
INNER JOIN ventas.suscripciones_cliente sc ON ps.id_plan_suscripcion = sc.plan_suscripcion
INNER JOIN ventas.frecuencias_suscripcion fs ON sc.frecuencia_suscripcion = fs.id_frecuencia_suscripcion
INNER JOIN ventas.suscripciones_calendario_entregas sce ON sc.id_suscripcion_cliente = sce.suscripcion_cliente
WHERE ps.activo = 1
GROUP BY ps.nombre_plan, fs.nombre
ORDER BY ingresos_totales_facturados_mxn DESC;
```

---

### CONSULTA 6: Trazabilidad Sanitaria y Farmacovigilancia de Devoluciones RMA (Módulo 1 $\bowtie$ Módulo 2 $\bowtie$ Módulo 3)

**Objetivo del Negocio:**
Obtener el expediente COFEPRIS completo de devoluciones RMA cuyo motivo requiere dictamen médico (`requiere_dictamen_medico = 1`), enlazando producto, SKU, dictamen de retorno, reporte RAM y lote de fabricación.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{requiere\_dictamen\_medico} = 1}(\text{motivos\_devolucion\_rma})$$
$$R_2 \leftarrow \sigma_{\text{activo}=1}(\text{solicitudes\_rma}) \bowtie R_1 \bowtie \text{rma\_detalles} \bowtie \text{inspeccion\_sanitaria\_retorno} \bowtie \text{ordenes\_detalles} \bowtie \text{variantes\_sku} \bowtie \text{productos\_maestros}$$
$$R_3 \leftarrow R_2 \mathbin{\text{⟕}} \text{reportes\_farmacovigilancia} \mathbin{\text{⟕}} \text{lotes\_fabricacion\_sanitaria}$$
$$\text{Resultado} \leftarrow \pi_{\text{folio\_rma}, \text{folio\_cofepris\_ram}, \text{nombre\_comercial}, \text{sku\_codigo}, \text{numero\_lote\_fabricante}, \text{dictamen\_auditor}, \text{destino\_sanitario\_autorizado}}(R_3)$$

#### Sentencia SQL:
```sql
SELECT
    srma.folio_rma,
    mr.codigo_motivo,
    rf.folio_cofepris_ram,
    pm.nombre_comercial AS producto_causante,
    vs.sku_codigo,
    wls.numero_lote_fabricante,
    rf.sintomas_reaccion_adversa,
    rf.requirio_atencion_hospitalaria,
    isr.dictamen_auditor,
    isr.destino_sanitario_autorizado,
    srma.fecha_creacion AS fecha_solicitud_rma
FROM postventa.solicitudes_rma srma
INNER JOIN postventa.motivos_devolucion_rma mr ON srma.motivo_rma = mr.id_motivo_rma
INNER JOIN postventa.rma_detalles rmad ON srma.id_solicitud_rma = rmad.solicitud_rma
INNER JOIN postventa.inspeccion_sanitaria_retorno isr ON rmad.id_rma_detalle = isr.rma_detalle
INNER JOIN ventas.ordenes_detalles od ON rmad.orden_detalle = od.id_orden_detalle
INNER JOIN catalogo.variantes_sku vs ON od.variante_sku = vs.id_variante_sku
INNER JOIN catalogo.productos_maestros pm ON vs.producto = pm.id_producto
LEFT JOIN postventa.reportes_farmacovigilancia rf
    ON rf.producto = pm.id_producto
   AND rf.cliente = (SELECT o.cliente FROM ventas.ordenes o WHERE o.id_orden = srma.orden)
LEFT JOIN wms.lotes_fabricacion_sanitaria wls ON rf.lote = wls.id_lote
WHERE mr.requiere_dictamen_medico = 1
  AND srma.activo = 1
ORDER BY srma.fecha_creacion DESC;
```

---

### CONSULTA 7: Telemetría IoT en Zonas de Cadena de Frío con Incidencias Registradas (Módulo 3)

**Objetivo del Negocio:**
Monitorear lecturas de sensores IoT fuera de rango térmico en almacenes con cadena de frío (`cuenta_con_cadena_frio = 1`), cuantificando las ubicaciones y unidades de stock expuestas.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{cuenta\_con\_cadena\_frio} = 1}(\text{almacenes\_cedis}) \bowtie \text{zonas\_almacen}$$
$$R_2 \leftarrow \sigma_{\text{temperatura\_registrada\_celsius} < \text{temperatura\_min\_celsius} \lor \text{temperatura\_registrada\_celsius} > \text{temperatura\_max\_celsius} \lor \text{alerta\_fuera\_de\_rango} = 1}(R_1 \bowtie \text{monitoreo\_temperatura\_humedad})$$
$$R_3 \leftarrow R_2 \mathbin{\text{⟕}} \text{pasillos\_ubicaciones} \mathbin{\text{⟕}} \text{inventario\_lotes\_ubicacion}$$
$$\text{Resultado} \leftarrow {}_{\text{nombre\_almacen}, \text{codigo\_zona}, \text{codigo\_sensor\_iot}, \text{temperatura\_registrada\_celsius}, \text{fecha\_hora\_lectura}}\mathcal{G}_{\text{COUNT}(\text{DISTINCT id\_inventario\_stock}),\; \text{SUM}(\text{stock\_disponible})}(R_3)$$

#### Sentencia SQL:
```sql
SELECT
    ac.nombre_almacen,
    za.codigo_zona,
    za.descripcion AS descripcion_zona,
    mth.codigo_sensor_iot,
    mth.temperatura_registrada_celsius,
    mth.humedad_relativa_porcentaje,
    mth.alerta_fuera_de_rango,
    mth.fecha_hora_lectura,
    COUNT(DISTINCT ilu.id_inventario_stock) AS ubicaciones_afectadas,
    COALESCE(SUM(ilu.stock_disponible), 0) AS unidades_sueros_en_riesgo_termico
FROM wms.monitoreo_temperatura_humedad mth
INNER JOIN wms.zonas_almacen za ON mth.zona_almacen = za.id_zona_almacen
INNER JOIN wms.almacenes_cedis ac ON za.almacen = ac.id_almacen
LEFT JOIN wms.pasillos_ubicaciones pu ON za.id_zona_almacen = pu.zona_almacen
LEFT JOIN wms.inventario_lotes_ubicacion ilu ON pu.id_ubicacion = ilu.ubicacion
WHERE ac.cuenta_con_cadena_frio = 1
  AND (
      mth.temperatura_registrada_celsius < za.temperatura_min_celsius
      OR mth.temperatura_registrada_celsius > za.temperatura_max_celsius
      OR mth.alerta_fuera_de_rango = 1
  )
  AND mth.activo = 1
GROUP BY
    ac.nombre_almacen, za.codigo_zona, za.descripcion,
    mth.codigo_sensor_iot, mth.temperatura_registrada_celsius,
    mth.humedad_relativa_porcentaje, mth.alerta_fuera_de_rango, mth.fecha_hora_lectura
ORDER BY mth.fecha_hora_lectura DESC;
```

---

### CONSULTA 8: Auditoría Integral de Operaciones Soft-Delete en el Sistema (Módulo 1 $\bowtie$ Módulo 3)

**Objetivo del Negocio:**
Listar los eventos forenses de baja lógica (`SOFT_DELETE`) registrados en la bitácora DML junto con el usuario ejecutor, su rol RBAC activo y el motivo del cambio.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{tipo\_operacion} = \text{'SOFT\_DELETE'}}(\text{bitacora\_cambios\_datos})$$
$$R_2 \leftarrow R_1 \bowtie_{\text{creado\_por} = \text{id\_usuario}} \text{usuarios} \mathbin{\text{⟕}} \sigma_{\text{activo}=1}(\text{usuarios\_roles}) \mathbin{\text{⟕}} \text{roles}$$
$$\text{Resultado} \leftarrow \pi_{\text{id\_cambio\_dato}, \text{nombre\_tabla}, \text{id\_registro\_afectado}, \text{email}, \text{nombre\_rol}, \text{motivo\_cambio}, \text{fecha\_creacion}}(R_2)$$

#### Sentencia SQL:
```sql
SELECT
    bcd.id_cambio_dato,
    bcd.nombre_tabla,
    bcd.id_registro_afectado,
    bcd.tipo_operacion,
    u.email AS ejecutado_por_usuario,
    r.nombre_rol,
    bcd.motivo_cambio,
    bcd.valores_anteriores_json,
    bcd.valores_nuevos_json,
    bcd.fecha_creacion AS fecha_operacion_auditoria
FROM auditoria.bitacora_cambios_datos bcd
INNER JOIN seguridad.usuarios u ON bcd.creado_por = u.id_usuario
LEFT JOIN seguridad.usuarios_roles ur ON u.id_usuario = ur.usuario AND ur.activo = 1
LEFT JOIN seguridad.roles r ON ur.rol = r.id_rol
WHERE bcd.tipo_operacion = N'SOFT_DELETE'
ORDER BY bcd.fecha_creacion DESC;
```

---

### CONSULTA 9: Efectividad de Cupones Promocionales y Ticket Promedio (Módulo 2)

**Objetivo del Negocio:**
Evaluar por campaña y código de cupón el número de redenciones exitosas, ahorro total otorgado, ticket promedio y ventas brutas atribuidas.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{activo}=1}(\text{cupones}) \bowtie \text{campanias} \bowtie \text{tipos\_descuento} \bowtie \text{redenciones\_cupones} \bowtie \sigma_{\text{activo}=1}(\text{ordenes})$$
$$\text{Resultado} \leftarrow {}_{\text{nombre\_campania}, \text{codigo\_cupon}, \text{nombre}, \text{valor\_descuento}}\mathcal{G}_{\text{COUNT}(\text{id\_redencion\_cupon}),\; \text{SUM}(\text{monto\_ahorrado}),\; \text{AVG}(\text{total\_neto}),\; \text{SUM}(\text{total\_neto})}(R_1)$$

#### Sentencia SQL:
```sql
SELECT
    cam.nombre_campania,
    cup.codigo_cupon,
    td.nombre AS tipo_descuento_nombre,
    cup.valor_descuento,
    COUNT(rc.id_redencion_cupon) AS total_redenciones_exitosas,
    CAST(SUM(rc.monto_ahorrado) AS DECIMAL(12,2)) AS total_ahorro_otorgado_mxn,
    CAST(AVG(o.total_neto) AS DECIMAL(12,2)) AS ticket_promedio_generado_mxn,
    CAST(SUM(o.total_neto) AS DECIMAL(14,2)) AS ventas_brutas_atribuidas_mxn
FROM promos.cupones cup
INNER JOIN promos.campanias cam ON cup.campania = cam.id_campania
INNER JOIN ventas.tipos_descuento td ON cup.tipo_descuento = td.id_tipo_descuento
INNER JOIN promos.redenciones_cupones rc ON cup.id_cupon = rc.cupon
INNER JOIN ventas.ordenes o ON rc.orden = o.id_orden
WHERE cup.activo = 1
  AND o.activo = 1
GROUP BY cam.nombre_campania, cup.codigo_cupon, td.nombre, cup.valor_descuento
HAVING COUNT(rc.id_redencion_cupon) >= 1
ORDER BY ventas_brutas_atribuidas_mxn DESC;
```

---

### CONSULTA 10: Desempeño y Cumplimiento de SLA y Calidad QA por Laboratorio Proveedor (Módulo 3)

**Objetivo del Negocio:**
Comparar los días de entrega comprometidos en el SLA de cada laboratorio proveedor frente al tiempo real entre emisión de orden de compra y recepción en muelle, además de calcular la tasa porcentual de rechazo sanitario QA.

#### Expresión en Álgebra Relacional:
$$R_1 \leftarrow \sigma_{\text{activo}=1}(\text{proveedores}) \bowtie \text{proveedor\_slas} \bowtie \sigma_{\text{activo}=1}(\text{ordenes\_compra}) \bowtie \text{recepciones\_mercancia} \bowtie \text{recepciones\_detalles} \mathbin{\text{⟕}} \text{inspecciones\_sanitarias\_qa}$$
$$\text{Resultado} \leftarrow {}_{\text{codigo\_proveedor}, \text{nombre\_comercial}, \text{tiempo\_promedio\_entrega\_dias}}\mathcal{G}_{\text{AVG}(\text{fecha\_ingreso\_muelle} - \text{fecha\_emision}),\; \text{SUM}(\text{cantidad\_recibida\_bultos}),\; \text{tasa\_rechazo\_qa}}(R_1)$$

#### Sentencia SQL:
```sql
SELECT
    pr.codigo_proveedor,
    pr.nombre_comercial AS laboratorio_proveedor,
    ps.tiempo_promedio_entrega_dias AS sla_dias_prometido,
    AVG(DATEDIFF(DAY, oc.fecha_emision, rm.fecha_ingreso_muelle)) AS promedio_dias_reales_entrega,
    COUNT(DISTINCT oc.id_orden_compra) AS total_ordenes_compra_emitidas,
    SUM(rd.cantidad_recibida_bultos) AS total_bultos_recibidos,
    SUM(rd.cantidad_unidades_inspeccionadas) AS total_unidades_inspeccionadas,
    SUM(CASE WHEN qa.dictamen_qa = N'RECHAZADO_DEVOLVER' THEN 1 ELSE 0 END) AS inspecciones_rechazadas_qa,
    CAST(
        (CAST(SUM(CASE WHEN qa.dictamen_qa = N'RECHAZADO_DEVOLVER' THEN 1 ELSE 0 END) AS FLOAT)
            / NULLIF(COUNT(qa.id_inspeccion_qa), 0)) * 100.00
        AS DECIMAL(5,2)
    ) AS tasa_rechazo_qa_porcentual,
    pr.calificacion_calidad_sanitaria
FROM compras.proveedores pr
INNER JOIN compras.proveedor_slas ps ON pr.id_proveedor = ps.proveedor
INNER JOIN compras.ordenes_compra oc ON pr.id_proveedor = oc.proveedor
INNER JOIN compras.recepciones_mercancia rm ON oc.id_orden_compra = rm.orden_compra
INNER JOIN compras.recepciones_detalles rd ON rm.id_recepcion = rd.recepcion
LEFT JOIN compras.inspecciones_sanitarias_qa qa ON rd.id_recepcion_detalle = qa.recepcion_detalle
WHERE pr.activo = 1
  AND oc.activo = 1
GROUP BY
    pr.codigo_proveedor, pr.nombre_comercial,
    ps.tiempo_promedio_entrega_dias, pr.calificacion_calidad_sanitaria
ORDER BY tasa_rechazo_qa_porcentual ASC, pr.calificacion_calidad_sanitaria DESC;
```
