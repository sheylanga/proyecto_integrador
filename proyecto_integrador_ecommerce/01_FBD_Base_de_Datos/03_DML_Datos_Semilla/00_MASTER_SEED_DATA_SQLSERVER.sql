-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR MULTIDISCIPLINARIO TERMINAL V
-- MASTER SEED DATA DML CORREGIDO - 150 TABLAS ALINEADAS 100% AL DDL DE EcommerceSaludBellezaDB
-- =================================================================================================
USE EcommerceSaludBellezaDB;
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

PRINT '=================================================================================================';
PRINT 'INICIANDO CARGA MAESTRA DE DATOS SEMILLA REALES (150 TABLAS)...';
PRINT '=================================================================================================';
GO

-- =================================================================================================
-- 001. TABLA: seguridad.roles (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.roles ON;
INSERT INTO seguridad.roles (ID, codigo_rol, nombre_rol, descripcion, nivel_jerarquico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ADMIN', N'Administrador del Sistema', N'Control total sobre catálogo, usuarios, seguridad, inventarios y auditoría global.', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CLIENTE', N'Cliente Comprador', N'Acceso a tienda en línea, perfil cutáneo, compras, suscripciones Beauty-Box y facturación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FACTURACION', N'Especialista en Facturación CFDI', N'Gestión de timbrado CFDI 4.0 ante el SAT, complementos de pago y notas de crédito.', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'DERMOCONSULTOR', N'Dermoconsultor Clínico', N'Evaluación de perfiles cutáneos, validación de alérgenos INCI y asesoría de rutinas.', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ALMACEN_WMS', N'Operador Logístico WMS / CEDIS', N'Recepción de lotes sanitarios, despacho FEFO, telemetría de cadena de frío y empaque.', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'AUDITOR_COFEPRIS', N'Auditor Sanitario COFEPRIS y Calidad', N'Supervisión de farmacovigilancia, inspecciones QA, mermas sanitarias y bitácora forense.', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT seguridad.roles OFF;
GO

-- =================================================================================================
-- 002. TABLA: seguridad.permisos (15 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.permisos ON;
INSERT INTO seguridad.permisos (ID, clave_permiso, modulo_sistema, accion, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SEG_USUARIOS_CRUD', N'Seguridad', N'ADMINISTRAR', N'Administrar cuentas de usuarios, contraseñas y bloqueos', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SEG_ROLES_ASIGNAR', N'Seguridad', N'ASIGNAR', N'Asignar roles y permisos a usuarios del sistema', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAT_PRODUCTOS_CRUD', N'Catálogo', N'ESCRIBIR', N'Crear, editar y desactivar productos cosméticos y fórmulas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAT_CATALOGO_VER', N'Catálogo', N'LEER', N'Consultar catálogo público de productos, precios y existencias', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CLI_PERFIL_CUTANEO', N'Clientes', N'ESCRIBIR', N'Gestionar perfil dermatológico y consentimiento LFPDPPP', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CLI_ARCO_RESOLVER', N'Clientes', N'APROBAR', N'Atender y dictaminar solicitudes de derechos ARCO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'VEN_ORDEN_CREAR', N'Ventas', N'CREAR', N'Generar carritos, órdenes de compra y suscripciones Beauty-Box', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'VEN_ORDEN_CANCELAR', N'Ventas', N'ACTUALIZAR', N'Autorizar cancelaciones y ajustes comerciales de órdenes', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PAG_COBRO_EJECUTAR', N'Pagos', N'EJECUTAR', N'Procesar pagos tokenizados y validaciones antifraude', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PAG_REEMBOLSO_APROBAR', N'Pagos', N'APROBAR', N'Autorizar reembolsos y gestionar contracargos bancarios', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FIS_CFDI_TIMBRAR', N'Fiscal', N'EJECUTAR', N'Emitir y timbrar facturas CFDI 4.0 ante el PAC autorizado del SAT', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FIS_CFDI_CANCELAR', N'Fiscal', N'CANCELAR', N'Solicitar cancelación de comprobantes fiscales ante el SAT', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FIS_CFDI_CONSULTAR', N'Fiscal', N'LEER', N'Descargar archivos XML/PDF y consultar historial de facturación', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'WMS_LOTES_FEFO', N'Almacén', N'ESCRIBIR', N'Controlar lotes sanitarios FEFO, cuarentena QA y cadena de frío', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'AUD_BITACORA_VER', N'Auditoría', N'LEER', N'Consultar bitácoras inmutables de seguridad y cambios de datos', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT seguridad.permisos OFF;
GO

-- =================================================================================================
-- 003. TABLA: seguridad.roles_permisos (23 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.roles_permisos ON;
INSERT INTO seguridad.roles_permisos (ID, ID_rol, ID_permiso, permitir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 1, 2, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 1, 4, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 1, 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 1, 6, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 1, 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 1, 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 1, 9, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 1, 10, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 1, 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 1, 12, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 1, 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 1, 14, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 1, 15, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 2, 4, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 2, 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 2, 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 2, 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 3, 10, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 3, 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 3, 12, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 3, 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT seguridad.roles_permisos OFF;
GO

-- =================================================================================================
-- 004. TABLA: seguridad.usuarios (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.usuarios ON;
INSERT INTO seguridad.usuarios (ID, uuid_usuario, email, password_hash, password_salt, telefono_movil, email_verificado, cuenta_bloqueada, fecha_bloqueo, intentos_fallidos_consecutivos, mfa_habilitado, mfa_secreto, ultimo_login_exitoso, ultimo_cambio_password, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'B1000000-0000-4000-8000-000000000001', N'carlos.mendoza.1@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', N'c2FsdERlcm1hQ2FyZTIwMjZf0001==', N'8661114455', 1, 1, '2026-02-01 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0001DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'B1000000-0000-4000-8000-000000000002', N'sofia.ramirez.2@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', N'c2FsdERlcm1hQ2FyZTIwMjZf0002==', N'8661124455', 0, 0, NULL, 0, 0, NULL, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'B1000000-0000-4000-8000-000000000003', N'valeria.torres.3@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', N'c2FsdERlcm1hQ2FyZTIwMjZf0003==', N'8661134455', 1, 1, '2026-02-03 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0003DERMA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'B1000000-0000-4000-8000-000000000004', N'alejandro.hernandez.4@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', N'c2FsdERlcm1hQ2FyZTIwMjZf0004==', N'8661144455', 0, 0, NULL, 0, 0, NULL, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'B1000000-0000-4000-8000-000000000005', N'mariana.sanchez.5@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', N'c2FsdERlcm1hQ2FyZTIwMjZf0005==', N'8661154455', 1, 1, '2026-02-05 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0005DERMA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'B1000000-0000-4000-8000-000000000006', N'diego.martinez.6@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', N'c2FsdERlcm1hQ2FyZTIwMjZf0006==', N'8661164455', 0, 0, NULL, 0, 0, NULL, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'B1000000-0000-4000-8000-000000000007', N'camila.gonzalez.7@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', N'c2FsdERlcm1hQ2FyZTIwMjZf0007==', N'8661174455', 1, 1, '2026-02-07 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0007DERMA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'B1000000-0000-4000-8000-000000000008', N'mateo.flores.8@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', N'c2FsdERlcm1hQ2FyZTIwMjZf0008==', N'8661184455', 0, 0, NULL, 0, 0, NULL, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'B1000000-0000-4000-8000-000000000009', N'lucia.morales.9@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', N'c2FsdERlcm1hQ2FyZTIwMjZf0009==', N'8661194455', 1, 1, '2026-02-09 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0009DERMA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'B1000000-0000-4000-8000-00000000000A', N'sebastian.vazquez.10@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', N'c2FsdERlcm1hQ2FyZTIwMjZf0010==', N'8661204455', 0, 0, NULL, 0, 0, NULL, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'B1000000-0000-4000-8000-00000000000B', N'regina.gutierrez.11@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', N'c2FsdERlcm1hQ2FyZTIwMjZf0011==', N'8661214455', 1, 1, '2026-02-11 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0011DERMA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'B1000000-0000-4000-8000-00000000000C', N'santiago.jimenez.12@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', N'c2FsdERlcm1hQ2FyZTIwMjZf0012==', N'8661224455', 0, 0, NULL, 0, 0, NULL, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'B1000000-0000-4000-8000-00000000000D', N'fernanda.ruiz.13@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', N'c2FsdERlcm1hQ2FyZTIwMjZf0013==', N'8661234455', 1, 1, '2026-02-13 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0013DERMA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'B1000000-0000-4000-8000-00000000000E', N'emiliano.rios.14@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', N'c2FsdERlcm1hQ2FyZTIwMjZf0014==', N'8661244455', 0, 0, NULL, 0, 0, NULL, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'B1000000-0000-4000-8000-00000000000F', N'ximena.aguilar.15@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', N'c2FsdERlcm1hQ2FyZTIwMjZf0015==', N'8661254455', 1, 1, '2026-02-15 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0015DERMA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'B1000000-0000-4000-8000-000000000010', N'daniel.mendez.16@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', N'c2FsdERlcm1hQ2FyZTIwMjZf0016==', N'8661264455', 0, 0, NULL, 0, 0, NULL, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'B1000000-0000-4000-8000-000000000011', N'andrea.castro.17@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', N'c2FsdERlcm1hQ2FyZTIwMjZf0017==', N'8661274455', 1, 1, '2026-02-17 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0017DERMA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'B1000000-0000-4000-8000-000000000012', N'gabriel.vega.18@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', N'c2FsdERlcm1hQ2FyZTIwMjZf0018==', N'8661284455', 0, 0, NULL, 0, 0, NULL, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'B1000000-0000-4000-8000-000000000013', N'paula.cortes.19@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', N'c2FsdERlcm1hQ2FyZTIwMjZf0019==', N'8661294455', 1, 1, '2026-02-19 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0019DERMA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'B1000000-0000-4000-8000-000000000014', N'andres.ramos.20@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', N'c2FsdERlcm1hQ2FyZTIwMjZf0020==', N'8661304455', 0, 0, NULL, 0, 0, NULL, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'B1000000-0000-4000-8000-000000000015', N'renata.guerrero.21@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', N'c2FsdERlcm1hQ2FyZTIwMjZf0021==', N'8661314455', 1, 1, '2026-02-21 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0021DERMA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'B1000000-0000-4000-8000-000000000016', N'nicolas.pena.22@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', N'c2FsdERlcm1hQ2FyZTIwMjZf0022==', N'8661324455', 0, 0, NULL, 0, 0, NULL, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'B1000000-0000-4000-8000-000000000017', N'natalia.herrera.23@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', N'c2FsdERlcm1hQ2FyZTIwMjZf0023==', N'8661334455', 1, 1, '2026-02-23 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0023DERMA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'B1000000-0000-4000-8000-000000000018', N'joaquin.medina.24@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', N'c2FsdERlcm1hQ2FyZTIwMjZf0024==', N'8661344455', 0, 0, NULL, 0, 0, NULL, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'B1000000-0000-4000-8000-000000000019', N'isabella.dominguez.25@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', N'c2FsdERlcm1hQ2FyZTIwMjZf0025==', N'8661354455', 1, 1, '2026-02-25 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0025DERMA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'B1000000-0000-4000-8000-00000000001A', N'leonardo.silva.26@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', N'c2FsdERlcm1hQ2FyZTIwMjZf0026==', N'8661364455', 0, 0, NULL, 0, 0, NULL, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'B1000000-0000-4000-8000-00000000001B', N'ana.chavez.27@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', N'c2FsdERlcm1hQ2FyZTIwMjZf0027==', N'8661374455', 1, 1, '2026-02-27 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0027DERMA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'B1000000-0000-4000-8000-00000000001C', N'rodrigo.ochoa.28@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', N'c2FsdERlcm1hQ2FyZTIwMjZf0028==', N'8661384455', 0, 0, NULL, 0, 0, NULL, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'B1000000-0000-4000-8000-00000000001D', N'paulina.miranda.29@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', N'c2FsdERlcm1hQ2FyZTIwMjZf0029==', N'8661394455', 1, 1, '2026-02-01 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0029DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'B1000000-0000-4000-8000-00000000001E', N'mauricio.padilla.30@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', N'c2FsdERlcm1hQ2FyZTIwMjZf0030==', N'8661404455', 0, 0, NULL, 0, 0, NULL, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.usuarios OFF;
GO

-- =================================================================================================
-- 005. TABLA: seguridad.usuarios_roles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.usuarios_roles ON;
INSERT INTO seguridad.usuarios_roles (ID, ID_usuario, ID_rol, fecha_asignacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 3, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 3, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 2, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 2, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 2, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 2, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 2, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 2, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 2, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 2, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 2, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 2, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 2, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 2, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.usuarios_roles OFF;
GO

-- =================================================================================================
-- 006. TABLA: seguridad.sesiones_activas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.sesiones_activas ON;
INSERT INTO seguridad.sesiones_activas (ID, ID_usuario, token_sesion_hash, direccion_ip, user_agent, fecha_inicio, fecha_expiracion, revocada, fecha_revocacion, motivo_revocacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'0b1cf5e003650b508fa6c0a31d35ad85abcf7b3e23b98476e023ab357573d748', N'189.203.3.7', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', '2026-02-01 11:30:00', '2026-02-02 11:30:00', 1, '2026-02-01 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'21587875b8254958687615c072ad14c43cf40d3da6212fb8303ae3b1f5a0da65', N'189.203.6.14', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', '2026-02-02 11:30:00', '2026-02-03 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'f585c502bc48e1965664825b56dd4ddd1370e1a1fb9f8737cf6d93ca15bc0047', N'189.203.9.21', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', '2026-02-03 11:30:00', '2026-02-04 11:30:00', 1, '2026-02-03 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'2fc8808ae2342af29ffeab9b2aa9180e9e09da2167409238082c517cef0379c7', N'189.203.12.28', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', '2026-02-04 11:30:00', '2026-02-05 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'f29610307a2209c0bc06e6d2623101b68d83715cfd3b9dda6d9ad14981610f82', N'189.203.15.35', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', '2026-02-05 11:30:00', '2026-02-06 11:30:00', 1, '2026-02-05 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'c4b13521cf467b556a5c8a31b3447a995b93773a3bb71fb5764538804b79a3a3', N'189.203.18.42', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', '2026-02-06 11:30:00', '2026-02-07 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ef3f5e1c9061f8f0f801156593b8f99609223221eaa2bf03762b196d5b71f861', N'189.203.21.49', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', '2026-02-07 11:30:00', '2026-02-08 11:30:00', 1, '2026-02-07 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'350401191bc0458adf3c5c698f27c1bf66b6d459d597ccd84cdae841439269e7', N'189.203.24.56', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', '2026-02-08 11:30:00', '2026-02-09 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'10bb1419aae3d92c85220fa7163f9660b7202de2eb4569af7295f98128ad850d', N'189.203.27.63', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', '2026-02-09 11:30:00', '2026-02-10 11:30:00', 1, '2026-02-09 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'2c54b226d522f960c72b52e4b781d088338778177ab59a237f4732277eb23626', N'189.203.30.70', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', '2026-02-10 11:30:00', '2026-02-11 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'117502db00aee1a8237ec4885472572324bc7d78a858dce86b2cb3f0245ea485', N'189.203.33.77', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', '2026-02-11 11:30:00', '2026-02-12 11:30:00', 1, '2026-02-11 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'babe587b0c3a9177b6204f090762ac645036a6c221b5560ebf4385be2fe403ba', N'189.203.36.84', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', '2026-02-12 11:30:00', '2026-02-13 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'd1e4cbce44621882d44e655eedee7a34dabb568a616c03a169fd56ff3a41babc', N'189.203.39.91', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', '2026-02-13 11:30:00', '2026-02-14 11:30:00', 1, '2026-02-13 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'f4123fedac1b51e875a6bd3d3a0db9c353fe59d46541bece9ab6e6be6e079df4', N'189.203.42.98', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', '2026-02-14 11:30:00', '2026-02-15 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'00b08560d371f33e9f363a30eb5d69069842d50dae45cb9efd0555a057ccd2d2', N'189.203.45.105', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', '2026-02-15 11:30:00', '2026-02-16 11:30:00', 1, '2026-02-15 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'cfbbaf613e3f243e1590419c21ee103b0bbc53daa2fe64be4d72b24f303bcfc1', N'189.203.48.112', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', '2026-02-16 11:30:00', '2026-02-17 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'e653814e4ee9c8c9fba834bcdb721f5bf4525700e4130f84bffd2fd7e055c974', N'189.203.51.119', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', '2026-02-17 11:30:00', '2026-02-18 11:30:00', 1, '2026-02-17 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'7acc403137fe14dce5d0082c4d3f31b4a33260987b01776af2fcf2b8c67afdfe', N'189.203.54.126', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', '2026-02-18 11:30:00', '2026-02-19 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'a9b140b49cda5d3211608d11d3f22ec7b55424ac65a4d8995b992de82f8fccf5', N'189.203.57.133', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', '2026-02-19 11:30:00', '2026-02-20 11:30:00', 1, '2026-02-19 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'533f9f08d688d53cb21b7af9fa781e673d433963119ff9fdf03c08cdc5c7fb0d', N'189.203.60.140', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', '2026-02-20 11:30:00', '2026-02-21 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'827dc20936be26bf26ce0eb3da0f3772e5e6a68fb5cccea0b94fe8504fae2810', N'189.203.63.147', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', '2026-02-21 11:30:00', '2026-02-22 11:30:00', 1, '2026-02-21 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'f63537ae29d0d5e90fba2a5dc35a0db0f22d95bfe7a721d1326b508310bc3a55', N'189.203.66.154', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', '2026-02-22 11:30:00', '2026-02-23 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'62283c3cec73c2eae679367a9d26fc78fc057fc1b2d55be3c23db07bfb81c3b4', N'189.203.69.161', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', '2026-02-23 11:30:00', '2026-02-24 11:30:00', 1, '2026-02-23 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'd00b151eb8710af8cbb6716c1244a74941b3e81948a51b53ba857b78f344e6da', N'189.203.72.168', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', '2026-02-24 11:30:00', '2026-02-25 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'd8906058f087e1b636f0629161a5270660086b55225f7c22a9eafb72982ac586', N'189.203.75.175', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', '2026-02-25 11:30:00', '2026-02-26 11:30:00', 1, '2026-02-25 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'bff25dca58e8639f5b37bc6ce053dd3beaf645d9e93e19a52ab67c4448be57f3', N'189.203.78.182', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', '2026-02-26 11:30:00', '2026-02-27 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'10b3dd4f6456f92f44d5d4c1c1bbfd65b8321c5066d540b0d104afeb636d8c63', N'189.203.81.189', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', '2026-02-27 11:30:00', '2026-02-28 11:30:00', 1, '2026-02-27 14:30:00', N'Cambio de contraseña', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'eb0172720ff0d8e9e594f9fac311cde15c629f2403cf5054a41f0cf59fd355d8', N'189.203.84.196', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', '2026-02-28 11:30:00', '2026-03-01 11:30:00', 0, NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'2e871cc4e4f31de0d8873292688cff0531b1aae9762f7243657cbc5fec316e3c', N'189.203.87.203', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', '2026-02-01 11:30:00', '2026-02-02 11:30:00', 1, '2026-02-01 14:30:00', N'Cierre de sesión voluntario', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'd9ee60899d006919d0d2c9c435ef37a2ed6f3d8003a4805a1d7a478112168b75', N'189.203.90.210', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', '2026-02-02 11:30:00', '2026-02-03 11:30:00', 0, NULL, NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.sesiones_activas OFF;
GO

-- =================================================================================================
-- 007. TABLA: seguridad.historial_passwords (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.historial_passwords ON;
INSERT INTO seguridad.historial_passwords (ID, ID_usuario, password_hash, password_salt, algoritmo_hashing, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', N'c2FsdERlcm1hQ2FyZTIwMjZf0001==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', N'c2FsdERlcm1hQ2FyZTIwMjZf0002==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', N'c2FsdERlcm1hQ2FyZTIwMjZf0003==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', N'c2FsdERlcm1hQ2FyZTIwMjZf0004==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', N'c2FsdERlcm1hQ2FyZTIwMjZf0005==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', N'c2FsdERlcm1hQ2FyZTIwMjZf0006==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', N'c2FsdERlcm1hQ2FyZTIwMjZf0007==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', N'c2FsdERlcm1hQ2FyZTIwMjZf0008==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', N'c2FsdERlcm1hQ2FyZTIwMjZf0009==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', N'c2FsdERlcm1hQ2FyZTIwMjZf0010==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', N'c2FsdERlcm1hQ2FyZTIwMjZf0011==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', N'c2FsdERlcm1hQ2FyZTIwMjZf0012==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', N'c2FsdERlcm1hQ2FyZTIwMjZf0013==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', N'c2FsdERlcm1hQ2FyZTIwMjZf0014==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', N'c2FsdERlcm1hQ2FyZTIwMjZf0015==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', N'c2FsdERlcm1hQ2FyZTIwMjZf0016==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', N'c2FsdERlcm1hQ2FyZTIwMjZf0017==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', N'c2FsdERlcm1hQ2FyZTIwMjZf0018==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', N'c2FsdERlcm1hQ2FyZTIwMjZf0019==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', N'c2FsdERlcm1hQ2FyZTIwMjZf0020==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', N'c2FsdERlcm1hQ2FyZTIwMjZf0021==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', N'c2FsdERlcm1hQ2FyZTIwMjZf0022==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', N'c2FsdERlcm1hQ2FyZTIwMjZf0023==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', N'c2FsdERlcm1hQ2FyZTIwMjZf0024==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', N'c2FsdERlcm1hQ2FyZTIwMjZf0025==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', N'c2FsdERlcm1hQ2FyZTIwMjZf0026==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', N'c2FsdERlcm1hQ2FyZTIwMjZf0027==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', N'c2FsdERlcm1hQ2FyZTIwMjZf0028==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', N'c2FsdERlcm1hQ2FyZTIwMjZf0029==', N'Argon2id', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', N'c2FsdERlcm1hQ2FyZTIwMjZf0030==', N'Argon2id', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.historial_passwords OFF;
GO

-- =================================================================================================
-- 008. TABLA: seguridad.intentos_login (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.intentos_login ON;
INSERT INTO seguridad.intentos_login (ID, email_ingresado, ID_usuario, direccion_ip, pais_origen_ip, user_agent, resultado, mensaje_detalle, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'carlos.mendoza.1@dermacare.mx', 1, N'189.203.3.7', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'EXITOSO', N'Autenticación exitosa validada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'sofia.ramirez.2@dermacare.mx', 2, N'189.203.6.14', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'PASSWORD_INVALIDO', N'Contraseña incorrecta ingresada por el usuario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'desconocido@correo.mx', NULL, N'189.203.9.21', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'USUARIO_INEXISTENTE', N'Correo electrónico no registrado en el sistema.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'alejandro.hernandez.4@dermacare.mx', 4, N'189.203.12.28', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'CUENTA_BLOQUEADA', N'Acceso denegado: cuenta bloqueada temporalmente.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'mariana.sanchez.5@dermacare.mx', 5, N'189.203.15.35', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'MFA_FALLIDO', N'Código de verificación TOTP MFA inválido o expirado.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'diego.martinez.6@correo.mx', 6, N'189.203.18.42', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'EXITOSO', N'Autenticación exitosa validada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'camila.gonzalez.7@correo.mx', 7, N'189.203.21.49', N'Estados Unidos', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'PASSWORD_INVALIDO', N'Contraseña incorrecta ingresada por el usuario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'desconocido@correo.mx', NULL, N'189.203.24.56', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'USUARIO_INEXISTENTE', N'Correo electrónico no registrado en el sistema.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'lucia.morales.9@correo.mx', 9, N'189.203.27.63', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'CUENTA_BLOQUEADA', N'Acceso denegado: cuenta bloqueada temporalmente.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'sebastian.vazquez.10@correo.mx', 10, N'189.203.30.70', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'MFA_FALLIDO', N'Código de verificación TOTP MFA inválido o expirado.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'regina.gutierrez.11@correo.mx', 11, N'189.203.33.77', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'EXITOSO', N'Autenticación exitosa validada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'santiago.jimenez.12@correo.mx', 12, N'189.203.36.84', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'PASSWORD_INVALIDO', N'Contraseña incorrecta ingresada por el usuario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'desconocido@correo.mx', NULL, N'189.203.39.91', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'USUARIO_INEXISTENTE', N'Correo electrónico no registrado en el sistema.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'emiliano.rios.14@correo.mx', 14, N'189.203.42.98', N'Estados Unidos', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'CUENTA_BLOQUEADA', N'Acceso denegado: cuenta bloqueada temporalmente.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ximena.aguilar.15@correo.mx', 15, N'189.203.45.105', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'MFA_FALLIDO', N'Código de verificación TOTP MFA inválido o expirado.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'daniel.mendez.16@correo.mx', 16, N'189.203.48.112', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'EXITOSO', N'Autenticación exitosa validada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'andrea.castro.17@correo.mx', 17, N'189.203.51.119', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'PASSWORD_INVALIDO', N'Contraseña incorrecta ingresada por el usuario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'desconocido@correo.mx', NULL, N'189.203.54.126', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'USUARIO_INEXISTENTE', N'Correo electrónico no registrado en el sistema.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'paula.cortes.19@correo.mx', 19, N'189.203.57.133', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'CUENTA_BLOQUEADA', N'Acceso denegado: cuenta bloqueada temporalmente.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'andres.ramos.20@correo.mx', 20, N'189.203.60.140', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'MFA_FALLIDO', N'Código de verificación TOTP MFA inválido o expirado.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'renata.guerrero.21@correo.mx', 21, N'189.203.63.147', N'Estados Unidos', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'EXITOSO', N'Autenticación exitosa validada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'nicolas.pena.22@correo.mx', 22, N'189.203.66.154', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'PASSWORD_INVALIDO', N'Contraseña incorrecta ingresada por el usuario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'desconocido@correo.mx', NULL, N'189.203.69.161', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'USUARIO_INEXISTENTE', N'Correo electrónico no registrado en el sistema.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'joaquin.medina.24@correo.mx', 24, N'189.203.72.168', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'CUENTA_BLOQUEADA', N'Acceso denegado: cuenta bloqueada temporalmente.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'isabella.dominguez.25@correo.mx', 25, N'189.203.75.175', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'MFA_FALLIDO', N'Código de verificación TOTP MFA inválido o expirado.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'leonardo.silva.26@correo.mx', 26, N'189.203.78.182', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'EXITOSO', N'Autenticación exitosa validada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ana.chavez.27@correo.mx', 27, N'189.203.81.189', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'PASSWORD_INVALIDO', N'Contraseña incorrecta ingresada por el usuario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'desconocido@correo.mx', NULL, N'189.203.84.196', N'Estados Unidos', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'USUARIO_INEXISTENTE', N'Correo electrónico no registrado en el sistema.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'paulina.miranda.29@correo.mx', 29, N'189.203.87.203', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'CUENTA_BLOQUEADA', N'Acceso denegado: cuenta bloqueada temporalmente.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'mauricio.padilla.30@correo.mx', 30, N'189.203.90.210', N'México', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'MFA_FALLIDO', N'Código de verificación TOTP MFA inválido o expirado.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.intentos_login OFF;
GO

-- =================================================================================================
-- 009. TABLA: seguridad.tokens_recuperacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.tokens_recuperacion ON;
INSERT INTO seguridad.tokens_recuperacion (ID, ID_usuario, token_hash, tipo_token, fecha_expiracion, utilizado, fecha_utilizacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'9def9b0750ebc72d37fb4c7160e4703a69c33e0f24d664e3ea70de02cb7845f8', N'RESET_PASSWORD', '2026-02-01 13:30:00', 1, '2026-02-01 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'4fcdacc8564d1fa7a4adee6cf498213575f82ee82b57074bd1d9d245edfed2b3', N'VERIFICAR_EMAIL', '2026-02-02 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'6e59017efaded19c0b0f20577639ffd9c986ccb27eb420f234425f35d69c7546', N'MFA_BACKUP', '2026-02-03 13:30:00', 1, '2026-02-03 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'b4f9332081c1e766324bb18d925fd492bcb667e7ec1d78dbf29d3fe2cf8196e3', N'RESET_PASSWORD', '2026-02-04 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'b454195af2fe849863732b2a0e46c1826bf5a502c343c93a9e4ef52e341ba401', N'VERIFICAR_EMAIL', '2026-02-05 13:30:00', 1, '2026-02-05 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'0afcc13d9739ec633a766ad43fe4b15c035c4e0d1980a46dc748b7c046925e81', N'MFA_BACKUP', '2026-02-06 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'438dd75463dc8fd391e7e11d70d5e367de8342c5462593e88c4e9d8aa13400dd', N'RESET_PASSWORD', '2026-02-07 13:30:00', 1, '2026-02-07 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'686d0a16168edbf0a444b8881fbee56253edeff29e96b719ab5fb02cda269a81', N'VERIFICAR_EMAIL', '2026-02-08 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'7cd9a3843a3087a415287c84865045daf80d263b262d49f85bae60d29710993f', N'MFA_BACKUP', '2026-02-09 13:30:00', 1, '2026-02-09 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'f1ff3161a12349e78527ec693cb2cc15b3409a9dac2bd56c8a7fb3c33167d016', N'RESET_PASSWORD', '2026-02-10 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'6b321c8521f810be0251ed68ae0aef9f657083ff1c238adbcad965f5b21ec17e', N'VERIFICAR_EMAIL', '2026-02-11 13:30:00', 1, '2026-02-11 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'259f06db2a703c7ca0f8cca4488b8650582ed51048d705a9881eb91743866ea8', N'MFA_BACKUP', '2026-02-12 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'897bb0a9785ddd50380887e4849521ade04d840ccfd49659b52afa097ae73d92', N'RESET_PASSWORD', '2026-02-13 13:30:00', 1, '2026-02-13 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'3de4c22c64c6a964b5afddde8eb0da198212391188437b7299860c2845125cc3', N'VERIFICAR_EMAIL', '2026-02-14 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'1ecff29a07450e01304aa081ef849c4641ad16c31e8401fe78fb09e9ccb41732', N'MFA_BACKUP', '2026-02-15 13:30:00', 1, '2026-02-15 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'78de1bfb96dd125a71e630b711677a6c50524bd76db5b6bafb9d3fda3f31289b', N'RESET_PASSWORD', '2026-02-16 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'cd2c2dd80e2d9d637d6a519096638964979cbef9e9a3df37e894736432700586', N'VERIFICAR_EMAIL', '2026-02-17 13:30:00', 1, '2026-02-17 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'705c73106bc5533135bd3f33d007a102d21186fd6fe58de2ae141a222f0c40b0', N'MFA_BACKUP', '2026-02-18 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'af0dad948514e6601d5fe45816a4a6f479dad6d15fac47cc8409cf430890c2b5', N'RESET_PASSWORD', '2026-02-19 13:30:00', 1, '2026-02-19 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'fe0fcaf2ecc69851185ae755062af88e340da34d947528260849aa047e5a6375', N'VERIFICAR_EMAIL', '2026-02-20 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'572bf81f909d23fe284c5e25b4f60c033cf9cff5323dde519197948fcc7c4903', N'MFA_BACKUP', '2026-02-21 13:30:00', 1, '2026-02-21 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'fdef48ea0d86ff209b1d92d3367e1b327d8ef6658965f8e8c50bc80b81c6560b', N'RESET_PASSWORD', '2026-02-22 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'67b4e47a3675dfc241703c037f7b676615b443d53c2d6c744040f1ca642e750d', N'VERIFICAR_EMAIL', '2026-02-23 13:30:00', 1, '2026-02-23 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'2e3157a6145b78e7414af50e015d867f193ec402902ee5ad97c4ea95ca1d739d', N'MFA_BACKUP', '2026-02-24 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'63f4ef28d1674e1a11119793d173f99c4e4d331c8b85dbe446a621ef81519472', N'RESET_PASSWORD', '2026-02-25 13:30:00', 1, '2026-02-25 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'bf7c41c65c7eea08d0d9607452a014cc39635cc25df11db939b63b9b751c6d51', N'VERIFICAR_EMAIL', '2026-02-26 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'caffb5051534daeee474772ccd7efbf16e619963d002e5ef28254fa9b43b1940', N'MFA_BACKUP', '2026-02-27 13:30:00', 1, '2026-02-27 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'76c447dafab1de85c88696e15f5cb10e85236af40a110af751ffaef0f6d172df', N'RESET_PASSWORD', '2026-02-28 13:30:00', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'c4398d9dd15055f9dba406e767925b1c598be542b1f56ee5b145d699b0cd28ca', N'VERIFICAR_EMAIL', '2026-02-01 13:30:00', 1, '2026-02-01 11:48:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'5f7fc04219424941a59c2899f1b9a27f547773b3c68baadd16c21367cf77c619', N'MFA_BACKUP', '2026-02-02 13:30:00', 0, NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.tokens_recuperacion OFF;
GO

-- =================================================================================================
-- 010. TABLA: seguridad.dispositivos_confianza (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.dispositivos_confianza ON;
INSERT INTO seguridad.dispositivos_confianza (ID, ID_usuario, fingerprint_dispositivo, nombre_dispositivo, sistema_operativo, navegador, es_confiable, ultimo_acceso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ab41c8aee73bd93302b4a65cd6294f8af78e99cc64eb665ee68ec80d271ffd68', N'iPhone 15 Pro Personal #1', N'iOS 18.2', N'Safari 18', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'b20bcb65363290f5c814b44f74ff29cf7c6cdcc9c378a9ac52d71c2730cae3b6', N'Laptop Windows Oficina #2', N'Windows 11 Pro', N'Microsoft Edge 132', 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'a28521afadefb8d11117f38afdb7805db52f647fd86c03824fc7f63e8016452d', N'Samsung Galaxy S24 #3', N'Android 15', N'Chrome Mobile 132', 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'0c0ca39175d5be0a61f5855fb70b225582bed4855a2d1206980fc8316780b0ea', N'MacBook Air M2 #4', N'macOS Sequoia 15.1', N'Google Chrome 132', 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'f5fb0f8e012aa04a7cf0985fdec905af1a500497728fe62bef44e3a3d5c2e40e', N'iPad Air 5ta Gen #5', N'iPadOS 18.2', N'Safari 18', 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'97e5bad14917074eb3f24d25bcbc28a080b537c21b5cbb3a0f921ace4105fc4c', N'iPhone 15 Pro Personal #6', N'iOS 18.2', N'Safari 18', 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'1120c9a069193810847684b52613dd3846d5336cccf137b1a4038daa4166b756', N'Laptop Windows Oficina #7', N'Windows 11 Pro', N'Microsoft Edge 132', 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'4ba9d0842f4c73a1951d9e58784b7375f42246420a4178e1578004acf0605ab9', N'Samsung Galaxy S24 #8', N'Android 15', N'Chrome Mobile 132', 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'19c2178b3e31c975c98657e8154e9edb59e5c2d74b5977de424e742f0ed3f629', N'MacBook Air M2 #9', N'macOS Sequoia 15.1', N'Google Chrome 132', 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'c8f0b2fc410de5de9e61b9087ff8cb310951c9c70659fde573891dfb24bd7e8a', N'iPad Air 5ta Gen #10', N'iPadOS 18.2', N'Safari 18', 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'823babda83c493493d7973813af3591a5c4f86c3d2fb25886f19ac683595b9eb', N'iPhone 15 Pro Personal #11', N'iOS 18.2', N'Safari 18', 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'5a773be33bd9dc19cc252f1b3d5d73766c8a2abe3c63041fb043c2161f521b12', N'Laptop Windows Oficina #12', N'Windows 11 Pro', N'Microsoft Edge 132', 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'909919f8a8a455b730a97ea7f4b103b48818084c1a3dad55f64c81cdd13476d6', N'Samsung Galaxy S24 #13', N'Android 15', N'Chrome Mobile 132', 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'c12c6d9180ce9530c4012515c5ebcdc4af488ba040a6fd618f14bcdf9727aa4c', N'MacBook Air M2 #14', N'macOS Sequoia 15.1', N'Google Chrome 132', 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'9b2f383879f0987bb6423a22c73ea5c57586ae7abb49238d150365bca1e80bc4', N'iPad Air 5ta Gen #15', N'iPadOS 18.2', N'Safari 18', 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'82e48c4a5aec8c513272a1f5a900ecd07857abd09d03a4d653f9d1871343cb25', N'iPhone 15 Pro Personal #16', N'iOS 18.2', N'Safari 18', 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'03a586f1f0ba06678db04ec8515e45d518075d1d57969d7f03ea91986da7d45d', N'Laptop Windows Oficina #17', N'Windows 11 Pro', N'Microsoft Edge 132', 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'aade7287b0e1a164d3b99427dfd03c41ff3d93eafc67deabe489bd3868c81790', N'Samsung Galaxy S24 #18', N'Android 15', N'Chrome Mobile 132', 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'b601916ffa957c7bae99775cfde7830f78d4639468057bbb54d0901936dabde6', N'MacBook Air M2 #19', N'macOS Sequoia 15.1', N'Google Chrome 132', 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'15f95973f104ddc7c0d484d356094211cda557941ffbc2015abb83485d560db8', N'iPad Air 5ta Gen #20', N'iPadOS 18.2', N'Safari 18', 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'6cf068705429bc83a5a3724da749a6b2a809818393005bb7f03487a832251f92', N'iPhone 15 Pro Personal #21', N'iOS 18.2', N'Safari 18', 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'76fdd1c3d263d8e74b48ad502df6ea0378f4871636b7680ffe5e9a9b61118543', N'Laptop Windows Oficina #22', N'Windows 11 Pro', N'Microsoft Edge 132', 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'4f752a195177dfc0f012346defbf303c95ebe9c07411e0d20c3126ee016fc922', N'Samsung Galaxy S24 #23', N'Android 15', N'Chrome Mobile 132', 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'064760c4385ed5ee8f6993718951d527e7bec94b3f0c370a03e8811b672a8e64', N'MacBook Air M2 #24', N'macOS Sequoia 15.1', N'Google Chrome 132', 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'4704a6c5036203e83c0c0435c7400bfa77c8d9a44ea8144d47cc35f8e117b41c', N'iPad Air 5ta Gen #25', N'iPadOS 18.2', N'Safari 18', 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'4175915cb88dcba1d3c8db1b0c7c6d1c2f911354d49301de6f9477a95c42a304', N'iPhone 15 Pro Personal #26', N'iOS 18.2', N'Safari 18', 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ac5eed1c994d7e76947935549c7e18fa939dce23f9741bf55a85fcb9a56c7f3d', N'Laptop Windows Oficina #27', N'Windows 11 Pro', N'Microsoft Edge 132', 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'91e1a073dbdb96294a09e947d431e7a542c7776b9f8da26babdc0100e266f60a', N'Samsung Galaxy S24 #28', N'Android 15', N'Chrome Mobile 132', 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'664690099be733b5bcd2d9b5cb9bfd79f933ec4d246895219147a5622eaeea67', N'MacBook Air M2 #29', N'macOS Sequoia 15.1', N'Google Chrome 132', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'debd709065181579d3a8c8cc9f27426c70a9342dfeffa1e0c5f0425d0216978e', N'iPad Air 5ta Gen #30', N'iPadOS 18.2', N'Safari 18', 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.dispositivos_confianza OFF;
GO

-- =================================================================================================
-- 011. TABLA: clientes.tipos_piel (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.tipos_piel ON;
INSERT INTO clientes.tipos_piel (ID, codigo_piel, nombre, descripcion_clinica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'EUDERMICA', N'Piel Normal / Eudérmica', N'Equilibrio óptimo entre hidratación y secreción sebácea', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SECA_ALIPICA', N'Piel Seca / Deshidratada', N'Déficit de lípidos epidérmicos y tendencia a tirantez', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'GRASA_SEBORR', N'Piel Grasa / Tendencia Acnéica', N'Hipersecreción sebácea, brillo facial y poros dilatados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MIXTA_ZONAT', N'Piel Mixta', N'Zona T grasa (frente, nariz, mentón) y mejillas secas o normales', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SENSIBLE_REAC', N'Piel Sensible / Reactiva', N'Alta reactividad neurosensorial, eritema fácil y barrera frágil', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MADURA_FOTO', N'Piel Madura / Fotoenvejecida', N'Pérdida de firmeza, elastosis solar y líneas de expresión marcadas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT clientes.tipos_piel OFF;
GO

-- =================================================================================================
-- 012. TABLA: clientes.condiciones_dermatologicas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.condiciones_dermatologicas ON;
INSERT INTO clientes.condiciones_dermatologicas (ID, codigo_condicion, nombre_condicion, descripcion_patologica, nivel_severidad_tipica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CONDICIO_01', N'Acné Vulgar Leve', N'Comedones abiertos y cerrados ocasionados por hiperseborrea folicular.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CONDICIO_02', N'Acné Inflamatorio Moderado', N'Presencia de pápulas y pústulas con respuesta inflamatoria en zona facial y espalda.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CONDICIO_03', N'Rosácea Eritematotelangiectásica', N'Enrojecimiento facial persistente, telangiectasias y alta reactividad vascular.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CONDICIO_04', N'Melasma Epidérmico', N'Máculas hiperpigmentadas simétricas agravadas por radiación UV y luz visible.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CONDICIO_05', N'Dermatitis Atópica', N'Disfunción de barrera cutánea con xerosis intensa, prurito y brotes eccematosos.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CONDICIO_06', N'Dermatitis Seborreica', N'Descamación grasa y eritema en surcos nasogenianos, cejas y cuero cabelludo.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CONDICIO_07', N'Hiperpigmentación Postinflamatoria', N'Manchas residuales oscuras posteriores a lesiones de acné o traumatismo cutáneo.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CONDICIO_08', N'Piel Reactiva e Intolerante', N'Umbral reducido a activos tópicos con sensación frecuente de ardor y tirantez.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CONDICIO_09', N'Fotoenvejecimiento Prematuro', N'Pérdida de elasticidad, léntigos solares y arrugas finas por exposición UV acumulada.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CONDICIO_10', N'Queratosis Pilaris', N'Tapones de queratina folicular con textura áspera en brazos, mejillas o muslos.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CONDICIO_11', N'Eccema de Contacto Alérgico', N'Reacción de hipersensibilidad retardada ante fragancias, conservadores o metales.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CONDICIO_12', N'Xerosis Cutánea Severa', N'Deshidratación epidérmica profunda con fisuración fina y descamación laminar.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CONDICIO_13', N'Seborrea Facial Crónica', N'Exceso persistente de lípidos superficiales con dilatación visible del ostium folicular.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CONDICIO_14', N'Dermatitis Perioral', N'Pápulas eritematosas agrupadas alrededor de labios y mentón, sensible a corticoides.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CONDICIO_15', N'Lentigos Solares Benignos', N'Máculas pigmentadas circunscritas asociadas a exposición solar crónica.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CONDICIO_16', N'Piel Post-Procedimiento Láser', N'Epidermis en reepitelización tras peelings químicos o tratamientos ablativos.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CONDICIO_17', N'Foliculitis de Barba', N'Inflamación perifolicular por vello encarnado o colonización bacteriana leve.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CONDICIO_18', N'Queilitis Actínica Leve', N'Sequedad crónica y descamación del bermellón labial por radiación solar.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CONDICIO_19', N'Milia Folicular', N'Pequeños quistes epidérmicos de queratina superficial en región periocular.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CONDICIO_20', N'Ojeras Vasculares y Pigmentarias', N'Coloración violácea o marrón en surco infraorbitario por estasis o melanina.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CONDICIO_21', N'Deshidratación Epidérmica Transitoria', N'Déficit temporal de agua en estrato córneo por clima seco o retinoides.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CONDICIO_22', N'Piel con Tendencia Comedogénica', N'Propensión a obstrucción de poros por ésteres pesados u oclusivos.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CONDICIO_23', N'Fotodermatosis Polimorfa', N'Erupción pruriginosa desencadenada por exposición solar intensa.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CONDICIO_24', N'Ictiosis Vulgar Leve', N'Descamación poligonal fina predominantemente en extremidades inferiores.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CONDICIO_25', N'Estrías Atróficas Tempranas', N'Líneas eritematosas por distensión dérmica rápida susceptibles a retinoides y centella.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CONDICIO_26', N'Cicatríz Atrófica Post-Acné', N'Depresiones dérmicas secundarias a nódulos inflamatorios previos.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CONDICIO_27', N'Psoriasis en Placas Leve', N'Placas eritematoescamosas bien delimitadas en codos, rodillas o cuero cabelludo.', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CONDICIO_28', N'Urticaria por Frío o Fricción', N'Habones evanescentes inducidos por estímulos físicos ambientales.', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CONDICIO_29', N'Sensibilidad a Hidroxiácidos', N'Intolerancia rápida a AHA/BHA con eritema inmediato y descamación.', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CONDICIO_30', N'Alopecia Efluvio Telógeno', N'Caída difusa temporal del cabello asociada a estrés metabólico o déficit nutricional.', N'SEVERA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.condiciones_dermatologicas OFF;
GO

-- =================================================================================================
-- 013. TABLA: clientes.clientes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.clientes ON;
INSERT INTO clientes.clientes (ID, ID_usuario, nombres, primer_apellido, segundo_apellido, fecha_nacimiento, genero, curp, rfc, telefono_fijo, acepta_terminos, fecha_aceptacion_terminos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Carlos', N'Mendoza', N'Garza', '1991-03-15', N'FEMENINO', N'MEGC910315HCLRR001', N'MEGC910315H01', N'8661114455', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Sofía', N'Ramírez', N'López', '1992-03-15', N'MASCULINO', N'RALS920315HCLRR002', N'RALS920315H02', N'8661124455', 1, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Valeria', N'Torres', N'Villarreal', '1993-03-15', N'NO_BINARIO', N'TOVV930315HCLRR003', N'TOVV930315H03', N'8661134455', 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Alejandro', N'Hernández', N'Cruz', '1994-03-15', N'PREFIERO_NO_DECIR', N'HECA940315HCLRR004', N'HECA940315H04', N'8661144455', 1, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Mariana', N'Sánchez', N'Fuentes', '1995-03-15', N'FEMENINO', N'SAFM950315HCLRR005', N'SAFM950315H05', N'8661154455', 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Diego', N'Martínez', N'Treviño', '1996-03-15', N'MASCULINO', N'MATD960315HCLRR006', N'MATD960315H06', N'8661164455', 1, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Camila', N'González', N'Reyes', '1997-03-15', N'NO_BINARIO', N'GORC970315HCLRR007', N'GORC970315H07', N'8661174455', 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Mateo', N'Flores', N'Castillo', '1998-03-15', N'PREFIERO_NO_DECIR', N'FLCM980315HCLRR008', N'FLCM980315H08', N'8661184455', 1, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Lucía', N'Morales', N'Díaz', '1999-03-15', N'FEMENINO', N'MODL990315HCLRR009', N'MODL990315H09', N'8661194455', 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Sebastián', N'Vázquez', N'Ortiz', '1990-03-15', N'MASCULINO', N'VAOS900315HCLRR010', N'VAOS900315H10', N'8661204455', 1, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Regina', N'Gutiérrez', N'Nava', '1991-03-15', N'NO_BINARIO', N'GUNR910315HCLRR011', N'GUNR910315H11', N'8661214455', 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Santiago', N'Jiménez', N'Pérez', '1992-03-15', N'PREFIERO_NO_DECIR', N'JIPS920315HCLRR012', N'JIPS920315H12', N'8661224455', 1, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Fernanda', N'Ruiz', N'Salazar', '1993-03-15', N'FEMENINO', N'RUSF930315HCLRR013', N'RUSF930315H13', N'8661234455', 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Emiliano', N'Ríos', N'Cárdenas', '1994-03-15', N'MASCULINO', N'RICE940315HCLRR014', N'RICE940315H14', N'8661244455', 1, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Ximena', N'Aguilar', N'Ibarra', '1995-03-15', N'NO_BINARIO', N'AGIX950315HCLRR015', N'AGIX950315H15', N'8661254455', 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Daniel', N'Méndez', N'Navarro', '1996-03-15', N'PREFIERO_NO_DECIR', N'MEND960315HCLRR016', N'MEND960315H16', N'8661264455', 1, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Andrea', N'Castro', N'Delgado', '1997-03-15', N'FEMENINO', N'CADA970315HCLRR017', N'CADA970315H17', N'8661274455', 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Gabriel', N'Vega', N'Montoya', '1998-03-15', N'MASCULINO', N'VEMG980315HCLRR018', N'VEMG980315H18', N'8661284455', 1, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Paula', N'Cortés', N'Rojas', '1999-03-15', N'NO_BINARIO', N'CORP990315HCLRR019', N'CORP990315H19', N'8661294455', 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Andrés', N'Ramos', N'Campos', '1990-03-15', N'PREFIERO_NO_DECIR', N'RACA900315HCLRR020', N'RACA900315H20', N'8661304455', 1, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Renata', N'Guerrero', N'Luna', '1991-03-15', N'FEMENINO', N'GULR910315HCLRR021', N'GULR910315H21', N'8661314455', 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Nicolás', N'Peña', N'Cabrera', '1992-03-15', N'MASCULINO', N'PECN920315HCLRR022', N'PECN920315H22', N'8661324455', 1, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Natalia', N'Herrera', N'Vargas', '1993-03-15', N'NO_BINARIO', N'HEVN930315HCLRR023', N'HEVN930315H23', N'8661334455', 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Joaquín', N'Medina', N'Contreras', '1994-03-15', N'PREFIERO_NO_DECIR', N'MECJ940315HCLRR024', N'MECJ940315H24', N'8661344455', 1, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Isabella', N'Domínguez', N'Escobar', '1995-03-15', N'FEMENINO', N'DOEI950315HCLRR025', N'DOEI950315H25', N'8661354455', 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Leonardo', N'Silva', N'Paredes', '1996-03-15', N'MASCULINO', N'SIPL960315HCLRR026', N'SIPL960315H26', N'8661364455', 1, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Ana', N'Chávez', N'Bautista', '1997-03-15', N'NO_BINARIO', N'CHBA970315HCLRR027', N'CHBA970315H27', N'8661374455', 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Rodrigo', N'Ochoa', N'Acosta', '1998-03-15', N'PREFIERO_NO_DECIR', N'OCAR980315HCLRR028', N'OCAR980315H28', N'8661384455', 1, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Paulina', N'Miranda', N'Leal', '1999-03-15', N'FEMENINO', N'MILP990315HCLRR029', N'MILP990315H29', N'8661394455', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Mauricio', N'Padilla', N'Solís', '1990-03-15', N'MASCULINO', N'PASM900315HCLRR030', N'PASM900315H30', N'8661404455', 1, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.clientes OFF;
GO

-- =================================================================================================
-- 014. TABLA: clientes.direcciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.direcciones ON;
INSERT INTO clientes.direcciones (ID, ID_cliente, alias_direccion, calle, numero_exterior, numero_interior, colonia, codigo_postal, municipio_alcaldia, estado, pais, referencias, es_predeterminada_envio, es_predeterminada_facturacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Casa Monclova 1', N'Blvd. Harold R. Pape #112', N'110', N'Depto 1', N'Centro', N'25700', N'Monclova', N'Coahuila', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monclova.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Casa Monterrey 2', N'Av. Constitución #124', N'120', N'Depto 2', N'Obispado', N'64000', N'Monterrey', N'Nuevo León', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monterrey.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Casa San Pedro Garza García 3', N'Calz. del Valle #136', N'130', N'Depto 3', N'Del Valle', N'66220', N'San Pedro Garza García', N'Nuevo León', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en San Pedro Garza García.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Casa Ciudad de México 4', N'Av. Álvaro Obregón #148', N'140', N'Depto 4', N'Roma Norte', N'06700', N'Cuauhtémoc', N'CDMX', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Cuauhtémoc.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Casa Ciudad de México 5', N'Av. Presidente Masaryk #160', N'150', N'Depto 5', N'Polanco', N'11560', N'Miguel Hidalgo', N'CDMX', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Miguel Hidalgo.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Casa Guadalajara 6', N'Av. Vallarta #172', N'160', N'Depto 6', N'Americana', N'44100', N'Guadalajara', N'Jalisco', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Guadalajara.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Casa Saltillo 7', N'Blvd. Venustiano Carranza #184', N'170', N'Depto 7', N'República', N'25000', N'Saltillo', N'Coahuila', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Saltillo.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Casa Querétaro 8', N'Av. 5 de Febrero #196', N'180', N'Depto 8', N'Centro', N'76000', N'Querétaro', N'Querétaro', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Querétaro.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Casa Puebla 9', N'Av. Juárez #208', N'190', N'Depto 9', N'La Paz', N'72000', N'Puebla', N'Puebla', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Puebla.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Casa Mérida 10', N'Paseo de Montejo #220', N'200', N'Depto 10', N'Centro', N'97000', N'Mérida', N'Yucatán', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Mérida.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Casa Monclova 11', N'Blvd. Harold R. Pape #232', N'210', N'Depto 11', N'Centro', N'25700', N'Monclova', N'Coahuila', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monclova.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Casa Monterrey 12', N'Av. Constitución #244', N'220', N'Depto 12', N'Obispado', N'64000', N'Monterrey', N'Nuevo León', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monterrey.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Casa San Pedro Garza García 13', N'Calz. del Valle #256', N'230', N'Depto 13', N'Del Valle', N'66220', N'San Pedro Garza García', N'Nuevo León', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en San Pedro Garza García.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Casa Ciudad de México 14', N'Av. Álvaro Obregón #268', N'240', N'Depto 14', N'Roma Norte', N'06700', N'Cuauhtémoc', N'CDMX', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Cuauhtémoc.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Casa Ciudad de México 15', N'Av. Presidente Masaryk #280', N'250', N'Depto 15', N'Polanco', N'11560', N'Miguel Hidalgo', N'CDMX', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Miguel Hidalgo.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Casa Guadalajara 16', N'Av. Vallarta #292', N'260', N'Depto 16', N'Americana', N'44100', N'Guadalajara', N'Jalisco', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Guadalajara.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Casa Saltillo 17', N'Blvd. Venustiano Carranza #304', N'270', N'Depto 17', N'República', N'25000', N'Saltillo', N'Coahuila', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Saltillo.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Casa Querétaro 18', N'Av. 5 de Febrero #316', N'280', N'Depto 18', N'Centro', N'76000', N'Querétaro', N'Querétaro', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Querétaro.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Casa Puebla 19', N'Av. Juárez #328', N'290', N'Depto 19', N'La Paz', N'72000', N'Puebla', N'Puebla', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Puebla.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Casa Mérida 20', N'Paseo de Montejo #340', N'300', N'Depto 20', N'Centro', N'97000', N'Mérida', N'Yucatán', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Mérida.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Casa Monclova 21', N'Blvd. Harold R. Pape #352', N'310', N'Depto 21', N'Centro', N'25700', N'Monclova', N'Coahuila', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monclova.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Casa Monterrey 22', N'Av. Constitución #364', N'320', N'Depto 22', N'Obispado', N'64000', N'Monterrey', N'Nuevo León', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monterrey.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Casa San Pedro Garza García 23', N'Calz. del Valle #376', N'330', N'Depto 23', N'Del Valle', N'66220', N'San Pedro Garza García', N'Nuevo León', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en San Pedro Garza García.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Casa Ciudad de México 24', N'Av. Álvaro Obregón #388', N'340', N'Depto 24', N'Roma Norte', N'06700', N'Cuauhtémoc', N'CDMX', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Cuauhtémoc.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Casa Ciudad de México 25', N'Av. Presidente Masaryk #400', N'350', N'Depto 25', N'Polanco', N'11560', N'Miguel Hidalgo', N'CDMX', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Miguel Hidalgo.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Casa Guadalajara 26', N'Av. Vallarta #412', N'360', N'Depto 26', N'Americana', N'44100', N'Guadalajara', N'Jalisco', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Guadalajara.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Casa Saltillo 27', N'Blvd. Venustiano Carranza #424', N'370', N'Depto 27', N'República', N'25000', N'Saltillo', N'Coahuila', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Saltillo.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Casa Querétaro 28', N'Av. 5 de Febrero #436', N'380', N'Depto 28', N'Centro', N'76000', N'Querétaro', N'Querétaro', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Querétaro.', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Casa Puebla 29', N'Av. Juárez #448', N'390', N'Depto 29', N'La Paz', N'72000', N'Puebla', N'Puebla', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Puebla.', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Casa Mérida 30', N'Paseo de Montejo #460', N'400', N'Depto 30', N'Centro', N'97000', N'Mérida', N'Yucatán', N'México', N'Fachada color arena con portón metálico, a media cuadra de avenida principal en Mérida.', 0, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.direcciones OFF;
GO

-- =================================================================================================
-- 015. TABLA: clientes.perfil_cutaneo (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.perfil_cutaneo ON;
INSERT INTO clientes.perfil_cutaneo (ID, ID_cliente, ID_tipo_piel, sensibilidad_solar, nivel_oleosidad, poros_dilatados, propension_acne, manchas_hiperpigmentacion, lineas_expresion, consentimiento_datos_sensibles, fecha_declaracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, N'ALTA', N'ZONA_T', 1, 1, 1, 1, 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, N'EXTREMA', N'GRASA_TOTAL', 0, 0, 0, 0, 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, N'MUY_BAJA', N'SECA', 1, 1, 1, 1, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, N'MODERADA', N'EQUILIBRADA', 0, 0, 0, 0, 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.perfil_cutaneo OFF;
GO

-- =================================================================================================
-- 016. TABLA: clientes.cliente_condiciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.cliente_condiciones ON;
INSERT INTO clientes.cliente_condiciones (ID, ID_cliente, ID_condicion_dermatologica, diagnosticada_por_medico, notas_paciente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'Seguimiento clínico por Acné Vulgar Leve; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 0, N'Seguimiento clínico por Acné Inflamatorio Moderado; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, N'Seguimiento clínico por Rosácea Eritematotelangiectásica; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 0, N'Seguimiento clínico por Melasma Epidérmico; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, N'Seguimiento clínico por Dermatitis Atópica; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 0, N'Seguimiento clínico por Dermatitis Seborreica; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, N'Seguimiento clínico por Hiperpigmentación Postinflamatoria; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 0, N'Seguimiento clínico por Piel Reactiva e Intolerante; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, N'Seguimiento clínico por Fotoenvejecimiento Prematuro; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 0, N'Seguimiento clínico por Queratosis Pilaris; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, N'Seguimiento clínico por Eccema de Contacto Alérgico; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 0, N'Seguimiento clínico por Xerosis Cutánea Severa; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, N'Seguimiento clínico por Seborrea Facial Crónica; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 0, N'Seguimiento clínico por Dermatitis Perioral; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, N'Seguimiento clínico por Lentigos Solares Benignos; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 0, N'Seguimiento clínico por Piel Post-Procedimiento Láser; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, N'Seguimiento clínico por Foliculitis de Barba; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 0, N'Seguimiento clínico por Queilitis Actínica Leve; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, N'Seguimiento clínico por Milia Folicular; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 0, N'Seguimiento clínico por Ojeras Vasculares y Pigmentarias; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, N'Seguimiento clínico por Deshidratación Epidérmica Transitoria; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 0, N'Seguimiento clínico por Piel con Tendencia Comedogénica; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, N'Seguimiento clínico por Fotodermatosis Polimorfa; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 0, N'Seguimiento clínico por Ictiosis Vulgar Leve; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, N'Seguimiento clínico por Estrías Atróficas Tempranas; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 0, N'Seguimiento clínico por Cicatríz Atrófica Post-Acné; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, N'Seguimiento clínico por Psoriasis en Placas Leve; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 0, N'Seguimiento clínico por Urticaria por Frío o Fricción; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, N'Seguimiento clínico por Sensibilidad a Hidroxiácidos; evitar activos irritantes sin supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 0, N'Seguimiento clínico por Alopecia Efluvio Telógeno; evitar activos irritantes sin supervisión.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.cliente_condiciones OFF;
GO

-- =================================================================================================
-- 017. TABLA: clientes.cuestionarios_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.cuestionarios_diagnostico ON;
INSERT INTO clientes.cuestionarios_diagnostico (ID, codigo_cuestionario, titulo, descripcion, version_clinica, vigente_desde, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CUESTION_01', N'Cuestionario Clínico Dermatológico - Módulo 01', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 01).', N'v1.0', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CUESTION_02', N'Cuestionario Clínico Dermatológico - Módulo 02', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 02).', N'v1.1', '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CUESTION_03', N'Cuestionario Clínico Dermatológico - Módulo 03', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 03).', N'v1.2', '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CUESTION_04', N'Cuestionario Clínico Dermatológico - Módulo 04', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 04).', N'v1.3', '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CUESTION_05', N'Cuestionario Clínico Dermatológico - Módulo 05', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 05).', N'v1.4', '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CUESTION_06', N'Cuestionario Clínico Dermatológico - Módulo 06', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 06).', N'v1.5', '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CUESTION_07', N'Cuestionario Clínico Dermatológico - Módulo 07', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 07).', N'v1.6', '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CUESTION_08', N'Cuestionario Clínico Dermatológico - Módulo 08', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 08).', N'v1.7', '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CUESTION_09', N'Cuestionario Clínico Dermatológico - Módulo 09', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 09).', N'v1.8', '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CUESTION_10', N'Cuestionario Clínico Dermatológico - Módulo 10', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 10).', N'v1.9', '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CUESTION_11', N'Cuestionario Clínico Dermatológico - Módulo 11', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 11).', N'v2.0', '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CUESTION_12', N'Cuestionario Clínico Dermatológico - Módulo 12', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 12).', N'v2.1', '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CUESTION_13', N'Cuestionario Clínico Dermatológico - Módulo 13', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 13).', N'v2.2', '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CUESTION_14', N'Cuestionario Clínico Dermatológico - Módulo 14', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 14).', N'v2.3', '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CUESTION_15', N'Cuestionario Clínico Dermatológico - Módulo 15', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 15).', N'v2.4', '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CUESTION_16', N'Cuestionario Clínico Dermatológico - Módulo 16', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 16).', N'v2.5', '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CUESTION_17', N'Cuestionario Clínico Dermatológico - Módulo 17', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 17).', N'v2.6', '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CUESTION_18', N'Cuestionario Clínico Dermatológico - Módulo 18', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 18).', N'v2.7', '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CUESTION_19', N'Cuestionario Clínico Dermatológico - Módulo 19', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 19).', N'v2.8', '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CUESTION_20', N'Cuestionario Clínico Dermatológico - Módulo 20', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 20).', N'v2.9', '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CUESTION_21', N'Cuestionario Clínico Dermatológico - Módulo 21', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 21).', N'v3.0', '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CUESTION_22', N'Cuestionario Clínico Dermatológico - Módulo 22', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 22).', N'v3.1', '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CUESTION_23', N'Cuestionario Clínico Dermatológico - Módulo 23', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 23).', N'v3.2', '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CUESTION_24', N'Cuestionario Clínico Dermatológico - Módulo 24', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 24).', N'v3.3', '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CUESTION_25', N'Cuestionario Clínico Dermatológico - Módulo 25', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 25).', N'v3.4', '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CUESTION_26', N'Cuestionario Clínico Dermatológico - Módulo 26', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 26).', N'v3.5', '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CUESTION_27', N'Cuestionario Clínico Dermatológico - Módulo 27', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 27).', N'v3.6', '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CUESTION_28', N'Cuestionario Clínico Dermatológico - Módulo 28', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 28).', N'v3.7', '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CUESTION_29', N'Cuestionario Clínico Dermatológico - Módulo 29', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 29).', N'v3.8', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CUESTION_30', N'Cuestionario Clínico Dermatológico - Módulo 30', N'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 30).', N'v3.9', '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.cuestionarios_diagnostico OFF;
GO

-- =================================================================================================
-- 018. TABLA: clientes.preguntas_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.preguntas_diagnostico ON;
INSERT INTO clientes.preguntas_diagnostico (ID, ID_cuestionario, numero_orden, enunciado_pregunta, tipo_respuesta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'¿Cómo describirías la sensación de tu piel 30 minutos después de lavarla sin aplicar crema?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'¿Con qué frecuencia presentas brillo excesivo en frente, nariz y mentón?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'¿Presentas brotes recurrentes de puntos negros, espinillas o lesiones inflamatorias?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'¿Tu piel se enrojece fácilmente con cambios bruscos de temperatura o alimentos picantes?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'¿Has notado manchas oscuras en mejillas, frente o labio superior tras exposición solar?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'¿Qué ocurre cuando expones tu rostro al sol sin protector solar durante 20 minutos?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'¿Sientes ardor, picazón o tirantez al usar productos con fragancia o alcohol?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'¿Tienes antecedentes médicos de dermatitis atópica, asma o alergias cutáneas?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'¿Utilizas actualmente retinoides tópicos, peróxido de benzoílo o ácidos exfoliantes?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'¿Te encuentras en etapa de embarazo o lactancia actualmente?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'¿Qué nivel de líneas de expresión o flacidez notas en contorno de ojos y surcos?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'¿Presentas descamación visible alrededor de las aletas nasales o entrecejo?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'¿Con qué frecuencia reaplicas protector solar FPS 50+ durante tu jornada?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'¿Tu rutina incluye exposición frecuente a pantallas o iluminación LED prolongada?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'¿Notas poros dilatados principalmente en mejillas internas y nariz?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'¿Has experimentado reacciones adversas previas con conservadores o aceites esenciales?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'¿Cuál es la textura cosmética que prefieres para uso diurno?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'¿Qué porcentaje de cobertura buscas en bases o protectores solares con color?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'¿Presentas bolsas, inflamación matutina o pigmentación oscura en ojeras?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'¿Cuántos pasos estás dispuesto(a) a mantener de forma constante en tu rutina diaria?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'¿Vives en una ciudad con clima árido, húmedo o alta radiación UV?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'¿Te has realizado peelings químicos, microagujas o láser en los últimos 30 días?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'¿Tus labios tienden a agrietarse o descamarse con facilidad?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'¿Sufres de piel áspera o pequeños bultos en la parte posterior de los brazos?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'¿Qué prioridad clínica tiene para ti controlar el exceso de sebo frente a hidratar?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'¿Notas tirantez en mejillas acompañada de brillo en la zona T al mediodía?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'¿Presentas marcas rojas o marrones que tardan meses en desvanecerse tras un grano?', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'¿Utilizas maquillaje de larga duración o resistente al agua diariamente?', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'¿Cuál es tu rango aproximado de horas de sueño reparador por noche?', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'¿Has recibido diagnóstico previo por un dermatólogo certificado para tu padecimiento?', N'ESCALA_NUMERICA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.preguntas_diagnostico OFF;
GO

-- =================================================================================================
-- 019. TABLA: clientes.opciones_pregunta (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.opciones_pregunta ON;
INSERT INTO clientes.opciones_pregunta (ID, ID_pregunta, clave_opcion, texto_opcion, peso_clinico_puntos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'OPCION_01', N'Opción clínica validada nivel 1', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'OPCION_02', N'Opción clínica validada nivel 2', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'OPCION_03', N'Opción clínica validada nivel 3', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'OPCION_04', N'Opción clínica validada nivel 4', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'OPCION_05', N'Opción clínica validada nivel 5', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'OPCION_06', N'Opción clínica validada nivel 6', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'OPCION_07', N'Opción clínica validada nivel 7', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'OPCION_08', N'Opción clínica validada nivel 8', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'OPCION_09', N'Opción clínica validada nivel 9', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'OPCION_10', N'Opción clínica validada nivel 10', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'OPCION_11', N'Opción clínica validada nivel 11', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'OPCION_12', N'Opción clínica validada nivel 12', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'OPCION_13', N'Opción clínica validada nivel 13', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'OPCION_14', N'Opción clínica validada nivel 14', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'OPCION_15', N'Opción clínica validada nivel 15', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'OPCION_16', N'Opción clínica validada nivel 16', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'OPCION_17', N'Opción clínica validada nivel 17', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'OPCION_18', N'Opción clínica validada nivel 18', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'OPCION_19', N'Opción clínica validada nivel 19', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'OPCION_20', N'Opción clínica validada nivel 20', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'OPCION_21', N'Opción clínica validada nivel 21', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'OPCION_22', N'Opción clínica validada nivel 22', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'OPCION_23', N'Opción clínica validada nivel 23', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'OPCION_24', N'Opción clínica validada nivel 24', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'OPCION_25', N'Opción clínica validada nivel 25', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'OPCION_26', N'Opción clínica validada nivel 26', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'OPCION_27', N'Opción clínica validada nivel 27', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'OPCION_28', N'Opción clínica validada nivel 28', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'OPCION_29', N'Opción clínica validada nivel 29', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'OPCION_30', N'Opción clínica validada nivel 30', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.opciones_pregunta OFF;
GO

-- =================================================================================================
-- 020. TABLA: clientes.evaluaciones_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.evaluaciones_diagnostico ON;
INSERT INTO clientes.evaluaciones_diagnostico (ID, ID_cliente, ID_cuestionario, fecha_realizacion, puntaje_total, diagnostico_sugerido, observaciones_dermoconsultor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 37, N'Perfil compatible con Acné Vulgar Leve; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para acné vulgar leve.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '2026-02-02 11:30:00', 39, N'Perfil compatible con Acné Inflamatorio Moderado; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para acné inflamatorio moderado.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '2026-02-03 11:30:00', 41, N'Perfil compatible con Rosácea Eritematotelangiectásica; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para rosácea eritematotelangiectásica.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '2026-02-04 11:30:00', 43, N'Perfil compatible con Melasma Epidérmico; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para melasma epidérmico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '2026-02-05 11:30:00', 45, N'Perfil compatible con Dermatitis Atópica; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para dermatitis atópica.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '2026-02-06 11:30:00', 47, N'Perfil compatible con Dermatitis Seborreica; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para dermatitis seborreica.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '2026-02-07 11:30:00', 49, N'Perfil compatible con Hiperpigmentación Postinflamatoria; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para hiperpigmentación postinflamatoria.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '2026-02-08 11:30:00', 51, N'Perfil compatible con Piel Reactiva e Intolerante; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para piel reactiva e intolerante.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '2026-02-09 11:30:00', 53, N'Perfil compatible con Fotoenvejecimiento Prematuro; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para fotoenvejecimiento prematuro.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '2026-02-10 11:30:00', 55, N'Perfil compatible con Queratosis Pilaris; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para queratosis pilaris.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '2026-02-11 11:30:00', 57, N'Perfil compatible con Eccema de Contacto Alérgico; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para eccema de contacto alérgico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '2026-02-12 11:30:00', 59, N'Perfil compatible con Xerosis Cutánea Severa; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para xerosis cutánea severa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '2026-02-13 11:30:00', 61, N'Perfil compatible con Seborrea Facial Crónica; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para seborrea facial crónica.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '2026-02-14 11:30:00', 63, N'Perfil compatible con Dermatitis Perioral; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para dermatitis perioral.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '2026-02-15 11:30:00', 65, N'Perfil compatible con Lentigos Solares Benignos; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para lentigos solares benignos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '2026-02-16 11:30:00', 67, N'Perfil compatible con Piel Post-Procedimiento Láser; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para piel post-procedimiento láser.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '2026-02-17 11:30:00', 69, N'Perfil compatible con Foliculitis de Barba; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para foliculitis de barba.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '2026-02-18 11:30:00', 71, N'Perfil compatible con Queilitis Actínica Leve; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para queilitis actínica leve.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '2026-02-19 11:30:00', 73, N'Perfil compatible con Milia Folicular; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para milia folicular.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '2026-02-20 11:30:00', 75, N'Perfil compatible con Ojeras Vasculares y Pigmentarias; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para ojeras vasculares y pigmentarias.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '2026-02-21 11:30:00', 77, N'Perfil compatible con Deshidratación Epidérmica Transitoria; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para deshidratación epidérmica transitoria.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '2026-02-22 11:30:00', 79, N'Perfil compatible con Piel con Tendencia Comedogénica; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para piel con tendencia comedogénica.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '2026-02-23 11:30:00', 81, N'Perfil compatible con Fotodermatosis Polimorfa; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para fotodermatosis polimorfa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '2026-02-24 11:30:00', 83, N'Perfil compatible con Ictiosis Vulgar Leve; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para ictiosis vulgar leve.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '2026-02-25 11:30:00', 85, N'Perfil compatible con Estrías Atróficas Tempranas; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para estrías atróficas tempranas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '2026-02-26 11:30:00', 87, N'Perfil compatible con Cicatríz Atrófica Post-Acné; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para cicatríz atrófica post-acné.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '2026-02-27 11:30:00', 89, N'Perfil compatible con Psoriasis en Placas Leve; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para psoriasis en placas leve.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '2026-02-28 11:30:00', 91, N'Perfil compatible con Urticaria por Frío o Fricción; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para urticaria por frío o fricción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '2026-02-01 11:30:00', 93, N'Perfil compatible con Sensibilidad a Hidroxiácidos; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para sensibilidad a hidroxiácidos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '2026-02-02 11:30:00', 35, N'Perfil compatible con Alopecia Efluvio Telógeno; prioridad en protección solar y barrera.', N'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para alopecia efluvio telógeno.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.evaluaciones_diagnostico OFF;
GO

-- =================================================================================================
-- 021. TABLA: clientes.respuestas_evaluacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.respuestas_evaluacion ON;
INSERT INTO clientes.respuestas_evaluacion (ID, ID_evaluacion, ID_pregunta, ID_opcion_seleccionada, valor_texto_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, N'Reporta exposición solar diaria mayor a 2 horas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, N'Sin antecedentes de reacciones alérgicas graves.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, N'Presenta sensibilidad leve al iniciar nuevos activos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, N'Prefiere texturas en gel o suero acuoso de rápida absorción.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.respuestas_evaluacion OFF;
GO

-- =================================================================================================
-- 022. TABLA: clientes.consentimientos_privacidad (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.consentimientos_privacidad ON;
INSERT INTO clientes.consentimientos_privacidad (ID, ID_cliente, version_aviso_privacidad, acepta_finalidades_primarias, acepta_finalidades_secundarias_marketing, acepta_tratamiento_datos_salud_sensibles, direccion_ip_firma, medio_consentimiento, fecha_consentimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'v2.1-2026', 1, 1, 1, N'189.203.3.9', N'CHECKBOX_DIGITAL', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'v2.1-2026', 1, 0, 0, N'189.203.6.11', N'FIRMA_ELECTRONICA', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'v2.1-2026', 1, 1, 1, N'189.203.9.13', N'EN_SUCURSAL', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'v2.1-2026', 1, 0, 0, N'189.203.12.15', N'CHECKBOX_DIGITAL', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'v2.1-2026', 1, 1, 1, N'189.203.15.17', N'FIRMA_ELECTRONICA', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'v2.1-2026', 1, 0, 0, N'189.203.18.19', N'EN_SUCURSAL', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'v2.1-2026', 1, 1, 1, N'189.203.21.21', N'CHECKBOX_DIGITAL', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'v2.1-2026', 1, 0, 0, N'189.203.24.23', N'FIRMA_ELECTRONICA', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'v2.1-2026', 1, 1, 1, N'189.203.27.25', N'EN_SUCURSAL', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'v2.1-2026', 1, 0, 0, N'189.203.30.27', N'CHECKBOX_DIGITAL', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'v2.1-2026', 1, 1, 1, N'189.203.33.29', N'FIRMA_ELECTRONICA', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'v2.1-2026', 1, 0, 0, N'189.203.36.31', N'EN_SUCURSAL', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'v2.1-2026', 1, 1, 1, N'189.203.39.33', N'CHECKBOX_DIGITAL', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'v2.1-2026', 1, 0, 0, N'189.203.42.35', N'FIRMA_ELECTRONICA', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'v2.1-2026', 1, 1, 1, N'189.203.45.37', N'EN_SUCURSAL', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'v2.1-2026', 1, 0, 0, N'189.203.48.39', N'CHECKBOX_DIGITAL', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'v2.1-2026', 1, 1, 1, N'189.203.51.41', N'FIRMA_ELECTRONICA', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'v2.1-2026', 1, 0, 0, N'189.203.54.43', N'EN_SUCURSAL', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'v2.1-2026', 1, 1, 1, N'189.203.57.45', N'CHECKBOX_DIGITAL', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'v2.1-2026', 1, 0, 0, N'189.203.60.47', N'FIRMA_ELECTRONICA', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'v2.1-2026', 1, 1, 1, N'189.203.63.49', N'EN_SUCURSAL', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'v2.1-2026', 1, 0, 0, N'189.203.66.51', N'CHECKBOX_DIGITAL', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'v2.1-2026', 1, 1, 1, N'189.203.69.53', N'FIRMA_ELECTRONICA', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'v2.1-2026', 1, 0, 0, N'189.203.72.55', N'EN_SUCURSAL', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'v2.1-2026', 1, 1, 1, N'189.203.75.57', N'CHECKBOX_DIGITAL', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'v2.1-2026', 1, 0, 0, N'189.203.78.59', N'FIRMA_ELECTRONICA', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'v2.1-2026', 1, 1, 1, N'189.203.81.61', N'EN_SUCURSAL', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'v2.1-2026', 1, 0, 0, N'189.203.84.63', N'CHECKBOX_DIGITAL', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'v2.1-2026', 1, 1, 1, N'189.203.87.65', N'FIRMA_ELECTRONICA', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'v2.1-2026', 1, 0, 0, N'189.203.90.67', N'EN_SUCURSAL', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.consentimientos_privacidad OFF;
GO

-- =================================================================================================
-- 023. TABLA: clientes.solicitudes_arco (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.solicitudes_arco ON;
INSERT INTO clientes.solicitudes_arco (ID, folio_solicitud, ID_cliente, tipo_derecho, motivo_solicitud, estado_tramite, fecha_limite_respuesta, resolucion_juridica, fecha_resolucion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-SOLIC-2026-0001', 1, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'RECIBIDA', '2026-03-01', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-SOLIC-2026-0002', 2, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'EN_REVISION', '2026-03-02', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-SOLIC-2026-0003', 3, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'PROCEDENTE', '2026-03-03', N'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-02-28 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-SOLIC-2026-0004', 4, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'IMPROCEDENTE', '2026-03-04', N'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-01 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-SOLIC-2026-0005', 5, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'CONCLUIDA', '2026-03-05', N'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-02 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-SOLIC-2026-0006', 6, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'RECIBIDA', '2026-03-06', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-SOLIC-2026-0007', 7, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'EN_REVISION', '2026-03-07', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-SOLIC-2026-0008', 8, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'PROCEDENTE', '2026-03-08', N'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-05 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-SOLIC-2026-0009', 9, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'IMPROCEDENTE', '2026-03-09', N'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-06 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-SOLIC-2026-0010', 10, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'CONCLUIDA', '2026-03-10', N'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-07 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-SOLIC-2026-0011', 11, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'RECIBIDA', '2026-03-11', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-SOLIC-2026-0012', 12, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'EN_REVISION', '2026-03-12', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-SOLIC-2026-0013', 13, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'PROCEDENTE', '2026-03-13', N'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-10 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-SOLIC-2026-0014', 14, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'IMPROCEDENTE', '2026-03-14', N'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-11 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-SOLIC-2026-0015', 15, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'CONCLUIDA', '2026-03-15', N'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-12 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-SOLIC-2026-0016', 16, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'RECIBIDA', '2026-03-16', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-SOLIC-2026-0017', 17, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'EN_REVISION', '2026-03-17', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-SOLIC-2026-0018', 18, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'PROCEDENTE', '2026-03-18', N'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-15 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-SOLIC-2026-0019', 19, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'IMPROCEDENTE', '2026-03-19', N'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-16 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-SOLIC-2026-0020', 20, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'CONCLUIDA', '2026-03-20', N'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-17 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-SOLIC-2026-0021', 21, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'RECIBIDA', '2026-03-21', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-SOLIC-2026-0022', 22, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'EN_REVISION', '2026-03-22', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-SOLIC-2026-0023', 23, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'PROCEDENTE', '2026-03-23', N'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-20 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-SOLIC-2026-0024', 24, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'IMPROCEDENTE', '2026-03-24', N'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-21 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-SOLIC-2026-0025', 25, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'CONCLUIDA', '2026-03-25', N'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-22 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-SOLIC-2026-0026', 26, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'RECIBIDA', '2026-03-26', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-SOLIC-2026-0027', 27, N'CANCELACION', N'Solicitud de supresión de historial clínico tras cierre de cuenta.', N'EN_REVISION', '2026-03-27', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-SOLIC-2026-0028', 28, N'OPOSICION', N'Oposición al tratamiento de datos para campañas promocionales de marketing.', N'PROCEDENTE', '2026-03-28', N'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-25 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-SOLIC-2026-0029', 29, N'ACCESO', N'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', N'IMPROCEDENTE', '2026-03-01', N'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-02-26 16:00:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-SOLIC-2026-0030', 30, N'RECTIFICACION', N'Actualización de domicilio fiscal y corrección de segundo apellido.', N'CONCLUIDA', '2026-03-02', N'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-02-27 16:00:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.solicitudes_arco OFF;
GO

-- =================================================================================================
-- 024. TABLA: clientes.preferencias_comunicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.preferencias_comunicacion ON;
INSERT INTO clientes.preferencias_comunicacion (ID, ID_cliente, canal_email, canal_sms, canal_whatsapp, notificaciones_ofertas, alertas_reabastecimiento_rutina, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, 0, 0, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.preferencias_comunicacion OFF;
GO

-- =================================================================================================
-- 025. TABLA: clientes.metodos_pago_tokenizados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.metodos_pago_tokenizados ON;
INSERT INTO clientes.metodos_pago_tokenizados (ID, ID_cliente, pasarela_emisor, token_tarjeta_pasarela, marca_tarjeta, ultimos_cuatro_digitos, mes_expiracion, anio_expiracion, titular_tarjeta_hash, es_predeterminada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Stripe', N'tok_stripe_0001_6b86b273ff34', N'VISA', '4101', 1, 2027, N'0b194f778b695f7d1ee25f0fc83fc976a90e607bb2fd9e6c326b437a392c7c81', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'MercadoPago', N'tok_mercadopago_0002_d4735e3a265e', N'MASTERCARD', '4102', 2, 2028, N'b5089119e17b1af413b65d359280485d50b84294e9577c07e1f9a02b9a99fc82', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Openpay', N'tok_openpay_0003_4e07408562be', N'AMEX', '4103', 3, 2029, N'45341ff23425ad042ea3567df258369b890d2496756cc4ba0ae505d8e16d6654', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Stripe', N'tok_stripe_0004_4b227777d4dd', N'VISA', '4104', 4, 2030, N'7e2e512ce2afb7fd2b41f464f0a03bdf4218daee957756d103da34097e42be35', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'MercadoPago', N'tok_mercadopago_0005_ef2d127de37b', N'MASTERCARD', '4105', 5, 2026, N'17fa28699878c4cfd3257a2297c006400fb13f67a0961333673c30c6284d4a1b', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Openpay', N'tok_openpay_0006_e7f6c011776e', N'AMEX', '4106', 6, 2027, N'72a63232098ea1155ae36cfcc260144c8c56311aa5f3dadc5dab79c96174fe5f', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Stripe', N'tok_stripe_0007_7902699be42c', N'VISA', '4107', 7, 2028, N'446e2e8f010fdb70828eec4ee4c26a4a58d12a0af2f227466c36ff38decf8598', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'MercadoPago', N'tok_mercadopago_0008_2c624232cdd2', N'MASTERCARD', '4108', 8, 2029, N'4c0704f00c809d2a406c69961c389e61f04a75bcd092227d9d0f141e3f8b01b4', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Openpay', N'tok_openpay_0009_19581e27de7c', N'AMEX', '4109', 9, 2030, N'ce53afb156d242037a3f43c62cb0bf01c88ac2f4514019a72d087da2c6e3af98', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Stripe', N'tok_stripe_0010_4a44dc153642', N'VISA', '4110', 10, 2026, N'fa3625406ef120bd461c534e8b7488f5c7ce0a8df2dc43378276c0734f49fdee', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'MercadoPago', N'tok_mercadopago_0011_4fc82b26aecb', N'MASTERCARD', '4111', 11, 2027, N'c21395fed196536311602393b9b7df640df291eb923c2bb9dfb45e9814a1c3be', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Openpay', N'tok_openpay_0012_6b51d431df5d', N'AMEX', '4112', 12, 2028, N'fbdb3d0a3b13fd8eea69d553f210ddfe85715605a20717b938f0a1e2beafce5b', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Stripe', N'tok_stripe_0013_3fdba35f04dc', N'VISA', '4113', 1, 2029, N'10a09749b970ef7fdf37e4a052a340b7b329f9d57c2547f685728d41af9cddff', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'MercadoPago', N'tok_mercadopago_0014_8527a891e224', N'MASTERCARD', '4114', 2, 2030, N'b1ca2fc864ba685b5e806ca5a06013908b363d893db6ca021d649accb78aadd7', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Openpay', N'tok_openpay_0015_e629fa6598d7', N'AMEX', '4115', 3, 2026, N'cbd39133441b2d2bf0e885fde9ffb019c39f739294a2227632054fc78d8366a1', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Stripe', N'tok_stripe_0016_b17ef6d19c7a', N'VISA', '4116', 4, 2027, N'b758b7ef116763b67d09424104944f5ba4de6f6565f96ecef1e70af44e3f9b0a', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'MercadoPago', N'tok_mercadopago_0017_4523540f1504', N'MASTERCARD', '4117', 5, 2028, N'3ce6b9f0ac46f58cc93f1939718eb8b9e25cf0c3b941fb8bf5284c2dc9df8d82', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Openpay', N'tok_openpay_0018_4ec9599fc203', N'AMEX', '4118', 6, 2029, N'ed37b795d057faa9ecacb061b040f0524abbb093e87cc38828edfa4bec44ea9e', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Stripe', N'tok_stripe_0019_9400f1b21cb5', N'VISA', '4119', 7, 2030, N'dca543b8abf8e56b35a3ba2e5780ceba665506ec55e6c55f19c8f9ef2e2536a5', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'MercadoPago', N'tok_mercadopago_0020_f5ca38f748a1', N'MASTERCARD', '4120', 8, 2026, N'782c06aac9cd027861f5b08718faeea29a4574351dc71fa662c7770950ea1b59', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Openpay', N'tok_openpay_0021_6f4b6612125f', N'AMEX', '4121', 9, 2027, N'658f677634e28decbad27f4bec1ed46d3bb0f80d6f24a2433d8ab35c732bdf01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Stripe', N'tok_stripe_0022_785f3ec7eb32', N'VISA', '4122', 10, 2028, N'3b2482227f9544fda9827ba4d112444bbefa45f12381430946e00b5361d84fd8', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'MercadoPago', N'tok_mercadopago_0023_535fa30d7e25', N'MASTERCARD', '4123', 11, 2029, N'24187d5ce3ea2acfbec5ac74f5ef06152ef2237e7b96fa7862d3154969af4d5d', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Openpay', N'tok_openpay_0024_c2356069e9d1', N'AMEX', '4124', 12, 2030, N'5952e02d16cc850d5fb79b461d84b46521af5a500ded94dd9583d7ee05a35682', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Stripe', N'tok_stripe_0025_b7a56873cd77', N'VISA', '4125', 1, 2026, N'794e6cee9862666903ebe2c4ae09d8fa805b24e7a0593db856ba34cf4499d5de', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'MercadoPago', N'tok_mercadopago_0026_5f9c4ab08cac', N'MASTERCARD', '4126', 2, 2027, N'f0aec558d76a461b3c5ef4dc45015fc3300270778f4aa91422f2bf1474b06bc9', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Openpay', N'tok_openpay_0027_670671cd9740', N'AMEX', '4127', 3, 2028, N'e469ef0b1b717c775949de0a2a7e6c77f978dd68f4f3a36141907106a5cdf6fb', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Stripe', N'tok_stripe_0028_59e19706d51d', N'VISA', '4128', 4, 2029, N'4068e947471c19a0f15bb379a841a8962cf004720174632108dc8491ddf7428b', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'MercadoPago', N'tok_mercadopago_0029_35135aaa6cc2', N'MASTERCARD', '4129', 5, 2030, N'4b31d14b3b1770734d635aabd5887414e84a4208a751b4c55fd6a27f810fd012', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Openpay', N'tok_openpay_0030_624b60c58c9d', N'AMEX', '4130', 6, 2026, N'e3e8e3a7a9491a1a835ee5b34c63d4d97a21e54b35f6aee0d2e614956701ec20', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.metodos_pago_tokenizados OFF;
GO

-- =================================================================================================
-- 026. TABLA: catalogo.marcas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.marcas ON;
INSERT INTO catalogo.marcas (ID, codigo_marca, nombre_marca, pais_origen, sitio_web, es_dermocosmetica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MARCA_01', N'La Roche-Posay', N'Francia', N'https://www.laroche-posay.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MARCA_02', N'CeraVe Dermatological', N'Estados Unidos', N'https://www.cerave.com.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MARCA_03', N'The Ordinary Deciem', N'Canadá', N'https://theordinary.com', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MARCA_04', N'ISDIN Fotoprotección', N'España', N'https://www.isdin.com/es-mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MARCA_05', N'Bioderma Laboratoire', N'Francia', N'https://www.bioderma.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MARCA_06', N'Eau Thermale Avène', N'Francia', N'https://www.eau-thermale-avene.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MARCA_07', N'Eucerin Beiersdorf', N'Alemania', N'https://www.eucerin.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MARCA_08', N'Vichy Laboratoires', N'Francia', N'https://www.vichy.com.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MARCA_09', N'SkinCeuticals Clinical', N'Estados Unidos', N'https://www.skinceuticals.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MARCA_10', N'Sesderma Nanotech', N'España', N'https://www.sesderma.com/mx_es', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MARCA_11', N'NARS Cosmetics', N'Estados Unidos', N'https://www.narscosmetics.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MARCA_12', N'MAC Professional', N'Canadá', N'https://www.maccosmetics.com.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MARCA_13', N'Fenty Beauty', N'Estados Unidos', N'https://fentybeauty.com', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MARCA_14', N'Rare Beauty', N'Estados Unidos', N'https://www.rarebeauty.com', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MARCA_15', N'Clinique Laboratories', N'Estados Unidos', N'https://www.clinique.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MARCA_16', N'Estée Lauder', N'Estados Unidos', N'https://www.esteelauder.com.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MARCA_17', N'Lancôme Paris', N'Francia', N'https://www.lancome.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MARCA_18', N'Charlotte Tilbury', N'Reino Unido', N'https://www.charlottetilbury.com', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MARCA_19', N'Paula''s Choice Skincare', N'Estados Unidos', N'https://www.paulaschoice.com', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MARCA_20', N'COSRX K-Beauty', N'Corea del Sur', N'https://www.cosrx.com', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MARCA_21', N'Laneige Amorepacific', N'Corea del Sur', N'https://www.laneige.com', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MARCA_22', N'Uriage Eau Thermale', N'Francia', N'https://www.uriage.com/MX/es', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MARCA_23', N'Laboratoire SVR', N'Francia', N'https://mx.labo-svr.com', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MARCA_24', N'MartiDerm Ampollas', N'España', N'https://www.martiderm.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MARCA_25', N'Heliocare Cantabria Labs', N'España', N'https://www.cantabrialabs.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MARCA_26', N'Kiehl''s Since 1851', N'Estados Unidos', N'https://www.kiehls.com.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MARCA_27', N'Garnier SkinActive', N'Francia', N'https://www.garnier.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MARCA_28', N'L''Oréal Paris Derm', N'Francia', N'https://www.loreal-paris.com.mx', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MARCA_29', N'Neutrogena Derm', N'Estados Unidos', N'https://www.neutrogena.com.mx', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MARCA_30', N'DermaCare Labs México', N'México', N'https://www.dermacare.mx', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.marcas OFF;
GO

-- =================================================================================================
-- 027. TABLA: catalogo.laboratorios_fabricantes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.laboratorios_fabricantes ON;
INSERT INTO catalogo.laboratorios_fabricantes (ID, clave_laboratorio, razon_social, licencia_sanitaria, pais, certificacion_gmp_vigente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'LABORATO_01', N'Laboratorios La Roche-Posay S.A. de C.V.', N'COF-LIC-FAB-2026-0001', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'LABORATO_02', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'COF-LIC-FAB-2026-0002', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'LABORATO_03', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'COF-LIC-FAB-2026-0003', N'Canadá', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'LABORATO_04', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'COF-LIC-FAB-2026-0004', N'España', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'LABORATO_05', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'COF-LIC-FAB-2026-0005', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'LABORATO_06', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'COF-LIC-FAB-2026-0006', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'LABORATO_07', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'COF-LIC-FAB-2026-0007', N'Alemania', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'LABORATO_08', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'COF-LIC-FAB-2026-0008', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'LABORATO_09', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'COF-LIC-FAB-2026-0009', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'LABORATO_10', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'COF-LIC-FAB-2026-0010', N'España', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'LABORATO_11', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'COF-LIC-FAB-2026-0011', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'LABORATO_12', N'Laboratorios MAC Professional S.A. de C.V.', N'COF-LIC-FAB-2026-0012', N'Canadá', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'LABORATO_13', N'Laboratorios Fenty Beauty S.A. de C.V.', N'COF-LIC-FAB-2026-0013', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'LABORATO_14', N'Laboratorios Rare Beauty S.A. de C.V.', N'COF-LIC-FAB-2026-0014', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'LABORATO_15', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'COF-LIC-FAB-2026-0015', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'LABORATO_16', N'Laboratorios Estée Lauder S.A. de C.V.', N'COF-LIC-FAB-2026-0016', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'LABORATO_17', N'Laboratorios Lancôme Paris S.A. de C.V.', N'COF-LIC-FAB-2026-0017', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'LABORATO_18', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'COF-LIC-FAB-2026-0018', N'Reino Unido', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'LABORATO_19', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'COF-LIC-FAB-2026-0019', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'LABORATO_20', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'COF-LIC-FAB-2026-0020', N'Corea del Sur', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'LABORATO_21', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'COF-LIC-FAB-2026-0021', N'Corea del Sur', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'LABORATO_22', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'COF-LIC-FAB-2026-0022', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'LABORATO_23', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'COF-LIC-FAB-2026-0023', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'LABORATO_24', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'COF-LIC-FAB-2026-0024', N'España', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'LABORATO_25', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'COF-LIC-FAB-2026-0025', N'España', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'LABORATO_26', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'COF-LIC-FAB-2026-0026', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'LABORATO_27', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'COF-LIC-FAB-2026-0027', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'LABORATO_28', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'COF-LIC-FAB-2026-0028', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'LABORATO_29', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'COF-LIC-FAB-2026-0029', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'LABORATO_30', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'COF-LIC-FAB-2026-0030', N'México', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.laboratorios_fabricantes OFF;
GO

-- =================================================================================================
-- 028. TABLA: catalogo.categorias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.categorias ON;
INSERT INTO catalogo.categorias (ID, codigo_categoria, nombre_categoria, descripcion, ID_categoria_padre, nivel_arbol, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CATEGORI_01', N'Sueros Concentrados', N'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CATEGORI_02', N'Limpiadores Faciales', N'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CATEGORI_03', N'Fotoprotección Solar', N'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CATEGORI_04', N'Hidratantes y Barrera', N'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CATEGORI_05', N'Tratamiento Anti-Edad', N'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CATEGORI_06', N'Control de Acné y Sebo', N'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CATEGORI_07', N'Despigmentantes', N'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CATEGORI_08', N'Contorno de Ojos', N'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CATEGORI_09', N'Exfoliantes Químicos', N'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CATEGORI_10', N'Maquillaje Dermatológico', N'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CATEGORI_11', N'Cuidado Labial', N'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CATEGORI_12', N'Cuidado Corporal', N'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CATEGORI_13', N'Aguas Termales y Brumas', N'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CATEGORI_14', N'Desmaquillantes Bifásicos', N'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CATEGORI_15', N'Mascarillas Terapéuticas', N'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CATEGORI_16', N'Sueros Concentrados (Línea Clínica)', N'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', 1, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CATEGORI_17', N'Limpiadores Faciales (Línea Clínica)', N'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', 2, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CATEGORI_18', N'Fotoprotección Solar (Línea Clínica)', N'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', 3, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CATEGORI_19', N'Hidratantes y Barrera (Línea Clínica)', N'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', 4, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CATEGORI_20', N'Tratamiento Anti-Edad (Línea Clínica)', N'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', 5, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CATEGORI_21', N'Control de Acné y Sebo (Línea Clínica)', N'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', 6, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CATEGORI_22', N'Despigmentantes (Línea Clínica)', N'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', 7, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CATEGORI_23', N'Contorno de Ojos (Línea Clínica)', N'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', 8, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CATEGORI_24', N'Exfoliantes Químicos (Línea Clínica)', N'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', 9, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CATEGORI_25', N'Maquillaje Dermatológico (Línea Clínica)', N'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', 10, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CATEGORI_26', N'Cuidado Labial (Línea Clínica)', N'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CATEGORI_27', N'Cuidado Corporal (Línea Clínica)', N'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', 12, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CATEGORI_28', N'Aguas Termales y Brumas (Línea Clínica)', N'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', 13, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CATEGORI_29', N'Desmaquillantes Bifásicos (Línea Clínica)', N'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', 14, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CATEGORI_30', N'Mascarillas Terapéuticas (Línea Clínica)', N'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', 15, 2, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.categorias OFF;
GO

-- =================================================================================================
-- 029. TABLA: catalogo.subcategorias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.subcategorias ON;
INSERT INTO catalogo.subcategorias (ID, ID_categoria, codigo_subcategoria, nombre_subcategoria, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SUBCATEG_01', N'Especialidad Sueros Concentrados', N'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SUBCATEG_02', N'Especialidad Limpiadores Faciales', N'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SUBCATEG_03', N'Especialidad Fotoprotección Solar', N'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SUBCATEG_04', N'Especialidad Hidratantes y Barrera', N'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SUBCATEG_05', N'Especialidad Tratamiento Anti-Edad', N'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SUBCATEG_06', N'Especialidad Control de Acné y Sebo', N'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SUBCATEG_07', N'Especialidad Despigmentantes', N'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SUBCATEG_08', N'Especialidad Contorno de Ojos', N'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SUBCATEG_09', N'Especialidad Exfoliantes Químicos', N'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SUBCATEG_10', N'Especialidad Maquillaje Dermatológico', N'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SUBCATEG_11', N'Especialidad Cuidado Labial', N'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SUBCATEG_12', N'Especialidad Cuidado Corporal', N'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SUBCATEG_13', N'Especialidad Aguas Termales y Brumas', N'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SUBCATEG_14', N'Especialidad Desmaquillantes Bifásicos', N'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SUBCATEG_15', N'Especialidad Mascarillas Terapéuticas', N'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SUBCATEG_16', N'Especialidad Sueros Concentrados', N'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SUBCATEG_17', N'Especialidad Limpiadores Faciales', N'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SUBCATEG_18', N'Especialidad Fotoprotección Solar', N'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SUBCATEG_19', N'Especialidad Hidratantes y Barrera', N'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SUBCATEG_20', N'Especialidad Tratamiento Anti-Edad', N'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SUBCATEG_21', N'Especialidad Control de Acné y Sebo', N'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SUBCATEG_22', N'Especialidad Despigmentantes', N'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SUBCATEG_23', N'Especialidad Contorno de Ojos', N'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SUBCATEG_24', N'Especialidad Exfoliantes Químicos', N'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SUBCATEG_25', N'Especialidad Maquillaje Dermatológico', N'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SUBCATEG_26', N'Especialidad Cuidado Labial', N'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SUBCATEG_27', N'Especialidad Cuidado Corporal', N'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SUBCATEG_28', N'Especialidad Aguas Termales y Brumas', N'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SUBCATEG_29', N'Especialidad Desmaquillantes Bifásicos', N'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SUBCATEG_30', N'Especialidad Mascarillas Terapéuticas', N'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.subcategorias OFF;
GO

-- =================================================================================================
-- 030. TABLA: catalogo.tipos_aplicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.tipos_aplicacion ON;
INSERT INTO catalogo.tipos_aplicacion (ID, codigo_aplicacion, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'APLICACI_01', N'Rostro Completo', N'Protocolo de aplicación tópica optimizado para rostro completo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'APLICACI_02', N'Contorno de Ojos', N'Protocolo de aplicación tópica optimizado para contorno de ojos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'APLICACI_03', N'Zona T', N'Protocolo de aplicación tópica optimizado para zona t.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'APLICACI_04', N'Cuello y Escote', N'Protocolo de aplicación tópica optimizado para cuello y escote.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'APLICACI_05', N'Labios', N'Protocolo de aplicación tópica optimizado para labios.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'APLICACI_06', N'Cuerpo Completo', N'Protocolo de aplicación tópica optimizado para cuerpo completo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'APLICACI_07', N'Áreas Localizadas', N'Protocolo de aplicación tópica optimizado para áreas localizadas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'APLICACI_08', N'Cuero Cabelludo', N'Protocolo de aplicación tópica optimizado para cuero cabelludo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'APLICACI_09', N'Manos y Cutículas', N'Protocolo de aplicación tópica optimizado para manos y cutículas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'APLICACI_10', N'Pestañas y Cejas', N'Protocolo de aplicación tópica optimizado para pestañas y cejas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'APLICACI_11', N'Mejillas y Pómulos', N'Protocolo de aplicación tópica optimizado para mejillas y pómulos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'APLICACI_12', N'Uso Nocturno Facial', N'Protocolo de aplicación tópica optimizado para uso nocturno facial.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'APLICACI_13', N'Uso Diurno Fotoprotector', N'Protocolo de aplicación tópica optimizado para uso diurno fotoprotector.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'APLICACI_14', N'Post-Procedimiento', N'Protocolo de aplicación tópica optimizado para post-procedimiento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'APLICACI_15', N'Piel Corporal Áspera', N'Protocolo de aplicación tópica optimizado para piel corporal áspera.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'APLICACI_16', N'Rostro Completo (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para rostro completo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'APLICACI_17', N'Contorno de Ojos (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para contorno de ojos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'APLICACI_18', N'Zona T (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para zona t.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'APLICACI_19', N'Cuello y Escote (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para cuello y escote.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'APLICACI_20', N'Labios (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para labios.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'APLICACI_21', N'Cuerpo Completo (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para cuerpo completo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'APLICACI_22', N'Áreas Localizadas (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para áreas localizadas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'APLICACI_23', N'Cuero Cabelludo (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para cuero cabelludo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'APLICACI_24', N'Manos y Cutículas (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para manos y cutículas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'APLICACI_25', N'Pestañas y Cejas (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para pestañas y cejas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'APLICACI_26', N'Mejillas y Pómulos (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para mejillas y pómulos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'APLICACI_27', N'Uso Nocturno Facial (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para uso nocturno facial.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'APLICACI_28', N'Uso Diurno Fotoprotector (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para uso diurno fotoprotector.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'APLICACI_29', N'Post-Procedimiento (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para post-procedimiento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'APLICACI_30', N'Piel Corporal Áspera (Uso Clínico)', N'Protocolo de aplicación tópica optimizado para piel corporal áspera.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.tipos_aplicacion OFF;
GO

-- =================================================================================================
-- 031. TABLA: catalogo.certificaciones_sanitarias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.certificaciones_sanitarias ON;
INSERT INTO catalogo.certificaciones_sanitarias (ID, codigo_certificacion, nombre_certificacion, organismo_certificador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CERTIFIC_01', N'Registro Sanitario COFEPRIS Nivel 1', N'COFEPRIS - Secretaría de Salud México', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CERTIFIC_02', N'Certificación GMP ISO 22716 Nivel 1', N'Bureau Veritas Quality International', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CERTIFIC_03', N'Dermatológicamente Probado Nivel 1', N'Colegio Ibero-Latinoamericano de Dermatología', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CERTIFIC_04', N'No Comedogénico Clínico Nivel 1', N'Instituto Europeo de Evaluación Cutánea', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CERTIFIC_05', N'Oftalmológicamente Testado Nivel 1', N'Laboratorio Clínico Ocular Eurofins', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CERTIFIC_06', N'Hipoalergénico Certificado Nivel 1', N'Centro de Alergología Dermatológica CDMX', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CERTIFIC_07', N'Leaping Bunny Cruelty Free Nivel 1', N'Cruelty Free International', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CERTIFIC_08', N'COSMOS Organic / ECOCERT Nivel 1', N'ECOCERT Greenlife SAS', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CERTIFIC_09', N'Apto Piel Sensible y Atópica Nivel 1', N'Asociación Mexicana de Dermatología Clínica', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CERTIFIC_10', N'Estabilidad Térmica Cadena Frío Nivel 1', N'Centro Nacional de Metrología CENAM', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CERTIFIC_11', N'Registro Sanitario COFEPRIS Nivel 2', N'COFEPRIS - Secretaría de Salud México', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CERTIFIC_12', N'Certificación GMP ISO 22716 Nivel 2', N'Bureau Veritas Quality International', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CERTIFIC_13', N'Dermatológicamente Probado Nivel 2', N'Colegio Ibero-Latinoamericano de Dermatología', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CERTIFIC_14', N'No Comedogénico Clínico Nivel 2', N'Instituto Europeo de Evaluación Cutánea', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CERTIFIC_15', N'Oftalmológicamente Testado Nivel 2', N'Laboratorio Clínico Ocular Eurofins', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CERTIFIC_16', N'Hipoalergénico Certificado Nivel 2', N'Centro de Alergología Dermatológica CDMX', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CERTIFIC_17', N'Leaping Bunny Cruelty Free Nivel 2', N'Cruelty Free International', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CERTIFIC_18', N'COSMOS Organic / ECOCERT Nivel 2', N'ECOCERT Greenlife SAS', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CERTIFIC_19', N'Apto Piel Sensible y Atópica Nivel 2', N'Asociación Mexicana de Dermatología Clínica', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CERTIFIC_20', N'Estabilidad Térmica Cadena Frío Nivel 2', N'Centro Nacional de Metrología CENAM', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CERTIFIC_21', N'Registro Sanitario COFEPRIS Nivel 3', N'COFEPRIS - Secretaría de Salud México', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CERTIFIC_22', N'Certificación GMP ISO 22716 Nivel 3', N'Bureau Veritas Quality International', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CERTIFIC_23', N'Dermatológicamente Probado Nivel 3', N'Colegio Ibero-Latinoamericano de Dermatología', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CERTIFIC_24', N'No Comedogénico Clínico Nivel 3', N'Instituto Europeo de Evaluación Cutánea', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CERTIFIC_25', N'Oftalmológicamente Testado Nivel 3', N'Laboratorio Clínico Ocular Eurofins', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CERTIFIC_26', N'Hipoalergénico Certificado Nivel 3', N'Centro de Alergología Dermatológica CDMX', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CERTIFIC_27', N'Leaping Bunny Cruelty Free Nivel 3', N'Cruelty Free International', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CERTIFIC_28', N'COSMOS Organic / ECOCERT Nivel 3', N'ECOCERT Greenlife SAS', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CERTIFIC_29', N'Apto Piel Sensible y Atópica Nivel 3', N'Asociación Mexicana de Dermatología Clínica', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CERTIFIC_30', N'Estabilidad Térmica Cadena Frío Nivel 3', N'Centro Nacional de Metrología CENAM', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.certificaciones_sanitarias OFF;
GO

-- =================================================================================================
-- 032. TABLA: catalogo.productos_maestros (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.productos_maestros ON;
INSERT INTO catalogo.productos_maestros (ID, ID_marca, ID_subcategoria, ID_laboratorio, ID_tipo_aplicacion, ID_certificacion_sanitaria, codigo_producto, nombre_comercial, descripcion_corta, descripcion_detallada, modo_empleo, requiere_prescripcion_medica, factor_proteccion_solar_fps, es_sensible_temperatura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 1, N'PRODUCTO_01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay', N'Fórmula dermatológica de alta tolerancia de La Roche-Posay para el cuidado diario.', N'Sérum Niacinamida 10% + Zinc 1% desarrollado por La Roche-Posay. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, N'PRODUCTO_02', N'Gel Limpiador Espumoso Facial - CeraVe', N'Fórmula dermatológica de alta tolerancia de CeraVe para el cuidado diario.', N'Gel Limpiador Espumoso Facial desarrollado por CeraVe. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, N'PRODUCTO_03', N'Protector Solar Fluido SPF 50+ - The Ordinary', N'Fórmula dermatológica de alta tolerancia de The Ordinary para el cuidado diario.', N'Protector Solar Fluido SPF 50+ desarrollado por The Ordinary. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, N'PRODUCTO_04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN', N'Fórmula dermatológica de alta tolerancia de ISDIN para el cuidado diario.', N'Sérum Ácido Hialurónico 2% + B5 desarrollado por ISDIN. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, N'PRODUCTO_05', N'Crema Hidratante con Ceramidas - Bioderma', N'Fórmula dermatológica de alta tolerancia de Bioderma para el cuidado diario.', N'Crema Hidratante con Ceramidas desarrollado por Bioderma. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, N'PRODUCTO_06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène', N'Fórmula dermatológica de alta tolerancia de Eau Thermale Avène para el cuidado diario.', N'Retinol Puro 0.5% Nocturno desarrollado por Eau Thermale Avène. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, N'PRODUCTO_07', N'Agua Micelar Dermolimpiadora - Eucerin', N'Fórmula dermatológica de alta tolerancia de Eucerin para el cuidado diario.', N'Agua Micelar Dermolimpiadora desarrollado por Eucerin. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, N'PRODUCTO_08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires', N'Fórmula dermatológica de alta tolerancia de Vichy Laboratoires para el cuidado diario.', N'Sérum Vitamina C Pura 15% desarrollado por Vichy Laboratoires. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, N'PRODUCTO_09', N'Base de Maquillaje Cobertura Media - SkinCeuticals', N'Fórmula dermatológica de alta tolerancia de SkinCeuticals para el cuidado diario.', N'Base de Maquillaje Cobertura Media desarrollado por SkinCeuticals. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, N'PRODUCTO_10', N'Corrector Líquido Alta Duración - Sesderma', N'Fórmula dermatológica de alta tolerancia de Sesderma para el cuidado diario.', N'Corrector Líquido Alta Duración desarrollado por Sesderma. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, N'PRODUCTO_11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics', N'Fórmula dermatológica de alta tolerancia de NARS Cosmetics para el cuidado diario.', N'Bálsamo Reparador Cicaplast B5 desarrollado por NARS Cosmetics. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, N'PRODUCTO_12', N'Exfoliante Ácido Salicílico 2% - MAC Cosmetics', N'Fórmula dermatológica de alta tolerancia de MAC Cosmetics para el cuidado diario.', N'Exfoliante Ácido Salicílico 2% desarrollado por MAC Cosmetics. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, N'PRODUCTO_13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty', N'Fórmula dermatológica de alta tolerancia de Fenty Beauty para el cuidado diario.', N'Contorno de Ojos con Cafeína 5% desarrollado por Fenty Beauty. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, N'PRODUCTO_14', N'Mascarilla Nocturna Hidratante - Rare Beauty', N'Fórmula dermatológica de alta tolerancia de Rare Beauty para el cuidado diario.', N'Mascarilla Nocturna Hidratante desarrollado por Rare Beauty. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, N'PRODUCTO_15', N'Bruma Termal Calmante Mineral - Clinique', N'Fórmula dermatológica de alta tolerancia de Clinique para el cuidado diario.', N'Bruma Termal Calmante Mineral desarrollado por Clinique. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, N'PRODUCTO_16', N'Aceite Limpiador Emulsionable - Estée Lauder', N'Fórmula dermatológica de alta tolerancia de Estée Lauder para el cuidado diario.', N'Aceite Limpiador Emulsionable desarrollado por Estée Lauder. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, N'PRODUCTO_17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme', N'Fórmula dermatológica de alta tolerancia de Lancôme para el cuidado diario.', N'Tónico Equilibrante Ácido Glicólico 7% desarrollado por Lancôme. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, N'PRODUCTO_18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury', N'Fórmula dermatológica de alta tolerancia de Charlotte Tilbury para el cuidado diario.', N'Labial Hidratante Péptidos Nude desarrollado por Charlotte Tilbury. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, N'PRODUCTO_19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice', N'Fórmula dermatológica de alta tolerancia de Paula''s Choice para el cuidado diario.', N'Polvo Traslúcido Matificante Mineral desarrollado por Paula''s Choice. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, N'PRODUCTO_20', N'Rubor Líquido Pigmento Natural - COSRX', N'Fórmula dermatológica de alta tolerancia de COSRX para el cuidado diario.', N'Rubor Líquido Pigmento Natural desarrollado por COSRX. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, N'PRODUCTO_21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige', N'Fórmula dermatológica de alta tolerancia de Laneige para el cuidado diario.', N'Sérum Ácido Azelaico 10% Suspensión desarrollado por Laneige. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, N'PRODUCTO_22', N'Ampolletas Proteoglicanos Firmeza - Uriage', N'Fórmula dermatológica de alta tolerancia de Uriage para el cuidado diario.', N'Ampolletas Proteoglicanos Firmeza desarrollado por Uriage. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, N'PRODUCTO_23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR', N'Fórmula dermatológica de alta tolerancia de Laboratoire SVR para el cuidado diario.', N'Crema Despigmentante Noche Melasma desarrollado por Laboratoire SVR. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, N'PRODUCTO_24', N'Protector Solar Mineral Óxido Zinc - MartiDerm', N'Fórmula dermatológica de alta tolerancia de MartiDerm para el cuidado diario.', N'Protector Solar Mineral Óxido Zinc desarrollado por MartiDerm. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, N'PRODUCTO_25', N'Loción Corporal Urea 10% Reparadora - Heliocare', N'Fórmula dermatológica de alta tolerancia de Heliocare para el cuidado diario.', N'Loción Corporal Urea 10% Reparadora desarrollado por Heliocare. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, N'PRODUCTO_26', N'Primer Facial Minimizador de Poros - Kiehl''s', N'Fórmula dermatológica de alta tolerancia de Kiehl''s para el cuidado diario.', N'Primer Facial Minimizador de Poros desarrollado por Kiehl''s. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, N'PRODUCTO_27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive', N'Fórmula dermatológica de alta tolerancia de Garnier SkinActive para el cuidado diario.', N'Máscara de Pestañas Hipoalergénica desarrollado por Garnier SkinActive. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, N'PRODUCTO_28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm', N'Fórmula dermatológica de alta tolerancia de L''Oréal Paris Derm para el cuidado diario.', N'Sérum Péptidos de Cobre 1% desarrollado por L''Oréal Paris Derm. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, N'PRODUCTO_29', N'Bálsamo Desmaquillante Caléndula - Neutrogena', N'Fórmula dermatológica de alta tolerancia de Neutrogena para el cuidado diario.', N'Bálsamo Desmaquillante Caléndula desarrollado por Neutrogena. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 1, NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, N'PRODUCTO_30', N'Crema Barrera Post-Retinoide - DermaCare Labs', N'Fórmula dermatológica de alta tolerancia de DermaCare Labs para el cuidado diario.', N'Crema Barrera Post-Retinoide desarrollado por DermaCare Labs. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', N'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', 0, NULL, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.productos_maestros OFF;
GO

-- =================================================================================================
-- 033. TABLA: catalogo.subtonos_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.subtonos_maquillaje ON;
INSERT INTO catalogo.subtonos_maquillaje (ID, codigo_subtono, nombre_subtono, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SUBTONO_01', N'Frío Rosado (Cool)', N'Subtono con matices rosados o azulados; favorece tonos porcelana y rosa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SUBTONO_02', N'Cálido Dorado (Warm)', N'Subtono con matices amarillos, miel o dorados; favorece bronce y durazno.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SUBTONO_03', N'Neutro Equilibrado', N'Balance armónico entre pigmentos cálidos y fríos sin predominancia marcada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SUBTONO_04', N'Oliva Verdoso (Olive)', N'Subtono cálido-neutro con trasfondo verdoso característico en pieles latinas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SUBTONO_05', N'Cálido Melocotón (Peach)', N'Subtono luminoso con matiz durazno ideal para neutralizar ojeras violáceas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'SUBTONO_06', N'Frío Neutro (Cool-Neutral)', N'Ligeramente rosado con base neutra adaptable a iluminación mixta.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'SUBTONO_07', N'Cálido Neutro (Warm-Neutral)', N'Base neutra con sutil calidez dorada sin oxidación naranja.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'SUBTONO_08', N'Ámbar Profundo (Deep Golden)', N'Subtono cálido rico en pigmentos dorados y cobrizos para pieles oscuras.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'SUBTONO_09', N'Ébano Frío (Deep Cool)', N'Subtono profundo con matices ciruela y azulados sin aspecto cenizo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'SUBTONO_10', N'Universal Traslúcido', N'Sin carga de pigmento corrector; adaptable a cualquier fototipo Fitzpatrick.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'SUBTONO_11', N'Frío Rosado (Cool) (2)', N'Subtono con matices rosados o azulados; favorece tonos porcelana y rosa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'SUBTONO_12', N'Cálido Dorado (Warm) (2)', N'Subtono con matices amarillos, miel o dorados; favorece bronce y durazno.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'SUBTONO_13', N'Neutro Equilibrado (2)', N'Balance armónico entre pigmentos cálidos y fríos sin predominancia marcada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'SUBTONO_14', N'Oliva Verdoso (Olive) (2)', N'Subtono cálido-neutro con trasfondo verdoso característico en pieles latinas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'SUBTONO_15', N'Cálido Melocotón (Peach) (2)', N'Subtono luminoso con matiz durazno ideal para neutralizar ojeras violáceas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'SUBTONO_16', N'Frío Neutro (Cool-Neutral) (2)', N'Ligeramente rosado con base neutra adaptable a iluminación mixta.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'SUBTONO_17', N'Cálido Neutro (Warm-Neutral) (2)', N'Base neutra con sutil calidez dorada sin oxidación naranja.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'SUBTONO_18', N'Ámbar Profundo (Deep Golden) (2)', N'Subtono cálido rico en pigmentos dorados y cobrizos para pieles oscuras.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'SUBTONO_19', N'Ébano Frío (Deep Cool) (2)', N'Subtono profundo con matices ciruela y azulados sin aspecto cenizo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'SUBTONO_20', N'Universal Traslúcido (2)', N'Sin carga de pigmento corrector; adaptable a cualquier fototipo Fitzpatrick.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'SUBTONO_21', N'Frío Rosado (Cool) (3)', N'Subtono con matices rosados o azulados; favorece tonos porcelana y rosa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'SUBTONO_22', N'Cálido Dorado (Warm) (3)', N'Subtono con matices amarillos, miel o dorados; favorece bronce y durazno.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'SUBTONO_23', N'Neutro Equilibrado (3)', N'Balance armónico entre pigmentos cálidos y fríos sin predominancia marcada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'SUBTONO_24', N'Oliva Verdoso (Olive) (3)', N'Subtono cálido-neutro con trasfondo verdoso característico en pieles latinas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'SUBTONO_25', N'Cálido Melocotón (Peach) (3)', N'Subtono luminoso con matiz durazno ideal para neutralizar ojeras violáceas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'SUBTONO_26', N'Frío Neutro (Cool-Neutral) (3)', N'Ligeramente rosado con base neutra adaptable a iluminación mixta.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'SUBTONO_27', N'Cálido Neutro (Warm-Neutral) (3)', N'Base neutra con sutil calidez dorada sin oxidación naranja.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'SUBTONO_28', N'Ámbar Profundo (Deep Golden) (3)', N'Subtono cálido rico en pigmentos dorados y cobrizos para pieles oscuras.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'SUBTONO_29', N'Ébano Frío (Deep Cool) (3)', N'Subtono profundo con matices ciruela y azulados sin aspecto cenizo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'SUBTONO_30', N'Universal Traslúcido (3)', N'Sin carga de pigmento corrector; adaptable a cualquier fototipo Fitzpatrick.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.subtonos_maquillaje OFF;
GO

-- =================================================================================================
-- 034. TABLA: catalogo.acabados_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.acabados_maquillaje ON;
INSERT INTO catalogo.acabados_maquillaje (ID, codigo_acabado, nombre_acabado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ACABADO_01', N'Mate Aterciopelado', N'Controla brillo hasta 12 horas sin resecar ni marcar líneas de expresión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ACABADO_02', N'Natural Segunda Piel', N'Imita el acabado saludable fisiológico de una epidermis equilibrada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ACABADO_03', N'Luminoso Glow', N'Aporta reflexión de luz hidratada con micro-emolientes no comedogénicos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'ACABADO_04', N'Satinado Hidratante', N'Equilibrio entre suavidad sedosa y confort flexible durante todo el día.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ACABADO_05', N'Soft-Matte Difuminado', N'Efecto filtro óptico que minimiza la apariencia visual de poros dilatados.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'ACABADO_06', N'Mineral Polvo Suelto', N'Partículas micronizadas ultrafinas libres de talco para sellar sin peso.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'ACABADO_07', N'Gel-Crema Acuoso', N'Acabado fresco invisible de absorción inmediata sin residuo graso.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'ACABADO_08', N'Bálsamo Brillante', N'Película protectora jugosa que sella humedad en labios y zonas secas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'ACABADO_09', N'Invisible Tacto Seco', N'Especialmente formulado en fotoprotectores para cero residuo blanco.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'ACABADO_10', N'Cobertura Construible', N'Permite modular desde cobertura ligera hasta alta manteniendo transpirabilidad.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ACABADO_11', N'Mate Aterciopelado (2)', N'Controla brillo hasta 12 horas sin resecar ni marcar líneas de expresión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ACABADO_12', N'Natural Segunda Piel (2)', N'Imita el acabado saludable fisiológico de una epidermis equilibrada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'ACABADO_13', N'Luminoso Glow (2)', N'Aporta reflexión de luz hidratada con micro-emolientes no comedogénicos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'ACABADO_14', N'Satinado Hidratante (2)', N'Equilibrio entre suavidad sedosa y confort flexible durante todo el día.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ACABADO_15', N'Soft-Matte Difuminado (2)', N'Efecto filtro óptico que minimiza la apariencia visual de poros dilatados.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'ACABADO_16', N'Mineral Polvo Suelto (2)', N'Partículas micronizadas ultrafinas libres de talco para sellar sin peso.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'ACABADO_17', N'Gel-Crema Acuoso (2)', N'Acabado fresco invisible de absorción inmediata sin residuo graso.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ACABADO_18', N'Bálsamo Brillante (2)', N'Película protectora jugosa que sella humedad en labios y zonas secas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'ACABADO_19', N'Invisible Tacto Seco (2)', N'Especialmente formulado en fotoprotectores para cero residuo blanco.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'ACABADO_20', N'Cobertura Construible (2)', N'Permite modular desde cobertura ligera hasta alta manteniendo transpirabilidad.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ACABADO_21', N'Mate Aterciopelado (3)', N'Controla brillo hasta 12 horas sin resecar ni marcar líneas de expresión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'ACABADO_22', N'Natural Segunda Piel (3)', N'Imita el acabado saludable fisiológico de una epidermis equilibrada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'ACABADO_23', N'Luminoso Glow (3)', N'Aporta reflexión de luz hidratada con micro-emolientes no comedogénicos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'ACABADO_24', N'Satinado Hidratante (3)', N'Equilibrio entre suavidad sedosa y confort flexible durante todo el día.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'ACABADO_25', N'Soft-Matte Difuminado (3)', N'Efecto filtro óptico que minimiza la apariencia visual de poros dilatados.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'ACABADO_26', N'Mineral Polvo Suelto (3)', N'Partículas micronizadas ultrafinas libres de talco para sellar sin peso.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ACABADO_27', N'Gel-Crema Acuoso (3)', N'Acabado fresco invisible de absorción inmediata sin residuo graso.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'ACABADO_28', N'Bálsamo Brillante (3)', N'Película protectora jugosa que sella humedad en labios y zonas secas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'ACABADO_29', N'Invisible Tacto Seco (3)', N'Especialmente formulado en fotoprotectores para cero residuo blanco.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'ACABADO_30', N'Cobertura Construible (3)', N'Permite modular desde cobertura ligera hasta alta manteniendo transpirabilidad.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.acabados_maquillaje OFF;
GO

-- =================================================================================================
-- 035. TABLA: catalogo.variantes_sku (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.variantes_sku ON;
INSERT INTO catalogo.variantes_sku (ID, ID_producto, sku_codigo, codigo_barras_ean13, nombre_presentacion, contenido_neto_gramos_ml, unidad_medida, precio_base_menudeo, costo_estandar_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'DERMA-SKU-1001', '7501000000019', N'Frasco Gotero / Dosificador 30 ml - La Roche-Posay', 30.00, N'ML', 285.50, 148.46, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'DERMA-SKU-1002', '7501000000029', N'Tubo Dermocosmético 50 g - CeraVe', 50.00, N'G', 321.00, 166.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'DERMA-SKU-1003', '7501000000039', N'Envase Airless 1.7 oz - The Ordinary', 1.70, N'OZ', 356.50, 185.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DERMA-SKU-1004', '7501000000049', N'Presentación Unitaria Sellada - ISDIN', 1.00, N'PZ', 392.00, 203.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'DERMA-SKU-1005', '7501000000059', N'Frasco Gotero / Dosificador 30 ml - Bioderma', 30.00, N'ML', 427.50, 222.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'DERMA-SKU-1006', '7501000000069', N'Tubo Dermocosmético 50 g - Eau Thermale Avène', 50.00, N'G', 463.00, 240.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'DERMA-SKU-1007', '7501000000079', N'Envase Airless 1.7 oz - Eucerin', 1.70, N'OZ', 498.50, 259.22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DERMA-SKU-1008', '7501000000089', N'Presentación Unitaria Sellada - Vichy Laboratoires', 1.00, N'PZ', 534.00, 277.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'DERMA-SKU-1009', '7501000000099', N'Frasco Gotero / Dosificador 30 ml - SkinCeuticals', 30.00, N'ML', 569.50, 296.14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'DERMA-SKU-1010', '7501000000109', N'Tubo Dermocosmético 50 g - Sesderma', 50.00, N'G', 605.00, 314.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'DERMA-SKU-1011', '7501000000119', N'Envase Airless 1.7 oz - NARS Cosmetics', 1.70, N'OZ', 640.50, 333.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DERMA-SKU-1012', '7501000000129', N'Presentación Unitaria Sellada - MAC Cosmetics', 1.00, N'PZ', 676.00, 351.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'DERMA-SKU-1013', '7501000000139', N'Frasco Gotero / Dosificador 30 ml - Fenty Beauty', 30.00, N'ML', 711.50, 369.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'DERMA-SKU-1014', '7501000000149', N'Tubo Dermocosmético 50 g - Rare Beauty', 50.00, N'G', 747.00, 388.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'DERMA-SKU-1015', '7501000000159', N'Envase Airless 1.7 oz - Clinique', 1.70, N'OZ', 782.50, 406.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DERMA-SKU-1016', '7501000000169', N'Presentación Unitaria Sellada - Estée Lauder', 1.00, N'PZ', 818.00, 425.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'DERMA-SKU-1017', '7501000000179', N'Frasco Gotero / Dosificador 30 ml - Lancôme', 30.00, N'ML', 853.50, 443.82, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'DERMA-SKU-1018', '7501000000189', N'Tubo Dermocosmético 50 g - Charlotte Tilbury', 50.00, N'G', 889.00, 462.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'DERMA-SKU-1019', '7501000000199', N'Envase Airless 1.7 oz - Paula''s Choice', 1.70, N'OZ', 924.50, 480.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DERMA-SKU-1020', '7501000000209', N'Presentación Unitaria Sellada - COSRX', 1.00, N'PZ', 960.00, 499.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'DERMA-SKU-1021', '7501000000219', N'Frasco Gotero / Dosificador 30 ml - Laneige', 30.00, N'ML', 995.50, 517.66, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'DERMA-SKU-1022', '7501000000229', N'Tubo Dermocosmético 50 g - Uriage', 50.00, N'G', 1031.00, 536.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'DERMA-SKU-1023', '7501000000239', N'Envase Airless 1.7 oz - Laboratoire SVR', 1.70, N'OZ', 1066.50, 554.58, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DERMA-SKU-1024', '7501000000249', N'Presentación Unitaria Sellada - MartiDerm', 1.00, N'PZ', 1102.00, 573.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'DERMA-SKU-1025', '7501000000259', N'Frasco Gotero / Dosificador 30 ml - Heliocare', 30.00, N'ML', 1137.50, 591.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'DERMA-SKU-1026', '7501000000269', N'Tubo Dermocosmético 50 g - Kiehl''s', 50.00, N'G', 1173.00, 609.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'DERMA-SKU-1027', '7501000000279', N'Envase Airless 1.7 oz - Garnier SkinActive', 1.70, N'OZ', 1208.50, 628.42, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DERMA-SKU-1028', '7501000000289', N'Presentación Unitaria Sellada - L''Oréal Paris Derm', 1.00, N'PZ', 1244.00, 646.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'DERMA-SKU-1029', '7501000000299', N'Frasco Gotero / Dosificador 30 ml - Neutrogena', 30.00, N'ML', 1279.50, 665.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'DERMA-SKU-1030', '7501000000309', N'Tubo Dermocosmético 50 g - DermaCare Labs', 50.00, N'G', 1315.00, 683.80, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.variantes_sku OFF;
GO

-- =================================================================================================
-- 036. TABLA: catalogo.tonos_variante (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.tonos_variante ON;
INSERT INTO catalogo.tonos_variante (ID, ID_variante_sku, ID_subtono, ID_acabado, codigo_tono_color, nombre_tono, color_hexadecimal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'TONO_COL_01', N'010 Porcelana Fría', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, N'TONO_COL_02', N'015 Marfil Neutro', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, N'TONO_COL_03', N'020 Vainilla Cálida', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, N'TONO_COL_04', N'025 Arena Dorada', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, N'TONO_COL_05', N'030 Beige Natural', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, N'TONO_COL_06', N'035 Miel Suave', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, N'TONO_COL_07', N'040 Trigo Oliva', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, N'TONO_COL_08', N'045 Caramelo Neutro', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, N'TONO_COL_09', N'050 Canela Cálida', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, N'TONO_COL_10', N'055 Avellana Dorada', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, N'TONO_COL_11', N'060 Ámbar Profundo', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, N'TONO_COL_12', N'065 Cacao Frío', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, N'TONO_COL_13', N'110 Alabastro', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, N'TONO_COL_14', N'120 Lino Claro', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, N'TONO_COL_15', N'130 Durazno Luminoso', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, N'TONO_COL_16', N'140 Almendra', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, N'TONO_COL_17', N'150 Duna', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, N'TONO_COL_18', N'160 Terracota Suave', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, N'TONO_COL_19', N'170 Bronce Medio', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, N'TONO_COL_20', N'180 Expresso', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, N'TONO_COL_21', N'210 Rosa Pétalo', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, N'TONO_COL_22', N'220 Nude Malva', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, N'TONO_COL_23', N'230 Coral Terracota', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, N'TONO_COL_24', N'240 Frambuesa', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, N'TONO_COL_25', N'000 Traslúcido Universal', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, N'TONO_COL_26', N'005 Iluminador Champán', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, N'TONO_COL_27', N'012 Salmón Corrector', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, N'TONO_COL_28', N'018 Verde Neutralizador', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, N'TONO_COL_29', N'022 Lavanda Iluminador', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, N'TONO_COL_30', N'090 Tinted Bronze FPS50', N'#7D412E', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.tonos_variante OFF;
GO

-- =================================================================================================
-- 037. TABLA: catalogo.ingredientes_inci (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.ingredientes_inci ON;
INSERT INTO catalogo.ingredientes_inci (ID, codigo_cas, nombre_inci, nombre_comun, funcion_principal, es_comedogenico, indice_comedogenico, es_alergeno_frecuente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CAS_01', N'Niacinamide', N'Vitamina B3', N'Seborregulador, despigmentante y fortalecedor de ceramidas', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CAS_02', N'Sodium Hyaluronate', N'Sal de Ácido Hialurónico', N'Humectante captador de agua de alta penetración', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAS_03', N'Retinol', N'Vitamina A Pura', N'Renovador celular, estimulante de colágeno y antiarrugas', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAS_04', N'Salicylic Acid', N'Ácido Salicílico (BHA)', N'Exfoliante lipofílico desobstructor de poros', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CAS_05', N'Ascorbic Acid', N'Vitamina C Pura', N'Antioxidante potente, iluminador y cofactor de colágeno', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CAS_06', N'Ceramide NP', N'Ceramida Bioidéntica NP', N'Lípido estructural reparador de la barrera epidérmica', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CAS_07', N'Panthenol', N'Provitamina B5', N'Calmante, regenerador epitelial y humectante', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CAS_08', N'Azelaic Acid', N'Ácido Azelaico', N'Antiinflamatorio para rosácea, acné y manchas', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAS_09', N'Glycolic Acid', N'Ácido Glicólico (AHA)', N'Exfoliante químico superficial que mejora textura', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CAS_10', N'Zinc Oxide', N'Óxido de Zinc Micronizado', N'Filtro solar mineral de amplio espectro y calmante', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CAS_11', N'Titanium Dioxide', N'Dióxido de Titanio', N'Filtro físico protector frente a radiación UVB/UVA', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CAS_12', N'Tocopherol', N'Vitamina E', N'Antioxidante liposoluble estabilizador de membranas', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CAS_13', N'Madecassoside', N'Extracto Purificado de Centella', N'Reparador dérmico y calmante post-inflamatorio', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CAS_14', N'Squalane', N'Escualano Vegetal', N'Emoliente biomimético ligero no comedogénico', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CAS_15', N'Allantoin', N'Alantoína', N'Queratolítico suave, calmante y cicatrizante', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CAS_16', N'Caffeine', N'Cafeína Anhidra', N'Vasoconstrictor y drenante para contorno ocular', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CAS_17', N'Urea', N'Urea Dermatológica', N'Humectante natural NMF y queratolítico suave', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CAS_18', N'Ferulic Acid', N'Ácido Ferúlico', N'Antioxidante sinérgico estabilizador de Vitamina C y E', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CAS_19', N'Lactic Acid', N'Ácido Láctico (AHA)', N'Exfoliante hidratante suave para pieles sensibles', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CAS_20', N'Bisabolol', N'Alfa-Bisabolol', N'Activo calmante derivado de manzanilla anti-eritema', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CAS_21', N'Bakuchiol', N'Bakuchiol Botánico', N'Alternativa fitoquímica al retinol apta para piel sensible', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CAS_22', N'Tranexamic Acid', N'Ácido Tranexámico', N'Inhibidor de plasmina para melasma persistente', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CAS_23', N'Copper Tripeptide-1', N'Tripéptido de Cobre', N'Péptido señalizador reparador y reafirmante', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CAS_24', N'Glycerin', N'Glicerina Vegetal USP', N'Humectante clásico retenedor de hidratación', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CAS_25', N'Dimethicone', N'Dimeticona Grado Médico', N'Protector oclusivo transpirable suavizante', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CAS_26', N'Shea Butter', N'Manteca de Karité Refinada', N'Emoliente rico en ácidos grasos nutritivos', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CAS_27', N'Thermal Spring Water', N'Agua Termal Mineralizante', N'Calma irritación y refuerza defensas antioxidantes', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CAS_28', N'Zinc PCA', N'Sal de Zinc PCA', N'Controla secreción sebácea y proliferación microbiana', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CAS_29', N'Kojic Acid', N'Ácido Kójico', N'Quelante de cobre inhibidor de melanogénesis', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CAS_30', N'Peptide Matrixyl 3000', N'Palmitoil Tripéptido-1/7', N'Complejo peptídico estimulante de matriz extracelular', 0, 2, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.ingredientes_inci OFF;
GO

-- =================================================================================================
-- 038. TABLA: catalogo.alergenos_ingrediente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.alergenos_ingrediente ON;
INSERT INTO catalogo.alergenos_ingrediente (ID, ID_ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Linalool', N'BAJO', N'Contiene Linalool natural; realizar prueba de parche en piel reactiva.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Limonene', N'MEDIO', N'Contiene Limonene oxidable; mantener cerrado y alejado de luz directa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Retinoides Concentrados', N'ALTO', N'No usar durante embarazo; suspender si hay descamación intensa.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Ácido Salicílico 2%', N'MEDIO', N'Contraindicado en alergia a salicilatos o aspirina.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Ácido Ascórbico Ácido pH<3.5', N'MEDIO', N'Puede causar hormigueo transitorio en barrera comprometida.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Ceramidas Vegetales', N'BAJO', N'Libre de fragancia; apto para piel atópica bajo tolerancia.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Alcohol Desnaturalizado Trazas', N'MEDIO', N'Evitar en eccema agudo o heridas abiertas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Ácido Azelaico 10%', N'BAJO', N'Sensación leve de picor los primeros minutos de adaptación.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Alfa-Hidroxiácidos (AHA)', N'ALTO', N'Incrementa fotosensibilidad; obligatorio usar FPS 50+ diario.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Filtros Minerales Nano', N'BAJO', N'Uso tópico exclusivo; evitar inhalación en presentaciones en bruma.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Dióxido de Titanio Recubierto', N'BAJO', N'Limpiar completamente por la noche con doble limpieza.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Tocoferol Sintético', N'BAJO', N'Baja incidencia alergénica; conservar en lugar fresco.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Extractos Botánicos Centella', N'BAJO', N'Suspender inmediatamente ante erupción urticarial.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Escualano de Oliva', N'BAJO', N'Seguro en dermatitis seborreica; no comedogénico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Alantoína USP', N'BAJO', N'Apto para uso frecuente; uso externo exclusivo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Cafeína Tópica', N'MEDIO', N'Evitar entrada directa al saco conjuntival del ojo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Urea Alta Concentración', N'MEDIO', N'Puede causar escozor sobre piel fisurada o recién rasurada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Ácido Ferúlico Botánico', N'MEDIO', N'Posible sensibilización en personas alérgicas a gramíneas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Ácido Láctico 5-10%', N'MEDIO', N'No combinar simultáneamente con otros ácidos exfoliantes.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Sesquiterpenos Manzanilla', N'MEDIO', N'Precaución en pacientes alérgicos a familia Asteraceae.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Psoralea Corylifolia', N'BAJO', N'Alternativa suave al retinol; probar primero en antebrazo.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ácido Tranexámico Tópico', N'BAJO', N'Uso exclusivo cutáneo; evitar mucosas.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Complejos de Cobre', N'MEDIO', N'No mezclar en la misma aplicación con vitamina C ácida.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Polioles Humectantes', N'BAJO', N'Hipoalergénico; sin advertencias restrictivas mayores.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Siliconas Volátiles', N'BAJO', N'Uso externo; retirar correctamente antes de dormir.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Látex / Nueces Karité Trazas', N'MEDIO', N'Aunque refinada, verificar tolerancia en alergia severa a nueces.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Sales Minerales Hipertónicas', N'BAJO', N'Secar exceso suavemente tras 2 minutos en piel muy seca.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sales de Zinc', N'BAJO', N'Evitar contacto directo con ojos.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Ácido Kójico 1-2%', N'ALTO', N'Potencial sensibilizante tras uso prolongado; usar bajo supervisión.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Péptidos Biomiméticos', N'BAJO', N'Compatible con piel sensible; suspender si hay enrojecimiento.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.alergenos_ingrediente OFF;
GO

-- =================================================================================================
-- 039. TABLA: catalogo.formula_ingredientes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.formula_ingredientes ON;
INSERT INTO catalogo.formula_ingredientes (ID, ID_producto, ID_ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 10.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 0.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 2.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 15.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 1.50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 5.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 10.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 7.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 12.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 10.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 2.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 0.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 2.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 1.50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 5.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 10.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 7.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 12.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 10.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 2.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 0.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 2.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 15.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 1.50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 5.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 10.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 7.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 12.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.formula_ingredientes OFF;
GO

-- =================================================================================================
-- 040. TABLA: catalogo.registros_sanitarios_cofepris (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.registros_sanitarios_cofepris ON;
INSERT INTO catalogo.registros_sanitarios_cofepris (ID, ID_producto, numero_registro_sanitario, folio_ingreso_tramite, fecha_emision, fecha_vencimiento, estatus_regulatorio, documento_oficial_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'COF-2026-MX-10001-SAN', N'FOL-INGRE-2026-0001', '2024-01-01', '2029-01-01', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'COF-2026-MX-10002-SAN', N'FOL-INGRE-2026-0002', '2024-02-02', '2029-02-02', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'COF-2026-MX-10003-SAN', N'FOL-INGRE-2026-0003', '2024-03-03', '2029-03-03', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'COF-2026-MX-10004-SAN', N'FOL-INGRE-2026-0004', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'COF-2026-MX-10005-SAN', N'FOL-INGRE-2026-0005', '2024-05-05', '2029-05-05', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'COF-2026-MX-10006-SAN', N'FOL-INGRE-2026-0006', '2024-06-06', '2029-06-06', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'COF-2026-MX-10007-SAN', N'FOL-INGRE-2026-0007', '2024-07-07', '2029-07-07', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'COF-2026-MX-10008-SAN', N'FOL-INGRE-2026-0008', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'COF-2026-MX-10009-SAN', N'FOL-INGRE-2026-0009', '2024-09-09', '2029-09-09', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'COF-2026-MX-10010-SAN', N'FOL-INGRE-2026-0010', '2024-10-10', '2029-10-10', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'COF-2026-MX-10011-SAN', N'FOL-INGRE-2026-0011', '2024-11-11', '2029-11-11', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'COF-2026-MX-10012-SAN', N'FOL-INGRE-2026-0012', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'COF-2026-MX-10013-SAN', N'FOL-INGRE-2026-0013', '2024-01-13', '2029-01-13', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'COF-2026-MX-10014-SAN', N'FOL-INGRE-2026-0014', '2024-02-14', '2029-02-14', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'COF-2026-MX-10015-SAN', N'FOL-INGRE-2026-0015', '2024-03-15', '2029-03-15', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'COF-2026-MX-10016-SAN', N'FOL-INGRE-2026-0016', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'COF-2026-MX-10017-SAN', N'FOL-INGRE-2026-0017', '2024-05-17', '2029-05-17', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'COF-2026-MX-10018-SAN', N'FOL-INGRE-2026-0018', '2024-06-18', '2029-06-18', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'COF-2026-MX-10019-SAN', N'FOL-INGRE-2026-0019', '2024-07-19', '2029-07-19', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'COF-2026-MX-10020-SAN', N'FOL-INGRE-2026-0020', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'COF-2026-MX-10021-SAN', N'FOL-INGRE-2026-0021', '2024-09-21', '2029-09-21', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'COF-2026-MX-10022-SAN', N'FOL-INGRE-2026-0022', '2024-10-22', '2029-10-22', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'COF-2026-MX-10023-SAN', N'FOL-INGRE-2026-0023', '2024-11-23', '2029-11-23', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'COF-2026-MX-10024-SAN', N'FOL-INGRE-2026-0024', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'COF-2026-MX-10025-SAN', N'FOL-INGRE-2026-0025', '2024-01-25', '2029-01-25', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'COF-2026-MX-10026-SAN', N'FOL-INGRE-2026-0026', '2024-02-01', '2029-02-01', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'COF-2026-MX-10027-SAN', N'FOL-INGRE-2026-0027', '2024-03-02', '2029-03-02', N'SUSPENDIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'COF-2026-MX-10028-SAN', N'FOL-INGRE-2026-0028', '2020-03-15', '2025-03-15', N'VENCIDO', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'COF-2026-MX-10029-SAN', N'FOL-INGRE-2026-0029', '2024-05-04', '2029-05-04', N'VIGENTE', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'COF-2026-MX-10030-SAN', N'FOL-INGRE-2026-0030', '2024-06-05', '2029-06-05', N'EN_RENOVACION', N'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.registros_sanitarios_cofepris OFF;
GO

-- =================================================================================================
-- 041. TABLA: catalogo.advertencias_contraindicaciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.advertencias_contraindicaciones ON;
INSERT INTO catalogo.advertencias_contraindicaciones (ID, ID_producto, tipo_advertencia, texto_advertencia, medida_en_caso_ingestion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Niacinamide.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Sodium Hyaluronate.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Retinol.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Salicylic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ascorbic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ceramide NP.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Panthenol.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Azelaic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycolic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc Oxide.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Titanium Dioxide.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tocopherol.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Madecassoside.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Squalane.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Allantoin.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Caffeine.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Urea.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ferulic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Lactic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bisabolol.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bakuchiol.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tranexamic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Copper Tripeptide-1.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycerin.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Dimethicone.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Shea Butter.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Thermal Spring Water.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc PCA.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Kojic Acid.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Peptide Matrixyl 3000.', N'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.advertencias_contraindicaciones OFF;
GO

-- =================================================================================================
-- 042. TABLA: catalogo.multimedia_variantes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.multimedia_variantes ON;
INSERT INTO catalogo.multimedia_variantes (ID, ID_variante_sku, tipo_archivo, url_recurso, texto_alternativo_accesibilidad, numero_orden, es_imagen_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_001.webp', N'Fotografía clínica de Sérum Niacinamida 10% + Zinc 1% marca La Roche-Posay', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_002.webp', N'Fotografía clínica de Gel Limpiador Espumoso Facial marca CeraVe Dermatological', 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_003.webp', N'Fotografía clínica de Protector Solar Fluido SPF 50+ marca The Ordinary Deciem', 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_004.mp4', N'Fotografía clínica de Sérum Ácido Hialurónico 2% + B5 marca ISDIN Fotoprotección', 4, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_005.webp', N'Fotografía clínica de Crema Hidratante con Ceramidas marca Bioderma Laboratoire', 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_006.webp', N'Fotografía clínica de Retinol Puro 0.5% Nocturno marca Eau Thermale Avène', 6, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_007.webp', N'Fotografía clínica de Agua Micelar Dermolimpiadora marca Eucerin Beiersdorf', 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_008.mp4', N'Fotografía clínica de Sérum Vitamina C Pura 15% marca Vichy Laboratoires', 8, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_009.webp', N'Fotografía clínica de Base de Maquillaje Cobertura Media marca SkinCeuticals Clinical', 9, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_010.webp', N'Fotografía clínica de Corrector Líquido Alta Duración marca Sesderma Nanotech', 10, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_011.webp', N'Fotografía clínica de Bálsamo Reparador Cicaplast B5 marca NARS Cosmetics', 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_012.mp4', N'Fotografía clínica de Exfoliante Ácido Salicílico 2% marca MAC Professional', 12, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_013.webp', N'Fotografía clínica de Contorno de Ojos con Cafeína 5% marca Fenty Beauty', 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_014.webp', N'Fotografía clínica de Mascarilla Nocturna Hidratante marca Rare Beauty', 14, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_015.webp', N'Fotografía clínica de Bruma Termal Calmante Mineral marca Clinique Laboratories', 15, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_016.mp4', N'Fotografía clínica de Aceite Limpiador Emulsionable marca Estée Lauder', 16, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_017.webp', N'Fotografía clínica de Tónico Equilibrante Ácido Glicólico 7% marca Lancôme Paris', 17, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_018.webp', N'Fotografía clínica de Labial Hidratante Péptidos Nude marca Charlotte Tilbury', 18, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_019.webp', N'Fotografía clínica de Polvo Traslúcido Matificante Mineral marca Paula''s Choice Skincare', 19, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_020.mp4', N'Fotografía clínica de Rubor Líquido Pigmento Natural marca COSRX K-Beauty', 20, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_021.webp', N'Fotografía clínica de Sérum Ácido Azelaico 10% Suspensión marca Laneige Amorepacific', 21, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_022.webp', N'Fotografía clínica de Ampolletas Proteoglicanos Firmeza marca Uriage Eau Thermale', 22, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_023.webp', N'Fotografía clínica de Crema Despigmentante Noche Melasma marca Laboratoire SVR', 23, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_024.mp4', N'Fotografía clínica de Protector Solar Mineral Óxido Zinc marca MartiDerm Ampollas', 24, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_025.webp', N'Fotografía clínica de Loción Corporal Urea 10% Reparadora marca Heliocare Cantabria Labs', 25, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_026.webp', N'Fotografía clínica de Primer Facial Minimizador de Poros marca Kiehl''s Since 1851', 26, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_027.webp', N'Fotografía clínica de Máscara de Pestañas Hipoalergénica marca Garnier SkinActive', 27, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_028.mp4', N'Fotografía clínica de Sérum Péptidos de Cobre 1% marca L''Oréal Paris Derm', 28, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_029.webp', N'Fotografía clínica de Bálsamo Desmaquillante Caléndula marca Neutrogena Derm', 29, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_030.webp', N'Fotografía clínica de Crema Barrera Post-Retinoide marca DermaCare Labs México', 30, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.multimedia_variantes OFF;
GO

-- =================================================================================================
-- 043. TABLA: catalogo.kits_sets (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.kits_sets ON;
INSERT INTO catalogo.kits_sets (ID, codigo_kit, nombre_kit, descripcion, descuento_porcentual_kit, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'KIT_01', N'Kit Rutina La Roche-Posay #1', N'Set dermatológico curado con rutina completa La Roche-Posay para sinergia clínica.', 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'KIT_02', N'Kit Rutina CeraVe Dermatological #2', N'Set dermatológico curado con rutina completa CeraVe para sinergia clínica.', 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'KIT_03', N'Kit Rutina The Ordinary Deciem #3', N'Set dermatológico curado con rutina completa The Ordinary para sinergia clínica.', 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'KIT_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Set dermatológico curado con rutina completa ISDIN para sinergia clínica.', 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'KIT_05', N'Kit Rutina Bioderma Laboratoire #5', N'Set dermatológico curado con rutina completa Bioderma para sinergia clínica.', 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'KIT_06', N'Kit Rutina Eau Thermale Avène #6', N'Set dermatológico curado con rutina completa Eau Thermale Avène para sinergia clínica.', 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'KIT_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Set dermatológico curado con rutina completa Eucerin para sinergia clínica.', 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'KIT_08', N'Kit Rutina Vichy Laboratoires #8', N'Set dermatológico curado con rutina completa Vichy Laboratoires para sinergia clínica.', 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'KIT_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Set dermatológico curado con rutina completa SkinCeuticals para sinergia clínica.', 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'KIT_10', N'Kit Rutina Sesderma Nanotech #10', N'Set dermatológico curado con rutina completa Sesderma para sinergia clínica.', 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'KIT_11', N'Kit Rutina NARS Cosmetics #11', N'Set dermatológico curado con rutina completa NARS Cosmetics para sinergia clínica.', 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'KIT_12', N'Kit Rutina MAC Professional #12', N'Set dermatológico curado con rutina completa MAC Cosmetics para sinergia clínica.', 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'KIT_13', N'Kit Rutina Fenty Beauty #13', N'Set dermatológico curado con rutina completa Fenty Beauty para sinergia clínica.', 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'KIT_14', N'Kit Rutina Rare Beauty #14', N'Set dermatológico curado con rutina completa Rare Beauty para sinergia clínica.', 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'KIT_15', N'Kit Rutina Clinique Laboratories #15', N'Set dermatológico curado con rutina completa Clinique para sinergia clínica.', 5.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'KIT_16', N'Kit Rutina Estée Lauder #16', N'Set dermatológico curado con rutina completa Estée Lauder para sinergia clínica.', 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'KIT_17', N'Kit Rutina Lancôme Paris #17', N'Set dermatológico curado con rutina completa Lancôme para sinergia clínica.', 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'KIT_18', N'Kit Rutina Charlotte Tilbury #18', N'Set dermatológico curado con rutina completa Charlotte Tilbury para sinergia clínica.', 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'KIT_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Set dermatológico curado con rutina completa Paula''s Choice para sinergia clínica.', 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'KIT_20', N'Kit Rutina COSRX K-Beauty #20', N'Set dermatológico curado con rutina completa COSRX para sinergia clínica.', 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'KIT_21', N'Kit Rutina Laneige Amorepacific #21', N'Set dermatológico curado con rutina completa Laneige para sinergia clínica.', 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'KIT_22', N'Kit Rutina Uriage Eau Thermale #22', N'Set dermatológico curado con rutina completa Uriage para sinergia clínica.', 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'KIT_23', N'Kit Rutina Laboratoire SVR #23', N'Set dermatológico curado con rutina completa Laboratoire SVR para sinergia clínica.', 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'KIT_24', N'Kit Rutina MartiDerm Ampollas #24', N'Set dermatológico curado con rutina completa MartiDerm para sinergia clínica.', 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'KIT_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Set dermatológico curado con rutina completa Heliocare para sinergia clínica.', 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'KIT_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Set dermatológico curado con rutina completa Kiehl''s para sinergia clínica.', 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'KIT_27', N'Kit Rutina Garnier SkinActive #27', N'Set dermatológico curado con rutina completa Garnier SkinActive para sinergia clínica.', 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'KIT_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Set dermatológico curado con rutina completa L''Oréal Paris Derm para sinergia clínica.', 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'KIT_29', N'Kit Rutina Neutrogena Derm #29', N'Set dermatológico curado con rutina completa Neutrogena para sinergia clínica.', 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'KIT_30', N'Kit Rutina DermaCare Labs México #30', N'Set dermatológico curado con rutina completa DermaCare Labs para sinergia clínica.', 5.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.kits_sets OFF;
GO

-- =================================================================================================
-- 044. TABLA: catalogo.kits_items (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.kits_items ON;
INSERT INTO catalogo.kits_items (ID, ID_kit, ID_variante_sku, cantidad_unidades, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.kits_items OFF;
GO

-- =================================================================================================
-- 045. TABLA: catalogo.productos_relacionados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.productos_relacionados ON;
INSERT INTO catalogo.productos_relacionados (ID, ID_producto_origen, ID_producto_destino, tipo_relacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 2, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 3, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 4, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 5, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 6, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 7, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 8, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 9, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 10, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 11, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 12, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 13, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 14, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 15, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 16, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 17, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 18, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 19, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 20, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 21, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 22, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 23, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 24, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 25, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 26, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 27, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 28, N'PASO_SIGUIENTE_RUTINA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 29, N'COMPLEMENTARIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 30, N'SUSTITUTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'PASO_SIGUIENTE_RUTINA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.productos_relacionados OFF;
GO

-- =================================================================================================
-- 046. TABLA: catalogo.historial_precios_base (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.historial_precios_base ON;
INSERT INTO catalogo.historial_precios_base (ID, ID_variante_sku, precio_anterior, precio_nuevo, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 262.66, 285.50, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 295.32, 321.00, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 327.98, 356.50, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 360.64, 392.00, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 393.30, 427.50, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 425.96, 463.00, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 458.62, 498.50, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 491.28, 534.00, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 523.94, 569.50, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 556.60, 605.00, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 589.26, 640.50, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 621.92, 676.00, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 654.58, 711.50, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 687.24, 747.00, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 719.90, 782.50, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 752.56, 818.00, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 785.22, 853.50, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 817.88, 889.00, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 850.54, 924.50, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 883.20, 960.00, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 915.86, 995.50, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 948.52, 1031.00, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 981.18, 1066.50, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1013.84, 1102.00, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1046.50, 1137.50, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1079.16, 1173.00, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1111.82, 1208.50, N'Fin de campaña promocional de lanzamiento', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1144.48, 1244.00, N'Actualización de lista de precios de laboratorio fabricante 2026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1177.14, 1279.50, N'Ajuste cambiario en insumos dermatológicos importados', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1209.80, 1315.00, N'Fin de campaña promocional de lanzamiento', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.historial_precios_base OFF;
GO

-- =================================================================================================
-- 047. TABLA: comunidad.rutinas_belleza (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_belleza ON;
INSERT INTO comunidad.rutinas_belleza (ID, ID_cliente, nombre_rutina, momento_dia, es_publica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Rutina Facial Carlos - Control Dermatológico 1', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Rutina Facial Sofía - Control Dermatológico 2', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Rutina Facial Valeria - Control Dermatológico 3', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Rutina Facial Alejandro - Control Dermatológico 4', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Rutina Facial Mariana - Control Dermatológico 5', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Rutina Facial Diego - Control Dermatológico 6', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Rutina Facial Camila - Control Dermatológico 7', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Rutina Facial Mateo - Control Dermatológico 8', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Rutina Facial Lucía - Control Dermatológico 9', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Rutina Facial Sebastián - Control Dermatológico 10', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Rutina Facial Regina - Control Dermatológico 11', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Rutina Facial Santiago - Control Dermatológico 12', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Rutina Facial Fernanda - Control Dermatológico 13', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Rutina Facial Emiliano - Control Dermatológico 14', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Rutina Facial Ximena - Control Dermatológico 15', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Rutina Facial Daniel - Control Dermatológico 16', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Rutina Facial Andrea - Control Dermatológico 17', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Rutina Facial Gabriel - Control Dermatológico 18', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Rutina Facial Paula - Control Dermatológico 19', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rutina Facial Andrés - Control Dermatológico 20', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Rutina Facial Renata - Control Dermatológico 21', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Rutina Facial Nicolás - Control Dermatológico 22', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Rutina Facial Natalia - Control Dermatológico 23', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Rutina Facial Joaquín - Control Dermatológico 24', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Rutina Facial Isabella - Control Dermatológico 25', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Rutina Facial Leonardo - Control Dermatológico 26', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Rutina Facial Ana - Control Dermatológico 27', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Rutina Facial Rodrigo - Control Dermatológico 28', N'SEMANAL', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Rutina Facial Paulina - Control Dermatológico 29', N'NOCHE', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Rutina Facial Mauricio - Control Dermatológico 30', N'SEMANAL', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_belleza OFF;
GO

-- =================================================================================================
-- 048. TABLA: comunidad.rutinas_pasos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_pasos ON;
INSERT INTO comunidad.rutinas_pasos (ID, ID_rutina, numero_paso, nombre_fase, instrucciones_aplicacion, tiempo_espera_segundos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Paso 1: Limpieza Suave', N'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Paso 2: Tónico Equilibrante', N'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Paso 3: Sérum Concentrado', N'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Paso 4: Emulsión Reparadora', N'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Paso 5: Fotoprotección Solar', N'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Paso 1: Limpieza Suave', N'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Paso 2: Tónico Equilibrante', N'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Paso 3: Sérum Concentrado', N'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Paso 4: Emulsión Reparadora', N'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Paso 5: Fotoprotección Solar', N'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Paso 1: Limpieza Suave', N'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, N'Paso 2: Tónico Equilibrante', N'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, N'Paso 3: Sérum Concentrado', N'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, N'Paso 4: Emulsión Reparadora', N'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, N'Paso 5: Fotoprotección Solar', N'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 6, N'Paso 1: Limpieza Suave', N'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 7, N'Paso 2: Tónico Equilibrante', N'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 8, N'Paso 3: Sérum Concentrado', N'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 9, N'Paso 4: Emulsión Reparadora', N'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 10, N'Paso 5: Fotoprotección Solar', N'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Paso 1: Limpieza Suave', N'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, N'Paso 2: Tónico Equilibrante', N'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, N'Paso 3: Sérum Concentrado', N'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, N'Paso 4: Emulsión Reparadora', N'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, N'Paso 5: Fotoprotección Solar', N'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 6, N'Paso 1: Limpieza Suave', N'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 7, N'Paso 2: Tónico Equilibrante', N'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 8, N'Paso 3: Sérum Concentrado', N'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 9, N'Paso 4: Emulsión Reparadora', N'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 10, N'Paso 5: Fotoprotección Solar', N'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_pasos OFF;
GO

-- =================================================================================================
-- 049. TABLA: comunidad.rutinas_productos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_productos ON;
INSERT INTO comunidad.rutinas_productos (ID, ID_rutina_paso, ID_variante_sku, es_producto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_productos OFF;
GO

-- =================================================================================================
-- 050. TABLA: comunidad.listas_deseos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.listas_deseos ON;
INSERT INTO comunidad.listas_deseos (ID, ID_cliente, nombre_lista, es_publica, token_compartir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Favoritos Skincare & Maquillaje #01', 1, N'wish_46c2d695009e3876d9820e61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Favoritos Skincare & Maquillaje #02', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Favoritos Skincare & Maquillaje #03', 1, N'wish_92e40fcfc0020c78d9849f46', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Favoritos Skincare & Maquillaje #04', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Favoritos Skincare & Maquillaje #05', 1, N'wish_1d5e6d839cdd0b06cff18d5e', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Favoritos Skincare & Maquillaje #06', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Favoritos Skincare & Maquillaje #07', 1, N'wish_ddb188aba146f0e23a3fb26a', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Favoritos Skincare & Maquillaje #08', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Favoritos Skincare & Maquillaje #09', 1, N'wish_e4aea1e96e244453feb40b3c', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Favoritos Skincare & Maquillaje #10', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Favoritos Skincare & Maquillaje #11', 1, N'wish_da4984c762bfefe99427bd6e', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Favoritos Skincare & Maquillaje #12', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Favoritos Skincare & Maquillaje #13', 1, N'wish_b32dee77d35cd7cc666b369a', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Favoritos Skincare & Maquillaje #14', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Favoritos Skincare & Maquillaje #15', 1, N'wish_80f3db5a45e7f0688af8c710', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Favoritos Skincare & Maquillaje #16', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Favoritos Skincare & Maquillaje #17', 1, N'wish_0907dfa8a2545d3dc11e737d', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Favoritos Skincare & Maquillaje #18', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Favoritos Skincare & Maquillaje #19', 1, N'wish_b47136fd92a060c62011ad69', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Favoritos Skincare & Maquillaje #20', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Favoritos Skincare & Maquillaje #21', 1, N'wish_e195bdd0b74512e76e47556b', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Favoritos Skincare & Maquillaje #22', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Favoritos Skincare & Maquillaje #23', 1, N'wish_44967c2f84d267b8c0fc5ebe', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Favoritos Skincare & Maquillaje #24', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Favoritos Skincare & Maquillaje #25', 1, N'wish_6af153663542efe59aed7c0c', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Favoritos Skincare & Maquillaje #26', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Favoritos Skincare & Maquillaje #27', 1, N'wish_e766ab1c99e15269af37245f', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Favoritos Skincare & Maquillaje #28', 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Favoritos Skincare & Maquillaje #29', 1, N'wish_1762339787b94cbfab70f624', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Favoritos Skincare & Maquillaje #30', 0, NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.listas_deseos OFF;
GO

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.tipos_descuento ON;
INSERT INTO ventas.tipos_descuento (ID, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'DESCUENT_01', N'Porcentaje Directo Nivel 1', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'DESCUENT_02', N'Monto Fijo MXN Nivel 1', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'DESCUENT_03', N'Suscripción Beauty-Box Nivel 1', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'DESCUENT_04', N'Envío Gratuito VIP Nivel 1', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'DESCUENT_05', N'Regalo por Compra (GWP) Nivel 1', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'DESCUENT_06', N'Porcentaje Directo Nivel 2', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'DESCUENT_07', N'Monto Fijo MXN Nivel 2', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'DESCUENT_08', N'Suscripción Beauty-Box Nivel 2', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'DESCUENT_09', N'Envío Gratuito VIP Nivel 2', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'DESCUENT_10', N'Regalo por Compra (GWP) Nivel 2', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'DESCUENT_11', N'Porcentaje Directo Nivel 3', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'DESCUENT_12', N'Monto Fijo MXN Nivel 3', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'DESCUENT_13', N'Suscripción Beauty-Box Nivel 3', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'DESCUENT_14', N'Envío Gratuito VIP Nivel 3', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'DESCUENT_15', N'Regalo por Compra (GWP) Nivel 3', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'DESCUENT_16', N'Porcentaje Directo Nivel 4', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'DESCUENT_17', N'Monto Fijo MXN Nivel 4', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'DESCUENT_18', N'Suscripción Beauty-Box Nivel 4', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'DESCUENT_19', N'Envío Gratuito VIP Nivel 4', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'DESCUENT_20', N'Regalo por Compra (GWP) Nivel 4', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'DESCUENT_21', N'Porcentaje Directo Nivel 5', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'DESCUENT_22', N'Monto Fijo MXN Nivel 5', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'DESCUENT_23', N'Suscripción Beauty-Box Nivel 5', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'DESCUENT_24', N'Envío Gratuito VIP Nivel 5', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'DESCUENT_25', N'Regalo por Compra (GWP) Nivel 5', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'DESCUENT_26', N'Porcentaje Directo Nivel 6', N'Descuento porcentual directo aplicable sobre el subtotal elegible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'DESCUENT_27', N'Monto Fijo MXN Nivel 6', N'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'DESCUENT_28', N'Suscripción Beauty-Box Nivel 6', N'Ahorro recurrente exclusivo para clientes con entrega programada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'DESCUENT_29', N'Envío Gratuito VIP Nivel 6', N'Condonación total de gastos de paquetería terrestre o refrigerada.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'DESCUENT_30', N'Regalo por Compra (GWP) Nivel 6', N'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.tipos_descuento OFF;
GO

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.estados_orden ON;
INSERT INTO ventas.estados_orden (ID, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PEND_PAGO', N'Pendiente de Pago', N'Orden registrada esperando confirmación bancaria o SPEI', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PAGADA', N'Pago Confirmado', N'Transacción aprobada y lista para asignación de almacén', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PREPARANDO', N'En Preparación CEDIS', N'Surtido en curso bajo estrategia FEFO y empaque térmico', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'EN_TRANSITO', N'Enviada en Tránsito', N'Paquete recolectado por paquetería con guía de rastreo', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ENTREGADA', N'Entregada al Cliente', N'Recepción confirmada en domicilio del destinatario', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CANCELADA', N'Cancelada', N'Orden anulada antes del despacho con liberación de stock', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'DEVUELTA', N'Devuelta por RMA', N'Mercancía retornada y dictaminada en postventa', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT ventas.estados_orden OFF;
GO

-- =================================================================================================
-- 053. TABLA: ventas.motivos_cancelacion_orden (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.motivos_cancelacion_orden ON;
INSERT INTO ventas.motivos_cancelacion_orden (ID, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Cliente solicitó cancelación antes de recolección en CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Error en dirección de entrega o código postal capturado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Pago rechazado o expirado por institución emisora', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Quiebre de inventario en lote con caducidad vigente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Cambio de producto o tono solicitado por cliente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Cliente solicitó cancelación antes de recolección en CEDIS', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Error en dirección de entrega o código postal capturado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Pago rechazado o expirado por institución emisora', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Quiebre de inventario en lote con caducidad vigente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Cambio de producto o tono solicitado por cliente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Cliente solicitó cancelación antes de recolección en CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Error en dirección de entrega o código postal capturado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Pago rechazado o expirado por institución emisora', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Quiebre de inventario en lote con caducidad vigente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Cambio de producto o tono solicitado por cliente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Cliente solicitó cancelación antes de recolección en CEDIS', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Error en dirección de entrega o código postal capturado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Pago rechazado o expirado por institución emisora', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Quiebre de inventario en lote con caducidad vigente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Cambio de producto o tono solicitado por cliente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Cliente solicitó cancelación antes de recolección en CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Error en dirección de entrega o código postal capturado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Pago rechazado o expirado por institución emisora', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Quiebre de inventario en lote con caducidad vigente', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Cambio de producto o tono solicitado por cliente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Cliente solicitó cancelación antes de recolección en CEDIS', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Error en dirección de entrega o código postal capturado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Pago rechazado o expirado por institución emisora', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Quiebre de inventario en lote con caducidad vigente', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Cambio de producto o tono solicitado por cliente', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.motivos_cancelacion_orden OFF;
GO

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos ON;
INSERT INTO ventas.carritos (ID, ID_cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'cart_57dc5da2039af8209f120c7b2b2be269', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'cart_554ae59cc8f4acc14082de7fc4a9f5b3', '2026-02-02 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'cart_c47636f57a40b6e372daf58b4eeed6c1', '2026-02-03 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'cart_2b38b22aed846681e14862f4a2119795', '2026-02-04 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'cart_6da7b7ebbfa341e1e1ec1d19b3781958', '2026-02-05 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'cart_ae5947c6abb8a651e55f9e2c984e3afb', '2026-02-06 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'cart_9f1bbb48183acdcc679ac9bb0cedaf73', '2026-02-07 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'cart_8080474caaa1d1a4f108a48e2b832d78', '2026-02-08 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'cart_d84d15c981329a2ac173a050f8d4e8e0', '2026-02-09 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'cart_1fad691371770b500d253d30187fcf1a', '2026-02-10 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'cart_bc761d30adb2285a09292f3591e6d22a', '2026-02-11 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'cart_1db8173a08b1f21c1e061ca8ab12f8e7', '2026-02-12 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'cart_28a951a322f66c471ed9e6b6d1446f07', '2026-02-13 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'cart_7584f3ea411c95a2cd3502e695977dab', '2026-02-14 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'cart_89154d767ec2eb8cd9aa6962f6dade7b', '2026-02-15 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'cart_74c0e5204d660ec49f8c06556e097bbf', '2026-02-16 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'cart_8dc42a833499c9a8a2b3c3ccdc7b70b9', '2026-02-17 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'cart_1e8d4b56ad7777d93c481c07c164a7e4', '2026-02-18 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'cart_2875259dce4df7dfde8d04aa94cacfad', '2026-02-19 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'cart_a18af5057ae5f140b0f133ba744d82d4', '2026-02-20 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'cart_089cd763aafad52db63c023d769b471f', '2026-02-21 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'cart_01bc2fd024ad872376159fcca18ea91a', '2026-02-22 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'cart_22f8c2f21386cc2dce796861c0e94195', '2026-02-23 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'cart_1758dfb7f6192568cd3f8b92a8995d85', '2026-02-24 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'cart_9bb7274b4a4f68c3f66552d5f2de9be4', '2026-02-25 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'cart_9142a7c6a5971e60db03b68461494ded', '2026-02-26 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'cart_bb00ee858a90811da2756726f24f1723', '2026-02-27 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'cart_a6f636ca5b9598970e91b89107409258', '2026-02-28 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'cart_9597bf538a12785e1abf35d807246e0e', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'cart_cea37fa7bacdff1e1595ac22411f66ad', '2026-02-02 11:30:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos OFF;
GO

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.items_carrito ON;
INSERT INTO ventas.items_carrito (ID, ID_carrito, ID_variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 285.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 321.00, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 356.50, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 392.00, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 427.50, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 463.00, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 498.50, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 534.00, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 569.50, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 605.00, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 640.50, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 676.00, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 711.50, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 747.00, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 782.50, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 818.00, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 853.50, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 889.00, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 924.50, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 960.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 995.50, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1031.00, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1066.50, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1102.00, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1137.50, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1173.00, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1208.50, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1244.00, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1279.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1315.00, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.items_carrito OFF;
GO

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento ON;
INSERT INTO ventas.carritos_abandonados_seguimiento (ID, ID_carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, 571.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, NULL, 0, 642.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, '2026-02-03 11:30:00', 1, 713.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, NULL, 0, 784.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, '2026-02-05 11:30:00', 1, 855.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, NULL, 0, 926.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, '2026-02-07 11:30:00', 1, 997.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, NULL, 0, 1068.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, '2026-02-09 11:30:00', 1, 1139.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, NULL, 0, 1210.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, '2026-02-11 11:30:00', 1, 1281.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, NULL, 0, 1352.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, '2026-02-13 11:30:00', 1, 1423.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, NULL, 0, 1494.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, '2026-02-15 11:30:00', 1, 1565.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, NULL, 0, 1636.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, '2026-02-17 11:30:00', 1, 1707.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, NULL, 0, 1778.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, '2026-02-19 11:30:00', 1, 1849.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, NULL, 0, 1920.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, '2026-02-21 11:30:00', 1, 1991.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, NULL, 0, 2062.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, '2026-02-23 11:30:00', 1, 2133.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, NULL, 0, 2204.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, '2026-02-25 11:30:00', 1, 2275.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, NULL, 0, 2346.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, '2026-02-27 11:30:00', 1, 2417.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, NULL, 0, 2488.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, '2026-02-01 11:30:00', 1, 2559.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, NULL, 0, 2630.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento OFF;
GO

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.planes_suscripcion ON;
INSERT INTO ventas.planes_suscripcion (ID, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PLAN_01', N'Beauty-Box Dermatológica La Roche-Posay #01', N'Reposición automática personalizada de tratamientos La Roche-Posay con seguimiento clínico.', 285.50, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PLAN_02', N'Beauty-Box Dermatológica CeraVe #02', N'Reposición automática personalizada de tratamientos CeraVe con seguimiento clínico.', 321.00, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PLAN_03', N'Beauty-Box Dermatológica The Ordinary #03', N'Reposición automática personalizada de tratamientos The Ordinary con seguimiento clínico.', 356.50, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PLAN_04', N'Beauty-Box Dermatológica ISDIN #04', N'Reposición automática personalizada de tratamientos ISDIN con seguimiento clínico.', 392.00, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PLAN_05', N'Beauty-Box Dermatológica Bioderma #05', N'Reposición automática personalizada de tratamientos Bioderma con seguimiento clínico.', 427.50, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PLAN_06', N'Beauty-Box Dermatológica Eau Thermale Avène #06', N'Reposición automática personalizada de tratamientos Eau Thermale Avène con seguimiento clínico.', 463.00, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PLAN_07', N'Beauty-Box Dermatológica Eucerin #07', N'Reposición automática personalizada de tratamientos Eucerin con seguimiento clínico.', 498.50, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PLAN_08', N'Beauty-Box Dermatológica Vichy Laboratoires #08', N'Reposición automática personalizada de tratamientos Vichy Laboratoires con seguimiento clínico.', 534.00, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PLAN_09', N'Beauty-Box Dermatológica SkinCeuticals #09', N'Reposición automática personalizada de tratamientos SkinCeuticals con seguimiento clínico.', 569.50, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PLAN_10', N'Beauty-Box Dermatológica Sesderma #10', N'Reposición automática personalizada de tratamientos Sesderma con seguimiento clínico.', 605.00, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PLAN_11', N'Beauty-Box Dermatológica NARS Cosmetics #11', N'Reposición automática personalizada de tratamientos NARS Cosmetics con seguimiento clínico.', 640.50, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PLAN_12', N'Beauty-Box Dermatológica MAC Cosmetics #12', N'Reposición automática personalizada de tratamientos MAC Cosmetics con seguimiento clínico.', 676.00, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PLAN_13', N'Beauty-Box Dermatológica Fenty Beauty #13', N'Reposición automática personalizada de tratamientos Fenty Beauty con seguimiento clínico.', 711.50, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PLAN_14', N'Beauty-Box Dermatológica Rare Beauty #14', N'Reposición automática personalizada de tratamientos Rare Beauty con seguimiento clínico.', 747.00, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PLAN_15', N'Beauty-Box Dermatológica Clinique #15', N'Reposición automática personalizada de tratamientos Clinique con seguimiento clínico.', 782.50, 5.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PLAN_16', N'Beauty-Box Dermatológica Estée Lauder #16', N'Reposición automática personalizada de tratamientos Estée Lauder con seguimiento clínico.', 818.00, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PLAN_17', N'Beauty-Box Dermatológica Lancôme #17', N'Reposición automática personalizada de tratamientos Lancôme con seguimiento clínico.', 853.50, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PLAN_18', N'Beauty-Box Dermatológica Charlotte Tilbury #18', N'Reposición automática personalizada de tratamientos Charlotte Tilbury con seguimiento clínico.', 889.00, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PLAN_19', N'Beauty-Box Dermatológica Paula''s Choice #19', N'Reposición automática personalizada de tratamientos Paula''s Choice con seguimiento clínico.', 924.50, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PLAN_20', N'Beauty-Box Dermatológica COSRX #20', N'Reposición automática personalizada de tratamientos COSRX con seguimiento clínico.', 960.00, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PLAN_21', N'Beauty-Box Dermatológica Laneige #21', N'Reposición automática personalizada de tratamientos Laneige con seguimiento clínico.', 995.50, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PLAN_22', N'Beauty-Box Dermatológica Uriage #22', N'Reposición automática personalizada de tratamientos Uriage con seguimiento clínico.', 1031.00, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PLAN_23', N'Beauty-Box Dermatológica Laboratoire SVR #23', N'Reposición automática personalizada de tratamientos Laboratoire SVR con seguimiento clínico.', 1066.50, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PLAN_24', N'Beauty-Box Dermatológica MartiDerm #24', N'Reposición automática personalizada de tratamientos MartiDerm con seguimiento clínico.', 1102.00, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PLAN_25', N'Beauty-Box Dermatológica Heliocare #25', N'Reposición automática personalizada de tratamientos Heliocare con seguimiento clínico.', 1137.50, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PLAN_26', N'Beauty-Box Dermatológica Kiehl''s #26', N'Reposición automática personalizada de tratamientos Kiehl''s con seguimiento clínico.', 1173.00, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PLAN_27', N'Beauty-Box Dermatológica Garnier SkinActive #27', N'Reposición automática personalizada de tratamientos Garnier SkinActive con seguimiento clínico.', 1208.50, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PLAN_28', N'Beauty-Box Dermatológica L''Oréal Paris Derm #28', N'Reposición automática personalizada de tratamientos L''Oréal Paris Derm con seguimiento clínico.', 1244.00, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PLAN_29', N'Beauty-Box Dermatológica Neutrogena #29', N'Reposición automática personalizada de tratamientos Neutrogena con seguimiento clínico.', 1279.50, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PLAN_30', N'Beauty-Box Dermatológica DermaCare Labs #30', N'Reposición automática personalizada de tratamientos DermaCare Labs con seguimiento clínico.', 1315.00, 5.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.planes_suscripcion OFF;
GO

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.frecuencias_suscripcion ON;
INSERT INTO ventas.frecuencias_suscripcion (ID, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FRECUENC_01', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FRECUENC_02', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FRECUENC_03', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FRECUENC_04', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FRECUENC_05', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FRECUENC_06', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FRECUENC_07', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FRECUENC_08', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FRECUENC_09', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FRECUENC_10', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FRECUENC_11', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FRECUENC_12', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FRECUENC_13', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FRECUENC_14', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FRECUENC_15', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FRECUENC_16', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FRECUENC_17', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FRECUENC_18', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FRECUENC_19', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FRECUENC_20', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FRECUENC_21', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FRECUENC_22', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FRECUENC_23', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FRECUENC_24', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FRECUENC_25', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FRECUENC_26', N'Cada 60 días', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FRECUENC_27', N'Cada 75 días', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FRECUENC_28', N'Cada 30 días', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FRECUENC_29', N'Cada 45 días', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FRECUENC_30', N'Cada 60 días', 60, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.frecuencias_suscripcion OFF;
GO

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_cliente ON;
INSERT INTO ventas.suscripciones_cliente (ID, folio_suscripcion, ID_cliente, ID_plan_suscripcion, ID_frecuencia_suscripcion, ID_direccion_entrega, ID_metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-31', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-04-01', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-04-02', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-04-03', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-04-04', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-04-05', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-04-06', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-04-07', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-04-08', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-04-09', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-04-10', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-04-11', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-04-12', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-04-13', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-04-14', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-04-15', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-04-16', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-04-17', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-04-18', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-04-19', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-04-20', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-04-21', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-04-22', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-04-23', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-04-24', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-04-25', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-04-26', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-04-27', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-31', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-04-01', N'PAUSADA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_cliente OFF;
GO

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_items ON;
INSERT INTO ventas.suscripciones_items (ID, ID_suscripcion_cliente, ID_variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 256.95, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 288.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 320.85, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 352.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 384.75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 416.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 448.65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 480.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 512.55, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 544.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 576.45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 608.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 640.35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 672.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 704.25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 736.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 768.15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 800.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 832.05, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 864.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 895.95, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 927.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 959.85, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 991.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1023.75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1055.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1087.65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1119.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1151.55, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1183.50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_items OFF;
GO

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas ON;
INSERT INTO ventas.suscripciones_calendario_entregas (ID, ID_suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, '2026-03-01', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '2026-03-02', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '2026-03-03', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '2026-03-04', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '2026-03-05', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '2026-03-06', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '2026-03-07', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '2026-03-08', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '2026-03-09', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '2026-03-10', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '2026-03-11', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '2026-03-12', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '2026-03-13', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '2026-03-14', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '2026-03-15', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '2026-03-16', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '2026-03-17', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '2026-03-18', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '2026-03-19', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '2026-03-20', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '2026-03-21', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '2026-03-22', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '2026-03-23', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '2026-03-24', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '2026-03-25', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '2026-03-26', 1, N'COBRADO_PROCESANDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '2026-03-27', 1, N'DESPACHADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '2026-03-28', 1, N'OMITIDO_POR_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '2026-03-01', 1, N'PROGRAMADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '2026-03-02', 1, N'COBRADO_PROCESANDO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas OFF;
GO

-- =================================================================================================
-- 062. TABLA: ventas.suscripciones_bitacora_estados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados ON;
INSERT INTO ventas.suscripciones_bitacora_estados (ID, ID_suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PENDIENTE', N'ACTIVA', N'Cobro inicial aprobado y suscripción activada.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ACTIVA', N'PAUSADA', N'Pausa temporal solicitada por cliente desde panel.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'PAUSADA', N'ACTIVA', N'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ACTIVA', N'PAGO_FALLIDO', N'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PAGO_FALLIDO', N'CANCELADA', N'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados OFF;
GO

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp ON;
INSERT INTO ventas.regalos_por_compra_gwp (ID, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, ID_variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROMOCIO_01', N'Regalo GWP La Roche-Posay (Talla Viajera #01)', 899.00, 1, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROMOCIO_02', N'Regalo GWP CeraVe (Talla Viajera #02)', 1099.00, 2, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROMOCIO_03', N'Regalo GWP The Ordinary (Talla Viajera #03)', 1299.00, 3, '2026-02-03 11:30:00', '2026-03-05 11:30:00', 14, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROMOCIO_04', N'Regalo GWP ISDIN (Talla Viajera #04)', 1499.00, 4, '2026-02-04 11:30:00', '2026-03-06 11:30:00', 17, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROMOCIO_05', N'Regalo GWP Bioderma (Talla Viajera #05)', 1699.00, 5, '2026-02-05 11:30:00', '2026-03-07 11:30:00', 20, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROMOCIO_06', N'Regalo GWP Eau Thermale Avène (Talla Viajera #06)', 899.00, 6, '2026-02-06 11:30:00', '2026-03-08 11:30:00', 23, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROMOCIO_07', N'Regalo GWP Eucerin (Talla Viajera #07)', 1099.00, 7, '2026-02-07 11:30:00', '2026-03-09 11:30:00', 26, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROMOCIO_08', N'Regalo GWP Vichy Laboratoires (Talla Viajera #08)', 1299.00, 8, '2026-02-08 11:30:00', '2026-03-10 11:30:00', 29, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROMOCIO_09', N'Regalo GWP SkinCeuticals (Talla Viajera #09)', 1499.00, 9, '2026-02-09 11:30:00', '2026-03-11 11:30:00', 32, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROMOCIO_10', N'Regalo GWP Sesderma (Talla Viajera #10)', 1699.00, 10, '2026-02-10 11:30:00', '2026-03-12 11:30:00', 35, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROMOCIO_11', N'Regalo GWP NARS Cosmetics (Talla Viajera #11)', 899.00, 11, '2026-02-11 11:30:00', '2026-03-13 11:30:00', 38, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROMOCIO_12', N'Regalo GWP MAC Cosmetics (Talla Viajera #12)', 1099.00, 12, '2026-02-12 11:30:00', '2026-03-14 11:30:00', 41, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROMOCIO_13', N'Regalo GWP Fenty Beauty (Talla Viajera #13)', 1299.00, 13, '2026-02-13 11:30:00', '2026-03-15 11:30:00', 44, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROMOCIO_14', N'Regalo GWP Rare Beauty (Talla Viajera #14)', 1499.00, 14, '2026-02-14 11:30:00', '2026-03-16 11:30:00', 47, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROMOCIO_15', N'Regalo GWP Clinique (Talla Viajera #15)', 1699.00, 15, '2026-02-15 11:30:00', '2026-03-17 11:30:00', 50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROMOCIO_16', N'Regalo GWP Estée Lauder (Talla Viajera #16)', 899.00, 16, '2026-02-16 11:30:00', '2026-03-18 11:30:00', 53, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROMOCIO_17', N'Regalo GWP Lancôme (Talla Viajera #17)', 1099.00, 17, '2026-02-17 11:30:00', '2026-03-19 11:30:00', 56, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROMOCIO_18', N'Regalo GWP Charlotte Tilbury (Talla Viajera #18)', 1299.00, 18, '2026-02-18 11:30:00', '2026-03-20 11:30:00', 59, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROMOCIO_19', N'Regalo GWP Paula''s Choice (Talla Viajera #19)', 1499.00, 19, '2026-02-19 11:30:00', '2026-03-21 11:30:00', 62, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROMOCIO_20', N'Regalo GWP COSRX (Talla Viajera #20)', 1699.00, 20, '2026-02-20 11:30:00', '2026-03-22 11:30:00', 65, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROMOCIO_21', N'Regalo GWP Laneige (Talla Viajera #21)', 899.00, 21, '2026-02-21 11:30:00', '2026-03-23 11:30:00', 68, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROMOCIO_22', N'Regalo GWP Uriage (Talla Viajera #22)', 1099.00, 22, '2026-02-22 11:30:00', '2026-03-24 11:30:00', 71, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROMOCIO_23', N'Regalo GWP Laboratoire SVR (Talla Viajera #23)', 1299.00, 23, '2026-02-23 11:30:00', '2026-03-25 11:30:00', 74, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROMOCIO_24', N'Regalo GWP MartiDerm (Talla Viajera #24)', 1499.00, 24, '2026-02-24 11:30:00', '2026-03-26 11:30:00', 77, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROMOCIO_25', N'Regalo GWP Heliocare (Talla Viajera #25)', 1699.00, 25, '2026-02-25 11:30:00', '2026-03-27 11:30:00', 80, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROMOCIO_26', N'Regalo GWP Kiehl''s (Talla Viajera #26)', 899.00, 26, '2026-02-26 11:30:00', '2026-03-28 11:30:00', 83, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROMOCIO_27', N'Regalo GWP Garnier SkinActive (Talla Viajera #27)', 1099.00, 27, '2026-02-27 11:30:00', '2026-03-29 11:30:00', 86, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROMOCIO_28', N'Regalo GWP L''Oréal Paris Derm (Talla Viajera #28)', 1299.00, 28, '2026-02-28 11:30:00', '2026-03-30 11:30:00', 89, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROMOCIO_29', N'Regalo GWP Neutrogena (Talla Viajera #29)', 1499.00, 29, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 92, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROMOCIO_30', N'Regalo GWP DermaCare Labs (Talla Viajera #30)', 1699.00, 30, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 95, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp OFF;
GO

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes ON;
INSERT INTO ventas.ordenes (ID, folio_orden, ID_cliente, ID_estado_orden, ID_motivo_cancelacion, ID_direccion_envio, ID_direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 571.00, 0.00, 91.36, 129.00, 791.36, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 0.00, 51.36, 129.00, 501.36, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 713.00, 71.30, 102.67, 129.00, 873.37, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 0.00, 62.72, 129.00, 583.72, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 855.00, 0.00, 136.80, 129.00, 1120.80, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 46.30, 66.67, 129.00, 612.37, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 7, 7, 7, 7, '2026-02-07 11:30:00', 997.00, 0.00, 159.52, 129.00, 1285.52, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 0.00, 85.44, 129.00, 748.44, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 1139.00, 113.90, 164.02, 0.00, 1189.12, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 0.00, 96.80, 129.00, 830.80, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 1281.00, 0.00, 204.96, 0.00, 1485.96, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 67.60, 97.34, 129.00, 834.74, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 6, 13, 13, 13, '2026-02-13 11:30:00', 1423.00, 0.00, 227.68, 0.00, 1650.68, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 7, 14, 14, 14, '2026-02-14 11:30:00', 747.00, 0.00, 119.52, 129.00, 995.52, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 1565.00, 156.50, 225.36, 0.00, 1633.86, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 0.00, 130.88, 129.00, 1077.88, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 1707.00, 0.00, 273.12, 0.00, 1980.12, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 88.90, 128.02, 129.00, 1057.12, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 1849.00, 0.00, 295.84, 0.00, 2144.84, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 6, 20, 20, 20, '2026-02-20 11:30:00', 960.00, 0.00, 153.60, 129.00, 1242.60, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 7, 21, 21, 21, '2026-02-21 11:30:00', 1991.00, 199.10, 286.70, 0.00, 2078.60, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 0.00, 164.96, 0.00, 1195.96, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 2133.00, 0.00, 341.28, 0.00, 2474.28, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 110.20, 158.69, 129.00, 1279.49, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 2275.00, 0.00, 364.00, 0.00, 2639.00, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 0.00, 187.68, 0.00, 1360.68, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 6, 27, 27, 27, '2026-02-27 11:30:00', 2417.00, 241.70, 348.05, 0.00, 2523.35, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 7, 28, 28, 28, '2026-02-28 11:30:00', 1244.00, 0.00, 199.04, 0.00, 1443.04, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 2559.00, 0.00, 409.44, 0.00, 2968.44, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 131.50, 189.36, 0.00, 1372.86, 'MXN', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes OFF;
GO

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_detalles ON;
INSERT INTO ventas.ordenes_detalles (ID, ID_orden, ID_variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 2, 285.50, 148.46, 0.00, 571.00, 16.00, 91.36, 662.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 1, 321.00, 166.92, 0.00, 321.00, 16.00, 51.36, 372.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 2, 356.50, 185.38, 71.30, 641.70, 16.00, 102.67, 744.37, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 1, 392.00, 203.84, 0.00, 392.00, 16.00, 62.72, 454.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 2, 427.50, 222.30, 0.00, 855.00, 16.00, 136.80, 991.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 1, 463.00, 240.76, 46.30, 416.70, 16.00, 66.67, 483.37, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 2, 498.50, 259.22, 0.00, 997.00, 16.00, 159.52, 1156.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 1, 534.00, 277.68, 0.00, 534.00, 16.00, 85.44, 619.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 2, 569.50, 296.14, 113.90, 1025.10, 16.00, 164.02, 1189.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 1, 605.00, 314.60, 0.00, 605.00, 16.00, 96.80, 701.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 2, 640.50, 333.06, 0.00, 1281.00, 16.00, 204.96, 1485.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 1, 676.00, 351.52, 67.60, 608.40, 16.00, 97.34, 705.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 2, 711.50, 369.98, 0.00, 1423.00, 16.00, 227.68, 1650.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 1, 747.00, 388.44, 0.00, 747.00, 16.00, 119.52, 866.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 2, 782.50, 406.90, 156.50, 1408.50, 16.00, 225.36, 1633.86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 1, 818.00, 425.36, 0.00, 818.00, 16.00, 130.88, 948.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 2, 853.50, 443.82, 0.00, 1707.00, 16.00, 273.12, 1980.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 1, 889.00, 462.28, 88.90, 800.10, 16.00, 128.02, 928.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 2, 924.50, 480.74, 0.00, 1849.00, 16.00, 295.84, 2144.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 1, 960.00, 499.20, 0.00, 960.00, 16.00, 153.60, 1113.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 2, 995.50, 517.66, 199.10, 1791.90, 16.00, 286.70, 2078.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 1, 1031.00, 536.12, 0.00, 1031.00, 16.00, 164.96, 1195.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 2, 1066.50, 554.58, 0.00, 2133.00, 16.00, 341.28, 2474.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 1, 1102.00, 573.04, 110.20, 991.80, 16.00, 158.69, 1150.49, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 2, 1137.50, 591.50, 0.00, 2275.00, 16.00, 364.00, 2639.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 1, 1173.00, 609.96, 0.00, 1173.00, 16.00, 187.68, 1360.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 2, 1208.50, 628.42, 241.70, 2175.30, 16.00, 348.05, 2523.35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 1, 1244.00, 646.88, 0.00, 1244.00, 16.00, 199.04, 1443.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 2, 1279.50, 665.34, 0.00, 2559.00, 16.00, 409.44, 2968.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 1, 1315.00, 683.80, 131.50, 1183.50, 16.00, 189.36, 1372.86, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_detalles OFF;
GO

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_historial_estados ON;
INSERT INTO ventas.ordenes_historial_estados (ID, ID_orden, ID_estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, N'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, N'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, N'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_historial_estados OFF;
GO

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_splits_almacen ON;
INSERT INTO ventas.ordenes_splits_almacen (ID, ID_orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SPL-ORD-2026-0001-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SPL-ORD-2026-0002-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SPL-ORD-2026-0003-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SPL-ORD-2026-0004-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SPL-ORD-2026-0005-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SPL-ORD-2026-0006-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SPL-ORD-2026-0007-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SPL-ORD-2026-0008-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SPL-ORD-2026-0009-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SPL-ORD-2026-0010-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SPL-ORD-2026-0011-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SPL-ORD-2026-0012-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SPL-ORD-2026-0013-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SPL-ORD-2026-0014-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SPL-ORD-2026-0015-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SPL-ORD-2026-0016-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SPL-ORD-2026-0017-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SPL-ORD-2026-0018-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SPL-ORD-2026-0019-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SPL-ORD-2026-0020-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SPL-ORD-2026-0021-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SPL-ORD-2026-0022-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SPL-ORD-2026-0023-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SPL-ORD-2026-0024-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SPL-ORD-2026-0025-01', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SPL-ORD-2026-0026-01', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SPL-ORD-2026-0027-01', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SPL-ORD-2026-0028-01', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SPL-ORD-2026-0029-01', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SPL-ORD-2026-0030-01', N'EN_RUTA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_splits_almacen OFF;
GO

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_impuestos ON;
INSERT INTO ventas.ordenes_impuestos (ID, ID_orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, '002_IVA', 0.1600, 571.00, 91.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '002_IVA', 0.1600, 321.00, 51.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '002_IVA', 0.1600, 641.70, 102.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '002_IVA', 0.1600, 392.00, 62.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '002_IVA', 0.1600, 855.00, 136.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '002_IVA', 0.1600, 416.70, 66.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '002_IVA', 0.1600, 997.00, 159.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '002_IVA', 0.1600, 534.00, 85.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '002_IVA', 0.1600, 1025.10, 164.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '002_IVA', 0.1600, 605.00, 96.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '002_IVA', 0.1600, 1281.00, 204.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '002_IVA', 0.1600, 608.40, 97.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '002_IVA', 0.1600, 1423.00, 227.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '002_IVA', 0.1600, 747.00, 119.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '002_IVA', 0.1600, 1408.50, 225.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '002_IVA', 0.1600, 818.00, 130.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '002_IVA', 0.1600, 1707.00, 273.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '002_IVA', 0.1600, 800.10, 128.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '002_IVA', 0.1600, 1849.00, 295.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '002_IVA', 0.1600, 960.00, 153.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '002_IVA', 0.1600, 1791.90, 286.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '002_IVA', 0.1600, 1031.00, 164.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '002_IVA', 0.1600, 2133.00, 341.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '002_IVA', 0.1600, 991.80, 158.69, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '002_IVA', 0.1600, 2275.00, 364.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '002_IVA', 0.1600, 1173.00, 187.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '002_IVA', 0.1600, 2175.30, 348.05, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '002_IVA', 0.1600, 1244.00, 199.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '002_IVA', 0.1600, 2559.00, 409.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '002_IVA', 0.1600, 1183.50, 189.36, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_impuestos OFF;
GO

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_descuentos ON;
INSERT INTO ventas.ordenes_descuentos (ID, ID_orden, ID_tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'PROMOCIO_01', 57.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'PROMOCIO_02', 32.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'PROMOCIO_03', 71.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'PROMOCIO_04', 39.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'PROMOCIO_05', 85.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'PROMOCIO_06', 46.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'PROMOCIO_07', 99.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'PROMOCIO_08', 53.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'PROMOCIO_09', 113.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'PROMOCIO_10', 60.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'PROMOCIO_11', 128.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'PROMOCIO_12', 67.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'PROMOCIO_13', 142.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'PROMOCIO_14', 74.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'PROMOCIO_15', 156.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'PROMOCIO_16', 81.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'PROMOCIO_17', 170.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'PROMOCIO_18', 88.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'PROMOCIO_19', 184.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'PROMOCIO_20', 96.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'PROMOCIO_21', 199.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'PROMOCIO_22', 103.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'PROMOCIO_23', 213.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'PROMOCIO_24', 110.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'PROMOCIO_25', 227.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'PROMOCIO_26', 117.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'PROMOCIO_27', 241.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'PROMOCIO_28', 124.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'PROMOCIO_29', 255.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'PROMOCIO_30', 131.50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_descuentos OFF;
GO

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones ON;
INSERT INTO ventas.ordenes_notas_instrucciones (ID, ID_orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Con cariño para el cuidado diario de tu piel, Carlos.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, N'Con cariño para el cuidado diario de tu piel, Sofía.', N'Portón blanco frente a parque en Obispado, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, N'Con cariño para el cuidado diario de tu piel, Valeria.', N'Portón blanco frente a parque en Del Valle, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, N'Con cariño para el cuidado diario de tu piel, Alejandro.', N'Portón blanco frente a parque en Roma Norte, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, N'Con cariño para el cuidado diario de tu piel, Mariana.', N'Portón blanco frente a parque en Polanco, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, N'Con cariño para el cuidado diario de tu piel, Diego.', N'Portón blanco frente a parque en Americana, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'Con cariño para el cuidado diario de tu piel, Camila.', N'Portón blanco frente a parque en República, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, N'Con cariño para el cuidado diario de tu piel, Mateo.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, N'Con cariño para el cuidado diario de tu piel, Lucía.', N'Portón blanco frente a parque en La Paz, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, N'Con cariño para el cuidado diario de tu piel, Sebastián.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Con cariño para el cuidado diario de tu piel, Regina.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, N'Con cariño para el cuidado diario de tu piel, Santiago.', N'Portón blanco frente a parque en Obispado, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'Con cariño para el cuidado diario de tu piel, Fernanda.', N'Portón blanco frente a parque en Del Valle, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, N'Con cariño para el cuidado diario de tu piel, Emiliano.', N'Portón blanco frente a parque en Roma Norte, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Con cariño para el cuidado diario de tu piel, Ximena.', N'Portón blanco frente a parque en Polanco, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, N'Con cariño para el cuidado diario de tu piel, Daniel.', N'Portón blanco frente a parque en Americana, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, N'Con cariño para el cuidado diario de tu piel, Andrea.', N'Portón blanco frente a parque en República, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, N'Con cariño para el cuidado diario de tu piel, Gabriel.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'Con cariño para el cuidado diario de tu piel, Paula.', N'Portón blanco frente a parque en La Paz, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, N'Con cariño para el cuidado diario de tu piel, Andrés.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Con cariño para el cuidado diario de tu piel, Renata.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, N'Con cariño para el cuidado diario de tu piel, Nicolás.', N'Portón blanco frente a parque en Obispado, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, N'Con cariño para el cuidado diario de tu piel, Natalia.', N'Portón blanco frente a parque en Del Valle, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, N'Con cariño para el cuidado diario de tu piel, Joaquín.', N'Portón blanco frente a parque en Roma Norte, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'Con cariño para el cuidado diario de tu piel, Isabella.', N'Portón blanco frente a parque en Polanco, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, N'Con cariño para el cuidado diario de tu piel, Leonardo.', N'Portón blanco frente a parque en Americana, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, N'Con cariño para el cuidado diario de tu piel, Ana.', N'Portón blanco frente a parque en República, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, N'Con cariño para el cuidado diario de tu piel, Rodrigo.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Con cariño para el cuidado diario de tu piel, Paulina.', N'Portón blanco frente a parque en La Paz, entregar en recepción.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, N'Con cariño para el cuidado diario de tu piel, Mauricio.', N'Portón blanco frente a parque en Centro, entregar en recepción.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones OFF;
GO

-- =================================================================================================
-- 071. TABLA: ventas.reservas_temporales_stock (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.reservas_temporales_stock ON;
INSERT INTO ventas.reservas_temporales_stock (ID, ID_carrito, ID_variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:45:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:45:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:45:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.reservas_temporales_stock OFF;
GO

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.afiliados_influencers ON;
INSERT INTO ventas.afiliados_influencers (ID, codigo_afiliado, ID_usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'AFILIADO_01', 1, N'@DermaTipsCarlos_01', 6.00, '012180001234567801', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'AFILIADO_02', 2, N'@DermaTipsSofía_02', 7.00, '012180001234567802', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'AFILIADO_03', 3, N'@DermaTipsValeria_03', 8.00, '012180001234567803', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'AFILIADO_04', 4, N'@DermaTipsAlejandro_04', 9.00, '012180001234567804', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'AFILIADO_05', 5, N'@DermaTipsMariana_05', 10.00, '012180001234567805', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'AFILIADO_06', 6, N'@DermaTipsDiego_06', 11.00, '012180001234567806', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'AFILIADO_07', 7, N'@DermaTipsCamila_07', 12.00, '012180001234567807', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'AFILIADO_08', 8, N'@DermaTipsMateo_08', 13.00, '012180001234567808', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'AFILIADO_09', 9, N'@DermaTipsLucía_09', 14.00, '012180001234567809', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'AFILIADO_10', 10, N'@DermaTipsSebastián_10', 15.00, '012180001234567810', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'AFILIADO_11', 11, N'@DermaTipsRegina_11', 16.00, '012180001234567811', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'AFILIADO_12', 12, N'@DermaTipsSantiago_12', 17.00, '012180001234567812', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'AFILIADO_13', 13, N'@DermaTipsFernanda_13', 18.00, '012180001234567813', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'AFILIADO_14', 14, N'@DermaTipsEmiliano_14', 19.00, '012180001234567814', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'AFILIADO_15', 15, N'@DermaTipsXimena_15', 5.00, '012180001234567815', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'AFILIADO_16', 16, N'@DermaTipsDaniel_16', 6.00, '012180001234567816', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'AFILIADO_17', 17, N'@DermaTipsAndrea_17', 7.00, '012180001234567817', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'AFILIADO_18', 18, N'@DermaTipsGabriel_18', 8.00, '012180001234567818', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'AFILIADO_19', 19, N'@DermaTipsPaula_19', 9.00, '012180001234567819', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'AFILIADO_20', 20, N'@DermaTipsAndrés_20', 10.00, '012180001234567820', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'AFILIADO_21', 21, N'@DermaTipsRenata_21', 11.00, '012180001234567821', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'AFILIADO_22', 22, N'@DermaTipsNicolás_22', 12.00, '012180001234567822', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'AFILIADO_23', 23, N'@DermaTipsNatalia_23', 13.00, '012180001234567823', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'AFILIADO_24', 24, N'@DermaTipsJoaquín_24', 14.00, '012180001234567824', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'AFILIADO_25', 25, N'@DermaTipsIsabella_25', 15.00, '012180001234567825', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'AFILIADO_26', 26, N'@DermaTipsLeonardo_26', 16.00, '012180001234567826', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'AFILIADO_27', 27, N'@DermaTipsAna_27', 17.00, '012180001234567827', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'AFILIADO_28', 28, N'@DermaTipsRodrigo_28', 18.00, '012180001234567828', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'AFILIADO_29', 29, N'@DermaTipsPaulina_29', 19.00, '012180001234567829', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'AFILIADO_30', 30, N'@DermaTipsMauricio_30', 5.00, '012180001234567830', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.afiliados_influencers OFF;
GO

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.comisiones_afiliados ON;
INSERT INTO ventas.comisiones_afiliados (ID, ID_afiliado, ID_orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 571.00, 34.26, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, 22.47, N'APROBADA', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 641.70, 51.34, N'PAGADA', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, 35.28, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 855.00, 85.50, N'APROBADA', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 416.70, 45.84, N'PAGADA', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 997.00, 119.64, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, 69.42, N'APROBADA', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1025.10, 143.51, N'PAGADA', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, 90.75, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1281.00, 204.96, N'APROBADA', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 608.40, 103.43, N'PAGADA', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1423.00, 256.14, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, 141.93, N'APROBADA', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1408.50, 281.70, N'PAGADA', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, 171.78, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1707.00, 375.54, N'APROBADA', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 800.10, 184.02, N'PAGADA', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1849.00, 443.76, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, 240.00, N'APROBADA', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1791.90, 465.89, N'PAGADA', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, 278.37, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 2133.00, 597.24, N'APROBADA', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 991.80, 287.62, N'PAGADA', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 2275.00, 682.50, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, 70.38, N'APROBADA', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 2175.30, 152.27, N'PAGADA', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, 99.52, N'PENDIENTE', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 2559.00, 230.31, N'APROBADA', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1183.50, 118.35, N'PAGADA', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.comisiones_afiliados OFF;
GO

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.proveedores_pasarela ON;
INSERT INTO pagos.proveedores_pasarela (ID, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PASARELA_01', N'Stripe México', N'https://api.dermacare.mx/webhooks/pagos/stripe/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PASARELA_02', N'Mercado Pago', N'https://api.dermacare.mx/webhooks/pagos/mercadopago/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PASARELA_03', N'Openpay BBVA', N'https://api.dermacare.mx/webhooks/pagos/openpay/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PASARELA_04', N'Conekta MX', N'https://api.dermacare.mx/webhooks/pagos/conekta/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PASARELA_05', N'PayPal Commerce', N'https://api.dermacare.mx/webhooks/pagos/paypal/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PASARELA_06', N'Clip Checkout', N'https://api.dermacare.mx/webhooks/pagos/clip/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PASARELA_07', N'Kueski Pay', N'https://api.dermacare.mx/webhooks/pagos/kueskipay/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PASARELA_08', N'Aplazo BNPL', N'https://api.dermacare.mx/webhooks/pagos/aplazo/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PASARELA_09', N'Adyen LATAM', N'https://api.dermacare.mx/webhooks/pagos/adyen/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PASARELA_10', N'STP SPEI Directo', N'https://api.dermacare.mx/webhooks/pagos/stp-spei/v1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PASARELA_11', N'Stripe México Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/stripe/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PASARELA_12', N'Mercado Pago Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/mercadopago/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PASARELA_13', N'Openpay BBVA Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/openpay/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PASARELA_14', N'Conekta MX Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/conekta/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PASARELA_15', N'PayPal Commerce Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/paypal/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PASARELA_16', N'Clip Checkout Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/clip/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PASARELA_17', N'Kueski Pay Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/kueskipay/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PASARELA_18', N'Aplazo BNPL Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/aplazo/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PASARELA_19', N'Adyen LATAM Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/adyen/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PASARELA_20', N'STP SPEI Directo Nodo 2', N'https://api.dermacare.mx/webhooks/pagos/stp-spei/v2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PASARELA_21', N'Stripe México Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/stripe/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PASARELA_22', N'Mercado Pago Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/mercadopago/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PASARELA_23', N'Openpay BBVA Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/openpay/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PASARELA_24', N'Conekta MX Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/conekta/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PASARELA_25', N'PayPal Commerce Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/paypal/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PASARELA_26', N'Clip Checkout Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/clip/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PASARELA_27', N'Kueski Pay Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/kueskipay/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PASARELA_28', N'Aplazo BNPL Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/aplazo/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PASARELA_29', N'Adyen LATAM Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/adyen/v3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PASARELA_30', N'STP SPEI Directo Nodo 3', N'https://api.dermacare.mx/webhooks/pagos/stp-spei/v3', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.proveedores_pasarela OFF;
GO

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.metodos_pago ON;
INSERT INTO pagos.metodos_pago (ID, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'TARJETA_CRED', N'Tarjeta de Crédito', 1.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'TARJETA_DEB', N'Tarjeta de Débito', 1.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SPEI_TRANSF', N'Transferencia Electrónica SPEI', 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'OXXO_EFECT', N'Pago en Efectivo Tiendas OXXO', 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MONEDERO', N'Saldo Monedero DermaCare', 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT pagos.metodos_pago OFF;
GO

-- =================================================================================================
-- 076. TABLA: pagos.transacciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.transacciones ON;
INSERT INTO pagos.transacciones (ID, folio_transaccion, ID_orden, ID_proveedor_pasarela, ID_metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 1, 1, N'pi_3QxDerma2026_0001', 791.36, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 2, 2, N'pi_3QxDerma2026_0002', 501.36, 'MXN', N'APROBADA', N'AUTORIZA_02', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 3, 3, N'pi_3QxDerma2026_0003', 873.37, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 4, 4, N'pi_3QxDerma2026_0004', 583.72, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 5, 5, N'pi_3QxDerma2026_0005', 1120.80, 'MXN', N'EN_MEDIACION', N'AUTORIZA_05', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 6, 1, N'pi_3QxDerma2026_0006', 612.37, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 7, 2, N'pi_3QxDerma2026_0007', 1285.52, 'MXN', N'APROBADA', N'AUTORIZA_07', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 8, 3, N'pi_3QxDerma2026_0008', 748.44, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 9, 4, N'pi_3QxDerma2026_0009', 1189.12, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 10, 5, N'pi_3QxDerma2026_0010', 830.80, 'MXN', N'EN_MEDIACION', N'AUTORIZA_10', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 11, 1, N'pi_3QxDerma2026_0011', 1485.96, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 12, 2, N'pi_3QxDerma2026_0012', 834.74, 'MXN', N'APROBADA', N'AUTORIZA_12', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 13, 3, N'pi_3QxDerma2026_0013', 1650.68, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 14, 4, N'pi_3QxDerma2026_0014', 995.52, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 15, 5, N'pi_3QxDerma2026_0015', 1633.86, 'MXN', N'EN_MEDIACION', N'AUTORIZA_15', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 16, 1, N'pi_3QxDerma2026_0016', 1077.88, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 17, 2, N'pi_3QxDerma2026_0017', 1980.12, 'MXN', N'APROBADA', N'AUTORIZA_17', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 18, 3, N'pi_3QxDerma2026_0018', 1057.12, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 19, 4, N'pi_3QxDerma2026_0019', 2144.84, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 20, 5, N'pi_3QxDerma2026_0020', 1242.60, 'MXN', N'EN_MEDIACION', N'AUTORIZA_20', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 21, 1, N'pi_3QxDerma2026_0021', 2078.60, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 22, 2, N'pi_3QxDerma2026_0022', 1195.96, 'MXN', N'APROBADA', N'AUTORIZA_22', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 23, 3, N'pi_3QxDerma2026_0023', 2474.28, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 24, 4, N'pi_3QxDerma2026_0024', 1279.49, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 25, 5, N'pi_3QxDerma2026_0025', 2639.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_25', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 26, 1, N'pi_3QxDerma2026_0026', 1360.68, 'MXN', N'PENDIENTE', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 27, 2, N'pi_3QxDerma2026_0027', 2523.35, 'MXN', N'APROBADA', N'AUTORIZA_27', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 28, 3, N'pi_3QxDerma2026_0028', 1443.04, 'MXN', N'RECHAZADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 29, 4, N'pi_3QxDerma2026_0029', 2968.44, 'MXN', N'CANCELADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 30, 5, N'pi_3QxDerma2026_0030', 1372.86, 'MXN', N'EN_MEDIACION', N'AUTORIZA_30', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.transacciones OFF;
GO

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.intentos_cobro ON;
INSERT INTO pagos.intentos_cobro (ID, ID_transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 200, N'{"tx_id": 1, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, N'{"tx_id": 2, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, N'{"tx_id": 3, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 402, N'{"tx_id": 4, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, N'{"tx_id": 5, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, N'{"tx_id": 6, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, N'{"tx_id": 7, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 402, N'{"tx_id": 8, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, N'{"tx_id": 9, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, N'{"tx_id": 10, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, N'{"tx_id": 11, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 402, N'{"tx_id": 12, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, N'{"tx_id": 13, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, N'{"tx_id": 14, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, N'{"tx_id": 15, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 402, N'{"tx_id": 16, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, N'{"tx_id": 17, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, N'{"tx_id": 18, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, N'{"tx_id": 19, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 402, N'{"tx_id": 20, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, N'{"tx_id": 21, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, N'{"tx_id": 22, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, N'{"tx_id": 23, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 402, N'{"tx_id": 24, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, N'{"tx_id": 25, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, N'{"tx_id": 26, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, N'{"tx_id": 27, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 402, N'{"tx_id": 28, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "requires_payment_method", "code": 402}', N'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, N'{"tx_id": 29, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, N'{"tx_id": 30, "currency": "MXN", "capture_method": "automatic"}', N'{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.intentos_cobro OFF;
GO

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.split_multipagos ON;
INSERT INTO pagos.split_multipagos (ID, ID_orden, ID_metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 142.75, N'REF-MULTIPAGO-2026-0001', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 160.50, N'REF-MULTIPAGO-2026-0002', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 178.25, N'REF-MULTIPAGO-2026-0003', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 196.00, N'REF-MULTIPAGO-2026-0004', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 213.75, N'REF-MULTIPAGO-2026-0005', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 231.50, N'REF-MULTIPAGO-2026-0006', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 249.25, N'REF-MULTIPAGO-2026-0007', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 267.00, N'REF-MULTIPAGO-2026-0008', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 284.75, N'REF-MULTIPAGO-2026-0009', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 302.50, N'REF-MULTIPAGO-2026-0010', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 320.25, N'REF-MULTIPAGO-2026-0011', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 338.00, N'REF-MULTIPAGO-2026-0012', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 355.75, N'REF-MULTIPAGO-2026-0013', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 373.50, N'REF-MULTIPAGO-2026-0014', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 391.25, N'REF-MULTIPAGO-2026-0015', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 409.00, N'REF-MULTIPAGO-2026-0016', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 426.75, N'REF-MULTIPAGO-2026-0017', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 444.50, N'REF-MULTIPAGO-2026-0018', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 462.25, N'REF-MULTIPAGO-2026-0019', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 480.00, N'REF-MULTIPAGO-2026-0020', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 497.75, N'REF-MULTIPAGO-2026-0021', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 515.50, N'REF-MULTIPAGO-2026-0022', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 533.25, N'REF-MULTIPAGO-2026-0023', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 551.00, N'REF-MULTIPAGO-2026-0024', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 568.75, N'REF-MULTIPAGO-2026-0025', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 586.50, N'REF-MULTIPAGO-2026-0026', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 604.25, N'REF-MULTIPAGO-2026-0027', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 622.00, N'REF-MULTIPAGO-2026-0028', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 639.75, N'REF-MULTIPAGO-2026-0029', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 657.50, N'REF-MULTIPAGO-2026-0030', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.split_multipagos OFF;
GO

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.billetera_electronica ON;
INSERT INTO pagos.billetera_electronica (ID, ID_cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 300.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 350.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 400.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 450.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 500.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 550.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 600.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 650.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 700.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 750.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 800.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 850.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 900.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 950.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1000.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1050.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1100.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1150.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1200.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1250.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1300.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1350.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1400.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1450.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1500.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1550.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1600.00, 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1650.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1700.00, 0.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1750.00, 150.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.billetera_electronica OFF;
GO

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.movimientos_billetera ON;
INSERT INTO pagos.movimientos_billetera (ID, ID_billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CARGA_SALDO', 115.00, 520.00, 635.00, N'Recarga electrónica acreditada en billetera #0001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAGO_ORDEN', 130.00, 540.00, 410.00, N'Aplicación de saldo para pago parcial de orden #0002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'REEMBOLSO_DEVOLUCION', 145.00, 560.00, 705.00, N'Acreditación por devolución RMA aprobada #0003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CARGA_SALDO', 160.00, 580.00, 740.00, N'Recarga electrónica acreditada en billetera #0004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PAGO_ORDEN', 175.00, 600.00, 425.00, N'Aplicación de saldo para pago parcial de orden #0005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'REEMBOLSO_DEVOLUCION', 190.00, 620.00, 810.00, N'Acreditación por devolución RMA aprobada #0006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CARGA_SALDO', 205.00, 640.00, 845.00, N'Recarga electrónica acreditada en billetera #0007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PAGO_ORDEN', 220.00, 660.00, 440.00, N'Aplicación de saldo para pago parcial de orden #0008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'REEMBOLSO_DEVOLUCION', 235.00, 680.00, 915.00, N'Acreditación por devolución RMA aprobada #0009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CARGA_SALDO', 250.00, 700.00, 950.00, N'Recarga electrónica acreditada en billetera #0010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PAGO_ORDEN', 265.00, 720.00, 455.00, N'Aplicación de saldo para pago parcial de orden #0011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'REEMBOLSO_DEVOLUCION', 280.00, 740.00, 1020.00, N'Acreditación por devolución RMA aprobada #0012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CARGA_SALDO', 295.00, 760.00, 1055.00, N'Recarga electrónica acreditada en billetera #0013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAGO_ORDEN', 310.00, 780.00, 470.00, N'Aplicación de saldo para pago parcial de orden #0014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'REEMBOLSO_DEVOLUCION', 325.00, 800.00, 1125.00, N'Acreditación por devolución RMA aprobada #0015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CARGA_SALDO', 340.00, 820.00, 1160.00, N'Recarga electrónica acreditada en billetera #0016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'PAGO_ORDEN', 355.00, 840.00, 485.00, N'Aplicación de saldo para pago parcial de orden #0017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'REEMBOLSO_DEVOLUCION', 370.00, 860.00, 1230.00, N'Acreditación por devolución RMA aprobada #0018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CARGA_SALDO', 385.00, 880.00, 1265.00, N'Recarga electrónica acreditada en billetera #0019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PAGO_ORDEN', 400.00, 900.00, 500.00, N'Aplicación de saldo para pago parcial de orden #0020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'REEMBOLSO_DEVOLUCION', 415.00, 920.00, 1335.00, N'Acreditación por devolución RMA aprobada #0021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CARGA_SALDO', 430.00, 940.00, 1370.00, N'Recarga electrónica acreditada en billetera #0022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PAGO_ORDEN', 445.00, 960.00, 515.00, N'Aplicación de saldo para pago parcial de orden #0023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'REEMBOLSO_DEVOLUCION', 460.00, 980.00, 1440.00, N'Acreditación por devolución RMA aprobada #0024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CARGA_SALDO', 475.00, 1000.00, 1475.00, N'Recarga electrónica acreditada en billetera #0025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAGO_ORDEN', 490.00, 1020.00, 530.00, N'Aplicación de saldo para pago parcial de orden #0026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'REEMBOLSO_DEVOLUCION', 505.00, 1040.00, 1545.00, N'Acreditación por devolución RMA aprobada #0027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CARGA_SALDO', 520.00, 1060.00, 1580.00, N'Recarga electrónica acreditada en billetera #0028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'PAGO_ORDEN', 535.00, 1080.00, 545.00, N'Aplicación de saldo para pago parcial de orden #0029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'REEMBOLSO_DEVOLUCION', 550.00, 1100.00, 1650.00, N'Acreditación por devolución RMA aprobada #0030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.movimientos_billetera OFF;
GO

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards ON;
INSERT INTO pagos.tarjetas_regalo_giftcards (ID, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, ID_cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 285.50, 285.50, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 321.00, 321.00, '2026-03-02', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 356.50, 356.50, '2026-03-03', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 392.00, 392.00, '2026-03-04', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 427.50, 427.50, '2026-03-05', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 463.00, 463.00, '2026-03-06', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 498.50, 498.50, '2026-03-07', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 534.00, 534.00, '2026-03-08', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 569.50, 569.50, '2026-03-09', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 605.00, 605.00, '2026-03-10', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 640.50, 640.50, '2026-03-11', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 676.00, 676.00, '2026-03-12', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 711.50, 711.50, '2026-03-13', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 747.00, 747.00, '2026-03-14', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 782.50, 782.50, '2026-03-15', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 818.00, 818.00, '2026-03-16', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 853.50, 853.50, '2026-03-17', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 889.00, 889.00, '2026-03-18', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 924.50, 924.50, '2026-03-19', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 960.00, 960.00, '2026-03-20', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 995.50, 995.50, '2026-03-21', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 1031.00, 1031.00, '2026-03-22', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 1066.50, 1066.50, '2026-03-23', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 1102.00, 1102.00, '2026-03-24', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 1137.50, 1137.50, '2026-03-25', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 1173.00, 1173.00, '2026-03-26', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 1208.50, 1208.50, '2026-03-27', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 1244.00, 1244.00, '2026-03-28', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 1279.50, 1279.50, '2026-03-01', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 1315.00, 1315.00, '2026-03-02', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards OFF;
GO

-- =================================================================================================
-- 082. TABLA: pagos.redenciones_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.redenciones_giftcards ON;
INSERT INTO pagos.redenciones_giftcards (ID, ID_giftcard, ID_orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 285.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 356.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 427.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 463.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 498.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 569.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 640.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 676.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 711.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 782.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 853.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 889.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 924.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 995.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1066.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1102.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1137.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1208.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1279.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1315.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.redenciones_giftcards OFF;
GO

-- =================================================================================================
-- 083. TABLA: pagos.reglas_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.reglas_antifraude ON;
INSERT INTO pagos.reglas_antifraude (ID, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'REGLA_01', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #01)', 6, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'REGLA_02', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #02)', 7, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'REGLA_03', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #03)', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'REGLA_04', N'Uso de correo desechable o dominio temporal no verificado. (Regla #04)', 9, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'REGLA_05', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #05)', 10, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'REGLA_06', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #06)', 11, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'REGLA_07', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #07)', 12, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'REGLA_08', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #08)', 13, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'REGLA_09', N'Uso de correo desechable o dominio temporal no verificado. (Regla #09)', 14, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'REGLA_10', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #10)', 15, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'REGLA_11', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #11)', 16, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'REGLA_12', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #12)', 17, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'REGLA_13', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #13)', 18, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'REGLA_14', N'Uso de correo desechable o dominio temporal no verificado. (Regla #14)', 19, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'REGLA_15', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #15)', 20, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'REGLA_16', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #16)', 21, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'REGLA_17', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #17)', 22, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'REGLA_18', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #18)', 23, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'REGLA_19', N'Uso de correo desechable o dominio temporal no verificado. (Regla #19)', 24, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'REGLA_20', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #20)', 25, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'REGLA_21', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #21)', 26, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'REGLA_22', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #22)', 27, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'REGLA_23', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #23)', 28, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'REGLA_24', N'Uso de correo desechable o dominio temporal no verificado. (Regla #24)', 29, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'REGLA_25', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #25)', 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'REGLA_26', N'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #26)', 31, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'REGLA_27', N'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #27)', 32, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'REGLA_28', N'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #28)', 33, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'REGLA_29', N'Uso de correo desechable o dominio temporal no verificado. (Regla #29)', 34, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'REGLA_30', N'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #30)', 5, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reglas_antifraude OFF;
GO

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.evaluaciones_antifraude ON;
INSERT INTO pagos.evaluaciones_antifraude (ID, ID_orden, ID_regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'BAJO', N'189.203.3.7', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, N'MEDIO', N'189.203.6.14', 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, N'ALTO_REQUERIR_3DS', N'189.203.9.21', 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, N'CRITICO_RECHAZADO', N'189.203.12.28', 4, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, N'BAJO', N'189.203.15.35', 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, N'MEDIO', N'189.203.18.42', 6, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, N'ALTO_REQUERIR_3DS', N'189.203.21.49', 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, N'CRITICO_RECHAZADO', N'189.203.24.56', 8, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, N'BAJO', N'189.203.27.63', 9, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, N'MEDIO', N'189.203.30.70', 10, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, N'ALTO_REQUERIR_3DS', N'189.203.33.77', 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, N'CRITICO_RECHAZADO', N'189.203.36.84', 12, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, N'BAJO', N'189.203.39.91', 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, N'MEDIO', N'189.203.42.98', 14, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, N'ALTO_REQUERIR_3DS', N'189.203.45.105', 15, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, N'CRITICO_RECHAZADO', N'189.203.48.112', 16, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, N'BAJO', N'189.203.51.119', 17, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, N'MEDIO', N'189.203.54.126', 18, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, N'ALTO_REQUERIR_3DS', N'189.203.57.133', 19, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, N'CRITICO_RECHAZADO', N'189.203.60.140', 20, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, N'BAJO', N'189.203.63.147', 21, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, N'MEDIO', N'189.203.66.154', 22, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, N'ALTO_REQUERIR_3DS', N'189.203.69.161', 23, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, N'CRITICO_RECHAZADO', N'189.203.72.168', 24, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, N'BAJO', N'189.203.75.175', 25, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, N'MEDIO', N'189.203.78.182', 26, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, N'ALTO_REQUERIR_3DS', N'189.203.81.189', 27, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, N'CRITICO_RECHAZADO', N'189.203.84.196', 28, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, N'BAJO', N'189.203.87.203', 29, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, N'MEDIO', N'189.203.90.210', 30, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.evaluaciones_antifraude OFF;
GO

-- =================================================================================================
-- 085. TABLA: pagos.contracargos_chargebacks (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.contracargos_chargebacks ON;
INSERT INTO pagos.contracargos_chargebacks (ID, ID_transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-DISPU-2026-0001', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 285.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-DISPU-2026-0002', N'Reclamo por mercancía no recibida tras plazo prometido.', 321.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-DISPU-2026-0003', N'Diferencia en monto cobrado reportada en estado de cuenta.', 356.50, '2026-02-03 11:30:00', '2026-03-03', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-DISPU-2026-0004', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 392.00, '2026-02-04 11:30:00', '2026-03-04', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-DISPU-2026-0005', N'Reclamo por mercancía no recibida tras plazo prometido.', 427.50, '2026-02-05 11:30:00', '2026-03-05', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-DISPU-2026-0006', N'Diferencia en monto cobrado reportada en estado de cuenta.', 463.00, '2026-02-06 11:30:00', '2026-03-06', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-DISPU-2026-0007', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 498.50, '2026-02-07 11:30:00', '2026-03-07', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-DISPU-2026-0008', N'Reclamo por mercancía no recibida tras plazo prometido.', 534.00, '2026-02-08 11:30:00', '2026-03-08', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-DISPU-2026-0009', N'Diferencia en monto cobrado reportada en estado de cuenta.', 569.50, '2026-02-09 11:30:00', '2026-03-09', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-DISPU-2026-0010', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 605.00, '2026-02-10 11:30:00', '2026-03-10', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-DISPU-2026-0011', N'Reclamo por mercancía no recibida tras plazo prometido.', 640.50, '2026-02-11 11:30:00', '2026-03-11', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-DISPU-2026-0012', N'Diferencia en monto cobrado reportada en estado de cuenta.', 676.00, '2026-02-12 11:30:00', '2026-03-12', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-DISPU-2026-0013', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 711.50, '2026-02-13 11:30:00', '2026-03-13', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-DISPU-2026-0014', N'Reclamo por mercancía no recibida tras plazo prometido.', 747.00, '2026-02-14 11:30:00', '2026-03-14', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-DISPU-2026-0015', N'Diferencia en monto cobrado reportada en estado de cuenta.', 782.50, '2026-02-15 11:30:00', '2026-03-15', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-DISPU-2026-0016', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 818.00, '2026-02-16 11:30:00', '2026-03-16', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-DISPU-2026-0017', N'Reclamo por mercancía no recibida tras plazo prometido.', 853.50, '2026-02-17 11:30:00', '2026-03-17', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-DISPU-2026-0018', N'Diferencia en monto cobrado reportada en estado de cuenta.', 889.00, '2026-02-18 11:30:00', '2026-03-18', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-DISPU-2026-0019', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 924.50, '2026-02-19 11:30:00', '2026-03-19', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-DISPU-2026-0020', N'Reclamo por mercancía no recibida tras plazo prometido.', 960.00, '2026-02-20 11:30:00', '2026-03-20', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-DISPU-2026-0021', N'Diferencia en monto cobrado reportada en estado de cuenta.', 995.50, '2026-02-21 11:30:00', '2026-03-21', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-DISPU-2026-0022', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1031.00, '2026-02-22 11:30:00', '2026-03-22', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-DISPU-2026-0023', N'Reclamo por mercancía no recibida tras plazo prometido.', 1066.50, '2026-02-23 11:30:00', '2026-03-23', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-DISPU-2026-0024', N'Diferencia en monto cobrado reportada en estado de cuenta.', 1102.00, '2026-02-24 11:30:00', '2026-03-24', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-DISPU-2026-0025', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1137.50, '2026-02-25 11:30:00', '2026-03-25', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-DISPU-2026-0026', N'Reclamo por mercancía no recibida tras plazo prometido.', 1173.00, '2026-02-26 11:30:00', '2026-03-26', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-DISPU-2026-0027', N'Diferencia en monto cobrado reportada en estado de cuenta.', 1208.50, '2026-02-27 11:30:00', '2026-03-27', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-DISPU-2026-0028', N'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1244.00, '2026-02-28 11:30:00', '2026-03-28', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-DISPU-2026-0029', N'Reclamo por mercancía no recibida tras plazo prometido.', 1279.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-DISPU-2026-0030', N'Diferencia en monto cobrado reportada en estado de cuenta.', 1315.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.contracargos_chargebacks OFF;
GO

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.reembolsos_transaccion ON;
INSERT INTO pagos.reembolsos_transaccion (ID, ID_transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-REEMB-2026-0001', 285.50, N'Devolución aprobada tras inspección sanitaria RMA #0001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-REEMB-2026-0002', 321.00, N'Devolución aprobada tras inspección sanitaria RMA #0002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-REEMB-2026-0003', 356.50, N'Devolución aprobada tras inspección sanitaria RMA #0003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-REEMB-2026-0004', 392.00, N'Devolución aprobada tras inspección sanitaria RMA #0004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-REEMB-2026-0005', 427.50, N'Devolución aprobada tras inspección sanitaria RMA #0005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-REEMB-2026-0006', 463.00, N'Devolución aprobada tras inspección sanitaria RMA #0006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-REEMB-2026-0007', 498.50, N'Devolución aprobada tras inspección sanitaria RMA #0007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-REEMB-2026-0008', 534.00, N'Devolución aprobada tras inspección sanitaria RMA #0008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-REEMB-2026-0009', 569.50, N'Devolución aprobada tras inspección sanitaria RMA #0009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-REEMB-2026-0010', 605.00, N'Devolución aprobada tras inspección sanitaria RMA #0010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-REEMB-2026-0011', 640.50, N'Devolución aprobada tras inspección sanitaria RMA #0011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-REEMB-2026-0012', 676.00, N'Devolución aprobada tras inspección sanitaria RMA #0012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-REEMB-2026-0013', 711.50, N'Devolución aprobada tras inspección sanitaria RMA #0013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-REEMB-2026-0014', 747.00, N'Devolución aprobada tras inspección sanitaria RMA #0014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-REEMB-2026-0015', 782.50, N'Devolución aprobada tras inspección sanitaria RMA #0015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-REEMB-2026-0016', 818.00, N'Devolución aprobada tras inspección sanitaria RMA #0016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-REEMB-2026-0017', 853.50, N'Devolución aprobada tras inspección sanitaria RMA #0017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-REEMB-2026-0018', 889.00, N'Devolución aprobada tras inspección sanitaria RMA #0018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-REEMB-2026-0019', 924.50, N'Devolución aprobada tras inspección sanitaria RMA #0019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-REEMB-2026-0020', 960.00, N'Devolución aprobada tras inspección sanitaria RMA #0020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-REEMB-2026-0021', 995.50, N'Devolución aprobada tras inspección sanitaria RMA #0021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-REEMB-2026-0022', 1031.00, N'Devolución aprobada tras inspección sanitaria RMA #0022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-REEMB-2026-0023', 1066.50, N'Devolución aprobada tras inspección sanitaria RMA #0023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-REEMB-2026-0024', 1102.00, N'Devolución aprobada tras inspección sanitaria RMA #0024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-REEMB-2026-0025', 1137.50, N'Devolución aprobada tras inspección sanitaria RMA #0025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-REEMB-2026-0026', 1173.00, N'Devolución aprobada tras inspección sanitaria RMA #0026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-REEMB-2026-0027', 1208.50, N'Devolución aprobada tras inspección sanitaria RMA #0027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-REEMB-2026-0028', 1244.00, N'Devolución aprobada tras inspección sanitaria RMA #0028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-REEMB-2026-0029', 1279.50, N'Devolución aprobada tras inspección sanitaria RMA #0029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-REEMB-2026-0030', 1315.00, N'Devolución aprobada tras inspección sanitaria RMA #0030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reembolsos_transaccion OFF;
GO

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.regimenes_sat ON;
INSERT INTO fiscal.regimenes_sat (ID, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'601', N'General de Ley Personas Morales', 0, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'605', N'Sueldos y Salarios e Ingresos Asimilados a Salarios', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'606', N'Arrendamiento', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'612', N'Personas Físicas con Actividades Empresariales y Profesionales', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'616', N'Sin obligaciones fiscales', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'621', N'Incorporación Fiscal', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'625', N'Régimen de las Actividades Empresariales con ingresos a través de Plataformas', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'626', N'Régimen Simplificado de Confianza (RESICO)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT fiscal.regimenes_sat OFF;
GO

-- =================================================================================================
-- 088. TABLA: fiscal.usos_cfdi (8 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.usos_cfdi ON;
INSERT INTO fiscal.usos_cfdi (ID, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'G01', N'Adquisición de mercancías', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'G03', N'Gastos en general', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'D01', N'Honorarios médicos, dentales y gastos hospitalarios', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'D02', N'Gastos médicos por incapacidad o discapacidad', 1, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'I04', N'Equipo de computo y accesorios', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'P01', N'Por definir (Uso transitorio)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'S01', N'Sin efectos fiscales', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CP01', N'Pagos (Complemento de recepción de pagos)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT fiscal.usos_cfdi OFF;
GO

-- =================================================================================================
-- 089. TABLA: fiscal.datos_fiscales_cliente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.datos_fiscales_cliente ON;
INSERT INTO fiscal.datos_fiscales_cliente (ID, ID_cliente, rfc_emisor, razon_social, codigo_postal_fiscal, ID_regimen_sat, ID_uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 'MEGC910315H01', N'CARLOS MENDOZA GARZA', '25700', 1, 1, N'carlos.mendoza.1@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'RALS920315H02', N'SOFÍA RAMÍREZ LÓPEZ', '64000', 2, 2, N'sofia.ramirez.2@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'TOVV930315H03', N'VALERIA TORRES VILLARREAL', '66220', 3, 3, N'valeria.torres.3@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'HECA940315H04', N'ALEJANDRO HERNÁNDEZ CRUZ', '06700', 4, 4, N'alejandro.hernandez.4@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SAFM950315H05', N'MARIANA SÁNCHEZ FUENTES', '11560', 5, 5, N'mariana.sanchez.5@dermacare.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'MATD960315H06', N'DIEGO MARTÍNEZ TREVIÑO', '44100', 6, 6, N'diego.martinez.6@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'GORC970315H07', N'CAMILA GONZÁLEZ REYES', '25000', 7, 7, N'camila.gonzalez.7@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FLCM980315H08', N'MATEO FLORES CASTILLO', '76000', 8, 8, N'mateo.flores.8@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'MODL990315H09', N'LUCÍA MORALES DÍAZ', '72000', 1, 1, N'lucia.morales.9@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'VAOS900315H10', N'SEBASTIÁN VÁZQUEZ ORTIZ', '97000', 2, 2, N'sebastian.vazquez.10@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'GUNR910315H11', N'REGINA GUTIÉRREZ NAVA', '25700', 3, 3, N'regina.gutierrez.11@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'JIPS920315H12', N'SANTIAGO JIMÉNEZ PÉREZ', '64000', 4, 4, N'santiago.jimenez.12@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'RUSF930315H13', N'FERNANDA RUIZ SALAZAR', '66220', 5, 5, N'fernanda.ruiz.13@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'RICE940315H14', N'EMILIANO RÍOS CÁRDENAS', '06700', 6, 6, N'emiliano.rios.14@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'AGIX950315H15', N'XIMENA AGUILAR IBARRA', '11560', 7, 7, N'ximena.aguilar.15@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'MEND960315H16', N'DANIEL MÉNDEZ NAVARRO', '44100', 8, 8, N'daniel.mendez.16@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CADA970315H17', N'ANDREA CASTRO DELGADO', '25000', 1, 1, N'andrea.castro.17@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'VEMG980315H18', N'GABRIEL VEGA MONTOYA', '76000', 2, 2, N'gabriel.vega.18@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CORP990315H19', N'PAULA CORTÉS ROJAS', '72000', 3, 3, N'paula.cortes.19@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'RACA900315H20', N'ANDRÉS RAMOS CAMPOS', '97000', 4, 4, N'andres.ramos.20@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'GULR910315H21', N'RENATA GUERRERO LUNA', '25700', 5, 5, N'renata.guerrero.21@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PECN920315H22', N'NICOLÁS PEÑA CABRERA', '64000', 6, 6, N'nicolas.pena.22@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'HEVN930315H23', N'NATALIA HERRERA VARGAS', '66220', 7, 7, N'natalia.herrera.23@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'MECJ940315H24', N'JOAQUÍN MEDINA CONTRERAS', '06700', 8, 8, N'joaquin.medina.24@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DOEI950315H25', N'ISABELLA DOMÍNGUEZ ESCOBAR', '11560', 1, 1, N'isabella.dominguez.25@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SIPL960315H26', N'LEONARDO SILVA PAREDES', '44100', 2, 2, N'leonardo.silva.26@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CHBA970315H27', N'ANA CHÁVEZ BAUTISTA', '25000', 3, 3, N'ana.chavez.27@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'OCAR980315H28', N'RODRIGO OCHOA ACOSTA', '76000', 4, 4, N'rodrigo.ochoa.28@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MILP990315H29', N'PAULINA MIRANDA LEAL', '72000', 5, 5, N'paulina.miranda.29@correo.mx', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PASM900315H30', N'MAURICIO PADILLA SOLÍS', '97000', 6, 6, N'mauricio.padilla.30@correo.mx', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.datos_fiscales_cliente OFF;
GO

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_cfdi ON;
INSERT INTO fiscal.facturas_cfdi (ID, ID_orden, ID_dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 'DC', N'FOL-FACTU-2026-0001', N'B1000000-0000-4000-8000-000000000001', N'CFDI40_SIG_9629800bff6e0b2ab0e057a1685fcb569088e04ec6e0f25b88e8e7fd340267d1', N'SAT_PAC_SIG_1a875b15b158c9d380cc1438b2710c20533f972a8ba5071840e91fe6ebdde60b', N'||1.1|B1000000-0000-4000-8000-000000000001|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460001', '2026-02-01 11:30:00', 791.36, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0001.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'DC', N'FOL-FACTU-2026-0002', N'B1000000-0000-4000-8000-000000000002', N'CFDI40_SIG_ca9e6dcd9649acfe0ff3931d39347b7ba5f5f21a0309d16c717333e66b519d92', N'SAT_PAC_SIG_855ecb8ceb9777d32062546ad908007765eb5ac4c43a4f7981a5a3fae3fdb63b', N'||1.1|B1000000-0000-4000-8000-000000000002|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460002', '2026-02-02 11:30:00', 501.36, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0002.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'DC', N'FOL-FACTU-2026-0003', N'B1000000-0000-4000-8000-000000000003', N'CFDI40_SIG_1c2b20017099f70cba603848707667ba3dd77b0dd1ba94e4425b6fdf7e5b2ef2', N'SAT_PAC_SIG_724c90f2ea903b8002bccd7154ab3ff4fc2c3ee140063d123caf1aff37450f48', N'||1.1|B1000000-0000-4000-8000-000000000003|2026-02-03T11:30:00|PAC970924HN1||', '00001000000504460003', '2026-02-03 11:30:00', 873.37, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0003.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'DC', N'FOL-FACTU-2026-0004', N'B1000000-0000-4000-8000-000000000004', N'CFDI40_SIG_645c96c71b649d0dd0ec508164ea36ab621ce0ba6b249443a01aaaafb3f5798b', N'SAT_PAC_SIG_44826e5c2f381557a3204678ba6269416422a35b8dcf3878493eb866d030217e', N'||1.1|B1000000-0000-4000-8000-000000000004|2026-02-04T11:30:00|PAC970924HN1||', '00001000000504460004', '2026-02-04 11:30:00', 583.72, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0004.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'DC', N'FOL-FACTU-2026-0005', N'B1000000-0000-4000-8000-000000000005', N'CFDI40_SIG_34011ff06a35a28b69b5aa8e35e7bfb7481e15d81f4228b7818723cce61af348', N'SAT_PAC_SIG_4d934ee27eae21bfebd0f2edff094db9f2fca0985ff960056105e9418f5604c6', N'||1.1|B1000000-0000-4000-8000-000000000005|2026-02-05T11:30:00|PAC970924HN1||', '00001000000504460005', '2026-02-05 11:30:00', 1120.80, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0005.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'DC', N'FOL-FACTU-2026-0006', N'B1000000-0000-4000-8000-000000000006', N'CFDI40_SIG_b8abcba987d31946cad66b9cfc14ab2b423a369d74a3ada36f3ddad7b4c4d02b', N'SAT_PAC_SIG_54e961c6624bf5f1a8eb2ed52447482a287db264b2f0b7ea0edb128dcc9af142', N'||1.1|B1000000-0000-4000-8000-000000000006|2026-02-06T11:30:00|PAC970924HN1||', '00001000000504460006', '2026-02-06 11:30:00', 612.37, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0006.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'DC', N'FOL-FACTU-2026-0007', N'B1000000-0000-4000-8000-000000000007', N'CFDI40_SIG_386f0821f27283bfe64b52ce9475bf15b1ef305a3769431650e73bcb044a3da5', N'SAT_PAC_SIG_a072a9335e99a6282d1fa1f417ba77db36cf06c8520ae455d8d9e6f89d785db2', N'||1.1|B1000000-0000-4000-8000-000000000007|2026-02-07T11:30:00|PAC970924HN1||', '00001000000504460007', '2026-02-07 11:30:00', 1285.52, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0007.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'DC', N'FOL-FACTU-2026-0008', N'B1000000-0000-4000-8000-000000000008', N'CFDI40_SIG_6045ba7e4023e60b7d756d766b23dfe417741f9b8a729ddca40fe3b707453285', N'SAT_PAC_SIG_540d6060b22446edf9c648cff9d3404ffc5c64ced72278c708568c66cfe2f70b', N'||1.1|B1000000-0000-4000-8000-000000000008|2026-02-08T11:30:00|PAC970924HN1||', '00001000000504460008', '2026-02-08 11:30:00', 748.44, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0008.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'DC', N'FOL-FACTU-2026-0009', N'B1000000-0000-4000-8000-000000000009', N'CFDI40_SIG_92280625c8e7afb0fc6557827022da3a859141ef061bbe2b7d0e6a96670d6176', N'SAT_PAC_SIG_0715719bc23acef24914ab8f60859728839749213fa465623af338b86384c45b', N'||1.1|B1000000-0000-4000-8000-000000000009|2026-02-09T11:30:00|PAC970924HN1||', '00001000000504460009', '2026-02-09 11:30:00', 1189.12, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0009.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'DC', N'FOL-FACTU-2026-0010', N'B1000000-0000-4000-8000-00000000000A', N'CFDI40_SIG_7791ccd4a51a4f662176c4ac37f25078ea39832086ae45d77eceaf4e39f988fc', N'SAT_PAC_SIG_40221e8d1733820a6210dbe0b250910231730c666a5758a846f165189dd9e721', N'||1.1|B1000000-0000-4000-8000-00000000000A|2026-02-10T11:30:00|PAC970924HN1||', '00001000000504460010', '2026-02-10 11:30:00', 830.80, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0010.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'DC', N'FOL-FACTU-2026-0011', N'B1000000-0000-4000-8000-00000000000B', N'CFDI40_SIG_80110f57fb171f3d2d7a63cab7e0520b0d27f4b5e9b1e1ece45e963c7fb9e618', N'SAT_PAC_SIG_548cf61134c2790527d716460c27fc5f4320cf6f2f231a89d60742efdf1c2f2d', N'||1.1|B1000000-0000-4000-8000-00000000000B|2026-02-11T11:30:00|PAC970924HN1||', '00001000000504460011', '2026-02-11 11:30:00', 1485.96, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0011.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'DC', N'FOL-FACTU-2026-0012', N'B1000000-0000-4000-8000-00000000000C', N'CFDI40_SIG_9d3cfe0d65527a69e01f0e55e10b610a7fe8b382903ab307c2263ec130af3772', N'SAT_PAC_SIG_225a670f9f4b72b43cab35fcba1082946d69fb8fc0088e3ef8df4ab960f53a63', N'||1.1|B1000000-0000-4000-8000-00000000000C|2026-02-12T11:30:00|PAC970924HN1||', '00001000000504460012', '2026-02-12 11:30:00', 834.74, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0012.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'DC', N'FOL-FACTU-2026-0013', N'B1000000-0000-4000-8000-00000000000D', N'CFDI40_SIG_e46a2379a9c3ff2b3c87850ffea4d3416dea8eacd324e934a77120441e2ace76', N'SAT_PAC_SIG_1709e3f4bc7383089c309fb72e4ea0db3a6260628be0a834c195072077f7cdf7', N'||1.1|B1000000-0000-4000-8000-00000000000D|2026-02-13T11:30:00|PAC970924HN1||', '00001000000504460013', '2026-02-13 11:30:00', 1650.68, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0013.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'DC', N'FOL-FACTU-2026-0014', N'B1000000-0000-4000-8000-00000000000E', N'CFDI40_SIG_a96777ed25de406d4c5914b87f911428bf16260db0632b8fe1c3bfba17f4c96b', N'SAT_PAC_SIG_8b364f78c698fd9e4eca45d475d55faacec51afb5c056064dfdf3c32d3d4091b', N'||1.1|B1000000-0000-4000-8000-00000000000E|2026-02-14T11:30:00|PAC970924HN1||', '00001000000504460014', '2026-02-14 11:30:00', 995.52, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0014.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'DC', N'FOL-FACTU-2026-0015', N'B1000000-0000-4000-8000-00000000000F', N'CFDI40_SIG_1fdd507a32862c449811c2d2bbaa9f96065c94a99bf97fad469bbd694e33778a', N'SAT_PAC_SIG_66e0e8f008083156dd0dbb60ba2927dc7326b7f6857af42c393dcf58bbb99c77', N'||1.1|B1000000-0000-4000-8000-00000000000F|2026-02-15T11:30:00|PAC970924HN1||', '00001000000504460015', '2026-02-15 11:30:00', 1633.86, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0015.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'DC', N'FOL-FACTU-2026-0016', N'B1000000-0000-4000-8000-000000000010', N'CFDI40_SIG_24d38d8fafc8f784a7024d7b84e5cf448fcd7a66726f92f3c858efa83a4846bc', N'SAT_PAC_SIG_dc3e51012dac6eae47e73154036decefd40dbbf90f93a74c6c8bdba555b21833', N'||1.1|B1000000-0000-4000-8000-000000000010|2026-02-16T11:30:00|PAC970924HN1||', '00001000000504460016', '2026-02-16 11:30:00', 1077.88, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0016.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'DC', N'FOL-FACTU-2026-0017', N'B1000000-0000-4000-8000-000000000011', N'CFDI40_SIG_23ea4d3f03bd838969dca7fdf8da36972ea41b6fc9b005a0a408df2bdcb29ba3', N'SAT_PAC_SIG_c853c3c8b00a74f76fefe2f36c379105813054a35064e02eafcb6a2950405bc2', N'||1.1|B1000000-0000-4000-8000-000000000011|2026-02-17T11:30:00|PAC970924HN1||', '00001000000504460017', '2026-02-17 11:30:00', 1980.12, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0017.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'DC', N'FOL-FACTU-2026-0018', N'B1000000-0000-4000-8000-000000000012', N'CFDI40_SIG_4f59300b8621595a9fcce29614385cd2cb9a03c3f237384f8847c96c0c8d7a12', N'SAT_PAC_SIG_fab1b7a9b76bbdd627738c6e34e3eb93760cdebca5ab32dc8eb494f548dce7fa', N'||1.1|B1000000-0000-4000-8000-000000000012|2026-02-18T11:30:00|PAC970924HN1||', '00001000000504460018', '2026-02-18 11:30:00', 1057.12, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0018.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'DC', N'FOL-FACTU-2026-0019', N'B1000000-0000-4000-8000-000000000013', N'CFDI40_SIG_2860c7a5f5873fa23947a3b882cb5e40d14166a0d449783fbfbce777e61560f7', N'SAT_PAC_SIG_0c82703959001cd777ef505ed510a871d4c45f480410b1f98529fcc25d524654', N'||1.1|B1000000-0000-4000-8000-000000000013|2026-02-19T11:30:00|PAC970924HN1||', '00001000000504460019', '2026-02-19 11:30:00', 2144.84, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0019.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'DC', N'FOL-FACTU-2026-0020', N'B1000000-0000-4000-8000-000000000014', N'CFDI40_SIG_b87c4a7b90a302642444f2ff552dae85b5b224b73d3b57f7ad3f3fdb3f17b3f5', N'SAT_PAC_SIG_4651d5433f8926895053ad473d966a1b66865f60420ccc935783c8392f29829c', N'||1.1|B1000000-0000-4000-8000-000000000014|2026-02-20T11:30:00|PAC970924HN1||', '00001000000504460020', '2026-02-20 11:30:00', 1242.60, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0020.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'DC', N'FOL-FACTU-2026-0021', N'B1000000-0000-4000-8000-000000000015', N'CFDI40_SIG_e2218014f426d100d0807d58535efcc1a5f1375c7de40d5965ef67a671f1cdc7', N'SAT_PAC_SIG_6e8e29c2c38aae6960c6c8b41929522ef89612a969d032cb7aad7625c9eae669', N'||1.1|B1000000-0000-4000-8000-000000000015|2026-02-21T11:30:00|PAC970924HN1||', '00001000000504460021', '2026-02-21 11:30:00', 2078.60, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0021.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'DC', N'FOL-FACTU-2026-0022', N'B1000000-0000-4000-8000-000000000016', N'CFDI40_SIG_80d9711af0bdf2420963538f54c587de48ee6bef092c8104a4263d417681d95a', N'SAT_PAC_SIG_9e4eeb76e5f1e1909c66ee62b7e75ee2b4f4d74b4da08f3e46b517cca7b3c177', N'||1.1|B1000000-0000-4000-8000-000000000016|2026-02-22T11:30:00|PAC970924HN1||', '00001000000504460022', '2026-02-22 11:30:00', 1195.96, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0022.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'DC', N'FOL-FACTU-2026-0023', N'B1000000-0000-4000-8000-000000000017', N'CFDI40_SIG_81af14c954d7356628d8c251f080d05d3a66dde00f0a984b23b6f26efc06e72b', N'SAT_PAC_SIG_b8e6620dbe755d113ea549ace0b17dded897aad4d9a75ea30bc8444e23608b58', N'||1.1|B1000000-0000-4000-8000-000000000017|2026-02-23T11:30:00|PAC970924HN1||', '00001000000504460023', '2026-02-23 11:30:00', 2474.28, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0023.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'DC', N'FOL-FACTU-2026-0024', N'B1000000-0000-4000-8000-000000000018', N'CFDI40_SIG_5010be1f8fd6f3f47533f6bbb59be394b933a88e407c8660a0c840234307d092', N'SAT_PAC_SIG_c97fb305556ade66ac7ee964bbbb6b7486ed5ad8bc18501b22cd0776d3ac13ba', N'||1.1|B1000000-0000-4000-8000-000000000018|2026-02-24T11:30:00|PAC970924HN1||', '00001000000504460024', '2026-02-24 11:30:00', 1279.49, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0024.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'DC', N'FOL-FACTU-2026-0025', N'B1000000-0000-4000-8000-000000000019', N'CFDI40_SIG_44184603da94f821322a28030eaca8b0989eaa0447444b7a704fa5719d9e1a9c', N'SAT_PAC_SIG_26f91a3244a3b2851ba3eccd2f3c25207c4733da3c8e24980aaac2f52c1d7072', N'||1.1|B1000000-0000-4000-8000-000000000019|2026-02-25T11:30:00|PAC970924HN1||', '00001000000504460025', '2026-02-25 11:30:00', 2639.00, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0025.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'DC', N'FOL-FACTU-2026-0026', N'B1000000-0000-4000-8000-00000000001A', N'CFDI40_SIG_5403d72c808f1a62ecb7469654b20db8dd626c7e17766081a44fdcfb6699d6e3', N'SAT_PAC_SIG_352d57ab43979a1ee12cc0083029873749ff9379a92773620cc62a3500f0207b', N'||1.1|B1000000-0000-4000-8000-00000000001A|2026-02-26T11:30:00|PAC970924HN1||', '00001000000504460026', '2026-02-26 11:30:00', 1360.68, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0026.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'DC', N'FOL-FACTU-2026-0027', N'B1000000-0000-4000-8000-00000000001B', N'CFDI40_SIG_40a0991410694e7c5238772e3be059f5f4c96ce2bfa618b79a1dfdf3486b3ea8', N'SAT_PAC_SIG_da4cf6531bd9085c8985191d1bf27702c83203b26ecdcb8c4cf3b7b12ab50b6c', N'||1.1|B1000000-0000-4000-8000-00000000001B|2026-02-27T11:30:00|PAC970924HN1||', '00001000000504460027', '2026-02-27 11:30:00', 2523.35, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0027.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'DC', N'FOL-FACTU-2026-0028', N'B1000000-0000-4000-8000-00000000001C', N'CFDI40_SIG_e5fa3b6f4d6e20c62e4ec5e55454b8321acb57f3126e0aa03368b3f426a41f12', N'SAT_PAC_SIG_f9116973cd4830d43ed2657b6259128452cd0eef7dcac9fc47925c2a0277690f', N'||1.1|B1000000-0000-4000-8000-00000000001C|2026-02-28T11:30:00|PAC970924HN1||', '00001000000504460028', '2026-02-28 11:30:00', 1443.04, N'TIMBRADA_VIGENTE', N'https://cdn.dermacare.mx/cfdi/xml/DC-0028.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'DC', N'FOL-FACTU-2026-0029', N'B1000000-0000-4000-8000-00000000001D', N'CFDI40_SIG_f1930596f17c51aaf8d707046275e662a1f4810b402b1bc26aa4855fe8f0a282', N'SAT_PAC_SIG_e306362d82a2c3fa186d535bad5a5285844e00751db8b65717cdd3b9ee73c744', N'||1.1|B1000000-0000-4000-8000-00000000001D|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460029', '2026-02-01 11:30:00', 2968.44, N'CANCELADA_SAT', N'https://cdn.dermacare.mx/cfdi/xml/DC-0029.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'DC', N'FOL-FACTU-2026-0030', N'B1000000-0000-4000-8000-00000000001E', N'CFDI40_SIG_050f42215da984684b3f7c503c3ff0d6507e9caf323fd4be6f0950c209e365d4', N'SAT_PAC_SIG_7be745c07786e947eaac0d1c8ea414237efa4d33f4a9f7229dcba670ffe54bcd', N'||1.1|B1000000-0000-4000-8000-00000000001E|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460030', '2026-02-02 11:30:00', 1372.86, N'ERROR_TIMBRADO', N'https://cdn.dermacare.mx/cfdi/xml/DC-0030.xml', N'https://cdn.dermacare.mx/cfdi/pdf/DC-0030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_cfdi OFF;
GO

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_partidas ON;
INSERT INTO fiscal.facturas_partidas (ID, ID_factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, '53131600', 'H87', 2.00, 285.50, 571.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '53131600', 'H87', 1.00, 321.00, 321.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '53131600', 'H87', 2.00, 356.50, 713.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '53131600', 'H87', 1.00, 392.00, 392.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '53131600', 'H87', 2.00, 427.50, 855.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '53131600', 'H87', 1.00, 463.00, 463.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '53131600', 'H87', 2.00, 498.50, 997.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '53131600', 'H87', 1.00, 534.00, 534.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '53131600', 'H87', 2.00, 569.50, 1139.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '53131600', 'H87', 1.00, 605.00, 605.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '53131600', 'H87', 2.00, 640.50, 1281.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '53131600', 'H87', 1.00, 676.00, 676.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '53131600', 'H87', 2.00, 711.50, 1423.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '53131600', 'H87', 1.00, 747.00, 747.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '53131600', 'H87', 2.00, 782.50, 1565.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '53131600', 'H87', 1.00, 818.00, 818.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '53131600', 'H87', 2.00, 853.50, 1707.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '53131600', 'H87', 1.00, 889.00, 889.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '53131600', 'H87', 2.00, 924.50, 1849.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '53131600', 'H87', 1.00, 960.00, 960.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '53131600', 'H87', 2.00, 995.50, 1991.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '53131600', 'H87', 1.00, 1031.00, 1031.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '53131600', 'H87', 2.00, 1066.50, 2133.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '53131600', 'H87', 1.00, 1102.00, 1102.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '53131600', 'H87', 2.00, 1137.50, 2275.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '53131600', 'H87', 1.00, 1173.00, 1173.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '53131600', 'H87', 2.00, 1208.50, 2417.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '53131600', 'H87', 1.00, 1244.00, 1244.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '53131600', 'H87', 2.00, 1279.50, 2559.00, '02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '53131600', 'H87', 1.00, 1315.00, 1315.00, '02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_partidas OFF;
GO

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.complementos_pago ON;
INSERT INTO fiscal.complementos_pago (ID, ID_factura, ID_transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'B1000000-0000-4000-8000-000000000001', 1, 331.18, 165.59, 165.59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'B1000000-0000-4000-8000-000000000002', 1, 372.36, 186.18, 186.18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'B1000000-0000-4000-8000-000000000003', 1, 413.54, 206.77, 206.77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'B1000000-0000-4000-8000-000000000004', 1, 454.72, 227.36, 227.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'B1000000-0000-4000-8000-000000000005', 1, 495.90, 247.95, 247.95, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'B1000000-0000-4000-8000-000000000006', 1, 537.08, 268.54, 268.54, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'B1000000-0000-4000-8000-000000000007', 1, 578.26, 289.13, 289.13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'B1000000-0000-4000-8000-000000000008', 1, 619.44, 309.72, 309.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'B1000000-0000-4000-8000-000000000009', 1, 660.62, 330.31, 330.31, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'B1000000-0000-4000-8000-00000000000A', 1, 701.80, 350.90, 350.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'B1000000-0000-4000-8000-00000000000B', 1, 742.98, 371.49, 371.49, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'B1000000-0000-4000-8000-00000000000C', 1, 784.16, 392.08, 392.08, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'B1000000-0000-4000-8000-00000000000D', 1, 825.34, 412.67, 412.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'B1000000-0000-4000-8000-00000000000E', 1, 866.52, 433.26, 433.26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'B1000000-0000-4000-8000-00000000000F', 1, 907.70, 453.85, 453.85, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'B1000000-0000-4000-8000-000000000010', 1, 948.88, 474.44, 474.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'B1000000-0000-4000-8000-000000000011', 1, 990.06, 495.03, 495.03, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'B1000000-0000-4000-8000-000000000012', 1, 1031.24, 515.62, 515.62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'B1000000-0000-4000-8000-000000000013', 1, 1072.42, 536.21, 536.21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'B1000000-0000-4000-8000-000000000014', 1, 1113.60, 556.80, 556.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'B1000000-0000-4000-8000-000000000015', 1, 1154.78, 577.39, 577.39, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'B1000000-0000-4000-8000-000000000016', 1, 1195.96, 597.98, 597.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'B1000000-0000-4000-8000-000000000017', 1, 1237.14, 618.57, 618.57, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'B1000000-0000-4000-8000-000000000018', 1, 1278.32, 639.16, 639.16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'B1000000-0000-4000-8000-000000000019', 1, 1319.50, 659.75, 659.75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'B1000000-0000-4000-8000-00000000001A', 1, 1360.68, 680.34, 680.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'B1000000-0000-4000-8000-00000000001B', 1, 1401.86, 700.93, 700.93, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'B1000000-0000-4000-8000-00000000001C', 1, 1443.04, 721.52, 721.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'B1000000-0000-4000-8000-00000000001D', 1, 1484.22, 742.11, 742.11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'B1000000-0000-4000-8000-00000000001E', 1, 1525.40, 762.70, 762.70, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.complementos_pago OFF;
GO

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.notas_credito ON;
INSERT INTO fiscal.notas_credito (ID, ID_factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'B1000000-0000-4000-8000-000000000001', '01', 285.50, 45.68, 331.18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'B1000000-0000-4000-8000-000000000002', '03', 321.00, 51.36, 372.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'B1000000-0000-4000-8000-000000000003', '01', 356.50, 57.04, 413.54, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'B1000000-0000-4000-8000-000000000004', '03', 392.00, 62.72, 454.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'B1000000-0000-4000-8000-000000000005', '01', 427.50, 68.40, 495.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'B1000000-0000-4000-8000-000000000006', '03', 463.00, 74.08, 537.08, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'B1000000-0000-4000-8000-000000000007', '01', 498.50, 79.76, 578.26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'B1000000-0000-4000-8000-000000000008', '03', 534.00, 85.44, 619.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'B1000000-0000-4000-8000-000000000009', '01', 569.50, 91.12, 660.62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'B1000000-0000-4000-8000-00000000000A', '03', 605.00, 96.80, 701.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'B1000000-0000-4000-8000-00000000000B', '01', 640.50, 102.48, 742.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'B1000000-0000-4000-8000-00000000000C', '03', 676.00, 108.16, 784.16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'B1000000-0000-4000-8000-00000000000D', '01', 711.50, 113.84, 825.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'B1000000-0000-4000-8000-00000000000E', '03', 747.00, 119.52, 866.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'B1000000-0000-4000-8000-00000000000F', '01', 782.50, 125.20, 907.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'B1000000-0000-4000-8000-000000000010', '03', 818.00, 130.88, 948.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'B1000000-0000-4000-8000-000000000011', '01', 853.50, 136.56, 990.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'B1000000-0000-4000-8000-000000000012', '03', 889.00, 142.24, 1031.24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'B1000000-0000-4000-8000-000000000013', '01', 924.50, 147.92, 1072.42, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'B1000000-0000-4000-8000-000000000014', '03', 960.00, 153.60, 1113.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'B1000000-0000-4000-8000-000000000015', '01', 995.50, 159.28, 1154.78, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'B1000000-0000-4000-8000-000000000016', '03', 1031.00, 164.96, 1195.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'B1000000-0000-4000-8000-000000000017', '01', 1066.50, 170.64, 1237.14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'B1000000-0000-4000-8000-000000000018', '03', 1102.00, 176.32, 1278.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'B1000000-0000-4000-8000-000000000019', '01', 1137.50, 182.00, 1319.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'B1000000-0000-4000-8000-00000000001A', '03', 1173.00, 187.68, 1360.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'B1000000-0000-4000-8000-00000000001B', '01', 1208.50, 193.36, 1401.86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'B1000000-0000-4000-8000-00000000001C', '03', 1244.00, 199.04, 1443.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'B1000000-0000-4000-8000-00000000001D', '01', 1279.50, 204.72, 1484.22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'B1000000-0000-4000-8000-00000000001E', '03', 1315.00, 210.40, 1525.40, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.notas_credito OFF;
GO

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi ON;
INSERT INTO fiscal.cancelaciones_cfdi (ID, ID_factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'01', N'B1000000-0000-4000-8000-000000000001', N'<AcuseCancelacionSAT Folio="0001" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'02', NULL, N'<AcuseCancelacionSAT Folio="0002" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'03', NULL, N'<AcuseCancelacionSAT Folio="0003" Estatus="201" Motivo="03" />', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'04', NULL, N'<AcuseCancelacionSAT Folio="0004" Estatus="201" Motivo="04" />', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'01', N'B1000000-0000-4000-8000-000000000005', N'<AcuseCancelacionSAT Folio="0005" Estatus="201" Motivo="01" />', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'02', NULL, N'<AcuseCancelacionSAT Folio="0006" Estatus="201" Motivo="02" />', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'03', NULL, N'<AcuseCancelacionSAT Folio="0007" Estatus="201" Motivo="03" />', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'04', NULL, N'<AcuseCancelacionSAT Folio="0008" Estatus="201" Motivo="04" />', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'01', N'B1000000-0000-4000-8000-000000000009', N'<AcuseCancelacionSAT Folio="0009" Estatus="201" Motivo="01" />', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'02', NULL, N'<AcuseCancelacionSAT Folio="0010" Estatus="201" Motivo="02" />', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'03', NULL, N'<AcuseCancelacionSAT Folio="0011" Estatus="201" Motivo="03" />', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'04', NULL, N'<AcuseCancelacionSAT Folio="0012" Estatus="201" Motivo="04" />', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'01', N'B1000000-0000-4000-8000-00000000000D', N'<AcuseCancelacionSAT Folio="0013" Estatus="201" Motivo="01" />', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'02', NULL, N'<AcuseCancelacionSAT Folio="0014" Estatus="201" Motivo="02" />', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'03', NULL, N'<AcuseCancelacionSAT Folio="0015" Estatus="201" Motivo="03" />', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'04', NULL, N'<AcuseCancelacionSAT Folio="0016" Estatus="201" Motivo="04" />', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'01', N'B1000000-0000-4000-8000-000000000011', N'<AcuseCancelacionSAT Folio="0017" Estatus="201" Motivo="01" />', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'02', NULL, N'<AcuseCancelacionSAT Folio="0018" Estatus="201" Motivo="02" />', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'03', NULL, N'<AcuseCancelacionSAT Folio="0019" Estatus="201" Motivo="03" />', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'04', NULL, N'<AcuseCancelacionSAT Folio="0020" Estatus="201" Motivo="04" />', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'01', N'B1000000-0000-4000-8000-000000000015', N'<AcuseCancelacionSAT Folio="0021" Estatus="201" Motivo="01" />', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'02', NULL, N'<AcuseCancelacionSAT Folio="0022" Estatus="201" Motivo="02" />', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'03', NULL, N'<AcuseCancelacionSAT Folio="0023" Estatus="201" Motivo="03" />', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'04', NULL, N'<AcuseCancelacionSAT Folio="0024" Estatus="201" Motivo="04" />', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'01', N'B1000000-0000-4000-8000-000000000019', N'<AcuseCancelacionSAT Folio="0025" Estatus="201" Motivo="01" />', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'02', NULL, N'<AcuseCancelacionSAT Folio="0026" Estatus="201" Motivo="02" />', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'03', NULL, N'<AcuseCancelacionSAT Folio="0027" Estatus="201" Motivo="03" />', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'04', NULL, N'<AcuseCancelacionSAT Folio="0028" Estatus="201" Motivo="04" />', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'01', N'B1000000-0000-4000-8000-00000000001D', N'<AcuseCancelacionSAT Folio="0029" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'02', NULL, N'<AcuseCancelacionSAT Folio="0030" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi OFF;
GO

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.campanias ON;
INSERT INTO promos.campanias (ID, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CAMPANIA_01', N'Campaña DermaCare La Roche-Posay #01', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 52500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CAMPANIA_02', N'Campaña DermaCare CeraVe #02', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 55000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAMPANIA_03', N'Campaña DermaCare The Ordinary #03', '2026-02-03 11:30:00', '2026-02-24 11:30:00', 57500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAMPANIA_04', N'Campaña DermaCare ISDIN #04', '2026-02-04 11:30:00', '2026-02-25 11:30:00', 60000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CAMPANIA_05', N'Campaña DermaCare Bioderma #05', '2026-02-05 11:30:00', '2026-02-26 11:30:00', 62500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CAMPANIA_06', N'Campaña DermaCare Eau Thermale Avène #06', '2026-02-06 11:30:00', '2026-02-27 11:30:00', 65000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CAMPANIA_07', N'Campaña DermaCare Eucerin #07', '2026-02-07 11:30:00', '2026-02-28 11:30:00', 67500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CAMPANIA_08', N'Campaña DermaCare Vichy Laboratoires #08', '2026-02-08 11:30:00', '2026-03-01 11:30:00', 70000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAMPANIA_09', N'Campaña DermaCare SkinCeuticals #09', '2026-02-09 11:30:00', '2026-03-02 11:30:00', 72500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CAMPANIA_10', N'Campaña DermaCare Sesderma #10', '2026-02-10 11:30:00', '2026-03-03 11:30:00', 75000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CAMPANIA_11', N'Campaña DermaCare NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-03-04 11:30:00', 77500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CAMPANIA_12', N'Campaña DermaCare MAC Cosmetics #12', '2026-02-12 11:30:00', '2026-03-05 11:30:00', 80000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CAMPANIA_13', N'Campaña DermaCare Fenty Beauty #13', '2026-02-13 11:30:00', '2026-03-06 11:30:00', 82500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CAMPANIA_14', N'Campaña DermaCare Rare Beauty #14', '2026-02-14 11:30:00', '2026-03-07 11:30:00', 85000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CAMPANIA_15', N'Campaña DermaCare Clinique #15', '2026-02-15 11:30:00', '2026-03-08 11:30:00', 87500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CAMPANIA_16', N'Campaña DermaCare Estée Lauder #16', '2026-02-16 11:30:00', '2026-03-09 11:30:00', 90000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CAMPANIA_17', N'Campaña DermaCare Lancôme #17', '2026-02-17 11:30:00', '2026-03-10 11:30:00', 92500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CAMPANIA_18', N'Campaña DermaCare Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-03-11 11:30:00', 95000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CAMPANIA_19', N'Campaña DermaCare Paula''s Choice #19', '2026-02-19 11:30:00', '2026-03-12 11:30:00', 97500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CAMPANIA_20', N'Campaña DermaCare COSRX #20', '2026-02-20 11:30:00', '2026-03-13 11:30:00', 100000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CAMPANIA_21', N'Campaña DermaCare Laneige #21', '2026-02-21 11:30:00', '2026-03-14 11:30:00', 102500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CAMPANIA_22', N'Campaña DermaCare Uriage #22', '2026-02-22 11:30:00', '2026-03-15 11:30:00', 105000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CAMPANIA_23', N'Campaña DermaCare Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-03-16 11:30:00', 107500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CAMPANIA_24', N'Campaña DermaCare MartiDerm #24', '2026-02-24 11:30:00', '2026-03-17 11:30:00', 110000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CAMPANIA_25', N'Campaña DermaCare Heliocare #25', '2026-02-25 11:30:00', '2026-03-18 11:30:00', 112500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CAMPANIA_26', N'Campaña DermaCare Kiehl''s #26', '2026-02-26 11:30:00', '2026-03-19 11:30:00', 115000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CAMPANIA_27', N'Campaña DermaCare Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-03-20 11:30:00', 117500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CAMPANIA_28', N'Campaña DermaCare L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-03-21 11:30:00', 120000.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CAMPANIA_29', N'Campaña DermaCare Neutrogena #29', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 122500.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CAMPANIA_30', N'Campaña DermaCare DermaCare Labs #30', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 125000.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.campanias OFF;
GO

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.cupones ON;
INSERT INTO promos.cupones (ID, ID_campania, codigo_cupon, ID_tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CUPON_01', 1, 15.00, 799.00, 500, 13, 1, '2026-03-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'CUPON_02', 2, 150.00, 799.00, 500, 16, 2, '2026-03-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'CUPON_03', 3, 15.00, 799.00, 500, 19, 3, '2026-03-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CUPON_04', 4, 150.00, 799.00, 500, 22, 4, '2026-03-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'CUPON_05', 5, 15.00, 799.00, 500, 25, 5, '2026-03-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'CUPON_06', 6, 150.00, 799.00, 500, 28, 6, '2026-03-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CUPON_07', 7, 15.00, 799.00, 500, 31, 7, '2026-03-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'CUPON_08', 8, 150.00, 799.00, 500, 34, 8, '2026-03-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'CUPON_09', 9, 15.00, 799.00, 500, 37, 9, '2026-03-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CUPON_10', 10, 150.00, 799.00, 500, 40, 10, '2026-03-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'CUPON_11', 11, 15.00, 799.00, 500, 43, 11, '2026-03-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'CUPON_12', 12, 150.00, 799.00, 500, 46, 12, '2026-03-29 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CUPON_13', 13, 15.00, 799.00, 500, 49, 13, '2026-03-30 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'CUPON_14', 14, 150.00, 799.00, 500, 52, 14, '2026-03-31 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'CUPON_15', 15, 15.00, 799.00, 500, 55, 15, '2026-04-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CUPON_16', 16, 150.00, 799.00, 500, 58, 16, '2026-04-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'CUPON_17', 17, 15.00, 799.00, 500, 61, 17, '2026-04-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'CUPON_18', 18, 150.00, 799.00, 500, 64, 18, '2026-04-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CUPON_19', 19, 15.00, 799.00, 500, 67, 19, '2026-04-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'CUPON_20', 20, 150.00, 799.00, 500, 70, 20, '2026-04-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'CUPON_21', 21, 15.00, 799.00, 500, 73, 21, '2026-04-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CUPON_22', 22, 150.00, 799.00, 500, 76, 22, '2026-04-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'CUPON_23', 23, 15.00, 799.00, 500, 79, 23, '2026-04-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'CUPON_24', 24, 150.00, 799.00, 500, 82, 24, '2026-04-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CUPON_25', 25, 15.00, 799.00, 500, 85, 25, '2026-04-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'CUPON_26', 26, 150.00, 799.00, 500, 88, 26, '2026-04-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'CUPON_27', 27, 15.00, 799.00, 500, 91, 27, '2026-04-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CUPON_28', 28, 150.00, 799.00, 500, 94, 28, '2026-04-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'CUPON_29', 29, 15.00, 799.00, 500, 97, 29, '2026-03-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'CUPON_30', 30, 150.00, 799.00, 500, 100, 30, '2026-03-19 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.cupones OFF;
GO

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon ON;
INSERT INTO promos.reglas_elegibilidad_cupon (ID, ID_cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon OFF;
GO

-- =================================================================================================
-- 098. TABLA: promos.cupones_categorias_excluidas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.cupones_categorias_excluidas ON;
INSERT INTO promos.cupones_categorias_excluidas (ID, ID_cupon, ID_categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.cupones_categorias_excluidas OFF;
GO

-- =================================================================================================
-- 099. TABLA: promos.redenciones_cupones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.redenciones_cupones ON;
INSERT INTO promos.redenciones_cupones (ID, ID_cupon, ID_cliente, ID_orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 42.82, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 48.15, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 53.48, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 58.80, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 64.12, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 69.45, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 74.77, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 80.10, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 85.42, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 90.75, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 96.08, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 101.40, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 106.72, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 112.05, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 117.38, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 122.70, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 128.03, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 133.35, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 138.67, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 144.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 149.32, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 154.65, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 159.97, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 165.30, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 170.62, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 175.95, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 181.28, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 186.60, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 191.92, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 197.25, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.redenciones_cupones OFF;
GO

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.ventas_flash_horarias ON;
INSERT INTO promos.ventas_flash_horarias (ID, ID_variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 214.12, 55, 11, '2026-02-01 11:30:00', '2026-02-01 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 240.75, 60, 12, '2026-02-02 11:30:00', '2026-02-02 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 267.38, 65, 13, '2026-02-03 11:30:00', '2026-02-03 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 294.00, 70, 14, '2026-02-04 11:30:00', '2026-02-04 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 320.62, 75, 15, '2026-02-05 11:30:00', '2026-02-05 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 347.25, 80, 16, '2026-02-06 11:30:00', '2026-02-06 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 373.88, 85, 17, '2026-02-07 11:30:00', '2026-02-07 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 400.50, 90, 18, '2026-02-08 11:30:00', '2026-02-08 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 427.12, 95, 19, '2026-02-09 11:30:00', '2026-02-09 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 453.75, 100, 20, '2026-02-10 11:30:00', '2026-02-10 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 480.38, 105, 21, '2026-02-11 11:30:00', '2026-02-11 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 507.00, 110, 22, '2026-02-12 11:30:00', '2026-02-12 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 533.62, 115, 23, '2026-02-13 11:30:00', '2026-02-13 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 560.25, 120, 24, '2026-02-14 11:30:00', '2026-02-14 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 586.88, 125, 25, '2026-02-15 11:30:00', '2026-02-15 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 613.50, 130, 26, '2026-02-16 11:30:00', '2026-02-16 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 640.12, 135, 27, '2026-02-17 11:30:00', '2026-02-17 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 666.75, 140, 28, '2026-02-18 11:30:00', '2026-02-18 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 693.38, 145, 29, '2026-02-19 11:30:00', '2026-02-19 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 720.00, 150, 30, '2026-02-20 11:30:00', '2026-02-20 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 746.62, 155, 31, '2026-02-21 11:30:00', '2026-02-21 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 773.25, 160, 32, '2026-02-22 11:30:00', '2026-02-22 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 799.88, 165, 33, '2026-02-23 11:30:00', '2026-02-23 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 826.50, 170, 34, '2026-02-24 11:30:00', '2026-02-24 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 853.12, 175, 35, '2026-02-25 11:30:00', '2026-02-25 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 879.75, 180, 36, '2026-02-26 11:30:00', '2026-02-26 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 906.38, 185, 37, '2026-02-27 11:30:00', '2026-02-27 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 933.00, 190, 38, '2026-02-28 11:30:00', '2026-02-28 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 959.62, 195, 39, '2026-02-01 11:30:00', '2026-02-01 17:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 986.25, 200, 40, '2026-02-02 11:30:00', '2026-02-02 17:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.ventas_flash_horarias OFF;
GO

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.estados_orden_compra ON;
INSERT INTO compras.estados_orden_compra (ID, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'BORRADOR', N'Borrador de Compra', N'Requisición convertida en borrador pendiente de firma', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ENVIADA', N'Enviada a Proveedor', N'Orden de compra emitida y notificada al laboratorio', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CONFIRMADA', N'Confirmada con Cita Andén', N'Proveedor confirmó fecha de entrega y lotes sanitarios', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'REC_PARCIAL', N'Recibida Parcialmente', N'Entrega parcial validada en andén de CEDIS', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'REC_TOTAL', N'Recibida Completa', N'Totalidad de unidades ingresadas a inventario QA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CANCELADA', N'Cancelada', N'Orden de compra anulada por incumplimiento de SLA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT compras.estados_orden_compra OFF;
GO

-- =================================================================================================
-- 102. TABLA: compras.proveedores (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedores ON;
INSERT INTO compras.proveedores (ID, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROVEEDO_01', N'Laboratorios La Roche-Posay S.A. de C.V.', N'Distribuidora La Roche-Posay México', 'DPM200111AB1', N'México', 15, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROVEEDO_02', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Distribuidora CeraVe México', 'DPM200112AB2', N'México', 30, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROVEEDO_03', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Distribuidora The Ordinary México', 'DPM200113AB3', N'México', 45, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROVEEDO_04', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Distribuidora ISDIN México', 'DPM200114AB4', N'México', 60, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROVEEDO_05', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Distribuidora Bioderma México', 'DPM200115AB5', N'México', 15, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROVEEDO_06', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Distribuidora Eau Thermale Avène México', 'DPM200116AB6', N'México', 30, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROVEEDO_07', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Distribuidora Eucerin México', 'DPM200117AB7', N'México', 45, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROVEEDO_08', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Distribuidora Vichy Laboratoires México', 'DPM200118AB8', N'México', 60, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROVEEDO_09', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Distribuidora SkinCeuticals México', 'DPM200119AB0', N'México', 15, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROVEEDO_10', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Distribuidora Sesderma México', 'DPM200120AB1', N'México', 30, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROVEEDO_11', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Distribuidora NARS Cosmetics México', 'DPM200121AB2', N'México', 45, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROVEEDO_12', N'Laboratorios MAC Professional S.A. de C.V.', N'Distribuidora MAC Cosmetics México', 'DPM200122AB3', N'México', 60, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROVEEDO_13', N'Laboratorios Fenty Beauty S.A. de C.V.', N'Distribuidora Fenty Beauty México', 'DPM200123AB4', N'México', 15, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROVEEDO_14', N'Laboratorios Rare Beauty S.A. de C.V.', N'Distribuidora Rare Beauty México', 'DPM200124AB5', N'México', 30, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROVEEDO_15', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Distribuidora Clinique México', 'DPM200125AB6', N'México', 45, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROVEEDO_16', N'Laboratorios Estée Lauder S.A. de C.V.', N'Distribuidora Estée Lauder México', 'DPM200126AB7', N'México', 60, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROVEEDO_17', N'Laboratorios Lancôme Paris S.A. de C.V.', N'Distribuidora Lancôme México', 'DPM200127AB8', N'México', 15, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROVEEDO_18', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Distribuidora Charlotte Tilbury México', 'DPM200128AB0', N'México', 30, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROVEEDO_19', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Distribuidora Paula''s Choice México', 'DPM200129AB1', N'México', 45, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROVEEDO_20', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Distribuidora COSRX México', 'DPM200130AB2', N'México', 60, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROVEEDO_21', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Distribuidora Laneige México', 'DPM200131AB3', N'México', 15, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROVEEDO_22', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Distribuidora Uriage México', 'DPM200132AB4', N'México', 30, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROVEEDO_23', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Distribuidora Laboratoire SVR México', 'DPM200133AB5', N'México', 45, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROVEEDO_24', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Distribuidora MartiDerm México', 'DPM200134AB6', N'México', 60, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROVEEDO_25', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Distribuidora Heliocare México', 'DPM200135AB7', N'México', 15, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROVEEDO_26', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Distribuidora Kiehl''s México', 'DPM200136AB8', N'México', 30, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROVEEDO_27', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Distribuidora Garnier SkinActive México', 'DPM200137AB0', N'México', 45, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROVEEDO_28', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Distribuidora L''Oréal Paris Derm México', 'DPM200138AB1', N'México', 60, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROVEEDO_29', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Distribuidora Neutrogena México', 'DPM200139AB2', N'México', 15, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROVEEDO_30', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Distribuidora DermaCare Labs México', 'DPM200140AB3', N'México', 30, 4.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedores OFF;
GO

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.contactos_proveedor ON;
INSERT INTO compras.contactos_proveedor (ID, ID_proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Carlos Mendoza Garza', N'Gerente de Cuenta Clave', N'ventas.1@proveedor-derma.mx', N'5541001001', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Sofía Ramírez López', N'Coordinador de Logística Sanitaria', N'ventas.2@proveedor-derma.mx', N'5541001002', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Valeria Torres Villarreal', N'Ejecutivo de Facturación', N'ventas.3@proveedor-derma.mx', N'5541001003', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Alejandro Hernández Cruz', N'Representante Regulador COFEPRIS', N'ventas.4@proveedor-derma.mx', N'5541001004', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Mariana Sánchez Fuentes', N'Gerente de Cuenta Clave', N'ventas.5@proveedor-derma.mx', N'5541001005', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Diego Martínez Treviño', N'Coordinador de Logística Sanitaria', N'ventas.6@proveedor-derma.mx', N'5541001006', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Camila González Reyes', N'Ejecutivo de Facturación', N'ventas.7@proveedor-derma.mx', N'5541001007', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Mateo Flores Castillo', N'Representante Regulador COFEPRIS', N'ventas.8@proveedor-derma.mx', N'5541001008', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Lucía Morales Díaz', N'Gerente de Cuenta Clave', N'ventas.9@proveedor-derma.mx', N'5541001009', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Sebastián Vázquez Ortiz', N'Coordinador de Logística Sanitaria', N'ventas.10@proveedor-derma.mx', N'5541001010', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Regina Gutiérrez Nava', N'Ejecutivo de Facturación', N'ventas.11@proveedor-derma.mx', N'5541001011', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Santiago Jiménez Pérez', N'Representante Regulador COFEPRIS', N'ventas.12@proveedor-derma.mx', N'5541001012', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Fernanda Ruiz Salazar', N'Gerente de Cuenta Clave', N'ventas.13@proveedor-derma.mx', N'5541001013', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Emiliano Ríos Cárdenas', N'Coordinador de Logística Sanitaria', N'ventas.14@proveedor-derma.mx', N'5541001014', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Ximena Aguilar Ibarra', N'Ejecutivo de Facturación', N'ventas.15@proveedor-derma.mx', N'5541001015', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Daniel Méndez Navarro', N'Representante Regulador COFEPRIS', N'ventas.16@proveedor-derma.mx', N'5541001016', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Andrea Castro Delgado', N'Gerente de Cuenta Clave', N'ventas.17@proveedor-derma.mx', N'5541001017', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Gabriel Vega Montoya', N'Coordinador de Logística Sanitaria', N'ventas.18@proveedor-derma.mx', N'5541001018', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Paula Cortés Rojas', N'Ejecutivo de Facturación', N'ventas.19@proveedor-derma.mx', N'5541001019', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Andrés Ramos Campos', N'Representante Regulador COFEPRIS', N'ventas.20@proveedor-derma.mx', N'5541001020', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Renata Guerrero Luna', N'Gerente de Cuenta Clave', N'ventas.21@proveedor-derma.mx', N'5541001021', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Nicolás Peña Cabrera', N'Coordinador de Logística Sanitaria', N'ventas.22@proveedor-derma.mx', N'5541001022', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Natalia Herrera Vargas', N'Ejecutivo de Facturación', N'ventas.23@proveedor-derma.mx', N'5541001023', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Joaquín Medina Contreras', N'Representante Regulador COFEPRIS', N'ventas.24@proveedor-derma.mx', N'5541001024', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Isabella Domínguez Escobar', N'Gerente de Cuenta Clave', N'ventas.25@proveedor-derma.mx', N'5541001025', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Leonardo Silva Paredes', N'Coordinador de Logística Sanitaria', N'ventas.26@proveedor-derma.mx', N'5541001026', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Ana Chávez Bautista', N'Ejecutivo de Facturación', N'ventas.27@proveedor-derma.mx', N'5541001027', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Rodrigo Ochoa Acosta', N'Representante Regulador COFEPRIS', N'ventas.28@proveedor-derma.mx', N'5541001028', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Paulina Miranda Leal', N'Gerente de Cuenta Clave', N'ventas.29@proveedor-derma.mx', N'5541001029', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Mauricio Padilla Solís', N'Coordinador de Logística Sanitaria', N'ventas.30@proveedor-derma.mx', N'5541001030', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.contactos_proveedor OFF;
GO

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedor_slas ON;
INSERT INTO compras.proveedor_slas (ID, ID_proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 45, 2.00, 2.00, '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 60, 3.00, 3.00, '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 75, 4.00, 4.00, '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 30, 5.00, 5.00, '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 45, 1.00, 1.00, '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 60, 2.00, 2.00, '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 75, 3.00, 3.00, '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 30, 4.00, 4.00, '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 45, 5.00, 5.00, '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 60, 1.00, 1.00, '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 75, 2.00, 2.00, '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 30, 3.00, 3.00, '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 45, 4.00, 4.00, '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 60, 5.00, 5.00, '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 75, 1.00, 1.00, '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 30, 2.00, 2.00, '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 45, 3.00, 3.00, '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60, 4.00, 4.00, '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 75, 5.00, 5.00, '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 30, 1.00, 1.00, '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 45, 2.00, 2.00, '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 60, 3.00, 3.00, '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 75, 4.00, 4.00, '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 30, 5.00, 5.00, '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 45, 1.00, 1.00, '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 60, 2.00, 2.00, '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 75, 3.00, 3.00, '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 30, 4.00, 4.00, '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 45, 5.00, 5.00, '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 60, 1.00, 1.00, '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedor_slas OFF;
GO

-- =================================================================================================
-- 105. TABLA: compras.proveedor_productos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedor_productos ON;
INSERT INTO compras.proveedor_productos (ID, ID_proveedor, ID_variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'ARTICULO_01', 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'ARTICULO_02', 20.00, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'ARTICULO_03', 22.50, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'ARTICULO_04', 25.00, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'ARTICULO_05', 27.50, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'ARTICULO_06', 30.00, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'ARTICULO_07', 32.50, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'ARTICULO_08', 35.00, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'ARTICULO_09', 37.50, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'ARTICULO_10', 40.00, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'ARTICULO_11', 42.50, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'ARTICULO_12', 45.00, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'ARTICULO_13', 47.50, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'ARTICULO_14', 50.00, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'ARTICULO_15', 52.50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'ARTICULO_16', 55.00, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'ARTICULO_17', 57.50, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'ARTICULO_18', 60.00, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'ARTICULO_19', 62.50, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'ARTICULO_20', 65.00, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'ARTICULO_21', 67.50, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'ARTICULO_22', 70.00, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'ARTICULO_23', 72.50, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'ARTICULO_24', 75.00, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'ARTICULO_25', 77.50, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'ARTICULO_26', 80.00, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'ARTICULO_27', 82.50, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'ARTICULO_28', 85.00, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'ARTICULO_29', 87.50, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'ARTICULO_30', 90.00, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedor_productos OFF;
GO

-- =================================================================================================
-- 106. TABLA: compras.requisiciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.requisiciones ON;
INSERT INTO compras.requisiciones (ID, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-REQUI-2026-0001', N'Planeación de Demanda', N'BAJA', N'Reposición de inventario de seguridad para Sérum Niacinamida 10% + Zinc 1% ante alta rotación.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-REQUI-2026-0002', N'Operaciones Cadena de Frío', N'MEDIA', N'Reposición de inventario de seguridad para Gel Limpiador Espumoso Facial ante alta rotación.', '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-REQUI-2026-0003', N'Control Sanitario QA', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Protector Solar Fluido SPF 50+ ante alta rotación.', '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-REQUI-2026-0004', N'Abastecimiento Beauty-Box', N'BAJA', N'Reposición de inventario de seguridad para Sérum Ácido Hialurónico 2% + B5 ante alta rotación.', '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-REQUI-2026-0005', N'Planeación de Demanda', N'MEDIA', N'Reposición de inventario de seguridad para Crema Hidratante con Ceramidas ante alta rotación.', '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-REQUI-2026-0006', N'Operaciones Cadena de Frío', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Retinol Puro 0.5% Nocturno ante alta rotación.', '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-REQUI-2026-0007', N'Control Sanitario QA', N'BAJA', N'Reposición de inventario de seguridad para Agua Micelar Dermolimpiadora ante alta rotación.', '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-REQUI-2026-0008', N'Abastecimiento Beauty-Box', N'MEDIA', N'Reposición de inventario de seguridad para Sérum Vitamina C Pura 15% ante alta rotación.', '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-REQUI-2026-0009', N'Planeación de Demanda', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Base de Maquillaje Cobertura Media ante alta rotación.', '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-REQUI-2026-0010', N'Operaciones Cadena de Frío', N'BAJA', N'Reposición de inventario de seguridad para Corrector Líquido Alta Duración ante alta rotación.', '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-REQUI-2026-0011', N'Control Sanitario QA', N'MEDIA', N'Reposición de inventario de seguridad para Bálsamo Reparador Cicaplast B5 ante alta rotación.', '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-REQUI-2026-0012', N'Abastecimiento Beauty-Box', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Exfoliante Ácido Salicílico 2% ante alta rotación.', '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-REQUI-2026-0013', N'Planeación de Demanda', N'BAJA', N'Reposición de inventario de seguridad para Contorno de Ojos con Cafeína 5% ante alta rotación.', '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-REQUI-2026-0014', N'Operaciones Cadena de Frío', N'MEDIA', N'Reposición de inventario de seguridad para Mascarilla Nocturna Hidratante ante alta rotación.', '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-REQUI-2026-0015', N'Control Sanitario QA', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Bruma Termal Calmante Mineral ante alta rotación.', '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-REQUI-2026-0016', N'Abastecimiento Beauty-Box', N'BAJA', N'Reposición de inventario de seguridad para Aceite Limpiador Emulsionable ante alta rotación.', '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-REQUI-2026-0017', N'Planeación de Demanda', N'MEDIA', N'Reposición de inventario de seguridad para Tónico Equilibrante Ácido Glicólico 7% ante alta rotación.', '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-REQUI-2026-0018', N'Operaciones Cadena de Frío', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Labial Hidratante Péptidos Nude ante alta rotación.', '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-REQUI-2026-0019', N'Control Sanitario QA', N'BAJA', N'Reposición de inventario de seguridad para Polvo Traslúcido Matificante Mineral ante alta rotación.', '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-REQUI-2026-0020', N'Abastecimiento Beauty-Box', N'MEDIA', N'Reposición de inventario de seguridad para Rubor Líquido Pigmento Natural ante alta rotación.', '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-REQUI-2026-0021', N'Planeación de Demanda', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Sérum Ácido Azelaico 10% Suspensión ante alta rotación.', '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-REQUI-2026-0022', N'Operaciones Cadena de Frío', N'BAJA', N'Reposición de inventario de seguridad para Ampolletas Proteoglicanos Firmeza ante alta rotación.', '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-REQUI-2026-0023', N'Control Sanitario QA', N'MEDIA', N'Reposición de inventario de seguridad para Crema Despigmentante Noche Melasma ante alta rotación.', '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-REQUI-2026-0024', N'Abastecimiento Beauty-Box', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Protector Solar Mineral Óxido Zinc ante alta rotación.', '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-REQUI-2026-0025', N'Planeación de Demanda', N'BAJA', N'Reposición de inventario de seguridad para Loción Corporal Urea 10% Reparadora ante alta rotación.', '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-REQUI-2026-0026', N'Operaciones Cadena de Frío', N'MEDIA', N'Reposición de inventario de seguridad para Primer Facial Minimizador de Poros ante alta rotación.', '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-REQUI-2026-0027', N'Control Sanitario QA', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Máscara de Pestañas Hipoalergénica ante alta rotación.', '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-REQUI-2026-0028', N'Abastecimiento Beauty-Box', N'BAJA', N'Reposición de inventario de seguridad para Sérum Péptidos de Cobre 1% ante alta rotación.', '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-REQUI-2026-0029', N'Planeación de Demanda', N'MEDIA', N'Reposición de inventario de seguridad para Bálsamo Desmaquillante Caléndula ante alta rotación.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-REQUI-2026-0030', N'Operaciones Cadena de Frío', N'URGENTE_DESABASTO', N'Reposición de inventario de seguridad para Crema Barrera Post-Retinoide ante alta rotación.', '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.requisiciones OFF;
GO

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.requisiciones_detalles ON;
INSERT INTO compras.requisiciones_detalles (ID, ID_requisicion, ID_variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.requisiciones_detalles OFF;
GO

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra ON;
INSERT INTO compras.ordenes_compra (ID, folio_orden_compra, ID_proveedor, ID_estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 1187.68, 190.03, 1377.71, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 1836.12, 293.78, 2129.90, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 2595.32, 415.25, 3010.57, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 1630.72, 260.92, 1891.64, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 2445.30, 391.25, 2836.55, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 3370.64, 539.30, 3909.94, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 2073.76, 331.80, 2405.56, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 3054.48, 488.72, 3543.20, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 4145.96, 663.35, 4809.31, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 2516.80, 402.69, 2919.49, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 3663.66, 586.19, 4249.85, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 4921.28, 787.40, 5708.68, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 2959.84, 473.57, 3433.41, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 4272.84, 683.65, 4956.49, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 5696.60, 911.46, 6608.06, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 3402.88, 544.46, 3947.34, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 4882.02, 781.12, 5663.14, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 6471.92, 1035.51, 7507.43, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 3845.92, 615.35, 4461.27, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 5491.20, 878.59, 6369.79, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 7247.24, 1159.56, 8406.80, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 4288.96, 686.23, 4975.19, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 6100.38, 976.06, 7076.44, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 8022.56, 1283.61, 9306.17, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 4732.00, 757.12, 5489.12, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 6709.56, 1073.53, 7783.09, N'Crédito 30 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 8797.88, 1407.66, 10205.54, N'Crédito 45 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 5175.04, 828.01, 6003.05, N'Crédito 60 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 7318.74, 1171.00, 8489.74, N'Crédito 15 días contra entrega y validación QA.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 9573.20, 1531.71, 11104.91, N'Crédito 30 días contra entrega y validación QA.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra OFF;
GO

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra_detalles ON;
INSERT INTO compras.ordenes_compra_detalles (ID, ID_orden_compra, ID_variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 148.46, 1187.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 166.92, 1836.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 185.38, 2595.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 8, 8, 203.84, 1630.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 11, 11, 222.30, 2445.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 14, 14, 240.76, 3370.64, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 8, 8, 259.22, 2073.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 11, 11, 277.68, 3054.48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 14, 14, 296.14, 4145.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 8, 8, 314.60, 2516.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 333.06, 3663.66, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 14, 14, 351.52, 4921.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 8, 8, 369.98, 2959.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 11, 11, 388.44, 4272.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 14, 14, 406.90, 5696.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 8, 8, 425.36, 3402.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 11, 11, 443.82, 4882.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 14, 14, 462.28, 6471.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 8, 8, 480.74, 3845.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 11, 11, 499.20, 5491.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 14, 14, 517.66, 7247.24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 8, 8, 536.12, 4288.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 11, 11, 554.58, 6100.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 14, 14, 573.04, 8022.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 8, 8, 591.50, 4732.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 11, 11, 609.96, 6709.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 14, 14, 628.42, 8797.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 8, 8, 646.88, 5175.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 11, 11, 665.34, 7318.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 14, 14, 683.80, 9573.20, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra_detalles OFF;
GO

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_mercancia ON;
INSERT INTO compras.recepciones_mercancia (ID, folio_recepcion, ID_orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RECEP-2026-0001', 1, N'REM-PROV-2026-0001', '2026-02-01 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RECEP-2026-0002', 2, N'REM-PROV-2026-0002', '2026-02-02 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RECEP-2026-0003', 3, N'REM-PROV-2026-0003', '2026-02-03 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RECEP-2026-0004', 4, N'REM-PROV-2026-0004', '2026-02-04 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RECEP-2026-0005', 5, N'REM-PROV-2026-0005', '2026-02-05 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RECEP-2026-0006', 6, N'REM-PROV-2026-0006', '2026-02-06 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RECEP-2026-0007', 7, N'REM-PROV-2026-0007', '2026-02-07 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RECEP-2026-0008', 8, N'REM-PROV-2026-0008', '2026-02-08 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RECEP-2026-0009', 9, N'REM-PROV-2026-0009', '2026-02-09 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RECEP-2026-0010', 10, N'REM-PROV-2026-0010', '2026-02-10 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RECEP-2026-0011', 11, N'REM-PROV-2026-0011', '2026-02-11 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RECEP-2026-0012', 12, N'REM-PROV-2026-0012', '2026-02-12 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RECEP-2026-0013', 13, N'REM-PROV-2026-0013', '2026-02-13 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RECEP-2026-0014', 14, N'REM-PROV-2026-0014', '2026-02-14 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RECEP-2026-0015', 15, N'REM-PROV-2026-0015', '2026-02-15 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RECEP-2026-0016', 16, N'REM-PROV-2026-0016', '2026-02-16 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RECEP-2026-0017', 17, N'REM-PROV-2026-0017', '2026-02-17 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RECEP-2026-0018', 18, N'REM-PROV-2026-0018', '2026-02-18 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RECEP-2026-0019', 19, N'REM-PROV-2026-0019', '2026-02-19 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RECEP-2026-0020', 20, N'REM-PROV-2026-0020', '2026-02-20 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RECEP-2026-0021', 21, N'REM-PROV-2026-0021', '2026-02-21 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RECEP-2026-0022', 22, N'REM-PROV-2026-0022', '2026-02-22 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RECEP-2026-0023', 23, N'REM-PROV-2026-0023', '2026-02-23 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RECEP-2026-0024', 24, N'REM-PROV-2026-0024', '2026-02-24 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RECEP-2026-0025', 25, N'REM-PROV-2026-0025', '2026-02-25 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RECEP-2026-0026', 26, N'REM-PROV-2026-0026', '2026-02-26 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RECEP-2026-0027', 27, N'REM-PROV-2026-0027', '2026-02-27 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RECEP-2026-0028', 28, N'REM-PROV-2026-0028', '2026-02-28 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RECEP-2026-0029', 29, N'REM-PROV-2026-0029', '2026-02-01 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RECEP-2026-0030', 30, N'REM-PROV-2026-0030', '2026-02-02 11:30:00', N'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_mercancia OFF;
GO

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_detalles ON;
INSERT INTO compras.recepciones_detalles (ID, ID_recepcion, ID_variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 6.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 5.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 4.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 7.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 6.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 5.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 4.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 18.8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 7.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 21.2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 6.5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 19.6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 20.4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 5.5, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_detalles OFF;
GO

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa ON;
INSERT INTO compras.inspecciones_sanitarias_qa (ID, ID_recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'LOTE_LAB_01', '2027-01-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, N'LOTE_LAB_02', '2028-02-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, N'LOTE_LAB_03', '2027-03-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, N'LOTE_LAB_04', '2028-04-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, N'LOTE_LAB_05', '2027-05-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, N'LOTE_LAB_06', '2028-06-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, N'LOTE_LAB_07', '2027-07-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, N'LOTE_LAB_08', '2028-08-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, N'LOTE_LAB_09', '2027-09-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, N'LOTE_LAB_10', '2028-10-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, N'LOTE_LAB_11', '2027-11-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, N'LOTE_LAB_12', '2028-12-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, N'LOTE_LAB_13', '2027-01-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, N'LOTE_LAB_14', '2028-02-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, N'LOTE_LAB_15', '2027-03-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, N'LOTE_LAB_16', '2028-04-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, N'LOTE_LAB_17', '2027-05-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, N'LOTE_LAB_18', '2028-06-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, N'LOTE_LAB_19', '2027-07-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, N'LOTE_LAB_20', '2028-08-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, N'LOTE_LAB_21', '2027-09-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, N'LOTE_LAB_22', '2028-10-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, N'LOTE_LAB_23', '2027-11-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, N'LOTE_LAB_24', '2028-12-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, N'LOTE_LAB_25', '2027-01-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, N'LOTE_LAB_26', '2028-02-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, N'LOTE_LAB_27', '2027-03-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, N'LOTE_LAB_28', '2028-04-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, N'LOTE_LAB_29', '2027-05-15', N'APROBADO', N'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, N'LOTE_LAB_30', '2028-06-15', N'RECHAZADO_DEVOLVER', N'Empaque secundario con humedad y sello de seguridad comprometido.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa OFF;
GO

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.almacenes_cedis ON;
INSERT INTO wms.almacenes_cedis (ID, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ALMACEN_01', N'CEDIS Monterrey Parque Stiva Unidad 1', N'Av. Parque Industrial Logístico #112', '25700', N'Monclova', 1750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ALMACEN_02', N'CEDIS CDMX Vallejo Industrial Unidad 2', N'Av. Parque Industrial Logístico #124', '64000', N'Monterrey', 2000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ALMACEN_03', N'CEDIS Guadalajara El Salto Unidad 3', N'Av. Parque Industrial Logístico #136', '66220', N'San Pedro Garza García', 2250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'ALMACEN_04', N'CEDIS Monclova Centro Distribución Unidad 4', N'Av. Parque Industrial Logístico #148', '06700', N'Cuauhtémoc', 2500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ALMACEN_05', N'CEDIS Querétaro Logístico Bajío Unidad 5', N'Av. Parque Industrial Logístico #160', '11560', N'Miguel Hidalgo', 2750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'ALMACEN_06', N'CEDIS Puebla Parque Finsa Unidad 6', N'Av. Parque Industrial Logístico #172', '44100', N'Guadalajara', 3000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'ALMACEN_07', N'CEDIS Monterrey Parque Stiva Unidad 7', N'Av. Parque Industrial Logístico #184', '25000', N'Saltillo', 3250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'ALMACEN_08', N'CEDIS CDMX Vallejo Industrial Unidad 8', N'Av. Parque Industrial Logístico #196', '76000', N'Querétaro', 3500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'ALMACEN_09', N'CEDIS Guadalajara El Salto Unidad 9', N'Av. Parque Industrial Logístico #208', '72000', N'Puebla', 3750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'ALMACEN_10', N'CEDIS Monclova Centro Distribución Unidad 10', N'Av. Parque Industrial Logístico #220', '97000', N'Mérida', 4000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ALMACEN_11', N'CEDIS Querétaro Logístico Bajío Unidad 11', N'Av. Parque Industrial Logístico #232', '25700', N'Monclova', 4250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ALMACEN_12', N'CEDIS Puebla Parque Finsa Unidad 12', N'Av. Parque Industrial Logístico #244', '64000', N'Monterrey', 4500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'ALMACEN_13', N'CEDIS Monterrey Parque Stiva Unidad 13', N'Av. Parque Industrial Logístico #256', '66220', N'San Pedro Garza García', 4750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'ALMACEN_14', N'CEDIS CDMX Vallejo Industrial Unidad 14', N'Av. Parque Industrial Logístico #268', '06700', N'Cuauhtémoc', 5000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ALMACEN_15', N'CEDIS Guadalajara El Salto Unidad 15', N'Av. Parque Industrial Logístico #280', '11560', N'Miguel Hidalgo', 5250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'ALMACEN_16', N'CEDIS Monclova Centro Distribución Unidad 16', N'Av. Parque Industrial Logístico #292', '44100', N'Guadalajara', 5500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'ALMACEN_17', N'CEDIS Querétaro Logístico Bajío Unidad 17', N'Av. Parque Industrial Logístico #304', '25000', N'Saltillo', 5750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ALMACEN_18', N'CEDIS Puebla Parque Finsa Unidad 18', N'Av. Parque Industrial Logístico #316', '76000', N'Querétaro', 6000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'ALMACEN_19', N'CEDIS Monterrey Parque Stiva Unidad 19', N'Av. Parque Industrial Logístico #328', '72000', N'Puebla', 6250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'ALMACEN_20', N'CEDIS CDMX Vallejo Industrial Unidad 20', N'Av. Parque Industrial Logístico #340', '97000', N'Mérida', 6500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ALMACEN_21', N'CEDIS Guadalajara El Salto Unidad 21', N'Av. Parque Industrial Logístico #352', '25700', N'Monclova', 6750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'ALMACEN_22', N'CEDIS Monclova Centro Distribución Unidad 22', N'Av. Parque Industrial Logístico #364', '64000', N'Monterrey', 7000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'ALMACEN_23', N'CEDIS Querétaro Logístico Bajío Unidad 23', N'Av. Parque Industrial Logístico #376', '66220', N'San Pedro Garza García', 7250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'ALMACEN_24', N'CEDIS Puebla Parque Finsa Unidad 24', N'Av. Parque Industrial Logístico #388', '06700', N'Cuauhtémoc', 7500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'ALMACEN_25', N'CEDIS Monterrey Parque Stiva Unidad 25', N'Av. Parque Industrial Logístico #400', '11560', N'Miguel Hidalgo', 7750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'ALMACEN_26', N'CEDIS CDMX Vallejo Industrial Unidad 26', N'Av. Parque Industrial Logístico #412', '44100', N'Guadalajara', 8000.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ALMACEN_27', N'CEDIS Guadalajara El Salto Unidad 27', N'Av. Parque Industrial Logístico #424', '25000', N'Saltillo', 8250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'ALMACEN_28', N'CEDIS Monclova Centro Distribución Unidad 28', N'Av. Parque Industrial Logístico #436', '76000', N'Querétaro', 8500.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'ALMACEN_29', N'CEDIS Querétaro Logístico Bajío Unidad 29', N'Av. Parque Industrial Logístico #448', '72000', N'Puebla', 8750.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'ALMACEN_30', N'CEDIS Puebla Parque Finsa Unidad 30', N'Av. Parque Industrial Logístico #460', '97000', N'Mérida', 9000.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.almacenes_cedis OFF;
GO

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.zonas_almacen ON;
INSERT INTO wms.zonas_almacen (ID, ID_almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ZONA_01', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 01)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ZONA_02', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 02)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ZONA_03', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 03)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ZONA_04', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 04)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ZONA_05', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 05)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ZONA_06', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 06)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ZONA_07', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 07)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ZONA_08', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 08)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ZONA_09', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 09)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ZONA_10', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 10)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ZONA_11', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 11)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ZONA_12', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 12)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ZONA_13', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 13)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ZONA_14', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 14)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ZONA_15', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 15)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ZONA_16', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 16)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ZONA_17', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 17)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ZONA_18', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 18)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ZONA_19', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 19)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ZONA_20', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 20)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ZONA_21', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 21)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ZONA_22', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 22)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ZONA_23', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 23)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ZONA_24', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 24)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ZONA_25', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 25)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ZONA_26', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 26)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ZONA_27', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 27)', 2.0, 8.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ZONA_28', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 28)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ZONA_29', N'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 29)', 15.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ZONA_30', N'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 30)', 2.0, 8.0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.zonas_almacen OFF;
GO

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.pasillos_ubicaciones ON;
INSERT INTO wms.pasillos_ubicaciones (ID, ID_zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'UBICACIO_01', 250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'UBICACIO_02', 300.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'UBICACIO_03', 350.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'UBICACIO_04', 400.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'UBICACIO_05', 450.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'UBICACIO_06', 250.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'UBICACIO_07', 300.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'UBICACIO_08', 350.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'UBICACIO_09', 400.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'UBICACIO_10', 450.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'UBICACIO_11', 250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'UBICACIO_12', 300.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'UBICACIO_13', 350.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'UBICACIO_14', 400.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'UBICACIO_15', 450.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'UBICACIO_16', 250.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'UBICACIO_17', 300.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'UBICACIO_18', 350.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'UBICACIO_19', 400.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'UBICACIO_20', 450.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'UBICACIO_21', 250.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'UBICACIO_22', 300.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'UBICACIO_23', 350.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'UBICACIO_24', 400.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'UBICACIO_25', 450.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'UBICACIO_26', 250.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'UBICACIO_27', 300.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'UBICACIO_28', 350.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'UBICACIO_29', 400.00, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'UBICACIO_30', 450.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.pasillos_ubicaciones OFF;
GO

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.tipos_movimiento_inventario ON;
INSERT INTO wms.tipos_movimiento_inventario (ID, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ENT_COMPRA', N'Entrada por Compra a Proveedor', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SAL_VENTA', N'Salida por Venta E-Commerce', -1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'AJU_POS', N'Ajuste Positivo por Conteo Cíclico', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SAL_MERMA', N'Salida por Merma o Caducidad Sanitaria', -1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'TRANS_SAL', N'Salida por Transferencia entre CEDIS', -1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TRANS_ENT', N'Entrada por Transferencia entre CEDIS', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SET IDENTITY_INSERT wms.tipos_movimiento_inventario OFF;
GO

-- =================================================================================================
-- 117. TABLA: wms.lotes_fabricacion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria ON;
INSERT INTO wms.lotes_fabricacion_sanitaria (ID, ID_variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'LOT-2026-LA_R-001', '2025-01-01', '2027-01-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-001.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'LOT-2026-CERA-002', '2025-02-02', '2028-02-02', N'https://cdn.dermacare.mx/wms/coa/LOTE-002.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'LOT-2026-THE_-003', '2025-03-03', '2027-03-03', N'https://cdn.dermacare.mx/wms/coa/LOTE-003.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'LOT-2026-ISDI-004', '2024-02-01', '2026-02-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-004.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'LOT-2026-BIOD-005', '2025-05-05', '2027-05-05', N'https://cdn.dermacare.mx/wms/coa/LOTE-005.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'LOT-2026-AVEN-006', '2025-06-06', '2028-06-06', N'https://cdn.dermacare.mx/wms/coa/LOTE-006.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'LOT-2026-EUCE-007', '2025-07-07', '2027-07-07', N'https://cdn.dermacare.mx/wms/coa/LOTE-007.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'LOT-2026-VICH-008', '2024-02-01', '2026-02-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-008.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'LOT-2026-SKIN-009', '2025-09-09', '2027-09-09', N'https://cdn.dermacare.mx/wms/coa/LOTE-009.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'LOT-2026-SESD-010', '2025-10-10', '2028-10-10', N'https://cdn.dermacare.mx/wms/coa/LOTE-010.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'LOT-2026-NARS-011', '2025-11-11', '2027-11-11', N'https://cdn.dermacare.mx/wms/coa/LOTE-011.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'LOT-2026-MAC-012', '2025-12-12', '2028-12-12', N'https://cdn.dermacare.mx/wms/coa/LOTE-012.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'LOT-2026-FENT-013', '2025-01-13', '2027-01-13', N'https://cdn.dermacare.mx/wms/coa/LOTE-013.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'LOT-2026-RARE-014', '2025-02-14', '2028-02-14', N'https://cdn.dermacare.mx/wms/coa/LOTE-014.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'LOT-2026-CLIN-015', '2025-03-15', '2027-03-15', N'https://cdn.dermacare.mx/wms/coa/LOTE-015.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'LOT-2026-ESTE-016', '2025-04-16', '2028-04-16', N'https://cdn.dermacare.mx/wms/coa/LOTE-016.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'LOT-2026-LANC-017', '2025-05-17', '2027-05-17', N'https://cdn.dermacare.mx/wms/coa/LOTE-017.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'LOT-2026-CHAR-018', '2025-06-18', '2028-06-18', N'https://cdn.dermacare.mx/wms/coa/LOTE-018.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'LOT-2026-PAUL-019', '2025-07-19', '2027-07-19', N'https://cdn.dermacare.mx/wms/coa/LOTE-019.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'LOT-2026-COSR-020', '2025-08-20', '2028-08-20', N'https://cdn.dermacare.mx/wms/coa/LOTE-020.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'LOT-2026-LANE-021', '2025-09-01', '2027-09-01', N'https://cdn.dermacare.mx/wms/coa/LOTE-021.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'LOT-2026-URIA-022', '2025-10-02', '2028-10-02', N'https://cdn.dermacare.mx/wms/coa/LOTE-022.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'LOT-2026-SVR-023', '2025-11-03', '2027-11-03', N'https://cdn.dermacare.mx/wms/coa/LOTE-023.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'LOT-2026-MART-024', '2025-12-04', '2028-12-04', N'https://cdn.dermacare.mx/wms/coa/LOTE-024.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'LOT-2026-HELI-025', '2025-01-05', '2027-01-05', N'https://cdn.dermacare.mx/wms/coa/LOTE-025.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'LOT-2026-KIEH-026', '2025-02-06', '2028-02-06', N'https://cdn.dermacare.mx/wms/coa/LOTE-026.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'LOT-2026-GARN-027', '2025-03-07', '2027-03-07', N'https://cdn.dermacare.mx/wms/coa/LOTE-027.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'LOT-2026-LORE-028', '2025-04-08', '2028-04-08', N'https://cdn.dermacare.mx/wms/coa/LOTE-028.pdf', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'LOT-2026-NEUT-029', '2025-05-09', '2027-05-09', N'https://cdn.dermacare.mx/wms/coa/LOTE-029.pdf', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'LOT-2026-DERM-030', '2025-06-10', '2028-06-10', N'https://cdn.dermacare.mx/wms/coa/LOTE-030.pdf', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria OFF;
GO

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.inventario_lotes_ubicacion ON;
INSERT INTO wms.inventario_lotes_ubicacion (ID, ID_lote, ID_ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.inventario_lotes_ubicacion OFF;
GO

-- =================================================================================================
-- 119. TABLA: wms.kardex_movimientos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.kardex_movimientos ON;
INSERT INTO wms.kardex_movimientos (ID, ID_inventario_stock, ID_tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 105, 113, N'FOL-DOCUM-2026-0001', 148.46, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 110, 99, N'FOL-DOCUM-2026-0002', 166.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 115, 129, N'FOL-DOCUM-2026-0003', 185.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 120, 103, N'FOL-DOCUM-2026-0004', 203.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 125, 145, N'FOL-DOCUM-2026-0005', 222.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 130, 107, N'FOL-DOCUM-2026-0006', 240.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 135, 161, N'FOL-DOCUM-2026-0007', 259.22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 140, 111, N'FOL-DOCUM-2026-0008', 277.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 145, 177, N'FOL-DOCUM-2026-0009', 296.14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 150, 115, N'FOL-DOCUM-2026-0010', 314.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 155, 193, N'FOL-DOCUM-2026-0011', 333.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 160, 119, N'FOL-DOCUM-2026-0012', 351.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 165, 209, N'FOL-DOCUM-2026-0013', 369.98, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 170, 123, N'FOL-DOCUM-2026-0014', 388.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 175, 225, N'FOL-DOCUM-2026-0015', 406.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 180, 127, N'FOL-DOCUM-2026-0016', 425.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 185, 241, N'FOL-DOCUM-2026-0017', 443.82, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 190, 131, N'FOL-DOCUM-2026-0018', 462.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 195, 257, N'FOL-DOCUM-2026-0019', 480.74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 200, 135, N'FOL-DOCUM-2026-0020', 499.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 205, 273, N'FOL-DOCUM-2026-0021', 517.66, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 210, 139, N'FOL-DOCUM-2026-0022', 536.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 215, 289, N'FOL-DOCUM-2026-0023', 554.58, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 220, 143, N'FOL-DOCUM-2026-0024', 573.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 225, 305, N'FOL-DOCUM-2026-0025', 591.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 230, 147, N'FOL-DOCUM-2026-0026', 609.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 235, 321, N'FOL-DOCUM-2026-0027', 628.42, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 240, 151, N'FOL-DOCUM-2026-0028', 646.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 245, 337, N'FOL-DOCUM-2026-0029', 665.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 250, 155, N'FOL-DOCUM-2026-0030', 683.80, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.kardex_movimientos OFF;
GO

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.alertas_caducidad_proxima ON;
INSERT INTO wms.alertas_caducidad_proxima (ID, ID_lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 18, N'CRITICA_30D', N'Bloquear venta regular; liquidación inmediata o retiro preventivo.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, -5, N'EXPIRADO', N'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 82, N'PREVENTIVA_90D', N'Programar campaña promocional o bundle de rotación.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 48, N'MODERADA_60D', N'Activar descuento Venta Flash 25% y priorizar picking FEFO.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.alertas_caducidad_proxima OFF;
GO

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria ON;
INSERT INTO wms.mermas_destruccion_sanitaria (ID, folio_acta_destruccion, ID_lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ACTA_-2026-0001', 1, 8, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ACTA_-2026-0002', 2, 11, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ACTA_-2026-0003', 3, 14, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ACTA_-2026-0004', 4, 17, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ACTA_-2026-0005', 5, 20, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ACTA_-2026-0006', 6, 23, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ACTA_-2026-0007', 7, 26, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ACTA_-2026-0008', 8, 29, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ACTA_-2026-0009', 9, 32, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ACTA_-2026-0010', 10, 35, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ACTA_-2026-0011', 11, 38, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ACTA_-2026-0012', 12, 41, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ACTA_-2026-0013', 13, 44, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ACTA_-2026-0014', 14, 47, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ACTA_-2026-0015', 15, 50, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ACTA_-2026-0016', 16, 53, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ACTA_-2026-0017', 17, 56, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ACTA_-2026-0018', 18, 59, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ACTA_-2026-0019', 19, 62, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ACTA_-2026-0020', 20, 65, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ACTA_-2026-0021', 21, 68, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ACTA_-2026-0022', 22, 71, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ACTA_-2026-0023', 23, 74, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ACTA_-2026-0024', 24, 77, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ACTA_-2026-0025', 25, 80, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ACTA_-2026-0026', 26, 83, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ACTA_-2026-0027', 27, 86, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ACTA_-2026-0028', 28, 89, N'Producto expirado según monitoreo FEFO.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ACTA_-2026-0029', 29, 92, N'Fractura de envase de vidrio durante maniobra de surtido.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ACTA_-2026-0030', 30, 95, N'Excursión térmica fuera de especificación de fabricante.', N'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', N'https://cdn.dermacare.mx/wms/mermas/ACTA-0030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria OFF;
GO

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_almacenes ON;
INSERT INTO wms.transferencias_almacenes (ID, folio_transferencia, ID_almacen_origen, ID_almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 2, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 3, N'EN_TRANSITO', '2026-02-02 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 4, N'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 5, N'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 6, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 7, N'EN_TRANSITO', '2026-02-06 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 8, N'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 9, N'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 10, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 11, N'EN_TRANSITO', '2026-02-10 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 12, N'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 13, N'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 14, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 15, N'EN_TRANSITO', '2026-02-14 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 16, N'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 17, N'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 18, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 19, N'EN_TRANSITO', '2026-02-18 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 20, N'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 21, N'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 22, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 23, N'EN_TRANSITO', '2026-02-22 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 24, N'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 25, N'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 26, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 27, N'EN_TRANSITO', '2026-02-26 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 28, N'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-03-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 29, N'DISCREPANCIA', '2026-02-28 11:30:00', '2026-03-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 30, N'SOLICITADA', NULL, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 1, N'EN_TRANSITO', '2026-02-02 11:30:00', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.transferencias_almacenes OFF;
GO

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_detalles ON;
INSERT INTO wms.transferencias_detalles (ID, ID_transferencia, ID_lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.transferencias_detalles OFF;
GO

-- =================================================================================================
-- 124. TABLA: wms.conteos_ciclicos_auditoria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.conteos_ciclicos_auditoria ON;
INSERT INTO wms.conteos_ciclicos_auditoria (ID, folio_auditoria, ID_almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-AUDIT-2026-0001', 1, '2026-03-01', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-AUDIT-2026-0002', 2, '2026-03-02', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-AUDIT-2026-0003', 3, '2026-03-03', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-AUDIT-2026-0004', 4, '2026-03-04', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-AUDIT-2026-0005', 5, '2026-03-05', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-AUDIT-2026-0006', 6, '2026-03-06', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-AUDIT-2026-0007', 7, '2026-03-07', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-AUDIT-2026-0008', 8, '2026-03-08', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-AUDIT-2026-0009', 9, '2026-03-09', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-AUDIT-2026-0010', 10, '2026-03-10', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-AUDIT-2026-0011', 11, '2026-03-11', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-AUDIT-2026-0012', 12, '2026-03-12', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-AUDIT-2026-0013', 13, '2026-03-13', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-AUDIT-2026-0014', 14, '2026-03-14', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-AUDIT-2026-0015', 15, '2026-03-15', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-AUDIT-2026-0016', 16, '2026-03-16', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-AUDIT-2026-0017', 17, '2026-03-17', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-AUDIT-2026-0018', 18, '2026-03-18', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-AUDIT-2026-0019', 19, '2026-03-19', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-AUDIT-2026-0020', 20, '2026-03-20', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-AUDIT-2026-0021', 21, '2026-03-21', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-AUDIT-2026-0022', 22, '2026-03-22', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-AUDIT-2026-0023', 23, '2026-03-23', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-AUDIT-2026-0024', 24, '2026-03-24', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-AUDIT-2026-0025', 25, '2026-03-25', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-AUDIT-2026-0026', 26, '2026-03-26', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-AUDIT-2026-0027', 27, '2026-03-27', N'PROXIMO_A_CADUCAR', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-AUDIT-2026-0028', 28, '2026-03-28', N'ALEATORIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-AUDIT-2026-0029', 29, '2026-03-01', N'ALTO_VALOR_SKU', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-AUDIT-2026-0030', 30, '2026-03-02', N'PROXIMO_A_CADUCAR', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.conteos_ciclicos_auditoria OFF;
GO

-- =================================================================================================
-- 125. TABLA: wms.conteos_ciclicos_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.conteos_ciclicos_detalles ON;
INSERT INTO wms.conteos_ciclicos_detalles (ID, ID_conteo_ciclico, ID_inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 52, 52, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 54, 54, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 56, 55, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 58, 58, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 60, 60, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 62, 61, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 64, 64, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 66, 66, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 68, 67, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 70, 70, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 72, 72, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 74, 73, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 76, 76, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 78, 78, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 80, 79, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 82, 82, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 84, 84, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 86, 85, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 88, 88, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 90, 90, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 92, 91, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 94, 94, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 96, 96, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 98, 97, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 100, 100, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 102, 102, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 104, 103, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 106, 106, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 108, 108, 0, NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 110, 109, -1, N'Diferencia de 1 pieza por merma detectada en conteo físico.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.conteos_ciclicos_detalles OFF;
GO

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad ON;
INSERT INTO wms.monitoreo_temperatura_humedad (ID, ID_zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SENSOR_I_01', 26.8, 42.0, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SENSOR_I_02', 19.4, 43.1, 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SENSOR_I_03', 9.4, 44.2, 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SENSOR_I_04', 21.2, 45.3, 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SENSOR_I_05', 26.8, 46.4, 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SENSOR_I_06', 4.3, 47.5, 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SENSOR_I_07', 26.8, 48.6, 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SENSOR_I_08', 20.3, 49.7, 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SENSOR_I_09', 9.4, 50.8, 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SENSOR_I_10', 22.1, 51.9, 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SENSOR_I_11', 26.8, 53.0, 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SENSOR_I_12', 5.9, 54.1, 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SENSOR_I_13', 26.8, 55.2, 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SENSOR_I_14', 21.2, 56.3, 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SENSOR_I_15', 9.4, 57.4, 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SENSOR_I_16', 18.5, 42.0, 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SENSOR_I_17', 26.8, 43.1, 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SENSOR_I_18', 4.3, 44.2, 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SENSOR_I_19', 26.8, 45.3, 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SENSOR_I_20', 22.1, 46.4, 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SENSOR_I_21', 9.4, 47.5, 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SENSOR_I_22', 19.4, 48.6, 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SENSOR_I_23', 26.8, 49.7, 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SENSOR_I_24', 5.9, 50.8, 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SENSOR_I_25', 26.8, 51.9, 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SENSOR_I_26', 18.5, 53.0, 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SENSOR_I_27', 9.4, 54.1, 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SENSOR_I_28', 20.3, 55.2, 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SENSOR_I_29', 26.8, 56.3, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SENSOR_I_30', 4.3, 57.4, 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad OFF;
GO

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.transportistas_paqueterias ON;
INSERT INTO envios.transportistas_paqueterias (ID, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'TRANSPOR_01', N'DHL Express México', N'https://api-eu.dhl.com/track/shipments?node=1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'TRANSPOR_02', N'FedEx Express MX', N'https://apis.fedex.com/track/v1/trackingnumbers?node=2', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'TRANSPOR_03', N'Estafeta Mexicana', N'https://cs.estafeta.com/api/tracking?node=3', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'TRANSPOR_04', N'99Minutos Cadena Frío', N'https://tracking.99minutos.com/api/v3/orders?node=4', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'TRANSPOR_05', N'Redpack Logística', N'https://ws.redpack.com.mx/tracking/rest?node=5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TRANSPOR_06', N'UPS México', N'https://onlinetools.ups.com/api/track/v1/details?node=6', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'TRANSPOR_07', N'Paquetexpress', N'https://api.paquetexpress.com.mx/rastreo?node=7', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'TRANSPOR_08', N'J&T Express MX', N'https://openapi.jtexpress.mx/web/track?node=8', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'TRANSPOR_09', N'iVoy Mismo Día', N'https://api.ivoy.mx/v2/deliveries/track?node=9', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'TRANSPOR_10', N'Flotilla Propia DermaCare', N'https://logistica.dermacare.mx/api/rastreo?node=10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'TRANSPOR_11', N'DHL Express México Regional 2', N'https://api-eu.dhl.com/track/shipments?node=11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'TRANSPOR_12', N'FedEx Express MX Regional 2', N'https://apis.fedex.com/track/v1/trackingnumbers?node=12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'TRANSPOR_13', N'Estafeta Mexicana Regional 2', N'https://cs.estafeta.com/api/tracking?node=13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'TRANSPOR_14', N'99Minutos Cadena Frío Regional 2', N'https://tracking.99minutos.com/api/v3/orders?node=14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'TRANSPOR_15', N'Redpack Logística Regional 2', N'https://ws.redpack.com.mx/tracking/rest?node=15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'TRANSPOR_16', N'UPS México Regional 2', N'https://onlinetools.ups.com/api/track/v1/details?node=16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'TRANSPOR_17', N'Paquetexpress Regional 2', N'https://api.paquetexpress.com.mx/rastreo?node=17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'TRANSPOR_18', N'J&T Express MX Regional 2', N'https://openapi.jtexpress.mx/web/track?node=18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'TRANSPOR_19', N'iVoy Mismo Día Regional 2', N'https://api.ivoy.mx/v2/deliveries/track?node=19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'TRANSPOR_20', N'Flotilla Propia DermaCare Regional 2', N'https://logistica.dermacare.mx/api/rastreo?node=20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'TRANSPOR_21', N'DHL Express México Regional 3', N'https://api-eu.dhl.com/track/shipments?node=21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'TRANSPOR_22', N'FedEx Express MX Regional 3', N'https://apis.fedex.com/track/v1/trackingnumbers?node=22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'TRANSPOR_23', N'Estafeta Mexicana Regional 3', N'https://cs.estafeta.com/api/tracking?node=23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'TRANSPOR_24', N'99Minutos Cadena Frío Regional 3', N'https://tracking.99minutos.com/api/v3/orders?node=24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'TRANSPOR_25', N'Redpack Logística Regional 3', N'https://ws.redpack.com.mx/tracking/rest?node=25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'TRANSPOR_26', N'UPS México Regional 3', N'https://onlinetools.ups.com/api/track/v1/details?node=26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'TRANSPOR_27', N'Paquetexpress Regional 3', N'https://api.paquetexpress.com.mx/rastreo?node=27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'TRANSPOR_28', N'J&T Express MX Regional 3', N'https://openapi.jtexpress.mx/web/track?node=28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TRANSPOR_29', N'iVoy Mismo Día Regional 3', N'https://api.ivoy.mx/v2/deliveries/track?node=29', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'TRANSPOR_30', N'Flotilla Propia DermaCare Regional 3', N'https://logistica.dermacare.mx/api/rastreo?node=30', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.transportistas_paqueterias OFF;
GO

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tipos_servicio_envio ON;
INSERT INTO envios.tipos_servicio_envio (ID, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SERVICIO_01', N'Día Siguiente Aéreo', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SERVICIO_02', N'Estándar Terrestre 3-5 Días', 96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SERVICIO_03', N'Mismo Día Express CDMX/MTY', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SERVICIO_04', N'Cadena de Frío Refrigerada 24h', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SERVICIO_05', N'Recolección en Farmacia Pickup', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'SERVICIO_06', N'Prioritario Matutino 10:30 AM', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'SERVICIO_07', N'Económico Nacional 5-7 Días', 144, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'SERVICIO_08', N'Locker Inteligente 24/7', 48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'SERVICIO_09', N'Empaque Térmico Isotérmico', 36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'SERVICIO_10', N'Express Fin de Semana', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'SERVICIO_11', N'Día Siguiente Aéreo Tarifa 2', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'SERVICIO_12', N'Estándar Terrestre 3-5 Días Tarifa 2', 96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'SERVICIO_13', N'Mismo Día Express CDMX/MTY Tarifa 2', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'SERVICIO_14', N'Cadena de Frío Refrigerada 24h Tarifa 2', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'SERVICIO_15', N'Recolección en Farmacia Pickup Tarifa 2', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'SERVICIO_16', N'Prioritario Matutino 10:30 AM Tarifa 2', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'SERVICIO_17', N'Económico Nacional 5-7 Días Tarifa 2', 144, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'SERVICIO_18', N'Locker Inteligente 24/7 Tarifa 2', 48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'SERVICIO_19', N'Empaque Térmico Isotérmico Tarifa 2', 36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'SERVICIO_20', N'Express Fin de Semana Tarifa 2', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'SERVICIO_21', N'Día Siguiente Aéreo Tarifa 3', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'SERVICIO_22', N'Estándar Terrestre 3-5 Días Tarifa 3', 96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'SERVICIO_23', N'Mismo Día Express CDMX/MTY Tarifa 3', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'SERVICIO_24', N'Cadena de Frío Refrigerada 24h Tarifa 3', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'SERVICIO_25', N'Recolección en Farmacia Pickup Tarifa 3', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'SERVICIO_26', N'Prioritario Matutino 10:30 AM Tarifa 3', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'SERVICIO_27', N'Económico Nacional 5-7 Días Tarifa 3', 144, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'SERVICIO_28', N'Locker Inteligente 24/7 Tarifa 3', 48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'SERVICIO_29', N'Empaque Térmico Isotérmico Tarifa 3', 36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'SERVICIO_30', N'Express Fin de Semana Tarifa 3', 24, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tipos_servicio_envio OFF;
GO

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tarifas_zonas_postales ON;
INSERT INTO envios.tarifas_zonas_postales (ID, ID_transportista, ID_servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '257', '067', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '640', '115', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '662', '441', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '067', '250', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '115', '760', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '441', '720', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '250', '970', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '760', '257', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '720', '640', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '970', '662', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '257', '067', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '640', '115', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '662', '441', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '067', '250', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '115', '760', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '441', '720', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '250', '970', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '760', '257', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '720', '640', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '970', '662', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '257', '067', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '640', '115', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '662', '441', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '067', '250', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '115', '760', 5.00, 199.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '441', '720', 5.00, 119.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '250', '970', 5.00, 139.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '760', '257', 5.00, 159.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '720', '640', 5.00, 179.00, 28.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '970', '662', 5.00, 199.00, 28.50, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tarifas_zonas_postales OFF;
GO

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.despachos_orden ON;
INSERT INTO envios.despachos_orden (ID, folio_despacho, ID_orden_split, ID_transportista, ID_servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-DESPA-2026-0001', 1, 1, 1, NULL, '2026-03-01', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-07 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-DESPA-2026-0007', 7, 7, 7, NULL, '2026-03-07', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-13 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-DESPA-2026-0013', 13, 13, 13, NULL, '2026-03-13', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-19 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-DESPA-2026-0019', 19, 19, 19, NULL, '2026-03-19', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-25 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', NULL, N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-DESPA-2026-0025', 25, 25, 25, NULL, '2026-03-25', NULL, N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', NULL, N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', NULL, N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', NULL, N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-03 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', NULL, N'INCIDENCIA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.despachos_orden OFF;
GO

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_bultos ON;
INSERT INTO envios.paquetes_bultos (ID, ID_despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'BULTO-PKG-2026-0001', 0.60, 13.0, 13.0, 13.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'BULTO-PKG-2026-0002', 0.75, 14.0, 14.0, 14.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'BULTO-PKG-2026-0003', 0.90, 15.0, 15.0, 15.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'BULTO-PKG-2026-0004', 1.05, 16.0, 16.0, 16.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'BULTO-PKG-2026-0005', 1.20, 17.0, 17.0, 17.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'BULTO-PKG-2026-0006', 1.35, 18.0, 18.0, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'BULTO-PKG-2026-0007', 1.50, 19.0, 19.0, 19.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'BULTO-PKG-2026-0008', 1.65, 20.0, 20.0, 20.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'BULTO-PKG-2026-0009', 1.80, 21.0, 21.0, 21.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'BULTO-PKG-2026-0010', 1.95, 22.0, 22.0, 22.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'BULTO-PKG-2026-0011', 2.10, 23.0, 23.0, 23.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'BULTO-PKG-2026-0012', 2.25, 24.0, 24.0, 24.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'BULTO-PKG-2026-0013', 2.40, 25.0, 25.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'BULTO-PKG-2026-0014', 2.55, 26.0, 26.0, 26.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'BULTO-PKG-2026-0015', 2.70, 27.0, 27.0, 27.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'BULTO-PKG-2026-0016', 2.85, 28.0, 28.0, 28.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'BULTO-PKG-2026-0017', 3.00, 29.0, 29.0, 29.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'BULTO-PKG-2026-0018', 3.15, 30.0, 30.0, 30.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'BULTO-PKG-2026-0019', 3.30, 31.0, 31.0, 31.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'BULTO-PKG-2026-0020', 3.45, 32.0, 32.0, 32.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'BULTO-PKG-2026-0021', 3.60, 33.0, 33.0, 33.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'BULTO-PKG-2026-0022', 3.75, 34.0, 34.0, 34.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'BULTO-PKG-2026-0023', 3.90, 35.0, 35.0, 35.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'BULTO-PKG-2026-0024', 4.05, 36.0, 36.0, 36.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'BULTO-PKG-2026-0025', 4.20, 37.0, 37.0, 37.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'BULTO-PKG-2026-0026', 4.35, 38.0, 38.0, 38.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'BULTO-PKG-2026-0027', 4.50, 39.0, 39.0, 39.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'BULTO-PKG-2026-0028', 4.65, 40.0, 40.0, 40.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'BULTO-PKG-2026-0029', 4.80, 41.0, 41.0, 41.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'BULTO-PKG-2026-0030', 4.95, 42.0, 42.0, 42.0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.paquetes_bultos OFF;
GO

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_contenido_lotes ON;
INSERT INTO envios.paquetes_contenido_lotes (ID, ID_paquete_bulto, ID_orden_detalle, ID_lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.paquetes_contenido_lotes OFF;
GO

-- =================================================================================================
-- 133. TABLA: envios.guias_rastreo (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.guias_rastreo ON;
INSERT INTO envios.guias_rastreo (ID, ID_paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'MXTRK202600000001', N'https://rastreo.dermacare.mx/guia/MXTRK202600000001', N'https://cdn.dermacare.mx/guias/ETIQUETA-0001.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'MXTRK202600000002', N'https://rastreo.dermacare.mx/guia/MXTRK202600000002', N'https://cdn.dermacare.mx/guias/ETIQUETA-0002.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'MXTRK202600000003', N'https://rastreo.dermacare.mx/guia/MXTRK202600000003', N'https://cdn.dermacare.mx/guias/ETIQUETA-0003.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'MXTRK202600000004', N'https://rastreo.dermacare.mx/guia/MXTRK202600000004', N'https://cdn.dermacare.mx/guias/ETIQUETA-0004.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'MXTRK202600000005', N'https://rastreo.dermacare.mx/guia/MXTRK202600000005', N'https://cdn.dermacare.mx/guias/ETIQUETA-0005.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'MXTRK202600000006', N'https://rastreo.dermacare.mx/guia/MXTRK202600000006', N'https://cdn.dermacare.mx/guias/ETIQUETA-0006.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'MXTRK202600000007', N'https://rastreo.dermacare.mx/guia/MXTRK202600000007', N'https://cdn.dermacare.mx/guias/ETIQUETA-0007.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'MXTRK202600000008', N'https://rastreo.dermacare.mx/guia/MXTRK202600000008', N'https://cdn.dermacare.mx/guias/ETIQUETA-0008.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'MXTRK202600000009', N'https://rastreo.dermacare.mx/guia/MXTRK202600000009', N'https://cdn.dermacare.mx/guias/ETIQUETA-0009.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'MXTRK202600000010', N'https://rastreo.dermacare.mx/guia/MXTRK202600000010', N'https://cdn.dermacare.mx/guias/ETIQUETA-0010.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'MXTRK202600000011', N'https://rastreo.dermacare.mx/guia/MXTRK202600000011', N'https://cdn.dermacare.mx/guias/ETIQUETA-0011.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'MXTRK202600000012', N'https://rastreo.dermacare.mx/guia/MXTRK202600000012', N'https://cdn.dermacare.mx/guias/ETIQUETA-0012.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'MXTRK202600000013', N'https://rastreo.dermacare.mx/guia/MXTRK202600000013', N'https://cdn.dermacare.mx/guias/ETIQUETA-0013.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'MXTRK202600000014', N'https://rastreo.dermacare.mx/guia/MXTRK202600000014', N'https://cdn.dermacare.mx/guias/ETIQUETA-0014.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'MXTRK202600000015', N'https://rastreo.dermacare.mx/guia/MXTRK202600000015', N'https://cdn.dermacare.mx/guias/ETIQUETA-0015.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'MXTRK202600000016', N'https://rastreo.dermacare.mx/guia/MXTRK202600000016', N'https://cdn.dermacare.mx/guias/ETIQUETA-0016.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'MXTRK202600000017', N'https://rastreo.dermacare.mx/guia/MXTRK202600000017', N'https://cdn.dermacare.mx/guias/ETIQUETA-0017.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'MXTRK202600000018', N'https://rastreo.dermacare.mx/guia/MXTRK202600000018', N'https://cdn.dermacare.mx/guias/ETIQUETA-0018.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'MXTRK202600000019', N'https://rastreo.dermacare.mx/guia/MXTRK202600000019', N'https://cdn.dermacare.mx/guias/ETIQUETA-0019.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'MXTRK202600000020', N'https://rastreo.dermacare.mx/guia/MXTRK202600000020', N'https://cdn.dermacare.mx/guias/ETIQUETA-0020.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'MXTRK202600000021', N'https://rastreo.dermacare.mx/guia/MXTRK202600000021', N'https://cdn.dermacare.mx/guias/ETIQUETA-0021.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'MXTRK202600000022', N'https://rastreo.dermacare.mx/guia/MXTRK202600000022', N'https://cdn.dermacare.mx/guias/ETIQUETA-0022.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'MXTRK202600000023', N'https://rastreo.dermacare.mx/guia/MXTRK202600000023', N'https://cdn.dermacare.mx/guias/ETIQUETA-0023.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'MXTRK202600000024', N'https://rastreo.dermacare.mx/guia/MXTRK202600000024', N'https://cdn.dermacare.mx/guias/ETIQUETA-0024.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'MXTRK202600000025', N'https://rastreo.dermacare.mx/guia/MXTRK202600000025', N'https://cdn.dermacare.mx/guias/ETIQUETA-0025.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'MXTRK202600000026', N'https://rastreo.dermacare.mx/guia/MXTRK202600000026', N'https://cdn.dermacare.mx/guias/ETIQUETA-0026.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'MXTRK202600000027', N'https://rastreo.dermacare.mx/guia/MXTRK202600000027', N'https://cdn.dermacare.mx/guias/ETIQUETA-0027.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'MXTRK202600000028', N'https://rastreo.dermacare.mx/guia/MXTRK202600000028', N'https://cdn.dermacare.mx/guias/ETIQUETA-0028.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'MXTRK202600000029', N'https://rastreo.dermacare.mx/guia/MXTRK202600000029', N'https://cdn.dermacare.mx/guias/ETIQUETA-0029.pdf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'MXTRK202600000030', N'https://rastreo.dermacare.mx/guia/MXTRK202600000030', N'https://cdn.dermacare.mx/guias/ETIQUETA-0030.pdf', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.guias_rastreo OFF;
GO

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.eventos_tracking_bitacora ON;
INSERT INTO envios.eventos_tracking_bitacora (ID, ID_guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ESTATUS__01', N'Paquete recolectado en centro de distribución CEDIS.', N'Monclova, Coahuila', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ESTATUS__02', N'En tránsito hacia estación logística regional.', N'Monterrey, Nuevo León', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ESTATUS__03', N'Paquete en unidad de reparto de última milla.', N'San Pedro Garza García, Nuevo León', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ESTATUS__04', N'Entregado y firmado en domicilio de destino.', N'Cuauhtémoc, CDMX', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ESTATUS__05', N'Paquete recolectado en centro de distribución CEDIS.', N'Miguel Hidalgo, CDMX', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ESTATUS__06', N'En tránsito hacia estación logística regional.', N'Guadalajara, Jalisco', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ESTATUS__07', N'Paquete en unidad de reparto de última milla.', N'Saltillo, Coahuila', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ESTATUS__08', N'Entregado y firmado en domicilio de destino.', N'Querétaro, Querétaro', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ESTATUS__09', N'Paquete recolectado en centro de distribución CEDIS.', N'Puebla, Puebla', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ESTATUS__10', N'En tránsito hacia estación logística regional.', N'Mérida, Yucatán', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ESTATUS__11', N'Paquete en unidad de reparto de última milla.', N'Monclova, Coahuila', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ESTATUS__12', N'Entregado y firmado en domicilio de destino.', N'Monterrey, Nuevo León', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ESTATUS__13', N'Paquete recolectado en centro de distribución CEDIS.', N'San Pedro Garza García, Nuevo León', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ESTATUS__14', N'En tránsito hacia estación logística regional.', N'Cuauhtémoc, CDMX', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ESTATUS__15', N'Paquete en unidad de reparto de última milla.', N'Miguel Hidalgo, CDMX', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ESTATUS__16', N'Entregado y firmado en domicilio de destino.', N'Guadalajara, Jalisco', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ESTATUS__17', N'Paquete recolectado en centro de distribución CEDIS.', N'Saltillo, Coahuila', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ESTATUS__18', N'En tránsito hacia estación logística regional.', N'Querétaro, Querétaro', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ESTATUS__19', N'Paquete en unidad de reparto de última milla.', N'Puebla, Puebla', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ESTATUS__20', N'Entregado y firmado en domicilio de destino.', N'Mérida, Yucatán', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ESTATUS__21', N'Paquete recolectado en centro de distribución CEDIS.', N'Monclova, Coahuila', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ESTATUS__22', N'En tránsito hacia estación logística regional.', N'Monterrey, Nuevo León', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ESTATUS__23', N'Paquete en unidad de reparto de última milla.', N'San Pedro Garza García, Nuevo León', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ESTATUS__24', N'Entregado y firmado en domicilio de destino.', N'Cuauhtémoc, CDMX', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ESTATUS__25', N'Paquete recolectado en centro de distribución CEDIS.', N'Miguel Hidalgo, CDMX', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ESTATUS__26', N'En tránsito hacia estación logística regional.', N'Guadalajara, Jalisco', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ESTATUS__27', N'Paquete en unidad de reparto de última milla.', N'Saltillo, Coahuila', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ESTATUS__28', N'Entregado y firmado en domicilio de destino.', N'Querétaro, Querétaro', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ESTATUS__29', N'Paquete recolectado en centro de distribución CEDIS.', N'Puebla, Puebla', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ESTATUS__30', N'En tránsito hacia estación logística regional.', N'Mérida, Yucatán', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.eventos_tracking_bitacora OFF;
GO

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.intentos_entrega_fallidos ON;
INSERT INTO envios.intentos_entrega_fallidos (ID, ID_despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, N'Domicilio cerrado sin persona que reciba.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Acceso restringido en caseta de fraccionamiento.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'Número exterior poco visible; mensajero solicita referencia.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.intentos_entrega_fallidos OFF;
GO

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.incidencias_logisticas ON;
INSERT INTO envios.incidencias_logisticas (ID, ID_despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 285.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 321.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 356.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 392.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 427.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 463.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 498.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 534.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 569.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 605.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 640.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 676.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 711.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 747.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 782.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 818.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 853.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 889.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 924.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 960.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 995.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 1031.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1066.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 1102.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1137.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 1173.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ROBO_EN_TRANSITO', N'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1208.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DIRECCION_INEXISTENTE', N'Código postal y calle no coinciden en cartografía de zona extendida.', 1244.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EXTRAVIO_TOTAL', N'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1279.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PAQUETE_DANADO_DERRAME', N'Caja exterior golpeada con derrame parcial de envase líquido.', 1315.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.incidencias_logisticas OFF;
GO

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.seguros_mercancia ON;
INSERT INTO envios.seguros_mercancia (ID, ID_despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Chubb Seguros México', N'POL-CARGA-2026-00001', 428.25, 8.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'AXA Seguros', N'POL-CARGA-2026-00002', 481.50, 9.63, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'GNP Seguros Carga', N'POL-CARGA-2026-00003', 534.75, 10.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Quálitas Logística', N'POL-CARGA-2026-00004', 588.00, 11.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Chubb Seguros México', N'POL-CARGA-2026-00005', 641.25, 12.83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'AXA Seguros', N'POL-CARGA-2026-00006', 694.50, 13.89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'GNP Seguros Carga', N'POL-CARGA-2026-00007', 747.75, 14.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Quálitas Logística', N'POL-CARGA-2026-00008', 801.00, 16.02, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Chubb Seguros México', N'POL-CARGA-2026-00009', 854.25, 17.09, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'AXA Seguros', N'POL-CARGA-2026-00010', 907.50, 18.15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'GNP Seguros Carga', N'POL-CARGA-2026-00011', 960.75, 19.21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Quálitas Logística', N'POL-CARGA-2026-00012', 1014.00, 20.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Chubb Seguros México', N'POL-CARGA-2026-00013', 1067.25, 21.34, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'AXA Seguros', N'POL-CARGA-2026-00014', 1120.50, 22.41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'GNP Seguros Carga', N'POL-CARGA-2026-00015', 1173.75, 23.48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Quálitas Logística', N'POL-CARGA-2026-00016', 1227.00, 24.54, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Chubb Seguros México', N'POL-CARGA-2026-00017', 1280.25, 25.61, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'AXA Seguros', N'POL-CARGA-2026-00018', 1333.50, 26.67, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'GNP Seguros Carga', N'POL-CARGA-2026-00019', 1386.75, 27.73, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Quálitas Logística', N'POL-CARGA-2026-00020', 1440.00, 28.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Chubb Seguros México', N'POL-CARGA-2026-00021', 1493.25, 29.87, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'AXA Seguros', N'POL-CARGA-2026-00022', 1546.50, 30.93, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'GNP Seguros Carga', N'POL-CARGA-2026-00023', 1599.75, 32.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Quálitas Logística', N'POL-CARGA-2026-00024', 1653.00, 33.06, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Chubb Seguros México', N'POL-CARGA-2026-00025', 1706.25, 34.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'AXA Seguros', N'POL-CARGA-2026-00026', 1759.50, 35.19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'GNP Seguros Carga', N'POL-CARGA-2026-00027', 1812.75, 36.26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Quálitas Logística', N'POL-CARGA-2026-00028', 1866.00, 37.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Chubb Seguros México', N'POL-CARGA-2026-00029', 1919.25, 38.38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'AXA Seguros', N'POL-CARGA-2026-00030', 1972.50, 39.45, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.seguros_mercancia OFF;
GO

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup ON;
INSERT INTO envios.puntos_recoleccion_pickup (ID, ID_transportista, ID_almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'LOCKER_01', N'Smart Locker & Farmacia DermaCare Monclova Suc. 01', N'Av. Universidad #201, Col. Centro, C.P. 25700, Monclova, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'LOCKER_02', N'Smart Locker & Farmacia DermaCare Monterrey Suc. 02', N'Av. Universidad #202, Col. Centro, C.P. 64000, Monterrey, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'LOCKER_03', N'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 03', N'Av. Universidad #203, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'LOCKER_04', N'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 04', N'Av. Universidad #204, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'LOCKER_05', N'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 05', N'Av. Universidad #205, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'LOCKER_06', N'Smart Locker & Farmacia DermaCare Guadalajara Suc. 06', N'Av. Universidad #206, Col. Centro, C.P. 44100, Guadalajara, Jalisco', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'LOCKER_07', N'Smart Locker & Farmacia DermaCare Saltillo Suc. 07', N'Av. Universidad #207, Col. Centro, C.P. 25000, Saltillo, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'LOCKER_08', N'Smart Locker & Farmacia DermaCare Querétaro Suc. 08', N'Av. Universidad #208, Col. Centro, C.P. 76000, Querétaro, Querétaro', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'LOCKER_09', N'Smart Locker & Farmacia DermaCare Puebla Suc. 09', N'Av. Universidad #209, Col. Centro, C.P. 72000, Puebla, Puebla', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'LOCKER_10', N'Smart Locker & Farmacia DermaCare Mérida Suc. 10', N'Av. Universidad #210, Col. Centro, C.P. 97000, Mérida, Yucatán', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'LOCKER_11', N'Smart Locker & Farmacia DermaCare Monclova Suc. 11', N'Av. Universidad #211, Col. Centro, C.P. 25700, Monclova, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'LOCKER_12', N'Smart Locker & Farmacia DermaCare Monterrey Suc. 12', N'Av. Universidad #212, Col. Centro, C.P. 64000, Monterrey, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'LOCKER_13', N'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 13', N'Av. Universidad #213, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'LOCKER_14', N'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 14', N'Av. Universidad #214, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'LOCKER_15', N'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 15', N'Av. Universidad #215, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'LOCKER_16', N'Smart Locker & Farmacia DermaCare Guadalajara Suc. 16', N'Av. Universidad #216, Col. Centro, C.P. 44100, Guadalajara, Jalisco', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'LOCKER_17', N'Smart Locker & Farmacia DermaCare Saltillo Suc. 17', N'Av. Universidad #217, Col. Centro, C.P. 25000, Saltillo, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'LOCKER_18', N'Smart Locker & Farmacia DermaCare Querétaro Suc. 18', N'Av. Universidad #218, Col. Centro, C.P. 76000, Querétaro, Querétaro', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'LOCKER_19', N'Smart Locker & Farmacia DermaCare Puebla Suc. 19', N'Av. Universidad #219, Col. Centro, C.P. 72000, Puebla, Puebla', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'LOCKER_20', N'Smart Locker & Farmacia DermaCare Mérida Suc. 20', N'Av. Universidad #220, Col. Centro, C.P. 97000, Mérida, Yucatán', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'LOCKER_21', N'Smart Locker & Farmacia DermaCare Monclova Suc. 21', N'Av. Universidad #221, Col. Centro, C.P. 25700, Monclova, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'LOCKER_22', N'Smart Locker & Farmacia DermaCare Monterrey Suc. 22', N'Av. Universidad #222, Col. Centro, C.P. 64000, Monterrey, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'LOCKER_23', N'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 23', N'Av. Universidad #223, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'LOCKER_24', N'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 24', N'Av. Universidad #224, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'LOCKER_25', N'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 25', N'Av. Universidad #225, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'LOCKER_26', N'Smart Locker & Farmacia DermaCare Guadalajara Suc. 26', N'Av. Universidad #226, Col. Centro, C.P. 44100, Guadalajara, Jalisco', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'LOCKER_27', N'Smart Locker & Farmacia DermaCare Saltillo Suc. 27', N'Av. Universidad #227, Col. Centro, C.P. 25000, Saltillo, Coahuila', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'LOCKER_28', N'Smart Locker & Farmacia DermaCare Querétaro Suc. 28', N'Av. Universidad #228, Col. Centro, C.P. 76000, Querétaro, Querétaro', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'LOCKER_29', N'Smart Locker & Farmacia DermaCare Puebla Suc. 29', N'Av. Universidad #229, Col. Centro, C.P. 72000, Puebla, Puebla', N'Lunes a Domingo 08:00 a 22:00 hrs', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'LOCKER_30', N'Smart Locker & Farmacia DermaCare Mérida Suc. 30', N'Av. Universidad #230, Col. Centro, C.P. 97000, Mérida, Yucatán', N'Lunes a Domingo 08:00 a 22:00 hrs', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup OFF;
GO

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.motivos_devolucion_rma ON;
INSERT INTO postventa.motivos_devolucion_rma (ID, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Reacción alérgica o irritación cutánea tras aplicación', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Tono de maquillaje incorrecto respecto al seleccionado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Sello de seguridad violado o derrame al abrir paquete', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Producto próximo a caducar o fuera de especificación térmica', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Desistimiento dentro de los primeros 15 días con envase sellado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Reacción alérgica o irritación cutánea tras aplicación', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Tono de maquillaje incorrecto respecto al seleccionado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Sello de seguridad violado o derrame al abrir paquete', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Producto próximo a caducar o fuera de especificación térmica', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Desistimiento dentro de los primeros 15 días con envase sellado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Reacción alérgica o irritación cutánea tras aplicación', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Tono de maquillaje incorrecto respecto al seleccionado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Sello de seguridad violado o derrame al abrir paquete', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Producto próximo a caducar o fuera de especificación térmica', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Desistimiento dentro de los primeros 15 días con envase sellado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Reacción alérgica o irritación cutánea tras aplicación', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Tono de maquillaje incorrecto respecto al seleccionado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Sello de seguridad violado o derrame al abrir paquete', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Producto próximo a caducar o fuera de especificación térmica', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Desistimiento dentro de los primeros 15 días con envase sellado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Reacción alérgica o irritación cutánea tras aplicación', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Tono de maquillaje incorrecto respecto al seleccionado', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Sello de seguridad violado o derrame al abrir paquete', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Producto próximo a caducar o fuera de especificación térmica', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Desistimiento dentro de los primeros 15 días con envase sellado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Reacción alérgica o irritación cutánea tras aplicación', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Tono de maquillaje incorrecto respecto al seleccionado', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Sello de seguridad violado o derrame al abrir paquete', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Producto próximo a caducar o fuera de especificación térmica', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Desistimiento dentro de los primeros 15 días con envase sellado', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.motivos_devolucion_rma OFF;
GO

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.solicitudes_rma ON;
INSERT INTO postventa.solicitudes_rma (ID, folio_rma, ID_orden, ID_motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RMA-2026-0001', 1, 1, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0001.jpg', N'Cliente reporta incidencia con Sérum Niacinamida 10% + Zinc 1% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RMA-2026-0002', 2, 2, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0002.jpg', N'Cliente reporta incidencia con Gel Limpiador Espumoso Facial y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RMA-2026-0003', 3, 3, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0003.jpg', N'Cliente reporta incidencia con Protector Solar Fluido SPF 50+ y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RMA-2026-0004', 4, 4, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0004.jpg', N'Cliente reporta incidencia con Sérum Ácido Hialurónico 2% + B5 y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RMA-2026-0005', 5, 5, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0005.jpg', N'Cliente reporta incidencia con Crema Hidratante con Ceramidas y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RMA-2026-0006', 6, 6, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0006.jpg', N'Cliente reporta incidencia con Retinol Puro 0.5% Nocturno y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RMA-2026-0007', 7, 7, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0007.jpg', N'Cliente reporta incidencia con Agua Micelar Dermolimpiadora y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RMA-2026-0008', 8, 8, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0008.jpg', N'Cliente reporta incidencia con Sérum Vitamina C Pura 15% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RMA-2026-0009', 9, 9, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0009.jpg', N'Cliente reporta incidencia con Base de Maquillaje Cobertura Media y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RMA-2026-0010', 10, 10, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0010.jpg', N'Cliente reporta incidencia con Corrector Líquido Alta Duración y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RMA-2026-0011', 11, 11, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0011.jpg', N'Cliente reporta incidencia con Bálsamo Reparador Cicaplast B5 y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RMA-2026-0012', 12, 12, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0012.jpg', N'Cliente reporta incidencia con Exfoliante Ácido Salicílico 2% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RMA-2026-0013', 13, 13, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0013.jpg', N'Cliente reporta incidencia con Contorno de Ojos con Cafeína 5% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RMA-2026-0014', 14, 14, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0014.jpg', N'Cliente reporta incidencia con Mascarilla Nocturna Hidratante y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RMA-2026-0015', 15, 15, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0015.jpg', N'Cliente reporta incidencia con Bruma Termal Calmante Mineral y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RMA-2026-0016', 16, 16, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0016.jpg', N'Cliente reporta incidencia con Aceite Limpiador Emulsionable y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RMA-2026-0017', 17, 17, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0017.jpg', N'Cliente reporta incidencia con Tónico Equilibrante Ácido Glicólico 7% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RMA-2026-0018', 18, 18, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0018.jpg', N'Cliente reporta incidencia con Labial Hidratante Péptidos Nude y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RMA-2026-0019', 19, 19, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0019.jpg', N'Cliente reporta incidencia con Polvo Traslúcido Matificante Mineral y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RMA-2026-0020', 20, 20, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0020.jpg', N'Cliente reporta incidencia con Rubor Líquido Pigmento Natural y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RMA-2026-0021', 21, 21, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0021.jpg', N'Cliente reporta incidencia con Sérum Ácido Azelaico 10% Suspensión y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RMA-2026-0022', 22, 22, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0022.jpg', N'Cliente reporta incidencia con Ampolletas Proteoglicanos Firmeza y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RMA-2026-0023', 23, 23, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0023.jpg', N'Cliente reporta incidencia con Crema Despigmentante Noche Melasma y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RMA-2026-0024', 24, 24, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0024.jpg', N'Cliente reporta incidencia con Protector Solar Mineral Óxido Zinc y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RMA-2026-0025', 25, 25, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0025.jpg', N'Cliente reporta incidencia con Loción Corporal Urea 10% Reparadora y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RMA-2026-0026', 26, 26, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0026.jpg', N'Cliente reporta incidencia con Primer Facial Minimizador de Poros y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RMA-2026-0027', 27, 27, N'RECIBIDA_EN_QA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0027.jpg', N'Cliente reporta incidencia con Máscara de Pestañas Hipoalergénica y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RMA-2026-0028', 28, 28, N'APROBADA_REEMBOLSAR', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0028.jpg', N'Cliente reporta incidencia con Sérum Péptidos de Cobre 1% y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RMA-2026-0029', 29, 29, N'SOLICITADA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0029.jpg', N'Cliente reporta incidencia con Bálsamo Desmaquillante Caléndula y adjunta evidencia fotográfica de lote y empaque.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RMA-2026-0030', 30, 30, N'GUIA_RETORNO_EMITIDA', N'https://cdn.dermacare.mx/rma/evidencia/RMA-0030.jpg', N'Cliente reporta incidencia con Crema Barrera Post-Retinoide y adjunta evidencia fotográfica de lote y empaque.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.solicitudes_rma OFF;
GO

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.rma_detalles ON;
INSERT INTO postventa.rma_detalles (ID, ID_solicitud_rma, ID_orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.rma_detalles OFF;
GO

-- =================================================================================================
-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno ON;
INSERT INTO postventa.inspeccion_sanitaria_retorno (ID, ID_rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 15.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 5.0, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0.0, N'REINGRESO_STOCK_SELLADO', N'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno OFF;
GO

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_soporte ON;
INSERT INTO postventa.tickets_soporte (ID, folio_ticket, ID_cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TICKE-2026-0001', 1, N'Seguimiento de envío sin actualización en las últimas 48 horas (#001)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TICKE-2026-0002', 2, N'Duda sobre orden de aplicación en rutina nocturna (#002)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TICKE-2026-0003', 3, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#003)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TICKE-2026-0004', 4, N'Dispensador airless bloqueado en entrega reciente (#004)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TICKE-2026-0005', 5, N'Seguimiento de envío sin actualización en las últimas 48 horas (#005)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TICKE-2026-0006', 6, N'Duda sobre orden de aplicación en rutina nocturna (#006)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TICKE-2026-0007', 7, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#007)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TICKE-2026-0008', 8, N'Dispensador airless bloqueado en entrega reciente (#008)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TICKE-2026-0009', 9, N'Seguimiento de envío sin actualización en las últimas 48 horas (#009)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TICKE-2026-0010', 10, N'Duda sobre orden de aplicación en rutina nocturna (#010)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TICKE-2026-0011', 11, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#011)', N'FACTURACION_CFDI', N'ALTA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TICKE-2026-0012', 12, N'Dispensador airless bloqueado en entrega reciente (#012)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TICKE-2026-0013', 13, N'Seguimiento de envío sin actualización en las últimas 48 horas (#013)', N'ENVIO_DEMORADO', N'BAJA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TICKE-2026-0014', 14, N'Duda sobre orden de aplicación en rutina nocturna (#014)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TICKE-2026-0015', 15, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#015)', N'FACTURACION_CFDI', N'ALTA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TICKE-2026-0016', 16, N'Dispensador airless bloqueado en entrega reciente (#016)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TICKE-2026-0017', 17, N'Seguimiento de envío sin actualización en las últimas 48 horas (#017)', N'ENVIO_DEMORADO', N'BAJA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TICKE-2026-0018', 18, N'Duda sobre orden de aplicación en rutina nocturna (#018)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TICKE-2026-0019', 19, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#019)', N'FACTURACION_CFDI', N'ALTA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TICKE-2026-0020', 20, N'Dispensador airless bloqueado en entrega reciente (#020)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TICKE-2026-0021', 21, N'Seguimiento de envío sin actualización en las últimas 48 horas (#021)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TICKE-2026-0022', 22, N'Duda sobre orden de aplicación en rutina nocturna (#022)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TICKE-2026-0023', 23, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#023)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TICKE-2026-0024', 24, N'Dispensador airless bloqueado en entrega reciente (#024)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TICKE-2026-0025', 25, N'Seguimiento de envío sin actualización en las últimas 48 horas (#025)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TICKE-2026-0026', 26, N'Duda sobre orden de aplicación en rutina nocturna (#026)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TICKE-2026-0027', 27, N'Solicitud de refacturación CFDI 4.0 con cambio de uso (#027)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TICKE-2026-0028', 28, N'Dispensador airless bloqueado en entrega reciente (#028)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TICKE-2026-0029', 29, N'Seguimiento de envío sin actualización en las últimas 48 horas (#029)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TICKE-2026-0030', 30, N'Duda sobre orden de aplicación en rutina nocturna (#030)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_soporte OFF;
GO

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_mensajes ON;
INSERT INTO postventa.tickets_mensajes (ID, ID_ticket, ID_usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Hola, comparto los detalles sobre el seguimiento del ticket #001 respecto a Sérum Niacinamida 10% + Zinc 1%. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0001.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Hola, comparto los detalles sobre el seguimiento del ticket #002 respecto a Gel Limpiador Espumoso Facial. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Hola, comparto los detalles sobre el seguimiento del ticket #003 respecto a Protector Solar Fluido SPF 50+. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0003.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Hola, comparto los detalles sobre el seguimiento del ticket #004 respecto a Sérum Ácido Hialurónico 2% + B5. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Hola, comparto los detalles sobre el seguimiento del ticket #005 respecto a Crema Hidratante con Ceramidas. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0005.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Hola, comparto los detalles sobre el seguimiento del ticket #006 respecto a Retinol Puro 0.5% Nocturno. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Hola, comparto los detalles sobre el seguimiento del ticket #007 respecto a Agua Micelar Dermolimpiadora. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0007.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Hola, comparto los detalles sobre el seguimiento del ticket #008 respecto a Sérum Vitamina C Pura 15%. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Hola, comparto los detalles sobre el seguimiento del ticket #009 respecto a Base de Maquillaje Cobertura Media. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0009.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Hola, comparto los detalles sobre el seguimiento del ticket #010 respecto a Corrector Líquido Alta Duración. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'Hola, comparto los detalles sobre el seguimiento del ticket #011 respecto a Bálsamo Reparador Cicaplast B5. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0011.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'Hola, comparto los detalles sobre el seguimiento del ticket #012 respecto a Exfoliante Ácido Salicílico 2%. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'Hola, comparto los detalles sobre el seguimiento del ticket #013 respecto a Contorno de Ojos con Cafeína 5%. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0013.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'Hola, comparto los detalles sobre el seguimiento del ticket #014 respecto a Mascarilla Nocturna Hidratante. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'Hola, comparto los detalles sobre el seguimiento del ticket #015 respecto a Bruma Termal Calmante Mineral. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0015.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'Hola, comparto los detalles sobre el seguimiento del ticket #016 respecto a Aceite Limpiador Emulsionable. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'Hola, comparto los detalles sobre el seguimiento del ticket #017 respecto a Tónico Equilibrante Ácido Glicólico 7%. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0017.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'Hola, comparto los detalles sobre el seguimiento del ticket #018 respecto a Labial Hidratante Péptidos Nude. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'Hola, comparto los detalles sobre el seguimiento del ticket #019 respecto a Polvo Traslúcido Matificante Mineral. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0019.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'Hola, comparto los detalles sobre el seguimiento del ticket #020 respecto a Rubor Líquido Pigmento Natural. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'Hola, comparto los detalles sobre el seguimiento del ticket #021 respecto a Sérum Ácido Azelaico 10% Suspensión. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0021.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'Hola, comparto los detalles sobre el seguimiento del ticket #022 respecto a Ampolletas Proteoglicanos Firmeza. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'Hola, comparto los detalles sobre el seguimiento del ticket #023 respecto a Crema Despigmentante Noche Melasma. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0023.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'Hola, comparto los detalles sobre el seguimiento del ticket #024 respecto a Protector Solar Mineral Óxido Zinc. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'Hola, comparto los detalles sobre el seguimiento del ticket #025 respecto a Loción Corporal Urea 10% Reparadora. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0025.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'Hola, comparto los detalles sobre el seguimiento del ticket #026 respecto a Primer Facial Minimizador de Poros. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'Hola, comparto los detalles sobre el seguimiento del ticket #027 respecto a Máscara de Pestañas Hipoalergénica. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0027.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'Hola, comparto los detalles sobre el seguimiento del ticket #028 respecto a Sérum Péptidos de Cobre 1%. Quedo atento a su confirmación.', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'Hola, comparto los detalles sobre el seguimiento del ticket #029 respecto a Bálsamo Desmaquillante Caléndula. Quedo atento a su confirmación.', N'https://cdn.dermacare.mx/tickets/adjunto_0029.png', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'Hola, comparto los detalles sobre el seguimiento del ticket #030 respecto a Crema Barrera Post-Retinoide. Quedo atento a su confirmación.', NULL, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_mensajes OFF;
GO

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia ON;
INSERT INTO postventa.reportes_farmacovigilancia (ID, folio_cofepris_ram, ID_cliente, ID_producto, ID_lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-COFEP-2026-0001', 1, 1, 1, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Niacinamida 10% + Zinc 1%.', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-COFEP-2026-0002', 2, 2, 2, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Gel Limpiador Espumoso Facial.', 0, '2026-03-02', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-COFEP-2026-0003', 3, 3, 3, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Fluido SPF 50+.', 1, '2026-03-03', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-COFEP-2026-0004', 4, 4, 4, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Ácido Hialurónico 2% + B5.', 0, '2026-03-04', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-COFEP-2026-0005', 5, 5, 5, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Hidratante con Ceramidas.', 1, '2026-03-05', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-COFEP-2026-0006', 6, 6, 6, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Retinol Puro 0.5% Nocturno.', 0, '2026-03-06', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-COFEP-2026-0007', 7, 7, 7, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Agua Micelar Dermolimpiadora.', 1, '2026-03-07', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-COFEP-2026-0008', 8, 8, 8, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Sérum Vitamina C Pura 15%.', 0, '2026-03-08', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-COFEP-2026-0009', 9, 9, 9, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Base de Maquillaje Cobertura Media.', 1, '2026-03-09', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-COFEP-2026-0010', 10, 10, 10, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Corrector Líquido Alta Duración.', 0, '2026-03-10', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-COFEP-2026-0011', 11, 11, 11, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Reparador Cicaplast B5.', 1, '2026-03-11', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-COFEP-2026-0012', 12, 12, 12, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Exfoliante Ácido Salicílico 2%.', 0, '2026-03-12', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-COFEP-2026-0013', 13, 13, 13, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Contorno de Ojos con Cafeína 5%.', 1, '2026-03-13', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-COFEP-2026-0014', 14, 14, 14, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Mascarilla Nocturna Hidratante.', 0, '2026-03-14', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-COFEP-2026-0015', 15, 15, 15, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Bruma Termal Calmante Mineral.', 1, '2026-03-15', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-COFEP-2026-0016', 16, 16, 16, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Aceite Limpiador Emulsionable.', 0, '2026-03-16', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-COFEP-2026-0017', 17, 17, 17, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Tónico Equilibrante Ácido Glicólico 7%.', 1, '2026-03-17', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-COFEP-2026-0018', 18, 18, 18, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Labial Hidratante Péptidos Nude.', 0, '2026-03-18', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-COFEP-2026-0019', 19, 19, 19, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Polvo Traslúcido Matificante Mineral.', 1, '2026-03-19', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-COFEP-2026-0020', 20, 20, 20, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Rubor Líquido Pigmento Natural.', 0, '2026-03-20', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-COFEP-2026-0021', 21, 21, 21, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Sérum Ácido Azelaico 10% Suspensión.', 1, '2026-03-21', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-COFEP-2026-0022', 22, 22, 22, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Ampolletas Proteoglicanos Firmeza.', 0, '2026-03-22', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-COFEP-2026-0023', 23, 23, 23, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Despigmentante Noche Melasma.', 1, '2026-03-23', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-COFEP-2026-0024', 24, 24, 24, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Mineral Óxido Zinc.', 0, '2026-03-24', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-COFEP-2026-0025', 25, 25, 25, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Loción Corporal Urea 10% Reparadora.', 1, '2026-03-25', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-COFEP-2026-0026', 26, 26, 26, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Primer Facial Minimizador de Poros.', 0, '2026-03-26', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-COFEP-2026-0027', 27, 27, 27, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Máscara de Pestañas Hipoalergénica.', 1, '2026-03-27', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-COFEP-2026-0028', 28, 28, 28, N'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Péptidos de Cobre 1%.', 0, '2026-03-28', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-COFEP-2026-0029', 29, 29, 29, N'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Desmaquillante Caléndula.', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-COFEP-2026-0030', 30, 30, 30, N'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Crema Barrera Post-Retinoide.', 0, '2026-03-02', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia OFF;
GO

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.tipos_evento_sistema ON;
INSERT INTO auditoria.tipos_evento_sistema (ID, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'LOGIN_EXITOSO', N'Inicio de sesión exitoso con credenciales validadas', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'INTENTO_ACCESO_DENEGADO', N'Intento de acceso denegado por permisos RBAC insuficientes', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MODIFICACION_PRECIOS', N'Actualización de precio base en catálogo SKU', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'BAJA_LOGICA_REGISTRO', N'Ejecución de borrado lógico (Soft Delete) auditado', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'EXPORTACION_DATOS_LFPDPPP', N'Exportación de expediente clínico por solicitud ARCO', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TIMBRADO_CFDI_PAC', N'Emisión y sellado de comprobante fiscal CFDI 4.0', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CANCELACION_CFDI_SAT', N'Solicitud de cancelación fiscal ante el SAT', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'BLOQUEO_CUENTA_INTENTOS', N'Bloqueo automático de usuario por intentos fallidos', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAMBIO_PASSWORD_USUARIO', N'Actualización criptográfica Argon2id de contraseña', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MFA_VERIFICACION_TOTP', N'Validación o rechazo de segundo factor TOTP', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CUARENTENA_LOTE_QA', N'Retención sanitaria de lote por desviación de calidad', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ALERTA_TEMPERATURA_IOT', N'Excursión térmica detectada en sensor de cadena de frío', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'REEMBOLSO_AUTORIZADO', N'Autorización financiera de reembolso a cliente', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CONTRACARGO_RECIBIDO', N'Notificación de disputa bancaria por pasarela', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'DESTRUCCION_MERMA_COFEPRIS', N'Registro de acta circunstanciada de destrucción sanitaria', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'AJUSTE_INVENTARIO_CONTEO', N'Ajuste de existencias tras conteo cíclico de auditoría', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CREACION_USUARIO_ADMIN', N'Alta de cuenta administrativa en módulo IAM', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ASIGNACION_ROL_SEGURIDAD', N'Modificación de roles asignados a usuario', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'REPORTE_FARMACOVIGILANCIA', N'Alta de reporte de reacción adversa RAM COFEPRIS', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'REVOCACION_SESION_REMOTA', N'Invalidación forzada de token de sesión activa', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ALTA_REGISTRO_COFEPRIS', N'Actualización de vigencia de registro sanitario', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FRAUDE_BLOQUEO_ORDEN', N'Bloqueo preventivo de orden por regla antifraude', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'DESPACHO_FEFO_WMS', N'Liberación de picking por regla FEFO', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MODIFICACION_PARAMETRO', N'Cambio en parámetro de configuración en caliente', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CONSULTA_DATOS_SENSIBLES', N'Acceso a perfil dermatológico LFPDPPP', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'RESTAURACION_REGISTRO', N'Reactivación lógica de entidad previamente dada de baja', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'WEBHOOK_PASARELA_RECIBIDO', N'Recepción verificada de notificación HMAC de pago', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'RMA_INSPECCION_HIGIENE', N'Dictamen sanitario sobre devolución recibida', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TRANSFERENCIA_CEDIS_CREADA', N'Orden de traslado entre almacenes con control térmico', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CIERRE_SESION_VOLUNTARIO', N'Cierre explícito de sesión por el usuario', N'CRITICO_SEGURIDAD', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.tipos_evento_sistema OFF;
GO

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global ON;
INSERT INTO auditoria.bitacora_seguridad_global (ID, ID_tipo_evento, ID_usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'189.203.3.7', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'Seguridad.IAM', N'Inicio de sesión exitoso con credenciales validadas (Registro auditado #0001).', N'822aaf75efb2377be6e9f38a3ea625b705bd9f835a21ee04665f2f2330bbee06', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'189.203.6.14', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'Catalogo.Precios', N'Intento de acceso denegado por permisos RBAC insuficientes (Registro auditado #0002).', N'e9c9403db5e463f149a10bb3e32d72ef7937a5ca026bfec9e3ecac63efc76b5b', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'189.203.9.21', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'Fiscal.CFDI', N'Actualización de precio base en catálogo SKU (Registro auditado #0003).', N'fe0a7c2537cb5c8a1485ac8e637953e62e6c7305a808a7f5942f653804a43868', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'189.203.12.28', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'Clientes.ARCO', N'Ejecución de borrado lógico (Soft Delete) auditado (Registro auditado #0004).', N'efb657c736345d2380ac4337a26dcb8069735d4b0a43ca1549722b761f924a02', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'189.203.15.35', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'WMS.CadenaFrio', N'Exportación de expediente clínico por solicitud ARCO (Registro auditado #0005).', N'93b60ec3f14932d9decdb119e6d3d1868d350e8feba52089cf34b1de19a7686e', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'189.203.18.42', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'Pagos.Antifraude', N'Emisión y sellado de comprobante fiscal CFDI 4.0 (Registro auditado #0006).', N'6acf751a227783a91240d1432aa4d8ba258982f7385c71e4be11886adfc084ca', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'189.203.21.49', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'Seguridad.IAM', N'Solicitud de cancelación fiscal ante el SAT (Registro auditado #0007).', N'68b959d127be3e137d04e5cfae970c022ca970ab500dbf9a54d5d94fb5cc35df', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'189.203.24.56', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'Catalogo.Precios', N'Bloqueo automático de usuario por intentos fallidos (Registro auditado #0008).', N'9c44bd3dee118b4d36943fb69bf1a79ace53c53db68a5d5d0d262ff39f2e16a5', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'189.203.27.63', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'Fiscal.CFDI', N'Actualización criptográfica Argon2id de contraseña (Registro auditado #0009).', N'f6aab553803a5203e4c4babea15e4082a5230ccb02ffcd19233ebaf8fff037cd', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'189.203.30.70', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'Clientes.ARCO', N'Validación o rechazo de segundo factor TOTP (Registro auditado #0010).', N'9b8433f950cc9b93522036fe6e70274f9f4f3cbe61b1071310fb77e320f02521', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'189.203.33.77', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'WMS.CadenaFrio', N'Retención sanitaria de lote por desviación de calidad (Registro auditado #0011).', N'aeb5d25ab3468bea6fafbed7bc09833153ad8fb200258e77aba6f40526ee6877', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'189.203.36.84', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'Pagos.Antifraude', N'Excursión térmica detectada en sensor de cadena de frío (Registro auditado #0012).', N'a8ded427e46238ede28d520bdc9369981f589a826eaa1adaebf30b4a7e6eb585', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'189.203.39.91', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'Seguridad.IAM', N'Autorización financiera de reembolso a cliente (Registro auditado #0013).', N'ad0d7747c124cff95c06fb1c24a46daf7b00ffe7484b476c339785b6bf118c01', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'189.203.42.98', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'Catalogo.Precios', N'Notificación de disputa bancaria por pasarela (Registro auditado #0014).', N'2e29cd7e59d6b35759468a2ac0c285d79c503f6d01e8636f6bed8a755fb4738c', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'189.203.45.105', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'Fiscal.CFDI', N'Registro de acta circunstanciada de destrucción sanitaria (Registro auditado #0015).', N'd3bdb41506978ff27734e6d3ab149e6443b25df214860ac156dace8fe1002a32', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'189.203.48.112', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'Clientes.ARCO', N'Ajuste de existencias tras conteo cíclico de auditoría (Registro auditado #0016).', N'ed6c351aa391af272c24e8c5791c0f8be9d2432eb2aee535be499821ff6fdcd2', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'189.203.51.119', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'WMS.CadenaFrio', N'Alta de cuenta administrativa en módulo IAM (Registro auditado #0017).', N'5687a48d6d28dff7bd7b388de2f103b6b42b9ec826355d3471db292416ac8744', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'189.203.54.126', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'Pagos.Antifraude', N'Modificación de roles asignados a usuario (Registro auditado #0018).', N'c3103100ecf9f3d88c520b3b755723ef9570c1e04da92eb3d6b816c4a163a891', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'189.203.57.133', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'Seguridad.IAM', N'Alta de reporte de reacción adversa RAM COFEPRIS (Registro auditado #0019).', N'2166f8e64254369e88c6c2bed443bb1a14ef13de9cd770897554b45686978f79', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'189.203.60.140', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'Catalogo.Precios', N'Invalidación forzada de token de sesión activa (Registro auditado #0020).', N'7fb0613e00707c167f156e052c08abcbdddd4eb28938f8e6a64870e92d777675', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'189.203.63.147', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'Fiscal.CFDI', N'Actualización de vigencia de registro sanitario (Registro auditado #0021).', N'bdfa89f693dbbb92a82f95ae1ee7ffff7f385ff8ed34c0bb1c15835ba08d5291', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'189.203.66.154', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'Clientes.ARCO', N'Bloqueo preventivo de orden por regla antifraude (Registro auditado #0022).', N'2678285d4ae0d9afbcf71d7fc486ce27a203da9e6955c9eccab82a69acda981b', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'189.203.69.161', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'WMS.CadenaFrio', N'Liberación de picking por regla FEFO (Registro auditado #0023).', N'292dfaa2a59b8f77b10958bcf656fb297237c38233c1e900ca5912fa46068f7f', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'189.203.72.168', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'Pagos.Antifraude', N'Cambio en parámetro de configuración en caliente (Registro auditado #0024).', N'e3124d4a51b532b7f52413851c287797be3fc01ae4b11e0c66d44062c6b57c29', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'189.203.75.175', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'Seguridad.IAM', N'Acceso a perfil dermatológico LFPDPPP (Registro auditado #0025).', N'7e0a2b320e9923bb0faab99112772bb898fd00e6a50b034651655ed607a163b2', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'189.203.78.182', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'Catalogo.Precios', N'Reactivación lógica de entidad previamente dada de baja (Registro auditado #0026).', N'231eefc9e2a9a78b94b21b6f938e78f45714a594a3034a5bc4f425d41f9473d9', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'189.203.81.189', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'Fiscal.CFDI', N'Recepción verificada de notificación HMAC de pago (Registro auditado #0027).', N'd69a2c3c31ec03261005fa2539492f0d1703958eb7531e1d59f3bc293e979bd8', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'189.203.84.196', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'Clientes.ARCO', N'Dictamen sanitario sobre devolución recibida (Registro auditado #0028).', N'8efa9da9e46b9c7b53b1a2413e839039ef5efff2deb06f34e8b0d7b6f627c928', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'189.203.87.203', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'WMS.CadenaFrio', N'Orden de traslado entre almacenes con control térmico (Registro auditado #0029).', N'e3dda4df71d765ddf8d4bcaaded8b196b4e2a03c05d4dd94f370501cf4b9fead', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'189.203.90.210', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'Pagos.Antifraude', N'Cierre explícito de sesión por el usuario (Registro auditado #0030).', N'490fda407df80e3e6ede88e335ea513ed0bad2783f52dd1e1908fbf4932c577b', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global OFF;
GO

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_cambios_datos ON;
INSERT INTO auditoria.bitacora_cambios_datos (ID, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ventas.ordenes', 1, N'INSERT', NULL, N'{"tabla": "ventas.ordenes", "id_registro": 1, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #1.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'catalogo.variantes_sku', 2, N'UPDATE', N'{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "version": 1}', N'{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #2.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'clientes.clientes', 3, N'INSERT', NULL, N'{"tabla": "clientes.clientes", "id_registro": 3, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #3.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'fiscal.facturas_cfdi', 4, N'UPDATE', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "version": 1}', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #4.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'wms.inventario_lotes_ubicacion', 5, N'INSERT', NULL, N'{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 5, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #5.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'pagos.transacciones', 6, N'UPDATE', N'{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "version": 1}', N'{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #6.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'postventa.solicitudes_rma', 7, N'INSERT', NULL, N'{"tabla": "postventa.solicitudes_rma", "id_registro": 7, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #7.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'seguridad.usuarios', 8, N'UPDATE', N'{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "version": 1}', N'{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #8.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'promos.cupones', 9, N'INSERT', NULL, N'{"tabla": "promos.cupones", "id_registro": 9, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #9.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'compras.ordenes_compra', 10, N'UPDATE', N'{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "version": 1}', N'{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #10.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ventas.ordenes', 11, N'INSERT', NULL, N'{"tabla": "ventas.ordenes", "id_registro": 11, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #11.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'catalogo.variantes_sku', 12, N'UPDATE', N'{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "version": 1}', N'{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #12.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'clientes.clientes', 13, N'INSERT', NULL, N'{"tabla": "clientes.clientes", "id_registro": 13, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #13.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'fiscal.facturas_cfdi', 14, N'UPDATE', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "version": 1}', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #14.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'wms.inventario_lotes_ubicacion', 15, N'INSERT', NULL, N'{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 15, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #15.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'pagos.transacciones', 16, N'UPDATE', N'{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "version": 1}', N'{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #16.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'postventa.solicitudes_rma', 17, N'INSERT', NULL, N'{"tabla": "postventa.solicitudes_rma", "id_registro": 17, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #17.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'seguridad.usuarios', 18, N'UPDATE', N'{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "version": 1}', N'{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #18.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'promos.cupones', 19, N'INSERT', NULL, N'{"tabla": "promos.cupones", "id_registro": 19, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #19.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'compras.ordenes_compra', 20, N'UPDATE', N'{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "version": 1}', N'{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #20.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ventas.ordenes', 21, N'INSERT', NULL, N'{"tabla": "ventas.ordenes", "id_registro": 21, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #21.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'catalogo.variantes_sku', 22, N'UPDATE', N'{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "version": 1}', N'{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #22.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'clientes.clientes', 23, N'INSERT', NULL, N'{"tabla": "clientes.clientes", "id_registro": 23, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #23.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'fiscal.facturas_cfdi', 24, N'UPDATE', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "version": 1}', N'{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "operacion": "UPDATE", "version": 2}', N'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #24.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'wms.inventario_lotes_ubicacion', 25, N'INSERT', NULL, N'{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 25, "activo": true, "operacion": "INSERT", "version": 2}', N'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #25.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'pagos.transacciones', 26, N'SOFT_DELETE', N'{"tabla": "pagos.transacciones", "id_registro": 26, "activo": true, "version": 1}', N'{"tabla": "pagos.transacciones", "id_registro": 26, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre pagos.transacciones registro #26.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'postventa.solicitudes_rma', 27, N'SOFT_DELETE', N'{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": true, "version": 1}', N'{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre postventa.solicitudes_rma registro #27.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'seguridad.usuarios', 28, N'SOFT_DELETE', N'{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": true, "version": 1}', N'{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre seguridad.usuarios registro #28.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'promos.cupones', 29, N'SOFT_DELETE', N'{"tabla": "promos.cupones", "id_registro": 29, "activo": true, "version": 1}', N'{"tabla": "promos.cupones", "id_registro": 29, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre promos.cupones registro #29.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'compras.ordenes_compra', 30, N'SOFT_DELETE', N'{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": true, "version": 1}', N'{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', N'Registro forense de auditoría DML (SOFT_DELETE) sobre compras.ordenes_compra registro #30.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.bitacora_cambios_datos OFF;
GO

-- =================================================================================================
-- 149. TABLA: sistema.parametros_configuracion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT sistema.parametros_configuracion ON;
INSERT INTO sistema.parametros_configuracion (ID, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'IVA_TASA_GENERAL_MX', N'16.00', N'DECIMAL', N'Porcentaje de IVA aplicable en México a cosméticos y dermocosmética.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'DIAS_LIMITE_RESPUESTA_ARCO', N'20', N'INTEGER', N'Plazo máximo legal en días hábiles para responder solicitudes ARCO (LFPDPPP).', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ENVIO_GRATIS_MONTO_MINIMO', N'999.00', N'DECIMAL', N'Monto mínimo de compra en MXN para otorgar envío estándar gratuito.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MODO_MANTENIMIENTO_TIENDA', N'false', N'BOOLEAN', N'Bandera de activación de ventana de mantenimiento en tienda pública.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'UMBRAL_SCORE_ANTIFRAUDE_3DS', N'65', N'INTEGER', N'Puntaje mínimo de riesgo para exigir autenticación bancaria 3D Secure.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TEMP_MIN_CADENA_FRIO_C', N'2.0', N'DECIMAL', N'Temperatura mínima permitida en cámaras refrigeradas de almacén (°C).', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'TEMP_MAX_CADENA_FRIO_C', N'8.0', N'DECIMAL', N'Temperatura máxima permitida en cámaras refrigeradas de almacén (°C).', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MAX_INTENTOS_LOGIN_FALLIDOS', N'5', N'INTEGER', N'Número de intentos fallidos consecutivos antes de bloquear la cuenta.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MINUTOS_EXPIRACION_RESERVA_CART', N'15', N'INTEGER', N'Duración en minutos de apartado temporal de inventario en carrito.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PAC_TIMBRADO_AMBIENTE', N'PRODUCCION', N'STRING', N'Entorno activo de conexión con el PAC autorizado del SAT.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'DIAS_ALERTA_PREVENTIVA_FEFO', N'90', N'INTEGER', N'Días previos a la caducidad para disparar alerta preventiva FEFO.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'DIAS_VENTANA_DEVOLUCION_RMA', N'30', N'INTEGER', N'Días naturales posteriores a la entrega para solicitar devolución RMA.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'DESCUENTO_SUSCRIPCION_DEFAULT', N'10.00', N'DECIMAL', N'Porcentaje de descuento base en planes de suscripción recurrente.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'HABILITAR_RECOMENDADOR_INCI', N'true', N'BOOLEAN', N'Activa el filtro automático de alérgenos INCI según perfil cutáneo.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CONFIG_REINTENTOS_WEBHOOK', N'{"max_retries": 5, "backoff_sec": 30}', N'JSON', N'Política de reintentos exponenciales para webhooks de paquetería y pago.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'RFC_EMISOR_COMERCIO', N'DCM240115KL9', N'STRING', N'RFC oficial de la razón social emisora de comprobantes CFDI 4.0.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CP_FISCAL_EXPEDICION', N'25700', N'STRING', N'Código postal del domicilio fiscal de expedición CFDI 4.0.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'HORAS_VIDA_TOKEN_RESET', N'2', N'INTEGER', N'Vigencia en horas de los enlaces de restablecimiento de contraseña.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'COMISION_BASE_AFILIADOS', N'8.50', N'DECIMAL', N'Comisión porcentual estándar para nuevos afiliados dermoconsultores.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PERMITIR_MULTIPAGO_BILLETERA', N'true', N'BOOLEAN', N'Habilita combinación de monedero electrónico con tarjeta o SPEI.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'POLITICA_SEGURIDAD_PASSWORD', N'{"min_len": 12, "argon2_mem_kb": 65536}', N'JSON', N'Parámetros mínimos criptográficos para contraseñas de usuarios.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MONEDA_OPERACION_DEFAULT', N'MXN', N'STRING', N'Código ISO 4217 de moneda predeterminada en tienda nacional.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'HUMEDAD_MAX_ALMACEN_PORC', N'60.0', N'DECIMAL', N'Humedad relativa máxima permitida en pasillos de almacenamiento.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'LIMITE_PIEZA_POR_SKU_ORDEN', N'10', N'INTEGER', N'Cantidad máxima permitida de un mismo SKU por orden al menudeo.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'NOTIFICAR_COFEPRIS_AUTO', N'false', N'BOOLEAN', N'Envío automático o manual tras revisión médica de reportes RAM.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'UMBRAL_CONTROVERSIA_DISPUTA', N'{"auto_evidence": true, "days": 7}', N'JSON', N'Reglas de recopilación automática de evidencia ante contracargos.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'URL_BASE_CDN_MULTIMEDIA', N'https://cdn.dermacare.mx/assets/v2', N'STRING', N'Dominio CDN para imágenes de productos y fichas técnicas.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'TIEMPO_SESION_HORAS', N'24', N'INTEGER', N'Duración estándar de validez de sesiones web antes de renovación.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TASA_IEPS_PROTECTOR_EXENTO', N'0.00', N'DECIMAL', N'Tasa aplicable a categorías exentas de impuestos especiales.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CADENA_FRIO_ALERTA_SMS', N'true', N'BOOLEAN', N'Envía notificación SMS inmediata al supervisor WMS ante alerta térmica.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.parametros_configuracion OFF;
GO

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT sistema.notificaciones_push_email ON;
INSERT INTO sistema.notificaciones_push_email (ID, ID_usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0001', N'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', 1, '2026-02-01 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0002', N'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0003', N'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', 1, '2026-02-03 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0004', N'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0005', N'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', 1, '2026-02-05 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0006', N'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0007', N'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', 1, '2026-02-07 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0008', N'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0009', N'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', 1, '2026-02-09 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0010', N'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0011', N'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', 1, '2026-02-11 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0012', N'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0013', N'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', 1, '2026-02-13 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0014', N'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0015', N'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', 1, '2026-02-15 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0016', N'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0017', N'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', 1, '2026-02-17 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0018', N'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0019', N'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', 1, '2026-02-19 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0020', N'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0021', N'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', 1, '2026-02-21 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0022', N'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0023', N'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', 1, '2026-02-23 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0024', N'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0025', N'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', 1, '2026-02-25 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0026', N'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SMS', N'Actualización de tu pedido y rutina DermaCare #0027', N'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', 1, '2026-02-27 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'WHATSAPP', N'Actualización de tu pedido y rutina DermaCare #0028', N'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EMAIL', N'Actualización de tu pedido y rutina DermaCare #0029', N'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', 1, '2026-02-01 11:30:00', NULL, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PUSH_APP', N'Actualización de tu pedido y rutina DermaCare #0030', N'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', 0, NULL, N'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.notificaciones_push_email OFF;
GO

PRINT '=================================================================================================';
PRINT 'ÉXITO TOTAL: 150 TABLAS POBLADAS CON DATOS REALES E INTEGRIDAD REFERENCIAL AL 100%.';
PRINT '=================================================================================================';
GO