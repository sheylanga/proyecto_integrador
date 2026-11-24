# MODELADO CONCEPTUAL (E-R EXTENDIDO) Y TRANSFORMACIÓN AL ESQUEMA RELACIONAL
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD — AEF-1031) — CRITERIO 2.1 (20%)
**Sistema:** DERMA-ECOM (E-Commerce de Salud, Belleza y Maquillaje con Trazabilidad FEFO y Cadena de Frío)  
**Magnitud verificada:** 150 Entidades / Tablas · 14 Esquemas Lógicos · 183 Llaves Foráneas · 0 Tablas Huérfanas · 1 Componente Conexo

---

## 1. MODELO CONCEPTUAL: DIAGRAMA ENTIDAD-RELACIÓN EXTENDIDO (E-R EXTENDIDO)

El diseño conceptual de **DERMA-ECOM** se formuló aplicando la notación **Entidad-Relación Extendida (EER)** de Elmasri & Navathe, incorporando jerarquías de especialización/generalización, entidades fuertes y débiles, atributos compuestos, multivaluados y derivados, así como cardinalidades mínimas y máximas `(min, max)`.

> [!IMPORTANT]
> **Acceso a los Diagramas Visuales Globales (Separación rigurosa Conceptual Chen vs. Relacional Crow's Foot):**
> 1. **Modelo Conceptual — Diagrama E-R Extendido (Notación clásica Chen / Elmasri & Navathe):**
>    - Editable `.drawio`: `05_diagrama_EER_conceptual_CHEN_elmasri.drawio`
>    - Visor Interactivo HTML/SVG (con leyenda y exportación SVG): `06_visor_interactivo_EER_CHEN_elmasri.html`  
>    *(Rectángulos = Entidades fuertes · Rectángulos dobles = Entidades débiles · Rombos / Rombos dobles = Relaciones y Relaciones identificadoras · Óvalos subrayados/compuestos/dobles/punteados = Claves, Compuestos, Multivaluados y Derivados · Círculos `d`/`o` y líneas simples/dobles = Jerarquías EER).*
> 2. **Modelo Lógico — Esquema Relacional Global (Notación Crow's Foot — 150 Tablas y 183 FKs):**
>    - Editable `.drawio`: `03_diagrama_ER_relacional_GLOBAL_150_tablas.drawio`
>    - Visor Interactivo HTML/SVG (buscador, filtros por submódulo/esquema, inspector de columnas y exportación SVG): `04_visor_interactivo_ER_GLOBAL_150_tablas.html`

### 1.0 Vista Global de Interconexión entre los 14 Esquemas y 3 Submódulos (150 Tablas · 183 FKs · 1 Componente Conexo)

```mermaid
flowchart LR
    subgraph SM1["SUBMÓDULO 1 (001–050) · José Luis Luna García"]
        S_SEG["seguridad\n(10 tablas: IAM/RBAC/Hash)"]
        S_CLI["clientes\n(15 tablas: Perfil/ARCO/Salud)"]
        S_CAT["catalogo\n(21 tablas: SKU/INCI/COFEPRIS)"]
        S_COM["comunidad\n(4 tablas: Rutinas/Wishlist)"]
        S_SEG --> S_CLI
        S_CLI --> S_COM
        S_CAT --> S_COM
    end

    subgraph SM2["SUBMÓDULO 2 (051–100) · Sheyla Estefanía Moncada Guel"]
        S_VEN["ventas\n(23 tablas: Carritos/Órdenes/BeautyBox)"]
        S_PAG["pagos\n(13 tablas: Cobros/Antifraude/Wallet)"]
        S_FIS["fiscal\n(8 tablas: SAT CFDI 4.0)"]
        S_PRO["promos\n(6 tablas: Campañas/Cupones/Flash)"]
        S_VEN --> S_PAG
        S_VEN --> S_FIS
        S_PAG --> S_FIS
        S_PRO --> S_VEN
    end

    subgraph SM3["SUBMÓDULO 3 (101–150) · Eduardo Salazar Martínez"]
        S_CMP["compras\n(12 tablas: Proveedores/OC/QA)"]
        S_WMS["wms\n(14 tablas: CEDIS/FEFO/IoT Frío)"]
        S_ENV["envios\n(12 tablas: Despachos/Tracking/Pickup)"]
        S_PVT["postventa\n(7 tablas: RMA/Farmacovigilancia)"]
        S_AUD["auditoria\n(3 tablas: Forense/JSONB)"]
        S_SIS["sistema\n(2 tablas: Config/Notificaciones)"]
        S_CMP --> S_WMS
        S_WMS --> S_ENV
        S_WMS --> S_PVT
    end

    S_CLI ==> S_VEN
    S_CAT ==> S_VEN
    S_CAT ==> S_PRO
    S_CAT ==> S_CMP
    S_CAT ==> S_WMS
    S_VEN ==> S_ENV
    S_VEN ==> S_PVT
    S_CLI ==> S_PVT
    S_SEG ==> S_AUD
    S_SEG ==> S_SIS
```

### 1.1 Jerarquías de Especialización / Generalización (EER)

Para evitar columnas nulas masivas, redundancias y anomalías de actualización, el modelo conceptual define **cuatro jerarquías formales de especialización/generalización**:

```mermaid
flowchart TD
    subgraph J1["Jerarquía 1: Actores del Sistema (Solapada, Parcial: {o, parcial})"]
        U["USUARIO\n(id_usuario, email, password_hash, mfa)"]
        O1(("o"))
        U --- O1
        O1 --> CLI["CLIENTE\n(perfil cutáneo, RFC, CURP, direcciones)"]
        O1 --> AFI["AFILIADO_INFLUENCER\n(codigo_referido, porcentaje_comision, clabe)"]
        O1 --> OPE["OPERADOR_INTERNO (vía RBAC)\n(Admin, Dermoconsultor, WMS, Facturación, Auditor)"]
    end

    subgraph J2["Jerarquía 2: Comprobantes Fiscales SAT CFDI 4.0 (Disjunta, Total: {d, total})"]
        CFDI["COMPROBANTE_FISCAL_SAT\n(uuid_sat, fecha_timbrado, monto, estado)"]
        D2(("d"))
        CFDI === D2
        D2 --> FAC["FACTURA_CFDI (Ingreso)\n(serie_factura, folio_factura, sellos)"]
        D2 --> REP["COMPLEMENTO_PAGO (REP)\n(numero_parcialidad, saldo_insoluto)"]
        D2 --> NCR["NOTA_CREDITO (Egreso)\n(motivo_devolucion_sat, total_acreditado)"]
    end

    subgraph J3["Jerarquía 3: Instrumentos de Pago (Disjunta, Parcial: {d, parcial})"]
        PAG["INSTRUMENTO_PAGO\n(cliente, activo, auditoría)"]
        D3(("d"))
        PAG --- D3
        D3 --> TOK["METODO_PAGO_TOKENIZADO\n(token_pci_dss, ultimos_4_digitos)"]
        D3 --> BIL["BILLETERA_ELECTRONICA\n(saldo_disponible, saldo_bloqueado)"]
        D3 --> GFT["TARJETA_REGALO_GIFTCARD\n(codigo_cifrado, saldo_actual)"]
    end

    subgraph J4["Jerarquía 4: Registros de Auditoría Forense (Disjunta, Total: {d, total})"]
        AUD["EVENTO_FORENSE\n(creado_por, fecha_creacion, activo)"]
        D4(("d"))
        AUD === D4
        D4 --> BSG["BITACORA_SEGURIDAD_GLOBAL\n(firma_integridad_hash, ip, modulo)"]
        D4 --> BCD["BITACORA_CAMBIOS_DATOS\n(tipo_operacion, valores_json)"]
        D4 --> ILG["INTENTOS_LOGIN\n(resultado, ip, user_agent)"]
        D4 --> KDX["KARDEX_MOVIMIENTOS\n(saldo_anterior, saldo_resultante)"]
    end
```

### 1.2 Clasificación Formal de Atributos Especiales y Entidades Débiles

| Constructo EER | Elementos del Dominio DERMA-ECOM | Regla de Mapeo al Modelo Relacional |
| :--- | :--- | :--- |
| **Atributos Compuestos** | • `NombrePersona(nombres, primer_apellido, segundo_apellido)`<br>• `Domicilio(calle, num_ext, num_int, colonia, cp, ciudad, estado)`<br>• `DimensionesPaquete(alto_cm, ancho_cm, largo_cm)`<br>• `AuditoriaSoftDelete(activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)` | Se descomponen en columnas atómicas independientes (cumplimiento estricto de 1FN) dentro de `clientes.clientes`, `clientes.direcciones`, `envios.paquetes_bultos` y las 150 tablas. |
| **Atributos Multivaluados** | • Roles asignados a un usuario<br>• Condiciones dermatológicas de un cliente<br>• Ingredientes INCI y alérgenos de un producto<br>• Imágenes/swatches de una variante SKU<br>• Direcciones de entrega de un cliente | Se extraen a relaciones separadas con FK a la entidad propietaria: `seguridad.usuarios_roles`, `clientes.cliente_condiciones`, `catalogo.formula_ingredientes`, `catalogo.multimedia_variantes`, `clientes.direcciones`. |
| **Atributos Derivados** | • `peso_volumetrico_kg = (alto_cm * ancho_cm * largo_cm) / 5000.0`<br>• `tiempo_transito_horas = fecha_entrega_real - fecha_recoleccion_paqueteria`<br>• `tasa_rechazo_qa = rechazos / inspecciones * 100` | `peso_volumetrico_kg` se materializa como columna calculada (`PERSISTED` en SQL Server / `GENERATED ALWAYS AS ... STORED` en PostgreSQL); los indicadores analíticos se calculan dinámicamente en consultas SQL. |
| **Entidades Débiles** *(dependencia de existencia)* | `ordenes_detalles`, `ordenes_impuestos`, `ordenes_descuentos`, `ordenes_splits_almacen`, `ordenes_notas_instrucciones`, `items_carrito`, `respuestas_evaluacion`, `rutinas_pasos`, `facturas_partidas`, `requisiciones_detalles`, `ordenes_compra_detalles`, `recepciones_detalles`, `transferencias_detalles`, `conteos_ciclicos_detalles`, `paquetes_bultos`, `rma_detalles`, `tickets_mensajes` (17 entidades débiles) | Cada entidad débil incorpora la FK obligatoria (`NOT NULL`) de su entidad propietaria fuerte junto con un discriminador secuencial (`numero_partida`, `numero_paso`, `codigo_bulto`) y llave subrogada `BIGINT IDENTITY` para uniformidad de integridad y auditoría. |

---

### 1.3 Submódulo 1: Identidad, Perfil Clínico-Cutáneo, Catálogo y COFEPRIS (Tablas 001–050)

#### 1.3.1 Diagrama Entidad-Relación (E-R) — Submódulo 1 (Tablas 001–050)

```mermaid
erDiagram
    USUARIOS ||--o{ USUARIOS_ROLES : "posee (1,N)"
    ROLES ||--o{ USUARIOS_ROLES : "asigna (0,N)"
    ROLES ||--o{ ROLES_PERMISOS : "autoriza (0,N)"
    PERMISOS ||--o{ ROLES_PERMISOS : "concede (0,N)"
    USUARIOS ||--o{ SESIONES_ACTIVAS : "mantiene (0,N)"
    USUARIOS ||--o{ HISTORIAL_PASSWORDS : "registra (0,N)"
    USUARIOS ||--o{ INTENTOS_LOGIN : "genera (0,N)"
    USUARIOS ||--o{ TOKENS_RECUPERACION : "solicita (0,N)"
    USUARIOS ||--o{ DISPOSITIVOS_CONFIANZA : "autoriza (0,N)"
    USUARIOS ||--o| CLIENTES : "especializa (0,1)"

    CLIENTES ||--o{ DIRECCIONES : "registra (1,N)"
    CLIENTES ||--o| PERFIL_CUTANEO : "define (0,1)"
    TIPOS_PIEL ||--o{ PERFIL_CUTANEO : "clasifica (0,N)"
    CLIENTES ||--o{ CLIENTE_CONDICIONES : "padece (0,N)"
    CONDICIONES_DERMATOLOGICAS ||--o{ CLIENTE_CONDICIONES : "diagnostica (0,N)"
    CLIENTES ||--o{ EVALUACIONES_DIAGNOSTICO : "responde (0,N)"
    CUESTIONARIOS_DIAGNOSTICO ||--|{ PREGUNTAS_DIAGNOSTICO : "contiene (1,N)"
    PREGUNTAS_DIAGNOSTICO ||--|{ OPCIONES_PREGUNTA : "ofrece (1,N)"
    EVALUACIONES_DIAGNOSTICO ||--|{ RESPUESTAS_EVALUACION : "detalla (1,N)"
    CLIENTES ||--o{ CONSENTIMIENTOS_PRIVACIDAD : "otorga (1,N)"
    CLIENTES ||--o{ SOLICITUDES_ARCO : "tramita (0,N)"
    CLIENTES ||--o| PREFERENCIAS_COMUNICACION : "configura (0,1)"
    CLIENTES ||--o{ METODOS_PAGO_TOKENIZADOS : "guarda (0,N)"

    MARCAS ||--o{ PRODUCTOS_MAESTROS : "fabrica (1,N)"
    LABORATORIOS_FABRICANTES ||--o{ PRODUCTOS_MAESTROS : "formula (1,N)"
    CATEGORIAS ||--|{ SUBCATEGORIAS : "agrupa (1,N)"
    SUBCATEGORIAS ||--o{ PRODUCTOS_MAESTROS : "clasifica (1,N)"
    TIPOS_APLICACION ||--o{ PRODUCTOS_MAESTROS : "define_zona (0,N)"
    CERTIFICACIONES_SANITARIAS ||--o{ PRODUCTOS_MAESTROS : "certifica (0,N)"
    PRODUCTOS_MAESTROS ||--|{ VARIANTES_SKU : "presenta (1,N)"
    PRODUCTOS_MAESTROS ||--o{ PRODUCTOS_RELACIONADOS : "vincula_cross_sell (0,N)"
    PRODUCTOS_MAESTROS ||--|{ FORMULA_INGREDIENTES : "compone (1,N)"
    INGREDIENTES_INCI ||--o{ FORMULA_INGREDIENTES : "integra (0,N)"
    INGREDIENTES_INCI ||--o{ ALERGENOS_INGREDIENTE : "alerta (0,N)"
    PRODUCTOS_MAESTROS ||--o{ REGISTROS_SANITARIOS_COFEPRIS : "avala (1,N)"
    PRODUCTOS_MAESTROS ||--o{ ADVERTENCIAS_CONTRAINDICACIONES : "advierte (0,N)"
    VARIANTES_SKU ||--o{ TONOS_VARIANTE : "matiza (0,N)"
    SUBTONOS_MAQUILLAJE ||--o{ TONOS_VARIANTE : "define_subtono (0,N)"
    ACABADOS_MAQUILLAJE ||--o{ TONOS_VARIANTE : "define_acabado (0,N)"
    VARIANTES_SKU ||--o{ MULTIMEDIA_VARIANTES : "ilustra (0,N)"
    VARIANTES_SKU ||--o{ HISTORIAL_PRECIOS_BASE : "registra (1,N)"
    KITS_SETS ||--|{ KITS_ITEMS : "incluye (1,N)"
    VARIANTES_SKU ||--o{ KITS_ITEMS : "pertenece (0,N)"
    CLIENTES ||--o{ RUTINAS_BELLEZA : "crea (0,N)"
    RUTINAS_BELLEZA ||--|{ RUTINAS_PASOS : "ordena (1,N)"
    RUTINAS_PASOS ||--o{ RUTINAS_PRODUCTOS : "recomienda (0,N)"
    CLIENTES ||--o{ LISTAS_DESEOS : "guarda_favorito (0,N)"
    VARIANTES_SKU ||--o{ LISTAS_DESEOS : "deseado_en (0,N)"
```

#### 1.3.2 Modelo Relacional (Esquema Lógico con PK, FK, UK y Tipos de Datos) — Submódulo 1 (Tablas 001–050)

> [!TIP]
> **Modelo Relacional del Submódulo 1 (José Luis Luna García):** exactamente **50 tablas relacionales propias** (Tablas 001–050) con llaves primarias (`PK`), llaves foráneas (`FK`), llaves candidatas únicas (`UK`) y tipos de datos sincronizados al 100% con el DDL de SQL Server / PostgreSQL. Todas sus **53 llaves foráneas** son intra-módulo (**0 nodos puente externos**). *(Las 7 columnas estándar de auditoría/Soft Delete se omiten en las cajas visuales salvo cuando son `FK`, y se indican como `[+7 cols auditoría]` en el esquema formal).*

```mermaid
erDiagram
    seguridad__roles {
        BIGINT id_rol PK
        NVARCHAR_30 codigo_rol UK
        NVARCHAR_80 nombre_rol
        NVARCHAR_255 descripcion
        INT nivel_jerarquico
    }
    seguridad__permisos {
        BIGINT id_permiso PK
        NVARCHAR_60 clave_permiso UK
        NVARCHAR_50 modulo_sistema
        NVARCHAR_30 accion
        NVARCHAR_255 descripcion
    }
    seguridad__roles_permisos {
        BIGINT id_rol_permiso PK
        BIGINT rol FK "UQ, FK -> seguridad.roles"
        BIGINT permiso FK "UQ, FK -> seguridad.permisos"
        BIT permitir
    }
    seguridad__usuarios {
        BIGINT id_usuario PK
        UNIQUEIDENTIFIER uuid_usuario UK
        NVARCHAR_150 email UK
        NVARCHAR_255 password_hash
        NVARCHAR_128 password_salt
        NVARCHAR_20 telefono_movil
    }
    seguridad__usuarios_roles {
        BIGINT id_usuario_rol PK
        BIGINT usuario FK "UQ, FK -> seguridad.usuarios"
        BIGINT rol FK "UQ, FK -> seguridad.roles"
        DATETIME2_3 fecha_asignacion
    }
    seguridad__sesiones_activas {
        BIGINT id_sesion PK
        BIGINT usuario FK "FK -> seguridad.usuarios"
        NVARCHAR_128 token_sesion_hash UK
        NVARCHAR_45 direccion_ip
        NVARCHAR_350 user_agent
        DATETIME2_3 fecha_inicio
    }
    seguridad__historial_passwords {
        BIGINT id_historial_pwd PK
        BIGINT usuario FK "FK -> seguridad.usuarios"
        NVARCHAR_255 password_hash
        NVARCHAR_128 password_salt
        NVARCHAR_30 algoritmo_hashing
    }
    seguridad__intentos_login {
        BIGINT id_intento_login PK
        NVARCHAR_150 email_ingresado
        BIGINT usuario FK "FK -> seguridad.usuarios"
        NVARCHAR_45 direccion_ip
        NVARCHAR_60 pais_origen_ip
    }
    seguridad__tokens_recuperacion {
        BIGINT id_token_recuperacion PK
        BIGINT usuario FK "FK -> seguridad.usuarios"
        NVARCHAR_128 token_hash UK
        NVARCHAR_30 tipo_token
        DATETIME2_3 fecha_expiracion
        BIT utilizado
    }
    seguridad__dispositivos_confianza {
        BIGINT id_dispositivo PK
        BIGINT usuario FK "UQ, FK -> seguridad.usuarios"
        NVARCHAR_128 fingerprint_dispositivo UK
        NVARCHAR_100 nombre_dispositivo
        NVARCHAR_60 sistema_operativo
        NVARCHAR_60 navegador
    }
    clientes__tipos_piel {
        BIGINT id_tipo_piel PK
        NVARCHAR_20 codigo_piel UK
        NVARCHAR_50 nombre
        NVARCHAR_255 descripcion_clinica
    }
    clientes__condiciones_dermatologicas {
        BIGINT id_condicion_dermatologica PK
        NVARCHAR_30 codigo_condicion UK
        NVARCHAR_80 nombre_condicion
        NVARCHAR_255 descripcion_patologica
        NVARCHAR_20 nivel_severidad_tipica
    }
    clientes__clientes {
        BIGINT id_cliente PK
        BIGINT usuario FK "UQ, FK -> seguridad.usuarios"
        NVARCHAR_80 nombres
        NVARCHAR_60 primer_apellido
        NVARCHAR_60 segundo_apellido
    }
    clientes__direcciones {
        BIGINT id_direccion PK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_50 alias_direccion
        NVARCHAR_120 calle
        NVARCHAR_20 numero_exterior
    }
    clientes__perfil_cutaneo {
        BIGINT id_perfil_cutaneo PK
        BIGINT cliente FK "UQ, FK -> clientes.clientes"
        BIGINT tipo_piel FK "FK -> clientes.tipos_piel"
        NVARCHAR_30 sensibilidad_solar
        NVARCHAR_20 nivel_oleosidad
        BIT poros_dilatados
    }
    clientes__cliente_condiciones {
        BIGINT id_cliente_condicion PK
        BIGINT cliente FK "UQ, FK -> clientes.clientes"
        BIGINT condicion_dermatologica FK "UQ, FK -> clientes.condiciones_dermatologicas"
        BIT diagnosticada_por_medico
        NVARCHAR_255 notas_paciente
    }
    clientes__cuestionarios_diagnostico {
        BIGINT id_cuestionario PK
        NVARCHAR_30 codigo_cuestionario UK
        NVARCHAR_120 titulo
        NVARCHAR_255 descripcion
        NVARCHAR_10 version_clinica
    }
    clientes__preguntas_diagnostico {
        BIGINT id_pregunta PK
        BIGINT cuestionario FK "UQ, FK -> clientes.cuestionarios_diagnostico"
        INT numero_orden UK
        NVARCHAR_255 enunciado_pregunta
        NVARCHAR_30 tipo_respuesta
    }
    clientes__opciones_pregunta {
        BIGINT id_opcion PK
        BIGINT pregunta FK "UQ, FK -> clientes.preguntas_diagnostico"
        NVARCHAR_20 clave_opcion UK
        NVARCHAR_150 texto_opcion
        INT peso_clinico_puntos
    }
    clientes__evaluaciones_diagnostico {
        BIGINT id_evaluacion PK
        BIGINT cliente FK "FK -> clientes.clientes"
        BIGINT cuestionario FK "FK -> clientes.cuestionarios_diagnostico"
        DATETIME2_3 fecha_realizacion
        INT puntaje_total
        NVARCHAR_150 diagnostico_sugerido
    }
    clientes__respuestas_evaluacion {
        BIGINT id_respuesta_evaluacion PK
        BIGINT evaluacion FK "UQ, FK -> clientes.evaluaciones_diagnostico"
        BIGINT pregunta FK "UQ, FK -> clientes.preguntas_diagnostico"
        BIGINT opcion_seleccionada FK "UQ, FK -> clientes.opciones_pregunta"
        NVARCHAR_255 valor_texto_adicional
    }
    clientes__consentimientos_privacidad {
        BIGINT id_consentimiento PK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_20 version_aviso_privacidad
        BIT acepta_finalidades_primarias
        BIT acepta_finalidades_secundarias_marketing
    }
    clientes__solicitudes_arco {
        BIGINT id_solicitud_arco PK
        NVARCHAR_35 folio_solicitud UK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_20 tipo_derecho
        NVARCHAR_500 motivo_solicitud
        NVARCHAR_20 estado_tramite
    }
    clientes__preferencias_comunicacion {
        BIGINT id_preferencia PK
        BIGINT cliente FK "UQ, FK -> clientes.clientes"
        BIT canal_email
        BIT canal_sms
        BIT canal_whatsapp
    }
    clientes__metodos_pago_tokenizados {
        BIGINT id_metodo_tokenizado PK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_30 pasarela_emisor
        NVARCHAR_120 token_tarjeta_pasarela UK
        NVARCHAR_30 marca_tarjeta
        VARCHAR_4 ultimos_cuatro_digitos
    }
    catalogo__marcas {
        BIGINT id_marca PK
        NVARCHAR_30 codigo_marca UK
        NVARCHAR_100 nombre_marca
        NVARCHAR_60 pais_origen
        NVARCHAR_200 sitio_web
    }
    catalogo__laboratorios_fabricantes {
        BIGINT id_laboratorio PK
        NVARCHAR_30 clave_laboratorio UK
        NVARCHAR_150 razon_social
        NVARCHAR_80 licencia_sanitaria
        NVARCHAR_60 pais
    }
    catalogo__categorias {
        BIGINT id_categoria PK
        NVARCHAR_30 codigo_categoria UK
        NVARCHAR_80 nombre_categoria
        NVARCHAR_255 descripcion
        BIGINT categoria_padre FK "FK -> catalogo.categorias"
        INT nivel_arbol
    }
    catalogo__subcategorias {
        BIGINT id_subcategoria PK
        BIGINT categoria FK "FK -> catalogo.categorias"
        NVARCHAR_30 codigo_subcategoria UK
        NVARCHAR_80 nombre_subcategoria
        NVARCHAR_255 descripcion
    }
    catalogo__tipos_aplicacion {
        BIGINT id_tipo_aplicacion PK
        NVARCHAR_20 codigo_aplicacion UK
        NVARCHAR_50 nombre
        NVARCHAR_200 descripcion
    }
    catalogo__certificaciones_sanitarias {
        BIGINT id_certificacion PK
        NVARCHAR_30 codigo_certificacion UK
        NVARCHAR_80 nombre_certificacion
        NVARCHAR_100 organismo_certificador
    }
    catalogo__productos_maestros {
        BIGINT id_producto PK
        BIGINT marca FK "FK -> catalogo.marcas"
        BIGINT subcategoria FK "FK -> catalogo.subcategorias"
        BIGINT laboratorio FK "FK -> catalogo.laboratorios_fabricantes"
        BIGINT tipo_aplicacion FK "FK -> catalogo.tipos_aplicacion"
        BIGINT certificacion_sanitaria FK "FK -> catalogo.certificaciones_sanitarias"
        NVARCHAR_40 codigo_producto UK
        NVARCHAR_150 nombre_comercial
        NVARCHAR_300 descripcion_corta
        NVARCHAR_MAX descripcion_detallada
    }
    catalogo__subtonos_maquillaje {
        BIGINT id_subtono PK
        NVARCHAR_20 codigo_subtono UK
        NVARCHAR_50 nombre_subtono
        NVARCHAR_200 descripcion
    }
    catalogo__acabados_maquillaje {
        BIGINT id_acabado PK
        NVARCHAR_20 codigo_acabado UK
        NVARCHAR_50 nombre_acabado
        NVARCHAR_200 descripcion
    }
    catalogo__variantes_sku {
        BIGINT id_variante_sku PK
        BIGINT producto FK "FK -> catalogo.productos_maestros"
        VARCHAR_50 sku_codigo UK
        VARCHAR_14 codigo_barras_ean13 UK
        NVARCHAR_100 nombre_presentacion
        DECIMAL_8_2 contenido_neto_gramos_ml
        VARCHAR_10 unidad_medida
    }
    catalogo__tonos_variante {
        BIGINT id_tono_variante PK
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        BIGINT subtono FK "FK -> catalogo.subtonos_maquillaje"
        BIGINT acabado FK "FK -> catalogo.acabados_maquillaje"
        NVARCHAR_30 codigo_tono_color
        NVARCHAR_60 nombre_tono
        VARCHAR_7 color_hexadecimal
    }
    catalogo__ingredientes_inci {
        BIGINT id_ingrediente PK
        VARCHAR_30 codigo_cas
        NVARCHAR_120 nombre_inci UK
        NVARCHAR_120 nombre_comun
        NVARCHAR_150 funcion_principal
    }
    catalogo__alergenos_ingrediente {
        BIGINT id_alergeno PK
        BIGINT ingrediente FK "FK -> catalogo.ingredientes_inci"
        NVARCHAR_80 nombre_alergeno
        NVARCHAR_30 clasificacion_riesgo
        NVARCHAR_255 advertencia_etiqueta
    }
    catalogo__formula_ingredientes {
        BIGINT id_formula_ingrediente PK
        BIGINT producto FK "UQ, FK -> catalogo.productos_maestros"
        BIGINT ingrediente FK "UQ, FK -> catalogo.ingredientes_inci"
        INT orden_en_etiqueta
        DECIMAL_5_2 porcentaje_concentracion
        BIT es_principio_activo
    }
    catalogo__registros_sanitarios_cofepris {
        BIGINT id_registro_sanitario PK
        BIGINT producto FK "UQ, FK -> catalogo.productos_maestros"
        NVARCHAR_60 numero_registro_sanitario UK
        NVARCHAR_60 folio_ingreso_tramite
        DATE fecha_emision
        DATE fecha_vencimiento
    }
    catalogo__advertencias_contraindicaciones {
        BIGINT id_advertencia PK
        BIGINT producto FK "FK -> catalogo.productos_maestros"
        NVARCHAR_30 tipo_advertencia
        NVARCHAR_350 texto_advertencia
        NVARCHAR_350 medida_en_caso_ingestion
    }
    catalogo__multimedia_variantes {
        BIGINT id_multimedia PK
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        NVARCHAR_20 tipo_archivo
        NVARCHAR_350 url_recurso
        NVARCHAR_150 texto_alternativo_accesibilidad
        INT numero_orden UK
    }
    catalogo__kits_sets {
        BIGINT id_kit PK
        NVARCHAR_40 codigo_kit UK
        NVARCHAR_120 nombre_kit
        NVARCHAR_300 descripcion
        DECIMAL_5_2 descuento_porcentual_kit
    }
    catalogo__kits_items {
        BIGINT id_kit_item PK
        BIGINT kit FK "UQ, FK -> catalogo.kits_sets"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        INT cantidad_unidades
    }
    catalogo__productos_relacionados {
        BIGINT id_producto_relacionado PK
        BIGINT producto_origen FK "UQ, FK -> catalogo.productos_maestros"
        BIGINT producto_destino FK "UQ, FK -> catalogo.productos_maestros"
        NVARCHAR_30 tipo_relacion
    }
    catalogo__historial_precios_base {
        BIGINT id_historial_precio PK
        BIGINT variante_sku FK "FK -> catalogo.variantes_sku"
        DECIMAL_12_2 precio_anterior
        DECIMAL_12_2 precio_nuevo
        NVARCHAR_200 motivo_cambio
    }
    comunidad__rutinas_belleza {
        BIGINT id_rutina PK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_100 nombre_rutina
        NVARCHAR_20 momento_dia
        BIT es_publica
    }
    comunidad__rutinas_pasos {
        BIGINT id_rutina_paso PK
        BIGINT rutina FK "UQ, FK -> comunidad.rutinas_belleza"
        INT numero_paso UK
        NVARCHAR_60 nombre_fase
        NVARCHAR_255 instrucciones_aplicacion
        INT tiempo_espera_segundos
    }
    comunidad__rutinas_productos {
        BIGINT id_rutina_producto PK
        BIGINT rutina_paso FK "UQ, FK -> comunidad.rutinas_pasos"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        BIT es_producto_principal
    }
    comunidad__listas_deseos {
        BIGINT id_lista_deseos PK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_80 nombre_lista
        BIT es_publica
        NVARCHAR_64 token_compartir
    }
    seguridad__permisos ||--o{ seguridad__roles_permisos : "FK: permiso"
    seguridad__roles ||--o{ seguridad__roles_permisos : "FK: rol"
    seguridad__roles ||--o{ seguridad__usuarios_roles : "FK: rol"
    seguridad__usuarios ||--o{ seguridad__usuarios_roles : "FK: usuario"
    seguridad__usuarios ||--o{ seguridad__sesiones_activas : "FK: usuario"
    seguridad__usuarios ||--o{ seguridad__historial_passwords : "FK: usuario"
    seguridad__usuarios |o--o{ seguridad__intentos_login : "FK: usuario"
    seguridad__usuarios ||--o{ seguridad__tokens_recuperacion : "FK: usuario"
    seguridad__usuarios ||--o{ seguridad__dispositivos_confianza : "FK: usuario"
    seguridad__usuarios ||--o| clientes__clientes : "FK,UQ: usuario"
    clientes__clientes ||--o{ clientes__direcciones : "FK: cliente"
    clientes__clientes ||--o| clientes__perfil_cutaneo : "FK,UQ: cliente"
    clientes__tipos_piel ||--o{ clientes__perfil_cutaneo : "FK: tipo_piel"
    clientes__clientes ||--o{ clientes__cliente_condiciones : "FK: cliente"
    clientes__condiciones_dermatologicas ||--o{ clientes__cliente_condiciones : "FK: condicion_dermatologica"
    clientes__cuestionarios_diagnostico ||--o{ clientes__preguntas_diagnostico : "FK: cuestionario"
    clientes__preguntas_diagnostico ||--o{ clientes__opciones_pregunta : "FK: pregunta"
    clientes__clientes ||--o{ clientes__evaluaciones_diagnostico : "FK: cliente"
    clientes__cuestionarios_diagnostico ||--o{ clientes__evaluaciones_diagnostico : "FK: cuestionario"
    clientes__evaluaciones_diagnostico ||--o{ clientes__respuestas_evaluacion : "FK: evaluacion"
    clientes__opciones_pregunta ||--o{ clientes__respuestas_evaluacion : "FK: opcion_seleccionada"
    clientes__preguntas_diagnostico ||--o{ clientes__respuestas_evaluacion : "FK: pregunta"
    clientes__clientes ||--o{ clientes__consentimientos_privacidad : "FK: cliente"
    clientes__clientes ||--o{ clientes__solicitudes_arco : "FK: cliente"
    clientes__clientes ||--o| clientes__preferencias_comunicacion : "FK,UQ: cliente"
    clientes__clientes ||--o{ clientes__metodos_pago_tokenizados : "FK: cliente"
    catalogo__categorias |o--o{ catalogo__categorias : "FK: categoria_padre"
    catalogo__categorias ||--o{ catalogo__subcategorias : "FK: categoria"
    catalogo__certificaciones_sanitarias |o--o{ catalogo__productos_maestros : "FK: certificacion_sanitaria"
    catalogo__laboratorios_fabricantes ||--o{ catalogo__productos_maestros : "FK: laboratorio"
    catalogo__marcas ||--o{ catalogo__productos_maestros : "FK: marca"
    catalogo__subcategorias ||--o{ catalogo__productos_maestros : "FK: subcategoria"
    catalogo__tipos_aplicacion ||--o{ catalogo__productos_maestros : "FK: tipo_aplicacion"
    catalogo__productos_maestros ||--o{ catalogo__variantes_sku : "FK: producto"
    catalogo__acabados_maquillaje ||--o{ catalogo__tonos_variante : "FK: acabado"
    catalogo__subtonos_maquillaje ||--o{ catalogo__tonos_variante : "FK: subtono"
    catalogo__variantes_sku ||--o| catalogo__tonos_variante : "FK,UQ: variante_sku"
    catalogo__ingredientes_inci ||--o{ catalogo__alergenos_ingrediente : "FK: ingrediente"
    catalogo__ingredientes_inci ||--o{ catalogo__formula_ingredientes : "FK: ingrediente"
    catalogo__productos_maestros ||--o{ catalogo__formula_ingredientes : "FK: producto"
    catalogo__productos_maestros ||--o| catalogo__registros_sanitarios_cofepris : "FK,UQ: producto"
    catalogo__productos_maestros ||--o{ catalogo__advertencias_contraindicaciones : "FK: producto"
    catalogo__variantes_sku ||--o{ catalogo__multimedia_variantes : "FK: variante_sku"
    catalogo__kits_sets ||--o{ catalogo__kits_items : "FK: kit"
    catalogo__variantes_sku ||--o{ catalogo__kits_items : "FK: variante_sku"
    catalogo__productos_maestros ||--o{ catalogo__productos_relacionados : "FK: producto_destino"
    catalogo__productos_maestros ||--o{ catalogo__productos_relacionados : "FK: producto_origen"
    catalogo__variantes_sku ||--o{ catalogo__historial_precios_base : "FK: variante_sku"
    clientes__clientes ||--o{ comunidad__rutinas_belleza : "FK: cliente"
    comunidad__rutinas_belleza ||--o{ comunidad__rutinas_pasos : "FK: rutina"
    comunidad__rutinas_pasos ||--o{ comunidad__rutinas_productos : "FK: rutina_paso"
    catalogo__variantes_sku ||--o{ comunidad__rutinas_productos : "FK: variante_sku"
    clientes__clientes ||--o{ comunidad__listas_deseos : "FK: cliente"
```

**Esquema Relacional Formal — Submódulo 1 (50 Relaciones: Tablas 001–050):**

| # | Relación (`esquema.tabla`) | Esquema Relacional Formal (<u>PK</u>, *FK → ref*, `[UQ]` y atributos de dominio) |
| :---: | :--- | :--- |
| 001 | `seguridad.roles` | `seguridad.roles`(**<u>id_rol</u>** `PK`, codigo_rol `[UQ]`, nombre_rol, descripcion, nivel_jerarquico, *[+7 cols auditoría]*) |
| 002 | `seguridad.permisos` | `seguridad.permisos`(**<u>id_permiso</u>** `PK`, clave_permiso `[UQ]`, modulo_sistema, accion, descripcion, *[+7 cols auditoría]*) |
| 003 | `seguridad.roles_permisos` | `seguridad.roles_permisos`(**<u>id_rol_permiso</u>** `PK`, *rol* `[FK, UQ → seguridad.roles]`, *permiso* `[FK, UQ → seguridad.permisos]`, permitir, *[+7 cols auditoría]*) |
| 004 | `seguridad.usuarios` | `seguridad.usuarios`(**<u>id_usuario</u>** `PK`, uuid_usuario `[UQ]`, email `[UQ]`, password_hash, password_salt, telefono_movil, email_verificado, cuenta_bloqueada, fecha_bloqueo, intentos_fallidos_consecutivos, mfa_habilitado, mfa_secreto, ultimo_login_exitoso, ultimo_cambio_password, *[+7 cols auditoría]*) |
| 005 | `seguridad.usuarios_roles` | `seguridad.usuarios_roles`(**<u>id_usuario_rol</u>** `PK`, *usuario* `[FK, UQ → seguridad.usuarios]`, *rol* `[FK, UQ → seguridad.roles]`, fecha_asignacion, *[+7 cols auditoría]*) |
| 006 | `seguridad.sesiones_activas` | `seguridad.sesiones_activas`(**<u>id_sesion</u>** `PK`, *usuario* `[FK → seguridad.usuarios]`, token_sesion_hash `[UQ]`, direccion_ip, user_agent, fecha_inicio, fecha_expiracion, revocada, fecha_revocacion, motivo_revocacion, *[+7 cols auditoría]*) |
| 007 | `seguridad.historial_passwords` | `seguridad.historial_passwords`(**<u>id_historial_pwd</u>** `PK`, *usuario* `[FK → seguridad.usuarios]`, password_hash, password_salt, algoritmo_hashing, *[+7 cols auditoría]*) |
| 008 | `seguridad.intentos_login` | `seguridad.intentos_login`(**<u>id_intento_login</u>** `PK`, email_ingresado, *usuario* `[FK → seguridad.usuarios]`, direccion_ip, pais_origen_ip, user_agent, resultado, mensaje_detalle, *[+7 cols auditoría]*) |
| 009 | `seguridad.tokens_recuperacion` | `seguridad.tokens_recuperacion`(**<u>id_token_recuperacion</u>** `PK`, *usuario* `[FK → seguridad.usuarios]`, token_hash `[UQ]`, tipo_token, fecha_expiracion, utilizado, fecha_utilizacion, *[+7 cols auditoría]*) |
| 010 | `seguridad.dispositivos_confianza` | `seguridad.dispositivos_confianza`(**<u>id_dispositivo</u>** `PK`, *usuario* `[FK, UQ → seguridad.usuarios]`, fingerprint_dispositivo `[UQ]`, nombre_dispositivo, sistema_operativo, navegador, es_confiable, ultimo_acceso, *[+7 cols auditoría]*) |
| 011 | `clientes.tipos_piel` | `clientes.tipos_piel`(**<u>id_tipo_piel</u>** `PK`, codigo_piel `[UQ]`, nombre, descripcion_clinica, *[+7 cols auditoría]*) |
| 012 | `clientes.condiciones_dermatologicas` | `clientes.condiciones_dermatologicas`(**<u>id_condicion_dermatologica</u>** `PK`, codigo_condicion `[UQ]`, nombre_condicion, descripcion_patologica, nivel_severidad_tipica, *[+7 cols auditoría]*) |
| 013 | `clientes.clientes` | `clientes.clientes`(**<u>id_cliente</u>** `PK`, *usuario* `[FK, UQ → seguridad.usuarios]`, nombres, primer_apellido, segundo_apellido, fecha_nacimiento, genero, curp, rfc, telefono_fijo, acepta_terminos, fecha_aceptacion_terminos, *[+7 cols auditoría]*) |
| 014 | `clientes.direcciones` | `clientes.direcciones`(**<u>id_direccion</u>** `PK`, *cliente* `[FK → clientes.clientes]`, alias_direccion, calle, numero_exterior, numero_interior, colonia, codigo_postal, municipio_alcaldia, estado, pais, referencias, es_predeterminada_envio, es_predeterminada_facturacion, *[+7 cols auditoría]*) |
| 015 | `clientes.perfil_cutaneo` | `clientes.perfil_cutaneo`(**<u>id_perfil_cutaneo</u>** `PK`, *cliente* `[FK, UQ → clientes.clientes]`, *tipo_piel* `[FK → clientes.tipos_piel]`, sensibilidad_solar, nivel_oleosidad, poros_dilatados, propension_acne, manchas_hiperpigmentacion, lineas_expresion, consentimiento_datos_sensibles, fecha_declaracion, *[+7 cols auditoría]*) |
| 016 | `clientes.cliente_condiciones` | `clientes.cliente_condiciones`(**<u>id_cliente_condicion</u>** `PK`, *cliente* `[FK, UQ → clientes.clientes]`, *condicion_dermatologica* `[FK, UQ → clientes.condiciones_dermatologicas]`, diagnosticada_por_medico, notas_paciente, *[+7 cols auditoría]*) |
| 017 | `clientes.cuestionarios_diagnostico` | `clientes.cuestionarios_diagnostico`(**<u>id_cuestionario</u>** `PK`, codigo_cuestionario `[UQ]`, titulo, descripcion, version_clinica, vigente_desde, *[+7 cols auditoría]*) |
| 018 | `clientes.preguntas_diagnostico` | `clientes.preguntas_diagnostico`(**<u>id_pregunta</u>** `PK`, *cuestionario* `[FK, UQ → clientes.cuestionarios_diagnostico]`, numero_orden `[UQ]`, enunciado_pregunta, tipo_respuesta, *[+7 cols auditoría]*) |
| 019 | `clientes.opciones_pregunta` | `clientes.opciones_pregunta`(**<u>id_opcion</u>** `PK`, *pregunta* `[FK, UQ → clientes.preguntas_diagnostico]`, clave_opcion `[UQ]`, texto_opcion, peso_clinico_puntos, *[+7 cols auditoría]*) |
| 020 | `clientes.evaluaciones_diagnostico` | `clientes.evaluaciones_diagnostico`(**<u>id_evaluacion</u>** `PK`, *cliente* `[FK → clientes.clientes]`, *cuestionario* `[FK → clientes.cuestionarios_diagnostico]`, fecha_realizacion, puntaje_total, diagnostico_sugerido, observaciones_dermoconsultor, *[+7 cols auditoría]*) |
| 021 | `clientes.respuestas_evaluacion` | `clientes.respuestas_evaluacion`(**<u>id_respuesta_evaluacion</u>** `PK`, *evaluacion* `[FK, UQ → clientes.evaluaciones_diagnostico]`, *pregunta* `[FK, UQ → clientes.preguntas_diagnostico]`, *opcion_seleccionada* `[FK, UQ → clientes.opciones_pregunta]`, valor_texto_adicional, *[+7 cols auditoría]*) |
| 022 | `clientes.consentimientos_privacidad` | `clientes.consentimientos_privacidad`(**<u>id_consentimiento</u>** `PK`, *cliente* `[FK → clientes.clientes]`, version_aviso_privacidad, acepta_finalidades_primarias, acepta_finalidades_secundarias_marketing, acepta_tratamiento_datos_salud_sensibles, direccion_ip_firma, medio_consentimiento, fecha_consentimiento, *[+7 cols auditoría]*) |
| 023 | `clientes.solicitudes_arco` | `clientes.solicitudes_arco`(**<u>id_solicitud_arco</u>** `PK`, folio_solicitud `[UQ]`, *cliente* `[FK → clientes.clientes]`, tipo_derecho, motivo_solicitud, estado_tramite, fecha_limite_respuesta, resolucion_juridica, fecha_resolucion, *[+7 cols auditoría]*) |
| 024 | `clientes.preferencias_comunicacion` | `clientes.preferencias_comunicacion`(**<u>id_preferencia</u>** `PK`, *cliente* `[FK, UQ → clientes.clientes]`, canal_email, canal_sms, canal_whatsapp, notificaciones_ofertas, alertas_reabastecimiento_rutina, *[+7 cols auditoría]*) |
| 025 | `clientes.metodos_pago_tokenizados` | `clientes.metodos_pago_tokenizados`(**<u>id_metodo_tokenizado</u>** `PK`, *cliente* `[FK → clientes.clientes]`, pasarela_emisor, token_tarjeta_pasarela `[UQ]`, marca_tarjeta, ultimos_cuatro_digitos, mes_expiracion, anio_expiracion, titular_tarjeta_hash, es_predeterminada, *[+7 cols auditoría]*) |
| 026 | `catalogo.marcas` | `catalogo.marcas`(**<u>id_marca</u>** `PK`, codigo_marca `[UQ]`, nombre_marca, pais_origen, sitio_web, es_dermocosmetica, *[+7 cols auditoría]*) |
| 027 | `catalogo.laboratorios_fabricantes` | `catalogo.laboratorios_fabricantes`(**<u>id_laboratorio</u>** `PK`, clave_laboratorio `[UQ]`, razon_social, licencia_sanitaria, pais, certificacion_gmp_vigente, *[+7 cols auditoría]*) |
| 028 | `catalogo.categorias` | `catalogo.categorias`(**<u>id_categoria</u>** `PK`, codigo_categoria `[UQ]`, nombre_categoria, descripcion, *categoria_padre* `[FK → catalogo.categorias]`, nivel_arbol, *[+7 cols auditoría]*) |
| 029 | `catalogo.subcategorias` | `catalogo.subcategorias`(**<u>id_subcategoria</u>** `PK`, *categoria* `[FK → catalogo.categorias]`, codigo_subcategoria `[UQ]`, nombre_subcategoria, descripcion, *[+7 cols auditoría]*) |
| 030 | `catalogo.tipos_aplicacion` | `catalogo.tipos_aplicacion`(**<u>id_tipo_aplicacion</u>** `PK`, codigo_aplicacion `[UQ]`, nombre, descripcion, *[+7 cols auditoría]*) |
| 031 | `catalogo.certificaciones_sanitarias` | `catalogo.certificaciones_sanitarias`(**<u>id_certificacion</u>** `PK`, codigo_certificacion `[UQ]`, nombre_certificacion, organismo_certificador, *[+7 cols auditoría]*) |
| 032 | `catalogo.productos_maestros` | `catalogo.productos_maestros`(**<u>id_producto</u>** `PK`, *marca* `[FK → catalogo.marcas]`, *subcategoria* `[FK → catalogo.subcategorias]`, *laboratorio* `[FK → catalogo.laboratorios_fabricantes]`, *tipo_aplicacion* `[FK → catalogo.tipos_aplicacion]`, *certificacion_sanitaria* `[FK → catalogo.certificaciones_sanitarias]`, codigo_producto `[UQ]`, nombre_comercial, descripcion_corta, descripcion_detallada, modo_empleo, requiere_prescripcion_medica, factor_proteccion_solar_fps, es_sensible_temperatura, *[+7 cols auditoría]*) |
| 033 | `catalogo.subtonos_maquillaje` | `catalogo.subtonos_maquillaje`(**<u>id_subtono</u>** `PK`, codigo_subtono `[UQ]`, nombre_subtono, descripcion, *[+7 cols auditoría]*) |
| 034 | `catalogo.acabados_maquillaje` | `catalogo.acabados_maquillaje`(**<u>id_acabado</u>** `PK`, codigo_acabado `[UQ]`, nombre_acabado, descripcion, *[+7 cols auditoría]*) |
| 035 | `catalogo.variantes_sku` | `catalogo.variantes_sku`(**<u>id_variante_sku</u>** `PK`, *producto* `[FK → catalogo.productos_maestros]`, sku_codigo `[UQ]`, codigo_barras_ean13 `[UQ]`, nombre_presentacion, contenido_neto_gramos_ml, unidad_medida, precio_base_menudeo, costo_estandar_compra, *[+7 cols auditoría]*) |
| 036 | `catalogo.tonos_variante` | `catalogo.tonos_variante`(**<u>id_tono_variante</u>** `PK`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, *subtono* `[FK → catalogo.subtonos_maquillaje]`, *acabado* `[FK → catalogo.acabados_maquillaje]`, codigo_tono_color, nombre_tono, color_hexadecimal, *[+7 cols auditoría]*) |
| 037 | `catalogo.ingredientes_inci` | `catalogo.ingredientes_inci`(**<u>id_ingrediente</u>** `PK`, codigo_cas, nombre_inci `[UQ]`, nombre_comun, funcion_principal, es_comedogenico, indice_comedogenico, es_alergeno_frecuente, *[+7 cols auditoría]*) |
| 038 | `catalogo.alergenos_ingrediente` | `catalogo.alergenos_ingrediente`(**<u>id_alergeno</u>** `PK`, *ingrediente* `[FK → catalogo.ingredientes_inci]`, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta, *[+7 cols auditoría]*) |
| 039 | `catalogo.formula_ingredientes` | `catalogo.formula_ingredientes`(**<u>id_formula_ingrediente</u>** `PK`, *producto* `[FK, UQ → catalogo.productos_maestros]`, *ingrediente* `[FK, UQ → catalogo.ingredientes_inci]`, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo, *[+7 cols auditoría]*) |
| 040 | `catalogo.registros_sanitarios_cofepris` | `catalogo.registros_sanitarios_cofepris`(**<u>id_registro_sanitario</u>** `PK`, *producto* `[FK, UQ → catalogo.productos_maestros]`, numero_registro_sanitario `[UQ]`, folio_ingreso_tramite, fecha_emision, fecha_vencimiento, estatus_regulatorio, documento_oficial_url, *[+7 cols auditoría]*) |
| 041 | `catalogo.advertencias_contraindicaciones` | `catalogo.advertencias_contraindicaciones`(**<u>id_advertencia</u>** `PK`, *producto* `[FK → catalogo.productos_maestros]`, tipo_advertencia, texto_advertencia, medida_en_caso_ingestion, *[+7 cols auditoría]*) |
| 042 | `catalogo.multimedia_variantes` | `catalogo.multimedia_variantes`(**<u>id_multimedia</u>** `PK`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, tipo_archivo, url_recurso, texto_alternativo_accesibilidad, numero_orden `[UQ]`, es_imagen_principal, *[+7 cols auditoría]*) |
| 043 | `catalogo.kits_sets` | `catalogo.kits_sets`(**<u>id_kit</u>** `PK`, codigo_kit `[UQ]`, nombre_kit, descripcion, descuento_porcentual_kit, *[+7 cols auditoría]*) |
| 044 | `catalogo.kits_items` | `catalogo.kits_items`(**<u>id_kit_item</u>** `PK`, *kit* `[FK, UQ → catalogo.kits_sets]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, cantidad_unidades, *[+7 cols auditoría]*) |
| 045 | `catalogo.productos_relacionados` | `catalogo.productos_relacionados`(**<u>id_producto_relacionado</u>** `PK`, *producto_origen* `[FK, UQ → catalogo.productos_maestros]`, *producto_destino* `[FK, UQ → catalogo.productos_maestros]`, tipo_relacion, *[+7 cols auditoría]*) |
| 046 | `catalogo.historial_precios_base` | `catalogo.historial_precios_base`(**<u>id_historial_precio</u>** `PK`, *variante_sku* `[FK → catalogo.variantes_sku]`, precio_anterior, precio_nuevo, motivo_cambio, *[+7 cols auditoría]*) |
| 047 | `comunidad.rutinas_belleza` | `comunidad.rutinas_belleza`(**<u>id_rutina</u>** `PK`, *cliente* `[FK → clientes.clientes]`, nombre_rutina, momento_dia, es_publica, *[+7 cols auditoría]*) |
| 048 | `comunidad.rutinas_pasos` | `comunidad.rutinas_pasos`(**<u>id_rutina_paso</u>** `PK`, *rutina* `[FK, UQ → comunidad.rutinas_belleza]`, numero_paso `[UQ]`, nombre_fase, instrucciones_aplicacion, tiempo_espera_segundos, *[+7 cols auditoría]*) |
| 049 | `comunidad.rutinas_productos` | `comunidad.rutinas_productos`(**<u>id_rutina_producto</u>** `PK`, *rutina_paso* `[FK, UQ → comunidad.rutinas_pasos]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, es_producto_principal, *[+7 cols auditoría]*) |
| 050 | `comunidad.listas_deseos` | `comunidad.listas_deseos`(**<u>id_lista_deseos</u>** `PK`, *cliente* `[FK → clientes.clientes]`, nombre_lista, es_publica, token_compartir, *[+7 cols auditoría]*) |

---

### 1.4 Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones (Tablas 051–100)

#### 1.4.1 Diagrama Entidad-Relación (E-R) — Submódulo 2 (Tablas 051–100)

> [!NOTE]
> **Conteo exacto del Submódulo 2 (Autor: Sheyla Estefanía Moncada Guel):** contiene exactamente **50 entidades propias** (Tablas `051`–`100`). Adicionalmente se muestran **2 nodos puente externos** etiquetados con `_REF_SM1` (`CLIENTES_REF_SM1` y `VARIANTES_SKU_REF_SM1`, pertenecientes al Submódulo 1) únicamente para visualizar sus relaciones FK inter-módulo; en el diagrama global `.drawio`/`.html` cada tabla aparece una sola vez (`150` exactas).

```mermaid
erDiagram
    CLIENTES_REF_SM1 ||--o{ CARRITOS : "abre (0,N)"
    CARRITOS ||--|{ ITEMS_CARRITO : "contiene (1,N)"
    CARRITOS ||--o| CARRITOS_ABANDONADOS_SEGUIMIENTO : "monitorea (0,1)"
    CARRITOS ||--o{ RESERVAS_TEMPORALES_STOCK : "aparta_15min (0,N)"
    VARIANTES_SKU_REF_SM1 ||--o{ RESERVAS_TEMPORALES_STOCK : "bloquea_stock (0,N)"
    VARIANTES_SKU_REF_SM1 ||--o{ REGALOS_POR_COMPRA_GWP : "obsequia_muestra (0,N)"

    PLANES_SUSCRIPCION ||--o{ SUSCRIPCIONES_CLIENTE : "contrata (0,N)"
    FRECUENCIAS_SUSCRIPCION ||--o{ SUSCRIPCIONES_CLIENTE : "define_ciclo (0,N)"
    CLIENTES_REF_SM1 ||--o{ SUSCRIPCIONES_CLIENTE : "suscribe (0,N)"
    SUSCRIPCIONES_CLIENTE ||--|{ SUSCRIPCIONES_ITEMS : "incluye (1,N)"
    SUSCRIPCIONES_CLIENTE ||--o{ SUSCRIPCIONES_CALENDARIO_ENTREGAS : "programa (1,N)"
    SUSCRIPCIONES_CLIENTE ||--o{ SUSCRIPCIONES_BITACORA_ESTADOS : "registra (1,N)"

    CLIENTES_REF_SM1 ||--o{ ORDENES : "realiza (0,N)"
    ESTADOS_ORDEN ||--o{ ORDENES : "clasifica (0,N)"
    MOTIVOS_CANCELACION_ORDEN ||--o{ ORDENES : "justifica_baja (0,N)"
    ORDENES ||--|{ ORDENES_DETALLES : "desglosa (1,N)"
    ORDENES ||--o{ ORDENES_HISTORIAL_ESTADOS : "audita (1,N)"
    ORDENES ||--|{ ORDENES_SPLITS_ALMACEN : "divide (1,N)"
    ORDENES ||--o{ ORDENES_IMPUESTOS : "grava (1,N)"
    ORDENES ||--o{ ORDENES_DESCUENTOS : "aplica (0,N)"
    ORDENES ||--o{ ORDENES_NOTAS_INSTRUCCIONES : "anota (0,N)"
    AFILIADOS_INFLUENCERS ||--o{ COMISIONES_AFILIADOS : "devenga (0,N)"
    ORDENES ||--o{ COMISIONES_AFILIADOS : "origina (0,N)"

    ORDENES ||--o{ TRANSACCIONES : "cobra (1,N)"
    PROVEEDORES_PASARELA ||--o{ TRANSACCIONES : "procesa (0,N)"
    METODOS_PAGO ||--o{ TRANSACCIONES : "usa (0,N)"
    TRANSACCIONES ||--o{ INTENTOS_COBRO : "registra (1,N)"
    TRANSACCIONES ||--o{ SPLIT_MULTIPAGOS : "divide (0,N)"
    TRANSACCIONES ||--o{ REEMBOLSOS_TRANSACCION : "reembolsa (0,N)"
    TRANSACCIONES ||--o{ CONTRACARGOS_CHARGEBACKS : "disputa (0,N)"
    ORDENES ||--o| EVALUACIONES_ANTIFRAUDE : "evalua (0,1)"
    REGLAS_ANTIFRAUDE ||--o{ EVALUACIONES_ANTIFRAUDE : "detona (0,N)"
    CLIENTES_REF_SM1 ||--o| BILLETERA_ELECTRONICA : "posee (0,1)"
    BILLETERA_ELECTRONICA ||--o{ MOVIMIENTOS_BILLETERA : "registra (0,N)"
    TARJETAS_REGALO_GIFTCARDS ||--o{ REDENCIONES_GIFTCARDS : "canjea (0,N)"

    REGIMENES_SAT ||--o{ DATOS_FISCALES_CLIENTE : "tipifica (0,N)"
    USOS_CFDI ||--o{ DATOS_FISCALES_CLIENTE : "indica (0,N)"
    DATOS_FISCALES_CLIENTE ||--o{ FACTURAS_CFDI : "emite (0,N)"
    ORDENES ||--o{ FACTURAS_CFDI : "factura (0,N)"
    FACTURAS_CFDI ||--|{ FACTURAS_PARTIDAS : "conceptua (1,N)"
    FACTURAS_CFDI ||--o{ COMPLEMENTOS_PAGO : "complementa (0,N)"
    FACTURAS_CFDI ||--o{ NOTAS_CREDITO : "acredita (0,N)"
    FACTURAS_CFDI ||--o| CANCELACIONES_CFDI : "anula (0,1)"

    CAMPANIAS ||--o{ CUPONES : "lanza (0,N)"
    TIPOS_DESCUENTO ||--o{ CUPONES : "define (0,N)"
    CUPONES ||--o{ REGLAS_ELEGIBILIDAD_CUPON : "restringe (0,N)"
    CUPONES ||--o{ CUPONES_CATEGORIAS_EXCLUIDAS : "excluye (0,N)"
    CUPONES ||--o{ REDENCIONES_CUPONES : "redime (0,N)"
    CAMPANIAS ||--o{ VENTAS_FLASH_HORARIAS : "programa_flash (0,N)"
    VARIANTES_SKU_REF_SM1 ||--o{ VENTAS_FLASH_HORARIAS : "oferta_relampago (0,N)"
```

#### 1.4.2 Modelo Relacional (Esquema Lógico con PK, FK, UK y Tipos de Datos) — Submódulo 2 (Tablas 051–100)

> [!TIP]
> **Modelo Relacional del Submódulo 2 (Sheyla Estefanía Moncada Guel):** exactamente **50 tablas relacionales propias** (Tablas 051–100) con llaves primarias (`PK`), llaves foráneas (`FK`), llaves candidatas únicas (`UK`) y tipos de datos sincronizados al 100% con el DDL de SQL Server / PostgreSQL. Incluye sus **67 llaves foráneas** reales del DDL (intra-módulo e inter-módulo); los **6 nodos puente externos** etiquetados con `_REF_SM#` únicamente representan la tabla destino de FKs externas: `seguridad__usuarios_REF_SM1` (`seguridad.usuarios`), `clientes__clientes_REF_SM1` (`clientes.clientes`), `clientes__direcciones_REF_SM1` (`clientes.direcciones`), `clientes__metodos_pago_tokenizados_REF_SM1` (`clientes.metodos_pago_tokenizados`), `catalogo__categorias_REF_SM1` (`catalogo.categorias`), `catalogo__variantes_sku_REF_SM1` (`catalogo.variantes_sku`). *(Las 7 columnas estándar de auditoría/Soft Delete se omiten en las cajas visuales salvo cuando son `FK`, y se indican como `[+7 cols auditoría]` en el esquema formal).*

```mermaid
erDiagram
    seguridad__usuarios_REF_SM1 {
        BIGINT id_usuario PK "Ref externa SM1"
    }
    clientes__clientes_REF_SM1 {
        BIGINT id_cliente PK "Ref externa SM1"
    }
    clientes__direcciones_REF_SM1 {
        BIGINT id_direccion PK "Ref externa SM1"
    }
    clientes__metodos_pago_tokenizados_REF_SM1 {
        BIGINT id_metodo_tokenizado PK "Ref externa SM1"
    }
    catalogo__categorias_REF_SM1 {
        BIGINT id_categoria PK "Ref externa SM1"
    }
    catalogo__variantes_sku_REF_SM1 {
        BIGINT id_variante_sku PK "Ref externa SM1"
    }
    ventas__tipos_descuento {
        BIGINT id_tipo_descuento PK
        NVARCHAR_20 codigo_descuento UK
        NVARCHAR_50 nombre
        NVARCHAR_200 descripcion
    }
    ventas__estados_orden {
        BIGINT id_estado_orden PK
        NVARCHAR_30 codigo_estado UK
        NVARCHAR_60 nombre_estado
        NVARCHAR_255 descripcion
        BIT es_terminal
    }
    ventas__motivos_cancelacion_orden {
        BIGINT id_motivo_cancelacion PK
        NVARCHAR_30 codigo_motivo UK
        NVARCHAR_200 descripcion_motivo
        BIT es_atribuible_cliente
    }
    ventas__carritos {
        BIGINT id_carrito PK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_128 token_sesion_carrito UK
        DATETIME2_3 fecha_ultima_actividad
        BIT convertido_a_orden
    }
    ventas__items_carrito {
        BIGINT id_item_carrito PK
        BIGINT carrito FK "UQ, FK -> ventas.carritos"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        INT cantidad
        DECIMAL_12_2 precio_unitario_capturado
        DATETIME2_3 fecha_agregado
    }
    ventas__carritos_abandonados_seguimiento {
        BIGINT id_seguimiento_carrito PK
        BIGINT carrito FK "UQ, FK -> ventas.carritos"
        BIT correo_recordatorio_enviado
        DATETIME2_3 fecha_envio_recordatorio
        BIT recuperado
    }
    ventas__planes_suscripcion {
        BIGINT id_plan_suscripcion PK
        NVARCHAR_30 codigo_plan UK
        NVARCHAR_100 nombre_plan
        NVARCHAR_300 descripcion
        DECIMAL_12_2 precio_recurrente_base
    }
    ventas__frecuencias_suscripcion {
        BIGINT id_frecuencia_suscripcion PK
        NVARCHAR_20 codigo_frecuencia UK
        NVARCHAR_50 nombre
        INT intervalo_dias
    }
    ventas__suscripciones_cliente {
        BIGINT id_suscripcion_cliente PK
        NVARCHAR_35 folio_suscripcion UK
        BIGINT cliente FK "FK -> clientes.clientes"
        BIGINT plan_suscripcion FK "FK -> ventas.planes_suscripcion"
        BIGINT frecuencia_suscripcion FK "FK -> ventas.frecuencias_suscripcion"
        BIGINT direccion_entrega FK "FK -> clientes.direcciones"
        BIGINT metodo_tokenizado FK "FK -> clientes.metodos_pago_tokenizados"
        DATE fecha_inicio
        DATE proxima_fecha_cobro
        NVARCHAR_20 estado_suscripcion
    }
    ventas__suscripciones_items {
        BIGINT id_suscripcion_item PK
        BIGINT suscripcion_cliente FK "UQ, FK -> ventas.suscripciones_cliente"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        INT cantidad
        DECIMAL_12_2 precio_congelado_suscripcion
    }
    ventas__suscripciones_calendario_entregas {
        BIGINT id_entrega_programada PK
        BIGINT suscripcion_cliente FK "UQ, FK -> ventas.suscripciones_cliente"
        DATE fecha_programada_despacho
        INT numero_ciclo_periodo UK
        NVARCHAR_30 estado_despacho
    }
    ventas__suscripciones_bitacora_estados {
        BIGINT id_bitacora_suscripcion PK
        BIGINT suscripcion_cliente FK "FK -> ventas.suscripciones_cliente"
        NVARCHAR_20 estado_anterior
        NVARCHAR_20 estado_nuevo
        NVARCHAR_255 motivo_cambio
    }
    ventas__regalos_por_compra_gwp {
        BIGINT id_regalo_compra PK
        NVARCHAR_30 codigo_promocion_gwp UK
        NVARCHAR_100 nombre_promocion
        DECIMAL_12_2 monto_minimo_requerido
        BIGINT variante_sku_regalo FK "FK -> catalogo.variantes_sku"
        DATETIME2_3 fecha_inicio
    }
    ventas__ordenes {
        BIGINT id_orden PK
        NVARCHAR_40 folio_orden UK
        BIGINT cliente FK "FK -> clientes.clientes"
        BIGINT estado_orden FK "FK -> ventas.estados_orden"
        BIGINT motivo_cancelacion FK "FK -> ventas.motivos_cancelacion_orden"
        BIGINT direccion_envio FK "FK -> clientes.direcciones"
        BIGINT direccion_facturacion FK "FK -> clientes.direcciones"
        DATETIME2_3 fecha_orden
        DECIMAL_12_2 subtotal_bruto
        DECIMAL_12_2 total_descuentos
    }
    ventas__ordenes_detalles {
        BIGINT id_orden_detalle PK
        BIGINT orden FK "UQ, FK -> ventas.ordenes"
        BIGINT variante_sku FK "FK -> catalogo.variantes_sku"
        INT numero_partida UK
        INT cantidad_comprada
        DECIMAL_12_2 precio_unitario_venta
        DECIMAL_12_2 costo_unitario_historico
    }
    ventas__ordenes_historial_estados {
        BIGINT id_orden_historial PK
        BIGINT orden FK "FK -> ventas.ordenes"
        BIGINT estado_orden FK "FK -> ventas.estados_orden"
        NVARCHAR_300 comentario_operativo
        DATETIME2_3 fecha_registro
    }
    ventas__ordenes_splits_almacen {
        BIGINT id_orden_split PK
        BIGINT orden FK "FK -> ventas.ordenes"
        NVARCHAR_45 sub_folio_split UK
        NVARCHAR_30 estado_split
    }
    ventas__ordenes_impuestos {
        BIGINT id_orden_impuesto PK
        BIGINT orden FK "FK -> ventas.ordenes"
        VARCHAR_10 tipo_impuesto
        DECIMAL_6_4 tasa_o_cuota
        DECIMAL_12_2 base_gravable
    }
    ventas__ordenes_descuentos {
        BIGINT id_orden_descuento PK
        BIGINT orden FK "FK -> ventas.ordenes"
        BIGINT tipo_descuento FK "FK -> ventas.tipos_descuento"
        NVARCHAR_40 codigo_promocion_aplicado
        DECIMAL_12_2 monto_descontado
    }
    ventas__ordenes_notas_instrucciones {
        BIGINT id_orden_nota PK
        BIGINT orden FK "UQ, FK -> ventas.ordenes"
        BIT es_para_regalo
        NVARCHAR_300 mensaje_tarjeta_regalo
        NVARCHAR_300 instrucciones_entrega_repartidor
    }
    ventas__reservas_temporales_stock {
        BIGINT id_reserva_stock PK
        BIGINT carrito FK "FK -> ventas.carritos"
        BIGINT variante_sku FK "FK -> catalogo.variantes_sku"
        INT cantidad_reservada
        DATETIME2_3 fecha_reserva
        DATETIME2_3 fecha_expiracion_reserva
    }
    ventas__afiliados_influencers {
        BIGINT id_afiliado PK
        NVARCHAR_30 codigo_afiliado UK
        BIGINT usuario FK "FK -> seguridad.usuarios"
        NVARCHAR_100 nombre_canal_red_social
        DECIMAL_5_2 porcentaje_comision
        VARCHAR_18 clabe_interbancaria
    }
    ventas__comisiones_afiliados {
        BIGINT id_comision_afiliado PK
        BIGINT afiliado FK "FK -> ventas.afiliados_influencers"
        BIGINT orden FK "UQ, FK -> ventas.ordenes"
        DECIMAL_12_2 monto_base_calculo
        DECIMAL_12_2 monto_comision
        NVARCHAR_20 estado_pago
    }
    pagos__proveedores_pasarela {
        BIGINT id_proveedor_pasarela PK
        NVARCHAR_20 codigo_pasarela UK
        NVARCHAR_60 nombre_comercial
        NVARCHAR_250 url_webhook
    }
    pagos__metodos_pago {
        BIGINT id_metodo_pago PK
        NVARCHAR_20 codigo_metodo UK
        NVARCHAR_60 nombre_metodo
        DECIMAL_5_2 comision_porcentual_fija
    }
    pagos__transacciones {
        BIGINT id_transaccion PK
        NVARCHAR_45 folio_transaccion UK
        BIGINT orden FK "FK -> ventas.ordenes"
        BIGINT proveedor_pasarela FK "FK -> pagos.proveedores_pasarela"
        BIGINT metodo_pago FK "FK -> pagos.metodos_pago"
        NVARCHAR_100 id_transaccion_externa_pasarela
        DECIMAL_12_2 monto_transaccion
        VARCHAR_3 moneda
    }
    pagos__intentos_cobro {
        BIGINT id_intento_cobro PK
        BIGINT transaccion FK "FK -> pagos.transacciones"
        INT numero_intento
        INT codigo_respuesta_http
        NVARCHAR_MAX payload_solicitud_sanitizado
    }
    pagos__split_multipagos {
        BIGINT id_split_pago PK
        BIGINT orden FK "FK -> ventas.ordenes"
        BIGINT metodo_pago FK "FK -> pagos.metodos_pago"
        DECIMAL_12_2 monto_asignado
        NVARCHAR_80 referencia_comprobante
    }
    pagos__billetera_electronica {
        BIGINT id_billetera PK
        BIGINT cliente FK "UQ, FK -> clientes.clientes"
        DECIMAL_12_2 saldo_disponible
        DECIMAL_12_2 saldo_bloqueado_retenido
    }
    pagos__movimientos_billetera {
        BIGINT id_movimiento_billetera PK
        BIGINT billetera FK "FK -> pagos.billetera_electronica"
        NVARCHAR_20 tipo_movimiento
        DECIMAL_12_2 monto
        DECIMAL_12_2 saldo_anterior
    }
    pagos__tarjetas_regalo_giftcards {
        BIGINT id_giftcard PK
        NVARCHAR_128 codigo_giftcard_hash UK
        DECIMAL_12_2 monto_inicial
        DECIMAL_12_2 saldo_actual
        DATE fecha_vencimiento
        BIGINT cliente_comprador FK "FK -> clientes.clientes"
    }
    pagos__redenciones_giftcards {
        BIGINT id_redencion_giftcard PK
        BIGINT giftcard FK "FK -> pagos.tarjetas_regalo_giftcards"
        BIGINT orden FK "FK -> ventas.ordenes"
        DECIMAL_12_2 monto_redimido
    }
    pagos__reglas_antifraude {
        BIGINT id_regla_antifraude PK
        NVARCHAR_30 codigo_regla UK
        NVARCHAR_200 descripcion
        INT puntaje_riesgo_asignado
        BIT bloqueo_automatico
    }
    pagos__evaluaciones_antifraude {
        BIGINT id_evaluacion_fraude PK
        BIGINT orden FK "UQ, FK -> ventas.ordenes"
        BIGINT regla_antifraude FK "FK -> pagos.reglas_antifraude"
        INT score_riesgo_total
        NVARCHAR_20 nivel_riesgo
        NVARCHAR_45 ip_origen
    }
    pagos__contracargos_chargebacks {
        BIGINT id_contracargo PK
        BIGINT transaccion FK "FK -> pagos.transacciones"
        NVARCHAR_60 folio_disputa_pasarela UK
        NVARCHAR_150 motivo_disputa
        DECIMAL_12_2 monto_disputado
        DATETIME2_3 fecha_notificacion
    }
    pagos__reembolsos_transaccion {
        BIGINT id_reembolso PK
        BIGINT transaccion FK "FK -> pagos.transacciones"
        NVARCHAR_80 folio_reembolso_pasarela UK
        DECIMAL_12_2 monto_reembolsado
        NVARCHAR_250 motivo_reembolso
        DATETIME2_3 fecha_reembolso
    }
    fiscal__regimenes_sat {
        BIGINT id_regimen_sat PK
        VARCHAR_4 clave_regimen_sat UK
        NVARCHAR_200 descripcion
        BIT aplica_persona_fisica
        BIT aplica_persona_moral
    }
    fiscal__usos_cfdi {
        BIGINT id_uso_cfdi PK
        VARCHAR_5 clave_uso_cfdi UK
        NVARCHAR_150 descripcion
        BIT aplica_fisica
        BIT aplica_moral
    }
    fiscal__datos_fiscales_cliente {
        BIGINT id_dato_fiscal PK
        BIGINT cliente FK "FK -> clientes.clientes"
        VARCHAR_13 rfc_emisor
        NVARCHAR_150 razon_social
        VARCHAR_10 codigo_postal_fiscal
        BIGINT regimen_sat FK "FK -> fiscal.regimenes_sat"
        BIGINT uso_cfdi_predeterminado FK "FK -> fiscal.usos_cfdi"
    }
    fiscal__facturas_cfdi {
        BIGINT id_factura PK
        BIGINT orden FK "FK -> ventas.ordenes"
        BIGINT dato_fiscal FK "FK -> fiscal.datos_fiscales_cliente"
        VARCHAR_10 serie_factura
        VARCHAR_20 folio_factura
        UNIQUEIDENTIFIER uuid_sat_fiscal UK
        NVARCHAR_MAX sello_digital_cfdi
    }
    fiscal__facturas_partidas {
        BIGINT id_factura_partida PK
        BIGINT factura FK "FK -> fiscal.facturas_cfdi"
        VARCHAR_10 clave_producto_servicio_sat
        VARCHAR_5 clave_unidad_sat
        DECIMAL_12_2 cantidad
    }
    fiscal__complementos_pago {
        BIGINT id_complemento_pago PK
        BIGINT factura FK "FK -> fiscal.facturas_cfdi"
        BIGINT transaccion FK "FK -> pagos.transacciones"
        UNIQUEIDENTIFIER uuid_sat_complemento UK
        INT numero_parcialidad
        DECIMAL_12_2 saldo_anterior
        DECIMAL_12_2 monto_pagado
    }
    fiscal__notas_credito {
        BIGINT id_nota_credito PK
        BIGINT factura FK "FK -> fiscal.facturas_cfdi"
        UNIQUEIDENTIFIER uuid_sat_nota_credito UK
        VARCHAR_3 motivo_devolucion_sat
        DECIMAL_12_2 subtotal_acreditado
        DECIMAL_12_2 iva_acreditado
    }
    fiscal__cancelaciones_cfdi {
        BIGINT id_cancelacion_cfdi PK
        BIGINT factura FK "FK -> fiscal.facturas_cfdi"
        VARCHAR_4 motivo_cancelacion_sat
        UNIQUEIDENTIFIER uuid_sustitucion
        NVARCHAR_MAX acuse_cancelacion_sat
    }
    promos__campanias {
        BIGINT id_campania PK
        NVARCHAR_30 codigo_campania UK
        NVARCHAR_100 nombre_campania
        DATETIME2_3 fecha_inicio
        DATETIME2_3 fecha_fin
    }
    promos__cupones {
        BIGINT id_cupon PK
        BIGINT campania FK "FK -> promos.campanias"
        NVARCHAR_30 codigo_cupon UK
        BIGINT tipo_descuento FK "FK -> ventas.tipos_descuento"
        DECIMAL_12_2 valor_descuento
        DECIMAL_12_2 monto_minimo_compra
        INT limite_usos_totales
    }
    promos__reglas_elegibilidad_cupon {
        BIGINT id_regla_cupon PK
        BIGINT cupon FK "UQ, FK -> promos.cupones"
        BIT solo_primera_compra
        BIT excluye_kits_promocionales
    }
    promos__cupones_categorias_excluidas {
        BIGINT id_cupon_exclusion PK
        BIGINT cupon FK "UQ, FK -> promos.cupones"
        BIGINT categoria FK "UQ, FK -> catalogo.categorias"
    }
    promos__redenciones_cupones {
        BIGINT id_redencion_cupon PK
        BIGINT cupon FK "FK -> promos.cupones"
        BIGINT cliente FK "FK -> clientes.clientes"
        BIGINT orden FK "FK -> ventas.ordenes"
        DECIMAL_12_2 monto_ahorrado
        DATETIME2_3 fecha_aplicacion
    }
    promos__ventas_flash_horarias {
        BIGINT id_venta_flash PK
        BIGINT variante_sku FK "FK -> catalogo.variantes_sku"
        DECIMAL_12_2 precio_oferta_flash
        INT stock_destinado_flash
        INT stock_vendido_flash
    }
    clientes__clientes_REF_SM1 ||--o{ ventas__carritos : "FK: cliente"
    ventas__carritos ||--o{ ventas__items_carrito : "FK: carrito"
    catalogo__variantes_sku_REF_SM1 ||--o{ ventas__items_carrito : "FK: variante_sku"
    ventas__carritos ||--o| ventas__carritos_abandonados_seguimiento : "FK,UQ: carrito"
    clientes__clientes_REF_SM1 ||--o{ ventas__suscripciones_cliente : "FK: cliente"
    clientes__direcciones_REF_SM1 ||--o{ ventas__suscripciones_cliente : "FK: direccion_entrega"
    ventas__frecuencias_suscripcion ||--o{ ventas__suscripciones_cliente : "FK: frecuencia_suscripcion"
    clientes__metodos_pago_tokenizados_REF_SM1 ||--o{ ventas__suscripciones_cliente : "FK: metodo_tokenizado"
    ventas__planes_suscripcion ||--o{ ventas__suscripciones_cliente : "FK: plan_suscripcion"
    ventas__suscripciones_cliente ||--o{ ventas__suscripciones_items : "FK: suscripcion_cliente"
    catalogo__variantes_sku_REF_SM1 ||--o{ ventas__suscripciones_items : "FK: variante_sku"
    ventas__suscripciones_cliente ||--o{ ventas__suscripciones_calendario_entregas : "FK: suscripcion_cliente"
    ventas__suscripciones_cliente ||--o{ ventas__suscripciones_bitacora_estados : "FK: suscripcion_cliente"
    catalogo__variantes_sku_REF_SM1 ||--o{ ventas__regalos_por_compra_gwp : "FK: variante_sku_regalo"
    clientes__clientes_REF_SM1 ||--o{ ventas__ordenes : "FK: cliente"
    clientes__direcciones_REF_SM1 ||--o{ ventas__ordenes : "FK: direccion_envio"
    clientes__direcciones_REF_SM1 |o--o{ ventas__ordenes : "FK: direccion_facturacion"
    ventas__estados_orden ||--o{ ventas__ordenes : "FK: estado_orden"
    ventas__motivos_cancelacion_orden |o--o{ ventas__ordenes : "FK: motivo_cancelacion"
    ventas__ordenes ||--o{ ventas__ordenes_detalles : "FK: orden"
    catalogo__variantes_sku_REF_SM1 ||--o{ ventas__ordenes_detalles : "FK: variante_sku"
    ventas__estados_orden ||--o{ ventas__ordenes_historial_estados : "FK: estado_orden"
    ventas__ordenes ||--o{ ventas__ordenes_historial_estados : "FK: orden"
    ventas__ordenes ||--o{ ventas__ordenes_splits_almacen : "FK: orden"
    ventas__ordenes ||--o{ ventas__ordenes_impuestos : "FK: orden"
    ventas__ordenes ||--o{ ventas__ordenes_descuentos : "FK: orden"
    ventas__tipos_descuento ||--o{ ventas__ordenes_descuentos : "FK: tipo_descuento"
    ventas__ordenes ||--o| ventas__ordenes_notas_instrucciones : "FK,UQ: orden"
    ventas__carritos ||--o{ ventas__reservas_temporales_stock : "FK: carrito"
    catalogo__variantes_sku_REF_SM1 ||--o{ ventas__reservas_temporales_stock : "FK: variante_sku"
    seguridad__usuarios_REF_SM1 ||--o{ ventas__afiliados_influencers : "FK: usuario"
    ventas__afiliados_influencers ||--o{ ventas__comisiones_afiliados : "FK: afiliado"
    ventas__ordenes ||--o| ventas__comisiones_afiliados : "FK,UQ: orden"
    pagos__metodos_pago ||--o{ pagos__transacciones : "FK: metodo_pago"
    ventas__ordenes ||--o{ pagos__transacciones : "FK: orden"
    pagos__proveedores_pasarela ||--o{ pagos__transacciones : "FK: proveedor_pasarela"
    pagos__transacciones ||--o{ pagos__intentos_cobro : "FK: transaccion"
    pagos__metodos_pago ||--o{ pagos__split_multipagos : "FK: metodo_pago"
    ventas__ordenes ||--o{ pagos__split_multipagos : "FK: orden"
    clientes__clientes_REF_SM1 ||--o| pagos__billetera_electronica : "FK,UQ: cliente"
    pagos__billetera_electronica ||--o{ pagos__movimientos_billetera : "FK: billetera"
    clientes__clientes_REF_SM1 ||--o{ pagos__tarjetas_regalo_giftcards : "FK: cliente_comprador"
    pagos__tarjetas_regalo_giftcards ||--o{ pagos__redenciones_giftcards : "FK: giftcard"
    ventas__ordenes ||--o{ pagos__redenciones_giftcards : "FK: orden"
    ventas__ordenes ||--o| pagos__evaluaciones_antifraude : "FK,UQ: orden"
    pagos__reglas_antifraude |o--o{ pagos__evaluaciones_antifraude : "FK: regla_antifraude"
    pagos__transacciones ||--o{ pagos__contracargos_chargebacks : "FK: transaccion"
    pagos__transacciones ||--o{ pagos__reembolsos_transaccion : "FK: transaccion"
    clientes__clientes_REF_SM1 ||--o{ fiscal__datos_fiscales_cliente : "FK: cliente"
    fiscal__regimenes_sat ||--o{ fiscal__datos_fiscales_cliente : "FK: regimen_sat"
    fiscal__usos_cfdi ||--o{ fiscal__datos_fiscales_cliente : "FK: uso_cfdi_predeterminado"
    fiscal__datos_fiscales_cliente ||--o{ fiscal__facturas_cfdi : "FK: dato_fiscal"
    ventas__ordenes ||--o{ fiscal__facturas_cfdi : "FK: orden"
    fiscal__facturas_cfdi ||--o{ fiscal__facturas_partidas : "FK: factura"
    fiscal__facturas_cfdi ||--o{ fiscal__complementos_pago : "FK: factura"
    pagos__transacciones ||--o{ fiscal__complementos_pago : "FK: transaccion"
    fiscal__facturas_cfdi ||--o{ fiscal__notas_credito : "FK: factura"
    fiscal__facturas_cfdi ||--o{ fiscal__cancelaciones_cfdi : "FK: factura"
    promos__campanias ||--o{ promos__cupones : "FK: campania"
    ventas__tipos_descuento ||--o{ promos__cupones : "FK: tipo_descuento"
    promos__cupones ||--o| promos__reglas_elegibilidad_cupon : "FK,UQ: cupon"
    catalogo__categorias_REF_SM1 ||--o{ promos__cupones_categorias_excluidas : "FK: categoria"
    promos__cupones ||--o{ promos__cupones_categorias_excluidas : "FK: cupon"
    clientes__clientes_REF_SM1 ||--o{ promos__redenciones_cupones : "FK: cliente"
    promos__cupones ||--o{ promos__redenciones_cupones : "FK: cupon"
    ventas__ordenes ||--o{ promos__redenciones_cupones : "FK: orden"
    catalogo__variantes_sku_REF_SM1 ||--o{ promos__ventas_flash_horarias : "FK: variante_sku"
```

**Esquema Relacional Formal — Submódulo 2 (50 Relaciones: Tablas 051–100):**

| # | Relación (`esquema.tabla`) | Esquema Relacional Formal (<u>PK</u>, *FK → ref*, `[UQ]` y atributos de dominio) |
| :---: | :--- | :--- |
| 051 | `ventas.tipos_descuento` | `ventas.tipos_descuento`(**<u>id_tipo_descuento</u>** `PK`, codigo_descuento `[UQ]`, nombre, descripcion, *[+7 cols auditoría]*) |
| 052 | `ventas.estados_orden` | `ventas.estados_orden`(**<u>id_estado_orden</u>** `PK`, codigo_estado `[UQ]`, nombre_estado, descripcion, es_terminal, *[+7 cols auditoría]*) |
| 053 | `ventas.motivos_cancelacion_orden` | `ventas.motivos_cancelacion_orden`(**<u>id_motivo_cancelacion</u>** `PK`, codigo_motivo `[UQ]`, descripcion_motivo, es_atribuible_cliente, *[+7 cols auditoría]*) |
| 054 | `ventas.carritos` | `ventas.carritos`(**<u>id_carrito</u>** `PK`, *cliente* `[FK → clientes.clientes]`, token_sesion_carrito `[UQ]`, fecha_ultima_actividad, convertido_a_orden, *[+7 cols auditoría]*) |
| 055 | `ventas.items_carrito` | `ventas.items_carrito`(**<u>id_item_carrito</u>** `PK`, *carrito* `[FK, UQ → ventas.carritos]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, cantidad, precio_unitario_capturado, fecha_agregado, *[+7 cols auditoría]*) |
| 056 | `ventas.carritos_abandonados_seguimiento` | `ventas.carritos_abandonados_seguimiento`(**<u>id_seguimiento_carrito</u>** `PK`, *carrito* `[FK, UQ → ventas.carritos]`, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, *[+7 cols auditoría]*) |
| 057 | `ventas.planes_suscripcion` | `ventas.planes_suscripcion`(**<u>id_plan_suscripcion</u>** `PK`, codigo_plan `[UQ]`, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, *[+7 cols auditoría]*) |
| 058 | `ventas.frecuencias_suscripcion` | `ventas.frecuencias_suscripcion`(**<u>id_frecuencia_suscripcion</u>** `PK`, codigo_frecuencia `[UQ]`, nombre, intervalo_dias, *[+7 cols auditoría]*) |
| 059 | `ventas.suscripciones_cliente` | `ventas.suscripciones_cliente`(**<u>id_suscripcion_cliente</u>** `PK`, folio_suscripcion `[UQ]`, *cliente* `[FK → clientes.clientes]`, *plan_suscripcion* `[FK → ventas.planes_suscripcion]`, *frecuencia_suscripcion* `[FK → ventas.frecuencias_suscripcion]`, *direccion_entrega* `[FK → clientes.direcciones]`, *metodo_tokenizado* `[FK → clientes.metodos_pago_tokenizados]`, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, *[+7 cols auditoría]*) |
| 060 | `ventas.suscripciones_items` | `ventas.suscripciones_items`(**<u>id_suscripcion_item</u>** `PK`, *suscripcion_cliente* `[FK, UQ → ventas.suscripciones_cliente]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, cantidad, precio_congelado_suscripcion, *[+7 cols auditoría]*) |
| 061 | `ventas.suscripciones_calendario_entregas` | `ventas.suscripciones_calendario_entregas`(**<u>id_entrega_programada</u>** `PK`, *suscripcion_cliente* `[FK, UQ → ventas.suscripciones_cliente]`, fecha_programada_despacho, numero_ciclo_periodo `[UQ]`, estado_despacho, *[+7 cols auditoría]*) |
| 062 | `ventas.suscripciones_bitacora_estados` | `ventas.suscripciones_bitacora_estados`(**<u>id_bitacora_suscripcion</u>** `PK`, *suscripcion_cliente* `[FK → ventas.suscripciones_cliente]`, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, *[+7 cols auditoría]*) |
| 063 | `ventas.regalos_por_compra_gwp` | `ventas.regalos_por_compra_gwp`(**<u>id_regalo_compra</u>** `PK`, codigo_promocion_gwp `[UQ]`, nombre_promocion, monto_minimo_requerido, *variante_sku_regalo* `[FK → catalogo.variantes_sku]`, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, *[+7 cols auditoría]*) |
| 064 | `ventas.ordenes` | `ventas.ordenes`(**<u>id_orden</u>** `PK`, folio_orden `[UQ]`, *cliente* `[FK → clientes.clientes]`, *estado_orden* `[FK → ventas.estados_orden]`, *motivo_cancelacion* `[FK → ventas.motivos_cancelacion_orden]`, *direccion_envio* `[FK → clientes.direcciones]`, *direccion_facturacion* `[FK → clientes.direcciones]`, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, *[+7 cols auditoría]*) |
| 065 | `ventas.ordenes_detalles` | `ventas.ordenes_detalles`(**<u>id_orden_detalle</u>** `PK`, *orden* `[FK, UQ → ventas.ordenes]`, *variante_sku* `[FK → catalogo.variantes_sku]`, numero_partida `[UQ]`, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, *[+7 cols auditoría]*) |
| 066 | `ventas.ordenes_historial_estados` | `ventas.ordenes_historial_estados`(**<u>id_orden_historial</u>** `PK`, *orden* `[FK → ventas.ordenes]`, *estado_orden* `[FK → ventas.estados_orden]`, comentario_operativo, fecha_registro, *[+7 cols auditoría]*) |
| 067 | `ventas.ordenes_splits_almacen` | `ventas.ordenes_splits_almacen`(**<u>id_orden_split</u>** `PK`, *orden* `[FK → ventas.ordenes]`, sub_folio_split `[UQ]`, estado_split, *[+7 cols auditoría]*) |
| 068 | `ventas.ordenes_impuestos` | `ventas.ordenes_impuestos`(**<u>id_orden_impuesto</u>** `PK`, *orden* `[FK → ventas.ordenes]`, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, *[+7 cols auditoría]*) |
| 069 | `ventas.ordenes_descuentos` | `ventas.ordenes_descuentos`(**<u>id_orden_descuento</u>** `PK`, *orden* `[FK → ventas.ordenes]`, *tipo_descuento* `[FK → ventas.tipos_descuento]`, codigo_promocion_aplicado, monto_descontado, *[+7 cols auditoría]*) |
| 070 | `ventas.ordenes_notas_instrucciones` | `ventas.ordenes_notas_instrucciones`(**<u>id_orden_nota</u>** `PK`, *orden* `[FK, UQ → ventas.ordenes]`, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, *[+7 cols auditoría]*) |
| 071 | `ventas.reservas_temporales_stock` | `ventas.reservas_temporales_stock`(**<u>id_reserva_stock</u>** `PK`, *carrito* `[FK → ventas.carritos]`, *variante_sku* `[FK → catalogo.variantes_sku]`, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, *[+7 cols auditoría]*) |
| 072 | `ventas.afiliados_influencers` | `ventas.afiliados_influencers`(**<u>id_afiliado</u>** `PK`, codigo_afiliado `[UQ]`, *usuario* `[FK → seguridad.usuarios]`, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, *[+7 cols auditoría]*) |
| 073 | `ventas.comisiones_afiliados` | `ventas.comisiones_afiliados`(**<u>id_comision_afiliado</u>** `PK`, *afiliado* `[FK → ventas.afiliados_influencers]`, *orden* `[FK, UQ → ventas.ordenes]`, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, *[+7 cols auditoría]*) |
| 074 | `pagos.proveedores_pasarela` | `pagos.proveedores_pasarela`(**<u>id_proveedor_pasarela</u>** `PK`, codigo_pasarela `[UQ]`, nombre_comercial, url_webhook, *[+7 cols auditoría]*) |
| 075 | `pagos.metodos_pago` | `pagos.metodos_pago`(**<u>id_metodo_pago</u>** `PK`, codigo_metodo `[UQ]`, nombre_metodo, comision_porcentual_fija, *[+7 cols auditoría]*) |
| 076 | `pagos.transacciones` | `pagos.transacciones`(**<u>id_transaccion</u>** `PK`, folio_transaccion `[UQ]`, *orden* `[FK → ventas.ordenes]`, *proveedor_pasarela* `[FK → pagos.proveedores_pasarela]`, *metodo_pago* `[FK → pagos.metodos_pago]`, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, *[+7 cols auditoría]*) |
| 077 | `pagos.intentos_cobro` | `pagos.intentos_cobro`(**<u>id_intento_cobro</u>** `PK`, *transaccion* `[FK → pagos.transacciones]`, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, *[+7 cols auditoría]*) |
| 078 | `pagos.split_multipagos` | `pagos.split_multipagos`(**<u>id_split_pago</u>** `PK`, *orden* `[FK → ventas.ordenes]`, *metodo_pago* `[FK → pagos.metodos_pago]`, monto_asignado, referencia_comprobante, *[+7 cols auditoría]*) |
| 079 | `pagos.billetera_electronica` | `pagos.billetera_electronica`(**<u>id_billetera</u>** `PK`, *cliente* `[FK, UQ → clientes.clientes]`, saldo_disponible, saldo_bloqueado_retenido, *[+7 cols auditoría]*) |
| 080 | `pagos.movimientos_billetera` | `pagos.movimientos_billetera`(**<u>id_movimiento_billetera</u>** `PK`, *billetera* `[FK → pagos.billetera_electronica]`, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, *[+7 cols auditoría]*) |
| 081 | `pagos.tarjetas_regalo_giftcards` | `pagos.tarjetas_regalo_giftcards`(**<u>id_giftcard</u>** `PK`, codigo_giftcard_hash `[UQ]`, monto_inicial, saldo_actual, fecha_vencimiento, *cliente_comprador* `[FK → clientes.clientes]`, *[+7 cols auditoría]*) |
| 082 | `pagos.redenciones_giftcards` | `pagos.redenciones_giftcards`(**<u>id_redencion_giftcard</u>** `PK`, *giftcard* `[FK → pagos.tarjetas_regalo_giftcards]`, *orden* `[FK → ventas.ordenes]`, monto_redimido, *[+7 cols auditoría]*) |
| 083 | `pagos.reglas_antifraude` | `pagos.reglas_antifraude`(**<u>id_regla_antifraude</u>** `PK`, codigo_regla `[UQ]`, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, *[+7 cols auditoría]*) |
| 084 | `pagos.evaluaciones_antifraude` | `pagos.evaluaciones_antifraude`(**<u>id_evaluacion_fraude</u>** `PK`, *orden* `[FK, UQ → ventas.ordenes]`, *regla_antifraude* `[FK → pagos.reglas_antifraude]`, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, *[+7 cols auditoría]*) |
| 085 | `pagos.contracargos_chargebacks` | `pagos.contracargos_chargebacks`(**<u>id_contracargo</u>** `PK`, *transaccion* `[FK → pagos.transacciones]`, folio_disputa_pasarela `[UQ]`, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, *[+7 cols auditoría]*) |
| 086 | `pagos.reembolsos_transaccion` | `pagos.reembolsos_transaccion`(**<u>id_reembolso</u>** `PK`, *transaccion* `[FK → pagos.transacciones]`, folio_reembolso_pasarela `[UQ]`, monto_reembolsado, motivo_reembolso, fecha_reembolso, *[+7 cols auditoría]*) |
| 087 | `fiscal.regimenes_sat` | `fiscal.regimenes_sat`(**<u>id_regimen_sat</u>** `PK`, clave_regimen_sat `[UQ]`, descripcion, aplica_persona_fisica, aplica_persona_moral, *[+7 cols auditoría]*) |
| 088 | `fiscal.usos_cfdi` | `fiscal.usos_cfdi`(**<u>id_uso_cfdi</u>** `PK`, clave_uso_cfdi `[UQ]`, descripcion, aplica_fisica, aplica_moral, *[+7 cols auditoría]*) |
| 089 | `fiscal.datos_fiscales_cliente` | `fiscal.datos_fiscales_cliente`(**<u>id_dato_fiscal</u>** `PK`, *cliente* `[FK → clientes.clientes]`, rfc_emisor, razon_social, codigo_postal_fiscal, *regimen_sat* `[FK → fiscal.regimenes_sat]`, *uso_cfdi_predeterminado* `[FK → fiscal.usos_cfdi]`, correo_envio_cfdi, *[+7 cols auditoría]*) |
| 090 | `fiscal.facturas_cfdi` | `fiscal.facturas_cfdi`(**<u>id_factura</u>** `PK`, *orden* `[FK → ventas.ordenes]`, *dato_fiscal* `[FK → fiscal.datos_fiscales_cliente]`, serie_factura, folio_factura, uuid_sat_fiscal `[UQ]`, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, *[+7 cols auditoría]*) |
| 091 | `fiscal.facturas_partidas` | `fiscal.facturas_partidas`(**<u>id_factura_partida</u>** `PK`, *factura* `[FK → fiscal.facturas_cfdi]`, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, *[+7 cols auditoría]*) |
| 092 | `fiscal.complementos_pago` | `fiscal.complementos_pago`(**<u>id_complemento_pago</u>** `PK`, *factura* `[FK → fiscal.facturas_cfdi]`, *transaccion* `[FK → pagos.transacciones]`, uuid_sat_complemento `[UQ]`, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, *[+7 cols auditoría]*) |
| 093 | `fiscal.notas_credito` | `fiscal.notas_credito`(**<u>id_nota_credito</u>** `PK`, *factura* `[FK → fiscal.facturas_cfdi]`, uuid_sat_nota_credito `[UQ]`, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, *[+7 cols auditoría]*) |
| 094 | `fiscal.cancelaciones_cfdi` | `fiscal.cancelaciones_cfdi`(**<u>id_cancelacion_cfdi</u>** `PK`, *factura* `[FK → fiscal.facturas_cfdi]`, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, *[+7 cols auditoría]*) |
| 095 | `promos.campanias` | `promos.campanias`(**<u>id_campania</u>** `PK`, codigo_campania `[UQ]`, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, *[+7 cols auditoría]*) |
| 096 | `promos.cupones` | `promos.cupones`(**<u>id_cupon</u>** `PK`, *campania* `[FK → promos.campanias]`, codigo_cupon `[UQ]`, *tipo_descuento* `[FK → ventas.tipos_descuento]`, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, *[+7 cols auditoría]*) |
| 097 | `promos.reglas_elegibilidad_cupon` | `promos.reglas_elegibilidad_cupon`(**<u>id_regla_cupon</u>** `PK`, *cupon* `[FK, UQ → promos.cupones]`, solo_primera_compra, excluye_kits_promocionales, *[+7 cols auditoría]*) |
| 098 | `promos.cupones_categorias_excluidas` | `promos.cupones_categorias_excluidas`(**<u>id_cupon_exclusion</u>** `PK`, *cupon* `[FK, UQ → promos.cupones]`, *categoria* `[FK, UQ → catalogo.categorias]`, *[+7 cols auditoría]*) |
| 099 | `promos.redenciones_cupones` | `promos.redenciones_cupones`(**<u>id_redencion_cupon</u>** `PK`, *cupon* `[FK → promos.cupones]`, *cliente* `[FK → clientes.clientes]`, *orden* `[FK → ventas.ordenes]`, monto_ahorrado, fecha_aplicacion, *[+7 cols auditoría]*) |
| 100 | `promos.ventas_flash_horarias` | `promos.ventas_flash_horarias`(**<u>id_venta_flash</u>** `PK`, *variante_sku* `[FK → catalogo.variantes_sku]`, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, *[+7 cols auditoría]*) |

---

### 1.5 Submódulo 3: Compras, WMS FEFO, Envíos, Postventa RMA y Auditoría Forense (Tablas 101–150)

#### 1.5.1 Diagrama Entidad-Relación (E-R) — Submódulo 3 (Tablas 101–150)

> [!NOTE]
> **Conteo exacto del Submódulo 3 (Autor: Eduardo Salazar Martínez):** contiene exactamente **50 entidades propias** (Tablas `101`–`150`). Adicionalmente se muestran **5 nodos puente externos** etiquetados con `_REF_SM1` / `_REF_SM2` (`USUARIOS_REF_SM1`, `CLIENTES_REF_SM1`, `VARIANTES_SKU_REF_SM1`, `ORDENES_REF_SM2` y `ORDENES_SPLITS_ALMACEN_REF_SM2`) únicamente para visualizar sus relaciones FK inter-módulo; en el diagrama global `.drawio`/`.html` cada tabla aparece una sola vez (`150` exactas).

```mermaid
erDiagram
    PROVEEDORES ||--o{ CONTACTOS_PROVEEDOR : "asigna (1,N)"
    PROVEEDORES ||--o{ PROVEEDOR_SLAS : "pacta (1,N)"
    PROVEEDORES ||--o{ PROVEEDOR_PRODUCTOS : "suministra (1,N)"
    PROVEEDORES ||--o{ ORDENES_COMPRA : "recibe (0,N)"
    ESTADOS_ORDEN_COMPRA ||--o{ ORDENES_COMPRA : "controla (0,N)"
    REQUISICIONES ||--|{ REQUISICIONES_DETALLES : "solicita (1,N)"
    ORDENES_COMPRA ||--|{ ORDENES_COMPRA_DETALLES : "detalla (1,N)"
    ORDENES_COMPRA ||--o{ RECEPCIONES_MERCANCIA : "ingresa (0,N)"
    RECEPCIONES_MERCANCIA ||--|{ RECEPCIONES_DETALLES : "registra (1,N)"
    RECEPCIONES_DETALLES ||--o| INSPECCIONES_SANITARIAS_QA : "dictamina (0,1)"

    ALMACENES_CEDIS ||--|{ ZONAS_ALMACEN : "sectorializa (1,N)"
    ZONAS_ALMACEN ||--|{ PASILLOS_UBICACIONES : "contiene (1,N)"
    ZONAS_ALMACEN ||--o{ MONITOREO_TEMPERATURA_HUMEDAD : "telemetria (0,N)"
    VARIANTES_SKU_REF_SM1 ||--o{ LOTES_FABRICACION_SANITARIA : "produce (1,N)"
    LOTES_FABRICACION_SANITARIA ||--o{ INVENTARIO_LOTES_UBICACION : "ubica (1,N)"
    PASILLOS_UBICACIONES ||--o{ INVENTARIO_LOTES_UBICACION : "aloja (0,N)"
    TIPOS_MOVIMIENTO_INVENTARIO ||--o{ KARDEX_MOVIMIENTOS : "clasifica (0,N)"
    LOTES_FABRICACION_SANITARIA ||--o{ KARDEX_MOVIMIENTOS : "traza (1,N)"
    LOTES_FABRICACION_SANITARIA ||--o{ ALERTAS_CADUCIDAD_PROXIMA : "alerta_fefo (0,N)"
    LOTES_FABRICACION_SANITARIA ||--o{ MERMAS_DESTRUCCION_SANITARIA : "baja_sanitaria (0,N)"
    ALMACENES_CEDIS ||--o{ TRANSFERENCIAS_ALMACENES : "origina_recibe (0,N)"
    TRANSFERENCIAS_ALMACENES ||--|{ TRANSFERENCIAS_DETALLES : "detalla (1,N)"
    ALMACENES_CEDIS ||--o{ CONTEOS_CICLICOS_AUDITORIA : "audita (0,N)"
    CONTEOS_CICLICOS_AUDITORIA ||--|{ CONTEOS_CICLICOS_DETALLES : "verifica (1,N)"

    ORDENES_SPLITS_ALMACEN_REF_SM2 ||--o{ DESPACHOS_ORDEN : "despacha (1,N)"
    TRANSPORTISTAS_PAQUETERIAS ||--o{ DESPACHOS_ORDEN : "transporta (0,N)"
    TIPOS_SERVICIO_ENVIO ||--o{ DESPACHOS_ORDEN : "modalidad (0,N)"
    TRANSPORTISTAS_PAQUETERIAS ||--o{ TARIFAS_ZONAS_POSTALES : "tarifa_cp (1,N)"
    TIPOS_SERVICIO_ENVIO ||--o{ TARIFAS_ZONAS_POSTALES : "cotiza_servicio (1,N)"
    TRANSPORTISTAS_PAQUETERIAS ||--o{ PUNTOS_RECOLECCION_PICKUP : "opera_locker (0,N)"
    ALMACENES_CEDIS ||--o{ PUNTOS_RECOLECCION_PICKUP : "abastece (0,N)"
    DESPACHOS_ORDEN ||--|{ PAQUETES_BULTOS : "embala (1,N)"
    PAQUETES_BULTOS ||--|{ PAQUETES_CONTENIDO_LOTES : "traza_lote (1,N)"
    PAQUETES_BULTOS ||--o| GUIAS_RASTREO : "etiqueta (0,1)"
    GUIAS_RASTREO ||--o{ EVENTOS_TRACKING_BITACORA : "reporta (0,N)"
    DESPACHOS_ORDEN ||--o{ INTENTOS_ENTREGA_FALLIDOS : "registra (0,N)"
    DESPACHOS_ORDEN ||--o{ INCIDENCIAS_LOGISTICAS : "incide (0,N)"
    DESPACHOS_ORDEN ||--o| SEGUROS_MERCANCIA : "asegura (0,1)"

    ORDENES_REF_SM2 ||--o{ SOLICITUDES_RMA : "devuelve (0,N)"
    MOTIVOS_DEVOLUCION_RMA ||--o{ SOLICITUDES_RMA : "motiva (0,N)"
    SOLICITUDES_RMA ||--|{ RMA_DETALLES : "reclama (1,N)"
    RMA_DETALLES ||--o| INSPECCION_SANITARIA_RETORNO : "dictamina_higiene (0,1)"
    CLIENTES_REF_SM1 ||--o{ TICKETS_SOPORTE : "abre (0,N)"
    TICKETS_SOPORTE ||--|{ TICKETS_MENSAJES : "conversa (1,N)"
    CLIENTES_REF_SM1 ||--o{ REPORTES_FARMACOVIGILANCIA : "notifica_ram (0,N)"

    TIPOS_EVENTO_SISTEMA ||--o{ BITACORA_SEGURIDAD_GLOBAL : "categoriza (0,N)"
    USUARIOS_REF_SM1 ||--o{ BITACORA_SEGURIDAD_GLOBAL : "ejecuta (0,N)"
    USUARIOS_REF_SM1 ||--o{ BITACORA_CAMBIOS_DATOS : "modifica (0,N)"
    USUARIOS_REF_SM1 ||--o{ PARAMETROS_CONFIGURACION : "administra (0,N)"
    USUARIOS_REF_SM1 ||--o{ NOTIFICACIONES_PUSH_EMAIL : "recibe (0,N)"
```

#### 1.5.2 Modelo Relacional (Esquema Lógico con PK, FK, UK y Tipos de Datos) — Submódulo 3 (Tablas 101–150)

> [!TIP]
> **Modelo Relacional del Submódulo 3 (Eduardo Salazar Martínez):** exactamente **50 tablas relacionales propias** (Tablas 101–150) con llaves primarias (`PK`), llaves foráneas (`FK`), llaves candidatas únicas (`UK`) y tipos de datos sincronizados al 100% con el DDL de SQL Server / PostgreSQL. Incluye sus **63 llaves foráneas** reales del DDL (intra-módulo e inter-módulo); los **7 nodos puente externos** etiquetados con `_REF_SM#` únicamente representan la tabla destino de FKs externas: `seguridad__usuarios_REF_SM1` (`seguridad.usuarios`), `clientes__clientes_REF_SM1` (`clientes.clientes`), `catalogo__productos_maestros_REF_SM1` (`catalogo.productos_maestros`), `catalogo__variantes_sku_REF_SM1` (`catalogo.variantes_sku`), `ventas__ordenes_REF_SM2` (`ventas.ordenes`), `ventas__ordenes_detalles_REF_SM2` (`ventas.ordenes_detalles`), `ventas__ordenes_splits_almacen_REF_SM2` (`ventas.ordenes_splits_almacen`). *(Las 7 columnas estándar de auditoría/Soft Delete se omiten en las cajas visuales salvo cuando son `FK`, y se indican como `[+7 cols auditoría]` en el esquema formal).*

```mermaid
erDiagram
    seguridad__usuarios_REF_SM1 {
        BIGINT id_usuario PK "Ref externa SM1"
    }
    clientes__clientes_REF_SM1 {
        BIGINT id_cliente PK "Ref externa SM1"
    }
    catalogo__productos_maestros_REF_SM1 {
        BIGINT id_producto PK "Ref externa SM1"
    }
    catalogo__variantes_sku_REF_SM1 {
        BIGINT id_variante_sku PK "Ref externa SM1"
    }
    ventas__ordenes_REF_SM2 {
        BIGINT id_orden PK "Ref externa SM2"
    }
    ventas__ordenes_detalles_REF_SM2 {
        BIGINT id_orden_detalle PK "Ref externa SM2"
    }
    ventas__ordenes_splits_almacen_REF_SM2 {
        BIGINT id_orden_split PK "Ref externa SM2"
    }
    compras__estados_orden_compra {
        BIGINT id_estado_oc PK
        NVARCHAR_20 codigo_estado UK
        NVARCHAR_50 nombre_estado
        NVARCHAR_200 descripcion
    }
    compras__proveedores {
        BIGINT id_proveedor PK
        NVARCHAR_30 codigo_proveedor UK
        NVARCHAR_150 razon_social
        NVARCHAR_120 nombre_comercial
        VARCHAR_13 rfc_proveedor UK
        NVARCHAR_60 pais_origen
    }
    compras__contactos_proveedor {
        BIGINT id_contacto_proveedor PK
        BIGINT proveedor FK "FK -> compras.proveedores"
        NVARCHAR_100 nombre_contacto
        NVARCHAR_80 puesto_cargo
        NVARCHAR_150 email_contacto
    }
    compras__proveedor_slas {
        BIGINT id_proveedor_sla PK
        BIGINT proveedor FK "FK -> compras.proveedores"
        INT tiempo_promedio_entrega_dias
        DECIMAL_4_2 porcentaje_tolerancia_mermas
        DECIMAL_4_2 penalizacion_por_dia_retraso_porc
    }
    compras__proveedor_productos {
        BIGINT id_proveedor_producto PK
        BIGINT proveedor FK "UQ, FK -> compras.proveedores"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        NVARCHAR_50 codigo_articulo_proveedor
        DECIMAL_12_2 costo_negociado_unitario
        INT lote_minimo_compra
    }
    compras__requisiciones {
        BIGINT id_requisicion PK
        NVARCHAR_35 folio_requisicion UK
        NVARCHAR_80 departamento_solicitante
        NVARCHAR_20 prioridad
        NVARCHAR_300 motivo_solicitud
    }
    compras__requisiciones_detalles {
        BIGINT id_requisicion_detalle PK
        BIGINT requisicion FK "UQ, FK -> compras.requisiciones"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        INT cantidad_requerida
        INT cantidad_aprobada
    }
    compras__ordenes_compra {
        BIGINT id_orden_compra PK
        NVARCHAR_35 folio_orden_compra UK
        BIGINT proveedor FK "FK -> compras.proveedores"
        BIGINT estado_oc FK "FK -> compras.estados_orden_compra"
        DATETIME2_3 fecha_emision
        DATE fecha_entrega_esperada
        DECIMAL_12_2 subtotal
    }
    compras__ordenes_compra_detalles {
        BIGINT id_orden_compra_detalle PK
        BIGINT orden_compra FK "UQ, FK -> compras.ordenes_compra"
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        INT cantidad_pedida
        INT cantidad_recibida
        DECIMAL_12_2 costo_unitario_compra
    }
    compras__recepciones_mercancia {
        BIGINT id_recepcion PK
        NVARCHAR_35 folio_recepcion UK
        BIGINT orden_compra FK "FK -> compras.ordenes_compra"
        NVARCHAR_60 numero_remision_proveedor
        DATETIME2_3 fecha_ingreso_muelle
        NVARCHAR_250 observaciones_chofer_transporte
    }
    compras__recepciones_detalles {
        BIGINT id_recepcion_detalle PK
        BIGINT recepcion FK "FK -> compras.recepciones_mercancia"
        BIGINT variante_sku FK "FK -> catalogo.variantes_sku"
        INT cantidad_recibida_bultos
        INT cantidad_unidades_inspeccionadas
        DECIMAL_4_1 temperatura_llegada_celsius
    }
    compras__inspecciones_sanitarias_qa {
        BIGINT id_inspeccion_qa PK
        BIGINT recepcion_detalle FK "FK -> compras.recepciones_detalles"
        BIT sellos_sanitarios_intactos
        BIT empaque_sin_derrames
        NVARCHAR_50 codigo_lote_laboratorio
    }
    wms__almacenes_cedis {
        BIGINT id_almacen PK
        NVARCHAR_20 codigo_almacen UK
        NVARCHAR_100 nombre_almacen
        NVARCHAR_150 calle_numero
        VARCHAR_10 codigo_postal
    }
    wms__zonas_almacen {
        BIGINT id_zona_almacen PK
        BIGINT almacen FK "UQ, FK -> wms.almacenes_cedis"
        NVARCHAR_20 codigo_zona UK
        NVARCHAR_150 descripcion
        DECIMAL_4_1 temperatura_min_celsius
        DECIMAL_4_1 temperatura_max_celsius
    }
    wms__pasillos_ubicaciones {
        BIGINT id_ubicacion PK
        BIGINT zona_almacen FK "FK -> wms.zonas_almacen"
        NVARCHAR_30 codigo_ubicacion UK
        DECIMAL_8_2 peso_maximo_kg
        BIT es_bloqueada_auditoria
    }
    wms__tipos_movimiento_inventario {
        BIGINT id_tipo_movimiento PK
        NVARCHAR_20 codigo_movimiento UK
        NVARCHAR_60 nombre_movimiento
        INT signo_afectacion
    }
    wms__lotes_fabricacion_sanitaria {
        BIGINT id_lote PK
        BIGINT variante_sku FK "UQ, FK -> catalogo.variantes_sku"
        NVARCHAR_60 numero_lote_fabricante UK
        DATE fecha_fabricacion
        DATE fecha_caducidad
        NVARCHAR_300 certificado_calidad_lote_url
    }
    wms__inventario_lotes_ubicacion {
        BIGINT id_inventario_stock PK
        BIGINT lote FK "UQ, FK -> wms.lotes_fabricacion_sanitaria"
        BIGINT ubicacion FK "UQ, FK -> wms.pasillos_ubicaciones"
        INT stock_disponible
        INT stock_apartado_pedidos
    }
    wms__kardex_movimientos {
        BIGINT id_kardex PK
        BIGINT inventario_stock FK "FK -> wms.inventario_lotes_ubicacion"
        BIGINT tipo_movimiento FK "FK -> wms.tipos_movimiento_inventario"
        INT cantidad_movimiento
        INT saldo_anterior
        INT saldo_resultante
    }
    wms__alertas_caducidad_proxima {
        BIGINT id_alerta_caducidad PK
        BIGINT lote FK "FK -> wms.lotes_fabricacion_sanitaria"
        INT dias_restantes_vida_util
        NVARCHAR_20 nivel_urgencia
        NVARCHAR_150 accion_comercial_sugerida
    }
    wms__mermas_destruccion_sanitaria {
        BIGINT id_merma_destruccion PK
        NVARCHAR_35 folio_acta_destruccion UK
        BIGINT lote FK "FK -> wms.lotes_fabricacion_sanitaria"
        INT cantidad_unidades_destruidas
        NVARCHAR_200 motivo_sanitario
        NVARCHAR_120 empresa_manifiesto_ecologico
    }
    wms__transferencias_almacenes {
        BIGINT id_transferencia PK
        NVARCHAR_35 folio_transferencia UK
        BIGINT almacen_origen FK "FK -> wms.almacenes_cedis"
        BIGINT almacen_destino FK "FK -> wms.almacenes_cedis"
        NVARCHAR_20 estado_transferencia
        DATETIME2_3 fecha_despacho
        DATETIME2_3 fecha_arribo
    }
    wms__transferencias_detalles {
        BIGINT id_transferencia_detalle PK
        BIGINT transferencia FK "FK -> wms.transferencias_almacenes"
        BIGINT lote FK "FK -> wms.lotes_fabricacion_sanitaria"
        INT cantidad_enviada
        INT cantidad_recibida
    }
    wms__conteos_ciclicos_auditoria {
        BIGINT id_conteo_ciclico PK
        NVARCHAR_35 folio_auditoria UK
        BIGINT almacen FK "FK -> wms.almacenes_cedis"
        DATE fecha_conteo
        NVARCHAR_20 tipo_conteo
    }
    wms__conteos_ciclicos_detalles {
        BIGINT id_conteo_detalle PK
        BIGINT conteo_ciclico FK "FK -> wms.conteos_ciclicos_auditoria"
        BIGINT inventario_stock FK "FK -> wms.inventario_lotes_ubicacion"
        INT stock_sistema_teorico
        INT stock_conteo_fisico
        INT diferencia_piezas
    }
    wms__monitoreo_temperatura_humedad {
        BIGINT id_telemetria_sensor PK
        BIGINT zona_almacen FK "FK -> wms.zonas_almacen"
        NVARCHAR_30 codigo_sensor_iot
        DECIMAL_4_1 temperatura_registrada_celsius
        DECIMAL_4_1 humedad_relativa_porcentaje
    }
    envios__transportistas_paqueterias {
        BIGINT id_transportista PK
        NVARCHAR_20 codigo_transportista UK
        NVARCHAR_60 nombre_comercial
        NVARCHAR_250 api_endpoint_tracking
    }
    envios__tipos_servicio_envio {
        BIGINT id_servicio_envio PK
        NVARCHAR_20 codigo_servicio UK
        NVARCHAR_60 nombre_servicio
        INT tiempo_garantizado_horas
    }
    envios__tarifas_zonas_postales {
        BIGINT id_tarifa_zona PK
        BIGINT transportista FK "FK -> envios.transportistas_paqueterias"
        BIGINT servicio_envio FK "FK -> envios.tipos_servicio_envio"
        VARCHAR_3 codigo_postal_origen_prefijo
        VARCHAR_3 codigo_postal_destino_prefijo
        DECIMAL_6_2 peso_limite_kg
    }
    envios__despachos_orden {
        BIGINT id_despacho PK
        NVARCHAR_35 folio_despacho UK
        BIGINT orden_split FK "FK -> ventas.ordenes_splits_almacen"
        BIGINT transportista FK "FK -> envios.transportistas_paqueterias"
        BIGINT servicio_envio FK "FK -> envios.tipos_servicio_envio"
        DATETIME2_3 fecha_recoleccion_paqueteria
        DATE fecha_promesa_entrega
        DATETIME2_3 fecha_entrega_real
    }
    envios__paquetes_bultos {
        BIGINT id_paquete_bulto PK
        BIGINT despacho FK "FK -> envios.despachos_orden"
        NVARCHAR_40 codigo_bulto UK
        DECIMAL_6_2 peso_bruto_kg
        DECIMAL_5_1 alto_cm
        DECIMAL_5_1 ancho_cm
    }
    envios__paquetes_contenido_lotes {
        BIGINT id_contenido_paquete PK
        BIGINT paquete_bulto FK "FK -> envios.paquetes_bultos"
        BIGINT orden_detalle FK "FK -> ventas.ordenes_detalles"
        BIGINT lote FK "FK -> wms.lotes_fabricacion_sanitaria"
        INT cantidad_piezas_en_paquete
    }
    envios__guias_rastreo {
        BIGINT id_guia_rastreo PK
        BIGINT paquete_bulto FK "FK -> envios.paquetes_bultos"
        NVARCHAR_80 numero_guia_tracking UK
        NVARCHAR_300 url_rastreo_directo
        NVARCHAR_300 etiqueta_pdf_base64_url
    }
    envios__eventos_tracking_bitacora {
        BIGINT id_evento_tracking PK
        BIGINT guia_rastreo FK "FK -> envios.guias_rastreo"
        NVARCHAR_40 codigo_estatus_paqueteria
        NVARCHAR_250 descripcion_evento
        NVARCHAR_100 ubicacion_ciudad_evento
    }
    envios__intentos_entrega_fallidos {
        BIGINT id_intento_fallido PK
        BIGINT despacho FK "FK -> envios.despachos_orden"
        INT numero_visita
        NVARCHAR_150 motivo_no_entrega
        DATETIME2_3 fecha_intento
    }
    envios__incidencias_logisticas {
        BIGINT id_incidencia_logistica PK
        BIGINT despacho FK "FK -> envios.despachos_orden"
        NVARCHAR_30 tipo_incidencia
        NVARCHAR_500 descripcion_hechos
        DECIMAL_12_2 indemnizacion_reclamada
    }
    envios__seguros_mercancia {
        BIGINT id_seguro_envio PK
        BIGINT despacho FK "UQ, FK -> envios.despachos_orden"
        NVARCHAR_100 aseguradora
        NVARCHAR_60 numero_poliza
        DECIMAL_12_2 valor_asegurado
    }
    envios__puntos_recoleccion_pickup {
        BIGINT id_punto_pickup PK
        BIGINT transportista FK "FK -> envios.transportistas_paqueterias"
        BIGINT almacen_origen FK "FK -> wms.almacenes_cedis"
        NVARCHAR_30 codigo_locker UK
        NVARCHAR_100 nombre_establecimiento
        NVARCHAR_200 direccion_completa
        NVARCHAR_100 horario_atencion
    }
    postventa__motivos_devolucion_rma {
        BIGINT id_motivo_rma PK
        NVARCHAR_20 codigo_motivo UK
        NVARCHAR_150 descripcion_motivo
        BIT requiere_dictamen_medico
    }
    postventa__solicitudes_rma {
        BIGINT id_solicitud_rma PK
        NVARCHAR_35 folio_rma UK
        BIGINT orden FK "FK -> ventas.ordenes"
        BIGINT motivo_rma FK "FK -> postventa.motivos_devolucion_rma"
        NVARCHAR_20 estado_rma
        NVARCHAR_300 fotografia_evidencia_url
        NVARCHAR_500 descripcion_caso_cliente
    }
    postventa__rma_detalles {
        BIGINT id_rma_detalle PK
        BIGINT solicitud_rma FK "FK -> postventa.solicitudes_rma"
        BIGINT orden_detalle FK "FK -> ventas.ordenes_detalles"
        INT cantidad_devuelta
    }
    postventa__inspeccion_sanitaria_retorno {
        BIGINT id_inspeccion_retorno PK
        BIGINT rma_detalle FK "UQ, FK -> postventa.rma_detalles"
        BIT sello_seguridad_fue_abierto
        DECIMAL_4_1 contenido_usado_porcentaje
        NVARCHAR_30 destino_sanitario_autorizado
    }
    postventa__tickets_soporte {
        BIGINT id_ticket PK
        NVARCHAR_35 folio_ticket UK
        BIGINT cliente FK "FK -> clientes.clientes"
        NVARCHAR_120 asunto
        NVARCHAR_30 categoria_ticket
        NVARCHAR_20 prioridad
    }
    postventa__tickets_mensajes {
        BIGINT id_ticket_mensaje PK
        BIGINT ticket FK "FK -> postventa.tickets_soporte"
        BIGINT usuario_emisor FK "FK -> seguridad.usuarios"
        NVARCHAR_MAX mensaje_cuerpo
        NVARCHAR_300 adjunto_url
    }
    postventa__reportes_farmacovigilancia {
        BIGINT id_reporte_farmacovigilancia PK
        NVARCHAR_45 folio_cofepris_ram UK
        BIGINT cliente FK "FK -> clientes.clientes"
        BIGINT producto FK "FK -> catalogo.productos_maestros"
        BIGINT lote FK "FK -> wms.lotes_fabricacion_sanitaria"
        NVARCHAR_MAX sintomas_reaccion_adversa
        BIT requirio_atencion_hospitalaria
        DATE fecha_aparicion_sintomas
    }
    auditoria__tipos_evento_sistema {
        BIGINT id_tipo_evento PK
        NVARCHAR_30 codigo_evento UK
        NVARCHAR_80 nombre_evento
        NVARCHAR_20 nivel_severidad
    }
    auditoria__bitacora_seguridad_global {
        BIGINT id_log_seguridad PK
        BIGINT tipo_evento FK "FK -> auditoria.tipos_evento_sistema"
        BIGINT usuario FK "FK -> seguridad.usuarios"
        NVARCHAR_45 direccion_ip
        NVARCHAR_350 user_agent
        NVARCHAR_60 modulo_origen
    }
    auditoria__bitacora_cambios_datos {
        BIGINT id_cambio_dato PK
        NVARCHAR_100 nombre_tabla
        BIGINT id_registro_afectado
        NVARCHAR_15 tipo_operacion
        BIGINT creado_por FK "FK -> seguridad.usuarios"
    }
    sistema__parametros_configuracion {
        BIGINT id_parametro PK
        NVARCHAR_60 clave_parametro UK
        NVARCHAR_500 valor_parametro
        NVARCHAR_20 tipo_dato
        NVARCHAR_250 descripcion
        BIGINT creado_por FK "FK -> seguridad.usuarios"
    }
    sistema__notificaciones_push_email {
        BIGINT id_notificacion PK
        BIGINT usuario_destinatario FK "FK -> seguridad.usuarios"
        NVARCHAR_20 tipo_canal
        NVARCHAR_150 titulo_asunto
        NVARCHAR_MAX cuerpo_mensaje
    }
    compras__proveedores ||--o{ compras__contactos_proveedor : "FK: proveedor"
    compras__proveedores ||--o{ compras__proveedor_slas : "FK: proveedor"
    compras__proveedores ||--o{ compras__proveedor_productos : "FK: proveedor"
    catalogo__variantes_sku_REF_SM1 ||--o{ compras__proveedor_productos : "FK: variante_sku"
    compras__requisiciones ||--o{ compras__requisiciones_detalles : "FK: requisicion"
    catalogo__variantes_sku_REF_SM1 ||--o{ compras__requisiciones_detalles : "FK: variante_sku"
    compras__estados_orden_compra ||--o{ compras__ordenes_compra : "FK: estado_oc"
    compras__proveedores ||--o{ compras__ordenes_compra : "FK: proveedor"
    compras__ordenes_compra ||--o{ compras__ordenes_compra_detalles : "FK: orden_compra"
    catalogo__variantes_sku_REF_SM1 ||--o{ compras__ordenes_compra_detalles : "FK: variante_sku"
    compras__ordenes_compra ||--o{ compras__recepciones_mercancia : "FK: orden_compra"
    compras__recepciones_mercancia ||--o{ compras__recepciones_detalles : "FK: recepcion"
    catalogo__variantes_sku_REF_SM1 ||--o{ compras__recepciones_detalles : "FK: variante_sku"
    compras__recepciones_detalles ||--o{ compras__inspecciones_sanitarias_qa : "FK: recepcion_detalle"
    wms__almacenes_cedis ||--o{ wms__zonas_almacen : "FK: almacen"
    wms__zonas_almacen ||--o{ wms__pasillos_ubicaciones : "FK: zona_almacen"
    catalogo__variantes_sku_REF_SM1 ||--o{ wms__lotes_fabricacion_sanitaria : "FK: variante_sku"
    wms__lotes_fabricacion_sanitaria ||--o{ wms__inventario_lotes_ubicacion : "FK: lote"
    wms__pasillos_ubicaciones ||--o{ wms__inventario_lotes_ubicacion : "FK: ubicacion"
    wms__inventario_lotes_ubicacion ||--o{ wms__kardex_movimientos : "FK: inventario_stock"
    wms__tipos_movimiento_inventario ||--o{ wms__kardex_movimientos : "FK: tipo_movimiento"
    wms__lotes_fabricacion_sanitaria ||--o{ wms__alertas_caducidad_proxima : "FK: lote"
    wms__lotes_fabricacion_sanitaria ||--o{ wms__mermas_destruccion_sanitaria : "FK: lote"
    wms__almacenes_cedis ||--o{ wms__transferencias_almacenes : "FK: almacen_destino"
    wms__almacenes_cedis ||--o{ wms__transferencias_almacenes : "FK: almacen_origen"
    wms__lotes_fabricacion_sanitaria ||--o{ wms__transferencias_detalles : "FK: lote"
    wms__transferencias_almacenes ||--o{ wms__transferencias_detalles : "FK: transferencia"
    wms__almacenes_cedis ||--o{ wms__conteos_ciclicos_auditoria : "FK: almacen"
    wms__conteos_ciclicos_auditoria ||--o{ wms__conteos_ciclicos_detalles : "FK: conteo_ciclico"
    wms__inventario_lotes_ubicacion ||--o{ wms__conteos_ciclicos_detalles : "FK: inventario_stock"
    wms__zonas_almacen ||--o{ wms__monitoreo_temperatura_humedad : "FK: zona_almacen"
    envios__tipos_servicio_envio ||--o{ envios__tarifas_zonas_postales : "FK: servicio_envio"
    envios__transportistas_paqueterias ||--o{ envios__tarifas_zonas_postales : "FK: transportista"
    ventas__ordenes_splits_almacen_REF_SM2 ||--o{ envios__despachos_orden : "FK: orden_split"
    envios__tipos_servicio_envio ||--o{ envios__despachos_orden : "FK: servicio_envio"
    envios__transportistas_paqueterias ||--o{ envios__despachos_orden : "FK: transportista"
    envios__despachos_orden ||--o{ envios__paquetes_bultos : "FK: despacho"
    wms__lotes_fabricacion_sanitaria ||--o{ envios__paquetes_contenido_lotes : "FK: lote"
    ventas__ordenes_detalles_REF_SM2 ||--o{ envios__paquetes_contenido_lotes : "FK: orden_detalle"
    envios__paquetes_bultos ||--o{ envios__paquetes_contenido_lotes : "FK: paquete_bulto"
    envios__paquetes_bultos ||--o{ envios__guias_rastreo : "FK: paquete_bulto"
    envios__guias_rastreo ||--o{ envios__eventos_tracking_bitacora : "FK: guia_rastreo"
    envios__despachos_orden ||--o{ envios__intentos_entrega_fallidos : "FK: despacho"
    envios__despachos_orden ||--o{ envios__incidencias_logisticas : "FK: despacho"
    envios__despachos_orden ||--o| envios__seguros_mercancia : "FK,UQ: despacho"
    wms__almacenes_cedis ||--o{ envios__puntos_recoleccion_pickup : "FK: almacen_origen"
    envios__transportistas_paqueterias ||--o{ envios__puntos_recoleccion_pickup : "FK: transportista"
    postventa__motivos_devolucion_rma ||--o{ postventa__solicitudes_rma : "FK: motivo_rma"
    ventas__ordenes_REF_SM2 ||--o{ postventa__solicitudes_rma : "FK: orden"
    ventas__ordenes_detalles_REF_SM2 ||--o{ postventa__rma_detalles : "FK: orden_detalle"
    postventa__solicitudes_rma ||--o{ postventa__rma_detalles : "FK: solicitud_rma"
    postventa__rma_detalles ||--o| postventa__inspeccion_sanitaria_retorno : "FK,UQ: rma_detalle"
    clientes__clientes_REF_SM1 ||--o{ postventa__tickets_soporte : "FK: cliente"
    postventa__tickets_soporte ||--o{ postventa__tickets_mensajes : "FK: ticket"
    seguridad__usuarios_REF_SM1 ||--o{ postventa__tickets_mensajes : "FK: usuario_emisor"
    clientes__clientes_REF_SM1 ||--o{ postventa__reportes_farmacovigilancia : "FK: cliente"
    wms__lotes_fabricacion_sanitaria ||--o{ postventa__reportes_farmacovigilancia : "FK: lote"
    catalogo__productos_maestros_REF_SM1 ||--o{ postventa__reportes_farmacovigilancia : "FK: producto"
    auditoria__tipos_evento_sistema ||--o{ auditoria__bitacora_seguridad_global : "FK: tipo_evento"
    seguridad__usuarios_REF_SM1 |o--o{ auditoria__bitacora_seguridad_global : "FK: usuario"
    seguridad__usuarios_REF_SM1 ||--o{ auditoria__bitacora_cambios_datos : "FK: creado_por"
    seguridad__usuarios_REF_SM1 ||--o{ sistema__parametros_configuracion : "FK: creado_por"
    seguridad__usuarios_REF_SM1 ||--o{ sistema__notificaciones_push_email : "FK: usuario_destinatario"
```

**Esquema Relacional Formal — Submódulo 3 (50 Relaciones: Tablas 101–150):**

| # | Relación (`esquema.tabla`) | Esquema Relacional Formal (<u>PK</u>, *FK → ref*, `[UQ]` y atributos de dominio) |
| :---: | :--- | :--- |
| 101 | `compras.estados_orden_compra` | `compras.estados_orden_compra`(**<u>id_estado_oc</u>** `PK`, codigo_estado `[UQ]`, nombre_estado, descripcion, *[+7 cols auditoría]*) |
| 102 | `compras.proveedores` | `compras.proveedores`(**<u>id_proveedor</u>** `PK`, codigo_proveedor `[UQ]`, razon_social, nombre_comercial, rfc_proveedor `[UQ]`, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, *[+7 cols auditoría]*) |
| 103 | `compras.contactos_proveedor` | `compras.contactos_proveedor`(**<u>id_contacto_proveedor</u>** `PK`, *proveedor* `[FK → compras.proveedores]`, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, *[+7 cols auditoría]*) |
| 104 | `compras.proveedor_slas` | `compras.proveedor_slas`(**<u>id_proveedor_sla</u>** `PK`, *proveedor* `[FK → compras.proveedores]`, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, *[+7 cols auditoría]*) |
| 105 | `compras.proveedor_productos` | `compras.proveedor_productos`(**<u>id_proveedor_producto</u>** `PK`, *proveedor* `[FK, UQ → compras.proveedores]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, *[+7 cols auditoría]*) |
| 106 | `compras.requisiciones` | `compras.requisiciones`(**<u>id_requisicion</u>** `PK`, folio_requisicion `[UQ]`, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, *[+7 cols auditoría]*) |
| 107 | `compras.requisiciones_detalles` | `compras.requisiciones_detalles`(**<u>id_requisicion_detalle</u>** `PK`, *requisicion* `[FK, UQ → compras.requisiciones]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, cantidad_requerida, cantidad_aprobada, *[+7 cols auditoría]*) |
| 108 | `compras.ordenes_compra` | `compras.ordenes_compra`(**<u>id_orden_compra</u>** `PK`, folio_orden_compra `[UQ]`, *proveedor* `[FK → compras.proveedores]`, *estado_oc* `[FK → compras.estados_orden_compra]`, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, *[+7 cols auditoría]*) |
| 109 | `compras.ordenes_compra_detalles` | `compras.ordenes_compra_detalles`(**<u>id_orden_compra_detalle</u>** `PK`, *orden_compra* `[FK, UQ → compras.ordenes_compra]`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, *[+7 cols auditoría]*) |
| 110 | `compras.recepciones_mercancia` | `compras.recepciones_mercancia`(**<u>id_recepcion</u>** `PK`, folio_recepcion `[UQ]`, *orden_compra* `[FK → compras.ordenes_compra]`, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, *[+7 cols auditoría]*) |
| 111 | `compras.recepciones_detalles` | `compras.recepciones_detalles`(**<u>id_recepcion_detalle</u>** `PK`, *recepcion* `[FK → compras.recepciones_mercancia]`, *variante_sku* `[FK → catalogo.variantes_sku]`, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, *[+7 cols auditoría]*) |
| 112 | `compras.inspecciones_sanitarias_qa` | `compras.inspecciones_sanitarias_qa`(**<u>id_inspeccion_qa</u>** `PK`, *recepcion_detalle* `[FK → compras.recepciones_detalles]`, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, *[+7 cols auditoría]*) |
| 113 | `wms.almacenes_cedis` | `wms.almacenes_cedis`(**<u>id_almacen</u>** `PK`, codigo_almacen `[UQ]`, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, *[+7 cols auditoría]*) |
| 114 | `wms.zonas_almacen` | `wms.zonas_almacen`(**<u>id_zona_almacen</u>** `PK`, *almacen* `[FK, UQ → wms.almacenes_cedis]`, codigo_zona `[UQ]`, descripcion, temperatura_min_celsius, temperatura_max_celsius, *[+7 cols auditoría]*) |
| 115 | `wms.pasillos_ubicaciones` | `wms.pasillos_ubicaciones`(**<u>id_ubicacion</u>** `PK`, *zona_almacen* `[FK → wms.zonas_almacen]`, codigo_ubicacion `[UQ]`, peso_maximo_kg, es_bloqueada_auditoria, *[+7 cols auditoría]*) |
| 116 | `wms.tipos_movimiento_inventario` | `wms.tipos_movimiento_inventario`(**<u>id_tipo_movimiento</u>** `PK`, codigo_movimiento `[UQ]`, nombre_movimiento, signo_afectacion, *[+7 cols auditoría]*) |
| 117 | `wms.lotes_fabricacion_sanitaria` | `wms.lotes_fabricacion_sanitaria`(**<u>id_lote</u>** `PK`, *variante_sku* `[FK, UQ → catalogo.variantes_sku]`, numero_lote_fabricante `[UQ]`, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, *[+7 cols auditoría]*) |
| 118 | `wms.inventario_lotes_ubicacion` | `wms.inventario_lotes_ubicacion`(**<u>id_inventario_stock</u>** `PK`, *lote* `[FK, UQ → wms.lotes_fabricacion_sanitaria]`, *ubicacion* `[FK, UQ → wms.pasillos_ubicaciones]`, stock_disponible, stock_apartado_pedidos, *[+7 cols auditoría]*) |
| 119 | `wms.kardex_movimientos` | `wms.kardex_movimientos`(**<u>id_kardex</u>** `PK`, *inventario_stock* `[FK → wms.inventario_lotes_ubicacion]`, *tipo_movimiento* `[FK → wms.tipos_movimiento_inventario]`, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, *[+7 cols auditoría]*) |
| 120 | `wms.alertas_caducidad_proxima` | `wms.alertas_caducidad_proxima`(**<u>id_alerta_caducidad</u>** `PK`, *lote* `[FK → wms.lotes_fabricacion_sanitaria]`, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, *[+7 cols auditoría]*) |
| 121 | `wms.mermas_destruccion_sanitaria` | `wms.mermas_destruccion_sanitaria`(**<u>id_merma_destruccion</u>** `PK`, folio_acta_destruccion `[UQ]`, *lote* `[FK → wms.lotes_fabricacion_sanitaria]`, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, *[+7 cols auditoría]*) |
| 122 | `wms.transferencias_almacenes` | `wms.transferencias_almacenes`(**<u>id_transferencia</u>** `PK`, folio_transferencia `[UQ]`, *almacen_origen* `[FK → wms.almacenes_cedis]`, *almacen_destino* `[FK → wms.almacenes_cedis]`, estado_transferencia, fecha_despacho, fecha_arribo, *[+7 cols auditoría]*) |
| 123 | `wms.transferencias_detalles` | `wms.transferencias_detalles`(**<u>id_transferencia_detalle</u>** `PK`, *transferencia* `[FK → wms.transferencias_almacenes]`, *lote* `[FK → wms.lotes_fabricacion_sanitaria]`, cantidad_enviada, cantidad_recibida, *[+7 cols auditoría]*) |
| 124 | `wms.conteos_ciclicos_auditoria` | `wms.conteos_ciclicos_auditoria`(**<u>id_conteo_ciclico</u>** `PK`, folio_auditoria `[UQ]`, *almacen* `[FK → wms.almacenes_cedis]`, fecha_conteo, tipo_conteo, *[+7 cols auditoría]*) |
| 125 | `wms.conteos_ciclicos_detalles` | `wms.conteos_ciclicos_detalles`(**<u>id_conteo_detalle</u>** `PK`, *conteo_ciclico* `[FK → wms.conteos_ciclicos_auditoria]`, *inventario_stock* `[FK → wms.inventario_lotes_ubicacion]`, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, *[+7 cols auditoría]*) |
| 126 | `wms.monitoreo_temperatura_humedad` | `wms.monitoreo_temperatura_humedad`(**<u>id_telemetria_sensor</u>** `PK`, *zona_almacen* `[FK → wms.zonas_almacen]`, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, *[+7 cols auditoría]*) |
| 127 | `envios.transportistas_paqueterias` | `envios.transportistas_paqueterias`(**<u>id_transportista</u>** `PK`, codigo_transportista `[UQ]`, nombre_comercial, api_endpoint_tracking, *[+7 cols auditoría]*) |
| 128 | `envios.tipos_servicio_envio` | `envios.tipos_servicio_envio`(**<u>id_servicio_envio</u>** `PK`, codigo_servicio `[UQ]`, nombre_servicio, tiempo_garantizado_horas, *[+7 cols auditoría]*) |
| 129 | `envios.tarifas_zonas_postales` | `envios.tarifas_zonas_postales`(**<u>id_tarifa_zona</u>** `PK`, *transportista* `[FK → envios.transportistas_paqueterias]`, *servicio_envio* `[FK → envios.tipos_servicio_envio]`, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, *[+7 cols auditoría]*) |
| 130 | `envios.despachos_orden` | `envios.despachos_orden`(**<u>id_despacho</u>** `PK`, folio_despacho `[UQ]`, *orden_split* `[FK → ventas.ordenes_splits_almacen]`, *transportista* `[FK → envios.transportistas_paqueterias]`, *servicio_envio* `[FK → envios.tipos_servicio_envio]`, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, *[+7 cols auditoría]*) |
| 131 | `envios.paquetes_bultos` | `envios.paquetes_bultos`(**<u>id_paquete_bulto</u>** `PK`, *despacho* `[FK → envios.despachos_orden]`, codigo_bulto `[UQ]`, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, peso_volumetrico_kg, *[+7 cols auditoría]*) |
| 132 | `envios.paquetes_contenido_lotes` | `envios.paquetes_contenido_lotes`(**<u>id_contenido_paquete</u>** `PK`, *paquete_bulto* `[FK → envios.paquetes_bultos]`, *orden_detalle* `[FK → ventas.ordenes_detalles]`, *lote* `[FK → wms.lotes_fabricacion_sanitaria]`, cantidad_piezas_en_paquete, *[+7 cols auditoría]*) |
| 133 | `envios.guias_rastreo` | `envios.guias_rastreo`(**<u>id_guia_rastreo</u>** `PK`, *paquete_bulto* `[FK → envios.paquetes_bultos]`, numero_guia_tracking `[UQ]`, url_rastreo_directo, etiqueta_pdf_base64_url, *[+7 cols auditoría]*) |
| 134 | `envios.eventos_tracking_bitacora` | `envios.eventos_tracking_bitacora`(**<u>id_evento_tracking</u>** `PK`, *guia_rastreo* `[FK → envios.guias_rastreo]`, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, *[+7 cols auditoría]*) |
| 135 | `envios.intentos_entrega_fallidos` | `envios.intentos_entrega_fallidos`(**<u>id_intento_fallido</u>** `PK`, *despacho* `[FK → envios.despachos_orden]`, numero_visita, motivo_no_entrega, fecha_intento, *[+7 cols auditoría]*) |
| 136 | `envios.incidencias_logisticas` | `envios.incidencias_logisticas`(**<u>id_incidencia_logistica</u>** `PK`, *despacho* `[FK → envios.despachos_orden]`, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, *[+7 cols auditoría]*) |
| 137 | `envios.seguros_mercancia` | `envios.seguros_mercancia`(**<u>id_seguro_envio</u>** `PK`, *despacho* `[FK, UQ → envios.despachos_orden]`, aseguradora, numero_poliza, valor_asegurado, costo_prima, *[+7 cols auditoría]*) |
| 138 | `envios.puntos_recoleccion_pickup` | `envios.puntos_recoleccion_pickup`(**<u>id_punto_pickup</u>** `PK`, *transportista* `[FK → envios.transportistas_paqueterias]`, *almacen_origen* `[FK → wms.almacenes_cedis]`, codigo_locker `[UQ]`, nombre_establecimiento, direccion_completa, horario_atencion, *[+7 cols auditoría]*) |
| 139 | `postventa.motivos_devolucion_rma` | `postventa.motivos_devolucion_rma`(**<u>id_motivo_rma</u>** `PK`, codigo_motivo `[UQ]`, descripcion_motivo, requiere_dictamen_medico, *[+7 cols auditoría]*) |
| 140 | `postventa.solicitudes_rma` | `postventa.solicitudes_rma`(**<u>id_solicitud_rma</u>** `PK`, folio_rma `[UQ]`, *orden* `[FK → ventas.ordenes]`, *motivo_rma* `[FK → postventa.motivos_devolucion_rma]`, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, *[+7 cols auditoría]*) |
| 141 | `postventa.rma_detalles` | `postventa.rma_detalles`(**<u>id_rma_detalle</u>** `PK`, *solicitud_rma* `[FK → postventa.solicitudes_rma]`, *orden_detalle* `[FK → ventas.ordenes_detalles]`, cantidad_devuelta, *[+7 cols auditoría]*) |
| 142 | `postventa.inspeccion_sanitaria_retorno` | `postventa.inspeccion_sanitaria_retorno`(**<u>id_inspeccion_retorno</u>** `PK`, *rma_detalle* `[FK, UQ → postventa.rma_detalles]`, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, *[+7 cols auditoría]*) |
| 143 | `postventa.tickets_soporte` | `postventa.tickets_soporte`(**<u>id_ticket</u>** `PK`, folio_ticket `[UQ]`, *cliente* `[FK → clientes.clientes]`, asunto, categoria_ticket, prioridad, estado_ticket, *[+7 cols auditoría]*) |
| 144 | `postventa.tickets_mensajes` | `postventa.tickets_mensajes`(**<u>id_ticket_mensaje</u>** `PK`, *ticket* `[FK → postventa.tickets_soporte]`, *usuario_emisor* `[FK → seguridad.usuarios]`, mensaje_cuerpo, adjunto_url, *[+7 cols auditoría]*) |
| 145 | `postventa.reportes_farmacovigilancia` | `postventa.reportes_farmacovigilancia`(**<u>id_reporte_farmacovigilancia</u>** `PK`, folio_cofepris_ram `[UQ]`, *cliente* `[FK → clientes.clientes]`, *producto* `[FK → catalogo.productos_maestros]`, *lote* `[FK → wms.lotes_fabricacion_sanitaria]`, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, *[+7 cols auditoría]*) |
| 146 | `auditoria.tipos_evento_sistema` | `auditoria.tipos_evento_sistema`(**<u>id_tipo_evento</u>** `PK`, codigo_evento `[UQ]`, nombre_evento, nivel_severidad, *[+7 cols auditoría]*) |
| 147 | `auditoria.bitacora_seguridad_global` | `auditoria.bitacora_seguridad_global`(**<u>id_log_seguridad</u>** `PK`, *tipo_evento* `[FK → auditoria.tipos_evento_sistema]`, *usuario* `[FK → seguridad.usuarios]`, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, *[+7 cols auditoría]*) |
| 148 | `auditoria.bitacora_cambios_datos` | `auditoria.bitacora_cambios_datos`(**<u>id_cambio_dato</u>** `PK`, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, *creado_por* `[FK → seguridad.usuarios]`, *[+7 cols auditoría]*) |
| 149 | `sistema.parametros_configuracion` | `sistema.parametros_configuracion`(**<u>id_parametro</u>** `PK`, clave_parametro `[UQ]`, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, *creado_por* `[FK → seguridad.usuarios]`, *[+7 cols auditoría]*) |
| 150 | `sistema.notificaciones_push_email` | `sistema.notificaciones_push_email`(**<u>id_notificacion</u>** `PK`, *usuario_destinatario* `[FK → seguridad.usuarios]`, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, *[+7 cols auditoría]*) |

---

## 2. TRANSFORMACIÓN FORMAL DEL MODELO E-R EXTENDIDO AL ESQUEMA RELACIONAL

Se aplicó sistemáticamente el **Algoritmo de Transformación EER-a-Relacional de 8 Pasos** (Elmasri & Navathe, 7ª ed.):

| Paso | Regla de Transformación Aplicada | Aplicación en DERMA-ECOM | Evidencia Física en DDL |
| :---: | :--- | :--- | :--- |
| **Paso 1** | **Entidades Fuertes:** Cada entidad regular se transforma en una relación con clave primaria subrogada `BIGINT IDENTITY` + llave natural `UNIQUE`. | 115 entidades fuertes (ej. `seguridad.usuarios`, `catalogo.productos_maestros`, `ventas.ordenes`, `wms.almacenes_cedis`). | 150 `PRIMARY KEY` + llaves candidatas `UNIQUE` (`email`, `sku_codigo`, `folio_orden`, `uuid_sat_fiscal`). |
| **Paso 2** | **Entidades Débiles:** Se incluye como FK `NOT NULL` la PK de la entidad propietaria fuerte más el discriminador propio. | 17 entidades débiles (ej. `ventas.ordenes_detalles(orden, numero_partida)`, `fiscal.facturas_partidas`, `postventa.rma_detalles`). | Integridad referencial estricta (`ON DELETE NO ACTION` por política *Soft Delete*). |
| **Paso 3** | **Relaciones binarias 1:1:** Se propaga la FK en la entidad con participación total y se restringe con `UNIQUE`. | `clientes.clientes(usuario UNIQUE)`, `clientes.perfil_cutaneo(cliente UNIQUE)`, `pagos.evaluaciones_antifraude(orden UNIQUE)`, `pagos.billetera_electronica(cliente UNIQUE)`. | Restricciones `UQ_*` sobre la FK para garantizar multiplicidad máxima `1:1`. |
| **Paso 4** | **Relaciones binarias 1:N:** Se propaga la PK del lado `1` como FK en el lado `N`. | 145+ relaciones `1:N` (ej. `productos_maestros.certificacion_sanitaria → certificaciones_sanitarias`, `ordenes.motivo_cancelacion → motivos_cancelacion_orden`, `evaluaciones_antifraude.regla_antifraude → reglas_antifraude`). | 183 llaves foráneas activas en ambos motores, ordenadas sin dependencias hacia adelante. |
| **Paso 5** | **Relaciones N:M:** Se crea una relación puente con ambas FKs y restricción `UNIQUE(fk_1, fk_2)`. | 14 tablas intermedias $N:M$: `roles_permisos`, `usuarios_roles`, `cliente_condiciones`, `formula_ingredientes`, `kits_items`, `productos_relacionados`, `rutinas_productos`, `suscripciones_items`, `cupones_categorias_excluidas`, `proveedor_productos`, `paquetes_contenido_lotes`, etc. | Restricciones `UNIQUE` compuestas para impedir duplicados en relaciones asociativas. |
| **Paso 6** | **Atributos Multivaluados:** Se separan en tablas dependientes con FK hacia la entidad origen. | `catalogo.alergenos_ingrediente`, `catalogo.multimedia_variantes`, `clientes.direcciones`, `seguridad.historial_passwords`. | Eliminación total de listas delimitadas por comas (cumplimiento 1FN). |
| **Paso 7** | **Relaciones N-arias:** Se modelan mediante entidades asociativas con 3 o más FKs. | `wms.inventario_lotes_ubicacion` (Lote + Ubicación), `wms.kardex_movimientos` (Lote + Ubicación + TipoMovimiento), `promos.redenciones_cupones` (Cupón + Cliente + Orden), `postventa.reportes_farmacovigilancia` (Cliente + Producto + Lote). | Integridad multi-entidad garantizada por llaves foráneas compuestas. |
| **Paso 8** | **Especialización / Generalización (Estrategia 8A — Superclase + Subclases):** La superclase almacena atributos comunes y cada subclase hereda la identidad mediante FK `UNIQUE`. | `seguridad.usuarios` → `clientes.clientes` / `ventas.afiliados_influencers`; comprobantes SAT (`facturas_cfdi`, `complementos_pago`, `notas_credito`); bitácoras forenses vinculadas a `seguridad.usuarios`. | Cero columnas espurias nulas y cumplimiento simultáneo de BCNF. |

---

### 2.1 Reglas de Integridad Garantizadas en el Esquema Relacional

1. **Integridad de Entidad:** El 100% de las 150 tablas declara una llave primaria `NOT NULL` autoincrementable (`BIGINT IDENTITY(1,1)` en SQL Server / `BIGINT GENERATED ALWAYS AS IDENTITY` en PostgreSQL).
2. **Integridad Referencial Activa (0 Tablas Huérfanas):** Se verificaron **183 restricciones `FOREIGN KEY`** formando **1 único componente conexo** que abarca la totalidad de las 150 tablas (verificado en vivo en `sys.foreign_keys` de SQL Server 2022 y mediante análisis de grafo en el DDL de PostgreSQL).
3. **Integridad de Dominio:** **87 restricciones `CHECK`** validan rangos numéricos (`nivel_jerarquico BETWEEN 1 AND 10`, `total_neto > 0`, `factor_proteccion_solar_fps BETWEEN 0 AND 100`), catálogos enumerados (`estado_cfdi`, `tipo_operacion`, `dictamen_qa`, `nivel_riesgo`) y reglas fiscales/sanitarias.
4. **Integridad de Unicidad (Llaves Candidatas):** Restricciones `UNIQUE` sobre identificadores de negocio (`email`, `uuid_usuario`, `sku_codigo`, `codigo_barras_ean13`, `folio_orden`, `uuid_sat_fiscal`, `codigo_cupon`, `codigo_locker`).
5. **Integridad de Auditoría Forense (*Soft Delete*):** Las 150 tablas incluyen el bloque inmutable de 7 columnas (`activo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `fecha_baja`, `eliminado_por`) con `ON DELETE NO ACTION` para impedir la destrucción física de evidencia fiscal (CFF) y sanitaria (COFEPRIS).
