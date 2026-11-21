import json
import re
import os

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

# Build fk rename map per table: table -> {old_col: new_col}
# Wait, tables_meta.json already has the NEW column names (without id_).
# So any FK col in tables_meta.json (say 'cliente') used to be 'id_cliente'.
fk_old_to_new = {}
for t in tables:
    tbl = t['table']
    mapping = {}
    for fk in t['fks']:
        new_c = fk['col']
        old_c = f"id_{new_c}" if not new_c.startswith('id_') else new_c
        if old_c != new_c:
            mapping[old_c] = new_c
    fk_old_to_new[tbl] = mapping

alias_to_table = {
    'c': 'clientes.clientes',
    'cc': 'clientes.cliente_condiciones',
    'cd': 'clientes.condiciones_dermatologicas',
    'o': 'ventas.ordenes',
    'od': 'ventas.ordenes_detalles',
    'vs': 'catalogo.variantes_sku',
    'pm': 'catalogo.productos_maestros',
    'fi': 'catalogo.formula_ingredientes',
    'ai': 'catalogo.alergenos_ingrediente',
    'acp': 'wms.alertas_caducidad_proxima',
    'wls': 'wms.lotes_fabricacion_sanitaria',
    'ilu': 'wms.inventario_lotes_ubicacion',
    'pu': 'wms.pasillos_ubicaciones',
    'za': 'wms.zonas_almacen',
    'ac': 'wms.almacenes_cedis',
    'lf': 'catalogo.laboratorios_fabricantes',
    'f': 'fiscal.facturas_cfdi',
    'tx': 'pagos.transacciones',
    'osa': 'ventas.ordenes_splits_almacen',
    'd': 'envios.despachos_orden',
    'tp': 'envios.transportistas_paqueterias',
    'pb': 'envios.paquetes_bultos',
    'gr': 'envios.guias_rastreo',
    'ea': 'pagos.evaluaciones_antifraude',
    'u': 'seguridad.usuarios',
    'sa': 'seguridad.sesiones_activas',
    'ps': 'ventas.planes_suscripcion', # Note: ps is also compras.proveedor_slas in query 10
    'sc': 'ventas.suscripciones_cliente',
    'fs': 'ventas.frecuencias_suscripcion',
    'sce': 'ventas.suscripciones_calendario_entregas',
    'srma': 'postventa.solicitudes_rma',
    'mr': 'postventa.motivos_devolucion_rma',
    'rmad': 'postventa.rma_detalles',
    'isr': 'postventa.inspeccion_sanitaria_retorno',
    'rf': 'postventa.reportes_farmacovigilancia',
    'mth': 'wms.monitoreo_temperatura_humedad',
    'bcd': 'auditoria.bitacora_cambios_datos',
    'ur': 'seguridad.usuarios_roles',
    'r': 'seguridad.roles',
    'cup': 'promos.cupones',
    'cam': 'promos.campanias',
    'rc': 'promos.redenciones_cupones',
    'pr': 'compras.proveedores',
    'oc': 'compras.ordenes_compra',
    'rm': 'compras.recepciones_mercancia',
    'rd': 'compras.recepciones_detalles',
}

def update_text(text):
    # Replace alias.old_fk -> alias.new_fk
    for alias, tbl in alias_to_table.items():
        if tbl in fk_old_to_new:
            for old_c, new_c in fk_old_to_new[tbl].items():
                text = re.sub(rf'\b{alias}\.{old_c}\b', f'{alias}.{new_c}', text)
    # Also handle ps.id_proveedor in query 10 (compras.proveedor_slas)
    text = re.sub(r'\bps\.id_proveedor\b', 'ps.proveedor', text)
    return text

base = r"C:\Users\halo1\.gemini\antigravity\scratch\proyecto_integrador_ecommerce\01_FBD_Base_de_Datos\04_Consultas_Algebra"
for fname in ["01_consultas_avanzadas_sqlserver.sql", "01_algebra_relacional_y_sql_avanzado.md"]:
    fp = os.path.join(base, fname)
    with open(fp, "r", encoding="utf-8") as f:
        txt = f.read()
    updated = update_text(txt)
    with open(fp, "w", encoding="utf-8") as f:
        f.write(updated)
    print(f"Updated {fname}")
