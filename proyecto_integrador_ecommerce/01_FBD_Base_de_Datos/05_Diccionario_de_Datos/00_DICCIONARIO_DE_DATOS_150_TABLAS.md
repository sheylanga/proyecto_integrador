# DICCIONARIO DE DATOS TÉCNICO Y LEGAL NORMALIZADO (150 TABLAS)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD — AEF-1031) — CRITERIO 2.3 (15%) · CRUCE LFPDPPP (TLI 4.4.1)
**Sistema Integral de Comercio Electrónico Dermocosmético (DERMA-ECOM)**

> [!IMPORTANT]
> **Resumen Verificado de Cumplimiento de Rúbrica (SQL Server 2022 + PostgreSQL 16/17):**
> - **Total de Tablas Documentadas:** **150 fichas técnicas completas** (`2,020` columnas con descripción semántica individual y equivalencia de tipos multi-SGBD).
> - **Asignación Equitativa de Autoría:** 50 tablas Integrante 1 (`001`–`050`), 50 tablas Integrante 2 (`051`–`100`), 50 tablas Integrante 3 (`101`–`150`).
> - **Límite de Catálogos Simples:** 22 catálogos simples (**14.6% ≤ 25%**) y 128 tablas maestras, transaccionales, intermedias $N:M$ y bitácoras (**85.4% ≥ 75%**).
> - **Integridad Referencial Activa:** **183 llaves foráneas** (`183` columnas FK marcadas explícitamente en la columna `Clave`), **87 restricciones `CHECK`**, **30 índices secundarios** y **0 tablas huérfanas** (1 componente conexo).
> - **Auditoría y Soft Delete:** Las 150 tablas implementan las 7 columnas invariantes (`activo`, `fecha_creacion`, `creado_por`, `fecha_modificacion`, `modificado_por`, `fecha_baja`, `eliminado_por`).
> - **Inventario de Privacidad LFPDPPP (Art. 16 Constitucional / TLI 4.4.1):** Clasificación explícita por tabla y por campo en las 150 fichas.

### Resumen del Inventario de Datos por Clasificación LFPDPPP / Regulatoria

| Clasificación LFPDPPP / Regulatoria | Cantidad de Tablas |
| :--- | :---: |
| **Sin Datos Personales** | 73 tablas |
| **Dato Personal** | 17 tablas |
| **Financiero** | 10 tablas |
| **Fiscal SAT** | 7 tablas |
| **Dato Personal Sensible** | 4 tablas |
| **Logística** | 4 tablas |
| **Sanitaria COFEPRIS** | 3 tablas |
| **Dato Personal / Financiero** | 3 tablas |
| **Auditoría FBD** | 2 tablas |
| **Ciberseguridad** | 2 tablas |
| **Sanitaria** | 2 tablas |
| **Dato Confidencial** | 2 tablas |
| **Evidencia Legal** | 2 tablas |
| **Financiero / Legal** | 1 tablas |
| **Comercial / Legal** | 1 tablas |
| **Dato Financiero** | 1 tablas |
| **Regulatoria Legal** | 1 tablas |
| **Legal / Seguros** | 1 tablas |
| **Médica / Sanitaria** | 1 tablas |
| **Dato Personal Laboral** | 1 tablas |
| **Dato Personal / Sanitario** | 1 tablas |
| **Comercial / Financiero** | 1 tablas |
| **Fiscal** | 1 tablas |
| **Dato Fiscal / LFPDPPP** | 1 tablas |
| **Comercial** | 1 tablas |
| **Trazabilidad Sanitaria** | 1 tablas |
| **Forense / Integridad** | 1 tablas |
| **Sanitaria IoT** | 1 tablas |
| **Ciberseguridad Penal** | 1 tablas |
| **Sanitaria / Comercial** | 1 tablas |
| **Sanitaria Higiénica** | 1 tablas |
| **Sanitaria FEFO** | 1 tablas |

---
### FICHA TÉCNICA 001: `seguridad.roles`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (1)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Perfiles de acceso en el sistema (Admin, Dermoconsultor, Cliente, etc.).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_rol` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.roles`. |
| 02 | `codigo_rol` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo rol. |
| 03 | `nombre_rol` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre rol. |
| 04 | `descripcion` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `nivel_jerarquico` | `INT` | NO | - | CHK: `nivel_jerarquico BETWEEN 1 AND 10` | Sin Dato Personal | Valor numérico cuantitativo que registra nivel jerarquico. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_roles PRIMARY KEY CLUSTERED (id_rol)`
- `CONSTRAINT UQ_seguridad_roles_codigo UNIQUE (codigo_rol)`

---

### FICHA TÉCNICA 002: `seguridad.permisos`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (2)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Permisos atómicos sobre módulos y operaciones del software.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_permiso` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.permisos`. |
| 02 | `clave_permiso` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | UQ | UNIQUE | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a clave permiso. |
| 03 | `modulo_sistema` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de modulo sistema en `seguridad.permisos`. |
| 04 | `accion` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de accion en `seguridad.permisos`. |
| 05 | `descripcion` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_permisos PRIMARY KEY CLUSTERED (id_permiso)`
- `CONSTRAINT UQ_seguridad_permisos_clave UNIQUE (clave_permiso)`

---

### FICHA TÉCNICA 003: `seguridad.roles_permisos`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Matriz RBAC de asignación de privilegios a roles.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_rol_permiso` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.roles_permisos`. |
| 02 | `rol` | `BIGINT` | NO | **FK**, UQ | FK → `seguridad.roles(id_rol)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.roles(id_rol)`. |
| 03 | `permiso` | `BIGINT` | NO | **FK**, UQ | FK → `seguridad.permisos(id_permiso)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.permisos(id_permiso)`. |
| 04 | `permitir` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: permitir. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_roles_permisos PRIMARY KEY CLUSTERED (id_rol_permiso)`
- `CONSTRAINT UQ_seguridad_roles_permisos UNIQUE (rol, permiso)`
- `CONSTRAINT FK_seguridad_rp_rol FOREIGN KEY (rol) REFERENCES seguridad.roles(id_rol)`
- `CONSTRAINT FK_seguridad_rp_permiso FOREIGN KEY (permiso) REFERENCES seguridad.permisos(id_permiso)`

---

### FICHA TÉCNICA 004: `seguridad.usuarios`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Cuentas de usuario con hash seguro (bcrypt/Argon2id), salt y MFA.
- **Total de Columnas:** 21 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_usuario` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.usuarios`. |
| 02 | `uuid_usuario` | `UNIQUEIDENTIFIER` / `UUID` | NO | UQ | DEF: `NEWID()`; UNIQUE | Sin Dato Personal | Identificador universal único (UUID v4) expuesto externamente en APIs. |
| 03 | `email` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | UQ | UNIQUE | Dato Personal Identificativo | Dirección de correo electrónico única utilizada como identificador de acceso y contacto. |
| 04 | `password_hash` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Confidencial (Criptográfico) | Hash criptográfico irreversible de la contraseña (Argon2id/bcrypt/SHA-512 iterado; nunca texto claro). |
| 05 | `password_salt` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | - | - | Confidencial (Criptográfico) | Valor criptográfico aleatorio (salt) único por usuario para mitigar ataques de tablas arcoíris. |
| 06 | `telefono_movil` | `NVARCHAR(20)` / `VARCHAR(20)` | SÍ | - | - | Dato Personal Identificativo | Número telefónico celular del usuario para alertas de seguridad y MFA. |
| 07 | `email_verificado` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Dato Personal Identificativo | Atributo de dominio que almacena el valor de email verificado en `seguridad.usuarios`. |
| 08 | `cuenta_bloqueada` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: cuenta bloqueada. |
| 09 | `fecha_bloqueo` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha bloqueo. |
| 10 | `intentos_fallidos_consecutivos` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra intentos fallidos consecutivos. |
| 11 | `mfa_habilitado` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indica si la autenticación multifactor (MFA/TOTP) está activa para la cuenta. |
| 12 | `mfa_secreto` | `NVARCHAR(128)` / `VARCHAR(128)` | SÍ | - | - | Confidencial (Criptográfico) | Semilla secreta cifrada TOTP para generación de códigos de un solo uso (2FA). |
| 13 | `ultimo_login_exitoso` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de ultimo login exitoso en `seguridad.usuarios`. |
| 14 | `ultimo_cambio_password` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Confidencial (Criptográfico) | Atributo de dominio que almacena el valor de ultimo cambio password en `seguridad.usuarios`. |
| 15 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 16 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 17 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 18 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 19 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 20 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 21 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_usuarios PRIMARY KEY CLUSTERED (id_usuario)`
- `CONSTRAINT UQ_seguridad_usuarios_email UNIQUE (email)`
- `CONSTRAINT UQ_seguridad_usuarios_uuid UNIQUE (uuid_usuario)`

**Índices Secundarios Explícitos:**
- `IX_seguridad_usuarios_activo_email (activo, email)`

---

### FICHA TÉCNICA 005: `seguridad.usuarios_roles`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Asignación de roles a usuarios con historial de vigencia.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_usuario_rol` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.usuarios_roles`. |
| 02 | `usuario` | `BIGINT` | NO | **FK**, UQ | FK → `seguridad.usuarios(id_usuario)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `rol` | `BIGINT` | NO | **FK**, UQ | FK → `seguridad.roles(id_rol)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.roles(id_rol)`. |
| 04 | `fecha_asignacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha asignacion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_usuarios_roles PRIMARY KEY CLUSTERED (id_usuario_rol)`
- `CONSTRAINT UQ_seguridad_usuarios_roles UNIQUE (usuario, rol)`
- `CONSTRAINT FK_seguridad_ur_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`
- `CONSTRAINT FK_seguridad_ur_rol FOREIGN KEY (rol) REFERENCES seguridad.roles(id_rol)`

**Índices Secundarios Explícitos:**
- `IX_seguridad_usuarios_roles_ur (usuario, rol)`

---

### FICHA TÉCNICA 006: `seguridad.sesiones_activas`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Control y revocación de tokens de sesión concurrentes e IP.
- **Total de Columnas:** 17 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_sesion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.sesiones_activas`. |
| 02 | `usuario` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `token_sesion_hash` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | UQ | UNIQUE | Confidencial (Criptográfico) | Dato criptográfico, fiscal o de control técnico correspondiente a token sesion hash. |
| 04 | `direccion_ip` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | - | - | Dato Personal Identificativo | Dirección IPv4/IPv6 de origen de la sesión o evento de seguridad. |
| 05 | `user_agent` | `NVARCHAR(350)` / `VARCHAR(350)` | NO | - | - | Dato Personal Identificativo | Cadena de identificación del navegador, dispositivo y sistema operativo del cliente. |
| 06 | `fecha_inicio` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha inicio. |
| 07 | `fecha_expiracion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha expiracion. |
| 08 | `revocada` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: revocada. |
| 09 | `fecha_revocacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha revocacion. |
| 10 | `motivo_revocacion` | `NVARCHAR(100)` / `VARCHAR(100)` | SÍ | - | - | Sin Dato Personal | Clasificación controlada de dominio para motivo revocacion. |
| 11 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 12 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 13 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 14 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 15 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 16 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 17 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_sesiones_activas PRIMARY KEY CLUSTERED (id_sesion)`
- `CONSTRAINT UQ_seguridad_sa_token UNIQUE (token_sesion_hash)`
- `CONSTRAINT FK_seguridad_sa_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

**Índices Secundarios Explícitos:**
- `IX_seguridad_sesiones_usuario_rev (usuario, revocada, fecha_expiracion)`

---

### FICHA TÉCNICA 007: `seguridad.historial_passwords`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Confidencial**
- **Descripción Operativa del Negocio:** Almacenamiento seguro de hashes previos para evitar reutilización.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_historial_pwd` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.historial_passwords`. |
| 02 | `usuario` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `password_hash` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Confidencial (Criptográfico) | Hash criptográfico irreversible de la contraseña (Argon2id/bcrypt/SHA-512 iterado; nunca texto claro). |
| 04 | `password_salt` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | - | - | Confidencial (Criptográfico) | Valor criptográfico aleatorio (salt) único por usuario para mitigar ataques de tablas arcoíris. |
| 05 | `algoritmo_hashing` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | DEF: `N'Argon2id'` | Sin Dato Personal | Nombre y versión del algoritmo criptográfico de derivación de clave utilizado. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_historial_passwords PRIMARY KEY CLUSTERED (id_historial_pwd)`
- `CONSTRAINT FK_seguridad_hp_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 008: `seguridad.intentos_login`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Bitácora Forense
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Auditoría de accesos fallidos y defensa contra ataques de fuerza bruta.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_intento_login` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.intentos_login`. |
| 02 | `email_ingresado` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Dato Personal Identificativo | Correo electrónico capturado durante el intento de inicio de sesión. |
| 03 | `usuario` | `BIGINT` | SÍ | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 04 | `direccion_ip` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | - | - | Dato Personal Identificativo | Dirección IPv4/IPv6 de origen de la sesión o evento de seguridad. |
| 05 | `pais_origen_ip` | `NVARCHAR(60)` / `VARCHAR(60)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de pais origen ip en `seguridad.intentos_login`. |
| 06 | `user_agent` | `NVARCHAR(350)` / `VARCHAR(350)` | NO | - | - | Dato Personal Identificativo | Cadena de identificación del navegador, dispositivo y sistema operativo del cliente. |
| 07 | `resultado` | `NVARCHAR(20)` / `VARCHAR(30)` | NO | - | CHK: `resultado IN (N'EXITOSO', N'PASSWORD_INVALIDO', N'USUARIO_INEXISTENTE', N'CUENTA_BLOQUEADA', N'MFA_FALLIDO')` | Sin Dato Personal | Clasificación controlada de dominio para resultado. |
| 08 | `mensaje_detalle` | `NVARCHAR(200)` / `VARCHAR(200)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de mensaje detalle en `seguridad.intentos_login`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_intentos_login PRIMARY KEY CLUSTERED (id_intento_login)`
- `CONSTRAINT FK_seguridad_il_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

**Índices Secundarios Explícitos:**
- `IX_seguridad_intentos_login_ip (direccion_ip, fecha_creacion)`

---

### FICHA TÉCNICA 009: `seguridad.tokens_recuperacion`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Confidencial**
- **Descripción Operativa del Negocio:** Tokens criptográficos para restablecimiento de clave o validación de correo.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_token_recuperacion` | `BIGINT` | NO | **PK** (ID) | - | Confidencial (Criptográfico) | Llave primaria autoincrementable única de la entidad `seguridad.tokens_recuperacion`. |
| 02 | `usuario` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `token_hash` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | UQ | UNIQUE | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a token hash. |
| 04 | `tipo_token` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `tipo_token IN (N'RESET_PASSWORD', N'VERIFICAR_EMAIL', N'MFA_BACKUP')` | Sin Dato Personal | Clasificación controlada de dominio para tipo token. |
| 05 | `fecha_expiracion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha expiracion. |
| 06 | `utilizado` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de utilizado en `seguridad.tokens_recuperacion`. |
| 07 | `fecha_utilizacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha utilizacion. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_tokens_recuperacion PRIMARY KEY CLUSTERED (id_token_recuperacion)`
- `CONSTRAINT UQ_seguridad_tr_token UNIQUE (token_hash)`
- `CONSTRAINT FK_seguridad_tr_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 010: `seguridad.dispositivos_confianza`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Fingerprint de navegadores/equipos autorizados para inicio de sesión.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_dispositivo` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `seguridad.dispositivos_confianza`. |
| 02 | `usuario` | `BIGINT` | NO | **FK**, UQ | FK → `seguridad.usuarios(id_usuario)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `fingerprint_dispositivo` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | UQ | UNIQUE | Dato Personal Identificativo | Atributo de dominio que almacena el valor de fingerprint dispositivo en `seguridad.dispositivos_confianza`. |
| 04 | `nombre_dispositivo` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre dispositivo. |
| 05 | `sistema_operativo` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de sistema operativo en `seguridad.dispositivos_confianza`. |
| 06 | `navegador` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de navegador en `seguridad.dispositivos_confianza`. |
| 07 | `es_confiable` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es confiable. |
| 08 | `ultimo_acceso` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Atributo de dominio que almacena el valor de ultimo acceso en `seguridad.dispositivos_confianza`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_seguridad_dispositivos_confianza PRIMARY KEY CLUSTERED (id_dispositivo)`
- `CONSTRAINT UQ_seguridad_dc_fingerprint UNIQUE (usuario, fingerprint_dispositivo)`
- `CONSTRAINT FK_seguridad_dc_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 011: `clientes.tipos_piel`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (3)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Clasificación dermatológica (Grasa, Seca, Mixta, Sensible, Madura).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tipo_piel` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible (Salud)** | Llave primaria autoincrementable única de la entidad `clientes.tipos_piel`. |
| 02 | `codigo_piel` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | **Dato Personal Sensible (Salud)** | Código identificador estandarizado de codigo piel. |
| 03 | `nombre` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de nombre en `clientes.tipos_piel`. |
| 04 | `descripcion_clinica` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion clinica. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_tipos_piel PRIMARY KEY CLUSTERED (id_tipo_piel)`
- `CONSTRAINT UQ_clientes_tp_codigo UNIQUE (codigo_piel)`

---

### FICHA TÉCNICA 012: `clientes.condiciones_dermatologicas`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (4)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Afecciones cutáneas (Acné, Rosácea, Dermatitis, Melasma, etc.).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_condicion_dermatologica` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible (Salud)** | Llave primaria autoincrementable única de la entidad `clientes.condiciones_dermatologicas`. |
| 02 | `codigo_condicion` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo condicion. |
| 03 | `nombre_condicion` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre condicion. |
| 04 | `descripcion_patologica` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion patologica. |
| 05 | `nivel_severidad_tipica` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `nivel_severidad_tipica IN (N'LEVE', N'MODERADA', N'SEVERA')` | Sin Dato Personal | Valor numérico cuantitativo que registra nivel severidad tipica. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_condiciones_dermatologicas PRIMARY KEY CLUSTERED (id_condicion_dermatologica)`
- `CONSTRAINT UQ_clientes_cd_codigo UNIQUE (codigo_condicion)`

---

### FICHA TÉCNICA 013: `clientes.clientes`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Información de perfil de clientes, aceptación de términos y RFC/CURP.
- **Total de Columnas:** 19 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cliente` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.clientes`. |
| 02 | `usuario` | `BIGINT` | NO | **FK**, UQ | FK → `seguridad.usuarios(id_usuario)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `nombres` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Dato Personal Identificativo | Nombre(s) de pila del cliente (atributo desagregado en 1FN). |
| 04 | `primer_apellido` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Dato Personal Identificativo | Apellido paterno o primer apellido del cliente. |
| 05 | `segundo_apellido` | `NVARCHAR(60)` / `VARCHAR(60)` | SÍ | - | - | Dato Personal Identificativo | Apellido materno o segundo apellido del cliente (opcional). |
| 06 | `fecha_nacimiento` | `DATE` | NO | - | - | Dato Personal Identificativo | Fecha de nacimiento del cliente para validación de mayoría de edad y perfil clínico. |
| 07 | `genero` | `NVARCHAR(20)` / `VARCHAR(25)` | SÍ | - | CHK: `genero IN (N'FEMENINO', N'MASCULINO', N'NO_BINARIO', N'PREFIERO_NO_DECIR')` | Dato Personal Identificativo | Identidad o clasificación de género declarada voluntariamente por el cliente. |
| 08 | `curp` | `NVARCHAR(18)` / `VARCHAR(18)` | SÍ | - | - | Dato Personal / Fiscal SAT | Clave Única de Registro de Población (18 caracteres, dato identificativo oficial). |
| 09 | `rfc` | `NVARCHAR(13)` / `VARCHAR(13)` | SÍ | - | - | Dato Personal / Fiscal SAT | Registro Federal de Contribuyentes (12 o 13 caracteres) para facturación SAT. |
| 10 | `telefono_fijo` | `NVARCHAR(20)` / `VARCHAR(20)` | SÍ | - | - | Dato Personal Identificativo | Número telefónico fijo de contacto del cliente. |
| 11 | `acepta_terminos` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: acepta terminos. |
| 12 | `fecha_aceptacion_terminos` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha aceptacion terminos. |
| 13 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 14 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 15 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 16 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 17 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 18 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 19 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_clientes PRIMARY KEY CLUSTERED (id_cliente)`
- `CONSTRAINT UQ_clientes_cli_usuario UNIQUE (usuario)`
- `CONSTRAINT FK_clientes_cli_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

**Índices Secundarios Explícitos:**
- `IX_clientes_clientes_usuario_act (usuario, activo)`

---

### FICHA TÉCNICA 014: `clientes.direcciones`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Domicilios de entrega y facturación con geolocalización postal.
- **Total de Columnas:** 21 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_direccion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.direcciones`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `alias_direccion` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Ej: Casa, Trabajo. |
| 04 | `calle` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de calle en `clientes.direcciones`. |
| 05 | `numero_exterior` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra numero exterior. |
| 06 | `numero_interior` | `NVARCHAR(20)` / `VARCHAR(20)` | SÍ | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra numero interior. |
| 07 | `colonia` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de colonia en `clientes.direcciones`. |
| 08 | `codigo_postal` | `NVARCHAR(10)` / `VARCHAR(10)` | NO | - | - | Dato Personal Identificativo | Código identificador estandarizado de codigo postal. |
| 09 | `municipio_alcaldia` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de municipio alcaldia en `clientes.direcciones`. |
| 10 | `estado` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de estado en `clientes.direcciones`. |
| 11 | `pais` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | DEF: `N'México'` | Sin Dato Personal | Atributo de dominio que almacena el valor de pais en `clientes.direcciones`. |
| 12 | `referencias` | `NVARCHAR(255)` / `VARCHAR(255)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de referencias en `clientes.direcciones`. |
| 13 | `es_predeterminada_envio` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es predeterminada envio. |
| 14 | `es_predeterminada_facturacion` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es predeterminada facturacion. |
| 15 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 16 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 17 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 18 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 19 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 20 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 21 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_direcciones PRIMARY KEY CLUSTERED (id_direccion)`
- `CONSTRAINT FK_clientes_dir_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 015: `clientes.perfil_cutaneo`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal Sensible**
- **Descripción Operativa del Negocio:** Datos de salud cutánea, sensibilidad solar, oleosidad y poros.
- **Total de Columnas:** 18 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_perfil_cutaneo` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible (Salud)** | Llave primaria autoincrementable única de la entidad `clientes.perfil_cutaneo`. |
| 02 | `cliente` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.clientes(id_cliente)`; UNIQUE | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `tipo_piel` | `BIGINT` | NO | **FK** | FK → `clientes.tipos_piel(id_tipo_piel)` | **Dato Personal Sensible (Salud)** | Llave foránea que vincula este registro con `clientes.tipos_piel(id_tipo_piel)`. |
| 04 | `sensibilidad_solar` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `sensibilidad_solar IN (N'MUY_BAJA', N'MODERADA', N'ALTA', N'EXTREMA')` | **Dato Personal Sensible (Salud)** | Atributo de dominio que almacena el valor de sensibilidad solar en `clientes.perfil_cutaneo`. |
| 05 | `nivel_oleosidad` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `nivel_oleosidad IN (N'SECA', N'EQUILIBRADA', N'ZONA_T', N'GRASA_TOTAL')` | **Dato Personal Sensible (Salud)** | Valor numérico cuantitativo que registra nivel oleosidad. |
| 06 | `poros_dilatados` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de poros dilatados en `clientes.perfil_cutaneo`. |
| 07 | `propension_acne` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de propension acne en `clientes.perfil_cutaneo`. |
| 08 | `manchas_hiperpigmentacion` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de manchas hiperpigmentacion en `clientes.perfil_cutaneo`. |
| 09 | `lineas_expresion` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de lineas expresion en `clientes.perfil_cutaneo`. |
| 10 | `consentimiento_datos_sensibles` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de consentimiento datos sensibles en `clientes.perfil_cutaneo`. |
| 11 | `fecha_declaracion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | **Dato Personal Sensible** | Fecha y/o marca temporal registrada para fecha declaracion. |
| 12 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 13 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 14 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 15 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 16 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 17 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 18 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_perfil_cutaneo PRIMARY KEY CLUSTERED (id_perfil_cutaneo)`
- `CONSTRAINT UQ_clientes_pc_cliente UNIQUE (cliente)`
- `CONSTRAINT FK_clientes_pc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_clientes_pc_tipo_piel FOREIGN KEY (tipo_piel) REFERENCES clientes.tipos_piel(id_tipo_piel)`

---

### FICHA TÉCNICA 016: `clientes.cliente_condiciones`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal Sensible**
- **Descripción Operativa del Negocio:** Diagnósticos dermatológicos padecidos por el cliente.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cliente_condicion` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible** | Llave primaria autoincrementable única de la entidad `clientes.cliente_condiciones`. |
| 02 | `cliente` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.clientes(id_cliente)`; UNIQUE | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `condicion_dermatologica` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.condiciones_dermatologicas(id_condicion_dermatologica)`; UNIQUE | **Dato Personal Sensible (Salud)** | Llave foránea que vincula este registro con `clientes.condiciones_dermatologicas(id_condicion_dermatologica)`. |
| 04 | `diagnosticada_por_medico` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de diagnosticada por medico en `clientes.cliente_condiciones`. |
| 05 | `notas_paciente` | `NVARCHAR(255)` / `VARCHAR(255)` | SÍ | - | - | **Dato Personal Sensible (Salud)** | Atributo de dominio que almacena el valor de notas paciente en `clientes.cliente_condiciones`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_cliente_condiciones PRIMARY KEY CLUSTERED (id_cliente_condicion)`
- `CONSTRAINT UQ_clientes_cc_cliente_condicion UNIQUE (cliente, condicion_dermatologica)`
- `CONSTRAINT FK_clientes_cc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_clientes_cc_condicion FOREIGN KEY (condicion_dermatologica) REFERENCES clientes.condiciones_dermatologicas(id_condicion_dermatologica)`

**Índices Secundarios Explícitos:**
- `IX_clientes_condiciones_cli (cliente, condicion_dermatologica)`

---

### FICHA TÉCNICA 017: `clientes.cuestionarios_diagnostico`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Cuestionarios clínicos interactivos de evaluación de la piel.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cuestionario` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.cuestionarios_diagnostico`. |
| 02 | `codigo_cuestionario` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo cuestionario. |
| 03 | `titulo` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de titulo en `clientes.cuestionarios_diagnostico`. |
| 04 | `descripcion` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `version_clinica` | `NVARCHAR(10)` / `VARCHAR(10)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de version clinica en `clientes.cuestionarios_diagnostico`. |
| 06 | `vigente_desde` | `DATE` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de vigente desde en `clientes.cuestionarios_diagnostico`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_cuestionarios_diagnostico PRIMARY KEY CLUSTERED (id_cuestionario)`
- `CONSTRAINT UQ_clientes_cdiag_codigo UNIQUE (codigo_cuestionario)`

---

### FICHA TÉCNICA 018: `clientes.preguntas_diagnostico`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Reactivos y preguntas de test de piel/maquillaje.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_pregunta` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.preguntas_diagnostico`. |
| 02 | `cuestionario` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.cuestionarios_diagnostico(id_cuestionario)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.cuestionarios_diagnostico(id_cuestionario)`. |
| 03 | `numero_orden` | `INT` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero orden. |
| 04 | `enunciado_pregunta` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de enunciado pregunta en `clientes.preguntas_diagnostico`. |
| 05 | `tipo_respuesta` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `tipo_respuesta IN (N'OPCION_UNICA', N'OPCION_MULTIPLE', N'ESCALA_NUMERICA')` | Sin Dato Personal | Clasificación controlada de dominio para tipo respuesta. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_preguntas_diagnostico PRIMARY KEY CLUSTERED (id_pregunta)`
- `CONSTRAINT UQ_clientes_pd_orden UNIQUE (cuestionario, numero_orden)`
- `CONSTRAINT FK_clientes_pd_cuestionario FOREIGN KEY (cuestionario) REFERENCES clientes.cuestionarios_diagnostico(id_cuestionario)`

---

### FICHA TÉCNICA 019: `clientes.opciones_pregunta`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Opciones de respuesta con puntaje dermatológico asociado.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_opcion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.opciones_pregunta`. |
| 02 | `pregunta` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.preguntas_diagnostico(id_pregunta)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.preguntas_diagnostico(id_pregunta)`. |
| 03 | `clave_opcion` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a clave opcion. |
| 04 | `texto_opcion` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de texto opcion en `clientes.opciones_pregunta`. |
| 05 | `peso_clinico_puntos` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de peso clinico puntos en `clientes.opciones_pregunta`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_opciones_pregunta PRIMARY KEY CLUSTERED (id_opcion)`
- `CONSTRAINT UQ_clientes_op_pregunta_clave UNIQUE (pregunta, clave_opcion)`
- `CONSTRAINT FK_clientes_op_pregunta FOREIGN KEY (pregunta) REFERENCES clientes.preguntas_diagnostico(id_pregunta)`

---

### FICHA TÉCNICA 020: `clientes.evaluaciones_diagnostico`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal Sensible**
- **Descripción Operativa del Negocio:** Test resueltos por clientes con diagnóstico y sugerencia cosmética.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_evaluacion` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible** | Llave primaria autoincrementable única de la entidad `clientes.evaluaciones_diagnostico`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `cuestionario` | `BIGINT` | NO | **FK** | FK → `clientes.cuestionarios_diagnostico(id_cuestionario)` | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.cuestionarios_diagnostico(id_cuestionario)`. |
| 04 | `fecha_realizacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | **Dato Personal Sensible** | Fecha y/o marca temporal registrada para fecha realizacion. |
| 05 | `puntaje_total` | `INT` | NO | - | - | **Dato Personal Sensible** | Valor numérico cuantitativo que registra puntaje total. |
| 06 | `diagnostico_sugerido` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | **Dato Personal Sensible (Salud)** | Atributo de dominio que almacena el valor de diagnostico sugerido en `clientes.evaluaciones_diagnostico`. |
| 07 | `observaciones_dermoconsultor` | `NVARCHAR(500)` / `VARCHAR(500)` | SÍ | - | - | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de observaciones dermoconsultor en `clientes.evaluaciones_diagnostico`. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_evaluaciones_diagnostico PRIMARY KEY CLUSTERED (id_evaluacion)`
- `CONSTRAINT FK_clientes_ed_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_clientes_ed_cuestionario FOREIGN KEY (cuestionario) REFERENCES clientes.cuestionarios_diagnostico(id_cuestionario)`

---

### FICHA TÉCNICA 021: `clientes.respuestas_evaluacion`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal Sensible**
- **Descripción Operativa del Negocio:** Detalle de respuestas seleccionadas en cada evaluación.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 5

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_respuesta_evaluacion` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible** | Llave primaria autoincrementable única de la entidad `clientes.respuestas_evaluacion`. |
| 02 | `evaluacion` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.evaluaciones_diagnostico(id_evaluacion)`; UNIQUE | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.evaluaciones_diagnostico(id_evaluacion)`. |
| 03 | `pregunta` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.preguntas_diagnostico(id_pregunta)`; UNIQUE | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.preguntas_diagnostico(id_pregunta)`. |
| 04 | `opcion_seleccionada` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.opciones_pregunta(id_opcion)`; UNIQUE | **Dato Personal Sensible** | Llave foránea que vincula este registro con `clientes.opciones_pregunta(id_opcion)`. |
| 05 | `valor_texto_adicional` | `NVARCHAR(255)` / `VARCHAR(255)` | SÍ | - | - | **Dato Personal Sensible** | Atributo de dominio que almacena el valor de valor texto adicional en `clientes.respuestas_evaluacion`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_respuestas_evaluacion PRIMARY KEY CLUSTERED (id_respuesta_evaluacion)`
- `CONSTRAINT UQ_clientes_re_eval_preg UNIQUE (evaluacion, pregunta, opcion_seleccionada)`
- `CONSTRAINT FK_clientes_re_evaluacion FOREIGN KEY (evaluacion) REFERENCES clientes.evaluaciones_diagnostico(id_evaluacion)`
- `CONSTRAINT FK_clientes_re_pregunta FOREIGN KEY (pregunta) REFERENCES clientes.preguntas_diagnostico(id_pregunta)`
- `CONSTRAINT FK_clientes_re_opcion FOREIGN KEY (opcion_seleccionada) REFERENCES clientes.opciones_pregunta(id_opcion)`

---

### FICHA TÉCNICA 022: `clientes.consentimientos_privacidad`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Evidencia Legal**
- **Descripción Operativa del Negocio:** Registro formal de consentimiento expreso para datos de salud (LFPDPPP).
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_consentimiento` | `BIGINT` | NO | **PK** (ID) | - | Evidencia Legal LFPDPPP | Llave primaria autoincrementable única de la entidad `clientes.consentimientos_privacidad`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Evidencia Legal LFPDPPP | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `version_aviso_privacidad` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | - | Evidencia Legal LFPDPPP | Ej: v1.0-2026. |
| 04 | `acepta_finalidades_primarias` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Evidencia Legal LFPDPPP | Indicador booleano que señala si se cumple la condición: acepta finalidades primarias. |
| 05 | `acepta_finalidades_secundarias_marketing` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Evidencia Legal LFPDPPP | Indicador booleano que señala si se cumple la condición: acepta finalidades secundarias marketing. |
| 06 | `acepta_tratamiento_datos_salud_sensibles` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Evidencia Legal LFPDPPP | Indicador booleano que señala si se cumple la condición: acepta tratamiento datos salud sensibles. |
| 07 | `direccion_ip_firma` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de direccion ip firma en `clientes.consentimientos_privacidad`. |
| 08 | `medio_consentimiento` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `medio_consentimiento IN (N'CHECKBOX_DIGITAL', N'FIRMA_ELECTRONICA', N'EN_SUCURSAL')` | Evidencia Legal LFPDPPP | Atributo de dominio que almacena el valor de medio consentimiento en `clientes.consentimientos_privacidad`. |
| 09 | `fecha_consentimiento` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Evidencia Legal LFPDPPP | Fecha y/o marca temporal registrada para fecha consentimiento. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_consentimientos_privacidad PRIMARY KEY CLUSTERED (id_consentimiento)`
- `CONSTRAINT FK_clientes_cp_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 023: `clientes.solicitudes_arco`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Evidencia Legal**
- **Descripción Operativa del Negocio:** Trámites formales de Derechos ARCO (Acceso, Rectificación, Cancelación).
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_solicitud_arco` | `BIGINT` | NO | **PK** (ID) | - | Evidencia Legal LFPDPPP | Llave primaria autoincrementable única de la entidad `clientes.solicitudes_arco`. |
| 02 | `folio_solicitud` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Evidencia Legal LFPDPPP | Número de folio único de control operativo (folio solicitud). |
| 03 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Evidencia Legal LFPDPPP | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 04 | `tipo_derecho` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `tipo_derecho IN (N'ACCESO', N'RECTIFICACION', N'CANCELACION', N'OPOSICION')` | Evidencia Legal LFPDPPP | Clasificación controlada de dominio para tipo derecho. |
| 05 | `motivo_solicitud` | `NVARCHAR(500)` / `VARCHAR(500)` | NO | - | - | Evidencia Legal LFPDPPP | Clasificación controlada de dominio para motivo solicitud. |
| 06 | `estado_tramite` | `NVARCHAR(20)` / `VARCHAR(30)` | NO | - | CHK: `estado_tramite IN (N'RECIBIDA', N'EN_REVISION', N'DOCUMENTACION_REQUERIDA', N'PROCEDENTE', N'IMPROCEDENTE', N'CONCLUIDA')` | Evidencia Legal LFPDPPP | Clasificación controlada de dominio para estado tramite. |
| 07 | `fecha_limite_respuesta` | `DATE` | NO | - | - | Evidencia Legal LFPDPPP | Plazo legal máximo de 20 días hábiles. |
| 08 | `resolucion_juridica` | `NVARCHAR(1000)` / `VARCHAR(1000)` | SÍ | - | - | Evidencia Legal LFPDPPP | Atributo de dominio que almacena el valor de resolucion juridica en `clientes.solicitudes_arco`. |
| 09 | `fecha_resolucion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Evidencia Legal LFPDPPP | Fecha y/o marca temporal registrada para fecha resolucion. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_solicitudes_arco PRIMARY KEY CLUSTERED (id_solicitud_arco)`
- `CONSTRAINT UQ_clientes_arco_folio UNIQUE (folio_solicitud)`
- `CONSTRAINT FK_clientes_arco_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 024: `clientes.preferencias_comunicacion`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Opciones de contacto consentidas (Email, SMS, WhatsApp, Promos).
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_preferencia` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.preferencias_comunicacion`. |
| 02 | `cliente` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.clientes(id_cliente)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `canal_email` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Clasificación controlada de dominio para canal email. |
| 04 | `canal_sms` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Clasificación controlada de dominio para canal sms. |
| 05 | `canal_whatsapp` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Clasificación controlada de dominio para canal whatsapp. |
| 06 | `notificaciones_ofertas` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Atributo de dominio que almacena el valor de notificaciones ofertas en `clientes.preferencias_comunicacion`. |
| 07 | `alertas_reabastecimiento_rutina` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Atributo de dominio que almacena el valor de alertas reabastecimiento rutina en `clientes.preferencias_comunicacion`. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_preferencias_comunicacion PRIMARY KEY CLUSTERED (id_preferencia)`
- `CONSTRAINT UQ_clientes_pcom_cliente UNIQUE (cliente)`
- `CONSTRAINT FK_clientes_pcom_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 025: `clientes.metodos_pago_tokenizados`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Financiero**
- **Descripción Operativa del Negocio:** Tokens seguros PCI-DSS de tarjetas de crédito/débito guardadas.
- **Total de Columnas:** 17 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_metodo_tokenizado` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `clientes.metodos_pago_tokenizados`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `pasarela_emisor` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | - | Sin Dato Personal | Stripe, MercadoPago. |
| 04 | `token_tarjeta_pasarela` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | UQ | UNIQUE | Dato Financiero / Patrimonial | Token generado por la pasarela, NUNCA datos planos. |
| 05 | `marca_tarjeta` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | - | Dato Financiero / Patrimonial | Visa, MasterCard, Amex. |
| 06 | `ultimos_cuatro_digitos` | `VARCHAR(4)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de ultimos cuatro digitos en `clientes.metodos_pago_tokenizados`. |
| 07 | `mes_expiracion` | `INT` | NO | - | CHK: `mes_expiracion BETWEEN 1 AND 12` | Sin Dato Personal | Atributo de dominio que almacena el valor de mes expiracion en `clientes.metodos_pago_tokenizados`. |
| 08 | `anio_expiracion` | `INT` | NO | - | CHK: `anio_expiracion >= 2026` | Sin Dato Personal | Atributo de dominio que almacena el valor de anio expiracion en `clientes.metodos_pago_tokenizados`. |
| 09 | `titular_tarjeta_hash` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | - | - | Dato Financiero / Patrimonial | Atributo de dominio que almacena el valor de titular tarjeta hash en `clientes.metodos_pago_tokenizados`. |
| 10 | `es_predeterminada` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es predeterminada. |
| 11 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 12 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 13 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 14 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 15 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 16 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 17 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_clientes_metodos_pago_tokenizados PRIMARY KEY CLUSTERED (id_metodo_tokenizado)`
- `CONSTRAINT UQ_clientes_mpt_token UNIQUE (token_tarjeta_pasarela)`
- `CONSTRAINT FK_clientes_mpt_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 026: `catalogo.marcas`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Marcas comerciales cosméticas y dermocosméticas.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_marca` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.marcas`. |
| 02 | `codigo_marca` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo marca. |
| 03 | `nombre_marca` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre marca. |
| 04 | `pais_origen` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de pais origen en `catalogo.marcas`. |
| 05 | `sitio_web` | `NVARCHAR(200)` / `VARCHAR(200)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de sitio web en `catalogo.marcas`. |
| 06 | `es_dermocosmetica` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es dermocosmetica. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_marcas PRIMARY KEY CLUSTERED (id_marca)`
- `CONSTRAINT UQ_catalogo_marcas_codigo UNIQUE (codigo_marca)`

---

### FICHA TÉCNICA 027: `catalogo.laboratorios_fabricantes`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Laboratorios farmacéuticos y cosméticos con licencias sanitarias.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_laboratorio` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.laboratorios_fabricantes`. |
| 02 | `clave_laboratorio` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a clave laboratorio. |
| 03 | `razon_social` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Dato Personal / Fiscal SAT | Atributo de dominio que almacena el valor de razon social en `catalogo.laboratorios_fabricantes`. |
| 04 | `licencia_sanitaria` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de licencia sanitaria en `catalogo.laboratorios_fabricantes`. |
| 05 | `pais` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de pais en `catalogo.laboratorios_fabricantes`. |
| 06 | `certificacion_gmp_vigente` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Atributo de dominio que almacena el valor de certificacion gmp vigente en `catalogo.laboratorios_fabricantes`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_laboratorios_fabricantes PRIMARY KEY CLUSTERED (id_laboratorio)`
- `CONSTRAINT UQ_catalogo_lab_clave UNIQUE (clave_laboratorio)`

---

### FICHA TÉCNICA 028: `catalogo.categorias`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Categorías jerárquicas de productos (Cuidado Facial, Maquillaje, etc.).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_categoria` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.categorias`. |
| 02 | `codigo_categoria` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo categoria. |
| 03 | `nombre_categoria` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre categoria. |
| 04 | `descripcion` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `categoria_padre` | `BIGINT` | SÍ | **FK** | FK → `catalogo.categorias(id_categoria)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.categorias(id_categoria)`. |
| 06 | `nivel_arbol` | `INT` | NO | - | DEF: `1` | Sin Dato Personal | Valor numérico cuantitativo que registra nivel arbol. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_categorias PRIMARY KEY CLUSTERED (id_categoria)`
- `CONSTRAINT UQ_catalogo_cat_codigo UNIQUE (codigo_categoria)`
- `CONSTRAINT FK_catalogo_cat_padre FOREIGN KEY (categoria_padre) REFERENCES catalogo.categorias(id_categoria)`

---

### FICHA TÉCNICA 029: `catalogo.subcategorias`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Subcategorías específicas (Sérums, Labiales, Bases, Protectores Solares).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_subcategoria` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.subcategorias`. |
| 02 | `categoria` | `BIGINT` | NO | **FK** | FK → `catalogo.categorias(id_categoria)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.categorias(id_categoria)`. |
| 03 | `codigo_subcategoria` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo subcategoria. |
| 04 | `nombre_subcategoria` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre subcategoria. |
| 05 | `descripcion` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_subcategorias PRIMARY KEY CLUSTERED (id_subcategoria)`
- `CONSTRAINT UQ_catalogo_subcat_codigo UNIQUE (codigo_subcategoria)`
- `CONSTRAINT FK_catalogo_subcat_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria)`

---

### FICHA TÉCNICA 030: `catalogo.tipos_aplicacion`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (5)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Zonas de aplicación cosmética (Rostro, Ojos, Labios, Cuello, Cuerpo).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tipo_aplicacion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.tipos_aplicacion`. |
| 02 | `codigo_aplicacion` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo aplicacion. |
| 03 | `nombre` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Rostro, Ojos, Labios, Cuello, Cuerpo, Capilar. |
| 04 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_tipos_aplicacion PRIMARY KEY CLUSTERED (id_tipo_aplicacion)`
- `CONSTRAINT UQ_catalogo_ta_codigo UNIQUE (codigo_aplicacion)`

---

### FICHA TÉCNICA 031: `catalogo.certificaciones_sanitarias`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (6)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Sellos oficiales (Cruelty-Free, Vegano, Orgánico, Hipoalergénico).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_certificacion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.certificaciones_sanitarias`. |
| 02 | `codigo_certificacion` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo certificacion. |
| 03 | `nombre_certificacion` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Cruelty Free, Vegan, Orgánico USDA, ECOCERT, Hipoalergénico. |
| 04 | `organismo_certificador` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de organismo certificador en `catalogo.certificaciones_sanitarias`. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_certificaciones_sanitarias PRIMARY KEY CLUSTERED (id_certificacion)`
- `CONSTRAINT UQ_catalogo_cert_codigo UNIQUE (codigo_certificacion)`

---

### FICHA TÉCNICA 032: `catalogo.productos_maestros`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Ficha técnica principal del producto cosmético o de salud.
- **Total de Columnas:** 21 · **Restricciones Nombradas:** 7

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_producto` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.productos_maestros`. |
| 02 | `marca` | `BIGINT` | NO | **FK** | FK → `catalogo.marcas(id_marca)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.marcas(id_marca)`. |
| 03 | `subcategoria` | `BIGINT` | NO | **FK** | FK → `catalogo.subcategorias(id_subcategoria)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.subcategorias(id_subcategoria)`. |
| 04 | `laboratorio` | `BIGINT` | NO | **FK** | FK → `catalogo.laboratorios_fabricantes(id_laboratorio)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.laboratorios_fabricantes(id_laboratorio)`. |
| 05 | `tipo_aplicacion` | `BIGINT` | NO | **FK** | FK → `catalogo.tipos_aplicacion(id_tipo_aplicacion)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.tipos_aplicacion(id_tipo_aplicacion)`. |
| 06 | `certificacion_sanitaria` | `BIGINT` | SÍ | **FK** | FK → `catalogo.certificaciones_sanitarias(id_certificacion)` | Sin Dato Personal | Referencia a la certificación sanitaria/ética principal del producto (Cruelty-Free, Vegano, ECOCERT). |
| 07 | `codigo_producto` | `NVARCHAR(40)` / `VARCHAR(40)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo producto. |
| 08 | `nombre_comercial` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre comercial. |
| 09 | `descripcion_corta` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion corta. |
| 10 | `descripcion_detallada` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion detallada. |
| 11 | `modo_empleo` | `NVARCHAR(1000)` / `VARCHAR(1000)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de modo empleo en `catalogo.productos_maestros`. |
| 12 | `requiere_prescripcion_medica` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible (Salud)** | Indicador booleano que señala si se cumple la condición: requiere prescripcion medica. |
| 13 | `factor_proteccion_solar_fps` | `INT` | SÍ | - | CHK: `factor_proteccion_solar_fps IS NULL OR factor_proteccion_solar_fps BETWEEN 0 AND 100` | Sin Dato Personal | Atributo de dominio que almacena el valor de factor proteccion solar fps en `catalogo.productos_maestros`. |
| 14 | `es_sensible_temperatura` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Cadena de frío requerida. |
| 15 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 16 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 17 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 18 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 19 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 20 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 21 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_productos_maestros PRIMARY KEY CLUSTERED (id_producto)`
- `CONSTRAINT UQ_catalogo_pm_codigo UNIQUE (codigo_producto)`
- `CONSTRAINT FK_catalogo_pm_marca FOREIGN KEY (marca) REFERENCES catalogo.marcas(id_marca)`
- `CONSTRAINT FK_catalogo_pm_subcat FOREIGN KEY (subcategoria) REFERENCES catalogo.subcategorias(id_subcategoria)`
- `CONSTRAINT FK_catalogo_pm_lab FOREIGN KEY (laboratorio) REFERENCES catalogo.laboratorios_fabricantes(id_laboratorio)`
- `CONSTRAINT FK_catalogo_pm_aplicacion FOREIGN KEY (tipo_aplicacion) REFERENCES catalogo.tipos_aplicacion(id_tipo_aplicacion)`
- `CONSTRAINT FK_catalogo_pm_certificacion FOREIGN KEY (certificacion_sanitaria) REFERENCES catalogo.certificaciones_sanitarias(id_certificacion)`

**Índices Secundarios Explícitos:**
- `IX_catalogo_productos_marca_sub (marca, subcategoria, laboratorio)`

---

### FICHA TÉCNICA 033: `catalogo.subtonos_maquillaje`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (7)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Subtonos de piel para maquillaje (Cálido, Frío, Neutro, Oliva).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_subtono` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.subtonos_maquillaje`. |
| 02 | `codigo_subtono` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo subtono. |
| 03 | `nombre_subtono` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Cálido (Warm), Frío (Cool), Neutro (Neutral), Oliva (Olive). |
| 04 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_subtonos_maquillaje PRIMARY KEY CLUSTERED (id_subtono)`
- `CONSTRAINT UQ_catalogo_subt_codigo UNIQUE (codigo_subtono)`

---

### FICHA TÉCNICA 034: `catalogo.acabados_maquillaje`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Catálogo (8)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Acabados de maquillaje (Mate, Satinado, Glow, Terciopelo).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_acabado` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.acabados_maquillaje`. |
| 02 | `codigo_acabado` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo acabado. |
| 03 | `nombre_acabado` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Mate, Satinado, Glow/Radiante, Terciopelo, Brilloso. |
| 04 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_acabados_maquillaje PRIMARY KEY CLUSTERED (id_acabado)`
- `CONSTRAINT UQ_catalogo_acab_codigo UNIQUE (codigo_acabado)`

---

### FICHA TÉCNICA 035: `catalogo.variantes_sku`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** SKU específico por presentación, gramaje/mililitros, precio y código EAN.
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_variante_sku` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.variantes_sku`. |
| 02 | `producto` | `BIGINT` | NO | **FK** | FK → `catalogo.productos_maestros(id_producto)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 03 | `sku_codigo` | `VARCHAR(50)` | NO | UQ | UNIQUE | Sin Dato Personal | Código SKU único de la presentación comercial del producto. |
| 04 | `codigo_barras_ean13` | `VARCHAR(14)` | NO | UQ | UNIQUE | Sin Dato Personal | Código de barras estándar internacional EAN-13 para escaneo en CEDIS. |
| 05 | `nombre_presentacion` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Ej: Tono 210 Warm Nude 30ml. |
| 06 | `contenido_neto_gramos_ml` | `DECIMAL(8,2)` / `NUMERIC(8,2)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a contenido neto gramos ml. |
| 07 | `unidad_medida` | `VARCHAR(10)` | NO | - | CHK: `unidad_medida IN ('ML', 'G', 'OZ', 'PZ')` | Sin Dato Personal | Clasificación controlada de dominio para unidad medida. |
| 08 | `precio_base_menudeo` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `precio_base_menudeo > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a precio base menudeo. |
| 09 | `costo_estandar_compra` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo estandar compra. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_variantes_sku PRIMARY KEY CLUSTERED (id_variante_sku)`
- `CONSTRAINT UQ_catalogo_vsku_codigo UNIQUE (sku_codigo)`
- `CONSTRAINT UQ_catalogo_vsku_ean UNIQUE (codigo_barras_ean13)`
- `CONSTRAINT FK_catalogo_vsku_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto)`

**Índices Secundarios Explícitos:**
- `IX_catalogo_variantes_prod_act (producto, activo)`

---

### FICHA TÉCNICA 036: `catalogo.tonos_variante`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Tono específico, nombre comercial y código hexadecimal del color.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 5

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tono_variante` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.tonos_variante`. |
| 02 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 03 | `subtono` | `BIGINT` | NO | **FK** | FK → `catalogo.subtonos_maquillaje(id_subtono)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.subtonos_maquillaje(id_subtono)`. |
| 04 | `acabado` | `BIGINT` | NO | **FK** | FK → `catalogo.acabados_maquillaje(id_acabado)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.acabados_maquillaje(id_acabado)`. |
| 05 | `codigo_tono_color` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo tono color. |
| 06 | `nombre_tono` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre tono. |
| 07 | `color_hexadecimal` | `VARCHAR(7)` | NO | - | CHK: `color_hexadecimal LIKE '#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]'` | Sin Dato Personal | Atributo de dominio que almacena el valor de color hexadecimal en `catalogo.tonos_variante`. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_tonos_variante PRIMARY KEY CLUSTERED (id_tono_variante)`
- `CONSTRAINT UQ_catalogo_tv_sku UNIQUE (variante_sku)`
- `CONSTRAINT FK_catalogo_tv_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`
- `CONSTRAINT FK_catalogo_tv_subtono FOREIGN KEY (subtono) REFERENCES catalogo.subtonos_maquillaje(id_subtono)`
- `CONSTRAINT FK_catalogo_tv_acabado FOREIGN KEY (acabado) REFERENCES catalogo.acabados_maquillaje(id_acabado)`

---

### FICHA TÉCNICA 037: `catalogo.ingredientes_inci`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Nomenclatura Internacional de Ingredientes Cosméticos e índice comedogénico.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_ingrediente` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.ingredientes_inci`. |
| 02 | `codigo_cas` | `VARCHAR(30)` | SÍ | - | - | Sin Dato Personal | Identificador Chemical Abstracts Service. |
| 03 | `nombre_inci` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | UQ | UNIQUE | Sin Dato Personal | Ej: Niacinamide, Hyaluronic Acid, Retinol. |
| 04 | `nombre_comun` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre comun. |
| 05 | `funcion_principal` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de funcion principal en `catalogo.ingredientes_inci`. |
| 06 | `es_comedogenico` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es comedogenico. |
| 07 | `indice_comedogenico` | `INT` | NO | - | CHK: `indice_comedogenico BETWEEN 0 AND 5` | Sin Dato Personal | Atributo de dominio que almacena el valor de indice comedogenico en `catalogo.ingredientes_inci`. |
| 08 | `es_alergeno_frecuente` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | **Dato Personal Sensible (Salud)** | Indicador booleano que señala si se cumple la condición: es alergeno frecuente. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_ingredientes_inci PRIMARY KEY CLUSTERED (id_ingrediente)`
- `CONSTRAINT UQ_catalogo_inci_nombre UNIQUE (nombre_inci)`

---

### FICHA TÉCNICA 038: `catalogo.alergenos_ingrediente`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Clasificación de riesgo de reacciones alérgicas por componente químico.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_alergeno` | `BIGINT` | NO | **PK** (ID) | - | **Dato Personal Sensible (Salud)** | Llave primaria autoincrementable única de la entidad `catalogo.alergenos_ingrediente`. |
| 02 | `ingrediente` | `BIGINT` | NO | **FK** | FK → `catalogo.ingredientes_inci(id_ingrediente)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.ingredientes_inci(id_ingrediente)`. |
| 03 | `nombre_alergeno` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | **Dato Personal Sensible (Salud)** | Denominación o nombre descriptivo de nombre alergeno. |
| 04 | `clasificacion_riesgo` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `clasificacion_riesgo IN (N'BAJO', N'MEDIO', N'ALTO', N'MUY_SEVERO')` | Sin Dato Personal | Clasificación controlada de dominio para clasificacion riesgo. |
| 05 | `advertencia_etiqueta` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de advertencia etiqueta en `catalogo.alergenos_ingrediente`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_alergenos_ingrediente PRIMARY KEY CLUSTERED (id_alergeno)`
- `CONSTRAINT FK_catalogo_ai_ingrediente FOREIGN KEY (ingrediente) REFERENCES catalogo.ingredientes_inci(id_ingrediente)`

**Índices Secundarios Explícitos:**
- `IX_catalogo_alergenos_ing_riesgo (ingrediente, clasificacion_riesgo)`

---

### FICHA TÉCNICA 039: `catalogo.formula_ingredientes`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$ (4FN)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Composición porcentual y principios activos ordenados por concentración.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_formula_ingrediente` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.formula_ingredientes`. |
| 02 | `producto` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.productos_maestros(id_producto)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 03 | `ingrediente` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.ingredientes_inci(id_ingrediente)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.ingredientes_inci(id_ingrediente)`. |
| 04 | `orden_en_etiqueta` | `INT` | NO | - | - | Sin Dato Personal | Por norma sanitaria COFEPRIS se ordenan de mayor a menor concentración. |
| 05 | `porcentaje_concentracion` | `DECIMAL(5,2)` / `NUMERIC(5,2)` | SÍ | - | CHK: `porcentaje_concentracion IS NULL OR (porcentaje_concentracion BETWEEN 0.01 AND 100.00)` | Sin Dato Personal | Valor porcentual (%) aplicado para porcentaje concentracion. |
| 06 | `es_principio_activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es principio activo. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_formula_ingredientes PRIMARY KEY CLUSTERED (id_formula_ingrediente)`
- `CONSTRAINT UQ_catalogo_fi_producto_ingrediente UNIQUE (producto, ingrediente)`
- `CONSTRAINT FK_catalogo_fi_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto)`
- `CONSTRAINT FK_catalogo_fi_ingrediente FOREIGN KEY (ingrediente) REFERENCES catalogo.ingredientes_inci(id_ingrediente)`

**Índices Secundarios Explícitos:**
- `IX_catalogo_formula_prod_ing (producto, ingrediente)`

---

### FICHA TÉCNICA 040: `catalogo.registros_sanitarios_cofepris`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Regulatoria Legal**
- **Descripción Operativa del Negocio:** Folios oficiales de registro sanitario COFEPRIS y fechas de vigencia.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_registro_sanitario` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.registros_sanitarios_cofepris`. |
| 02 | `producto` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.productos_maestros(id_producto)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 03 | `numero_registro_sanitario` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero registro sanitario. |
| 04 | `folio_ingreso_tramite` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Número de folio único de control operativo (folio ingreso tramite). |
| 05 | `fecha_emision` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha emision. |
| 06 | `fecha_vencimiento` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha vencimiento. |
| 07 | `estatus_regulatorio` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `estatus_regulatorio IN (N'VIGENTE', N'EN_RENOVACION', N'SUSPENDIDO', N'VENCIDO')` | Sin Dato Personal | Clasificación controlada de dominio para estatus regulatorio. |
| 08 | `documento_oficial_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (documento oficial url). |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_registros_sanitarios_cofepris PRIMARY KEY CLUSTERED (id_registro_sanitario)`
- `CONSTRAINT UQ_catalogo_cof_numero UNIQUE (numero_registro_sanitario)`
- `CONSTRAINT UQ_catalogo_cof_producto UNIQUE (producto)`
- `CONSTRAINT FK_catalogo_cof_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto)`

---

### FICHA TÉCNICA 041: `catalogo.advertencias_contraindicaciones`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Médica / Sanitaria**
- **Descripción Operativa del Negocio:** Contraindicaciones de uso (embarazo, fotosensibilidad, contacto ocular).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_advertencia` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.advertencias_contraindicaciones`. |
| 02 | `producto` | `BIGINT` | NO | **FK** | FK → `catalogo.productos_maestros(id_producto)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 03 | `tipo_advertencia` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `tipo_advertencia IN (N'EMBARAZO_LACTANCIA', N'FOTOSENSIBLE', N'USO_EXTERNO_EXCLUSIVO', N'HERIDAS_ABIERTAS', N'EVITAR_OJOS')` | Sin Dato Personal | Clasificación controlada de dominio para tipo advertencia. |
| 04 | `texto_advertencia` | `NVARCHAR(350)` / `VARCHAR(350)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de texto advertencia en `catalogo.advertencias_contraindicaciones`. |
| 05 | `medida_en_caso_ingestion` | `NVARCHAR(350)` / `VARCHAR(350)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de medida en caso ingestion en `catalogo.advertencias_contraindicaciones`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_advertencias_contraindicaciones PRIMARY KEY CLUSTERED (id_advertencia)`
- `CONSTRAINT FK_catalogo_adv_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto)`

---

### FICHA TÉCNICA 042: `catalogo.multimedia_variantes`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Fotos oficiales, muestras en piel (swatches) y videos demostrativos.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_multimedia` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.multimedia_variantes`. |
| 02 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 03 | `tipo_archivo` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `tipo_archivo IN (N'FOTO_FRONTAL', N'FOTO_SWATCH_PIEL', N'FOTO_EMPAQUE', N'VIDEO_TUTORIAL')` | Sin Dato Personal | Clasificación controlada de dominio para tipo archivo. |
| 04 | `url_recurso` | `NVARCHAR(350)` / `VARCHAR(350)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de url recurso en `catalogo.multimedia_variantes`. |
| 05 | `texto_alternativo_accesibilidad` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de texto alternativo accesibilidad en `catalogo.multimedia_variantes`. |
| 06 | `numero_orden` | `INT` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero orden. |
| 07 | `es_imagen_principal` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es imagen principal. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_multimedia_variantes PRIMARY KEY CLUSTERED (id_multimedia)`
- `CONSTRAINT UQ_catalogo_mv_sku_orden UNIQUE (variante_sku, numero_orden)`
- `CONSTRAINT FK_catalogo_mv_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 043: `catalogo.kits_sets`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Sets armados de rutina o combos promocionales.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_kit` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.kits_sets`. |
| 02 | `codigo_kit` | `NVARCHAR(40)` / `VARCHAR(40)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo kit. |
| 03 | `nombre_kit` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre kit. |
| 04 | `descripcion` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `descuento_porcentual_kit` | `DECIMAL(5,2)` / `NUMERIC(5,2)` | NO | - | CHK: `descuento_porcentual_kit BETWEEN 0.00 AND 80.00` | Sin Dato Personal | Valor porcentual (%) aplicado para descuento porcentual kit. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_kits_sets PRIMARY KEY CLUSTERED (id_kit)`
- `CONSTRAINT UQ_catalogo_kit_codigo UNIQUE (codigo_kit)`

---

### FICHA TÉCNICA 044: `catalogo.kits_items`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Desglose de SKUs y piezas que componen cada kit.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_kit_item` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.kits_items`. |
| 02 | `kit` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.kits_sets(id_kit)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.kits_sets(id_kit)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad_unidades` | `INT` | NO | - | CHK: `cantidad_unidades >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad unidades. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_kits_items PRIMARY KEY CLUSTERED (id_kit_item)`
- `CONSTRAINT UQ_catalogo_ki_kit_sku UNIQUE (kit, variante_sku)`
- `CONSTRAINT FK_catalogo_ki_kit FOREIGN KEY (kit) REFERENCES catalogo.kits_sets(id_kit)`
- `CONSTRAINT FK_catalogo_ki_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 045: `catalogo.productos_relacionados`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Relaciones de cross-selling (sustitutos, complementarios, paso siguiente).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_producto_relacionado` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.productos_relacionados`. |
| 02 | `producto_origen` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.productos_maestros(id_producto)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 03 | `producto_destino` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.productos_maestros(id_producto)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 04 | `tipo_relacion` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `tipo_relacion IN (N'COMPLEMENTARIO', N'SUSTITUTO', N'PASO_SIGUIENTE_RUTINA')` | Sin Dato Personal | Clasificación controlada de dominio para tipo relacion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_productos_relacionados PRIMARY KEY CLUSTERED (id_producto_relacionado)`
- `CONSTRAINT UQ_catalogo_pr_origen_destino UNIQUE (producto_origen, producto_destino)`
- `CONSTRAINT FK_catalogo_pr_origen FOREIGN KEY (producto_origen) REFERENCES catalogo.productos_maestros(id_producto)`
- `CONSTRAINT FK_catalogo_pr_destino FOREIGN KEY (producto_destino) REFERENCES catalogo.productos_maestros(id_producto)`

---

### FICHA TÉCNICA 046: `catalogo.historial_precios_base`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Bitácora
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Historial de variaciones de precio base y justificación comercial.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_historial_precio` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `catalogo.historial_precios_base`. |
| 02 | `variante_sku` | `BIGINT` | NO | **FK** | FK → `catalogo.variantes_sku(id_variante_sku)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 03 | `precio_anterior` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a precio anterior. |
| 04 | `precio_nuevo` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a precio nuevo. |
| 05 | `motivo_cambio` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para motivo cambio. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_catalogo_historial_precios_base PRIMARY KEY CLUSTERED (id_historial_precio)`
- `CONSTRAINT FK_catalogo_hp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 047: `comunidad.rutinas_belleza`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Rutinas de cuidado de la piel creadas por clientes o dermatólogos.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_rutina` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `comunidad.rutinas_belleza`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `nombre_rutina` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Ej: Rutina Facial Mañana Anti-Acné. |
| 04 | `momento_dia` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `momento_dia IN (N'MAÑANA', N'NOCHE', N'SEMANAL')` | Sin Dato Personal | Atributo de dominio que almacena el valor de momento dia en `comunidad.rutinas_belleza`. |
| 05 | `es_publica` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es publica. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_comunidad_rutinas_belleza PRIMARY KEY CLUSTERED (id_rutina)`
- `CONSTRAINT FK_comunidad_rb_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 048: `comunidad.rutinas_pasos`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Fases cronológicas de la rutina (Limpieza, Sérum, Hidratación, FPS).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_rutina_paso` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `comunidad.rutinas_pasos`. |
| 02 | `rutina` | `BIGINT` | NO | **FK**, UQ | FK → `comunidad.rutinas_belleza(id_rutina)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `comunidad.rutinas_belleza(id_rutina)`. |
| 03 | `numero_paso` | `INT` | NO | UQ | CHK: `numero_paso BETWEEN 1 AND 15`; UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero paso. |
| 04 | `nombre_fase` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | 1 Limpieza, 2 Tónico, 3 Sérum, 4 Crema, 5 Protector Solar. |
| 05 | `instrucciones_aplicacion` | `NVARCHAR(255)` / `VARCHAR(255)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de instrucciones aplicacion en `comunidad.rutinas_pasos`. |
| 06 | `tiempo_espera_segundos` | `INT` | NO | - | DEF: `60` | Sin Dato Personal | Atributo de dominio que almacena el valor de tiempo espera segundos en `comunidad.rutinas_pasos`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_comunidad_rutinas_pasos PRIMARY KEY CLUSTERED (id_rutina_paso)`
- `CONSTRAINT UQ_comunidad_rp_rutina_paso UNIQUE (rutina, numero_paso)`
- `CONSTRAINT FK_comunidad_rp_rutina FOREIGN KEY (rutina) REFERENCES comunidad.rutinas_belleza(id_rutina)`

---

### FICHA TÉCNICA 049: `comunidad.rutinas_productos`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** SKUs asignados a cada paso de la rutina.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_rutina_producto` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `comunidad.rutinas_productos`. |
| 02 | `rutina_paso` | `BIGINT` | NO | **FK**, UQ | FK → `comunidad.rutinas_pasos(id_rutina_paso)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `comunidad.rutinas_pasos(id_rutina_paso)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `es_producto_principal` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es producto principal. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_comunidad_rutinas_productos PRIMARY KEY CLUSTERED (id_rutina_producto)`
- `CONSTRAINT UQ_comunidad_rprod_paso_sku UNIQUE (rutina_paso, variante_sku)`
- `CONSTRAINT FK_comunidad_rprod_paso FOREIGN KEY (rutina_paso) REFERENCES comunidad.rutinas_pasos(id_rutina_paso)`
- `CONSTRAINT FK_comunidad_rprod_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 050: `comunidad.listas_deseos`
- **Autor Responsable:** Integrante 1 (Tablas 001–050)
- **Módulo de Pertenencia:** Submódulo 1: Identidad, RBAC, Perfil Dermo-Salud, Catálogo y COFEPRIS
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Wishlists de productos favoritos guardados por el cliente.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_lista_deseos` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `comunidad.listas_deseos`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `nombre_lista` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Ej: Mis labiales favoritos, Skin Care Deseado. |
| 04 | `es_publica` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es publica. |
| 05 | `token_compartir` | `NVARCHAR(64)` / `VARCHAR(64)` | SÍ | - | - | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a token compartir. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_comunidad_listas_deseos PRIMARY KEY CLUSTERED (id_lista_deseos)`
- `CONSTRAINT FK_comunidad_ld_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 051: `ventas.tipos_descuento`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (9)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Reglas de descuento (Porcentaje, Monto Fijo, Envío Gratis, 2x1).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tipo_descuento` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.tipos_descuento`. |
| 02 | `codigo_descuento` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo descuento. |
| 03 | `nombre` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Porcentual, Monto Fijo, 2x1, Envío Gratis. |
| 04 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_tipos_descuento PRIMARY KEY CLUSTERED (id_tipo_descuento)`
- `CONSTRAINT UQ_ventas_td_codigo UNIQUE (codigo_descuento)`

---

### FICHA TÉCNICA 052: `ventas.estados_orden`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (10)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Flujo de estados de pedido (Pendiente, Pagada, Preparando, Entregada).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_estado_orden` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.estados_orden`. |
| 02 | `codigo_estado` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo estado. |
| 03 | `nombre_estado` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | PENDIENTE_PAGO, PAGADA, EN_PREPARACION_WMS, EN_TRANSITO, ENTREGADA, CANCELADA, REEMBOLSADA. |
| 04 | `descripcion` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `es_terminal` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es terminal. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_estados_orden PRIMARY KEY CLUSTERED (id_estado_orden)`
- `CONSTRAINT UQ_ventas_eo_codigo UNIQUE (codigo_estado)`

---

### FICHA TÉCNICA 053: `ventas.motivos_cancelacion_orden`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (11)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Razones documentadas de anulación de pedidos.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_motivo_cancelacion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.motivos_cancelacion_orden`. |
| 02 | `codigo_motivo` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo motivo. |
| 03 | `descripcion_motivo` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion motivo. |
| 04 | `es_atribuible_cliente` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es atribuible cliente. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_motivos_cancelacion_orden PRIMARY KEY CLUSTERED (id_motivo_cancelacion)`
- `CONSTRAINT UQ_ventas_mc_codigo UNIQUE (codigo_motivo)`

---

### FICHA TÉCNICA 054: `ventas.carritos`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Carritos de compra en línea persistentes por cliente.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_carrito` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.carritos`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `token_sesion_carrito` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | UQ | UNIQUE | Confidencial (Criptográfico) | Dato criptográfico, fiscal o de control técnico correspondiente a token sesion carrito. |
| 04 | `fecha_ultima_actividad` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha ultima actividad. |
| 05 | `convertido_a_orden` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de convertido a orden en `ventas.carritos`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_carritos PRIMARY KEY CLUSTERED (id_carrito)`
- `CONSTRAINT UQ_ventas_carr_token UNIQUE (token_sesion_carrito)`
- `CONSTRAINT FK_ventas_carr_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 055: `ventas.items_carrito`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Artículos, variantes y cantidades agregadas al carrito.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_item_carrito` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.items_carrito`. |
| 02 | `carrito` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.carritos(id_carrito)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.carritos(id_carrito)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad` | `INT` | NO | - | CHK: `cantidad >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad. |
| 05 | `precio_unitario_capturado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a precio unitario capturado. |
| 06 | `fecha_agregado` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha agregado. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_items_carrito PRIMARY KEY CLUSTERED (id_item_carrito)`
- `CONSTRAINT UQ_ventas_ic_carrito_sku UNIQUE (carrito, variante_sku)`
- `CONSTRAINT FK_ventas_ic_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito)`
- `CONSTRAINT FK_ventas_ic_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 056: `ventas.carritos_abandonados_seguimiento`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Registro para campañas de recuperación de carritos sin finalizar.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_seguimiento_carrito` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.carritos_abandonados_seguimiento`. |
| 02 | `carrito` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.carritos(id_carrito)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.carritos(id_carrito)`. |
| 03 | `correo_recordatorio_enviado` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de correo recordatorio enviado en `ventas.carritos_abandonados_seguimiento`. |
| 04 | `fecha_envio_recordatorio` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha envio recordatorio. |
| 05 | `recuperado` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de recuperado en `ventas.carritos_abandonados_seguimiento`. |
| 06 | `monto_estimado_recuperable` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto estimado recuperable. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_carritos_abandonados PRIMARY KEY CLUSTERED (id_seguimiento_carrito)`
- `CONSTRAINT UQ_ventas_cas_carrito UNIQUE (carrito)`
- `CONSTRAINT FK_ventas_cas_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito)`

---

### FICHA TÉCNICA 057: `ventas.planes_suscripcion`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Planes recurrentes (Beauty Box mensual, reposición de dermocosmética).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_plan_suscripcion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.planes_suscripcion`. |
| 02 | `codigo_plan` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo plan. |
| 03 | `nombre_plan` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Ej: Beauty Box Salud Piel, Resurtido Sérums Ácido Hialurónico. |
| 04 | `descripcion` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `precio_recurrente_base` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `precio_recurrente_base > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a precio recurrente base. |
| 06 | `descuento_porcentual_fidelidad` | `DECIMAL(5,2)` / `NUMERIC(5,2)` | NO | - | DEF: `10.00` | Sin Dato Personal | Valor porcentual (%) aplicado para descuento porcentual fidelidad. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_planes_suscripcion PRIMARY KEY CLUSTERED (id_plan_suscripcion)`
- `CONSTRAINT UQ_ventas_ps_codigo UNIQUE (codigo_plan)`

---

### FICHA TÉCNICA 058: `ventas.frecuencias_suscripcion`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (12)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Frecuencias de entrega (Mensual, Bimestral, Trimestral).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_frecuencia_suscripcion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.frecuencias_suscripcion`. |
| 02 | `codigo_frecuencia` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo frecuencia. |
| 03 | `nombre` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Mensual, Bimestral, Trimestral. |
| 04 | `intervalo_dias` | `INT` | NO | - | CHK: `intervalo_dias BETWEEN 15 AND 180` | Sin Dato Personal | Valor numérico cuantitativo que registra intervalo dias. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_frecuencias_suscripcion PRIMARY KEY CLUSTERED (id_frecuencia_suscripcion)`
- `CONSTRAINT UQ_ventas_fs_codigo UNIQUE (codigo_frecuencia)`

---

### FICHA TÉCNICA 059: `ventas.suscripciones_cliente`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal / Financiero**
- **Descripción Operativa del Negocio:** Suscripciones activas con cargo automático y periodicidad.
- **Total de Columnas:** 17 · **Restricciones Nombradas:** 7

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_suscripcion_cliente` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.suscripciones_cliente`. |
| 02 | `folio_suscripcion` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio suscripcion). |
| 03 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 04 | `plan_suscripcion` | `BIGINT` | NO | **FK** | FK → `ventas.planes_suscripcion(id_plan_suscripcion)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.planes_suscripcion(id_plan_suscripcion)`. |
| 05 | `frecuencia_suscripcion` | `BIGINT` | NO | **FK** | FK → `ventas.frecuencias_suscripcion(id_frecuencia_suscripcion)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.frecuencias_suscripcion(id_frecuencia_suscripcion)`. |
| 06 | `direccion_entrega` | `BIGINT` | NO | **FK** | FK → `clientes.direcciones(id_direccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.direcciones(id_direccion)`. |
| 07 | `metodo_tokenizado` | `BIGINT` | NO | **FK** | FK → `clientes.metodos_pago_tokenizados(id_metodo_tokenizado)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.metodos_pago_tokenizados(id_metodo_tokenizado)`. |
| 08 | `fecha_inicio` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha inicio. |
| 09 | `proxima_fecha_cobro` | `DATE` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de proxima fecha cobro en `ventas.suscripciones_cliente`. |
| 10 | `estado_suscripcion` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `estado_suscripcion IN (N'ACTIVA', N'PAUSADA', N'CANCELADA', N'PAGO_FALLIDO')` | Sin Dato Personal | Clasificación controlada de dominio para estado suscripcion. |
| 11 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 12 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 13 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 14 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 15 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 16 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 17 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_suscripciones_cliente PRIMARY KEY CLUSTERED (id_suscripcion_cliente)`
- `CONSTRAINT UQ_ventas_sc_folio UNIQUE (folio_suscripcion)`
- `CONSTRAINT FK_ventas_sc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_ventas_sc_plan FOREIGN KEY (plan_suscripcion) REFERENCES ventas.planes_suscripcion(id_plan_suscripcion)`
- `CONSTRAINT FK_ventas_sc_frecuencia FOREIGN KEY (frecuencia_suscripcion) REFERENCES ventas.frecuencias_suscripcion(id_frecuencia_suscripcion)`
- `CONSTRAINT FK_ventas_sc_direccion FOREIGN KEY (direccion_entrega) REFERENCES clientes.direcciones(id_direccion)`
- `CONSTRAINT FK_ventas_sc_metodo FOREIGN KEY (metodo_tokenizado) REFERENCES clientes.metodos_pago_tokenizados(id_metodo_tokenizado)`

**Índices Secundarios Explícitos:**
- `IX_ventas_suscrip_cliente_est (cliente, estado_suscripcion)`

---

### FICHA TÉCNICA 060: `ventas.suscripciones_items`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Productos incluidos a precio congelado en la suscripción.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_suscripcion_item` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.suscripciones_items`. |
| 02 | `suscripcion_cliente` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.suscripciones_cliente(id_suscripcion_cliente)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.suscripciones_cliente(id_suscripcion_cliente)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad` | `INT` | NO | - | CHK: `cantidad >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad. |
| 05 | `precio_congelado_suscripcion` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a precio congelado suscripcion. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_suscripciones_items PRIMARY KEY CLUSTERED (id_suscripcion_item)`
- `CONSTRAINT UQ_ventas_si_susc_sku UNIQUE (suscripcion_cliente, variante_sku)`
- `CONSTRAINT FK_ventas_si_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente)`
- `CONSTRAINT FK_ventas_si_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 061: `ventas.suscripciones_calendario_entregas`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Cronograma de despachos periódicos proyectados.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_entrega_programada` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.suscripciones_calendario_entregas`. |
| 02 | `suscripcion_cliente` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.suscripciones_cliente(id_suscripcion_cliente)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.suscripciones_cliente(id_suscripcion_cliente)`. |
| 03 | `fecha_programada_despacho` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha programada despacho. |
| 04 | `numero_ciclo_periodo` | `INT` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero ciclo periodo. |
| 05 | `estado_despacho` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `estado_despacho IN (N'PROGRAMADO', N'COBRADO_PROCESANDO', N'DESPACHADO', N'OMITIDO_POR_CLIENTE')` | Sin Dato Personal | Clasificación controlada de dominio para estado despacho. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_suscripciones_cal PRIMARY KEY CLUSTERED (id_entrega_programada)`
- `CONSTRAINT UQ_ventas_sce_susc_ciclo UNIQUE (suscripcion_cliente, numero_ciclo_periodo)`
- `CONSTRAINT FK_ventas_sce_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente)`

**Índices Secundarios Explícitos:**
- `IX_ventas_suscrip_cal_susc_est (suscripcion_cliente, estado_despacho)`

---

### FICHA TÉCNICA 062: `ventas.suscripciones_bitacora_estados`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Bitácora
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Registro histórico de pausas, reactivaciones y cancelaciones.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_bitacora_suscripcion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.suscripciones_bitacora_estados`. |
| 02 | `suscripcion_cliente` | `BIGINT` | NO | **FK** | FK → `ventas.suscripciones_cliente(id_suscripcion_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.suscripciones_cliente(id_suscripcion_cliente)`. |
| 03 | `estado_anterior` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para estado anterior. |
| 04 | `estado_nuevo` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para estado nuevo. |
| 05 | `motivo_cambio` | `NVARCHAR(255)` / `VARCHAR(255)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para motivo cambio. |
| 06 | `fecha_cambio` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha cambio. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_suscripciones_bitacora PRIMARY KEY CLUSTERED (id_bitacora_suscripcion)`
- `CONSTRAINT FK_ventas_sbe_suscripcion FOREIGN KEY (suscripcion_cliente) REFERENCES ventas.suscripciones_cliente(id_suscripcion_cliente)`

---

### FICHA TÉCNICA 063: `ventas.regalos_por_compra_gwp`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Promociones de muestras gratis (Gift With Purchase) por monto mínimo.
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_regalo_compra` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.regalos_por_compra_gwp`. |
| 02 | `codigo_promocion_gwp` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo promocion gwp. |
| 03 | `nombre_promocion` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Ej: Muestra de Sérum Gratis en compras > $899. |
| 04 | `monto_minimo_requerido` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto minimo requerido. |
| 05 | `variante_sku_regalo` | `BIGINT` | NO | **FK** | FK → `catalogo.variantes_sku(id_variante_sku)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 06 | `fecha_inicio` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha inicio. |
| 07 | `fecha_fin` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha fin. |
| 08 | `stock_maximo_regalos` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra stock maximo regalos. |
| 09 | `regalos_entregados` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de regalos entregados en `ventas.regalos_por_compra_gwp`. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_regalos_gwp PRIMARY KEY CLUSTERED (id_regalo_compra)`
- `CONSTRAINT UQ_ventas_gwp_codigo UNIQUE (codigo_promocion_gwp)`
- `CONSTRAINT FK_ventas_gwp_sku FOREIGN KEY (variante_sku_regalo) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 064: `ventas.ordenes`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal / Financiero**
- **Descripción Operativa del Negocio:** Encabezado principal de la orden de compra con subtotales y totales.
- **Total de Columnas:** 22 · **Restricciones Nombradas:** 7

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes`. |
| 02 | `folio_orden` | `NVARCHAR(40)` / `VARCHAR(40)` | NO | UQ | UNIQUE | Sin Dato Personal | Folio comercial único que identifica la orden de compra del cliente. |
| 03 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 04 | `estado_orden` | `BIGINT` | NO | **FK** | FK → `ventas.estados_orden(id_estado_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.estados_orden(id_estado_orden)`. |
| 05 | `motivo_cancelacion` | `BIGINT` | SÍ | **FK** | FK → `ventas.motivos_cancelacion_orden(id_motivo_cancelacion)` | Sin Dato Personal | Referencia al catálogo de motivos cuando una orden de compra es cancelada. |
| 06 | `direccion_envio` | `BIGINT` | NO | **FK** | FK → `clientes.direcciones(id_direccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.direcciones(id_direccion)`. |
| 07 | `direccion_facturacion` | `BIGINT` | SÍ | **FK** | FK → `clientes.direcciones(id_direccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.direcciones(id_direccion)`. |
| 08 | `fecha_orden` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha orden. |
| 09 | `subtotal_bruto` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `subtotal_bruto >= 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a subtotal bruto. |
| 10 | `total_descuentos` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | DEF: `0.00` | Sin Dato Personal | Importe monetario en MXN correspondiente a total descuentos. |
| 11 | `total_impuestos_iva` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `total_impuestos_iva >= 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a total impuestos iva. |
| 12 | `costo_envio` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | DEF: `0.00` | Sin Dato Personal | Importe monetario en MXN correspondiente a costo envio. |
| 13 | `total_neto` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `total_neto > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a total neto. |
| 14 | `moneda` | `VARCHAR(3)` | NO | - | DEF: `'MXN'` | Sin Dato Personal | Clasificación controlada de dominio para moneda. |
| 15 | `requiere_factura` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: requiere factura. |
| 16 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 17 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 18 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 19 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 20 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 21 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 22 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes PRIMARY KEY CLUSTERED (id_orden)`
- `CONSTRAINT UQ_ventas_ord_folio UNIQUE (folio_orden)`
- `CONSTRAINT FK_ventas_ord_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_ventas_ord_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden)`
- `CONSTRAINT FK_ventas_ord_direnvio FOREIGN KEY (direccion_envio) REFERENCES clientes.direcciones(id_direccion)`
- `CONSTRAINT FK_ventas_ord_dirfact FOREIGN KEY (direccion_facturacion) REFERENCES clientes.direcciones(id_direccion)`
- `CONSTRAINT FK_ventas_ord_motivo_cancel FOREIGN KEY (motivo_cancelacion) REFERENCES ventas.motivos_cancelacion_orden(id_motivo_cancelacion)`

**Índices Secundarios Explícitos:**
- `IX_ventas_ordenes_cliente_fecha (cliente, fecha_orden)`
- `IX_ventas_ordenes_estado_activo (estado_orden, activo)`

---

### FICHA TÉCNICA 065: `ventas.ordenes_detalles`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Partidas de productos comprados, precios históricos e IVA desglosado.
- **Total de Columnas:** 19 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes_detalles`. |
| 02 | `orden` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.ordenes(id_orden)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK** | FK → `catalogo.variantes_sku(id_variante_sku)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `numero_partida` | `INT` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero partida. |
| 05 | `cantidad_comprada` | `INT` | NO | - | CHK: `cantidad_comprada >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad comprada. |
| 06 | `precio_unitario_venta` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a precio unitario venta. |
| 07 | `costo_unitario_historico` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo unitario historico. |
| 08 | `monto_descuento_aplicado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | DEF: `0.00` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto descuento aplicado. |
| 09 | `subtotal_linea` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a subtotal linea. |
| 10 | `tasa_iva_porcentual` | `DECIMAL(5,2)` / `NUMERIC(5,2)` | NO | - | DEF: `16.00` | Sin Dato Personal | Valor porcentual (%) aplicado para tasa iva porcentual. |
| 11 | `monto_iva_linea` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto iva linea. |
| 12 | `total_linea` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a total linea. |
| 13 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 14 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 15 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 16 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 17 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 18 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 19 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes_detalles PRIMARY KEY CLUSTERED (id_orden_detalle)`
- `CONSTRAINT UQ_ventas_od_partida UNIQUE (orden, numero_partida)`
- `CONSTRAINT FK_ventas_od_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_ventas_od_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

**Índices Secundarios Explícitos:**
- `IX_ventas_ordenes_det_orden_sku (orden, variante_sku)`

---

### FICHA TÉCNICA 066: `ventas.ordenes_historial_estados`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Bitácora
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Trazabilidad temporal de cada cambio de estatus de la orden.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_historial` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes_historial_estados`. |
| 02 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `estado_orden` | `BIGINT` | NO | **FK** | FK → `ventas.estados_orden(id_estado_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.estados_orden(id_estado_orden)`. |
| 04 | `comentario_operativo` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de comentario operativo en `ventas.ordenes_historial_estados`. |
| 05 | `fecha_registro` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha registro. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes_historial PRIMARY KEY CLUSTERED (id_orden_historial)`
- `CONSTRAINT FK_ventas_ohe_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_ventas_ohe_estado FOREIGN KEY (estado_orden) REFERENCES ventas.estados_orden(id_estado_orden)`

---

### FICHA TÉCNICA 067: `ventas.ordenes_splits_almacen`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** División de una orden cuando se surte desde múltiples almacenes.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_split` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes_splits_almacen`. |
| 02 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `sub_folio_split` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | UQ | UNIQUE | Sin Dato Personal | Ej: ORD-9921-A (CEDIS Norte), ORD-9921-B (CEDIS Centro). |
| 04 | `estado_split` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `estado_split IN (N'PENDIENTE', N'ASIGNADO', N'SURTIENDO', N'EMPAQUETADO', N'EN_RUTA')` | Sin Dato Personal | Clasificación controlada de dominio para estado split. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes_splits PRIMARY KEY CLUSTERED (id_orden_split)`
- `CONSTRAINT UQ_ventas_osa_subfolio UNIQUE (sub_folio_split)`
- `CONSTRAINT FK_ventas_osa_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`

---

### FICHA TÉCNICA 068: `ventas.ordenes_impuestos`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal**
- **Descripción Operativa del Negocio:** Desglose oficial de impuestos gravados (IVA 16%, IEPS).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_impuesto` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes_impuestos`. |
| 02 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `tipo_impuesto` | `VARCHAR(10)` | NO | - | CHK: `tipo_impuesto IN ('002_IVA', '003_IEPS')` | Sin Dato Personal | Clasificación controlada de dominio para tipo impuesto. |
| 04 | `tasa_o_cuota` | `DECIMAL(6,4)` / `NUMERIC(6,4)` | NO | - | - | Sin Dato Personal | Valor porcentual (%) aplicado para tasa o cuota. |
| 05 | `base_gravable` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de base gravable en `ventas.ordenes_impuestos`. |
| 06 | `importe_impuesto` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a importe impuesto. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes_impuestos PRIMARY KEY CLUSTERED (id_orden_impuesto)`
- `CONSTRAINT FK_ventas_oi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`

---

### FICHA TÉCNICA 069: `ventas.ordenes_descuentos`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Descuentos y cupones aplicados a nivel de orden.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_descuento` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes_descuentos`. |
| 02 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `tipo_descuento` | `BIGINT` | NO | **FK** | FK → `ventas.tipos_descuento(id_tipo_descuento)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.tipos_descuento(id_tipo_descuento)`. |
| 04 | `codigo_promocion_aplicado` | `NVARCHAR(40)` / `VARCHAR(40)` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo promocion aplicado. |
| 05 | `monto_descontado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto descontado. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes_descuentos PRIMARY KEY CLUSTERED (id_orden_descuento)`
- `CONSTRAINT FK_ventas_odesc_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_ventas_odesc_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento)`

---

### FICHA TÉCNICA 070: `ventas.ordenes_notas_instrucciones`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Indicaciones para paquetería, empaque ecológico y dedicatorias de regalo.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_nota` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.ordenes_notas_instrucciones`. |
| 02 | `orden` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.ordenes(id_orden)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `es_para_regalo` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es para regalo. |
| 04 | `mensaje_tarjeta_regalo` | `NVARCHAR(300)` / `VARCHAR(300)` | SÍ | - | - | Dato Financiero / Patrimonial | Atributo de dominio que almacena el valor de mensaje tarjeta regalo en `ventas.ordenes_notas_instrucciones`. |
| 05 | `instrucciones_entrega_repartidor` | `NVARCHAR(300)` / `VARCHAR(300)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de instrucciones entrega repartidor en `ventas.ordenes_notas_instrucciones`. |
| 06 | `empaque_especial_ecologico` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: empaque especial ecologico. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_ordenes_notas PRIMARY KEY CLUSTERED (id_orden_nota)`
- `CONSTRAINT UQ_ventas_oni_orden UNIQUE (orden)`
- `CONSTRAINT FK_ventas_oni_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`

---

### FICHA TÉCNICA 071: `ventas.reservas_temporales_stock`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Bloqueo temporal de inventario durante el proceso de pago (15 min).
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_reserva_stock` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.reservas_temporales_stock`. |
| 02 | `carrito` | `BIGINT` | NO | **FK** | FK → `ventas.carritos(id_carrito)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.carritos(id_carrito)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK** | FK → `catalogo.variantes_sku(id_variante_sku)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad_reservada` | `INT` | NO | - | CHK: `cantidad_reservada >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad reservada. |
| 05 | `fecha_reserva` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha reserva. |
| 06 | `fecha_expiracion_reserva` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | 15 minutos para completar pago. |
| 07 | `liberada` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de liberada en `ventas.reservas_temporales_stock`. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_reservas_stock PRIMARY KEY CLUSTERED (id_reserva_stock)`
- `CONSTRAINT FK_ventas_rts_carrito FOREIGN KEY (carrito) REFERENCES ventas.carritos(id_carrito)`
- `CONSTRAINT FK_ventas_rts_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 072: `ventas.afiliados_influencers`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal / Financiero**
- **Descripción Operativa del Negocio:** Creadores de contenido afiliados con código y CLABE de dispersión.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_afiliado` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.afiliados_influencers`. |
| 02 | `codigo_afiliado` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo afiliado. |
| 03 | `usuario` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 04 | `nombre_canal_red_social` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre canal red social. |
| 05 | `porcentaje_comision` | `DECIMAL(5,2)` / `NUMERIC(5,2)` | NO | - | CHK: `porcentaje_comision BETWEEN 1.00 AND 30.00` | Sin Dato Personal | Valor porcentual (%) aplicado para porcentaje comision. |
| 06 | `clabe_interbancaria` | `VARCHAR(18)` | NO | - | - | Dato Financiero / Patrimonial | Atributo de dominio que almacena el valor de clabe interbancaria en `ventas.afiliados_influencers`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_afiliados PRIMARY KEY CLUSTERED (id_afiliado)`
- `CONSTRAINT UQ_ventas_ai_codigo UNIQUE (codigo_afiliado)`
- `CONSTRAINT FK_ventas_ai_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 073: `ventas.comisiones_afiliados`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Cálculo de comisiones devengadas por venta de cosméticos.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_comision_afiliado` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `ventas.comisiones_afiliados`. |
| 02 | `afiliado` | `BIGINT` | NO | **FK** | FK → `ventas.afiliados_influencers(id_afiliado)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.afiliados_influencers(id_afiliado)`. |
| 03 | `orden` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.ordenes(id_orden)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 04 | `monto_base_calculo` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto base calculo. |
| 05 | `monto_comision` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto comision. |
| 06 | `estado_pago` | `NVARCHAR(20)` / `VARCHAR(30)` | NO | - | CHK: `estado_pago IN (N'PENDIENTE', N'APROBADA', N'PAGADA', N'CANCELADA_POR_DEVOLUCION')` | Sin Dato Personal | Clasificación controlada de dominio para estado pago. |
| 07 | `fecha_dispersion_pago` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha dispersion pago. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_ventas_comisiones PRIMARY KEY CLUSTERED (id_comision_afiliado)`
- `CONSTRAINT UQ_ventas_ca_orden UNIQUE (orden)`
- `CONSTRAINT FK_ventas_ca_afiliado FOREIGN KEY (afiliado) REFERENCES ventas.afiliados_influencers(id_afiliado)`
- `CONSTRAINT FK_ventas_ca_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`

---

### FICHA TÉCNICA 074: `pagos.proveedores_pasarela`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (13)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Conectores API (Stripe, MercadoPago, PayPal, SPEI).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_proveedor_pasarela` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.proveedores_pasarela`. |
| 02 | `codigo_pasarela` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo pasarela. |
| 03 | `nombre_comercial` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | STRIPE, MERCADOPAGO, PAYPAL, OPENPAY, SPEI_DIRECTO. |
| 04 | `url_webhook` | `NVARCHAR(250)` / `VARCHAR(250)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de url webhook en `pagos.proveedores_pasarela`. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_proveedores_pasarela PRIMARY KEY CLUSTERED (id_proveedor_pasarela)`
- `CONSTRAINT UQ_pagos_pp_codigo UNIQUE (codigo_pasarela)`

---

### FICHA TÉCNICA 075: `pagos.metodos_pago`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (14)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Métodos soportados (Crédito, Débito, SPEI, Billetera, Puntos).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_metodo_pago` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.metodos_pago`. |
| 02 | `codigo_metodo` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo metodo. |
| 03 | `nombre_metodo` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | TARJETA_CREDITO, TARJETA_DEBITO, TRANSFERENCIA_SPEI, BILLETERA_WALLET, PUNTOS_BEAUTY. |
| 04 | `comision_porcentual_fija` | `DECIMAL(5,2)` / `NUMERIC(5,2)` | NO | - | DEF: `2.90` | Sin Dato Personal | Atributo de dominio que almacena el valor de comision porcentual fija en `pagos.metodos_pago`. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_metodos_pago PRIMARY KEY CLUSTERED (id_metodo_pago)`
- `CONSTRAINT UQ_pagos_mp_codigo UNIQUE (codigo_metodo)`

---

### FICHA TÉCNICA 076: `pagos.transacciones`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Registro central de cobros con folio bancario y estado de pago.
- **Total de Columnas:** 18 · **Restricciones Nombradas:** 5

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_transaccion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.transacciones`. |
| 02 | `folio_transaccion` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio transaccion). |
| 03 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 04 | `proveedor_pasarela` | `BIGINT` | NO | **FK** | FK → `pagos.proveedores_pasarela(id_proveedor_pasarela)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.proveedores_pasarela(id_proveedor_pasarela)`. |
| 05 | `metodo_pago` | `BIGINT` | NO | **FK** | FK → `pagos.metodos_pago(id_metodo_pago)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.metodos_pago(id_metodo_pago)`. |
| 06 | `id_transaccion_externa_pasarela` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | ID devuelto por Stripe/MercadoPago. |
| 07 | `monto_transaccion` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `monto_transaccion > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto transaccion. |
| 08 | `moneda` | `VARCHAR(3)` | NO | - | DEF: `'MXN'` | Sin Dato Personal | Clasificación controlada de dominio para moneda. |
| 09 | `estado_pago` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `estado_pago IN (N'PENDIENTE', N'APROBADA', N'RECHAZADA', N'CANCELADA', N'EN_MEDIACION')` | Sin Dato Personal | Clasificación controlada de dominio para estado pago. |
| 10 | `codigo_autorizacion_bancaria` | `NVARCHAR(30)` / `VARCHAR(30)` | SÍ | - | - | Dato Financiero / Patrimonial | Código identificador estandarizado de codigo autorizacion bancaria. |
| 11 | `fecha_pago_efectuado` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha pago efectuado. |
| 12 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 13 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 14 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 15 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 16 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 17 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 18 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_transacciones PRIMARY KEY CLUSTERED (id_transaccion)`
- `CONSTRAINT UQ_pagos_tx_folio UNIQUE (folio_transaccion)`
- `CONSTRAINT FK_pagos_tx_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_pagos_tx_pasarela FOREIGN KEY (proveedor_pasarela) REFERENCES pagos.proveedores_pasarela(id_proveedor_pasarela)`
- `CONSTRAINT FK_pagos_tx_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago)`

**Índices Secundarios Explícitos:**
- `IX_pagos_tx_orden_estado (orden, estado_pago)`

---

### FICHA TÉCNICA 077: `pagos.intentos_cobro`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Bitácora API
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Log de peticiones sanitizadas y respuestas HTTP de las pasarelas.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_intento_cobro` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.intentos_cobro`. |
| 02 | `transaccion` | `BIGINT` | NO | **FK** | FK → `pagos.transacciones(id_transaccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.transacciones(id_transaccion)`. |
| 03 | `numero_intento` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra numero intento. |
| 04 | `codigo_respuesta_http` | `INT` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo respuesta http. |
| 05 | `payload_solicitud_sanitizado` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Sin CVV ni datos sensibles. |
| 06 | `payload_respuesta_pasarela` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de payload respuesta pasarela en `pagos.intentos_cobro`. |
| 07 | `mensaje_error_banco` | `NVARCHAR(250)` / `VARCHAR(250)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de mensaje error banco en `pagos.intentos_cobro`. |
| 08 | `fecha_intento` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha intento. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_intentos_cobro PRIMARY KEY CLUSTERED (id_intento_cobro)`
- `CONSTRAINT FK_pagos_ic_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion)`

---

### FICHA TÉCNICA 078: `pagos.split_multipagos`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Soporte de pago combinado (ej. Tarjeta de crédito + Saldo Wallet).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_split_pago` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.split_multipagos`. |
| 02 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `metodo_pago` | `BIGINT` | NO | **FK** | FK → `pagos.metodos_pago(id_metodo_pago)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.metodos_pago(id_metodo_pago)`. |
| 04 | `monto_asignado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto asignado. |
| 05 | `referencia_comprobante` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de referencia comprobante en `pagos.split_multipagos`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_split_multipagos PRIMARY KEY CLUSTERED (id_split_pago)`
- `CONSTRAINT FK_pagos_smp_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_pagos_smp_metodo FOREIGN KEY (metodo_pago) REFERENCES pagos.metodos_pago(id_metodo_pago)`

---

### FICHA TÉCNICA 079: `pagos.billetera_electronica`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Saldo a favor y monedero electrónico por cliente.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_billetera` | `BIGINT` | NO | **PK** (ID) | - | Dato Financiero / Patrimonial | Llave primaria autoincrementable única de la entidad `pagos.billetera_electronica`. |
| 02 | `cliente` | `BIGINT` | NO | **FK**, UQ | FK → `clientes.clientes(id_cliente)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `saldo_disponible` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | DEF: `0.00` | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo disponible. |
| 04 | `saldo_bloqueado_retenido` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | DEF: `0.00` | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo bloqueado retenido. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_billetera PRIMARY KEY CLUSTERED (id_billetera)`
- `CONSTRAINT UQ_pagos_be_cliente UNIQUE (cliente)`
- `CONSTRAINT FK_pagos_be_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 080: `pagos.movimientos_billetera`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Kardex de abonos, cargos y devoluciones a la billetera.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_movimiento_billetera` | `BIGINT` | NO | **PK** (ID) | - | Dato Financiero / Patrimonial | Llave primaria autoincrementable única de la entidad `pagos.movimientos_billetera`. |
| 02 | `billetera` | `BIGINT` | NO | **FK** | FK → `pagos.billetera_electronica(id_billetera)` | Dato Financiero / Patrimonial | Llave foránea que vincula este registro con `pagos.billetera_electronica(id_billetera)`. |
| 03 | `tipo_movimiento` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `tipo_movimiento IN (N'CARGA_SALDO', N'PAGO_ORDEN', N'REEMBOLSO_DEVOLUCION', N'BONIFICACION_FIDELIDAD')` | Sin Dato Personal | Clasificación controlada de dominio para tipo movimiento. |
| 04 | `monto` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `monto > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto. |
| 05 | `saldo_anterior` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo anterior. |
| 06 | `saldo_posterior` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo posterior. |
| 07 | `descripcion_motivo` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion motivo. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_movimientos_billetera PRIMARY KEY CLUSTERED (id_movimiento_billetera)`
- `CONSTRAINT FK_pagos_mb_billetera FOREIGN KEY (billetera) REFERENCES pagos.billetera_electronica(id_billetera)`

---

### FICHA TÉCNICA 081: `pagos.tarjetas_regalo_giftcards`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Tarjetas de regalo digitales con código cifrado y saldo.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_giftcard` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.tarjetas_regalo_giftcards`. |
| 02 | `codigo_giftcard_hash` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo giftcard hash. |
| 03 | `monto_inicial` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `monto_inicial > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto inicial. |
| 04 | `saldo_actual` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `saldo_actual >= 0` | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo actual. |
| 05 | `fecha_vencimiento` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha vencimiento. |
| 06 | `cliente_comprador` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_giftcards PRIMARY KEY CLUSTERED (id_giftcard)`
- `CONSTRAINT UQ_pagos_gc_hash UNIQUE (codigo_giftcard_hash)`
- `CONSTRAINT FK_pagos_gc_comprador FOREIGN KEY (cliente_comprador) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 082: `pagos.redenciones_giftcards`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Aplicación del saldo de giftcards en el pago de pedidos.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_redencion_giftcard` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.redenciones_giftcards`. |
| 02 | `giftcard` | `BIGINT` | NO | **FK** | FK → `pagos.tarjetas_regalo_giftcards(id_giftcard)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.tarjetas_regalo_giftcards(id_giftcard)`. |
| 03 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 04 | `monto_redimido` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `monto_redimido > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto redimido. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_redenciones_giftcard PRIMARY KEY CLUSTERED (id_redencion_giftcard)`
- `CONSTRAINT FK_pagos_rg_giftcard FOREIGN KEY (giftcard) REFERENCES pagos.tarjetas_regalo_giftcards(id_giftcard)`
- `CONSTRAINT FK_pagos_rg_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`

---

### FICHA TÉCNICA 083: `pagos.reglas_antifraude`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Ciberseguridad**
- **Descripción Operativa del Negocio:** Reglas de score de riesgo (IP sospechosa, montos altos, país emisor).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_regla_antifraude` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.reglas_antifraude`. |
| 02 | `codigo_regla` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo regla. |
| 03 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 04 | `puntaje_riesgo_asignado` | `INT` | NO | - | CHK: `puntaje_riesgo_asignado BETWEEN 1 AND 100` | Sin Dato Personal | Valor numérico cuantitativo que registra puntaje riesgo asignado. |
| 05 | `bloqueo_automatico` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: bloqueo automatico. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_reglas_antifraude PRIMARY KEY CLUSTERED (id_regla_antifraude)`
- `CONSTRAINT UQ_pagos_ra_codigo UNIQUE (codigo_regla)`

---

### FICHA TÉCNICA 084: `pagos.evaluaciones_antifraude`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Ciberseguridad**
- **Descripción Operativa del Negocio:** Evaluación de riesgo transaccional previo al cobro bancario.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_evaluacion_fraude` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.evaluaciones_antifraude`. |
| 02 | `orden` | `BIGINT` | NO | **FK**, UQ | FK → `ventas.ordenes(id_orden)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `regla_antifraude` | `BIGINT` | SÍ | **FK** | FK → `pagos.reglas_antifraude(id_regla_antifraude)` | Sin Dato Personal | Referencia a la regla de riesgo principal detonada en la evaluación antifraude. |
| 04 | `score_riesgo_total` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra score riesgo total. |
| 05 | `nivel_riesgo` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `nivel_riesgo IN (N'BAJO', N'MEDIO', N'ALTO_REQUERIR_3DS', N'CRITICO_RECHAZADO')` | Sin Dato Personal | Valor numérico cuantitativo que registra nivel riesgo. |
| 06 | `ip_origen` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | - | - | Dato Personal Identificativo | Dirección IPv4/IPv6 detectada al momento de evaluar el riesgo de la operación. |
| 07 | `distancia_geografica_km` | `INT` | SÍ | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra distancia geografica km. |
| 08 | `dispositivo_sospechoso` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de dispositivo sospechoso en `pagos.evaluaciones_antifraude`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_evaluaciones_fraude PRIMARY KEY CLUSTERED (id_evaluacion_fraude)`
- `CONSTRAINT UQ_pagos_ea_orden UNIQUE (orden)`
- `CONSTRAINT FK_pagos_ea_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_pagos_ea_regla FOREIGN KEY (regla_antifraude) REFERENCES pagos.reglas_antifraude(id_regla_antifraude)`

**Índices Secundarios Explícitos:**
- `IX_pagos_antifraude_orden_riesgo (orden, nivel_riesgo, score_riesgo_total)`

---

### FICHA TÉCNICA 085: `pagos.contracargos_chargebacks`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero / Legal**
- **Descripción Operativa del Negocio:** Gestión de disputas bancarias por cargos no reconocidos.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_contracargo` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.contracargos_chargebacks`. |
| 02 | `transaccion` | `BIGINT` | NO | **FK** | FK → `pagos.transacciones(id_transaccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.transacciones(id_transaccion)`. |
| 03 | `folio_disputa_pasarela` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio disputa pasarela). |
| 04 | `motivo_disputa` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Tarjeta no presente, Mercancía no recibida, No reconocida. |
| 05 | `monto_disputado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto disputado. |
| 06 | `fecha_notificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha notificacion. |
| 07 | `fecha_limite_evidencia` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha limite evidencia. |
| 08 | `estatus_disputa` | `NVARCHAR(20)` / `VARCHAR(30)` | NO | - | CHK: `estatus_disputa IN (N'ABIERTA', N'EN_REVISION', N'GANADA_POR_COMERCIO', N'PERDIDA_POR_COMERCIO')` | Sin Dato Personal | Clasificación controlada de dominio para estatus disputa. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_contracargos PRIMARY KEY CLUSTERED (id_contracargo)`
- `CONSTRAINT UQ_pagos_cc_disputa UNIQUE (folio_disputa_pasarela)`
- `CONSTRAINT FK_pagos_cc_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion)`

---

### FICHA TÉCNICA 086: `pagos.reembolsos_transaccion`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Bitácora de devoluciones monetarias emitidas hacia pasarelas.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_reembolso` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `pagos.reembolsos_transaccion`. |
| 02 | `transaccion` | `BIGINT` | NO | **FK** | FK → `pagos.transacciones(id_transaccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.transacciones(id_transaccion)`. |
| 03 | `folio_reembolso_pasarela` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio reembolso pasarela). |
| 04 | `monto_reembolsado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `monto_reembolsado > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto reembolsado. |
| 05 | `motivo_reembolso` | `NVARCHAR(250)` / `VARCHAR(250)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para motivo reembolso. |
| 06 | `fecha_reembolso` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha reembolso. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_pagos_reembolsos PRIMARY KEY CLUSTERED (id_reembolso)`
- `CONSTRAINT UQ_pagos_reemb_folio UNIQUE (folio_reembolso_pasarela)`
- `CONSTRAINT FK_pagos_reemb_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion)`

---

### FICHA TÉCNICA 087: `fiscal.regimenes_sat`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (15)
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** Catálogo oficial de regímenes fiscales del SAT (601, 605, 612, 626).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_regimen_sat` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.regimenes_sat`. |
| 02 | `clave_regimen_sat` | `VARCHAR(4)` | NO | UQ | UNIQUE | Sin Dato Personal | Ej: 601 General de Ley, 605 Sueldos, 612 Actividad Empresarial, 626 RESICO. |
| 03 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 04 | `aplica_persona_fisica` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de aplica persona fisica en `fiscal.regimenes_sat`. |
| 05 | `aplica_persona_moral` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de aplica persona moral en `fiscal.regimenes_sat`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_regimenes_sat PRIMARY KEY CLUSTERED (id_regimen_sat)`
- `CONSTRAINT UQ_fiscal_rs_clave UNIQUE (clave_regimen_sat)`

---

### FICHA TÉCNICA 088: `fiscal.usos_cfdi`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Catálogo (16)
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** Catálogo oficial de Uso de CFDI (G01, G03, CP01, S01).
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_uso_cfdi` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.usos_cfdi`. |
| 02 | `clave_uso_cfdi` | `VARCHAR(5)` | NO | UQ | UNIQUE | Sin Dato Personal | G01 Adquisición de mercancías, G03 Gastos en general, CP01 Pagos, S01 Sin efectos fiscales. |
| 03 | `descripcion` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 04 | `aplica_fisica` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de aplica fisica en `fiscal.usos_cfdi`. |
| 05 | `aplica_moral` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de aplica moral en `fiscal.usos_cfdi`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_usos_cfdi PRIMARY KEY CLUSTERED (id_uso_cfdi)`
- `CONSTRAINT UQ_fiscal_uc_clave UNIQUE (clave_uso_cfdi)`

---

### FICHA TÉCNICA 089: `fiscal.datos_fiscales_cliente`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Fiscal / LFPDPPP**
- **Descripción Operativa del Negocio:** RFC, Razón Social, Domicilio Fiscal y Correo para facturación 4.0.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_dato_fiscal` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.datos_fiscales_cliente`. |
| 02 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 03 | `rfc_emisor` | `VARCHAR(13)` | NO | - | - | Dato Personal / Fiscal SAT | Atributo de dominio que almacena el valor de rfc emisor en `fiscal.datos_fiscales_cliente`. |
| 04 | `razon_social` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Dato Personal / Fiscal SAT | Atributo de dominio que almacena el valor de razon social en `fiscal.datos_fiscales_cliente`. |
| 05 | `codigo_postal_fiscal` | `VARCHAR(10)` | NO | - | - | Dato Personal Identificativo | Código identificador estandarizado de codigo postal fiscal. |
| 06 | `regimen_sat` | `BIGINT` | NO | **FK** | FK → `fiscal.regimenes_sat(id_regimen_sat)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.regimenes_sat(id_regimen_sat)`. |
| 07 | `uso_cfdi_predeterminado` | `BIGINT` | NO | **FK** | FK → `fiscal.usos_cfdi(id_uso_cfdi)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.usos_cfdi(id_uso_cfdi)`. |
| 08 | `correo_envio_cfdi` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de correo envio cfdi en `fiscal.datos_fiscales_cliente`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_datos_fiscales PRIMARY KEY CLUSTERED (id_dato_fiscal)`
- `CONSTRAINT FK_fiscal_dfc_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_fiscal_dfc_regimen FOREIGN KEY (regimen_sat) REFERENCES fiscal.regimenes_sat(id_regimen_sat)`
- `CONSTRAINT FK_fiscal_dfc_uso FOREIGN KEY (uso_cfdi_predeterminado) REFERENCES fiscal.usos_cfdi(id_uso_cfdi)`

---

### FICHA TÉCNICA 090: `fiscal.facturas_cfdi`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** Facturas electrónicas timbradas con UUID SAT, sellos y XML/PDF.
- **Total de Columnas:** 22 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_factura` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.facturas_cfdi`. |
| 02 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 03 | `dato_fiscal` | `BIGINT` | NO | **FK** | FK → `fiscal.datos_fiscales_cliente(id_dato_fiscal)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.datos_fiscales_cliente(id_dato_fiscal)`. |
| 04 | `serie_factura` | `VARCHAR(10)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de serie factura en `fiscal.facturas_cfdi`. |
| 05 | `folio_factura` | `VARCHAR(20)` | NO | - | - | Sin Dato Personal | Número de folio único de control operativo (folio factura). |
| 06 | `uuid_sat_fiscal` | `UNIQUEIDENTIFIER` / `UUID` | NO | UQ | UNIQUE | Dato Personal / Fiscal SAT | Folio fiscal digital único (UUID) asignado por el PAC/SAT al timbrar el CFDI 4.0. |
| 07 | `sello_digital_cfdi` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Dato Personal / Fiscal SAT | Dato criptográfico, fiscal o de control técnico correspondiente a sello digital cfdi. |
| 08 | `sello_sat` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a sello sat. |
| 09 | `cadena_original_timbre` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Dato Personal / Fiscal SAT | Dato criptográfico, fiscal o de control técnico correspondiente a cadena original timbre. |
| 10 | `numero_certificado_sat` | `VARCHAR(20)` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra numero certificado sat. |
| 11 | `fecha_timbrado` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha timbrado. |
| 12 | `monto_total_facturado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto total facturado. |
| 13 | `estado_cfdi` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `estado_cfdi IN (N'TIMBRADA_VIGENTE', N'CANCELADA_SAT', N'ERROR_TIMBRADO')` | Sin Dato Personal | Clasificación controlada de dominio para estado cfdi. |
| 14 | `xml_comprobante_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (xml comprobante url). |
| 15 | `pdf_representacion_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (pdf representacion url). |
| 16 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 17 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 18 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 19 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 20 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 21 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 22 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_facturas PRIMARY KEY CLUSTERED (id_factura)`
- `CONSTRAINT UQ_fiscal_fcfdi_uuid UNIQUE (uuid_sat_fiscal)`
- `CONSTRAINT FK_fiscal_fcfdi_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_fiscal_fcfdi_df FOREIGN KEY (dato_fiscal) REFERENCES fiscal.datos_fiscales_cliente(id_dato_fiscal)`

**Índices Secundarios Explícitos:**
- `IX_fiscal_facturas_orden_estado (orden, estado_cfdi)`

---

### FICHA TÉCNICA 091: `fiscal.facturas_partidas`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** Conceptos facturados con clave SAT 53131600 (Cosméticos).
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_factura_partida` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.facturas_partidas`. |
| 02 | `factura` | `BIGINT` | NO | **FK** | FK → `fiscal.facturas_cfdi(id_factura)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.facturas_cfdi(id_factura)`. |
| 03 | `clave_producto_servicio_sat` | `VARCHAR(10)` | NO | - | - | Sin Dato Personal | Ej: 53131600 Cosméticos y cuidado de la piel. |
| 04 | `clave_unidad_sat` | `VARCHAR(5)` | NO | - | - | Sin Dato Personal | H87 Pieza. |
| 05 | `cantidad` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad. |
| 06 | `valor_unitario` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de valor unitario en `fiscal.facturas_partidas`. |
| 07 | `importe_neto` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a importe neto. |
| 08 | `objeto_impuesto` | `VARCHAR(3)` | NO | - | DEF: `'02'` | Sin Dato Personal | 02 Sí objeto de impuesto. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_facturas_partidas PRIMARY KEY CLUSTERED (id_factura_partida)`
- `CONSTRAINT FK_fiscal_fp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura)`

---

### FICHA TÉCNICA 092: `fiscal.complementos_pago`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** Recibos Electrónicos de Pago (REP) con UUID fiscal.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_complemento_pago` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.complementos_pago`. |
| 02 | `factura` | `BIGINT` | NO | **FK** | FK → `fiscal.facturas_cfdi(id_factura)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.facturas_cfdi(id_factura)`. |
| 03 | `transaccion` | `BIGINT` | NO | **FK** | FK → `pagos.transacciones(id_transaccion)` | Sin Dato Personal | Llave foránea que vincula este registro con `pagos.transacciones(id_transaccion)`. |
| 04 | `uuid_sat_complemento` | `UNIQUEIDENTIFIER` / `UUID` | NO | UQ | UNIQUE | Dato Personal / Fiscal SAT | Identificador único universal (UUID) correspondiente a uuid sat complemento. |
| 05 | `numero_parcialidad` | `INT` | NO | - | DEF: `1` | Sin Dato Personal | Valor numérico cuantitativo que registra numero parcialidad. |
| 06 | `saldo_anterior` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo anterior. |
| 07 | `monto_pagado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto pagado. |
| 08 | `saldo_insoluto` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo insoluto. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_complementos_pago PRIMARY KEY CLUSTERED (id_complemento_pago)`
- `CONSTRAINT UQ_fiscal_cp_uuid UNIQUE (uuid_sat_complemento)`
- `CONSTRAINT FK_fiscal_cp_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura)`
- `CONSTRAINT FK_fiscal_cp_transaccion FOREIGN KEY (transaccion) REFERENCES pagos.transacciones(id_transaccion)`

---

### FICHA TÉCNICA 093: `fiscal.notas_credito`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** CFDI de egreso por devoluciones de mercancía y cancelaciones.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_nota_credito` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.notas_credito`. |
| 02 | `factura` | `BIGINT` | NO | **FK** | FK → `fiscal.facturas_cfdi(id_factura)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.facturas_cfdi(id_factura)`. |
| 03 | `uuid_sat_nota_credito` | `UNIQUEIDENTIFIER` / `UUID` | NO | UQ | UNIQUE | Dato Personal / Fiscal SAT | Identificador único universal (UUID) correspondiente a uuid sat nota credito. |
| 04 | `motivo_devolucion_sat` | `VARCHAR(3)` | NO | - | - | Sin Dato Personal | 01 Devolución de mercancías. |
| 05 | `subtotal_acreditado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a subtotal acreditado. |
| 06 | `iva_acreditado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de iva acreditado en `fiscal.notas_credito`. |
| 07 | `total_acreditado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a total acreditado. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_notas_credito PRIMARY KEY CLUSTERED (id_nota_credito)`
- `CONSTRAINT UQ_fiscal_nc_uuid UNIQUE (uuid_sat_nota_credito)`
- `CONSTRAINT FK_fiscal_nc_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura)`

---

### FICHA TÉCNICA 094: `fiscal.cancelaciones_cfdi`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Fiscal SAT**
- **Descripción Operativa del Negocio:** Motivos de cancelación SAT y acuses digitales de anulación.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cancelacion_cfdi` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `fiscal.cancelaciones_cfdi`. |
| 02 | `factura` | `BIGINT` | NO | **FK** | FK → `fiscal.facturas_cfdi(id_factura)` | Sin Dato Personal | Llave foránea que vincula este registro con `fiscal.facturas_cfdi(id_factura)`. |
| 03 | `motivo_cancelacion_sat` | `VARCHAR(4)` | NO | - | CHK: `motivo_cancelacion_sat IN ('01', '02', '03', '04')` | Sin Dato Personal | Clasificación controlada de dominio para motivo cancelacion sat. |
| 04 | `uuid_sustitucion` | `UNIQUEIDENTIFIER` / `UUID` | SÍ | - | - | Sin Dato Personal | Identificador único universal (UUID) correspondiente a uuid sustitucion. |
| 05 | `acuse_cancelacion_sat` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a acuse cancelacion sat. |
| 06 | `fecha_solicitud_cancelacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha solicitud cancelacion. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_fiscal_cancelaciones PRIMARY KEY CLUSTERED (id_cancelacion_cfdi)`
- `CONSTRAINT FK_fiscal_ccfdi_factura FOREIGN KEY (factura) REFERENCES fiscal.facturas_cfdi(id_factura)`

---

### FICHA TÉCNICA 095: `promos.campanias`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Campañas promocionales (Hot Sale, Black Friday Dermocosmético).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_campania` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `promos.campanias`. |
| 02 | `codigo_campania` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo campania. |
| 03 | `nombre_campania` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Ej: Hot Sale Belleza, Black Friday Dermocosmética. |
| 04 | `fecha_inicio` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha inicio. |
| 05 | `fecha_fin` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha fin. |
| 06 | `presupuesto_maximo_descuentos` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a presupuesto maximo descuentos. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_promos_campanias PRIMARY KEY CLUSTERED (id_campania)`
- `CONSTRAINT UQ_promos_camp_codigo UNIQUE (codigo_campania)`

---

### FICHA TÉCNICA 096: `promos.cupones`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Cupones de descuento, fechas límite y límites de uso.
- **Total de Columnas:** 17 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cupon` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `promos.cupones`. |
| 02 | `campania` | `BIGINT` | NO | **FK** | FK → `promos.campanias(id_campania)` | Sin Dato Personal | Llave foránea que vincula este registro con `promos.campanias(id_campania)`. |
| 03 | `codigo_cupon` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Ej: PIELRADIANTE20, BIENVENIDA10. |
| 04 | `tipo_descuento` | `BIGINT` | NO | **FK** | FK → `ventas.tipos_descuento(id_tipo_descuento)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.tipos_descuento(id_tipo_descuento)`. |
| 05 | `valor_descuento` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `valor_descuento > 0` | Sin Dato Personal | Atributo de dominio que almacena el valor de valor descuento en `promos.cupones`. |
| 06 | `monto_minimo_compra` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | DEF: `0.00` | Sin Dato Personal | Importe monetario en MXN correspondiente a monto minimo compra. |
| 07 | `limite_usos_totales` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra limite usos totales. |
| 08 | `usos_actuales` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra usos actuales. |
| 09 | `limite_usos_por_cliente` | `INT` | NO | - | DEF: `1` | Sin Dato Personal | Valor numérico cuantitativo que registra limite usos por cliente. |
| 10 | `fecha_expiracion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha expiracion. |
| 11 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 12 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 13 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 14 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 15 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 16 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 17 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_promos_cupones PRIMARY KEY CLUSTERED (id_cupon)`
- `CONSTRAINT UQ_promos_cup_codigo UNIQUE (codigo_cupon)`
- `CONSTRAINT FK_promos_cup_campania FOREIGN KEY (campania) REFERENCES promos.campanias(id_campania)`
- `CONSTRAINT FK_promos_cup_tipo FOREIGN KEY (tipo_descuento) REFERENCES ventas.tipos_descuento(id_tipo_descuento)`

**Índices Secundarios Explícitos:**
- `IX_promos_cupones_camp_activo (campania, activo)`

---

### FICHA TÉCNICA 097: `promos.reglas_elegibilidad_cupon`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Condiciones de validez (monto mínimo, exclusión de kits).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_regla_cupon` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `promos.reglas_elegibilidad_cupon`. |
| 02 | `cupon` | `BIGINT` | NO | **FK**, UQ | FK → `promos.cupones(id_cupon)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `promos.cupones(id_cupon)`. |
| 03 | `solo_primera_compra` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: solo primera compra. |
| 04 | `excluye_kits_promocionales` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: excluye kits promocionales. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_promos_reglas_cupon PRIMARY KEY CLUSTERED (id_regla_cupon)`
- `CONSTRAINT UQ_promos_rec_cupon UNIQUE (cupon)`
- `CONSTRAINT FK_promos_rec_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon)`

---

### FICHA TÉCNICA 098: `promos.cupones_categorias_excluidas`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Categorías no aplicables para cupones específicos.
- **Total de Columnas:** 10 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cupon_exclusion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `promos.cupones_categorias_excluidas`. |
| 02 | `cupon` | `BIGINT` | NO | **FK**, UQ | FK → `promos.cupones(id_cupon)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `promos.cupones(id_cupon)`. |
| 03 | `categoria` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.categorias(id_categoria)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.categorias(id_categoria)`. |
| 04 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 05 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 06 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 07 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 08 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 09 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 10 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_promos_cupones_exclusiones PRIMARY KEY CLUSTERED (id_cupon_exclusion)`
- `CONSTRAINT UQ_promos_cce_cupon_cat UNIQUE (cupon, categoria)`
- `CONSTRAINT FK_promos_cce_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon)`
- `CONSTRAINT FK_promos_cce_categoria FOREIGN KEY (categoria) REFERENCES catalogo.categorias(id_categoria)`

---

### FICHA TÉCNICA 099: `promos.redenciones_cupones`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Historial de cupones canjeados por cada cliente.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_redencion_cupon` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `promos.redenciones_cupones`. |
| 02 | `cupon` | `BIGINT` | NO | **FK** | FK → `promos.cupones(id_cupon)` | Sin Dato Personal | Llave foránea que vincula este registro con `promos.cupones(id_cupon)`. |
| 03 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 04 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 05 | `monto_ahorrado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a monto ahorrado. |
| 06 | `fecha_aplicacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha aplicacion. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_promos_redenciones_cupones PRIMARY KEY CLUSTERED (id_redencion_cupon)`
- `CONSTRAINT FK_promos_rcup_cupon FOREIGN KEY (cupon) REFERENCES promos.cupones(id_cupon)`
- `CONSTRAINT FK_promos_rcup_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_promos_rcup_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`

**Índices Secundarios Explícitos:**
- `IX_promos_redenciones_cup_ord (cupon, orden)`

---

### FICHA TÉCNICA 100: `promos.ventas_flash_horarias`
- **Autor Responsable:** Integrante 2 (Tablas 051–100)
- **Módulo de Pertenencia:** Submódulo 2: Motor Comercial, Suscripciones, Pagos, CFDI 4.0 y Promociones
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Promociones relámpago con stock limitado y cuenta regresiva.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_venta_flash` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `promos.ventas_flash_horarias`. |
| 02 | `variante_sku` | `BIGINT` | NO | **FK** | FK → `catalogo.variantes_sku(id_variante_sku)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 03 | `precio_oferta_flash` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `precio_oferta_flash > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a precio oferta flash. |
| 04 | `stock_destinado_flash` | `INT` | NO | - | CHK: `stock_destinado_flash >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra stock destinado flash. |
| 05 | `stock_vendido_flash` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra stock vendido flash. |
| 06 | `fecha_hora_inicio` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha hora inicio. |
| 07 | `fecha_hora_fin` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha hora fin. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_promos_ventas_flash PRIMARY KEY CLUSTERED (id_venta_flash)`
- `CONSTRAINT FK_promos_vfh_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 101: `compras.estados_orden_compra`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Catálogo (17)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Fases de la orden de compra a laboratorios (Borrador, Enviada, Recibida).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_estado_oc` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.estados_orden_compra`. |
| 02 | `codigo_estado` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo estado. |
| 03 | `nombre_estado` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | BORRADOR, AUTORIZADA, ENVIADA_PROVEEDOR, RECIBIDA_PARCIAL, RECIBIDA_TOTAL, CANCELADA. |
| 04 | `descripcion` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_estados_oc PRIMARY KEY CLUSTERED (id_estado_oc)`
- `CONSTRAINT UQ_compras_eoc_codigo UNIQUE (codigo_estado)`

---

### FICHA TÉCNICA 102: `compras.proveedores`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Directorio de laboratorios proveedores con RFC y días de crédito.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_proveedor` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.proveedores`. |
| 02 | `codigo_proveedor` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo proveedor. |
| 03 | `razon_social` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Dato Personal / Fiscal SAT | Atributo de dominio que almacena el valor de razon social en `compras.proveedores`. |
| 04 | `nombre_comercial` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre comercial. |
| 05 | `rfc_proveedor` | `VARCHAR(13)` | NO | UQ | UNIQUE | Dato Personal / Fiscal SAT | Atributo de dominio que almacena el valor de rfc proveedor en `compras.proveedores`. |
| 06 | `pais_origen` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de pais origen en `compras.proveedores`. |
| 07 | `dias_credito_pago` | `INT` | NO | - | DEF: `30` | Sin Dato Personal | Valor numérico cuantitativo que registra dias credito pago. |
| 08 | `calificacion_calidad_sanitaria` | `DECIMAL(3,2)` / `NUMERIC(3,2)` | NO | - | DEF: `5.00` | Sin Dato Personal | Atributo de dominio que almacena el valor de calificacion calidad sanitaria en `compras.proveedores`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_proveedores PRIMARY KEY CLUSTERED (id_proveedor)`
- `CONSTRAINT UQ_compras_prov_codigo UNIQUE (codigo_proveedor)`
- `CONSTRAINT UQ_compras_prov_rfc UNIQUE (rfc_proveedor)`

---

### FICHA TÉCNICA 103: `compras.contactos_proveedor`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal Laboral**
- **Descripción Operativa del Negocio:** Ejecutivos de cuenta y responsables técnicos de laboratorios.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_contacto_proveedor` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.contactos_proveedor`. |
| 02 | `proveedor` | `BIGINT` | NO | **FK** | FK → `compras.proveedores(id_proveedor)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.proveedores(id_proveedor)`. |
| 03 | `nombre_contacto` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre contacto. |
| 04 | `puesto_cargo` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de puesto cargo en `compras.contactos_proveedor`. |
| 05 | `email_contacto` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de email contacto en `compras.contactos_proveedor`. |
| 06 | `telefono_directo` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de telefono directo en `compras.contactos_proveedor`. |
| 07 | `es_contacto_principal` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es contacto principal. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_contactos_prov PRIMARY KEY CLUSTERED (id_contacto_proveedor)`
- `CONSTRAINT FK_compras_cp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor)`

---

### FICHA TÉCNICA 104: `compras.proveedor_slas`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Comercial / Legal**
- **Descripción Operativa del Negocio:** Acuerdos de nivel de servicio (tiempos de entrega y penalizaciones).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_proveedor_sla` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.proveedor_slas`. |
| 02 | `proveedor` | `BIGINT` | NO | **FK** | FK → `compras.proveedores(id_proveedor)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.proveedores(id_proveedor)`. |
| 03 | `tiempo_promedio_entrega_dias` | `INT` | NO | - | CHK: `tiempo_promedio_entrega_dias >= 1` | Sin Dato Personal | Atributo de dominio que almacena el valor de tiempo promedio entrega dias en `compras.proveedor_slas`. |
| 04 | `porcentaje_tolerancia_mermas` | `DECIMAL(4,2)` / `NUMERIC(4,2)` | NO | - | DEF: `0.50` | Sin Dato Personal | Valor porcentual (%) aplicado para porcentaje tolerancia mermas. |
| 05 | `penalizacion_por_dia_retraso_porc` | `DECIMAL(4,2)` / `NUMERIC(4,2)` | NO | - | DEF: `1.00` | Sin Dato Personal | Atributo de dominio que almacena el valor de penalizacion por dia retraso porc en `compras.proveedor_slas`. |
| 06 | `vigencia_acuerdo_fin` | `DATE` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de vigencia acuerdo fin en `compras.proveedor_slas`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_slas PRIMARY KEY CLUSTERED (id_proveedor_sla)`
- `CONSTRAINT FK_compras_sla_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor)`

---

### FICHA TÉCNICA 105: `compras.proveedor_productos`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Intermedia $N:M$
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Catálogo de precios mayoristas negociados por SKU y proveedor.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_proveedor_producto` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.proveedor_productos`. |
| 02 | `proveedor` | `BIGINT` | NO | **FK**, UQ | FK → `compras.proveedores(id_proveedor)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `compras.proveedores(id_proveedor)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `codigo_articulo_proveedor` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo articulo proveedor. |
| 05 | `costo_negociado_unitario` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | CHK: `costo_negociado_unitario > 0` | Sin Dato Personal | Importe monetario en MXN correspondiente a costo negociado unitario. |
| 06 | `lote_minimo_compra` | `INT` | NO | - | DEF: `1` | Sin Dato Personal | Atributo de dominio que almacena el valor de lote minimo compra en `compras.proveedor_productos`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_proveedor_sku PRIMARY KEY CLUSTERED (id_proveedor_producto)`
- `CONSTRAINT UQ_compras_pp_prov_sku UNIQUE (proveedor, variante_sku)`
- `CONSTRAINT FK_compras_pp_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor)`
- `CONSTRAINT FK_compras_pp_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 106: `compras.requisiciones`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Solicitudes de resurtido emitidas por el personal de almacén.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_requisicion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.requisiciones`. |
| 02 | `folio_requisicion` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio requisicion). |
| 03 | `departamento_solicitante` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Ej: Almacén WMS Resurtido, Dermocosmética. |
| 04 | `prioridad` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `prioridad IN (N'BAJA', N'MEDIA', N'URGENTE_DESABASTO')` | Sin Dato Personal | Clasificación controlada de dominio para prioridad. |
| 05 | `motivo_solicitud` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para motivo solicitud. |
| 06 | `fecha_limite_requerida` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha limite requerida. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_requisiciones PRIMARY KEY CLUSTERED (id_requisicion)`
- `CONSTRAINT UQ_compras_req_folio UNIQUE (folio_requisicion)`

---

### FICHA TÉCNICA 107: `compras.requisiciones_detalles`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Desglose de piezas requeridas por SKU en cada requisición.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_requisicion_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.requisiciones_detalles`. |
| 02 | `requisicion` | `BIGINT` | NO | **FK**, UQ | FK → `compras.requisiciones(id_requisicion)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `compras.requisiciones(id_requisicion)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad_requerida` | `INT` | NO | - | CHK: `cantidad_requerida >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad requerida. |
| 05 | `cantidad_aprobada` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad aprobada. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_requisiciones_det PRIMARY KEY CLUSTERED (id_requisicion_detalle)`
- `CONSTRAINT UQ_compras_rd_req_sku UNIQUE (requisicion, variante_sku)`
- `CONSTRAINT FK_compras_rd_requisicion FOREIGN KEY (requisicion) REFERENCES compras.requisiciones(id_requisicion)`
- `CONSTRAINT FK_compras_rd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 108: `compras.ordenes_compra`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Comercial / Financiero**
- **Descripción Operativa del Negocio:** Contratos de compra formal a laboratorios proveedores.
- **Total de Columnas:** 17 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_compra` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.ordenes_compra`. |
| 02 | `folio_orden_compra` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio orden compra). |
| 03 | `proveedor` | `BIGINT` | NO | **FK** | FK → `compras.proveedores(id_proveedor)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.proveedores(id_proveedor)`. |
| 04 | `estado_oc` | `BIGINT` | NO | **FK** | FK → `compras.estados_orden_compra(id_estado_oc)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.estados_orden_compra(id_estado_oc)`. |
| 05 | `fecha_emision` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha emision. |
| 06 | `fecha_entrega_esperada` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha entrega esperada. |
| 07 | `subtotal` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a subtotal. |
| 08 | `total_iva` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a total iva. |
| 09 | `total_orden_compra` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a total orden compra. |
| 10 | `condiciones_pago` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de condiciones pago en `compras.ordenes_compra`. |
| 11 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 12 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 13 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 14 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 15 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 16 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 17 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_ordenes_compra PRIMARY KEY CLUSTERED (id_orden_compra)`
- `CONSTRAINT UQ_compras_oc_folio UNIQUE (folio_orden_compra)`
- `CONSTRAINT FK_compras_oc_proveedor FOREIGN KEY (proveedor) REFERENCES compras.proveedores(id_proveedor)`
- `CONSTRAINT FK_compras_oc_estado FOREIGN KEY (estado_oc) REFERENCES compras.estados_orden_compra(id_estado_oc)`

**Índices Secundarios Explícitos:**
- `IX_compras_oc_prov_fecha (proveedor, fecha_emision)`

---

### FICHA TÉCNICA 109: `compras.ordenes_compra_detalles`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Líneas de producto pedidas, costos unitarios y cantidades.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_orden_compra_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.ordenes_compra_detalles`. |
| 02 | `orden_compra` | `BIGINT` | NO | **FK**, UQ | FK → `compras.ordenes_compra(id_orden_compra)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `compras.ordenes_compra(id_orden_compra)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad_pedida` | `INT` | NO | - | CHK: `cantidad_pedida >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad pedida. |
| 05 | `cantidad_recibida` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad recibida. |
| 06 | `costo_unitario_compra` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo unitario compra. |
| 07 | `importe_total_linea` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a importe total linea. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_oc_detalles PRIMARY KEY CLUSTERED (id_orden_compra_detalle)`
- `CONSTRAINT UQ_compras_ocd_oc_sku UNIQUE (orden_compra, variante_sku)`
- `CONSTRAINT FK_compras_ocd_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra)`
- `CONSTRAINT FK_compras_ocd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 110: `compras.recepciones_mercancia`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Registro de llegada de camiones al muelle de descarga del CEDIS.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_recepcion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.recepciones_mercancia`. |
| 02 | `folio_recepcion` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio recepcion). |
| 03 | `orden_compra` | `BIGINT` | NO | **FK** | FK → `compras.ordenes_compra(id_orden_compra)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.ordenes_compra(id_orden_compra)`. |
| 04 | `numero_remision_proveedor` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra numero remision proveedor. |
| 05 | `fecha_ingreso_muelle` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha ingreso muelle. |
| 06 | `observaciones_chofer_transporte` | `NVARCHAR(250)` / `VARCHAR(250)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de observaciones chofer transporte en `compras.recepciones_mercancia`. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_recepciones PRIMARY KEY CLUSTERED (id_recepcion)`
- `CONSTRAINT UQ_compras_rm_folio UNIQUE (folio_recepcion)`
- `CONSTRAINT FK_compras_rm_oc FOREIGN KEY (orden_compra) REFERENCES compras.ordenes_compra(id_orden_compra)`

**Índices Secundarios Explícitos:**
- `IX_compras_recep_oc_fecha (orden_compra, fecha_ingreso_muelle)`

---

### FICHA TÉCNICA 111: `compras.recepciones_detalles`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria**
- **Descripción Operativa del Negocio:** Bultos recibidos y control de temperatura de llegada en sueros.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_recepcion_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.recepciones_detalles`. |
| 02 | `recepcion` | `BIGINT` | NO | **FK** | FK → `compras.recepciones_mercancia(id_recepcion)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.recepciones_mercancia(id_recepcion)`. |
| 03 | `variante_sku` | `BIGINT` | NO | **FK** | FK → `catalogo.variantes_sku(id_variante_sku)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 04 | `cantidad_recibida_bultos` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad recibida bultos. |
| 05 | `cantidad_unidades_inspeccionadas` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad unidades inspeccionadas. |
| 06 | `temperatura_llegada_celsius` | `DECIMAL(4,1)` / `NUMERIC(4,1)` | SÍ | - | - | Sin Dato Personal | Crítico para dermocosmética y sueros. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_recepciones_det PRIMARY KEY CLUSTERED (id_recepcion_detalle)`
- `CONSTRAINT FK_compras_recd_recepcion FOREIGN KEY (recepcion) REFERENCES compras.recepciones_mercancia(id_recepcion)`
- `CONSTRAINT FK_compras_recd_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

---

### FICHA TÉCNICA 112: `compras.inspecciones_sanitarias_qa`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria COFEPRIS**
- **Descripción Operativa del Negocio:** Validación de sellos intactos, empaques sin fugas y dictamen de QA.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_inspeccion_qa` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `compras.inspecciones_sanitarias_qa`. |
| 02 | `recepcion_detalle` | `BIGINT` | NO | **FK** | FK → `compras.recepciones_detalles(id_recepcion_detalle)` | Sin Dato Personal | Llave foránea que vincula este registro con `compras.recepciones_detalles(id_recepcion_detalle)`. |
| 03 | `sellos_sanitarios_intactos` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: sellos sanitarios intactos. |
| 04 | `empaque_sin_derrames` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: empaque sin derrames. |
| 05 | `codigo_lote_laboratorio` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo lote laboratorio. |
| 06 | `fecha_caducidad_impresa` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha caducidad impresa. |
| 07 | `dictamen_qa` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `dictamen_qa IN (N'APROBADO', N'RECHAZADO_DEVOLVER', N'RETENIDO_EN_CUARENTENA')` | Sin Dato Personal | Clasificación controlada de dominio para dictamen qa. |
| 08 | `justificacion_sanitaria` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de justificacion sanitaria en `compras.inspecciones_sanitarias_qa`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_compras_inspecciones_qa PRIMARY KEY CLUSTERED (id_inspeccion_qa)`
- `CONSTRAINT FK_compras_qa_recdetalle FOREIGN KEY (recepcion_detalle) REFERENCES compras.recepciones_detalles(id_recepcion_detalle)`

**Índices Secundarios Explícitos:**
- `IX_compras_qa_detalle_dictamen (recepcion_detalle, dictamen_qa)`

---

### FICHA TÉCNICA 113: `wms.almacenes_cedis`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** CEDIS principales y almacenes con capacidad volumétrica.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_almacen` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.almacenes_cedis`. |
| 02 | `codigo_almacen` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo almacen. |
| 03 | `nombre_almacen` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | CEDIS Norte Monclova, CEDIS Centro CDMX. |
| 04 | `calle_numero` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de calle numero en `wms.almacenes_cedis`. |
| 05 | `codigo_postal` | `VARCHAR(10)` | NO | - | - | Dato Personal Identificativo | Código identificador estandarizado de codigo postal. |
| 06 | `ciudad` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de ciudad en `wms.almacenes_cedis`. |
| 07 | `capacidad_volumetrica_m3` | `DECIMAL(10,2)` / `NUMERIC(10,2)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a capacidad volumetrica m3. |
| 08 | `cuenta_con_cadena_frio` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: cuenta con cadena frio. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_almacenes PRIMARY KEY CLUSTERED (id_almacen)`
- `CONSTRAINT UQ_wms_cedis_codigo UNIQUE (codigo_almacen)`

---

### FICHA TÉCNICA 114: `wms.zonas_almacen`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria**
- **Descripción Operativa del Negocio:** Zonas operativas (Refrigerada, Cosméticos, Inflamables, Cuarentena).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_zona_almacen` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.zonas_almacen`. |
| 02 | `almacen` | `BIGINT` | NO | **FK**, UQ | FK → `wms.almacenes_cedis(id_almacen)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `wms.almacenes_cedis(id_almacen)`. |
| 03 | `codigo_zona` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | UQ | UNIQUE | Sin Dato Personal | ZONA_REFRIGERADA, ZONA_COSMETICA_SECA, ZONA_ESMALTES_INFLAMABLE, ZONA_CUARENTENA. |
| 04 | `descripcion` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 05 | `temperatura_min_celsius` | `DECIMAL(4,1)` / `NUMERIC(4,1)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a temperatura min celsius. |
| 06 | `temperatura_max_celsius` | `DECIMAL(4,1)` / `NUMERIC(4,1)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a temperatura max celsius. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_zonas PRIMARY KEY CLUSTERED (id_zona_almacen)`
- `CONSTRAINT UQ_wms_za_almacen_zona UNIQUE (almacen, codigo_zona)`
- `CONSTRAINT FK_wms_za_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen)`

---

### FICHA TÉCNICA 115: `wms.pasillos_ubicaciones`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Racks y bines con código de ubicación y capacidad en kilogramos.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_ubicacion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.pasillos_ubicaciones`. |
| 02 | `zona_almacen` | `BIGINT` | NO | **FK** | FK → `wms.zonas_almacen(id_zona_almacen)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.zonas_almacen(id_zona_almacen)`. |
| 03 | `codigo_ubicacion` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | P01-R04-N02-B01 (Pasillo-Rack-Nivel-Bin). |
| 04 | `peso_maximo_kg` | `DECIMAL(8,2)` / `NUMERIC(8,2)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a peso maximo kg. |
| 05 | `es_bloqueada_auditoria` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es bloqueada auditoria. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_ubicaciones PRIMARY KEY CLUSTERED (id_ubicacion)`
- `CONSTRAINT UQ_wms_pu_codigo UNIQUE (codigo_ubicacion)`
- `CONSTRAINT FK_wms_pu_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen)`

---

### FICHA TÉCNICA 116: `wms.tipos_movimiento_inventario`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Catálogo (18)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Naturaleza del movimiento (Entrada, Venta, Merma, Ajuste).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tipo_movimiento` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.tipos_movimiento_inventario`. |
| 02 | `codigo_movimiento` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo movimiento. |
| 03 | `nombre_movimiento` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | ENTRADA_RECEPCION_OC, SALIDA_VENTA_ORDEN, AJUSTE_CONTEO_FISICO, MERMA_CADUCIDAD, TRASPASO_CEDIS. |
| 04 | `signo_afectacion` | `INT` | NO | - | CHK: `signo_afectacion IN (1, -1)` | Sin Dato Personal | Atributo de dominio que almacena el valor de signo afectacion en `wms.tipos_movimiento_inventario`. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_tipos_movimiento PRIMARY KEY CLUSTERED (id_tipo_movimiento)`
- `CONSTRAINT UQ_wms_tmi_codigo UNIQUE (codigo_movimiento)`

---

### FICHA TÉCNICA 117: `wms.lotes_fabricacion_sanitaria`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria FEFO**
- **Descripción Operativa del Negocio:** Lotes de laboratorio con fechas de caducidad para despacho FEFO.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_lote` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.lotes_fabricacion_sanitaria`. |
| 02 | `variante_sku` | `BIGINT` | NO | **FK**, UQ | FK → `catalogo.variantes_sku(id_variante_sku)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.variantes_sku(id_variante_sku)`. |
| 03 | `numero_lote_fabricante` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero lote fabricante. |
| 04 | `fecha_fabricacion` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha fabricacion. |
| 05 | `fecha_caducidad` | `DATE` | NO | - | - | Sin Dato Personal | Clave para algoritmo FEFO (First Expired, First Out). |
| 06 | `certificado_calidad_lote_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (certificado calidad lote url). |
| 07 | `cuarentena_sanitaria` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: cuarentena sanitaria. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_lotes PRIMARY KEY CLUSTERED (id_lote)`
- `CONSTRAINT UQ_wms_lfs_sku_lote UNIQUE (variante_sku, numero_lote_fabricante)`
- `CONSTRAINT FK_wms_lfs_sku FOREIGN KEY (variante_sku) REFERENCES catalogo.variantes_sku(id_variante_sku)`

**Índices Secundarios Explícitos:**
- `IX_wms_lotes_sku_caducidad (variante_sku, fecha_caducidad)`

---

### FICHA TÉCNICA 118: `wms.inventario_lotes_ubicacion`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Stock físico disponible y apartado en cada rack por SKU y Lote.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_inventario_stock` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.inventario_lotes_ubicacion`. |
| 02 | `lote` | `BIGINT` | NO | **FK**, UQ | FK → `wms.lotes_fabricacion_sanitaria(id_lote)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `wms.lotes_fabricacion_sanitaria(id_lote)`. |
| 03 | `ubicacion` | `BIGINT` | NO | **FK**, UQ | FK → `wms.pasillos_ubicaciones(id_ubicacion)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `wms.pasillos_ubicaciones(id_ubicacion)`. |
| 04 | `stock_disponible` | `INT` | NO | - | CHK: `stock_disponible >= 0` | Sin Dato Personal | Valor numérico cuantitativo que registra stock disponible. |
| 05 | `stock_apartado_pedidos` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra stock apartado pedidos. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_inventario_stock PRIMARY KEY CLUSTERED (id_inventario_stock)`
- `CONSTRAINT UQ_wms_ilu_lote_ubic UNIQUE (lote, ubicacion)`
- `CONSTRAINT FK_wms_ilu_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote)`
- `CONSTRAINT FK_wms_ilu_ubicacion FOREIGN KEY (ubicacion) REFERENCES wms.pasillos_ubicaciones(id_ubicacion)`

**Índices Secundarios Explícitos:**
- `IX_wms_inv_lote_ubicacion (lote, ubicacion)`

---

### FICHA TÉCNICA 119: `wms.kardex_movimientos`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Bitácora Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Kardex continuo de entradas y salidas con saldo resultante.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_kardex` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.kardex_movimientos`. |
| 02 | `inventario_stock` | `BIGINT` | NO | **FK** | FK → `wms.inventario_lotes_ubicacion(id_inventario_stock)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.inventario_lotes_ubicacion(id_inventario_stock)`. |
| 03 | `tipo_movimiento` | `BIGINT` | NO | **FK** | FK → `wms.tipos_movimiento_inventario(id_tipo_movimiento)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.tipos_movimiento_inventario(id_tipo_movimiento)`. |
| 04 | `cantidad_movimiento` | `INT` | NO | - | CHK: `cantidad_movimiento > 0` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad movimiento. |
| 05 | `saldo_anterior` | `INT` | NO | - | - | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo anterior. |
| 06 | `saldo_resultante` | `INT` | NO | - | - | Dato Financiero / Patrimonial | Importe monetario en MXN correspondiente a saldo resultante. |
| 07 | `folio_documento_origen` | `NVARCHAR(50)` / `VARCHAR(50)` | NO | - | - | Sin Dato Personal | Folio de OC, Orden Venta, o Acta Merma. |
| 08 | `costo_unitario_movimiento` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo unitario movimiento. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_kardex PRIMARY KEY CLUSTERED (id_kardex)`
- `CONSTRAINT FK_wms_km_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock)`
- `CONSTRAINT FK_wms_km_tipo FOREIGN KEY (tipo_movimiento) REFERENCES wms.tipos_movimiento_inventario(id_tipo_movimiento)`

---

### FICHA TÉCNICA 120: `wms.alertas_caducidad_proxima`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria / Comercial**
- **Descripción Operativa del Negocio:** Alertas automáticas a 90, 60 y 30 días de vencer para venta flash.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_alerta_caducidad` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.alertas_caducidad_proxima`. |
| 02 | `lote` | `BIGINT` | NO | **FK** | FK → `wms.lotes_fabricacion_sanitaria(id_lote)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.lotes_fabricacion_sanitaria(id_lote)`. |
| 03 | `dias_restantes_vida_util` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra dias restantes vida util. |
| 04 | `nivel_urgencia` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `nivel_urgencia IN (N'PREVENTIVA_90D', N'MODERADA_60D', N'CRITICA_30D', N'EXPIRADO')` | Sin Dato Personal | Valor numérico cuantitativo que registra nivel urgencia. |
| 05 | `accion_comercial_sugerida` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Poner en venta flash con descuento o retirar. |
| 06 | `atendida` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: atendida. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_alertas_caducidad PRIMARY KEY CLUSTERED (id_alerta_caducidad)`
- `CONSTRAINT FK_wms_acp_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote)`

**Índices Secundarios Explícitos:**
- `IX_wms_alertas_lote_atendida (lote, atendida, dias_restantes_vida_util)`

---

### FICHA TÉCNICA 121: `wms.mermas_destruccion_sanitaria`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria COFEPRIS**
- **Descripción Operativa del Negocio:** Actas de destrucción de producto caducado con manifiesto ecológico.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_merma_destruccion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.mermas_destruccion_sanitaria`. |
| 02 | `folio_acta_destruccion` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio acta destruccion). |
| 03 | `lote` | `BIGINT` | NO | **FK** | FK → `wms.lotes_fabricacion_sanitaria(id_lote)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.lotes_fabricacion_sanitaria(id_lote)`. |
| 04 | `cantidad_unidades_destruidas` | `INT` | NO | - | CHK: `cantidad_unidades_destruidas >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad unidades destruidas. |
| 05 | `motivo_sanitario` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Sin Dato Personal | Caducado, Contaminación microbiana, Envase quebrado. |
| 06 | `empresa_manifiesto_ecologico` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Sin Dato Personal | Empresa de residuos biológico-químicos. |
| 07 | `acta_circunstanciada_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (acta circunstanciada url). |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_mermas_destruccion PRIMARY KEY CLUSTERED (id_merma_destruccion)`
- `CONSTRAINT UQ_wms_mds_folio UNIQUE (folio_acta_destruccion)`
- `CONSTRAINT FK_wms_mds_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote)`

---

### FICHA TÉCNICA 122: `wms.transferencias_almacenes`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Traspaso de mercancía entre CEDIS Norte y CEDIS Centro.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_transferencia` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.transferencias_almacenes`. |
| 02 | `folio_transferencia` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio transferencia). |
| 03 | `almacen_origen` | `BIGINT` | NO | **FK** | FK → `wms.almacenes_cedis(id_almacen)` | Sin Dato Personal | Referencia al almacén CEDIS que abastece o origina el envío hacia el punto pickup. |
| 04 | `almacen_destino` | `BIGINT` | NO | **FK** | FK → `wms.almacenes_cedis(id_almacen)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.almacenes_cedis(id_almacen)`. |
| 05 | `estado_transferencia` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `estado_transferencia IN (N'SOLICITADA', N'EN_TRANSITO', N'RECIBIDA_COMPLETA', N'DISCREPANCIA')` | Sin Dato Personal | Clasificación controlada de dominio para estado transferencia. |
| 06 | `fecha_despacho` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha despacho. |
| 07 | `fecha_arribo` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha arribo. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_transferencias PRIMARY KEY CLUSTERED (id_transferencia)`
- `CONSTRAINT UQ_wms_ta_folio UNIQUE (folio_transferencia)`
- `CONSTRAINT FK_wms_ta_origen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen)`
- `CONSTRAINT FK_wms_ta_destino FOREIGN KEY (almacen_destino) REFERENCES wms.almacenes_cedis(id_almacen)`

---

### FICHA TÉCNICA 123: `wms.transferencias_detalles`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Desglose de lotes y piezas enviadas vs recibidas en traspaso.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_transferencia_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.transferencias_detalles`. |
| 02 | `transferencia` | `BIGINT` | NO | **FK** | FK → `wms.transferencias_almacenes(id_transferencia)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.transferencias_almacenes(id_transferencia)`. |
| 03 | `lote` | `BIGINT` | NO | **FK** | FK → `wms.lotes_fabricacion_sanitaria(id_lote)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.lotes_fabricacion_sanitaria(id_lote)`. |
| 04 | `cantidad_enviada` | `INT` | NO | - | CHK: `cantidad_enviada >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad enviada. |
| 05 | `cantidad_recibida` | `INT` | NO | - | DEF: `0` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad recibida. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_transferencias_det PRIMARY KEY CLUSTERED (id_transferencia_detalle)`
- `CONSTRAINT FK_wms_td_transf FOREIGN KEY (transferencia) REFERENCES wms.transferencias_almacenes(id_transferencia)`
- `CONSTRAINT FK_wms_td_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote)`

---

### FICHA TÉCNICA 124: `wms.conteos_ciclicos_auditoria`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Auditoría FBD**
- **Descripción Operativa del Negocio:** Auditorías periódicas de inventario físico en almacén.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_conteo_ciclico` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.conteos_ciclicos_auditoria`. |
| 02 | `folio_auditoria` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio auditoria). |
| 03 | `almacen` | `BIGINT` | NO | **FK** | FK → `wms.almacenes_cedis(id_almacen)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.almacenes_cedis(id_almacen)`. |
| 04 | `fecha_conteo` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha conteo. |
| 05 | `tipo_conteo` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `tipo_conteo IN (N'ALEATORIO', N'ALTO_VALOR_SKU', N'PROXIMO_A_CADUCAR')` | Sin Dato Personal | Clasificación controlada de dominio para tipo conteo. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_conteos_auditoria PRIMARY KEY CLUSTERED (id_conteo_ciclico)`
- `CONSTRAINT UQ_wms_cca_folio UNIQUE (folio_auditoria)`
- `CONSTRAINT FK_wms_cca_almacen FOREIGN KEY (almacen) REFERENCES wms.almacenes_cedis(id_almacen)`

---

### FICHA TÉCNICA 125: `wms.conteos_ciclicos_detalles`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Auditoría FBD**
- **Descripción Operativa del Negocio:** Discrepancias entre stock del sistema y conteo físico manual.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_conteo_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.conteos_ciclicos_detalles`. |
| 02 | `conteo_ciclico` | `BIGINT` | NO | **FK** | FK → `wms.conteos_ciclicos_auditoria(id_conteo_ciclico)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.conteos_ciclicos_auditoria(id_conteo_ciclico)`. |
| 03 | `inventario_stock` | `BIGINT` | NO | **FK** | FK → `wms.inventario_lotes_ubicacion(id_inventario_stock)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.inventario_lotes_ubicacion(id_inventario_stock)`. |
| 04 | `stock_sistema_teorico` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra stock sistema teorico. |
| 05 | `stock_conteo_fisico` | `INT` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra stock conteo fisico. |
| 06 | `diferencia_piezas` | `INT` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de diferencia piezas en `wms.conteos_ciclicos_detalles`. |
| 07 | `justificacion_ajuste` | `NVARCHAR(250)` / `VARCHAR(250)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de justificacion ajuste en `wms.conteos_ciclicos_detalles`. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_conteos_detalles PRIMARY KEY CLUSTERED (id_conteo_detalle)`
- `CONSTRAINT FK_wms_ccd_conteo FOREIGN KEY (conteo_ciclico) REFERENCES wms.conteos_ciclicos_auditoria(id_conteo_ciclico)`
- `CONSTRAINT FK_wms_ccd_stock FOREIGN KEY (inventario_stock) REFERENCES wms.inventario_lotes_ubicacion(id_inventario_stock)`

---

### FICHA TÉCNICA 126: `wms.monitoreo_temperatura_humedad`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria IoT**
- **Descripción Operativa del Negocio:** Telemetría IoT en tiempo real para preservar cadena de frío de sueros.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_telemetria_sensor` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `wms.monitoreo_temperatura_humedad`. |
| 02 | `zona_almacen` | `BIGINT` | NO | **FK** | FK → `wms.zonas_almacen(id_zona_almacen)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.zonas_almacen(id_zona_almacen)`. |
| 03 | `codigo_sensor_iot` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo sensor iot. |
| 04 | `temperatura_registrada_celsius` | `DECIMAL(4,1)` / `NUMERIC(4,1)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a temperatura registrada celsius. |
| 05 | `humedad_relativa_porcentaje` | `DECIMAL(4,1)` / `NUMERIC(4,1)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de humedad relativa porcentaje en `wms.monitoreo_temperatura_humedad`. |
| 06 | `alerta_fuera_de_rango` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: alerta fuera de rango. |
| 07 | `fecha_hora_lectura` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha hora lectura. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_wms_monitoreo_iot PRIMARY KEY CLUSTERED (id_telemetria_sensor)`
- `CONSTRAINT FK_wms_mth_zona FOREIGN KEY (zona_almacen) REFERENCES wms.zonas_almacen(id_zona_almacen)`

**Índices Secundarios Explícitos:**
- `IX_wms_telemetria_zona_fecha (zona_almacen, alerta_fuera_de_rango, fecha_hora_lectura)`

---

### FICHA TÉCNICA 127: `envios.transportistas_paqueterias`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Catálogo (19)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Paqueterías integradas (DHL, FedEx, Estafeta, Flotilla Propia).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_transportista` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.transportistas_paqueterias`. |
| 02 | `codigo_transportista` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo transportista. |
| 03 | `nombre_comercial` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | DHL_EXPRESS, FEDEX, ESTAFETA, REDPACK, REPARTO_LOCAL_PROPIO. |
| 04 | `api_endpoint_tracking` | `NVARCHAR(250)` / `VARCHAR(250)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de api endpoint tracking en `envios.transportistas_paqueterias`. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_transportistas PRIMARY KEY CLUSTERED (id_transportista)`
- `CONSTRAINT UQ_envios_tp_codigo UNIQUE (codigo_transportista)`

---

### FICHA TÉCNICA 128: `envios.tipos_servicio_envio`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Catálogo (20)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Modalidades de entrega (Mismo Día, Día Siguiente, Estándar).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_servicio_envio` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.tipos_servicio_envio`. |
| 02 | `codigo_servicio` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo servicio. |
| 03 | `nombre_servicio` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | DIA_SIGUIENTE, ESTANDAR_TERRESTRE_3_5_DIAS, MISMO_DIA_EXPRESS. |
| 04 | `tiempo_garantizado_horas` | `INT` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de tiempo garantizado horas en `envios.tipos_servicio_envio`. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_tipos_servicio PRIMARY KEY CLUSTERED (id_servicio_envio)`
- `CONSTRAINT UQ_envios_tse_codigo UNIQUE (codigo_servicio)`

---

### FICHA TÉCNICA 129: `envios.tarifas_zonas_postales`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Comercial**
- **Descripción Operativa del Negocio:** Matriz de costos de envío según código postal y peso volumétrico.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tarifa_zona` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.tarifas_zonas_postales`. |
| 02 | `transportista` | `BIGINT` | NO | **FK** | FK → `envios.transportistas_paqueterias(id_transportista)` | Sin Dato Personal | Referencia a la paquetería o transportista responsable del despacho o punto pickup. |
| 03 | `servicio_envio` | `BIGINT` | NO | **FK** | FK → `envios.tipos_servicio_envio(id_servicio_envio)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.tipos_servicio_envio(id_servicio_envio)`. |
| 04 | `codigo_postal_origen_prefijo` | `VARCHAR(3)` | NO | - | - | Dato Personal Identificativo | Código identificador estandarizado de codigo postal origen prefijo. |
| 05 | `codigo_postal_destino_prefijo` | `VARCHAR(3)` | NO | - | - | Dato Personal Identificativo | Código identificador estandarizado de codigo postal destino prefijo. |
| 06 | `peso_limite_kg` | `DECIMAL(6,2)` / `NUMERIC(6,2)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a peso limite kg. |
| 07 | `costo_base_envio` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo base envio. |
| 08 | `costo_kg_adicional` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo kg adicional. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_tarifas PRIMARY KEY CLUSTERED (id_tarifa_zona)`
- `CONSTRAINT FK_envios_tzp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista)`
- `CONSTRAINT FK_envios_tzp_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio)`

---

### FICHA TÉCNICA 130: `envios.despachos_orden`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Órdenes de despacho asignadas a transportista con fecha compromiso.
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 5

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_despacho` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.despachos_orden`. |
| 02 | `folio_despacho` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio despacho). |
| 03 | `orden_split` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes_splits_almacen(id_orden_split)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes_splits_almacen(id_orden_split)`. |
| 04 | `transportista` | `BIGINT` | NO | **FK** | FK → `envios.transportistas_paqueterias(id_transportista)` | Sin Dato Personal | Referencia a la paquetería o transportista responsable del despacho o punto pickup. |
| 05 | `servicio_envio` | `BIGINT` | NO | **FK** | FK → `envios.tipos_servicio_envio(id_servicio_envio)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.tipos_servicio_envio(id_servicio_envio)`. |
| 06 | `fecha_recoleccion_paqueteria` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha recoleccion paqueteria. |
| 07 | `fecha_promesa_entrega` | `DATE` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha promesa entrega. |
| 08 | `fecha_entrega_real` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha entrega real. |
| 09 | `estado_envio` | `NVARCHAR(25)` / `VARCHAR(30)` | NO | - | CHK: `estado_envio IN (N'PREPARANDO_PAQUETE', N'RECOLECTADO', N'EN_TRANSITO', N'EN_RUTA_LOCAL', N'ENTREGADO', N'INCIDENCIA')` | Sin Dato Personal | Clasificación controlada de dominio para estado envio. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_despachos PRIMARY KEY CLUSTERED (id_despacho)`
- `CONSTRAINT UQ_envios_do_folio UNIQUE (folio_despacho)`
- `CONSTRAINT FK_envios_do_split FOREIGN KEY (orden_split) REFERENCES ventas.ordenes_splits_almacen(id_orden_split)`
- `CONSTRAINT FK_envios_do_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista)`
- `CONSTRAINT FK_envios_do_servicio FOREIGN KEY (servicio_envio) REFERENCES envios.tipos_servicio_envio(id_servicio_envio)`

**Índices Secundarios Explícitos:**
- `IX_envios_despachos_split_est (orden_split, estado_envio)`

---

### FICHA TÉCNICA 131: `envios.paquetes_bultos`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Logística**
- **Descripción Operativa del Negocio:** Dimensiones, peso bruto y peso volumétrico calculado de cada caja.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_paquete_bulto` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.paquetes_bultos`. |
| 02 | `despacho` | `BIGINT` | NO | **FK** | FK → `envios.despachos_orden(id_despacho)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.despachos_orden(id_despacho)`. |
| 03 | `codigo_bulto` | `NVARCHAR(40)` / `VARCHAR(40)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo bulto. |
| 04 | `peso_bruto_kg` | `DECIMAL(6,2)` / `NUMERIC(6,2)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a peso bruto kg. |
| 05 | `alto_cm` | `DECIMAL(5,1)` / `NUMERIC(5,1)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a alto cm. |
| 06 | `ancho_cm` | `DECIMAL(5,1)` / `NUMERIC(5,1)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a ancho cm. |
| 07 | `largo_cm` | `DECIMAL(5,1)` / `NUMERIC(5,1)` | NO | - | - | Sin Dato Personal | Medición física estandarizada correspondiente a largo cm. |
| 08 | `peso_volumetrico_kg` | `COMPUTED (PERSISTED)` / `NUMERIC(8,2)` | SÍ | - | - | Sin Dato Personal | Peso volumétrico calculado automáticamente: (alto × ancho × largo) / 5000. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_paquetes PRIMARY KEY CLUSTERED (id_paquete_bulto)`
- `CONSTRAINT UQ_envios_pb_codigo UNIQUE (codigo_bulto)`
- `CONSTRAINT FK_envios_pb_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho)`

---

### FICHA TÉCNICA 132: `envios.paquetes_contenido_lotes`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Trazabilidad Sanitaria**
- **Descripción Operativa del Negocio:** Registro de qué lote y SKU específico fue embalado en cada caja.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_contenido_paquete` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.paquetes_contenido_lotes`. |
| 02 | `paquete_bulto` | `BIGINT` | NO | **FK** | FK → `envios.paquetes_bultos(id_paquete_bulto)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.paquetes_bultos(id_paquete_bulto)`. |
| 03 | `orden_detalle` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes_detalles(id_orden_detalle)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes_detalles(id_orden_detalle)`. |
| 04 | `lote` | `BIGINT` | NO | **FK** | FK → `wms.lotes_fabricacion_sanitaria(id_lote)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.lotes_fabricacion_sanitaria(id_lote)`. |
| 05 | `cantidad_piezas_en_paquete` | `INT` | NO | - | CHK: `cantidad_piezas_en_paquete >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad piezas en paquete. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_contenido_lotes PRIMARY KEY CLUSTERED (id_contenido_paquete)`
- `CONSTRAINT FK_envios_pcl_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto)`
- `CONSTRAINT FK_envios_pcl_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle)`
- `CONSTRAINT FK_envios_pcl_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote)`

---

### FICHA TÉCNICA 133: `envios.guias_rastreo`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Logística**
- **Descripción Operativa del Negocio:** Números de rastreo (tracking) y etiquetas generadas en PDF.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_guia_rastreo` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.guias_rastreo`. |
| 02 | `paquete_bulto` | `BIGINT` | NO | **FK** | FK → `envios.paquetes_bultos(id_paquete_bulto)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.paquetes_bultos(id_paquete_bulto)`. |
| 03 | `numero_guia_tracking` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | UQ | UNIQUE | Sin Dato Personal | Valor numérico cuantitativo que registra numero guia tracking. |
| 04 | `url_rastreo_directo` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de url rastreo directo en `envios.guias_rastreo`. |
| 05 | `etiqueta_pdf_base64_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (etiqueta pdf base64 url). |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_guias PRIMARY KEY CLUSTERED (id_guia_rastreo)`
- `CONSTRAINT UQ_envios_gr_guia UNIQUE (numero_guia_tracking)`
- `CONSTRAINT FK_envios_gr_paquete FOREIGN KEY (paquete_bulto) REFERENCES envios.paquetes_bultos(id_paquete_bulto)`

---

### FICHA TÉCNICA 134: `envios.eventos_tracking_bitacora`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Bitácora
- **Clasificación LFPDPPP / Regulatoria:** **Logística**
- **Descripción Operativa del Negocio:** Webhooks de paqueterías reportando tránsitos y escalas.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_evento_tracking` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.eventos_tracking_bitacora`. |
| 02 | `guia_rastreo` | `BIGINT` | NO | **FK** | FK → `envios.guias_rastreo(id_guia_rastreo)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.guias_rastreo(id_guia_rastreo)`. |
| 03 | `codigo_estatus_paqueteria` | `NVARCHAR(40)` / `VARCHAR(40)` | NO | - | - | Sin Dato Personal | Código identificador estandarizado de codigo estatus paqueteria. |
| 04 | `descripcion_evento` | `NVARCHAR(250)` / `VARCHAR(250)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion evento. |
| 05 | `ubicacion_ciudad_evento` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de ubicacion ciudad evento en `envios.eventos_tracking_bitacora`. |
| 06 | `fecha_hora_evento` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha hora evento. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_eventos_tracking PRIMARY KEY CLUSTERED (id_evento_tracking)`
- `CONSTRAINT FK_envios_etb_guia FOREIGN KEY (guia_rastreo) REFERENCES envios.guias_rastreo(id_guia_rastreo)`

---

### FICHA TÉCNICA 135: `envios.intentos_entrega_fallidos`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Logística**
- **Descripción Operativa del Negocio:** Intentos no concretados por domicilio cerrado o cliente ausente.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_intento_fallido` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.intentos_entrega_fallidos`. |
| 02 | `despacho` | `BIGINT` | NO | **FK** | FK → `envios.despachos_orden(id_despacho)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.despachos_orden(id_despacho)`. |
| 03 | `numero_visita` | `INT` | NO | - | CHK: `numero_visita BETWEEN 1 AND 3` | Sin Dato Personal | Valor numérico cuantitativo que registra numero visita. |
| 04 | `motivo_no_entrega` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Domicilio cerrado, Destinatario ausente. |
| 05 | `fecha_intento` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha intento. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_intentos_fallidos PRIMARY KEY CLUSTERED (id_intento_fallido)`
- `CONSTRAINT FK_envios_ief_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho)`

---

### FICHA TÉCNICA 136: `envios.incidencias_logisticas`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Legal / Seguros**
- **Descripción Operativa del Negocio:** Reportes formales de paquetes dañados, derrames o extravíos.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_incidencia_logistica` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.incidencias_logisticas`. |
| 02 | `despacho` | `BIGINT` | NO | **FK** | FK → `envios.despachos_orden(id_despacho)` | Sin Dato Personal | Llave foránea que vincula este registro con `envios.despachos_orden(id_despacho)`. |
| 03 | `tipo_incidencia` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `tipo_incidencia IN (N'EXTRAVIO_TOTAL', N'PAQUETE_DANADO_DERRAME', N'ROBO_EN_TRANSITO', N'DIRECCION_INEXISTENTE')` | Sin Dato Personal | Clasificación controlada de dominio para tipo incidencia. |
| 04 | `descripcion_hechos` | `NVARCHAR(500)` / `VARCHAR(500)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion hechos. |
| 05 | `indemnizacion_reclamada` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de indemnizacion reclamada en `envios.incidencias_logisticas`. |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_incidencias PRIMARY KEY CLUSTERED (id_incidencia_logistica)`
- `CONSTRAINT FK_envios_il_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho)`

---

### FICHA TÉCNICA 137: `envios.seguros_mercancia`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Financiero**
- **Descripción Operativa del Negocio:** Pólizas de cobertura de carga contra siniestros en tránsito.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_seguro_envio` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.seguros_mercancia`. |
| 02 | `despacho` | `BIGINT` | NO | **FK**, UQ | FK → `envios.despachos_orden(id_despacho)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `envios.despachos_orden(id_despacho)`. |
| 03 | `aseguradora` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de aseguradora en `envios.seguros_mercancia`. |
| 04 | `numero_poliza` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Valor numérico cuantitativo que registra numero poliza. |
| 05 | `valor_asegurado` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de valor asegurado en `envios.seguros_mercancia`. |
| 06 | `costo_prima` | `DECIMAL(12,2)` / `NUMERIC(12,2)` | NO | - | - | Sin Dato Personal | Importe monetario en MXN correspondiente a costo prima. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_seguros PRIMARY KEY CLUSTERED (id_seguro_envio)`
- `CONSTRAINT UQ_envios_sm_despacho UNIQUE (despacho)`
- `CONSTRAINT FK_envios_sm_despacho FOREIGN KEY (despacho) REFERENCES envios.despachos_orden(id_despacho)`

---

### FICHA TÉCNICA 138: `envios.puntos_recoleccion_pickup`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Lockers inteligentes y puntos de entrega para recolección física.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_punto_pickup` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `envios.puntos_recoleccion_pickup`. |
| 02 | `transportista` | `BIGINT` | NO | **FK** | FK → `envios.transportistas_paqueterias(id_transportista)` | Sin Dato Personal | Referencia a la paquetería o transportista responsable del despacho o punto pickup. |
| 03 | `almacen_origen` | `BIGINT` | NO | **FK** | FK → `wms.almacenes_cedis(id_almacen)` | Sin Dato Personal | Referencia al almacén CEDIS que abastece o origina el envío hacia el punto pickup. |
| 04 | `codigo_locker` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo locker. |
| 05 | `nombre_establecimiento` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre establecimiento. |
| 06 | `direccion_completa` | `NVARCHAR(200)` / `VARCHAR(200)` | NO | - | - | Dato Personal Identificativo | Atributo de dominio que almacena el valor de direccion completa en `envios.puntos_recoleccion_pickup`. |
| 07 | `horario_atencion` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de horario atencion en `envios.puntos_recoleccion_pickup`. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_envios_pickup PRIMARY KEY CLUSTERED (id_punto_pickup)`
- `CONSTRAINT UQ_envios_prp_codigo UNIQUE (codigo_locker)`
- `CONSTRAINT FK_envios_prp_transp FOREIGN KEY (transportista) REFERENCES envios.transportistas_paqueterias(id_transportista)`
- `CONSTRAINT FK_envios_prp_almacen FOREIGN KEY (almacen_origen) REFERENCES wms.almacenes_cedis(id_almacen)`

---

### FICHA TÉCNICA 139: `postventa.motivos_devolucion_rma`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Catálogo (21)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Motivos de retorno (Alergia cutánea, Tono incorrecto, Daño físico).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_motivo_rma` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.motivos_devolucion_rma`. |
| 02 | `codigo_motivo` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo motivo. |
| 03 | `descripcion_motivo` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | REACCION_ALERGICA_CUTANEA, TONO_INCORRECTO, PRODUCTO_CADUCADO, SELLO_ROTO, NO_SATISFECHO. |
| 04 | `requiere_dictamen_medico` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: requiere dictamen medico. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_motivos_rma PRIMARY KEY CLUSTERED (id_motivo_rma)`
- `CONSTRAINT UQ_postventa_mr_codigo UNIQUE (codigo_motivo)`

---

### FICHA TÉCNICA 140: `postventa.solicitudes_rma`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal / Sanitario**
- **Descripción Operativa del Negocio:** Devoluciones solicitadas por clientes con fotografías de evidencia.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 4

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_solicitud_rma` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.solicitudes_rma`. |
| 02 | `folio_rma` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio rma). |
| 03 | `orden` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes(id_orden)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes(id_orden)`. |
| 04 | `motivo_rma` | `BIGINT` | NO | **FK** | FK → `postventa.motivos_devolucion_rma(id_motivo_rma)` | Sin Dato Personal | Llave foránea que vincula este registro con `postventa.motivos_devolucion_rma(id_motivo_rma)`. |
| 05 | `estado_rma` | `NVARCHAR(20)` / `VARCHAR(30)` | NO | - | CHK: `estado_rma IN (N'SOLICITADA', N'GUIA_RETORNO_EMITIDA', N'RECIBIDA_EN_QA', N'APROBADA_REEMBOLSAR', N'RECHAZADA_POR_HIGIENE')` | Sin Dato Personal | Clasificación controlada de dominio para estado rma. |
| 06 | `fotografia_evidencia_url` | `NVARCHAR(300)` / `VARCHAR(300)` | NO | - | - | **Dato Personal Sensible (Salud)** | Dirección URL o ruta segura de acceso al recurso digital (fotografia evidencia url). |
| 07 | `descripcion_caso_cliente` | `NVARCHAR(500)` / `VARCHAR(500)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion caso cliente. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_solicitudes_rma PRIMARY KEY CLUSTERED (id_solicitud_rma)`
- `CONSTRAINT UQ_postventa_srma_folio UNIQUE (folio_rma)`
- `CONSTRAINT FK_postventa_srma_orden FOREIGN KEY (orden) REFERENCES ventas.ordenes(id_orden)`
- `CONSTRAINT FK_postventa_srma_motivo FOREIGN KEY (motivo_rma) REFERENCES postventa.motivos_devolucion_rma(id_motivo_rma)`

**Índices Secundarios Explícitos:**
- `IX_postventa_rma_orden_motivo (orden, motivo_rma, estado_rma)`

---

### FICHA TÉCNICA 141: `postventa.rma_detalles`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** SKUs y piezas reclamadas en la solicitud de devolución.
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_rma_detalle` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.rma_detalles`. |
| 02 | `solicitud_rma` | `BIGINT` | NO | **FK** | FK → `postventa.solicitudes_rma(id_solicitud_rma)` | Sin Dato Personal | Llave foránea que vincula este registro con `postventa.solicitudes_rma(id_solicitud_rma)`. |
| 03 | `orden_detalle` | `BIGINT` | NO | **FK** | FK → `ventas.ordenes_detalles(id_orden_detalle)` | Sin Dato Personal | Llave foránea que vincula este registro con `ventas.ordenes_detalles(id_orden_detalle)`. |
| 04 | `cantidad_devuelta` | `INT` | NO | - | CHK: `cantidad_devuelta >= 1` | Sin Dato Personal | Valor numérico cuantitativo que registra cantidad devuelta. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_rma_detalles PRIMARY KEY CLUSTERED (id_rma_detalle)`
- `CONSTRAINT FK_postventa_rd_rma FOREIGN KEY (solicitud_rma) REFERENCES postventa.solicitudes_rma(id_solicitud_rma)`
- `CONSTRAINT FK_postventa_rd_ordendet FOREIGN KEY (orden_detalle) REFERENCES ventas.ordenes_detalles(id_orden_detalle)`

---

### FICHA TÉCNICA 142: `postventa.inspeccion_sanitaria_retorno`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria Higiénica**
- **Descripción Operativa del Negocio:** Dictamen técnico de cuarentena (destrucción obligatoria por higiene).
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_inspeccion_retorno` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.inspeccion_sanitaria_retorno`. |
| 02 | `rma_detalle` | `BIGINT` | NO | **FK**, UQ | FK → `postventa.rma_detalles(id_rma_detalle)`; UNIQUE | Sin Dato Personal | Llave foránea que vincula este registro con `postventa.rma_detalles(id_rma_detalle)`. |
| 03 | `sello_seguridad_fue_abierto` | `BIT` / `BOOLEAN` | NO | - | - | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a sello seguridad fue abierto. |
| 04 | `contenido_usado_porcentaje` | `DECIMAL(4,1)` / `NUMERIC(4,1)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de contenido usado porcentaje en `postventa.inspeccion_sanitaria_retorno`. |
| 05 | `destino_sanitario_autorizado` | `NVARCHAR(30)` / `VARCHAR(40)` | NO | - | CHK: `destino_sanitario_autorizado IN (N'DESTRUCCION_INMEDIATA_RESIDUOS', N'DONACION_REACONDICIONADA', N'REINGRESO_STOCK_SELLADO')` | Sin Dato Personal | Atributo de dominio que almacena el valor de destino sanitario autorizado en `postventa.inspeccion_sanitaria_retorno`. |
| 06 | `dictamen_auditor` | `NVARCHAR(250)` / `VARCHAR(250)` | NO | - | - | Sin Dato Personal | Clasificación controlada de dominio para dictamen auditor. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_inspeccion_retorno PRIMARY KEY CLUSTERED (id_inspeccion_retorno)`
- `CONSTRAINT UQ_postventa_isr_rmadetalle UNIQUE (rma_detalle)`
- `CONSTRAINT FK_postventa_isr_rmadetalle FOREIGN KEY (rma_detalle) REFERENCES postventa.rma_detalles(id_rma_detalle)`

---

### FICHA TÉCNICA 143: `postventa.tickets_soporte`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Casos de atención al cliente y reclamaciones de servicio.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_ticket` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.tickets_soporte`. |
| 02 | `folio_ticket` | `NVARCHAR(35)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Número de folio único de control operativo (folio ticket). |
| 03 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 04 | `asunto` | `NVARCHAR(120)` / `VARCHAR(120)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de asunto en `postventa.tickets_soporte`. |
| 05 | `categoria_ticket` | `NVARCHAR(30)` / `VARCHAR(30)` | NO | - | CHK: `categoria_ticket IN (N'ENVIO_DEMORADO', N'ASESORIA_DERMATOLOGICA', N'FACTURACION_CFDI', N'PRODUCTO_DEFECTUOSO')` | Sin Dato Personal | Clasificación controlada de dominio para categoria ticket. |
| 06 | `prioridad` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `prioridad IN (N'BAJA', N'MEDIA', N'ALTA', N'URGENTE')` | Sin Dato Personal | Clasificación controlada de dominio para prioridad. |
| 07 | `estado_ticket` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `estado_ticket IN (N'ABIERTO', N'EN_PROCESO', N'ESPERANDO_CLIENTE', N'RESUELTO', N'CERRADO')` | Sin Dato Personal | Clasificación controlada de dominio para estado ticket. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_tickets PRIMARY KEY CLUSTERED (id_ticket)`
- `CONSTRAINT UQ_postventa_ts_folio UNIQUE (folio_ticket)`
- `CONSTRAINT FK_postventa_ts_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`

---

### FICHA TÉCNICA 144: `postventa.tickets_mensajes`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Conversación y seguimiento entre agente y cliente.
- **Total de Columnas:** 12 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_ticket_mensaje` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.tickets_mensajes`. |
| 02 | `ticket` | `BIGINT` | NO | **FK** | FK → `postventa.tickets_soporte(id_ticket)` | Sin Dato Personal | Llave foránea que vincula este registro con `postventa.tickets_soporte(id_ticket)`. |
| 03 | `usuario_emisor` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 04 | `mensaje_cuerpo` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de mensaje cuerpo en `postventa.tickets_mensajes`. |
| 05 | `adjunto_url` | `NVARCHAR(300)` / `VARCHAR(300)` | SÍ | - | - | Sin Dato Personal | Dirección URL o ruta segura de acceso al recurso digital (adjunto url). |
| 06 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 07 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 08 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 09 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 10 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 11 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 12 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_tickets_mensajes PRIMARY KEY CLUSTERED (id_ticket_mensaje)`
- `CONSTRAINT FK_postventa_tm_ticket FOREIGN KEY (ticket) REFERENCES postventa.tickets_soporte(id_ticket)`
- `CONSTRAINT FK_postventa_tm_usuario FOREIGN KEY (usuario_emisor) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 145: `postventa.reportes_farmacovigilancia`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Sanitaria COFEPRIS**
- **Descripción Operativa del Negocio:** Notificación formal de reacciones adversas dermatológicas severas.
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 5

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_reporte_farmacovigilancia` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `postventa.reportes_farmacovigilancia`. |
| 02 | `folio_cofepris_ram` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | UQ | UNIQUE | Sin Dato Personal | Reporte de Reacciones Adversas a Medicamentos / Cosméticos. |
| 03 | `cliente` | `BIGINT` | NO | **FK** | FK → `clientes.clientes(id_cliente)` | Sin Dato Personal | Llave foránea que vincula este registro con `clientes.clientes(id_cliente)`. |
| 04 | `producto` | `BIGINT` | NO | **FK** | FK → `catalogo.productos_maestros(id_producto)` | Sin Dato Personal | Llave foránea que vincula este registro con `catalogo.productos_maestros(id_producto)`. |
| 05 | `lote` | `BIGINT` | NO | **FK** | FK → `wms.lotes_fabricacion_sanitaria(id_lote)` | Sin Dato Personal | Llave foránea que vincula este registro con `wms.lotes_fabricacion_sanitaria(id_lote)`. |
| 06 | `sintomas_reaccion_adversa` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | **Dato Personal Sensible (Salud)** | Atributo de dominio que almacena el valor de sintomas reaccion adversa en `postventa.reportes_farmacovigilancia`. |
| 07 | `requirio_atencion_hospitalaria` | `BIT` / `BOOLEAN` | NO | - | - | **Dato Personal Sensible (Salud)** | Atributo de dominio que almacena el valor de requirio atencion hospitalaria en `postventa.reportes_farmacovigilancia`. |
| 08 | `fecha_aparicion_sintomas` | `DATE` | NO | - | - | **Dato Personal Sensible (Salud)** | Fecha y/o marca temporal registrada para fecha aparicion sintomas. |
| 09 | `notificado_a_autoridad_sanitaria` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: notificado a autoridad sanitaria. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_postventa_farmacovigilancia PRIMARY KEY CLUSTERED (id_reporte_farmacovigilancia)`
- `CONSTRAINT UQ_postventa_rf_folio UNIQUE (folio_cofepris_ram)`
- `CONSTRAINT FK_postventa_rf_cliente FOREIGN KEY (cliente) REFERENCES clientes.clientes(id_cliente)`
- `CONSTRAINT FK_postventa_rf_producto FOREIGN KEY (producto) REFERENCES catalogo.productos_maestros(id_producto)`
- `CONSTRAINT FK_postventa_rf_lote FOREIGN KEY (lote) REFERENCES wms.lotes_fabricacion_sanitaria(id_lote)`

---

### FICHA TÉCNICA 146: `auditoria.tipos_evento_sistema`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Catálogo (22)
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Catálogo de eventos auditables (Login, Soft Delete, Cambio Precios).
- **Total de Columnas:** 11 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_tipo_evento` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `auditoria.tipos_evento_sistema`. |
| 02 | `codigo_evento` | `NVARCHAR(30)` / `VARCHAR(35)` | NO | UQ | UNIQUE | Sin Dato Personal | Código identificador estandarizado de codigo evento. |
| 03 | `nombre_evento` | `NVARCHAR(80)` / `VARCHAR(80)` | NO | - | - | Sin Dato Personal | LOGIN_EXITOSO, INTENTO_ACCESO_DENEGADO, MODIFICACION_PRECIOS, BAJA_LOGICA_REGISTRO, EXPORTACION_DATOS_CLIENTES. |
| 04 | `nivel_severidad` | `NVARCHAR(20)` / `VARCHAR(25)` | NO | - | CHK: `nivel_severidad IN (N'INFO', N'ADVERTENCIA', N'CRITICO_SEGURIDAD')` | Sin Dato Personal | Valor numérico cuantitativo que registra nivel severidad. |
| 05 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 06 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 07 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 08 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 09 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 10 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 11 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_auditoria_tipos_evento PRIMARY KEY CLUSTERED (id_tipo_evento)`
- `CONSTRAINT UQ_auditoria_tes_codigo UNIQUE (codigo_evento)`

---

### FICHA TÉCNICA 147: `auditoria.bitacora_seguridad_global`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Bitácora Forense
- **Clasificación LFPDPPP / Regulatoria:** **Ciberseguridad Penal**
- **Descripción Operativa del Negocio:** Trazabilidad con firma HMAC/SHA-256 (Arts. 211 bis 1–7 CPF).
- **Total de Columnas:** 16 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_log_seguridad` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `auditoria.bitacora_seguridad_global`. |
| 02 | `tipo_evento` | `BIGINT` | NO | **FK** | FK → `auditoria.tipos_evento_sistema(id_tipo_evento)` | Sin Dato Personal | Llave foránea que vincula este registro con `auditoria.tipos_evento_sistema(id_tipo_evento)`. |
| 03 | `usuario` | `BIGINT` | SÍ | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 04 | `direccion_ip` | `NVARCHAR(45)` / `VARCHAR(45)` | NO | - | - | Dato Personal Identificativo | Dirección IPv4/IPv6 de origen de la sesión o evento de seguridad. |
| 05 | `user_agent` | `NVARCHAR(350)` / `VARCHAR(350)` | NO | - | - | Dato Personal Identificativo | Cadena de identificación del navegador, dispositivo y sistema operativo del cliente. |
| 06 | `modulo_origen` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de modulo origen en `auditoria.bitacora_seguridad_global`. |
| 07 | `descripcion_evento` | `NVARCHAR(500)` / `VARCHAR(500)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion evento. |
| 08 | `firma_integridad_hash` | `NVARCHAR(128)` / `VARCHAR(128)` | NO | - | - | Sin Dato Personal | Firma criptográfica SHA-256/HMAC del evento forense para prevenir alteración de bitácoras. |
| 09 | `fecha_evento` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha evento. |
| 10 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 11 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 12 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 13 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 14 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 15 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 16 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_auditoria_seguridad PRIMARY KEY CLUSTERED (id_log_seguridad)`
- `CONSTRAINT FK_auditoria_bsg_tipo FOREIGN KEY (tipo_evento) REFERENCES auditoria.tipos_evento_sistema(id_tipo_evento)`
- `CONSTRAINT FK_auditoria_bsg_usuario FOREIGN KEY (usuario) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 148: `auditoria.bitacora_cambios_datos`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Bitácora DML
- **Clasificación LFPDPPP / Regulatoria:** **Forense / Integridad**
- **Descripción Operativa del Negocio:** Historial de valores anteriores y nuevos en formato JSON.
- **Total de Columnas:** 14 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_cambio_dato` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `auditoria.bitacora_cambios_datos`. |
| 02 | `nombre_tabla` | `NVARCHAR(100)` / `VARCHAR(100)` | NO | - | - | Sin Dato Personal | Denominación o nombre descriptivo de nombre tabla. |
| 03 | `id_registro_afectado` | `BIGINT` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de id registro afectado en `auditoria.bitacora_cambios_datos`. |
| 04 | `tipo_operacion` | `NVARCHAR(15)` / `VARCHAR(15)` | NO | - | CHK: `tipo_operacion IN (N'INSERT', N'UPDATE', N'SOFT_DELETE')` | Sin Dato Personal | Clasificación controlada de dominio para tipo operacion. |
| 05 | `valores_anteriores_json` | `NVARCHAR(MAX)` / `JSONB` | SÍ | - | - | Sin Dato Personal | Instantánea en formato JSON con los valores previos al cambio DML auditado. |
| 06 | `valores_nuevos_json` | `NVARCHAR(MAX)` / `JSONB` | NO | - | - | Sin Dato Personal | Instantánea en formato JSON con los valores resultantes tras la operación DML. |
| 07 | `motivo_cambio` | `NVARCHAR(250)` / `VARCHAR(250)` | SÍ | - | - | Sin Dato Personal | Clasificación controlada de dominio para motivo cambio. |
| 08 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 09 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 10 | `creado_por` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 11 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 12 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 13 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 14 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_auditoria_cambios PRIMARY KEY CLUSTERED (id_cambio_dato)`
- `CONSTRAINT FK_auditoria_bcd_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)`

**Índices Secundarios Explícitos:**
- `IX_auditoria_cambios_tipo_fecha (tipo_operacion, fecha_creacion)`

---

### FICHA TÉCNICA 149: `sistema.parametros_configuracion`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Maestra
- **Clasificación LFPDPPP / Regulatoria:** **Sin Datos Personales**
- **Descripción Operativa del Negocio:** Parámetros del sistema modificables en caliente.
- **Total de Columnas:** 13 · **Restricciones Nombradas:** 3

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_parametro` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `sistema.parametros_configuracion`. |
| 02 | `clave_parametro` | `NVARCHAR(60)` / `VARCHAR(60)` | NO | UQ | UNIQUE | Sin Dato Personal | Dato criptográfico, fiscal o de control técnico correspondiente a clave parametro. |
| 03 | `valor_parametro` | `NVARCHAR(500)` / `VARCHAR(500)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de valor parametro en `sistema.parametros_configuracion`. |
| 04 | `tipo_dato` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `tipo_dato IN (N'STRING', N'INTEGER', N'DECIMAL', N'BOOLEAN', N'JSON')` | Sin Dato Personal | Clasificación controlada de dominio para tipo dato. |
| 05 | `descripcion` | `NVARCHAR(250)` / `VARCHAR(250)` | NO | - | - | Sin Dato Personal | Descripción detallada de negocio correspondiente a descripcion. |
| 06 | `es_modificable_en_caliente` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Sin Dato Personal | Indicador booleano que señala si se cumple la condición: es modificable en caliente. |
| 07 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 08 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 09 | `creado_por` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 10 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 11 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 12 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 13 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_sistema_parametros PRIMARY KEY CLUSTERED (id_parametro)`
- `CONSTRAINT UQ_sistema_pc_clave UNIQUE (clave_parametro)`
- `CONSTRAINT FK_sistema_pc_usuario FOREIGN KEY (creado_por) REFERENCES seguridad.usuarios(id_usuario)`

---

### FICHA TÉCNICA 150: `sistema.notificaciones_push_email`
- **Autor Responsable:** Integrante 3 (Tablas 101–150)
- **Módulo de Pertenencia:** Submódulo 3: Compras, WMS FEFO, Cadena de Frío, Envíos, RMA y Auditoría Forense
- **Clasificación de Tabla:** Transaccional
- **Clasificación LFPDPPP / Regulatoria:** **Dato Personal**
- **Descripción Operativa del Negocio:** Cola de mensajería transaccional enviada a usuarios.
- **Total de Columnas:** 15 · **Restricciones Nombradas:** 2

| No. | Nombre de Columna | Tipo (SQL Server / PostgreSQL) | Nulo | Clave | Restricciones (PK/FK/UQ/CHK/DEF) | Clasificación LFPDPPP | Descripción Semántica del Campo |
| :---: | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| 01 | `id_notificacion` | `BIGINT` | NO | **PK** (ID) | - | Sin Dato Personal | Llave primaria autoincrementable única de la entidad `sistema.notificaciones_push_email`. |
| 02 | `usuario_destinatario` | `BIGINT` | NO | **FK** | FK → `seguridad.usuarios(id_usuario)` | Sin Dato Personal | Llave foránea que vincula este registro con `seguridad.usuarios(id_usuario)`. |
| 03 | `tipo_canal` | `NVARCHAR(20)` / `VARCHAR(20)` | NO | - | CHK: `tipo_canal IN (N'EMAIL', N'PUSH_APP', N'SMS', N'WHATSAPP')` | Sin Dato Personal | Clasificación controlada de dominio para tipo canal. |
| 04 | `titulo_asunto` | `NVARCHAR(150)` / `VARCHAR(150)` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de titulo asunto en `sistema.notificaciones_push_email`. |
| 05 | `cuerpo_mensaje` | `NVARCHAR(MAX)` / `TEXT` | NO | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de cuerpo mensaje en `sistema.notificaciones_push_email`. |
| 06 | `enviada` | `BIT` / `BOOLEAN` | NO | - | DEF: `0` | Sin Dato Personal | Atributo de dominio que almacena el valor de enviada en `sistema.notificaciones_push_email`. |
| 07 | `fecha_envio` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Sin Dato Personal | Fecha y/o marca temporal registrada para fecha envio. |
| 08 | `error_envio` | `NVARCHAR(300)` / `VARCHAR(300)` | SÍ | - | - | Sin Dato Personal | Atributo de dominio que almacena el valor de error envio en `sistema.notificaciones_push_email`. |
| 09 | `activo` | `BIT` / `BOOLEAN` | NO | - | DEF: `1` | Auditoría Interna | Bandera de vigencia lógica (1/TRUE = activo, 0/FALSE = baja lógica Soft Delete). |
| 10 | `fecha_creacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | NO | - | DEF: `SYSDATETIME()` | Auditoría Interna | Marca de tiempo exacta de alta inicial del registro en el sistema. |
| 11 | `creado_por` | `BIGINT` | NO | - | - | Auditoría Interna | Identificador del usuario del sistema responsable de crear el registro. |
| 12 | `fecha_modificacion` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo de la última actualización aplicada al registro. |
| 13 | `modificado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario responsable de la última modificación. |
| 14 | `fecha_baja` | `DATETIME2(3)` / `TIMESTAMPTZ` | SÍ | - | - | Auditoría Interna | Marca de tiempo del borrado lógico (Soft Delete); NULL mientras está vigente. |
| 15 | `eliminado_por` | `BIGINT` | SÍ | - | - | Auditoría Interna | Identificador del usuario que ejecutó la baja lógica del registro. |

**Restricciones de Integridad Declaradas:**
- `CONSTRAINT PK_sistema_notificaciones PRIMARY KEY CLUSTERED (id_notificacion)`
- `CONSTRAINT FK_sistema_npe_usuario FOREIGN KEY (usuario_destinatario) REFERENCES seguridad.usuarios(id_usuario)`

---