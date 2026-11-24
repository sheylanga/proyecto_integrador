-- =================================================================================================
-- PROYECTO INTEGRADOR V - TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- 10 CONSULTAS AVANZADAS EN SQL SERVER (MULTI-MÓDULO, SUBCONSULTAS, AGREGACIONES Y AUDITORÍA)
-- ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD - AEF-1031) - CRITERIO 2.4 (35%)
-- =================================================================================================

USE EcommerceSaludBellezaDB;
GO

PRINT '=================================================================================================';
PRINT '>>> EJECUTANDO LAS 10 CONSULTAS SQL AVANZADAS DEL PROYECTO INTEGRADOR (SQL SERVER)...';
PRINT '=================================================================================================';
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 1: Clientes con Condiciones Dermatológicas Moderadas/Severas que Adquirieron
--             Productos Libres de Alérgenos de Alto Riesgo (Módulo 1 + Módulo 2)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 1: Clientes con Condiciones Dermatológicas y Productos Libres de Alérgenos Severos...';
SELECT
    c.ID AS id_cliente,
    c.nombres,
    c.primer_apellido,
    u.email,
    cd.nombre_condicion,
    cd.nivel_severidad_tipica,
    COUNT(DISTINCT o.ID) AS total_pedidos_seguros
FROM clientes.clientes c
INNER JOIN seguridad.usuarios u ON c.ID_usuario = u.ID
INNER JOIN clientes.cliente_condiciones cc ON c.ID = cc.ID_cliente
INNER JOIN clientes.condiciones_dermatologicas cd ON cc.ID_condicion_dermatologica = cd.ID
INNER JOIN ventas.ordenes o ON c.ID = o.ID_cliente
INNER JOIN ventas.ordenes_detalles od ON o.ID = od.ID_orden
INNER JOIN catalogo.variantes_sku vs ON od.ID_variante_sku = vs.ID
INNER JOIN catalogo.productos_maestros pm ON vs.ID_producto = pm.ID
WHERE cd.nivel_severidad_tipica IN (N'MODERADA', N'SEVERA')
  AND pm.ID NOT IN (
      SELECT DISTINCT fi.ID_producto
      FROM catalogo.formula_ingredientes fi
      INNER JOIN catalogo.alergenos_ingrediente ai ON fi.ID_ingrediente = ai.ID
      WHERE ai.clasificacion_riesgo IN (N'ALTO', N'MUY_SEVERO')
        AND ai.activo = 1
  )
  AND c.activo = 1
  AND o.activo = 1
GROUP BY c.ID, c.nombres, c.primer_apellido, u.email, cd.nombre_condicion, cd.nivel_severidad_tipica
HAVING COUNT(DISTINCT o.ID) >= 1
ORDER BY total_pedidos_seguros DESC, c.ID ASC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 2: Control de Caducidades FEFO y Capital en Riesgo en Almacén CEDIS (Módulo 1 + Módulo 3)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 2: Capital en Riesgo por Caducidades Próximas FEFO...';
SELECT
    ac.nombre_almacen,
    lf.razon_social AS laboratorio_fabricante,
    COUNT(DISTINCT wls.ID) AS total_lotes_en_riesgo,
    SUM(ilu.stock_disponible) AS total_piezas_expirando,
    CAST(SUM(ilu.stock_disponible * vs.costo_estandar_compra) AS DECIMAL(14,2)) AS capital_en_riesgo_mxn,
    MIN(acp.dias_restantes_vida_util) AS dias_minimos_caducidad
FROM wms.alertas_caducidad_proxima acp
INNER JOIN wms.lotes_fabricacion_sanitaria wls ON acp.ID_lote = wls.ID
INNER JOIN wms.inventario_lotes_ubicacion ilu ON wls.ID = ilu.ID_lote
INNER JOIN wms.pasillos_ubicaciones pu ON ilu.ID_ubicacion = pu.ID
INNER JOIN wms.zonas_almacen za ON pu.ID_zona_almacen = za.ID
INNER JOIN wms.almacenes_cedis ac ON za.ID_almacen = ac.ID
INNER JOIN catalogo.variantes_sku vs ON wls.ID_variante_sku = vs.ID
INNER JOIN catalogo.productos_maestros pm ON vs.ID_producto = pm.ID
INNER JOIN catalogo.laboratorios_fabricantes lf ON pm.ID_laboratorio = lf.ID
WHERE acp.atendida = 0
  AND acp.activo = 1
  AND ilu.stock_disponible > 0
GROUP BY ac.nombre_almacen, lf.razon_social
HAVING SUM(ilu.stock_disponible) > 0
ORDER BY capital_en_riesgo_mxn DESC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 3: Facturación Electrónica CFDI 4.0 Timbrada vs Despacho Logístico (Módulo 2 + Módulo 3)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 3: Conciliación Fiscal CFDI 4.0 vs Entregas Logísticas...';
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
INNER JOIN ventas.ordenes o ON f.ID_orden = o.ID
INNER JOIN pagos.transacciones tx ON o.ID = tx.ID_orden
INNER JOIN ventas.ordenes_splits_almacen osa ON o.ID = osa.ID_orden
INNER JOIN envios.despachos_orden d ON osa.ID = d.ID_orden_split
INNER JOIN envios.transportistas_paqueterias tp ON d.ID_transportista = tp.ID
INNER JOIN envios.paquetes_bultos pb ON d.ID = pb.ID_despacho
INNER JOIN envios.guias_rastreo gr ON pb.ID = gr.ID_paquete_bulto
WHERE f.estado_cfdi = N'TIMBRADA_VIGENTE'
  AND tx.estado_pago IN (N'APROBADA', N'PENDIENTE')
  AND f.activo = 1
ORDER BY o.ID ASC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 4: Detección y Análisis Forense de Riesgo Antifraude y Sesiones (Módulo 1 + Módulo 2)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 4: Análisis Forense de Transacciones y Riesgo Antifraude...';
SELECT
    tx.ID AS id_transaccion,
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
INNER JOIN ventas.ordenes o ON ea.ID_orden = o.ID
INNER JOIN pagos.transacciones tx ON o.ID = tx.ID_orden
INNER JOIN clientes.clientes c ON o.ID_cliente = c.ID
INNER JOIN seguridad.usuarios u ON c.ID_usuario = u.ID
LEFT JOIN seguridad.sesiones_activas sa ON u.ID = sa.ID_usuario
WHERE ea.nivel_riesgo IN (N'MEDIO', N'ALTO_REQUERIR_3DS', N'CRITICO_RECHAZADO')
  AND (sa.direccion_ip IS NULL OR ea.ip_origen <> sa.direccion_ip OR ea.dispositivo_sospechoso = 1)
  AND tx.activo = 1
ORDER BY ea.score_riesgo_total DESC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 5: Rentabilidad y Retención del Modelo de Suscripciones Beauty-Box (Módulo 2)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 5: Rendimiento Financiero de Planes Beauty-Box...';
SELECT
    ps.nombre_plan,
    fs.nombre AS nombre_frecuencia,
    COUNT(DISTINCT sc.ID) AS total_suscriptores,
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
INNER JOIN ventas.suscripciones_cliente sc ON ps.ID = sc.ID_plan_suscripcion
INNER JOIN ventas.frecuencias_suscripcion fs ON sc.ID_frecuencia_suscripcion = fs.ID
INNER JOIN ventas.suscripciones_calendario_entregas sce ON sc.ID = sce.ID_suscripcion_cliente
WHERE ps.activo = 1
GROUP BY ps.nombre_plan, fs.nombre
ORDER BY ingresos_totales_facturados_mxn DESC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 6: Trazabilidad Sanitaria y Farmacovigilancia de Devoluciones RMA (Módulo 1 + 2 + 3)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 6: Expediente Sanitario de Devoluciones RMA con Dictamen Médico...';
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
INNER JOIN postventa.motivos_devolucion_rma mr ON srma.ID_motivo_rma = mr.ID
INNER JOIN postventa.rma_detalles rmad ON srma.ID = rmad.ID_solicitud_rma
INNER JOIN postventa.inspeccion_sanitaria_retorno isr ON rmad.ID = isr.ID_rma_detalle
INNER JOIN ventas.ordenes_detalles od ON rmad.ID_orden_detalle = od.ID
INNER JOIN catalogo.variantes_sku vs ON od.ID_variante_sku = vs.ID
INNER JOIN catalogo.productos_maestros pm ON vs.ID_producto = pm.ID
LEFT JOIN postventa.reportes_farmacovigilancia rf ON rf.ID_producto = pm.ID AND rf.ID_cliente = (SELECT o.ID_cliente FROM ventas.ordenes o WHERE o.ID = srma.ID_orden)
LEFT JOIN wms.lotes_fabricacion_sanitaria wls ON rf.ID_lote = wls.ID
WHERE mr.requiere_dictamen_medico = 1
  AND srma.activo = 1
ORDER BY srma.fecha_creacion DESC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 7: Telemetría IoT en Zonas de Cadena de Frío con Incidencias Registradas (Módulo 3)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 7: Telemetría IoT en Cadena de Frío de Sueros...';
SELECT
    ac.nombre_almacen,
    za.codigo_zona,
    za.descripcion AS descripcion_zona,
    mth.codigo_sensor_iot,
    mth.temperatura_registrada_celsius,
    mth.humedad_relativa_porcentaje,
    mth.alerta_fuera_de_rango,
    mth.fecha_hora_lectura,
    COUNT(DISTINCT ilu.ID) AS ubicaciones_afectadas,
    COALESCE(SUM(ilu.stock_disponible), 0) AS unidades_sueros_en_riesgo_termico
FROM wms.monitoreo_temperatura_humedad mth
INNER JOIN wms.zonas_almacen za ON mth.ID_zona_almacen = za.ID
INNER JOIN wms.almacenes_cedis ac ON za.ID_almacen = ac.ID
LEFT JOIN wms.pasillos_ubicaciones pu ON za.ID = pu.ID_zona_almacen
LEFT JOIN wms.inventario_lotes_ubicacion ilu ON pu.ID = ilu.ID_ubicacion
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
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 8: Auditoría Integral de Operaciones Soft-Delete en el Sistema (Módulo 1 + Módulo 3)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 8: Auditoría Forense de Bajas Lógicas (Soft-Delete)...';
SELECT
    bcd.ID,
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
INNER JOIN seguridad.usuarios u ON bcd.creado_por = u.ID
LEFT JOIN seguridad.usuarios_roles ur ON u.ID = ur.ID_usuario AND ur.activo = 1
LEFT JOIN seguridad.roles r ON ur.ID_rol = r.ID
WHERE bcd.tipo_operacion = N'SOFT_DELETE'
ORDER BY bcd.fecha_creacion DESC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 9: Efectividad de Cupones Promocionales y Ticket Promedio (Módulo 2)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 9: Tasa de Redención de Cupones y Ticket Promedio...';
SELECT
    cam.nombre_campania,
    cup.codigo_cupon,
    td.nombre AS tipo_descuento_nombre,
    cup.valor_descuento,
    COUNT(rc.ID) AS total_redenciones_exitosas,
    CAST(SUM(rc.monto_ahorrado) AS DECIMAL(12,2)) AS total_ahorro_otorgado_mxn,
    CAST(AVG(o.total_neto) AS DECIMAL(12,2)) AS ticket_promedio_generado_mxn,
    CAST(SUM(o.total_neto) AS DECIMAL(14,2)) AS ventas_brutas_atribuidas_mxn
FROM promos.cupones cup
INNER JOIN promos.campanias cam ON cup.ID_campania = cam.ID
INNER JOIN ventas.tipos_descuento td ON cup.ID_tipo_descuento = td.ID
INNER JOIN promos.redenciones_cupones rc ON cup.ID = rc.ID_cupon
INNER JOIN ventas.ordenes o ON rc.ID_orden = o.ID
WHERE cup.activo = 1
  AND o.activo = 1
GROUP BY cam.nombre_campania, cup.codigo_cupon, td.nombre, cup.valor_descuento
HAVING COUNT(rc.ID) >= 1
ORDER BY ventas_brutas_atribuidas_mxn DESC;
GO

-- -------------------------------------------------------------------------------------------------
-- CONSULTA 10: Desempeño y Cumplimiento de SLA y Calidad QA por Laboratorio Proveedor (Módulo 3)
-- -------------------------------------------------------------------------------------------------
PRINT '>>> Consulta 10: Evaluación de SLA y Rechazos QA por Laboratorio Proveedor...';
SELECT
    pr.codigo_proveedor,
    pr.nombre_comercial AS laboratorio_proveedor,
    ps.tiempo_promedio_entrega_dias AS sla_dias_prometido,
    AVG(DATEDIFF(DAY, oc.fecha_emision, rm.fecha_ingreso_muelle)) AS promedio_dias_reales_entrega,
    COUNT(DISTINCT oc.ID) AS total_ordenes_compra_emitidas,
    SUM(rd.cantidad_recibida_bultos) AS total_bultos_recibidos,
    SUM(rd.cantidad_unidades_inspeccionadas) AS total_unidades_inspeccionadas,
    SUM(CASE WHEN qa.dictamen_qa = N'RECHAZADO_DEVOLVER' THEN 1 ELSE 0 END) AS inspecciones_rechazadas_qa,
    CAST(
        (CAST(SUM(CASE WHEN qa.dictamen_qa = N'RECHAZADO_DEVOLVER' THEN 1 ELSE 0 END) AS FLOAT)
            / NULLIF(COUNT(qa.ID), 0)) * 100.00
        AS DECIMAL(5,2)
    ) AS tasa_rechazo_qa_porcentual,
    pr.calificacion_calidad_sanitaria
FROM compras.proveedores pr
INNER JOIN compras.proveedor_slas ps ON pr.ID = ps.ID_proveedor
INNER JOIN compras.ordenes_compra oc ON pr.ID = oc.ID_proveedor
INNER JOIN compras.recepciones_mercancia rm ON oc.ID = rm.ID_orden_compra
INNER JOIN compras.recepciones_detalles rd ON rm.ID = rd.ID_recepcion
LEFT JOIN compras.inspecciones_sanitarias_qa qa ON rd.ID = qa.ID_recepcion_detalle
WHERE pr.activo = 1
  AND oc.activo = 1
GROUP BY
    pr.codigo_proveedor, pr.nombre_comercial,
    ps.tiempo_promedio_entrega_dias, pr.calificacion_calidad_sanitaria
ORDER BY tasa_rechazo_qa_porcentual ASC, pr.calificacion_calidad_sanitaria DESC;
GO

PRINT '=================================================================================================';
PRINT '>>> CONSULTAS AVANZADAS EJECUTADAS SATISFACTORIAMENTE AL 100% (SQL SERVER)';
PRINT '=================================================================================================';
GO