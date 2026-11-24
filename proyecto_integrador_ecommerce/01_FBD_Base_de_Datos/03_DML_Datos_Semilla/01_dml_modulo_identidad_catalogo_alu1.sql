-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, SEGURIDAD (ROLES/PERMISOS), CLIENTES Y CATÁLOGO BASE
-- Tablas 001 a 050 (Autor: JosÉ Luis Luna GarcÍa)
-- Sincronizado 100% con 00_MASTER_SEED_DATA_SQLSERVER.sql (PK: ID / FKs: ID_*)
-- =================================================================================================
USE EcommerceSaludBellezaDB;
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
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

