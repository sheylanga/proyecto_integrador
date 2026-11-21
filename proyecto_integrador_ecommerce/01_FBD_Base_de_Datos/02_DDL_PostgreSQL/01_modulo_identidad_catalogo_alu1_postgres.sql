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
