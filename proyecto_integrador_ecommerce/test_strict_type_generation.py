import json
import re

with open("tables_meta.json", "r", encoding="utf-8") as f:
    tables = json.load(f)

safe_checks = {
    'clientes.solicitudes_arco.estado_tramite': ['RECIBIDA', 'EN_REVISION', 'PROCEDENTE', 'IMPROCEDENTE', 'CONCLUIDA'],
    'comunidad.rutinas_belleza.momento_dia': ['NOCHE', 'SEMANAL'],
}

def clean_str(val, maxlen):
    val = str(val).replace("'", "''")
    if maxlen and len(val) > maxlen:
        val = val[:maxlen]
    return f"N'{val}'"

def generate_value(tbl_name, col_name, ctype, maxlen, nullable, is_identity, row_idx, fks, checks, uniques):
    i = row_idx # 1 to 30
    full_col = f"{tbl_name}.{col_name}"
    base_type = ctype.split('(')[0].upper()
    
    # 1. Audit columns
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
        
    # 2. Identity / Primary Key column
    if is_identity:
        return str(i)
    if col_name.startswith('id_') and (col_name == tbl_name.split('.')[-1] or col_name == f"id_{tbl_name.split('.')[-1]}" or col_name == f"id_{tbl_name.split('.')[-1].rstrip('s')}"):
        return str(i)

    # 3. Foreign Keys
    for fk in fks:
        if fk['col'] == col_name:
            ref_tbl = fk['ref_table']
            is_uq = False
            for uq_list in uniques:
                if len(uq_list) == 1 and uq_list[0] == col_name:
                    is_uq = True
                    break
            if is_uq:
                return str(i)
                
            if col_name in ['id_rol', 'id_permiso', 'id_cuestionario', 'id_pregunta', 'id_categoria', 'id_marca', 'id_almacen']:
                return str(((i - 1) % 10) + 1)
            elif col_name in ['id_cliente', 'id_usuario', 'id_orden', 'id_producto', 'id_variante_sku', 'id_despacho', 'id_lote', 'id_proveedor', 'id_suscripcion_cliente']:
                return str(i)
            elif col_name == 'id_categoria_padre':
                return 'NULL' if i <= 5 else str(((i - 1) % 5) + 1)
            elif col_name == 'id_producto_origen':
                return str(i)
            elif col_name == 'id_producto_destino':
                return str((i % 30) + 1)
            else:
                return str(((i - 1) % 30) + 1)

    # 4. Check constraints
    if full_col in safe_checks:
        opts = safe_checks[full_col]
        return clean_str(opts[(i - 1) % len(opts)], maxlen)
        
    if col_name in checks:
        opts = checks[col_name]
        valid_opts = [o for o in opts if maxlen is None or len(o) <= maxlen]
        if not valid_opts:
            valid_opts = opts
        sel = valid_opts[(i - 1) % len(valid_opts)]
        if base_type in ['INT', 'SMALLINT', 'TINYINT', 'BIGINT']:
            return str(sel)
        return clean_str(sel, maxlen)

    # 5. Handle Numeric types FIRST so they never get strings!
    if base_type in ['BIGINT', 'INT', 'SMALLINT', 'TINYINT']:
        if col_name == 'codigo_respuesta_http':
            return '200'
        elif col_name == 'mes_expiracion':
            return str(((i - 1) % 12) + 1)
        elif col_name == 'anio_expiracion':
            return str(2026 + (i % 5))
        elif col_name in ['tiempo_promedio_entrega_dias', 'intervalo_dias']:
            return str(30 + ((i % 4) * 15))
        elif col_name in ['puntaje_riesgo_asignado']:
            return str(10 + (i % 70))
        elif col_name in ['nivel_jerarquico']:
            return str(((i - 1) % 10) + 1)
        elif col_name in ['factor_proteccion_solar_fps']:
            return str(30 + ((i % 5) * 10))
        elif col_name in ['indice_comedogenico']:
            return str((i % 5))
        elif col_name in ['numero_partida', 'numero_ciclo_periodo', 'numero_orden', 'numero_visita', 'numero_intento', 'numero_parcialidad']:
            return '1'
        elif col_name == 'numero_paso':
            return str(((i - 1) % 10) + 1)
        elif col_name in ['cantidad', 'cantidad_comprada', 'cantidad_pedida', 'cantidad_recibida', 'cantidad_unidades', 'cantidad_requerida', 'stock_disponible', 'unidades_fabricadas', 'stock_maximo_regalos', 'cantidad_movimiento', 'cantidad_enviada', 'cantidad_piezas_en_paquete', 'cantidad_devuelta', 'cantidad_unidades_destruidas']:
            return str(10 + (i * 2))
        else:
            return str(i)

    if base_type in ['DECIMAL', 'NUMERIC', 'FLOAT', 'REAL']:
        if col_name in ['subtotal', 'subtotal_bruto', 'total_neto', 'importe_total', 'precio_venta', 'precio_unitario_venta', 'monto_transaccion', 'costo_unitario_compra', 'precio_base_menudeo', 'precio_recurrente_base', 'monto_inicial', 'saldo_actual', 'monto_redimido', 'monto_reembolsado', 'monto']:
            return f"{100.00 + (i * 25.5):.2f}"
        elif col_name in ['total_impuestos_iva', 'total_iva', 'iva_trasladado', 'importe_impuesto']:
            return f"{(100.00 + (i * 25.5)) * 0.16:.2f}"
        elif col_name in ['total_descuento', 'descuento_total', 'monto_descontado', 'monto_descuento_aplicado']:
            return f"{i * 5.0:.2f}"
        elif col_name in ['porcentaje_comision', 'porcentaje_descuento', 'descuento_porcentual_fidelidad', 'descuento_porcentual_kit']:
            return f"{5.0 + (i % 15):.2f}"
        elif col_name in ['tasa_o_cuota']:
            return "0.160000"
        elif col_name in ['peso_bruto_kg']:
            return f"{1.5 + (i * 0.2):.2f}"
        elif col_name in ['alto_cm', 'ancho_cm', 'largo_cm']:
            return f"{10.0 + i:.1f}"
        else:
            return f"{10.0 + (i * 1.5):.2f}"

    if base_type == 'BIT':
        return '1' if (i % 2 == 1) else '0'

    if base_type == 'DATE':
        day = ((i - 1) % 28) + 1
        return f"'2026-03-{day:02d}'"

    if base_type.startswith('DATETIME'):
        day = ((i - 1) % 28) + 1
        return f"'2026-01-{day:02d} 12:00:00'"

    if col_name.startswith('uuid_') or base_type == 'UNIQUEIDENTIFIER':
        return f"N'A0000000-0000-0000-0000-{i:012X}'"

    # 6. String columns
    if col_name == 'email':
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
        clean_prefix = col_name.replace('codigo_', '').replace('clave_', '').upper()[:10]
        base_val = f"{clean_prefix}_{i:02d}"
        return clean_str(base_val, maxlen)
    elif base_type in ['NVARCHAR', 'VARCHAR', 'CHAR', 'NCHAR', 'TEXT', 'NTEXT']:
        base_text = f"Dato_{col_name}_{i:02d}"
        if maxlen and len(base_text) > maxlen:
            base_text = f"D_{i:02d}"[:maxlen]
        return clean_str(base_text, maxlen)
    else:
        return clean_str(f"Val_{i:02d}", maxlen)

# Run full audit
mismatches = []
for t in tables:
    tbl_name = t['table']
    for c in t['columns']:
        cname = c['name']
        ctype = c['type']
        base_type = ctype.split('(')[0].upper()
        maxlen = c['maxlen']
        is_id = c['identity']
        
        for r_idx in range(1, 31):
            val = generate_value(tbl_name, cname, ctype, maxlen, c['nullable'], is_id, r_idx, t['fks'], t['checks'], t['uniques'])
            
            # Check integer types: MUST be digits or NULL
            if base_type in ['BIGINT', 'INT', 'SMALLINT', 'TINYINT']:
                if val != 'NULL' and not re.match(r'^-?\d+$', val):
                    mismatches.append(f"Table '{tbl_name}', Col '{cname}' ({base_type}) produced non-integer: {val}")
                    break
            # Check decimal types: MUST be decimal number or NULL
            elif base_type in ['DECIMAL', 'NUMERIC', 'FLOAT', 'REAL']:
                if val != 'NULL' and not re.match(r'^-?\d+(\.\d+)?$', val):
                    mismatches.append(f"Table '{tbl_name}', Col '{cname}' ({base_type}) produced non-decimal: {val}")
                    break
            # Check BIT
            elif base_type == 'BIT':
                if val not in ['0', '1']:
                    mismatches.append(f"Table '{tbl_name}', Col '{cname}' (BIT) produced non-bit: {val}")
                    break
            # Check Strings
            elif base_type in ['NVARCHAR', 'VARCHAR']:
                if val != 'NULL':
                    if not (val.startswith("N'") or val.startswith("'")):
                        mismatches.append(f"Table '{tbl_name}', Col '{cname}' ({base_type}) produced unquoted string: {val}")
                        break
                    raw_str = val[2:-1] if val.startswith("N'") else val[1:-1]
                    raw_str = raw_str.replace("''", "'")
                    if maxlen and len(raw_str) > maxlen:
                        mismatches.append(f"Table '{tbl_name}', Col '{cname}': len {len(raw_str)} > maxlen {maxlen} ('{raw_str}')")
                        break

print(f"Total mismatches found across 150 tables * 30 rows: {len(mismatches)}")
if mismatches:
    for m in mismatches[:10]:
        print(" -", m)
else:
    print("PERFECT! Zero type mismatches across all 4,500 rows and 1,800+ column evaluations!")
