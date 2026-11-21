-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, CONTROL DE ACCESO, PERFIL DERMO-SALUD, CATÁLOGO Y COFEPRIS
-- AUTOR / INTEGRANTE 1: Estudiante 1 (Responsable de Tablas 001 a 050)
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
    id_rol BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_seguridad_roles PRIMARY KEY CLUSTERED (id_rol),
    CONSTRAINT UQ_seguridad_roles_codigo UNIQUE (codigo_rol)
);
GO

-- 002. TABLA: seguridad.permisos (Catálogo 2)
IF OBJECT_ID(N'seguridad.permisos', N'U') IS NOT NULL DROP TABLE seguridad.permisos;
CREATE TABLE seguridad.permisos (
    id_permiso BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_seguridad_permisos PRIMARY KEY CLUSTERED (id_permiso),
    CONSTRAINT UQ_seguridad_permisos_clave UNIQUE (clave_permiso)
);
GO

-- 003. TABLA: seguridad.roles_permisos (Intermedia N:M)
IF OBJECT_ID(N'seguridad.roles_permisos', N'U') IS NOT NULL DROP TABLE seguridad.roles_permisos;
CREATE TABLE seguridad.roles_permisos (
    id_rol_permiso BIGINT IDENTITY(1,1) NOT NULL,
    rol BIGINT NOT NULL,
    permiso BIGINT NOT NULL,
    permitir BIT NOT NULL CONSTRAINT DF_seguridad_rp_permitir DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_rp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_rp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_roles_permisos PRIMARY KEY CLUSTERED (id_rol_permiso),
    CONSTRAINT UQ_seguridad_roles_permisos UNIQUE (rol, permiso),
    CONSTRAINT FK_seguridad_rp_rol FOREIGN KEY (rol) REFERENCES seguridad.roles(id_rol),
    CONSTRAINT FK_seguridad_rp_permiso FOREIGN KEY (permiso) REFERENCES seguridad.permisos(id_permiso));
GO

-- 004. TABLA: seguridad.usuarios (Maestra de Autenticación Criptográfica)
IF OBJECT_ID(N'seguridad.usuarios', N'U') IS NOT NULL DROP TABLE seguridad.usuarios;
CREATE TABLE seguridad.usuarios (
    id_usuario BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_seguridad_usuarios PRIMARY KEY CLUSTERED (id_usuario),
    CONSTRAINT UQ_seguridad_usuarios_email UNIQUE (email),
    CONSTRAINT UQ_seguridad_usuarios_uuid UNIQUE (uuid_usuario)
);
GO

-- 005. TABLA: seguridad.usuarios_roles (Intermedia N:M)
IF OBJECT_ID(N'seguridad.usuarios_roles', N'U') IS NOT NULL DROP TABLE seguridad.usuarios_roles;
CREATE TABLE seguridad.usuarios_roles (
    id_usuario_rol BIGINT IDENTITY(1,1) NOT NULL,
    usuario BIGINT NOT NULL,
    rol BIGINT NOT NULL,
    fecha_asignacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_ur_fa DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_seguridad_ur_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_seguridad_ur_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_seguridad_usuarios_roles PRIMARY KEY CLUSTERED (id_usuario_rol),
    CONSTRAINT UQ_seguridad_usuarios_roles UNIQUE (usuario, rol),
    CONSTRAINT FK_seguridad_ur_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario),
    CONSTRAINT FK_seguridad_ur_rol FOREIGN KEY (rol) REFERENCES seguridad.roles(id_rol));
GO

-- 006. TABLA: seguridad.sesiones_activas (Transaccional)
IF OBJECT_ID(N'seguridad.sesiones_activas', N'U') IS NOT NULL DROP TABLE seguridad.sesiones_activas;
CREATE TABLE seguridad.sesiones_activas (
    id_sesion BIGINT IDENTITY(1,1) NOT NULL,
    usuario BIGINT NOT NULL,
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
    CONSTRAINT PK_seguridad_sesiones_activas PRIMARY KEY CLUSTERED (id_sesion),
    CONSTRAINT UQ_seguridad_sa_token UNIQUE (token_sesion_hash),
    CONSTRAINT FK_seguridad_sa_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 007. TABLA: seguridad.historial_passwords (Transaccional / Criptografía)
IF OBJECT_ID(N'seguridad.historial_passwords', N'U') IS NOT NULL DROP TABLE seguridad.historial_passwords;
CREATE TABLE seguridad.historial_passwords (
    id_historial_pwd BIGINT IDENTITY(1,1) NOT NULL,
    usuario BIGINT NOT NULL,
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
    CONSTRAINT PK_seguridad_historial_passwords PRIMARY KEY CLUSTERED (id_historial_pwd),
    CONSTRAINT FK_seguridad_hp_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 008. TABLA: seguridad.intentos_login (Bitácora de Seguridad Forense)
IF OBJECT_ID(N'seguridad.intentos_login', N'U') IS NOT NULL DROP TABLE seguridad.intentos_login;
CREATE TABLE seguridad.intentos_login (
    id_intento_login BIGINT IDENTITY(1,1) NOT NULL,
    email_ingresado NVARCHAR(150) NOT NULL,
    usuario BIGINT NULL, -- Null si el usuario no existe en la BD
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
    CONSTRAINT PK_seguridad_intentos_login PRIMARY KEY CLUSTERED (id_intento_login),
    CONSTRAINT FK_seguridad_il_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 009. TABLA: seguridad.tokens_recuperacion (Transaccional)
IF OBJECT_ID(N'seguridad.tokens_recuperacion', N'U') IS NOT NULL DROP TABLE seguridad.tokens_recuperacion;
CREATE TABLE seguridad.tokens_recuperacion (
    id_token_recuperacion BIGINT IDENTITY(1,1) NOT NULL,
    usuario BIGINT NOT NULL,
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
    CONSTRAINT PK_seguridad_tokens_recuperacion PRIMARY KEY CLUSTERED (id_token_recuperacion),
    CONSTRAINT UQ_seguridad_tr_token UNIQUE (token_hash),
    CONSTRAINT FK_seguridad_tr_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 010. TABLA: seguridad.dispositivos_confianza (Transaccional)
IF OBJECT_ID(N'seguridad.dispositivos_confianza', N'U') IS NOT NULL DROP TABLE seguridad.dispositivos_confianza;
CREATE TABLE seguridad.dispositivos_confianza (
    id_dispositivo BIGINT IDENTITY(1,1) NOT NULL,
    usuario BIGINT NOT NULL,
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
    CONSTRAINT PK_seguridad_dispositivos_confianza PRIMARY KEY CLUSTERED (id_dispositivo),
    CONSTRAINT UQ_seguridad_dc_fingerprint UNIQUE (usuario, fingerprint_dispositivo),
    CONSTRAINT FK_seguridad_dc_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- =================================================================================================
-- SECCIÓN 1.2: CLIENTES, PERFIL DERMO-SALUD Y CUMPLIMIENTO LFPDPPP (TABLAS 011 - 025)
-- =================================================================================================

-- 011. TABLA: clientes.tipos_piel (Catálogo 3)
IF OBJECT_ID(N'clientes.tipos_piel', N'U') IS NOT NULL DROP TABLE clientes.tipos_piel;
CREATE TABLE clientes.tipos_piel (
    id_tipo_piel BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_clientes_tipos_piel PRIMARY KEY CLUSTERED (id_tipo_piel),
    CONSTRAINT UQ_clientes_tp_codigo UNIQUE (codigo_piel)
);
GO

-- 012. TABLA: clientes.condiciones_dermatologicas (Catálogo 4)
IF OBJECT_ID(N'clientes.condiciones_dermatologicas', N'U') IS NOT NULL DROP TABLE clientes.condiciones_dermatologicas;
CREATE TABLE clientes.condiciones_dermatologicas (
    id_condicion_dermatologica BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_clientes_condiciones_dermatologicas PRIMARY KEY CLUSTERED (id_condicion_dermatologica),
    CONSTRAINT UQ_clientes_cd_codigo UNIQUE (codigo_condicion)
);
GO

-- 013. TABLA: clientes.clientes (Maestra de Clientes)
IF OBJECT_ID(N'clientes.clientes', N'U') IS NOT NULL DROP TABLE clientes.clientes;
CREATE TABLE clientes.clientes (
    id_cliente BIGINT IDENTITY(1,1) NOT NULL,
    usuario BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_clientes PRIMARY KEY CLUSTERED (id_cliente),
    CONSTRAINT UQ_clientes_cli_usuario UNIQUE (usuario),
    CONSTRAINT FK_clientes_cli_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 014. TABLA: clientes.direcciones (Transaccional)
IF OBJECT_ID(N'clientes.direcciones', N'U') IS NOT NULL DROP TABLE clientes.direcciones;
CREATE TABLE clientes.direcciones (
    id_direccion BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_direcciones PRIMARY KEY CLUSTERED (id_direccion),
    CONSTRAINT FK_clientes_dir_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 015. TABLA: clientes.perfil_cutaneo (Transaccional / Datos Sensibles de Salud LFPDPPP)
IF OBJECT_ID(N'clientes.perfil_cutaneo', N'U') IS NOT NULL DROP TABLE clientes.perfil_cutaneo;
CREATE TABLE clientes.perfil_cutaneo (
    id_perfil_cutaneo BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
    tipo_piel BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_perfil_cutaneo PRIMARY KEY CLUSTERED (id_perfil_cutaneo),
    CONSTRAINT UQ_clientes_pc_cliente UNIQUE (cliente),
    CONSTRAINT FK_clientes_pc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_clientes_pc_tipo_piel FOREIGN KEY (tipo_piel) REFERENCES clientes.tipos_piel(id_tipo_piel));
GO

-- 016. TABLA: clientes.cliente_condiciones (Intermedia N:M)
IF OBJECT_ID(N'clientes.cliente_condiciones', N'U') IS NOT NULL DROP TABLE clientes.cliente_condiciones;
CREATE TABLE clientes.cliente_condiciones (
    id_cliente_condicion BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
    condicion_dermatologica BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_cliente_condiciones PRIMARY KEY CLUSTERED (id_cliente_condicion),
    CONSTRAINT UQ_clientes_cc_cliente_condicion UNIQUE (cliente, condicion_dermatologica),
    CONSTRAINT FK_clientes_cc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_clientes_cc_condicion FOREIGN KEY (condicion_dermatologica) REFERENCES clientes.condiciones_dermatologicas(id_condicion_dermatologica));
GO

-- 017. TABLA: clientes.cuestionarios_diagnostico (Maestra)
IF OBJECT_ID(N'clientes.cuestionarios_diagnostico', N'U') IS NOT NULL DROP TABLE clientes.cuestionarios_diagnostico;
CREATE TABLE clientes.cuestionarios_diagnostico (
    id_cuestionario BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_clientes_cuestionarios_diagnostico PRIMARY KEY CLUSTERED (id_cuestionario),
    CONSTRAINT UQ_clientes_cdiag_codigo UNIQUE (codigo_cuestionario)
);
GO

-- 018. TABLA: clientes.preguntas_diagnostico (Maestra)
IF OBJECT_ID(N'clientes.preguntas_diagnostico', N'U') IS NOT NULL DROP TABLE clientes.preguntas_diagnostico;
CREATE TABLE clientes.preguntas_diagnostico (
    id_pregunta BIGINT IDENTITY(1,1) NOT NULL,
    cuestionario BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_preguntas_diagnostico PRIMARY KEY CLUSTERED (id_pregunta),
    CONSTRAINT UQ_clientes_pd_orden UNIQUE (cuestionario, numero_orden),
    CONSTRAINT FK_clientes_pd_cuestionario FOREIGN KEY (cuestionario) REFERENCES clientes.cuestionarios_diagnostico(id_cuestionario));
GO

-- 019. TABLA: clientes.opciones_pregunta (Maestra)
IF OBJECT_ID(N'clientes.opciones_pregunta', N'U') IS NOT NULL DROP TABLE clientes.opciones_pregunta;
CREATE TABLE clientes.opciones_pregunta (
    id_opcion BIGINT IDENTITY(1,1) NOT NULL,
    pregunta BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_opciones_pregunta PRIMARY KEY CLUSTERED (id_opcion),
    CONSTRAINT UQ_clientes_op_pregunta_clave UNIQUE (pregunta, clave_opcion),
    CONSTRAINT FK_clientes_op_pregunta FOREIGN KEY (pregunta) REFERENCES clientes.preguntas_diagnostico(id_pregunta));
GO

-- 020. TABLA: clientes.evaluaciones_diagnostico (Transaccional)
IF OBJECT_ID(N'clientes.evaluaciones_diagnostico', N'U') IS NOT NULL DROP TABLE clientes.evaluaciones_diagnostico;
CREATE TABLE clientes.evaluaciones_diagnostico (
    id_evaluacion BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
    cuestionario BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_evaluaciones_diagnostico PRIMARY KEY CLUSTERED (id_evaluacion),
    CONSTRAINT FK_clientes_ed_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_clientes_ed_cuestionario FOREIGN KEY (cuestionario) REFERENCES clientes.cuestionarios_diagnostico(id_cuestionario));
GO

-- 021. TABLA: clientes.respuestas_evaluacion (Transaccional)
IF OBJECT_ID(N'clientes.respuestas_evaluacion', N'U') IS NOT NULL DROP TABLE clientes.respuestas_evaluacion;
CREATE TABLE clientes.respuestas_evaluacion (
    id_respuesta_evaluacion BIGINT IDENTITY(1,1) NOT NULL,
    evaluacion BIGINT NOT NULL,
    pregunta BIGINT NOT NULL,
    opcion_seleccionada BIGINT NOT NULL,
    valor_texto_adicional NVARCHAR(255) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_clientes_re_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_clientes_re_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_clientes_respuestas_evaluacion PRIMARY KEY CLUSTERED (id_respuesta_evaluacion),
    CONSTRAINT UQ_clientes_re_eval_preg UNIQUE (evaluacion, pregunta, opcion_seleccionada),
    CONSTRAINT FK_clientes_re_evaluacion FOREIGN KEY (evaluacion) REFERENCES clientes.evaluaciones_diagnostico(id_evaluacion),
    CONSTRAINT FK_clientes_re_pregunta FOREIGN KEY (pregunta) REFERENCES clientes.preguntas_diagnostico(id_pregunta),
    CONSTRAINT FK_clientes_re_opcion FOREIGN KEY (opcion_seleccionada) REFERENCES clientes.opciones_pregunta(id_opcion));
GO

-- 022. TABLA: clientes.consentimientos_privacidad (Transaccional / Evidencia Legal LFPDPPP)
IF OBJECT_ID(N'clientes.consentimientos_privacidad', N'U') IS NOT NULL DROP TABLE clientes.consentimientos_privacidad;
CREATE TABLE clientes.consentimientos_privacidad (
    id_consentimiento BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_consentimientos_privacidad PRIMARY KEY CLUSTERED (id_consentimiento),
    CONSTRAINT FK_clientes_cp_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 023. TABLA: clientes.solicitudes_arco (Transaccional / Gestión Derechos ARCO LFPDPPP)
IF OBJECT_ID(N'clientes.solicitudes_arco', N'U') IS NOT NULL DROP TABLE clientes.solicitudes_arco;
CREATE TABLE clientes.solicitudes_arco (
    id_solicitud_arco BIGINT IDENTITY(1,1) NOT NULL,
    folio_solicitud NVARCHAR(35) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_solicitudes_arco PRIMARY KEY CLUSTERED (id_solicitud_arco),
    CONSTRAINT UQ_clientes_arco_folio UNIQUE (folio_solicitud),
    CONSTRAINT FK_clientes_arco_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 024. TABLA: clientes.preferencias_comunicacion (Transaccional)
IF OBJECT_ID(N'clientes.preferencias_comunicacion', N'U') IS NOT NULL DROP TABLE clientes.preferencias_comunicacion;
CREATE TABLE clientes.preferencias_comunicacion (
    id_preferencia BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_preferencias_comunicacion PRIMARY KEY CLUSTERED (id_preferencia),
    CONSTRAINT UQ_clientes_pcom_cliente UNIQUE (cliente),
    CONSTRAINT FK_clientes_pcom_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 025. TABLA: clientes.metodos_pago_tokenizados (Transaccional / PCI-DSS)
IF OBJECT_ID(N'clientes.metodos_pago_tokenizados', N'U') IS NOT NULL DROP TABLE clientes.metodos_pago_tokenizados;
CREATE TABLE clientes.metodos_pago_tokenizados (
    id_metodo_tokenizado BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_clientes_metodos_pago_tokenizados PRIMARY KEY CLUSTERED (id_metodo_tokenizado),
    CONSTRAINT UQ_clientes_mpt_token UNIQUE (token_tarjeta_pasarela),
    CONSTRAINT FK_clientes_mpt_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- =================================================================================================
-- SECCIÓN 1.3: CATÁLOGO DE SALUD, BELLEZA, MAQUILLAJE Y COFEPRIS (TABLAS 026 - 046)
-- =================================================================================================

-- 026. TABLA: catalogo.marcas (Maestra)
IF OBJECT_ID(N'catalogo.marcas', N'U') IS NOT NULL DROP TABLE catalogo.marcas;
CREATE TABLE catalogo.marcas (
    id_marca BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_marcas PRIMARY KEY CLUSTERED (id_marca),
    CONSTRAINT UQ_catalogo_marcas_codigo UNIQUE (codigo_marca)
);
GO

-- 027. TABLA: catalogo.laboratorios_fabricantes (Maestra)
IF OBJECT_ID(N'catalogo.laboratorios_fabricantes', N'U') IS NOT NULL DROP TABLE catalogo.laboratorios_fabricantes;
CREATE TABLE catalogo.laboratorios_fabricantes (
    id_laboratorio BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_laboratorios_fabricantes PRIMARY KEY CLUSTERED (id_laboratorio),
    CONSTRAINT UQ_catalogo_lab_clave UNIQUE (clave_laboratorio)
);
GO

-- 028. TABLA: catalogo.categorias (Maestra Jerárquica)
IF OBJECT_ID(N'catalogo.categorias', N'U') IS NOT NULL DROP TABLE catalogo.categorias;
CREATE TABLE catalogo.categorias (
    id_categoria BIGINT IDENTITY(1,1) NOT NULL,
    codigo_categoria NVARCHAR(30) NOT NULL,
    nombre_categoria NVARCHAR(80) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    categoria_padre BIGINT NULL,
    nivel_arbol INT NOT NULL CONSTRAINT DF_catalogo_cat_nivel DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_cat_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_cat_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_categorias PRIMARY KEY CLUSTERED (id_categoria),
    CONSTRAINT UQ_catalogo_cat_codigo UNIQUE (codigo_categoria),
    CONSTRAINT FK_catalogo_cat_padre FOREIGN KEY (categoria_padre) REFERENCES catalogo.categorias(id_categoria));
GO

-- 029. TABLA: catalogo.subcategorias (Maestra)
IF OBJECT_ID(N'catalogo.subcategorias', N'U') IS NOT NULL DROP TABLE catalogo.subcategorias;
CREATE TABLE catalogo.subcategorias (
    id_subcategoria BIGINT IDENTITY(1,1) NOT NULL,
    categoria BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_subcategorias PRIMARY KEY CLUSTERED (id_subcategoria),
    CONSTRAINT UQ_catalogo_subcat_codigo UNIQUE (codigo_subcategoria),
    CONSTRAINT FK_catalogo_subcat_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria));
GO

-- 030. TABLA: catalogo.tipos_aplicacion (Catálogo 5)
IF OBJECT_ID(N'catalogo.tipos_aplicacion', N'U') IS NOT NULL DROP TABLE catalogo.tipos_aplicacion;
CREATE TABLE catalogo.tipos_aplicacion (
    id_tipo_aplicacion BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_tipos_aplicacion PRIMARY KEY CLUSTERED (id_tipo_aplicacion),
    CONSTRAINT UQ_catalogo_ta_codigo UNIQUE (codigo_aplicacion)
);
GO

-- 031. TABLA: catalogo.certificaciones_sanitarias (Catálogo 6)
IF OBJECT_ID(N'catalogo.certificaciones_sanitarias', N'U') IS NOT NULL DROP TABLE catalogo.certificaciones_sanitarias;
CREATE TABLE catalogo.certificaciones_sanitarias (
    id_certificacion BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_certificaciones_sanitarias PRIMARY KEY CLUSTERED (id_certificacion),
    CONSTRAINT UQ_catalogo_cert_codigo UNIQUE (codigo_certificacion)
);
GO

-- 032. TABLA: catalogo.productos_maestros (Maestra de Productos)
IF OBJECT_ID(N'catalogo.productos_maestros', N'U') IS NOT NULL DROP TABLE catalogo.productos_maestros;
CREATE TABLE catalogo.productos_maestros (
    id_producto BIGINT IDENTITY(1,1) NOT NULL,
    marca BIGINT NOT NULL,
    subcategoria BIGINT NOT NULL,
    laboratorio BIGINT NOT NULL,
    tipo_aplicacion BIGINT NOT NULL,
    certificacion_sanitaria BIGINT NULL,
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
    CONSTRAINT PK_catalogo_productos_maestros PRIMARY KEY CLUSTERED (id_producto),
    CONSTRAINT UQ_catalogo_pm_codigo UNIQUE (codigo_producto),
    CONSTRAINT FK_catalogo_pm_marca FOREIGN KEY (marca) REFERENCES catalogo.marcas(id_marca),
    CONSTRAINT FK_catalogo_pm_subcat FOREIGN KEY (subcategoria) REFERENCES catalogo.subcategorias(id_subcategoria),
    CONSTRAINT FK_catalogo_pm_lab FOREIGN KEY (laboratorio) REFERENCES catalogo.laboratorios_fabricantes(id_laboratorio),
    CONSTRAINT FK_catalogo_pm_aplicacion FOREIGN KEY (tipo_aplicacion) REFERENCES catalogo.tipos_aplicacion(id_tipo_aplicacion),
    CONSTRAINT FK_catalogo_pm_certificacion FOREIGN KEY (certificacion_sanitaria) REFERENCES catalogo.certificaciones_sanitarias(id_certificacion));
GO

-- 033. TABLA: catalogo.subtonos_maquillaje (Catálogo 7)
IF OBJECT_ID(N'catalogo.subtonos_maquillaje', N'U') IS NOT NULL DROP TABLE catalogo.subtonos_maquillaje;
CREATE TABLE catalogo.subtonos_maquillaje (
    id_subtono BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_subtonos_maquillaje PRIMARY KEY CLUSTERED (id_subtono),
    CONSTRAINT UQ_catalogo_subt_codigo UNIQUE (codigo_subtono)
);
GO

-- 034. TABLA: catalogo.acabados_maquillaje (Catálogo 8)
IF OBJECT_ID(N'catalogo.acabados_maquillaje', N'U') IS NOT NULL DROP TABLE catalogo.acabados_maquillaje;
CREATE TABLE catalogo.acabados_maquillaje (
    id_acabado BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_acabados_maquillaje PRIMARY KEY CLUSTERED (id_acabado),
    CONSTRAINT UQ_catalogo_acab_codigo UNIQUE (codigo_acabado)
);
GO

-- 035. TABLA: catalogo.variantes_sku (Transaccional de SKUs)
IF OBJECT_ID(N'catalogo.variantes_sku', N'U') IS NOT NULL DROP TABLE catalogo.variantes_sku;
CREATE TABLE catalogo.variantes_sku (
    id_variante_sku BIGINT IDENTITY(1,1) NOT NULL,
    producto BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_variantes_sku PRIMARY KEY CLUSTERED (id_variante_sku),
    CONSTRAINT UQ_catalogo_vsku_codigo UNIQUE (sku_codigo),
    CONSTRAINT UQ_catalogo_vsku_ean UNIQUE (codigo_barras_ean13),
    CONSTRAINT FK_catalogo_vsku_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto));
GO

-- 036. TABLA: catalogo.tonos_variante (Transaccional / Extensión Maquillaje)
IF OBJECT_ID(N'catalogo.tonos_variante', N'U') IS NOT NULL DROP TABLE catalogo.tonos_variante;
CREATE TABLE catalogo.tonos_variante (
    id_tono_variante BIGINT IDENTITY(1,1) NOT NULL,
    variante_sku BIGINT NOT NULL,
    subtono BIGINT NOT NULL,
    acabado BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_tonos_variante PRIMARY KEY CLUSTERED (id_tono_variante),
    CONSTRAINT UQ_catalogo_tv_sku UNIQUE (variante_sku),
    CONSTRAINT FK_catalogo_tv_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku),
    CONSTRAINT FK_catalogo_tv_subtono FOREIGN KEY (subtono) REFERENCES catalogo.subtonos_maquillaje(id_subtono),
    CONSTRAINT FK_catalogo_tv_acabado FOREIGN KEY (acabado) REFERENCES catalogo.acabados_maquillaje(id_acabado));
GO

-- 037. TABLA: catalogo.ingredientes_inci (Maestra Nomenclatura Internacional Cosmética)
IF OBJECT_ID(N'catalogo.ingredientes_inci', N'U') IS NOT NULL DROP TABLE catalogo.ingredientes_inci;
CREATE TABLE catalogo.ingredientes_inci (
    id_ingrediente BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_ingredientes_inci PRIMARY KEY CLUSTERED (id_ingrediente),
    CONSTRAINT UQ_catalogo_inci_nombre UNIQUE (nombre_inci)
);
GO

-- 038. TABLA: catalogo.alergenos_ingrediente (Transaccional)
IF OBJECT_ID(N'catalogo.alergenos_ingrediente', N'U') IS NOT NULL DROP TABLE catalogo.alergenos_ingrediente;
CREATE TABLE catalogo.alergenos_ingrediente (
    id_alergeno BIGINT IDENTITY(1,1) NOT NULL,
    ingrediente BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_alergenos_ingrediente PRIMARY KEY CLUSTERED (id_alergeno),
    CONSTRAINT FK_catalogo_ai_ingrediente FOREIGN KEY (ingrediente) REFERENCES catalogo.ingredientes_inci(id_ingrediente));
GO

-- 039. TABLA: catalogo.formula_ingredientes (Intermedia N:M con porcentaje - 4FN)
IF OBJECT_ID(N'catalogo.formula_ingredientes', N'U') IS NOT NULL DROP TABLE catalogo.formula_ingredientes;
CREATE TABLE catalogo.formula_ingredientes (
    id_formula_ingrediente BIGINT IDENTITY(1,1) NOT NULL,
    producto BIGINT NOT NULL,
    ingrediente BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_formula_ingredientes PRIMARY KEY CLUSTERED (id_formula_ingrediente),
    CONSTRAINT UQ_catalogo_fi_producto_ingrediente UNIQUE (producto, ingrediente),
    CONSTRAINT FK_catalogo_fi_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_catalogo_fi_ingrediente FOREIGN KEY (ingrediente) REFERENCES catalogo.ingredientes_inci(id_ingrediente));
GO

-- 040. TABLA: catalogo.registros_sanitarios_cofepris (Transaccional Regulatoria)
IF OBJECT_ID(N'catalogo.registros_sanitarios_cofepris', N'U') IS NOT NULL DROP TABLE catalogo.registros_sanitarios_cofepris;
CREATE TABLE catalogo.registros_sanitarios_cofepris (
    id_registro_sanitario BIGINT IDENTITY(1,1) NOT NULL,
    producto BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_registros_sanitarios_cofepris PRIMARY KEY CLUSTERED (id_registro_sanitario),
    CONSTRAINT UQ_catalogo_cof_numero UNIQUE (numero_registro_sanitario),
    CONSTRAINT UQ_catalogo_cof_producto UNIQUE (producto),
    CONSTRAINT FK_catalogo_cof_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto));
GO

-- 041. TABLA: catalogo.advertencias_contraindicaciones (Transaccional Médica)
IF OBJECT_ID(N'catalogo.advertencias_contraindicaciones', N'U') IS NOT NULL DROP TABLE catalogo.advertencias_contraindicaciones;
CREATE TABLE catalogo.advertencias_contraindicaciones (
    id_advertencia BIGINT IDENTITY(1,1) NOT NULL,
    producto BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_advertencias_contraindicaciones PRIMARY KEY CLUSTERED (id_advertencia),
    CONSTRAINT FK_catalogo_adv_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto));
GO

-- 042. TABLA: catalogo.multimedia_variantes (Transaccional)
IF OBJECT_ID(N'catalogo.multimedia_variantes', N'U') IS NOT NULL DROP TABLE catalogo.multimedia_variantes;
CREATE TABLE catalogo.multimedia_variantes (
    id_multimedia BIGINT IDENTITY(1,1) NOT NULL,
    variante_sku BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_multimedia_variantes PRIMARY KEY CLUSTERED (id_multimedia),
    CONSTRAINT UQ_catalogo_mv_sku_orden UNIQUE (variante_sku, numero_orden),
    CONSTRAINT FK_catalogo_mv_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 043. TABLA: catalogo.kits_sets (Maestra de Sets y Rutinas Armadas)
IF OBJECT_ID(N'catalogo.kits_sets', N'U') IS NOT NULL DROP TABLE catalogo.kits_sets;
CREATE TABLE catalogo.kits_sets (
    id_kit BIGINT IDENTITY(1,1) NOT NULL,
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
    CONSTRAINT PK_catalogo_kits_sets PRIMARY KEY CLUSTERED (id_kit),
    CONSTRAINT UQ_catalogo_kit_codigo UNIQUE (codigo_kit)
);
GO

-- 044. TABLA: catalogo.kits_items (Intermedia N:M)
IF OBJECT_ID(N'catalogo.kits_items', N'U') IS NOT NULL DROP TABLE catalogo.kits_items;
CREATE TABLE catalogo.kits_items (
    id_kit_item BIGINT IDENTITY(1,1) NOT NULL,
    kit BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_unidades INT NOT NULL CONSTRAINT CK_catalogo_ki_cant CHECK (cantidad_unidades >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_ki_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_ki_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_kits_items PRIMARY KEY CLUSTERED (id_kit_item),
    CONSTRAINT UQ_catalogo_ki_kit_sku UNIQUE (kit, variante_sku),
    CONSTRAINT FK_catalogo_ki_kit FOREIGN KEY (kit) REFERENCES catalogo.kits_sets(id_kit),
    CONSTRAINT FK_catalogo_ki_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 045. TABLA: catalogo.productos_relacionados (Intermedia N:M Cross-Sell / Reemplazos)
IF OBJECT_ID(N'catalogo.productos_relacionados', N'U') IS NOT NULL DROP TABLE catalogo.productos_relacionados;
CREATE TABLE catalogo.productos_relacionados (
    id_producto_relacionado BIGINT IDENTITY(1,1) NOT NULL,
    producto_origen BIGINT NOT NULL,
    producto_destino BIGINT NOT NULL,
    tipo_relacion NVARCHAR(30) NOT NULL CONSTRAINT CK_catalogo_pr_tipo CHECK (tipo_relacion IN (N'COMPLEMENTARIO', N'SUSTITUTO', N'PASO_SIGUIENTE_RUTINA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_catalogo_pr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_catalogo_pr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_catalogo_productos_relacionados PRIMARY KEY CLUSTERED (id_producto_relacionado),
    CONSTRAINT UQ_catalogo_pr_origen_destino UNIQUE (producto_origen, producto_destino),
    CONSTRAINT FK_catalogo_pr_origen FOREIGN KEY (producto_origen) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_catalogo_pr_destino FOREIGN KEY (producto_destino) REFERENCES catalogo.productos_maestros(id_producto));
GO

-- 046. TABLA: catalogo.historial_precios_base (Bitácora Transaccional de Precios)
IF OBJECT_ID(N'catalogo.historial_precios_base', N'U') IS NOT NULL DROP TABLE catalogo.historial_precios_base;
CREATE TABLE catalogo.historial_precios_base (
    id_historial_precio BIGINT IDENTITY(1,1) NOT NULL,
    variante_sku BIGINT NOT NULL,
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
    CONSTRAINT PK_catalogo_historial_precios_base PRIMARY KEY CLUSTERED (id_historial_precio),
    CONSTRAINT FK_catalogo_hp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- =================================================================================================
-- SECCIÓN 1.4: COMUNIDAD, RUTINAS DE BELLEZA Y FIDELIZACIÓN (TABLAS 047 - 050)
-- =================================================================================================

-- 047. TABLA: comunidad.rutinas_belleza (Maestra)
IF OBJECT_ID(N'comunidad.rutinas_belleza', N'U') IS NOT NULL DROP TABLE comunidad.rutinas_belleza;
CREATE TABLE comunidad.rutinas_belleza (
    id_rutina BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_comunidad_rutinas_belleza PRIMARY KEY CLUSTERED (id_rutina),
    CONSTRAINT FK_comunidad_rb_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 048. TABLA: comunidad.rutinas_pasos (Transaccional)
IF OBJECT_ID(N'comunidad.rutinas_pasos', N'U') IS NOT NULL DROP TABLE comunidad.rutinas_pasos;
CREATE TABLE comunidad.rutinas_pasos (
    id_rutina_paso BIGINT IDENTITY(1,1) NOT NULL,
    rutina BIGINT NOT NULL,
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
    CONSTRAINT PK_comunidad_rutinas_pasos PRIMARY KEY CLUSTERED (id_rutina_paso),
    CONSTRAINT UQ_comunidad_rp_rutina_paso UNIQUE (rutina, numero_paso),
    CONSTRAINT FK_comunidad_rp_rutina FOREIGN KEY (rutina) REFERENCES comunidad.rutinas_belleza(id_rutina));
GO

-- 049. TABLA: comunidad.rutinas_productos (Intermedia N:M)
IF OBJECT_ID(N'comunidad.rutinas_productos', N'U') IS NOT NULL DROP TABLE comunidad.rutinas_productos;
CREATE TABLE comunidad.rutinas_productos (
    id_rutina_producto BIGINT IDENTITY(1,1) NOT NULL,
    rutina_paso BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    es_producto_principal BIT NOT NULL CONSTRAINT DF_comunidad_rprod_princ DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_comunidad_rprod_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_comunidad_rprod_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_comunidad_rutinas_productos PRIMARY KEY CLUSTERED (id_rutina_producto),
    CONSTRAINT UQ_comunidad_rprod_paso_sku UNIQUE (rutina_paso, variante_sku),
    CONSTRAINT FK_comunidad_rprod_paso FOREIGN KEY (rutina_paso) REFERENCES comunidad.rutinas_pasos(id_rutina_paso),
    CONSTRAINT FK_comunidad_rprod_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 050. TABLA: comunidad.listas_deseos (Transaccional Wishlists)
IF OBJECT_ID(N'comunidad.listas_deseos', N'U') IS NOT NULL DROP TABLE comunidad.listas_deseos;
CREATE TABLE comunidad.listas_deseos (
    id_lista_deseos BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
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
    CONSTRAINT PK_comunidad_listas_deseos PRIMARY KEY CLUSTERED (id_lista_deseos),
    CONSTRAINT FK_comunidad_ld_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

PRINT '====================================================================================';
PRINT 'ÉXITO: Se crearon satisfactoriamente las 50 Tablas del Submódulo 1 (Integrante 1)';
PRINT 'Todas cuentan con ID autoincrementable y las 7 columnas de auditoría / soft delete.';
PRINT '====================================================================================';
GO
-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 2: MOTOR TRANSACCIONAL, SUSCRIPCIONES, PASARELAS DE PAGO, ANTIFRAUDE Y CFDI 4.0
-- AUTOR / INTEGRANTE 2: Estudiante 2 (Responsable de Tablas 051 a 100)
-- SGBD DESTINO: Microsoft SQL Server 2019 / 2022
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

USE EcommerceSaludBellezaDB;
GO

-- Crear esquemas lógicos para el submódulo comercial, financiero y fiscal
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ventas') EXEC('CREATE SCHEMA ventas');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'pagos') EXEC('CREATE SCHEMA pagos');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'fiscal') EXEC('CREATE SCHEMA fiscal');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'promos') EXEC('CREATE SCHEMA promos');
GO

-- =================================================================================================
-- SECCIÓN 2.1: CARRO, SUSCRIPCIONES Y PROMOCIONES DE CLIENTE (TABLAS 051 - 063)
-- =================================================================================================

-- 051. TABLA: ventas.tipos_descuento (Catálogo 9)
IF OBJECT_ID(N'ventas.tipos_descuento', N'U') IS NOT NULL DROP TABLE ventas.tipos_descuento;
CREATE TABLE ventas.tipos_descuento (
    id_tipo_descuento BIGINT IDENTITY(1,1) NOT NULL,
    codigo_descuento NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(50) NOT NULL, -- Porcentual, Monto Fijo, 2x1, Envío Gratis
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_td_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_td_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_tipos_descuento PRIMARY KEY CLUSTERED (id_tipo_descuento),
    CONSTRAINT UQ_ventas_td_codigo UNIQUE (codigo_descuento)
);
GO

-- 052. TABLA: ventas.estados_orden (Catálogo 10)
IF OBJECT_ID(N'ventas.estados_orden', N'U') IS NOT NULL DROP TABLE ventas.estados_orden;
CREATE TABLE ventas.estados_orden (
    id_estado_orden BIGINT IDENTITY(1,1) NOT NULL,
    codigo_estado NVARCHAR(30) NOT NULL,
    nombre_estado NVARCHAR(60) NOT NULL, -- PENDIENTE_PAGO, PAGADA, EN_PREPARACION_WMS, EN_TRANSITO, ENTREGADA, CANCELADA, REEMBOLSADA
    descripcion NVARCHAR(255) NOT NULL,
    es_terminal BIT NOT NULL CONSTRAINT DF_ventas_eo_term DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_eo_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_eo_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_estados_orden PRIMARY KEY CLUSTERED (id_estado_orden),
    CONSTRAINT UQ_ventas_eo_codigo UNIQUE (codigo_estado)
);
GO

-- 053. TABLA: ventas.motivos_cancelacion_orden (Catálogo 11)
IF OBJECT_ID(N'ventas.motivos_cancelacion_orden', N'U') IS NOT NULL DROP TABLE ventas.motivos_cancelacion_orden;
CREATE TABLE ventas.motivos_cancelacion_orden (
    id_motivo_cancelacion BIGINT IDENTITY(1,1) NOT NULL,
    codigo_motivo NVARCHAR(30) NOT NULL,
    descripcion_motivo NVARCHAR(200) NOT NULL,
    es_atribuible_cliente BIT NOT NULL CONSTRAINT DF_ventas_mc_cli DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_mc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_mc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_motivos_cancelacion_orden PRIMARY KEY CLUSTERED (id_motivo_cancelacion),
    CONSTRAINT UQ_ventas_mc_codigo UNIQUE (codigo_motivo)
);
GO

-- 054. TABLA: ventas.carritos (Transaccional)
IF OBJECT_ID(N'ventas.carritos', N'U') IS NOT NULL DROP TABLE ventas.carritos;
CREATE TABLE ventas.carritos (
    id_carrito BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
    token_sesion_carrito NVARCHAR(128) NOT NULL,
    fecha_ultima_actividad DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_carr_fua DEFAULT SYSDATETIME(),
    convertido_a_orden BIT NOT NULL CONSTRAINT DF_ventas_carr_conv DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_carr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_carr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_carritos PRIMARY KEY CLUSTERED (id_carrito),
    CONSTRAINT UQ_ventas_carr_token UNIQUE (token_sesion_carrito),
    CONSTRAINT FK_ventas_carr_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 055. TABLA: ventas.items_carrito (Transaccional)
IF OBJECT_ID(N'ventas.items_carrito', N'U') IS NOT NULL DROP TABLE ventas.items_carrito;
CREATE TABLE ventas.items_carrito (
    id_item_carrito BIGINT IDENTITY(1,1) NOT NULL,
    carrito BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT CK_ventas_ic_cant CHECK (cantidad >= 1),
    precio_unitario_capturado DECIMAL(12,2) NOT NULL,
    fecha_agregado DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ic_fa DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ic_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ic_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_items_carrito PRIMARY KEY CLUSTERED (id_item_carrito),
    CONSTRAINT UQ_ventas_ic_carrito_sku UNIQUE (carrito, variante_sku),
    CONSTRAINT FK_ventas_ic_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito),
    CONSTRAINT FK_ventas_ic_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 056. TABLA: ventas.carritos_abandonados_seguimiento (Transaccional Marketing)
IF OBJECT_ID(N'ventas.carritos_abandonados_seguimiento', N'U') IS NOT NULL DROP TABLE ventas.carritos_abandonados_seguimiento;
CREATE TABLE ventas.carritos_abandonados_seguimiento (
    id_seguimiento_carrito BIGINT IDENTITY(1,1) NOT NULL,
    carrito BIGINT NOT NULL,
    correo_recordatorio_enviado BIT NOT NULL CONSTRAINT DF_ventas_cas_correo DEFAULT 0,
    fecha_envio_recordatorio DATETIME2(3) NULL,
    recuperado BIT NOT NULL CONSTRAINT DF_ventas_cas_recup DEFAULT 0,
    monto_estimado_recuperable DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_cas_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_cas_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_carritos_abandonados PRIMARY KEY CLUSTERED (id_seguimiento_carrito),
    CONSTRAINT UQ_ventas_cas_carrito UNIQUE (carrito),
    CONSTRAINT FK_ventas_cas_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito));
GO

-- 057. TABLA: ventas.planes_suscripcion (Maestra Beauty Box / Resurtido Dermocosmético)
IF OBJECT_ID(N'ventas.planes_suscripcion', N'U') IS NOT NULL DROP TABLE ventas.planes_suscripcion;
CREATE TABLE ventas.planes_suscripcion (
    id_plan_suscripcion BIGINT IDENTITY(1,1) NOT NULL,
    codigo_plan NVARCHAR(30) NOT NULL,
    nombre_plan NVARCHAR(100) NOT NULL, -- Ej: Beauty Box Salud Piel, Resurtido Sérums Ácido Hialurónico
    descripcion NVARCHAR(300) NOT NULL,
    precio_recurrente_base DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ps_precio CHECK (precio_recurrente_base > 0),
    descuento_porcentual_fidelidad DECIMAL(5,2) NOT NULL CONSTRAINT DF_ventas_ps_desc DEFAULT 10.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ps_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ps_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_planes_suscripcion PRIMARY KEY CLUSTERED (id_plan_suscripcion),
    CONSTRAINT UQ_ventas_ps_codigo UNIQUE (codigo_plan)
);
GO

-- 058. TABLA: ventas.frecuencias_suscripcion (Catálogo 12)
IF OBJECT_ID(N'ventas.frecuencias_suscripcion', N'U') IS NOT NULL DROP TABLE ventas.frecuencias_suscripcion;
CREATE TABLE ventas.frecuencias_suscripcion (
    id_frecuencia_suscripcion BIGINT IDENTITY(1,1) NOT NULL,
    codigo_frecuencia NVARCHAR(20) NOT NULL,
    nombre NVARCHAR(50) NOT NULL, -- Mensual, Bimestral, Trimestral
    intervalo_dias INT NOT NULL CONSTRAINT CK_ventas_fs_dias CHECK (intervalo_dias BETWEEN 15 AND 180),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_fs_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_fs_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_frecuencias_suscripcion PRIMARY KEY CLUSTERED (id_frecuencia_suscripcion),
    CONSTRAINT UQ_ventas_fs_codigo UNIQUE (codigo_frecuencia)
);
GO

-- 059. TABLA: ventas.suscripciones_cliente (Transaccional)
IF OBJECT_ID(N'ventas.suscripciones_cliente', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_cliente;
CREATE TABLE ventas.suscripciones_cliente (
    id_suscripcion_cliente BIGINT IDENTITY(1,1) NOT NULL,
    folio_suscripcion NVARCHAR(35) NOT NULL,
    cliente BIGINT NOT NULL,
    plan_suscripcion BIGINT NOT NULL,
    frecuencia_suscripcion BIGINT NOT NULL,
    direccion_entrega BIGINT NOT NULL,
    metodo_tokenizado BIGINT NOT NULL,
    fecha_inicio DATE NOT NULL,
    proxima_fecha_cobro DATE NOT NULL,
    estado_suscripcion NVARCHAR(20) NOT NULL CONSTRAINT CK_ventas_sc_est CHECK (estado_suscripcion IN (N'ACTIVA', N'PAUSADA', N'CANCELADA', N'PAGO_FALLIDO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_sc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_cliente PRIMARY KEY CLUSTERED (id_suscripcion_cliente),
    CONSTRAINT UQ_ventas_sc_folio UNIQUE (folio_suscripcion),
    CONSTRAINT FK_ventas_sc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_ventas_sc_plan FOREIGN KEY (plan_suscripcion) REFERENCES ventas.planes_suscripcion(id_plan_suscripcion),
    CONSTRAINT FK_ventas_sc_frecuencia FOREIGN KEY (frecuencia_suscripcion) REFERENCES ventas.frecuencias_suscripcion(id_frecuencia_suscripcion),
    CONSTRAINT FK_ventas_sc_direccion FOREIGN KEY (direccion_entrega) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_sc_metodo FOREIGN KEY (metodo_tokenizado) REFERENCES clientes.metodos_pago_tokenizados(id_metodo_tokenizado));
GO

-- 060. TABLA: ventas.suscripciones_items (Intermedia N:M)
IF OBJECT_ID(N'ventas.suscripciones_items', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_items;
CREATE TABLE ventas.suscripciones_items (
    id_suscripcion_item BIGINT IDENTITY(1,1) NOT NULL,
    suscripcion_cliente BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad INT NOT NULL CONSTRAINT CK_ventas_si_cant CHECK (cantidad >= 1),
    precio_congelado_suscripcion DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_si_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_si_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_items PRIMARY KEY CLUSTERED (id_suscripcion_item),
    CONSTRAINT UQ_ventas_si_susc_sku UNIQUE (suscripcion_cliente, variante_sku),
    CONSTRAINT FK_ventas_si_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente),
    CONSTRAINT FK_ventas_si_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 061. TABLA: ventas.suscripciones_calendario_entregas (Transaccional)
IF OBJECT_ID(N'ventas.suscripciones_calendario_entregas', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_calendario_entregas;
CREATE TABLE ventas.suscripciones_calendario_entregas (
    id_entrega_programada BIGINT IDENTITY(1,1) NOT NULL,
    suscripcion_cliente BIGINT NOT NULL,
    fecha_programada_despacho DATE NOT NULL,
    numero_ciclo_periodo INT NOT NULL,
    estado_despacho NVARCHAR(30) NOT NULL CONSTRAINT CK_ventas_sce_est CHECK (estado_despacho IN (N'PROGRAMADO', N'COBRADO_PROCESANDO', N'DESPACHADO', N'OMITIDO_POR_CLIENTE')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_sce_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sce_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_cal PRIMARY KEY CLUSTERED (id_entrega_programada),
    CONSTRAINT UQ_ventas_sce_susc_ciclo UNIQUE (suscripcion_cliente, numero_ciclo_periodo),
    CONSTRAINT FK_ventas_sce_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente));
GO

-- 062. TABLA: ventas.suscripciones_bitacora_estados (Bitácora)
IF OBJECT_ID(N'ventas.suscripciones_bitacora_estados', N'U') IS NOT NULL DROP TABLE ventas.suscripciones_bitacora_estados;
CREATE TABLE ventas.suscripciones_bitacora_estados (
    id_bitacora_suscripcion BIGINT IDENTITY(1,1) NOT NULL,
    suscripcion_cliente BIGINT NOT NULL,
    estado_anterior NVARCHAR(20) NOT NULL,
    estado_nuevo NVARCHAR(20) NOT NULL,
    motivo_cambio NVARCHAR(255) NOT NULL,
    fecha_cambio DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sbe_fcamb DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_sbe_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_sbe_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_suscripciones_bitacora PRIMARY KEY CLUSTERED (id_bitacora_suscripcion),
    CONSTRAINT FK_ventas_sbe_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente));
GO

-- 063. TABLA: ventas.regalos_por_compra_gwp (Transaccional Gift With Purchase)
IF OBJECT_ID(N'ventas.regalos_por_compra_gwp', N'U') IS NOT NULL DROP TABLE ventas.regalos_por_compra_gwp;
CREATE TABLE ventas.regalos_por_compra_gwp (
    id_regalo_compra BIGINT IDENTITY(1,1) NOT NULL,
    codigo_promocion_gwp NVARCHAR(30) NOT NULL,
    nombre_promocion NVARCHAR(100) NOT NULL, -- Ej: Muestra de Sérum Gratis en compras > $899
    monto_minimo_requerido DECIMAL(12,2) NOT NULL,
    variante_sku_regalo BIGINT NOT NULL,
    fecha_inicio DATETIME2(3) NOT NULL,
    fecha_fin DATETIME2(3) NOT NULL,
    stock_maximo_regalos INT NOT NULL,
    regalos_entregados INT NOT NULL CONSTRAINT DF_ventas_gwp_entregados DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_gwp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_gwp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_regalos_gwp PRIMARY KEY CLUSTERED (id_regalo_compra),
    CONSTRAINT UQ_ventas_gwp_codigo UNIQUE (codigo_promocion_gwp),
    CONSTRAINT FK_ventas_gwp_sku FOREIGN KEY (variante_sku_regalo) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- =================================================================================================
-- SECCIÓN 2.2: MOTOR TRANSACCIONAL DE ÓRDENES Y CHECKOUT (TABLAS 064 - 073)
-- =================================================================================================

-- 064. TABLA: ventas.ordenes (Maestra Transaccional de Ventas)
IF OBJECT_ID(N'ventas.ordenes', N'U') IS NOT NULL DROP TABLE ventas.ordenes;
CREATE TABLE ventas.ordenes (
    id_orden BIGINT IDENTITY(1,1) NOT NULL,
    folio_orden NVARCHAR(40) NOT NULL,
    cliente BIGINT NOT NULL,
    estado_orden BIGINT NOT NULL,
    motivo_cancelacion BIGINT NULL,
    direccion_envio BIGINT NOT NULL,
    direccion_facturacion BIGINT NULL,
    fecha_orden DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ord_fo DEFAULT SYSDATETIME(),
    subtotal_bruto DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ord_sub CHECK (subtotal_bruto >= 0),
    total_descuentos DECIMAL(12,2) NOT NULL CONSTRAINT DF_ventas_ord_desc DEFAULT 0.00,
    total_impuestos_iva DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ord_iva CHECK (total_impuestos_iva >= 0),
    costo_envio DECIMAL(12,2) NOT NULL CONSTRAINT DF_ventas_ord_envio DEFAULT 0.00,
    total_neto DECIMAL(12,2) NOT NULL CONSTRAINT CK_ventas_ord_total CHECK (total_neto > 0),
    moneda VARCHAR(3) NOT NULL CONSTRAINT DF_ventas_ord_moneda DEFAULT 'MXN',
    requiere_factura BIT NOT NULL CONSTRAINT DF_ventas_ord_rf DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ord_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ord_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes PRIMARY KEY CLUSTERED (id_orden),
    CONSTRAINT UQ_ventas_ord_folio UNIQUE (folio_orden),
    CONSTRAINT FK_ventas_ord_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_ventas_ord_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden),
    CONSTRAINT FK_ventas_ord_direnvio FOREIGN KEY (direccion_envio) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_ord_dirfact FOREIGN KEY (direccion_facturacion) REFERENCES clientes.direcciones(id_direccion),
    CONSTRAINT FK_ventas_ord_motivo_cancel FOREIGN KEY (motivo_cancelacion) REFERENCES ventas.motivos_cancelacion_orden(id_motivo_cancelacion));
GO

-- 065. TABLA: ventas.ordenes_detalles (Transaccional Líneas de Producto)
IF OBJECT_ID(N'ventas.ordenes_detalles', N'U') IS NOT NULL DROP TABLE ventas.ordenes_detalles;
CREATE TABLE ventas.ordenes_detalles (
    id_orden_detalle BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    numero_partida INT NOT NULL,
    cantidad_comprada INT NOT NULL CONSTRAINT CK_ventas_od_cant CHECK (cantidad_comprada >= 1),
    precio_unitario_venta DECIMAL(12,2) NOT NULL,
    costo_unitario_historico DECIMAL(12,2) NOT NULL,
    monto_descuento_aplicado DECIMAL(12,2) NOT NULL CONSTRAINT DF_ventas_od_desc DEFAULT 0.00,
    subtotal_linea DECIMAL(12,2) NOT NULL,
    tasa_iva_porcentual DECIMAL(5,2) NOT NULL CONSTRAINT DF_ventas_od_tasa DEFAULT 16.00,
    monto_iva_linea DECIMAL(12,2) NOT NULL,
    total_linea DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_od_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_od_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_detalles PRIMARY KEY CLUSTERED (id_orden_detalle),
    CONSTRAINT UQ_ventas_od_partida UNIQUE (orden, numero_partida),
    CONSTRAINT FK_ventas_od_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_od_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 066. TABLA: ventas.ordenes_historial_estados (Bitácora de Estados)
IF OBJECT_ID(N'ventas.ordenes_historial_estados', N'U') IS NOT NULL DROP TABLE ventas.ordenes_historial_estados;
CREATE TABLE ventas.ordenes_historial_estados (
    id_orden_historial BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    estado_orden BIGINT NOT NULL,
    comentario_operativo NVARCHAR(300) NOT NULL,
    fecha_registro DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ohe_fr DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ohe_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ohe_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_historial PRIMARY KEY CLUSTERED (id_orden_historial),
    CONSTRAINT FK_ventas_ohe_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_ohe_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden));
GO

-- 067. TABLA: ventas.ordenes_splits_almacen (Transaccional División por Almacén)
IF OBJECT_ID(N'ventas.ordenes_splits_almacen', N'U') IS NOT NULL DROP TABLE ventas.ordenes_splits_almacen;
CREATE TABLE ventas.ordenes_splits_almacen (
    id_orden_split BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    sub_folio_split NVARCHAR(45) NOT NULL, -- Ej: ORD-9921-A (CEDIS Norte), ORD-9921-B (CEDIS Centro)
    estado_split NVARCHAR(30) NOT NULL CONSTRAINT CK_ventas_osa_est CHECK (estado_split IN (N'PENDIENTE', N'ASIGNADO', N'SURTIENDO', N'EMPAQUETADO', N'EN_RUTA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_osa_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_osa_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_splits PRIMARY KEY CLUSTERED (id_orden_split),
    CONSTRAINT UQ_ventas_osa_subfolio UNIQUE (sub_folio_split),
    CONSTRAINT FK_ventas_osa_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));
GO

-- 068. TABLA: ventas.ordenes_impuestos (Transaccional Desglose SAT)
IF OBJECT_ID(N'ventas.ordenes_impuestos', N'U') IS NOT NULL DROP TABLE ventas.ordenes_impuestos;
CREATE TABLE ventas.ordenes_impuestos (
    id_orden_impuesto BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    tipo_impuesto VARCHAR(10) NOT NULL CONSTRAINT CK_ventas_oi_tipo CHECK (tipo_impuesto IN ('002_IVA', '003_IEPS')),
    tasa_o_cuota DECIMAL(6,4) NOT NULL,
    base_gravable DECIMAL(12,2) NOT NULL,
    importe_impuesto DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_oi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_oi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_impuestos PRIMARY KEY CLUSTERED (id_orden_impuesto),
    CONSTRAINT FK_ventas_oi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));
GO

-- 069. TABLA: ventas.ordenes_descuentos (Transaccional)
IF OBJECT_ID(N'ventas.ordenes_descuentos', N'U') IS NOT NULL DROP TABLE ventas.ordenes_descuentos;
CREATE TABLE ventas.ordenes_descuentos (
    id_orden_descuento BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    tipo_descuento BIGINT NOT NULL,
    codigo_promocion_aplicado NVARCHAR(40) NOT NULL,
    monto_descontado DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_odesc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_odesc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_descuentos PRIMARY KEY CLUSTERED (id_orden_descuento),
    CONSTRAINT FK_ventas_odesc_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_ventas_odesc_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento));
GO

-- 070. TABLA: ventas.ordenes_notas_instrucciones (Transaccional)
IF OBJECT_ID(N'ventas.ordenes_notas_instrucciones', N'U') IS NOT NULL DROP TABLE ventas.ordenes_notas_instrucciones;
CREATE TABLE ventas.ordenes_notas_instrucciones (
    id_orden_nota BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    es_para_regalo BIT NOT NULL CONSTRAINT DF_ventas_oni_regalo DEFAULT 0,
    mensaje_tarjeta_regalo NVARCHAR(300) NULL,
    instrucciones_entrega_repartidor NVARCHAR(300) NULL,
    empaque_especial_ecologico BIT NOT NULL CONSTRAINT DF_ventas_oni_eco DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_oni_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_oni_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_ordenes_notas PRIMARY KEY CLUSTERED (id_orden_nota),
    CONSTRAINT UQ_ventas_oni_orden UNIQUE (orden),
    CONSTRAINT FK_ventas_oni_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));
GO

-- 071. TABLA: ventas.reservas_temporales_stock (Transaccional Bloqueo Concurrente)
IF OBJECT_ID(N'ventas.reservas_temporales_stock', N'U') IS NOT NULL DROP TABLE ventas.reservas_temporales_stock;
CREATE TABLE ventas.reservas_temporales_stock (
    id_reserva_stock BIGINT IDENTITY(1,1) NOT NULL,
    carrito BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_reservada INT NOT NULL CONSTRAINT CK_ventas_rts_cant CHECK (cantidad_reservada >= 1),
    fecha_reserva DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_rts_fres DEFAULT SYSDATETIME(),
    fecha_expiracion_reserva DATETIME2(3) NOT NULL, -- 15 minutos para completar pago
    liberada BIT NOT NULL CONSTRAINT DF_ventas_rts_lib DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_rts_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_rts_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_reservas_stock PRIMARY KEY CLUSTERED (id_reserva_stock),
    CONSTRAINT FK_ventas_rts_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito),
    CONSTRAINT FK_ventas_rts_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 072. TABLA: ventas.afiliados_influencers (Maestra Programa de Creadores)
IF OBJECT_ID(N'ventas.afiliados_influencers', N'U') IS NOT NULL DROP TABLE ventas.afiliados_influencers;
CREATE TABLE ventas.afiliados_influencers (
    id_afiliado BIGINT IDENTITY(1,1) NOT NULL,
    codigo_afiliado NVARCHAR(30) NOT NULL,
    usuario BIGINT NOT NULL,
    nombre_canal_red_social NVARCHAR(100) NOT NULL,
    porcentaje_comision DECIMAL(5,2) NOT NULL CONSTRAINT CK_ventas_ai_com CHECK (porcentaje_comision BETWEEN 1.00 AND 30.00),
    clabe_interbancaria VARCHAR(18) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ai_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ai_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_afiliados PRIMARY KEY CLUSTERED (id_afiliado),
    CONSTRAINT UQ_ventas_ai_codigo UNIQUE (codigo_afiliado),
    CONSTRAINT FK_ventas_ai_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 073. TABLA: ventas.comisiones_afiliados (Transaccional)
IF OBJECT_ID(N'ventas.comisiones_afiliados', N'U') IS NOT NULL DROP TABLE ventas.comisiones_afiliados;
CREATE TABLE ventas.comisiones_afiliados (
    id_comision_afiliado BIGINT IDENTITY(1,1) NOT NULL,
    afiliado BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_base_calculo DECIMAL(12,2) NOT NULL,
    monto_comision DECIMAL(12,2) NOT NULL,
    estado_pago NVARCHAR(20) NOT NULL CONSTRAINT CK_ventas_ca_est CHECK (estado_pago IN (N'PENDIENTE', N'APROBADA', N'PAGADA', N'CANCELADA_POR_DEVOLUCION')),
    fecha_dispersion_pago DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_ventas_ca_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_ventas_ca_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_ventas_comisiones PRIMARY KEY CLUSTERED (id_comision_afiliado),
    CONSTRAINT UQ_ventas_ca_orden UNIQUE (orden),
    CONSTRAINT FK_ventas_ca_afiliado FOREIGN KEY (afiliado) REFERENCES ventas.afiliados_influencers(id_afiliado),
    CONSTRAINT FK_ventas_ca_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));
GO

-- =================================================================================================
-- SECCIÓN 2.3: PASARELAS DE PAGO, WALLET, ANTIFRAUDE Y REEMBOLSOS (TABLAS 074 - 086)
-- =================================================================================================

-- 074. TABLA: pagos.proveedores_pasarela (Catálogo 13)
IF OBJECT_ID(N'pagos.proveedores_pasarela', N'U') IS NOT NULL DROP TABLE pagos.proveedores_pasarela;
CREATE TABLE pagos.proveedores_pasarela (
    id_proveedor_pasarela BIGINT IDENTITY(1,1) NOT NULL,
    codigo_pasarela NVARCHAR(20) NOT NULL,
    nombre_comercial NVARCHAR(60) NOT NULL, -- STRIPE, MERCADOPAGO, PAYPAL, OPENPAY, SPEI_DIRECTO
    url_webhook NVARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_pp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_pp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_proveedores_pasarela PRIMARY KEY CLUSTERED (id_proveedor_pasarela),
    CONSTRAINT UQ_pagos_pp_codigo UNIQUE (codigo_pasarela)
);
GO

-- 075. TABLA: pagos.metodos_pago (Catálogo 14)
IF OBJECT_ID(N'pagos.metodos_pago', N'U') IS NOT NULL DROP TABLE pagos.metodos_pago;
CREATE TABLE pagos.metodos_pago (
    id_metodo_pago BIGINT IDENTITY(1,1) NOT NULL,
    codigo_metodo NVARCHAR(20) NOT NULL,
    nombre_metodo NVARCHAR(60) NOT NULL, -- TARJETA_CREDITO, TARJETA_DEBITO, TRANSFERENCIA_SPEI, BILLETERA_WALLET, PUNTOS_BEAUTY
    comision_porcentual_fija DECIMAL(5,2) NOT NULL CONSTRAINT DF_pagos_mp_comfija DEFAULT 2.90,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_mp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_mp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_metodos_pago PRIMARY KEY CLUSTERED (id_metodo_pago),
    CONSTRAINT UQ_pagos_mp_codigo UNIQUE (codigo_metodo)
);
GO

-- 076. TABLA: pagos.transacciones (Maestra Transaccional de Pagos)
IF OBJECT_ID(N'pagos.transacciones', N'U') IS NOT NULL DROP TABLE pagos.transacciones;
CREATE TABLE pagos.transacciones (
    id_transaccion BIGINT IDENTITY(1,1) NOT NULL,
    folio_transaccion NVARCHAR(45) NOT NULL,
    orden BIGINT NOT NULL,
    proveedor_pasarela BIGINT NOT NULL,
    metodo_pago BIGINT NOT NULL,
    id_transaccion_externa_pasarela NVARCHAR(100) NOT NULL, -- ID devuelto por Stripe/MercadoPago
    monto_transaccion DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_tx_monto CHECK (monto_transaccion > 0),
    moneda VARCHAR(3) NOT NULL CONSTRAINT DF_pagos_tx_mon DEFAULT 'MXN',
    estado_pago NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_tx_est CHECK (estado_pago IN (N'PENDIENTE', N'APROBADA', N'RECHAZADA', N'CANCELADA', N'EN_MEDIACION')),
    codigo_autorizacion_bancaria NVARCHAR(30) NULL,
    fecha_pago_efectuado DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_tx_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_tx_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_transacciones PRIMARY KEY CLUSTERED (id_transaccion),
    CONSTRAINT UQ_pagos_tx_folio UNIQUE (folio_transaccion),
    CONSTRAINT FK_pagos_tx_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_tx_pasarela FOREIGN KEY (proveedor_pasarela) REFERENCES pagos.proveedores_pasarela(id_proveedor_pasarela),
    CONSTRAINT FK_pagos_tx_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago));
GO

-- 077. TABLA: pagos.intentos_cobro (Bitácora de Comunicación de API Pasarelas)
IF OBJECT_ID(N'pagos.intentos_cobro', N'U') IS NOT NULL DROP TABLE pagos.intentos_cobro;
CREATE TABLE pagos.intentos_cobro (
    id_intento_cobro BIGINT IDENTITY(1,1) NOT NULL,
    transaccion BIGINT NOT NULL,
    numero_intento INT NOT NULL,
    codigo_respuesta_http INT NOT NULL,
    payload_solicitud_sanitizado NVARCHAR(MAX) NOT NULL, -- Sin CVV ni datos sensibles
    payload_respuesta_pasarela NVARCHAR(MAX) NOT NULL,
    mensaje_error_banco NVARCHAR(250) NULL,
    fecha_intento DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ic_fi DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_ic_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ic_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_intentos_cobro PRIMARY KEY CLUSTERED (id_intento_cobro),
    CONSTRAINT FK_pagos_ic_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));
GO

-- 078. TABLA: pagos.split_multipagos (Transaccional Multipago)
IF OBJECT_ID(N'pagos.split_multipagos', N'U') IS NOT NULL DROP TABLE pagos.split_multipagos;
CREATE TABLE pagos.split_multipagos (
    id_split_pago BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    metodo_pago BIGINT NOT NULL,
    monto_asignado DECIMAL(12,2) NOT NULL,
    referencia_comprobante NVARCHAR(80) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_smp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_smp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_split_multipagos PRIMARY KEY CLUSTERED (id_split_pago),
    CONSTRAINT FK_pagos_smp_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_smp_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago));
GO

-- 079. TABLA: pagos.billetera_electronica (Maestra Wallet Cliente)
IF OBJECT_ID(N'pagos.billetera_electronica', N'U') IS NOT NULL DROP TABLE pagos.billetera_electronica;
CREATE TABLE pagos.billetera_electronica (
    id_billetera BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
    saldo_disponible DECIMAL(12,2) NOT NULL CONSTRAINT DF_pagos_be_saldo DEFAULT 0.00,
    saldo_bloqueado_retenido DECIMAL(12,2) NOT NULL CONSTRAINT DF_pagos_be_bloq DEFAULT 0.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_be_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_be_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_billetera PRIMARY KEY CLUSTERED (id_billetera),
    CONSTRAINT UQ_pagos_be_cliente UNIQUE (cliente),
    CONSTRAINT FK_pagos_be_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 080. TABLA: pagos.movimientos_billetera (Transaccional)
IF OBJECT_ID(N'pagos.movimientos_billetera', N'U') IS NOT NULL DROP TABLE pagos.movimientos_billetera;
CREATE TABLE pagos.movimientos_billetera (
    id_movimiento_billetera BIGINT IDENTITY(1,1) NOT NULL,
    billetera BIGINT NOT NULL,
    tipo_movimiento NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_mb_tipo CHECK (tipo_movimiento IN (N'CARGA_SALDO', N'PAGO_ORDEN', N'REEMBOLSO_DEVOLUCION', N'BONIFICACION_FIDELIDAD')),
    monto DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_mb_monto CHECK (monto > 0),
    saldo_anterior DECIMAL(12,2) NOT NULL,
    saldo_posterior DECIMAL(12,2) NOT NULL,
    descripcion_motivo NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_mb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_mb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_movimientos_billetera PRIMARY KEY CLUSTERED (id_movimiento_billetera),
    CONSTRAINT FK_pagos_mb_billetera FOREIGN KEY (billetera) REFERENCES pagos.billetera_electronica(id_billetera));
GO

-- 081. TABLA: pagos.tarjetas_regalo_giftcards (Maestra)
IF OBJECT_ID(N'pagos.tarjetas_regalo_giftcards', N'U') IS NOT NULL DROP TABLE pagos.tarjetas_regalo_giftcards;
CREATE TABLE pagos.tarjetas_regalo_giftcards (
    id_giftcard BIGINT IDENTITY(1,1) NOT NULL,
    codigo_giftcard_hash NVARCHAR(128) NOT NULL,
    monto_inicial DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_gc_ini CHECK (monto_inicial > 0),
    saldo_actual DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_gc_saldo CHECK (saldo_actual >= 0),
    fecha_vencimiento DATE NOT NULL,
    cliente_comprador BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_gc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_gc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_giftcards PRIMARY KEY CLUSTERED (id_giftcard),
    CONSTRAINT UQ_pagos_gc_hash UNIQUE (codigo_giftcard_hash),
    CONSTRAINT FK_pagos_gc_comprador FOREIGN KEY (cliente_comprador) REFERENCES clientes.clientes(id_cliente));
GO

-- 082. TABLA: pagos.redenciones_giftcards (Transaccional)
IF OBJECT_ID(N'pagos.redenciones_giftcards', N'U') IS NOT NULL DROP TABLE pagos.redenciones_giftcards;
CREATE TABLE pagos.redenciones_giftcards (
    id_redencion_giftcard BIGINT IDENTITY(1,1) NOT NULL,
    giftcard BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_redimido DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_rg_monto CHECK (monto_redimido > 0),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_rg_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_rg_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_redenciones_giftcard PRIMARY KEY CLUSTERED (id_redencion_giftcard),
    CONSTRAINT FK_pagos_rg_giftcard FOREIGN KEY (giftcard) REFERENCES pagos.tarjetas_regalo_giftcards(id_giftcard),
    CONSTRAINT FK_pagos_rg_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));
GO

-- 083. TABLA: pagos.reglas_antifraude (Maestra)
IF OBJECT_ID(N'pagos.reglas_antifraude', N'U') IS NOT NULL DROP TABLE pagos.reglas_antifraude;
CREATE TABLE pagos.reglas_antifraude (
    id_regla_antifraude BIGINT IDENTITY(1,1) NOT NULL,
    codigo_regla NVARCHAR(30) NOT NULL,
    descripcion NVARCHAR(200) NOT NULL,
    puntaje_riesgo_asignado INT NOT NULL CONSTRAINT CK_pagos_ra_pts CHECK (puntaje_riesgo_asignado BETWEEN 1 AND 100),
    bloqueo_automatico BIT NOT NULL CONSTRAINT DF_pagos_ra_bloq DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_ra_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ra_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_reglas_antifraude PRIMARY KEY CLUSTERED (id_regla_antifraude),
    CONSTRAINT UQ_pagos_ra_codigo UNIQUE (codigo_regla)
);
GO

-- 084. TABLA: pagos.evaluaciones_antifraude (Transaccional)
IF OBJECT_ID(N'pagos.evaluaciones_antifraude', N'U') IS NOT NULL DROP TABLE pagos.evaluaciones_antifraude;
CREATE TABLE pagos.evaluaciones_antifraude (
    id_evaluacion_fraude BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    regla_antifraude BIGINT NULL,
    score_riesgo_total INT NOT NULL,
    nivel_riesgo NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_ea_nivel CHECK (nivel_riesgo IN (N'BAJO', N'MEDIO', N'ALTO_REQUERIR_3DS', N'CRITICO_RECHAZADO')),
    ip_origen NVARCHAR(45) NOT NULL,
    distancia_geografica_km INT NULL,
    dispositivo_sospechoso BIT NOT NULL CONSTRAINT DF_pagos_ea_disp DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_ea_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_ea_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_evaluaciones_fraude PRIMARY KEY CLUSTERED (id_evaluacion_fraude),
    CONSTRAINT UQ_pagos_ea_orden UNIQUE (orden),
    CONSTRAINT FK_pagos_ea_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_pagos_ea_regla FOREIGN KEY (regla_antifraude) REFERENCES pagos.reglas_antifraude(id_regla_antifraude));
GO

-- 085. TABLA: pagos.contracargos_chargebacks (Transaccional Disputas)
IF OBJECT_ID(N'pagos.contracargos_chargebacks', N'U') IS NOT NULL DROP TABLE pagos.contracargos_chargebacks;
CREATE TABLE pagos.contracargos_chargebacks (
    id_contracargo BIGINT IDENTITY(1,1) NOT NULL,
    transaccion BIGINT NOT NULL,
    folio_disputa_pasarela NVARCHAR(60) NOT NULL,
    motivo_disputa NVARCHAR(150) NOT NULL, -- Tarjeta no presente, Mercancía no recibida, No reconocida
    monto_disputado DECIMAL(12,2) NOT NULL,
    fecha_notificacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_cc_fn DEFAULT SYSDATETIME(),
    fecha_limite_evidencia DATE NOT NULL,
    estatus_disputa NVARCHAR(20) NOT NULL CONSTRAINT CK_pagos_cc_est CHECK (estatus_disputa IN (N'ABIERTA', N'EN_REVISION', N'GANADA_POR_COMERCIO', N'PERDIDA_POR_COMERCIO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_cc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_cc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_contracargos PRIMARY KEY CLUSTERED (id_contracargo),
    CONSTRAINT UQ_pagos_cc_disputa UNIQUE (folio_disputa_pasarela),
    CONSTRAINT FK_pagos_cc_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));
GO

-- 086. TABLA: pagos.reembolsos_transaccion (Transaccional)
IF OBJECT_ID(N'pagos.reembolsos_transaccion', N'U') IS NOT NULL DROP TABLE pagos.reembolsos_transaccion;
CREATE TABLE pagos.reembolsos_transaccion (
    id_reembolso BIGINT IDENTITY(1,1) NOT NULL,
    transaccion BIGINT NOT NULL,
    folio_reembolso_pasarela NVARCHAR(80) NOT NULL,
    monto_reembolsado DECIMAL(12,2) NOT NULL CONSTRAINT CK_pagos_reemb_monto CHECK (monto_reembolsado > 0),
    motivo_reembolso NVARCHAR(250) NOT NULL,
    fecha_reembolso DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_reemb_fr DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_pagos_reemb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_pagos_reemb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_pagos_reembolsos PRIMARY KEY CLUSTERED (id_reembolso),
    CONSTRAINT UQ_pagos_reemb_folio UNIQUE (folio_reembolso_pasarela),
    CONSTRAINT FK_pagos_reemb_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));
GO

-- =================================================================================================
-- SECCIÓN 2.4: FACTURACIÓN ELECTRÓNICA CFDI 4.0 Y MOTOR DE PROMOCIONES (TABLAS 087 - 100)
-- =================================================================================================

-- 087. TABLA: fiscal.regimenes_sat (Catálogo 15)
IF OBJECT_ID(N'fiscal.regimenes_sat', N'U') IS NOT NULL DROP TABLE fiscal.regimenes_sat;
CREATE TABLE fiscal.regimenes_sat (
    id_regimen_sat BIGINT IDENTITY(1,1) NOT NULL,
    clave_regimen_sat VARCHAR(4) NOT NULL, -- Ej: 601 General de Ley, 605 Sueldos, 612 Actividad Empresarial, 626 RESICO
    descripcion NVARCHAR(200) NOT NULL,
    aplica_persona_fisica BIT NOT NULL,
    aplica_persona_moral BIT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_rs_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_rs_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_regimenes_sat PRIMARY KEY CLUSTERED (id_regimen_sat),
    CONSTRAINT UQ_fiscal_rs_clave UNIQUE (clave_regimen_sat)
);
GO

-- 088. TABLA: fiscal.usos_cfdi (Catálogo 16)
IF OBJECT_ID(N'fiscal.usos_cfdi', N'U') IS NOT NULL DROP TABLE fiscal.usos_cfdi;
CREATE TABLE fiscal.usos_cfdi (
    id_uso_cfdi BIGINT IDENTITY(1,1) NOT NULL,
    clave_uso_cfdi VARCHAR(5) NOT NULL, -- G01 Adquisición de mercancías, G03 Gastos en general, CP01 Pagos, S01 Sin efectos fiscales
    descripcion NVARCHAR(150) NOT NULL,
    aplica_fisica BIT NOT NULL,
    aplica_moral BIT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_uc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_uc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_usos_cfdi PRIMARY KEY CLUSTERED (id_uso_cfdi),
    CONSTRAINT UQ_fiscal_uc_clave UNIQUE (clave_uso_cfdi)
);
GO

-- 089. TABLA: fiscal.datos_fiscales_cliente (Transaccional)
IF OBJECT_ID(N'fiscal.datos_fiscales_cliente', N'U') IS NOT NULL DROP TABLE fiscal.datos_fiscales_cliente;
CREATE TABLE fiscal.datos_fiscales_cliente (
    id_dato_fiscal BIGINT IDENTITY(1,1) NOT NULL,
    cliente BIGINT NOT NULL,
    rfc_emisor VARCHAR(13) NOT NULL,
    razon_social NVARCHAR(150) NOT NULL,
    codigo_postal_fiscal VARCHAR(10) NOT NULL,
    regimen_sat BIGINT NOT NULL,
    uso_cfdi_predeterminado BIGINT NOT NULL,
    correo_envio_cfdi NVARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_dfc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_dfc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_datos_fiscales PRIMARY KEY CLUSTERED (id_dato_fiscal),
    CONSTRAINT FK_fiscal_dfc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_fiscal_dfc_regimen FOREIGN KEY (regimen_sat) REFERENCES fiscal.regimenes_sat(id_regimen_sat),
    CONSTRAINT FK_fiscal_dfc_uso FOREIGN KEY (uso_cfdi_predeterminado) REFERENCES fiscal.usos_cfdi(id_uso_cfdi));
GO

-- 090. TABLA: fiscal.facturas_cfdi (Maestra Transaccional CFDI 4.0)
IF OBJECT_ID(N'fiscal.facturas_cfdi', N'U') IS NOT NULL DROP TABLE fiscal.facturas_cfdi;
CREATE TABLE fiscal.facturas_cfdi (
    id_factura BIGINT IDENTITY(1,1) NOT NULL,
    orden BIGINT NOT NULL,
    dato_fiscal BIGINT NOT NULL,
    serie_factura VARCHAR(10) NOT NULL,
    folio_factura VARCHAR(20) NOT NULL,
    uuid_sat_fiscal UNIQUEIDENTIFIER NOT NULL, -- UUID de timbrado fiscal SAT
    sello_digital_cfdi NVARCHAR(MAX) NOT NULL,
    sello_sat NVARCHAR(MAX) NOT NULL,
    cadena_original_timbre NVARCHAR(MAX) NOT NULL,
    numero_certificado_sat VARCHAR(20) NOT NULL,
    fecha_timbrado DATETIME2(3) NOT NULL,
    monto_total_facturado DECIMAL(12,2) NOT NULL,
    estado_cfdi NVARCHAR(20) NOT NULL CONSTRAINT CK_fiscal_fcfdi_est CHECK (estado_cfdi IN (N'TIMBRADA_VIGENTE', N'CANCELADA_SAT', N'ERROR_TIMBRADO')),
    xml_comprobante_url NVARCHAR(300) NOT NULL,
    pdf_representacion_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_fcfdi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_fcfdi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_facturas PRIMARY KEY CLUSTERED (id_factura),
    CONSTRAINT UQ_fiscal_fcfdi_uuid UNIQUE (uuid_sat_fiscal),
    CONSTRAINT FK_fiscal_fcfdi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_fiscal_fcfdi_df FOREIGN KEY (dato_fiscal) REFERENCES fiscal.datos_fiscales_cliente(id_dato_fiscal));
GO

-- 091. TABLA: fiscal.facturas_partidas (Transaccional)
IF OBJECT_ID(N'fiscal.facturas_partidas', N'U') IS NOT NULL DROP TABLE fiscal.facturas_partidas;
CREATE TABLE fiscal.facturas_partidas (
    id_factura_partida BIGINT IDENTITY(1,1) NOT NULL,
    factura BIGINT NOT NULL,
    clave_producto_servicio_sat VARCHAR(10) NOT NULL, -- Ej: 53131600 Cosméticos y cuidado de la piel
    clave_unidad_sat VARCHAR(5) NOT NULL, -- H87 Pieza
    cantidad DECIMAL(12,2) NOT NULL,
    valor_unitario DECIMAL(12,2) NOT NULL,
    importe_neto DECIMAL(12,2) NOT NULL,
    objeto_impuesto VARCHAR(3) NOT NULL CONSTRAINT DF_fiscal_fp_obj DEFAULT '02', -- 02 Sí objeto de impuesto
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_fp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_fp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_facturas_partidas PRIMARY KEY CLUSTERED (id_factura_partida),
    CONSTRAINT FK_fiscal_fp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));
GO

-- 092. TABLA: fiscal.complementos_pago (Transaccional Recibos Electrónicos de Pago)
IF OBJECT_ID(N'fiscal.complementos_pago', N'U') IS NOT NULL DROP TABLE fiscal.complementos_pago;
CREATE TABLE fiscal.complementos_pago (
    id_complemento_pago BIGINT IDENTITY(1,1) NOT NULL,
    factura BIGINT NOT NULL,
    transaccion BIGINT NOT NULL,
    uuid_sat_complemento UNIQUEIDENTIFIER NOT NULL,
    numero_parcialidad INT NOT NULL CONSTRAINT DF_fiscal_cp_parc DEFAULT 1,
    saldo_anterior DECIMAL(12,2) NOT NULL,
    monto_pagado DECIMAL(12,2) NOT NULL,
    saldo_insoluto DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_cp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_cp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_complementos_pago PRIMARY KEY CLUSTERED (id_complemento_pago),
    CONSTRAINT UQ_fiscal_cp_uuid UNIQUE (uuid_sat_complemento),
    CONSTRAINT FK_fiscal_cp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura),
    CONSTRAINT FK_fiscal_cp_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion));
GO

-- 093. TABLA: fiscal.notas_credito (Transaccional)
IF OBJECT_ID(N'fiscal.notas_credito', N'U') IS NOT NULL DROP TABLE fiscal.notas_credito;
CREATE TABLE fiscal.notas_credito (
    id_nota_credito BIGINT IDENTITY(1,1) NOT NULL,
    factura BIGINT NOT NULL,
    uuid_sat_nota_credito UNIQUEIDENTIFIER NOT NULL,
    motivo_devolucion_sat VARCHAR(3) NOT NULL, -- 01 Devolución de mercancías
    subtotal_acreditado DECIMAL(12,2) NOT NULL,
    iva_acreditado DECIMAL(12,2) NOT NULL,
    total_acreditado DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_nc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_nc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_notas_credito PRIMARY KEY CLUSTERED (id_nota_credito),
    CONSTRAINT UQ_fiscal_nc_uuid UNIQUE (uuid_sat_nota_credito),
    CONSTRAINT FK_fiscal_nc_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));
GO

-- 094. TABLA: fiscal.cancelaciones_cfdi (Transaccional Auditoría Fiscal)
IF OBJECT_ID(N'fiscal.cancelaciones_cfdi', N'U') IS NOT NULL DROP TABLE fiscal.cancelaciones_cfdi;
CREATE TABLE fiscal.cancelaciones_cfdi (
    id_cancelacion_cfdi BIGINT IDENTITY(1,1) NOT NULL,
    factura BIGINT NOT NULL,
    motivo_cancelacion_sat VARCHAR(4) NOT NULL CONSTRAINT CK_fiscal_ccfdi_mot CHECK (motivo_cancelacion_sat IN ('01', '02', '03', '04')),
    uuid_sustitucion UNIQUEIDENTIFIER NULL,
    acuse_cancelacion_sat NVARCHAR(MAX) NOT NULL,
    fecha_solicitud_cancelacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_ccfdi_fsol DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_fiscal_ccfdi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_fiscal_ccfdi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_fiscal_cancelaciones PRIMARY KEY CLUSTERED (id_cancelacion_cfdi),
    CONSTRAINT FK_fiscal_ccfdi_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura));
GO

-- 095. TABLA: promos.campanias (Maestra)
IF OBJECT_ID(N'promos.campanias', N'U') IS NOT NULL DROP TABLE promos.campanias;
CREATE TABLE promos.campanias (
    id_campania BIGINT IDENTITY(1,1) NOT NULL,
    codigo_campania NVARCHAR(30) NOT NULL,
    nombre_campania NVARCHAR(100) NOT NULL, -- Ej: Hot Sale Belleza, Black Friday Dermocosmética
    fecha_inicio DATETIME2(3) NOT NULL,
    fecha_fin DATETIME2(3) NOT NULL,
    presupuesto_maximo_descuentos DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_camp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_camp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_campanias PRIMARY KEY CLUSTERED (id_campania),
    CONSTRAINT UQ_promos_camp_codigo UNIQUE (codigo_campania)
);
GO

-- 096. TABLA: promos.cupones (Maestra Cupones)
IF OBJECT_ID(N'promos.cupones', N'U') IS NOT NULL DROP TABLE promos.cupones;
CREATE TABLE promos.cupones (
    id_cupon BIGINT IDENTITY(1,1) NOT NULL,
    campania BIGINT NOT NULL,
    codigo_cupon NVARCHAR(30) NOT NULL, -- Ej: PIELRADIANTE20, BIENVENIDA10
    tipo_descuento BIGINT NOT NULL,
    valor_descuento DECIMAL(12,2) NOT NULL CONSTRAINT CK_promos_cup_val CHECK (valor_descuento > 0),
    monto_minimo_compra DECIMAL(12,2) NOT NULL CONSTRAINT DF_promos_cup_min DEFAULT 0.00,
    limite_usos_totales INT NOT NULL,
    usos_actuales INT NOT NULL CONSTRAINT DF_promos_cup_usos DEFAULT 0,
    limite_usos_por_cliente INT NOT NULL CONSTRAINT DF_promos_cup_ucli DEFAULT 1,
    fecha_expiracion DATETIME2(3) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_cup_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_cup_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_cupones PRIMARY KEY CLUSTERED (id_cupon),
    CONSTRAINT UQ_promos_cup_codigo UNIQUE (codigo_cupon),
    CONSTRAINT FK_promos_cup_campania FOREIGN KEY (campania) REFERENCES promos.campanias(id_campania),
    CONSTRAINT FK_promos_cup_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento));
GO

-- 097. TABLA: promos.reglas_elegibilidad_cupon (Transaccional)
IF OBJECT_ID(N'promos.reglas_elegibilidad_cupon', N'U') IS NOT NULL DROP TABLE promos.reglas_elegibilidad_cupon;
CREATE TABLE promos.reglas_elegibilidad_cupon (
    id_regla_cupon BIGINT IDENTITY(1,1) NOT NULL,
    cupon BIGINT NOT NULL,
    solo_primera_compra BIT NOT NULL CONSTRAINT DF_promos_rec_pc DEFAULT 0,
    excluye_kits_promocionales BIT NOT NULL CONSTRAINT DF_promos_rec_ek DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_rec_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_rec_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_reglas_cupon PRIMARY KEY CLUSTERED (id_regla_cupon),
    CONSTRAINT UQ_promos_rec_cupon UNIQUE (cupon),
    CONSTRAINT FK_promos_rec_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon));
GO

-- 098. TABLA: promos.cupones_categorias_excluidas (Intermedia N:M)
IF OBJECT_ID(N'promos.cupones_categorias_excluidas', N'U') IS NOT NULL DROP TABLE promos.cupones_categorias_excluidas;
CREATE TABLE promos.cupones_categorias_excluidas (
    id_cupon_exclusion BIGINT IDENTITY(1,1) NOT NULL,
    cupon BIGINT NOT NULL,
    categoria BIGINT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_cce_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_cce_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_cupones_exclusiones PRIMARY KEY CLUSTERED (id_cupon_exclusion),
    CONSTRAINT UQ_promos_cce_cupon_cat UNIQUE (cupon, categoria),
    CONSTRAINT FK_promos_cce_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon),
    CONSTRAINT FK_promos_cce_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria));
GO

-- 099. TABLA: promos.redenciones_cupones (Transaccional)
IF OBJECT_ID(N'promos.redenciones_cupones', N'U') IS NOT NULL DROP TABLE promos.redenciones_cupones;
CREATE TABLE promos.redenciones_cupones (
    id_redencion_cupon BIGINT IDENTITY(1,1) NOT NULL,
    cupon BIGINT NOT NULL,
    cliente BIGINT NOT NULL,
    orden BIGINT NOT NULL,
    monto_ahorrado DECIMAL(12,2) NOT NULL,
    fecha_aplicacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_rcup_fa DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_rcup_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_rcup_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_redenciones_cupones PRIMARY KEY CLUSTERED (id_redencion_cupon),
    CONSTRAINT FK_promos_rcup_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon),
    CONSTRAINT FK_promos_rcup_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_promos_rcup_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden));
GO

-- 100. TABLA: promos.ventas_flash_horarias (Transaccional Promociones Relámpago)
IF OBJECT_ID(N'promos.ventas_flash_horarias', N'U') IS NOT NULL DROP TABLE promos.ventas_flash_horarias;
CREATE TABLE promos.ventas_flash_horarias (
    id_venta_flash BIGINT IDENTITY(1,1) NOT NULL,
    variante_sku BIGINT NOT NULL,
    precio_oferta_flash DECIMAL(12,2) NOT NULL CONSTRAINT CK_promos_vfh_precio CHECK (precio_oferta_flash > 0),
    stock_destinado_flash INT NOT NULL CONSTRAINT CK_promos_vfh_stock CHECK (stock_destinado_flash >= 1),
    stock_vendido_flash INT NOT NULL CONSTRAINT DF_promos_vfh_vend DEFAULT 0,
    fecha_hora_inicio DATETIME2(3) NOT NULL,
    fecha_hora_fin DATETIME2(3) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_promos_vfh_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_promos_vfh_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_promos_ventas_flash PRIMARY KEY CLUSTERED (id_venta_flash),
    CONSTRAINT FK_promos_vfh_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

PRINT '====================================================================================';
PRINT 'ÉXITO: Se crearon satisfactoriamente las 50 Tablas del Submódulo 2 (Integrante 2)';
PRINT 'Tablas acumuladas en el sistema: 100 Tablas.';
PRINT 'Todas cuentan con ID autoincrementable y las 7 columnas de auditoría / soft delete.';
PRINT '====================================================================================';
GO
-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SUBMÓDULO 3: CADENA DE SUMINISTRO, LOTES SANITARIOS, WMS, ENVIOS, RMA Y AUDITORÍA FORENSE
-- AUTOR / INTEGRANTE 3: Estudiante 3 (Responsable de Tablas 101 a 150)
-- SGBD DESTINO: Microsoft SQL Server 2019 / 2022
-- TOTAL DE TABLAS EN ESTE SCRIPT: 50 Tablas Normalizadas (1FN, 2FN, 3FN, BCNF, 4FN)
-- CRITERIO DE AUDITORÍA: Cada tabla implementa ID autoincrementable y las 7 columnas de trazabilidad
-- y borrado lógico (Soft Delete) conforme a la LFPDPPP y Código Penal Federal.
-- =================================================================================================

USE EcommerceSaludBellezaDB;
GO

-- Crear esquemas lógicos para el submódulo de cadena de suministro, almacenes, logística y auditoría
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'compras') EXEC('CREATE SCHEMA compras');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'wms') EXEC('CREATE SCHEMA wms');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'envios') EXEC('CREATE SCHEMA envios');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'postventa') EXEC('CREATE SCHEMA postventa');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'auditoria') EXEC('CREATE SCHEMA auditoria');
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'sistema') EXEC('CREATE SCHEMA sistema');
GO

-- =================================================================================================
-- SECCIÓN 3.1: COMPRAS, PROVEEDORES Y RECEPCIÓN SANITARIA (TABLAS 101 - 112)
-- =================================================================================================

-- 101. TABLA: compras.estados_orden_compra (Catálogo 17)
IF OBJECT_ID(N'compras.estados_orden_compra', N'U') IS NOT NULL DROP TABLE compras.estados_orden_compra;
CREATE TABLE compras.estados_orden_compra (
    id_estado_oc BIGINT IDENTITY(1,1) NOT NULL,
    codigo_estado NVARCHAR(20) NOT NULL,
    nombre_estado NVARCHAR(50) NOT NULL, -- BORRADOR, AUTORIZADA, ENVIADA_PROVEEDOR, RECIBIDA_PARCIAL, RECIBIDA_TOTAL, CANCELADA
    descripcion NVARCHAR(200) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_eoc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_eoc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_estados_oc PRIMARY KEY CLUSTERED (id_estado_oc),
    CONSTRAINT UQ_compras_eoc_codigo UNIQUE (codigo_estado)
);
GO

-- 102. TABLA: compras.proveedores (Maestra)
IF OBJECT_ID(N'compras.proveedores', N'U') IS NOT NULL DROP TABLE compras.proveedores;
CREATE TABLE compras.proveedores (
    id_proveedor BIGINT IDENTITY(1,1) NOT NULL,
    codigo_proveedor NVARCHAR(30) NOT NULL,
    razon_social NVARCHAR(150) NOT NULL,
    nombre_comercial NVARCHAR(120) NOT NULL,
    rfc_proveedor VARCHAR(13) NOT NULL,
    pais_origen NVARCHAR(60) NOT NULL,
    dias_credito_pago INT NOT NULL CONSTRAINT DF_compras_prov_cred DEFAULT 30,
    calificacion_calidad_sanitaria DECIMAL(3,2) NOT NULL CONSTRAINT DF_compras_prov_calif DEFAULT 5.00,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_prov_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_prov_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_proveedores PRIMARY KEY CLUSTERED (id_proveedor),
    CONSTRAINT UQ_compras_prov_codigo UNIQUE (codigo_proveedor),
    CONSTRAINT UQ_compras_prov_rfc UNIQUE (rfc_proveedor)
);
GO

-- 103. TABLA: compras.contactos_proveedor (Transaccional)
IF OBJECT_ID(N'compras.contactos_proveedor', N'U') IS NOT NULL DROP TABLE compras.contactos_proveedor;
CREATE TABLE compras.contactos_proveedor (
    id_contacto_proveedor BIGINT IDENTITY(1,1) NOT NULL,
    proveedor BIGINT NOT NULL,
    nombre_contacto NVARCHAR(100) NOT NULL,
    puesto_cargo NVARCHAR(80) NOT NULL,
    email_contacto NVARCHAR(150) NOT NULL,
    telefono_directo NVARCHAR(20) NOT NULL,
    es_contacto_principal BIT NOT NULL CONSTRAINT DF_compras_cp_princ DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_cp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_cp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_contactos_prov PRIMARY KEY CLUSTERED (id_contacto_proveedor),
    CONSTRAINT FK_compras_cp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));
GO

-- 104. TABLA: compras.proveedor_slas (Transaccional Acuerdos de Nivel de Servicio)
IF OBJECT_ID(N'compras.proveedor_slas', N'U') IS NOT NULL DROP TABLE compras.proveedor_slas;
CREATE TABLE compras.proveedor_slas (
    id_proveedor_sla BIGINT IDENTITY(1,1) NOT NULL,
    proveedor BIGINT NOT NULL,
    tiempo_promedio_entrega_dias INT NOT NULL CONSTRAINT CK_compras_sla_dias CHECK (tiempo_promedio_entrega_dias >= 1),
    porcentaje_tolerancia_mermas DECIMAL(4,2) NOT NULL CONSTRAINT DF_compras_sla_mermas DEFAULT 0.50,
    penalizacion_por_dia_retraso_porc DECIMAL(4,2) NOT NULL CONSTRAINT DF_compras_sla_penal DEFAULT 1.00,
    vigencia_acuerdo_fin DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_sla_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_sla_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_slas PRIMARY KEY CLUSTERED (id_proveedor_sla),
    CONSTRAINT FK_compras_sla_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor));
GO

-- 105. TABLA: compras.proveedor_productos (Intermedia N:M Catálogo de Precios de Compra)
IF OBJECT_ID(N'compras.proveedor_productos', N'U') IS NOT NULL DROP TABLE compras.proveedor_productos;
CREATE TABLE compras.proveedor_productos (
    id_proveedor_producto BIGINT IDENTITY(1,1) NOT NULL,
    proveedor BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    codigo_articulo_proveedor NVARCHAR(50) NOT NULL,
    costo_negociado_unitario DECIMAL(12,2) NOT NULL CONSTRAINT CK_compras_pp_costo CHECK (costo_negociado_unitario > 0),
    lote_minimo_compra INT NOT NULL CONSTRAINT DF_compras_pp_lmin DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_pp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_pp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_proveedor_sku PRIMARY KEY CLUSTERED (id_proveedor_producto),
    CONSTRAINT UQ_compras_pp_prov_sku UNIQUE (proveedor, variante_sku),
    CONSTRAINT FK_compras_pp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_pp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 106. TABLA: compras.requisiciones (Transaccional Requisiciones Internas)
IF OBJECT_ID(N'compras.requisiciones', N'U') IS NOT NULL DROP TABLE compras.requisiciones;
CREATE TABLE compras.requisiciones (
    id_requisicion BIGINT IDENTITY(1,1) NOT NULL,
    folio_requisicion NVARCHAR(35) NOT NULL,
    departamento_solicitante NVARCHAR(80) NOT NULL, -- Ej: Almacén WMS Resurtido, Dermocosmética
    prioridad NVARCHAR(20) NOT NULL CONSTRAINT CK_compras_req_prio CHECK (prioridad IN (N'BAJA', N'MEDIA', N'URGENTE_DESABASTO')),
    motivo_solicitud NVARCHAR(300) NOT NULL,
    fecha_limite_requerida DATE NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_req_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_req_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_requisiciones PRIMARY KEY CLUSTERED (id_requisicion),
    CONSTRAINT UQ_compras_req_folio UNIQUE (folio_requisicion)
);
GO

-- 107. TABLA: compras.requisiciones_detalles (Transaccional)
IF OBJECT_ID(N'compras.requisiciones_detalles', N'U') IS NOT NULL DROP TABLE compras.requisiciones_detalles;
CREATE TABLE compras.requisiciones_detalles (
    id_requisicion_detalle BIGINT IDENTITY(1,1) NOT NULL,
    requisicion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_requerida INT NOT NULL CONSTRAINT CK_compras_rd_cant CHECK (cantidad_requerida >= 1),
    cantidad_aprobada INT NOT NULL CONSTRAINT DF_compras_rd_aprob DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_rd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_rd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_requisiciones_det PRIMARY KEY CLUSTERED (id_requisicion_detalle),
    CONSTRAINT UQ_compras_rd_req_sku UNIQUE (requisicion, variante_sku),
    CONSTRAINT FK_compras_rd_requisicion FOREIGN KEY (requisicion) REFERENCES compras.requisiciones(id_requisicion),
    CONSTRAINT FK_compras_rd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 108. TABLA: compras.ordenes_compra (Maestra Órdenes de Compra a Proveedores)
IF OBJECT_ID(N'compras.ordenes_compra', N'U') IS NOT NULL DROP TABLE compras.ordenes_compra;
CREATE TABLE compras.ordenes_compra (
    id_orden_compra BIGINT IDENTITY(1,1) NOT NULL,
    folio_orden_compra NVARCHAR(35) NOT NULL,
    proveedor BIGINT NOT NULL,
    estado_oc BIGINT NOT NULL,
    fecha_emision DATETIME2(3) NOT NULL CONSTRAINT DF_compras_oc_fe DEFAULT SYSDATETIME(),
    fecha_entrega_esperada DATE NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    total_iva DECIMAL(12,2) NOT NULL,
    total_orden_compra DECIMAL(12,2) NOT NULL,
    condiciones_pago NVARCHAR(150) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_oc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_oc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_ordenes_compra PRIMARY KEY CLUSTERED (id_orden_compra),
    CONSTRAINT UQ_compras_oc_folio UNIQUE (folio_orden_compra),
    CONSTRAINT FK_compras_oc_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor),
    CONSTRAINT FK_compras_oc_estado FOREIGN KEY (estado_oc) REFERENCES compras.estados_orden_compra(id_estado_oc));
GO

-- 109. TABLA: compras.ordenes_compra_detalles (Transaccional)
IF OBJECT_ID(N'compras.ordenes_compra_detalles', N'U') IS NOT NULL DROP TABLE compras.ordenes_compra_detalles;
CREATE TABLE compras.ordenes_compra_detalles (
    id_orden_compra_detalle BIGINT IDENTITY(1,1) NOT NULL,
    orden_compra BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_pedida INT NOT NULL CONSTRAINT CK_compras_ocd_cp CHECK (cantidad_pedida >= 1),
    cantidad_recibida INT NOT NULL CONSTRAINT DF_compras_ocd_cr DEFAULT 0,
    costo_unitario_compra DECIMAL(12,2) NOT NULL,
    importe_total_linea DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_ocd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_ocd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_oc_detalles PRIMARY KEY CLUSTERED (id_orden_compra_detalle),
    CONSTRAINT UQ_compras_ocd_oc_sku UNIQUE (orden_compra, variante_sku),
    CONSTRAINT FK_compras_ocd_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra),
    CONSTRAINT FK_compras_ocd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 110. TABLA: compras.recepciones_mercancia (Transaccional Muelle CEDIS)
IF OBJECT_ID(N'compras.recepciones_mercancia', N'U') IS NOT NULL DROP TABLE compras.recepciones_mercancia;
CREATE TABLE compras.recepciones_mercancia (
    id_recepcion BIGINT IDENTITY(1,1) NOT NULL,
    folio_recepcion NVARCHAR(35) NOT NULL,
    orden_compra BIGINT NOT NULL,
    numero_remision_proveedor NVARCHAR(60) NOT NULL,
    fecha_ingreso_muelle DATETIME2(3) NOT NULL CONSTRAINT DF_compras_rm_fim DEFAULT SYSDATETIME(),
    observaciones_chofer_transporte NVARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_rm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_rm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_recepciones PRIMARY KEY CLUSTERED (id_recepcion),
    CONSTRAINT UQ_compras_rm_folio UNIQUE (folio_recepcion),
    CONSTRAINT FK_compras_rm_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra));
GO

-- 111. TABLA: compras.recepciones_detalles (Transaccional)
IF OBJECT_ID(N'compras.recepciones_detalles', N'U') IS NOT NULL DROP TABLE compras.recepciones_detalles;
CREATE TABLE compras.recepciones_detalles (
    id_recepcion_detalle BIGINT IDENTITY(1,1) NOT NULL,
    recepcion BIGINT NOT NULL,
    variante_sku BIGINT NOT NULL,
    cantidad_recibida_bultos INT NOT NULL,
    cantidad_unidades_inspeccionadas INT NOT NULL,
    temperatura_llegada_celsius DECIMAL(4,1) NULL, -- Crítico para dermocosmética y sueros
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_recd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_recd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_recepciones_det PRIMARY KEY CLUSTERED (id_recepcion_detalle),
    CONSTRAINT FK_compras_recd_recepcion FOREIGN KEY (recepcion) REFERENCES compras.recepciones_mercancia(id_recepcion),
    CONSTRAINT FK_compras_recd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 112. TABLA: compras.inspecciones_sanitarias_qa (Transaccional Control de Calidad)
IF OBJECT_ID(N'compras.inspecciones_sanitarias_qa', N'U') IS NOT NULL DROP TABLE compras.inspecciones_sanitarias_qa;
CREATE TABLE compras.inspecciones_sanitarias_qa (
    id_inspeccion_qa BIGINT IDENTITY(1,1) NOT NULL,
    recepcion_detalle BIGINT NOT NULL,
    sellos_sanitarios_intactos BIT NOT NULL,
    empaque_sin_derrames BIT NOT NULL,
    codigo_lote_laboratorio NVARCHAR(50) NOT NULL,
    fecha_caducidad_impresa DATE NOT NULL,
    dictamen_qa NVARCHAR(20) NOT NULL CONSTRAINT CK_compras_qa_dict CHECK (dictamen_qa IN (N'APROBADO', N'RECHAZADO_DEVOLVER', N'RETENIDO_EN_CUARENTENA')),
    justificacion_sanitaria NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_compras_qa_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_compras_qa_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_compras_inspecciones_qa PRIMARY KEY CLUSTERED (id_inspeccion_qa),
    CONSTRAINT FK_compras_qa_recdetalle FOREIGN KEY (recepcion_detalle) REFERENCES compras.recepciones_detalles(id_recepcion_detalle));
GO

-- =================================================================================================
-- SECCIÓN 3.2: WMS, LOTES SANITARIOS, CADUCIDAD FEFO Y SENSORES (TABLAS 113 - 126)
-- =================================================================================================

-- 113. TABLA: wms.almacenes_cedis (Maestra Centros de Distribución)
IF OBJECT_ID(N'wms.almacenes_cedis', N'U') IS NOT NULL DROP TABLE wms.almacenes_cedis;
CREATE TABLE wms.almacenes_cedis (
    id_almacen BIGINT IDENTITY(1,1) NOT NULL,
    codigo_almacen NVARCHAR(20) NOT NULL,
    nombre_almacen NVARCHAR(100) NOT NULL, -- CEDIS Norte Monclova, CEDIS Centro CDMX
    calle_numero NVARCHAR(150) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    ciudad NVARCHAR(80) NOT NULL,
    capacidad_volumetrica_m3 DECIMAL(10,2) NOT NULL,
    cuenta_con_cadena_frio BIT NOT NULL CONSTRAINT DF_wms_cedis_frio DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_cedis_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_cedis_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_almacenes PRIMARY KEY CLUSTERED (id_almacen),
    CONSTRAINT UQ_wms_cedis_codigo UNIQUE (codigo_almacen)
);
GO

-- 114. TABLA: wms.zonas_almacen (Maestra Zonas Operativas)
IF OBJECT_ID(N'wms.zonas_almacen', N'U') IS NOT NULL DROP TABLE wms.zonas_almacen;
CREATE TABLE wms.zonas_almacen (
    id_zona_almacen BIGINT IDENTITY(1,1) NOT NULL,
    almacen BIGINT NOT NULL,
    codigo_zona NVARCHAR(20) NOT NULL, -- ZONA_REFRIGERADA, ZONA_COSMETICA_SECA, ZONA_ESMALTES_INFLAMABLE, ZONA_CUARENTENA
    descripcion NVARCHAR(150) NOT NULL,
    temperatura_min_celsius DECIMAL(4,1) NOT NULL,
    temperatura_max_celsius DECIMAL(4,1) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_za_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_za_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_zonas PRIMARY KEY CLUSTERED (id_zona_almacen),
    CONSTRAINT UQ_wms_za_almacen_zona UNIQUE (almacen, codigo_zona),
    CONSTRAINT FK_wms_za_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));
GO

-- 115. TABLA: wms.pasillos_ubicaciones (Maestra Racks y Bines)
IF OBJECT_ID(N'wms.pasillos_ubicaciones', N'U') IS NOT NULL DROP TABLE wms.pasillos_ubicaciones;
CREATE TABLE wms.pasillos_ubicaciones (
    id_ubicacion BIGINT IDENTITY(1,1) NOT NULL,
    zona_almacen BIGINT NOT NULL,
    codigo_ubicacion NVARCHAR(30) NOT NULL, -- P01-R04-N02-B01 (Pasillo-Rack-Nivel-Bin)
    peso_maximo_kg DECIMAL(8,2) NOT NULL,
    es_bloqueada_auditoria BIT NOT NULL CONSTRAINT DF_wms_pu_bloq DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_pu_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_pu_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_ubicaciones PRIMARY KEY CLUSTERED (id_ubicacion),
    CONSTRAINT UQ_wms_pu_codigo UNIQUE (codigo_ubicacion),
    CONSTRAINT FK_wms_pu_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));
GO

-- 116. TABLA: wms.tipos_movimiento_inventario (Catálogo 18)
IF OBJECT_ID(N'wms.tipos_movimiento_inventario', N'U') IS NOT NULL DROP TABLE wms.tipos_movimiento_inventario;
CREATE TABLE wms.tipos_movimiento_inventario (
    id_tipo_movimiento BIGINT IDENTITY(1,1) NOT NULL,
    codigo_movimiento NVARCHAR(20) NOT NULL,
    nombre_movimiento NVARCHAR(60) NOT NULL, -- ENTRADA_RECEPCION_OC, SALIDA_VENTA_ORDEN, AJUSTE_CONTEO_FISICO, MERMA_CADUCIDAD, TRASPASO_CEDIS
    signo_afectacion INT NOT NULL CONSTRAINT CK_wms_tmi_signo CHECK (signo_afectacion IN (1, -1)),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_tmi_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_tmi_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_tipos_movimiento PRIMARY KEY CLUSTERED (id_tipo_movimiento),
    CONSTRAINT UQ_wms_tmi_codigo UNIQUE (codigo_movimiento)
);
GO

-- 117. TABLA: wms.lotes_fabricacion_sanitaria (Maestra Lotes de Laboratorio - Control FEFO)
IF OBJECT_ID(N'wms.lotes_fabricacion_sanitaria', N'U') IS NOT NULL DROP TABLE wms.lotes_fabricacion_sanitaria;
CREATE TABLE wms.lotes_fabricacion_sanitaria (
    id_lote BIGINT IDENTITY(1,1) NOT NULL,
    variante_sku BIGINT NOT NULL,
    numero_lote_fabricante NVARCHAR(60) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    fecha_caducidad DATE NOT NULL, -- Clave para algoritmo FEFO (First Expired, First Out)
    certificado_calidad_lote_url NVARCHAR(300) NOT NULL,
    cuarentena_sanitaria BIT NOT NULL CONSTRAINT DF_wms_lfs_cuarentena DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_lfs_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_lfs_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_lotes PRIMARY KEY CLUSTERED (id_lote),
    CONSTRAINT UQ_wms_lfs_sku_lote UNIQUE (variante_sku, numero_lote_fabricante),
    CONSTRAINT FK_wms_lfs_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku));
GO

-- 118. TABLA: wms.inventario_lotes_ubicacion (Transaccional Stock Físico)
IF OBJECT_ID(N'wms.inventario_lotes_ubicacion', N'U') IS NOT NULL DROP TABLE wms.inventario_lotes_ubicacion;
CREATE TABLE wms.inventario_lotes_ubicacion (
    id_inventario_stock BIGINT IDENTITY(1,1) NOT NULL,
    lote BIGINT NOT NULL,
    ubicacion BIGINT NOT NULL,
    stock_disponible INT NOT NULL CONSTRAINT CK_wms_ilu_disp CHECK (stock_disponible >= 0),
    stock_apartado_pedidos INT NOT NULL CONSTRAINT DF_wms_ilu_apart DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_ilu_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_ilu_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_inventario_stock PRIMARY KEY CLUSTERED (id_inventario_stock),
    CONSTRAINT UQ_wms_ilu_lote_ubic UNIQUE (lote, ubicacion),
    CONSTRAINT FK_wms_ilu_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote),
    CONSTRAINT FK_wms_ilu_ubicacion FOREIGN KEY (ubicacion) REFERENCES wms.pasillos_ubicaciones(id_ubicacion));
GO

-- 119. TABLA: wms.kardex_movimientos (Bitácora Transaccional de Movimientos)
IF OBJECT_ID(N'wms.kardex_movimientos', N'U') IS NOT NULL DROP TABLE wms.kardex_movimientos;
CREATE TABLE wms.kardex_movimientos (
    id_kardex BIGINT IDENTITY(1,1) NOT NULL,
    inventario_stock BIGINT NOT NULL,
    tipo_movimiento BIGINT NOT NULL,
    cantidad_movimiento INT NOT NULL CONSTRAINT CK_wms_km_cant CHECK (cantidad_movimiento > 0),
    saldo_anterior INT NOT NULL,
    saldo_resultante INT NOT NULL,
    folio_documento_origen NVARCHAR(50) NOT NULL, -- Folio de OC, Orden Venta, o Acta Merma
    costo_unitario_movimiento DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_km_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_km_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_kardex PRIMARY KEY CLUSTERED (id_kardex),
    CONSTRAINT FK_wms_km_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock),
    CONSTRAINT FK_wms_km_tipo FOREIGN KEY (tipo_movimiento) REFERENCES wms.tipos_movimiento_inventario(id_tipo_movimiento));
GO

-- 120. TABLA: wms.alertas_caducidad_proxima (Transaccional Alertas FEFO Sanitarias)
IF OBJECT_ID(N'wms.alertas_caducidad_proxima', N'U') IS NOT NULL DROP TABLE wms.alertas_caducidad_proxima;
CREATE TABLE wms.alertas_caducidad_proxima (
    id_alerta_caducidad BIGINT IDENTITY(1,1) NOT NULL,
    lote BIGINT NOT NULL,
    dias_restantes_vida_util INT NOT NULL,
    nivel_urgencia NVARCHAR(20) NOT NULL CONSTRAINT CK_wms_acp_urg CHECK (nivel_urgencia IN (N'PREVENTIVA_90D', N'MODERADA_60D', N'CRITICA_30D', N'EXPIRADO')),
    accion_comercial_sugerida NVARCHAR(150) NOT NULL, -- Poner en venta flash con descuento o retirar
    atendida BIT NOT NULL CONSTRAINT DF_wms_acp_atendida DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_acp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_acp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_alertas_caducidad PRIMARY KEY CLUSTERED (id_alerta_caducidad),
    CONSTRAINT FK_wms_acp_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 121. TABLA: wms.mermas_destruccion_sanitaria (Transaccional Actas Sanitarias COFEPRIS)
IF OBJECT_ID(N'wms.mermas_destruccion_sanitaria', N'U') IS NOT NULL DROP TABLE wms.mermas_destruccion_sanitaria;
CREATE TABLE wms.mermas_destruccion_sanitaria (
    id_merma_destruccion BIGINT IDENTITY(1,1) NOT NULL,
    folio_acta_destruccion NVARCHAR(35) NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_unidades_destruidas INT NOT NULL CONSTRAINT CK_wms_mds_cant CHECK (cantidad_unidades_destruidas >= 1),
    motivo_sanitario NVARCHAR(200) NOT NULL, -- Caducado, Contaminación microbiana, Envase quebrado
    empresa_manifiesto_ecologico NVARCHAR(120) NOT NULL, -- Empresa de residuos biológico-químicos
    acta_circunstanciada_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_mds_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_mds_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_mermas_destruccion PRIMARY KEY CLUSTERED (id_merma_destruccion),
    CONSTRAINT UQ_wms_mds_folio UNIQUE (folio_acta_destruccion),
    CONSTRAINT FK_wms_mds_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 122. TABLA: wms.transferencias_almacenes (Transaccional)
IF OBJECT_ID(N'wms.transferencias_almacenes', N'U') IS NOT NULL DROP TABLE wms.transferencias_almacenes;
CREATE TABLE wms.transferencias_almacenes (
    id_transferencia BIGINT IDENTITY(1,1) NOT NULL,
    folio_transferencia NVARCHAR(35) NOT NULL,
    almacen_origen BIGINT NOT NULL,
    almacen_destino BIGINT NOT NULL,
    estado_transferencia NVARCHAR(20) NOT NULL CONSTRAINT CK_wms_ta_est CHECK (estado_transferencia IN (N'SOLICITADA', N'EN_TRANSITO', N'RECIBIDA_COMPLETA', N'DISCREPANCIA')),
    fecha_despacho DATETIME2(3) NULL,
    fecha_arribo DATETIME2(3) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_ta_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_ta_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_transferencias PRIMARY KEY CLUSTERED (id_transferencia),
    CONSTRAINT UQ_wms_ta_folio UNIQUE (folio_transferencia),
    CONSTRAINT FK_wms_ta_origen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen),
    CONSTRAINT FK_wms_ta_destino FOREIGN KEY (almacen_destino) REFERENCES wms.almacenes_cedis(id_almacen));
GO

-- 123. TABLA: wms.transferencias_detalles (Transaccional)
IF OBJECT_ID(N'wms.transferencias_detalles', N'U') IS NOT NULL DROP TABLE wms.transferencias_detalles;
CREATE TABLE wms.transferencias_detalles (
    id_transferencia_detalle BIGINT IDENTITY(1,1) NOT NULL,
    transferencia BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_enviada INT NOT NULL CONSTRAINT CK_wms_td_cant CHECK (cantidad_enviada >= 1),
    cantidad_recibida INT NOT NULL CONSTRAINT DF_wms_td_recib DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_td_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_td_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_transferencias_det PRIMARY KEY CLUSTERED (id_transferencia_detalle),
    CONSTRAINT FK_wms_td_transf FOREIGN KEY (transferencia) REFERENCES wms.transferencias_almacenes(id_transferencia),
    CONSTRAINT FK_wms_td_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 124. TABLA: wms.conteos_ciclicos_auditoria (Transaccional Auditoría FBD)
IF OBJECT_ID(N'wms.conteos_ciclicos_auditoria', N'U') IS NOT NULL DROP TABLE wms.conteos_ciclicos_auditoria;
CREATE TABLE wms.conteos_ciclicos_auditoria (
    id_conteo_ciclico BIGINT IDENTITY(1,1) NOT NULL,
    folio_auditoria NVARCHAR(35) NOT NULL,
    almacen BIGINT NOT NULL,
    fecha_conteo DATE NOT NULL,
    tipo_conteo NVARCHAR(20) NOT NULL CONSTRAINT CK_wms_cca_tipo CHECK (tipo_conteo IN (N'ALEATORIO', N'ALTO_VALOR_SKU', N'PROXIMO_A_CADUCAR')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_cca_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_cca_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_conteos_auditoria PRIMARY KEY CLUSTERED (id_conteo_ciclico),
    CONSTRAINT UQ_wms_cca_folio UNIQUE (folio_auditoria),
    CONSTRAINT FK_wms_cca_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen));
GO

-- 125. TABLA: wms.conteos_ciclicos_detalles (Transaccional)
IF OBJECT_ID(N'wms.conteos_ciclicos_detalles', N'U') IS NOT NULL DROP TABLE wms.conteos_ciclicos_detalles;
CREATE TABLE wms.conteos_ciclicos_detalles (
    id_conteo_detalle BIGINT IDENTITY(1,1) NOT NULL,
    conteo_ciclico BIGINT NOT NULL,
    inventario_stock BIGINT NOT NULL,
    stock_sistema_teorico INT NOT NULL,
    stock_conteo_fisico INT NOT NULL,
    diferencia_piezas INT NOT NULL,
    justificacion_ajuste NVARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_ccd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_ccd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_conteos_detalles PRIMARY KEY CLUSTERED (id_conteo_detalle),
    CONSTRAINT FK_wms_ccd_conteo FOREIGN KEY (conteo_ciclico) REFERENCES wms.conteos_ciclicos_auditoria(id_conteo_ciclico),
    CONSTRAINT FK_wms_ccd_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock));
GO

-- 126. TABLA: wms.monitoreo_temperatura_humedad (Transaccional IoT Dermocosmética)
IF OBJECT_ID(N'wms.monitoreo_temperatura_humedad', N'U') IS NOT NULL DROP TABLE wms.monitoreo_temperatura_humedad;
CREATE TABLE wms.monitoreo_temperatura_humedad (
    id_telemetria_sensor BIGINT IDENTITY(1,1) NOT NULL,
    zona_almacen BIGINT NOT NULL,
    codigo_sensor_iot NVARCHAR(30) NOT NULL,
    temperatura_registrada_celsius DECIMAL(4,1) NOT NULL,
    humedad_relativa_porcentaje DECIMAL(4,1) NOT NULL,
    alerta_fuera_de_rango BIT NOT NULL CONSTRAINT DF_wms_mth_alerta DEFAULT 0,
    fecha_hora_lectura DATETIME2(3) NOT NULL CONSTRAINT DF_wms_mth_fhl DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_wms_mth_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_wms_mth_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_wms_monitoreo_iot PRIMARY KEY CLUSTERED (id_telemetria_sensor),
    CONSTRAINT FK_wms_mth_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen));
GO

-- =================================================================================================
-- SECCIÓN 3.3: LOGÍSTICA, ENVÍOS, ÚLTIMA MILLA Y PAQUETERÍAS (TABLAS 127 - 138)
-- =================================================================================================

-- 127. TABLA: envios.transportistas_paqueterias (Catálogo 19)
IF OBJECT_ID(N'envios.transportistas_paqueterias', N'U') IS NOT NULL DROP TABLE envios.transportistas_paqueterias;
CREATE TABLE envios.transportistas_paqueterias (
    id_transportista BIGINT IDENTITY(1,1) NOT NULL,
    codigo_transportista NVARCHAR(20) NOT NULL,
    nombre_comercial NVARCHAR(60) NOT NULL, -- DHL_EXPRESS, FEDEX, ESTAFETA, REDPACK, REPARTO_LOCAL_PROPIO
    api_endpoint_tracking NVARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_tp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_tp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_transportistas PRIMARY KEY CLUSTERED (id_transportista),
    CONSTRAINT UQ_envios_tp_codigo UNIQUE (codigo_transportista)
);
GO

-- 128. TABLA: envios.tipos_servicio_envio (Catálogo 20)
IF OBJECT_ID(N'envios.tipos_servicio_envio', N'U') IS NOT NULL DROP TABLE envios.tipos_servicio_envio;
CREATE TABLE envios.tipos_servicio_envio (
    id_servicio_envio BIGINT IDENTITY(1,1) NOT NULL,
    codigo_servicio NVARCHAR(20) NOT NULL,
    nombre_servicio NVARCHAR(60) NOT NULL, -- DIA_SIGUIENTE, ESTANDAR_TERRESTRE_3_5_DIAS, MISMO_DIA_EXPRESS
    tiempo_garantizado_horas INT NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_tse_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_tse_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_tipos_servicio PRIMARY KEY CLUSTERED (id_servicio_envio),
    CONSTRAINT UQ_envios_tse_codigo UNIQUE (codigo_servicio)
);
GO

-- 129. TABLA: envios.tarifas_zonas_postales (Transaccional Matriz Tarifaria)
IF OBJECT_ID(N'envios.tarifas_zonas_postales', N'U') IS NOT NULL DROP TABLE envios.tarifas_zonas_postales;
CREATE TABLE envios.tarifas_zonas_postales (
    id_tarifa_zona BIGINT IDENTITY(1,1) NOT NULL,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    codigo_postal_origen_prefijo VARCHAR(3) NOT NULL,
    codigo_postal_destino_prefijo VARCHAR(3) NOT NULL,
    peso_limite_kg DECIMAL(6,2) NOT NULL,
    costo_base_envio DECIMAL(12,2) NOT NULL,
    costo_kg_adicional DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_tzp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_tzp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_tarifas PRIMARY KEY CLUSTERED (id_tarifa_zona),
    CONSTRAINT FK_envios_tzp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_tzp_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));
GO

-- 130. TABLA: envios.despachos_orden (Maestra Transaccional de Envíos)
IF OBJECT_ID(N'envios.despachos_orden', N'U') IS NOT NULL DROP TABLE envios.despachos_orden;
CREATE TABLE envios.despachos_orden (
    id_despacho BIGINT IDENTITY(1,1) NOT NULL,
    folio_despacho NVARCHAR(35) NOT NULL,
    orden_split BIGINT NOT NULL,
    transportista BIGINT NOT NULL,
    servicio_envio BIGINT NOT NULL,
    fecha_recoleccion_paqueteria DATETIME2(3) NULL,
    fecha_promesa_entrega DATE NOT NULL,
    fecha_entrega_real DATETIME2(3) NULL,
    estado_envio NVARCHAR(25) NOT NULL CONSTRAINT CK_envios_do_est CHECK (estado_envio IN (N'PREPARANDO_PAQUETE', N'RECOLECTADO', N'EN_TRANSITO', N'EN_RUTA_LOCAL', N'ENTREGADO', N'INCIDENCIA')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_do_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_do_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_despachos PRIMARY KEY CLUSTERED (id_despacho),
    CONSTRAINT UQ_envios_do_folio UNIQUE (folio_despacho),
    CONSTRAINT FK_envios_do_split FOREIGN KEY (orden_split) REFERENCES ventas.ordenes_splits_almacen(id_orden_split),
    CONSTRAINT FK_envios_do_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_do_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio));
GO

-- 131. TABLA: envios.paquetes_bultos (Transaccional)
IF OBJECT_ID(N'envios.paquetes_bultos', N'U') IS NOT NULL DROP TABLE envios.paquetes_bultos;
CREATE TABLE envios.paquetes_bultos (
    id_paquete_bulto BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    codigo_bulto NVARCHAR(40) NOT NULL,
    peso_bruto_kg DECIMAL(6,2) NOT NULL,
    alto_cm DECIMAL(5,1) NOT NULL,
    ancho_cm DECIMAL(5,1) NOT NULL,
    largo_cm DECIMAL(5,1) NOT NULL,
    peso_volumetrico_kg AS (alto_cm * ancho_cm * largo_cm / 5000.0) PERSISTED,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_pb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_pb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_paquetes PRIMARY KEY CLUSTERED (id_paquete_bulto),
    CONSTRAINT UQ_envios_pb_codigo UNIQUE (codigo_bulto),
    CONSTRAINT FK_envios_pb_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 132. TABLA: envios.paquetes_contenido_lotes (Transaccional Trazabilidad Sanitaria en Envío)
IF OBJECT_ID(N'envios.paquetes_contenido_lotes', N'U') IS NOT NULL DROP TABLE envios.paquetes_contenido_lotes;
CREATE TABLE envios.paquetes_contenido_lotes (
    id_contenido_paquete BIGINT IDENTITY(1,1) NOT NULL,
    paquete_bulto BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    cantidad_piezas_en_paquete INT NOT NULL CONSTRAINT CK_envios_pcl_cant CHECK (cantidad_piezas_en_paquete >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_pcl_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_pcl_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_contenido_lotes PRIMARY KEY CLUSTERED (id_contenido_paquete),
    CONSTRAINT FK_envios_pcl_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto),
    CONSTRAINT FK_envios_pcl_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle),
    CONSTRAINT FK_envios_pcl_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 133. TABLA: envios.guias_rastreo (Transaccional Guías de Paquetería)
IF OBJECT_ID(N'envios.guias_rastreo', N'U') IS NOT NULL DROP TABLE envios.guias_rastreo;
CREATE TABLE envios.guias_rastreo (
    id_guia_rastreo BIGINT IDENTITY(1,1) NOT NULL,
    paquete_bulto BIGINT NOT NULL,
    numero_guia_tracking NVARCHAR(80) NOT NULL,
    url_rastreo_directo NVARCHAR(300) NOT NULL,
    etiqueta_pdf_base64_url NVARCHAR(300) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_gr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_gr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_guias PRIMARY KEY CLUSTERED (id_guia_rastreo),
    CONSTRAINT UQ_envios_gr_guia UNIQUE (numero_guia_tracking),
    CONSTRAINT FK_envios_gr_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto));
GO

-- 134. TABLA: envios.eventos_tracking_bitacora (Bitácora de Webhooks)
IF OBJECT_ID(N'envios.eventos_tracking_bitacora', N'U') IS NOT NULL DROP TABLE envios.eventos_tracking_bitacora;
CREATE TABLE envios.eventos_tracking_bitacora (
    id_evento_tracking BIGINT IDENTITY(1,1) NOT NULL,
    guia_rastreo BIGINT NOT NULL,
    codigo_estatus_paqueteria NVARCHAR(40) NOT NULL,
    descripcion_evento NVARCHAR(250) NOT NULL,
    ubicacion_ciudad_evento NVARCHAR(100) NOT NULL,
    fecha_hora_evento DATETIME2(3) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_etb_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_etb_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_eventos_tracking PRIMARY KEY CLUSTERED (id_evento_tracking),
    CONSTRAINT FK_envios_etb_guia FOREIGN KEY (guia_rastreo) REFERENCES envios.guias_rastreo(id_guia_rastreo));
GO

-- 135. TABLA: envios.intentos_entrega_fallidos (Transaccional)
IF OBJECT_ID(N'envios.intentos_entrega_fallidos', N'U') IS NOT NULL DROP TABLE envios.intentos_entrega_fallidos;
CREATE TABLE envios.intentos_entrega_fallidos (
    id_intento_fallido BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    numero_visita INT NOT NULL CONSTRAINT CK_envios_ief_visita CHECK (numero_visita BETWEEN 1 AND 3),
    motivo_no_entrega NVARCHAR(150) NOT NULL, -- Domicilio cerrado, Destinatario ausente
    fecha_intento DATETIME2(3) NOT NULL CONSTRAINT DF_envios_ief_fi DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_ief_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_ief_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_intentos_fallidos PRIMARY KEY CLUSTERED (id_intento_fallido),
    CONSTRAINT FK_envios_ief_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 136. TABLA: envios.incidencias_logisticas (Transaccional Siniestros)
IF OBJECT_ID(N'envios.incidencias_logisticas', N'U') IS NOT NULL DROP TABLE envios.incidencias_logisticas;
CREATE TABLE envios.incidencias_logisticas (
    id_incidencia_logistica BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    tipo_incidencia NVARCHAR(30) NOT NULL CONSTRAINT CK_envios_il_tipo CHECK (tipo_incidencia IN (N'EXTRAVIO_TOTAL', N'PAQUETE_DANADO_DERRAME', N'ROBO_EN_TRANSITO', N'DIRECCION_INEXISTENTE')),
    descripcion_hechos NVARCHAR(500) NOT NULL,
    indemnizacion_reclamada DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_il_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_il_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_incidencias PRIMARY KEY CLUSTERED (id_incidencia_logistica),
    CONSTRAINT FK_envios_il_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 137. TABLA: envios.seguros_mercancia (Transaccional Pólizas de Carga)
IF OBJECT_ID(N'envios.seguros_mercancia', N'U') IS NOT NULL DROP TABLE envios.seguros_mercancia;
CREATE TABLE envios.seguros_mercancia (
    id_seguro_envio BIGINT IDENTITY(1,1) NOT NULL,
    despacho BIGINT NOT NULL,
    aseguradora NVARCHAR(100) NOT NULL,
    numero_poliza NVARCHAR(60) NOT NULL,
    valor_asegurado DECIMAL(12,2) NOT NULL,
    costo_prima DECIMAL(12,2) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_sm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_sm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_seguros PRIMARY KEY CLUSTERED (id_seguro_envio),
    CONSTRAINT UQ_envios_sm_despacho UNIQUE (despacho),
    CONSTRAINT FK_envios_sm_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho));
GO

-- 138. TABLA: envios.puntos_recoleccion_pickup (Maestra Lockers y Puntos de Entrega)
IF OBJECT_ID(N'envios.puntos_recoleccion_pickup', N'U') IS NOT NULL DROP TABLE envios.puntos_recoleccion_pickup;
CREATE TABLE envios.puntos_recoleccion_pickup (
    id_punto_pickup BIGINT IDENTITY(1,1) NOT NULL,
    transportista BIGINT NOT NULL,
    almacen_origen BIGINT NOT NULL,
    codigo_locker NVARCHAR(30) NOT NULL,
    nombre_establecimiento NVARCHAR(100) NOT NULL,
    direccion_completa NVARCHAR(200) NOT NULL,
    horario_atencion NVARCHAR(100) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_envios_prp_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_envios_prp_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_envios_pickup PRIMARY KEY CLUSTERED (id_punto_pickup),
    CONSTRAINT UQ_envios_prp_codigo UNIQUE (codigo_locker),
    CONSTRAINT FK_envios_prp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista),
    CONSTRAINT FK_envios_prp_almacen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen)
);
GO

-- =================================================================================================
-- SECCIÓN 3.4: POSTVENTA, RMA, FARMACOVIGILANCIA Y AUDITORÍA FORENSE (TABLAS 139 - 150)
-- =================================================================================================

-- 139. TABLA: postventa.motivos_devolucion_rma (Catálogo 21)
IF OBJECT_ID(N'postventa.motivos_devolucion_rma', N'U') IS NOT NULL DROP TABLE postventa.motivos_devolucion_rma;
CREATE TABLE postventa.motivos_devolucion_rma (
    id_motivo_rma BIGINT IDENTITY(1,1) NOT NULL,
    codigo_motivo NVARCHAR(20) NOT NULL,
    descripcion_motivo NVARCHAR(150) NOT NULL, -- REACCION_ALERGICA_CUTANEA, TONO_INCORRECTO, PRODUCTO_CADUCADO, SELLO_ROTO, NO_SATISFECHO
    requiere_dictamen_medico BIT NOT NULL CONSTRAINT DF_postventa_mr_medico DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_mr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_mr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_motivos_rma PRIMARY KEY CLUSTERED (id_motivo_rma),
    CONSTRAINT UQ_postventa_mr_codigo UNIQUE (codigo_motivo)
);
GO

-- 140. TABLA: postventa.solicitudes_rma (Maestra Devoluciones Sanitarias)
IF OBJECT_ID(N'postventa.solicitudes_rma', N'U') IS NOT NULL DROP TABLE postventa.solicitudes_rma;
CREATE TABLE postventa.solicitudes_rma (
    id_solicitud_rma BIGINT IDENTITY(1,1) NOT NULL,
    folio_rma NVARCHAR(35) NOT NULL,
    orden BIGINT NOT NULL,
    motivo_rma BIGINT NOT NULL,
    estado_rma NVARCHAR(20) NOT NULL CONSTRAINT CK_postventa_srma_est CHECK (estado_rma IN (N'SOLICITADA', N'GUIA_RETORNO_EMITIDA', N'RECIBIDA_EN_QA', N'APROBADA_REEMBOLSAR', N'RECHAZADA_POR_HIGIENE')),
    fotografia_evidencia_url NVARCHAR(300) NOT NULL,
    descripcion_caso_cliente NVARCHAR(500) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_srma_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_srma_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_solicitudes_rma PRIMARY KEY CLUSTERED (id_solicitud_rma),
    CONSTRAINT UQ_postventa_srma_folio UNIQUE (folio_rma),
    CONSTRAINT FK_postventa_srma_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden),
    CONSTRAINT FK_postventa_srma_motivo FOREIGN KEY (motivo_rma) REFERENCES postventa.motivos_devolucion_rma(id_motivo_rma));
GO

-- 141. TABLA: postventa.rma_detalles (Transaccional)
IF OBJECT_ID(N'postventa.rma_detalles', N'U') IS NOT NULL DROP TABLE postventa.rma_detalles;
CREATE TABLE postventa.rma_detalles (
    id_rma_detalle BIGINT IDENTITY(1,1) NOT NULL,
    solicitud_rma BIGINT NOT NULL,
    orden_detalle BIGINT NOT NULL,
    cantidad_devuelta INT NOT NULL CONSTRAINT CK_postventa_rd_cant CHECK (cantidad_devuelta >= 1),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_rd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_rd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_rma_detalles PRIMARY KEY CLUSTERED (id_rma_detalle),
    CONSTRAINT FK_postventa_rd_rma FOREIGN KEY (solicitud_rma) REFERENCES postventa.solicitudes_rma(id_solicitud_rma),
    CONSTRAINT FK_postventa_rd_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle));
GO

-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (Transaccional Higiene y Destino)
IF OBJECT_ID(N'postventa.inspeccion_sanitaria_retorno', N'U') IS NOT NULL DROP TABLE postventa.inspeccion_sanitaria_retorno;
CREATE TABLE postventa.inspeccion_sanitaria_retorno (
    id_inspeccion_retorno BIGINT IDENTITY(1,1) NOT NULL,
    rma_detalle BIGINT NOT NULL,
    sello_seguridad_fue_abierto BIT NOT NULL,
    contenido_usado_porcentaje DECIMAL(4,1) NOT NULL,
    destino_sanitario_autorizado NVARCHAR(30) NOT NULL CONSTRAINT CK_postventa_isr_dest CHECK (destino_sanitario_autorizado IN (N'DESTRUCCION_INMEDIATA_RESIDUOS', N'DONACION_REACONDICIONADA', N'REINGRESO_STOCK_SELLADO')),
    dictamen_auditor NVARCHAR(250) NOT NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_isr_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_isr_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_inspeccion_retorno PRIMARY KEY CLUSTERED (id_inspeccion_retorno),
    CONSTRAINT UQ_postventa_isr_rmadetalle UNIQUE (rma_detalle),
    CONSTRAINT FK_postventa_isr_rmadetalle FOREIGN KEY (rma_detalle) REFERENCES postventa.rma_detalles(id_rma_detalle));
GO

-- 143. TABLA: postventa.tickets_soporte (Maestra Atención al Cliente)
IF OBJECT_ID(N'postventa.tickets_soporte', N'U') IS NOT NULL DROP TABLE postventa.tickets_soporte;
CREATE TABLE postventa.tickets_soporte (
    id_ticket BIGINT IDENTITY(1,1) NOT NULL,
    folio_ticket NVARCHAR(35) NOT NULL,
    cliente BIGINT NOT NULL,
    asunto NVARCHAR(120) NOT NULL,
    categoria_ticket NVARCHAR(30) NOT NULL CONSTRAINT CK_postventa_ts_cat CHECK (categoria_ticket IN (N'ENVIO_DEMORADO', N'ASESORIA_DERMATOLOGICA', N'FACTURACION_CFDI', N'PRODUCTO_DEFECTUOSO')),
    prioridad NVARCHAR(20) NOT NULL CONSTRAINT CK_postventa_ts_prio CHECK (prioridad IN (N'BAJA', N'MEDIA', N'ALTA', N'URGENTE')),
    estado_ticket NVARCHAR(20) NOT NULL CONSTRAINT CK_postventa_ts_est CHECK (estado_ticket IN (N'ABIERTO', N'EN_PROCESO', N'ESPERANDO_CLIENTE', N'RESUELTO', N'CERRADO')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_ts_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_ts_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_tickets PRIMARY KEY CLUSTERED (id_ticket),
    CONSTRAINT UQ_postventa_ts_folio UNIQUE (folio_ticket),
    CONSTRAINT FK_postventa_ts_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente));
GO

-- 144. TABLA: postventa.tickets_mensajes (Transaccional)
IF OBJECT_ID(N'postventa.tickets_mensajes', N'U') IS NOT NULL DROP TABLE postventa.tickets_mensajes;
CREATE TABLE postventa.tickets_mensajes (
    id_ticket_mensaje BIGINT IDENTITY(1,1) NOT NULL,
    ticket BIGINT NOT NULL,
    usuario_emisor BIGINT NOT NULL,
    mensaje_cuerpo NVARCHAR(MAX) NOT NULL,
    adjunto_url NVARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_tm_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_tm_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_tickets_mensajes PRIMARY KEY CLUSTERED (id_ticket_mensaje),
    CONSTRAINT FK_postventa_tm_ticket FOREIGN KEY (ticket) REFERENCES postventa.tickets_soporte(id_ticket),
    CONSTRAINT FK_postventa_tm_usuario FOREIGN KEY (usuario_emisor) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 145. TABLA: postventa.reportes_farmacovigilancia (Transaccional Regulatoria COFEPRIS)
IF OBJECT_ID(N'postventa.reportes_farmacovigilancia', N'U') IS NOT NULL DROP TABLE postventa.reportes_farmacovigilancia;
CREATE TABLE postventa.reportes_farmacovigilancia (
    id_reporte_farmacovigilancia BIGINT IDENTITY(1,1) NOT NULL,
    folio_cofepris_ram NVARCHAR(45) NOT NULL, -- Reporte de Reacciones Adversas a Medicamentos / Cosméticos
    cliente BIGINT NOT NULL,
    producto BIGINT NOT NULL,
    lote BIGINT NOT NULL,
    sintomas_reaccion_adversa NVARCHAR(MAX) NOT NULL,
    requirio_atencion_hospitalaria BIT NOT NULL,
    fecha_aparicion_sintomas DATE NOT NULL,
    notificado_a_autoridad_sanitaria BIT NOT NULL CONSTRAINT DF_postventa_rf_notif DEFAULT 0,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_postventa_rf_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_postventa_rf_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_postventa_farmacovigilancia PRIMARY KEY CLUSTERED (id_reporte_farmacovigilancia),
    CONSTRAINT UQ_postventa_rf_folio UNIQUE (folio_cofepris_ram),
    CONSTRAINT FK_postventa_rf_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente),
    CONSTRAINT FK_postventa_rf_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto),
    CONSTRAINT FK_postventa_rf_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote));
GO

-- 146. TABLA: auditoria.tipos_evento_sistema (Catálogo 22)
IF OBJECT_ID(N'auditoria.tipos_evento_sistema', N'U') IS NOT NULL DROP TABLE auditoria.tipos_evento_sistema;
CREATE TABLE auditoria.tipos_evento_sistema (
    id_tipo_evento BIGINT IDENTITY(1,1) NOT NULL,
    codigo_evento NVARCHAR(30) NOT NULL,
    nombre_evento NVARCHAR(80) NOT NULL, -- LOGIN_EXITOSO, INTENTO_ACCESO_DENEGADO, MODIFICACION_PRECIOS, BAJA_LOGICA_REGISTRO, EXPORTACION_DATOS_CLIENTES
    nivel_severidad NVARCHAR(20) NOT NULL CONSTRAINT CK_auditoria_tes_sev CHECK (nivel_severidad IN (N'INFO', N'ADVERTENCIA', N'CRITICO_SEGURIDAD')),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_auditoria_tes_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_tes_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_auditoria_tipos_evento PRIMARY KEY CLUSTERED (id_tipo_evento),
    CONSTRAINT UQ_auditoria_tes_codigo UNIQUE (codigo_evento)
);
GO

-- 147. TABLA: auditoria.bitacora_seguridad_global (Bitácora Forense Penal Art. 211 bis)
IF OBJECT_ID(N'auditoria.bitacora_seguridad_global', N'U') IS NOT NULL DROP TABLE auditoria.bitacora_seguridad_global;
CREATE TABLE auditoria.bitacora_seguridad_global (
    id_log_seguridad BIGINT IDENTITY(1,1) NOT NULL,
    tipo_evento BIGINT NOT NULL,
    usuario BIGINT NULL,
    direccion_ip NVARCHAR(45) NOT NULL,
    user_agent NVARCHAR(350) NOT NULL,
    modulo_origen NVARCHAR(60) NOT NULL,
    descripcion_evento NVARCHAR(500) NOT NULL,
    firma_integridad_hash NVARCHAR(128) NOT NULL, -- Hash SHA-256 de los datos de la fila para evitar manipulación de logs periciales
    fecha_evento DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_bsg_fev DEFAULT SYSDATETIME(),
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_auditoria_bsg_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_bsg_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_auditoria_seguridad PRIMARY KEY CLUSTERED (id_log_seguridad),
    CONSTRAINT FK_auditoria_bsg_tipo FOREIGN KEY (tipo_evento) REFERENCES auditoria.tipos_evento_sistema(id_tipo_evento),
    CONSTRAINT FK_auditoria_bsg_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario));
GO

-- 148. TABLA: auditoria.bitacora_cambios_datos (Bitácora DML Trazabilidad Total)
IF OBJECT_ID(N'auditoria.bitacora_cambios_datos', N'U') IS NOT NULL DROP TABLE auditoria.bitacora_cambios_datos;
CREATE TABLE auditoria.bitacora_cambios_datos (
    id_cambio_dato BIGINT IDENTITY(1,1) NOT NULL,
    nombre_tabla NVARCHAR(100) NOT NULL,
    id_registro_afectado BIGINT NOT NULL,
    tipo_operacion NVARCHAR(15) NOT NULL CONSTRAINT CK_auditoria_bcd_tipo CHECK (tipo_operacion IN (N'INSERT', N'UPDATE', N'SOFT_DELETE')),
    valores_anteriores_json NVARCHAR(MAX) NULL,
    valores_nuevos_json NVARCHAR(MAX) NOT NULL,
    motivo_cambio NVARCHAR(250) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_auditoria_bcd_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_auditoria_bcd_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_auditoria_cambios PRIMARY KEY CLUSTERED (id_cambio_dato),
    CONSTRAINT FK_auditoria_bcd_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);
GO

-- 149. TABLA: sistema.parametros_configuracion (Maestra Parámetros del Sistema)
IF OBJECT_ID(N'sistema.parametros_configuracion', N'U') IS NOT NULL DROP TABLE sistema.parametros_configuracion;
CREATE TABLE sistema.parametros_configuracion (
    id_parametro BIGINT IDENTITY(1,1) NOT NULL,
    clave_parametro NVARCHAR(60) NOT NULL,
    valor_parametro NVARCHAR(500) NOT NULL,
    tipo_dato NVARCHAR(20) NOT NULL CONSTRAINT CK_sistema_pc_tipo CHECK (tipo_dato IN (N'STRING', N'INTEGER', N'DECIMAL', N'BOOLEAN', N'JSON')),
    descripcion NVARCHAR(250) NOT NULL,
    es_modificable_en_caliente BIT NOT NULL CONSTRAINT DF_sistema_pc_mc DEFAULT 1,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_sistema_pc_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_sistema_pc_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_sistema_parametros PRIMARY KEY CLUSTERED (id_parametro),
    CONSTRAINT UQ_sistema_pc_clave UNIQUE (clave_parametro),
    CONSTRAINT FK_sistema_pc_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)
);
GO

-- 150. TABLA: sistema.notificaciones_push_email (Transaccional Cola de Mensajes)
IF OBJECT_ID(N'sistema.notificaciones_push_email', N'U') IS NOT NULL DROP TABLE sistema.notificaciones_push_email;
CREATE TABLE sistema.notificaciones_push_email (
    id_notificacion BIGINT IDENTITY(1,1) NOT NULL,
    usuario_destinatario BIGINT NOT NULL,
    tipo_canal NVARCHAR(20) NOT NULL CONSTRAINT CK_sistema_npe_canal CHECK (tipo_canal IN (N'EMAIL', N'PUSH_APP', N'SMS', N'WHATSAPP')),
    titulo_asunto NVARCHAR(150) NOT NULL,
    cuerpo_mensaje NVARCHAR(MAX) NOT NULL,
    enviada BIT NOT NULL CONSTRAINT DF_sistema_npe_env DEFAULT 0,
    fecha_envio DATETIME2(3) NULL,
    error_envio NVARCHAR(300) NULL,
    -- Columnas estándar de Auditoría y Soft Delete
    activo BIT NOT NULL CONSTRAINT DF_sistema_npe_activo DEFAULT 1,
    fecha_creacion DATETIME2(3) NOT NULL CONSTRAINT DF_sistema_npe_fc DEFAULT SYSDATETIME(),
    creado_por BIGINT NOT NULL,
    fecha_modificacion DATETIME2(3) NULL,
    modificado_por BIGINT NULL,
    fecha_baja DATETIME2(3) NULL,
    eliminado_por BIGINT NULL,
    CONSTRAINT PK_sistema_notificaciones PRIMARY KEY CLUSTERED (id_notificacion),
    CONSTRAINT FK_sistema_npe_usuario FOREIGN KEY (usuario_destinatario) REFERENCES seguridad.usuarios(id_usuario));
GO

PRINT '====================================================================================';
PRINT 'ÉXITO TOTAL: Se completó la creación de las 150 TABLAS del Proyecto Integrador';
PRINT '50 Tablas por integrante (Integrante 1, 2 y 3).';
PRINT 'Todas cuentan con ID autoincrementable y las 7 columnas de auditoría / soft delete.';
PRINT 'Cumplimiento estricto: Cero tablas huérfanas y catálogos por debajo del 25%.';
PRINT '====================================================================================';
GO

-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 1 (RENDIMIENTO EN AUTENTICACIÓN, CLIENTES Y CATÁLOGO)
-- =================================================================================================
CREATE NONCLUSTERED INDEX IX_seguridad_usuarios_activo_email ON seguridad.usuarios (activo, email);
CREATE NONCLUSTERED INDEX IX_seguridad_usuarios_roles_ur ON seguridad.usuarios_roles (usuario, rol);
CREATE NONCLUSTERED INDEX IX_seguridad_sesiones_usuario_rev ON seguridad.sesiones_activas (usuario, revocada, fecha_expiracion);
CREATE NONCLUSTERED INDEX IX_seguridad_intentos_login_ip ON seguridad.intentos_login (direccion_ip, fecha_creacion);
CREATE NONCLUSTERED INDEX IX_clientes_clientes_usuario_act ON clientes.clientes (usuario, activo);
CREATE NONCLUSTERED INDEX IX_clientes_condiciones_cli ON clientes.cliente_condiciones (cliente, condicion_dermatologica);
CREATE NONCLUSTERED INDEX IX_catalogo_productos_marca_sub ON catalogo.productos_maestros (marca, subcategoria, laboratorio);
CREATE NONCLUSTERED INDEX IX_catalogo_variantes_prod_act ON catalogo.variantes_sku (producto, activo);
CREATE NONCLUSTERED INDEX IX_catalogo_formula_prod_ing ON catalogo.formula_ingredientes (producto, ingrediente);
CREATE NONCLUSTERED INDEX IX_catalogo_alergenos_ing_riesgo ON catalogo.alergenos_ingrediente (ingrediente, clasificacion_riesgo);
GO
-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 2 (VENTAS, SUSCRIPCIONES, PAGOS, CFDI Y PROMOCIONES)
-- =================================================================================================
CREATE NONCLUSTERED INDEX IX_ventas_ordenes_cliente_fecha ON ventas.ordenes (cliente, fecha_orden);
CREATE NONCLUSTERED INDEX IX_ventas_ordenes_estado_activo ON ventas.ordenes (estado_orden, activo);
CREATE NONCLUSTERED INDEX IX_ventas_ordenes_det_orden_sku ON ventas.ordenes_detalles (orden, variante_sku);
CREATE NONCLUSTERED INDEX IX_ventas_suscrip_cliente_est ON ventas.suscripciones_cliente (cliente, estado_suscripcion);
CREATE NONCLUSTERED INDEX IX_ventas_suscrip_cal_susc_est ON ventas.suscripciones_calendario_entregas (suscripcion_cliente, estado_despacho);
CREATE NONCLUSTERED INDEX IX_pagos_tx_orden_estado ON pagos.transacciones (orden, estado_pago);
CREATE NONCLUSTERED INDEX IX_pagos_antifraude_orden_riesgo ON pagos.evaluaciones_antifraude (orden, nivel_riesgo, score_riesgo_total);
CREATE NONCLUSTERED INDEX IX_fiscal_facturas_orden_estado ON fiscal.facturas_cfdi (orden, estado_cfdi);
CREATE NONCLUSTERED INDEX IX_promos_cupones_camp_activo ON promos.cupones (campania, activo);
CREATE NONCLUSTERED INDEX IX_promos_redenciones_cup_ord ON promos.redenciones_cupones (cupon, orden);
GO
-- =================================================================================================
-- ÍNDICES SECUNDARIOS ESTRATÉGICOS - SUBMÓDULO 3 (COMPRAS, WMS FEFO, IOT FRÍO, ENVÍOS Y AUDITORÍA)
-- =================================================================================================
CREATE NONCLUSTERED INDEX IX_compras_oc_prov_fecha ON compras.ordenes_compra (proveedor, fecha_emision);
CREATE NONCLUSTERED INDEX IX_compras_recep_oc_fecha ON compras.recepciones_mercancia (orden_compra, fecha_ingreso_muelle);
CREATE NONCLUSTERED INDEX IX_compras_qa_detalle_dictamen ON compras.inspecciones_sanitarias_qa (recepcion_detalle, dictamen_qa);
CREATE NONCLUSTERED INDEX IX_wms_lotes_sku_caducidad ON wms.lotes_fabricacion_sanitaria (variante_sku, fecha_caducidad);
CREATE NONCLUSTERED INDEX IX_wms_inv_lote_ubicacion ON wms.inventario_lotes_ubicacion (lote, ubicacion);
CREATE NONCLUSTERED INDEX IX_wms_alertas_lote_atendida ON wms.alertas_caducidad_proxima (lote, atendida, dias_restantes_vida_util);
CREATE NONCLUSTERED INDEX IX_wms_telemetria_zona_fecha ON wms.monitoreo_temperatura_humedad (zona_almacen, alerta_fuera_de_rango, fecha_hora_lectura);
CREATE NONCLUSTERED INDEX IX_envios_despachos_split_est ON envios.despachos_orden (orden_split, estado_envio);
CREATE NONCLUSTERED INDEX IX_postventa_rma_orden_motivo ON postventa.solicitudes_rma (orden, motivo_rma, estado_rma);
CREATE NONCLUSTERED INDEX IX_auditoria_cambios_tipo_fecha ON auditoria.bitacora_cambios_datos (tipo_operacion, fecha_creacion);
GO
