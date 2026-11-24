-- =================================================================================================
-- SCRIPT DE REINICIO / LIMPIEZA TOTAL DE DATOS (150 TABLAS)
-- Limpia registros en orden inverso para respetar las claves foráneas (FK)
-- =================================================================================================
USE EcommerceSaludBellezaDB;
GO
SET NOCOUNT ON;

-- Desactivar cualquier IDENTITY_INSERT que haya quedado abierto en la sesión de SSMS
BEGIN TRY
    SET IDENTITY_INSERT seguridad.permisos OFF;
END TRY BEGIN CATCH END CATCH;
BEGIN TRY
    SET IDENTITY_INSERT seguridad.roles_permisos OFF;
END TRY BEGIN CATCH END CATCH;
GO

PRINT '>>> INICIANDO LIMPIEZA DE DATOS EN 150 TABLAS...';
GO
DELETE FROM sistema.notificaciones_push_email;
IF OBJECT_ID('sistema.notificaciones_push_email') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('sistema.notificaciones_push_email'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('sistema.notificaciones_push_email', RESEED, 0);
GO
DELETE FROM sistema.parametros_configuracion;
IF OBJECT_ID('sistema.parametros_configuracion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('sistema.parametros_configuracion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('sistema.parametros_configuracion', RESEED, 0);
GO
DELETE FROM auditoria.bitacora_cambios_datos;
IF OBJECT_ID('auditoria.bitacora_cambios_datos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('auditoria.bitacora_cambios_datos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('auditoria.bitacora_cambios_datos', RESEED, 0);
GO
DELETE FROM auditoria.bitacora_seguridad_global;
IF OBJECT_ID('auditoria.bitacora_seguridad_global') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('auditoria.bitacora_seguridad_global'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('auditoria.bitacora_seguridad_global', RESEED, 0);
GO
DELETE FROM auditoria.tipos_evento_sistema;
IF OBJECT_ID('auditoria.tipos_evento_sistema') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('auditoria.tipos_evento_sistema'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('auditoria.tipos_evento_sistema', RESEED, 0);
GO
DELETE FROM postventa.reportes_farmacovigilancia;
IF OBJECT_ID('postventa.reportes_farmacovigilancia') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.reportes_farmacovigilancia'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.reportes_farmacovigilancia', RESEED, 0);
GO
DELETE FROM postventa.tickets_mensajes;
IF OBJECT_ID('postventa.tickets_mensajes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.tickets_mensajes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.tickets_mensajes', RESEED, 0);
GO
DELETE FROM postventa.tickets_soporte;
IF OBJECT_ID('postventa.tickets_soporte') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.tickets_soporte'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.tickets_soporte', RESEED, 0);
GO
DELETE FROM postventa.inspeccion_sanitaria_retorno;
IF OBJECT_ID('postventa.inspeccion_sanitaria_retorno') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.inspeccion_sanitaria_retorno'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.inspeccion_sanitaria_retorno', RESEED, 0);
GO
DELETE FROM postventa.rma_detalles;
IF OBJECT_ID('postventa.rma_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.rma_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.rma_detalles', RESEED, 0);
GO
DELETE FROM postventa.solicitudes_rma;
IF OBJECT_ID('postventa.solicitudes_rma') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.solicitudes_rma'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.solicitudes_rma', RESEED, 0);
GO
DELETE FROM postventa.motivos_devolucion_rma;
IF OBJECT_ID('postventa.motivos_devolucion_rma') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('postventa.motivos_devolucion_rma'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('postventa.motivos_devolucion_rma', RESEED, 0);
GO
DELETE FROM envios.puntos_recoleccion_pickup;
IF OBJECT_ID('envios.puntos_recoleccion_pickup') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.puntos_recoleccion_pickup'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.puntos_recoleccion_pickup', RESEED, 0);
GO
DELETE FROM envios.seguros_mercancia;
IF OBJECT_ID('envios.seguros_mercancia') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.seguros_mercancia'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.seguros_mercancia', RESEED, 0);
GO
DELETE FROM envios.incidencias_logisticas;
IF OBJECT_ID('envios.incidencias_logisticas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.incidencias_logisticas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.incidencias_logisticas', RESEED, 0);
GO
DELETE FROM envios.intentos_entrega_fallidos;
IF OBJECT_ID('envios.intentos_entrega_fallidos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.intentos_entrega_fallidos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.intentos_entrega_fallidos', RESEED, 0);
GO
DELETE FROM envios.eventos_tracking_bitacora;
IF OBJECT_ID('envios.eventos_tracking_bitacora') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.eventos_tracking_bitacora'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.eventos_tracking_bitacora', RESEED, 0);
GO
DELETE FROM envios.guias_rastreo;
IF OBJECT_ID('envios.guias_rastreo') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.guias_rastreo'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.guias_rastreo', RESEED, 0);
GO
DELETE FROM envios.paquetes_contenido_lotes;
IF OBJECT_ID('envios.paquetes_contenido_lotes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.paquetes_contenido_lotes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.paquetes_contenido_lotes', RESEED, 0);
GO
DELETE FROM envios.paquetes_bultos;
IF OBJECT_ID('envios.paquetes_bultos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.paquetes_bultos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.paquetes_bultos', RESEED, 0);
GO
DELETE FROM envios.despachos_orden;
IF OBJECT_ID('envios.despachos_orden') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.despachos_orden'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.despachos_orden', RESEED, 0);
GO
DELETE FROM envios.tarifas_zonas_postales;
IF OBJECT_ID('envios.tarifas_zonas_postales') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.tarifas_zonas_postales'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.tarifas_zonas_postales', RESEED, 0);
GO
DELETE FROM envios.tipos_servicio_envio;
IF OBJECT_ID('envios.tipos_servicio_envio') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.tipos_servicio_envio'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.tipos_servicio_envio', RESEED, 0);
GO
DELETE FROM envios.transportistas_paqueterias;
IF OBJECT_ID('envios.transportistas_paqueterias') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('envios.transportistas_paqueterias'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('envios.transportistas_paqueterias', RESEED, 0);
GO
DELETE FROM wms.monitoreo_temperatura_humedad;
IF OBJECT_ID('wms.monitoreo_temperatura_humedad') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.monitoreo_temperatura_humedad'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.monitoreo_temperatura_humedad', RESEED, 0);
GO
DELETE FROM wms.conteos_ciclicos_detalles;
IF OBJECT_ID('wms.conteos_ciclicos_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.conteos_ciclicos_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.conteos_ciclicos_detalles', RESEED, 0);
GO
DELETE FROM wms.conteos_ciclicos_auditoria;
IF OBJECT_ID('wms.conteos_ciclicos_auditoria') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.conteos_ciclicos_auditoria'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.conteos_ciclicos_auditoria', RESEED, 0);
GO
DELETE FROM wms.transferencias_detalles;
IF OBJECT_ID('wms.transferencias_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.transferencias_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.transferencias_detalles', RESEED, 0);
GO
DELETE FROM wms.transferencias_almacenes;
IF OBJECT_ID('wms.transferencias_almacenes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.transferencias_almacenes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.transferencias_almacenes', RESEED, 0);
GO
DELETE FROM wms.mermas_destruccion_sanitaria;
IF OBJECT_ID('wms.mermas_destruccion_sanitaria') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.mermas_destruccion_sanitaria'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.mermas_destruccion_sanitaria', RESEED, 0);
GO
DELETE FROM wms.alertas_caducidad_proxima;
IF OBJECT_ID('wms.alertas_caducidad_proxima') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.alertas_caducidad_proxima'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.alertas_caducidad_proxima', RESEED, 0);
GO
DELETE FROM wms.kardex_movimientos;
IF OBJECT_ID('wms.kardex_movimientos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.kardex_movimientos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.kardex_movimientos', RESEED, 0);
GO
DELETE FROM wms.inventario_lotes_ubicacion;
IF OBJECT_ID('wms.inventario_lotes_ubicacion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.inventario_lotes_ubicacion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.inventario_lotes_ubicacion', RESEED, 0);
GO
DELETE FROM wms.lotes_fabricacion_sanitaria;
IF OBJECT_ID('wms.lotes_fabricacion_sanitaria') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.lotes_fabricacion_sanitaria'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.lotes_fabricacion_sanitaria', RESEED, 0);
GO
DELETE FROM wms.tipos_movimiento_inventario;
IF OBJECT_ID('wms.tipos_movimiento_inventario') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.tipos_movimiento_inventario'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.tipos_movimiento_inventario', RESEED, 0);
GO
DELETE FROM wms.pasillos_ubicaciones;
IF OBJECT_ID('wms.pasillos_ubicaciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.pasillos_ubicaciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.pasillos_ubicaciones', RESEED, 0);
GO
DELETE FROM wms.zonas_almacen;
IF OBJECT_ID('wms.zonas_almacen') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.zonas_almacen'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.zonas_almacen', RESEED, 0);
GO
DELETE FROM wms.almacenes_cedis;
IF OBJECT_ID('wms.almacenes_cedis') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('wms.almacenes_cedis'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('wms.almacenes_cedis', RESEED, 0);
GO
DELETE FROM compras.inspecciones_sanitarias_qa;
IF OBJECT_ID('compras.inspecciones_sanitarias_qa') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.inspecciones_sanitarias_qa'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.inspecciones_sanitarias_qa', RESEED, 0);
GO
DELETE FROM compras.recepciones_detalles;
IF OBJECT_ID('compras.recepciones_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.recepciones_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.recepciones_detalles', RESEED, 0);
GO
DELETE FROM compras.recepciones_mercancia;
IF OBJECT_ID('compras.recepciones_mercancia') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.recepciones_mercancia'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.recepciones_mercancia', RESEED, 0);
GO
DELETE FROM compras.ordenes_compra_detalles;
IF OBJECT_ID('compras.ordenes_compra_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.ordenes_compra_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.ordenes_compra_detalles', RESEED, 0);
GO
DELETE FROM compras.ordenes_compra;
IF OBJECT_ID('compras.ordenes_compra') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.ordenes_compra'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.ordenes_compra', RESEED, 0);
GO
DELETE FROM compras.requisiciones_detalles;
IF OBJECT_ID('compras.requisiciones_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.requisiciones_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.requisiciones_detalles', RESEED, 0);
GO
DELETE FROM compras.requisiciones;
IF OBJECT_ID('compras.requisiciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.requisiciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.requisiciones', RESEED, 0);
GO
DELETE FROM compras.proveedor_productos;
IF OBJECT_ID('compras.proveedor_productos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.proveedor_productos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.proveedor_productos', RESEED, 0);
GO
DELETE FROM compras.proveedor_slas;
IF OBJECT_ID('compras.proveedor_slas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.proveedor_slas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.proveedor_slas', RESEED, 0);
GO
DELETE FROM compras.contactos_proveedor;
IF OBJECT_ID('compras.contactos_proveedor') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.contactos_proveedor'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.contactos_proveedor', RESEED, 0);
GO
DELETE FROM compras.proveedores;
IF OBJECT_ID('compras.proveedores') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.proveedores'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.proveedores', RESEED, 0);
GO
DELETE FROM compras.estados_orden_compra;
IF OBJECT_ID('compras.estados_orden_compra') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('compras.estados_orden_compra'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('compras.estados_orden_compra', RESEED, 0);
GO
DELETE FROM promos.ventas_flash_horarias;
IF OBJECT_ID('promos.ventas_flash_horarias') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('promos.ventas_flash_horarias'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('promos.ventas_flash_horarias', RESEED, 0);
GO
DELETE FROM promos.redenciones_cupones;
IF OBJECT_ID('promos.redenciones_cupones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('promos.redenciones_cupones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('promos.redenciones_cupones', RESEED, 0);
GO
DELETE FROM promos.cupones_categorias_excluidas;
IF OBJECT_ID('promos.cupones_categorias_excluidas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('promos.cupones_categorias_excluidas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('promos.cupones_categorias_excluidas', RESEED, 0);
GO
DELETE FROM promos.reglas_elegibilidad_cupon;
IF OBJECT_ID('promos.reglas_elegibilidad_cupon') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('promos.reglas_elegibilidad_cupon'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('promos.reglas_elegibilidad_cupon', RESEED, 0);
GO
DELETE FROM promos.cupones;
IF OBJECT_ID('promos.cupones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('promos.cupones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('promos.cupones', RESEED, 0);
GO
DELETE FROM promos.campanias;
IF OBJECT_ID('promos.campanias') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('promos.campanias'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('promos.campanias', RESEED, 0);
GO
DELETE FROM fiscal.cancelaciones_cfdi;
IF OBJECT_ID('fiscal.cancelaciones_cfdi') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.cancelaciones_cfdi'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.cancelaciones_cfdi', RESEED, 0);
GO
DELETE FROM fiscal.notas_credito;
IF OBJECT_ID('fiscal.notas_credito') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.notas_credito'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.notas_credito', RESEED, 0);
GO
DELETE FROM fiscal.complementos_pago;
IF OBJECT_ID('fiscal.complementos_pago') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.complementos_pago'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.complementos_pago', RESEED, 0);
GO
DELETE FROM fiscal.facturas_partidas;
IF OBJECT_ID('fiscal.facturas_partidas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.facturas_partidas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.facturas_partidas', RESEED, 0);
GO
DELETE FROM fiscal.facturas_cfdi;
IF OBJECT_ID('fiscal.facturas_cfdi') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.facturas_cfdi'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.facturas_cfdi', RESEED, 0);
GO
DELETE FROM fiscal.datos_fiscales_cliente;
IF OBJECT_ID('fiscal.datos_fiscales_cliente') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.datos_fiscales_cliente'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.datos_fiscales_cliente', RESEED, 0);
GO
DELETE FROM fiscal.usos_cfdi;
IF OBJECT_ID('fiscal.usos_cfdi') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.usos_cfdi'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.usos_cfdi', RESEED, 0);
GO
DELETE FROM fiscal.regimenes_sat;
IF OBJECT_ID('fiscal.regimenes_sat') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('fiscal.regimenes_sat'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('fiscal.regimenes_sat', RESEED, 0);
GO
DELETE FROM pagos.reembolsos_transaccion;
IF OBJECT_ID('pagos.reembolsos_transaccion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.reembolsos_transaccion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.reembolsos_transaccion', RESEED, 0);
GO
DELETE FROM pagos.contracargos_chargebacks;
IF OBJECT_ID('pagos.contracargos_chargebacks') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.contracargos_chargebacks'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.contracargos_chargebacks', RESEED, 0);
GO
DELETE FROM pagos.evaluaciones_antifraude;
IF OBJECT_ID('pagos.evaluaciones_antifraude') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.evaluaciones_antifraude'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.evaluaciones_antifraude', RESEED, 0);
GO
DELETE FROM pagos.reglas_antifraude;
IF OBJECT_ID('pagos.reglas_antifraude') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.reglas_antifraude'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.reglas_antifraude', RESEED, 0);
GO
DELETE FROM pagos.redenciones_giftcards;
IF OBJECT_ID('pagos.redenciones_giftcards') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.redenciones_giftcards'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.redenciones_giftcards', RESEED, 0);
GO
DELETE FROM pagos.tarjetas_regalo_giftcards;
IF OBJECT_ID('pagos.tarjetas_regalo_giftcards') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.tarjetas_regalo_giftcards'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.tarjetas_regalo_giftcards', RESEED, 0);
GO
DELETE FROM pagos.movimientos_billetera;
IF OBJECT_ID('pagos.movimientos_billetera') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.movimientos_billetera'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.movimientos_billetera', RESEED, 0);
GO
DELETE FROM pagos.billetera_electronica;
IF OBJECT_ID('pagos.billetera_electronica') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.billetera_electronica'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.billetera_electronica', RESEED, 0);
GO
DELETE FROM pagos.split_multipagos;
IF OBJECT_ID('pagos.split_multipagos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.split_multipagos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.split_multipagos', RESEED, 0);
GO
DELETE FROM pagos.intentos_cobro;
IF OBJECT_ID('pagos.intentos_cobro') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.intentos_cobro'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.intentos_cobro', RESEED, 0);
GO
DELETE FROM pagos.transacciones;
IF OBJECT_ID('pagos.transacciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.transacciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.transacciones', RESEED, 0);
GO
DELETE FROM pagos.metodos_pago;
IF OBJECT_ID('pagos.metodos_pago') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.metodos_pago'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.metodos_pago', RESEED, 0);
GO
DELETE FROM pagos.proveedores_pasarela;
IF OBJECT_ID('pagos.proveedores_pasarela') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('pagos.proveedores_pasarela'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('pagos.proveedores_pasarela', RESEED, 0);
GO
DELETE FROM ventas.comisiones_afiliados;
IF OBJECT_ID('ventas.comisiones_afiliados') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.comisiones_afiliados'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.comisiones_afiliados', RESEED, 0);
GO
DELETE FROM ventas.afiliados_influencers;
IF OBJECT_ID('ventas.afiliados_influencers') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.afiliados_influencers'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.afiliados_influencers', RESEED, 0);
GO
DELETE FROM ventas.reservas_temporales_stock;
IF OBJECT_ID('ventas.reservas_temporales_stock') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.reservas_temporales_stock'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.reservas_temporales_stock', RESEED, 0);
GO
DELETE FROM ventas.ordenes_notas_instrucciones;
IF OBJECT_ID('ventas.ordenes_notas_instrucciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes_notas_instrucciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes_notas_instrucciones', RESEED, 0);
GO
DELETE FROM ventas.ordenes_descuentos;
IF OBJECT_ID('ventas.ordenes_descuentos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes_descuentos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes_descuentos', RESEED, 0);
GO
DELETE FROM ventas.ordenes_impuestos;
IF OBJECT_ID('ventas.ordenes_impuestos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes_impuestos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes_impuestos', RESEED, 0);
GO
DELETE FROM ventas.ordenes_splits_almacen;
IF OBJECT_ID('ventas.ordenes_splits_almacen') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes_splits_almacen'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes_splits_almacen', RESEED, 0);
GO
DELETE FROM ventas.ordenes_historial_estados;
IF OBJECT_ID('ventas.ordenes_historial_estados') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes_historial_estados'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes_historial_estados', RESEED, 0);
GO
DELETE FROM ventas.ordenes_detalles;
IF OBJECT_ID('ventas.ordenes_detalles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes_detalles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes_detalles', RESEED, 0);
GO
DELETE FROM ventas.ordenes;
IF OBJECT_ID('ventas.ordenes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.ordenes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.ordenes', RESEED, 0);
GO
DELETE FROM ventas.regalos_por_compra_gwp;
IF OBJECT_ID('ventas.regalos_por_compra_gwp') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.regalos_por_compra_gwp'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.regalos_por_compra_gwp', RESEED, 0);
GO
DELETE FROM ventas.suscripciones_bitacora_estados;
IF OBJECT_ID('ventas.suscripciones_bitacora_estados') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.suscripciones_bitacora_estados'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.suscripciones_bitacora_estados', RESEED, 0);
GO
DELETE FROM ventas.suscripciones_calendario_entregas;
IF OBJECT_ID('ventas.suscripciones_calendario_entregas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.suscripciones_calendario_entregas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.suscripciones_calendario_entregas', RESEED, 0);
GO
DELETE FROM ventas.suscripciones_items;
IF OBJECT_ID('ventas.suscripciones_items') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.suscripciones_items'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.suscripciones_items', RESEED, 0);
GO
DELETE FROM ventas.suscripciones_cliente;
IF OBJECT_ID('ventas.suscripciones_cliente') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.suscripciones_cliente'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.suscripciones_cliente', RESEED, 0);
GO
DELETE FROM ventas.frecuencias_suscripcion;
IF OBJECT_ID('ventas.frecuencias_suscripcion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.frecuencias_suscripcion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.frecuencias_suscripcion', RESEED, 0);
GO
DELETE FROM ventas.planes_suscripcion;
IF OBJECT_ID('ventas.planes_suscripcion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.planes_suscripcion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.planes_suscripcion', RESEED, 0);
GO
DELETE FROM ventas.carritos_abandonados_seguimiento;
IF OBJECT_ID('ventas.carritos_abandonados_seguimiento') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.carritos_abandonados_seguimiento'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.carritos_abandonados_seguimiento', RESEED, 0);
GO
DELETE FROM ventas.items_carrito;
IF OBJECT_ID('ventas.items_carrito') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.items_carrito'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.items_carrito', RESEED, 0);
GO
DELETE FROM ventas.carritos;
IF OBJECT_ID('ventas.carritos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.carritos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.carritos', RESEED, 0);
GO
DELETE FROM ventas.motivos_cancelacion_orden;
IF OBJECT_ID('ventas.motivos_cancelacion_orden') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.motivos_cancelacion_orden'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.motivos_cancelacion_orden', RESEED, 0);
GO
DELETE FROM ventas.estados_orden;
IF OBJECT_ID('ventas.estados_orden') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.estados_orden'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.estados_orden', RESEED, 0);
GO
DELETE FROM ventas.tipos_descuento;
IF OBJECT_ID('ventas.tipos_descuento') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('ventas.tipos_descuento'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('ventas.tipos_descuento', RESEED, 0);
GO
DELETE FROM comunidad.listas_deseos;
IF OBJECT_ID('comunidad.listas_deseos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('comunidad.listas_deseos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('comunidad.listas_deseos', RESEED, 0);
GO
DELETE FROM comunidad.rutinas_productos;
IF OBJECT_ID('comunidad.rutinas_productos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('comunidad.rutinas_productos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('comunidad.rutinas_productos', RESEED, 0);
GO
DELETE FROM comunidad.rutinas_pasos;
IF OBJECT_ID('comunidad.rutinas_pasos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('comunidad.rutinas_pasos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('comunidad.rutinas_pasos', RESEED, 0);
GO
DELETE FROM comunidad.rutinas_belleza;
IF OBJECT_ID('comunidad.rutinas_belleza') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('comunidad.rutinas_belleza'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('comunidad.rutinas_belleza', RESEED, 0);
GO
DELETE FROM catalogo.historial_precios_base;
IF OBJECT_ID('catalogo.historial_precios_base') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.historial_precios_base'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.historial_precios_base', RESEED, 0);
GO
DELETE FROM catalogo.productos_relacionados;
IF OBJECT_ID('catalogo.productos_relacionados') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.productos_relacionados'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.productos_relacionados', RESEED, 0);
GO
DELETE FROM catalogo.kits_items;
IF OBJECT_ID('catalogo.kits_items') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.kits_items'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.kits_items', RESEED, 0);
GO
DELETE FROM catalogo.kits_sets;
IF OBJECT_ID('catalogo.kits_sets') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.kits_sets'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.kits_sets', RESEED, 0);
GO
DELETE FROM catalogo.multimedia_variantes;
IF OBJECT_ID('catalogo.multimedia_variantes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.multimedia_variantes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.multimedia_variantes', RESEED, 0);
GO
DELETE FROM catalogo.advertencias_contraindicaciones;
IF OBJECT_ID('catalogo.advertencias_contraindicaciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.advertencias_contraindicaciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.advertencias_contraindicaciones', RESEED, 0);
GO
DELETE FROM catalogo.registros_sanitarios_cofepris;
IF OBJECT_ID('catalogo.registros_sanitarios_cofepris') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.registros_sanitarios_cofepris'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.registros_sanitarios_cofepris', RESEED, 0);
GO
DELETE FROM catalogo.formula_ingredientes;
IF OBJECT_ID('catalogo.formula_ingredientes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.formula_ingredientes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.formula_ingredientes', RESEED, 0);
GO
DELETE FROM catalogo.alergenos_ingrediente;
IF OBJECT_ID('catalogo.alergenos_ingrediente') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.alergenos_ingrediente'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.alergenos_ingrediente', RESEED, 0);
GO
DELETE FROM catalogo.ingredientes_inci;
IF OBJECT_ID('catalogo.ingredientes_inci') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.ingredientes_inci'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.ingredientes_inci', RESEED, 0);
GO
DELETE FROM catalogo.tonos_variante;
IF OBJECT_ID('catalogo.tonos_variante') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.tonos_variante'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.tonos_variante', RESEED, 0);
GO
DELETE FROM catalogo.variantes_sku;
IF OBJECT_ID('catalogo.variantes_sku') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.variantes_sku'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.variantes_sku', RESEED, 0);
GO
DELETE FROM catalogo.acabados_maquillaje;
IF OBJECT_ID('catalogo.acabados_maquillaje') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.acabados_maquillaje'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.acabados_maquillaje', RESEED, 0);
GO
DELETE FROM catalogo.subtonos_maquillaje;
IF OBJECT_ID('catalogo.subtonos_maquillaje') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.subtonos_maquillaje'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.subtonos_maquillaje', RESEED, 0);
GO
DELETE FROM catalogo.productos_maestros;
IF OBJECT_ID('catalogo.productos_maestros') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.productos_maestros'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.productos_maestros', RESEED, 0);
GO
DELETE FROM catalogo.certificaciones_sanitarias;
IF OBJECT_ID('catalogo.certificaciones_sanitarias') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.certificaciones_sanitarias'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.certificaciones_sanitarias', RESEED, 0);
GO
DELETE FROM catalogo.tipos_aplicacion;
IF OBJECT_ID('catalogo.tipos_aplicacion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.tipos_aplicacion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.tipos_aplicacion', RESEED, 0);
GO
DELETE FROM catalogo.subcategorias;
IF OBJECT_ID('catalogo.subcategorias') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.subcategorias'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.subcategorias', RESEED, 0);
GO
DELETE FROM catalogo.categorias;
IF OBJECT_ID('catalogo.categorias') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.categorias'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.categorias', RESEED, 0);
GO
DELETE FROM catalogo.laboratorios_fabricantes;
IF OBJECT_ID('catalogo.laboratorios_fabricantes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.laboratorios_fabricantes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.laboratorios_fabricantes', RESEED, 0);
GO
DELETE FROM catalogo.marcas;
IF OBJECT_ID('catalogo.marcas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('catalogo.marcas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('catalogo.marcas', RESEED, 0);
GO
DELETE FROM clientes.metodos_pago_tokenizados;
IF OBJECT_ID('clientes.metodos_pago_tokenizados') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.metodos_pago_tokenizados'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.metodos_pago_tokenizados', RESEED, 0);
GO
DELETE FROM clientes.preferencias_comunicacion;
IF OBJECT_ID('clientes.preferencias_comunicacion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.preferencias_comunicacion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.preferencias_comunicacion', RESEED, 0);
GO
DELETE FROM clientes.solicitudes_arco;
IF OBJECT_ID('clientes.solicitudes_arco') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.solicitudes_arco'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.solicitudes_arco', RESEED, 0);
GO
DELETE FROM clientes.consentimientos_privacidad;
IF OBJECT_ID('clientes.consentimientos_privacidad') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.consentimientos_privacidad'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.consentimientos_privacidad', RESEED, 0);
GO
DELETE FROM clientes.respuestas_evaluacion;
IF OBJECT_ID('clientes.respuestas_evaluacion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.respuestas_evaluacion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.respuestas_evaluacion', RESEED, 0);
GO
DELETE FROM clientes.evaluaciones_diagnostico;
IF OBJECT_ID('clientes.evaluaciones_diagnostico') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.evaluaciones_diagnostico'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.evaluaciones_diagnostico', RESEED, 0);
GO
DELETE FROM clientes.opciones_pregunta;
IF OBJECT_ID('clientes.opciones_pregunta') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.opciones_pregunta'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.opciones_pregunta', RESEED, 0);
GO
DELETE FROM clientes.preguntas_diagnostico;
IF OBJECT_ID('clientes.preguntas_diagnostico') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.preguntas_diagnostico'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.preguntas_diagnostico', RESEED, 0);
GO
DELETE FROM clientes.cuestionarios_diagnostico;
IF OBJECT_ID('clientes.cuestionarios_diagnostico') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.cuestionarios_diagnostico'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.cuestionarios_diagnostico', RESEED, 0);
GO
DELETE FROM clientes.cliente_condiciones;
IF OBJECT_ID('clientes.cliente_condiciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.cliente_condiciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.cliente_condiciones', RESEED, 0);
GO
DELETE FROM clientes.perfil_cutaneo;
IF OBJECT_ID('clientes.perfil_cutaneo') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.perfil_cutaneo'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.perfil_cutaneo', RESEED, 0);
GO
DELETE FROM clientes.direcciones;
IF OBJECT_ID('clientes.direcciones') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.direcciones'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.direcciones', RESEED, 0);
GO
DELETE FROM clientes.clientes;
IF OBJECT_ID('clientes.clientes') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.clientes'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.clientes', RESEED, 0);
GO
DELETE FROM clientes.condiciones_dermatologicas;
IF OBJECT_ID('clientes.condiciones_dermatologicas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.condiciones_dermatologicas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.condiciones_dermatologicas', RESEED, 0);
GO
DELETE FROM clientes.tipos_piel;
IF OBJECT_ID('clientes.tipos_piel') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('clientes.tipos_piel'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('clientes.tipos_piel', RESEED, 0);
GO
DELETE FROM seguridad.dispositivos_confianza;
IF OBJECT_ID('seguridad.dispositivos_confianza') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.dispositivos_confianza'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.dispositivos_confianza', RESEED, 0);
GO
DELETE FROM seguridad.tokens_recuperacion;
IF OBJECT_ID('seguridad.tokens_recuperacion') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.tokens_recuperacion'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.tokens_recuperacion', RESEED, 0);
GO
DELETE FROM seguridad.intentos_login;
IF OBJECT_ID('seguridad.intentos_login') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.intentos_login'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.intentos_login', RESEED, 0);
GO
DELETE FROM seguridad.historial_passwords;
IF OBJECT_ID('seguridad.historial_passwords') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.historial_passwords'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.historial_passwords', RESEED, 0);
GO
DELETE FROM seguridad.sesiones_activas;
IF OBJECT_ID('seguridad.sesiones_activas') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.sesiones_activas'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.sesiones_activas', RESEED, 0);
GO
DELETE FROM seguridad.usuarios_roles;
IF OBJECT_ID('seguridad.usuarios_roles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.usuarios_roles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.usuarios_roles', RESEED, 0);
GO
DELETE FROM seguridad.usuarios;
IF OBJECT_ID('seguridad.usuarios') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.usuarios'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.usuarios', RESEED, 0);
GO
DELETE FROM seguridad.roles_permisos;
IF OBJECT_ID('seguridad.roles_permisos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.roles_permisos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.roles_permisos', RESEED, 0);
GO
DELETE FROM seguridad.permisos;
IF OBJECT_ID('seguridad.permisos') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.permisos'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.permisos', RESEED, 0);
GO
DELETE FROM seguridad.roles;
IF OBJECT_ID('seguridad.roles') IS NOT NULL AND OBJECTPROPERTY(OBJECT_ID('seguridad.roles'), 'TableHasIdentity') = 1
    DBCC CHECKIDENT ('seguridad.roles', RESEED, 0);
GO
PRINT '>>> LIMPIEZA COMPLETADA CON ÉXITO. TABLAS LISTAS PARA EL NUEVO SEED DATA.';
GO