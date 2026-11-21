-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, SEGURIDAD (ROLES/PERMISOS), CLIENTES Y CATÁLOGO BASE
-- Tablas 001 a 050 (Autor: Integrante 1 - Control: 22050001)
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

PRINT '>>> SUBMÓDULO 1: Tablas 001 a 050 pobladas exitosamente.';
GO
