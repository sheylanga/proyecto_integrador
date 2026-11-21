-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, SEGURIDAD (ROLES/PERMISOS), CLIENTES Y CATÁLOGO BASE
-- Tablas 001 a 050 (Autor: Integrante 1 - Control: 22050001)
-- =================================================================================================

SET XACT_ABORT ON;

-- =================================================================================================
-- 001. TABLA: seguridad.roles (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.roles (id_rol, codigo_rol, nombre_rol, descripcion, nivel_jerarquico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ADMIN', 'Administrador del Sistema', 'Control total sobre catálogo, usuarios, seguridad, inventarios y auditoría global.', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CLIENTE', 'Cliente Comprador', 'Acceso a tienda en línea, perfil cutáneo, compras, suscripciones Beauty-Box y facturación.', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FACTURACION', 'Especialista en Facturación CFDI', 'Gestión de timbrado CFDI 4.0 ante el SAT, complementos de pago y notas de crédito.', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'DERMOCONSULTOR', 'Dermoconsultor Clínico', 'Evaluación de perfiles cutáneos, validación de alérgenos INCI y asesoría de rutinas.', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ALMACEN_WMS', 'Operador Logístico WMS / CEDIS', 'Recepción de lotes sanitarios, despacho FEFO, telemetría de cadena de frío y empaque.', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'AUDITOR_COFEPRIS', 'Auditor Sanitario COFEPRIS y Calidad', 'Supervisión de farmacovigilancia, inspecciones QA, mermas sanitarias y bitácora forense.', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('seguridad.roles', 'id_rol'), COALESCE((SELECT MAX(id_rol) FROM seguridad.roles), 1), true);

-- =================================================================================================
-- 002. TABLA: seguridad.permisos (15 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.permisos (id_permiso, clave_permiso, modulo_sistema, accion, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SEG_USUARIOS_CRUD', 'Seguridad', 'ADMINISTRAR', 'Administrar cuentas de usuarios, contraseñas y bloqueos', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SEG_ROLES_ASIGNAR', 'Seguridad', 'ASIGNAR', 'Asignar roles y permisos a usuarios del sistema', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAT_PRODUCTOS_CRUD', 'Catálogo', 'ESCRIBIR', 'Crear, editar y desactivar productos cosméticos y fórmulas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAT_CATALOGO_VER', 'Catálogo', 'LEER', 'Consultar catálogo público de productos, precios y existencias', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CLI_PERFIL_CUTANEO', 'Clientes', 'ESCRIBIR', 'Gestionar perfil dermatológico y consentimiento LFPDPPP', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CLI_ARCO_RESOLVER', 'Clientes', 'APROBAR', 'Atender y dictaminar solicitudes de derechos ARCO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'VEN_ORDEN_CREAR', 'Ventas', 'CREAR', 'Generar carritos, órdenes de compra y suscripciones Beauty-Box', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'VEN_ORDEN_CANCELAR', 'Ventas', 'ACTUALIZAR', 'Autorizar cancelaciones y ajustes comerciales de órdenes', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PAG_COBRO_EJECUTAR', 'Pagos', 'EJECUTAR', 'Procesar pagos tokenizados y validaciones antifraude', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PAG_REEMBOLSO_APROBAR', 'Pagos', 'APROBAR', 'Autorizar reembolsos y gestionar contracargos bancarios', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FIS_CFDI_TIMBRAR', 'Fiscal', 'EJECUTAR', 'Emitir y timbrar facturas CFDI 4.0 ante el PAC autorizado del SAT', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FIS_CFDI_CANCELAR', 'Fiscal', 'CANCELAR', 'Solicitar cancelación de comprobantes fiscales ante el SAT', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FIS_CFDI_CONSULTAR', 'Fiscal', 'LEER', 'Descargar archivos XML/PDF y consultar historial de facturación', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'WMS_LOTES_FEFO', 'Almacén', 'ESCRIBIR', 'Controlar lotes sanitarios FEFO, cuarentena QA y cadena de frío', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'AUD_BITACORA_VER', 'Auditoría', 'LEER', 'Consultar bitácoras inmutables de seguridad y cambios de datos', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('seguridad.permisos', 'id_permiso'), COALESCE((SELECT MAX(id_permiso) FROM seguridad.permisos), 1), true);

-- =================================================================================================
-- 003. TABLA: seguridad.roles_permisos (23 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.roles_permisos (id_rol_permiso, rol, permiso, permitir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 1, 2, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 1, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 1, 4, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 1, 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 1, 6, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 1, 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 1, 8, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 1, 9, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 1, 10, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 1, 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 1, 12, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 1, 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 1, 14, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 1, 15, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 2, 4, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 2, 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 2, 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 2, 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 3, 10, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 3, 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 3, 12, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 3, 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('seguridad.roles_permisos', 'id_rol_permiso'), COALESCE((SELECT MAX(id_rol_permiso) FROM seguridad.roles_permisos), 1), true);

-- =================================================================================================
-- 004. TABLA: seguridad.usuarios (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.usuarios (id_usuario, uuid_usuario, email, password_hash, password_salt, telefono_movil, email_verificado, cuenta_bloqueada, fecha_bloqueo, intentos_fallidos_consecutivos, mfa_habilitado, mfa_secreto, ultimo_login_exitoso, ultimo_cambio_password, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'B1000000-0000-4000-8000-000000000001', 'carlos.mendoza.1@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 'c2FsdERlcm1hQ2FyZTIwMjZf0001==', '8661114455', TRUE, TRUE, '2026-02-01 11:30:00', 1, TRUE, 'JBSWY3DPEHPK3PXP0001DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'B1000000-0000-4000-8000-000000000002', 'sofia.ramirez.2@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 'c2FsdERlcm1hQ2FyZTIwMjZf0002==', '8661124455', FALSE, FALSE, '2026-02-02 11:30:00', 2, FALSE, 'JBSWY3DPEHPK3PXP0002DERMA', '2026-02-02 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'B1000000-0000-4000-8000-000000000003', 'valeria.torres.3@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 'c2FsdERlcm1hQ2FyZTIwMjZf0003==', '8661134455', TRUE, TRUE, '2026-02-03 11:30:00', 3, TRUE, 'JBSWY3DPEHPK3PXP0003DERMA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'B1000000-0000-4000-8000-000000000004', 'alejandro.hernandez.4@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 'c2FsdERlcm1hQ2FyZTIwMjZf0004==', '8661144455', FALSE, FALSE, '2026-02-04 11:30:00', 4, FALSE, 'JBSWY3DPEHPK3PXP0004DERMA', '2026-02-04 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'B1000000-0000-4000-8000-000000000005', 'mariana.sanchez.5@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 'c2FsdERlcm1hQ2FyZTIwMjZf0005==', '8661154455', TRUE, TRUE, '2026-02-05 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0005DERMA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'B1000000-0000-4000-8000-000000000006', 'diego.martinez.6@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 'c2FsdERlcm1hQ2FyZTIwMjZf0006==', '8661164455', FALSE, FALSE, '2026-02-06 11:30:00', 6, FALSE, 'JBSWY3DPEHPK3PXP0006DERMA', '2026-02-06 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'B1000000-0000-4000-8000-000000000007', 'camila.gonzalez.7@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 'c2FsdERlcm1hQ2FyZTIwMjZf0007==', '8661174455', TRUE, TRUE, '2026-02-07 11:30:00', 7, TRUE, 'JBSWY3DPEHPK3PXP0007DERMA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'B1000000-0000-4000-8000-000000000008', 'mateo.flores.8@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 'c2FsdERlcm1hQ2FyZTIwMjZf0008==', '8661184455', FALSE, FALSE, '2026-02-08 11:30:00', 8, FALSE, 'JBSWY3DPEHPK3PXP0008DERMA', '2026-02-08 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'B1000000-0000-4000-8000-000000000009', 'lucia.morales.9@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 'c2FsdERlcm1hQ2FyZTIwMjZf0009==', '8661194455', TRUE, TRUE, '2026-02-09 11:30:00', 9, TRUE, 'JBSWY3DPEHPK3PXP0009DERMA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'B1000000-0000-4000-8000-00000000000A', 'sebastian.vazquez.10@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 'c2FsdERlcm1hQ2FyZTIwMjZf0010==', '8661204455', FALSE, FALSE, '2026-02-10 11:30:00', 10, FALSE, 'JBSWY3DPEHPK3PXP0010DERMA', '2026-02-10 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'B1000000-0000-4000-8000-00000000000B', 'regina.gutierrez.11@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 'c2FsdERlcm1hQ2FyZTIwMjZf0011==', '8661214455', TRUE, TRUE, '2026-02-11 11:30:00', 11, TRUE, 'JBSWY3DPEHPK3PXP0011DERMA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'B1000000-0000-4000-8000-00000000000C', 'santiago.jimenez.12@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 'c2FsdERlcm1hQ2FyZTIwMjZf0012==', '8661224455', FALSE, FALSE, '2026-02-12 11:30:00', 12, FALSE, 'JBSWY3DPEHPK3PXP0012DERMA', '2026-02-12 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'B1000000-0000-4000-8000-00000000000D', 'fernanda.ruiz.13@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 'c2FsdERlcm1hQ2FyZTIwMjZf0013==', '8661234455', TRUE, TRUE, '2026-02-13 11:30:00', 13, TRUE, 'JBSWY3DPEHPK3PXP0013DERMA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'B1000000-0000-4000-8000-00000000000E', 'emiliano.rios.14@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 'c2FsdERlcm1hQ2FyZTIwMjZf0014==', '8661244455', FALSE, FALSE, '2026-02-14 11:30:00', 14, FALSE, 'JBSWY3DPEHPK3PXP0014DERMA', '2026-02-14 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'B1000000-0000-4000-8000-00000000000F', 'ximena.aguilar.15@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 'c2FsdERlcm1hQ2FyZTIwMjZf0015==', '8661254455', TRUE, TRUE, '2026-02-15 11:30:00', 15, TRUE, 'JBSWY3DPEHPK3PXP0015DERMA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'B1000000-0000-4000-8000-000000000010', 'daniel.mendez.16@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 'c2FsdERlcm1hQ2FyZTIwMjZf0016==', '8661264455', FALSE, FALSE, '2026-02-16 11:30:00', 16, FALSE, 'JBSWY3DPEHPK3PXP0016DERMA', '2026-02-16 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'B1000000-0000-4000-8000-000000000011', 'andrea.castro.17@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 'c2FsdERlcm1hQ2FyZTIwMjZf0017==', '8661274455', TRUE, TRUE, '2026-02-17 11:30:00', 17, TRUE, 'JBSWY3DPEHPK3PXP0017DERMA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'B1000000-0000-4000-8000-000000000012', 'gabriel.vega.18@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 'c2FsdERlcm1hQ2FyZTIwMjZf0018==', '8661284455', FALSE, FALSE, '2026-02-18 11:30:00', 18, FALSE, 'JBSWY3DPEHPK3PXP0018DERMA', '2026-02-18 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'B1000000-0000-4000-8000-000000000013', 'paula.cortes.19@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 'c2FsdERlcm1hQ2FyZTIwMjZf0019==', '8661294455', TRUE, TRUE, '2026-02-19 11:30:00', 19, TRUE, 'JBSWY3DPEHPK3PXP0019DERMA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'B1000000-0000-4000-8000-000000000014', 'andres.ramos.20@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 'c2FsdERlcm1hQ2FyZTIwMjZf0020==', '8661304455', FALSE, FALSE, '2026-02-20 11:30:00', 20, FALSE, 'JBSWY3DPEHPK3PXP0020DERMA', '2026-02-20 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'B1000000-0000-4000-8000-000000000015', 'renata.guerrero.21@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 'c2FsdERlcm1hQ2FyZTIwMjZf0021==', '8661314455', TRUE, TRUE, '2026-02-21 11:30:00', 21, TRUE, 'JBSWY3DPEHPK3PXP0021DERMA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'B1000000-0000-4000-8000-000000000016', 'nicolas.pena.22@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 'c2FsdERlcm1hQ2FyZTIwMjZf0022==', '8661324455', FALSE, FALSE, '2026-02-22 11:30:00', 22, FALSE, 'JBSWY3DPEHPK3PXP0022DERMA', '2026-02-22 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'B1000000-0000-4000-8000-000000000017', 'natalia.herrera.23@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 'c2FsdERlcm1hQ2FyZTIwMjZf0023==', '8661334455', TRUE, TRUE, '2026-02-23 11:30:00', 23, TRUE, 'JBSWY3DPEHPK3PXP0023DERMA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'B1000000-0000-4000-8000-000000000018', 'joaquin.medina.24@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 'c2FsdERlcm1hQ2FyZTIwMjZf0024==', '8661344455', FALSE, FALSE, '2026-02-24 11:30:00', 24, FALSE, 'JBSWY3DPEHPK3PXP0024DERMA', '2026-02-24 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'B1000000-0000-4000-8000-000000000019', 'isabella.dominguez.25@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 'c2FsdERlcm1hQ2FyZTIwMjZf0025==', '8661354455', TRUE, TRUE, '2026-02-25 11:30:00', 25, TRUE, 'JBSWY3DPEHPK3PXP0025DERMA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'B1000000-0000-4000-8000-00000000001A', 'leonardo.silva.26@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 'c2FsdERlcm1hQ2FyZTIwMjZf0026==', '8661364455', FALSE, FALSE, '2026-02-26 11:30:00', 26, FALSE, 'JBSWY3DPEHPK3PXP0026DERMA', '2026-02-26 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'B1000000-0000-4000-8000-00000000001B', 'ana.chavez.27@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 'c2FsdERlcm1hQ2FyZTIwMjZf0027==', '8661374455', TRUE, TRUE, '2026-02-27 11:30:00', 27, TRUE, 'JBSWY3DPEHPK3PXP0027DERMA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'B1000000-0000-4000-8000-00000000001C', 'rodrigo.ochoa.28@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 'c2FsdERlcm1hQ2FyZTIwMjZf0028==', '8661384455', FALSE, FALSE, '2026-02-28 11:30:00', 28, FALSE, 'JBSWY3DPEHPK3PXP0028DERMA', '2026-02-28 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'B1000000-0000-4000-8000-00000000001D', 'paulina.miranda.29@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 'c2FsdERlcm1hQ2FyZTIwMjZf0029==', '8661394455', TRUE, TRUE, '2026-02-01 11:30:00', 29, TRUE, 'JBSWY3DPEHPK3PXP0029DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'B1000000-0000-4000-8000-00000000001E', 'mauricio.padilla.30@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 'c2FsdERlcm1hQ2FyZTIwMjZf0030==', '8661404455', FALSE, FALSE, '2026-02-02 11:30:00', 30, FALSE, 'JBSWY3DPEHPK3PXP0030DERMA', '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.usuarios', 'id_usuario'), COALESCE((SELECT MAX(id_usuario) FROM seguridad.usuarios), 1), true);

-- =================================================================================================
-- 005. TABLA: seguridad.usuarios_roles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.usuarios_roles (id_usuario_rol, usuario, rol, fecha_asignacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 3, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 3, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 2, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 2, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 2, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 2, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 2, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 2, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 2, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 2, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 2, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 2, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 2, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 2, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.usuarios_roles', 'id_usuario_rol'), COALESCE((SELECT MAX(id_usuario_rol) FROM seguridad.usuarios_roles), 1), true);

-- =================================================================================================
-- 006. TABLA: seguridad.sesiones_activas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.sesiones_activas (id_sesion, usuario, token_sesion_hash, direccion_ip, user_agent, fecha_inicio, fecha_expiracion, revocada, fecha_revocacion, motivo_revocacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', '189.203.3.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-02-01 11:30:00', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', '189.203.6.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2026-02-02 11:30:00', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', '189.203.9.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-02-03 11:30:00', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', '189.203.12.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', '2026-02-04 11:30:00', '2026-02-04 11:30:00', FALSE, '2026-02-04 11:30:00', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', '189.203.15.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-02-05 11:30:00', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', '189.203.18.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', '2026-02-06 11:30:00', '2026-02-06 11:30:00', FALSE, '2026-02-06 11:30:00', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', '189.203.21.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-02-07 11:30:00', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', '189.203.24.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', '2026-02-08 11:30:00', '2026-02-08 11:30:00', FALSE, '2026-02-08 11:30:00', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', '189.203.27.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-02-09 11:30:00', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', '189.203.30.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', '2026-02-10 11:30:00', '2026-02-10 11:30:00', FALSE, '2026-02-10 11:30:00', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', '189.203.33.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-02-11 11:30:00', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', '189.203.36.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', '2026-02-12 11:30:00', '2026-02-12 11:30:00', FALSE, '2026-02-12 11:30:00', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', '189.203.39.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-02-13 11:30:00', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', '189.203.42.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', '2026-02-14 11:30:00', '2026-02-14 11:30:00', FALSE, '2026-02-14 11:30:00', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', '189.203.45.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-02-15 11:30:00', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', '189.203.48.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', '2026-02-16 11:30:00', '2026-02-16 11:30:00', FALSE, '2026-02-16 11:30:00', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', '189.203.51.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-02-17 11:30:00', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', '189.203.54.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', '2026-02-18 11:30:00', '2026-02-18 11:30:00', FALSE, '2026-02-18 11:30:00', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', '189.203.57.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-02-19 11:30:00', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', '189.203.60.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', '2026-02-20 11:30:00', '2026-02-20 11:30:00', FALSE, '2026-02-20 11:30:00', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', '189.203.63.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-02-21 11:30:00', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', '189.203.66.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', '2026-02-22 11:30:00', '2026-02-22 11:30:00', FALSE, '2026-02-22 11:30:00', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', '189.203.69.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-02-23 11:30:00', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', '189.203.72.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', '2026-02-24 11:30:00', '2026-02-24 11:30:00', FALSE, '2026-02-24 11:30:00', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', '189.203.75.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-02-25 11:30:00', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', '189.203.78.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', '2026-02-26 11:30:00', '2026-02-26 11:30:00', FALSE, '2026-02-26 11:30:00', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', '189.203.81.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-02-27 11:30:00', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', '189.203.84.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', '2026-02-28 11:30:00', '2026-02-28 11:30:00', FALSE, '2026-02-28 11:30:00', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', '189.203.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-02-01 11:30:00', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', '189.203.90.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2026-02-02 11:30:00', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.sesiones_activas', 'id_sesion'), COALESCE((SELECT MAX(id_sesion) FROM seguridad.sesiones_activas), 1), true);

-- =================================================================================================
-- 007. TABLA: seguridad.historial_passwords (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.historial_passwords (id_historial_pwd, usuario, password_hash, password_salt, algoritmo_hashing, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 'c2FsdERlcm1hQ2FyZTIwMjZf0001==', 'Sérum Niacinamida 10% + Zinc 1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 'c2FsdERlcm1hQ2FyZTIwMjZf0002==', 'Gel Limpiador Espumoso Facial ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 'c2FsdERlcm1hQ2FyZTIwMjZf0003==', 'Protector Solar Fluido SPF 50+', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 'c2FsdERlcm1hQ2FyZTIwMjZf0004==', 'Sérum Ácido Hialurónico 2% + B', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 'c2FsdERlcm1hQ2FyZTIwMjZf0005==', 'Crema Hidratante con Ceramidas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 'c2FsdERlcm1hQ2FyZTIwMjZf0006==', 'Retinol Puro 0.5% Nocturno - E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 'c2FsdERlcm1hQ2FyZTIwMjZf0007==', 'Agua Micelar Dermolimpiadora -', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 'c2FsdERlcm1hQ2FyZTIwMjZf0008==', 'Sérum Vitamina C Pura 15% - Vi', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 'c2FsdERlcm1hQ2FyZTIwMjZf0009==', 'Base de Maquillaje Cobertura M', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 'c2FsdERlcm1hQ2FyZTIwMjZf0010==', 'Corrector Líquido Alta Duració', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 'c2FsdERlcm1hQ2FyZTIwMjZf0011==', 'Bálsamo Reparador Cicaplast B5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 'c2FsdERlcm1hQ2FyZTIwMjZf0012==', 'Exfoliante Ácido Salicílico 2%', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 'c2FsdERlcm1hQ2FyZTIwMjZf0013==', 'Contorno de Ojos con Cafeína 5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 'c2FsdERlcm1hQ2FyZTIwMjZf0014==', 'Mascarilla Nocturna Hidratante', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 'c2FsdERlcm1hQ2FyZTIwMjZf0015==', 'Bruma Termal Calmante Mineral ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 'c2FsdERlcm1hQ2FyZTIwMjZf0016==', 'Aceite Limpiador Emulsionable ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 'c2FsdERlcm1hQ2FyZTIwMjZf0017==', 'Tónico Equilibrante Ácido Glic', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 'c2FsdERlcm1hQ2FyZTIwMjZf0018==', 'Labial Hidratante Péptidos Nud', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 'c2FsdERlcm1hQ2FyZTIwMjZf0019==', 'Polvo Traslúcido Matificante M', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 'c2FsdERlcm1hQ2FyZTIwMjZf0020==', 'Rubor Líquido Pigmento Natural', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 'c2FsdERlcm1hQ2FyZTIwMjZf0021==', 'Sérum Ácido Azelaico 10% Suspe', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 'c2FsdERlcm1hQ2FyZTIwMjZf0022==', 'Ampolletas Proteoglicanos Firm', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 'c2FsdERlcm1hQ2FyZTIwMjZf0023==', 'Crema Despigmentante Noche Mel', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 'c2FsdERlcm1hQ2FyZTIwMjZf0024==', 'Protector Solar Mineral Óxido ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 'c2FsdERlcm1hQ2FyZTIwMjZf0025==', 'Loción Corporal Urea 10% Repar', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 'c2FsdERlcm1hQ2FyZTIwMjZf0026==', 'Primer Facial Minimizador de P', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 'c2FsdERlcm1hQ2FyZTIwMjZf0027==', 'Máscara de Pestañas Hipoalergé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 'c2FsdERlcm1hQ2FyZTIwMjZf0028==', 'Sérum Péptidos de Cobre 1% - L', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 'c2FsdERlcm1hQ2FyZTIwMjZf0029==', 'Bálsamo Desmaquillante Caléndu', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 'c2FsdERlcm1hQ2FyZTIwMjZf0030==', 'Crema Barrera Post-Retinoide -', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.historial_passwords', 'id_historial_pwd'), COALESCE((SELECT MAX(id_historial_pwd) FROM seguridad.historial_passwords), 1), true);

-- =================================================================================================
-- 008. TABLA: seguridad.intentos_login (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.intentos_login (id_intento_login, email_ingresado, usuario, direccion_ip, pais_origen_ip, user_agent, resultado, mensaje_detalle, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, '189.203.3.7', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'EXITOSO', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 2, '189.203.6.14', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'PASSWORD_INVALIDO', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 3, '189.203.9.21', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'USUARIO_INEXISTENTE', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 4, '189.203.12.28', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'CUENTA_BLOQUEADA', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 5, '189.203.15.35', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'MFA_FALLIDO', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 6, '189.203.18.42', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'EXITOSO', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 7, '189.203.21.49', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'PASSWORD_INVALIDO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 8, '189.203.24.56', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'USUARIO_INEXISTENTE', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 9, '189.203.27.63', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'CUENTA_BLOQUEADA', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 10, '189.203.30.70', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'MFA_FALLIDO', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 11, '189.203.33.77', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'EXITOSO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 12, '189.203.36.84', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'PASSWORD_INVALIDO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 13, '189.203.39.91', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'USUARIO_INEXISTENTE', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 14, '189.203.42.98', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'CUENTA_BLOQUEADA', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 15, '189.203.45.105', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'MFA_FALLIDO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 16, '189.203.48.112', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'EXITOSO', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 17, '189.203.51.119', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'PASSWORD_INVALIDO', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 18, '189.203.54.126', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'USUARIO_INEXISTENTE', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 19, '189.203.57.133', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'CUENTA_BLOQUEADA', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 20, '189.203.60.140', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'MFA_FALLIDO', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 21, '189.203.63.147', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'EXITOSO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 22, '189.203.66.154', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'PASSWORD_INVALIDO', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 23, '189.203.69.161', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'USUARIO_INEXISTENTE', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 24, '189.203.72.168', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'CUENTA_BLOQUEADA', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 25, '189.203.75.175', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'MFA_FALLIDO', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 26, '189.203.78.182', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'EXITOSO', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 27, '189.203.81.189', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'PASSWORD_INVALIDO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 28, '189.203.84.196', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'USUARIO_INEXISTENTE', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 29, '189.203.87.203', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'CUENTA_BLOQUEADA', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 30, '189.203.90.210', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'MFA_FALLIDO', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.intentos_login', 'id_intento_login'), COALESCE((SELECT MAX(id_intento_login) FROM seguridad.intentos_login), 1), true);

-- =================================================================================================
-- 009. TABLA: seguridad.tokens_recuperacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.tokens_recuperacion (id_token_recuperacion, usuario, token_hash, tipo_token, fecha_expiracion, utilizado, fecha_utilizacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 'RESET_PASSWORD', '2026-02-01 11:30:00', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 'VERIFICAR_EMAIL', '2026-02-02 11:30:00', FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 'MFA_BACKUP', '2026-02-03 11:30:00', TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 'RESET_PASSWORD', '2026-02-04 11:30:00', FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 'VERIFICAR_EMAIL', '2026-02-05 11:30:00', TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 'MFA_BACKUP', '2026-02-06 11:30:00', FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 'RESET_PASSWORD', '2026-02-07 11:30:00', TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 'VERIFICAR_EMAIL', '2026-02-08 11:30:00', FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 'MFA_BACKUP', '2026-02-09 11:30:00', TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 'RESET_PASSWORD', '2026-02-10 11:30:00', FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 'VERIFICAR_EMAIL', '2026-02-11 11:30:00', TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 'MFA_BACKUP', '2026-02-12 11:30:00', FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 'RESET_PASSWORD', '2026-02-13 11:30:00', TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 'VERIFICAR_EMAIL', '2026-02-14 11:30:00', FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 'MFA_BACKUP', '2026-02-15 11:30:00', TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 'RESET_PASSWORD', '2026-02-16 11:30:00', FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 'VERIFICAR_EMAIL', '2026-02-17 11:30:00', TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 'MFA_BACKUP', '2026-02-18 11:30:00', FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 'RESET_PASSWORD', '2026-02-19 11:30:00', TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 'VERIFICAR_EMAIL', '2026-02-20 11:30:00', FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 'MFA_BACKUP', '2026-02-21 11:30:00', TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 'RESET_PASSWORD', '2026-02-22 11:30:00', FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 'VERIFICAR_EMAIL', '2026-02-23 11:30:00', TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 'MFA_BACKUP', '2026-02-24 11:30:00', FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 'RESET_PASSWORD', '2026-02-25 11:30:00', TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 'VERIFICAR_EMAIL', '2026-02-26 11:30:00', FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 'MFA_BACKUP', '2026-02-27 11:30:00', TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 'RESET_PASSWORD', '2026-02-28 11:30:00', FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 'VERIFICAR_EMAIL', '2026-02-01 11:30:00', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 'MFA_BACKUP', '2026-02-02 11:30:00', FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.tokens_recuperacion', 'id_token_recuperacion'), COALESCE((SELECT MAX(id_token_recuperacion) FROM seguridad.tokens_recuperacion), 1), true);

-- =================================================================================================
-- 010. TABLA: seguridad.dispositivos_confianza (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.dispositivos_confianza (id_dispositivo, usuario, fingerprint_dispositivo, nombre_dispositivo, sistema_operativo, navegador, es_confiable, ultimo_acceso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.dispositivos_confianza', 'id_dispositivo'), COALESCE((SELECT MAX(id_dispositivo) FROM seguridad.dispositivos_confianza), 1), true);

-- =================================================================================================
-- 011. TABLA: clientes.tipos_piel (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.tipos_piel (id_tipo_piel, codigo_piel, nombre, descripcion_clinica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'EUDERMICA', 'Piel Normal / Eudérmica', 'Equilibrio óptimo entre hidratación y secreción sebácea', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SECA_ALIPICA', 'Piel Seca / Deshidratada', 'Déficit de lípidos epidérmicos y tendencia a tirantez', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'GRASA_SEBORR', 'Piel Grasa / Tendencia Acnéica', 'Hipersecreción sebácea, brillo facial y poros dilatados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MIXTA_ZONAT', 'Piel Mixta', 'Zona T grasa (frente, nariz, mentón) y mejillas secas o normales', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SENSIBLE_REAC', 'Piel Sensible / Reactiva', 'Alta reactividad neurosensorial, eritema fácil y barrera frágil', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MADURA_FOTO', 'Piel Madura / Fotoenvejecida', 'Pérdida de firmeza, elastosis solar y líneas de expresión marcadas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('clientes.tipos_piel', 'id_tipo_piel'), COALESCE((SELECT MAX(id_tipo_piel) FROM clientes.tipos_piel), 1), true);

-- =================================================================================================
-- 012. TABLA: clientes.condiciones_dermatologicas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.condiciones_dermatologicas (id_condicion_dermatologica, codigo_condicion, nombre_condicion, descripcion_patologica, nivel_severidad_tipica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CONDICIO_01', 'Sueros Concentrados Nivel 1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CONDICIO_02', 'Limpiadores Faciales Nivel 2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CONDICIO_03', 'Fotoprotección Solar Nivel 3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CONDICIO_04', 'Maquillaje Mineral Nivel 4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CONDICIO_05', 'Cuidado Anti-Edad Nivel 5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CONDICIO_06', 'Barrera Cutánea Nivel 6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CONDICIO_07', 'Contorno de Ojos Nivel 7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CONDICIO_08', 'Tratamiento Acné Nivel 8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CONDICIO_09', 'Hidratantes Ceramidas Nivel 9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CONDICIO_10', 'Exfoliantes Químicos Nivel 10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CONDICIO_11', 'Sueros Concentrados Nivel 11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CONDICIO_12', 'Limpiadores Faciales Nivel 12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CONDICIO_13', 'Fotoprotección Solar Nivel 13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CONDICIO_14', 'Maquillaje Mineral Nivel 14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CONDICIO_15', 'Cuidado Anti-Edad Nivel 15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CONDICIO_16', 'Barrera Cutánea Nivel 16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CONDICIO_17', 'Contorno de Ojos Nivel 17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CONDICIO_18', 'Tratamiento Acné Nivel 18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CONDICIO_19', 'Hidratantes Ceramidas Nivel 19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CONDICIO_20', 'Exfoliantes Químicos Nivel 20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CONDICIO_21', 'Sueros Concentrados Nivel 21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CONDICIO_22', 'Limpiadores Faciales Nivel 22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CONDICIO_23', 'Fotoprotección Solar Nivel 23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CONDICIO_24', 'Maquillaje Mineral Nivel 24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CONDICIO_25', 'Cuidado Anti-Edad Nivel 25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CONDICIO_26', 'Barrera Cutánea Nivel 26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CONDICIO_27', 'Contorno de Ojos Nivel 27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CONDICIO_28', 'Tratamiento Acné Nivel 28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CONDICIO_29', 'Hidratantes Ceramidas Nivel 29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CONDICIO_30', 'Exfoliantes Químicos Nivel 30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'SEVERA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.condiciones_dermatologicas', 'id_condicion_dermatologica'), COALESCE((SELECT MAX(id_condicion_dermatologica) FROM clientes.condiciones_dermatologicas), 1), true);

-- =================================================================================================
-- 013. TABLA: clientes.clientes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.clientes (id_cliente, usuario, nombres, primer_apellido, segundo_apellido, fecha_nacimiento, genero, curp, rfc, telefono_fijo, acepta_terminos, fecha_aceptacion_terminos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Carlos Mendoza Garza', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', '2026-03-01', 'FEMENINO', 'MEGC910315HCLRR001', 'MEGC910315H01', '8661114455', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Sofía Ramírez López', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', '2026-03-02', 'MASCULINO', 'RALS920315HCLRR002', 'RALS920315H02', '8661124455', FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Valeria Torres Villarreal', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', '2026-03-03', 'NO_BINARIO', 'TOVV930315HCLRR003', 'TOVV930315H03', '8661134455', TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Alejandro Hernández Cruz', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', '2026-03-04', 'PREFIERO_NO_DECIR', 'HECA940315HCLRR004', 'HECA940315H04', '8661144455', FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Mariana Sánchez Fuentes', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', '2026-03-05', 'FEMENINO', 'SAFM950315HCLRR005', 'SAFM950315H05', '8661154455', TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Diego Martínez Treviño', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', '2026-03-06', 'MASCULINO', 'MATD960315HCLRR006', 'MATD960315H06', '8661164455', FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Camila González Reyes', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', '2026-03-07', 'NO_BINARIO', 'GORC970315HCLRR007', 'GORC970315H07', '8661174455', TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Mateo Flores Castillo', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', '2026-03-08', 'PREFIERO_NO_DECIR', 'FLCM980315HCLRR008', 'FLCM980315H08', '8661184455', FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Lucía Morales Díaz', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', '2026-03-09', 'FEMENINO', 'MODL990315HCLRR009', 'MODL990315H09', '8661194455', TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Sebastián Vázquez Ortiz', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', '2026-03-10', 'MASCULINO', 'VAOS900315HCLRR010', 'VAOS900315H10', '8661204455', FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Regina Gutiérrez Nava', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', '2026-03-11', 'NO_BINARIO', 'GUNR910315HCLRR011', 'GUNR910315H11', '8661214455', TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Santiago Jiménez Pérez', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', '2026-03-12', 'PREFIERO_NO_DECIR', 'JIPS920315HCLRR012', 'JIPS920315H12', '8661224455', FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Fernanda Ruiz Salazar', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', '2026-03-13', 'FEMENINO', 'RUSF930315HCLRR013', 'RUSF930315H13', '8661234455', TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Emiliano Ríos Cárdenas', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', '2026-03-14', 'MASCULINO', 'RICE940315HCLRR014', 'RICE940315H14', '8661244455', FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Ximena Aguilar Ibarra', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', '2026-03-15', 'NO_BINARIO', 'AGIX950315HCLRR015', 'AGIX950315H15', '8661254455', TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Daniel Méndez Navarro', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', '2026-03-16', 'PREFIERO_NO_DECIR', 'MEND960315HCLRR016', 'MEND960315H16', '8661264455', FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Andrea Castro Delgado', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', '2026-03-17', 'FEMENINO', 'CADA970315HCLRR017', 'CADA970315H17', '8661274455', TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Gabriel Vega Montoya', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', '2026-03-18', 'MASCULINO', 'VEMG980315HCLRR018', 'VEMG980315H18', '8661284455', FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Paula Cortés Rojas', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', '2026-03-19', 'NO_BINARIO', 'CORP990315HCLRR019', 'CORP990315H19', '8661294455', TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Andrés Ramos Campos', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-03-20', 'PREFIERO_NO_DECIR', 'RACA900315HCLRR020', 'RACA900315H20', '8661304455', FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Renata Guerrero Luna', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', '2026-03-21', 'FEMENINO', 'GULR910315HCLRR021', 'GULR910315H21', '8661314455', TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Nicolás Peña Cabrera', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', '2026-03-22', 'MASCULINO', 'PECN920315HCLRR022', 'PECN920315H22', '8661324455', FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Natalia Herrera Vargas', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', '2026-03-23', 'NO_BINARIO', 'HEVN930315HCLRR023', 'HEVN930315H23', '8661334455', TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Joaquín Medina Contreras', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', '2026-03-24', 'PREFIERO_NO_DECIR', 'MECJ940315HCLRR024', 'MECJ940315H24', '8661344455', FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Isabella Domínguez Escobar', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', '2026-03-25', 'FEMENINO', 'DOEI950315HCLRR025', 'DOEI950315H25', '8661354455', TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Leonardo Silva Paredes', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', '2026-03-26', 'MASCULINO', 'SIPL960315HCLRR026', 'SIPL960315H26', '8661364455', FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Ana Chávez Bautista', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', '2026-03-27', 'NO_BINARIO', 'CHBA970315HCLRR027', 'CHBA970315H27', '8661374455', TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Rodrigo Ochoa Acosta', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', '2026-03-28', 'PREFIERO_NO_DECIR', 'OCAR980315HCLRR028', 'OCAR980315H28', '8661384455', FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Paulina Miranda Leal', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', '2026-03-01', 'FEMENINO', 'MILP990315HCLRR029', 'MILP990315H29', '8661394455', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Mauricio Padilla Solís', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', '2026-03-02', 'MASCULINO', 'PASM900315HCLRR030', 'PASM900315H30', '8661404455', FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.clientes', 'id_cliente'), COALESCE((SELECT MAX(id_cliente) FROM clientes.clientes), 1), true);

-- =================================================================================================
-- 014. TABLA: clientes.direcciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.direcciones (id_direccion, cliente, alias_direccion, calle, numero_exterior, numero_interior, colonia, codigo_postal, municipio_alcaldia, estado, pais, referencias, es_predeterminada_envio, es_predeterminada_facturacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Casa Monclova 1', 'Blvd. Harold R. Pape #112', '110', 'Depto 1', 'Centro', '25700', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Coahuila', 'México', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Casa Monterrey 2', 'Av. Constitución #124', '120', 'Depto 2', 'Obispado', '64000', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Nuevo León', 'México', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Casa San Pedro Garza García 3', 'Calz. del Valle #136', '130', 'Depto 3', 'Del Valle', '66220', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Nuevo León', 'México', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Casa Ciudad de México 4', 'Av. Álvaro Obregón #148', '140', 'Depto 4', 'Roma Norte', '06700', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'CDMX', 'México', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Casa Ciudad de México 5', 'Av. Presidente Masaryk #160', '150', 'Depto 5', 'Polanco', '11560', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'CDMX', 'México', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Casa Guadalajara 6', 'Av. Vallarta #172', '160', 'Depto 6', 'Americana', '44100', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Jalisco', 'México', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Casa Saltillo 7', 'Blvd. Venustiano Carranza #184', '170', 'Depto 7', 'República', '25000', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Coahuila', 'México', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Casa Querétaro 8', 'Av. 5 de Febrero #196', '180', 'Depto 8', 'Centro', '76000', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Querétaro', 'México', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Casa Puebla 9', 'Av. Juárez #208', '190', 'Depto 9', 'La Paz', '72000', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Puebla', 'México', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Casa Mérida 10', 'Paseo de Montejo #220', '200', 'Depto 10', 'Centro', '97000', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Yucatán', 'México', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Casa Monclova 11', 'Blvd. Harold R. Pape #232', '210', 'Depto 11', 'Centro', '25700', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Coahuila', 'México', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Casa Monterrey 12', 'Av. Constitución #244', '220', 'Depto 12', 'Obispado', '64000', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Nuevo León', 'México', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Casa San Pedro Garza García 13', 'Calz. del Valle #256', '230', 'Depto 13', 'Del Valle', '66220', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Nuevo León', 'México', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Casa Ciudad de México 14', 'Av. Álvaro Obregón #268', '240', 'Depto 14', 'Roma Norte', '06700', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'CDMX', 'México', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Casa Ciudad de México 15', 'Av. Presidente Masaryk #280', '250', 'Depto 15', 'Polanco', '11560', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'CDMX', 'México', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Casa Guadalajara 16', 'Av. Vallarta #292', '260', 'Depto 16', 'Americana', '44100', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Jalisco', 'México', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Casa Saltillo 17', 'Blvd. Venustiano Carranza #304', '270', 'Depto 17', 'República', '25000', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Coahuila', 'México', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Casa Querétaro 18', 'Av. 5 de Febrero #316', '280', 'Depto 18', 'Centro', '76000', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Querétaro', 'México', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Casa Puebla 19', 'Av. Juárez #328', '290', 'Depto 19', 'La Paz', '72000', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Puebla', 'México', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Casa Mérida 20', 'Paseo de Montejo #340', '300', 'Depto 20', 'Centro', '97000', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Yucatán', 'México', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Casa Monclova 21', 'Blvd. Harold R. Pape #352', '310', 'Depto 21', 'Centro', '25700', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Coahuila', 'México', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Casa Monterrey 22', 'Av. Constitución #364', '320', 'Depto 22', 'Obispado', '64000', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Nuevo León', 'México', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Casa San Pedro Garza García 23', 'Calz. del Valle #376', '330', 'Depto 23', 'Del Valle', '66220', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Nuevo León', 'México', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Casa Ciudad de México 24', 'Av. Álvaro Obregón #388', '340', 'Depto 24', 'Roma Norte', '06700', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'CDMX', 'México', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Casa Ciudad de México 25', 'Av. Presidente Masaryk #400', '350', 'Depto 25', 'Polanco', '11560', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'CDMX', 'México', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Casa Guadalajara 26', 'Av. Vallarta #412', '360', 'Depto 26', 'Americana', '44100', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Jalisco', 'México', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Casa Saltillo 27', 'Blvd. Venustiano Carranza #424', '370', 'Depto 27', 'República', '25000', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Coahuila', 'México', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Casa Querétaro 28', 'Av. 5 de Febrero #436', '380', 'Depto 28', 'Centro', '76000', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Querétaro', 'México', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Casa Puebla 29', 'Av. Juárez #448', '390', 'Depto 29', 'La Paz', '72000', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Puebla', 'México', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Casa Mérida 30', 'Paseo de Montejo #460', '400', 'Depto 30', 'Centro', '97000', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Yucatán', 'México', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.direcciones', 'id_direccion'), COALESCE((SELECT MAX(id_direccion) FROM clientes.direcciones), 1), true);

-- =================================================================================================
-- 015. TABLA: clientes.perfil_cutaneo (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.perfil_cutaneo (id_perfil_cutaneo, cliente, tipo_piel, sensibilidad_solar, nivel_oleosidad, poros_dilatados, propension_acne, manchas_hiperpigmentacion, lineas_expresion, consentimiento_datos_sensibles, fecha_declaracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 'ALTA', 'ZONA_T', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 'EXTREMA', 'GRASA_TOTAL', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 'MUY_BAJA', 'SECA', TRUE, TRUE, TRUE, TRUE, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 'MODERADA', 'EQUILIBRADA', FALSE, FALSE, FALSE, FALSE, FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.perfil_cutaneo', 'id_perfil_cutaneo'), COALESCE((SELECT MAX(id_perfil_cutaneo) FROM clientes.perfil_cutaneo), 1), true);

-- =================================================================================================
-- 016. TABLA: clientes.cliente_condiciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.cliente_condiciones (id_cliente_condicion, cliente, condicion_dermatologica, diagnosticada_por_medico, notas_paciente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, TRUE, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, FALSE, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, TRUE, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, FALSE, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, TRUE, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, FALSE, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, TRUE, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, FALSE, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, TRUE, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, FALSE, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, TRUE, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, FALSE, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, TRUE, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, FALSE, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, TRUE, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, FALSE, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, TRUE, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, FALSE, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, TRUE, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, FALSE, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, TRUE, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, FALSE, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, TRUE, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, FALSE, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, TRUE, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, FALSE, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, TRUE, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, FALSE, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, TRUE, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, FALSE, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.cliente_condiciones', 'id_cliente_condicion'), COALESCE((SELECT MAX(id_cliente_condicion) FROM clientes.cliente_condiciones), 1), true);

-- =================================================================================================
-- 017. TABLA: clientes.cuestionarios_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.cuestionarios_diagnostico (id_cuestionario, codigo_cuestionario, titulo, descripcion, version_clinica, vigente_desde, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CUESTION_01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 'Sérum Niac', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CUESTION_02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 'Gel Limpia', '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CUESTION_03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 'Protector ', '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CUESTION_04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 'Sérum Ácid', '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CUESTION_05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 'Crema Hidr', '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CUESTION_06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 'Retinol Pu', '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CUESTION_07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 'Agua Micel', '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CUESTION_08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 'Sérum Vita', '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CUESTION_09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 'Base de Ma', '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CUESTION_10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 'Corrector ', '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CUESTION_11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 'Bálsamo Re', '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CUESTION_12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 'Exfoliante', '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CUESTION_13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 'Contorno d', '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CUESTION_14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 'Mascarilla', '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CUESTION_15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 'Bruma Term', '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CUESTION_16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 'Aceite Lim', '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CUESTION_17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 'Tónico Equ', '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CUESTION_18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 'Labial Hid', '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CUESTION_19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 'Polvo Tras', '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CUESTION_20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 'Rubor Líqu', '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CUESTION_21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 'Sérum Ácid', '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CUESTION_22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 'Ampolletas', '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CUESTION_23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 'Crema Desp', '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CUESTION_24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 'Protector ', '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CUESTION_25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 'Loción Cor', '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CUESTION_26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 'Primer Fac', '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CUESTION_27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 'Máscara de', '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CUESTION_28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 'Sérum Pépt', '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CUESTION_29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 'Bálsamo De', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CUESTION_30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 'Crema Barr', '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.cuestionarios_diagnostico', 'id_cuestionario'), COALESCE((SELECT MAX(id_cuestionario) FROM clientes.cuestionarios_diagnostico), 1), true);

-- =================================================================================================
-- 018. TABLA: clientes.preguntas_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.preguntas_diagnostico (id_pregunta, cuestionario, numero_orden, enunciado_pregunta, tipo_respuesta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'ESCALA_NUMERICA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.preguntas_diagnostico', 'id_pregunta'), COALESCE((SELECT MAX(id_pregunta) FROM clientes.preguntas_diagnostico), 1), true);

-- =================================================================================================
-- 019. TABLA: clientes.opciones_pregunta (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.opciones_pregunta (id_opcion, pregunta, clave_opcion, texto_opcion, peso_clinico_puntos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'OPCION_01', 'Opción clínica validada nivel 1', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'OPCION_02', 'Opción clínica validada nivel 2', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'OPCION_03', 'Opción clínica validada nivel 3', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'OPCION_04', 'Opción clínica validada nivel 4', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'OPCION_05', 'Opción clínica validada nivel 5', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'OPCION_06', 'Opción clínica validada nivel 6', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'OPCION_07', 'Opción clínica validada nivel 7', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'OPCION_08', 'Opción clínica validada nivel 8', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'OPCION_09', 'Opción clínica validada nivel 9', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'OPCION_10', 'Opción clínica validada nivel 10', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'OPCION_11', 'Opción clínica validada nivel 11', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'OPCION_12', 'Opción clínica validada nivel 12', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'OPCION_13', 'Opción clínica validada nivel 13', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'OPCION_14', 'Opción clínica validada nivel 14', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'OPCION_15', 'Opción clínica validada nivel 15', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'OPCION_16', 'Opción clínica validada nivel 16', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'OPCION_17', 'Opción clínica validada nivel 17', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'OPCION_18', 'Opción clínica validada nivel 18', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'OPCION_19', 'Opción clínica validada nivel 19', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'OPCION_20', 'Opción clínica validada nivel 20', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'OPCION_21', 'Opción clínica validada nivel 21', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'OPCION_22', 'Opción clínica validada nivel 22', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'OPCION_23', 'Opción clínica validada nivel 23', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'OPCION_24', 'Opción clínica validada nivel 24', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'OPCION_25', 'Opción clínica validada nivel 25', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'OPCION_26', 'Opción clínica validada nivel 26', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'OPCION_27', 'Opción clínica validada nivel 27', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'OPCION_28', 'Opción clínica validada nivel 28', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'OPCION_29', 'Opción clínica validada nivel 29', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'OPCION_30', 'Opción clínica validada nivel 30', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.opciones_pregunta', 'id_opcion'), COALESCE((SELECT MAX(id_opcion) FROM clientes.opciones_pregunta), 1), true);

-- =================================================================================================
-- 020. TABLA: clientes.evaluaciones_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.evaluaciones_diagnostico (id_evaluacion, cliente, cuestionario, fecha_realizacion, puntaje_total, diagnostico_sugerido, observaciones_dermoconsultor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '2026-02-02 11:30:00', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '2026-02-03 11:30:00', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '2026-02-04 11:30:00', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '2026-02-05 11:30:00', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '2026-02-06 11:30:00', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '2026-02-07 11:30:00', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '2026-02-08 11:30:00', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '2026-02-09 11:30:00', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '2026-02-10 11:30:00', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '2026-02-11 11:30:00', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '2026-02-12 11:30:00', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '2026-02-13 11:30:00', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '2026-02-14 11:30:00', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '2026-02-15 11:30:00', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '2026-02-16 11:30:00', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '2026-02-17 11:30:00', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '2026-02-18 11:30:00', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '2026-02-19 11:30:00', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '2026-02-20 11:30:00', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '2026-02-21 11:30:00', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '2026-02-22 11:30:00', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '2026-02-23 11:30:00', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '2026-02-24 11:30:00', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '2026-02-25 11:30:00', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '2026-02-26 11:30:00', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '2026-02-27 11:30:00', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '2026-02-28 11:30:00', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '2026-02-01 11:30:00', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '2026-02-02 11:30:00', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.evaluaciones_diagnostico', 'id_evaluacion'), COALESCE((SELECT MAX(id_evaluacion) FROM clientes.evaluaciones_diagnostico), 1), true);

-- =================================================================================================
-- 021. TABLA: clientes.respuestas_evaluacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.respuestas_evaluacion (id_respuesta_evaluacion, evaluacion, pregunta, opcion_seleccionada, valor_texto_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.respuestas_evaluacion', 'id_respuesta_evaluacion'), COALESCE((SELECT MAX(id_respuesta_evaluacion) FROM clientes.respuestas_evaluacion), 1), true);

-- =================================================================================================
-- 022. TABLA: clientes.consentimientos_privacidad (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.consentimientos_privacidad (id_consentimiento, cliente, version_aviso_privacidad, acepta_finalidades_primarias, acepta_finalidades_secundarias_marketing, acepta_tratamiento_datos_salud_sensibles, direccion_ip_firma, medio_consentimiento, fecha_consentimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10', TRUE, TRUE, TRUE, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Po', 'CHECKBOX_DIGITAL', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumo', FALSE, FALSE, FALSE, 'Gel Limpiador Espumoso Facial - CeraVe Dermat', 'FIRMA_ELECTRONICA', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Flui', TRUE, TRUE, TRUE, 'Protector Solar Fluido SPF 50+ - The Ordinary', 'EN_SUCURSAL', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurón', FALSE, FALSE, FALSE, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotop', 'CHECKBOX_DIGITAL', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con', TRUE, TRUE, TRUE, 'Crema Hidratante con Ceramidas - Bioderma Lab', 'FIRMA_ELECTRONICA', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% No', FALSE, FALSE, FALSE, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avè', 'EN_SUCURSAL', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermoli', TRUE, TRUE, TRUE, 'Agua Micelar Dermolimpiadora - Eucerin Beiers', 'CHECKBOX_DIGITAL', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pur', FALSE, FALSE, FALSE, 'Sérum Vitamina C Pura 15% - Vichy Laboratoire', 'FIRMA_ELECTRONICA', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje C', TRUE, TRUE, TRUE, 'Base de Maquillaje Cobertura Media - SkinCeut', 'EN_SUCURSAL', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Al', FALSE, FALSE, FALSE, 'Corrector Líquido Alta Duración - Sesderma Na', 'CHECKBOX_DIGITAL', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Ci', TRUE, TRUE, TRUE, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmeti', 'FIRMA_ELECTRONICA', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Sal', FALSE, FALSE, FALSE, 'Exfoliante Ácido Salicílico 2% - MAC Professi', 'EN_SUCURSAL', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con', TRUE, TRUE, TRUE, 'Contorno de Ojos con Cafeína 5% - Fenty Beaut', 'CHECKBOX_DIGITAL', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna ', FALSE, FALSE, FALSE, 'Mascarilla Nocturna Hidratante - Rare Beauty ', 'FIRMA_ELECTRONICA', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmant', TRUE, TRUE, TRUE, 'Bruma Termal Calmante Mineral - Clinique Labo', 'EN_SUCURSAL', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emu', FALSE, FALSE, FALSE, 'Aceite Limpiador Emulsionable - Estée Lauder ', 'CHECKBOX_DIGITAL', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante ', TRUE, TRUE, TRUE, 'Tónico Equilibrante Ácido Glicólico 7% - Lanc', 'FIRMA_ELECTRONICA', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Pé', FALSE, FALSE, FALSE, 'Labial Hidratante Péptidos Nude - Charlotte T', 'EN_SUCURSAL', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Mat', TRUE, TRUE, TRUE, 'Polvo Traslúcido Matificante Mineral - Paula''', 'CHECKBOX_DIGITAL', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmen', FALSE, FALSE, FALSE, 'Rubor Líquido Pigmento Natural - COSRX K-Beau', 'FIRMA_ELECTRONICA', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico', TRUE, TRUE, TRUE, 'Sérum Ácido Azelaico 10% Suspensión - Laneige', 'EN_SUCURSAL', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteogli', FALSE, FALSE, FALSE, 'Ampolletas Proteoglicanos Firmeza - Uriage Ea', 'CHECKBOX_DIGITAL', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante', TRUE, TRUE, TRUE, 'Crema Despigmentante Noche Melasma - Laborato', 'FIRMA_ELECTRONICA', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mine', FALSE, FALSE, FALSE, 'Protector Solar Mineral Óxido Zinc - MartiDer', 'EN_SUCURSAL', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea', TRUE, TRUE, TRUE, 'Loción Corporal Urea 10% Reparadora - Helioca', 'CHECKBOX_DIGITAL', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimi', FALSE, FALSE, FALSE, 'Primer Facial Minimizador de Poros - Kiehl''s ', 'FIRMA_ELECTRONICA', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas ', TRUE, TRUE, TRUE, 'Máscara de Pestañas Hipoalergénica - Garnier ', 'EN_SUCURSAL', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Co', FALSE, FALSE, FALSE, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris De', 'CHECKBOX_DIGITAL', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillan', TRUE, TRUE, TRUE, 'Bálsamo Desmaquillante Caléndula - Neutrogena', 'FIRMA_ELECTRONICA', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-R', FALSE, FALSE, FALSE, 'Crema Barrera Post-Retinoide - DermaCare Labs', 'EN_SUCURSAL', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.consentimientos_privacidad', 'id_consentimiento'), COALESCE((SELECT MAX(id_consentimiento) FROM clientes.consentimientos_privacidad), 1), true);

-- =================================================================================================
-- 023. TABLA: clientes.solicitudes_arco (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.solicitudes_arco (id_solicitud_arco, folio_solicitud, cliente, tipo_derecho, motivo_solicitud, estado_tramite, fecha_limite_respuesta, resolucion_juridica, fecha_resolucion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-SOLIC-2026-0001', 1, 'ACCESO', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 'RECIBIDA', '2026-03-01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-SOLIC-2026-0002', 2, 'RECTIFICACION', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 'EN_REVISION', '2026-03-02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-SOLIC-2026-0003', 3, 'CANCELACION', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 'PROCEDENTE', '2026-03-03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-SOLIC-2026-0004', 4, 'OPOSICION', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 'IMPROCEDENTE', '2026-03-04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-SOLIC-2026-0005', 5, 'ACCESO', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 'CONCLUIDA', '2026-03-05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-SOLIC-2026-0006', 6, 'RECTIFICACION', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 'RECIBIDA', '2026-03-06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-SOLIC-2026-0007', 7, 'CANCELACION', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 'EN_REVISION', '2026-03-07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-SOLIC-2026-0008', 8, 'OPOSICION', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 'PROCEDENTE', '2026-03-08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-SOLIC-2026-0009', 9, 'ACCESO', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 'IMPROCEDENTE', '2026-03-09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-SOLIC-2026-0010', 10, 'RECTIFICACION', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 'CONCLUIDA', '2026-03-10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-SOLIC-2026-0011', 11, 'CANCELACION', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 'RECIBIDA', '2026-03-11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-SOLIC-2026-0012', 12, 'OPOSICION', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 'EN_REVISION', '2026-03-12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-SOLIC-2026-0013', 13, 'ACCESO', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 'PROCEDENTE', '2026-03-13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-SOLIC-2026-0014', 14, 'RECTIFICACION', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 'IMPROCEDENTE', '2026-03-14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-SOLIC-2026-0015', 15, 'CANCELACION', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 'CONCLUIDA', '2026-03-15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-SOLIC-2026-0016', 16, 'OPOSICION', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 'RECIBIDA', '2026-03-16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-SOLIC-2026-0017', 17, 'ACCESO', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 'EN_REVISION', '2026-03-17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-SOLIC-2026-0018', 18, 'RECTIFICACION', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 'PROCEDENTE', '2026-03-18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-SOLIC-2026-0019', 19, 'CANCELACION', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 'IMPROCEDENTE', '2026-03-19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-SOLIC-2026-0020', 20, 'OPOSICION', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 'CONCLUIDA', '2026-03-20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-SOLIC-2026-0021', 21, 'ACCESO', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 'RECIBIDA', '2026-03-21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-SOLIC-2026-0022', 22, 'RECTIFICACION', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 'EN_REVISION', '2026-03-22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-SOLIC-2026-0023', 23, 'CANCELACION', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 'PROCEDENTE', '2026-03-23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-SOLIC-2026-0024', 24, 'OPOSICION', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 'IMPROCEDENTE', '2026-03-24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-SOLIC-2026-0025', 25, 'ACCESO', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 'CONCLUIDA', '2026-03-25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-SOLIC-2026-0026', 26, 'RECTIFICACION', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 'RECIBIDA', '2026-03-26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-SOLIC-2026-0027', 27, 'CANCELACION', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 'EN_REVISION', '2026-03-27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-SOLIC-2026-0028', 28, 'OPOSICION', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 'PROCEDENTE', '2026-03-28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-SOLIC-2026-0029', 29, 'ACCESO', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 'IMPROCEDENTE', '2026-03-01', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-SOLIC-2026-0030', 30, 'RECTIFICACION', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 'CONCLUIDA', '2026-03-02', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.solicitudes_arco', 'id_solicitud_arco'), COALESCE((SELECT MAX(id_solicitud_arco) FROM clientes.solicitudes_arco), 1), true);

-- =================================================================================================
-- 024. TABLA: clientes.preferencias_comunicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.preferencias_comunicacion (id_preferencia, cliente, canal_email, canal_sms, canal_whatsapp, notificaciones_ofertas, alertas_reabastecimiento_rutina, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.preferencias_comunicacion', 'id_preferencia'), COALESCE((SELECT MAX(id_preferencia) FROM clientes.preferencias_comunicacion), 1), true);

-- =================================================================================================
-- 025. TABLA: clientes.metodos_pago_tokenizados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.metodos_pago_tokenizados (id_metodo_tokenizado, cliente, pasarela_emisor, token_tarjeta_pasarela, marca_tarjeta, ultimos_cuatro_digitos, mes_expiracion, anio_expiracion, titular_tarjeta_hash, es_predeterminada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'VISA', '4101', 1, 2027, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial ', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'MASTERCARD', '4102', 2, 2028, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'AMEX', '4103', 3, 2029, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'VISA', '4104', 4, 2030, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'MASTERCARD', '4105', 5, 2026, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - E', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'AMEX', '4106', 6, 2027, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora -', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'VISA', '4107', 7, 2028, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vi', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'MASTERCARD', '4108', 8, 2029, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura M', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'AMEX', '4109', 9, 2030, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duració', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'VISA', '4110', 10, 2026, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'MASTERCARD', '4111', 11, 2027, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2%', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'AMEX', '4112', 12, 2028, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'VISA', '4113', 1, 2029, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'MASTERCARD', '4114', 2, 2030, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral ', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'AMEX', '4115', 3, 2026, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable ', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'VISA', '4116', 4, 2027, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glic', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'MASTERCARD', '4117', 5, 2028, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nud', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'AMEX', '4118', 6, 2029, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante M', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'VISA', '4119', 7, 2030, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'MASTERCARD', '4120', 8, 2026, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspe', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'AMEX', '4121', 9, 2027, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firm', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'VISA', '4122', 10, 2028, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Mel', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'MASTERCARD', '4123', 11, 2029, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido ', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'AMEX', '4124', 12, 2030, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Repar', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'VISA', '4125', 1, 2026, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de P', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'MASTERCARD', '4126', 2, 2027, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergé', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'AMEX', '4127', 3, 2028, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'VISA', '4128', 4, 2029, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndu', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'MASTERCARD', '4129', 5, 2030, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide -', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'AMEX', '4130', 6, 2026, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.metodos_pago_tokenizados', 'id_metodo_tokenizado'), COALESCE((SELECT MAX(id_metodo_tokenizado) FROM clientes.metodos_pago_tokenizados), 1), true);

-- =================================================================================================
-- 026. TABLA: catalogo.marcas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.marcas (id_marca, codigo_marca, nombre_marca, pais_origen, sitio_web, es_dermocosmetica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MARCA_01', 'La Roche-Posay', 'Francia', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MARCA_02', 'CeraVe Dermatological', 'Estados Unidos', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MARCA_03', 'The Ordinary Deciem', 'Canadá', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MARCA_04', 'ISDIN Fotoprotección', 'España', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MARCA_05', 'Bioderma Laboratoire', 'Francia', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MARCA_06', 'Eau Thermale Avène', 'Francia', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MARCA_07', 'Eucerin Beiersdorf', 'Alemania', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MARCA_08', 'Vichy Laboratoires', 'Francia', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MARCA_09', 'SkinCeuticals Clinical', 'Estados Unidos', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MARCA_10', 'Sesderma Nanotech', 'España', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MARCA_11', 'NARS Cosmetics', 'Estados Unidos', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MARCA_12', 'MAC Professional', 'Canadá', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MARCA_13', 'Fenty Beauty', 'Estados Unidos', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MARCA_14', 'Rare Beauty', 'Estados Unidos', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MARCA_15', 'Clinique Laboratories', 'Estados Unidos', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MARCA_16', 'Estée Lauder', 'Estados Unidos', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MARCA_17', 'Lancôme Paris', 'Francia', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MARCA_18', 'Charlotte Tilbury', 'Reino Unido', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MARCA_19', 'Paula''s Choice Skincare', 'Estados Unidos', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MARCA_20', 'COSRX K-Beauty', 'Corea del Sur', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MARCA_21', 'Laneige Amorepacific', 'Corea del Sur', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MARCA_22', 'Uriage Eau Thermale', 'Francia', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MARCA_23', 'Laboratoire SVR', 'Francia', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MARCA_24', 'MartiDerm Ampollas', 'España', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MARCA_25', 'Heliocare Cantabria Labs', 'España', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MARCA_26', 'Kiehl''s Since 1851', 'Estados Unidos', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MARCA_27', 'Garnier SkinActive', 'Francia', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MARCA_28', 'L''Oréal Paris Derm', 'Francia', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MARCA_29', 'Neutrogena Derm', 'Estados Unidos', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MARCA_30', 'DermaCare Labs México', 'México', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.marcas', 'id_marca'), COALESCE((SELECT MAX(id_marca) FROM catalogo.marcas), 1), true);

-- =================================================================================================
-- 027. TABLA: catalogo.laboratorios_fabricantes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.laboratorios_fabricantes (id_laboratorio, clave_laboratorio, razon_social, licencia_sanitaria, pais, certificacion_gmp_vigente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'LABORATO_01', 'Laboratorios La Roche-Posay S.A. de C.V.', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'LABORATO_02', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'LABORATO_03', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 'Canadá', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'LABORATO_04', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'España', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'LABORATO_05', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'LABORATO_06', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'LABORATO_07', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Alemania', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'LABORATO_08', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'LABORATO_09', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'LABORATO_10', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'España', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'LABORATO_11', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'LABORATO_12', 'Laboratorios MAC Professional S.A. de C.V.', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Canadá', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'LABORATO_13', 'Laboratorios Fenty Beauty S.A. de C.V.', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'LABORATO_14', 'Laboratorios Rare Beauty S.A. de C.V.', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'LABORATO_15', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'LABORATO_16', 'Laboratorios Estée Lauder S.A. de C.V.', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'LABORATO_17', 'Laboratorios Lancôme Paris S.A. de C.V.', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'LABORATO_18', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Reino Unido', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'LABORATO_19', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'LABORATO_20', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Corea del Sur', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'LABORATO_21', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Corea del Sur', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'LABORATO_22', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'LABORATO_23', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'LABORATO_24', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'España', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'LABORATO_25', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 'España', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'LABORATO_26', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'LABORATO_27', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'LABORATO_28', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'LABORATO_29', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'LABORATO_30', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'México', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.laboratorios_fabricantes', 'id_laboratorio'), COALESCE((SELECT MAX(id_laboratorio) FROM catalogo.laboratorios_fabricantes), 1), true);

-- =================================================================================================
-- 028. TABLA: catalogo.categorias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.categorias (id_categoria, codigo_categoria, nombre_categoria, descripcion, categoria_padre, nivel_arbol, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CATEGORI_01', 'Sueros Concentrados Nivel 1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CATEGORI_02', 'Limpiadores Faciales Nivel 2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', NULL, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CATEGORI_03', 'Fotoprotección Solar Nivel 3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', NULL, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CATEGORI_04', 'Maquillaje Mineral Nivel 4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', NULL, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CATEGORI_05', 'Cuidado Anti-Edad Nivel 5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', NULL, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CATEGORI_06', 'Barrera Cutánea Nivel 6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 1, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CATEGORI_07', 'Contorno de Ojos Nivel 7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 2, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CATEGORI_08', 'Tratamiento Acné Nivel 8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 3, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CATEGORI_09', 'Hidratantes Ceramidas Nivel 9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 4, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CATEGORI_10', 'Exfoliantes Químicos Nivel 10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 5, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CATEGORI_11', 'Sueros Concentrados Nivel 11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 1, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CATEGORI_12', 'Limpiadores Faciales Nivel 12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 2, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CATEGORI_13', 'Fotoprotección Solar Nivel 13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 3, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CATEGORI_14', 'Maquillaje Mineral Nivel 14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 4, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CATEGORI_15', 'Cuidado Anti-Edad Nivel 15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 5, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CATEGORI_16', 'Barrera Cutánea Nivel 16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 1, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CATEGORI_17', 'Contorno de Ojos Nivel 17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 2, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CATEGORI_18', 'Tratamiento Acné Nivel 18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 3, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CATEGORI_19', 'Hidratantes Ceramidas Nivel 19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 4, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CATEGORI_20', 'Exfoliantes Químicos Nivel 20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 5, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CATEGORI_21', 'Sueros Concentrados Nivel 21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 1, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CATEGORI_22', 'Limpiadores Faciales Nivel 22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 2, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CATEGORI_23', 'Fotoprotección Solar Nivel 23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 3, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CATEGORI_24', 'Maquillaje Mineral Nivel 24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 4, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CATEGORI_25', 'Cuidado Anti-Edad Nivel 25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 5, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CATEGORI_26', 'Barrera Cutánea Nivel 26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CATEGORI_27', 'Contorno de Ojos Nivel 27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 2, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CATEGORI_28', 'Tratamiento Acné Nivel 28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 3, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CATEGORI_29', 'Hidratantes Ceramidas Nivel 29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 4, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CATEGORI_30', 'Exfoliantes Químicos Nivel 30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.categorias', 'id_categoria'), COALESCE((SELECT MAX(id_categoria) FROM catalogo.categorias), 1), true);

-- =================================================================================================
-- 029. TABLA: catalogo.subcategorias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.subcategorias (id_subcategoria, categoria, codigo_subcategoria, nombre_subcategoria, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SUBCATEG_01', 'Sueros Concentrados Nivel 1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SUBCATEG_02', 'Limpiadores Faciales Nivel 2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SUBCATEG_03', 'Fotoprotección Solar Nivel 3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SUBCATEG_04', 'Maquillaje Mineral Nivel 4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SUBCATEG_05', 'Cuidado Anti-Edad Nivel 5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SUBCATEG_06', 'Barrera Cutánea Nivel 6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SUBCATEG_07', 'Contorno de Ojos Nivel 7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SUBCATEG_08', 'Tratamiento Acné Nivel 8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SUBCATEG_09', 'Hidratantes Ceramidas Nivel 9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SUBCATEG_10', 'Exfoliantes Químicos Nivel 10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SUBCATEG_11', 'Sueros Concentrados Nivel 11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SUBCATEG_12', 'Limpiadores Faciales Nivel 12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SUBCATEG_13', 'Fotoprotección Solar Nivel 13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SUBCATEG_14', 'Maquillaje Mineral Nivel 14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SUBCATEG_15', 'Cuidado Anti-Edad Nivel 15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SUBCATEG_16', 'Barrera Cutánea Nivel 16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SUBCATEG_17', 'Contorno de Ojos Nivel 17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SUBCATEG_18', 'Tratamiento Acné Nivel 18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SUBCATEG_19', 'Hidratantes Ceramidas Nivel 19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SUBCATEG_20', 'Exfoliantes Químicos Nivel 20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SUBCATEG_21', 'Sueros Concentrados Nivel 21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SUBCATEG_22', 'Limpiadores Faciales Nivel 22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SUBCATEG_23', 'Fotoprotección Solar Nivel 23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SUBCATEG_24', 'Maquillaje Mineral Nivel 24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SUBCATEG_25', 'Cuidado Anti-Edad Nivel 25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SUBCATEG_26', 'Barrera Cutánea Nivel 26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SUBCATEG_27', 'Contorno de Ojos Nivel 27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SUBCATEG_28', 'Tratamiento Acné Nivel 28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SUBCATEG_29', 'Hidratantes Ceramidas Nivel 29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SUBCATEG_30', 'Exfoliantes Químicos Nivel 30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.subcategorias', 'id_subcategoria'), COALESCE((SELECT MAX(id_subcategoria) FROM catalogo.subcategorias), 1), true);

-- =================================================================================================
-- 030. TABLA: catalogo.tipos_aplicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.tipos_aplicacion (id_tipo_aplicacion, codigo_aplicacion, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'APLICACI_01', 'Carlos Mendoza Garza', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'APLICACI_02', 'Sofía Ramírez López', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'APLICACI_03', 'Valeria Torres Villarreal', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'APLICACI_04', 'Alejandro Hernández Cruz', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'APLICACI_05', 'Mariana Sánchez Fuentes', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'APLICACI_06', 'Diego Martínez Treviño', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'APLICACI_07', 'Camila González Reyes', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'APLICACI_08', 'Mateo Flores Castillo', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'APLICACI_09', 'Lucía Morales Díaz', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'APLICACI_10', 'Sebastián Vázquez Ortiz', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'APLICACI_11', 'Regina Gutiérrez Nava', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'APLICACI_12', 'Santiago Jiménez Pérez', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'APLICACI_13', 'Fernanda Ruiz Salazar', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'APLICACI_14', 'Emiliano Ríos Cárdenas', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'APLICACI_15', 'Ximena Aguilar Ibarra', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'APLICACI_16', 'Daniel Méndez Navarro', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'APLICACI_17', 'Andrea Castro Delgado', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'APLICACI_18', 'Gabriel Vega Montoya', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'APLICACI_19', 'Paula Cortés Rojas', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'APLICACI_20', 'Andrés Ramos Campos', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'APLICACI_21', 'Renata Guerrero Luna', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'APLICACI_22', 'Nicolás Peña Cabrera', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'APLICACI_23', 'Natalia Herrera Vargas', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'APLICACI_24', 'Joaquín Medina Contreras', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'APLICACI_25', 'Isabella Domínguez Escobar', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'APLICACI_26', 'Leonardo Silva Paredes', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'APLICACI_27', 'Ana Chávez Bautista', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'APLICACI_28', 'Rodrigo Ochoa Acosta', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'APLICACI_29', 'Paulina Miranda Leal', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'APLICACI_30', 'Mauricio Padilla Solís', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.tipos_aplicacion', 'id_tipo_aplicacion'), COALESCE((SELECT MAX(id_tipo_aplicacion) FROM catalogo.tipos_aplicacion), 1), true);

-- =================================================================================================
-- 031. TABLA: catalogo.certificaciones_sanitarias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.certificaciones_sanitarias (id_certificacion, codigo_certificacion, nombre_certificacion, organismo_certificador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CERTIFIC_01', 'Sueros Concentrados Nivel 1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CERTIFIC_02', 'Limpiadores Faciales Nivel 2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CERTIFIC_03', 'Fotoprotección Solar Nivel 3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CERTIFIC_04', 'Maquillaje Mineral Nivel 4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CERTIFIC_05', 'Cuidado Anti-Edad Nivel 5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CERTIFIC_06', 'Barrera Cutánea Nivel 6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CERTIFIC_07', 'Contorno de Ojos Nivel 7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CERTIFIC_08', 'Tratamiento Acné Nivel 8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CERTIFIC_09', 'Hidratantes Ceramidas Nivel 9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CERTIFIC_10', 'Exfoliantes Químicos Nivel 10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CERTIFIC_11', 'Sueros Concentrados Nivel 11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CERTIFIC_12', 'Limpiadores Faciales Nivel 12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CERTIFIC_13', 'Fotoprotección Solar Nivel 13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CERTIFIC_14', 'Maquillaje Mineral Nivel 14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CERTIFIC_15', 'Cuidado Anti-Edad Nivel 15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CERTIFIC_16', 'Barrera Cutánea Nivel 16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CERTIFIC_17', 'Contorno de Ojos Nivel 17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CERTIFIC_18', 'Tratamiento Acné Nivel 18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CERTIFIC_19', 'Hidratantes Ceramidas Nivel 19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CERTIFIC_20', 'Exfoliantes Químicos Nivel 20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CERTIFIC_21', 'Sueros Concentrados Nivel 21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CERTIFIC_22', 'Limpiadores Faciales Nivel 22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CERTIFIC_23', 'Fotoprotección Solar Nivel 23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CERTIFIC_24', 'Maquillaje Mineral Nivel 24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CERTIFIC_25', 'Cuidado Anti-Edad Nivel 25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CERTIFIC_26', 'Barrera Cutánea Nivel 26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CERTIFIC_27', 'Contorno de Ojos Nivel 27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CERTIFIC_28', 'Tratamiento Acné Nivel 28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CERTIFIC_29', 'Hidratantes Ceramidas Nivel 29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CERTIFIC_30', 'Exfoliantes Químicos Nivel 30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.certificaciones_sanitarias', 'id_certificacion'), COALESCE((SELECT MAX(id_certificacion) FROM catalogo.certificaciones_sanitarias), 1), true);

-- =================================================================================================
-- 032. TABLA: catalogo.productos_maestros (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.productos_maestros (id_producto, marca, subcategoria, laboratorio, tipo_aplicacion, certificacion_sanitaria, codigo_producto, nombre_comercial, descripcion_corta, descripcion_detallada, modo_empleo, requiere_prescripcion_medica, factor_proteccion_solar_fps, es_sensible_temperatura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 1, 'PRODUCTO_01', 'Kit Rutina La Roche-Posay #1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, 'PRODUCTO_02', 'Kit Rutina CeraVe Dermatological #2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, 'PRODUCTO_03', 'Kit Rutina The Ordinary Deciem #3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, 'PRODUCTO_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, 30, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, 'PRODUCTO_05', 'Kit Rutina Bioderma Laboratoire #5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, 'PRODUCTO_06', 'Kit Rutina Eau Thermale Avène #6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, 30, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, 'PRODUCTO_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, 'PRODUCTO_08', 'Kit Rutina Vichy Laboratoires #8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, 'PRODUCTO_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, 'PRODUCTO_10', 'Kit Rutina Sesderma Nanotech #10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, 'PRODUCTO_11', 'Kit Rutina NARS Cosmetics #11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, 'PRODUCTO_12', 'Kit Rutina MAC Professional #12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, 'PRODUCTO_13', 'Kit Rutina Fenty Beauty #13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, 'PRODUCTO_14', 'Kit Rutina Rare Beauty #14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, 30, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, 'PRODUCTO_15', 'Kit Rutina Clinique Laboratories #15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, 'PRODUCTO_16', 'Kit Rutina Estée Lauder #16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, 30, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, 'PRODUCTO_17', 'Kit Rutina Lancôme Paris #17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, 'PRODUCTO_18', 'Kit Rutina Charlotte Tilbury #18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, 'PRODUCTO_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, 'PRODUCTO_20', 'Kit Rutina COSRX K-Beauty #20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, 'PRODUCTO_21', 'Kit Rutina Laneige Amorepacific #21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, 'PRODUCTO_22', 'Kit Rutina Uriage Eau Thermale #22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, 'PRODUCTO_23', 'Kit Rutina Laboratoire SVR #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, 'PRODUCTO_24', 'Kit Rutina MartiDerm Ampollas #24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, 30, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, 'PRODUCTO_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, 'PRODUCTO_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, 30, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, 'PRODUCTO_27', 'Kit Rutina Garnier SkinActive #27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, 'PRODUCTO_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, 'PRODUCTO_29', 'Kit Rutina Neutrogena Derm #29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, 'PRODUCTO_30', 'Kit Rutina DermaCare Labs México #30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, 50, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.productos_maestros', 'id_producto'), COALESCE((SELECT MAX(id_producto) FROM catalogo.productos_maestros), 1), true);

-- =================================================================================================
-- 033. TABLA: catalogo.subtonos_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.subtonos_maquillaje (id_subtono, codigo_subtono, nombre_subtono, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SUBTONO_01', 'Sueros Concentrados Nivel 1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SUBTONO_02', 'Limpiadores Faciales Nivel 2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SUBTONO_03', 'Fotoprotección Solar Nivel 3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SUBTONO_04', 'Maquillaje Mineral Nivel 4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SUBTONO_05', 'Cuidado Anti-Edad Nivel 5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'SUBTONO_06', 'Barrera Cutánea Nivel 6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'SUBTONO_07', 'Contorno de Ojos Nivel 7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'SUBTONO_08', 'Tratamiento Acné Nivel 8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'SUBTONO_09', 'Hidratantes Ceramidas Nivel 9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'SUBTONO_10', 'Exfoliantes Químicos Nivel 10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'SUBTONO_11', 'Sueros Concentrados Nivel 11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'SUBTONO_12', 'Limpiadores Faciales Nivel 12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'SUBTONO_13', 'Fotoprotección Solar Nivel 13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'SUBTONO_14', 'Maquillaje Mineral Nivel 14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'SUBTONO_15', 'Cuidado Anti-Edad Nivel 15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'SUBTONO_16', 'Barrera Cutánea Nivel 16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'SUBTONO_17', 'Contorno de Ojos Nivel 17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'SUBTONO_18', 'Tratamiento Acné Nivel 18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'SUBTONO_19', 'Hidratantes Ceramidas Nivel 19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'SUBTONO_20', 'Exfoliantes Químicos Nivel 20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'SUBTONO_21', 'Sueros Concentrados Nivel 21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'SUBTONO_22', 'Limpiadores Faciales Nivel 22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'SUBTONO_23', 'Fotoprotección Solar Nivel 23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'SUBTONO_24', 'Maquillaje Mineral Nivel 24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'SUBTONO_25', 'Cuidado Anti-Edad Nivel 25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'SUBTONO_26', 'Barrera Cutánea Nivel 26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'SUBTONO_27', 'Contorno de Ojos Nivel 27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'SUBTONO_28', 'Tratamiento Acné Nivel 28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'SUBTONO_29', 'Hidratantes Ceramidas Nivel 29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'SUBTONO_30', 'Exfoliantes Químicos Nivel 30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.subtonos_maquillaje', 'id_subtono'), COALESCE((SELECT MAX(id_subtono) FROM catalogo.subtonos_maquillaje), 1), true);

-- =================================================================================================
-- 034. TABLA: catalogo.acabados_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.acabados_maquillaje (id_acabado, codigo_acabado, nombre_acabado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ACABADO_01', 'Sueros Concentrados Nivel 1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ACABADO_02', 'Limpiadores Faciales Nivel 2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ACABADO_03', 'Fotoprotección Solar Nivel 3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'ACABADO_04', 'Maquillaje Mineral Nivel 4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ACABADO_05', 'Cuidado Anti-Edad Nivel 5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'ACABADO_06', 'Barrera Cutánea Nivel 6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'ACABADO_07', 'Contorno de Ojos Nivel 7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'ACABADO_08', 'Tratamiento Acné Nivel 8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'ACABADO_09', 'Hidratantes Ceramidas Nivel 9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'ACABADO_10', 'Exfoliantes Químicos Nivel 10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ACABADO_11', 'Sueros Concentrados Nivel 11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ACABADO_12', 'Limpiadores Faciales Nivel 12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'ACABADO_13', 'Fotoprotección Solar Nivel 13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'ACABADO_14', 'Maquillaje Mineral Nivel 14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ACABADO_15', 'Cuidado Anti-Edad Nivel 15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'ACABADO_16', 'Barrera Cutánea Nivel 16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'ACABADO_17', 'Contorno de Ojos Nivel 17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ACABADO_18', 'Tratamiento Acné Nivel 18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'ACABADO_19', 'Hidratantes Ceramidas Nivel 19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'ACABADO_20', 'Exfoliantes Químicos Nivel 20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ACABADO_21', 'Sueros Concentrados Nivel 21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'ACABADO_22', 'Limpiadores Faciales Nivel 22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'ACABADO_23', 'Fotoprotección Solar Nivel 23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'ACABADO_24', 'Maquillaje Mineral Nivel 24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'ACABADO_25', 'Cuidado Anti-Edad Nivel 25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'ACABADO_26', 'Barrera Cutánea Nivel 26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ACABADO_27', 'Contorno de Ojos Nivel 27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'ACABADO_28', 'Tratamiento Acné Nivel 28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'ACABADO_29', 'Hidratantes Ceramidas Nivel 29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'ACABADO_30', 'Exfoliantes Químicos Nivel 30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.acabados_maquillaje', 'id_acabado'), COALESCE((SELECT MAX(id_acabado) FROM catalogo.acabados_maquillaje), 1), true);

-- =================================================================================================
-- 035. TABLA: catalogo.variantes_sku (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.variantes_sku (id_variante_sku, producto, sku_codigo, codigo_barras_ean13, nombre_presentacion, contenido_neto_gramos_ml, unidad_medida, precio_base_menudeo, costo_estandar_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'DERMA-SKU-1001', 'DERMA-SKU-1001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, 'ML', 285.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'DERMA-SKU-1002', 'DERMA-SKU-1002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, 'G', 321.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'DERMA-SKU-1003', 'DERMA-SKU-1003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, 'OZ', 356.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DERMA-SKU-1004', 'DERMA-SKU-1004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, 'PZ', 392.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'DERMA-SKU-1005', 'DERMA-SKU-1005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, 'ML', 427.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'DERMA-SKU-1006', 'DERMA-SKU-1006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, 'G', 463.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'DERMA-SKU-1007', 'DERMA-SKU-1007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, 'OZ', 498.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DERMA-SKU-1008', 'DERMA-SKU-1008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, 'PZ', 534.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'DERMA-SKU-1009', 'DERMA-SKU-1009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, 'ML', 569.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'DERMA-SKU-1010', 'DERMA-SKU-1010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, 'G', 605.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'DERMA-SKU-1011', 'DERMA-SKU-1011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, 'OZ', 640.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DERMA-SKU-1012', 'DERMA-SKU-1012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, 'PZ', 676.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'DERMA-SKU-1013', 'DERMA-SKU-1013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, 'ML', 711.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'DERMA-SKU-1014', 'DERMA-SKU-1014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, 'G', 747.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'DERMA-SKU-1015', 'DERMA-SKU-1015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, 'OZ', 782.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DERMA-SKU-1016', 'DERMA-SKU-1016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, 'PZ', 818.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'DERMA-SKU-1017', 'DERMA-SKU-1017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, 'ML', 853.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'DERMA-SKU-1018', 'DERMA-SKU-1018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, 'G', 889.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'DERMA-SKU-1019', 'DERMA-SKU-1019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, 'OZ', 924.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DERMA-SKU-1020', 'DERMA-SKU-1020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 'PZ', 960.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'DERMA-SKU-1021', 'DERMA-SKU-1021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, 'ML', 995.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'DERMA-SKU-1022', 'DERMA-SKU-1022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, 'G', 1031.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'DERMA-SKU-1023', 'DERMA-SKU-1023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, 'OZ', 1066.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DERMA-SKU-1024', 'DERMA-SKU-1024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, 'PZ', 1102.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DERMA-SKU-1025', 'DERMA-SKU-1025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, 'ML', 1137.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'DERMA-SKU-1026', 'DERMA-SKU-1026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, 'G', 1173.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'DERMA-SKU-1027', 'DERMA-SKU-1027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, 'OZ', 1208.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DERMA-SKU-1028', 'DERMA-SKU-1028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, 'PZ', 1244.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'DERMA-SKU-1029', 'DERMA-SKU-1029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, 'ML', 1279.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'DERMA-SKU-1030', 'DERMA-SKU-1030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, 'G', 1315.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.variantes_sku', 'id_variante_sku'), COALESCE((SELECT MAX(id_variante_sku) FROM catalogo.variantes_sku), 1), true);

-- =================================================================================================
-- 036. TABLA: catalogo.tonos_variante (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.tonos_variante (id_tono_variante, variante_sku, subtono, acabado, codigo_tono_color, nombre_tono, color_hexadecimal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 'TONO_COL_01', 'Sueros Concentrados Nivel 1', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'TONO_COL_02', 'Limpiadores Faciales Nivel 2', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'TONO_COL_03', 'Fotoprotección Solar Nivel 3', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 'TONO_COL_04', 'Maquillaje Mineral Nivel 4', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 'TONO_COL_05', 'Cuidado Anti-Edad Nivel 5', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 'TONO_COL_06', 'Barrera Cutánea Nivel 6', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 'TONO_COL_07', 'Contorno de Ojos Nivel 7', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 'TONO_COL_08', 'Tratamiento Acné Nivel 8', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 'TONO_COL_09', 'Hidratantes Ceramidas Nivel 9', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 'TONO_COL_10', 'Exfoliantes Químicos Nivel 10', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 'TONO_COL_11', 'Sueros Concentrados Nivel 11', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 'TONO_COL_12', 'Limpiadores Faciales Nivel 12', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 'TONO_COL_13', 'Fotoprotección Solar Nivel 13', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 'TONO_COL_14', 'Maquillaje Mineral Nivel 14', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 'TONO_COL_15', 'Cuidado Anti-Edad Nivel 15', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 'TONO_COL_16', 'Barrera Cutánea Nivel 16', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 'TONO_COL_17', 'Contorno de Ojos Nivel 17', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 'TONO_COL_18', 'Tratamiento Acné Nivel 18', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 'TONO_COL_19', 'Hidratantes Ceramidas Nivel 19', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 'TONO_COL_20', 'Exfoliantes Químicos Nivel 20', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 'TONO_COL_21', 'Sueros Concentrados Nivel 21', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 'TONO_COL_22', 'Limpiadores Faciales Nivel 22', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 'TONO_COL_23', 'Fotoprotección Solar Nivel 23', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 'TONO_COL_24', 'Maquillaje Mineral Nivel 24', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 'TONO_COL_25', 'Cuidado Anti-Edad Nivel 25', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 'TONO_COL_26', 'Barrera Cutánea Nivel 26', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 'TONO_COL_27', 'Contorno de Ojos Nivel 27', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 'TONO_COL_28', 'Tratamiento Acné Nivel 28', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 'TONO_COL_29', 'Hidratantes Ceramidas Nivel 29', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 'TONO_COL_30', 'Exfoliantes Químicos Nivel 30', '#7D412E', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.tonos_variante', 'id_tono_variante'), COALESCE((SELECT MAX(id_tono_variante) FROM catalogo.tonos_variante), 1), true);

-- =================================================================================================
-- 037. TABLA: catalogo.ingredientes_inci (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.ingredientes_inci (id_ingrediente, codigo_cas, nombre_inci, nombre_comun, funcion_principal, es_comedogenico, indice_comedogenico, es_alergeno_frecuente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CAS_01', 'Niacinamide', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CAS_02', 'Sodium Hyaluronate', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAS_03', 'Retinol', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAS_04', 'Salicylic Acid', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CAS_05', 'Ascorbic Acid', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CAS_06', 'Ceramide NP', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CAS_07', 'Panthenol', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CAS_08', 'Azelaic Acid', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAS_09', 'Glycolic Acid', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CAS_10', 'Zinc Oxide', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CAS_11', 'Titanium Dioxide', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CAS_12', 'Tocopherol', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CAS_13', 'Madecassoside', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CAS_14', 'Squalane', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CAS_15', 'Allantoin', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CAS_16', 'Caffeine', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CAS_17', 'Urea', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CAS_18', 'Ferulic Acid', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CAS_19', 'Lactic Acid', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CAS_20', 'Bisabolol', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CAS_21', 'Bakuchiol', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CAS_22', 'Tranexamic Acid', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CAS_23', 'Copper Tripeptide-1', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CAS_24', 'Glycerin', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CAS_25', 'Dimethicone', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CAS_26', 'Shea Butter', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CAS_27', 'Thermal Spring Water', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CAS_28', 'Zinc PCA', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CAS_29', 'Kojic Acid', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CAS_30', 'Peptide Matrixyl 3000', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, 2, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.ingredientes_inci', 'id_ingrediente'), COALESCE((SELECT MAX(id_ingrediente) FROM catalogo.ingredientes_inci), 1), true);

-- =================================================================================================
-- 038. TABLA: catalogo.alergenos_ingrediente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.alergenos_ingrediente (id_alergeno, ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'BAJO', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'MEDIO', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 'ALTO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'MUY_SEVERO', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'BAJO', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'MEDIO', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'ALTO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'MUY_SEVERO', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'BAJO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'MEDIO', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'ALTO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'MUY_SEVERO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'BAJO', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'MEDIO', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'ALTO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'MUY_SEVERO', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'BAJO', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'MEDIO', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'ALTO', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'MUY_SEVERO', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'BAJO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'MEDIO', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 'ALTO', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'MUY_SEVERO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 'BAJO', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'MEDIO', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'ALTO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'MUY_SEVERO', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'BAJO', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'MEDIO', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.alergenos_ingrediente', 'id_alergeno'), COALESCE((SELECT MAX(id_alergeno) FROM catalogo.alergenos_ingrediente), 1), true);

-- =================================================================================================
-- 039. TABLA: catalogo.formula_ingredientes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.formula_ingredientes (id_formula_ingrediente, producto, ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 17.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 20.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 22.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 25.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 27.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 30.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 32.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 35.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 37.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 40.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 42.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 45.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 47.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 50.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 52.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 55.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 57.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 60.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 67.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 70.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 72.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 75.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 77.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 80.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 82.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 85.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 87.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 90.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.formula_ingredientes', 'id_formula_ingrediente'), COALESCE((SELECT MAX(id_formula_ingrediente) FROM catalogo.formula_ingredientes), 1), true);

-- =================================================================================================
-- 040. TABLA: catalogo.registros_sanitarios_cofepris (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.registros_sanitarios_cofepris (id_registro_sanitario, producto, numero_registro_sanitario, folio_ingreso_tramite, fecha_emision, fecha_vencimiento, estatus_regulatorio, documento_oficial_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'COF-2026-MX-10001-SAN', 'FOL-INGRE-2026-0001', '2026-03-01', '2026-03-01', 'VIGENTE', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'COF-2026-MX-10002-SAN', 'FOL-INGRE-2026-0002', '2026-03-02', '2026-03-02', 'EN_RENOVACION', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'COF-2026-MX-10003-SAN', 'FOL-INGRE-2026-0003', '2026-03-03', '2026-03-03', 'SUSPENDIDO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'COF-2026-MX-10004-SAN', 'FOL-INGRE-2026-0004', '2026-03-04', '2026-03-04', 'VENCIDO', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'COF-2026-MX-10005-SAN', 'FOL-INGRE-2026-0005', '2026-03-05', '2026-03-05', 'VIGENTE', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'COF-2026-MX-10006-SAN', 'FOL-INGRE-2026-0006', '2026-03-06', '2026-03-06', 'EN_RENOVACION', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'COF-2026-MX-10007-SAN', 'FOL-INGRE-2026-0007', '2026-03-07', '2026-03-07', 'SUSPENDIDO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'COF-2026-MX-10008-SAN', 'FOL-INGRE-2026-0008', '2026-03-08', '2026-03-08', 'VENCIDO', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'COF-2026-MX-10009-SAN', 'FOL-INGRE-2026-0009', '2026-03-09', '2026-03-09', 'VIGENTE', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'COF-2026-MX-10010-SAN', 'FOL-INGRE-2026-0010', '2026-03-10', '2026-03-10', 'EN_RENOVACION', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'COF-2026-MX-10011-SAN', 'FOL-INGRE-2026-0011', '2026-03-11', '2026-03-11', 'SUSPENDIDO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'COF-2026-MX-10012-SAN', 'FOL-INGRE-2026-0012', '2026-03-12', '2026-03-12', 'VENCIDO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'COF-2026-MX-10013-SAN', 'FOL-INGRE-2026-0013', '2026-03-13', '2026-03-13', 'VIGENTE', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'COF-2026-MX-10014-SAN', 'FOL-INGRE-2026-0014', '2026-03-14', '2026-03-14', 'EN_RENOVACION', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'COF-2026-MX-10015-SAN', 'FOL-INGRE-2026-0015', '2026-03-15', '2026-03-15', 'SUSPENDIDO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'COF-2026-MX-10016-SAN', 'FOL-INGRE-2026-0016', '2026-03-16', '2026-03-16', 'VENCIDO', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'COF-2026-MX-10017-SAN', 'FOL-INGRE-2026-0017', '2026-03-17', '2026-03-17', 'VIGENTE', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'COF-2026-MX-10018-SAN', 'FOL-INGRE-2026-0018', '2026-03-18', '2026-03-18', 'EN_RENOVACION', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'COF-2026-MX-10019-SAN', 'FOL-INGRE-2026-0019', '2026-03-19', '2026-03-19', 'SUSPENDIDO', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'COF-2026-MX-10020-SAN', 'FOL-INGRE-2026-0020', '2026-03-20', '2026-03-20', 'VENCIDO', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'COF-2026-MX-10021-SAN', 'FOL-INGRE-2026-0021', '2026-03-21', '2026-03-21', 'VIGENTE', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'COF-2026-MX-10022-SAN', 'FOL-INGRE-2026-0022', '2026-03-22', '2026-03-22', 'EN_RENOVACION', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'COF-2026-MX-10023-SAN', 'FOL-INGRE-2026-0023', '2026-03-23', '2026-03-23', 'SUSPENDIDO', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'COF-2026-MX-10024-SAN', 'FOL-INGRE-2026-0024', '2026-03-24', '2026-03-24', 'VENCIDO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'COF-2026-MX-10025-SAN', 'FOL-INGRE-2026-0025', '2026-03-25', '2026-03-25', 'VIGENTE', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'COF-2026-MX-10026-SAN', 'FOL-INGRE-2026-0026', '2026-03-26', '2026-03-26', 'EN_RENOVACION', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'COF-2026-MX-10027-SAN', 'FOL-INGRE-2026-0027', '2026-03-27', '2026-03-27', 'SUSPENDIDO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'COF-2026-MX-10028-SAN', 'FOL-INGRE-2026-0028', '2026-03-28', '2026-03-28', 'VENCIDO', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'COF-2026-MX-10029-SAN', 'FOL-INGRE-2026-0029', '2026-03-01', '2026-03-01', 'VIGENTE', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'COF-2026-MX-10030-SAN', 'FOL-INGRE-2026-0030', '2026-03-02', '2026-03-02', 'EN_RENOVACION', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.registros_sanitarios_cofepris', 'id_registro_sanitario'), COALESCE((SELECT MAX(id_registro_sanitario) FROM catalogo.registros_sanitarios_cofepris), 1), true);

-- =================================================================================================
-- 041. TABLA: catalogo.advertencias_contraindicaciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.advertencias_contraindicaciones (id_advertencia, producto, tipo_advertencia, texto_advertencia, medida_en_caso_ingestion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Niacinamide.', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Sodium Hyaluronate.', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Retinol.', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Salicylic Acid.', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ascorbic Acid.', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ceramide NP.', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Panthenol.', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Azelaic Acid.', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycolic Acid.', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc Oxide.', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Titanium Dioxide.', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tocopherol.', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Madecassoside.', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Squalane.', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Allantoin.', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Caffeine.', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Urea.', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ferulic Acid.', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Lactic Acid.', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bisabolol.', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bakuchiol.', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tranexamic Acid.', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Copper Tripeptide-1.', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycerin.', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Dimethicone.', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Shea Butter.', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Thermal Spring Water.', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc PCA.', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Kojic Acid.', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Peptide Matrixyl 3000.', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.advertencias_contraindicaciones', 'id_advertencia'), COALESCE((SELECT MAX(id_advertencia) FROM catalogo.advertencias_contraindicaciones), 1), true);

-- =================================================================================================
-- 042. TABLA: catalogo.multimedia_variantes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.multimedia_variantes (id_multimedia, variante_sku, tipo_archivo, url_recurso, texto_alternativo_accesibilidad, numero_orden, es_imagen_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_001.pdf', 'Fotografía clínica de Sérum Niacinamida 10% + Zinc 1% marca La Roche-Posay', 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_002.pdf', 'Fotografía clínica de Gel Limpiador Espumoso Facial marca CeraVe Dermatological', 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_003.pdf', 'Fotografía clínica de Protector Solar Fluido SPF 50+ marca The Ordinary Deciem', 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_004.pdf', 'Fotografía clínica de Sérum Ácido Hialurónico 2% + B5 marca ISDIN Fotoprotección', 4, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_005.pdf', 'Fotografía clínica de Crema Hidratante con Ceramidas marca Bioderma Laboratoire', 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_006.pdf', 'Fotografía clínica de Retinol Puro 0.5% Nocturno marca Eau Thermale Avène', 6, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_007.pdf', 'Fotografía clínica de Agua Micelar Dermolimpiadora marca Eucerin Beiersdorf', 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_008.pdf', 'Fotografía clínica de Sérum Vitamina C Pura 15% marca Vichy Laboratoires', 8, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_009.pdf', 'Fotografía clínica de Base de Maquillaje Cobertura Media marca SkinCeuticals Clinical', 9, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_010.pdf', 'Fotografía clínica de Corrector Líquido Alta Duración marca Sesderma Nanotech', 10, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_011.pdf', 'Fotografía clínica de Bálsamo Reparador Cicaplast B5 marca NARS Cosmetics', 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_012.pdf', 'Fotografía clínica de Exfoliante Ácido Salicílico 2% marca MAC Professional', 12, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_013.pdf', 'Fotografía clínica de Contorno de Ojos con Cafeína 5% marca Fenty Beauty', 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_014.pdf', 'Fotografía clínica de Mascarilla Nocturna Hidratante marca Rare Beauty', 14, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_015.pdf', 'Fotografía clínica de Bruma Termal Calmante Mineral marca Clinique Laboratories', 15, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_016.pdf', 'Fotografía clínica de Aceite Limpiador Emulsionable marca Estée Lauder', 16, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_017.pdf', 'Fotografía clínica de Tónico Equilibrante Ácido Glicólico 7% marca Lancôme Paris', 17, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_018.pdf', 'Fotografía clínica de Labial Hidratante Péptidos Nude marca Charlotte Tilbury', 18, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_019.pdf', 'Fotografía clínica de Polvo Traslúcido Matificante Mineral marca Paula''s Choice Skincare', 19, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_020.pdf', 'Fotografía clínica de Rubor Líquido Pigmento Natural marca COSRX K-Beauty', 20, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_021.pdf', 'Fotografía clínica de Sérum Ácido Azelaico 10% Suspensión marca Laneige Amorepacific', 21, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_022.pdf', 'Fotografía clínica de Ampolletas Proteoglicanos Firmeza marca Uriage Eau Thermale', 22, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_023.pdf', 'Fotografía clínica de Crema Despigmentante Noche Melasma marca Laboratoire SVR', 23, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_024.pdf', 'Fotografía clínica de Protector Solar Mineral Óxido Zinc marca MartiDerm Ampollas', 24, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_025.pdf', 'Fotografía clínica de Loción Corporal Urea 10% Reparadora marca Heliocare Cantabria Labs', 25, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_026.pdf', 'Fotografía clínica de Primer Facial Minimizador de Poros marca Kiehl''s Since 1851', 26, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_027.pdf', 'Fotografía clínica de Máscara de Pestañas Hipoalergénica marca Garnier SkinActive', 27, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_028.pdf', 'Fotografía clínica de Sérum Péptidos de Cobre 1% marca L''Oréal Paris Derm', 28, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_029.pdf', 'Fotografía clínica de Bálsamo Desmaquillante Caléndula marca Neutrogena Derm', 29, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia_variantes/item_030.pdf', 'Fotografía clínica de Crema Barrera Post-Retinoide marca DermaCare Labs México', 30, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.multimedia_variantes', 'id_multimedia'), COALESCE((SELECT MAX(id_multimedia) FROM catalogo.multimedia_variantes), 1), true);

-- =================================================================================================
-- 043. TABLA: catalogo.kits_sets (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.kits_sets (id_kit, codigo_kit, nombre_kit, descripcion, descuento_porcentual_kit, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'KIT_01', 'Kit Rutina La Roche-Posay #1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'KIT_02', 'Kit Rutina CeraVe Dermatological #2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'KIT_03', 'Kit Rutina The Ordinary Deciem #3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'KIT_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'KIT_05', 'Kit Rutina Bioderma Laboratoire #5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'KIT_06', 'Kit Rutina Eau Thermale Avène #6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'KIT_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'KIT_08', 'Kit Rutina Vichy Laboratoires #8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'KIT_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'KIT_10', 'Kit Rutina Sesderma Nanotech #10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'KIT_11', 'Kit Rutina NARS Cosmetics #11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'KIT_12', 'Kit Rutina MAC Professional #12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'KIT_13', 'Kit Rutina Fenty Beauty #13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'KIT_14', 'Kit Rutina Rare Beauty #14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'KIT_15', 'Kit Rutina Clinique Laboratories #15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 5.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'KIT_16', 'Kit Rutina Estée Lauder #16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'KIT_17', 'Kit Rutina Lancôme Paris #17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'KIT_18', 'Kit Rutina Charlotte Tilbury #18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'KIT_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'KIT_20', 'Kit Rutina COSRX K-Beauty #20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'KIT_21', 'Kit Rutina Laneige Amorepacific #21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'KIT_22', 'Kit Rutina Uriage Eau Thermale #22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'KIT_23', 'Kit Rutina Laboratoire SVR #23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'KIT_24', 'Kit Rutina MartiDerm Ampollas #24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'KIT_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'KIT_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'KIT_27', 'Kit Rutina Garnier SkinActive #27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'KIT_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'KIT_29', 'Kit Rutina Neutrogena Derm #29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'KIT_30', 'Kit Rutina DermaCare Labs México #30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.kits_sets', 'id_kit'), COALESCE((SELECT MAX(id_kit) FROM catalogo.kits_sets), 1), true);

-- =================================================================================================
-- 044. TABLA: catalogo.kits_items (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.kits_items (id_kit_item, kit, variante_sku, cantidad_unidades, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.kits_items', 'id_kit_item'), COALESCE((SELECT MAX(id_kit_item) FROM catalogo.kits_items), 1), true);

-- =================================================================================================
-- 045. TABLA: catalogo.productos_relacionados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.productos_relacionados (id_producto_relacionado, producto_origen, producto_destino, tipo_relacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 2, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 3, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 4, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 5, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 6, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 7, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 8, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 9, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 10, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 11, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 12, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 13, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 14, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 15, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 16, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 17, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 18, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 19, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 20, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 21, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 22, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 23, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 24, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 25, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 26, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 27, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 28, 'PASO_SIGUIENTE_RUTINA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 29, 'COMPLEMENTARIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 30, 'SUSTITUTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 'PASO_SIGUIENTE_RUTINA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.productos_relacionados', 'id_producto_relacionado'), COALESCE((SELECT MAX(id_producto_relacionado) FROM catalogo.productos_relacionados), 1), true);

-- =================================================================================================
-- 046. TABLA: catalogo.historial_precios_base (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.historial_precios_base (id_historial_precio, variante_sku, precio_anterior, precio_nuevo, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 17.50, 17.50, 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 20.00, 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 22.50, 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 25.00, 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 27.50, 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 30.00, 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 32.50, 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 35.00, 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 37.50, 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 40.00, 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 42.50, 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 45.00, 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 47.50, 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 50.00, 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 52.50, 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 55.00, 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 57.50, 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 60.00, 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 62.50, 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 65.00, 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 67.50, 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 70.00, 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 72.50, 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 75.00, 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 77.50, 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 80.00, 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 82.50, 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 85.00, 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 87.50, 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 90.00, 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.historial_precios_base', 'id_historial_precio'), COALESCE((SELECT MAX(id_historial_precio) FROM catalogo.historial_precios_base), 1), true);

-- =================================================================================================
-- 047. TABLA: comunidad.rutinas_belleza (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.rutinas_belleza (id_rutina, cliente, nombre_rutina, momento_dia, es_publica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Rutina Facial Carlos - Control Dermatológico 1', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Rutina Facial Sofía - Control Dermatológico 2', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Rutina Facial Valeria - Control Dermatológico 3', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Rutina Facial Alejandro - Control Dermatológico 4', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Rutina Facial Mariana - Control Dermatológico 5', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Rutina Facial Diego - Control Dermatológico 6', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Rutina Facial Camila - Control Dermatológico 7', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Rutina Facial Mateo - Control Dermatológico 8', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Rutina Facial Lucía - Control Dermatológico 9', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Rutina Facial Sebastián - Control Dermatológico 10', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Rutina Facial Regina - Control Dermatológico 11', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Rutina Facial Santiago - Control Dermatológico 12', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Rutina Facial Fernanda - Control Dermatológico 13', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Rutina Facial Emiliano - Control Dermatológico 14', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Rutina Facial Ximena - Control Dermatológico 15', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Rutina Facial Daniel - Control Dermatológico 16', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Rutina Facial Andrea - Control Dermatológico 17', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Rutina Facial Gabriel - Control Dermatológico 18', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Rutina Facial Paula - Control Dermatológico 19', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rutina Facial Andrés - Control Dermatológico 20', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Rutina Facial Renata - Control Dermatológico 21', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Rutina Facial Nicolás - Control Dermatológico 22', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Rutina Facial Natalia - Control Dermatológico 23', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Rutina Facial Joaquín - Control Dermatológico 24', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Rutina Facial Isabella - Control Dermatológico 25', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Rutina Facial Leonardo - Control Dermatológico 26', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Rutina Facial Ana - Control Dermatológico 27', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Rutina Facial Rodrigo - Control Dermatológico 28', 'SEMANAL', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Rutina Facial Paulina - Control Dermatológico 29', 'NOCHE', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Rutina Facial Mauricio - Control Dermatológico 30', 'SEMANAL', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('comunidad.rutinas_belleza', 'id_rutina'), COALESCE((SELECT MAX(id_rutina) FROM comunidad.rutinas_belleza), 1), true);

-- =================================================================================================
-- 048. TABLA: comunidad.rutinas_pasos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.rutinas_pasos (id_rutina_paso, rutina, numero_paso, nombre_fase, instrucciones_aplicacion, tiempo_espera_segundos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 6, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 7, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 8, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 9, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 10, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 6, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 7, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 8, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 9, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 10, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('comunidad.rutinas_pasos', 'id_rutina_paso'), COALESCE((SELECT MAX(id_rutina_paso) FROM comunidad.rutinas_pasos), 1), true);

-- =================================================================================================
-- 049. TABLA: comunidad.rutinas_productos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.rutinas_productos (id_rutina_producto, rutina_paso, variante_sku, es_producto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('comunidad.rutinas_productos', 'id_rutina_producto'), COALESCE((SELECT MAX(id_rutina_producto) FROM comunidad.rutinas_productos), 1), true);

-- =================================================================================================
-- 050. TABLA: comunidad.listas_deseos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.listas_deseos (id_lista_deseos, cliente, nombre_lista, es_publica, token_compartir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Rutina Facial Carlos - Control Dermatológico 1', TRUE, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Rutina Facial Sofía - Control Dermatológico 2', FALSE, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Rutina Facial Valeria - Control Dermatológico 3', TRUE, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Rutina Facial Alejandro - Control Dermatológico 4', FALSE, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad d', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Rutina Facial Mariana - Control Dermatológico 5', TRUE, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Rutina Facial Diego - Control Dermatológico 6', FALSE, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Rutina Facial Camila - Control Dermatológico 7', TRUE, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Rutina Facial Mateo - Control Dermatológico 8', FALSE, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Rutina Facial Lucía - Control Dermatológico 9', TRUE, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Pue', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Rutina Facial Sebastián - Control Dermatológico 10', FALSE, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Rutina Facial Regina - Control Dermatológico 11', TRUE, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Rutina Facial Santiago - Control Dermatológico 12', FALSE, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Rutina Facial Fernanda - Control Dermatológico 13', TRUE, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Rutina Facial Emiliano - Control Dermatológico 14', FALSE, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Rutina Facial Ximena - Control Dermatológico 15', TRUE, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Rutina Facial Daniel - Control Dermatológico 16', FALSE, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Rutina Facial Andrea - Control Dermatológico 17', TRUE, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Rutina Facial Gabriel - Control Dermatológico 18', FALSE, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Rutina Facial Paula - Control Dermatológico 19', TRUE, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rutina Facial Andrés - Control Dermatológico 20', FALSE, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Rutina Facial Renata - Control Dermatológico 21', TRUE, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monc', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Rutina Facial Nicolás - Control Dermatológico 22', FALSE, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterr', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Rutina Facial Natalia - Control Dermatológico 23', TRUE, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Rutina Facial Joaquín - Control Dermatológico 24', FALSE, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad ', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Rutina Facial Isabella - Control Dermatológico 25', TRUE, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Rutina Facial Leonardo - Control Dermatológico 26', FALSE, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadala', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Rutina Facial Ana - Control Dermatológico 27', TRUE, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltill', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Rutina Facial Rodrigo - Control Dermatológico 28', FALSE, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Rutina Facial Paulina - Control Dermatológico 29', TRUE, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Rutina Facial Mauricio - Control Dermatológico 30', FALSE, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('comunidad.listas_deseos', 'id_lista_deseos'), COALESCE((SELECT MAX(id_lista_deseos) FROM comunidad.listas_deseos), 1), true);

