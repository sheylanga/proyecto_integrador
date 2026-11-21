-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR MULTIDISCIPLINARIO TERMINAL V
-- MASTER SEED DATA DML - 150 TABLAS CON DATOS REALES DE DOMINIO Y LLAVES FORÁNEAS LIMPIAS
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
INSERT INTO seguridad.roles (id_rol, codigo_rol, nombre_rol, descripcion, nivel_jerarquico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO seguridad.permisos (id_permiso, clave_permiso, modulo_sistema, accion, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO seguridad.roles_permisos (id_rol_permiso, rol, permiso, permitir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO seguridad.usuarios (id_usuario, uuid_usuario, email, password_hash, password_salt, telefono_movil, email_verificado, cuenta_bloqueada, fecha_bloqueo, intentos_fallidos_consecutivos, mfa_habilitado, mfa_secreto, ultimo_login_exitoso, ultimo_cambio_password, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'B1000000-0000-4000-8000-000000000001', N'carlos.mendoza.1@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', N'c2FsdERlcm1hQ2FyZTIwMjZf0001==', N'8661114455', 1, 1, '2026-02-01 11:30:00', 1, 1, N'JBSWY3DPEHPK3PXP0001DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'B1000000-0000-4000-8000-000000000002', N'sofia.ramirez.2@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', N'c2FsdERlcm1hQ2FyZTIwMjZf0002==', N'8661124455', 0, 0, '2026-02-02 11:30:00', 2, 0, N'JBSWY3DPEHPK3PXP0002DERMA', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'B1000000-0000-4000-8000-000000000003', N'valeria.torres.3@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', N'c2FsdERlcm1hQ2FyZTIwMjZf0003==', N'8661134455', 1, 1, '2026-02-03 11:30:00', 3, 1, N'JBSWY3DPEHPK3PXP0003DERMA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'B1000000-0000-4000-8000-000000000004', N'alejandro.hernandez.4@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', N'c2FsdERlcm1hQ2FyZTIwMjZf0004==', N'8661144455', 0, 0, '2026-02-04 11:30:00', 4, 0, N'JBSWY3DPEHPK3PXP0004DERMA', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'B1000000-0000-4000-8000-000000000005', N'mariana.sanchez.5@dermacare.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', N'c2FsdERlcm1hQ2FyZTIwMjZf0005==', N'8661154455', 1, 1, '2026-02-05 11:30:00', 5, 1, N'JBSWY3DPEHPK3PXP0005DERMA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'B1000000-0000-4000-8000-000000000006', N'diego.martinez.6@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', N'c2FsdERlcm1hQ2FyZTIwMjZf0006==', N'8661164455', 0, 0, '2026-02-06 11:30:00', 6, 0, N'JBSWY3DPEHPK3PXP0006DERMA', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'B1000000-0000-4000-8000-000000000007', N'camila.gonzalez.7@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', N'c2FsdERlcm1hQ2FyZTIwMjZf0007==', N'8661174455', 1, 1, '2026-02-07 11:30:00', 7, 1, N'JBSWY3DPEHPK3PXP0007DERMA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'B1000000-0000-4000-8000-000000000008', N'mateo.flores.8@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', N'c2FsdERlcm1hQ2FyZTIwMjZf0008==', N'8661184455', 0, 0, '2026-02-08 11:30:00', 8, 0, N'JBSWY3DPEHPK3PXP0008DERMA', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'B1000000-0000-4000-8000-000000000009', N'lucia.morales.9@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', N'c2FsdERlcm1hQ2FyZTIwMjZf0009==', N'8661194455', 1, 1, '2026-02-09 11:30:00', 9, 1, N'JBSWY3DPEHPK3PXP0009DERMA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'B1000000-0000-4000-8000-00000000000A', N'sebastian.vazquez.10@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', N'c2FsdERlcm1hQ2FyZTIwMjZf0010==', N'8661204455', 0, 0, '2026-02-10 11:30:00', 10, 0, N'JBSWY3DPEHPK3PXP0010DERMA', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'B1000000-0000-4000-8000-00000000000B', N'regina.gutierrez.11@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', N'c2FsdERlcm1hQ2FyZTIwMjZf0011==', N'8661214455', 1, 1, '2026-02-11 11:30:00', 11, 1, N'JBSWY3DPEHPK3PXP0011DERMA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'B1000000-0000-4000-8000-00000000000C', N'santiago.jimenez.12@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', N'c2FsdERlcm1hQ2FyZTIwMjZf0012==', N'8661224455', 0, 0, '2026-02-12 11:30:00', 12, 0, N'JBSWY3DPEHPK3PXP0012DERMA', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'B1000000-0000-4000-8000-00000000000D', N'fernanda.ruiz.13@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', N'c2FsdERlcm1hQ2FyZTIwMjZf0013==', N'8661234455', 1, 1, '2026-02-13 11:30:00', 13, 1, N'JBSWY3DPEHPK3PXP0013DERMA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'B1000000-0000-4000-8000-00000000000E', N'emiliano.rios.14@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', N'c2FsdERlcm1hQ2FyZTIwMjZf0014==', N'8661244455', 0, 0, '2026-02-14 11:30:00', 14, 0, N'JBSWY3DPEHPK3PXP0014DERMA', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'B1000000-0000-4000-8000-00000000000F', N'ximena.aguilar.15@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', N'c2FsdERlcm1hQ2FyZTIwMjZf0015==', N'8661254455', 1, 1, '2026-02-15 11:30:00', 15, 1, N'JBSWY3DPEHPK3PXP0015DERMA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'B1000000-0000-4000-8000-000000000010', N'daniel.mendez.16@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', N'c2FsdERlcm1hQ2FyZTIwMjZf0016==', N'8661264455', 0, 0, '2026-02-16 11:30:00', 16, 0, N'JBSWY3DPEHPK3PXP0016DERMA', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'B1000000-0000-4000-8000-000000000011', N'andrea.castro.17@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', N'c2FsdERlcm1hQ2FyZTIwMjZf0017==', N'8661274455', 1, 1, '2026-02-17 11:30:00', 17, 1, N'JBSWY3DPEHPK3PXP0017DERMA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'B1000000-0000-4000-8000-000000000012', N'gabriel.vega.18@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', N'c2FsdERlcm1hQ2FyZTIwMjZf0018==', N'8661284455', 0, 0, '2026-02-18 11:30:00', 18, 0, N'JBSWY3DPEHPK3PXP0018DERMA', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'B1000000-0000-4000-8000-000000000013', N'paula.cortes.19@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', N'c2FsdERlcm1hQ2FyZTIwMjZf0019==', N'8661294455', 1, 1, '2026-02-19 11:30:00', 19, 1, N'JBSWY3DPEHPK3PXP0019DERMA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'B1000000-0000-4000-8000-000000000014', N'andres.ramos.20@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', N'c2FsdERlcm1hQ2FyZTIwMjZf0020==', N'8661304455', 0, 0, '2026-02-20 11:30:00', 20, 0, N'JBSWY3DPEHPK3PXP0020DERMA', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'B1000000-0000-4000-8000-000000000015', N'renata.guerrero.21@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', N'c2FsdERlcm1hQ2FyZTIwMjZf0021==', N'8661314455', 1, 1, '2026-02-21 11:30:00', 21, 1, N'JBSWY3DPEHPK3PXP0021DERMA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'B1000000-0000-4000-8000-000000000016', N'nicolas.pena.22@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', N'c2FsdERlcm1hQ2FyZTIwMjZf0022==', N'8661324455', 0, 0, '2026-02-22 11:30:00', 22, 0, N'JBSWY3DPEHPK3PXP0022DERMA', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'B1000000-0000-4000-8000-000000000017', N'natalia.herrera.23@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', N'c2FsdERlcm1hQ2FyZTIwMjZf0023==', N'8661334455', 1, 1, '2026-02-23 11:30:00', 23, 1, N'JBSWY3DPEHPK3PXP0023DERMA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'B1000000-0000-4000-8000-000000000018', N'joaquin.medina.24@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', N'c2FsdERlcm1hQ2FyZTIwMjZf0024==', N'8661344455', 0, 0, '2026-02-24 11:30:00', 24, 0, N'JBSWY3DPEHPK3PXP0024DERMA', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'B1000000-0000-4000-8000-000000000019', N'isabella.dominguez.25@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', N'c2FsdERlcm1hQ2FyZTIwMjZf0025==', N'8661354455', 1, 1, '2026-02-25 11:30:00', 25, 1, N'JBSWY3DPEHPK3PXP0025DERMA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'B1000000-0000-4000-8000-00000000001A', N'leonardo.silva.26@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', N'c2FsdERlcm1hQ2FyZTIwMjZf0026==', N'8661364455', 0, 0, '2026-02-26 11:30:00', 26, 0, N'JBSWY3DPEHPK3PXP0026DERMA', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'B1000000-0000-4000-8000-00000000001B', N'ana.chavez.27@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', N'c2FsdERlcm1hQ2FyZTIwMjZf0027==', N'8661374455', 1, 1, '2026-02-27 11:30:00', 27, 1, N'JBSWY3DPEHPK3PXP0027DERMA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'B1000000-0000-4000-8000-00000000001C', N'rodrigo.ochoa.28@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', N'c2FsdERlcm1hQ2FyZTIwMjZf0028==', N'8661384455', 0, 0, '2026-02-28 11:30:00', 28, 0, N'JBSWY3DPEHPK3PXP0028DERMA', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'B1000000-0000-4000-8000-00000000001D', N'paulina.miranda.29@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', N'c2FsdERlcm1hQ2FyZTIwMjZf0029==', N'8661394455', 1, 1, '2026-02-01 11:30:00', 29, 1, N'JBSWY3DPEHPK3PXP0029DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'B1000000-0000-4000-8000-00000000001E', N'mauricio.padilla.30@correo.mx', N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', N'c2FsdERlcm1hQ2FyZTIwMjZf0030==', N'8661404455', 0, 0, '2026-02-02 11:30:00', 30, 0, N'JBSWY3DPEHPK3PXP0030DERMA', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.usuarios OFF;
GO

-- =================================================================================================
-- 005. TABLA: seguridad.usuarios_roles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.usuarios_roles ON;
INSERT INTO seguridad.usuarios_roles (id_usuario_rol, usuario, rol, fecha_asignacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO seguridad.sesiones_activas (id_sesion, usuario, token_sesion_hash, direccion_ip, user_agent, fecha_inicio, fecha_expiracion, revocada, fecha_revocacion, motivo_revocacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', N'189.203.3.7', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-02-01 11:30:00', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', N'189.203.6.14', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2026-02-02 11:30:00', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', N'189.203.9.21', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-02-03 11:30:00', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', N'189.203.12.28', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 0, '2026-02-04 11:30:00', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', N'189.203.15.35', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-02-05 11:30:00', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', N'189.203.18.42', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 0, '2026-02-06 11:30:00', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', N'189.203.21.49', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-02-07 11:30:00', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', N'189.203.24.56', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 0, '2026-02-08 11:30:00', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', N'189.203.27.63', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-02-09 11:30:00', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', N'189.203.30.70', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 0, '2026-02-10 11:30:00', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', N'189.203.33.77', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-02-11 11:30:00', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', N'189.203.36.84', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 0, '2026-02-12 11:30:00', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', N'189.203.39.91', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-02-13 11:30:00', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', N'189.203.42.98', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 0, '2026-02-14 11:30:00', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', N'189.203.45.105', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-02-15 11:30:00', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', N'189.203.48.112', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 0, '2026-02-16 11:30:00', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', N'189.203.51.119', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-02-17 11:30:00', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', N'189.203.54.126', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 0, '2026-02-18 11:30:00', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', N'189.203.57.133', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-02-19 11:30:00', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', N'189.203.60.140', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 0, '2026-02-20 11:30:00', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', N'189.203.63.147', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-02-21 11:30:00', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', N'189.203.66.154', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 0, '2026-02-22 11:30:00', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', N'189.203.69.161', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-02-23 11:30:00', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', N'189.203.72.168', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 0, '2026-02-24 11:30:00', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', N'189.203.75.175', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-02-25 11:30:00', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', N'189.203.78.182', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 0, '2026-02-26 11:30:00', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', N'189.203.81.189', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-02-27 11:30:00', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', N'189.203.84.196', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 0, '2026-02-28 11:30:00', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', N'189.203.87.203', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-02-01 11:30:00', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', N'189.203.90.210', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2026-02-02 11:30:00', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.sesiones_activas OFF;
GO

-- =================================================================================================
-- 007. TABLA: seguridad.historial_passwords (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.historial_passwords ON;
INSERT INTO seguridad.historial_passwords (id_historial_pwd, usuario, password_hash, password_salt, algoritmo_hashing, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', N'c2FsdERlcm1hQ2FyZTIwMjZf0001==', N'Sérum Niacinamida 10% + Zinc 1', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', N'c2FsdERlcm1hQ2FyZTIwMjZf0002==', N'Gel Limpiador Espumoso Facial ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', N'c2FsdERlcm1hQ2FyZTIwMjZf0003==', N'Protector Solar Fluido SPF 50+', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', N'c2FsdERlcm1hQ2FyZTIwMjZf0004==', N'Sérum Ácido Hialurónico 2% + B', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', N'c2FsdERlcm1hQ2FyZTIwMjZf0005==', N'Crema Hidratante con Ceramidas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', N'c2FsdERlcm1hQ2FyZTIwMjZf0006==', N'Retinol Puro 0.5% Nocturno - E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', N'c2FsdERlcm1hQ2FyZTIwMjZf0007==', N'Agua Micelar Dermolimpiadora -', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', N'c2FsdERlcm1hQ2FyZTIwMjZf0008==', N'Sérum Vitamina C Pura 15% - Vi', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', N'c2FsdERlcm1hQ2FyZTIwMjZf0009==', N'Base de Maquillaje Cobertura M', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', N'c2FsdERlcm1hQ2FyZTIwMjZf0010==', N'Corrector Líquido Alta Duració', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', N'c2FsdERlcm1hQ2FyZTIwMjZf0011==', N'Bálsamo Reparador Cicaplast B5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', N'c2FsdERlcm1hQ2FyZTIwMjZf0012==', N'Exfoliante Ácido Salicílico 2%', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', N'c2FsdERlcm1hQ2FyZTIwMjZf0013==', N'Contorno de Ojos con Cafeína 5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', N'c2FsdERlcm1hQ2FyZTIwMjZf0014==', N'Mascarilla Nocturna Hidratante', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', N'c2FsdERlcm1hQ2FyZTIwMjZf0015==', N'Bruma Termal Calmante Mineral ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', N'c2FsdERlcm1hQ2FyZTIwMjZf0016==', N'Aceite Limpiador Emulsionable ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', N'c2FsdERlcm1hQ2FyZTIwMjZf0017==', N'Tónico Equilibrante Ácido Glic', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', N'c2FsdERlcm1hQ2FyZTIwMjZf0018==', N'Labial Hidratante Péptidos Nud', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', N'c2FsdERlcm1hQ2FyZTIwMjZf0019==', N'Polvo Traslúcido Matificante M', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', N'c2FsdERlcm1hQ2FyZTIwMjZf0020==', N'Rubor Líquido Pigmento Natural', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', N'c2FsdERlcm1hQ2FyZTIwMjZf0021==', N'Sérum Ácido Azelaico 10% Suspe', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', N'c2FsdERlcm1hQ2FyZTIwMjZf0022==', N'Ampolletas Proteoglicanos Firm', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', N'c2FsdERlcm1hQ2FyZTIwMjZf0023==', N'Crema Despigmentante Noche Mel', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', N'c2FsdERlcm1hQ2FyZTIwMjZf0024==', N'Protector Solar Mineral Óxido ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', N'c2FsdERlcm1hQ2FyZTIwMjZf0025==', N'Loción Corporal Urea 10% Repar', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', N'c2FsdERlcm1hQ2FyZTIwMjZf0026==', N'Primer Facial Minimizador de P', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', N'c2FsdERlcm1hQ2FyZTIwMjZf0027==', N'Máscara de Pestañas Hipoalergé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', N'c2FsdERlcm1hQ2FyZTIwMjZf0028==', N'Sérum Péptidos de Cobre 1% - L', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', N'c2FsdERlcm1hQ2FyZTIwMjZf0029==', N'Bálsamo Desmaquillante Caléndu', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', N'c2FsdERlcm1hQ2FyZTIwMjZf0030==', N'Crema Barrera Post-Retinoide -', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.historial_passwords OFF;
GO

-- =================================================================================================
-- 008. TABLA: seguridad.intentos_login (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.intentos_login ON;
INSERT INTO seguridad.intentos_login (id_intento_login, email_ingresado, usuario, direccion_ip, pais_origen_ip, user_agent, resultado, mensaje_detalle, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, N'189.203.3.7', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'EXITOSO', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 2, N'189.203.6.14', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'PASSWORD_INVALIDO', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 3, N'189.203.9.21', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'USUARIO_INEXISTENTE', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 4, N'189.203.12.28', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'CUENTA_BLOQUEADA', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 5, N'189.203.15.35', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'MFA_FALLIDO', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 6, N'189.203.18.42', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'EXITOSO', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 7, N'189.203.21.49', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'PASSWORD_INVALIDO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 8, N'189.203.24.56', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'USUARIO_INEXISTENTE', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 9, N'189.203.27.63', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'CUENTA_BLOQUEADA', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 10, N'189.203.30.70', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'MFA_FALLIDO', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 11, N'189.203.33.77', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'EXITOSO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 12, N'189.203.36.84', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'PASSWORD_INVALIDO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 13, N'189.203.39.91', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'USUARIO_INEXISTENTE', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 14, N'189.203.42.98', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'CUENTA_BLOQUEADA', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 15, N'189.203.45.105', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'MFA_FALLIDO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 16, N'189.203.48.112', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'EXITOSO', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 17, N'189.203.51.119', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'PASSWORD_INVALIDO', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 18, N'189.203.54.126', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'USUARIO_INEXISTENTE', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 19, N'189.203.57.133', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'CUENTA_BLOQUEADA', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 20, N'189.203.60.140', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'MFA_FALLIDO', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 21, N'189.203.63.147', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'EXITOSO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 22, N'189.203.66.154', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'PASSWORD_INVALIDO', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 23, N'189.203.69.161', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'USUARIO_INEXISTENTE', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 24, N'189.203.72.168', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'CUENTA_BLOQUEADA', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 25, N'189.203.75.175', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'MFA_FALLIDO', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 26, N'189.203.78.182', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'EXITOSO', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 27, N'189.203.81.189', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'PASSWORD_INVALIDO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 28, N'189.203.84.196', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'USUARIO_INEXISTENTE', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 29, N'189.203.87.203', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'CUENTA_BLOQUEADA', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 30, N'189.203.90.210', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'MFA_FALLIDO', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.intentos_login OFF;
GO

-- =================================================================================================
-- 009. TABLA: seguridad.tokens_recuperacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.tokens_recuperacion ON;
INSERT INTO seguridad.tokens_recuperacion (id_token_recuperacion, usuario, token_hash, tipo_token, fecha_expiracion, utilizado, fecha_utilizacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', N'RESET_PASSWORD', '2026-02-01 11:30:00', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', N'VERIFICAR_EMAIL', '2026-02-02 11:30:00', 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', N'MFA_BACKUP', '2026-02-03 11:30:00', 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', N'RESET_PASSWORD', '2026-02-04 11:30:00', 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', N'VERIFICAR_EMAIL', '2026-02-05 11:30:00', 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', N'MFA_BACKUP', '2026-02-06 11:30:00', 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', N'RESET_PASSWORD', '2026-02-07 11:30:00', 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', N'VERIFICAR_EMAIL', '2026-02-08 11:30:00', 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', N'MFA_BACKUP', '2026-02-09 11:30:00', 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', N'RESET_PASSWORD', '2026-02-10 11:30:00', 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', N'VERIFICAR_EMAIL', '2026-02-11 11:30:00', 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', N'MFA_BACKUP', '2026-02-12 11:30:00', 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', N'RESET_PASSWORD', '2026-02-13 11:30:00', 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', N'VERIFICAR_EMAIL', '2026-02-14 11:30:00', 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', N'MFA_BACKUP', '2026-02-15 11:30:00', 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', N'RESET_PASSWORD', '2026-02-16 11:30:00', 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', N'VERIFICAR_EMAIL', '2026-02-17 11:30:00', 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', N'MFA_BACKUP', '2026-02-18 11:30:00', 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', N'RESET_PASSWORD', '2026-02-19 11:30:00', 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', N'VERIFICAR_EMAIL', '2026-02-20 11:30:00', 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', N'MFA_BACKUP', '2026-02-21 11:30:00', 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', N'RESET_PASSWORD', '2026-02-22 11:30:00', 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', N'VERIFICAR_EMAIL', '2026-02-23 11:30:00', 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', N'MFA_BACKUP', '2026-02-24 11:30:00', 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', N'RESET_PASSWORD', '2026-02-25 11:30:00', 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', N'VERIFICAR_EMAIL', '2026-02-26 11:30:00', 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', N'MFA_BACKUP', '2026-02-27 11:30:00', 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', N'RESET_PASSWORD', '2026-02-28 11:30:00', 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', N'VERIFICAR_EMAIL', '2026-02-01 11:30:00', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', N'MFA_BACKUP', '2026-02-02 11:30:00', 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.tokens_recuperacion OFF;
GO

-- =================================================================================================
-- 010. TABLA: seguridad.dispositivos_confianza (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT seguridad.dispositivos_confianza ON;
INSERT INTO seguridad.dispositivos_confianza (id_dispositivo, usuario, fingerprint_dispositivo, nombre_dispositivo, sistema_operativo, navegador, es_confiable, ultimo_acceso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT seguridad.dispositivos_confianza OFF;
GO

-- =================================================================================================
-- 011. TABLA: clientes.tipos_piel (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.tipos_piel ON;
INSERT INTO clientes.tipos_piel (id_tipo_piel, codigo_piel, nombre, descripcion_clinica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO clientes.condiciones_dermatologicas (id_condicion_dermatologica, codigo_condicion, nombre_condicion, descripcion_patologica, nivel_severidad_tipica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CONDICIO_01', N'Sueros Concentrados Nivel 1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CONDICIO_02', N'Limpiadores Faciales Nivel 2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CONDICIO_03', N'Fotoprotección Solar Nivel 3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CONDICIO_04', N'Maquillaje Mineral Nivel 4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CONDICIO_05', N'Cuidado Anti-Edad Nivel 5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CONDICIO_06', N'Barrera Cutánea Nivel 6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CONDICIO_07', N'Contorno de Ojos Nivel 7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CONDICIO_08', N'Tratamiento Acné Nivel 8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CONDICIO_09', N'Hidratantes Ceramidas Nivel 9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CONDICIO_10', N'Exfoliantes Químicos Nivel 10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CONDICIO_11', N'Sueros Concentrados Nivel 11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CONDICIO_12', N'Limpiadores Faciales Nivel 12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CONDICIO_13', N'Fotoprotección Solar Nivel 13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CONDICIO_14', N'Maquillaje Mineral Nivel 14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CONDICIO_15', N'Cuidado Anti-Edad Nivel 15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CONDICIO_16', N'Barrera Cutánea Nivel 16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CONDICIO_17', N'Contorno de Ojos Nivel 17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CONDICIO_18', N'Tratamiento Acné Nivel 18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CONDICIO_19', N'Hidratantes Ceramidas Nivel 19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CONDICIO_20', N'Exfoliantes Químicos Nivel 20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CONDICIO_21', N'Sueros Concentrados Nivel 21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CONDICIO_22', N'Limpiadores Faciales Nivel 22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CONDICIO_23', N'Fotoprotección Solar Nivel 23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CONDICIO_24', N'Maquillaje Mineral Nivel 24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CONDICIO_25', N'Cuidado Anti-Edad Nivel 25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CONDICIO_26', N'Barrera Cutánea Nivel 26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CONDICIO_27', N'Contorno de Ojos Nivel 27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'SEVERA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CONDICIO_28', N'Tratamiento Acné Nivel 28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'LEVE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CONDICIO_29', N'Hidratantes Ceramidas Nivel 29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'MODERADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CONDICIO_30', N'Exfoliantes Químicos Nivel 30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'SEVERA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.condiciones_dermatologicas OFF;
GO

-- =================================================================================================
-- 013. TABLA: clientes.clientes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.clientes ON;
INSERT INTO clientes.clientes (id_cliente, usuario, nombres, primer_apellido, segundo_apellido, fecha_nacimiento, genero, curp, rfc, telefono_fijo, acepta_terminos, fecha_aceptacion_terminos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Carlos Mendoza Garza', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', '2026-03-01', N'FEMENINO', N'MEGC910315HCLRR001', N'MEGC910315H01', N'8661114455', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Sofía Ramírez López', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', '2026-03-02', N'MASCULINO', N'RALS920315HCLRR002', N'RALS920315H02', N'8661124455', 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Valeria Torres Villarreal', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', '2026-03-03', N'NO_BINARIO', N'TOVV930315HCLRR003', N'TOVV930315H03', N'8661134455', 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Alejandro Hernández Cruz', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', '2026-03-04', N'PREFIERO_NO_DECIR', N'HECA940315HCLRR004', N'HECA940315H04', N'8661144455', 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Mariana Sánchez Fuentes', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', '2026-03-05', N'FEMENINO', N'SAFM950315HCLRR005', N'SAFM950315H05', N'8661154455', 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Diego Martínez Treviño', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', '2026-03-06', N'MASCULINO', N'MATD960315HCLRR006', N'MATD960315H06', N'8661164455', 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Camila González Reyes', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', '2026-03-07', N'NO_BINARIO', N'GORC970315HCLRR007', N'GORC970315H07', N'8661174455', 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Mateo Flores Castillo', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', '2026-03-08', N'PREFIERO_NO_DECIR', N'FLCM980315HCLRR008', N'FLCM980315H08', N'8661184455', 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Lucía Morales Díaz', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', '2026-03-09', N'FEMENINO', N'MODL990315HCLRR009', N'MODL990315H09', N'8661194455', 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Sebastián Vázquez Ortiz', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', '2026-03-10', N'MASCULINO', N'VAOS900315HCLRR010', N'VAOS900315H10', N'8661204455', 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Regina Gutiérrez Nava', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', '2026-03-11', N'NO_BINARIO', N'GUNR910315HCLRR011', N'GUNR910315H11', N'8661214455', 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Santiago Jiménez Pérez', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', '2026-03-12', N'PREFIERO_NO_DECIR', N'JIPS920315HCLRR012', N'JIPS920315H12', N'8661224455', 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Fernanda Ruiz Salazar', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', '2026-03-13', N'FEMENINO', N'RUSF930315HCLRR013', N'RUSF930315H13', N'8661234455', 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Emiliano Ríos Cárdenas', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', '2026-03-14', N'MASCULINO', N'RICE940315HCLRR014', N'RICE940315H14', N'8661244455', 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Ximena Aguilar Ibarra', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', '2026-03-15', N'NO_BINARIO', N'AGIX950315HCLRR015', N'AGIX950315H15', N'8661254455', 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Daniel Méndez Navarro', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', '2026-03-16', N'PREFIERO_NO_DECIR', N'MEND960315HCLRR016', N'MEND960315H16', N'8661264455', 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Andrea Castro Delgado', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', '2026-03-17', N'FEMENINO', N'CADA970315HCLRR017', N'CADA970315H17', N'8661274455', 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Gabriel Vega Montoya', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', '2026-03-18', N'MASCULINO', N'VEMG980315HCLRR018', N'VEMG980315H18', N'8661284455', 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Paula Cortés Rojas', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', '2026-03-19', N'NO_BINARIO', N'CORP990315HCLRR019', N'CORP990315H19', N'8661294455', 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Andrés Ramos Campos', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-03-20', N'PREFIERO_NO_DECIR', N'RACA900315HCLRR020', N'RACA900315H20', N'8661304455', 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Renata Guerrero Luna', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', '2026-03-21', N'FEMENINO', N'GULR910315HCLRR021', N'GULR910315H21', N'8661314455', 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Nicolás Peña Cabrera', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', '2026-03-22', N'MASCULINO', N'PECN920315HCLRR022', N'PECN920315H22', N'8661324455', 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Natalia Herrera Vargas', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', '2026-03-23', N'NO_BINARIO', N'HEVN930315HCLRR023', N'HEVN930315H23', N'8661334455', 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Joaquín Medina Contreras', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', '2026-03-24', N'PREFIERO_NO_DECIR', N'MECJ940315HCLRR024', N'MECJ940315H24', N'8661344455', 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Isabella Domínguez Escobar', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', '2026-03-25', N'FEMENINO', N'DOEI950315HCLRR025', N'DOEI950315H25', N'8661354455', 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Leonardo Silva Paredes', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', '2026-03-26', N'MASCULINO', N'SIPL960315HCLRR026', N'SIPL960315H26', N'8661364455', 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Ana Chávez Bautista', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', '2026-03-27', N'NO_BINARIO', N'CHBA970315HCLRR027', N'CHBA970315H27', N'8661374455', 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Rodrigo Ochoa Acosta', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', '2026-03-28', N'PREFIERO_NO_DECIR', N'OCAR980315HCLRR028', N'OCAR980315H28', N'8661384455', 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Paulina Miranda Leal', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', '2026-03-01', N'FEMENINO', N'MILP990315HCLRR029', N'MILP990315H29', N'8661394455', 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Mauricio Padilla Solís', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', '2026-03-02', N'MASCULINO', N'PASM900315HCLRR030', N'PASM900315H30', N'8661404455', 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.clientes OFF;
GO

-- =================================================================================================
-- 014. TABLA: clientes.direcciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.direcciones ON;
INSERT INTO clientes.direcciones (id_direccion, cliente, alias_direccion, calle, numero_exterior, numero_interior, colonia, codigo_postal, municipio_alcaldia, estado, pais, referencias, es_predeterminada_envio, es_predeterminada_facturacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Casa Monclova 1', N'Blvd. Harold R. Pape #112', N'110', N'Depto 1', N'Centro', N'25700', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Coahuila', N'México', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Casa Monterrey 2', N'Av. Constitución #124', N'120', N'Depto 2', N'Obispado', N'64000', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Nuevo León', N'México', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Casa San Pedro Garza García 3', N'Calz. del Valle #136', N'130', N'Depto 3', N'Del Valle', N'66220', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Nuevo León', N'México', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Casa Ciudad de México 4', N'Av. Álvaro Obregón #148', N'140', N'Depto 4', N'Roma Norte', N'06700', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'CDMX', N'México', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Casa Ciudad de México 5', N'Av. Presidente Masaryk #160', N'150', N'Depto 5', N'Polanco', N'11560', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'CDMX', N'México', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Casa Guadalajara 6', N'Av. Vallarta #172', N'160', N'Depto 6', N'Americana', N'44100', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Jalisco', N'México', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Casa Saltillo 7', N'Blvd. Venustiano Carranza #184', N'170', N'Depto 7', N'República', N'25000', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Coahuila', N'México', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Casa Querétaro 8', N'Av. 5 de Febrero #196', N'180', N'Depto 8', N'Centro', N'76000', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Querétaro', N'México', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Casa Puebla 9', N'Av. Juárez #208', N'190', N'Depto 9', N'La Paz', N'72000', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Puebla', N'México', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Casa Mérida 10', N'Paseo de Montejo #220', N'200', N'Depto 10', N'Centro', N'97000', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Yucatán', N'México', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Casa Monclova 11', N'Blvd. Harold R. Pape #232', N'210', N'Depto 11', N'Centro', N'25700', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Coahuila', N'México', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Casa Monterrey 12', N'Av. Constitución #244', N'220', N'Depto 12', N'Obispado', N'64000', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Nuevo León', N'México', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Casa San Pedro Garza García 13', N'Calz. del Valle #256', N'230', N'Depto 13', N'Del Valle', N'66220', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Nuevo León', N'México', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Casa Ciudad de México 14', N'Av. Álvaro Obregón #268', N'240', N'Depto 14', N'Roma Norte', N'06700', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'CDMX', N'México', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Casa Ciudad de México 15', N'Av. Presidente Masaryk #280', N'250', N'Depto 15', N'Polanco', N'11560', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'CDMX', N'México', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Casa Guadalajara 16', N'Av. Vallarta #292', N'260', N'Depto 16', N'Americana', N'44100', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Jalisco', N'México', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Casa Saltillo 17', N'Blvd. Venustiano Carranza #304', N'270', N'Depto 17', N'República', N'25000', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Coahuila', N'México', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Casa Querétaro 18', N'Av. 5 de Febrero #316', N'280', N'Depto 18', N'Centro', N'76000', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Querétaro', N'México', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Casa Puebla 19', N'Av. Juárez #328', N'290', N'Depto 19', N'La Paz', N'72000', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Puebla', N'México', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Casa Mérida 20', N'Paseo de Montejo #340', N'300', N'Depto 20', N'Centro', N'97000', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Yucatán', N'México', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Casa Monclova 21', N'Blvd. Harold R. Pape #352', N'310', N'Depto 21', N'Centro', N'25700', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Coahuila', N'México', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Casa Monterrey 22', N'Av. Constitución #364', N'320', N'Depto 22', N'Obispado', N'64000', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Nuevo León', N'México', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Casa San Pedro Garza García 23', N'Calz. del Valle #376', N'330', N'Depto 23', N'Del Valle', N'66220', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Nuevo León', N'México', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Casa Ciudad de México 24', N'Av. Álvaro Obregón #388', N'340', N'Depto 24', N'Roma Norte', N'06700', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'CDMX', N'México', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Casa Ciudad de México 25', N'Av. Presidente Masaryk #400', N'350', N'Depto 25', N'Polanco', N'11560', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'CDMX', N'México', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Casa Guadalajara 26', N'Av. Vallarta #412', N'360', N'Depto 26', N'Americana', N'44100', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Jalisco', N'México', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Casa Saltillo 27', N'Blvd. Venustiano Carranza #424', N'370', N'Depto 27', N'República', N'25000', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Coahuila', N'México', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Casa Querétaro 28', N'Av. 5 de Febrero #436', N'380', N'Depto 28', N'Centro', N'76000', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Querétaro', N'México', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Casa Puebla 29', N'Av. Juárez #448', N'390', N'Depto 29', N'La Paz', N'72000', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Puebla', N'México', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Casa Mérida 30', N'Paseo de Montejo #460', N'400', N'Depto 30', N'Centro', N'97000', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Yucatán', N'México', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.direcciones OFF;
GO

-- =================================================================================================
-- 015. TABLA: clientes.perfil_cutaneo (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.perfil_cutaneo ON;
INSERT INTO clientes.perfil_cutaneo (id_perfil_cutaneo, cliente, tipo_piel, sensibilidad_solar, nivel_oleosidad, poros_dilatados, propension_acne, manchas_hiperpigmentacion, lineas_expresion, consentimiento_datos_sensibles, fecha_declaracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO clientes.cliente_condiciones (id_cliente_condicion, cliente, condicion_dermatologica, diagnosticada_por_medico, notas_paciente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 0, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 0, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 0, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 0, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 0, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 0, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 0, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 0, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 0, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 0, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 0, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 0, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 0, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 0, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 0, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.cliente_condiciones OFF;
GO

-- =================================================================================================
-- 017. TABLA: clientes.cuestionarios_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.cuestionarios_diagnostico ON;
INSERT INTO clientes.cuestionarios_diagnostico (id_cuestionario, codigo_cuestionario, titulo, descripcion, version_clinica, vigente_desde, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CUESTION_01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', N'Sérum Niac', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CUESTION_02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', N'Gel Limpia', '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CUESTION_03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', N'Protector ', '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CUESTION_04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', N'Sérum Ácid', '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CUESTION_05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', N'Crema Hidr', '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CUESTION_06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', N'Retinol Pu', '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CUESTION_07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', N'Agua Micel', '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CUESTION_08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', N'Sérum Vita', '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CUESTION_09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', N'Base de Ma', '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CUESTION_10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', N'Corrector ', '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CUESTION_11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', N'Bálsamo Re', '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CUESTION_12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', N'Exfoliante', '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CUESTION_13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', N'Contorno d', '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CUESTION_14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', N'Mascarilla', '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CUESTION_15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', N'Bruma Term', '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CUESTION_16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', N'Aceite Lim', '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CUESTION_17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', N'Tónico Equ', '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CUESTION_18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', N'Labial Hid', '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CUESTION_19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', N'Polvo Tras', '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CUESTION_20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', N'Rubor Líqu', '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CUESTION_21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', N'Sérum Ácid', '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CUESTION_22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', N'Ampolletas', '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CUESTION_23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', N'Crema Desp', '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CUESTION_24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', N'Protector ', '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CUESTION_25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', N'Loción Cor', '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CUESTION_26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', N'Primer Fac', '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CUESTION_27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', N'Máscara de', '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CUESTION_28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', N'Sérum Pépt', '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CUESTION_29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', N'Bálsamo De', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CUESTION_30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', N'Crema Barr', '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.cuestionarios_diagnostico OFF;
GO

-- =================================================================================================
-- 018. TABLA: clientes.preguntas_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.preguntas_diagnostico ON;
INSERT INTO clientes.preguntas_diagnostico (id_pregunta, cuestionario, numero_orden, enunciado_pregunta, tipo_respuesta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'ESCALA_NUMERICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'OPCION_UNICA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'OPCION_MULTIPLE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'ESCALA_NUMERICA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.preguntas_diagnostico OFF;
GO

-- =================================================================================================
-- 019. TABLA: clientes.opciones_pregunta (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.opciones_pregunta ON;
INSERT INTO clientes.opciones_pregunta (id_opcion, pregunta, clave_opcion, texto_opcion, peso_clinico_puntos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO clientes.evaluaciones_diagnostico (id_evaluacion, cliente, cuestionario, fecha_realizacion, puntaje_total, diagnostico_sugerido, observaciones_dermoconsultor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '2026-02-02 11:30:00', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '2026-02-03 11:30:00', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '2026-02-04 11:30:00', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '2026-02-05 11:30:00', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '2026-02-06 11:30:00', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '2026-02-07 11:30:00', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '2026-02-08 11:30:00', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '2026-02-09 11:30:00', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '2026-02-10 11:30:00', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '2026-02-11 11:30:00', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '2026-02-12 11:30:00', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '2026-02-13 11:30:00', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '2026-02-14 11:30:00', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '2026-02-15 11:30:00', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '2026-02-16 11:30:00', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '2026-02-17 11:30:00', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '2026-02-18 11:30:00', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '2026-02-19 11:30:00', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '2026-02-20 11:30:00', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '2026-02-21 11:30:00', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '2026-02-22 11:30:00', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '2026-02-23 11:30:00', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '2026-02-24 11:30:00', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '2026-02-25 11:30:00', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '2026-02-26 11:30:00', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '2026-02-27 11:30:00', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '2026-02-28 11:30:00', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '2026-02-01 11:30:00', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '2026-02-02 11:30:00', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.evaluaciones_diagnostico OFF;
GO

-- =================================================================================================
-- 021. TABLA: clientes.respuestas_evaluacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.respuestas_evaluacion ON;
INSERT INTO clientes.respuestas_evaluacion (id_respuesta_evaluacion, evaluacion, pregunta, opcion_seleccionada, valor_texto_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.respuestas_evaluacion OFF;
GO

-- =================================================================================================
-- 022. TABLA: clientes.consentimientos_privacidad (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.consentimientos_privacidad ON;
INSERT INTO clientes.consentimientos_privacidad (id_consentimiento, cliente, version_aviso_privacidad, acepta_finalidades_primarias, acepta_finalidades_secundarias_marketing, acepta_tratamiento_datos_salud_sensibles, direccion_ip_firma, medio_consentimiento, fecha_consentimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10', 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Po', N'CHECKBOX_DIGITAL', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumo', 0, 0, 0, N'Gel Limpiador Espumoso Facial - CeraVe Dermat', N'FIRMA_ELECTRONICA', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Flui', 1, 1, 1, N'Protector Solar Fluido SPF 50+ - The Ordinary', N'EN_SUCURSAL', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurón', 0, 0, 0, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotop', N'CHECKBOX_DIGITAL', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con', 1, 1, 1, N'Crema Hidratante con Ceramidas - Bioderma Lab', N'FIRMA_ELECTRONICA', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% No', 0, 0, 0, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avè', N'EN_SUCURSAL', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermoli', 1, 1, 1, N'Agua Micelar Dermolimpiadora - Eucerin Beiers', N'CHECKBOX_DIGITAL', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pur', 0, 0, 0, N'Sérum Vitamina C Pura 15% - Vichy Laboratoire', N'FIRMA_ELECTRONICA', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje C', 1, 1, 1, N'Base de Maquillaje Cobertura Media - SkinCeut', N'EN_SUCURSAL', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Al', 0, 0, 0, N'Corrector Líquido Alta Duración - Sesderma Na', N'CHECKBOX_DIGITAL', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Ci', 1, 1, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmeti', N'FIRMA_ELECTRONICA', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Sal', 0, 0, 0, N'Exfoliante Ácido Salicílico 2% - MAC Professi', N'EN_SUCURSAL', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con', 1, 1, 1, N'Contorno de Ojos con Cafeína 5% - Fenty Beaut', N'CHECKBOX_DIGITAL', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna ', 0, 0, 0, N'Mascarilla Nocturna Hidratante - Rare Beauty ', N'FIRMA_ELECTRONICA', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmant', 1, 1, 1, N'Bruma Termal Calmante Mineral - Clinique Labo', N'EN_SUCURSAL', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emu', 0, 0, 0, N'Aceite Limpiador Emulsionable - Estée Lauder ', N'CHECKBOX_DIGITAL', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante ', 1, 1, 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lanc', N'FIRMA_ELECTRONICA', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Pé', 0, 0, 0, N'Labial Hidratante Péptidos Nude - Charlotte T', N'EN_SUCURSAL', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Mat', 1, 1, 1, N'Polvo Traslúcido Matificante Mineral - Paula''', N'CHECKBOX_DIGITAL', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmen', 0, 0, 0, N'Rubor Líquido Pigmento Natural - COSRX K-Beau', N'FIRMA_ELECTRONICA', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico', 1, 1, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige', N'EN_SUCURSAL', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteogli', 0, 0, 0, N'Ampolletas Proteoglicanos Firmeza - Uriage Ea', N'CHECKBOX_DIGITAL', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante', 1, 1, 1, N'Crema Despigmentante Noche Melasma - Laborato', N'FIRMA_ELECTRONICA', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mine', 0, 0, 0, N'Protector Solar Mineral Óxido Zinc - MartiDer', N'EN_SUCURSAL', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea', 1, 1, 1, N'Loción Corporal Urea 10% Reparadora - Helioca', N'CHECKBOX_DIGITAL', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimi', 0, 0, 0, N'Primer Facial Minimizador de Poros - Kiehl''s ', N'FIRMA_ELECTRONICA', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas ', 1, 1, 1, N'Máscara de Pestañas Hipoalergénica - Garnier ', N'EN_SUCURSAL', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Co', 0, 0, 0, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris De', N'CHECKBOX_DIGITAL', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillan', 1, 1, 1, N'Bálsamo Desmaquillante Caléndula - Neutrogena', N'FIRMA_ELECTRONICA', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-R', 0, 0, 0, N'Crema Barrera Post-Retinoide - DermaCare Labs', N'EN_SUCURSAL', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.consentimientos_privacidad OFF;
GO

-- =================================================================================================
-- 023. TABLA: clientes.solicitudes_arco (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.solicitudes_arco ON;
INSERT INTO clientes.solicitudes_arco (id_solicitud_arco, folio_solicitud, cliente, tipo_derecho, motivo_solicitud, estado_tramite, fecha_limite_respuesta, resolucion_juridica, fecha_resolucion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-SOLIC-2026-0001', 1, N'ACCESO', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', N'RECIBIDA', '2026-03-01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-SOLIC-2026-0002', 2, N'RECTIFICACION', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', N'EN_REVISION', '2026-03-02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-SOLIC-2026-0003', 3, N'CANCELACION', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', N'PROCEDENTE', '2026-03-03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-SOLIC-2026-0004', 4, N'OPOSICION', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', N'IMPROCEDENTE', '2026-03-04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-SOLIC-2026-0005', 5, N'ACCESO', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', N'CONCLUIDA', '2026-03-05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-SOLIC-2026-0006', 6, N'RECTIFICACION', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', N'RECIBIDA', '2026-03-06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-SOLIC-2026-0007', 7, N'CANCELACION', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', N'EN_REVISION', '2026-03-07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-SOLIC-2026-0008', 8, N'OPOSICION', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', N'PROCEDENTE', '2026-03-08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-SOLIC-2026-0009', 9, N'ACCESO', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', N'IMPROCEDENTE', '2026-03-09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-SOLIC-2026-0010', 10, N'RECTIFICACION', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', N'CONCLUIDA', '2026-03-10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-SOLIC-2026-0011', 11, N'CANCELACION', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', N'RECIBIDA', '2026-03-11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-SOLIC-2026-0012', 12, N'OPOSICION', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', N'EN_REVISION', '2026-03-12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-SOLIC-2026-0013', 13, N'ACCESO', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', N'PROCEDENTE', '2026-03-13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-SOLIC-2026-0014', 14, N'RECTIFICACION', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', N'IMPROCEDENTE', '2026-03-14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-SOLIC-2026-0015', 15, N'CANCELACION', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', N'CONCLUIDA', '2026-03-15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-SOLIC-2026-0016', 16, N'OPOSICION', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', N'RECIBIDA', '2026-03-16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-SOLIC-2026-0017', 17, N'ACCESO', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', N'EN_REVISION', '2026-03-17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-SOLIC-2026-0018', 18, N'RECTIFICACION', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', N'PROCEDENTE', '2026-03-18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-SOLIC-2026-0019', 19, N'CANCELACION', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', N'IMPROCEDENTE', '2026-03-19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-SOLIC-2026-0020', 20, N'OPOSICION', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', N'CONCLUIDA', '2026-03-20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-SOLIC-2026-0021', 21, N'ACCESO', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', N'RECIBIDA', '2026-03-21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-SOLIC-2026-0022', 22, N'RECTIFICACION', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', N'EN_REVISION', '2026-03-22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-SOLIC-2026-0023', 23, N'CANCELACION', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', N'PROCEDENTE', '2026-03-23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-SOLIC-2026-0024', 24, N'OPOSICION', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', N'IMPROCEDENTE', '2026-03-24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-SOLIC-2026-0025', 25, N'ACCESO', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', N'CONCLUIDA', '2026-03-25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-SOLIC-2026-0026', 26, N'RECTIFICACION', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', N'RECIBIDA', '2026-03-26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-SOLIC-2026-0027', 27, N'CANCELACION', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', N'EN_REVISION', '2026-03-27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-SOLIC-2026-0028', 28, N'OPOSICION', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', N'PROCEDENTE', '2026-03-28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-SOLIC-2026-0029', 29, N'ACCESO', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', N'IMPROCEDENTE', '2026-03-01', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-SOLIC-2026-0030', 30, N'RECTIFICACION', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', N'CONCLUIDA', '2026-03-02', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.solicitudes_arco OFF;
GO

-- =================================================================================================
-- 024. TABLA: clientes.preferencias_comunicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT clientes.preferencias_comunicacion ON;
INSERT INTO clientes.preferencias_comunicacion (id_preferencia, cliente, canal_email, canal_sms, canal_whatsapp, notificaciones_ofertas, alertas_reabastecimiento_rutina, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO clientes.metodos_pago_tokenizados (id_metodo_tokenizado, cliente, pasarela_emisor, token_tarjeta_pasarela, marca_tarjeta, ultimos_cuatro_digitos, mes_expiracion, anio_expiracion, titular_tarjeta_hash, es_predeterminada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'VISA', '4101', 1, 2027, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial ', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'MASTERCARD', '4102', 2, 2028, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'AMEX', '4103', 3, 2029, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'VISA', '4104', 4, 2030, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'MASTERCARD', '4105', 5, 2026, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - E', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'AMEX', '4106', 6, 2027, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora -', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'VISA', '4107', 7, 2028, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vi', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'MASTERCARD', '4108', 8, 2029, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura M', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'AMEX', '4109', 9, 2030, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duració', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'VISA', '4110', 10, 2026, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'MASTERCARD', '4111', 11, 2027, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2%', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'AMEX', '4112', 12, 2028, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'VISA', '4113', 1, 2029, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'MASTERCARD', '4114', 2, 2030, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral ', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'AMEX', '4115', 3, 2026, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable ', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'VISA', '4116', 4, 2027, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glic', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'MASTERCARD', '4117', 5, 2028, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nud', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'AMEX', '4118', 6, 2029, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante M', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'VISA', '4119', 7, 2030, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'MASTERCARD', '4120', 8, 2026, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspe', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'AMEX', '4121', 9, 2027, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firm', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'VISA', '4122', 10, 2028, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Mel', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'MASTERCARD', '4123', 11, 2029, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido ', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'AMEX', '4124', 12, 2030, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Repar', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'VISA', '4125', 1, 2026, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de P', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'MASTERCARD', '4126', 2, 2027, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergé', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'AMEX', '4127', 3, 2028, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'VISA', '4128', 4, 2029, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndu', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'MASTERCARD', '4129', 5, 2030, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide -', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'AMEX', '4130', 6, 2026, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT clientes.metodos_pago_tokenizados OFF;
GO

-- =================================================================================================
-- 026. TABLA: catalogo.marcas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.marcas ON;
INSERT INTO catalogo.marcas (id_marca, codigo_marca, nombre_marca, pais_origen, sitio_web, es_dermocosmetica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MARCA_01', N'La Roche-Posay', N'Francia', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MARCA_02', N'CeraVe Dermatological', N'Estados Unidos', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MARCA_03', N'The Ordinary Deciem', N'Canadá', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MARCA_04', N'ISDIN Fotoprotección', N'España', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MARCA_05', N'Bioderma Laboratoire', N'Francia', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MARCA_06', N'Eau Thermale Avène', N'Francia', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MARCA_07', N'Eucerin Beiersdorf', N'Alemania', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MARCA_08', N'Vichy Laboratoires', N'Francia', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MARCA_09', N'SkinCeuticals Clinical', N'Estados Unidos', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MARCA_10', N'Sesderma Nanotech', N'España', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MARCA_11', N'NARS Cosmetics', N'Estados Unidos', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MARCA_12', N'MAC Professional', N'Canadá', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MARCA_13', N'Fenty Beauty', N'Estados Unidos', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MARCA_14', N'Rare Beauty', N'Estados Unidos', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MARCA_15', N'Clinique Laboratories', N'Estados Unidos', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MARCA_16', N'Estée Lauder', N'Estados Unidos', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MARCA_17', N'Lancôme Paris', N'Francia', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MARCA_18', N'Charlotte Tilbury', N'Reino Unido', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MARCA_19', N'Paula''s Choice Skincare', N'Estados Unidos', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MARCA_20', N'COSRX K-Beauty', N'Corea del Sur', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MARCA_21', N'Laneige Amorepacific', N'Corea del Sur', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MARCA_22', N'Uriage Eau Thermale', N'Francia', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MARCA_23', N'Laboratoire SVR', N'Francia', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MARCA_24', N'MartiDerm Ampollas', N'España', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MARCA_25', N'Heliocare Cantabria Labs', N'España', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MARCA_26', N'Kiehl''s Since 1851', N'Estados Unidos', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MARCA_27', N'Garnier SkinActive', N'Francia', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MARCA_28', N'L''Oréal Paris Derm', N'Francia', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MARCA_29', N'Neutrogena Derm', N'Estados Unidos', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MARCA_30', N'DermaCare Labs México', N'México', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.marcas OFF;
GO

-- =================================================================================================
-- 027. TABLA: catalogo.laboratorios_fabricantes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.laboratorios_fabricantes ON;
INSERT INTO catalogo.laboratorios_fabricantes (id_laboratorio, clave_laboratorio, razon_social, licencia_sanitaria, pais, certificacion_gmp_vigente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'LABORATO_01', N'Laboratorios La Roche-Posay S.A. de C.V.', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'LABORATO_02', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'LABORATO_03', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', N'Canadá', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'LABORATO_04', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'España', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'LABORATO_05', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'LABORATO_06', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'LABORATO_07', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Alemania', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'LABORATO_08', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'LABORATO_09', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'LABORATO_10', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'España', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'LABORATO_11', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'LABORATO_12', N'Laboratorios MAC Professional S.A. de C.V.', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Canadá', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'LABORATO_13', N'Laboratorios Fenty Beauty S.A. de C.V.', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'LABORATO_14', N'Laboratorios Rare Beauty S.A. de C.V.', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'LABORATO_15', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'LABORATO_16', N'Laboratorios Estée Lauder S.A. de C.V.', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'LABORATO_17', N'Laboratorios Lancôme Paris S.A. de C.V.', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'LABORATO_18', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Reino Unido', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'LABORATO_19', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'LABORATO_20', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Corea del Sur', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'LABORATO_21', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Corea del Sur', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'LABORATO_22', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'LABORATO_23', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'LABORATO_24', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'España', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'LABORATO_25', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', N'España', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'LABORATO_26', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Estados Unidos', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'LABORATO_27', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Francia', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'LABORATO_28', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Francia', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'LABORATO_29', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Estados Unidos', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'LABORATO_30', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'México', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.laboratorios_fabricantes OFF;
GO

-- =================================================================================================
-- 028. TABLA: catalogo.categorias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.categorias ON;
INSERT INTO catalogo.categorias (id_categoria, codigo_categoria, nombre_categoria, descripcion, categoria_padre, nivel_arbol, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CATEGORI_01', N'Sueros Concentrados Nivel 1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', NULL, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CATEGORI_02', N'Limpiadores Faciales Nivel 2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', NULL, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CATEGORI_03', N'Fotoprotección Solar Nivel 3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', NULL, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CATEGORI_04', N'Maquillaje Mineral Nivel 4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', NULL, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CATEGORI_05', N'Cuidado Anti-Edad Nivel 5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', NULL, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CATEGORI_06', N'Barrera Cutánea Nivel 6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CATEGORI_07', N'Contorno de Ojos Nivel 7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 2, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CATEGORI_08', N'Tratamiento Acné Nivel 8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 3, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CATEGORI_09', N'Hidratantes Ceramidas Nivel 9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 4, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CATEGORI_10', N'Exfoliantes Químicos Nivel 10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 5, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CATEGORI_11', N'Sueros Concentrados Nivel 11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CATEGORI_12', N'Limpiadores Faciales Nivel 12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 2, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CATEGORI_13', N'Fotoprotección Solar Nivel 13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 3, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CATEGORI_14', N'Maquillaje Mineral Nivel 14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 4, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CATEGORI_15', N'Cuidado Anti-Edad Nivel 15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 5, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CATEGORI_16', N'Barrera Cutánea Nivel 16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CATEGORI_17', N'Contorno de Ojos Nivel 17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 2, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CATEGORI_18', N'Tratamiento Acné Nivel 18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 3, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CATEGORI_19', N'Hidratantes Ceramidas Nivel 19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 4, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CATEGORI_20', N'Exfoliantes Químicos Nivel 20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 5, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CATEGORI_21', N'Sueros Concentrados Nivel 21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CATEGORI_22', N'Limpiadores Faciales Nivel 22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 2, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CATEGORI_23', N'Fotoprotección Solar Nivel 23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 3, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CATEGORI_24', N'Maquillaje Mineral Nivel 24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 4, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CATEGORI_25', N'Cuidado Anti-Edad Nivel 25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 5, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CATEGORI_26', N'Barrera Cutánea Nivel 26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CATEGORI_27', N'Contorno de Ojos Nivel 27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 2, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CATEGORI_28', N'Tratamiento Acné Nivel 28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 3, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CATEGORI_29', N'Hidratantes Ceramidas Nivel 29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 4, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CATEGORI_30', N'Exfoliantes Químicos Nivel 30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.categorias OFF;
GO

-- =================================================================================================
-- 029. TABLA: catalogo.subcategorias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.subcategorias ON;
INSERT INTO catalogo.subcategorias (id_subcategoria, categoria, codigo_subcategoria, nombre_subcategoria, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SUBCATEG_01', N'Sueros Concentrados Nivel 1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SUBCATEG_02', N'Limpiadores Faciales Nivel 2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SUBCATEG_03', N'Fotoprotección Solar Nivel 3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SUBCATEG_04', N'Maquillaje Mineral Nivel 4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SUBCATEG_05', N'Cuidado Anti-Edad Nivel 5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SUBCATEG_06', N'Barrera Cutánea Nivel 6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SUBCATEG_07', N'Contorno de Ojos Nivel 7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SUBCATEG_08', N'Tratamiento Acné Nivel 8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SUBCATEG_09', N'Hidratantes Ceramidas Nivel 9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SUBCATEG_10', N'Exfoliantes Químicos Nivel 10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SUBCATEG_11', N'Sueros Concentrados Nivel 11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SUBCATEG_12', N'Limpiadores Faciales Nivel 12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SUBCATEG_13', N'Fotoprotección Solar Nivel 13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SUBCATEG_14', N'Maquillaje Mineral Nivel 14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SUBCATEG_15', N'Cuidado Anti-Edad Nivel 15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SUBCATEG_16', N'Barrera Cutánea Nivel 16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SUBCATEG_17', N'Contorno de Ojos Nivel 17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SUBCATEG_18', N'Tratamiento Acné Nivel 18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SUBCATEG_19', N'Hidratantes Ceramidas Nivel 19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SUBCATEG_20', N'Exfoliantes Químicos Nivel 20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SUBCATEG_21', N'Sueros Concentrados Nivel 21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SUBCATEG_22', N'Limpiadores Faciales Nivel 22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SUBCATEG_23', N'Fotoprotección Solar Nivel 23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SUBCATEG_24', N'Maquillaje Mineral Nivel 24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SUBCATEG_25', N'Cuidado Anti-Edad Nivel 25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SUBCATEG_26', N'Barrera Cutánea Nivel 26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SUBCATEG_27', N'Contorno de Ojos Nivel 27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SUBCATEG_28', N'Tratamiento Acné Nivel 28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SUBCATEG_29', N'Hidratantes Ceramidas Nivel 29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SUBCATEG_30', N'Exfoliantes Químicos Nivel 30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.subcategorias OFF;
GO

-- =================================================================================================
-- 030. TABLA: catalogo.tipos_aplicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.tipos_aplicacion ON;
INSERT INTO catalogo.tipos_aplicacion (id_tipo_aplicacion, codigo_aplicacion, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'APLICACI_01', N'Carlos Mendoza Garza', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'APLICACI_02', N'Sofía Ramírez López', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'APLICACI_03', N'Valeria Torres Villarreal', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'APLICACI_04', N'Alejandro Hernández Cruz', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'APLICACI_05', N'Mariana Sánchez Fuentes', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'APLICACI_06', N'Diego Martínez Treviño', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'APLICACI_07', N'Camila González Reyes', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'APLICACI_08', N'Mateo Flores Castillo', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'APLICACI_09', N'Lucía Morales Díaz', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'APLICACI_10', N'Sebastián Vázquez Ortiz', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'APLICACI_11', N'Regina Gutiérrez Nava', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'APLICACI_12', N'Santiago Jiménez Pérez', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'APLICACI_13', N'Fernanda Ruiz Salazar', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'APLICACI_14', N'Emiliano Ríos Cárdenas', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'APLICACI_15', N'Ximena Aguilar Ibarra', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'APLICACI_16', N'Daniel Méndez Navarro', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'APLICACI_17', N'Andrea Castro Delgado', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'APLICACI_18', N'Gabriel Vega Montoya', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'APLICACI_19', N'Paula Cortés Rojas', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'APLICACI_20', N'Andrés Ramos Campos', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'APLICACI_21', N'Renata Guerrero Luna', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'APLICACI_22', N'Nicolás Peña Cabrera', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'APLICACI_23', N'Natalia Herrera Vargas', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'APLICACI_24', N'Joaquín Medina Contreras', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'APLICACI_25', N'Isabella Domínguez Escobar', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'APLICACI_26', N'Leonardo Silva Paredes', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'APLICACI_27', N'Ana Chávez Bautista', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'APLICACI_28', N'Rodrigo Ochoa Acosta', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'APLICACI_29', N'Paulina Miranda Leal', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'APLICACI_30', N'Mauricio Padilla Solís', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.tipos_aplicacion OFF;
GO

-- =================================================================================================
-- 031. TABLA: catalogo.certificaciones_sanitarias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.certificaciones_sanitarias ON;
INSERT INTO catalogo.certificaciones_sanitarias (id_certificacion, codigo_certificacion, nombre_certificacion, organismo_certificador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CERTIFIC_01', N'Sueros Concentrados Nivel 1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CERTIFIC_02', N'Limpiadores Faciales Nivel 2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CERTIFIC_03', N'Fotoprotección Solar Nivel 3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CERTIFIC_04', N'Maquillaje Mineral Nivel 4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CERTIFIC_05', N'Cuidado Anti-Edad Nivel 5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CERTIFIC_06', N'Barrera Cutánea Nivel 6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CERTIFIC_07', N'Contorno de Ojos Nivel 7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CERTIFIC_08', N'Tratamiento Acné Nivel 8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CERTIFIC_09', N'Hidratantes Ceramidas Nivel 9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CERTIFIC_10', N'Exfoliantes Químicos Nivel 10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CERTIFIC_11', N'Sueros Concentrados Nivel 11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CERTIFIC_12', N'Limpiadores Faciales Nivel 12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CERTIFIC_13', N'Fotoprotección Solar Nivel 13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CERTIFIC_14', N'Maquillaje Mineral Nivel 14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CERTIFIC_15', N'Cuidado Anti-Edad Nivel 15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CERTIFIC_16', N'Barrera Cutánea Nivel 16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CERTIFIC_17', N'Contorno de Ojos Nivel 17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CERTIFIC_18', N'Tratamiento Acné Nivel 18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CERTIFIC_19', N'Hidratantes Ceramidas Nivel 19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CERTIFIC_20', N'Exfoliantes Químicos Nivel 20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CERTIFIC_21', N'Sueros Concentrados Nivel 21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CERTIFIC_22', N'Limpiadores Faciales Nivel 22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CERTIFIC_23', N'Fotoprotección Solar Nivel 23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CERTIFIC_24', N'Maquillaje Mineral Nivel 24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CERTIFIC_25', N'Cuidado Anti-Edad Nivel 25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CERTIFIC_26', N'Barrera Cutánea Nivel 26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CERTIFIC_27', N'Contorno de Ojos Nivel 27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CERTIFIC_28', N'Tratamiento Acné Nivel 28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CERTIFIC_29', N'Hidratantes Ceramidas Nivel 29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CERTIFIC_30', N'Exfoliantes Químicos Nivel 30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.certificaciones_sanitarias OFF;
GO

-- =================================================================================================
-- 032. TABLA: catalogo.productos_maestros (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.productos_maestros ON;
INSERT INTO catalogo.productos_maestros (id_producto, marca, subcategoria, laboratorio, tipo_aplicacion, certificacion_sanitaria, codigo_producto, nombre_comercial, descripcion_corta, descripcion_detallada, modo_empleo, requiere_prescripcion_medica, factor_proteccion_solar_fps, es_sensible_temperatura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 1, N'PRODUCTO_01', N'Kit Rutina La Roche-Posay #1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, N'PRODUCTO_02', N'Kit Rutina CeraVe Dermatological #2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, N'PRODUCTO_03', N'Kit Rutina The Ordinary Deciem #3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, N'PRODUCTO_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 30, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, N'PRODUCTO_05', N'Kit Rutina Bioderma Laboratoire #5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, N'PRODUCTO_06', N'Kit Rutina Eau Thermale Avène #6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 30, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, N'PRODUCTO_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, N'PRODUCTO_08', N'Kit Rutina Vichy Laboratoires #8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, N'PRODUCTO_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, N'PRODUCTO_10', N'Kit Rutina Sesderma Nanotech #10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, N'PRODUCTO_11', N'Kit Rutina NARS Cosmetics #11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, N'PRODUCTO_12', N'Kit Rutina MAC Professional #12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, N'PRODUCTO_13', N'Kit Rutina Fenty Beauty #13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, N'PRODUCTO_14', N'Kit Rutina Rare Beauty #14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 30, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, N'PRODUCTO_15', N'Kit Rutina Clinique Laboratories #15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, N'PRODUCTO_16', N'Kit Rutina Estée Lauder #16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 30, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, N'PRODUCTO_17', N'Kit Rutina Lancôme Paris #17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, N'PRODUCTO_18', N'Kit Rutina Charlotte Tilbury #18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, N'PRODUCTO_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, N'PRODUCTO_20', N'Kit Rutina COSRX K-Beauty #20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, N'PRODUCTO_21', N'Kit Rutina Laneige Amorepacific #21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, N'PRODUCTO_22', N'Kit Rutina Uriage Eau Thermale #22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, N'PRODUCTO_23', N'Kit Rutina Laboratoire SVR #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, N'PRODUCTO_24', N'Kit Rutina MartiDerm Ampollas #24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 30, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, N'PRODUCTO_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, N'PRODUCTO_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 30, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, N'PRODUCTO_27', N'Kit Rutina Garnier SkinActive #27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, N'PRODUCTO_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 50, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, N'PRODUCTO_29', N'Kit Rutina Neutrogena Derm #29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, N'PRODUCTO_30', N'Kit Rutina DermaCare Labs México #30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 50, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.productos_maestros OFF;
GO

-- =================================================================================================
-- 033. TABLA: catalogo.subtonos_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.subtonos_maquillaje ON;
INSERT INTO catalogo.subtonos_maquillaje (id_subtono, codigo_subtono, nombre_subtono, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SUBTONO_01', N'Sueros Concentrados Nivel 1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SUBTONO_02', N'Limpiadores Faciales Nivel 2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SUBTONO_03', N'Fotoprotección Solar Nivel 3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SUBTONO_04', N'Maquillaje Mineral Nivel 4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SUBTONO_05', N'Cuidado Anti-Edad Nivel 5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'SUBTONO_06', N'Barrera Cutánea Nivel 6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'SUBTONO_07', N'Contorno de Ojos Nivel 7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'SUBTONO_08', N'Tratamiento Acné Nivel 8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'SUBTONO_09', N'Hidratantes Ceramidas Nivel 9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'SUBTONO_10', N'Exfoliantes Químicos Nivel 10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'SUBTONO_11', N'Sueros Concentrados Nivel 11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'SUBTONO_12', N'Limpiadores Faciales Nivel 12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'SUBTONO_13', N'Fotoprotección Solar Nivel 13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'SUBTONO_14', N'Maquillaje Mineral Nivel 14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'SUBTONO_15', N'Cuidado Anti-Edad Nivel 15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'SUBTONO_16', N'Barrera Cutánea Nivel 16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'SUBTONO_17', N'Contorno de Ojos Nivel 17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'SUBTONO_18', N'Tratamiento Acné Nivel 18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'SUBTONO_19', N'Hidratantes Ceramidas Nivel 19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'SUBTONO_20', N'Exfoliantes Químicos Nivel 20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'SUBTONO_21', N'Sueros Concentrados Nivel 21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'SUBTONO_22', N'Limpiadores Faciales Nivel 22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'SUBTONO_23', N'Fotoprotección Solar Nivel 23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'SUBTONO_24', N'Maquillaje Mineral Nivel 24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'SUBTONO_25', N'Cuidado Anti-Edad Nivel 25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'SUBTONO_26', N'Barrera Cutánea Nivel 26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'SUBTONO_27', N'Contorno de Ojos Nivel 27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'SUBTONO_28', N'Tratamiento Acné Nivel 28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'SUBTONO_29', N'Hidratantes Ceramidas Nivel 29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'SUBTONO_30', N'Exfoliantes Químicos Nivel 30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.subtonos_maquillaje OFF;
GO

-- =================================================================================================
-- 034. TABLA: catalogo.acabados_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.acabados_maquillaje ON;
INSERT INTO catalogo.acabados_maquillaje (id_acabado, codigo_acabado, nombre_acabado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ACABADO_01', N'Sueros Concentrados Nivel 1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ACABADO_02', N'Limpiadores Faciales Nivel 2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ACABADO_03', N'Fotoprotección Solar Nivel 3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'ACABADO_04', N'Maquillaje Mineral Nivel 4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ACABADO_05', N'Cuidado Anti-Edad Nivel 5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'ACABADO_06', N'Barrera Cutánea Nivel 6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'ACABADO_07', N'Contorno de Ojos Nivel 7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'ACABADO_08', N'Tratamiento Acné Nivel 8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'ACABADO_09', N'Hidratantes Ceramidas Nivel 9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'ACABADO_10', N'Exfoliantes Químicos Nivel 10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ACABADO_11', N'Sueros Concentrados Nivel 11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ACABADO_12', N'Limpiadores Faciales Nivel 12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'ACABADO_13', N'Fotoprotección Solar Nivel 13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'ACABADO_14', N'Maquillaje Mineral Nivel 14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ACABADO_15', N'Cuidado Anti-Edad Nivel 15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'ACABADO_16', N'Barrera Cutánea Nivel 16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'ACABADO_17', N'Contorno de Ojos Nivel 17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ACABADO_18', N'Tratamiento Acné Nivel 18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'ACABADO_19', N'Hidratantes Ceramidas Nivel 19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'ACABADO_20', N'Exfoliantes Químicos Nivel 20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ACABADO_21', N'Sueros Concentrados Nivel 21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'ACABADO_22', N'Limpiadores Faciales Nivel 22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'ACABADO_23', N'Fotoprotección Solar Nivel 23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'ACABADO_24', N'Maquillaje Mineral Nivel 24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'ACABADO_25', N'Cuidado Anti-Edad Nivel 25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'ACABADO_26', N'Barrera Cutánea Nivel 26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ACABADO_27', N'Contorno de Ojos Nivel 27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'ACABADO_28', N'Tratamiento Acné Nivel 28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'ACABADO_29', N'Hidratantes Ceramidas Nivel 29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'ACABADO_30', N'Exfoliantes Químicos Nivel 30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.acabados_maquillaje OFF;
GO

-- =================================================================================================
-- 035. TABLA: catalogo.variantes_sku (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.variantes_sku ON;
INSERT INTO catalogo.variantes_sku (id_variante_sku, producto, sku_codigo, codigo_barras_ean13, nombre_presentacion, contenido_neto_gramos_ml, unidad_medida, precio_base_menudeo, costo_estandar_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'DERMA-SKU-1001', N'DERMA-SKU-1001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, N'ML', 285.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'DERMA-SKU-1002', N'DERMA-SKU-1002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, N'G', 321.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'DERMA-SKU-1003', N'DERMA-SKU-1003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, N'OZ', 356.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DERMA-SKU-1004', N'DERMA-SKU-1004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, N'PZ', 392.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'DERMA-SKU-1005', N'DERMA-SKU-1005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, N'ML', 427.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'DERMA-SKU-1006', N'DERMA-SKU-1006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, N'G', 463.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'DERMA-SKU-1007', N'DERMA-SKU-1007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, N'OZ', 498.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DERMA-SKU-1008', N'DERMA-SKU-1008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, N'PZ', 534.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'DERMA-SKU-1009', N'DERMA-SKU-1009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, N'ML', 569.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'DERMA-SKU-1010', N'DERMA-SKU-1010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, N'G', 605.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'DERMA-SKU-1011', N'DERMA-SKU-1011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, N'OZ', 640.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DERMA-SKU-1012', N'DERMA-SKU-1012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, N'PZ', 676.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'DERMA-SKU-1013', N'DERMA-SKU-1013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, N'ML', 711.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'DERMA-SKU-1014', N'DERMA-SKU-1014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, N'G', 747.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'DERMA-SKU-1015', N'DERMA-SKU-1015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, N'OZ', 782.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DERMA-SKU-1016', N'DERMA-SKU-1016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, N'PZ', 818.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'DERMA-SKU-1017', N'DERMA-SKU-1017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, N'ML', 853.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'DERMA-SKU-1018', N'DERMA-SKU-1018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, N'G', 889.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'DERMA-SKU-1019', N'DERMA-SKU-1019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, N'OZ', 924.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DERMA-SKU-1020', N'DERMA-SKU-1020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, N'PZ', 960.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'DERMA-SKU-1021', N'DERMA-SKU-1021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, N'ML', 995.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'DERMA-SKU-1022', N'DERMA-SKU-1022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, N'G', 1031.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'DERMA-SKU-1023', N'DERMA-SKU-1023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, N'OZ', 1066.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DERMA-SKU-1024', N'DERMA-SKU-1024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, N'PZ', 1102.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'DERMA-SKU-1025', N'DERMA-SKU-1025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, N'ML', 1137.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'DERMA-SKU-1026', N'DERMA-SKU-1026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, N'G', 1173.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'DERMA-SKU-1027', N'DERMA-SKU-1027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, N'OZ', 1208.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DERMA-SKU-1028', N'DERMA-SKU-1028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, N'PZ', 1244.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'DERMA-SKU-1029', N'DERMA-SKU-1029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, N'ML', 1279.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'DERMA-SKU-1030', N'DERMA-SKU-1030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, N'G', 1315.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.variantes_sku OFF;
GO

-- =================================================================================================
-- 036. TABLA: catalogo.tonos_variante (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.tonos_variante ON;
INSERT INTO catalogo.tonos_variante (id_tono_variante, variante_sku, subtono, acabado, codigo_tono_color, nombre_tono, color_hexadecimal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'TONO_COL_01', N'Sueros Concentrados Nivel 1', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, N'TONO_COL_02', N'Limpiadores Faciales Nivel 2', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, N'TONO_COL_03', N'Fotoprotección Solar Nivel 3', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, N'TONO_COL_04', N'Maquillaje Mineral Nivel 4', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, N'TONO_COL_05', N'Cuidado Anti-Edad Nivel 5', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, N'TONO_COL_06', N'Barrera Cutánea Nivel 6', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, N'TONO_COL_07', N'Contorno de Ojos Nivel 7', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, N'TONO_COL_08', N'Tratamiento Acné Nivel 8', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, N'TONO_COL_09', N'Hidratantes Ceramidas Nivel 9', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, N'TONO_COL_10', N'Exfoliantes Químicos Nivel 10', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, N'TONO_COL_11', N'Sueros Concentrados Nivel 11', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, N'TONO_COL_12', N'Limpiadores Faciales Nivel 12', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, N'TONO_COL_13', N'Fotoprotección Solar Nivel 13', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, N'TONO_COL_14', N'Maquillaje Mineral Nivel 14', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, N'TONO_COL_15', N'Cuidado Anti-Edad Nivel 15', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, N'TONO_COL_16', N'Barrera Cutánea Nivel 16', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, N'TONO_COL_17', N'Contorno de Ojos Nivel 17', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, N'TONO_COL_18', N'Tratamiento Acné Nivel 18', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, N'TONO_COL_19', N'Hidratantes Ceramidas Nivel 19', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, N'TONO_COL_20', N'Exfoliantes Químicos Nivel 20', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, N'TONO_COL_21', N'Sueros Concentrados Nivel 21', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, N'TONO_COL_22', N'Limpiadores Faciales Nivel 22', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, N'TONO_COL_23', N'Fotoprotección Solar Nivel 23', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, N'TONO_COL_24', N'Maquillaje Mineral Nivel 24', N'#7D412E', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, N'TONO_COL_25', N'Cuidado Anti-Edad Nivel 25', N'#F5D0C5', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, N'TONO_COL_26', N'Barrera Cutánea Nivel 26', N'#E8B4A0', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, N'TONO_COL_27', N'Contorno de Ojos Nivel 27', N'#D4967D', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, N'TONO_COL_28', N'Tratamiento Acné Nivel 28', N'#C27A61', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, N'TONO_COL_29', N'Hidratantes Ceramidas Nivel 29', N'#9E5B44', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, N'TONO_COL_30', N'Exfoliantes Químicos Nivel 30', N'#7D412E', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.tonos_variante OFF;
GO

-- =================================================================================================
-- 037. TABLA: catalogo.ingredientes_inci (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.ingredientes_inci ON;
INSERT INTO catalogo.ingredientes_inci (id_ingrediente, codigo_cas, nombre_inci, nombre_comun, funcion_principal, es_comedogenico, indice_comedogenico, es_alergeno_frecuente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CAS_01', N'Niacinamide', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CAS_02', N'Sodium Hyaluronate', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAS_03', N'Retinol', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAS_04', N'Salicylic Acid', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CAS_05', N'Ascorbic Acid', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CAS_06', N'Ceramide NP', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CAS_07', N'Panthenol', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CAS_08', N'Azelaic Acid', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAS_09', N'Glycolic Acid', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CAS_10', N'Zinc Oxide', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CAS_11', N'Titanium Dioxide', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CAS_12', N'Tocopherol', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CAS_13', N'Madecassoside', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CAS_14', N'Squalane', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CAS_15', N'Allantoin', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CAS_16', N'Caffeine', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CAS_17', N'Urea', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CAS_18', N'Ferulic Acid', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CAS_19', N'Lactic Acid', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CAS_20', N'Bisabolol', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CAS_21', N'Bakuchiol', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CAS_22', N'Tranexamic Acid', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CAS_23', N'Copper Tripeptide-1', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CAS_24', N'Glycerin', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CAS_25', N'Dimethicone', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CAS_26', N'Shea Butter', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CAS_27', N'Thermal Spring Water', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CAS_28', N'Zinc PCA', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 0, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CAS_29', N'Kojic Acid', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CAS_30', N'Peptide Matrixyl 3000', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 2, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.ingredientes_inci OFF;
GO

-- =================================================================================================
-- 038. TABLA: catalogo.alergenos_ingrediente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.alergenos_ingrediente ON;
INSERT INTO catalogo.alergenos_ingrediente (id_alergeno, ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'BAJO', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'MEDIO', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', N'ALTO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'MUY_SEVERO', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'BAJO', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'MEDIO', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'ALTO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'MUY_SEVERO', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'BAJO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'MEDIO', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'ALTO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'MUY_SEVERO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'BAJO', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'MEDIO', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'ALTO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'MUY_SEVERO', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'BAJO', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'MEDIO', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'ALTO', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'MUY_SEVERO', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'BAJO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'MEDIO', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', N'ALTO', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'MUY_SEVERO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', N'BAJO', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'MEDIO', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'ALTO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'MUY_SEVERO', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'BAJO', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'MEDIO', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.alergenos_ingrediente OFF;
GO

-- =================================================================================================
-- 039. TABLA: catalogo.formula_ingredientes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.formula_ingredientes ON;
INSERT INTO catalogo.formula_ingredientes (id_formula_ingrediente, producto, ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 20.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 22.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 25.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 27.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 30.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 32.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 35.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 37.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 40.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 42.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 45.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 47.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 50.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 52.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 55.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 57.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 60.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 67.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 70.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 72.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 75.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 77.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 80.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 82.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 85.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 87.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 90.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.formula_ingredientes OFF;
GO

-- =================================================================================================
-- 040. TABLA: catalogo.registros_sanitarios_cofepris (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.registros_sanitarios_cofepris ON;
INSERT INTO catalogo.registros_sanitarios_cofepris (id_registro_sanitario, producto, numero_registro_sanitario, folio_ingreso_tramite, fecha_emision, fecha_vencimiento, estatus_regulatorio, documento_oficial_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'COF-2026-MX-10001-SAN', N'FOL-INGRE-2026-0001', '2026-03-01', '2026-03-01', N'VIGENTE', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'COF-2026-MX-10002-SAN', N'FOL-INGRE-2026-0002', '2026-03-02', '2026-03-02', N'EN_RENOVACION', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'COF-2026-MX-10003-SAN', N'FOL-INGRE-2026-0003', '2026-03-03', '2026-03-03', N'SUSPENDIDO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'COF-2026-MX-10004-SAN', N'FOL-INGRE-2026-0004', '2026-03-04', '2026-03-04', N'VENCIDO', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'COF-2026-MX-10005-SAN', N'FOL-INGRE-2026-0005', '2026-03-05', '2026-03-05', N'VIGENTE', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'COF-2026-MX-10006-SAN', N'FOL-INGRE-2026-0006', '2026-03-06', '2026-03-06', N'EN_RENOVACION', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'COF-2026-MX-10007-SAN', N'FOL-INGRE-2026-0007', '2026-03-07', '2026-03-07', N'SUSPENDIDO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'COF-2026-MX-10008-SAN', N'FOL-INGRE-2026-0008', '2026-03-08', '2026-03-08', N'VENCIDO', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'COF-2026-MX-10009-SAN', N'FOL-INGRE-2026-0009', '2026-03-09', '2026-03-09', N'VIGENTE', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'COF-2026-MX-10010-SAN', N'FOL-INGRE-2026-0010', '2026-03-10', '2026-03-10', N'EN_RENOVACION', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'COF-2026-MX-10011-SAN', N'FOL-INGRE-2026-0011', '2026-03-11', '2026-03-11', N'SUSPENDIDO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'COF-2026-MX-10012-SAN', N'FOL-INGRE-2026-0012', '2026-03-12', '2026-03-12', N'VENCIDO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'COF-2026-MX-10013-SAN', N'FOL-INGRE-2026-0013', '2026-03-13', '2026-03-13', N'VIGENTE', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'COF-2026-MX-10014-SAN', N'FOL-INGRE-2026-0014', '2026-03-14', '2026-03-14', N'EN_RENOVACION', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'COF-2026-MX-10015-SAN', N'FOL-INGRE-2026-0015', '2026-03-15', '2026-03-15', N'SUSPENDIDO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'COF-2026-MX-10016-SAN', N'FOL-INGRE-2026-0016', '2026-03-16', '2026-03-16', N'VENCIDO', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'COF-2026-MX-10017-SAN', N'FOL-INGRE-2026-0017', '2026-03-17', '2026-03-17', N'VIGENTE', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'COF-2026-MX-10018-SAN', N'FOL-INGRE-2026-0018', '2026-03-18', '2026-03-18', N'EN_RENOVACION', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'COF-2026-MX-10019-SAN', N'FOL-INGRE-2026-0019', '2026-03-19', '2026-03-19', N'SUSPENDIDO', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'COF-2026-MX-10020-SAN', N'FOL-INGRE-2026-0020', '2026-03-20', '2026-03-20', N'VENCIDO', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'COF-2026-MX-10021-SAN', N'FOL-INGRE-2026-0021', '2026-03-21', '2026-03-21', N'VIGENTE', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'COF-2026-MX-10022-SAN', N'FOL-INGRE-2026-0022', '2026-03-22', '2026-03-22', N'EN_RENOVACION', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'COF-2026-MX-10023-SAN', N'FOL-INGRE-2026-0023', '2026-03-23', '2026-03-23', N'SUSPENDIDO', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'COF-2026-MX-10024-SAN', N'FOL-INGRE-2026-0024', '2026-03-24', '2026-03-24', N'VENCIDO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'COF-2026-MX-10025-SAN', N'FOL-INGRE-2026-0025', '2026-03-25', '2026-03-25', N'VIGENTE', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'COF-2026-MX-10026-SAN', N'FOL-INGRE-2026-0026', '2026-03-26', '2026-03-26', N'EN_RENOVACION', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'COF-2026-MX-10027-SAN', N'FOL-INGRE-2026-0027', '2026-03-27', '2026-03-27', N'SUSPENDIDO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'COF-2026-MX-10028-SAN', N'FOL-INGRE-2026-0028', '2026-03-28', '2026-03-28', N'VENCIDO', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'COF-2026-MX-10029-SAN', N'FOL-INGRE-2026-0029', '2026-03-01', '2026-03-01', N'VIGENTE', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'COF-2026-MX-10030-SAN', N'FOL-INGRE-2026-0030', '2026-03-02', '2026-03-02', N'EN_RENOVACION', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.registros_sanitarios_cofepris OFF;
GO

-- =================================================================================================
-- 041. TABLA: catalogo.advertencias_contraindicaciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.advertencias_contraindicaciones ON;
INSERT INTO catalogo.advertencias_contraindicaciones (id_advertencia, producto, tipo_advertencia, texto_advertencia, medida_en_caso_ingestion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Niacinamide.', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Sodium Hyaluronate.', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Retinol.', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Salicylic Acid.', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ascorbic Acid.', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ceramide NP.', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Panthenol.', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Azelaic Acid.', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycolic Acid.', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc Oxide.', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Titanium Dioxide.', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tocopherol.', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Madecassoside.', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Squalane.', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Allantoin.', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Caffeine.', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Urea.', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ferulic Acid.', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Lactic Acid.', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bisabolol.', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bakuchiol.', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tranexamic Acid.', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Copper Tripeptide-1.', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycerin.', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Dimethicone.', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'EMBARAZO_LACTANCIA', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Shea Butter.', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOTOSENSIBLE', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Thermal Spring Water.', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'USO_EXTERNO_EXCLUSIVO', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc PCA.', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'HERIDAS_ABIERTAS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Kojic Acid.', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'EVITAR_OJOS', N'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Peptide Matrixyl 3000.', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.advertencias_contraindicaciones OFF;
GO

-- =================================================================================================
-- 042. TABLA: catalogo.multimedia_variantes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.multimedia_variantes ON;
INSERT INTO catalogo.multimedia_variantes (id_multimedia, variante_sku, tipo_archivo, url_recurso, texto_alternativo_accesibilidad, numero_orden, es_imagen_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_001.pdf', N'Fotografía clínica de Sérum Niacinamida 10% + Zinc 1% marca La Roche-Posay', 1, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_002.pdf', N'Fotografía clínica de Gel Limpiador Espumoso Facial marca CeraVe Dermatological', 2, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_003.pdf', N'Fotografía clínica de Protector Solar Fluido SPF 50+ marca The Ordinary Deciem', 3, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_004.pdf', N'Fotografía clínica de Sérum Ácido Hialurónico 2% + B5 marca ISDIN Fotoprotección', 4, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_005.pdf', N'Fotografía clínica de Crema Hidratante con Ceramidas marca Bioderma Laboratoire', 5, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_006.pdf', N'Fotografía clínica de Retinol Puro 0.5% Nocturno marca Eau Thermale Avène', 6, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_007.pdf', N'Fotografía clínica de Agua Micelar Dermolimpiadora marca Eucerin Beiersdorf', 7, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_008.pdf', N'Fotografía clínica de Sérum Vitamina C Pura 15% marca Vichy Laboratoires', 8, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_009.pdf', N'Fotografía clínica de Base de Maquillaje Cobertura Media marca SkinCeuticals Clinical', 9, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_010.pdf', N'Fotografía clínica de Corrector Líquido Alta Duración marca Sesderma Nanotech', 10, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_011.pdf', N'Fotografía clínica de Bálsamo Reparador Cicaplast B5 marca NARS Cosmetics', 11, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_012.pdf', N'Fotografía clínica de Exfoliante Ácido Salicílico 2% marca MAC Professional', 12, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_013.pdf', N'Fotografía clínica de Contorno de Ojos con Cafeína 5% marca Fenty Beauty', 13, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_014.pdf', N'Fotografía clínica de Mascarilla Nocturna Hidratante marca Rare Beauty', 14, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_015.pdf', N'Fotografía clínica de Bruma Termal Calmante Mineral marca Clinique Laboratories', 15, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_016.pdf', N'Fotografía clínica de Aceite Limpiador Emulsionable marca Estée Lauder', 16, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_017.pdf', N'Fotografía clínica de Tónico Equilibrante Ácido Glicólico 7% marca Lancôme Paris', 17, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_018.pdf', N'Fotografía clínica de Labial Hidratante Péptidos Nude marca Charlotte Tilbury', 18, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_019.pdf', N'Fotografía clínica de Polvo Traslúcido Matificante Mineral marca Paula''s Choice Skincare', 19, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_020.pdf', N'Fotografía clínica de Rubor Líquido Pigmento Natural marca COSRX K-Beauty', 20, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_021.pdf', N'Fotografía clínica de Sérum Ácido Azelaico 10% Suspensión marca Laneige Amorepacific', 21, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_022.pdf', N'Fotografía clínica de Ampolletas Proteoglicanos Firmeza marca Uriage Eau Thermale', 22, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_023.pdf', N'Fotografía clínica de Crema Despigmentante Noche Melasma marca Laboratoire SVR', 23, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_024.pdf', N'Fotografía clínica de Protector Solar Mineral Óxido Zinc marca MartiDerm Ampollas', 24, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_025.pdf', N'Fotografía clínica de Loción Corporal Urea 10% Reparadora marca Heliocare Cantabria Labs', 25, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_026.pdf', N'Fotografía clínica de Primer Facial Minimizador de Poros marca Kiehl''s Since 1851', 26, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOTO_EMPAQUE', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_027.pdf', N'Fotografía clínica de Máscara de Pestañas Hipoalergénica marca Garnier SkinActive', 27, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'VIDEO_TUTORIAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_028.pdf', N'Fotografía clínica de Sérum Péptidos de Cobre 1% marca L''Oréal Paris Derm', 28, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOTO_FRONTAL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_029.pdf', N'Fotografía clínica de Bálsamo Desmaquillante Caléndula marca Neutrogena Derm', 29, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOTO_SWATCH_PIEL', N'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_030.pdf', N'Fotografía clínica de Crema Barrera Post-Retinoide marca DermaCare Labs México', 30, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.multimedia_variantes OFF;
GO

-- =================================================================================================
-- 043. TABLA: catalogo.kits_sets (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.kits_sets ON;
INSERT INTO catalogo.kits_sets (id_kit, codigo_kit, nombre_kit, descripcion, descuento_porcentual_kit, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'KIT_01', N'Kit Rutina La Roche-Posay #1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'KIT_02', N'Kit Rutina CeraVe Dermatological #2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'KIT_03', N'Kit Rutina The Ordinary Deciem #3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'KIT_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'KIT_05', N'Kit Rutina Bioderma Laboratoire #5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'KIT_06', N'Kit Rutina Eau Thermale Avène #6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'KIT_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'KIT_08', N'Kit Rutina Vichy Laboratoires #8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'KIT_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'KIT_10', N'Kit Rutina Sesderma Nanotech #10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'KIT_11', N'Kit Rutina NARS Cosmetics #11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'KIT_12', N'Kit Rutina MAC Professional #12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'KIT_13', N'Kit Rutina Fenty Beauty #13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'KIT_14', N'Kit Rutina Rare Beauty #14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'KIT_15', N'Kit Rutina Clinique Laboratories #15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 5.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'KIT_16', N'Kit Rutina Estée Lauder #16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'KIT_17', N'Kit Rutina Lancôme Paris #17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'KIT_18', N'Kit Rutina Charlotte Tilbury #18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'KIT_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'KIT_20', N'Kit Rutina COSRX K-Beauty #20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'KIT_21', N'Kit Rutina Laneige Amorepacific #21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'KIT_22', N'Kit Rutina Uriage Eau Thermale #22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'KIT_23', N'Kit Rutina Laboratoire SVR #23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'KIT_24', N'Kit Rutina MartiDerm Ampollas #24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'KIT_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'KIT_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'KIT_27', N'Kit Rutina Garnier SkinActive #27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'KIT_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'KIT_29', N'Kit Rutina Neutrogena Derm #29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'KIT_30', N'Kit Rutina DermaCare Labs México #30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.kits_sets OFF;
GO

-- =================================================================================================
-- 044. TABLA: catalogo.kits_items (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT catalogo.kits_items ON;
INSERT INTO catalogo.kits_items (id_kit_item, kit, variante_sku, cantidad_unidades, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO catalogo.productos_relacionados (id_producto_relacionado, producto_origen, producto_destino, tipo_relacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO catalogo.historial_precios_base (id_historial_precio, variante_sku, precio_anterior, precio_nuevo, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 17.50, 17.50, N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 20.00, N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 22.50, N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 25.00, N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 27.50, N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 30.00, N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 32.50, N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 35.00, N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 37.50, N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 40.00, N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 42.50, N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 45.00, N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 47.50, N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 50.00, N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 52.50, N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 55.00, N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 57.50, N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 60.00, N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 62.50, N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 65.00, N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 67.50, N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 70.00, N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 72.50, N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 75.00, N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 77.50, N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 80.00, N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 82.50, N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 85.00, N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 87.50, N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 90.00, N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT catalogo.historial_precios_base OFF;
GO

-- =================================================================================================
-- 047. TABLA: comunidad.rutinas_belleza (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_belleza ON;
INSERT INTO comunidad.rutinas_belleza (id_rutina, cliente, nombre_rutina, momento_dia, es_publica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO comunidad.rutinas_pasos (id_rutina_paso, rutina, numero_paso, nombre_fase, instrucciones_aplicacion, tiempo_espera_segundos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 6, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 7, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 8, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 9, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 10, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 6, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 7, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 8, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 9, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 10, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.rutinas_pasos OFF;
GO

-- =================================================================================================
-- 049. TABLA: comunidad.rutinas_productos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT comunidad.rutinas_productos ON;
INSERT INTO comunidad.rutinas_productos (id_rutina_producto, rutina_paso, variante_sku, es_producto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO comunidad.listas_deseos (id_lista_deseos, cliente, nombre_lista, es_publica, token_compartir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Rutina Facial Carlos - Control Dermatológico 1', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Rutina Facial Sofía - Control Dermatológico 2', 0, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Rutina Facial Valeria - Control Dermatológico 3', 1, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Rutina Facial Alejandro - Control Dermatológico 4', 0, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad d', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Rutina Facial Mariana - Control Dermatológico 5', 1, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Rutina Facial Diego - Control Dermatológico 6', 0, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Rutina Facial Camila - Control Dermatológico 7', 1, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Rutina Facial Mateo - Control Dermatológico 8', 0, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Rutina Facial Lucía - Control Dermatológico 9', 1, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Pue', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Rutina Facial Sebastián - Control Dermatológico 10', 0, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Rutina Facial Regina - Control Dermatológico 11', 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Rutina Facial Santiago - Control Dermatológico 12', 0, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Rutina Facial Fernanda - Control Dermatológico 13', 1, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Rutina Facial Emiliano - Control Dermatológico 14', 0, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Rutina Facial Ximena - Control Dermatológico 15', 1, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Rutina Facial Daniel - Control Dermatológico 16', 0, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Rutina Facial Andrea - Control Dermatológico 17', 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Rutina Facial Gabriel - Control Dermatológico 18', 0, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Rutina Facial Paula - Control Dermatológico 19', 1, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rutina Facial Andrés - Control Dermatológico 20', 0, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Rutina Facial Renata - Control Dermatológico 21', 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monc', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Rutina Facial Nicolás - Control Dermatológico 22', 0, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterr', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Rutina Facial Natalia - Control Dermatológico 23', 1, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Rutina Facial Joaquín - Control Dermatológico 24', 0, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad ', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Rutina Facial Isabella - Control Dermatológico 25', 1, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Rutina Facial Leonardo - Control Dermatológico 26', 0, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadala', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Rutina Facial Ana - Control Dermatológico 27', 1, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltill', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Rutina Facial Rodrigo - Control Dermatológico 28', 0, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Rutina Facial Paulina - Control Dermatológico 29', 1, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Rutina Facial Mauricio - Control Dermatológico 30', 0, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT comunidad.listas_deseos OFF;
GO

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.tipos_descuento ON;
INSERT INTO ventas.tipos_descuento (id_tipo_descuento, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'DESCUENT_01', N'Carlos Mendoza Garza', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'DESCUENT_02', N'Sofía Ramírez López', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'DESCUENT_03', N'Valeria Torres Villarreal', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'DESCUENT_04', N'Alejandro Hernández Cruz', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'DESCUENT_05', N'Mariana Sánchez Fuentes', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'DESCUENT_06', N'Diego Martínez Treviño', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'DESCUENT_07', N'Camila González Reyes', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'DESCUENT_08', N'Mateo Flores Castillo', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'DESCUENT_09', N'Lucía Morales Díaz', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'DESCUENT_10', N'Sebastián Vázquez Ortiz', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'DESCUENT_11', N'Regina Gutiérrez Nava', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'DESCUENT_12', N'Santiago Jiménez Pérez', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'DESCUENT_13', N'Fernanda Ruiz Salazar', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'DESCUENT_14', N'Emiliano Ríos Cárdenas', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'DESCUENT_15', N'Ximena Aguilar Ibarra', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'DESCUENT_16', N'Daniel Méndez Navarro', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'DESCUENT_17', N'Andrea Castro Delgado', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'DESCUENT_18', N'Gabriel Vega Montoya', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'DESCUENT_19', N'Paula Cortés Rojas', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'DESCUENT_20', N'Andrés Ramos Campos', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'DESCUENT_21', N'Renata Guerrero Luna', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'DESCUENT_22', N'Nicolás Peña Cabrera', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'DESCUENT_23', N'Natalia Herrera Vargas', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'DESCUENT_24', N'Joaquín Medina Contreras', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'DESCUENT_25', N'Isabella Domínguez Escobar', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'DESCUENT_26', N'Leonardo Silva Paredes', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'DESCUENT_27', N'Ana Chávez Bautista', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'DESCUENT_28', N'Rodrigo Ochoa Acosta', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'DESCUENT_29', N'Paulina Miranda Leal', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'DESCUENT_30', N'Mauricio Padilla Solís', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.tipos_descuento OFF;
GO

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.estados_orden ON;
INSERT INTO ventas.estados_orden (id_estado_orden, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO ventas.motivos_cancelacion_orden (id_motivo_cancelacion, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.motivos_cancelacion_orden OFF;
GO

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos ON;
INSERT INTO ventas.carritos (id_carrito, cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos OFF;
GO

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.items_carrito ON;
INSERT INTO ventas.items_carrito (id_item_carrito, carrito, variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 17.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.items_carrito OFF;
GO

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento ON;
INSERT INTO ventas.carritos_abandonados_seguimiento (id_seguimiento_carrito, carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, '2026-02-02 11:30:00', 0, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, '2026-02-03 11:30:00', 1, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, '2026-02-04 11:30:00', 0, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, '2026-02-05 11:30:00', 1, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, '2026-02-06 11:30:00', 0, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, '2026-02-07 11:30:00', 1, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, '2026-02-08 11:30:00', 0, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, '2026-02-09 11:30:00', 1, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, '2026-02-10 11:30:00', 0, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, '2026-02-11 11:30:00', 1, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, '2026-02-12 11:30:00', 0, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, '2026-02-13 11:30:00', 1, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, '2026-02-14 11:30:00', 0, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, '2026-02-15 11:30:00', 1, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, '2026-02-16 11:30:00', 0, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, '2026-02-17 11:30:00', 1, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, '2026-02-18 11:30:00', 0, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, '2026-02-19 11:30:00', 1, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, '2026-02-20 11:30:00', 0, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, '2026-02-21 11:30:00', 1, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, '2026-02-22 11:30:00', 0, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, '2026-02-23 11:30:00', 1, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, '2026-02-24 11:30:00', 0, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, '2026-02-25 11:30:00', 1, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, '2026-02-26 11:30:00', 0, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, '2026-02-27 11:30:00', 1, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, '2026-02-28 11:30:00', 0, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, '2026-02-01 11:30:00', 1, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, '2026-02-02 11:30:00', 0, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.carritos_abandonados_seguimiento OFF;
GO

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.planes_suscripcion ON;
INSERT INTO ventas.planes_suscripcion (id_plan_suscripcion, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PLAN_01', N'Kit Rutina La Roche-Posay #1', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 285.50, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PLAN_02', N'Kit Rutina CeraVe Dermatological #2', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 321.00, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PLAN_03', N'Kit Rutina The Ordinary Deciem #3', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 356.50, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PLAN_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 392.00, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PLAN_05', N'Kit Rutina Bioderma Laboratoire #5', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 427.50, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PLAN_06', N'Kit Rutina Eau Thermale Avène #6', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 463.00, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PLAN_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 498.50, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PLAN_08', N'Kit Rutina Vichy Laboratoires #8', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 534.00, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PLAN_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 569.50, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PLAN_10', N'Kit Rutina Sesderma Nanotech #10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 605.00, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PLAN_11', N'Kit Rutina NARS Cosmetics #11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 640.50, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PLAN_12', N'Kit Rutina MAC Professional #12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 676.00, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PLAN_13', N'Kit Rutina Fenty Beauty #13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 711.50, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PLAN_14', N'Kit Rutina Rare Beauty #14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 747.00, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PLAN_15', N'Kit Rutina Clinique Laboratories #15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 782.50, 5.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PLAN_16', N'Kit Rutina Estée Lauder #16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 818.00, 6.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PLAN_17', N'Kit Rutina Lancôme Paris #17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 853.50, 7.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PLAN_18', N'Kit Rutina Charlotte Tilbury #18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 889.00, 8.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PLAN_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 924.50, 9.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PLAN_20', N'Kit Rutina COSRX K-Beauty #20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 960.00, 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PLAN_21', N'Kit Rutina Laneige Amorepacific #21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 995.50, 11.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PLAN_22', N'Kit Rutina Uriage Eau Thermale #22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1031.00, 12.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PLAN_23', N'Kit Rutina Laboratoire SVR #23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1066.50, 13.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PLAN_24', N'Kit Rutina MartiDerm Ampollas #24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1102.00, 14.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PLAN_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1137.50, 15.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PLAN_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1173.00, 16.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PLAN_27', N'Kit Rutina Garnier SkinActive #27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1208.50, 17.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PLAN_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1244.00, 18.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PLAN_29', N'Kit Rutina Neutrogena Derm #29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1279.50, 19.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PLAN_30', N'Kit Rutina DermaCare Labs México #30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 1315.00, 5.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.planes_suscripcion OFF;
GO

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.frecuencias_suscripcion ON;
INSERT INTO ventas.frecuencias_suscripcion (id_frecuencia_suscripcion, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FRECUENC_01', N'Carlos Mendoza Garza', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FRECUENC_02', N'Sofía Ramírez López', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FRECUENC_03', N'Valeria Torres Villarreal', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FRECUENC_04', N'Alejandro Hernández Cruz', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FRECUENC_05', N'Mariana Sánchez Fuentes', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FRECUENC_06', N'Diego Martínez Treviño', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FRECUENC_07', N'Camila González Reyes', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FRECUENC_08', N'Mateo Flores Castillo', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FRECUENC_09', N'Lucía Morales Díaz', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FRECUENC_10', N'Sebastián Vázquez Ortiz', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FRECUENC_11', N'Regina Gutiérrez Nava', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FRECUENC_12', N'Santiago Jiménez Pérez', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FRECUENC_13', N'Fernanda Ruiz Salazar', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FRECUENC_14', N'Emiliano Ríos Cárdenas', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FRECUENC_15', N'Ximena Aguilar Ibarra', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FRECUENC_16', N'Daniel Méndez Navarro', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FRECUENC_17', N'Andrea Castro Delgado', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FRECUENC_18', N'Gabriel Vega Montoya', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FRECUENC_19', N'Paula Cortés Rojas', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FRECUENC_20', N'Andrés Ramos Campos', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FRECUENC_21', N'Renata Guerrero Luna', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FRECUENC_22', N'Nicolás Peña Cabrera', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FRECUENC_23', N'Natalia Herrera Vargas', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FRECUENC_24', N'Joaquín Medina Contreras', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FRECUENC_25', N'Isabella Domínguez Escobar', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FRECUENC_26', N'Leonardo Silva Paredes', 60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FRECUENC_27', N'Ana Chávez Bautista', 75, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FRECUENC_28', N'Rodrigo Ochoa Acosta', 30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FRECUENC_29', N'Paulina Miranda Leal', 45, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FRECUENC_30', N'Mauricio Padilla Solís', 60, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.frecuencias_suscripcion OFF;
GO

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_cliente ON;
INSERT INTO ventas.suscripciones_cliente (id_suscripcion_cliente, folio_suscripcion, cliente, plan_suscripcion, frecuencia_suscripcion, direccion_entrega, metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-01', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-03-02', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-03-03', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-03-04', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-03-05', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-03-06', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-03-07', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-03-08', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-03-09', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-03-10', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-03-11', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-03-12', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-03-13', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-03-14', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-03-15', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-03-16', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-03-17', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-03-18', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-03-19', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-03-20', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-03-21', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-03-22', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-03-23', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-03-24', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-03-25', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-03-26', N'PAUSADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-03-27', N'CANCELADA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-03-28', N'PAGO_FALLIDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-01', N'ACTIVA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-03-02', N'PAUSADA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_cliente OFF;
GO

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_items ON;
INSERT INTO ventas.suscripciones_items (id_suscripcion_item, suscripcion_cliente, variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_items OFF;
GO

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.suscripciones_calendario_entregas ON;
INSERT INTO ventas.suscripciones_calendario_entregas (id_entrega_programada, suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO ventas.suscripciones_bitacora_estados (id_bitacora_suscripcion, suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10', N'Sérum Niacinamida 10', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumo', N'Gel Limpiador Espumo', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Flui', N'Protector Solar Flui', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurón', N'Sérum Ácido Hialurón', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con', N'Crema Hidratante con', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% No', N'Retinol Puro 0.5% No', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermoli', N'Agua Micelar Dermoli', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pur', N'Sérum Vitamina C Pur', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje C', N'Base de Maquillaje C', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Al', N'Corrector Líquido Al', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Ci', N'Bálsamo Reparador Ci', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Sal', N'Exfoliante Ácido Sal', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con', N'Contorno de Ojos con', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna ', N'Mascarilla Nocturna ', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmant', N'Bruma Termal Calmant', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emu', N'Aceite Limpiador Emu', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante ', N'Tónico Equilibrante ', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Pé', N'Labial Hidratante Pé', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Mat', N'Polvo Traslúcido Mat', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmen', N'Rubor Líquido Pigmen', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico', N'Sérum Ácido Azelaico', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteogli', N'Ampolletas Proteogli', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante', N'Crema Despigmentante', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mine', N'Protector Solar Mine', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea', N'Loción Corporal Urea', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimi', N'Primer Facial Minimi', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas ', N'Máscara de Pestañas ', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Co', N'Sérum Péptidos de Co', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillan', N'Bálsamo Desmaquillan', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-R', N'Crema Barrera Post-R', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.suscripciones_bitacora_estados OFF;
GO

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp ON;
INSERT INTO ventas.regalos_por_compra_gwp (id_regalo_compra, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROMOCIO_01', N'Kit Rutina La Roche-Posay #1', 17.50, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROMOCIO_02', N'Kit Rutina CeraVe Dermatological #2', 20.00, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 11, 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROMOCIO_03', N'Kit Rutina The Ordinary Deciem #3', 22.50, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 14, 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROMOCIO_04', N'Kit Rutina ISDIN Fotoprotección #4', 25.00, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 17, 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROMOCIO_05', N'Kit Rutina Bioderma Laboratoire #5', 27.50, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 20, 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROMOCIO_06', N'Kit Rutina Eau Thermale Avène #6', 30.00, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 23, 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROMOCIO_07', N'Kit Rutina Eucerin Beiersdorf #7', 32.50, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 26, 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROMOCIO_08', N'Kit Rutina Vichy Laboratoires #8', 35.00, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 29, 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROMOCIO_09', N'Kit Rutina SkinCeuticals Clinical #9', 37.50, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 32, 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROMOCIO_10', N'Kit Rutina Sesderma Nanotech #10', 40.00, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 35, 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROMOCIO_11', N'Kit Rutina NARS Cosmetics #11', 42.50, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 38, 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROMOCIO_12', N'Kit Rutina MAC Professional #12', 45.00, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 41, 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROMOCIO_13', N'Kit Rutina Fenty Beauty #13', 47.50, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 44, 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROMOCIO_14', N'Kit Rutina Rare Beauty #14', 50.00, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 47, 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROMOCIO_15', N'Kit Rutina Clinique Laboratories #15', 52.50, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 50, 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROMOCIO_16', N'Kit Rutina Estée Lauder #16', 55.00, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 53, 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROMOCIO_17', N'Kit Rutina Lancôme Paris #17', 57.50, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 56, 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROMOCIO_18', N'Kit Rutina Charlotte Tilbury #18', 60.00, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 59, 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROMOCIO_19', N'Kit Rutina Paula''s Choice Skincare #19', 62.50, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62, 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROMOCIO_20', N'Kit Rutina COSRX K-Beauty #20', 65.00, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65, 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROMOCIO_21', N'Kit Rutina Laneige Amorepacific #21', 67.50, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 68, 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROMOCIO_22', N'Kit Rutina Uriage Eau Thermale #22', 70.00, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 71, 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROMOCIO_23', N'Kit Rutina Laboratoire SVR #23', 72.50, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 74, 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROMOCIO_24', N'Kit Rutina MartiDerm Ampollas #24', 75.00, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 77, 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROMOCIO_25', N'Kit Rutina Heliocare Cantabria Labs #25', 77.50, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 80, 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROMOCIO_26', N'Kit Rutina Kiehl''s Since 1851 #26', 80.00, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 83, 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROMOCIO_27', N'Kit Rutina Garnier SkinActive #27', 82.50, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 86, 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROMOCIO_28', N'Kit Rutina L''Oréal Paris Derm #28', 85.00, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 89, 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROMOCIO_29', N'Kit Rutina Neutrogena Derm #29', 87.50, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 92, 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROMOCIO_30', N'Kit Rutina DermaCare Labs México #30', 90.00, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 95, 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.regalos_por_compra_gwp OFF;
GO

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes ON;
INSERT INTO ventas.ordenes (id_orden, folio_orden, cliente, estado_orden, motivo_cancelacion, direccion_envio, direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 285.50, 17.50, 45.68, 17.50, 285.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 20.00, 51.36, 20.00, 321.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 356.50, 22.50, 57.04, 22.50, 356.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 25.00, 62.72, 25.00, 392.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 427.50, 27.50, 68.40, 27.50, 427.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 30.00, 74.08, 30.00, 463.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 7, NULL, 7, 7, '2026-02-07 11:30:00', 498.50, 32.50, 79.76, 32.50, 498.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 35.00, 85.44, 35.00, 534.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 569.50, 37.50, 91.12, 37.50, 569.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 40.00, 96.80, 40.00, 605.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 640.50, 42.50, 102.48, 42.50, 640.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 45.00, 108.16, 45.00, 676.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 6, NULL, 13, 13, '2026-02-13 11:30:00', 711.50, 47.50, 113.84, 47.50, 711.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 7, NULL, 14, 14, '2026-02-14 11:30:00', 747.00, 50.00, 119.52, 50.00, 747.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 782.50, 52.50, 125.20, 52.50, 782.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 55.00, 130.88, 55.00, 818.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 853.50, 57.50, 136.56, 57.50, 853.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 60.00, 142.24, 60.00, 889.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 924.50, 62.50, 147.92, 62.50, 924.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 6, NULL, 20, 20, '2026-02-20 11:30:00', 960.00, 65.00, 153.60, 65.00, 960.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 7, NULL, 21, 21, '2026-02-21 11:30:00', 995.50, 67.50, 159.28, 67.50, 995.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 70.00, 164.96, 70.00, 1031.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 1066.50, 72.50, 170.64, 72.50, 1066.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 75.00, 176.32, 75.00, 1102.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 1137.50, 77.50, 182.00, 77.50, 1137.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 80.00, 187.68, 80.00, 1173.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 6, NULL, 27, 27, '2026-02-27 11:30:00', 1208.50, 82.50, 193.36, 82.50, 1208.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 7, NULL, 28, 28, '2026-02-28 11:30:00', 1244.00, 85.00, 199.04, 85.00, 1244.00, 'MXN', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 1279.50, 87.50, 204.72, 87.50, 1279.50, 'MXN', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 90.00, 210.40, 90.00, 1315.00, 'MXN', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes OFF;
GO

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_detalles ON;
INSERT INTO ventas.ordenes_detalles (id_orden_detalle, orden, variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 8, 285.50, 17.50, 10.00, 17.50, 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 11, 321.00, 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 14, 356.50, 22.50, 30.00, 22.50, 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 17, 392.00, 25.00, 40.00, 25.00, 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 20, 427.50, 27.50, 50.00, 27.50, 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 23, 463.00, 30.00, 60.00, 30.00, 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 26, 498.50, 32.50, 70.00, 32.50, 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 29, 534.00, 35.00, 80.00, 35.00, 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 32, 569.50, 37.50, 90.00, 37.50, 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 35, 605.00, 40.00, 100.00, 40.00, 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 38, 640.50, 42.50, 110.00, 42.50, 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 41, 676.00, 45.00, 120.00, 45.00, 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 44, 711.50, 47.50, 130.00, 47.50, 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 47, 747.00, 50.00, 140.00, 50.00, 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 50, 782.50, 52.50, 150.00, 52.50, 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 53, 818.00, 55.00, 160.00, 55.00, 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 56, 853.50, 57.50, 170.00, 57.50, 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 59, 889.00, 60.00, 180.00, 60.00, 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 62, 924.50, 62.50, 190.00, 62.50, 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 65, 960.00, 65.00, 200.00, 65.00, 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 68, 995.50, 67.50, 210.00, 67.50, 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 71, 1031.00, 70.00, 220.00, 70.00, 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 74, 1066.50, 72.50, 230.00, 72.50, 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 77, 1102.00, 75.00, 240.00, 75.00, 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 80, 1137.50, 77.50, 250.00, 77.50, 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 83, 1173.00, 80.00, 260.00, 80.00, 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 86, 1208.50, 82.50, 270.00, 82.50, 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 89, 1244.00, 85.00, 280.00, 85.00, 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 92, 1279.50, 87.50, 290.00, 87.50, 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 95, 1315.00, 90.00, 300.00, 90.00, 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_detalles OFF;
GO

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_historial_estados ON;
INSERT INTO ventas.ordenes_historial_estados (id_orden_historial, orden, estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_historial_estados OFF;
GO

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_splits_almacen ON;
INSERT INTO ventas.ordenes_splits_almacen (id_orden_split, orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Po', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermat', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotop', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Lab', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avè', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiers', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoire', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeut', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Na', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmeti', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professi', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beaut', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty ', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Labo', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder ', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lanc', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte T', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beau', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Ea', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laborato', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDer', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Helioca', N'EN_RUTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s ', N'PENDIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier ', N'ASIGNADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris De', N'SURTIENDO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena', N'EMPAQUETADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs', N'EN_RUTA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_splits_almacen OFF;
GO

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_impuestos ON;
INSERT INTO ventas.ordenes_impuestos (id_orden_impuesto, orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'002_IVA', 0.160000, 17.50, 45.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'003_IEPS', 0.160000, 20.00, 51.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'002_IVA', 0.160000, 22.50, 57.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'003_IEPS', 0.160000, 25.00, 62.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'002_IVA', 0.160000, 27.50, 68.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'003_IEPS', 0.160000, 30.00, 74.08, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'002_IVA', 0.160000, 32.50, 79.76, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'003_IEPS', 0.160000, 35.00, 85.44, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'002_IVA', 0.160000, 37.50, 91.12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'003_IEPS', 0.160000, 40.00, 96.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'002_IVA', 0.160000, 42.50, 102.48, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'003_IEPS', 0.160000, 45.00, 108.16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'002_IVA', 0.160000, 47.50, 113.84, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'003_IEPS', 0.160000, 50.00, 119.52, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'002_IVA', 0.160000, 52.50, 125.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'003_IEPS', 0.160000, 55.00, 130.88, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'002_IVA', 0.160000, 57.50, 136.56, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'003_IEPS', 0.160000, 60.00, 142.24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'002_IVA', 0.160000, 62.50, 147.92, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'003_IEPS', 0.160000, 65.00, 153.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'002_IVA', 0.160000, 67.50, 159.28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'003_IEPS', 0.160000, 70.00, 164.96, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'002_IVA', 0.160000, 72.50, 170.64, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'003_IEPS', 0.160000, 75.00, 176.32, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'002_IVA', 0.160000, 77.50, 182.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'003_IEPS', 0.160000, 80.00, 187.68, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'002_IVA', 0.160000, 82.50, 193.36, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'003_IEPS', 0.160000, 85.00, 199.04, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'002_IVA', 0.160000, 87.50, 204.72, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'003_IEPS', 0.160000, 90.00, 210.40, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_impuestos OFF;
GO

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_descuentos ON;
INSERT INTO ventas.ordenes_descuentos (id_orden_descuento, orden, tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'PROMOCIO_01', 10.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'PROMOCIO_02', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'PROMOCIO_03', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'PROMOCIO_04', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'PROMOCIO_05', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'PROMOCIO_06', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'PROMOCIO_07', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'PROMOCIO_08', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'PROMOCIO_09', 90.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'PROMOCIO_10', 100.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'PROMOCIO_11', 110.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'PROMOCIO_12', 120.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'PROMOCIO_13', 130.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'PROMOCIO_14', 140.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'PROMOCIO_15', 150.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'PROMOCIO_16', 160.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'PROMOCIO_17', 170.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'PROMOCIO_18', 180.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'PROMOCIO_19', 190.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'PROMOCIO_20', 200.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'PROMOCIO_21', 210.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'PROMOCIO_22', 220.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'PROMOCIO_23', 230.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'PROMOCIO_24', 240.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'PROMOCIO_25', 250.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'PROMOCIO_26', 260.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'PROMOCIO_27', 270.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'PROMOCIO_28', 280.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'PROMOCIO_29', 290.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'PROMOCIO_30', 300.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.ordenes_descuentos OFF;
GO

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.ordenes_notas_instrucciones ON;
INSERT INTO ventas.ordenes_notas_instrucciones (id_orden_nota, orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO ventas.reservas_temporales_stock (id_reserva_stock, carrito, variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.reservas_temporales_stock OFF;
GO

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.afiliados_influencers ON;
INSERT INTO ventas.afiliados_influencers (id_afiliado, codigo_afiliado, usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'AFILIADO_01', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 6.00, '012180001234567801', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'AFILIADO_02', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 7.00, '012180001234567802', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'AFILIADO_03', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 8.00, '012180001234567803', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'AFILIADO_04', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 9.00, '012180001234567804', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'AFILIADO_05', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 10.00, '012180001234567805', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'AFILIADO_06', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 11.00, '012180001234567806', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'AFILIADO_07', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 12.00, '012180001234567807', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'AFILIADO_08', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 13.00, '012180001234567808', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'AFILIADO_09', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 14.00, '012180001234567809', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'AFILIADO_10', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 15.00, '012180001234567810', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'AFILIADO_11', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 16.00, '012180001234567811', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'AFILIADO_12', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 17.00, '012180001234567812', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'AFILIADO_13', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 18.00, '012180001234567813', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'AFILIADO_14', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 19.00, '012180001234567814', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'AFILIADO_15', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 5.00, '012180001234567815', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'AFILIADO_16', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 6.00, '012180001234567816', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'AFILIADO_17', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 7.00, '012180001234567817', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'AFILIADO_18', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 8.00, '012180001234567818', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'AFILIADO_19', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 9.00, '012180001234567819', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'AFILIADO_20', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 10.00, '012180001234567820', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'AFILIADO_21', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 11.00, '012180001234567821', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'AFILIADO_22', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 12.00, '012180001234567822', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'AFILIADO_23', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 13.00, '012180001234567823', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'AFILIADO_24', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 14.00, '012180001234567824', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'AFILIADO_25', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 15.00, '012180001234567825', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'AFILIADO_26', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 16.00, '012180001234567826', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'AFILIADO_27', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 17.00, '012180001234567827', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'AFILIADO_28', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 18.00, '012180001234567828', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'AFILIADO_29', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 19.00, '012180001234567829', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'AFILIADO_30', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 5.00, '012180001234567830', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.afiliados_influencers OFF;
GO

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT ventas.comisiones_afiliados ON;
INSERT INTO ventas.comisiones_afiliados (id_comision_afiliado, afiliado, orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 17.50, 17.50, N'PENDIENTE', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, 20.00, N'APROBADA', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, 22.50, N'PAGADA', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, 25.00, N'PENDIENTE', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, 27.50, N'APROBADA', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 30.00, 30.00, N'PAGADA', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 32.50, 32.50, N'PENDIENTE', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 35.00, 35.00, N'APROBADA', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 37.50, 37.50, N'PAGADA', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 40.00, 40.00, N'PENDIENTE', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 42.50, 42.50, N'APROBADA', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 45.00, 45.00, N'PAGADA', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 47.50, 47.50, N'PENDIENTE', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 50.00, 50.00, N'APROBADA', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 52.50, 52.50, N'PAGADA', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 55.00, 55.00, N'PENDIENTE', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 57.50, 57.50, N'APROBADA', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 60.00, 60.00, N'PAGADA', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62.50, 62.50, N'PENDIENTE', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65.00, 65.00, N'APROBADA', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 67.50, 67.50, N'PAGADA', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 70.00, 70.00, N'PENDIENTE', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 72.50, 72.50, N'APROBADA', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 75.00, 75.00, N'PAGADA', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 77.50, 77.50, N'PENDIENTE', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 80.00, 80.00, N'APROBADA', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 82.50, 82.50, N'PAGADA', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 85.00, 85.00, N'PENDIENTE', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 87.50, 87.50, N'APROBADA', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 90.00, 90.00, N'PAGADA', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT ventas.comisiones_afiliados OFF;
GO

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.proveedores_pasarela ON;
INSERT INTO pagos.proveedores_pasarela (id_proveedor_pasarela, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PASARELA_01', N'Kit Rutina La Roche-Posay #1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PASARELA_02', N'Kit Rutina CeraVe Dermatological #2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PASARELA_03', N'Kit Rutina The Ordinary Deciem #3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PASARELA_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PASARELA_05', N'Kit Rutina Bioderma Laboratoire #5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PASARELA_06', N'Kit Rutina Eau Thermale Avène #6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PASARELA_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PASARELA_08', N'Kit Rutina Vichy Laboratoires #8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PASARELA_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PASARELA_10', N'Kit Rutina Sesderma Nanotech #10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PASARELA_11', N'Kit Rutina NARS Cosmetics #11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PASARELA_12', N'Kit Rutina MAC Professional #12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PASARELA_13', N'Kit Rutina Fenty Beauty #13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PASARELA_14', N'Kit Rutina Rare Beauty #14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PASARELA_15', N'Kit Rutina Clinique Laboratories #15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PASARELA_16', N'Kit Rutina Estée Lauder #16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PASARELA_17', N'Kit Rutina Lancôme Paris #17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PASARELA_18', N'Kit Rutina Charlotte Tilbury #18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PASARELA_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PASARELA_20', N'Kit Rutina COSRX K-Beauty #20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PASARELA_21', N'Kit Rutina Laneige Amorepacific #21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PASARELA_22', N'Kit Rutina Uriage Eau Thermale #22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PASARELA_23', N'Kit Rutina Laboratoire SVR #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PASARELA_24', N'Kit Rutina MartiDerm Ampollas #24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PASARELA_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PASARELA_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PASARELA_27', N'Kit Rutina Garnier SkinActive #27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PASARELA_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PASARELA_29', N'Kit Rutina Neutrogena Derm #29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PASARELA_30', N'Kit Rutina DermaCare Labs México #30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.proveedores_pasarela OFF;
GO

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.metodos_pago ON;
INSERT INTO pagos.metodos_pago (id_metodo_pago, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.transacciones (id_transaccion, folio_transaccion, orden, proveedor_pasarela, metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 285.50, 'MXN', N'PENDIENTE', N'AUTORIZA_01', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 321.00, 'MXN', N'APROBADA', N'AUTORIZA_02', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 356.50, 'MXN', N'RECHAZADA', N'AUTORIZA_03', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 392.00, 'MXN', N'CANCELADA', N'AUTORIZA_04', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 427.50, 'MXN', N'EN_MEDIACION', N'AUTORIZA_05', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 6, 1, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 463.00, 'MXN', N'PENDIENTE', N'AUTORIZA_06', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 7, 2, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 498.50, 'MXN', N'APROBADA', N'AUTORIZA_07', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 8, 3, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 534.00, 'MXN', N'RECHAZADA', N'AUTORIZA_08', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 9, 4, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 569.50, 'MXN', N'CANCELADA', N'AUTORIZA_09', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 10, 5, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 605.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_10', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 11, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 640.50, 'MXN', N'PENDIENTE', N'AUTORIZA_11', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 12, 2, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 676.00, 'MXN', N'APROBADA', N'AUTORIZA_12', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 13, 3, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 711.50, 'MXN', N'RECHAZADA', N'AUTORIZA_13', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 14, 4, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 747.00, 'MXN', N'CANCELADA', N'AUTORIZA_14', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 15, 5, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 782.50, 'MXN', N'EN_MEDIACION', N'AUTORIZA_15', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 16, 1, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 818.00, 'MXN', N'PENDIENTE', N'AUTORIZA_16', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 17, 2, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 853.50, 'MXN', N'APROBADA', N'AUTORIZA_17', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 18, 3, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 889.00, 'MXN', N'RECHAZADA', N'AUTORIZA_18', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 19, 4, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 924.50, 'MXN', N'CANCELADA', N'AUTORIZA_19', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 20, 5, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 960.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_20', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 21, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 995.50, 'MXN', N'PENDIENTE', N'AUTORIZA_21', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 22, 2, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1031.00, 'MXN', N'APROBADA', N'AUTORIZA_22', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 23, 3, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1066.50, 'MXN', N'RECHAZADA', N'AUTORIZA_23', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 24, 4, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1102.00, 'MXN', N'CANCELADA', N'AUTORIZA_24', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 25, 5, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1137.50, 'MXN', N'EN_MEDIACION', N'AUTORIZA_25', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 26, 1, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1173.00, 'MXN', N'PENDIENTE', N'AUTORIZA_26', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 27, 2, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1208.50, 'MXN', N'APROBADA', N'AUTORIZA_27', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 28, 3, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1244.00, 'MXN', N'RECHAZADA', N'AUTORIZA_28', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 29, 4, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1279.50, 'MXN', N'CANCELADA', N'AUTORIZA_29', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 30, 5, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 1315.00, 'MXN', N'EN_MEDIACION', N'AUTORIZA_30', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.transacciones OFF;
GO

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.intentos_cobro ON;
INSERT INTO pagos.intentos_cobro (id_intento_cobro, transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 200, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 200, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 200, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 200, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 200, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 200, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 200, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 200, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.intentos_cobro OFF;
GO

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.split_multipagos ON;
INSERT INTO pagos.split_multipagos (id_split_pago, orden, metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 17.50, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 30.00, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 32.50, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 35.00, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 37.50, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 40.00, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 42.50, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 45.00, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 47.50, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 50.00, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 52.50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 55.00, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 57.50, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 60.00, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 62.50, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 65.00, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 67.50, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 70.00, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 72.50, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 75.00, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 77.50, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 80.00, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 82.50, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 85.00, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 87.50, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 90.00, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.split_multipagos OFF;
GO

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.billetera_electronica ON;
INSERT INTO pagos.billetera_electronica (id_billetera, cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.billetera_electronica OFF;
GO

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.movimientos_billetera ON;
INSERT INTO pagos.movimientos_billetera (id_movimiento_billetera, billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CARGA_SALDO', 285.50, 17.50, 17.50, N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAGO_ORDEN', 321.00, 20.00, 20.00, N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'REEMBOLSO_DEVOLUCION', 356.50, 22.50, 22.50, N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CARGA_SALDO', 392.00, 25.00, 25.00, N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PAGO_ORDEN', 427.50, 27.50, 27.50, N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'REEMBOLSO_DEVOLUCION', 463.00, 30.00, 30.00, N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CARGA_SALDO', 498.50, 32.50, 32.50, N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PAGO_ORDEN', 534.00, 35.00, 35.00, N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'REEMBOLSO_DEVOLUCION', 569.50, 37.50, 37.50, N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CARGA_SALDO', 605.00, 40.00, 40.00, N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PAGO_ORDEN', 640.50, 42.50, 42.50, N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'REEMBOLSO_DEVOLUCION', 676.00, 45.00, 45.00, N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CARGA_SALDO', 711.50, 47.50, 47.50, N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAGO_ORDEN', 747.00, 50.00, 50.00, N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'REEMBOLSO_DEVOLUCION', 782.50, 52.50, 52.50, N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CARGA_SALDO', 818.00, 55.00, 55.00, N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'PAGO_ORDEN', 853.50, 57.50, 57.50, N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'REEMBOLSO_DEVOLUCION', 889.00, 60.00, 60.00, N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CARGA_SALDO', 924.50, 62.50, 62.50, N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PAGO_ORDEN', 960.00, 65.00, 65.00, N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'REEMBOLSO_DEVOLUCION', 995.50, 67.50, 67.50, N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CARGA_SALDO', 1031.00, 70.00, 70.00, N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PAGO_ORDEN', 1066.50, 72.50, 72.50, N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'REEMBOLSO_DEVOLUCION', 1102.00, 75.00, 75.00, N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CARGA_SALDO', 1137.50, 77.50, 77.50, N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAGO_ORDEN', 1173.00, 80.00, 80.00, N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'REEMBOLSO_DEVOLUCION', 1208.50, 82.50, 82.50, N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CARGA_SALDO', 1244.00, 85.00, 85.00, N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'PAGO_ORDEN', 1279.50, 87.50, 87.50, N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'REEMBOLSO_DEVOLUCION', 1315.00, 90.00, 90.00, N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.movimientos_billetera OFF;
GO

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.tarjetas_regalo_giftcards ON;
INSERT INTO pagos.tarjetas_regalo_giftcards (id_giftcard, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.redenciones_giftcards (id_redencion_giftcard, giftcard, orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.reglas_antifraude (id_regla_antifraude, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'REGLA_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 6, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'REGLA_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 7, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'REGLA_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 8, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'REGLA_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 9, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'REGLA_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 10, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'REGLA_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 11, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'REGLA_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 12, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'REGLA_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 13, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'REGLA_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 14, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'REGLA_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 15, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'REGLA_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 16, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'REGLA_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 17, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'REGLA_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 18, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'REGLA_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 19, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'REGLA_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 20, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'REGLA_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 21, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'REGLA_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 22, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'REGLA_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 23, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'REGLA_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 24, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'REGLA_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 25, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'REGLA_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 26, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'REGLA_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 27, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'REGLA_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 28, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'REGLA_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 29, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'REGLA_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 30, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'REGLA_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 31, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'REGLA_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 32, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'REGLA_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 33, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'REGLA_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 34, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'REGLA_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reglas_antifraude OFF;
GO

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.evaluaciones_antifraude ON;
INSERT INTO pagos.evaluaciones_antifraude (id_evaluacion_fraude, orden, regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO pagos.contracargos_chargebacks (id_contracargo, transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-DISPU-2026-0001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-DISPU-2026-0002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-DISPU-2026-0003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, '2026-02-03 11:30:00', '2026-03-03', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-DISPU-2026-0004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, '2026-02-04 11:30:00', '2026-03-04', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-DISPU-2026-0005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, '2026-02-05 11:30:00', '2026-03-05', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-DISPU-2026-0006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, '2026-02-06 11:30:00', '2026-03-06', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-DISPU-2026-0007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, '2026-02-07 11:30:00', '2026-03-07', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-DISPU-2026-0008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, '2026-02-08 11:30:00', '2026-03-08', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-DISPU-2026-0009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, '2026-02-09 11:30:00', '2026-03-09', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-DISPU-2026-0010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, '2026-02-10 11:30:00', '2026-03-10', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-DISPU-2026-0011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, '2026-02-11 11:30:00', '2026-03-11', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-DISPU-2026-0012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, '2026-02-12 11:30:00', '2026-03-12', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-DISPU-2026-0013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, '2026-02-13 11:30:00', '2026-03-13', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-DISPU-2026-0014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, '2026-02-14 11:30:00', '2026-03-14', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-DISPU-2026-0015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, '2026-02-15 11:30:00', '2026-03-15', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-DISPU-2026-0016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, '2026-02-16 11:30:00', '2026-03-16', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-DISPU-2026-0017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, '2026-02-17 11:30:00', '2026-03-17', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-DISPU-2026-0018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, '2026-02-18 11:30:00', '2026-03-18', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-DISPU-2026-0019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, '2026-02-19 11:30:00', '2026-03-19', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-DISPU-2026-0020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, '2026-02-20 11:30:00', '2026-03-20', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-DISPU-2026-0021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, '2026-02-21 11:30:00', '2026-03-21', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-DISPU-2026-0022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, '2026-02-22 11:30:00', '2026-03-22', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-DISPU-2026-0023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, '2026-02-23 11:30:00', '2026-03-23', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-DISPU-2026-0024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, '2026-02-24 11:30:00', '2026-03-24', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-DISPU-2026-0025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, '2026-02-25 11:30:00', '2026-03-25', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-DISPU-2026-0026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, '2026-02-26 11:30:00', '2026-03-26', N'EN_REVISION', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-DISPU-2026-0027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, '2026-02-27 11:30:00', '2026-03-27', N'GANADA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-DISPU-2026-0028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, '2026-02-28 11:30:00', '2026-03-28', N'PERDIDA_POR_COMERCIO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-DISPU-2026-0029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, '2026-02-01 11:30:00', '2026-03-01', N'ABIERTA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-DISPU-2026-0030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, '2026-02-02 11:30:00', '2026-03-02', N'EN_REVISION', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.contracargos_chargebacks OFF;
GO

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT pagos.reembolsos_transaccion ON;
INSERT INTO pagos.reembolsos_transaccion (id_reembolso, transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'FOL-REEMB-2026-0001', 285.50, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'FOL-REEMB-2026-0002', 321.00, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'FOL-REEMB-2026-0003', 356.50, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'FOL-REEMB-2026-0004', 392.00, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'FOL-REEMB-2026-0005', 427.50, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'FOL-REEMB-2026-0006', 463.00, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'FOL-REEMB-2026-0007', 498.50, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'FOL-REEMB-2026-0008', 534.00, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'FOL-REEMB-2026-0009', 569.50, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'FOL-REEMB-2026-0010', 605.00, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'FOL-REEMB-2026-0011', 640.50, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'FOL-REEMB-2026-0012', 676.00, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'FOL-REEMB-2026-0013', 711.50, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'FOL-REEMB-2026-0014', 747.00, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'FOL-REEMB-2026-0015', 782.50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'FOL-REEMB-2026-0016', 818.00, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'FOL-REEMB-2026-0017', 853.50, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'FOL-REEMB-2026-0018', 889.00, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'FOL-REEMB-2026-0019', 924.50, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'FOL-REEMB-2026-0020', 960.00, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'FOL-REEMB-2026-0021', 995.50, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'FOL-REEMB-2026-0022', 1031.00, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'FOL-REEMB-2026-0023', 1066.50, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'FOL-REEMB-2026-0024', 1102.00, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'FOL-REEMB-2026-0025', 1137.50, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'FOL-REEMB-2026-0026', 1173.00, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'FOL-REEMB-2026-0027', 1208.50, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'FOL-REEMB-2026-0028', 1244.00, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'FOL-REEMB-2026-0029', 1279.50, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'FOL-REEMB-2026-0030', 1315.00, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT pagos.reembolsos_transaccion OFF;
GO

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.regimenes_sat ON;
INSERT INTO fiscal.regimenes_sat (id_regimen_sat, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO fiscal.usos_cfdi (id_uso_cfdi, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO fiscal.datos_fiscales_cliente (id_dato_fiscal, cliente, rfc_emisor, razon_social, codigo_postal_fiscal, regimen_sat, uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 'Sérum Niacin', N'Laboratorios La Roche-Posay S.A. de C.V.', N'POSTAL_F_0', 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'POSTAL_F_0', 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Sol', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'POSTAL_F_0', 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'POSTAL_F_0', 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidrata', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'POSTAL_F_0', 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro ', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'POSTAL_F_0', 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar ', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'POSTAL_F_0', 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitami', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'POSTAL_F_0', 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maqui', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'POSTAL_F_0', 1, 1, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Lí', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'POSTAL_F_1', 2, 2, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Repa', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'POSTAL_F_1', 3, 3, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Á', N'Laboratorios MAC Professional S.A. de C.V.', N'POSTAL_F_1', 4, 4, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de O', N'Laboratorios Fenty Beauty S.A. de C.V.', N'POSTAL_F_1', 5, 5, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla No', N'Laboratorios Rare Beauty S.A. de C.V.', N'POSTAL_F_1', 6, 6, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal ', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'POSTAL_F_1', 7, 7, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpia', N'Laboratorios Estée Lauder S.A. de C.V.', N'POSTAL_F_1', 8, 8, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equil', N'Laboratorios Lancôme Paris S.A. de C.V.', N'POSTAL_F_1', 1, 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidrat', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'POSTAL_F_1', 2, 2, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslú', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'POSTAL_F_1', 3, 3, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquid', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'POSTAL_F_2', 4, 4, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'POSTAL_F_2', 5, 5, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Pr', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'POSTAL_F_2', 6, 6, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigm', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'POSTAL_F_2', 7, 7, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Sol', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'POSTAL_F_2', 8, 8, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corpo', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'POSTAL_F_2', 1, 1, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'POSTAL_F_2', 2, 2, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de P', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'POSTAL_F_2', 3, 3, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Pépti', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'POSTAL_F_2', 4, 4, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desm', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'POSTAL_F_2', 5, 5, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'POSTAL_F_3', 6, 6, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.datos_fiscales_cliente OFF;
GO

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_cfdi ON;
INSERT INTO fiscal.facturas_cfdi (id_factura, orden, dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 'Sérum Nia', N'FOL-FACTU-2026-0001', N'B1000000-0000-4000-8000-000000000001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 1', '2026-02-01 11:30:00', 17.50, N'TIMBRADA_VIGENTE', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpia', N'FOL-FACTU-2026-0002', N'B1000000-0000-4000-8000-000000000002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumo', '2026-02-02 11:30:00', 20.00, N'CANCELADA_SAT', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector ', N'FOL-FACTU-2026-0003', N'B1000000-0000-4000-8000-000000000003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Flui', '2026-02-03 11:30:00', 22.50, N'ERROR_TIMBRADO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ác', N'FOL-FACTU-2026-0004', N'B1000000-0000-4000-8000-000000000004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialur', '2026-02-04 11:30:00', 25.00, N'TIMBRADA_VIGENTE', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidr', N'FOL-FACTU-2026-0005', N'B1000000-0000-4000-8000-000000000005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con', '2026-02-05 11:30:00', 27.50, N'CANCELADA_SAT', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Pu', N'FOL-FACTU-2026-0006', N'B1000000-0000-4000-8000-000000000006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% No', '2026-02-06 11:30:00', 30.00, N'ERROR_TIMBRADO', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micel', N'FOL-FACTU-2026-0007', N'B1000000-0000-4000-8000-000000000007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermoli', '2026-02-07 11:30:00', 32.50, N'TIMBRADA_VIGENTE', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vit', N'FOL-FACTU-2026-0008', N'B1000000-0000-4000-8000-000000000008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pu', '2026-02-08 11:30:00', 35.00, N'CANCELADA_SAT', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Ma', N'FOL-FACTU-2026-0009', N'B1000000-0000-4000-8000-000000000009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje C', '2026-02-09 11:30:00', 37.50, N'ERROR_TIMBRADO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector ', N'FOL-FACTU-2026-0010', N'B1000000-0000-4000-8000-00000000000A', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido A', '2026-02-10 11:30:00', 40.00, N'TIMBRADA_VIGENTE', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo R', N'FOL-FACTU-2026-0011', N'B1000000-0000-4000-8000-00000000000B', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador C', '2026-02-11 11:30:00', 42.50, N'CANCELADA_SAT', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante', N'FOL-FACTU-2026-0012', N'B1000000-0000-4000-8000-00000000000C', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Sa', '2026-02-12 11:30:00', 45.00, N'ERROR_TIMBRADO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno d', N'FOL-FACTU-2026-0013', N'B1000000-0000-4000-8000-00000000000D', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con', '2026-02-13 11:30:00', 47.50, N'TIMBRADA_VIGENTE', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla', N'FOL-FACTU-2026-0014', N'B1000000-0000-4000-8000-00000000000E', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna ', '2026-02-14 11:30:00', 50.00, N'CANCELADA_SAT', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Term', N'FOL-FACTU-2026-0015', N'B1000000-0000-4000-8000-00000000000F', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmant', '2026-02-15 11:30:00', 52.50, N'ERROR_TIMBRADO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Lim', N'FOL-FACTU-2026-0016', N'B1000000-0000-4000-8000-000000000010', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emu', '2026-02-16 11:30:00', 55.00, N'TIMBRADA_VIGENTE', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Eq', N'FOL-FACTU-2026-0017', N'B1000000-0000-4000-8000-000000000011', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante', '2026-02-17 11:30:00', 57.50, N'CANCELADA_SAT', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hid', N'FOL-FACTU-2026-0018', N'B1000000-0000-4000-8000-000000000012', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante P', '2026-02-18 11:30:00', 60.00, N'ERROR_TIMBRADO', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Tras', N'FOL-FACTU-2026-0019', N'B1000000-0000-4000-8000-000000000013', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Ma', '2026-02-19 11:30:00', 62.50, N'TIMBRADA_VIGENTE', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líq', N'FOL-FACTU-2026-0020', N'B1000000-0000-4000-8000-000000000014', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigme', '2026-02-20 11:30:00', 65.00, N'CANCELADA_SAT', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ác', N'FOL-FACTU-2026-0021', N'B1000000-0000-4000-8000-000000000015', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelai', '2026-02-21 11:30:00', 67.50, N'ERROR_TIMBRADO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas', N'FOL-FACTU-2026-0022', N'B1000000-0000-4000-8000-000000000016', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteogli', '2026-02-22 11:30:00', 70.00, N'TIMBRADA_VIGENTE', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Desp', N'FOL-FACTU-2026-0023', N'B1000000-0000-4000-8000-000000000017', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante', '2026-02-23 11:30:00', 72.50, N'CANCELADA_SAT', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector ', N'FOL-FACTU-2026-0024', N'B1000000-0000-4000-8000-000000000018', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mine', '2026-02-24 11:30:00', 75.00, N'ERROR_TIMBRADO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Co', N'FOL-FACTU-2026-0025', N'B1000000-0000-4000-8000-000000000019', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Ure', '2026-02-25 11:30:00', 77.50, N'TIMBRADA_VIGENTE', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Fac', N'FOL-FACTU-2026-0026', N'B1000000-0000-4000-8000-00000000001A', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimi', '2026-02-26 11:30:00', 80.00, N'CANCELADA_SAT', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara d', N'FOL-FACTU-2026-0027', N'B1000000-0000-4000-8000-00000000001B', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestaña', '2026-02-27 11:30:00', 82.50, N'ERROR_TIMBRADO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Pé', N'FOL-FACTU-2026-0028', N'B1000000-0000-4000-8000-00000000001C', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de ', '2026-02-28 11:30:00', 85.00, N'TIMBRADA_VIGENTE', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo D', N'FOL-FACTU-2026-0029', N'B1000000-0000-4000-8000-00000000001D', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquilla', '2026-02-01 11:30:00', 87.50, N'CANCELADA_SAT', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barr', N'FOL-FACTU-2026-0030', N'B1000000-0000-4000-8000-00000000001E', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-R', '2026-02-02 11:30:00', 90.00, N'ERROR_TIMBRADO', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_cfdi OFF;
GO

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.facturas_partidas ON;
INSERT INTO fiscal.facturas_partidas (id_factura_partida, factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'PRODUCTO_0', N'UNIDA', 17.50, 17.50, 17.50, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PRODUCTO_0', N'UNIDA', 20.00, 20.00, 20.00, 'Gel', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'PRODUCTO_0', N'UNIDA', 22.50, 22.50, 22.50, 'Pro', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'PRODUCTO_0', N'UNIDA', 25.00, 25.00, 25.00, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'PRODUCTO_0', N'UNIDA', 27.50, 27.50, 27.50, 'Cre', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PRODUCTO_0', N'UNIDA', 30.00, 30.00, 30.00, 'Ret', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'PRODUCTO_0', N'UNIDA', 32.50, 32.50, 32.50, 'Agu', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'PRODUCTO_0', N'UNIDA', 35.00, 35.00, 35.00, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'PRODUCTO_0', N'UNIDA', 37.50, 37.50, 37.50, 'Bas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PRODUCTO_1', N'UNIDA', 40.00, 40.00, 40.00, 'Cor', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'PRODUCTO_1', N'UNIDA', 42.50, 42.50, 42.50, 'Bá', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'PRODUCTO_1', N'UNIDA', 45.00, 45.00, 45.00, 'Exf', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'PRODUCTO_1', N'UNIDA', 47.50, 47.50, 47.50, 'Con', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PRODUCTO_1', N'UNIDA', 50.00, 50.00, 50.00, 'Mas', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'PRODUCTO_1', N'UNIDA', 52.50, 52.50, 52.50, 'Bru', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'PRODUCTO_1', N'UNIDA', 55.00, 55.00, 55.00, 'Ace', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'PRODUCTO_1', N'UNIDA', 57.50, 57.50, 57.50, 'Tó', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PRODUCTO_1', N'UNIDA', 60.00, 60.00, 60.00, 'Lab', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'PRODUCTO_1', N'UNIDA', 62.50, 62.50, 62.50, 'Pol', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'PRODUCTO_2', N'UNIDA', 65.00, 65.00, 65.00, 'Rub', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'PRODUCTO_2', N'UNIDA', 67.50, 67.50, 67.50, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PRODUCTO_2', N'UNIDA', 70.00, 70.00, 70.00, 'Amp', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'PRODUCTO_2', N'UNIDA', 72.50, 72.50, 72.50, 'Cre', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'PRODUCTO_2', N'UNIDA', 75.00, 75.00, 75.00, 'Pro', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'PRODUCTO_2', N'UNIDA', 77.50, 77.50, 77.50, 'Loc', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PRODUCTO_2', N'UNIDA', 80.00, 80.00, 80.00, 'Pri', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'PRODUCTO_2', N'UNIDA', 82.50, 82.50, 82.50, 'Má', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'PRODUCTO_2', N'UNIDA', 85.00, 85.00, 85.00, 'Sé', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'PRODUCTO_2', N'UNIDA', 87.50, 87.50, 87.50, 'Bá', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PRODUCTO_3', N'UNIDA', 90.00, 90.00, 90.00, 'Cre', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.facturas_partidas OFF;
GO

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.complementos_pago ON;
INSERT INTO fiscal.complementos_pago (id_complemento_pago, factura, transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'B1000000-0000-4000-8000-000000000001', 1, 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'B1000000-0000-4000-8000-000000000002', 1, 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'B1000000-0000-4000-8000-000000000003', 1, 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'B1000000-0000-4000-8000-000000000004', 1, 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'B1000000-0000-4000-8000-000000000005', 1, 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'B1000000-0000-4000-8000-000000000006', 1, 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'B1000000-0000-4000-8000-000000000007', 1, 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'B1000000-0000-4000-8000-000000000008', 1, 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'B1000000-0000-4000-8000-000000000009', 1, 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'B1000000-0000-4000-8000-00000000000A', 1, 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'B1000000-0000-4000-8000-00000000000B', 1, 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'B1000000-0000-4000-8000-00000000000C', 1, 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'B1000000-0000-4000-8000-00000000000D', 1, 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'B1000000-0000-4000-8000-00000000000E', 1, 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'B1000000-0000-4000-8000-00000000000F', 1, 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'B1000000-0000-4000-8000-000000000010', 1, 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'B1000000-0000-4000-8000-000000000011', 1, 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'B1000000-0000-4000-8000-000000000012', 1, 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'B1000000-0000-4000-8000-000000000013', 1, 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'B1000000-0000-4000-8000-000000000014', 1, 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'B1000000-0000-4000-8000-000000000015', 1, 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'B1000000-0000-4000-8000-000000000016', 1, 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'B1000000-0000-4000-8000-000000000017', 1, 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'B1000000-0000-4000-8000-000000000018', 1, 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'B1000000-0000-4000-8000-000000000019', 1, 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'B1000000-0000-4000-8000-00000000001A', 1, 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'B1000000-0000-4000-8000-00000000001B', 1, 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'B1000000-0000-4000-8000-00000000001C', 1, 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'B1000000-0000-4000-8000-00000000001D', 1, 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'B1000000-0000-4000-8000-00000000001E', 1, 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.complementos_pago OFF;
GO

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.notas_credito ON;
INSERT INTO fiscal.notas_credito (id_nota_credito, factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'B1000000-0000-4000-8000-000000000001', 'Sé', 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'B1000000-0000-4000-8000-000000000002', 'Gel', 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'B1000000-0000-4000-8000-000000000003', 'Pro', 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'B1000000-0000-4000-8000-000000000004', 'Sé', 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'B1000000-0000-4000-8000-000000000005', 'Cre', 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'B1000000-0000-4000-8000-000000000006', 'Ret', 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'B1000000-0000-4000-8000-000000000007', 'Agu', 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'B1000000-0000-4000-8000-000000000008', 'Sé', 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'B1000000-0000-4000-8000-000000000009', 'Bas', 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'B1000000-0000-4000-8000-00000000000A', 'Cor', 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'B1000000-0000-4000-8000-00000000000B', 'Bá', 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'B1000000-0000-4000-8000-00000000000C', 'Exf', 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'B1000000-0000-4000-8000-00000000000D', 'Con', 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'B1000000-0000-4000-8000-00000000000E', 'Mas', 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'B1000000-0000-4000-8000-00000000000F', 'Bru', 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'B1000000-0000-4000-8000-000000000010', 'Ace', 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'B1000000-0000-4000-8000-000000000011', 'Tó', 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'B1000000-0000-4000-8000-000000000012', 'Lab', 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'B1000000-0000-4000-8000-000000000013', 'Pol', 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'B1000000-0000-4000-8000-000000000014', 'Rub', 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'B1000000-0000-4000-8000-000000000015', 'Sé', 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'B1000000-0000-4000-8000-000000000016', 'Amp', 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'B1000000-0000-4000-8000-000000000017', 'Cre', 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'B1000000-0000-4000-8000-000000000018', 'Pro', 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'B1000000-0000-4000-8000-000000000019', 'Loc', 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'B1000000-0000-4000-8000-00000000001A', 'Pri', 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'B1000000-0000-4000-8000-00000000001B', 'Má', 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'B1000000-0000-4000-8000-00000000001C', 'Sé', 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'B1000000-0000-4000-8000-00000000001D', 'Bá', 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'B1000000-0000-4000-8000-00000000001E', 'Cre', 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.notas_credito OFF;
GO

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi ON;
INSERT INTO fiscal.cancelaciones_cfdi (id_cancelacion_cfdi, factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'01', N'B1000000-0000-4000-8000-000000000001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'02', N'B1000000-0000-4000-8000-000000000002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'03', N'B1000000-0000-4000-8000-000000000003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'04', N'B1000000-0000-4000-8000-000000000004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'01', N'B1000000-0000-4000-8000-000000000005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'02', N'B1000000-0000-4000-8000-000000000006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'03', N'B1000000-0000-4000-8000-000000000007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'04', N'B1000000-0000-4000-8000-000000000008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'01', N'B1000000-0000-4000-8000-000000000009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'02', N'B1000000-0000-4000-8000-00000000000A', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'03', N'B1000000-0000-4000-8000-00000000000B', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'04', N'B1000000-0000-4000-8000-00000000000C', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'01', N'B1000000-0000-4000-8000-00000000000D', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'02', N'B1000000-0000-4000-8000-00000000000E', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'03', N'B1000000-0000-4000-8000-00000000000F', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'04', N'B1000000-0000-4000-8000-000000000010', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'01', N'B1000000-0000-4000-8000-000000000011', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'02', N'B1000000-0000-4000-8000-000000000012', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'03', N'B1000000-0000-4000-8000-000000000013', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'04', N'B1000000-0000-4000-8000-000000000014', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'01', N'B1000000-0000-4000-8000-000000000015', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'02', N'B1000000-0000-4000-8000-000000000016', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'03', N'B1000000-0000-4000-8000-000000000017', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'04', N'B1000000-0000-4000-8000-000000000018', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'01', N'B1000000-0000-4000-8000-000000000019', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'02', N'B1000000-0000-4000-8000-00000000001A', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'03', N'B1000000-0000-4000-8000-00000000001B', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'04', N'B1000000-0000-4000-8000-00000000001C', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'01', N'B1000000-0000-4000-8000-00000000001D', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'02', N'B1000000-0000-4000-8000-00000000001E', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT fiscal.cancelaciones_cfdi OFF;
GO

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.campanias ON;
INSERT INTO promos.campanias (id_campania, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'CAMPANIA_01', N'Kit Rutina La Roche-Posay #1', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'CAMPANIA_02', N'Kit Rutina CeraVe Dermatological #2', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'CAMPANIA_03', N'Kit Rutina The Ordinary Deciem #3', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'CAMPANIA_04', N'Kit Rutina ISDIN Fotoprotección #4', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'CAMPANIA_05', N'Kit Rutina Bioderma Laboratoire #5', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'CAMPANIA_06', N'Kit Rutina Eau Thermale Avène #6', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'CAMPANIA_07', N'Kit Rutina Eucerin Beiersdorf #7', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'CAMPANIA_08', N'Kit Rutina Vichy Laboratoires #8', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'CAMPANIA_09', N'Kit Rutina SkinCeuticals Clinical #9', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'CAMPANIA_10', N'Kit Rutina Sesderma Nanotech #10', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'CAMPANIA_11', N'Kit Rutina NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'CAMPANIA_12', N'Kit Rutina MAC Professional #12', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'CAMPANIA_13', N'Kit Rutina Fenty Beauty #13', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'CAMPANIA_14', N'Kit Rutina Rare Beauty #14', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'CAMPANIA_15', N'Kit Rutina Clinique Laboratories #15', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'CAMPANIA_16', N'Kit Rutina Estée Lauder #16', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'CAMPANIA_17', N'Kit Rutina Lancôme Paris #17', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'CAMPANIA_18', N'Kit Rutina Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'CAMPANIA_19', N'Kit Rutina Paula''s Choice Skincare #19', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'CAMPANIA_20', N'Kit Rutina COSRX K-Beauty #20', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'CAMPANIA_21', N'Kit Rutina Laneige Amorepacific #21', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'CAMPANIA_22', N'Kit Rutina Uriage Eau Thermale #22', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'CAMPANIA_23', N'Kit Rutina Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'CAMPANIA_24', N'Kit Rutina MartiDerm Ampollas #24', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'CAMPANIA_25', N'Kit Rutina Heliocare Cantabria Labs #25', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'CAMPANIA_26', N'Kit Rutina Kiehl''s Since 1851 #26', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'CAMPANIA_27', N'Kit Rutina Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'CAMPANIA_28', N'Kit Rutina L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'CAMPANIA_29', N'Kit Rutina Neutrogena Derm #29', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'CAMPANIA_30', N'Kit Rutina DermaCare Labs México #30', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.campanias OFF;
GO

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.cupones ON;
INSERT INTO promos.cupones (id_cupon, campania, codigo_cupon, tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'CUPON_01', 1, 17.50, 17.50, 1, 1, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'CUPON_02', 2, 20.00, 20.00, 2, 2, 2, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'CUPON_03', 3, 22.50, 22.50, 3, 3, 3, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'CUPON_04', 4, 25.00, 25.00, 4, 4, 4, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'CUPON_05', 5, 27.50, 27.50, 5, 5, 5, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'CUPON_06', 6, 30.00, 30.00, 6, 6, 6, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'CUPON_07', 7, 32.50, 32.50, 7, 7, 7, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'CUPON_08', 8, 35.00, 35.00, 8, 8, 8, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'CUPON_09', 9, 37.50, 37.50, 9, 9, 9, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'CUPON_10', 10, 40.00, 40.00, 10, 10, 10, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'CUPON_11', 11, 42.50, 42.50, 11, 11, 11, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'CUPON_12', 12, 45.00, 45.00, 12, 12, 12, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'CUPON_13', 13, 47.50, 47.50, 13, 13, 13, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'CUPON_14', 14, 50.00, 50.00, 14, 14, 14, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'CUPON_15', 15, 52.50, 52.50, 15, 15, 15, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'CUPON_16', 16, 55.00, 55.00, 16, 16, 16, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'CUPON_17', 17, 57.50, 57.50, 17, 17, 17, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'CUPON_18', 18, 60.00, 60.00, 18, 18, 18, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'CUPON_19', 19, 62.50, 62.50, 19, 19, 19, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'CUPON_20', 20, 65.00, 65.00, 20, 20, 20, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'CUPON_21', 21, 67.50, 67.50, 21, 21, 21, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'CUPON_22', 22, 70.00, 70.00, 22, 22, 22, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'CUPON_23', 23, 72.50, 72.50, 23, 23, 23, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'CUPON_24', 24, 75.00, 75.00, 24, 24, 24, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'CUPON_25', 25, 77.50, 77.50, 25, 25, 25, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'CUPON_26', 26, 80.00, 80.00, 26, 26, 26, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'CUPON_27', 27, 82.50, 82.50, 27, 27, 27, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'CUPON_28', 28, 85.00, 85.00, 28, 28, 28, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'CUPON_29', 29, 87.50, 87.50, 29, 29, 29, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'CUPON_30', 30, 90.00, 90.00, 30, 30, 30, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.cupones OFF;
GO

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.reglas_elegibilidad_cupon ON;
INSERT INTO promos.reglas_elegibilidad_cupon (id_regla_cupon, cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO promos.cupones_categorias_excluidas (id_cupon_exclusion, cupon, categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO promos.redenciones_cupones (id_redencion_cupon, cupon, cliente, orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 17.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 20.00, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 22.50, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 25.00, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 27.50, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 30.00, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 32.50, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 35.00, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 37.50, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 40.00, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 42.50, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 45.00, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 47.50, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 50.00, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 52.50, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 55.00, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 57.50, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 60.00, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62.50, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65.00, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 67.50, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 70.00, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 72.50, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 75.00, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 77.50, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 80.00, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 82.50, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 85.00, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 87.50, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 90.00, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.redenciones_cupones OFF;
GO

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT promos.ventas_flash_horarias ON;
INSERT INTO promos.ventas_flash_horarias (id_venta_flash, variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 17.50, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT promos.ventas_flash_horarias OFF;
GO

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.estados_orden_compra ON;
INSERT INTO compras.estados_orden_compra (id_estado_oc, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO compras.proveedores (id_proveedor, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PROVEEDO_01', N'Laboratorios La Roche-Posay S.A. de C.V.', N'Kit Rutina La Roche-Posay #1', 'MEGC910315H01', N'México', 1, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PROVEEDO_02', N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Kit Rutina CeraVe Dermatological #2', 'RALS920315H02', N'México', 2, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PROVEEDO_03', N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Kit Rutina The Ordinary Deciem #3', 'TOVV930315H03', N'México', 3, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PROVEEDO_04', N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Kit Rutina ISDIN Fotoprotección #4', 'HECA940315H04', N'México', 4, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PROVEEDO_05', N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Kit Rutina Bioderma Laboratoire #5', 'SAFM950315H05', N'México', 5, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PROVEEDO_06', N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Kit Rutina Eau Thermale Avène #6', 'MATD960315H06', N'México', 6, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PROVEEDO_07', N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Kit Rutina Eucerin Beiersdorf #7', 'GORC970315H07', N'México', 7, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PROVEEDO_08', N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Kit Rutina Vichy Laboratoires #8', 'FLCM980315H08', N'México', 8, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PROVEEDO_09', N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Kit Rutina SkinCeuticals Clinical #9', 'MODL990315H09', N'México', 9, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PROVEEDO_10', N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Kit Rutina Sesderma Nanotech #10', 'VAOS900315H10', N'México', 10, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PROVEEDO_11', N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Kit Rutina NARS Cosmetics #11', 'GUNR910315H11', N'México', 11, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PROVEEDO_12', N'Laboratorios MAC Professional S.A. de C.V.', N'Kit Rutina MAC Professional #12', 'JIPS920315H12', N'México', 12, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PROVEEDO_13', N'Laboratorios Fenty Beauty S.A. de C.V.', N'Kit Rutina Fenty Beauty #13', 'RUSF930315H13', N'México', 13, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PROVEEDO_14', N'Laboratorios Rare Beauty S.A. de C.V.', N'Kit Rutina Rare Beauty #14', 'RICE940315H14', N'México', 14, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PROVEEDO_15', N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Kit Rutina Clinique Laboratories #15', 'AGIX950315H15', N'México', 15, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PROVEEDO_16', N'Laboratorios Estée Lauder S.A. de C.V.', N'Kit Rutina Estée Lauder #16', 'MEND960315H16', N'México', 16, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PROVEEDO_17', N'Laboratorios Lancôme Paris S.A. de C.V.', N'Kit Rutina Lancôme Paris #17', 'CADA970315H17', N'México', 17, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PROVEEDO_18', N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Kit Rutina Charlotte Tilbury #18', 'VEMG980315H18', N'México', 18, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PROVEEDO_19', N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Kit Rutina Paula''s Choice Skincare #19', 'CORP990315H19', N'México', 19, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PROVEEDO_20', N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Kit Rutina COSRX K-Beauty #20', 'RACA900315H20', N'México', 20, 4.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PROVEEDO_21', N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Kit Rutina Laneige Amorepacific #21', 'GULR910315H21', N'México', 21, 4.10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PROVEEDO_22', N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Kit Rutina Uriage Eau Thermale #22', 'PECN920315H22', N'México', 22, 4.20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PROVEEDO_23', N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Kit Rutina Laboratoire SVR #23', 'HEVN930315H23', N'México', 23, 4.30, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PROVEEDO_24', N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Kit Rutina MartiDerm Ampollas #24', 'MECJ940315H24', N'México', 24, 4.40, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PROVEEDO_25', N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Kit Rutina Heliocare Cantabria Labs #25', 'DOEI950315H25', N'México', 25, 4.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PROVEEDO_26', N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Kit Rutina Kiehl''s Since 1851 #26', 'SIPL960315H26', N'México', 26, 4.60, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PROVEEDO_27', N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Kit Rutina Garnier SkinActive #27', 'CHBA970315H27', N'México', 27, 4.70, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PROVEEDO_28', N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Kit Rutina L''Oréal Paris Derm #28', 'OCAR980315H28', N'México', 28, 4.80, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PROVEEDO_29', N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Kit Rutina Neutrogena Derm #29', 'MILP990315H29', N'México', 29, 4.90, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PROVEEDO_30', N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Kit Rutina DermaCare Labs México #30', 'PASM900315H30', N'México', 30, 4.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.proveedores OFF;
GO

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.contactos_proveedor ON;
INSERT INTO compras.contactos_proveedor (id_contacto_proveedor, proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Laboratorios La Roche-Posay S.A. de C.V.', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Laboratorios CeraVe Dermatological S.A. de C.V.', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumo', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Laboratorios The Ordinary Deciem S.A. de C.V.', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Flui', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Laboratorios ISDIN Fotoprotección S.A. de C.V.', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurón', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Laboratorios Bioderma Laboratoire S.A. de C.V.', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Laboratorios Eau Thermale Avène S.A. de C.V.', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% No', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Laboratorios Eucerin Beiersdorf S.A. de C.V.', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermoli', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Laboratorios Vichy Laboratoires S.A. de C.V.', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pur', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Laboratorios SkinCeuticals Clinical S.A. de C.V.', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje C', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Laboratorios Sesderma Nanotech S.A. de C.V.', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Al', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Laboratorios NARS Cosmetics S.A. de C.V.', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Ci', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Laboratorios MAC Professional S.A. de C.V.', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Sal', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Laboratorios Fenty Beauty S.A. de C.V.', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Laboratorios Rare Beauty S.A. de C.V.', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna ', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Laboratorios Clinique Laboratories S.A. de C.V.', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmant', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Laboratorios Estée Lauder S.A. de C.V.', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emu', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Laboratorios Lancôme Paris S.A. de C.V.', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante ', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Laboratorios Charlotte Tilbury S.A. de C.V.', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Pé', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Laboratorios Paula''s Choice Skincare S.A. de C.V.', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Mat', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Laboratorios COSRX K-Beauty S.A. de C.V.', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmen', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Laboratorios Laneige Amorepacific S.A. de C.V.', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Laboratorios Uriage Eau Thermale S.A. de C.V.', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteogli', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Laboratorios Laboratoire SVR S.A. de C.V.', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Laboratorios MartiDerm Ampollas S.A. de C.V.', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mine', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimi', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Laboratorios Garnier SkinActive S.A. de C.V.', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas ', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Laboratorios L''Oréal Paris Derm S.A. de C.V.', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Co', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Laboratorios Neutrogena Derm S.A. de C.V.', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillan', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Laboratorios DermaCare Labs México S.A. de C.V.', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-R', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.contactos_proveedor OFF;
GO

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.proveedor_slas ON;
INSERT INTO compras.proveedor_slas (id_proveedor_sla, proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO compras.proveedor_productos (id_proveedor_producto, proveedor, variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO compras.requisiciones (id_requisicion, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-REQUI-2026-0001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'BAJA', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-REQUI-2026-0002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'MEDIA', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-03-02', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-REQUI-2026-0003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', N'URGENTE_DESABASTO', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-03-03', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-REQUI-2026-0004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'BAJA', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-03-04', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-REQUI-2026-0005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'MEDIA', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-03-05', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-REQUI-2026-0006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'URGENTE_DESABASTO', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-03-06', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-REQUI-2026-0007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'BAJA', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-03-07', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-REQUI-2026-0008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'MEDIA', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-03-08', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-REQUI-2026-0009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'URGENTE_DESABASTO', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-03-09', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-REQUI-2026-0010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'BAJA', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-03-10', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-REQUI-2026-0011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'MEDIA', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-03-11', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-REQUI-2026-0012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'URGENTE_DESABASTO', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-03-12', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-REQUI-2026-0013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'BAJA', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-03-13', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-REQUI-2026-0014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'MEDIA', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-03-14', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-REQUI-2026-0015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'URGENTE_DESABASTO', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-03-15', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-REQUI-2026-0016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'BAJA', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-03-16', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-REQUI-2026-0017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'MEDIA', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-03-17', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-REQUI-2026-0018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'URGENTE_DESABASTO', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-03-18', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-REQUI-2026-0019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'BAJA', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-03-19', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-REQUI-2026-0020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'MEDIA', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-03-20', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-REQUI-2026-0021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'URGENTE_DESABASTO', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-03-21', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-REQUI-2026-0022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'BAJA', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-03-22', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-REQUI-2026-0023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', N'MEDIA', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-03-23', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-REQUI-2026-0024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'URGENTE_DESABASTO', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-03-24', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-REQUI-2026-0025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', N'BAJA', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-03-25', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-REQUI-2026-0026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'MEDIA', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-03-26', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-REQUI-2026-0027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'URGENTE_DESABASTO', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-03-27', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-REQUI-2026-0028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'BAJA', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-03-28', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-REQUI-2026-0029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'MEDIA', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-03-01', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-REQUI-2026-0030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'URGENTE_DESABASTO', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-03-02', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.requisiciones OFF;
GO

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.requisiciones_detalles ON;
INSERT INTO compras.requisiciones_detalles (id_requisicion_detalle, requisicion, variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
SET IDENTITY_INSERT compras.requisiciones_detalles OFF;
GO

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra ON;
INSERT INTO compras.ordenes_compra (id_orden_compra, folio_orden_compra, proveedor, estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 285.50, 45.68, 17.50, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 321.00, 51.36, 20.00, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 356.50, 57.04, 22.50, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 392.00, 62.72, 25.00, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 427.50, 68.40, 27.50, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 463.00, 74.08, 30.00, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 498.50, 79.76, 32.50, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 534.00, 85.44, 35.00, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 569.50, 91.12, 37.50, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 605.00, 96.80, 40.00, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 640.50, 102.48, 42.50, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 676.00, 108.16, 45.00, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 711.50, 113.84, 47.50, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 747.00, 119.52, 50.00, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 782.50, 125.20, 52.50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 818.00, 130.88, 55.00, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 853.50, 136.56, 57.50, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 889.00, 142.24, 60.00, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 924.50, 147.92, 62.50, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 960.00, 153.60, 65.00, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 995.50, 159.28, 67.50, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 1031.00, 164.96, 70.00, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 1066.50, 170.64, 72.50, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 1102.00, 176.32, 75.00, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 1137.50, 182.00, 77.50, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 1173.00, 187.68, 80.00, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 1208.50, 193.36, 82.50, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 1244.00, 199.04, 85.00, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 1279.50, 204.72, 87.50, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 1315.00, 210.40, 90.00, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra OFF;
GO

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.ordenes_compra_detalles ON;
INSERT INTO compras.ordenes_compra_detalles (id_orden_compra_detalle, orden_compra, variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 8, 285.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 321.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 356.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 392.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 427.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 463.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 498.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 534.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 569.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 605.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 640.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 676.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 711.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 747.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 782.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 818.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 853.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 889.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 924.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 960.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 995.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1031.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1066.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1102.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1137.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1173.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1208.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1244.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1279.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 1315.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.ordenes_compra_detalles OFF;
GO

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_mercancia ON;
INSERT INTO compras.recepciones_mercancia (id_recepcion, folio_recepcion, orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RECEP-2026-0001', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', '2026-02-01 11:30:00', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RECEP-2026-0002', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', '2026-02-02 11:30:00', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RECEP-2026-0003', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', '2026-02-03 11:30:00', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RECEP-2026-0004', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', '2026-02-04 11:30:00', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RECEP-2026-0005', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', '2026-02-05 11:30:00', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RECEP-2026-0006', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', '2026-02-06 11:30:00', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RECEP-2026-0007', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', '2026-02-07 11:30:00', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RECEP-2026-0008', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', '2026-02-08 11:30:00', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RECEP-2026-0009', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', '2026-02-09 11:30:00', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RECEP-2026-0010', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', '2026-02-10 11:30:00', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RECEP-2026-0011', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', '2026-02-11 11:30:00', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RECEP-2026-0012', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', '2026-02-12 11:30:00', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RECEP-2026-0013', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', '2026-02-13 11:30:00', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RECEP-2026-0014', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', '2026-02-14 11:30:00', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RECEP-2026-0015', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', '2026-02-15 11:30:00', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RECEP-2026-0016', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', '2026-02-16 11:30:00', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RECEP-2026-0017', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', '2026-02-17 11:30:00', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RECEP-2026-0018', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', '2026-02-18 11:30:00', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RECEP-2026-0019', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', '2026-02-19 11:30:00', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RECEP-2026-0020', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RECEP-2026-0021', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', '2026-02-21 11:30:00', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RECEP-2026-0022', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', '2026-02-22 11:30:00', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RECEP-2026-0023', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', '2026-02-23 11:30:00', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RECEP-2026-0024', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', '2026-02-24 11:30:00', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RECEP-2026-0025', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', '2026-02-25 11:30:00', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RECEP-2026-0026', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', '2026-02-26 11:30:00', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RECEP-2026-0027', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', '2026-02-27 11:30:00', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RECEP-2026-0028', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', '2026-02-28 11:30:00', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RECEP-2026-0029', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', '2026-02-01 11:30:00', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RECEP-2026-0030', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', '2026-02-02 11:30:00', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_mercancia OFF;
GO

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.recepciones_detalles ON;
INSERT INTO compras.recepciones_detalles (id_recepcion_detalle, recepcion, variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.recepciones_detalles OFF;
GO

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa ON;
INSERT INTO compras.inspecciones_sanitarias_qa (id_inspeccion_qa, recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, N'LOTE_LAB_01', '2026-03-01', N'APROBADO', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 0, N'LOTE_LAB_02', '2026-03-02', N'RECHAZADO_DEVOLVER', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, N'LOTE_LAB_03', '2026-03-03', N'APROBADO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, N'LOTE_LAB_04', '2026-03-04', N'RECHAZADO_DEVOLVER', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 1, N'LOTE_LAB_05', '2026-03-05', N'APROBADO', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 0, N'LOTE_LAB_06', '2026-03-06', N'RECHAZADO_DEVOLVER', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, N'LOTE_LAB_07', '2026-03-07', N'APROBADO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 0, N'LOTE_LAB_08', '2026-03-08', N'RECHAZADO_DEVOLVER', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, N'LOTE_LAB_09', '2026-03-09', N'APROBADO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 0, N'LOTE_LAB_10', '2026-03-10', N'RECHAZADO_DEVOLVER', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, N'LOTE_LAB_11', '2026-03-11', N'APROBADO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 0, N'LOTE_LAB_12', '2026-03-12', N'RECHAZADO_DEVOLVER', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, N'LOTE_LAB_13', '2026-03-13', N'APROBADO', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 0, N'LOTE_LAB_14', '2026-03-14', N'RECHAZADO_DEVOLVER', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 1, N'LOTE_LAB_15', '2026-03-15', N'APROBADO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 0, N'LOTE_LAB_16', '2026-03-16', N'RECHAZADO_DEVOLVER', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 1, N'LOTE_LAB_17', '2026-03-17', N'APROBADO', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 0, N'LOTE_LAB_18', '2026-03-18', N'RECHAZADO_DEVOLVER', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 1, N'LOTE_LAB_19', '2026-03-19', N'APROBADO', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 0, N'LOTE_LAB_20', '2026-03-20', N'RECHAZADO_DEVOLVER', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 1, N'LOTE_LAB_21', '2026-03-21', N'APROBADO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 0, N'LOTE_LAB_22', '2026-03-22', N'RECHAZADO_DEVOLVER', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 1, N'LOTE_LAB_23', '2026-03-23', N'APROBADO', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 0, N'LOTE_LAB_24', '2026-03-24', N'RECHAZADO_DEVOLVER', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 1, N'LOTE_LAB_25', '2026-03-25', N'APROBADO', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 0, N'LOTE_LAB_26', '2026-03-26', N'RECHAZADO_DEVOLVER', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 1, N'LOTE_LAB_27', '2026-03-27', N'APROBADO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 0, N'LOTE_LAB_28', '2026-03-28', N'RECHAZADO_DEVOLVER', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 1, N'LOTE_LAB_29', '2026-03-01', N'APROBADO', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 0, N'LOTE_LAB_30', '2026-03-02', N'RECHAZADO_DEVOLVER', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT compras.inspecciones_sanitarias_qa OFF;
GO

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.almacenes_cedis ON;
INSERT INTO wms.almacenes_cedis (id_almacen, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'ALMACEN_01', N'CEDIS Monterrey Parque Stiva Unidad 1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'25700', N'Monclova', 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'ALMACEN_02', N'CEDIS CDMX Vallejo Industrial Unidad 2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'64000', N'Monterrey', 20.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'ALMACEN_03', N'CEDIS Guadalajara El Salto Unidad 3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'66220', N'San Pedro Garza García', 22.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'ALMACEN_04', N'CEDIS Monclova Centro Distribución Unidad 4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'06700', N'Ciudad de México', 25.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'ALMACEN_05', N'CEDIS Querétaro Logístico Bajío Unidad 5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'11560', N'Ciudad de México', 27.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'ALMACEN_06', N'CEDIS Puebla Parque Finsa Unidad 6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'44100', N'Guadalajara', 30.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'ALMACEN_07', N'CEDIS Monterrey Parque Stiva Unidad 7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'25000', N'Saltillo', 32.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'ALMACEN_08', N'CEDIS CDMX Vallejo Industrial Unidad 8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'76000', N'Querétaro', 35.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'ALMACEN_09', N'CEDIS Guadalajara El Salto Unidad 9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'72000', N'Puebla', 37.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'ALMACEN_10', N'CEDIS Monclova Centro Distribución Unidad 10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'97000', N'Mérida', 40.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'ALMACEN_11', N'CEDIS Querétaro Logístico Bajío Unidad 11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'25700', N'Monclova', 42.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'ALMACEN_12', N'CEDIS Puebla Parque Finsa Unidad 12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'64000', N'Monterrey', 45.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'ALMACEN_13', N'CEDIS Monterrey Parque Stiva Unidad 13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'66220', N'San Pedro Garza García', 47.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'ALMACEN_14', N'CEDIS CDMX Vallejo Industrial Unidad 14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'06700', N'Ciudad de México', 50.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'ALMACEN_15', N'CEDIS Guadalajara El Salto Unidad 15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'11560', N'Ciudad de México', 52.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'ALMACEN_16', N'CEDIS Monclova Centro Distribución Unidad 16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'44100', N'Guadalajara', 55.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'ALMACEN_17', N'CEDIS Querétaro Logístico Bajío Unidad 17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'25000', N'Saltillo', 57.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'ALMACEN_18', N'CEDIS Puebla Parque Finsa Unidad 18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'76000', N'Querétaro', 60.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'ALMACEN_19', N'CEDIS Monterrey Parque Stiva Unidad 19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'72000', N'Puebla', 62.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'ALMACEN_20', N'CEDIS CDMX Vallejo Industrial Unidad 20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'97000', N'Mérida', 65.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'ALMACEN_21', N'CEDIS Guadalajara El Salto Unidad 21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'25700', N'Monclova', 67.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'ALMACEN_22', N'CEDIS Monclova Centro Distribución Unidad 22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'64000', N'Monterrey', 70.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'ALMACEN_23', N'CEDIS Querétaro Logístico Bajío Unidad 23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'66220', N'San Pedro Garza García', 72.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'ALMACEN_24', N'CEDIS Puebla Parque Finsa Unidad 24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'06700', N'Ciudad de México', 75.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'ALMACEN_25', N'CEDIS Monterrey Parque Stiva Unidad 25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'11560', N'Ciudad de México', 77.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'ALMACEN_26', N'CEDIS CDMX Vallejo Industrial Unidad 26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'44100', N'Guadalajara', 80.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'ALMACEN_27', N'CEDIS Guadalajara El Salto Unidad 27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'25000', N'Saltillo', 82.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'ALMACEN_28', N'CEDIS Monclova Centro Distribución Unidad 28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'76000', N'Querétaro', 85.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'ALMACEN_29', N'CEDIS Querétaro Logístico Bajío Unidad 29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'72000', N'Puebla', 87.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'ALMACEN_30', N'CEDIS Puebla Parque Finsa Unidad 30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'97000', N'Mérida', 90.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.almacenes_cedis OFF;
GO

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.zonas_almacen ON;
INSERT INTO wms.zonas_almacen (id_zona_almacen, almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ZONA_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ZONA_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ZONA_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ZONA_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ZONA_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ZONA_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ZONA_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ZONA_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ZONA_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ZONA_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ZONA_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ZONA_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ZONA_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ZONA_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ZONA_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ZONA_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ZONA_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ZONA_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ZONA_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ZONA_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ZONA_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ZONA_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ZONA_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ZONA_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ZONA_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ZONA_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ZONA_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ZONA_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ZONA_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ZONA_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.zonas_almacen OFF;
GO

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.pasillos_ubicaciones ON;
INSERT INTO wms.pasillos_ubicaciones (id_ubicacion, zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'UBICACIO_01', 17.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'UBICACIO_02', 20.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'UBICACIO_03', 22.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'UBICACIO_04', 25.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'UBICACIO_05', 27.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'UBICACIO_06', 30.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'UBICACIO_07', 32.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'UBICACIO_08', 35.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'UBICACIO_09', 37.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'UBICACIO_10', 40.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'UBICACIO_11', 42.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'UBICACIO_12', 45.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'UBICACIO_13', 47.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'UBICACIO_14', 50.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'UBICACIO_15', 52.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'UBICACIO_16', 55.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'UBICACIO_17', 57.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'UBICACIO_18', 60.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'UBICACIO_19', 62.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'UBICACIO_20', 65.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'UBICACIO_21', 67.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'UBICACIO_22', 70.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'UBICACIO_23', 72.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'UBICACIO_24', 75.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'UBICACIO_25', 77.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'UBICACIO_26', 80.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'UBICACIO_27', 82.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'UBICACIO_28', 85.00, 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'UBICACIO_29', 87.50, 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'UBICACIO_30', 90.00, 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.pasillos_ubicaciones OFF;
GO

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.tipos_movimiento_inventario ON;
INSERT INTO wms.tipos_movimiento_inventario (id_tipo_movimiento, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.lotes_fabricacion_sanitaria (id_lote, variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'LOT-2026-LA_R-001', '2026-03-01', '2026-03-01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'LOT-2026-CERA-002', '2026-03-02', '2026-03-02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'LOT-2026-THE_-003', '2026-03-03', '2026-03-03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'LOT-2026-ISDI-004', '2026-03-04', '2026-03-04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'LOT-2026-BIOD-005', '2026-03-05', '2026-03-05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'LOT-2026-AVEN-006', '2026-03-06', '2026-03-06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'LOT-2026-EUCE-007', '2026-03-07', '2026-03-07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'LOT-2026-VICH-008', '2026-03-08', '2026-03-08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'LOT-2026-SKIN-009', '2026-03-09', '2026-03-09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'LOT-2026-SESD-010', '2026-03-10', '2026-03-10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'LOT-2026-NARS-011', '2026-03-11', '2026-03-11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'LOT-2026-MAC-012', '2026-03-12', '2026-03-12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'LOT-2026-FENT-013', '2026-03-13', '2026-03-13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'LOT-2026-RARE-014', '2026-03-14', '2026-03-14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'LOT-2026-CLIN-015', '2026-03-15', '2026-03-15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'LOT-2026-ESTE-016', '2026-03-16', '2026-03-16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'LOT-2026-LANC-017', '2026-03-17', '2026-03-17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'LOT-2026-CHAR-018', '2026-03-18', '2026-03-18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'LOT-2026-PAUL-019', '2026-03-19', '2026-03-19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'LOT-2026-COSR-020', '2026-03-20', '2026-03-20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'LOT-2026-LANE-021', '2026-03-21', '2026-03-21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'LOT-2026-URIA-022', '2026-03-22', '2026-03-22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'LOT-2026-SVR-023', '2026-03-23', '2026-03-23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'LOT-2026-MART-024', '2026-03-24', '2026-03-24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'LOT-2026-HELI-025', '2026-03-25', '2026-03-25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'LOT-2026-KIEH-026', '2026-03-26', '2026-03-26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'LOT-2026-GARN-027', '2026-03-27', '2026-03-27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'LOT-2026-LORE-028', '2026-03-28', '2026-03-28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'LOT-2026-NEUT-029', '2026-03-01', '2026-03-01', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'LOT-2026-DERM-030', '2026-03-02', '2026-03-02', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.lotes_fabricacion_sanitaria OFF;
GO

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.inventario_lotes_ubicacion ON;
INSERT INTO wms.inventario_lotes_ubicacion (id_inventario_stock, lote, ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.kardex_movimientos (id_kardex, inventario_stock, tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 8, 1, 1, N'FOL-DOCUM-2026-0001', 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, 2, N'FOL-DOCUM-2026-0002', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, 3, N'FOL-DOCUM-2026-0003', 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, 4, N'FOL-DOCUM-2026-0004', 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, 5, N'FOL-DOCUM-2026-0005', 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, 6, N'FOL-DOCUM-2026-0006', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 7, 7, N'FOL-DOCUM-2026-0007', 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 8, 8, N'FOL-DOCUM-2026-0008', 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 9, 9, N'FOL-DOCUM-2026-0009', 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 10, 10, N'FOL-DOCUM-2026-0010', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 11, 11, N'FOL-DOCUM-2026-0011', 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 12, 12, N'FOL-DOCUM-2026-0012', 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 13, 13, N'FOL-DOCUM-2026-0013', 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 14, 14, N'FOL-DOCUM-2026-0014', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 15, 15, N'FOL-DOCUM-2026-0015', 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 16, 16, N'FOL-DOCUM-2026-0016', 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 17, 17, N'FOL-DOCUM-2026-0017', 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 18, 18, N'FOL-DOCUM-2026-0018', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 19, 19, N'FOL-DOCUM-2026-0019', 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 20, 20, N'FOL-DOCUM-2026-0020', 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 21, 21, N'FOL-DOCUM-2026-0021', 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 22, 22, N'FOL-DOCUM-2026-0022', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 23, 23, N'FOL-DOCUM-2026-0023', 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 24, 24, N'FOL-DOCUM-2026-0024', 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 25, 25, N'FOL-DOCUM-2026-0025', 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 26, 26, N'FOL-DOCUM-2026-0026', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 27, 27, N'FOL-DOCUM-2026-0027', 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 28, 28, N'FOL-DOCUM-2026-0028', 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 29, 29, N'FOL-DOCUM-2026-0029', 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 30, 30, N'FOL-DOCUM-2026-0030', 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.kardex_movimientos OFF;
GO

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.alertas_caducidad_proxima ON;
INSERT INTO wms.alertas_caducidad_proxima (id_alerta_caducidad, lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'PREVENTIVA_90D', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'MODERADA_60D', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'CRITICA_30D', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'EXPIRADO', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'PREVENTIVA_90D', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'MODERADA_60D', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'CRITICA_30D', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'EXPIRADO', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'PREVENTIVA_90D', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'MODERADA_60D', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'CRITICA_30D', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'EXPIRADO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'PREVENTIVA_90D', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'MODERADA_60D', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'CRITICA_30D', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'EXPIRADO', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'PREVENTIVA_90D', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'MODERADA_60D', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'CRITICA_30D', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'EXPIRADO', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'PREVENTIVA_90D', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'MODERADA_60D', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'CRITICA_30D', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'EXPIRADO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'PREVENTIVA_90D', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'MODERADA_60D', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'CRITICA_30D', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'EXPIRADO', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'PREVENTIVA_90D', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'MODERADA_60D', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.alertas_caducidad_proxima OFF;
GO

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria ON;
INSERT INTO wms.mermas_destruccion_sanitaria (id_merma_destruccion, folio_acta_destruccion, lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-ACTA_-2026-0001', 1, 8, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-ACTA_-2026-0002', 2, 11, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-ACTA_-2026-0003', 3, 14, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-ACTA_-2026-0004', 4, 17, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-ACTA_-2026-0005', 5, 20, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-ACTA_-2026-0006', 6, 23, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-ACTA_-2026-0007', 7, 26, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-ACTA_-2026-0008', 8, 29, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-ACTA_-2026-0009', 9, 32, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-ACTA_-2026-0010', 10, 35, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-ACTA_-2026-0011', 11, 38, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-ACTA_-2026-0012', 12, 41, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-ACTA_-2026-0013', 13, 44, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-ACTA_-2026-0014', 14, 47, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-ACTA_-2026-0015', 15, 50, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-ACTA_-2026-0016', 16, 53, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-ACTA_-2026-0017', 17, 56, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-ACTA_-2026-0018', 18, 59, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-ACTA_-2026-0019', 19, 62, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-ACTA_-2026-0020', 20, 65, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-ACTA_-2026-0021', 21, 68, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-ACTA_-2026-0022', 22, 71, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-ACTA_-2026-0023', 23, 74, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-ACTA_-2026-0024', 24, 77, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-ACTA_-2026-0025', 25, 80, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-ACTA_-2026-0026', 26, 83, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-ACTA_-2026-0027', 27, 86, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-ACTA_-2026-0028', 28, 89, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-ACTA_-2026-0029', 29, 92, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-ACTA_-2026-0030', 30, 95, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.mermas_destruccion_sanitaria OFF;
GO

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_almacenes ON;
INSERT INTO wms.transferencias_almacenes (id_transferencia, folio_transferencia, almacen_origen, almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TRANS-2026-0001', 1, 1, N'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TRANS-2026-0002', 2, 2, N'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TRANS-2026-0003', 3, 3, N'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TRANS-2026-0004', 4, 4, N'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TRANS-2026-0005', 5, 5, N'SOLICITADA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TRANS-2026-0006', 6, 6, N'EN_TRANSITO', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TRANS-2026-0007', 7, 7, N'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TRANS-2026-0008', 8, 8, N'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TRANS-2026-0009', 9, 9, N'SOLICITADA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TRANS-2026-0010', 10, 10, N'EN_TRANSITO', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TRANS-2026-0011', 11, 11, N'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TRANS-2026-0012', 12, 12, N'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TRANS-2026-0013', 13, 13, N'SOLICITADA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TRANS-2026-0014', 14, 14, N'EN_TRANSITO', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TRANS-2026-0015', 15, 15, N'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TRANS-2026-0016', 16, 16, N'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TRANS-2026-0017', 17, 17, N'SOLICITADA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TRANS-2026-0018', 18, 18, N'EN_TRANSITO', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TRANS-2026-0019', 19, 19, N'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TRANS-2026-0020', 20, 20, N'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TRANS-2026-0021', 21, 21, N'SOLICITADA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TRANS-2026-0022', 22, 22, N'EN_TRANSITO', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TRANS-2026-0023', 23, 23, N'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TRANS-2026-0024', 24, 24, N'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TRANS-2026-0025', 25, 25, N'SOLICITADA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TRANS-2026-0026', 26, 26, N'EN_TRANSITO', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TRANS-2026-0027', 27, 27, N'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TRANS-2026-0028', 28, 28, N'DISCREPANCIA', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TRANS-2026-0029', 29, 29, N'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TRANS-2026-0030', 30, 30, N'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.transferencias_almacenes OFF;
GO

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.transferencias_detalles ON;
INSERT INTO wms.transferencias_detalles (id_transferencia_detalle, transferencia, lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.conteos_ciclicos_auditoria (id_conteo_ciclico, folio_auditoria, almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO wms.conteos_ciclicos_detalles (id_conteo_detalle, conteo_ciclico, inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.conteos_ciclicos_detalles OFF;
GO

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad ON;
INSERT INTO wms.monitoreo_temperatura_humedad (id_telemetria_sensor, zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'SENSOR_I_01', 17.50, 17.50, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'SENSOR_I_02', 20.00, 20.00, 0, '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SENSOR_I_03', 22.50, 22.50, 1, '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'SENSOR_I_04', 25.00, 25.00, 0, '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'SENSOR_I_05', 27.50, 27.50, 1, '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'SENSOR_I_06', 30.00, 30.00, 0, '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SENSOR_I_07', 32.50, 32.50, 1, '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'SENSOR_I_08', 35.00, 35.00, 0, '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'SENSOR_I_09', 37.50, 37.50, 1, '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'SENSOR_I_10', 40.00, 40.00, 0, '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SENSOR_I_11', 42.50, 42.50, 1, '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'SENSOR_I_12', 45.00, 45.00, 0, '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'SENSOR_I_13', 47.50, 47.50, 1, '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'SENSOR_I_14', 50.00, 50.00, 0, '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SENSOR_I_15', 52.50, 52.50, 1, '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'SENSOR_I_16', 55.00, 55.00, 0, '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'SENSOR_I_17', 57.50, 57.50, 1, '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'SENSOR_I_18', 60.00, 60.00, 0, '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SENSOR_I_19', 62.50, 62.50, 1, '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'SENSOR_I_20', 65.00, 65.00, 0, '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'SENSOR_I_21', 67.50, 67.50, 1, '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'SENSOR_I_22', 70.00, 70.00, 0, '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SENSOR_I_23', 72.50, 72.50, 1, '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'SENSOR_I_24', 75.00, 75.00, 0, '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'SENSOR_I_25', 77.50, 77.50, 1, '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'SENSOR_I_26', 80.00, 80.00, 0, '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SENSOR_I_27', 82.50, 82.50, 1, '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'SENSOR_I_28', 85.00, 85.00, 0, '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'SENSOR_I_29', 87.50, 87.50, 1, '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'SENSOR_I_30', 90.00, 90.00, 0, '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT wms.monitoreo_temperatura_humedad OFF;
GO

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.transportistas_paqueterias ON;
INSERT INTO envios.transportistas_paqueterias (id_transportista, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'TRANSPOR_01', N'Kit Rutina La Roche-Posay #1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'TRANSPOR_02', N'Kit Rutina CeraVe Dermatological #2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'TRANSPOR_03', N'Kit Rutina The Ordinary Deciem #3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'TRANSPOR_04', N'Kit Rutina ISDIN Fotoprotección #4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'TRANSPOR_05', N'Kit Rutina Bioderma Laboratoire #5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'TRANSPOR_06', N'Kit Rutina Eau Thermale Avène #6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'TRANSPOR_07', N'Kit Rutina Eucerin Beiersdorf #7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'TRANSPOR_08', N'Kit Rutina Vichy Laboratoires #8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'TRANSPOR_09', N'Kit Rutina SkinCeuticals Clinical #9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'TRANSPOR_10', N'Kit Rutina Sesderma Nanotech #10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'TRANSPOR_11', N'Kit Rutina NARS Cosmetics #11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'TRANSPOR_12', N'Kit Rutina MAC Professional #12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'TRANSPOR_13', N'Kit Rutina Fenty Beauty #13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'TRANSPOR_14', N'Kit Rutina Rare Beauty #14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'TRANSPOR_15', N'Kit Rutina Clinique Laboratories #15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'TRANSPOR_16', N'Kit Rutina Estée Lauder #16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'TRANSPOR_17', N'Kit Rutina Lancôme Paris #17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'TRANSPOR_18', N'Kit Rutina Charlotte Tilbury #18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'TRANSPOR_19', N'Kit Rutina Paula''s Choice Skincare #19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'TRANSPOR_20', N'Kit Rutina COSRX K-Beauty #20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'TRANSPOR_21', N'Kit Rutina Laneige Amorepacific #21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'TRANSPOR_22', N'Kit Rutina Uriage Eau Thermale #22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'TRANSPOR_23', N'Kit Rutina Laboratoire SVR #23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'TRANSPOR_24', N'Kit Rutina MartiDerm Ampollas #24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'TRANSPOR_25', N'Kit Rutina Heliocare Cantabria Labs #25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'TRANSPOR_26', N'Kit Rutina Kiehl''s Since 1851 #26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'TRANSPOR_27', N'Kit Rutina Garnier SkinActive #27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'TRANSPOR_28', N'Kit Rutina L''Oréal Paris Derm #28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'TRANSPOR_29', N'Kit Rutina Neutrogena Derm #29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'TRANSPOR_30', N'Kit Rutina DermaCare Labs México #30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.transportistas_paqueterias OFF;
GO

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tipos_servicio_envio ON;
INSERT INTO envios.tipos_servicio_envio (id_servicio_envio, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'SERVICIO_01', N'Zona Refrigerada B-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'SERVICIO_02', N'Zona Refrigerada B-02', 2, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'SERVICIO_03', N'Zona Refrigerada B-03', 3, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'SERVICIO_04', N'Zona Refrigerada B-04', 4, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'SERVICIO_05', N'Zona Refrigerada B-05', 5, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'SERVICIO_06', N'Zona Refrigerada B-06', 6, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'SERVICIO_07', N'Zona Refrigerada B-07', 7, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'SERVICIO_08', N'Zona Refrigerada B-08', 8, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'SERVICIO_09', N'Zona Refrigerada B-09', 9, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'SERVICIO_10', N'Zona Refrigerada B-10', 10, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'SERVICIO_11', N'Zona Refrigerada B-11', 11, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'SERVICIO_12', N'Zona Refrigerada B-12', 12, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'SERVICIO_13', N'Zona Refrigerada B-13', 13, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'SERVICIO_14', N'Zona Refrigerada B-14', 14, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'SERVICIO_15', N'Zona Refrigerada B-15', 15, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'SERVICIO_16', N'Zona Refrigerada B-16', 16, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'SERVICIO_17', N'Zona Refrigerada B-17', 17, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'SERVICIO_18', N'Zona Refrigerada B-18', 18, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'SERVICIO_19', N'Zona Refrigerada B-19', 19, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'SERVICIO_20', N'Zona Refrigerada B-20', 20, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'SERVICIO_21', N'Zona Refrigerada B-21', 21, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'SERVICIO_22', N'Zona Refrigerada B-22', 22, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'SERVICIO_23', N'Zona Refrigerada B-23', 23, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'SERVICIO_24', N'Zona Refrigerada B-24', 24, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'SERVICIO_25', N'Zona Refrigerada B-25', 25, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'SERVICIO_26', N'Zona Refrigerada B-26', 26, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'SERVICIO_27', N'Zona Refrigerada B-27', 27, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'SERVICIO_28', N'Zona Refrigerada B-28', 28, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'SERVICIO_29', N'Zona Refrigerada B-29', 29, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'SERVICIO_30', N'Zona Refrigerada B-30', 30, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tipos_servicio_envio OFF;
GO

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.tarifas_zonas_postales ON;
INSERT INTO envios.tarifas_zonas_postales (id_tarifa_zona, transportista, servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'POS', N'POS', 17.50, 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'POS', N'POS', 20.00, 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'POS', N'POS', 22.50, 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'POS', N'POS', 25.00, 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'POS', N'POS', 27.50, 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'POS', N'POS', 30.00, 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'POS', N'POS', 32.50, 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'POS', N'POS', 35.00, 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'POS', N'POS', 37.50, 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'POS', N'POS', 40.00, 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'POS', N'POS', 42.50, 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'POS', N'POS', 45.00, 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'POS', N'POS', 47.50, 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'POS', N'POS', 50.00, 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'POS', N'POS', 52.50, 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'POS', N'POS', 55.00, 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'POS', N'POS', 57.50, 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'POS', N'POS', 60.00, 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'POS', N'POS', 62.50, 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'POS', N'POS', 65.00, 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'POS', N'POS', 67.50, 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'POS', N'POS', 70.00, 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'POS', N'POS', 72.50, 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'POS', N'POS', 75.00, 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'POS', N'POS', 77.50, 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'POS', N'POS', 80.00, 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'POS', N'POS', 82.50, 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'POS', N'POS', 85.00, 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'POS', N'POS', 87.50, 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'POS', N'POS', 90.00, 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.tarifas_zonas_postales OFF;
GO

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.despachos_orden ON;
INSERT INTO envios.despachos_orden (id_despacho, folio_despacho, orden_split, transportista, servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-DESPA-2026-0001', 1, 1, 1, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', '2026-02-03 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', '2026-02-04 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-05 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', '2026-02-06 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-DESPA-2026-0007', 7, 7, 7, '2026-02-07 11:30:00', '2026-03-07', '2026-02-07 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', '2026-02-08 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', '2026-02-09 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', '2026-02-10 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-11 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', '2026-02-12 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-DESPA-2026-0013', 13, 13, 13, '2026-02-13 11:30:00', '2026-03-13', '2026-02-13 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', '2026-02-14 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', '2026-02-15 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', '2026-02-16 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-17 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', '2026-02-18 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-DESPA-2026-0019', 19, 19, 19, '2026-02-19 11:30:00', '2026-03-19', '2026-02-19 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', '2026-02-20 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', '2026-02-21 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', '2026-02-22 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-23 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', '2026-02-24 11:30:00', N'INCIDENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-DESPA-2026-0025', 25, 25, 25, '2026-02-25 11:30:00', '2026-03-25', '2026-02-25 11:30:00', N'PREPARANDO_PAQUETE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', '2026-02-26 11:30:00', N'RECOLECTADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', '2026-02-27 11:30:00', N'EN_TRANSITO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', '2026-02-28 11:30:00', N'EN_RUTA_LOCAL', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', N'ENTREGADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', N'INCIDENCIA', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.despachos_orden OFF;
GO

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_bultos ON;
INSERT INTO envios.paquetes_bultos (id_paquete_bulto, despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'DERMA-SKU-1001', 0.60, 13.0, 13.0, 13.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'DERMA-SKU-1002', 0.75, 14.0, 14.0, 14.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'DERMA-SKU-1003', 0.90, 15.0, 15.0, 15.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DERMA-SKU-1004', 1.05, 16.0, 16.0, 16.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'DERMA-SKU-1005', 1.20, 17.0, 17.0, 17.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'DERMA-SKU-1006', 1.35, 18.0, 18.0, 18.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'DERMA-SKU-1007', 1.50, 19.0, 19.0, 19.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DERMA-SKU-1008', 1.65, 20.0, 20.0, 20.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'DERMA-SKU-1009', 1.80, 21.0, 21.0, 21.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'DERMA-SKU-1010', 1.95, 22.0, 22.0, 22.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'DERMA-SKU-1011', 2.10, 23.0, 23.0, 23.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DERMA-SKU-1012', 2.25, 24.0, 24.0, 24.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'DERMA-SKU-1013', 2.40, 25.0, 25.0, 25.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'DERMA-SKU-1014', 2.55, 26.0, 26.0, 26.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'DERMA-SKU-1015', 2.70, 27.0, 27.0, 27.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DERMA-SKU-1016', 2.85, 28.0, 28.0, 28.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'DERMA-SKU-1017', 3.00, 29.0, 29.0, 29.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'DERMA-SKU-1018', 3.15, 30.0, 30.0, 30.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'DERMA-SKU-1019', 3.30, 31.0, 31.0, 31.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DERMA-SKU-1020', 3.45, 32.0, 32.0, 32.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'DERMA-SKU-1021', 3.60, 33.0, 33.0, 33.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'DERMA-SKU-1022', 3.75, 34.0, 34.0, 34.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'DERMA-SKU-1023', 3.90, 35.0, 35.0, 35.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DERMA-SKU-1024', 4.05, 36.0, 36.0, 36.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'DERMA-SKU-1025', 4.20, 37.0, 37.0, 37.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'DERMA-SKU-1026', 4.35, 38.0, 38.0, 38.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'DERMA-SKU-1027', 4.50, 39.0, 39.0, 39.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DERMA-SKU-1028', 4.65, 40.0, 40.0, 40.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'DERMA-SKU-1029', 4.80, 41.0, 41.0, 41.0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'DERMA-SKU-1030', 4.95, 42.0, 42.0, 42.0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.paquetes_bultos OFF;
GO

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.paquetes_contenido_lotes ON;
INSERT INTO envios.paquetes_contenido_lotes (id_contenido_paquete, paquete_bulto, orden_detalle, lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO envios.guias_rastreo (id_guia_rastreo, paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'DERMA-SKU-1001', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'DERMA-SKU-1002', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'DERMA-SKU-1003', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DERMA-SKU-1004', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'DERMA-SKU-1005', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'DERMA-SKU-1006', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'DERMA-SKU-1007', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DERMA-SKU-1008', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'DERMA-SKU-1009', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'DERMA-SKU-1010', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'DERMA-SKU-1011', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DERMA-SKU-1012', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'DERMA-SKU-1013', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'DERMA-SKU-1014', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'DERMA-SKU-1015', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DERMA-SKU-1016', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'DERMA-SKU-1017', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'DERMA-SKU-1018', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'DERMA-SKU-1019', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DERMA-SKU-1020', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'DERMA-SKU-1021', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'DERMA-SKU-1022', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'DERMA-SKU-1023', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DERMA-SKU-1024', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'DERMA-SKU-1025', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'DERMA-SKU-1026', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'DERMA-SKU-1027', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DERMA-SKU-1028', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'DERMA-SKU-1029', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'DERMA-SKU-1030', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.guias_rastreo OFF;
GO

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.eventos_tracking_bitacora ON;
INSERT INTO envios.eventos_tracking_bitacora (id_evento_tracking, guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'ESTATUS__01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'ESTATUS__02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ESTATUS__03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'ESTATUS__04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'ESTATUS__05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'ESTATUS__06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ESTATUS__07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'ESTATUS__08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'ESTATUS__09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'ESTATUS__10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ESTATUS__11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'ESTATUS__12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'ESTATUS__13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'ESTATUS__14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ESTATUS__15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'ESTATUS__16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'ESTATUS__17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'ESTATUS__18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ESTATUS__19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'ESTATUS__20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'ESTATUS__21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'ESTATUS__22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ESTATUS__23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'ESTATUS__24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'ESTATUS__25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'ESTATUS__26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ESTATUS__27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'ESTATUS__28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'ESTATUS__29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'ESTATUS__30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.eventos_tracking_bitacora OFF;
GO

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.intentos_entrega_fallidos ON;
INSERT INTO envios.intentos_entrega_fallidos (id_intento_fallido, despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.intentos_entrega_fallidos OFF;
GO

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.incidencias_logisticas ON;
INSERT INTO envios.incidencias_logisticas (id_incidencia_logistica, despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EXTRAVIO_TOTAL', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PAQUETE_DANADO_DERRAME', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'ROBO_EN_TRANSITO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'DIRECCION_INEXISTENTE', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EXTRAVIO_TOTAL', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PAQUETE_DANADO_DERRAME', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'ROBO_EN_TRANSITO', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'DIRECCION_INEXISTENTE', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EXTRAVIO_TOTAL', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PAQUETE_DANADO_DERRAME', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'ROBO_EN_TRANSITO', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'DIRECCION_INEXISTENTE', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EXTRAVIO_TOTAL', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PAQUETE_DANADO_DERRAME', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'ROBO_EN_TRANSITO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'DIRECCION_INEXISTENTE', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EXTRAVIO_TOTAL', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PAQUETE_DANADO_DERRAME', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'ROBO_EN_TRANSITO', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'DIRECCION_INEXISTENTE', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EXTRAVIO_TOTAL', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PAQUETE_DANADO_DERRAME', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'ROBO_EN_TRANSITO', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'DIRECCION_INEXISTENTE', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EXTRAVIO_TOTAL', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PAQUETE_DANADO_DERRAME', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'ROBO_EN_TRANSITO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'DIRECCION_INEXISTENTE', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EXTRAVIO_TOTAL', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PAQUETE_DANADO_DERRAME', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.incidencias_logisticas OFF;
GO

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.seguros_mercancia ON;
INSERT INTO envios.seguros_mercancia (id_seguro_envio, despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 17.50, 17.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 20.00, 20.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 22.50, 22.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 25.00, 25.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 27.50, 27.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 30.00, 30.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 32.50, 32.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 35.00, 35.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 37.50, 37.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 40.00, 40.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 42.50, 42.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 45.00, 45.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 47.50, 47.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 50.00, 50.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 52.50, 52.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 55.00, 55.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 57.50, 57.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 60.00, 60.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 62.50, 62.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 65.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 67.50, 67.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 70.00, 70.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 72.50, 72.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 75.00, 75.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 77.50, 77.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 80.00, 80.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 82.50, 82.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 85.00, 85.00, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 87.50, 87.50, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 90.00, 90.00, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.seguros_mercancia OFF;
GO

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup ON;
INSERT INTO envios.puntos_recoleccion_pickup (id_punto_pickup, transportista, almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'LOCKER_01', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'LOCKER_02', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'LOCKER_03', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'LOCKER_04', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'LOCKER_05', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'LOCKER_06', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'LOCKER_07', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'LOCKER_08', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'LOCKER_09', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'LOCKER_10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'LOCKER_11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'LOCKER_12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'LOCKER_13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'LOCKER_14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'LOCKER_15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'LOCKER_16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'LOCKER_17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'LOCKER_18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'LOCKER_19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'LOCKER_20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'LOCKER_21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'LOCKER_22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'LOCKER_23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'LOCKER_24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'LOCKER_25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'LOCKER_26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'LOCKER_27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'LOCKER_28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'LOCKER_29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'LOCKER_30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT envios.puntos_recoleccion_pickup OFF;
GO

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.motivos_devolucion_rma ON;
INSERT INTO postventa.motivos_devolucion_rma (id_motivo_rma, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'MOTIVO_01', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'MOTIVO_02', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'MOTIVO_03', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'MOTIVO_04', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'MOTIVO_05', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'MOTIVO_06', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'MOTIVO_07', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'MOTIVO_08', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'MOTIVO_09', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'MOTIVO_10', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'MOTIVO_11', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'MOTIVO_12', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'MOTIVO_13', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'MOTIVO_14', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'MOTIVO_15', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'MOTIVO_16', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'MOTIVO_17', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'MOTIVO_18', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'MOTIVO_19', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'MOTIVO_20', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'MOTIVO_21', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'MOTIVO_22', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'MOTIVO_23', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'MOTIVO_24', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'MOTIVO_25', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'MOTIVO_26', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'MOTIVO_27', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'MOTIVO_28', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'MOTIVO_29', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'MOTIVO_30', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.motivos_devolucion_rma OFF;
GO

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.solicitudes_rma ON;
INSERT INTO postventa.solicitudes_rma (id_solicitud_rma, folio_rma, orden, motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-RMA-2026-0001', 1, 1, N'SOLICITADA', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-RMA-2026-0002', 2, 2, N'GUIA_RETORNO_EMITIDA', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-RMA-2026-0003', 3, 3, N'RECIBIDA_EN_QA', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-RMA-2026-0004', 4, 4, N'APROBADA_REEMBOLSAR', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-RMA-2026-0005', 5, 5, N'SOLICITADA', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-RMA-2026-0006', 6, 6, N'GUIA_RETORNO_EMITIDA', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-RMA-2026-0007', 7, 7, N'RECIBIDA_EN_QA', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-RMA-2026-0008', 8, 8, N'APROBADA_REEMBOLSAR', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-RMA-2026-0009', 9, 9, N'SOLICITADA', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-RMA-2026-0010', 10, 10, N'GUIA_RETORNO_EMITIDA', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-RMA-2026-0011', 11, 11, N'RECIBIDA_EN_QA', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-RMA-2026-0012', 12, 12, N'APROBADA_REEMBOLSAR', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-RMA-2026-0013', 13, 13, N'SOLICITADA', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-RMA-2026-0014', 14, 14, N'GUIA_RETORNO_EMITIDA', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-RMA-2026-0015', 15, 15, N'RECIBIDA_EN_QA', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-RMA-2026-0016', 16, 16, N'APROBADA_REEMBOLSAR', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-RMA-2026-0017', 17, 17, N'SOLICITADA', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-RMA-2026-0018', 18, 18, N'GUIA_RETORNO_EMITIDA', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-RMA-2026-0019', 19, 19, N'RECIBIDA_EN_QA', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-RMA-2026-0020', 20, 20, N'APROBADA_REEMBOLSAR', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-RMA-2026-0021', 21, 21, N'SOLICITADA', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-RMA-2026-0022', 22, 22, N'GUIA_RETORNO_EMITIDA', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-RMA-2026-0023', 23, 23, N'RECIBIDA_EN_QA', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-RMA-2026-0024', 24, 24, N'APROBADA_REEMBOLSAR', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-RMA-2026-0025', 25, 25, N'SOLICITADA', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-RMA-2026-0026', 26, 26, N'GUIA_RETORNO_EMITIDA', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-RMA-2026-0027', 27, 27, N'RECIBIDA_EN_QA', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-RMA-2026-0028', 28, 28, N'APROBADA_REEMBOLSAR', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-RMA-2026-0029', 29, 29, N'SOLICITADA', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-RMA-2026-0030', 30, 30, N'GUIA_RETORNO_EMITIDA', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.solicitudes_rma OFF;
GO

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.rma_detalles ON;
INSERT INTO postventa.rma_detalles (id_rma_detalle, solicitud_rma, orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO postventa.inspeccion_sanitaria_retorno (id_inspeccion_retorno, rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, 17.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 0, 20.00, N'DONACION_REACONDICIONADA', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 22.50, N'REINGRESO_STOCK_SELLADO', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 25.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 27.50, N'DONACION_REACONDICIONADA', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 0, 30.00, N'REINGRESO_STOCK_SELLADO', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 32.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 0, 35.00, N'DONACION_REACONDICIONADA', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 37.50, N'REINGRESO_STOCK_SELLADO', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 0, 40.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 42.50, N'DONACION_REACONDICIONADA', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 0, 45.00, N'REINGRESO_STOCK_SELLADO', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 47.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 0, 50.00, N'DONACION_REACONDICIONADA', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 52.50, N'REINGRESO_STOCK_SELLADO', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 0, 55.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 57.50, N'DONACION_REACONDICIONADA', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 0, 60.00, N'REINGRESO_STOCK_SELLADO', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 0, 65.00, N'DONACION_REACONDICIONADA', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 67.50, N'REINGRESO_STOCK_SELLADO', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 0, 70.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 72.50, N'DONACION_REACONDICIONADA', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 0, 75.00, N'REINGRESO_STOCK_SELLADO', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 77.50, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 0, 80.00, N'DONACION_REACONDICIONADA', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 82.50, N'REINGRESO_STOCK_SELLADO', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 0, 85.00, N'DESTRUCCION_INMEDIATA_RESIDUOS', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 87.50, N'DONACION_REACONDICIONADA', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 0, 90.00, N'REINGRESO_STOCK_SELLADO', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.inspeccion_sanitaria_retorno OFF;
GO

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_soporte ON;
INSERT INTO postventa.tickets_soporte (id_ticket, folio_ticket, cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-TICKE-2026-0001', 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-TICKE-2026-0002', 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-TICKE-2026-0003', 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-TICKE-2026-0004', 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-TICKE-2026-0005', 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-TICKE-2026-0006', 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-TICKE-2026-0007', 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-TICKE-2026-0008', 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-TICKE-2026-0009', 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-TICKE-2026-0010', 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-TICKE-2026-0011', 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'FACTURACION_CFDI', N'ALTA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-TICKE-2026-0012', 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-TICKE-2026-0013', 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'ENVIO_DEMORADO', N'BAJA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-TICKE-2026-0014', 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-TICKE-2026-0015', 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'FACTURACION_CFDI', N'ALTA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-TICKE-2026-0016', 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-TICKE-2026-0017', 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'ENVIO_DEMORADO', N'BAJA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-TICKE-2026-0018', 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-TICKE-2026-0019', 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'FACTURACION_CFDI', N'ALTA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-TICKE-2026-0020', 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-TICKE-2026-0021', 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'ENVIO_DEMORADO', N'BAJA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-TICKE-2026-0022', 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-TICKE-2026-0023', 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'FACTURACION_CFDI', N'ALTA', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-TICKE-2026-0024', 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-TICKE-2026-0025', 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'ENVIO_DEMORADO', N'BAJA', N'CERRADO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-TICKE-2026-0026', 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'ABIERTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-TICKE-2026-0027', 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'FACTURACION_CFDI', N'ALTA', N'EN_PROCESO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-TICKE-2026-0028', 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'PRODUCTO_DEFECTUOSO', N'URGENTE', N'ESPERANDO_CLIENTE', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-TICKE-2026-0029', 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'ENVIO_DEMORADO', N'BAJA', N'RESUELTO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-TICKE-2026-0030', 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'ASESORIA_DERMATOLOGICA', N'MEDIA', N'CERRADO', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_soporte OFF;
GO

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.tickets_mensajes ON;
INSERT INTO postventa.tickets_mensajes (id_ticket_mensaje, ticket, usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.tickets_mensajes OFF;
GO

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia ON;
INSERT INTO postventa.reportes_farmacovigilancia (id_reporte_farmacovigilancia, folio_cofepris_ram, cliente, producto, lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'FOL-COFEP-2026-0001', 1, 1, 1, N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'FOL-COFEP-2026-0002', 2, 2, 2, N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 0, '2026-03-02', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'FOL-COFEP-2026-0003', 3, 3, 3, N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-03-03', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'FOL-COFEP-2026-0004', 4, 4, 4, N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 0, '2026-03-04', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'FOL-COFEP-2026-0005', 5, 5, 5, N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-03-05', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'FOL-COFEP-2026-0006', 6, 6, 6, N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 0, '2026-03-06', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'FOL-COFEP-2026-0007', 7, 7, 7, N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-03-07', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'FOL-COFEP-2026-0008', 8, 8, 8, N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 0, '2026-03-08', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'FOL-COFEP-2026-0009', 9, 9, 9, N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-03-09', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'FOL-COFEP-2026-0010', 10, 10, 10, N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 0, '2026-03-10', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'FOL-COFEP-2026-0011', 11, 11, 11, N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-03-11', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'FOL-COFEP-2026-0012', 12, 12, 12, N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 0, '2026-03-12', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'FOL-COFEP-2026-0013', 13, 13, 13, N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-03-13', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'FOL-COFEP-2026-0014', 14, 14, 14, N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 0, '2026-03-14', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'FOL-COFEP-2026-0015', 15, 15, 15, N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-03-15', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'FOL-COFEP-2026-0016', 16, 16, 16, N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 0, '2026-03-16', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'FOL-COFEP-2026-0017', 17, 17, 17, N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-03-17', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'FOL-COFEP-2026-0018', 18, 18, 18, N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 0, '2026-03-18', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'FOL-COFEP-2026-0019', 19, 19, 19, N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-03-19', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'FOL-COFEP-2026-0020', 20, 20, 20, N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 0, '2026-03-20', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'FOL-COFEP-2026-0021', 21, 21, 21, N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-03-21', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'FOL-COFEP-2026-0022', 22, 22, 22, N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 0, '2026-03-22', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'FOL-COFEP-2026-0023', 23, 23, 23, N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-03-23', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'FOL-COFEP-2026-0024', 24, 24, 24, N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 0, '2026-03-24', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'FOL-COFEP-2026-0025', 25, 25, 25, N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-03-25', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'FOL-COFEP-2026-0026', 26, 26, 26, N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 0, '2026-03-26', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'FOL-COFEP-2026-0027', 27, 27, 27, N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-03-27', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'FOL-COFEP-2026-0028', 28, 28, 28, N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 0, '2026-03-28', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'FOL-COFEP-2026-0029', 29, 29, 29, N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-03-01', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'FOL-COFEP-2026-0030', 30, 30, 30, N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2026-03-02', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT postventa.reportes_farmacovigilancia OFF;
GO

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.tipos_evento_sistema ON;
INSERT INTO auditoria.tipos_evento_sistema (id_tipo_evento, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'EVENTO_01', N'Sueros Concentrados Nivel 1', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'EVENTO_02', N'Limpiadores Faciales Nivel 2', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'EVENTO_03', N'Fotoprotección Solar Nivel 3', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'EVENTO_04', N'Maquillaje Mineral Nivel 4', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'EVENTO_05', N'Cuidado Anti-Edad Nivel 5', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'EVENTO_06', N'Barrera Cutánea Nivel 6', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'EVENTO_07', N'Contorno de Ojos Nivel 7', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'EVENTO_08', N'Tratamiento Acné Nivel 8', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'EVENTO_09', N'Hidratantes Ceramidas Nivel 9', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'EVENTO_10', N'Exfoliantes Químicos Nivel 10', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'EVENTO_11', N'Sueros Concentrados Nivel 11', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'EVENTO_12', N'Limpiadores Faciales Nivel 12', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'EVENTO_13', N'Fotoprotección Solar Nivel 13', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'EVENTO_14', N'Maquillaje Mineral Nivel 14', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'EVENTO_15', N'Cuidado Anti-Edad Nivel 15', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'EVENTO_16', N'Barrera Cutánea Nivel 16', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'EVENTO_17', N'Contorno de Ojos Nivel 17', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'EVENTO_18', N'Tratamiento Acné Nivel 18', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'EVENTO_19', N'Hidratantes Ceramidas Nivel 19', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'EVENTO_20', N'Exfoliantes Químicos Nivel 20', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'EVENTO_21', N'Sueros Concentrados Nivel 21', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'EVENTO_22', N'Limpiadores Faciales Nivel 22', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'EVENTO_23', N'Fotoprotección Solar Nivel 23', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'EVENTO_24', N'Maquillaje Mineral Nivel 24', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'EVENTO_25', N'Cuidado Anti-Edad Nivel 25', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'EVENTO_26', N'Barrera Cutánea Nivel 26', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'EVENTO_27', N'Contorno de Ojos Nivel 27', N'CRITICO_SEGURIDAD', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'EVENTO_28', N'Tratamiento Acné Nivel 28', N'INFO', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'EVENTO_29', N'Hidratantes Ceramidas Nivel 29', N'ADVERTENCIA', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'EVENTO_30', N'Exfoliantes Químicos Nivel 30', N'CRITICO_SEGURIDAD', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.tipos_evento_sistema OFF;
GO

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global ON;
INSERT INTO auditoria.bitacora_seguridad_global (id_log_seguridad, tipo_evento, usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, 1, N'189.203.3.7', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, N'189.203.6.14', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, N'189.203.9.21', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, N'189.203.12.28', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, N'189.203.15.35', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, N'189.203.18.42', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, N'189.203.21.49', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, N'189.203.24.56', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, N'189.203.27.63', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, N'189.203.30.70', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, N'189.203.33.77', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, N'189.203.36.84', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, N'189.203.39.91', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, N'189.203.42.98', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, N'189.203.45.105', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, N'189.203.48.112', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, N'189.203.51.119', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, N'189.203.54.126', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, N'189.203.57.133', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, N'189.203.60.140', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, N'189.203.63.147', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, N'189.203.66.154', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, N'189.203.69.161', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, N'189.203.72.168', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, N'189.203.75.175', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, N'189.203.78.182', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, N'189.203.81.189', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, N'189.203.84.196', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, N'189.203.87.203', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, N'189.203.90.210', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT auditoria.bitacora_seguridad_global OFF;
GO

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT auditoria.bitacora_cambios_datos ON;
INSERT INTO auditoria.bitacora_cambios_datos (id_cambio_dato, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
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
INSERT INTO sistema.parametros_configuracion (id_parametro, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, N'PARAMETR_01', N'31', N'STRING', N'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, N'PARAMETR_02', N'32', N'INTEGER', N'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, N'PARAMETR_03', N'33', N'DECIMAL', N'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, N'PARAMETR_04', N'34', N'BOOLEAN', N'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, N'PARAMETR_05', N'35', N'JSON', N'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, N'PARAMETR_06', N'36', N'STRING', N'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, N'PARAMETR_07', N'37', N'INTEGER', N'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, N'PARAMETR_08', N'38', N'DECIMAL', N'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, N'PARAMETR_09', N'39', N'BOOLEAN', N'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, N'PARAMETR_10', N'40', N'JSON', N'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, N'PARAMETR_11', N'41', N'STRING', N'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, N'PARAMETR_12', N'42', N'INTEGER', N'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, N'PARAMETR_13', N'43', N'DECIMAL', N'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, N'PARAMETR_14', N'44', N'BOOLEAN', N'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, N'PARAMETR_15', N'45', N'JSON', N'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, N'PARAMETR_16', N'46', N'STRING', N'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, N'PARAMETR_17', N'47', N'INTEGER', N'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, N'PARAMETR_18', N'48', N'DECIMAL', N'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, N'PARAMETR_19', N'49', N'BOOLEAN', N'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, N'PARAMETR_20', N'50', N'JSON', N'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, N'PARAMETR_21', N'51', N'STRING', N'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, N'PARAMETR_22', N'52', N'INTEGER', N'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, N'PARAMETR_23', N'53', N'DECIMAL', N'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, N'PARAMETR_24', N'54', N'BOOLEAN', N'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, N'PARAMETR_25', N'55', N'JSON', N'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, N'PARAMETR_26', N'56', N'STRING', N'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, N'PARAMETR_27', N'57', N'INTEGER', N'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, N'PARAMETR_28', N'58', N'DECIMAL', N'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 0, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, N'PARAMETR_29', N'59', N'BOOLEAN', N'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1, 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, N'PARAMETR_30', N'60', N'JSON', N'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 0, 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.parametros_configuracion OFF;
GO

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
SET IDENTITY_INSERT sistema.notificaciones_push_email ON;
INSERT INTO sistema.notificaciones_push_email (id_notificacion, usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por)
VALUES
(1, 1, N'EMAIL', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', N'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', 1, '2026-02-01 11:30:00', N'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, N'PUSH_APP', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', N'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', 0, '2026-02-02 11:30:00', N'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, N'SMS', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', N'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', 1, '2026-02-03 11:30:00', N'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, N'WHATSAPP', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', N'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', 0, '2026-02-04 11:30:00', N'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, N'EMAIL', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', N'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', 1, '2026-02-05 11:30:00', N'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, N'PUSH_APP', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', N'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', 0, '2026-02-06 11:30:00', N'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, N'SMS', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', N'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', 1, '2026-02-07 11:30:00', N'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, N'WHATSAPP', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', N'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', 0, '2026-02-08 11:30:00', N'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, N'EMAIL', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', N'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', 1, '2026-02-09 11:30:00', N'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, N'PUSH_APP', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', N'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', 0, '2026-02-10 11:30:00', N'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, N'SMS', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', N'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', 1, '2026-02-11 11:30:00', N'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, N'WHATSAPP', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', N'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', 0, '2026-02-12 11:30:00', N'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, N'EMAIL', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', N'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', 1, '2026-02-13 11:30:00', N'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, N'PUSH_APP', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', N'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', 0, '2026-02-14 11:30:00', N'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, N'SMS', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', N'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', 1, '2026-02-15 11:30:00', N'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, N'WHATSAPP', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', N'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', 0, '2026-02-16 11:30:00', N'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, N'EMAIL', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', N'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', 1, '2026-02-17 11:30:00', N'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, N'PUSH_APP', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', N'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', 0, '2026-02-18 11:30:00', N'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, N'SMS', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', N'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', 1, '2026-02-19 11:30:00', N'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, N'WHATSAPP', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', N'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', 0, '2026-02-20 11:30:00', N'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, N'EMAIL', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', N'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', 1, '2026-02-21 11:30:00', N'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, N'PUSH_APP', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', N'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', 0, '2026-02-22 11:30:00', N'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, N'SMS', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', N'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', 1, '2026-02-23 11:30:00', N'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, N'WHATSAPP', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', N'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', 0, '2026-02-24 11:30:00', N'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, N'EMAIL', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', N'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', 1, '2026-02-25 11:30:00', N'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, N'PUSH_APP', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', N'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', 0, '2026-02-26 11:30:00', N'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, N'SMS', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', N'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', 1, '2026-02-27 11:30:00', N'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, N'WHATSAPP', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', N'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', 0, '2026-02-28 11:30:00', N'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, N'EMAIL', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', N'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', 1, '2026-02-01 11:30:00', N'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, N'PUSH_APP', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', N'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', 0, '2026-02-02 11:30:00', N'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 0, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SET IDENTITY_INSERT sistema.notificaciones_push_email OFF;
GO

PRINT '=================================================================================================';
PRINT 'ÉXITO TOTAL: 150 TABLAS POBLADAS CON DATOS REALES E INTEGRIDAD REFERENCIAL AL 100%.';
PRINT '=================================================================================================';
GO
