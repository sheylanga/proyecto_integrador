import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

# Helper dictionaries and sets
safe_checks = {
    'clientes.solicitudes_arco.estado_tramite': ['RECIBIDA', 'EN_REVISION', 'PROCEDENTE', 'IMPROCEDENTE', 'CONCLUIDA'],
    'comunidad.rutinas_belleza.momento_dia': ['NOCHE', 'SEMANAL'],
}

def clean_str(val, maxlen):
    val = str(val).replace("'", "''")
    if maxlen and len(val) > maxlen:
        val = val[:maxlen]
    return f"N'{val}'"

def generate_value(tbl_name, col_name, ctype, maxlen, nullable, row_idx, fks, checks, uniques):
    i = row_idx # 1 to 30
    full_col = f"{tbl_name}.{col_name}"
    
    # Check if audit column
    if col_name == 'activo':
        return '1' if i < 30 else '0'
    elif col_name == 'fecha_creacion':
        return "'2026-01-15 09:00:00'" if i < 30 else "'2025-01-01 08:00:00'"
    elif col_name == 'creado_por':
        return '1'
    elif col_name == 'fecha_modificacion':
        return 'NULL' if i < 30 else "'2026-03-01 10:00:00'"
    elif col_name == 'modificado_por':
        return 'NULL' if i < 30 else '1'
    elif col_name == 'fecha_baja':
        return 'NULL' if i < 30 else "'2026-03-01 10:00:00'"
    elif col_name == 'eliminado_por':
        return 'NULL' if i < 30 else '1'
        
    # Check if primary key
    if col_name.startswith('id_') and col_name == tbl_name.split('.')[-1] or col_name == f"id_{tbl_name.split('.')[-1]}":
        return str(i)
        
    # Check if specific CHECK constraint on this column
    if full_col in safe_checks:
        opts = safe_checks[full_col]
        return clean_str(opts[(i - 1) % len(opts)], maxlen)
        
    if col_name in checks:
        opts = checks[col_name]
        # Filter options that fit into maxlen if maxlen exists
        valid_opts = [o for o in opts if maxlen is None or len(o) <= maxlen]
        if not valid_opts:
            valid_opts = opts
        sel = valid_opts[(i - 1) % len(valid_opts)]
        if ctype in ['INT', 'SMALLINT', 'TINYINT', 'BIGINT']:
            return str(sel)
        return clean_str(sel, maxlen)
        
    # Check if Foreign Key
    for fk in fks:
        if fk['col'] == col_name:
            ref_tbl = fk['ref_table']
            # Is this column unique?
            is_uq = False
            for uq_list in uniques:
                if len(uq_list) == 1 and uq_list[0] == col_name:
                    is_uq = True
                    break
            if is_uq:
                return str(i)
                
            # If composite unique
            # E.g. (id_rol, id_permiso)
            if col_name in ['id_rol', 'id_permiso', 'id_cuestionario', 'id_pregunta', 'id_categoria', 'id_marca', 'id_almacen']:
                return str(((i - 1) % 10) + 1)
            elif col_name in ['id_cliente', 'id_usuario', 'id_orden', 'id_producto', 'id_variante_sku', 'id_despacho', 'id_lote', 'id_proveedor', 'id_suscripcion_cliente']:
                return str(i)
            elif col_name == 'id_categoria_padre':
                # Self-ref
                return 'NULL' if i <= 5 else str(((i - 1) % 5) + 1)
            elif col_name == 'id_producto_origen':
                return str(i)
            elif col_name == 'id_producto_destino':
                return str((i % 30) + 1)
            else:
                return str(((i - 1) % 30) + 1)

    # Specific well-known column names:
    if col_name.startswith('uuid_'):
        return f"N'A0000000-0000-0000-0000-{i:012X}'"
    elif col_name == 'email':
        return clean_str(f"usuario_{i:03d}@ecommerce-derma.mx", maxlen)
    elif col_name in ['password_hash', 'salt_criptografico', 'token_hash', 'token_sesion_hash', 'hash_sha256']:
        hash_val = f"$argon2id$v=19$m=65536,t=3,p=4$c2FsdF9zZWd1cmFfeHh4{i:04d}$hash_token_seguro_{i:04d}"
        return clean_str(hash_val, maxlen)
    elif col_name in ['rfc', 'rfc_curp', 'rfc_proveedor']:
        return clean_str(f"DERM{i:02d}0115XX{i:02d}", maxlen)
    elif col_name == 'curp':
        return clean_str(f"DERM{i:02d}0115HCLRR{i:03d}", maxlen)
    elif col_name in ['telefono', 'telefono_movil', 'telefono_fijo']:
        return clean_str(f"8661{i:02d}4455", maxlen)
    elif col_name in ['codigo_postal', 'cp_fiscal']:
        return clean_str(f"257{i:02d}", maxlen)
    elif col_name in ['color_hexadecimal']:
        return clean_str(f"#{(i*8):02X}A5D0", maxlen)
    elif col_name in ['folio_solicitud', 'folio_suscripcion', 'folio_orden', 'folio_despacho', 'folio_recepcion', 'folio_transaccion', 'folio_rma', 'folio_ticket', 'folio_requisicion', 'folio_orden_compra', 'folio_auditoria', 'folio_cofepris_ram']:
        prefix = col_name.replace('folio_', '').upper()[:5]
        return clean_str(f"FOL-{prefix}-{i:04d}", maxlen)
    elif col_name in ['sku_codigo', 'codigo_bulto', 'codigo_barras_ean13', 'numero_guia_tracking', 'numero_lote_fabricante']:
        return clean_str(f"SKU-{i:05d}-EAN{i:02d}", maxlen)
    elif col_name.startswith('codigo_') or col_name.startswith('clave_'):
        clean_prefix = col_name.replace('codigo_', '').replace('clave_', '').upper()
        # Ensure under maxlen
        base_val = f"{clean_prefix}_{i:02d}"
        return clean_str(base_val, maxlen)
    elif col_name in ['subtotal', 'subtotal_bruto', 'total_neto', 'importe_total', 'precio_venta', 'precio_unitario_venta', 'monto_transaccion', 'costo_unitario_compra', 'precio_base_menudeo', 'precio_recurrente_base']:
        return f"{100.00 + (i * 25.5):.2f}"
    elif col_name in ['total_impuestos_iva', 'total_iva', 'iva_trasladado', 'importe_impuesto']:
        return f"{(100.00 + (i * 25.5)) * 0.16:.2f}"
    elif col_name in ['total_descuento', 'descuento_total', 'monto_descontado', 'monto_descuento_aplicado']:
        return f"{i * 5.0:.2f}"
    elif col_name in ['porcentaje_comision', 'porcentaje_descuento', 'descuento_porcentual_fidelidad', 'descuento_porcentual_kit']:
        return f"{5.0 + (i % 15):.2f}"
    elif col_name in ['tasa_o_cuota']:
        return "0.160000"
    elif col_name in ['factor_proteccion_solar_fps']:
        return str(30 + ((i % 5) * 10))
    elif col_name in ['indice_comedogenico']:
        return str((i % 5))
    elif col_name in ['mes_expiracion']:
        return str(((i - 1) % 12) + 1)
    elif col_name in ['anio_expiracion']:
        return str(2026 + (i % 5))
    elif col_name in ['tiempo_promedio_entrega_dias', 'intervalo_dias']:
        return str(30 + ((i % 4) * 15))
    elif col_name in ['puntaje_riesgo_asignado']:
        return str(10 + (i % 70))
    elif col_name in ['nivel_jerarquico']:
        return str(((i - 1) % 10) + 1)
    elif col_name in ['numero_partida', 'numero_ciclo_periodo', 'numero_paso', 'numero_orden', 'numero_visita']:
        return str(1 if col_name != 'numero_paso' else ((i - 1) % 10) + 1)
    elif col_name in ['cantidad', 'cantidad_comprada', 'cantidad_pedida', 'cantidad_recibida', 'cantidad_unidades', 'cantidad_requerida', 'stock_disponible', 'unidades_fabricadas']:
        return str(10 + (i * 2))

    # General types:
    if ctype == 'BIT':
        return '1' if (i % 2 == 1) else '0'
    elif ctype == 'DATE':
        day = ((i - 1) % 28) + 1
        return f"'2026-03-{day:02d}'"
    elif ctype.startswith('DATETIME2'):
        day = ((i - 1) % 28) + 1
        return f"'2026-01-{day:02d} 12:00:00'"
    elif ctype in ['INT', 'SMALLINT', 'TINYINT']:
        return str(i)
    elif ctype.startswith('DECIMAL'):
        return f"{10.0 + (i * 1.5):.2f}"
    elif ctype.startswith('NVARCHAR') or ctype.startswith('VARCHAR'):
        base_text = f"Dato_{col_name}_{i:02d}"
        if maxlen and len(base_text) > maxlen:
            base_text = f"D_{i:02d}"[:maxlen]
        return clean_str(base_text, maxlen)
    else:
        return clean_str(f"Val_{i:02d}", maxlen)

print("Generator function ready.")
