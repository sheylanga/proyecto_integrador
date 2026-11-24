-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, CONTROL DE ACCESO, PERFIL DERMO-SALUD, CATÁLOGO Y COFEPRIS
-- AUTOR / INTEGRANTE 1: JosÉ Luis Luna GarcÍa (Responsable de Tablas 001 a 050)
-- SGBD DESTINO: Microsoft SQL Server 2019 / 2022
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

USE master;
GO

IF DB_ID(N'EcommerceSaludBellezaDB') IS NOT NULL
BEGIN
    ALTER DATABASE EcommerceSaludBellezaDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EcommerceSaludBellezaDB;
END
GO

CREATE DATABASE EcommerceSaludBellezaDB
COLLATE Modern_Spanish_100_CI_AI_SC_UTF8;
GO

USE EcommerceSaludBellezaDB;
GO

-- Crear esquemas lógicos para modularidad y separación de responsabilidades
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'seguridad') EXEC('CREATE SCHEMA seguridad');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'clientes') EXEC('CREATE SCHEMA clientes');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'catalogo') EXEC('CREATE SCHEMA catalogo');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'comunidad') EXEC('CREATE SCHEMA comunidad');
GO

-- =================================================================================================
-- SECCIÓN 1.1: SEGURIDAD, IAM Y CONTROL DE ACCESO CRIPTOGRÁFICO (TABLAS 001 - 010)
-- =================================================================================================

-- 001. TABLA: seguridad.roles (Catálogo 1)
IF OBJECT_ID(N'seguridad.roles', N'U') IS NOT NULL DROP TABLE seguridad.roles;
CREATE TABLE seguridad.roles (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_rol NVARCHAR(30) NOT NULL,
    nombre_rol NVARCHAR(80) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    nivel_jerarquico INT NOT NULL CONSTRAINT CK_seguridad_roles_nivel CHECK (nivel_jerarquico BETWEEN 1 AND 10),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_roles_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_roles_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_roles PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_roles_codigo UNIQUE (codigo_rol)
);
GO

-- 002. TABLA: seguridad.permisos (Catálogo 2)
IF OBJECT_ID(N'seguridad.permisos', N'U') IS NOT NULL DROP TABLE seguridad.permisos;
CREATE TABLE seguridad.permisos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    clave_permiso NVARCHAR(60) NOT NULL,
    modulo_sistema NVARCHAR(50) NOT NULL,
    accion NVARCHAR(30) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_permisos_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_permisos_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_permisos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_permisos_clave UNIQUE (clave_permiso)
);
GO

-- 003. TABLA: seguridad.roles_permisos (Intermedia N:M)
IF OBJECT_ID(N'seguridad.roles_permisos', N'U') IS NOT NULL DROP TABLE seguridad.roles_permisos;
CREATE TABLE seguridad.roles_permisos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_rol BIGINT NOT NULL,
    ID_permiso BIGINT NOT NULL,
    permitir BIT NOT NULL CONSTRAINT DF_seguridad_rp_permitir DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_rp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_rp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_roles_permisos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_roles_permisos UNIQUE (ID_rol, ID_permiso),
    CONSTRAINT FK_seguridad_rp_rol FOREIGN KEY (ID_rol) REFERENCES seguridad.roles(ID),
    CONSTRAINT FK_seguridad_rp_permiso FOREIGN KEY (ID_permiso) REFERENCES seguridad.permisos(ID));
GO

-- 004. TABLA: seguridad.usuarios (Maestra de Autenticación Criptográfica)
IF OBJECT_ID(N'seguridad.usuarios', N'U') IS NOT NULL DROP TABLE seguridad.usuarios;
CREATE TABLE seguridad.usuarios (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    uuid_usuario UNIQUEIDENTIFIER NOT NULL CONSTRAINT DF_seguridad_usr_uuid DEFAULT NEWID(),
    email NVARCHAR(150) NOT NULL,
    password_hash NVARCHAR(255) NOT NULL, -- Almacenamiento seguro bcrypt / Argon2id
    password_salt NVARCHAR(128) NOT NULL,
    telefono_movil NVARCHAR(20) NULL,
    email_verificado BIT NOT NULL CONSTRAINT DF_seguridad_usr_ev DEFAULT 0,
    cuenta_bloqueada BIT NOT NULL CONSTRAINT DF_seguridad_usr_cb DEFAULT 0,
    fecha_bloqueo DATETIME2(3) NULL,
    intentos_fallidos_consecutivos INT NOT NULL CONSTRAINT DF_seguridad_usr_ifc DEFAULT 0,
    mfa_habilitado BIT NOT NULL CONSTRAINT DF_seguridad_usr_mfa DEFAULT 0,
    mfa_secreto NVARCHAR(128) NULL,
    ultimo_login_exitoso DATETIME2(3) NULL,
    ultimo_cambio_password DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_usr_ucp DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_usr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_usr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_usuarios PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_usuarios_email UNIQUE (email),
    CONSTRAINT UQ_seguridad_usuarios_uuid UNIQUE (uuid_usuario)
);
GO

-- 005. TABLA: seguridad.usuarios_roles (Intermedia N:M)
IF OBJECT_ID(N'seguridad.usuarios_roles', N'U') IS NOT NULL DROP TABLE seguridad.usuarios_roles;
CREATE TABLE seguridad.usuarios_roles (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    ID_rol BIGINT NOT NULL,
    fecha_asignacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_ur_fa DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_ur_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_ur_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_usuarios_roles PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_usuarios_roles UNIQUE (ID_usuario, ID_rol),
    CONSTRAINT FK_seguridad_ur_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID),
    CONSTRAINT FK_seguridad_ur_rol FOREIGN KEY (ID_rol) REFERENCES seguridad.roles(ID));
GO

-- 006. TABLA: seguridad.sesiones_activas (Transaccional)
IF OBJECT_ID(N'seguridad.sesiones_activas', N'U') IS NOT NULL DROP TABLE seguridad.sesiones_activas;
CREATE TABLE seguridad.sesiones_activas (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    token_sesion_hash NVARCHAR(128) NOT NULL,
    direccion_ip NVARCHAR(45) NOT NULL,
    user_agent NVARCHAR(350) NOT NULL,
    fecha_inicio DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_sa_fi DEFAULT SYSDATETIME(),
    fecha_expiracion DATETIME2(3) NOT NULL,
    revocada BIT NOT NULL CONSTRAINT DF_seguridad_sa_revocada DEFAULT 0,
    fecha_revocacion DATETIME2(3) NULL,
    motivo_revocacion NVARCHAR(100) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_sa_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_sa_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_sesiones_activas PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_sa_token UNIQUE (token_sesion_hash),
    CONSTRAINT FK_seguridad_sa_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- 007. TABLA: seguridad.historial_passwords (Transaccional / Criptografía)
IF OBJECT_ID(N'seguridad.historial_passwords', N'U') IS NOT NULL DROP TABLE seguridad.historial_passwords;
CREATE TABLE seguridad.historial_passwords (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    password_hash NVARCHAR(255) NOT NULL,
    password_salt NVARCHAR(128) NOT NULL,
    algoritmo_hashing NVARCHAR(30) NOT NULL CONSTRAINT DF_seguridad_hp_alg DEFAULT N'Argon2id',
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_hp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_hp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_historial_passwords PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_seguridad_hp_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- 008. TABLA: seguridad.intentos_login (Bitácora de Seguridad Forense)
IF OBJECT_ID(N'seguridad.intentos_login', N'U') IS NOT NULL DROP TABLE seguridad.intentos_login;
CREATE TABLE seguridad.intentos_login (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    email_ingresado NVARCHAR(150) NOT NULL,
    ID_usuario BIGINT NULL, -- Null si el usuario no existe en la BD
    direccion_ip NVARCHAR(45) NOT NULL,
    pais_origen_ip NVARCHAR(60) NULL,
    user_agent NVARCHAR(350) NOT NULL,
    resultado NVARCHAR(20) NOT NULL CONSTRAINT CK_seguridad_il_res CHECK (resultado IN (N'EXITOSO', N'PASSWORD_INVALIDO', N'USUARIO_INEXISTENTE', N'CUENTA_BLOQUEADA', N'MFA_FALLIDO')),
    mensaje_detalle NVARCHAR(200) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_il_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_il_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_intentos_login PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_seguridad_il_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- 009. TABLA: seguridad.tokens_recuperacion (Transaccional)
IF OBJECT_ID(N'seguridad.tokens_recuperacion', N'U') IS NOT NULL DROP TABLE seguridad.tokens_recuperacion;
CREATE TABLE seguridad.tokens_recuperacion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    token_hash NVARCHAR(128) NOT NULL,
    tipo_token NVARCHAR(30) NOT NULL CONSTRAINT CK_seguridad_tr_tipo CHECK (tipo_token IN (N'RESET_PASSWORD', N'VERIFICAR_EMAIL', N'MFA_BACKUP')),
    fecha_expiracion DATETIME2(3) NOT NULL,
    utilizado BIT NOT NULL CONSTRAINT DF_seguridad_tr_utilizado DEFAULT 0,
    fecha_utilizacion DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_tr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_tr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_tokens_recuperacion PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_tr_token UNIQUE (token_hash),
    CONSTRAINT FK_seguridad_tr_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- 010. TABLA: seguridad.dispositivos_confianza (Transaccional)
IF OBJECT_ID(N'seguridad.dispositivos_confianza', N'U') IS NOT NULL DROP TABLE seguridad.dispositivos_confianza;
CREATE TABLE seguridad.dispositivos_confianza (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    fingerprint_dispositivo NVARCHAR(128) NOT NULL,
    nombre_dispositivo NVARCHAR(100) NOT NULL,
    sistema_operativo NVARCHAR(60) NOT NULL,
    navegador NVARCHAR(60) NOT NULL,
    es_confiable BIT NOT NULL CONSTRAINT DF_seguridad_dc_confiable DEFAULT 1,
    ultimo_acceso DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_dc_ua DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_dc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_dc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_dispositivos_confianza PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_seguridad_dc_fingerprint UNIQUE (ID_usuario, fingerprint_dispositivo),
    CONSTRAINT FK_seguridad_dc_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- =================================================================================================
-- SECCIÓN 1.2: CLIENTES, PERFIL DERMO-SALUD Y CUMPLIMIENTO LFPDPPP (TABLAS 011 - 025)
-- =================================================================================================

-- 011. TABLA: clientes.tipos_piel (Catálogo 3)
IF OBJECT_ID(N'clientes.tipos_piel', N'U') IS NOT NULL DROP TABLE clientes.tipos_piel;
CREATE TABLE clientes.tipos_piel (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_piel NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    descripcion_clinica NVARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_tp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_tp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_tipos_piel PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_tp_codigo UNIQUE (codigo_piel)
);
GO

-- 012. TABLA: clientes.condiciones_dermatologicas (Catálogo 4)
IF OBJECT_ID(N'clientes.condiciones_dermatologicas', N'U') IS NOT NULL DROP TABLE clientes.condiciones_dermatologicas;
CREATE TABLE clientes.condiciones_dermatologicas (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_condicion NVARCHAR(30) NOT NULL,
    nombre_condicion NVARCHAR(80) NOT NULL,
    descripcion_patologica NVARCHAR(255) NOT NULL,
    nivel_severidad_tipica NVARCHAR(20) NOT NULL CONSTRAINT CK_clientes_cd_sev CHECK (nivel_severidad_tipica IN (N'LEVE', N'MODERADA', N'SEVERA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_cd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_condiciones_dermatologicas PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_cd_codigo UNIQUE (codigo_condicion)
);
GO

-- 013. TABLA: clientes.clientes (Maestra de Clientes)
IF OBJECT_ID(N'clientes.clientes', N'U') IS NOT NULL DROP TABLE clientes.clientes;
CREATE TABLE clientes.clientes (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_usuario BIGINT NOT NULL,
    nombres NVARCHAR(80) NOT NULL,
    primer_apellido NVARCHAR(60) NOT NULL,
    segundo_apellido NVARCHAR(60) NULL,
    fecha_nacimiento DATE NOT NULL,
    genero NVARCHAR(20) NULL CONSTRAINT CK_clientes_cli_gen CHECK (genero IN (N'FEMENINO', N'MASCULINO', N'NO_BINARIO', N'PREFIERO_NO_DECIR')),
    curp NVARCHAR(18) NULL,
    rfc NVARCHAR(13) NULL,
    telefono_fijo NVARCHAR(20) NULL,
    acepta_terminos BIT NOT NULL CONSTRAINT DF_clientes_cli_at DEFAULT 1,
    fecha_aceptacion_terminos DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cli_fat DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_cli_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cli_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_clientes PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_cli_usuario UNIQUE (ID_usuario),
    CONSTRAINT FK_clientes_cli_usuario FOREIGN KEY (ID_usuario) REFERENCES seguridad.usuarios(ID));
GO

-- 014. TABLA: clientes.direcciones (Transaccional)
IF OBJECT_ID(N'clientes.direcciones', N'U') IS NOT NULL DROP TABLE clientes.direcciones;
CREATE TABLE clientes.direcciones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    alias_direccion NVARCHAR(50) NOT NULL, -- Ej: Casa, Trabajo
    calle NVARCHAR(120) NOT NULL,
    numero_exterior NVARCHAR(20) NOT NULL,
    numero_interior NVARCHAR(20) NULL,
    colonia NVARCHAR(100) NOT NULL,
    codigo_postal NVARCHAR(10) NOT NULL,
    municipio_alcaldia NVARCHAR(100) NOT NULL,
    estado NVARCHAR(80) NOT NULL,
    pais NVARCHAR(60) NOT NULL CONSTRAINT DF_clientes_dir_pais DEFAULT N'México',
    referencias NVARCHAR(255) NULL,
    es_predeterminada_envio BIT NOT NULL CONSTRAINT DF_clientes_dir_pe DEFAULT 0,
    es_predeterminada_facturacion BIT NOT NULL CONSTRAINT DF_clientes_dir_pf DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_dir_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_dir_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_direcciones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_clientes_dir_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 015. TABLA: clientes.perfil_cutaneo (Transaccional / Datos Sensibles de Salud LFPDPPP)
IF OBJECT_ID(N'clientes.perfil_cutaneo', N'U') IS NOT NULL DROP TABLE clientes.perfil_cutaneo;
CREATE TABLE clientes.perfil_cutaneo (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    ID_tipo_piel BIGINT NOT NULL,
    sensibilidad_solar NVARCHAR(30) NOT NULL CONSTRAINT CK_clientes_pc_solar CHECK (sensibilidad_solar IN (N'MUY_BAJA', N'MODERADA', N'ALTA', N'EXTREMA')),
    nivel_oleosidad NVARCHAR(20) NOT NULL CONSTRAINT CK_clientes_pc_oleo CHECK (nivel_oleosidad IN (N'SECA', N'EQUILIBRADA', N'ZONA_T', N'GRASA_TOTAL')),
    poros_dilatados BIT NOT NULL CONSTRAINT DF_clientes_pc_poros DEFAULT 0,
    propension_acne BIT NOT NULL CONSTRAINT DF_clientes_pc_acne DEFAULT 0,
    manchas_hiperpigmentacion BIT NOT NULL CONSTRAINT DF_clientes_pc_manchas DEFAULT 0,
    lineas_expresion BIT NOT NULL CONSTRAINT DF_clientes_pc_lineas DEFAULT 0,
    consentimiento_datos_sensibles BIT NOT NULL CONSTRAINT DF_clientes_pc_cds DEFAULT 1,
    fecha_declaracion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_pc_fd DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_pc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_pc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_perfil_cutaneo PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_pc_cliente UNIQUE (ID_cliente),
    CONSTRAINT FK_clientes_pc_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_clientes_pc_tipo_piel FOREIGN KEY (ID_tipo_piel) REFERENCES clientes.tipos_piel(ID));
GO

-- 016. TABLA: clientes.cliente_condiciones (Intermedia N:M)
IF OBJECT_ID(N'clientes.cliente_condiciones', N'U') IS NOT NULL DROP TABLE clientes.cliente_condiciones;
CREATE TABLE clientes.cliente_condiciones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    ID_condicion_dermatologica BIGINT NOT NULL,
    diagnosticada_por_medico BIT NOT NULL CONSTRAINT DF_clientes_cc_dpm DEFAULT 0,
    notas_paciente NVARCHAR(255) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_cc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_cliente_condiciones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_cc_cliente_condicion UNIQUE (ID_cliente, ID_condicion_dermatologica),
    CONSTRAINT FK_clientes_cc_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_clientes_cc_condicion FOREIGN KEY (ID_condicion_dermatologica) REFERENCES clientes.condiciones_dermatologicas(ID));
GO

-- 017. TABLA: clientes.cuestionarios_diagnostico (Maestra)
IF OBJECT_ID(N'clientes.cuestionarios_diagnostico', N'U') IS NOT NULL DROP TABLE clientes.cuestionarios_diagnostico;
CREATE TABLE clientes.cuestionarios_diagnostico (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_cuestionario NVARCHAR(30) NOT NULL,
    titulo NVARCHAR(120) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    version_clinica NVARCHAR(10) NOT NULL,
    vigente_desde DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_cdiag_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cdiag_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_cuestionarios_diagnostico PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_cdiag_codigo UNIQUE (codigo_cuestionario)
);
GO

-- 018. TABLA: clientes.preguntas_diagnostico (Maestra)
IF OBJECT_ID(N'clientes.preguntas_diagnostico', N'U') IS NOT NULL DROP TABLE clientes.preguntas_diagnostico;
CREATE TABLE clientes.preguntas_diagnostico (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cuestionario BIGINT NOT NULL,
    numero_orden INT NOT NULL,
    enunciado_pregunta NVARCHAR(255) NOT NULL,
    tipo_respuesta NVARCHAR(30) NOT NULL CONSTRAINT CK_clientes_pd_tr CHECK (tipo_respuesta IN (N'OPCION_UNICA', N'OPCION_MULTIPLE', N'ESCALA_NUMERICA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_pd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_pd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_preguntas_diagnostico PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_pd_orden UNIQUE (ID_cuestionario, numero_orden),
    CONSTRAINT FK_clientes_pd_cuestionario FOREIGN KEY (ID_cuestionario) REFERENCES clientes.cuestionarios_diagnostico(ID));
GO

-- 019. TABLA: clientes.opciones_pregunta (Maestra)
IF OBJECT_ID(N'clientes.opciones_pregunta', N'U') IS NOT NULL DROP TABLE clientes.opciones_pregunta;
CREATE TABLE clientes.opciones_pregunta (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_pregunta BIGINT NOT NULL,
    clave_opcion NVARCHAR(20) NOT NULL,
    texto_opcion NVARCHAR(150) NOT NULL,
    peso_clinico_puntos INT NOT NULL CONSTRAINT DF_clientes_op_peso DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_op_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_op_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_opciones_pregunta PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_op_pregunta_clave UNIQUE (ID_pregunta, clave_opcion),
    CONSTRAINT FK_clientes_op_pregunta FOREIGN KEY (ID_pregunta) REFERENCES clientes.preguntas_diagnostico(ID));
GO

-- 020. TABLA: clientes.evaluaciones_diagnostico (Transaccional)
IF OBJECT_ID(N'clientes.evaluaciones_diagnostico', N'U') IS NOT NULL DROP TABLE clientes.evaluaciones_diagnostico;
CREATE TABLE clientes.evaluaciones_diagnostico (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    ID_cuestionario BIGINT NOT NULL,
    fecha_realizacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_ed_fr DEFAULT SYSDATETIME(),
    puntaje_total INT NOT NULL,
    diagnostico_sugerido NVARCHAR(150) NOT NULL,
    observaciones_dermoconsultor NVARCHAR(500) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_ed_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_ed_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_evaluaciones_diagnostico PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_clientes_ed_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID),
    CONSTRAINT FK_clientes_ed_cuestionario FOREIGN KEY (ID_cuestionario) REFERENCES clientes.cuestionarios_diagnostico(ID));
GO

-- 021. TABLA: clientes.respuestas_evaluacion (Transaccional)
IF OBJECT_ID(N'clientes.respuestas_evaluacion', N'U') IS NOT NULL DROP TABLE clientes.respuestas_evaluacion;
CREATE TABLE clientes.respuestas_evaluacion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_evaluacion BIGINT NOT NULL,
    ID_pregunta BIGINT NOT NULL,
    ID_opcion_seleccionada BIGINT NOT NULL,
    valor_texto_adicional NVARCHAR(255) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_re_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_re_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_respuestas_evaluacion PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_re_eval_preg UNIQUE (ID_evaluacion, ID_pregunta, ID_opcion_seleccionada),
    CONSTRAINT FK_clientes_re_evaluacion FOREIGN KEY (ID_evaluacion) REFERENCES clientes.evaluaciones_diagnostico(ID),
    CONSTRAINT FK_clientes_re_pregunta FOREIGN KEY (ID_pregunta) REFERENCES clientes.preguntas_diagnostico(ID),
    CONSTRAINT FK_clientes_re_opcion FOREIGN KEY (ID_opcion_seleccionada) REFERENCES clientes.opciones_pregunta(ID));
GO

-- 022. TABLA: clientes.consentimientos_privacidad (Transaccional / Evidencia Legal LFPDPPP)
IF OBJECT_ID(N'clientes.consentimientos_privacidad', N'U') IS NOT NULL DROP TABLE clientes.consentimientos_privacidad;
CREATE TABLE clientes.consentimientos_privacidad (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    version_aviso_privacidad NVARCHAR(20) NOT NULL, -- Ej: v1.0-2026
    acepta_finalidades_primarias BIT NOT NULL CONSTRAINT DF_clientes_cp_fp DEFAULT 1,
    acepta_finalidades_secundarias_marketing BIT NOT NULL CONSTRAINT DF_clientes_cp_fs DEFAULT 0,
    acepta_tratamiento_datos_salud_sensibles BIT NOT NULL CONSTRAINT DF_clientes_cp_dss DEFAULT 1,
    direccion_ip_firma NVARCHAR(45) NOT NULL,
    medio_consentimiento NVARCHAR(30) NOT NULL CONSTRAINT CK_clientes_cp_medio CHECK (medio_consentimiento IN (N'CHECKBOX_DIGITAL', N'FIRMA_ELECTRONICA', N'EN_SUCURSAL')),
    fecha_consentimiento DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cp_fc DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_cp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_cp_fcreacion DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_consentimientos_privacidad PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_clientes_cp_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 023. TABLA: clientes.solicitudes_arco (Transaccional / Gestión Derechos ARCO LFPDPPP)
IF OBJECT_ID(N'clientes.solicitudes_arco', N'U') IS NOT NULL DROP TABLE clientes.solicitudes_arco;
CREATE TABLE clientes.solicitudes_arco (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    folio_solicitud NVARCHAR(35) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    tipo_derecho NVARCHAR(20) NOT NULL CONSTRAINT CK_clientes_arco_tipo CHECK (tipo_derecho IN (N'ACCESO', N'RECTIFICACION', N'CANCELACION', N'OPOSICION')),
    motivo_solicitud NVARCHAR(500) NOT NULL,
    estado_tramite NVARCHAR(20) NOT NULL CONSTRAINT CK_clientes_arco_est CHECK (estado_tramite IN (N'RECIBIDA', N'EN_REVISION', N'DOCUMENTACION_REQUERIDA', N'PROCEDENTE', N'IMPROCEDENTE', N'CONCLUIDA')),
    fecha_limite_respuesta DATE NOT NULL, -- Plazo legal máximo de 20 días hábiles
    resolucion_juridica NVARCHAR(1000) NULL,
    fecha_resolucion DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_arco_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_arco_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_solicitudes_arco PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_arco_folio UNIQUE (folio_solicitud),
    CONSTRAINT FK_clientes_arco_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 024. TABLA: clientes.preferencias_comunicacion (Transaccional)
IF OBJECT_ID(N'clientes.preferencias_comunicacion', N'U') IS NOT NULL DROP TABLE clientes.preferencias_comunicacion;
CREATE TABLE clientes.preferencias_comunicacion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    canal_email BIT NOT NULL CONSTRAINT DF_clientes_pcom_email DEFAULT 1,
    canal_sms BIT NOT NULL CONSTRAINT DF_clientes_pcom_sms DEFAULT 0,
    canal_whatsapp BIT NOT NULL CONSTRAINT DF_clientes_pcom_wa DEFAULT 0,
    notificaciones_ofertas BIT NOT NULL CONSTRAINT DF_clientes_pcom_ofertas DEFAULT 1,
    alertas_reabastecimiento_rutina BIT NOT NULL CONSTRAINT DF_clientes_pcom_reab DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_pcom_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_pcom_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_preferencias_comunicacion PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_pcom_cliente UNIQUE (ID_cliente),
    CONSTRAINT FK_clientes_pcom_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 025. TABLA: clientes.metodos_pago_tokenizados (Transaccional / PCI-DSS)
IF OBJECT_ID(N'clientes.metodos_pago_tokenizados', N'U') IS NOT NULL DROP TABLE clientes.metodos_pago_tokenizados;
CREATE TABLE clientes.metodos_pago_tokenizados (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    pasarela_emisor NVARCHAR(30) NOT NULL, -- Stripe, MercadoPago
    token_tarjeta_pasarela NVARCHAR(120) NOT NULL, -- Token generado por la pasarela, NUNCA datos planos
    marca_tarjeta NVARCHAR(30) NOT NULL, -- Visa, MasterCard, Amex
    ultimos_cuatro_digitos VARCHAR(4) NOT NULL,
    mes_expiracion INT NOT NULL CONSTRAINT CK_clientes_mpt_mes CHECK (mes_expiracion BETWEEN 1 AND 12),
    anio_expiracion INT NOT NULL CONSTRAINT CK_clientes_mpt_anio CHECK (anio_expiracion >= 2026),
    titular_tarjeta_hash NVARCHAR(128) NOT NULL,
    es_predeterminada BIT NOT NULL CONSTRAINT DF_clientes_mpt_pred DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_mpt_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_mpt_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_metodos_pago_tokenizados PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_clientes_mpt_token UNIQUE (token_tarjeta_pasarela),
    CONSTRAINT FK_clientes_mpt_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- =================================================================================================
-- SECCIÓN 1.3: CATÁLOGO DE SALUD, BELLEZA, MAQUILLAJE Y COFEPRIS (TABLAS 026 - 046)
-- =================================================================================================

-- 026. TABLA: catalogo.marcas (Maestra)
IF OBJECT_ID(N'catalogo.marcas', N'U') IS NOT NULL DROP TABLE catalogo.marcas;
CREATE TABLE catalogo.marcas (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_marca NVARCHAR(30) NOT NULL,
    nombre_marca NVARCHAR(100) NOT NULL,
    pais_origen NVARCHAR(60) NOT NULL,
    sitio_web NVARCHAR(200) NULL,
    es_dermocosmetica BIT NOT NULL CONSTRAINT DF_catalogo_marcas_dermo DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_marcas_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_marcas_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_marcas PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_marcas_codigo UNIQUE (codigo_marca)
);
GO

-- 027. TABLA: catalogo.laboratorios_fabricantes (Maestra)
IF OBJECT_ID(N'catalogo.laboratorios_fabricantes', N'U') IS NOT NULL DROP TABLE catalogo.laboratorios_fabricantes;
CREATE TABLE catalogo.laboratorios_fabricantes (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    clave_laboratorio NVARCHAR(30) NOT NULL,
    razon_social NVARCHAR(150) NOT NULL,
    licencia_sanitaria NVARCHAR(80) NOT NULL,
    pais NVARCHAR(60) NOT NULL,
    certificacion_gmp_vigente BIT NOT NULL CONSTRAINT DF_catalogo_lab_gmp DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_lab_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_lab_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_laboratorios_fabricantes PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_lab_clave UNIQUE (clave_laboratorio)
);
GO

-- 028. TABLA: catalogo.categorias (Maestra Jerárquica)
IF OBJECT_ID(N'catalogo.categorias', N'U') IS NOT NULL DROP TABLE catalogo.categorias;
CREATE TABLE catalogo.categorias (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_categoria NVARCHAR(30) NOT NULL,
    nombre_categoria NVARCHAR(80) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    ID_categoria_padre BIGINT NULL,
    nivel_arbol INT NOT NULL CONSTRAINT DF_catalogo_cat_nivel DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_cat_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_cat_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_categorias PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_cat_codigo UNIQUE (codigo_categoria),
    CONSTRAINT FK_catalogo_cat_padre FOREIGN KEY (ID_categoria_padre) REFERENCES catalogo.categorias(ID));
GO

-- 029. TABLA: catalogo.subcategorias (Maestra)
IF OBJECT_ID(N'catalogo.subcategorias', N'U') IS NOT NULL DROP TABLE catalogo.subcategorias;
CREATE TABLE catalogo.subcategorias (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_categoria BIGINT NOT NULL,
    codigo_subcategoria NVARCHAR(30) NOT NULL,
    nombre_subcategoria NVARCHAR(80) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_subcat_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_subcat_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_subcategorias PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_subcat_codigo UNIQUE (codigo_subcategoria),
    CONSTRAINT FK_catalogo_subcat_categoria FOREIGN KEY (ID_categoria) REFERENCES catalogo.categorias(ID));
GO

-- 030. TABLA: catalogo.tipos_aplicacion (Catálogo 5)
IF OBJECT_ID(N'catalogo.tipos_aplicacion', N'U') IS NOT NULL DROP TABLE catalogo.tipos_aplicacion;
CREATE TABLE catalogo.tipos_aplicacion (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_aplicacion NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(50) NOT NULL, -- Rostro, Ojos, Labios, Cuello, Cuerpo, Capilar
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_ta_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_ta_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_tipos_aplicacion PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_ta_codigo UNIQUE (codigo_aplicacion)
);
GO

-- 031. TABLA: catalogo.certificaciones_sanitarias (Catálogo 6)
IF OBJECT_ID(N'catalogo.certificaciones_sanitarias', N'U') IS NOT NULL DROP TABLE catalogo.certificaciones_sanitarias;
CREATE TABLE catalogo.certificaciones_sanitarias (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_certificacion NVARCHAR(30) NOT NULL,
    nombre_certificacion NVARCHAR(80) NOT NULL, -- Cruelty Free, Vegan, Orgánico USDA, ECOCERT, Hipoalergénico
    organismo_certificador NVARCHAR(100) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_cert_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_cert_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_certificaciones_sanitarias PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_cert_codigo UNIQUE (codigo_certificacion)
);
GO

-- 032. TABLA: catalogo.productos_maestros (Maestra de Productos)
IF OBJECT_ID(N'catalogo.productos_maestros', N'U') IS NOT NULL DROP TABLE catalogo.productos_maestros;
CREATE TABLE catalogo.productos_maestros (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_marca BIGINT NOT NULL,
    ID_subcategoria BIGINT NOT NULL,
    ID_laboratorio BIGINT NOT NULL,
    ID_tipo_aplicacion BIGINT NOT NULL,
    ID_certificacion_sanitaria BIGINT NULL,
    codigo_producto NVARCHAR(40) NOT NULL,
    nombre_comercial NVARCHAR(150) NOT NULL,
    descripcion_corta NVARCHAR(300) NOT NULL,
    descripcion_detallada NVARCHAR(MAX) NOT NULL,
    modo_empleo NVARCHAR(1000) NOT NULL,
    requiere_prescripcion_medica BIT NOT NULL CONSTRAINT DF_catalogo_pm_rpm DEFAULT 0,
    factor_proteccion_solar_fps INT NULL CONSTRAINT CK_catalogo_pm_fps CHECK (factor_proteccion_solar_fps IS NULL OR factor_proteccion_solar_fps BETWEEN 0 AND 100),
    es_sensible_temperatura BIT NOT NULL CONSTRAINT DF_catalogo_pm_temp DEFAULT 0, -- Cadena de frío requerida
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_pm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_pm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_productos_maestros PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_pm_codigo UNIQUE (codigo_producto),
    CONSTRAINT FK_catalogo_pm_marca FOREIGN KEY (ID_marca) REFERENCES catalogo.marcas(ID),
    CONSTRAINT FK_catalogo_pm_subcat FOREIGN KEY (ID_subcategoria) REFERENCES catalogo.subcategorias(ID),
    CONSTRAINT FK_catalogo_pm_lab FOREIGN KEY (ID_laboratorio) REFERENCES catalogo.laboratorios_fabricantes(ID),
    CONSTRAINT FK_catalogo_pm_aplicacion FOREIGN KEY (ID_tipo_aplicacion) REFERENCES catalogo.tipos_aplicacion(ID),
    CONSTRAINT FK_catalogo_pm_certificacion FOREIGN KEY (ID_certificacion_sanitaria) REFERENCES catalogo.certificaciones_sanitarias(ID));
GO

-- 033. TABLA: catalogo.subtonos_maquillaje (Catálogo 7)
IF OBJECT_ID(N'catalogo.subtonos_maquillaje', N'U') IS NOT NULL DROP TABLE catalogo.subtonos_maquillaje;
CREATE TABLE catalogo.subtonos_maquillaje (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_subtono NVARCHAR(20) NOT NULL,
    nombre_subtono NVARCHAR(50) NOT NULL, -- Cálido (Warm), Frío (Cool), Neutro (Neutral), Oliva (Olive)
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_subt_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_subt_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_subtonos_maquillaje PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_subt_codigo UNIQUE (codigo_subtono)
);
GO

-- 034. TABLA: catalogo.acabados_maquillaje (Catálogo 8)
IF OBJECT_ID(N'catalogo.acabados_maquillaje', N'U') IS NOT NULL DROP TABLE catalogo.acabados_maquillaje;
CREATE TABLE catalogo.acabados_maquillaje (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_acabado NVARCHAR(20) NOT NULL,
    nombre_acabado NVARCHAR(50) NOT NULL, -- Mate, Satinado, Glow/Radiante, Terciopelo, Brilloso
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_acab_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_acab_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_acabados_maquillaje PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_acab_codigo UNIQUE (codigo_acabado)
);
GO

-- 035. TABLA: catalogo.variantes_sku (Transaccional de SKUs)
IF OBJECT_ID(N'catalogo.variantes_sku', N'U') IS NOT NULL DROP TABLE catalogo.variantes_sku;
CREATE TABLE catalogo.variantes_sku (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_producto BIGINT NOT NULL,
    sku_codigo VARCHAR(50) NOT NULL,
    codigo_barras_ean13 VARCHAR(14) NOT NULL,
    nombre_presentacion NVARCHAR(100) NOT NULL, -- Ej: Tono 210 Warm Nude 30ml
    contenido_neto_gramos_ml DECIMAL(8,2) NOT NULL,
    unidad_medida VARCHAR(10) NOT NULL CONSTRAINT CK_catalogo_vsku_um CHECK (unidad_medida IN ('ML', 'G', 'OZ', 'PZ')),
    precio_base_menudeo DECIMAL(12,2) NOT NULL CONSTRAINT CK_catalogo_vsku_precio CHECK (precio_base_menudeo > 0),
    costo_estandar_compra DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_vsku_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_vsku_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_variantes_sku PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_vsku_codigo UNIQUE (sku_codigo),
    CONSTRAINT UQ_catalogo_vsku_ean UNIQUE (codigo_barras_ean13),
    CONSTRAINT FK_catalogo_vsku_producto FOREIGN KEY (ID_producto) REFERENCES catalogo.productos_maestros(ID));
GO

-- 036. TABLA: catalogo.tonos_variante (Transaccional / Extensión Maquillaje)
IF OBJECT_ID(N'catalogo.tonos_variante', N'U') IS NOT NULL DROP TABLE catalogo.tonos_variante;
CREATE TABLE catalogo.tonos_variante (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    ID_subtono BIGINT NOT NULL,
    ID_acabado BIGINT NOT NULL,
    codigo_tono_color NVARCHAR(30) NOT NULL,
    nombre_tono NVARCHAR(60) NOT NULL,
    color_hexadecimal VARCHAR(7) NOT NULL CONSTRAINT CK_catalogo_tv_hex CHECK (color_hexadecimal LIKE '#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]'),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_tv_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_tv_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_tonos_variante PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_tv_sku UNIQUE (ID_variante_sku),
    CONSTRAINT FK_catalogo_tv_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID),
    CONSTRAINT FK_catalogo_tv_subtono FOREIGN KEY (ID_subtono) REFERENCES catalogo.subtonos_maquillaje(ID),
    CONSTRAINT FK_catalogo_tv_acabado FOREIGN KEY (ID_acabado) REFERENCES catalogo.acabados_maquillaje(ID));
GO

-- 037. TABLA: catalogo.ingredientes_inci (Maestra Nomenclatura Internacional Cosmética)
IF OBJECT_ID(N'catalogo.ingredientes_inci', N'U') IS NOT NULL DROP TABLE catalogo.ingredientes_inci;
CREATE TABLE catalogo.ingredientes_inci (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_cas VARCHAR(30) NULL, -- Identificador Chemical Abstracts Service
    nombre_inci NVARCHAR(120) NOT NULL, -- Ej: Niacinamide, Hyaluronic Acid, Retinol
    nombre_comun NVARCHAR(120) NOT NULL,
    funcion_principal NVARCHAR(150) NOT NULL,
    es_comedogenico BIT NOT NULL CONSTRAINT DF_catalogo_inci_com DEFAULT 0,
    indice_comedogenico INT NOT NULL CONSTRAINT CK_catalogo_inci_ic CHECK (indice_comedogenico BETWEEN 0 AND 5),
    es_alergeno_frecuente BIT NOT NULL CONSTRAINT DF_catalogo_inci_aler DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_inci_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_inci_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_ingredientes_inci PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_inci_nombre UNIQUE (nombre_inci)
);
GO

-- 038. TABLA: catalogo.alergenos_ingrediente (Transaccional)
IF OBJECT_ID(N'catalogo.alergenos_ingrediente', N'U') IS NOT NULL DROP TABLE catalogo.alergenos_ingrediente;
CREATE TABLE catalogo.alergenos_ingrediente (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_ingrediente BIGINT NOT NULL,
    nombre_alergeno NVARCHAR(80) NOT NULL,
    clasificacion_riesgo NVARCHAR(30) NOT NULL CONSTRAINT CK_catalogo_ai_riesgo CHECK (clasificacion_riesgo IN (N'BAJO', N'MEDIO', N'ALTO', N'MUY_SEVERO')),
    advertencia_etiqueta NVARCHAR(255) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_ai_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_ai_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_alergenos_ingrediente PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_catalogo_ai_ingrediente FOREIGN KEY (ID_ingrediente) REFERENCES catalogo.ingredientes_inci(ID));
GO

-- 039. TABLA: catalogo.formula_ingredientes (Intermedia N:M con porcentaje - 4FN)
IF OBJECT_ID(N'catalogo.formula_ingredientes', N'U') IS NOT NULL DROP TABLE catalogo.formula_ingredientes;
CREATE TABLE catalogo.formula_ingredientes (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_producto BIGINT NOT NULL,
    ID_ingrediente BIGINT NOT NULL,
    orden_en_etiqueta INT NOT NULL, -- Por norma sanitaria COFEPRIS se ordenan de mayor a menor concentración
    porcentaje_concentracion DECIMAL(5,2) NULL CONSTRAINT CK_catalogo_fi_porc CHECK (porcentaje_concentracion IS NULL OR (porcentaje_concentracion BETWEEN 0.01 AND 100.00)),
    es_principio_activo BIT NOT NULL CONSTRAINT DF_catalogo_fi_pa DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_fi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_fi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_formula_ingredientes PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_fi_producto_ingrediente UNIQUE (ID_producto, ID_ingrediente),
    CONSTRAINT FK_catalogo_fi_producto FOREIGN KEY (ID_producto) REFERENCES catalogo.productos_maestros(ID),
    CONSTRAINT FK_catalogo_fi_ingrediente FOREIGN KEY (ID_ingrediente) REFERENCES catalogo.ingredientes_inci(ID));
GO

-- 040. TABLA: catalogo.registros_sanitarios_cofepris (Transaccional Regulatoria)
IF OBJECT_ID(N'catalogo.registros_sanitarios_cofepris', N'U') IS NOT NULL DROP TABLE catalogo.registros_sanitarios_cofepris;
CREATE TABLE catalogo.registros_sanitarios_cofepris (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_producto BIGINT NOT NULL,
    numero_registro_sanitario NVARCHAR(60) NOT NULL,
    folio_ingreso_tramite NVARCHAR(60) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estatus_regulatorio NVARCHAR(30) NOT NULL CONSTRAINT CK_catalogo_cof_est CHECK (estatus_regulatorio IN (N'VIGENTE', N'EN_RENOVACION', N'SUSPENDIDO', N'VENCIDO')),
    documento_oficial_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_cof_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_cof_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_registros_sanitarios_cofepris PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_cof_numero UNIQUE (numero_registro_sanitario),
    CONSTRAINT UQ_catalogo_cof_producto UNIQUE (ID_producto),
    CONSTRAINT FK_catalogo_cof_producto FOREIGN KEY (ID_producto) REFERENCES catalogo.productos_maestros(ID));
GO

-- 041. TABLA: catalogo.advertencias_contraindicaciones (Transaccional Médica)
IF OBJECT_ID(N'catalogo.advertencias_contraindicaciones', N'U') IS NOT NULL DROP TABLE catalogo.advertencias_contraindicaciones;
CREATE TABLE catalogo.advertencias_contraindicaciones (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_producto BIGINT NOT NULL,
    tipo_advertencia NVARCHAR(30) NOT NULL CONSTRAINT CK_catalogo_adv_tipo CHECK (tipo_advertencia IN (N'EMBARAZO_LACTANCIA', N'FOTOSENSIBLE', N'USO_EXTERNO_EXCLUSIVO', N'HERIDAS_ABIERTAS', N'EVITAR_OJOS')),
    texto_advertencia NVARCHAR(350) NOT NULL,
    medida_en_caso_ingestion NVARCHAR(350) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_adv_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_adv_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_advertencias_contraindicaciones PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_catalogo_adv_producto FOREIGN KEY (ID_producto) REFERENCES catalogo.productos_maestros(ID));
GO

-- 042. TABLA: catalogo.multimedia_variantes (Transaccional)
IF OBJECT_ID(N'catalogo.multimedia_variantes', N'U') IS NOT NULL DROP TABLE catalogo.multimedia_variantes;
CREATE TABLE catalogo.multimedia_variantes (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    tipo_archivo NVARCHAR(20) NOT NULL CONSTRAINT CK_catalogo_mv_tipo CHECK (tipo_archivo IN (N'FOTO_FRONTAL', N'FOTO_SWATCH_PIEL', N'FOTO_EMPAQUE', N'VIDEO_TUTORIAL')),
    url_recurso NVARCHAR(350) NOT NULL,
    texto_alternativo_accesibilidad NVARCHAR(150) NOT NULL,
    numero_orden INT NOT NULL,
    es_imagen_principal BIT NOT NULL CONSTRAINT DF_catalogo_mv_princ DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_mv_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_mv_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_multimedia_variantes PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_mv_sku_orden UNIQUE (ID_variante_sku, numero_orden),
    CONSTRAINT FK_catalogo_mv_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 043. TABLA: catalogo.kits_sets (Maestra de Sets y Rutinas Armadas)
IF OBJECT_ID(N'catalogo.kits_sets', N'U') IS NOT NULL DROP TABLE catalogo.kits_sets;
CREATE TABLE catalogo.kits_sets (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    codigo_kit NVARCHAR(40) NOT NULL,
    nombre_kit NVARCHAR(120) NOT NULL,
    descripcion NVARCHAR(300) NOT NULL,
    descuento_porcentual_kit DECIMAL(5,2) NOT NULL CONSTRAINT CK_catalogo_kit_desc CHECK (descuento_porcentual_kit BETWEEN 0.00 AND 80.00),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_kit_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_kit_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_kits_sets PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_kit_codigo UNIQUE (codigo_kit)
);
GO

-- 044. TABLA: catalogo.kits_items (Intermedia N:M)
IF OBJECT_ID(N'catalogo.kits_items', N'U') IS NOT NULL DROP TABLE catalogo.kits_items;
CREATE TABLE catalogo.kits_items (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_kit BIGINT NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    cantidad_unidades INT NOT NULL CONSTRAINT CK_catalogo_ki_cant CHECK (cantidad_unidades >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_ki_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_ki_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_kits_items PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_ki_kit_sku UNIQUE (ID_kit, ID_variante_sku),
    CONSTRAINT FK_catalogo_ki_kit FOREIGN KEY (ID_kit) REFERENCES catalogo.kits_sets(ID),
    CONSTRAINT FK_catalogo_ki_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 045. TABLA: catalogo.productos_relacionados (Intermedia N:M Cross-Sell / Reemplazos)
IF OBJECT_ID(N'catalogo.productos_relacionados', N'U') IS NOT NULL DROP TABLE catalogo.productos_relacionados;
CREATE TABLE catalogo.productos_relacionados (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_producto_origen BIGINT NOT NULL,
    ID_producto_destino BIGINT NOT NULL,
    tipo_relacion NVARCHAR(30) NOT NULL CONSTRAINT CK_catalogo_pr_tipo CHECK (tipo_relacion IN (N'COMPLEMENTARIO', N'SUSTITUTO', N'PASO_SIGUIENTE_RUTINA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_pr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_pr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_productos_relacionados PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_catalogo_pr_origen_destino UNIQUE (ID_producto_origen, ID_producto_destino),
    CONSTRAINT FK_catalogo_pr_origen FOREIGN KEY (ID_producto_origen) REFERENCES catalogo.productos_maestros(ID),
    CONSTRAINT FK_catalogo_pr_destino FOREIGN KEY (ID_producto_destino) REFERENCES catalogo.productos_maestros(ID));
GO

-- 046. TABLA: catalogo.historial_precios_base (Bitácora Transaccional de Precios)
IF OBJECT_ID(N'catalogo.historial_precios_base', N'U') IS NOT NULL DROP TABLE catalogo.historial_precios_base;
CREATE TABLE catalogo.historial_precios_base (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    precio_anterior DECIMAL(12,2) NOT NULL,
    precio_nuevo DECIMAL(12,2) NOT NULL,
    motivo_cambio NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_hp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_hp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_historial_precios_base PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_catalogo_hp_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- =================================================================================================
-- SECCIÓN 1.4: COMUNIDAD, RUTINAS DE BELLEZA Y FIDELIZACIÓN (TABLAS 047 - 050)
-- =================================================================================================

-- 047. TABLA: comunidad.rutinas_belleza (Maestra)
IF OBJECT_ID(N'comunidad.rutinas_belleza', N'U') IS NOT NULL DROP TABLE comunidad.rutinas_belleza;
CREATE TABLE comunidad.rutinas_belleza (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    nombre_rutina NVARCHAR(100) NOT NULL, -- Ej: Rutina Facial Mañana Anti-Acné
    momento_dia NVARCHAR(20) NOT NULL CONSTRAINT CK_comunidad_rb_momento CHECK (momento_dia IN (N'MAÑANA', N'NOCHE', N'SEMANAL')),
    es_publica BIT NOT NULL CONSTRAINT DF_comunidad_rb_pub DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_comunidad_rb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_comunidad_rb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_comunidad_rutinas_belleza PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_comunidad_rb_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

-- 048. TABLA: comunidad.rutinas_pasos (Transaccional)
IF OBJECT_ID(N'comunidad.rutinas_pasos', N'U') IS NOT NULL DROP TABLE comunidad.rutinas_pasos;
CREATE TABLE comunidad.rutinas_pasos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_rutina BIGINT NOT NULL,
    numero_paso INT NOT NULL CONSTRAINT CK_comunidad_rp_paso CHECK (numero_paso BETWEEN 1 AND 15),
    nombre_fase NVARCHAR(60) NOT NULL, -- 1 Limpieza, 2 Tónico, 3 Sérum, 4 Crema, 5 Protector Solar
    instrucciones_aplicacion NVARCHAR(255) NULL,
    tiempo_espera_segundos INT NOT NULL CONSTRAINT DF_comunidad_rp_tespera DEFAULT 60,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_comunidad_rp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_comunidad_rp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_comunidad_rutinas_pasos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_comunidad_rp_rutina_paso UNIQUE (ID_rutina, numero_paso),
    CONSTRAINT FK_comunidad_rp_rutina FOREIGN KEY (ID_rutina) REFERENCES comunidad.rutinas_belleza(ID));
GO

-- 049. TABLA: comunidad.rutinas_productos (Intermedia N:M)
IF OBJECT_ID(N'comunidad.rutinas_productos', N'U') IS NOT NULL DROP TABLE comunidad.rutinas_productos;
CREATE TABLE comunidad.rutinas_productos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_rutina_paso BIGINT NOT NULL,
    ID_variante_sku BIGINT NOT NULL,
    es_producto_principal BIT NOT NULL CONSTRAINT DF_comunidad_rprod_princ DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_comunidad_rprod_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_comunidad_rprod_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_comunidad_rutinas_productos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT UQ_comunidad_rprod_paso_sku UNIQUE (ID_rutina_paso, ID_variante_sku),
    CONSTRAINT FK_comunidad_rprod_paso FOREIGN KEY (ID_rutina_paso) REFERENCES comunidad.rutinas_pasos(ID),
    CONSTRAINT FK_comunidad_rprod_sku FOREIGN KEY (ID_variante_sku) REFERENCES catalogo.variantes_sku(ID));
GO

-- 050. TABLA: comunidad.listas_deseos (Transaccional Wishlists)
IF OBJECT_ID(N'comunidad.listas_deseos', N'U') IS NOT NULL DROP TABLE comunidad.listas_deseos;
CREATE TABLE comunidad.listas_deseos (
    ID BIGINT IDENTITY(1,1) NOT NULL,
    ID_cliente BIGINT NOT NULL,
    nombre_lista NVARCHAR(80) NOT NULL, -- Ej: Mis labiales favoritos, Skin Care Deseado
    es_publica BIT NOT NULL CONSTRAINT DF_comunidad_ld_pub DEFAULT 0,
    token_compartir NVARCHAR(64) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_comunidad_ld_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_comunidad_ld_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_comunidad_listas_deseos PRIMARY KEY CLUSTERED (ID),
    CONSTRAINT FK_comunidad_ld_cliente FOREIGN KEY (ID_cliente) REFERENCES clientes.clientes(ID));
GO

PRINT '====================================================================================';
PRINT 'ÉXITO: Se crearon satisfactoriamente las 50 Tablas del Submódulo 1 (Integrante 1)';
PRINT 'Todas cuentan con ID autoincrementable y las 7 columnas de auditoría / soft delete.';
PRINT '====================================================================================';
GO

-- =================================================================================================
-- ÍNDICES SECUNDARIOS DEL SUBMÓDULO 1 (10 Índices de Rendimiento)
-- =================================================================================================
CREATE NONCLUSTERED INDEX IX_seguridad_usuarios_activo_email ON seguridad.usuarios (activo, email);
CREATE NONCLUSTERED INDEX IX_seguridad_usuarios_roles_ur ON seguridad.usuarios_roles (ID_usuario, ID_rol);
CREATE NONCLUSTERED INDEX IX_seguridad_sesiones_usuario_rev ON seguridad.sesiones_activas (ID_usuario, revocada, fecha_expiracion);
CREATE NONCLUSTERED INDEX IX_seguridad_intentos_login_ip ON seguridad.intentos_login (direccion_ip, fecha_creacion);
CREATE NONCLUSTERED INDEX IX_clientes_clientes_usuario_act ON clientes.clientes (ID_usuario, activo);
CREATE NONCLUSTERED INDEX IX_clientes_condiciones_cli ON clientes.cliente_condiciones (ID_cliente, ID_condicion_dermatologica);
CREATE NONCLUSTERED INDEX IX_catalogo_productos_marca_sub ON catalogo.productos_maestros (ID_marca, ID_subcategoria, ID_laboratorio);
CREATE NONCLUSTERED INDEX IX_catalogo_variantes_prod_act ON catalogo.variantes_sku (ID_producto, activo);
CREATE NONCLUSTERED INDEX IX_catalogo_formula_prod_ing ON catalogo.formula_ingredientes (ID_producto, ID_ingrediente);
CREATE NONCLUSTERED INDEX IX_catalogo_alergenos_ing_riesgo ON catalogo.alergenos_ingrediente (ID_ingrediente, clasificacion_riesgo);
GO
