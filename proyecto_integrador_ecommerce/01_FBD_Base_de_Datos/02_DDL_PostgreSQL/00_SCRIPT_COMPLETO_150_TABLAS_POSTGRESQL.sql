-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, CONTROL DE ACCESO, PERFIL DERMO-SALUD, CATÁLOGO Y COFEPRIS
-- AUTOR / INTEGRANTE 1: Estudiante 1 (Responsable de Tablas 001 a 050)
-- SGBD DESTINO: PostgreSQL 14 / 15 / 16 (Motor de Software Libre)
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Crear esquemas lógicos
CREATE SCHEMA IF NOT EXISTS seguridad;
CREATE SCHEMA IF NOT EXISTS clientes;
CREATE SCHEMA IF NOT EXISTS catalogo;
CREATE SCHEMA IF NOT EXISTS comunidad;

-- =================================================================================================
-- SECCIÓN 1.1: SEGURIDAD, IAM Y CONTROL DE ACCESO CRIPTOGRÁFICO (TABLAS 001 - 010)
-- =================================================================================================

-- 001. TABLA: seguridad.roles (Catálogo 1)
DROP TABLE IF EXISTS seguridad.roles CASCADE;
CREATE TABLE seguridad.roles (
    id_rol BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_rol VARCHAR(30) NOT NULL UNIQUE,
    nombre_rol VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    nivel_jerarquico INT NOT NULL CHECK (nivel_jerarquico BETWEEN 1 AND 10),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 002. TABLA: seguridad.permisos (Catálogo 2)
DROP TABLE IF EXISTS seguridad.permisos CASCADE;
CREATE TABLE seguridad.permisos (
    id_permiso BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_permiso VARCHAR(60) NOT NULL UNIQUE,
    modulo_sistema VARCHAR(50) NOT NULL,
    accion VARCHAR(30) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 003. TABLA: seguridad.roles_permisos (Intermedia N:M)
DROP TABLE IF EXISTS seguridad.roles_permisos CASCADE;
CREATE TABLE seguridad.roles_permisos (
    id_rol_permiso BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rol BIGINT NOT NULL,
    permiso BIGINT NOT NULL,
    permitir BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_seguridad_roles_permisos UNIQUE (rol, permiso),
    CONSTRAINT FK_seguridad_rp_rol FOREIGN KEY (rol) REFERENCES seguridad.roles(id_rol),
    CONSTRAINT FK_seguridad_rp_permiso FOREIGN KEY (permiso) REFERENCES seguridad.permisos(id_permiso));

-- 004. TABLA: seguridad.usuarios (Maestra de Autenticación Criptográfica)
DROP TABLE IF EXISTS seguridad.usuarios CASCADE;
CREATE TABLE seguridad.usuarios (
    id_usuario BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    uuid_usuario UUID NOT NULL DEFAULT gen_random_uuid() UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, -- bcrypt / Argon2id
    password_salt VARCHAR(128) NOT NULL,
    telefono_movil VARCHAR(20) NULL,
    email_verificado BOOLEAN NOT NULL DEFAULT FALSE,
    cuenta_bloqueada BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_bloqueo TIMESTAMPTZ NULL,
    intentos_fallidos_consecutivos INT NOT NULL DEFAULT 0,
    mfa_habilitado BOOLEAN NOT NULL DEFAULT FALSE,
    mfa_secreto VARCHAR(128) NULL,
    ultimo_login_exitoso TIMESTAMPTZ NULL,
    ultimo_cambio_password TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 005. TABLA: seguridad.usuarios_roles (Intermedia N:M)
DROP TABLE IF EXISTS seguridad.usuarios_roles CASCADE;
CREATE TABLE seguridad.usuarios_roles (
    id_usuario_rol BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario BIGINT NOT NULL,
    rol BIGINT NOT NULL,
    fecha_asignacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_seguridad_usuarios_roles UNIQUE (usuario, rol),
    CONSTRAINT FK_seguridad_ur_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario),
    CONSTRAINT FK_seguridad_ur_rol FOREIGN KEY (rol) REFERENCES seguridad.roles(id_rol));

-- 006. TABLA: seguridad.sesiones_activas (Transaccional)
DROP TABLE IF EXISTS seguridad.sesiones_activas CASCADE;
CREATE TABLE seguridad.sesiones_activas (
    id_sesion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario BIGINT NOT NULL,
    token_sesion_hash VARCHAR(128) NOT NULL UNIQUE,
    direccion_ip VARCHAR(45) NOT NULL,
    user_agent VARCHAR(350) NOT NULL,
    fecha_inicio TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion TIMESTAMPTZ NOT NULL,
    revocada BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_revocacion TIMESTAMPTZ NULL,
    motivo_revocacion VARCHAR(100) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_seguridad_sa_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 007. TABLA: seguridad.historial_passwords (Transaccional Criptográfica)
DROP TABLE IF EXISTS seguridad.historial_passwords CASCADE;
CREATE TABLE seguridad.historial_passwords (
    id_historial_pwd BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario BIGINT NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    password_salt VARCHAR(128) NOT NULL,
    algoritmo_hashing VARCHAR(30) NOT NULL DEFAULT 'Argon2id',
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_seguridad_hp_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 008. TABLA: seguridad.intentos_login (Bitácora de Seguridad Forense)
DROP TABLE IF EXISTS seguridad.intentos_login CASCADE;
CREATE TABLE seguridad.intentos_login (
    id_intento_login BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email_ingresado VARCHAR(150) NOT NULL,
    usuario BIGINT NULL,
    direccion_ip VARCHAR(45) NOT NULL,
    pais_origen_ip VARCHAR(60) NULL,
    user_agent VARCHAR(350) NOT NULL,
    resultado VARCHAR(30) NOT NULL CHECK (resultado IN ('EXITOSO', 'PASSWORD_INVALIDO', 'USUARIO_INEXISTENTE', 'CUENTA_BLOQUEADA', 'MFA_FALLIDO')),
    mensaje_detalle VARCHAR(200) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_seguridad_il_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 009. TABLA: seguridad.tokens_recuperacion (Transaccional)
DROP TABLE IF EXISTS seguridad.tokens_recuperacion CASCADE;
CREATE TABLE seguridad.tokens_recuperacion (
    id_token_recuperacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario BIGINT NOT NULL,
    token_hash VARCHAR(128) NOT NULL UNIQUE,
    tipo_token VARCHAR(30) NOT NULL CHECK (tipo_token IN ('RESET_PASSWORD', 'VERIFICAR_EMAIL', 'MFA_BACKUP')),
    fecha_expiracion TIMESTAMPTZ NOT NULL,
    utilizado BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_utilizacion TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_seguridad_tr_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 010. TABLA: seguridad.dispositivos_confianza (Transaccional)
DROP TABLE IF EXISTS seguridad.dispositivos_confianza CASCADE;
CREATE TABLE seguridad.dispositivos_confianza (
    id_dispositivo BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario BIGINT NOT NULL,
    fingerprint_dispositivo VARCHAR(128) NOT NULL,
    nombre_dispositivo VARCHAR(100) NOT NULL,
    sistema_operativo VARCHAR(60) NOT NULL,
    navegador VARCHAR(60) NOT NULL,
    es_confiable BOOLEAN NOT NULL DEFAULT TRUE,
    ultimo_acceso TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_seguridad_dc_fingerprint UNIQUE (usuario, fingerprint_dispositivo),
    CONSTRAINT FK_seguridad_dc_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- =================================================================================================
-- SECCIÓN 1.2: CLIENTES, PERFIL DERMO-SALUD Y CUMPLIMIENTO LFPDPPP (TABLAS 011 - 025)
-- =================================================================================================

-- 011. TABLA: clientes.tipos_piel (Catálogo 3)
DROP TABLE IF EXISTS clientes.tipos_piel CASCADE;
CREATE TABLE clientes.tipos_piel (
    id_tipo_piel BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_piel VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    descripcion_clinica VARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 012. TABLA: clientes.condiciones_dermatologicas (Catálogo 4)
DROP TABLE IF EXISTS clientes.condiciones_dermatologicas CASCADE;
CREATE TABLE clientes.condiciones_dermatologicas (
    id_condicion_dermatologica BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_condicion VARCHAR(30) NOT NULL UNIQUE,
    nombre_condicion VARCHAR(80) NOT NULL,
    descripcion_patologica VARCHAR(255) NOT NULL,
    nivel_severidad_tipica VARCHAR(20) NOT NULL CHECK (nivel_severidad_tipica IN ('LEVE', 'MODERADA', 'SEVERA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 013. TABLA: clientes.clientes (Maestra de Clientes)
DROP TABLE IF EXISTS clientes.clientes CASCADE;
CREATE TABLE clientes.clientes (
    id_cliente BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario BIGINT NOT NULL UNIQUE,
    nombres VARCHAR(80) NOT NULL,
    primer_apellido VARCHAR(60) NOT NULL,
    segundo_apellido VARCHAR(60) NULL,
    fecha_nacimiento DATE NOT NULL,
    genero VARCHAR(25) NULL CHECK (genero IN ('FEMENINO', 'MASCULINO', 'NO_BINARIO', 'PREFIERO_NO_DECIR')),
    curp VARCHAR(18) NULL,
    rfc VARCHAR(13) NULL,
    telefono_fijo VARCHAR(20) NULL,
    acepta_terminos BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_aceptacion_terminos TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_cli_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 014. TABLA: clientes.direcciones (Transaccional)
DROP TABLE IF EXISTS clientes.direcciones CASCADE;
CREATE TABLE clientes.direcciones (
    id_direccion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    alias_direccion VARCHAR(50) NOT NULL,
    calle VARCHAR(120) NOT NULL,
    numero_exterior VARCHAR(20) NOT NULL,
    numero_interior VARCHAR(20) NULL,
    colonia VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    municipio_alcaldia VARCHAR(100) NOT NULL,
    estado VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NOT NULL DEFAULT 'México',
    referencias VARCHAR(255) NULL,
    es_predeterminada_envio BOOLEAN NOT NULL DEFAULT FALSE,
    es_predeterminada_facturacion BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_dir_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 015. TABLA: clientes.perfil_cutaneo (Transaccional / Datos Sensibles de Salud LFPDPPP)
DROP TABLE IF EXISTS clientes.perfil_cutaneo CASCADE;
CREATE TABLE clientes.perfil_cutaneo (
    id_perfil_cutaneo BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL UNIQUE,
    tipo_piel BIGINT NOT NULL,
    sensibilidad_solar VARCHAR(30) NOT NULL CHECK (sensibilidad_solar IN ('MUY_BAJA', 'MODERADA', 'ALTA', 'EXTREMA')),
    nivel_oleosidad VARCHAR(20) NOT NULL CHECK (nivel_oleosidad IN ('SECA', 'EQUILIBRADA', 'ZONA_T', 'GRASA_TOTAL')),
    poros_dilatados BOOLEAN NOT NULL DEFAULT FALSE,
    propension_acne BOOLEAN NOT NULL DEFAULT FALSE,
    manchas_hiperpigmentacion BOOLEAN NOT NULL DEFAULT FALSE,
    lineas_expresion BOOLEAN NOT NULL DEFAULT FALSE,
    consentimiento_datos_sensibles BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_declaracion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_pc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_clientes_pc_tipo_piel FOREIGN KEY (tipo_piel) REFERENCES clientes.tipos_piel(id_tipo_piel));

-- 016. TABLA: clientes.cliente_condiciones (Intermedia N:M)
DROP TABLE IF EXISTS clientes.cliente_condiciones CASCADE;
CREATE TABLE clientes.cliente_condiciones (
    id_cliente_condicion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    condicion_dermatologica BIGINT NOT NULL,
    diagnosticada_por_medico BOOLEAN NOT NULL DEFAULT FALSE,
    notas_paciente VARCHAR(255) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_clientes_cc_cliente_condicion UNIQUE (cliente, condicion_dermatologica),
    CONSTRAINT FK_clientes_cc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_clientes_cc_condicion FOREIGN KEY (condicion_dermatologica) REFERENCES clientes.condiciones_dermatologicas(id_condicion_dermatologica));

-- 017. TABLA: clientes.cuestionarios_diagnostico (Maestra)
DROP TABLE IF EXISTS clientes.cuestionarios_diagnostico CASCADE;
CREATE TABLE clientes.cuestionarios_diagnostico (
    id_cuestionario BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_cuestionario VARCHAR(30) NOT NULL UNIQUE,
    titulo VARCHAR(120) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    version_clinica VARCHAR(10) NOT NULL,
    vigente_desde DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 018. TABLA: clientes.preguntas_diagnostico (Maestra)
DROP TABLE IF EXISTS clientes.preguntas_diagnostico CASCADE;
CREATE TABLE clientes.preguntas_diagnostico (
    id_pregunta BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cuestionario BIGINT NOT NULL,
    numero_orden INT NOT NULL,
    enunciado_pregunta VARCHAR(255) NOT NULL,
    tipo_respuesta VARCHAR(30) NOT NULL CHECK (tipo_respuesta IN ('OPCION_UNICA', 'OPCION_MULTIPLE', 'ESCALA_NUMERICA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_clientes_pd_orden UNIQUE (cuestionario, numero_orden),
    CONSTRAINT FK_clientes_pd_cuestionario FOREIGN KEY (cuestionario) REFERENCES clientes.cuestionarios_diagnostico(id_cuestionario));

-- 019. TABLA: clientes.opciones_pregunta (Maestra)
DROP TABLE IF EXISTS clientes.opciones_pregunta CASCADE;
CREATE TABLE clientes.opciones_pregunta (
    id_opcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pregunta BIGINT NOT NULL,
    clave_opcion VARCHAR(20) NOT NULL,
    texto_opcion VARCHAR(150) NOT NULL,
    peso_clinico_puntos INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_clientes_op_pregunta_clave UNIQUE (pregunta, clave_opcion),
    CONSTRAINT FK_clientes_op_pregunta FOREIGN KEY (pregunta) REFERENCES clientes.preguntas_diagnostico(id_pregunta));

-- 020. TABLA: clientes.evaluaciones_diagnostico (Transaccional)
DROP TABLE IF EXISTS clientes.evaluaciones_diagnostico CASCADE;
CREATE TABLE clientes.evaluaciones_diagnostico (
    id_evaluacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    cuestionario BIGINT NOT NULL,
    fecha_realizacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    puntaje_total INT NOT NULL,
    diagnostico_sugerido VARCHAR(150) NOT NULL,
    observaciones_dermoconsultor VARCHAR(500) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_ed_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_clientes_ed_cuestionario FOREIGN KEY (cuestionario) REFERENCES clientes.cuestionarios_diagnostico(id_cuestionario));

-- 021. TABLA: clientes.respuestas_evaluacion (Transaccional)
DROP TABLE IF EXISTS clientes.respuestas_evaluacion CASCADE;
CREATE TABLE clientes.respuestas_evaluacion (
    id_respuesta_evaluacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    evaluacion BIGINT NOT NULL,
    pregunta BIGINT NOT NULL,
    opcion_seleccionada BIGINT NOT NULL,
    valor_texto_adicional VARCHAR(255) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_clientes_re_eval_preg UNIQUE (evaluacion, pregunta, opcion_seleccionada),
    CONSTRAINT FK_clientes_re_evaluacion FOREIGN KEY (evaluacion) REFERENCES clientes.evaluaciones_diagnostico(id_evaluacion),
    CONSTRAINT FK_clientes_re_pregunta FOREIGN KEY (pregunta) REFERENCES clientes.preguntas_diagnostico(id_pregunta),
    CONSTRAINT FK_clientes_re_opcion FOREIGN KEY (opcion_seleccionada) REFERENCES clientes.opciones_pregunta(id_opcion));

-- 022. TABLA: clientes.consentimientos_privacidad (Transaccional / LFPDPPP)
DROP TABLE IF EXISTS clientes.consentimientos_privacidad CASCADE;
CREATE TABLE clientes.consentimientos_privacidad (
    id_consentimiento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    version_aviso_privacidad VARCHAR(20) NOT NULL,
    acepta_finalidades_primarias BOOLEAN NOT NULL DEFAULT TRUE,
    acepta_finalidades_secundarias_marketing BOOLEAN NOT NULL DEFAULT FALSE,
    acepta_tratamiento_datos_salud_sensibles BOOLEAN NOT NULL DEFAULT TRUE,
    direccion_ip_firma VARCHAR(45) NOT NULL,
    medio_consentimiento VARCHAR(30) NOT NULL CHECK (medio_consentimiento IN ('CHECKBOX_DIGITAL', 'FIRMA_ELECTRONICA', 'EN_SUCURSAL')),
    fecha_consentimiento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_cp_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 023. TABLA: clientes.solicitudes_arco (Transaccional / Derechos ARCO)
DROP TABLE IF EXISTS clientes.solicitudes_arco CASCADE;
CREATE TABLE clientes.solicitudes_arco (
    id_solicitud_arco BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_solicitud VARCHAR(35) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    tipo_derecho VARCHAR(20) NOT NULL CHECK (tipo_derecho IN ('ACCESO', 'RECTIFICACION', 'CANCELACION', 'OPOSICION')),
    motivo_solicitud VARCHAR(500) NOT NULL,
    estado_tramite VARCHAR(30) NOT NULL CHECK (estado_tramite IN ('RECIBIDA', 'EN_REVISION', 'DOCUMENTACION_REQUERIDA', 'PROCEDENTE', 'IMPROCEDENTE', 'CONCLUIDA')),
    fecha_limite_respuesta DATE NOT NULL,
    resolucion_juridica VARCHAR(1000) NULL,
    fecha_resolucion TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_arco_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 024. TABLA: clientes.preferencias_comunicacion (Transaccional)
DROP TABLE IF EXISTS clientes.preferencias_comunicacion CASCADE;
CREATE TABLE clientes.preferencias_comunicacion (
    id_preferencia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL UNIQUE,
    canal_email BOOLEAN NOT NULL DEFAULT TRUE,
    canal_sms BOOLEAN NOT NULL DEFAULT FALSE,
    canal_whatsapp BOOLEAN NOT NULL DEFAULT FALSE,
    notificaciones_ofertas BOOLEAN NOT NULL DEFAULT TRUE,
    alertas_reabastecimiento_rutina BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_pcom_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 025. TABLA: clientes.metodos_pago_tokenizados (Transaccional PCI-DSS)
DROP TABLE IF EXISTS clientes.metodos_pago_tokenizados CASCADE;
CREATE TABLE clientes.metodos_pago_tokenizados (
    id_metodo_tokenizado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    pasarela_emisor VARCHAR(30) NOT NULL,
    token_tarjeta_pasarela VARCHAR(120) NOT NULL UNIQUE,
    marca_tarjeta VARCHAR(30) NOT NULL,
    ultimos_cuatro_digitos VARCHAR(4) NOT NULL,
    mes_expiracion INT NOT NULL CHECK (mes_expiracion BETWEEN 1 AND 12),
    anio_expiracion INT NOT NULL CHECK (anio_expiracion >= 2026),
    titular_tarjeta_hash VARCHAR(128) NOT NULL,
    es_predeterminada BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_clientes_mpt_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- =================================================================================================
-- SECCIÓN 1.3: CATÁLOGO DE SALUD, BELLEZA, MAQUILLAJE Y COFEPRIS (TABLAS 026 - 046)
-- =================================================================================================

-- 026. TABLA: catalogo.marcas (Maestra)
DROP TABLE IF EXISTS catalogo.marcas CASCADE;
CREATE TABLE catalogo.marcas (
    id_marca BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_marca VARCHAR(30) NOT NULL UNIQUE,
    nombre_marca VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(60) NOT NULL,
    sitio_web VARCHAR(200) NULL,
    es_dermocosmetica BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 027. TABLA: catalogo.laboratorios_fabricantes (Maestra)
DROP TABLE IF EXISTS catalogo.laboratorios_fabricantes CASCADE;
CREATE TABLE catalogo.laboratorios_fabricantes (
    id_laboratorio BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_laboratorio VARCHAR(30) NOT NULL UNIQUE,
    razon_social VARCHAR(150) NOT NULL,
    licencia_sanitaria VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    certificacion_gmp_vigente BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 028. TABLA: catalogo.categorias (Maestra Jerárquica)
DROP TABLE IF EXISTS catalogo.categorias CASCADE;
CREATE TABLE catalogo.categorias (
    id_categoria BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_categoria VARCHAR(30) NOT NULL UNIQUE,
    nombre_categoria VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    categoria_padre BIGINT NULL,
    nivel_arbol INT NOT NULL DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_cat_padre FOREIGN KEY (categoria_padre) REFERENCES catalogo.categorias(id_categoria));

-- 029. TABLA: catalogo.subcategorias (Maestra)
DROP TABLE IF EXISTS catalogo.subcategorias CASCADE;
CREATE TABLE catalogo.subcategorias (
    id_subcategoria BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria BIGINT NOT NULL,
    codigo_subcategoria VARCHAR(30) NOT NULL UNIQUE,
    nombre_subcategoria VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_subcat_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria));

-- 030. TABLA: catalogo.tipos_aplicacion (Catálogo 5)
DROP TABLE IF EXISTS catalogo.tipos_aplicacion CASCADE;
CREATE TABLE catalogo.tipos_aplicacion (
    id_tipo_aplicacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_aplicacion VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 031. TABLA: catalogo.certificaciones_sanitarias (Catálogo 6)
DROP TABLE IF EXISTS catalogo.certificaciones_sanitarias CASCADE;
CREATE TABLE catalogo.certificaciones_sanitarias (
    id_certificacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_certificacion VARCHAR(30) NOT NULL UNIQUE,
    nombre_certificacion VARCHAR(80) NOT NULL,
    organismo_certificador VARCHAR(100) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 032. TABLA: catalogo.productos_maestros (Maestra de Productos)
DROP TABLE IF EXISTS catalogo.productos_maestros CASCADE;
CREATE TABLE catalogo.productos_maestros (
    id_producto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    marca BIGINT NOT NULL,
    subcategoria BIGINT NOT NULL,
    laboratorio BIGINT NOT NULL,
    tipo_aplicacion BIGINT NOT NULL,
    certificacion_sanitaria BIGINT NULL,
    codigo_producto VARCHAR(40) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(150) NOT NULL,
    descripcion_corta VARCHAR(300) NOT NULL,
    descripcion_detallada TEXT NOT NULL,
    modo_empleo VARCHAR(1000) NOT NULL,
    requiere_prescripcion_medica BOOLEAN NOT NULL DEFAULT FALSE,
    factor_proteccion_solar_fps INT NULL CHECK (factor_proteccion_solar_fps IS NULL OR factor_proteccion_solar_fps BETWEEN 0 AND 100),
    es_sensible_temperatura BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_pm_marca FOREIGN KEY (marca) REFERENCES catalogo.marcas(id_marca),
    CONSTRAINT FK_catalogo_pm_subcat FOREIGN KEY (subcategoria) REFERENCES catalogo.subcategorias(id_subcategoria),
    CONSTRAINT FK_catalogo_pm_lab FOREIGN KEY (laboratorio) REFERENCES catalogo.laboratorios_fabricantes(id_laboratorio),
    CONSTRAINT FK_catalogo_pm_aplicacion FOREIGN KEY (tipo_aplicacion) REFERENCES catalogo.tipos_aplicacion(id_tipo_aplicacion),
    CONSTRAINT FK_catalogo_pm_certificacion FOREIGN KEY (certificacion_sanitaria) REFERENCES catalogo.certificaciones_sanitarias(id_certificacion));

-- 033. TABLA: catalogo.subtonos_maquillaje (Catálogo 7)
DROP TABLE IF EXISTS catalogo.subtonos_maquillaje CASCADE;
CREATE TABLE catalogo.subtonos_maquillaje (
    id_subtono BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_subtono VARCHAR(20) NOT NULL UNIQUE,
    nombre_subtono VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 034. TABLA: catalogo.acabados_maquillaje (Catálogo 8)
DROP TABLE IF EXISTS catalogo.acabados_maquillaje CASCADE;
CREATE TABLE catalogo.acabados_maquillaje (
    id_acabado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_acabado VARCHAR(20) NOT NULL UNIQUE,
    nombre_acabado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 035. TABLA: catalogo.variantes_sku (Transaccional SKUs)
DROP TABLE IF EXISTS catalogo.variantes_sku CASCADE;
CREATE TABLE catalogo.variantes_sku (
    id_variante_sku BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto BIGINT NOT NULL,
    sku_codigo VARCHAR(50) NOT NULL UNIQUE,
    codigo_barras_ean13 VARCHAR(14) NOT NULL UNIQUE,
    nombre_presentacion VARCHAR(100) NOT NULL,
    contenido_neto_gramos_ml NUMERIC(8,2) NOT NULL,
    unidad_medida VARCHAR(10) NOT NULL CHECK (unidad_medida IN ('ML', 'G', 'OZ', 'PZ')),
    precio_base_menudeo NUMERIC(12,2) NOT NULL CHECK (precio_base_menudeo > 0),
    costo_estandar_compra NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_vsku_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto));

-- 036. TABLA: catalogo.tonos_variante (Transaccional Maquillaje)
DROP TABLE IF EXISTS catalogo.tonos_variante CASCADE;
CREATE TABLE catalogo.tonos_variante (
    id_tono_variante BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL UNIQUE,
    subtono BIGINT NOT NULL,
    acabado BIGINT NOT NULL,
    codigo_tono_color VARCHAR(30) NOT NULL,
    nombre_tono VARCHAR(60) NOT NULL,
    color_hexadecimal VARCHAR(7) NOT NULL CHECK (color_hexadecimal ~ '^#[0-9A-Fa-f]{6}$'),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_tv_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku),
    CONSTRAINT FK_catalogo_tv_subtono FOREIGN KEY (subtono) REFERENCES catalogo.subtonos_maquillaje(id_subtono),
    CONSTRAINT FK_catalogo_tv_acabado FOREIGN KEY (acabado) REFERENCES catalogo.acabados_maquillaje(id_acabado));

-- 037. TABLA: catalogo.ingredientes_inci (Maestra Nomenclatura Cosmética)
DROP TABLE IF EXISTS catalogo.ingredientes_inci CASCADE;
CREATE TABLE catalogo.ingredientes_inci (
    id_ingrediente BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_cas VARCHAR(30) NULL,
    nombre_inci VARCHAR(120) NOT NULL UNIQUE,
    nombre_comun VARCHAR(120) NOT NULL,
    funcion_principal VARCHAR(150) NOT NULL,
    es_comedogenico BOOLEAN NOT NULL DEFAULT FALSE,
    indice_comedogenico INT NOT NULL CHECK (indice_comedogenico BETWEEN 0 AND 5),
    es_alergeno_frecuente BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 038. TABLA: catalogo.alergenos_ingrediente (Transaccional)
DROP TABLE IF EXISTS catalogo.alergenos_ingrediente CASCADE;
CREATE TABLE catalogo.alergenos_ingrediente (
    id_alergeno BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ingrediente BIGINT NOT NULL,
    nombre_alergeno VARCHAR(80) NOT NULL,
    clasificacion_riesgo VARCHAR(30) NOT NULL CHECK (clasificacion_riesgo IN ('BAJO', 'MEDIO', 'ALTO', 'MUY_SEVERO')),
    advertencia_etiqueta VARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_ai_ingrediente FOREIGN KEY (ingrediente) REFERENCES catalogo.ingredientes_inci(id_ingrediente));

-- 039. TABLA: catalogo.formula_ingredientes (Intermedia N:M en 4FN)
DROP TABLE IF EXISTS catalogo.formula_ingredientes CASCADE;
CREATE TABLE catalogo.formula_ingredientes (
    id_formula_ingrediente BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto BIGINT NOT NULL,
    ingrediente BIGINT NOT NULL,
    orden_en_etiqueta INT NOT NULL,
    porcentaje_concentracion NUMERIC(5,2) NULL CHECK (porcentaje_concentracion IS NULL OR (porcentaje_concentracion BETWEEN 0.01 AND 100.00)),
    es_principio_activo BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_catalogo_fi_producto_ingrediente UNIQUE (producto, ingrediente),
    CONSTRAINT FK_catalogo_fi_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_catalogo_fi_ingrediente FOREIGN KEY (ingrediente) REFERENCES catalogo.ingredientes_inci(id_ingrediente));

-- 040. TABLA: catalogo.registros_sanitarios_cofepris (Transaccional Regulatoria)
DROP TABLE IF EXISTS catalogo.registros_sanitarios_cofepris CASCADE;
CREATE TABLE catalogo.registros_sanitarios_cofepris (
    id_registro_sanitario BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto BIGINT NOT NULL UNIQUE,
    numero_registro_sanitario VARCHAR(60) NOT NULL UNIQUE,
    folio_ingreso_tramite VARCHAR(60) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estatus_regulatorio VARCHAR(30) NOT NULL CHECK (estatus_regulatorio IN ('VIGENTE', 'EN_RENOVACION', 'SUSPENDIDO', 'VENCIDO')),
    documento_oficial_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_cof_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto));

-- 041. TABLA: catalogo.advertencias_contraindicaciones (Transaccional Médica)
DROP TABLE IF EXISTS catalogo.advertencias_contraindicaciones CASCADE;
CREATE TABLE catalogo.advertencias_contraindicaciones (
    id_advertencia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto BIGINT NOT NULL,
    tipo_advertencia VARCHAR(30) NOT NULL CHECK (tipo_advertencia IN ('EMBARAZO_LACTANCIA', 'FOTOSENSIBLE', 'USO_EXTERNO_EXCLUSIVO', 'HERIDAS_ABIERTAS', 'EVITAR_OJOS')),
    texto_advertencia VARCHAR(350) NOT NULL,
    medida_en_caso_ingestion VARCHAR(350) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_adv_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto));

-- 042. TABLA: catalogo.multimedia_variantes (Transaccional)
DROP TABLE IF EXISTS catalogo.multimedia_variantes CASCADE;
CREATE TABLE catalogo.multimedia_variantes (
    id_multimedia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL,
    tipo_archivo VARCHAR(20) NOT NULL CHECK (tipo_archivo IN ('FOTO_FRONTAL', 'FOTO_SWATCH_PIEL', 'FOTO_EMPAQUE', 'VIDEO_TUTORIAL')),
    url_recurso VARCHAR(350) NOT NULL,
    texto_alternativo_accesibilidad VARCHAR(150) NOT NULL,
    numero_orden INT NOT NULL,
    es_imagen_principal BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_catalogo_mv_sku_orden UNIQUE (variante_sku, numero_orden),
    CONSTRAINT FK_catalogo_mv_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 043. TABLA: catalogo.kits_sets (Maestra Sets Cosméticos)
DROP TABLE IF EXISTS catalogo.kits_sets CASCADE;
CREATE TABLE catalogo.kits_sets (
    id_kit BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_kit VARCHAR(40) NOT NULL UNIQUE,
    nombre_kit VARCHAR(120) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    descuento_porcentual_kit NUMERIC(5,2) NOT NULL CHECK (descuento_porcentual_kit BETWEEN 0.00 AND 80.00),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 044. TABLA: catalogo.kits_items (Intermedia N:M)
DROP TABLE IF EXISTS catalogo.kits_items CASCADE;
CREATE TABLE catalogo.kits_items (
    id_kit_item BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kit BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_unidades INT NOT NULL CHECK (cantidad_unidades >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_catalogo_ki_kit_sku UNIQUE (kit, variante_sku),
    CONSTRAINT FK_catalogo_ki_kit FOREIGN KEY (kit) REFERENCES catalogo.kits_sets(id_kit),
    CONSTRAINT FK_catalogo_ki_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 045. TABLA: catalogo.productos_relacionados (Intermedia N:M Cross-Sell)
DROP TABLE IF EXISTS catalogo.productos_relacionados CASCADE;
CREATE TABLE catalogo.productos_relacionados (
    id_producto_relacionado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto_origen BIGINT NOT NULL,
    producto_destino BIGINT NOT NULL,
    tipo_relacion VARCHAR(30) NOT NULL CHECK (tipo_relacion IN ('COMPLEMENTARIO', 'SUSTITUTO', 'PASO_SIGUIENTE_RUTINA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_catalogo_pr_origen_destino UNIQUE (producto_origen, producto_destino),
    CONSTRAINT FK_catalogo_pr_origen FOREIGN KEY (producto_origen) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_catalogo_pr_destino FOREIGN KEY (producto_destino) REFERENCES catalogo.productos_maestros(id_producto));

-- 046. TABLA: catalogo.historial_precios_base (Bitácora Transaccional Precios)
DROP TABLE IF EXISTS catalogo.historial_precios_base CASCADE;
CREATE TABLE catalogo.historial_precios_base (
    id_historial_precio BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL,
    precio_anterior NUMERIC(12,2) NOT NULL,
    precio_nuevo NUMERIC(12,2) NOT NULL,
    motivo_cambio VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_catalogo_hp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- =================================================================================================
-- SECCIÓN 1.4: COMUNIDAD, RUTINAS DE BELLEZA Y FIDELIZACIÓN (TABLAS 047 - 050)
-- =================================================================================================

-- 047. TABLA: comunidad.rutinas_belleza (Maestra)
DROP TABLE IF EXISTS comunidad.rutinas_belleza CASCADE;
CREATE TABLE comunidad.rutinas_belleza (
    id_rutina BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    nombre_rutina VARCHAR(100) NOT NULL,
    momento_dia VARCHAR(20) NOT NULL CHECK (momento_dia IN ('MAÑANA', 'NOCHE', 'SEMANAL')),
    es_publica BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_comunidad_rb_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 048. TABLA: comunidad.rutinas_pasos (Transaccional)
DROP TABLE IF EXISTS comunidad.rutinas_pasos CASCADE;
CREATE TABLE comunidad.rutinas_pasos (
    id_rutina_paso BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rutina BIGINT NOT NULL,
    numero_paso INT NOT NULL CHECK (numero_paso BETWEEN 1 AND 15),
    nombre_fase VARCHAR(60) NOT NULL,
    instrucciones_aplicacion VARCHAR(255) NULL,
    tiempo_espera_segundos INT NOT NULL DEFAULT 60,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_comunidad_rp_rutina_paso UNIQUE (rutina, numero_paso),
    CONSTRAINT FK_comunidad_rp_rutina FOREIGN KEY (rutina) REFERENCES comunidad.rutinas_belleza(id_rutina));

-- 049. TABLA: comunidad.rutinas_productos (Intermedia N:M)
DROP TABLE IF EXISTS comunidad.rutinas_productos CASCADE;
CREATE TABLE comunidad.rutinas_productos (
    id_rutina_producto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rutina_paso BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    es_producto_principal BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_comunidad_rprod_paso_sku UNIQUE (rutina_paso, variante_sku),
    CONSTRAINT FK_comunidad_rprod_paso FOREIGN KEY (rutina_paso) REFERENCES comunidad.rutinas_pasos(id_rutina_paso),
    CONSTRAINT FK_comunidad_rprod_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 050. TABLA: comunidad.listas_deseos (Transaccional Wishlists)
DROP TABLE IF EXISTS comunidad.listas_deseos CASCADE;
CREATE TABLE comunidad.listas_deseos (
    id_lista_deseos BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    nombre_lista VARCHAR(80) NOT NULL,
    es_publica BOOLEAN NOT NULL DEFAULT FALSE,
    token_compartir VARCHAR(64) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_comunidad_ld_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 2: MOTOR TRANSACCIONAL, SUSCRIPCIONES, PASARELAS DE PAGO, ANTIFRAUDE Y CFDI 4.0
-- AUTOR / INTEGRANTE 2: Estudiante 2 (Responsable de Tablas 051 a 100)
-- SGBD DESTINO: PostgreSQL 14 / 15 / 16 (Motor de Software Libre)
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

CREATE SCHEMA IF NOT EXISTS ventas;
CREATE SCHEMA IF NOT EXISTS pagos;
CREATE SCHEMA IF NOT EXISTS fiscal;
CREATE SCHEMA IF NOT EXISTS promos;

-- =================================================================================================
-- SECCIÓN 2.1: CARRO, SUSCRIPCIONES Y PROMOCIONES DE CLIENTE (TABLAS 051 - 063)
-- =================================================================================================

-- 051. TABLA: ventas.tipos_descuento (Catálogo 9)
DROP TABLE IF EXISTS ventas.tipos_descuento CASCADE;
CREATE TABLE ventas.tipos_descuento (
    id_tipo_descuento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_descuento VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 052. TABLA: ventas.estados_orden (Catálogo 10)
DROP TABLE IF EXISTS ventas.estados_orden CASCADE;
CREATE TABLE ventas.estados_orden (
    id_estado_orden BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_estado VARCHAR(30) NOT NULL UNIQUE,
    nombre_estado VARCHAR(60) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    es_terminal BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 053. TABLA: ventas.motivos_cancelacion_orden (Catálogo 11)
DROP TABLE IF EXISTS ventas.motivos_cancelacion_orden CASCADE;
CREATE TABLE ventas.motivos_cancelacion_orden (
    id_motivo_cancelacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_motivo VARCHAR(30) NOT NULL UNIQUE,
    descripcion_motivo VARCHAR(200) NOT NULL,
    es_atribuible_cliente BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 054. TABLA: ventas.carritos (Transaccional)
DROP TABLE IF EXISTS ventas.carritos CASCADE;
CREATE TABLE ventas.carritos (
    id_carrito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    token_sesion_carrito VARCHAR(128) NOT NULL UNIQUE,
    fecha_ultima_actividad TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    convertido_a_orden BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_carr_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 055. TABLA: ventas.items_carrito (Transaccional)
DROP TABLE IF EXISTS ventas.items_carrito CASCADE;
CREATE TABLE ventas.items_carrito (
    id_item_carrito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carrito BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad >= 1),
    precio_unitario_capturado NUMERIC(12,2) NOT NULL,
    fecha_agregado TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_ic_carrito_sku UNIQUE (carrito, variante_sku),
    CONSTRAINT FK_ventas_ic_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito),
    CONSTRAINT FK_ventas_ic_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 056. TABLA: ventas.carritos_abandonados_seguimiento (Transaccional)
DROP TABLE IF EXISTS ventas.carritos_abandonados_seguimiento CASCADE;
CREATE TABLE ventas.carritos_abandonados_seguimiento (
    id_seguimiento_carrito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carrito BIGINT NOT NULL UNIQUE,
    correo_recordatorio_enviado BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_envio_recordatorio TIMESTAMPTZ NULL,
    recuperado BOOLEAN NOT NULL DEFAULT FALSE,
    monto_estimado_recuperable NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_cas_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito));

-- 057. TABLA: ventas.planes_suscripcion (Maestra Beauty Box / Resurtido)
DROP TABLE IF EXISTS ventas.planes_suscripcion CASCADE;
CREATE TABLE ventas.planes_suscripcion (
    id_plan_suscripcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_plan VARCHAR(30) NOT NULL UNIQUE,
    nombre_plan VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    precio_recurrente_base NUMERIC(12,2) NOT NULL CHECK (precio_recurrente_base > 0),
    descuento_porcentual_fidelidad NUMERIC(5,2) NOT NULL DEFAULT 10.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 058. TABLA: ventas.frecuencias_suscripcion (Catálogo 12)
DROP TABLE IF EXISTS ventas.frecuencias_suscripcion CASCADE;
CREATE TABLE ventas.frecuencias_suscripcion (
    id_frecuencia_suscripcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_frecuencia VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    intervalo_dias INT NOT NULL CHECK (intervalo_dias BETWEEN 15 AND 180),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 059. TABLA: ventas.suscripciones_cliente (Transaccional)
DROP TABLE IF EXISTS ventas.suscripciones_cliente CASCADE;
CREATE TABLE ventas.suscripciones_cliente (
    id_suscripcion_cliente BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_suscripcion VARCHAR(35) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    plan_suscripcion BIGINT NOT NULL,
    frecuencia_suscripcion BIGINT NOT NULL,
    direccion_entrega BIGINT NOT NULL,
    metodo_tokenizado BIGINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    proxima_fecha_cobro DATE NOT NULL,
    estado_suscripcion VARCHAR(20) NOT NULL CHECK (estado_suscripcion IN ('ACTIVA', 'PAUSADA', 'CANCELADA', 'PAGO_FALLIDO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_sc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_ventas_sc_plan FOREIGN KEY (plan_suscripcion) REFERENCES ventas.planes_suscripcion(id_plan_suscripcion),
    CONSTRAINT FK_ventas_sc_frecuencia FOREIGN KEY (frecuencia_suscripcion) REFERENCES ventas.frecuencias_suscripcion(id_frecuencia_suscripcion),
    CONSTRAINT FK_ventas_sc_direccion FOREIGN KEY (direccion_entrega) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_sc_metodo FOREIGN KEY (metodo_tokenizado) REFERENCES clientes.metodos_pago_tokenizados(id_metodo_tokenizado));

-- 060. TABLA: ventas.suscripciones_items (Intermedia N:M)
DROP TABLE IF EXISTS ventas.suscripciones_items CASCADE;
CREATE TABLE ventas.suscripciones_items (
    id_suscripcion_item BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    suscripcion_cliente BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad >= 1),
    precio_congelado_suscripcion NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_si_susc_sku UNIQUE (suscripcion_cliente, variante_sku),
    CONSTRAINT FK_ventas_si_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente),
    CONSTRAINT FK_ventas_si_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 061. TABLA: ventas.suscripciones_calendario_entregas (Transaccional)
DROP TABLE IF EXISTS ventas.suscripciones_calendario_entregas CASCADE;
CREATE TABLE ventas.suscripciones_calendario_entregas (
    id_entrega_programada BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    suscripcion_cliente BIGINT NOT NULL,
    fecha_programada_despacho DATE NOT NULL,
    numero_ciclo_periodo INT NOT NULL,
    estado_despacho VARCHAR(30) NOT NULL CHECK (estado_despacho IN ('PROGRAMADO', 'COBRADO_PROCESANDO', 'DESPACHADO', 'OMITIDO_POR_CLIENTE')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_sce_susc_ciclo UNIQUE (suscripcion_cliente, numero_ciclo_periodo),
    CONSTRAINT FK_ventas_sce_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente));

-- 062. TABLA: ventas.suscripciones_bitacora_estados (Bitácora)
DROP TABLE IF EXISTS ventas.suscripciones_bitacora_estados CASCADE;
CREATE TABLE ventas.suscripciones_bitacora_estados (
    id_bitacora_suscripcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    suscripcion_cliente BIGINT NOT NULL,
    estado_anterior VARCHAR(20) NOT NULL,
    estado_nuevo VARCHAR(20) NOT NULL,
    motivo_cambio VARCHAR(255) NOT NULL,
    fecha_cambio TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_sbe_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente));

-- 063. TABLA: ventas.regalos_por_compra_gwp (Transaccional)
DROP TABLE IF EXISTS ventas.regalos_por_compra_gwp CASCADE;
CREATE TABLE ventas.regalos_por_compra_gwp (
    id_regalo_compra BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_promocion_gwp VARCHAR(30) NOT NULL UNIQUE,
    nombre_promocion VARCHAR(100) NOT NULL,
    monto_minimo_requerido NUMERIC(12,2) NOT NULL,
    variante_sku_regalo BIGINT NOT NULL,
    fecha_inicio TIMESTAMPTZ NOT NULL,
    fecha_fin TIMESTAMPTZ NOT NULL,
    stock_maximo_regalos INT NOT NULL,
    regalos_entregados INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_gwp_sku FOREIGN KEY (variante_sku_regalo) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- =================================================================================================
-- SECCIÓN 2.2: MOTOR TRANSACCIONAL DE ÓRDENES Y CHECKOUT (TABLAS 064 - 073)
-- =================================================================================================

-- 064. TABLA: ventas.ordenes (Maestra Transaccional de Ventas)
DROP TABLE IF EXISTS ventas.ordenes CASCADE;
CREATE TABLE ventas.ordenes (
    id_orden BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_orden VARCHAR(40) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    estado_orden BIGINT NOT NULL,
    motivo_cancelacion BIGINT NULL,
    direccion_envio BIGINT NOT NULL,
    direccion_facturacion BIGINT NULL,
    fecha_orden TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    subtotal_bruto NUMERIC(12,2) NOT NULL CHECK (subtotal_bruto >= 0),
    total_descuentos NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    total_impuestos_iva NUMERIC(12,2) NOT NULL CHECK (total_impuestos_iva >= 0),
    costo_envio NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    total_neto NUMERIC(12,2) NOT NULL CHECK (total_neto > 0),
    moneda VARCHAR(3) NOT NULL DEFAULT 'MXN',
    requiere_factura BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ord_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_ventas_ord_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden),
    CONSTRAINT FK_ventas_ord_direnvio FOREIGN KEY (direccion_envio) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_ord_dirfact FOREIGN KEY (direccion_facturacion) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_ord_motivo_cancel FOREIGN KEY (motivo_cancelacion) REFERENCES ventas.motivos_cancelacion_orden(id_motivo_cancelacion));

-- 065. TABLA: ventas.ordenes_detalles (Transaccional Líneas de Producto)
DROP TABLE IF EXISTS ventas.ordenes_detalles CASCADE;
CREATE TABLE ventas.ordenes_detalles (
    id_orden_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    numero_partida INT NOT NULL,
    cantidad_comprada INT NOT NULL CHECK (cantidad_comprada >= 1),
    precio_unitario_venta NUMERIC(12,2) NOT NULL,
    costo_unitario_historico NUMERIC(12,2) NOT NULL,
    monto_descuento_aplicado NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    subtotal_linea NUMERIC(12,2) NOT NULL,
    tasa_iva_porcentual NUMERIC(5,2) NOT NULL DEFAULT 16.00,
    monto_iva_linea NUMERIC(12,2) NOT NULL,
    total_linea NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_ventas_od_partida UNIQUE (orden, numero_partida),
    CONSTRAINT FK_ventas_od_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_od_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 066. TABLA: ventas.ordenes_historial_estados (Bitácora de Estados)
DROP TABLE IF EXISTS ventas.ordenes_historial_estados CASCADE;
CREATE TABLE ventas.ordenes_historial_estados (
    id_orden_historial BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    estado_orden BIGINT NOT NULL,
    comentario_operativo VARCHAR(300) NOT NULL,
    fecha_registro TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ohe_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_ohe_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden));

-- 067. TABLA: ventas.ordenes_splits_almacen (Transaccional Splits)
DROP TABLE IF EXISTS ventas.ordenes_splits_almacen CASCADE;
CREATE TABLE ventas.ordenes_splits_almacen (
    id_orden_split BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    sub_folio_split VARCHAR(45) NOT NULL UNIQUE,
    estado_split VARCHAR(30) NOT NULL CHECK (estado_split IN ('PENDIENTE', 'ASIGNADO', 'SURTIENDO', 'EMPAQUETADO', 'EN_RUTA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_osa_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 068. TABLA: ventas.ordenes_impuestos (Transaccional Impuestos)
DROP TABLE IF EXISTS ventas.ordenes_impuestos CASCADE;
CREATE TABLE ventas.ordenes_impuestos (
    id_orden_impuesto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    tipo_impuesto VARCHAR(10) NOT NULL CHECK (tipo_impuesto IN ('002_IVA', '003_IEPS')),
    tasa_o_cuota NUMERIC(6,4) NOT NULL,
    base_gravable NUMERIC(12,2) NOT NULL,
    importe_impuesto NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_oi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 069. TABLA: ventas.ordenes_descuentos (Transaccional)
DROP TABLE IF EXISTS ventas.ordenes_descuentos CASCADE;
CREATE TABLE ventas.ordenes_descuentos (
    id_orden_descuento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    tipo_descuento BIGINT NOT NULL,
    codigo_promocion_aplicado VARCHAR(40) NOT NULL,
    monto_descontado NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_odesc_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_odesc_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento));

-- 070. TABLA: ventas.ordenes_notas_instrucciones (Transaccional)
DROP TABLE IF EXISTS ventas.ordenes_notas_instrucciones CASCADE;
CREATE TABLE ventas.ordenes_notas_instrucciones (
    id_orden_nota BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL UNIQUE,
    es_para_regalo BOOLEAN NOT NULL DEFAULT FALSE,
    mensaje_tarjeta_regalo VARCHAR(300) NULL,
    instrucciones_entrega_repartidor VARCHAR(300) NULL,
    empaque_especial_ecologico BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_oni_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 071. TABLA: ventas.reservas_temporales_stock (Transaccional)
DROP TABLE IF EXISTS ventas.reservas_temporales_stock CASCADE;
CREATE TABLE ventas.reservas_temporales_stock (
    id_reserva_stock BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    carrito BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_reservada INT NOT NULL CHECK (cantidad_reservada >= 1),
    fecha_reserva TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion_reserva TIMESTAMPTZ NOT NULL,
    liberada BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_rts_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito),
    CONSTRAINT FK_ventas_rts_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 072. TABLA: ventas.afiliados_influencers (Maestra)
DROP TABLE IF EXISTS ventas.afiliados_influencers CASCADE;
CREATE TABLE ventas.afiliados_influencers (
    id_afiliado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_afiliado VARCHAR(30) NOT NULL UNIQUE,
    usuario BIGINT NOT NULL,
    nombre_canal_red_social VARCHAR(100) NOT NULL,
    porcentaje_comision NUMERIC(5,2) NOT NULL CHECK (porcentaje_comision BETWEEN 1.00 AND 30.00),
    clabe_interbancaria VARCHAR(18) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ai_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 073. TABLA: ventas.comisiones_afiliados (Transaccional)
DROP TABLE IF EXISTS ventas.comisiones_afiliados CASCADE;
CREATE TABLE ventas.comisiones_afiliados (
    id_comision_afiliado BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    afiliado BIGINT NOT NULL,
    orden BIGINT NOT NULL UNIQUE,
    monto_base_calculo NUMERIC(12,2) NOT NULL,
    monto_comision NUMERIC(12,2) NOT NULL,
    estado_pago VARCHAR(30) NOT NULL CHECK (estado_pago IN ('PENDIENTE', 'APROBADA', 'PAGADA', 'CANCELADA_POR_DEVOLUCION')),
    fecha_dispersion_pago TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_ventas_ca_afiliado FOREIGN KEY (afiliado) REFERENCES ventas.afiliados_influencers(id_afiliado),
    CONSTRAINT FK_ventas_ca_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- =================================================================================================
-- SECCIÓN 2.3: PASARELAS DE PAGO, WALLET, ANTIFRAUDE Y REEMBOLSOS (TABLAS 074 - 086)
-- =================================================================================================

-- 074. TABLA: pagos.proveedores_pasarela (Catálogo 13)
DROP TABLE IF EXISTS pagos.proveedores_pasarela CASCADE;
CREATE TABLE pagos.proveedores_pasarela (
    id_proveedor_pasarela BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_pasarela VARCHAR(20) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(60) NOT NULL,
    url_webhook VARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 075. TABLA: pagos.metodos_pago (Catálogo 14)
DROP TABLE IF EXISTS pagos.metodos_pago CASCADE;
CREATE TABLE pagos.metodos_pago (
    id_metodo_pago BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_metodo VARCHAR(20) NOT NULL UNIQUE,
    nombre_metodo VARCHAR(60) NOT NULL,
    comision_porcentual_fija NUMERIC(5,2) NOT NULL DEFAULT 2.90,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 076. TABLA: pagos.transacciones (Maestra Transaccional de Pagos)
DROP TABLE IF EXISTS pagos.transacciones CASCADE;
CREATE TABLE pagos.transacciones (
    id_transaccion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_transaccion VARCHAR(45) NOT NULL UNIQUE,
    orden BIGINT NOT NULL,
    proveedor_pasarela BIGINT NOT NULL,
    metodo_pago BIGINT NOT NULL,
    id_transaccion_externa_pasarela VARCHAR(100) NOT NULL,
    monto_transaccion NUMERIC(12,2) NOT NULL CHECK (monto_transaccion > 0),
    moneda VARCHAR(3) NOT NULL DEFAULT 'MXN',
    estado_pago VARCHAR(25) NOT NULL CHECK (estado_pago IN ('PENDIENTE', 'APROBADA', 'RECHAZADA', 'CANCELADA', 'EN_MEDIACION')),
    codigo_autorizacion_bancaria VARCHAR(30) NULL,
    fecha_pago_efectuado TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_tx_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_tx_pasarela FOREIGN KEY (proveedor_pasarela) REFERENCES pagos.proveedores_pasarela(id_proveedor_pasarela),
    CONSTRAINT FK_pagos_tx_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago));

-- 077. TABLA: pagos.intentos_cobro (Bitácora API)
DROP TABLE IF EXISTS pagos.intentos_cobro CASCADE;
CREATE TABLE pagos.intentos_cobro (
    id_intento_cobro BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaccion BIGINT NOT NULL,
    numero_intento INT NOT NULL,
    codigo_respuesta_http INT NOT NULL,
    payload_solicitud_sanitizado TEXT NOT NULL,
    payload_respuesta_pasarela TEXT NOT NULL,
    mensaje_error_banco VARCHAR(250) NULL,
    fecha_intento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_ic_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- 078. TABLA: pagos.split_multipagos (Transaccional)
DROP TABLE IF EXISTS pagos.split_multipagos CASCADE;
CREATE TABLE pagos.split_multipagos (
    id_split_pago BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    metodo_pago BIGINT NOT NULL,
    monto_asignado NUMERIC(12,2) NOT NULL,
    referencia_comprobante VARCHAR(80) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_smp_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_smp_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago));

-- 079. TABLA: pagos.billetera_electronica (Maestra Wallet)
DROP TABLE IF EXISTS pagos.billetera_electronica CASCADE;
CREATE TABLE pagos.billetera_electronica (
    id_billetera BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL UNIQUE,
    saldo_disponible NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    saldo_bloqueado_retenido NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_be_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 080. TABLA: pagos.movimientos_billetera (Transaccional)
DROP TABLE IF EXISTS pagos.movimientos_billetera CASCADE;
CREATE TABLE pagos.movimientos_billetera (
    id_movimiento_billetera BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    billetera BIGINT NOT NULL,
    tipo_movimiento VARCHAR(25) NOT NULL CHECK (tipo_movimiento IN ('CARGA_SALDO', 'PAGO_ORDEN', 'REEMBOLSO_DEVOLUCION', 'BONIFICACION_FIDELIDAD')),
    monto NUMERIC(12,2) NOT NULL CHECK (monto > 0),
    saldo_anterior NUMERIC(12,2) NOT NULL,
    saldo_posterior NUMERIC(12,2) NOT NULL,
    descripcion_motivo VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_mb_billetera FOREIGN KEY (billetera) REFERENCES pagos.billetera_electronica(id_billetera));

-- 081. TABLA: pagos.tarjetas_regalo_giftcards (Maestra)
DROP TABLE IF EXISTS pagos.tarjetas_regalo_giftcards CASCADE;
CREATE TABLE pagos.tarjetas_regalo_giftcards (
    id_giftcard BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_giftcard_hash VARCHAR(128) NOT NULL UNIQUE,
    monto_inicial NUMERIC(12,2) NOT NULL CHECK (monto_inicial > 0),
    saldo_actual NUMERIC(12,2) NOT NULL CHECK (saldo_actual >= 0),
    fecha_vencimiento DATE NOT NULL,
    cliente_comprador BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_gc_comprador FOREIGN KEY (cliente_comprador) REFERENCES clientes.clientes(id_cliente));

-- 082. TABLA: pagos.redenciones_giftcards (Transaccional)
DROP TABLE IF EXISTS pagos.redenciones_giftcards CASCADE;
CREATE TABLE pagos.redenciones_giftcards (
    id_redencion_giftcard BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    giftcard BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_redimido NUMERIC(12,2) NOT NULL CHECK (monto_redimido > 0),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_rg_giftcard FOREIGN KEY (giftcard) REFERENCES pagos.tarjetas_regalo_giftcards(id_giftcard),
    CONSTRAINT FK_pagos_rg_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 083. TABLA: pagos.reglas_antifraude (Maestra)
DROP TABLE IF EXISTS pagos.reglas_antifraude CASCADE;
CREATE TABLE pagos.reglas_antifraude (
    id_regla_antifraude BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_regla VARCHAR(30) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL,
    puntaje_riesgo_asignado INT NOT NULL CHECK (puntaje_riesgo_asignado BETWEEN 1 AND 100),
    bloqueo_automatico BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 084. TABLA: pagos.evaluaciones_antifraude (Transaccional)
DROP TABLE IF EXISTS pagos.evaluaciones_antifraude CASCADE;
CREATE TABLE pagos.evaluaciones_antifraude (
    id_evaluacion_fraude BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL UNIQUE,
    regla_antifraude BIGINT NULL,
    score_riesgo_total INT NOT NULL,
    nivel_riesgo VARCHAR(25) NOT NULL CHECK (nivel_riesgo IN ('BAJO', 'MEDIO', 'ALTO_REQUERIR_3DS', 'CRITICO_RECHAZADO')),
    ip_origen VARCHAR(45) NOT NULL,
    distancia_geografica_km INT NULL,
    dispositivo_sospechoso BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_ea_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_ea_regla FOREIGN KEY (regla_antifraude) REFERENCES pagos.reglas_antifraude(id_regla_antifraude));

-- 085. TABLA: pagos.contracargos_chargebacks (Transaccional Disputas)
DROP TABLE IF EXISTS pagos.contracargos_chargebacks CASCADE;
CREATE TABLE pagos.contracargos_chargebacks (
    id_contracargo BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaccion BIGINT NOT NULL,
    folio_disputa_pasarela VARCHAR(60) NOT NULL UNIQUE,
    motivo_disputa VARCHAR(150) NOT NULL,
    monto_disputado NUMERIC(12,2) NOT NULL,
    fecha_notificacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_limite_evidencia DATE NOT NULL,
    estatus_disputa VARCHAR(30) NOT NULL CHECK (estatus_disputa IN ('ABIERTA', 'EN_REVISION', 'GANADA_POR_COMERCIO', 'PERDIDA_POR_COMERCIO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_cc_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- 086. TABLA: pagos.reembolsos_transaccion (Transaccional)
DROP TABLE IF EXISTS pagos.reembolsos_transaccion CASCADE;
CREATE TABLE pagos.reembolsos_transaccion (
    id_reembolso BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transaccion BIGINT NOT NULL,
    folio_reembolso_pasarela VARCHAR(80) NOT NULL UNIQUE,
    monto_reembolsado NUMERIC(12,2) NOT NULL CHECK (monto_reembolsado > 0),
    motivo_reembolso VARCHAR(250) NOT NULL,
    fecha_reembolso TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_pagos_reemb_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- =================================================================================================
-- SECCIÓN 2.4: FACTURACIÓN ELECTRÓNICA CFDI 4.0 Y MOTOR DE PROMOCIONES (TABLAS 087 - 100)
-- =================================================================================================

-- 087. TABLA: fiscal.regimenes_sat (Catálogo 15)
DROP TABLE IF EXISTS fiscal.regimenes_sat CASCADE;
CREATE TABLE fiscal.regimenes_sat (
    id_regimen_sat BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_regimen_sat VARCHAR(4) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL,
    aplica_persona_fisica BOOLEAN NOT NULL,
    aplica_persona_moral BOOLEAN NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 088. TABLA: fiscal.usos_cfdi (Catálogo 16)
DROP TABLE IF EXISTS fiscal.usos_cfdi CASCADE;
CREATE TABLE fiscal.usos_cfdi (
    id_uso_cfdi BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_uso_cfdi VARCHAR(5) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NOT NULL,
    aplica_fisica BOOLEAN NOT NULL,
    aplica_moral BOOLEAN NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 089. TABLA: fiscal.datos_fiscales_cliente (Transaccional)
DROP TABLE IF EXISTS fiscal.datos_fiscales_cliente CASCADE;
CREATE TABLE fiscal.datos_fiscales_cliente (
    id_dato_fiscal BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente BIGINT NOT NULL,
    rfc_emisor VARCHAR(13) NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    codigo_postal_fiscal VARCHAR(10) NOT NULL,
    regimen_sat BIGINT NOT NULL,
    uso_cfdi_predeterminado BIGINT NOT NULL,
    correo_envio_cfdi VARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_dfc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_fiscal_dfc_regimen FOREIGN KEY (regimen_sat) REFERENCES fiscal.regimenes_sat(id_regimen_sat),
    CONSTRAINT FK_fiscal_dfc_uso FOREIGN KEY (uso_cfdi_predeterminado) REFERENCES fiscal.usos_cfdi(id_uso_cfdi));

-- 090. TABLA: fiscal.facturas_cfdi (Maestra Transaccional CFDI 4.0)
DROP TABLE IF EXISTS fiscal.facturas_cfdi CASCADE;
CREATE TABLE fiscal.facturas_cfdi (
    id_factura BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden BIGINT NOT NULL,
    dato_fiscal BIGINT NOT NULL,
    serie_factura VARCHAR(10) NOT NULL,
    folio_factura VARCHAR(20) NOT NULL,
    uuid_sat_fiscal UUID NOT NULL UNIQUE,
    sello_digital_cfdi TEXT NOT NULL,
    sello_sat TEXT NOT NULL,
    cadena_original_timbre TEXT NOT NULL,
    numero_certificado_sat VARCHAR(20) NOT NULL,
    fecha_timbrado TIMESTAMPTZ NOT NULL,
    monto_total_facturado NUMERIC(12,2) NOT NULL,
    estado_cfdi VARCHAR(25) NOT NULL CHECK (estado_cfdi IN ('TIMBRADA_VIGENTE', 'CANCELADA_SAT', 'ERROR_TIMBRADO')),
    xml_comprobante_url VARCHAR(300) NOT NULL,
    pdf_representacion_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_fcfdi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_fiscal_fcfdi_df FOREIGN KEY (dato_fiscal) REFERENCES fiscal.datos_fiscales_cliente(id_dato_fiscal));

-- 091. TABLA: fiscal.facturas_partidas (Transaccional)
DROP TABLE IF EXISTS fiscal.facturas_partidas CASCADE;
CREATE TABLE fiscal.facturas_partidas (
    id_factura_partida BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    clave_producto_servicio_sat VARCHAR(10) NOT NULL,
    clave_unidad_sat VARCHAR(5) NOT NULL,
    cantidad NUMERIC(12,2) NOT NULL,
    valor_unitario NUMERIC(12,2) NOT NULL,
    importe_neto NUMERIC(12,2) NOT NULL,
    objeto_impuesto VARCHAR(3) NOT NULL DEFAULT '02',
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_fp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));

-- 092. TABLA: fiscal.complementos_pago (Transaccional)
DROP TABLE IF EXISTS fiscal.complementos_pago CASCADE;
CREATE TABLE fiscal.complementos_pago (
    id_complemento_pago BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    transaccion BIGINT NOT NULL,
    uuid_sat_complemento UUID NOT NULL UNIQUE,
    numero_parcialidad INT NOT NULL DEFAULT 1,
    saldo_anterior NUMERIC(12,2) NOT NULL,
    monto_pagado NUMERIC(12,2) NOT NULL,
    saldo_insoluto NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_cp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura),
    CONSTRAINT FK_fiscal_cp_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));

-- 093. TABLA: fiscal.notas_credito (Transaccional)
DROP TABLE IF EXISTS fiscal.notas_credito CASCADE;
CREATE TABLE fiscal.notas_credito (
    id_nota_credito BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    uuid_sat_nota_credito UUID NOT NULL UNIQUE,
    motivo_devolucion_sat VARCHAR(3) NOT NULL,
    subtotal_acreditado NUMERIC(12,2) NOT NULL,
    iva_acreditado NUMERIC(12,2) NOT NULL,
    total_acreditado NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_nc_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));

-- 094. TABLA: fiscal.cancelaciones_cfdi (Transaccional)
DROP TABLE IF EXISTS fiscal.cancelaciones_cfdi CASCADE;
CREATE TABLE fiscal.cancelaciones_cfdi (
    id_cancelacion_cfdi BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura BIGINT NOT NULL,
    motivo_cancelacion_sat VARCHAR(4) NOT NULL CHECK (motivo_cancelacion_sat IN ('01', '02', '03', '04')),
    uuid_sustitucion UUID NULL,
    acuse_cancelacion_sat TEXT NOT NULL,
    fecha_solicitud_cancelacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_fiscal_ccfdi_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));

-- 095. TABLA: promos.campanias (Maestra)
DROP TABLE IF EXISTS promos.campanias CASCADE;
CREATE TABLE promos.campanias (
    id_campania BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_campania VARCHAR(30) NOT NULL UNIQUE,
    nombre_campania VARCHAR(100) NOT NULL,
    fecha_inicio TIMESTAMPTZ NOT NULL,
    fecha_fin TIMESTAMPTZ NOT NULL,
    presupuesto_maximo_descuentos NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 096. TABLA: promos.cupones (Maestra)
DROP TABLE IF EXISTS promos.cupones CASCADE;
CREATE TABLE promos.cupones (
    id_cupon BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    campania BIGINT NOT NULL,
    codigo_cupon VARCHAR(30) NOT NULL UNIQUE,
    tipo_descuento BIGINT NOT NULL,
    valor_descuento NUMERIC(12,2) NOT NULL CHECK (valor_descuento > 0),
    monto_minimo_compra NUMERIC(12,2) NOT NULL DEFAULT 0.00,
    limite_usos_totales INT NOT NULL,
    usos_actuales INT NOT NULL DEFAULT 0,
    limite_usos_por_cliente INT NOT NULL DEFAULT 1,
    fecha_expiracion TIMESTAMPTZ NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_cup_campania FOREIGN KEY (campania) REFERENCES promos.campanias(id_campania),
    CONSTRAINT FK_promos_cup_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento));

-- 097. TABLA: promos.reglas_elegibilidad_cupon (Transaccional)
DROP TABLE IF EXISTS promos.reglas_elegibilidad_cupon CASCADE;
CREATE TABLE promos.reglas_elegibilidad_cupon (
    id_regla_cupon BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cupon BIGINT NOT NULL UNIQUE,
    solo_primera_compra BOOLEAN NOT NULL DEFAULT FALSE,
    excluye_kits_promocionales BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_rec_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon));

-- 098. TABLA: promos.cupones_categorias_excluidas (Intermedia N:M)
DROP TABLE IF EXISTS promos.cupones_categorias_excluidas CASCADE;
CREATE TABLE promos.cupones_categorias_excluidas (
    id_cupon_exclusion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cupon BIGINT NOT NULL,
    categoria BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_promos_cce_cupon_cat UNIQUE (cupon, categoria),
    CONSTRAINT FK_promos_cce_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon),
    CONSTRAINT FK_promos_cce_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria));

-- 099. TABLA: promos.redenciones_cupones (Transaccional)
DROP TABLE IF EXISTS promos.redenciones_cupones CASCADE;
CREATE TABLE promos.redenciones_cupones (
    id_redencion_cupon BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cupon BIGINT NOT NULL,
    cliente BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_ahorrado NUMERIC(12,2) NOT NULL,
    fecha_aplicacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_rcup_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon),
    CONSTRAINT FK_promos_rcup_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_promos_rcup_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));

-- 100. TABLA: promos.ventas_flash_horarias (Transaccional)
DROP TABLE IF EXISTS promos.ventas_flash_horarias CASCADE;
CREATE TABLE promos.ventas_flash_horarias (
    id_venta_flash BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL,
    precio_oferta_flash NUMERIC(12,2) NOT NULL CHECK (precio_oferta_flash > 0),
    stock_destinado_flash INT NOT NULL CHECK (stock_destinado_flash >= 1),
    stock_vendido_flash INT NOT NULL DEFAULT 0,
    fecha_hora_inicio TIMESTAMPTZ NOT NULL,
    fecha_hora_fin TIMESTAMPTZ NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_promos_vfh_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVIOS, RMA Y AUDITORÍA FORENSE
-- AUTOR / INTEGRANTE 3: Estudiante 3 (Responsable de Tablas 101 a 150)
-- SGBD DESTINO: PostgreSQL 14 / 15 / 16 (Motor de Software Libre)
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

CREATE SCHEMA IF NOT EXISTS compras;
CREATE SCHEMA IF NOT EXISTS wms;
CREATE SCHEMA IF NOT EXISTS envios;
CREATE SCHEMA IF NOT EXISTS postventa;
CREATE SCHEMA IF NOT EXISTS auditoria;
CREATE SCHEMA IF NOT EXISTS sistema;

-- =================================================================================================
-- SECCIÓN 3.1: COMPRAS, PROVEEDORES Y RECEPCIÓN SANITARIA (TABLAS 101 - 112)
-- =================================================================================================

-- 101. TABLA: compras.estados_orden_compra (Catálogo 17)
DROP TABLE IF EXISTS compras.estados_orden_compra CASCADE;
CREATE TABLE compras.estados_orden_compra (
    id_estado_oc BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_estado VARCHAR(20) NOT NULL UNIQUE,
    nombre_estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 102. TABLA: compras.proveedores (Maestra)
DROP TABLE IF EXISTS compras.proveedores CASCADE;
CREATE TABLE compras.proveedores (
    id_proveedor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_proveedor VARCHAR(30) NOT NULL UNIQUE,
    razon_social VARCHAR(150) NOT NULL,
    nombre_comercial VARCHAR(120) NOT NULL,
    rfc_proveedor VARCHAR(13) NOT NULL UNIQUE,
    pais_origen VARCHAR(60) NOT NULL,
    dias_credito_pago INT NOT NULL DEFAULT 30,
    calificacion_calidad_sanitaria NUMERIC(3,2) NOT NULL DEFAULT 5.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 103. TABLA: compras.contactos_proveedor (Transaccional)
DROP TABLE IF EXISTS compras.contactos_proveedor CASCADE;
CREATE TABLE compras.contactos_proveedor (
    id_contacto_proveedor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proveedor BIGINT NOT NULL,
    nombre_contacto VARCHAR(100) NOT NULL,
    puesto_cargo VARCHAR(80) NOT NULL,
    email_contacto VARCHAR(150) NOT NULL,
    telefono_directo VARCHAR(20) NOT NULL,
    es_contacto_principal BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_cp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));

-- 104. TABLA: compras.proveedor_slas (Transaccional SLAs)
DROP TABLE IF EXISTS compras.proveedor_slas CASCADE;
CREATE TABLE compras.proveedor_slas (
    id_proveedor_sla BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proveedor BIGINT NOT NULL,
    tiempo_promedio_entrega_dias INT NOT NULL CHECK (tiempo_promedio_entrega_dias >= 1),
    porcentaje_tolerancia_mermas NUMERIC(4,2) NOT NULL DEFAULT 0.50,
    penalizacion_por_dia_retraso_porc NUMERIC(4,2) NOT NULL DEFAULT 1.00,
    vigencia_acuerdo_fin DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_sla_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));

-- 105. TABLA: compras.proveedor_productos (Intermedia N:M)
DROP TABLE IF EXISTS compras.proveedor_productos CASCADE;
CREATE TABLE compras.proveedor_productos (
    id_proveedor_producto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    proveedor BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    codigo_articulo_proveedor VARCHAR(50) NOT NULL,
    costo_negociado_unitario NUMERIC(12,2) NOT NULL CHECK (costo_negociado_unitario > 0),
    lote_minimo_compra INT NOT NULL DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_compras_pp_prov_sku UNIQUE (proveedor, variante_sku),
    CONSTRAINT FK_compras_pp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_pp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 106. TABLA: compras.requisiciones (Transaccional)
DROP TABLE IF EXISTS compras.requisiciones CASCADE;
CREATE TABLE compras.requisiciones (
    id_requisicion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_requisicion VARCHAR(35) NOT NULL UNIQUE,
    departamento_solicitante VARCHAR(80) NOT NULL,
    prioridad VARCHAR(25) NOT NULL CHECK (prioridad IN ('BAJA', 'MEDIA', 'URGENTE_DESABASTO')),
    motivo_solicitud VARCHAR(300) NOT NULL,
    fecha_limite_requerida DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 107. TABLA: compras.requisiciones_detalles (Transaccional)
DROP TABLE IF EXISTS compras.requisiciones_detalles CASCADE;
CREATE TABLE compras.requisiciones_detalles (
    id_requisicion_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    requisicion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_requerida INT NOT NULL CHECK (cantidad_requerida >= 1),
    cantidad_aprobada INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_compras_rd_req_sku UNIQUE (requisicion, variante_sku),
    CONSTRAINT FK_compras_rd_requisicion FOREIGN KEY (requisicion) REFERENCES compras.requisiciones(id_requisicion),
    CONSTRAINT FK_compras_rd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 108. TABLA: compras.ordenes_compra (Maestra OC)
DROP TABLE IF EXISTS compras.ordenes_compra CASCADE;
CREATE TABLE compras.ordenes_compra (
    id_orden_compra BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_orden_compra VARCHAR(35) NOT NULL UNIQUE,
    proveedor BIGINT NOT NULL,
    estado_oc BIGINT NOT NULL,
    fecha_emision TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_entrega_esperada DATE NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    total_iva NUMERIC(12,2) NOT NULL,
    total_orden_compra NUMERIC(12,2) NOT NULL,
    condiciones_pago VARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_oc_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_oc_estado FOREIGN KEY (estado_oc) REFERENCES compras.estados_orden_compra(id_estado_oc));

-- 109. TABLA: compras.ordenes_compra_detalles (Transaccional)
DROP TABLE IF EXISTS compras.ordenes_compra_detalles CASCADE;
CREATE TABLE compras.ordenes_compra_detalles (
    id_orden_compra_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    orden_compra BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_pedida INT NOT NULL CHECK (cantidad_pedida >= 1),
    cantidad_recibida INT NOT NULL DEFAULT 0,
    costo_unitario_compra NUMERIC(12,2) NOT NULL,
    importe_total_linea NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_compras_ocd_oc_sku UNIQUE (orden_compra, variante_sku),
    CONSTRAINT FK_compras_ocd_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra),
    CONSTRAINT FK_compras_ocd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 110. TABLA: compras.recepciones_mercancia (Transaccional)
DROP TABLE IF EXISTS compras.recepciones_mercancia CASCADE;
CREATE TABLE compras.recepciones_mercancia (
    id_recepcion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_recepcion VARCHAR(35) NOT NULL UNIQUE,
    orden_compra BIGINT NOT NULL,
    numero_remision_proveedor VARCHAR(60) NOT NULL,
    fecha_ingreso_muelle TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observaciones_chofer_transporte VARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_rm_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra));

-- 111. TABLA: compras.recepciones_detalles (Transaccional)
DROP TABLE IF EXISTS compras.recepciones_detalles CASCADE;
CREATE TABLE compras.recepciones_detalles (
    id_recepcion_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recepcion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_recibida_bultos INT NOT NULL,
    cantidad_unidades_inspeccionadas INT NOT NULL,
    temperatura_llegada_celsius NUMERIC(4,1) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_recd_recepcion FOREIGN KEY (recepcion) REFERENCES compras.recepciones_mercancia(id_recepcion),
    CONSTRAINT FK_compras_recd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 112. TABLA: compras.inspecciones_sanitarias_qa (Transaccional QA)
DROP TABLE IF EXISTS compras.inspecciones_sanitarias_qa CASCADE;
CREATE TABLE compras.inspecciones_sanitarias_qa (
    id_inspeccion_qa BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recepcion_detalle BIGINT NOT NULL,
    sellos_sanitarios_intactos BOOLEAN NOT NULL,
    empaque_sin_derrames BOOLEAN NOT NULL,
    codigo_lote_laboratorio VARCHAR(50) NOT NULL,
    fecha_caducidad_impresa DATE NOT NULL,
    dictamen_qa VARCHAR(25) NOT NULL CHECK (dictamen_qa IN ('APROBADO', 'RECHAZADO_DEVOLVER', 'RETENIDO_EN_CUARENTENA')),
    justificacion_sanitaria VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_compras_qa_recdetalle FOREIGN KEY (recepcion_detalle) REFERENCES compras.recepciones_detalles(id_recepcion_detalle));

-- =================================================================================================
-- SECCIÓN 3.2: WMS, LOTES SANITARIOS, CADUCIDAD FEFO Y SENSORES (TABLAS 113 - 126)
-- =================================================================================================

-- 113. TABLA: wms.almacenes_cedis (Maestra CEDIS)
DROP TABLE IF EXISTS wms.almacenes_cedis CASCADE;
CREATE TABLE wms.almacenes_cedis (
    id_almacen BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_almacen VARCHAR(20) NOT NULL UNIQUE,
    nombre_almacen VARCHAR(100) NOT NULL,
    calle_numero VARCHAR(150) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    capacidad_volumetrica_m3 NUMERIC(10,2) NOT NULL,
    cuenta_con_cadena_frio BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 114. TABLA: wms.zonas_almacen (Maestra Zonas)
DROP TABLE IF EXISTS wms.zonas_almacen CASCADE;
CREATE TABLE wms.zonas_almacen (
    id_zona_almacen BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    almacen BIGINT NOT NULL,
    codigo_zona VARCHAR(25) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    temperatura_min_celsius NUMERIC(4,1) NOT NULL,
    temperatura_max_celsius NUMERIC(4,1) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_wms_za_almacen_zona UNIQUE (almacen, codigo_zona),
    CONSTRAINT FK_wms_za_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));

-- 115. TABLA: wms.pasillos_ubicaciones (Maestra Racks/Bines)
DROP TABLE IF EXISTS wms.pasillos_ubicaciones CASCADE;
CREATE TABLE wms.pasillos_ubicaciones (
    id_ubicacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    zona_almacen BIGINT NOT NULL,
    codigo_ubicacion VARCHAR(30) NOT NULL UNIQUE,
    peso_maximo_kg NUMERIC(8,2) NOT NULL,
    es_bloqueada_auditoria BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_pu_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));

-- 116. TABLA: wms.tipos_movimiento_inventario (Catálogo 18)
DROP TABLE IF EXISTS wms.tipos_movimiento_inventario CASCADE;
CREATE TABLE wms.tipos_movimiento_inventario (
    id_tipo_movimiento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_movimiento VARCHAR(25) NOT NULL UNIQUE,
    nombre_movimiento VARCHAR(60) NOT NULL,
    signo_afectacion INT NOT NULL CHECK (signo_afectacion IN (1, -1)),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 117. TABLA: wms.lotes_fabricacion_sanitaria (Maestra Lotes FEFO)
DROP TABLE IF EXISTS wms.lotes_fabricacion_sanitaria CASCADE;
CREATE TABLE wms.lotes_fabricacion_sanitaria (
    id_lote BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    variante_sku BIGINT NOT NULL,
    numero_lote_fabricante VARCHAR(60) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_caducidad DATE NOT NULL,
    certificado_calidad_lote_url VARCHAR(300) NOT NULL,
    cuarentena_sanitaria BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_wms_lfs_sku_lote UNIQUE (variante_sku, numero_lote_fabricante),
    CONSTRAINT FK_wms_lfs_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));

-- 118. TABLA: wms.inventario_lotes_ubicacion (Transaccional Stock)
DROP TABLE IF EXISTS wms.inventario_lotes_ubicacion CASCADE;
CREATE TABLE wms.inventario_lotes_ubicacion (
    id_inventario_stock BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lote BIGINT NOT NULL,
    ubicacion BIGINT NOT NULL,
    stock_disponible INT NOT NULL CHECK (stock_disponible >= 0),
    stock_apartado_pedidos INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT UQ_wms_ilu_lote_ubic UNIQUE (lote, ubicacion),
    CONSTRAINT FK_wms_ilu_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote),
    CONSTRAINT FK_wms_ilu_ubicacion FOREIGN KEY (ubicacion) REFERENCES wms.pasillos_ubicaciones(id_ubicacion));

-- 119. TABLA: wms.kardex_movimientos (Bitácora Transaccional)
DROP TABLE IF EXISTS wms.kardex_movimientos CASCADE;
CREATE TABLE wms.kardex_movimientos (
    id_kardex BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    inventario_stock BIGINT NOT NULL,
    tipo_movimiento BIGINT NOT NULL,
    cantidad_movimiento INT NOT NULL CHECK (cantidad_movimiento > 0),
    saldo_anterior INT NOT NULL,
    saldo_resultante INT NOT NULL,
    folio_documento_origen VARCHAR(50) NOT NULL,
    costo_unitario_movimiento NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_km_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock),
    CONSTRAINT FK_wms_km_tipo FOREIGN KEY (tipo_movimiento) REFERENCES wms.tipos_movimiento_inventario(id_tipo_movimiento));

-- 120. TABLA: wms.alertas_caducidad_proxima (Transaccional)
DROP TABLE IF EXISTS wms.alertas_caducidad_proxima CASCADE;
CREATE TABLE wms.alertas_caducidad_proxima (
    id_alerta_caducidad BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lote BIGINT NOT NULL,
    dias_restantes_vida_util INT NOT NULL,
    nivel_urgencia VARCHAR(25) NOT NULL CHECK (nivel_urgencia IN ('PREVENTIVA_90D', 'MODERADA_60D', 'CRITICA_30D', 'EXPIRADO')),
    accion_comercial_sugerida VARCHAR(150) NOT NULL,
    atendida BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_acp_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 121. TABLA: wms.mermas_destruccion_sanitaria (Transaccional Actas Sanitarias)
DROP TABLE IF EXISTS wms.mermas_destruccion_sanitaria CASCADE;
CREATE TABLE wms.mermas_destruccion_sanitaria (
    id_merma_destruccion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_acta_destruccion VARCHAR(35) NOT NULL UNIQUE,
    lote BIGINT NOT NULL,
    cantidad_unidades_destruidas INT NOT NULL CHECK (cantidad_unidades_destruidas >= 1),
    motivo_sanitario VARCHAR(200) NOT NULL,
    empresa_manifiesto_ecologico VARCHAR(120) NOT NULL,
    acta_circunstanciada_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_mds_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 122. TABLA: wms.transferencias_almacenes (Transaccional)
DROP TABLE IF EXISTS wms.transferencias_almacenes CASCADE;
CREATE TABLE wms.transferencias_almacenes (
    id_transferencia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_transferencia VARCHAR(35) NOT NULL UNIQUE,
    almacen_origen BIGINT NOT NULL,
    almacen_destino BIGINT NOT NULL,
    estado_transferencia VARCHAR(25) NOT NULL CHECK (estado_transferencia IN ('SOLICITADA', 'EN_TRANSITO', 'RECIBIDA_COMPLETA', 'DISCREPANCIA')),
    fecha_despacho TIMESTAMPTZ NULL,
    fecha_arribo TIMESTAMPTZ NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_ta_origen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen),
    CONSTRAINT FK_wms_ta_destino FOREIGN KEY (almacen_destino) REFERENCES wms.almacenes_cedis(id_almacen));

-- 123. TABLA: wms.transferencias_detalles (Transaccional)
DROP TABLE IF EXISTS wms.transferencias_detalles CASCADE;
CREATE TABLE wms.transferencias_detalles (
    id_transferencia_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transferencia BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_enviada INT NOT NULL CHECK (cantidad_enviada >= 1),
    cantidad_recibida INT NOT NULL DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_td_transf FOREIGN KEY (transferencia) REFERENCES wms.transferencias_almacenes(id_transferencia),
    CONSTRAINT FK_wms_td_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 124. TABLA: wms.conteos_ciclicos_auditoria (Transaccional)
DROP TABLE IF EXISTS wms.conteos_ciclicos_auditoria CASCADE;
CREATE TABLE wms.conteos_ciclicos_auditoria (
    id_conteo_ciclico BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_auditoria VARCHAR(35) NOT NULL UNIQUE,
    almacen BIGINT NOT NULL,
    fecha_conteo DATE NOT NULL,
    tipo_conteo VARCHAR(25) NOT NULL CHECK (tipo_conteo IN ('ALEATORIO', 'ALTO_VALOR_SKU', 'PROXIMO_A_CADUCAR')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_cca_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));

-- 125. TABLA: wms.conteos_ciclicos_detalles (Transaccional)
DROP TABLE IF EXISTS wms.conteos_ciclicos_detalles CASCADE;
CREATE TABLE wms.conteos_ciclicos_detalles (
    id_conteo_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    conteo_ciclico BIGINT NOT NULL,
    inventario_stock BIGINT NOT NULL,
    stock_sistema_teorico INT NOT NULL,
    stock_conteo_fisico INT NOT NULL,
    diferencia_piezas INT NOT NULL,
    justificacion_ajuste VARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_ccd_conteo FOREIGN KEY (conteo_ciclico) REFERENCES wms.conteos_ciclicos_auditoria(id_conteo_ciclico),
    CONSTRAINT FK_wms_ccd_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock));

-- 126. TABLA: wms.monitoreo_temperatura_humedad (Transaccional IoT)
DROP TABLE IF EXISTS wms.monitoreo_temperatura_humedad CASCADE;
CREATE TABLE wms.monitoreo_temperatura_humedad (
    id_telemetria_sensor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    zona_almacen BIGINT NOT NULL,
    codigo_sensor_iot VARCHAR(30) NOT NULL,
    temperatura_registrada_celsius NUMERIC(4,1) NOT NULL,
    humedad_relativa_porcentaje NUMERIC(4,1) NOT NULL,
    alerta_fuera_de_rango BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_hora_lectura TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_wms_mth_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));

-- =================================================================================================
-- SECCIÓN 3.3: LOGÍSTICA, ENVÍOS, ÚLTIMA MILLA Y PAQUETERÍAS (TABLAS 127 - 138)
-- =================================================================================================

-- 127. TABLA: envios.transportistas_paqueterias (Catálogo 19)
DROP TABLE IF EXISTS envios.transportistas_paqueterias CASCADE;
CREATE TABLE envios.transportistas_paqueterias (
    id_transportista BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_transportista VARCHAR(20) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(60) NOT NULL,
    api_endpoint_tracking VARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 128. TABLA: envios.tipos_servicio_envio (Catálogo 20)
DROP TABLE IF EXISTS envios.tipos_servicio_envio CASCADE;
CREATE TABLE envios.tipos_servicio_envio (
    id_servicio_envio BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_servicio VARCHAR(20) NOT NULL UNIQUE,
    nombre_servicio VARCHAR(60) NOT NULL,
    tiempo_garantizado_horas INT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 129. TABLA: envios.tarifas_zonas_postales (Transaccional)
DROP TABLE IF EXISTS envios.tarifas_zonas_postales CASCADE;
CREATE TABLE envios.tarifas_zonas_postales (
    id_tarifa_zona BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    codigo_postal_origen_prefijo VARCHAR(3) NOT NULL,
    codigo_postal_destino_prefijo VARCHAR(3) NOT NULL,
    peso_limite_kg NUMERIC(6,2) NOT NULL,
    costo_base_envio NUMERIC(12,2) NOT NULL,
    costo_kg_adicional NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_tzp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_tzp_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));

-- 130. TABLA: envios.despachos_orden (Maestra Envíos)
DROP TABLE IF EXISTS envios.despachos_orden CASCADE;
CREATE TABLE envios.despachos_orden (
    id_despacho BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_despacho VARCHAR(35) NOT NULL UNIQUE,
    orden_split BIGINT NOT NULL,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    fecha_recoleccion_paqueteria TIMESTAMPTZ NULL,
    fecha_promesa_entrega DATE NOT NULL,
    fecha_entrega_real TIMESTAMPTZ NULL,
    estado_envio VARCHAR(30) NOT NULL CHECK (estado_envio IN ('PREPARANDO_PAQUETE', 'RECOLECTADO', 'EN_TRANSITO', 'EN_RUTA_LOCAL', 'ENTREGADO', 'INCIDENCIA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_do_split FOREIGN KEY (orden_split) REFERENCES ventas.ordenes_splits_almacen(id_orden_split),
    CONSTRAINT FK_envios_do_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_do_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));

-- 131. TABLA: envios.paquetes_bultos (Transaccional)
DROP TABLE IF EXISTS envios.paquetes_bultos CASCADE;
CREATE TABLE envios.paquetes_bultos (
    id_paquete_bulto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL,
    codigo_bulto VARCHAR(40) NOT NULL UNIQUE,
    peso_bruto_kg NUMERIC(6,2) NOT NULL,
    alto_cm NUMERIC(5,1) NOT NULL,
    ancho_cm NUMERIC(5,1) NOT NULL,
    largo_cm NUMERIC(5,1) NOT NULL,
    peso_volumetrico_kg NUMERIC(8,2) GENERATED ALWAYS AS (alto_cm * ancho_cm * largo_cm / 5000.0) STORED,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_pb_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 132. TABLA: envios.paquetes_contenido_lotes (Transaccional)
DROP TABLE IF EXISTS envios.paquetes_contenido_lotes CASCADE;
CREATE TABLE envios.paquetes_contenido_lotes (
    id_contenido_paquete BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    paquete_bulto BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_piezas_en_paquete INT NOT NULL CHECK (cantidad_piezas_en_paquete >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_pcl_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto),
    CONSTRAINT FK_envios_pcl_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle),
    CONSTRAINT FK_envios_pcl_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 133. TABLA: envios.guias_rastreo (Transaccional)
DROP TABLE IF EXISTS envios.guias_rastreo CASCADE;
CREATE TABLE envios.guias_rastreo (
    id_guia_rastreo BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    paquete_bulto BIGINT NOT NULL,
    numero_guia_tracking VARCHAR(80) NOT NULL UNIQUE,
    url_rastreo_directo VARCHAR(300) NOT NULL,
    etiqueta_pdf_base64_url VARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_gr_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto));

-- 134. TABLA: envios.eventos_tracking_bitacora (Bitácora)
DROP TABLE IF EXISTS envios.eventos_tracking_bitacora CASCADE;
CREATE TABLE envios.eventos_tracking_bitacora (
    id_evento_tracking BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    guia_rastreo BIGINT NOT NULL,
    codigo_estatus_paqueteria VARCHAR(40) NOT NULL,
    descripcion_evento VARCHAR(250) NOT NULL,
    ubicacion_ciudad_evento VARCHAR(100) NOT NULL,
    fecha_hora_evento TIMESTAMPTZ NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_etb_guia FOREIGN KEY (guia_rastreo) REFERENCES envios.guias_rastreo(id_guia_rastreo));

-- 135. TABLA: envios.intentos_entrega_fallidos (Transaccional)
DROP TABLE IF EXISTS envios.intentos_entrega_fallidos CASCADE;
CREATE TABLE envios.intentos_entrega_fallidos (
    id_intento_fallido BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL,
    numero_visita INT NOT NULL CHECK (numero_visita BETWEEN 1 AND 3),
    motivo_no_entrega VARCHAR(150) NOT NULL,
    fecha_intento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_ief_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 136. TABLA: envios.incidencias_logisticas (Transaccional)
DROP TABLE IF EXISTS envios.incidencias_logisticas CASCADE;
CREATE TABLE envios.incidencias_logisticas (
    id_incidencia_logistica BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL,
    tipo_incidencia VARCHAR(30) NOT NULL CHECK (tipo_incidencia IN ('EXTRAVIO_TOTAL', 'PAQUETE_DANADO_DERRAME', 'ROBO_EN_TRANSITO', 'DIRECCION_INEXISTENTE')),
    descripcion_hechos VARCHAR(500) NOT NULL,
    indemnizacion_reclamada NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_il_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 137. TABLA: envios.seguros_mercancia (Transaccional)
DROP TABLE IF EXISTS envios.seguros_mercancia CASCADE;
CREATE TABLE envios.seguros_mercancia (
    id_seguro_envio BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    despacho BIGINT NOT NULL UNIQUE,
    aseguradora VARCHAR(100) NOT NULL,
    numero_poliza VARCHAR(60) NOT NULL,
    valor_asegurado NUMERIC(12,2) NOT NULL,
    costo_prima NUMERIC(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_sm_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));

-- 138. TABLA: envios.puntos_recoleccion_pickup (Maestra)
DROP TABLE IF EXISTS envios.puntos_recoleccion_pickup CASCADE;
CREATE TABLE envios.puntos_recoleccion_pickup (
    id_punto_pickup BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    transportista BIGINT NOT NULL,
    almacen_origen BIGINT NOT NULL,
    codigo_locker VARCHAR(30) NOT NULL UNIQUE,
    nombre_establecimiento VARCHAR(100) NOT NULL,
    direccion_completa VARCHAR(200) NOT NULL,
    horario_atencion VARCHAR(100) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_envios_prp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_prp_almacen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen)
);

-- =================================================================================================
-- SECCIÓN 3.4: POSTVENTA, RMA, FARMACOVIGILANCIA Y AUDITORÍA FORENSE (TABLAS 139 - 150)
-- =================================================================================================

-- 139. TABLA: postventa.motivos_devolucion_rma (Catálogo 21)
DROP TABLE IF EXISTS postventa.motivos_devolucion_rma CASCADE;
CREATE TABLE postventa.motivos_devolucion_rma (
    id_motivo_rma BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_motivo VARCHAR(25) NOT NULL UNIQUE,
    descripcion_motivo VARCHAR(150) NOT NULL,
    requiere_dictamen_medico BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 140. TABLA: postventa.solicitudes_rma (Maestra RMA)
DROP TABLE IF EXISTS postventa.solicitudes_rma CASCADE;
CREATE TABLE postventa.solicitudes_rma (
    id_solicitud_rma BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_rma VARCHAR(35) NOT NULL UNIQUE,
    orden BIGINT NOT NULL,
    motivo_rma BIGINT NOT NULL,
    estado_rma VARCHAR(30) NOT NULL CHECK (estado_rma IN ('SOLICITADA', 'GUIA_RETORNO_EMITIDA', 'RECIBIDA_EN_QA', 'APROBADA_REEMBOLSAR', 'RECHAZADA_POR_HIGIENE')),
    fotografia_evidencia_url VARCHAR(300) NOT NULL,
    descripcion_caso_cliente VARCHAR(500) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_srma_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_postventa_srma_motivo FOREIGN KEY (motivo_rma) REFERENCES postventa.motivos_devolucion_rma(id_motivo_rma));

-- 141. TABLA: postventa.rma_detalles (Transaccional)
DROP TABLE IF EXISTS postventa.rma_detalles CASCADE;
CREATE TABLE postventa.rma_detalles (
    id_rma_detalle BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    solicitud_rma BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    cantidad_devuelta INT NOT NULL CHECK (cantidad_devuelta >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_rd_rma FOREIGN KEY (solicitud_rma) REFERENCES postventa.solicitudes_rma(id_solicitud_rma),
    CONSTRAINT FK_postventa_rd_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle));

-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (Transaccional)
DROP TABLE IF EXISTS postventa.inspeccion_sanitaria_retorno CASCADE;
CREATE TABLE postventa.inspeccion_sanitaria_retorno (
    id_inspeccion_retorno BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rma_detalle BIGINT NOT NULL UNIQUE,
    sello_seguridad_fue_abierto BOOLEAN NOT NULL,
    contenido_usado_porcentaje NUMERIC(4,1) NOT NULL,
    destino_sanitario_autorizado VARCHAR(40) NOT NULL CHECK (destino_sanitario_autorizado IN ('DESTRUCCION_INMEDIATA_RESIDUOS', 'DONACION_REACONDICIONADA', 'REINGRESO_STOCK_SELLADO')),
    dictamen_auditor VARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_isr_rmadetalle FOREIGN KEY (rma_detalle) REFERENCES postventa.rma_detalles(id_rma_detalle));

-- 143. TABLA: postventa.tickets_soporte (Maestra Soporte)
DROP TABLE IF EXISTS postventa.tickets_soporte CASCADE;
CREATE TABLE postventa.tickets_soporte (
    id_ticket BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_ticket VARCHAR(35) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    asunto VARCHAR(120) NOT NULL,
    categoria_ticket VARCHAR(30) NOT NULL CHECK (categoria_ticket IN ('ENVIO_DEMORADO', 'ASESORIA_DERMATOLOGICA', 'FACTURACION_CFDI', 'PRODUCTO_DEFECTUOSO')),
    prioridad VARCHAR(20) NOT NULL CHECK (prioridad IN ('BAJA', 'MEDIA', 'ALTA', 'URGENTE')),
    estado_ticket VARCHAR(25) NOT NULL CHECK (estado_ticket IN ('ABIERTO', 'EN_PROCESO', 'ESPERANDO_CLIENTE', 'RESUELTO', 'CERRADO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_ts_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));

-- 144. TABLA: postventa.tickets_mensajes (Transaccional)
DROP TABLE IF EXISTS postventa.tickets_mensajes CASCADE;
CREATE TABLE postventa.tickets_mensajes (
    id_ticket_mensaje BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ticket BIGINT NOT NULL,
    usuario_emisor BIGINT NOT NULL,
    mensaje_cuerpo TEXT NOT NULL,
    adjunto_url VARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_tm_ticket FOREIGN KEY (ticket) REFERENCES postventa.tickets_soporte(id_ticket),
    CONSTRAINT FK_postventa_tm_usuario FOREIGN KEY (usuario_emisor) REFERENCES seguridad.usuarios(id_usuario));

-- 145. TABLA: postventa.reportes_farmacovigilancia (Transaccional COFEPRIS)
DROP TABLE IF EXISTS postventa.reportes_farmacovigilancia CASCADE;
CREATE TABLE postventa.reportes_farmacovigilancia (
    id_reporte_farmacovigilancia BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    folio_cofepris_ram VARCHAR(45) NOT NULL UNIQUE,
    cliente BIGINT NOT NULL,
    producto BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    sintomas_reaccion_adversa TEXT NOT NULL,
    requirio_atencion_hospitalaria BOOLEAN NOT NULL,
    fecha_aparicion_sintomas DATE NOT NULL,
    notificado_a_autoridad_sanitaria BOOLEAN NOT NULL DEFAULT FALSE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_postventa_rf_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_postventa_rf_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_postventa_rf_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));

-- 146. TABLA: auditoria.tipos_evento_sistema (Catálogo 22)
DROP TABLE IF EXISTS auditoria.tipos_evento_sistema CASCADE;
CREATE TABLE auditoria.tipos_evento_sistema (
    id_tipo_evento BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_evento VARCHAR(35) NOT NULL UNIQUE,
    nombre_evento VARCHAR(80) NOT NULL,
    nivel_severidad VARCHAR(25) NOT NULL CHECK (nivel_severidad IN ('INFO', 'ADVERTENCIA', 'CRITICO_SEGURIDAD')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL
);

-- 147. TABLA: auditoria.bitacora_seguridad_global (Bitácora Forense)
DROP TABLE IF EXISTS auditoria.bitacora_seguridad_global CASCADE;
CREATE TABLE auditoria.bitacora_seguridad_global (
    id_log_seguridad BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_evento BIGINT NOT NULL,
    usuario BIGINT NULL,
    direccion_ip VARCHAR(45) NOT NULL,
    user_agent VARCHAR(350) NOT NULL,
    modulo_origen VARCHAR(60) NOT NULL,
    descripcion_evento VARCHAR(500) NOT NULL,
    firma_integridad_hash VARCHAR(128) NOT NULL,
    fecha_evento TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_auditoria_bsg_tipo FOREIGN KEY (tipo_evento) REFERENCES auditoria.tipos_evento_sistema(id_tipo_evento),
    CONSTRAINT FK_auditoria_bsg_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));

-- 148. TABLA: auditoria.bitacora_cambios_datos (Bitácora DML Forense)
DROP TABLE IF EXISTS auditoria.bitacora_cambios_datos CASCADE;
CREATE TABLE auditoria.bitacora_cambios_datos (
    id_cambio_dato BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_tabla VARCHAR(100) NOT NULL,
    id_registro_afectado BIGINT NOT NULL,
    tipo_operacion VARCHAR(15) NOT NULL CHECK (tipo_operacion IN ('INSERT', 'UPDATE', 'SOFT_DELETE')),
    valores_anteriores_json JSONB NULL,
    valores_nuevos_json JSONB NOT NULL,
    motivo_cambio VARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_auditoria_bcd_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);

-- 149. TABLA: sistema.parametros_configuracion (Maestra Parámetros)
DROP TABLE IF EXISTS sistema.parametros_configuracion CASCADE;
CREATE TABLE sistema.parametros_configuracion (
    id_parametro BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    clave_parametro VARCHAR(60) NOT NULL UNIQUE,
    valor_parametro VARCHAR(500) NOT NULL,
    tipo_dato VARCHAR(20) NOT NULL CHECK (tipo_dato IN ('STRING', 'INTEGER', 'DECIMAL', 'BOOLEAN', 'JSON')),
    descripcion VARCHAR(250) NOT NULL,
    es_modificable_en_caliente BOOLEAN NOT NULL DEFAULT TRUE,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_sistema_pc_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);

-- 150. TABLA: sistema.notificaciones_push_email (Transaccional)
DROP TABLE IF EXISTS sistema.notificaciones_push_email CASCADE;
CREATE TABLE sistema.notificaciones_push_email (
    id_notificacion BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario_destinatario BIGINT NOT NULL,
    tipo_canal VARCHAR(20) NOT NULL CHECK (tipo_canal IN ('EMAIL', 'PUSH_APP', 'SMS', 'WHATSAPP')),
    titulo_asunto VARCHAR(150) NOT NULL,
    cuerpo_mensaje TEXT NOT NULL,
    enviada BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_envio TIMESTAMPTZ NULL,
    error_envio VARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    creado_por BIGINT NOT NULL,
    fecha_modificacion TIMESTAMPTZ NULL,
    modificado_por BIGINT NULL,
    fecha_baja TIMESTAMPTZ NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT FK_sistema_npe_usuario FOREIGN KEY (usuario_destinatario) REFERENCES seguridad.usuarios(id_usuario));

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 1 (RENDIMIENTO EN AUTENTICACIÓN, CLIENTES Y CATÁLOGO)
-- =================================================================================================
CREATE INDEX IF NOT EXISTS IX_seguridad_usuarios_activo_email ON seguridad.usuarios (activo, email);
CREATE INDEX IF NOT EXISTS IX_seguridad_usuarios_roles_ur ON seguridad.usuarios_roles (usuario, rol);
CREATE INDEX IF NOT EXISTS IX_seguridad_sesiones_usuario_rev ON seguridad.sesiones_activas (usuario, revocada, fecha_expiracion);
CREATE INDEX IF NOT EXISTS IX_seguridad_intentos_login_ip ON seguridad.intentos_login (direccion_ip, fecha_creacion);
CREATE INDEX IF NOT EXISTS IX_clientes_clientes_usuario_act ON clientes.clientes (usuario, activo);
CREATE INDEX IF NOT EXISTS IX_clientes_condiciones_cli ON clientes.cliente_condiciones (cliente, condicion_dermatologica);
CREATE INDEX IF NOT EXISTS IX_catalogo_productos_marca_sub ON catalogo.productos_maestros (marca, subcategoria, laboratorio);
CREATE INDEX IF NOT EXISTS IX_catalogo_variantes_prod_act ON catalogo.variantes_sku (producto, activo);
CREATE INDEX IF NOT EXISTS IX_catalogo_formula_prod_ing ON catalogo.formula_ingredientes (producto, ingrediente);
CREATE INDEX IF NOT EXISTS IX_catalogo_alergenos_ing_riesgo ON catalogo.alergenos_ingrediente (ingrediente, clasificacion_riesgo);

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 2 (VENTAS, SUSCRIPCIONES, PAGOS, CFDI Y PROMOCIONES)
-- =================================================================================================
CREATE INDEX IF NOT EXISTS IX_ventas_ordenes_cliente_fecha ON ventas.ordenes (cliente, fecha_orden);
CREATE INDEX IF NOT EXISTS IX_ventas_ordenes_estado_activo ON ventas.ordenes (estado_orden, activo);
CREATE INDEX IF NOT EXISTS IX_ventas_ordenes_det_orden_sku ON ventas.ordenes_detalles (orden, variante_sku);
CREATE INDEX IF NOT EXISTS IX_ventas_suscrip_cliente_est ON ventas.suscripciones_cliente (cliente, estado_suscripcion);
CREATE INDEX IF NOT EXISTS IX_ventas_suscrip_cal_susc_est ON ventas.suscripciones_calendario_entregas (suscripcion_cliente, estado_despacho);
CREATE INDEX IF NOT EXISTS IX_pagos_tx_orden_estado ON pagos.transacciones (orden, estado_pago);
CREATE INDEX IF NOT EXISTS IX_pagos_antifraude_orden_riesgo ON pagos.evaluaciones_antifraude (orden, nivel_riesgo, score_riesgo_total);
CREATE INDEX IF NOT EXISTS IX_fiscal_facturas_orden_estado ON fiscal.facturas_cfdi (orden, estado_cfdi);
CREATE INDEX IF NOT EXISTS IX_promos_cupones_camp_activo ON promos.cupones (campania, activo);
CREATE INDEX IF NOT EXISTS IX_promos_redenciones_cup_ord ON promos.redenciones_cupones (cupon, orden);

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 3 (COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS Y AUDITORÍA)
-- =================================================================================================
CREATE INDEX IF NOT EXISTS IX_compras_oc_prov_fecha ON compras.ordenes_compra (proveedor, fecha_emision);
CREATE INDEX IF NOT EXISTS IX_compras_recep_oc_fecha ON compras.recepciones_mercancia (orden_compra, fecha_ingreso_muelle);
CREATE INDEX IF NOT EXISTS IX_compras_qa_detalle_dictamen ON compras.inspecciones_sanitarias_qa (recepcion_detalle, dictamen_qa);
CREATE INDEX IF NOT EXISTS IX_wms_lotes_sku_caducidad ON wms.lotes_fabricacion_sanitaria (variante_sku, fecha_caducidad);
CREATE INDEX IF NOT EXISTS IX_wms_inv_lote_ubicacion ON wms.inventario_lotes_ubicacion (lote, ubicacion);
CREATE INDEX IF NOT EXISTS IX_wms_alertas_lote_atendida ON wms.alertas_caducidad_proxima (lote, atendida, dias_restantes_vida_util);
CREATE INDEX IF NOT EXISTS IX_wms_telemetria_zona_fecha ON wms.monitoreo_temperatura_humedad (zona_almacen, alerta_fuera_de_rango, fecha_hora_lectura);
CREATE INDEX IF NOT EXISTS IX_envios_despachos_split_est ON envios.despachos_orden (orden_split, estado_envio);
CREATE INDEX IF NOT EXISTS IX_postventa_rma_orden_motivo ON postventa.solicitudes_rma (orden, motivo_rma, estado_rma);
CREATE INDEX IF NOT EXISTS IX_auditoria_cambios_tipo_fecha ON auditoria.bitacora_cambios_datos (tipo_operacion, fecha_creacion);
