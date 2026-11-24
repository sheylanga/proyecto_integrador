-- =================================================================================================
-- SUBMÓDULO 1: IDENTIDAD, SEGURIDAD (ROLES/PERMISOS), CLIENTES Y CATÁLOGO BASE (PostgreSQL 16/17)
-- Tablas 001 a 050 (Autor: JosÉ Luis Luna GarcÍa)
-- Sincronizado 100% con 00_MASTER_SEED_DATA_SQLSERVER.sql (PK: ID / FKs: ID_*)
-- =================================================================================================

-- =================================================================================================
-- 001. TABLA: seguridad.roles (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.roles (ID, codigo_rol, nombre_rol, descripcion, nivel_jerarquico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ADMIN', 'Administrador del Sistema', 'Control total sobre catálogo, usuarios, seguridad, inventarios y auditoría global.', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CLIENTE', 'Cliente Comprador', 'Acceso a tienda en línea, perfil cutáneo, compras, suscripciones Beauty-Box y facturación.', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FACTURACION', 'Especialista en Facturación CFDI', 'Gestión de timbrado CFDI 4.0 ante el SAT, complementos de pago y notas de crédito.', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'DERMOCONSULTOR', 'Dermoconsultor Clínico', 'Evaluación de perfiles cutáneos, validación de alérgenos INCI y asesoría de rutinas.', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ALMACEN_WMS', 'Operador Logístico WMS / CEDIS', 'Recepción de lotes sanitarios, despacho FEFO, telemetría de cadena de frío y empaque.', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'AUDITOR_COFEPRIS', 'Auditor Sanitario COFEPRIS y Calidad', 'Supervisión de farmacovigilancia, inspecciones QA, mermas sanitarias y bitácora forense.', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('seguridad.roles', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.roles), 1), true);

-- =================================================================================================
-- 002. TABLA: seguridad.permisos (15 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.permisos (ID, clave_permiso, modulo_sistema, accion, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('seguridad.permisos', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.permisos), 1), true);

-- =================================================================================================
-- 003. TABLA: seguridad.roles_permisos (23 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.roles_permisos (ID, ID_rol, ID_permiso, permitir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('seguridad.roles_permisos', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.roles_permisos), 1), true);

-- =================================================================================================
-- 004. TABLA: seguridad.usuarios (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.usuarios (ID, uuid_usuario, email, password_hash, password_salt, telefono_movil, email_verificado, cuenta_bloqueada, fecha_bloqueo, intentos_fallidos_consecutivos, mfa_habilitado, mfa_secreto, ultimo_login_exitoso, ultimo_cambio_password, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'B1000000-0000-4000-8000-000000000001', 'carlos.mendoza.1@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 'c2FsdERlcm1hQ2FyZTIwMjZf0001==', '8661114455', TRUE, TRUE, '2026-02-01 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0001DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'B1000000-0000-4000-8000-000000000002', 'sofia.ramirez.2@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 'c2FsdERlcm1hQ2FyZTIwMjZf0002==', '8661124455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-02 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'B1000000-0000-4000-8000-000000000003', 'valeria.torres.3@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 'c2FsdERlcm1hQ2FyZTIwMjZf0003==', '8661134455', TRUE, TRUE, '2026-02-03 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0003DERMA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'B1000000-0000-4000-8000-000000000004', 'alejandro.hernandez.4@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 'c2FsdERlcm1hQ2FyZTIwMjZf0004==', '8661144455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-04 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'B1000000-0000-4000-8000-000000000005', 'mariana.sanchez.5@dermacare.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 'c2FsdERlcm1hQ2FyZTIwMjZf0005==', '8661154455', TRUE, TRUE, '2026-02-05 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0005DERMA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'B1000000-0000-4000-8000-000000000006', 'diego.martinez.6@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 'c2FsdERlcm1hQ2FyZTIwMjZf0006==', '8661164455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-06 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'B1000000-0000-4000-8000-000000000007', 'camila.gonzalez.7@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 'c2FsdERlcm1hQ2FyZTIwMjZf0007==', '8661174455', TRUE, TRUE, '2026-02-07 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0007DERMA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'B1000000-0000-4000-8000-000000000008', 'mateo.flores.8@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 'c2FsdERlcm1hQ2FyZTIwMjZf0008==', '8661184455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-08 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'B1000000-0000-4000-8000-000000000009', 'lucia.morales.9@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 'c2FsdERlcm1hQ2FyZTIwMjZf0009==', '8661194455', TRUE, TRUE, '2026-02-09 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0009DERMA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'B1000000-0000-4000-8000-00000000000A', 'sebastian.vazquez.10@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 'c2FsdERlcm1hQ2FyZTIwMjZf0010==', '8661204455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-10 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'B1000000-0000-4000-8000-00000000000B', 'regina.gutierrez.11@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 'c2FsdERlcm1hQ2FyZTIwMjZf0011==', '8661214455', TRUE, TRUE, '2026-02-11 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0011DERMA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'B1000000-0000-4000-8000-00000000000C', 'santiago.jimenez.12@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 'c2FsdERlcm1hQ2FyZTIwMjZf0012==', '8661224455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-12 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'B1000000-0000-4000-8000-00000000000D', 'fernanda.ruiz.13@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 'c2FsdERlcm1hQ2FyZTIwMjZf0013==', '8661234455', TRUE, TRUE, '2026-02-13 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0013DERMA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'B1000000-0000-4000-8000-00000000000E', 'emiliano.rios.14@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 'c2FsdERlcm1hQ2FyZTIwMjZf0014==', '8661244455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-14 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'B1000000-0000-4000-8000-00000000000F', 'ximena.aguilar.15@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 'c2FsdERlcm1hQ2FyZTIwMjZf0015==', '8661254455', TRUE, TRUE, '2026-02-15 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0015DERMA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'B1000000-0000-4000-8000-000000000010', 'daniel.mendez.16@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 'c2FsdERlcm1hQ2FyZTIwMjZf0016==', '8661264455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-16 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'B1000000-0000-4000-8000-000000000011', 'andrea.castro.17@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 'c2FsdERlcm1hQ2FyZTIwMjZf0017==', '8661274455', TRUE, TRUE, '2026-02-17 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0017DERMA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'B1000000-0000-4000-8000-000000000012', 'gabriel.vega.18@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 'c2FsdERlcm1hQ2FyZTIwMjZf0018==', '8661284455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-18 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'B1000000-0000-4000-8000-000000000013', 'paula.cortes.19@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 'c2FsdERlcm1hQ2FyZTIwMjZf0019==', '8661294455', TRUE, TRUE, '2026-02-19 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0019DERMA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'B1000000-0000-4000-8000-000000000014', 'andres.ramos.20@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 'c2FsdERlcm1hQ2FyZTIwMjZf0020==', '8661304455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-20 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'B1000000-0000-4000-8000-000000000015', 'renata.guerrero.21@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 'c2FsdERlcm1hQ2FyZTIwMjZf0021==', '8661314455', TRUE, TRUE, '2026-02-21 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0021DERMA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'B1000000-0000-4000-8000-000000000016', 'nicolas.pena.22@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 'c2FsdERlcm1hQ2FyZTIwMjZf0022==', '8661324455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-22 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'B1000000-0000-4000-8000-000000000017', 'natalia.herrera.23@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 'c2FsdERlcm1hQ2FyZTIwMjZf0023==', '8661334455', TRUE, TRUE, '2026-02-23 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0023DERMA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'B1000000-0000-4000-8000-000000000018', 'joaquin.medina.24@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 'c2FsdERlcm1hQ2FyZTIwMjZf0024==', '8661344455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-24 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'B1000000-0000-4000-8000-000000000019', 'isabella.dominguez.25@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 'c2FsdERlcm1hQ2FyZTIwMjZf0025==', '8661354455', TRUE, TRUE, '2026-02-25 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0025DERMA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'B1000000-0000-4000-8000-00000000001A', 'leonardo.silva.26@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 'c2FsdERlcm1hQ2FyZTIwMjZf0026==', '8661364455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-26 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'B1000000-0000-4000-8000-00000000001B', 'ana.chavez.27@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 'c2FsdERlcm1hQ2FyZTIwMjZf0027==', '8661374455', TRUE, TRUE, '2026-02-27 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0027DERMA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'B1000000-0000-4000-8000-00000000001C', 'rodrigo.ochoa.28@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 'c2FsdERlcm1hQ2FyZTIwMjZf0028==', '8661384455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-28 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'B1000000-0000-4000-8000-00000000001D', 'paulina.miranda.29@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 'c2FsdERlcm1hQ2FyZTIwMjZf0029==', '8661394455', TRUE, TRUE, '2026-02-01 11:30:00', 5, TRUE, 'JBSWY3DPEHPK3PXP0029DERMA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'B1000000-0000-4000-8000-00000000001E', 'mauricio.padilla.30@correo.mx', '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 'c2FsdERlcm1hQ2FyZTIwMjZf0030==', '8661404455', FALSE, FALSE, NULL, 0, FALSE, NULL, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.usuarios', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.usuarios), 1), true);

-- =================================================================================================
-- 005. TABLA: seguridad.usuarios_roles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.usuarios_roles (ID, ID_usuario, ID_rol, fecha_asignacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('seguridad.usuarios_roles', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.usuarios_roles), 1), true);

-- =================================================================================================
-- 006. TABLA: seguridad.sesiones_activas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.sesiones_activas (ID, ID_usuario, token_sesion_hash, direccion_ip, user_agent, fecha_inicio, fecha_expiracion, revocada, fecha_revocacion, motivo_revocacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '0b1cf5e003650b508fa6c0a31d35ad85abcf7b3e23b98476e023ab357573d748', '189.203.3.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', '2026-02-01 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-02-01 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '21587875b8254958687615c072ad14c43cf40d3da6212fb8303ae3b1f5a0da65', '189.203.6.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', '2026-02-02 11:30:00', '2026-02-03 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'f585c502bc48e1965664825b56dd4ddd1370e1a1fb9f8737cf6d93ca15bc0047', '189.203.9.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', '2026-02-03 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-02-03 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '2fc8808ae2342af29ffeab9b2aa9180e9e09da2167409238082c517cef0379c7', '189.203.12.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', '2026-02-04 11:30:00', '2026-02-05 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'f29610307a2209c0bc06e6d2623101b68d83715cfd3b9dda6d9ad14981610f82', '189.203.15.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', '2026-02-05 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-02-05 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'c4b13521cf467b556a5c8a31b3447a995b93773a3bb71fb5764538804b79a3a3', '189.203.18.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', '2026-02-06 11:30:00', '2026-02-07 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ef3f5e1c9061f8f0f801156593b8f99609223221eaa2bf03762b196d5b71f861', '189.203.21.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', '2026-02-07 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-02-07 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '350401191bc0458adf3c5c698f27c1bf66b6d459d597ccd84cdae841439269e7', '189.203.24.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', '2026-02-08 11:30:00', '2026-02-09 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '10bb1419aae3d92c85220fa7163f9660b7202de2eb4569af7295f98128ad850d', '189.203.27.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', '2026-02-09 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-02-09 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '2c54b226d522f960c72b52e4b781d088338778177ab59a237f4732277eb23626', '189.203.30.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', '2026-02-10 11:30:00', '2026-02-11 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '117502db00aee1a8237ec4885472572324bc7d78a858dce86b2cb3f0245ea485', '189.203.33.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', '2026-02-11 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-02-11 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'babe587b0c3a9177b6204f090762ac645036a6c221b5560ebf4385be2fe403ba', '189.203.36.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', '2026-02-12 11:30:00', '2026-02-13 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'd1e4cbce44621882d44e655eedee7a34dabb568a616c03a169fd56ff3a41babc', '189.203.39.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', '2026-02-13 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-02-13 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'f4123fedac1b51e875a6bd3d3a0db9c353fe59d46541bece9ab6e6be6e079df4', '189.203.42.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', '2026-02-14 11:30:00', '2026-02-15 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '00b08560d371f33e9f363a30eb5d69069842d50dae45cb9efd0555a057ccd2d2', '189.203.45.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', '2026-02-15 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-02-15 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'cfbbaf613e3f243e1590419c21ee103b0bbc53daa2fe64be4d72b24f303bcfc1', '189.203.48.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', '2026-02-16 11:30:00', '2026-02-17 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'e653814e4ee9c8c9fba834bcdb721f5bf4525700e4130f84bffd2fd7e055c974', '189.203.51.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', '2026-02-17 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-02-17 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '7acc403137fe14dce5d0082c4d3f31b4a33260987b01776af2fcf2b8c67afdfe', '189.203.54.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', '2026-02-18 11:30:00', '2026-02-19 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'a9b140b49cda5d3211608d11d3f22ec7b55424ac65a4d8995b992de82f8fccf5', '189.203.57.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', '2026-02-19 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-02-19 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '533f9f08d688d53cb21b7af9fa781e673d433963119ff9fdf03c08cdc5c7fb0d', '189.203.60.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', '2026-02-20 11:30:00', '2026-02-21 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '827dc20936be26bf26ce0eb3da0f3772e5e6a68fb5cccea0b94fe8504fae2810', '189.203.63.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', '2026-02-21 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-02-21 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'f63537ae29d0d5e90fba2a5dc35a0db0f22d95bfe7a721d1326b508310bc3a55', '189.203.66.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', '2026-02-22 11:30:00', '2026-02-23 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '62283c3cec73c2eae679367a9d26fc78fc057fc1b2d55be3c23db07bfb81c3b4', '189.203.69.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', '2026-02-23 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-02-23 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'd00b151eb8710af8cbb6716c1244a74941b3e81948a51b53ba857b78f344e6da', '189.203.72.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', '2026-02-24 11:30:00', '2026-02-25 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'd8906058f087e1b636f0629161a5270660086b55225f7c22a9eafb72982ac586', '189.203.75.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', '2026-02-25 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-02-25 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'bff25dca58e8639f5b37bc6ce053dd3beaf645d9e93e19a52ab67c4448be57f3', '189.203.78.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', '2026-02-26 11:30:00', '2026-02-27 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '10b3dd4f6456f92f44d5d4c1c1bbfd65b8321c5066d540b0d104afeb636d8c63', '189.203.81.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', '2026-02-27 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-02-27 14:30:00', 'Cambio de contraseña', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'eb0172720ff0d8e9e594f9fac311cde15c629f2403cf5054a41f0cf59fd355d8', '189.203.84.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', '2026-02-28 11:30:00', '2026-03-01 11:30:00', FALSE, NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '2e871cc4e4f31de0d8873292688cff0531b1aae9762f7243657cbc5fec316e3c', '189.203.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', '2026-02-01 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-02-01 14:30:00', 'Cierre de sesión voluntario', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'd9ee60899d006919d0d2c9c435ef37a2ed6f3d8003a4805a1d7a478112168b75', '189.203.90.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', '2026-02-02 11:30:00', '2026-02-03 11:30:00', FALSE, NULL, NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.sesiones_activas', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.sesiones_activas), 1), true);

-- =================================================================================================
-- 007. TABLA: seguridad.historial_passwords (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.historial_passwords (ID, ID_usuario, password_hash, password_salt, algoritmo_hashing, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 'c2FsdERlcm1hQ2FyZTIwMjZf0001==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 'c2FsdERlcm1hQ2FyZTIwMjZf0002==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 'c2FsdERlcm1hQ2FyZTIwMjZf0003==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 'c2FsdERlcm1hQ2FyZTIwMjZf0004==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 'c2FsdERlcm1hQ2FyZTIwMjZf0005==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 'c2FsdERlcm1hQ2FyZTIwMjZf0006==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 'c2FsdERlcm1hQ2FyZTIwMjZf0007==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 'c2FsdERlcm1hQ2FyZTIwMjZf0008==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 'c2FsdERlcm1hQ2FyZTIwMjZf0009==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 'c2FsdERlcm1hQ2FyZTIwMjZf0010==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 'c2FsdERlcm1hQ2FyZTIwMjZf0011==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 'c2FsdERlcm1hQ2FyZTIwMjZf0012==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 'c2FsdERlcm1hQ2FyZTIwMjZf0013==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 'c2FsdERlcm1hQ2FyZTIwMjZf0014==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 'c2FsdERlcm1hQ2FyZTIwMjZf0015==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 'c2FsdERlcm1hQ2FyZTIwMjZf0016==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 'c2FsdERlcm1hQ2FyZTIwMjZf0017==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 'c2FsdERlcm1hQ2FyZTIwMjZf0018==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 'c2FsdERlcm1hQ2FyZTIwMjZf0019==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 'c2FsdERlcm1hQ2FyZTIwMjZf0020==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 'c2FsdERlcm1hQ2FyZTIwMjZf0021==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 'c2FsdERlcm1hQ2FyZTIwMjZf0022==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 'c2FsdERlcm1hQ2FyZTIwMjZf0023==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 'c2FsdERlcm1hQ2FyZTIwMjZf0024==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 'c2FsdERlcm1hQ2FyZTIwMjZf0025==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 'c2FsdERlcm1hQ2FyZTIwMjZf0026==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 'c2FsdERlcm1hQ2FyZTIwMjZf0027==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 'c2FsdERlcm1hQ2FyZTIwMjZf0028==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 'c2FsdERlcm1hQ2FyZTIwMjZf0029==', 'Argon2id', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 'c2FsdERlcm1hQ2FyZTIwMjZf0030==', 'Argon2id', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.historial_passwords', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.historial_passwords), 1), true);

-- =================================================================================================
-- 008. TABLA: seguridad.intentos_login (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.intentos_login (ID, email_ingresado, ID_usuario, direccion_ip, pais_origen_ip, user_agent, resultado, mensaje_detalle, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'carlos.mendoza.1@dermacare.mx', 1, '189.203.3.7', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'EXITOSO', 'Autenticación exitosa validada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'sofia.ramirez.2@dermacare.mx', 2, '189.203.6.14', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'PASSWORD_INVALIDO', 'Contraseña incorrecta ingresada por el usuario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'desconocido@correo.mx', NULL, '189.203.9.21', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'USUARIO_INEXISTENTE', 'Correo electrónico no registrado en el sistema.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'alejandro.hernandez.4@dermacare.mx', 4, '189.203.12.28', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'CUENTA_BLOQUEADA', 'Acceso denegado: cuenta bloqueada temporalmente.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'mariana.sanchez.5@dermacare.mx', 5, '189.203.15.35', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'MFA_FALLIDO', 'Código de verificación TOTP MFA inválido o expirado.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'diego.martinez.6@correo.mx', 6, '189.203.18.42', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'EXITOSO', 'Autenticación exitosa validada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'camila.gonzalez.7@correo.mx', 7, '189.203.21.49', 'Estados Unidos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'PASSWORD_INVALIDO', 'Contraseña incorrecta ingresada por el usuario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'desconocido@correo.mx', NULL, '189.203.24.56', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'USUARIO_INEXISTENTE', 'Correo electrónico no registrado en el sistema.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'lucia.morales.9@correo.mx', 9, '189.203.27.63', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'CUENTA_BLOQUEADA', 'Acceso denegado: cuenta bloqueada temporalmente.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'sebastian.vazquez.10@correo.mx', 10, '189.203.30.70', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'MFA_FALLIDO', 'Código de verificación TOTP MFA inválido o expirado.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'regina.gutierrez.11@correo.mx', 11, '189.203.33.77', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'EXITOSO', 'Autenticación exitosa validada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'santiago.jimenez.12@correo.mx', 12, '189.203.36.84', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'PASSWORD_INVALIDO', 'Contraseña incorrecta ingresada por el usuario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'desconocido@correo.mx', NULL, '189.203.39.91', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'USUARIO_INEXISTENTE', 'Correo electrónico no registrado en el sistema.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'emiliano.rios.14@correo.mx', 14, '189.203.42.98', 'Estados Unidos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'CUENTA_BLOQUEADA', 'Acceso denegado: cuenta bloqueada temporalmente.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ximena.aguilar.15@correo.mx', 15, '189.203.45.105', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'MFA_FALLIDO', 'Código de verificación TOTP MFA inválido o expirado.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'daniel.mendez.16@correo.mx', 16, '189.203.48.112', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'EXITOSO', 'Autenticación exitosa validada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'andrea.castro.17@correo.mx', 17, '189.203.51.119', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'PASSWORD_INVALIDO', 'Contraseña incorrecta ingresada por el usuario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'desconocido@correo.mx', NULL, '189.203.54.126', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'USUARIO_INEXISTENTE', 'Correo electrónico no registrado en el sistema.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'paula.cortes.19@correo.mx', 19, '189.203.57.133', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'CUENTA_BLOQUEADA', 'Acceso denegado: cuenta bloqueada temporalmente.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'andres.ramos.20@correo.mx', 20, '189.203.60.140', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'MFA_FALLIDO', 'Código de verificación TOTP MFA inválido o expirado.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'renata.guerrero.21@correo.mx', 21, '189.203.63.147', 'Estados Unidos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'EXITOSO', 'Autenticación exitosa validada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'nicolas.pena.22@correo.mx', 22, '189.203.66.154', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'PASSWORD_INVALIDO', 'Contraseña incorrecta ingresada por el usuario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'desconocido@correo.mx', NULL, '189.203.69.161', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'USUARIO_INEXISTENTE', 'Correo electrónico no registrado en el sistema.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'joaquin.medina.24@correo.mx', 24, '189.203.72.168', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'CUENTA_BLOQUEADA', 'Acceso denegado: cuenta bloqueada temporalmente.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'isabella.dominguez.25@correo.mx', 25, '189.203.75.175', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'MFA_FALLIDO', 'Código de verificación TOTP MFA inválido o expirado.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'leonardo.silva.26@correo.mx', 26, '189.203.78.182', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'EXITOSO', 'Autenticación exitosa validada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ana.chavez.27@correo.mx', 27, '189.203.81.189', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'PASSWORD_INVALIDO', 'Contraseña incorrecta ingresada por el usuario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'desconocido@correo.mx', NULL, '189.203.84.196', 'Estados Unidos', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'USUARIO_INEXISTENTE', 'Correo electrónico no registrado en el sistema.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'paulina.miranda.29@correo.mx', 29, '189.203.87.203', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'CUENTA_BLOQUEADA', 'Acceso denegado: cuenta bloqueada temporalmente.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'mauricio.padilla.30@correo.mx', 30, '189.203.90.210', 'México', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'MFA_FALLIDO', 'Código de verificación TOTP MFA inválido o expirado.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.intentos_login', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.intentos_login), 1), true);

-- =================================================================================================
-- 009. TABLA: seguridad.tokens_recuperacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.tokens_recuperacion (ID, ID_usuario, token_hash, tipo_token, fecha_expiracion, utilizado, fecha_utilizacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '9def9b0750ebc72d37fb4c7160e4703a69c33e0f24d664e3ea70de02cb7845f8', 'RESET_PASSWORD', '2026-02-01 13:30:00', TRUE, '2026-02-01 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '4fcdacc8564d1fa7a4adee6cf498213575f82ee82b57074bd1d9d245edfed2b3', 'VERIFICAR_EMAIL', '2026-02-02 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '6e59017efaded19c0b0f20577639ffd9c986ccb27eb420f234425f35d69c7546', 'MFA_BACKUP', '2026-02-03 13:30:00', TRUE, '2026-02-03 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'b4f9332081c1e766324bb18d925fd492bcb667e7ec1d78dbf29d3fe2cf8196e3', 'RESET_PASSWORD', '2026-02-04 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'b454195af2fe849863732b2a0e46c1826bf5a502c343c93a9e4ef52e341ba401', 'VERIFICAR_EMAIL', '2026-02-05 13:30:00', TRUE, '2026-02-05 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '0afcc13d9739ec633a766ad43fe4b15c035c4e0d1980a46dc748b7c046925e81', 'MFA_BACKUP', '2026-02-06 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '438dd75463dc8fd391e7e11d70d5e367de8342c5462593e88c4e9d8aa13400dd', 'RESET_PASSWORD', '2026-02-07 13:30:00', TRUE, '2026-02-07 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '686d0a16168edbf0a444b8881fbee56253edeff29e96b719ab5fb02cda269a81', 'VERIFICAR_EMAIL', '2026-02-08 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '7cd9a3843a3087a415287c84865045daf80d263b262d49f85bae60d29710993f', 'MFA_BACKUP', '2026-02-09 13:30:00', TRUE, '2026-02-09 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'f1ff3161a12349e78527ec693cb2cc15b3409a9dac2bd56c8a7fb3c33167d016', 'RESET_PASSWORD', '2026-02-10 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '6b321c8521f810be0251ed68ae0aef9f657083ff1c238adbcad965f5b21ec17e', 'VERIFICAR_EMAIL', '2026-02-11 13:30:00', TRUE, '2026-02-11 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '259f06db2a703c7ca0f8cca4488b8650582ed51048d705a9881eb91743866ea8', 'MFA_BACKUP', '2026-02-12 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '897bb0a9785ddd50380887e4849521ade04d840ccfd49659b52afa097ae73d92', 'RESET_PASSWORD', '2026-02-13 13:30:00', TRUE, '2026-02-13 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '3de4c22c64c6a964b5afddde8eb0da198212391188437b7299860c2845125cc3', 'VERIFICAR_EMAIL', '2026-02-14 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '1ecff29a07450e01304aa081ef849c4641ad16c31e8401fe78fb09e9ccb41732', 'MFA_BACKUP', '2026-02-15 13:30:00', TRUE, '2026-02-15 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '78de1bfb96dd125a71e630b711677a6c50524bd76db5b6bafb9d3fda3f31289b', 'RESET_PASSWORD', '2026-02-16 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'cd2c2dd80e2d9d637d6a519096638964979cbef9e9a3df37e894736432700586', 'VERIFICAR_EMAIL', '2026-02-17 13:30:00', TRUE, '2026-02-17 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '705c73106bc5533135bd3f33d007a102d21186fd6fe58de2ae141a222f0c40b0', 'MFA_BACKUP', '2026-02-18 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'af0dad948514e6601d5fe45816a4a6f479dad6d15fac47cc8409cf430890c2b5', 'RESET_PASSWORD', '2026-02-19 13:30:00', TRUE, '2026-02-19 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'fe0fcaf2ecc69851185ae755062af88e340da34d947528260849aa047e5a6375', 'VERIFICAR_EMAIL', '2026-02-20 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '572bf81f909d23fe284c5e25b4f60c033cf9cff5323dde519197948fcc7c4903', 'MFA_BACKUP', '2026-02-21 13:30:00', TRUE, '2026-02-21 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'fdef48ea0d86ff209b1d92d3367e1b327d8ef6658965f8e8c50bc80b81c6560b', 'RESET_PASSWORD', '2026-02-22 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '67b4e47a3675dfc241703c037f7b676615b443d53c2d6c744040f1ca642e750d', 'VERIFICAR_EMAIL', '2026-02-23 13:30:00', TRUE, '2026-02-23 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '2e3157a6145b78e7414af50e015d867f193ec402902ee5ad97c4ea95ca1d739d', 'MFA_BACKUP', '2026-02-24 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '63f4ef28d1674e1a11119793d173f99c4e4d331c8b85dbe446a621ef81519472', 'RESET_PASSWORD', '2026-02-25 13:30:00', TRUE, '2026-02-25 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'bf7c41c65c7eea08d0d9607452a014cc39635cc25df11db939b63b9b751c6d51', 'VERIFICAR_EMAIL', '2026-02-26 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'caffb5051534daeee474772ccd7efbf16e619963d002e5ef28254fa9b43b1940', 'MFA_BACKUP', '2026-02-27 13:30:00', TRUE, '2026-02-27 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '76c447dafab1de85c88696e15f5cb10e85236af40a110af751ffaef0f6d172df', 'RESET_PASSWORD', '2026-02-28 13:30:00', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'c4398d9dd15055f9dba406e767925b1c598be542b1f56ee5b145d699b0cd28ca', 'VERIFICAR_EMAIL', '2026-02-01 13:30:00', TRUE, '2026-02-01 11:48:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '5f7fc04219424941a59c2899f1b9a27f547773b3c68baadd16c21367cf77c619', 'MFA_BACKUP', '2026-02-02 13:30:00', FALSE, NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.tokens_recuperacion', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.tokens_recuperacion), 1), true);

-- =================================================================================================
-- 010. TABLA: seguridad.dispositivos_confianza (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO seguridad.dispositivos_confianza (ID, ID_usuario, fingerprint_dispositivo, nombre_dispositivo, sistema_operativo, navegador, es_confiable, ultimo_acceso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ab41c8aee73bd93302b4a65cd6294f8af78e99cc64eb665ee68ec80d271ffd68', 'iPhone 15 Pro Personal #1', 'iOS 18.2', 'Safari 18', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'b20bcb65363290f5c814b44f74ff29cf7c6cdcc9c378a9ac52d71c2730cae3b6', 'Laptop Windows Oficina #2', 'Windows 11 Pro', 'Microsoft Edge 132', FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'a28521afadefb8d11117f38afdb7805db52f647fd86c03824fc7f63e8016452d', 'Samsung Galaxy S24 #3', 'Android 15', 'Chrome Mobile 132', TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '0c0ca39175d5be0a61f5855fb70b225582bed4855a2d1206980fc8316780b0ea', 'MacBook Air M2 #4', 'macOS Sequoia 15.1', 'Google Chrome 132', FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'f5fb0f8e012aa04a7cf0985fdec905af1a500497728fe62bef44e3a3d5c2e40e', 'iPad Air 5ta Gen #5', 'iPadOS 18.2', 'Safari 18', TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '97e5bad14917074eb3f24d25bcbc28a080b537c21b5cbb3a0f921ace4105fc4c', 'iPhone 15 Pro Personal #6', 'iOS 18.2', 'Safari 18', FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '1120c9a069193810847684b52613dd3846d5336cccf137b1a4038daa4166b756', 'Laptop Windows Oficina #7', 'Windows 11 Pro', 'Microsoft Edge 132', TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '4ba9d0842f4c73a1951d9e58784b7375f42246420a4178e1578004acf0605ab9', 'Samsung Galaxy S24 #8', 'Android 15', 'Chrome Mobile 132', FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '19c2178b3e31c975c98657e8154e9edb59e5c2d74b5977de424e742f0ed3f629', 'MacBook Air M2 #9', 'macOS Sequoia 15.1', 'Google Chrome 132', TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'c8f0b2fc410de5de9e61b9087ff8cb310951c9c70659fde573891dfb24bd7e8a', 'iPad Air 5ta Gen #10', 'iPadOS 18.2', 'Safari 18', FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '823babda83c493493d7973813af3591a5c4f86c3d2fb25886f19ac683595b9eb', 'iPhone 15 Pro Personal #11', 'iOS 18.2', 'Safari 18', TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '5a773be33bd9dc19cc252f1b3d5d73766c8a2abe3c63041fb043c2161f521b12', 'Laptop Windows Oficina #12', 'Windows 11 Pro', 'Microsoft Edge 132', FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '909919f8a8a455b730a97ea7f4b103b48818084c1a3dad55f64c81cdd13476d6', 'Samsung Galaxy S24 #13', 'Android 15', 'Chrome Mobile 132', TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'c12c6d9180ce9530c4012515c5ebcdc4af488ba040a6fd618f14bcdf9727aa4c', 'MacBook Air M2 #14', 'macOS Sequoia 15.1', 'Google Chrome 132', FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '9b2f383879f0987bb6423a22c73ea5c57586ae7abb49238d150365bca1e80bc4', 'iPad Air 5ta Gen #15', 'iPadOS 18.2', 'Safari 18', TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '82e48c4a5aec8c513272a1f5a900ecd07857abd09d03a4d653f9d1871343cb25', 'iPhone 15 Pro Personal #16', 'iOS 18.2', 'Safari 18', FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '03a586f1f0ba06678db04ec8515e45d518075d1d57969d7f03ea91986da7d45d', 'Laptop Windows Oficina #17', 'Windows 11 Pro', 'Microsoft Edge 132', TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'aade7287b0e1a164d3b99427dfd03c41ff3d93eafc67deabe489bd3868c81790', 'Samsung Galaxy S24 #18', 'Android 15', 'Chrome Mobile 132', FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'b601916ffa957c7bae99775cfde7830f78d4639468057bbb54d0901936dabde6', 'MacBook Air M2 #19', 'macOS Sequoia 15.1', 'Google Chrome 132', TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '15f95973f104ddc7c0d484d356094211cda557941ffbc2015abb83485d560db8', 'iPad Air 5ta Gen #20', 'iPadOS 18.2', 'Safari 18', FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '6cf068705429bc83a5a3724da749a6b2a809818393005bb7f03487a832251f92', 'iPhone 15 Pro Personal #21', 'iOS 18.2', 'Safari 18', TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '76fdd1c3d263d8e74b48ad502df6ea0378f4871636b7680ffe5e9a9b61118543', 'Laptop Windows Oficina #22', 'Windows 11 Pro', 'Microsoft Edge 132', FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '4f752a195177dfc0f012346defbf303c95ebe9c07411e0d20c3126ee016fc922', 'Samsung Galaxy S24 #23', 'Android 15', 'Chrome Mobile 132', TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '064760c4385ed5ee8f6993718951d527e7bec94b3f0c370a03e8811b672a8e64', 'MacBook Air M2 #24', 'macOS Sequoia 15.1', 'Google Chrome 132', FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '4704a6c5036203e83c0c0435c7400bfa77c8d9a44ea8144d47cc35f8e117b41c', 'iPad Air 5ta Gen #25', 'iPadOS 18.2', 'Safari 18', TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '4175915cb88dcba1d3c8db1b0c7c6d1c2f911354d49301de6f9477a95c42a304', 'iPhone 15 Pro Personal #26', 'iOS 18.2', 'Safari 18', FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ac5eed1c994d7e76947935549c7e18fa939dce23f9741bf55a85fcb9a56c7f3d', 'Laptop Windows Oficina #27', 'Windows 11 Pro', 'Microsoft Edge 132', TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '91e1a073dbdb96294a09e947d431e7a542c7776b9f8da26babdc0100e266f60a', 'Samsung Galaxy S24 #28', 'Android 15', 'Chrome Mobile 132', FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '664690099be733b5bcd2d9b5cb9bfd79f933ec4d246895219147a5622eaeea67', 'MacBook Air M2 #29', 'macOS Sequoia 15.1', 'Google Chrome 132', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'debd709065181579d3a8c8cc9f27426c70a9342dfeffa1e0c5f0425d0216978e', 'iPad Air 5ta Gen #30', 'iPadOS 18.2', 'Safari 18', FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('seguridad.dispositivos_confianza', 'id'), COALESCE((SELECT MAX(id) FROM seguridad.dispositivos_confianza), 1), true);

-- =================================================================================================
-- 011. TABLA: clientes.tipos_piel (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.tipos_piel (ID, codigo_piel, nombre, descripcion_clinica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'EUDERMICA', 'Piel Normal / Eudérmica', 'Equilibrio óptimo entre hidratación y secreción sebácea', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SECA_ALIPICA', 'Piel Seca / Deshidratada', 'Déficit de lípidos epidérmicos y tendencia a tirantez', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'GRASA_SEBORR', 'Piel Grasa / Tendencia Acnéica', 'Hipersecreción sebácea, brillo facial y poros dilatados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MIXTA_ZONAT', 'Piel Mixta', 'Zona T grasa (frente, nariz, mentón) y mejillas secas o normales', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SENSIBLE_REAC', 'Piel Sensible / Reactiva', 'Alta reactividad neurosensorial, eritema fácil y barrera frágil', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MADURA_FOTO', 'Piel Madura / Fotoenvejecida', 'Pérdida de firmeza, elastosis solar y líneas de expresión marcadas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('clientes.tipos_piel', 'id'), COALESCE((SELECT MAX(id) FROM clientes.tipos_piel), 1), true);

-- =================================================================================================
-- 012. TABLA: clientes.condiciones_dermatologicas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.condiciones_dermatologicas (ID, codigo_condicion, nombre_condicion, descripcion_patologica, nivel_severidad_tipica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CONDICIO_01', 'Acné Vulgar Leve', 'Comedones abiertos y cerrados ocasionados por hiperseborrea folicular.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CONDICIO_02', 'Acné Inflamatorio Moderado', 'Presencia de pápulas y pústulas con respuesta inflamatoria en zona facial y espalda.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CONDICIO_03', 'Rosácea Eritematotelangiectásica', 'Enrojecimiento facial persistente, telangiectasias y alta reactividad vascular.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CONDICIO_04', 'Melasma Epidérmico', 'Máculas hiperpigmentadas simétricas agravadas por radiación UV y luz visible.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CONDICIO_05', 'Dermatitis Atópica', 'Disfunción de barrera cutánea con xerosis intensa, prurito y brotes eccematosos.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CONDICIO_06', 'Dermatitis Seborreica', 'Descamación grasa y eritema en surcos nasogenianos, cejas y cuero cabelludo.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CONDICIO_07', 'Hiperpigmentación Postinflamatoria', 'Manchas residuales oscuras posteriores a lesiones de acné o traumatismo cutáneo.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CONDICIO_08', 'Piel Reactiva e Intolerante', 'Umbral reducido a activos tópicos con sensación frecuente de ardor y tirantez.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CONDICIO_09', 'Fotoenvejecimiento Prematuro', 'Pérdida de elasticidad, léntigos solares y arrugas finas por exposición UV acumulada.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CONDICIO_10', 'Queratosis Pilaris', 'Tapones de queratina folicular con textura áspera en brazos, mejillas o muslos.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CONDICIO_11', 'Eccema de Contacto Alérgico', 'Reacción de hipersensibilidad retardada ante fragancias, conservadores o metales.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CONDICIO_12', 'Xerosis Cutánea Severa', 'Deshidratación epidérmica profunda con fisuración fina y descamación laminar.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CONDICIO_13', 'Seborrea Facial Crónica', 'Exceso persistente de lípidos superficiales con dilatación visible del ostium folicular.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CONDICIO_14', 'Dermatitis Perioral', 'Pápulas eritematosas agrupadas alrededor de labios y mentón, sensible a corticoides.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CONDICIO_15', 'Lentigos Solares Benignos', 'Máculas pigmentadas circunscritas asociadas a exposición solar crónica.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CONDICIO_16', 'Piel Post-Procedimiento Láser', 'Epidermis en reepitelización tras peelings químicos o tratamientos ablativos.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CONDICIO_17', 'Foliculitis de Barba', 'Inflamación perifolicular por vello encarnado o colonización bacteriana leve.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CONDICIO_18', 'Queilitis Actínica Leve', 'Sequedad crónica y descamación del bermellón labial por radiación solar.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CONDICIO_19', 'Milia Folicular', 'Pequeños quistes epidérmicos de queratina superficial en región periocular.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CONDICIO_20', 'Ojeras Vasculares y Pigmentarias', 'Coloración violácea o marrón en surco infraorbitario por estasis o melanina.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CONDICIO_21', 'Deshidratación Epidérmica Transitoria', 'Déficit temporal de agua en estrato córneo por clima seco o retinoides.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CONDICIO_22', 'Piel con Tendencia Comedogénica', 'Propensión a obstrucción de poros por ésteres pesados u oclusivos.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CONDICIO_23', 'Fotodermatosis Polimorfa', 'Erupción pruriginosa desencadenada por exposición solar intensa.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CONDICIO_24', 'Ictiosis Vulgar Leve', 'Descamación poligonal fina predominantemente en extremidades inferiores.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CONDICIO_25', 'Estrías Atróficas Tempranas', 'Líneas eritematosas por distensión dérmica rápida susceptibles a retinoides y centella.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CONDICIO_26', 'Cicatríz Atrófica Post-Acné', 'Depresiones dérmicas secundarias a nódulos inflamatorios previos.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CONDICIO_27', 'Psoriasis en Placas Leve', 'Placas eritematoescamosas bien delimitadas en codos, rodillas o cuero cabelludo.', 'SEVERA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CONDICIO_28', 'Urticaria por Frío o Fricción', 'Habones evanescentes inducidos por estímulos físicos ambientales.', 'LEVE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CONDICIO_29', 'Sensibilidad a Hidroxiácidos', 'Intolerancia rápida a AHA/BHA con eritema inmediato y descamación.', 'MODERADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CONDICIO_30', 'Alopecia Efluvio Telógeno', 'Caída difusa temporal del cabello asociada a estrés metabólico o déficit nutricional.', 'SEVERA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.condiciones_dermatologicas', 'id'), COALESCE((SELECT MAX(id) FROM clientes.condiciones_dermatologicas), 1), true);

-- =================================================================================================
-- 013. TABLA: clientes.clientes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.clientes (ID, ID_usuario, nombres, primer_apellido, segundo_apellido, fecha_nacimiento, genero, curp, rfc, telefono_fijo, acepta_terminos, fecha_aceptacion_terminos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Carlos', 'Mendoza', 'Garza', '1991-03-15', 'FEMENINO', 'MEGC910315HCLRR001', 'MEGC910315H01', '8661114455', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Sofía', 'Ramírez', 'López', '1992-03-15', 'MASCULINO', 'RALS920315HCLRR002', 'RALS920315H02', '8661124455', TRUE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Valeria', 'Torres', 'Villarreal', '1993-03-15', 'NO_BINARIO', 'TOVV930315HCLRR003', 'TOVV930315H03', '8661134455', TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Alejandro', 'Hernández', 'Cruz', '1994-03-15', 'PREFIERO_NO_DECIR', 'HECA940315HCLRR004', 'HECA940315H04', '8661144455', TRUE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Mariana', 'Sánchez', 'Fuentes', '1995-03-15', 'FEMENINO', 'SAFM950315HCLRR005', 'SAFM950315H05', '8661154455', TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Diego', 'Martínez', 'Treviño', '1996-03-15', 'MASCULINO', 'MATD960315HCLRR006', 'MATD960315H06', '8661164455', TRUE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Camila', 'González', 'Reyes', '1997-03-15', 'NO_BINARIO', 'GORC970315HCLRR007', 'GORC970315H07', '8661174455', TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Mateo', 'Flores', 'Castillo', '1998-03-15', 'PREFIERO_NO_DECIR', 'FLCM980315HCLRR008', 'FLCM980315H08', '8661184455', TRUE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Lucía', 'Morales', 'Díaz', '1999-03-15', 'FEMENINO', 'MODL990315HCLRR009', 'MODL990315H09', '8661194455', TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Sebastián', 'Vázquez', 'Ortiz', '1990-03-15', 'MASCULINO', 'VAOS900315HCLRR010', 'VAOS900315H10', '8661204455', TRUE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Regina', 'Gutiérrez', 'Nava', '1991-03-15', 'NO_BINARIO', 'GUNR910315HCLRR011', 'GUNR910315H11', '8661214455', TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Santiago', 'Jiménez', 'Pérez', '1992-03-15', 'PREFIERO_NO_DECIR', 'JIPS920315HCLRR012', 'JIPS920315H12', '8661224455', TRUE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Fernanda', 'Ruiz', 'Salazar', '1993-03-15', 'FEMENINO', 'RUSF930315HCLRR013', 'RUSF930315H13', '8661234455', TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Emiliano', 'Ríos', 'Cárdenas', '1994-03-15', 'MASCULINO', 'RICE940315HCLRR014', 'RICE940315H14', '8661244455', TRUE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Ximena', 'Aguilar', 'Ibarra', '1995-03-15', 'NO_BINARIO', 'AGIX950315HCLRR015', 'AGIX950315H15', '8661254455', TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Daniel', 'Méndez', 'Navarro', '1996-03-15', 'PREFIERO_NO_DECIR', 'MEND960315HCLRR016', 'MEND960315H16', '8661264455', TRUE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Andrea', 'Castro', 'Delgado', '1997-03-15', 'FEMENINO', 'CADA970315HCLRR017', 'CADA970315H17', '8661274455', TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Gabriel', 'Vega', 'Montoya', '1998-03-15', 'MASCULINO', 'VEMG980315HCLRR018', 'VEMG980315H18', '8661284455', TRUE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Paula', 'Cortés', 'Rojas', '1999-03-15', 'NO_BINARIO', 'CORP990315HCLRR019', 'CORP990315H19', '8661294455', TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Andrés', 'Ramos', 'Campos', '1990-03-15', 'PREFIERO_NO_DECIR', 'RACA900315HCLRR020', 'RACA900315H20', '8661304455', TRUE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Renata', 'Guerrero', 'Luna', '1991-03-15', 'FEMENINO', 'GULR910315HCLRR021', 'GULR910315H21', '8661314455', TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Nicolás', 'Peña', 'Cabrera', '1992-03-15', 'MASCULINO', 'PECN920315HCLRR022', 'PECN920315H22', '8661324455', TRUE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Natalia', 'Herrera', 'Vargas', '1993-03-15', 'NO_BINARIO', 'HEVN930315HCLRR023', 'HEVN930315H23', '8661334455', TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Joaquín', 'Medina', 'Contreras', '1994-03-15', 'PREFIERO_NO_DECIR', 'MECJ940315HCLRR024', 'MECJ940315H24', '8661344455', TRUE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Isabella', 'Domínguez', 'Escobar', '1995-03-15', 'FEMENINO', 'DOEI950315HCLRR025', 'DOEI950315H25', '8661354455', TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Leonardo', 'Silva', 'Paredes', '1996-03-15', 'MASCULINO', 'SIPL960315HCLRR026', 'SIPL960315H26', '8661364455', TRUE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Ana', 'Chávez', 'Bautista', '1997-03-15', 'NO_BINARIO', 'CHBA970315HCLRR027', 'CHBA970315H27', '8661374455', TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Rodrigo', 'Ochoa', 'Acosta', '1998-03-15', 'PREFIERO_NO_DECIR', 'OCAR980315HCLRR028', 'OCAR980315H28', '8661384455', TRUE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Paulina', 'Miranda', 'Leal', '1999-03-15', 'FEMENINO', 'MILP990315HCLRR029', 'MILP990315H29', '8661394455', TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Mauricio', 'Padilla', 'Solís', '1990-03-15', 'MASCULINO', 'PASM900315HCLRR030', 'PASM900315H30', '8661404455', TRUE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.clientes', 'id'), COALESCE((SELECT MAX(id) FROM clientes.clientes), 1), true);

-- =================================================================================================
-- 014. TABLA: clientes.direcciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.direcciones (ID, ID_cliente, alias_direccion, calle, numero_exterior, numero_interior, colonia, codigo_postal, municipio_alcaldia, estado, pais, referencias, es_predeterminada_envio, es_predeterminada_facturacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Casa Monclova 1', 'Blvd. Harold R. Pape #112', '110', 'Depto 1', 'Centro', '25700', 'Monclova', 'Coahuila', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monclova.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Casa Monterrey 2', 'Av. Constitución #124', '120', 'Depto 2', 'Obispado', '64000', 'Monterrey', 'Nuevo León', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monterrey.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Casa San Pedro Garza García 3', 'Calz. del Valle #136', '130', 'Depto 3', 'Del Valle', '66220', 'San Pedro Garza García', 'Nuevo León', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en San Pedro Garza García.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Casa Ciudad de México 4', 'Av. Álvaro Obregón #148', '140', 'Depto 4', 'Roma Norte', '06700', 'Cuauhtémoc', 'CDMX', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Cuauhtémoc.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Casa Ciudad de México 5', 'Av. Presidente Masaryk #160', '150', 'Depto 5', 'Polanco', '11560', 'Miguel Hidalgo', 'CDMX', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Miguel Hidalgo.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Casa Guadalajara 6', 'Av. Vallarta #172', '160', 'Depto 6', 'Americana', '44100', 'Guadalajara', 'Jalisco', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Guadalajara.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Casa Saltillo 7', 'Blvd. Venustiano Carranza #184', '170', 'Depto 7', 'República', '25000', 'Saltillo', 'Coahuila', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Saltillo.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Casa Querétaro 8', 'Av. 5 de Febrero #196', '180', 'Depto 8', 'Centro', '76000', 'Querétaro', 'Querétaro', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Querétaro.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Casa Puebla 9', 'Av. Juárez #208', '190', 'Depto 9', 'La Paz', '72000', 'Puebla', 'Puebla', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Puebla.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Casa Mérida 10', 'Paseo de Montejo #220', '200', 'Depto 10', 'Centro', '97000', 'Mérida', 'Yucatán', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Mérida.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Casa Monclova 11', 'Blvd. Harold R. Pape #232', '210', 'Depto 11', 'Centro', '25700', 'Monclova', 'Coahuila', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monclova.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Casa Monterrey 12', 'Av. Constitución #244', '220', 'Depto 12', 'Obispado', '64000', 'Monterrey', 'Nuevo León', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monterrey.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Casa San Pedro Garza García 13', 'Calz. del Valle #256', '230', 'Depto 13', 'Del Valle', '66220', 'San Pedro Garza García', 'Nuevo León', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en San Pedro Garza García.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Casa Ciudad de México 14', 'Av. Álvaro Obregón #268', '240', 'Depto 14', 'Roma Norte', '06700', 'Cuauhtémoc', 'CDMX', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Cuauhtémoc.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Casa Ciudad de México 15', 'Av. Presidente Masaryk #280', '250', 'Depto 15', 'Polanco', '11560', 'Miguel Hidalgo', 'CDMX', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Miguel Hidalgo.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Casa Guadalajara 16', 'Av. Vallarta #292', '260', 'Depto 16', 'Americana', '44100', 'Guadalajara', 'Jalisco', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Guadalajara.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Casa Saltillo 17', 'Blvd. Venustiano Carranza #304', '270', 'Depto 17', 'República', '25000', 'Saltillo', 'Coahuila', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Saltillo.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Casa Querétaro 18', 'Av. 5 de Febrero #316', '280', 'Depto 18', 'Centro', '76000', 'Querétaro', 'Querétaro', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Querétaro.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Casa Puebla 19', 'Av. Juárez #328', '290', 'Depto 19', 'La Paz', '72000', 'Puebla', 'Puebla', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Puebla.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Casa Mérida 20', 'Paseo de Montejo #340', '300', 'Depto 20', 'Centro', '97000', 'Mérida', 'Yucatán', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Mérida.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Casa Monclova 21', 'Blvd. Harold R. Pape #352', '310', 'Depto 21', 'Centro', '25700', 'Monclova', 'Coahuila', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monclova.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Casa Monterrey 22', 'Av. Constitución #364', '320', 'Depto 22', 'Obispado', '64000', 'Monterrey', 'Nuevo León', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Monterrey.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Casa San Pedro Garza García 23', 'Calz. del Valle #376', '330', 'Depto 23', 'Del Valle', '66220', 'San Pedro Garza García', 'Nuevo León', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en San Pedro Garza García.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Casa Ciudad de México 24', 'Av. Álvaro Obregón #388', '340', 'Depto 24', 'Roma Norte', '06700', 'Cuauhtémoc', 'CDMX', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Cuauhtémoc.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Casa Ciudad de México 25', 'Av. Presidente Masaryk #400', '350', 'Depto 25', 'Polanco', '11560', 'Miguel Hidalgo', 'CDMX', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Miguel Hidalgo.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Casa Guadalajara 26', 'Av. Vallarta #412', '360', 'Depto 26', 'Americana', '44100', 'Guadalajara', 'Jalisco', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Guadalajara.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Casa Saltillo 27', 'Blvd. Venustiano Carranza #424', '370', 'Depto 27', 'República', '25000', 'Saltillo', 'Coahuila', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Saltillo.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Casa Querétaro 28', 'Av. 5 de Febrero #436', '380', 'Depto 28', 'Centro', '76000', 'Querétaro', 'Querétaro', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Querétaro.', FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Casa Puebla 29', 'Av. Juárez #448', '390', 'Depto 29', 'La Paz', '72000', 'Puebla', 'Puebla', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Puebla.', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Casa Mérida 30', 'Paseo de Montejo #460', '400', 'Depto 30', 'Centro', '97000', 'Mérida', 'Yucatán', 'México', 'Fachada color arena con portón metálico, a media cuadra de avenida principal en Mérida.', FALSE, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.direcciones', 'id'), COALESCE((SELECT MAX(id) FROM clientes.direcciones), 1), true);

-- =================================================================================================
-- 015. TABLA: clientes.perfil_cutaneo (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.perfil_cutaneo (ID, ID_cliente, ID_tipo_piel, sensibilidad_solar, nivel_oleosidad, poros_dilatados, propension_acne, manchas_hiperpigmentacion, lineas_expresion, consentimiento_datos_sensibles, fecha_declaracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('clientes.perfil_cutaneo', 'id'), COALESCE((SELECT MAX(id) FROM clientes.perfil_cutaneo), 1), true);

-- =================================================================================================
-- 016. TABLA: clientes.cliente_condiciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.cliente_condiciones (ID, ID_cliente, ID_condicion_dermatologica, diagnosticada_por_medico, notas_paciente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, TRUE, 'Seguimiento clínico por Acné Vulgar Leve; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, FALSE, 'Seguimiento clínico por Acné Inflamatorio Moderado; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, TRUE, 'Seguimiento clínico por Rosácea Eritematotelangiectásica; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, FALSE, 'Seguimiento clínico por Melasma Epidérmico; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, TRUE, 'Seguimiento clínico por Dermatitis Atópica; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, FALSE, 'Seguimiento clínico por Dermatitis Seborreica; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, TRUE, 'Seguimiento clínico por Hiperpigmentación Postinflamatoria; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, FALSE, 'Seguimiento clínico por Piel Reactiva e Intolerante; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, TRUE, 'Seguimiento clínico por Fotoenvejecimiento Prematuro; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, FALSE, 'Seguimiento clínico por Queratosis Pilaris; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, TRUE, 'Seguimiento clínico por Eccema de Contacto Alérgico; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, FALSE, 'Seguimiento clínico por Xerosis Cutánea Severa; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, TRUE, 'Seguimiento clínico por Seborrea Facial Crónica; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, FALSE, 'Seguimiento clínico por Dermatitis Perioral; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, TRUE, 'Seguimiento clínico por Lentigos Solares Benignos; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, FALSE, 'Seguimiento clínico por Piel Post-Procedimiento Láser; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, TRUE, 'Seguimiento clínico por Foliculitis de Barba; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, FALSE, 'Seguimiento clínico por Queilitis Actínica Leve; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, TRUE, 'Seguimiento clínico por Milia Folicular; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, FALSE, 'Seguimiento clínico por Ojeras Vasculares y Pigmentarias; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, TRUE, 'Seguimiento clínico por Deshidratación Epidérmica Transitoria; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, FALSE, 'Seguimiento clínico por Piel con Tendencia Comedogénica; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, TRUE, 'Seguimiento clínico por Fotodermatosis Polimorfa; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, FALSE, 'Seguimiento clínico por Ictiosis Vulgar Leve; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, TRUE, 'Seguimiento clínico por Estrías Atróficas Tempranas; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, FALSE, 'Seguimiento clínico por Cicatríz Atrófica Post-Acné; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, TRUE, 'Seguimiento clínico por Psoriasis en Placas Leve; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, FALSE, 'Seguimiento clínico por Urticaria por Frío o Fricción; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, TRUE, 'Seguimiento clínico por Sensibilidad a Hidroxiácidos; evitar activos irritantes sin supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, FALSE, 'Seguimiento clínico por Alopecia Efluvio Telógeno; evitar activos irritantes sin supervisión.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.cliente_condiciones', 'id'), COALESCE((SELECT MAX(id) FROM clientes.cliente_condiciones), 1), true);

-- =================================================================================================
-- 017. TABLA: clientes.cuestionarios_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.cuestionarios_diagnostico (ID, codigo_cuestionario, titulo, descripcion, version_clinica, vigente_desde, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CUESTION_01', 'Cuestionario Clínico Dermatológico - Módulo 01', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 01).', 'v1.0', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CUESTION_02', 'Cuestionario Clínico Dermatológico - Módulo 02', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 02).', 'v1.1', '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CUESTION_03', 'Cuestionario Clínico Dermatológico - Módulo 03', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 03).', 'v1.2', '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CUESTION_04', 'Cuestionario Clínico Dermatológico - Módulo 04', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 04).', 'v1.3', '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CUESTION_05', 'Cuestionario Clínico Dermatológico - Módulo 05', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 05).', 'v1.4', '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CUESTION_06', 'Cuestionario Clínico Dermatológico - Módulo 06', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 06).', 'v1.5', '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CUESTION_07', 'Cuestionario Clínico Dermatológico - Módulo 07', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 07).', 'v1.6', '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CUESTION_08', 'Cuestionario Clínico Dermatológico - Módulo 08', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 08).', 'v1.7', '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CUESTION_09', 'Cuestionario Clínico Dermatológico - Módulo 09', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 09).', 'v1.8', '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CUESTION_10', 'Cuestionario Clínico Dermatológico - Módulo 10', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 10).', 'v1.9', '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CUESTION_11', 'Cuestionario Clínico Dermatológico - Módulo 11', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 11).', 'v2.0', '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CUESTION_12', 'Cuestionario Clínico Dermatológico - Módulo 12', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 12).', 'v2.1', '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CUESTION_13', 'Cuestionario Clínico Dermatológico - Módulo 13', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 13).', 'v2.2', '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CUESTION_14', 'Cuestionario Clínico Dermatológico - Módulo 14', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 14).', 'v2.3', '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CUESTION_15', 'Cuestionario Clínico Dermatológico - Módulo 15', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 15).', 'v2.4', '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CUESTION_16', 'Cuestionario Clínico Dermatológico - Módulo 16', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 16).', 'v2.5', '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CUESTION_17', 'Cuestionario Clínico Dermatológico - Módulo 17', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 17).', 'v2.6', '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CUESTION_18', 'Cuestionario Clínico Dermatológico - Módulo 18', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 18).', 'v2.7', '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CUESTION_19', 'Cuestionario Clínico Dermatológico - Módulo 19', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 19).', 'v2.8', '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CUESTION_20', 'Cuestionario Clínico Dermatológico - Módulo 20', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 20).', 'v2.9', '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CUESTION_21', 'Cuestionario Clínico Dermatológico - Módulo 21', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 21).', 'v3.0', '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CUESTION_22', 'Cuestionario Clínico Dermatológico - Módulo 22', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 22).', 'v3.1', '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CUESTION_23', 'Cuestionario Clínico Dermatológico - Módulo 23', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 23).', 'v3.2', '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CUESTION_24', 'Cuestionario Clínico Dermatológico - Módulo 24', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 24).', 'v3.3', '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CUESTION_25', 'Cuestionario Clínico Dermatológico - Módulo 25', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 25).', 'v3.4', '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CUESTION_26', 'Cuestionario Clínico Dermatológico - Módulo 26', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 26).', 'v3.5', '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CUESTION_27', 'Cuestionario Clínico Dermatológico - Módulo 27', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 27).', 'v3.6', '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CUESTION_28', 'Cuestionario Clínico Dermatológico - Módulo 28', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 28).', 'v3.7', '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CUESTION_29', 'Cuestionario Clínico Dermatológico - Módulo 29', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 29).', 'v3.8', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CUESTION_30', 'Cuestionario Clínico Dermatológico - Módulo 30', 'Evaluación diagnóstica estandarizada para perfilamiento cutáneo y selección segura de activos (Bloque 30).', 'v3.9', '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.cuestionarios_diagnostico', 'id'), COALESCE((SELECT MAX(id) FROM clientes.cuestionarios_diagnostico), 1), true);

-- =================================================================================================
-- 018. TABLA: clientes.preguntas_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.preguntas_diagnostico (ID, ID_cuestionario, numero_orden, enunciado_pregunta, tipo_respuesta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '¿Cómo describirías la sensación de tu piel 30 minutos después de lavarla sin aplicar crema?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '¿Con qué frecuencia presentas brillo excesivo en frente, nariz y mentón?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '¿Presentas brotes recurrentes de puntos negros, espinillas o lesiones inflamatorias?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '¿Tu piel se enrojece fácilmente con cambios bruscos de temperatura o alimentos picantes?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '¿Has notado manchas oscuras en mejillas, frente o labio superior tras exposición solar?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '¿Qué ocurre cuando expones tu rostro al sol sin protector solar durante 20 minutos?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '¿Sientes ardor, picazón o tirantez al usar productos con fragancia o alcohol?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '¿Tienes antecedentes médicos de dermatitis atópica, asma o alergias cutáneas?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '¿Utilizas actualmente retinoides tópicos, peróxido de benzoílo o ácidos exfoliantes?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '¿Te encuentras en etapa de embarazo o lactancia actualmente?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '¿Qué nivel de líneas de expresión o flacidez notas en contorno de ojos y surcos?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '¿Presentas descamación visible alrededor de las aletas nasales o entrecejo?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '¿Con qué frecuencia reaplicas protector solar FPS 50+ durante tu jornada?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '¿Tu rutina incluye exposición frecuente a pantallas o iluminación LED prolongada?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '¿Notas poros dilatados principalmente en mejillas internas y nariz?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '¿Has experimentado reacciones adversas previas con conservadores o aceites esenciales?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '¿Cuál es la textura cosmética que prefieres para uso diurno?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '¿Qué porcentaje de cobertura buscas en bases o protectores solares con color?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '¿Presentas bolsas, inflamación matutina o pigmentación oscura en ojeras?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '¿Cuántos pasos estás dispuesto(a) a mantener de forma constante en tu rutina diaria?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '¿Vives en una ciudad con clima árido, húmedo o alta radiación UV?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '¿Te has realizado peelings químicos, microagujas o láser en los últimos 30 días?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '¿Tus labios tienden a agrietarse o descamarse con facilidad?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '¿Sufres de piel áspera o pequeños bultos en la parte posterior de los brazos?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '¿Qué prioridad clínica tiene para ti controlar el exceso de sebo frente a hidratar?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '¿Notas tirantez en mejillas acompañada de brillo en la zona T al mediodía?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '¿Presentas marcas rojas o marrones que tardan meses en desvanecerse tras un grano?', 'ESCALA_NUMERICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '¿Utilizas maquillaje de larga duración o resistente al agua diariamente?', 'OPCION_UNICA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '¿Cuál es tu rango aproximado de horas de sueño reparador por noche?', 'OPCION_MULTIPLE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '¿Has recibido diagnóstico previo por un dermatólogo certificado para tu padecimiento?', 'ESCALA_NUMERICA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.preguntas_diagnostico', 'id'), COALESCE((SELECT MAX(id) FROM clientes.preguntas_diagnostico), 1), true);

-- =================================================================================================
-- 019. TABLA: clientes.opciones_pregunta (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.opciones_pregunta (ID, ID_pregunta, clave_opcion, texto_opcion, peso_clinico_puntos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('clientes.opciones_pregunta', 'id'), COALESCE((SELECT MAX(id) FROM clientes.opciones_pregunta), 1), true);

-- =================================================================================================
-- 020. TABLA: clientes.evaluaciones_diagnostico (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.evaluaciones_diagnostico (ID, ID_cliente, ID_cuestionario, fecha_realizacion, puntaje_total, diagnostico_sugerido, observaciones_dermoconsultor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '2026-02-01 11:30:00', 37, 'Perfil compatible con Acné Vulgar Leve; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para acné vulgar leve.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '2026-02-02 11:30:00', 39, 'Perfil compatible con Acné Inflamatorio Moderado; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para acné inflamatorio moderado.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '2026-02-03 11:30:00', 41, 'Perfil compatible con Rosácea Eritematotelangiectásica; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para rosácea eritematotelangiectásica.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '2026-02-04 11:30:00', 43, 'Perfil compatible con Melasma Epidérmico; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para melasma epidérmico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '2026-02-05 11:30:00', 45, 'Perfil compatible con Dermatitis Atópica; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para dermatitis atópica.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '2026-02-06 11:30:00', 47, 'Perfil compatible con Dermatitis Seborreica; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para dermatitis seborreica.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '2026-02-07 11:30:00', 49, 'Perfil compatible con Hiperpigmentación Postinflamatoria; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para hiperpigmentación postinflamatoria.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '2026-02-08 11:30:00', 51, 'Perfil compatible con Piel Reactiva e Intolerante; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para piel reactiva e intolerante.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '2026-02-09 11:30:00', 53, 'Perfil compatible con Fotoenvejecimiento Prematuro; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para fotoenvejecimiento prematuro.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '2026-02-10 11:30:00', 55, 'Perfil compatible con Queratosis Pilaris; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para queratosis pilaris.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '2026-02-11 11:30:00', 57, 'Perfil compatible con Eccema de Contacto Alérgico; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para eccema de contacto alérgico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '2026-02-12 11:30:00', 59, 'Perfil compatible con Xerosis Cutánea Severa; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para xerosis cutánea severa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '2026-02-13 11:30:00', 61, 'Perfil compatible con Seborrea Facial Crónica; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para seborrea facial crónica.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '2026-02-14 11:30:00', 63, 'Perfil compatible con Dermatitis Perioral; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para dermatitis perioral.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '2026-02-15 11:30:00', 65, 'Perfil compatible con Lentigos Solares Benignos; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para lentigos solares benignos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '2026-02-16 11:30:00', 67, 'Perfil compatible con Piel Post-Procedimiento Láser; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para piel post-procedimiento láser.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '2026-02-17 11:30:00', 69, 'Perfil compatible con Foliculitis de Barba; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para foliculitis de barba.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '2026-02-18 11:30:00', 71, 'Perfil compatible con Queilitis Actínica Leve; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para queilitis actínica leve.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '2026-02-19 11:30:00', 73, 'Perfil compatible con Milia Folicular; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para milia folicular.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '2026-02-20 11:30:00', 75, 'Perfil compatible con Ojeras Vasculares y Pigmentarias; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para ojeras vasculares y pigmentarias.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '2026-02-21 11:30:00', 77, 'Perfil compatible con Deshidratación Epidérmica Transitoria; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para deshidratación epidérmica transitoria.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '2026-02-22 11:30:00', 79, 'Perfil compatible con Piel con Tendencia Comedogénica; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para piel con tendencia comedogénica.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '2026-02-23 11:30:00', 81, 'Perfil compatible con Fotodermatosis Polimorfa; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para fotodermatosis polimorfa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '2026-02-24 11:30:00', 83, 'Perfil compatible con Ictiosis Vulgar Leve; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para ictiosis vulgar leve.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '2026-02-25 11:30:00', 85, 'Perfil compatible con Estrías Atróficas Tempranas; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para estrías atróficas tempranas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '2026-02-26 11:30:00', 87, 'Perfil compatible con Cicatríz Atrófica Post-Acné; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para cicatríz atrófica post-acné.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '2026-02-27 11:30:00', 89, 'Perfil compatible con Psoriasis en Placas Leve; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para psoriasis en placas leve.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '2026-02-28 11:30:00', 91, 'Perfil compatible con Urticaria por Frío o Fricción; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para urticaria por frío o fricción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '2026-02-01 11:30:00', 93, 'Perfil compatible con Sensibilidad a Hidroxiácidos; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para sensibilidad a hidroxiácidos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '2026-02-02 11:30:00', 35, 'Perfil compatible con Alopecia Efluvio Telógeno; prioridad en protección solar y barrera.', 'Se sugiere iniciar rutina progresiva sin fragancias ni alcoholes secantes para alopecia efluvio telógeno.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.evaluaciones_diagnostico', 'id'), COALESCE((SELECT MAX(id) FROM clientes.evaluaciones_diagnostico), 1), true);

-- =================================================================================================
-- 021. TABLA: clientes.respuestas_evaluacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.respuestas_evaluacion (ID, ID_evaluacion, ID_pregunta, ID_opcion_seleccionada, valor_texto_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 'Reporta exposición solar diaria mayor a 2 horas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 'Sin antecedentes de reacciones alérgicas graves.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 'Presenta sensibilidad leve al iniciar nuevos activos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 'Prefiere texturas en gel o suero acuoso de rápida absorción.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.respuestas_evaluacion', 'id'), COALESCE((SELECT MAX(id) FROM clientes.respuestas_evaluacion), 1), true);

-- =================================================================================================
-- 022. TABLA: clientes.consentimientos_privacidad (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.consentimientos_privacidad (ID, ID_cliente, version_aviso_privacidad, acepta_finalidades_primarias, acepta_finalidades_secundarias_marketing, acepta_tratamiento_datos_salud_sensibles, direccion_ip_firma, medio_consentimiento, fecha_consentimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.3.9', 'CHECKBOX_DIGITAL', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.6.11', 'FIRMA_ELECTRONICA', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.9.13', 'EN_SUCURSAL', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.12.15', 'CHECKBOX_DIGITAL', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.15.17', 'FIRMA_ELECTRONICA', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.18.19', 'EN_SUCURSAL', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.21.21', 'CHECKBOX_DIGITAL', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.24.23', 'FIRMA_ELECTRONICA', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.27.25', 'EN_SUCURSAL', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.30.27', 'CHECKBOX_DIGITAL', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.33.29', 'FIRMA_ELECTRONICA', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.36.31', 'EN_SUCURSAL', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.39.33', 'CHECKBOX_DIGITAL', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.42.35', 'FIRMA_ELECTRONICA', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.45.37', 'EN_SUCURSAL', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.48.39', 'CHECKBOX_DIGITAL', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.51.41', 'FIRMA_ELECTRONICA', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.54.43', 'EN_SUCURSAL', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.57.45', 'CHECKBOX_DIGITAL', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.60.47', 'FIRMA_ELECTRONICA', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.63.49', 'EN_SUCURSAL', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.66.51', 'CHECKBOX_DIGITAL', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.69.53', 'FIRMA_ELECTRONICA', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.72.55', 'EN_SUCURSAL', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.75.57', 'CHECKBOX_DIGITAL', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.78.59', 'FIRMA_ELECTRONICA', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.81.61', 'EN_SUCURSAL', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.84.63', 'CHECKBOX_DIGITAL', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'v2.1-2026', TRUE, TRUE, TRUE, '189.203.87.65', 'FIRMA_ELECTRONICA', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'v2.1-2026', TRUE, FALSE, FALSE, '189.203.90.67', 'EN_SUCURSAL', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.consentimientos_privacidad', 'id'), COALESCE((SELECT MAX(id) FROM clientes.consentimientos_privacidad), 1), true);

-- =================================================================================================
-- 023. TABLA: clientes.solicitudes_arco (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.solicitudes_arco (ID, folio_solicitud, ID_cliente, tipo_derecho, motivo_solicitud, estado_tramite, fecha_limite_respuesta, resolucion_juridica, fecha_resolucion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-SOLIC-2026-0001', 1, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'RECIBIDA', '2026-03-01', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-SOLIC-2026-0002', 2, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'EN_REVISION', '2026-03-02', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-SOLIC-2026-0003', 3, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'PROCEDENTE', '2026-03-03', 'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-02-28 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-SOLIC-2026-0004', 4, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'IMPROCEDENTE', '2026-03-04', 'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-01 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-SOLIC-2026-0005', 5, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'CONCLUIDA', '2026-03-05', 'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-02 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-SOLIC-2026-0006', 6, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'RECIBIDA', '2026-03-06', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-SOLIC-2026-0007', 7, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'EN_REVISION', '2026-03-07', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-SOLIC-2026-0008', 8, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'PROCEDENTE', '2026-03-08', 'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-05 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-SOLIC-2026-0009', 9, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'IMPROCEDENTE', '2026-03-09', 'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-06 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-SOLIC-2026-0010', 10, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'CONCLUIDA', '2026-03-10', 'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-07 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-SOLIC-2026-0011', 11, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'RECIBIDA', '2026-03-11', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-SOLIC-2026-0012', 12, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'EN_REVISION', '2026-03-12', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-SOLIC-2026-0013', 13, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'PROCEDENTE', '2026-03-13', 'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-10 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-SOLIC-2026-0014', 14, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'IMPROCEDENTE', '2026-03-14', 'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-11 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-SOLIC-2026-0015', 15, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'CONCLUIDA', '2026-03-15', 'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-12 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-SOLIC-2026-0016', 16, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'RECIBIDA', '2026-03-16', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-SOLIC-2026-0017', 17, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'EN_REVISION', '2026-03-17', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-SOLIC-2026-0018', 18, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'PROCEDENTE', '2026-03-18', 'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-15 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-SOLIC-2026-0019', 19, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'IMPROCEDENTE', '2026-03-19', 'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-16 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-SOLIC-2026-0020', 20, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'CONCLUIDA', '2026-03-20', 'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-17 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-SOLIC-2026-0021', 21, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'RECIBIDA', '2026-03-21', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-SOLIC-2026-0022', 22, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'EN_REVISION', '2026-03-22', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-SOLIC-2026-0023', 23, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'PROCEDENTE', '2026-03-23', 'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-20 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-SOLIC-2026-0024', 24, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'IMPROCEDENTE', '2026-03-24', 'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-21 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-SOLIC-2026-0025', 25, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'CONCLUIDA', '2026-03-25', 'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-22 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-SOLIC-2026-0026', 26, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'RECIBIDA', '2026-03-26', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-SOLIC-2026-0027', 27, 'CANCELACION', 'Solicitud de supresión de historial clínico tras cierre de cuenta.', 'EN_REVISION', '2026-03-27', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-SOLIC-2026-0028', 28, 'OPOSICION', 'Oposición al tratamiento de datos para campañas promocionales de marketing.', 'PROCEDENTE', '2026-03-28', 'Resolución jurídica procedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-03-25 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-SOLIC-2026-0029', 29, 'ACCESO', 'Solicitud de copia íntegra de expediente dermatológico y compras históricas.', 'IMPROCEDENTE', '2026-03-01', 'Resolución jurídica improcedente conforme a los artículos 28-34 de la LFPDPPP.', '2026-02-26 16:00:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-SOLIC-2026-0030', 30, 'RECTIFICACION', 'Actualización de domicilio fiscal y corrección de segundo apellido.', 'CONCLUIDA', '2026-03-02', 'Resolución jurídica concluida conforme a los artículos 28-34 de la LFPDPPP.', '2026-02-27 16:00:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.solicitudes_arco', 'id'), COALESCE((SELECT MAX(id) FROM clientes.solicitudes_arco), 1), true);

-- =================================================================================================
-- 024. TABLA: clientes.preferencias_comunicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.preferencias_comunicacion (ID, ID_cliente, canal_email, canal_sms, canal_whatsapp, notificaciones_ofertas, alertas_reabastecimiento_rutina, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('clientes.preferencias_comunicacion', 'id'), COALESCE((SELECT MAX(id) FROM clientes.preferencias_comunicacion), 1), true);

-- =================================================================================================
-- 025. TABLA: clientes.metodos_pago_tokenizados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO clientes.metodos_pago_tokenizados (ID, ID_cliente, pasarela_emisor, token_tarjeta_pasarela, marca_tarjeta, ultimos_cuatro_digitos, mes_expiracion, anio_expiracion, titular_tarjeta_hash, es_predeterminada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Stripe', 'tok_stripe_0001_6b86b273ff34', 'VISA', '4101', 1, 2027, '0b194f778b695f7d1ee25f0fc83fc976a90e607bb2fd9e6c326b437a392c7c81', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'MercadoPago', 'tok_mercadopago_0002_d4735e3a265e', 'MASTERCARD', '4102', 2, 2028, 'b5089119e17b1af413b65d359280485d50b84294e9577c07e1f9a02b9a99fc82', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Openpay', 'tok_openpay_0003_4e07408562be', 'AMEX', '4103', 3, 2029, '45341ff23425ad042ea3567df258369b890d2496756cc4ba0ae505d8e16d6654', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Stripe', 'tok_stripe_0004_4b227777d4dd', 'VISA', '4104', 4, 2030, '7e2e512ce2afb7fd2b41f464f0a03bdf4218daee957756d103da34097e42be35', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'MercadoPago', 'tok_mercadopago_0005_ef2d127de37b', 'MASTERCARD', '4105', 5, 2026, '17fa28699878c4cfd3257a2297c006400fb13f67a0961333673c30c6284d4a1b', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Openpay', 'tok_openpay_0006_e7f6c011776e', 'AMEX', '4106', 6, 2027, '72a63232098ea1155ae36cfcc260144c8c56311aa5f3dadc5dab79c96174fe5f', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Stripe', 'tok_stripe_0007_7902699be42c', 'VISA', '4107', 7, 2028, '446e2e8f010fdb70828eec4ee4c26a4a58d12a0af2f227466c36ff38decf8598', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'MercadoPago', 'tok_mercadopago_0008_2c624232cdd2', 'MASTERCARD', '4108', 8, 2029, '4c0704f00c809d2a406c69961c389e61f04a75bcd092227d9d0f141e3f8b01b4', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Openpay', 'tok_openpay_0009_19581e27de7c', 'AMEX', '4109', 9, 2030, 'ce53afb156d242037a3f43c62cb0bf01c88ac2f4514019a72d087da2c6e3af98', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Stripe', 'tok_stripe_0010_4a44dc153642', 'VISA', '4110', 10, 2026, 'fa3625406ef120bd461c534e8b7488f5c7ce0a8df2dc43378276c0734f49fdee', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'MercadoPago', 'tok_mercadopago_0011_4fc82b26aecb', 'MASTERCARD', '4111', 11, 2027, 'c21395fed196536311602393b9b7df640df291eb923c2bb9dfb45e9814a1c3be', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Openpay', 'tok_openpay_0012_6b51d431df5d', 'AMEX', '4112', 12, 2028, 'fbdb3d0a3b13fd8eea69d553f210ddfe85715605a20717b938f0a1e2beafce5b', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Stripe', 'tok_stripe_0013_3fdba35f04dc', 'VISA', '4113', 1, 2029, '10a09749b970ef7fdf37e4a052a340b7b329f9d57c2547f685728d41af9cddff', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'MercadoPago', 'tok_mercadopago_0014_8527a891e224', 'MASTERCARD', '4114', 2, 2030, 'b1ca2fc864ba685b5e806ca5a06013908b363d893db6ca021d649accb78aadd7', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Openpay', 'tok_openpay_0015_e629fa6598d7', 'AMEX', '4115', 3, 2026, 'cbd39133441b2d2bf0e885fde9ffb019c39f739294a2227632054fc78d8366a1', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Stripe', 'tok_stripe_0016_b17ef6d19c7a', 'VISA', '4116', 4, 2027, 'b758b7ef116763b67d09424104944f5ba4de6f6565f96ecef1e70af44e3f9b0a', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'MercadoPago', 'tok_mercadopago_0017_4523540f1504', 'MASTERCARD', '4117', 5, 2028, '3ce6b9f0ac46f58cc93f1939718eb8b9e25cf0c3b941fb8bf5284c2dc9df8d82', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Openpay', 'tok_openpay_0018_4ec9599fc203', 'AMEX', '4118', 6, 2029, 'ed37b795d057faa9ecacb061b040f0524abbb093e87cc38828edfa4bec44ea9e', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Stripe', 'tok_stripe_0019_9400f1b21cb5', 'VISA', '4119', 7, 2030, 'dca543b8abf8e56b35a3ba2e5780ceba665506ec55e6c55f19c8f9ef2e2536a5', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'MercadoPago', 'tok_mercadopago_0020_f5ca38f748a1', 'MASTERCARD', '4120', 8, 2026, '782c06aac9cd027861f5b08718faeea29a4574351dc71fa662c7770950ea1b59', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Openpay', 'tok_openpay_0021_6f4b6612125f', 'AMEX', '4121', 9, 2027, '658f677634e28decbad27f4bec1ed46d3bb0f80d6f24a2433d8ab35c732bdf01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Stripe', 'tok_stripe_0022_785f3ec7eb32', 'VISA', '4122', 10, 2028, '3b2482227f9544fda9827ba4d112444bbefa45f12381430946e00b5361d84fd8', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'MercadoPago', 'tok_mercadopago_0023_535fa30d7e25', 'MASTERCARD', '4123', 11, 2029, '24187d5ce3ea2acfbec5ac74f5ef06152ef2237e7b96fa7862d3154969af4d5d', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Openpay', 'tok_openpay_0024_c2356069e9d1', 'AMEX', '4124', 12, 2030, '5952e02d16cc850d5fb79b461d84b46521af5a500ded94dd9583d7ee05a35682', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Stripe', 'tok_stripe_0025_b7a56873cd77', 'VISA', '4125', 1, 2026, '794e6cee9862666903ebe2c4ae09d8fa805b24e7a0593db856ba34cf4499d5de', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'MercadoPago', 'tok_mercadopago_0026_5f9c4ab08cac', 'MASTERCARD', '4126', 2, 2027, 'f0aec558d76a461b3c5ef4dc45015fc3300270778f4aa91422f2bf1474b06bc9', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Openpay', 'tok_openpay_0027_670671cd9740', 'AMEX', '4127', 3, 2028, 'e469ef0b1b717c775949de0a2a7e6c77f978dd68f4f3a36141907106a5cdf6fb', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Stripe', 'tok_stripe_0028_59e19706d51d', 'VISA', '4128', 4, 2029, '4068e947471c19a0f15bb379a841a8962cf004720174632108dc8491ddf7428b', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MercadoPago', 'tok_mercadopago_0029_35135aaa6cc2', 'MASTERCARD', '4129', 5, 2030, '4b31d14b3b1770734d635aabd5887414e84a4208a751b4c55fd6a27f810fd012', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Openpay', 'tok_openpay_0030_624b60c58c9d', 'AMEX', '4130', 6, 2026, 'e3e8e3a7a9491a1a835ee5b34c63d4d97a21e54b35f6aee0d2e614956701ec20', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('clientes.metodos_pago_tokenizados', 'id'), COALESCE((SELECT MAX(id) FROM clientes.metodos_pago_tokenizados), 1), true);

-- =================================================================================================
-- 026. TABLA: catalogo.marcas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.marcas (ID, codigo_marca, nombre_marca, pais_origen, sitio_web, es_dermocosmetica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MARCA_01', 'La Roche-Posay', 'Francia', 'https://www.laroche-posay.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MARCA_02', 'CeraVe Dermatological', 'Estados Unidos', 'https://www.cerave.com.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MARCA_03', 'The Ordinary Deciem', 'Canadá', 'https://theordinary.com', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MARCA_04', 'ISDIN Fotoprotección', 'España', 'https://www.isdin.com/es-mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MARCA_05', 'Bioderma Laboratoire', 'Francia', 'https://www.bioderma.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MARCA_06', 'Eau Thermale Avène', 'Francia', 'https://www.eau-thermale-avene.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MARCA_07', 'Eucerin Beiersdorf', 'Alemania', 'https://www.eucerin.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MARCA_08', 'Vichy Laboratoires', 'Francia', 'https://www.vichy.com.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MARCA_09', 'SkinCeuticals Clinical', 'Estados Unidos', 'https://www.skinceuticals.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MARCA_10', 'Sesderma Nanotech', 'España', 'https://www.sesderma.com/mx_es', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MARCA_11', 'NARS Cosmetics', 'Estados Unidos', 'https://www.narscosmetics.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MARCA_12', 'MAC Professional', 'Canadá', 'https://www.maccosmetics.com.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MARCA_13', 'Fenty Beauty', 'Estados Unidos', 'https://fentybeauty.com', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MARCA_14', 'Rare Beauty', 'Estados Unidos', 'https://www.rarebeauty.com', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MARCA_15', 'Clinique Laboratories', 'Estados Unidos', 'https://www.clinique.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MARCA_16', 'Estée Lauder', 'Estados Unidos', 'https://www.esteelauder.com.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MARCA_17', 'Lancôme Paris', 'Francia', 'https://www.lancome.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MARCA_18', 'Charlotte Tilbury', 'Reino Unido', 'https://www.charlottetilbury.com', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MARCA_19', 'Paula''s Choice Skincare', 'Estados Unidos', 'https://www.paulaschoice.com', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MARCA_20', 'COSRX K-Beauty', 'Corea del Sur', 'https://www.cosrx.com', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MARCA_21', 'Laneige Amorepacific', 'Corea del Sur', 'https://www.laneige.com', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MARCA_22', 'Uriage Eau Thermale', 'Francia', 'https://www.uriage.com/MX/es', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MARCA_23', 'Laboratoire SVR', 'Francia', 'https://mx.labo-svr.com', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MARCA_24', 'MartiDerm Ampollas', 'España', 'https://www.martiderm.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MARCA_25', 'Heliocare Cantabria Labs', 'España', 'https://www.cantabrialabs.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MARCA_26', 'Kiehl''s Since 1851', 'Estados Unidos', 'https://www.kiehls.com.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MARCA_27', 'Garnier SkinActive', 'Francia', 'https://www.garnier.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MARCA_28', 'L''Oréal Paris Derm', 'Francia', 'https://www.loreal-paris.com.mx', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MARCA_29', 'Neutrogena Derm', 'Estados Unidos', 'https://www.neutrogena.com.mx', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MARCA_30', 'DermaCare Labs México', 'México', 'https://www.dermacare.mx', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.marcas', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.marcas), 1), true);

-- =================================================================================================
-- 027. TABLA: catalogo.laboratorios_fabricantes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.laboratorios_fabricantes (ID, clave_laboratorio, razon_social, licencia_sanitaria, pais, certificacion_gmp_vigente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'LABORATO_01', 'Laboratorios La Roche-Posay S.A. de C.V.', 'COF-LIC-FAB-2026-0001', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'LABORATO_02', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'COF-LIC-FAB-2026-0002', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'LABORATO_03', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'COF-LIC-FAB-2026-0003', 'Canadá', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'LABORATO_04', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'COF-LIC-FAB-2026-0004', 'España', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'LABORATO_05', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'COF-LIC-FAB-2026-0005', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'LABORATO_06', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'COF-LIC-FAB-2026-0006', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'LABORATO_07', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'COF-LIC-FAB-2026-0007', 'Alemania', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'LABORATO_08', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'COF-LIC-FAB-2026-0008', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'LABORATO_09', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'COF-LIC-FAB-2026-0009', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'LABORATO_10', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'COF-LIC-FAB-2026-0010', 'España', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'LABORATO_11', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'COF-LIC-FAB-2026-0011', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'LABORATO_12', 'Laboratorios MAC Professional S.A. de C.V.', 'COF-LIC-FAB-2026-0012', 'Canadá', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'LABORATO_13', 'Laboratorios Fenty Beauty S.A. de C.V.', 'COF-LIC-FAB-2026-0013', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'LABORATO_14', 'Laboratorios Rare Beauty S.A. de C.V.', 'COF-LIC-FAB-2026-0014', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'LABORATO_15', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'COF-LIC-FAB-2026-0015', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'LABORATO_16', 'Laboratorios Estée Lauder S.A. de C.V.', 'COF-LIC-FAB-2026-0016', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'LABORATO_17', 'Laboratorios Lancôme Paris S.A. de C.V.', 'COF-LIC-FAB-2026-0017', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'LABORATO_18', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'COF-LIC-FAB-2026-0018', 'Reino Unido', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'LABORATO_19', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'COF-LIC-FAB-2026-0019', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'LABORATO_20', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'COF-LIC-FAB-2026-0020', 'Corea del Sur', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'LABORATO_21', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'COF-LIC-FAB-2026-0021', 'Corea del Sur', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'LABORATO_22', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'COF-LIC-FAB-2026-0022', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'LABORATO_23', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'COF-LIC-FAB-2026-0023', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'LABORATO_24', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'COF-LIC-FAB-2026-0024', 'España', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'LABORATO_25', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'COF-LIC-FAB-2026-0025', 'España', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'LABORATO_26', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'COF-LIC-FAB-2026-0026', 'Estados Unidos', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'LABORATO_27', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'COF-LIC-FAB-2026-0027', 'Francia', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'LABORATO_28', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'COF-LIC-FAB-2026-0028', 'Francia', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'LABORATO_29', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'COF-LIC-FAB-2026-0029', 'Estados Unidos', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'LABORATO_30', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'COF-LIC-FAB-2026-0030', 'México', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.laboratorios_fabricantes', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.laboratorios_fabricantes), 1), true);

-- =================================================================================================
-- 028. TABLA: catalogo.categorias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.categorias (ID, codigo_categoria, nombre_categoria, descripcion, ID_categoria_padre, nivel_arbol, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CATEGORI_01', 'Sueros Concentrados', 'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CATEGORI_02', 'Limpiadores Faciales', 'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CATEGORI_03', 'Fotoprotección Solar', 'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CATEGORI_04', 'Hidratantes y Barrera', 'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CATEGORI_05', 'Tratamiento Anti-Edad', 'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CATEGORI_06', 'Control de Acné y Sebo', 'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CATEGORI_07', 'Despigmentantes', 'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CATEGORI_08', 'Contorno de Ojos', 'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CATEGORI_09', 'Exfoliantes Químicos', 'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CATEGORI_10', 'Maquillaje Dermatológico', 'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CATEGORI_11', 'Cuidado Labial', 'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CATEGORI_12', 'Cuidado Corporal', 'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CATEGORI_13', 'Aguas Termales y Brumas', 'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CATEGORI_14', 'Desmaquillantes Bifásicos', 'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CATEGORI_15', 'Mascarillas Terapéuticas', 'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', NULL, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CATEGORI_16', 'Sueros Concentrados (Línea Clínica)', 'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', 1, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CATEGORI_17', 'Limpiadores Faciales (Línea Clínica)', 'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', 2, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CATEGORI_18', 'Fotoprotección Solar (Línea Clínica)', 'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', 3, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CATEGORI_19', 'Hidratantes y Barrera (Línea Clínica)', 'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', 4, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CATEGORI_20', 'Tratamiento Anti-Edad (Línea Clínica)', 'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', 5, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CATEGORI_21', 'Control de Acné y Sebo (Línea Clínica)', 'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', 6, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CATEGORI_22', 'Despigmentantes (Línea Clínica)', 'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', 7, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CATEGORI_23', 'Contorno de Ojos (Línea Clínica)', 'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', 8, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CATEGORI_24', 'Exfoliantes Químicos (Línea Clínica)', 'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', 9, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CATEGORI_25', 'Maquillaje Dermatológico (Línea Clínica)', 'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', 10, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CATEGORI_26', 'Cuidado Labial (Línea Clínica)', 'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CATEGORI_27', 'Cuidado Corporal (Línea Clínica)', 'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', 12, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CATEGORI_28', 'Aguas Termales y Brumas (Línea Clínica)', 'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', 13, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CATEGORI_29', 'Desmaquillantes Bifásicos (Línea Clínica)', 'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', 14, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CATEGORI_30', 'Mascarillas Terapéuticas (Línea Clínica)', 'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', 15, 2, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.categorias', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.categorias), 1), true);

-- =================================================================================================
-- 029. TABLA: catalogo.subcategorias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.subcategorias (ID, ID_categoria, codigo_subcategoria, nombre_subcategoria, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SUBCATEG_01', 'Especialidad Sueros Concentrados', 'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SUBCATEG_02', 'Especialidad Limpiadores Faciales', 'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SUBCATEG_03', 'Especialidad Fotoprotección Solar', 'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SUBCATEG_04', 'Especialidad Hidratantes y Barrera', 'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SUBCATEG_05', 'Especialidad Tratamiento Anti-Edad', 'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SUBCATEG_06', 'Especialidad Control de Acné y Sebo', 'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SUBCATEG_07', 'Especialidad Despigmentantes', 'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SUBCATEG_08', 'Especialidad Contorno de Ojos', 'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SUBCATEG_09', 'Especialidad Exfoliantes Químicos', 'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SUBCATEG_10', 'Especialidad Maquillaje Dermatológico', 'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SUBCATEG_11', 'Especialidad Cuidado Labial', 'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SUBCATEG_12', 'Especialidad Cuidado Corporal', 'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SUBCATEG_13', 'Especialidad Aguas Termales y Brumas', 'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SUBCATEG_14', 'Especialidad Desmaquillantes Bifásicos', 'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SUBCATEG_15', 'Especialidad Mascarillas Terapéuticas', 'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SUBCATEG_16', 'Especialidad Sueros Concentrados', 'Fórmulas de alta biodisponibilidad con activos puros para necesidades específicas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SUBCATEG_17', 'Especialidad Limpiadores Faciales', 'Syndets, geles y aguas micelares respetuosas con el manto ácido epidérmico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SUBCATEG_18', 'Especialidad Fotoprotección Solar', 'Protectores de amplio espectro UVA/UVB, luz visible HEV e infrarrojo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SUBCATEG_19', 'Especialidad Hidratantes y Barrera', 'Emulsiones con ceramidas, escualano y pantenol para restaurar la barrera cutánea.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SUBCATEG_20', 'Especialidad Tratamiento Anti-Edad', 'Retinoides, péptidos biomiméticos y antioxidantes contra el fotoenvejecimiento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SUBCATEG_21', 'Especialidad Control de Acné y Sebo', 'BHA, niacinamida y seborreguladores no comedogénicos de grado clínico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SUBCATEG_22', 'Especialidad Despigmentantes', 'Complejos inhibidores de tirosinasa para melasma e hiperpigmentación.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SUBCATEG_23', 'Especialidad Contorno de Ojos', 'Tratamientos oftalmológicamente probados para ojeras, bolsas y patas de gallo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SUBCATEG_24', 'Especialidad Exfoliantes Químicos', 'AHA, BHA y PHA de pH controlado para renovación celular progresiva.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SUBCATEG_25', 'Especialidad Maquillaje Dermatológico', 'Bases, correctores y polvos minerales no comedogénicos para piel sensible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SUBCATEG_26', 'Especialidad Cuidado Labial', 'Bálsamos reparadores y labiales hidratantes con péptidos y protección solar.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SUBCATEG_27', 'Especialidad Cuidado Corporal', 'Lociones queratolíticas con urea y emolientes para xerosis y dermatitis.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SUBCATEG_28', 'Especialidad Aguas Termales y Brumas', 'Soluciones isotónicas ricas en minerales calmantes y antioxidantes.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SUBCATEG_29', 'Especialidad Desmaquillantes Bifásicos', 'Aceites y bálsamos emulsionables para retirar filtros resistentes al agua.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SUBCATEG_30', 'Especialidad Mascarillas Terapéuticas', 'Tratamientos intensivos nocturnos de recuperación lipídica e hidratación.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.subcategorias', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.subcategorias), 1), true);

-- =================================================================================================
-- 030. TABLA: catalogo.tipos_aplicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.tipos_aplicacion (ID, codigo_aplicacion, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'APLICACI_01', 'Rostro Completo', 'Protocolo de aplicación tópica optimizado para rostro completo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'APLICACI_02', 'Contorno de Ojos', 'Protocolo de aplicación tópica optimizado para contorno de ojos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'APLICACI_03', 'Zona T', 'Protocolo de aplicación tópica optimizado para zona t.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'APLICACI_04', 'Cuello y Escote', 'Protocolo de aplicación tópica optimizado para cuello y escote.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'APLICACI_05', 'Labios', 'Protocolo de aplicación tópica optimizado para labios.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'APLICACI_06', 'Cuerpo Completo', 'Protocolo de aplicación tópica optimizado para cuerpo completo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'APLICACI_07', 'Áreas Localizadas', 'Protocolo de aplicación tópica optimizado para áreas localizadas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'APLICACI_08', 'Cuero Cabelludo', 'Protocolo de aplicación tópica optimizado para cuero cabelludo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'APLICACI_09', 'Manos y Cutículas', 'Protocolo de aplicación tópica optimizado para manos y cutículas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'APLICACI_10', 'Pestañas y Cejas', 'Protocolo de aplicación tópica optimizado para pestañas y cejas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'APLICACI_11', 'Mejillas y Pómulos', 'Protocolo de aplicación tópica optimizado para mejillas y pómulos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'APLICACI_12', 'Uso Nocturno Facial', 'Protocolo de aplicación tópica optimizado para uso nocturno facial.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'APLICACI_13', 'Uso Diurno Fotoprotector', 'Protocolo de aplicación tópica optimizado para uso diurno fotoprotector.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'APLICACI_14', 'Post-Procedimiento', 'Protocolo de aplicación tópica optimizado para post-procedimiento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'APLICACI_15', 'Piel Corporal Áspera', 'Protocolo de aplicación tópica optimizado para piel corporal áspera.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'APLICACI_16', 'Rostro Completo (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para rostro completo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'APLICACI_17', 'Contorno de Ojos (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para contorno de ojos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'APLICACI_18', 'Zona T (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para zona t.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'APLICACI_19', 'Cuello y Escote (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para cuello y escote.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'APLICACI_20', 'Labios (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para labios.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'APLICACI_21', 'Cuerpo Completo (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para cuerpo completo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'APLICACI_22', 'Áreas Localizadas (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para áreas localizadas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'APLICACI_23', 'Cuero Cabelludo (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para cuero cabelludo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'APLICACI_24', 'Manos y Cutículas (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para manos y cutículas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'APLICACI_25', 'Pestañas y Cejas (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para pestañas y cejas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'APLICACI_26', 'Mejillas y Pómulos (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para mejillas y pómulos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'APLICACI_27', 'Uso Nocturno Facial (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para uso nocturno facial.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'APLICACI_28', 'Uso Diurno Fotoprotector (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para uso diurno fotoprotector.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'APLICACI_29', 'Post-Procedimiento (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para post-procedimiento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'APLICACI_30', 'Piel Corporal Áspera (Uso Clínico)', 'Protocolo de aplicación tópica optimizado para piel corporal áspera.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.tipos_aplicacion', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.tipos_aplicacion), 1), true);

-- =================================================================================================
-- 031. TABLA: catalogo.certificaciones_sanitarias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.certificaciones_sanitarias (ID, codigo_certificacion, nombre_certificacion, organismo_certificador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CERTIFIC_01', 'Registro Sanitario COFEPRIS Nivel 1', 'COFEPRIS - Secretaría de Salud México', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CERTIFIC_02', 'Certificación GMP ISO 22716 Nivel 1', 'Bureau Veritas Quality International', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CERTIFIC_03', 'Dermatológicamente Probado Nivel 1', 'Colegio Ibero-Latinoamericano de Dermatología', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CERTIFIC_04', 'No Comedogénico Clínico Nivel 1', 'Instituto Europeo de Evaluación Cutánea', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CERTIFIC_05', 'Oftalmológicamente Testado Nivel 1', 'Laboratorio Clínico Ocular Eurofins', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CERTIFIC_06', 'Hipoalergénico Certificado Nivel 1', 'Centro de Alergología Dermatológica CDMX', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CERTIFIC_07', 'Leaping Bunny Cruelty Free Nivel 1', 'Cruelty Free International', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CERTIFIC_08', 'COSMOS Organic / ECOCERT Nivel 1', 'ECOCERT Greenlife SAS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CERTIFIC_09', 'Apto Piel Sensible y Atópica Nivel 1', 'Asociación Mexicana de Dermatología Clínica', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CERTIFIC_10', 'Estabilidad Térmica Cadena Frío Nivel 1', 'Centro Nacional de Metrología CENAM', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CERTIFIC_11', 'Registro Sanitario COFEPRIS Nivel 2', 'COFEPRIS - Secretaría de Salud México', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CERTIFIC_12', 'Certificación GMP ISO 22716 Nivel 2', 'Bureau Veritas Quality International', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CERTIFIC_13', 'Dermatológicamente Probado Nivel 2', 'Colegio Ibero-Latinoamericano de Dermatología', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CERTIFIC_14', 'No Comedogénico Clínico Nivel 2', 'Instituto Europeo de Evaluación Cutánea', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CERTIFIC_15', 'Oftalmológicamente Testado Nivel 2', 'Laboratorio Clínico Ocular Eurofins', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CERTIFIC_16', 'Hipoalergénico Certificado Nivel 2', 'Centro de Alergología Dermatológica CDMX', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CERTIFIC_17', 'Leaping Bunny Cruelty Free Nivel 2', 'Cruelty Free International', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CERTIFIC_18', 'COSMOS Organic / ECOCERT Nivel 2', 'ECOCERT Greenlife SAS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CERTIFIC_19', 'Apto Piel Sensible y Atópica Nivel 2', 'Asociación Mexicana de Dermatología Clínica', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CERTIFIC_20', 'Estabilidad Térmica Cadena Frío Nivel 2', 'Centro Nacional de Metrología CENAM', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CERTIFIC_21', 'Registro Sanitario COFEPRIS Nivel 3', 'COFEPRIS - Secretaría de Salud México', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CERTIFIC_22', 'Certificación GMP ISO 22716 Nivel 3', 'Bureau Veritas Quality International', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CERTIFIC_23', 'Dermatológicamente Probado Nivel 3', 'Colegio Ibero-Latinoamericano de Dermatología', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CERTIFIC_24', 'No Comedogénico Clínico Nivel 3', 'Instituto Europeo de Evaluación Cutánea', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CERTIFIC_25', 'Oftalmológicamente Testado Nivel 3', 'Laboratorio Clínico Ocular Eurofins', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CERTIFIC_26', 'Hipoalergénico Certificado Nivel 3', 'Centro de Alergología Dermatológica CDMX', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CERTIFIC_27', 'Leaping Bunny Cruelty Free Nivel 3', 'Cruelty Free International', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CERTIFIC_28', 'COSMOS Organic / ECOCERT Nivel 3', 'ECOCERT Greenlife SAS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CERTIFIC_29', 'Apto Piel Sensible y Atópica Nivel 3', 'Asociación Mexicana de Dermatología Clínica', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CERTIFIC_30', 'Estabilidad Térmica Cadena Frío Nivel 3', 'Centro Nacional de Metrología CENAM', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.certificaciones_sanitarias', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.certificaciones_sanitarias), 1), true);

-- =================================================================================================
-- 032. TABLA: catalogo.productos_maestros (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.productos_maestros (ID, ID_marca, ID_subcategoria, ID_laboratorio, ID_tipo_aplicacion, ID_certificacion_sanitaria, codigo_producto, nombre_comercial, descripcion_corta, descripcion_detallada, modo_empleo, requiere_prescripcion_medica, factor_proteccion_solar_fps, es_sensible_temperatura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 1, 'PRODUCTO_01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay', 'Fórmula dermatológica de alta tolerancia de La Roche-Posay para el cuidado diario.', 'Sérum Niacinamida 10% + Zinc 1% desarrollado por La Roche-Posay. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, 'PRODUCTO_02', 'Gel Limpiador Espumoso Facial - CeraVe', 'Fórmula dermatológica de alta tolerancia de CeraVe para el cuidado diario.', 'Gel Limpiador Espumoso Facial desarrollado por CeraVe. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, 'PRODUCTO_03', 'Protector Solar Fluido SPF 50+ - The Ordinary', 'Fórmula dermatológica de alta tolerancia de The Ordinary para el cuidado diario.', 'Protector Solar Fluido SPF 50+ desarrollado por The Ordinary. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, 50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, 'PRODUCTO_04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN', 'Fórmula dermatológica de alta tolerancia de ISDIN para el cuidado diario.', 'Sérum Ácido Hialurónico 2% + B5 desarrollado por ISDIN. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, 'PRODUCTO_05', 'Crema Hidratante con Ceramidas - Bioderma', 'Fórmula dermatológica de alta tolerancia de Bioderma para el cuidado diario.', 'Crema Hidratante con Ceramidas desarrollado por Bioderma. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, 'PRODUCTO_06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène', 'Fórmula dermatológica de alta tolerancia de Eau Thermale Avène para el cuidado diario.', 'Retinol Puro 0.5% Nocturno desarrollado por Eau Thermale Avène. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, 'PRODUCTO_07', 'Agua Micelar Dermolimpiadora - Eucerin', 'Fórmula dermatológica de alta tolerancia de Eucerin para el cuidado diario.', 'Agua Micelar Dermolimpiadora desarrollado por Eucerin. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, 'PRODUCTO_08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires', 'Fórmula dermatológica de alta tolerancia de Vichy Laboratoires para el cuidado diario.', 'Sérum Vitamina C Pura 15% desarrollado por Vichy Laboratoires. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, 'PRODUCTO_09', 'Base de Maquillaje Cobertura Media - SkinCeuticals', 'Fórmula dermatológica de alta tolerancia de SkinCeuticals para el cuidado diario.', 'Base de Maquillaje Cobertura Media desarrollado por SkinCeuticals. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, 'PRODUCTO_10', 'Corrector Líquido Alta Duración - Sesderma', 'Fórmula dermatológica de alta tolerancia de Sesderma para el cuidado diario.', 'Corrector Líquido Alta Duración desarrollado por Sesderma. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, 'PRODUCTO_11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics', 'Fórmula dermatológica de alta tolerancia de NARS Cosmetics para el cuidado diario.', 'Bálsamo Reparador Cicaplast B5 desarrollado por NARS Cosmetics. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, 'PRODUCTO_12', 'Exfoliante Ácido Salicílico 2% - MAC Cosmetics', 'Fórmula dermatológica de alta tolerancia de MAC Cosmetics para el cuidado diario.', 'Exfoliante Ácido Salicílico 2% desarrollado por MAC Cosmetics. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, 'PRODUCTO_13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty', 'Fórmula dermatológica de alta tolerancia de Fenty Beauty para el cuidado diario.', 'Contorno de Ojos con Cafeína 5% desarrollado por Fenty Beauty. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, 'PRODUCTO_14', 'Mascarilla Nocturna Hidratante - Rare Beauty', 'Fórmula dermatológica de alta tolerancia de Rare Beauty para el cuidado diario.', 'Mascarilla Nocturna Hidratante desarrollado por Rare Beauty. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, 'PRODUCTO_15', 'Bruma Termal Calmante Mineral - Clinique', 'Fórmula dermatológica de alta tolerancia de Clinique para el cuidado diario.', 'Bruma Termal Calmante Mineral desarrollado por Clinique. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, 'PRODUCTO_16', 'Aceite Limpiador Emulsionable - Estée Lauder', 'Fórmula dermatológica de alta tolerancia de Estée Lauder para el cuidado diario.', 'Aceite Limpiador Emulsionable desarrollado por Estée Lauder. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, 'PRODUCTO_17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme', 'Fórmula dermatológica de alta tolerancia de Lancôme para el cuidado diario.', 'Tónico Equilibrante Ácido Glicólico 7% desarrollado por Lancôme. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, 'PRODUCTO_18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury', 'Fórmula dermatológica de alta tolerancia de Charlotte Tilbury para el cuidado diario.', 'Labial Hidratante Péptidos Nude desarrollado por Charlotte Tilbury. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, 'PRODUCTO_19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice', 'Fórmula dermatológica de alta tolerancia de Paula''s Choice para el cuidado diario.', 'Polvo Traslúcido Matificante Mineral desarrollado por Paula''s Choice. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, 'PRODUCTO_20', 'Rubor Líquido Pigmento Natural - COSRX', 'Fórmula dermatológica de alta tolerancia de COSRX para el cuidado diario.', 'Rubor Líquido Pigmento Natural desarrollado por COSRX. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, 'PRODUCTO_21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige', 'Fórmula dermatológica de alta tolerancia de Laneige para el cuidado diario.', 'Sérum Ácido Azelaico 10% Suspensión desarrollado por Laneige. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, 'PRODUCTO_22', 'Ampolletas Proteoglicanos Firmeza - Uriage', 'Fórmula dermatológica de alta tolerancia de Uriage para el cuidado diario.', 'Ampolletas Proteoglicanos Firmeza desarrollado por Uriage. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, 'PRODUCTO_23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR', 'Fórmula dermatológica de alta tolerancia de Laboratoire SVR para el cuidado diario.', 'Crema Despigmentante Noche Melasma desarrollado por Laboratoire SVR. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, 'PRODUCTO_24', 'Protector Solar Mineral Óxido Zinc - MartiDerm', 'Fórmula dermatológica de alta tolerancia de MartiDerm para el cuidado diario.', 'Protector Solar Mineral Óxido Zinc desarrollado por MartiDerm. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, 50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, 'PRODUCTO_25', 'Loción Corporal Urea 10% Reparadora - Heliocare', 'Fórmula dermatológica de alta tolerancia de Heliocare para el cuidado diario.', 'Loción Corporal Urea 10% Reparadora desarrollado por Heliocare. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, 'PRODUCTO_26', 'Primer Facial Minimizador de Poros - Kiehl''s', 'Fórmula dermatológica de alta tolerancia de Kiehl''s para el cuidado diario.', 'Primer Facial Minimizador de Poros desarrollado por Kiehl''s. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, 'PRODUCTO_27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive', 'Fórmula dermatológica de alta tolerancia de Garnier SkinActive para el cuidado diario.', 'Máscara de Pestañas Hipoalergénica desarrollado por Garnier SkinActive. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, 'PRODUCTO_28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm', 'Fórmula dermatológica de alta tolerancia de L''Oréal Paris Derm para el cuidado diario.', 'Sérum Péptidos de Cobre 1% desarrollado por L''Oréal Paris Derm. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, 'PRODUCTO_29', 'Bálsamo Desmaquillante Caléndula - Neutrogena', 'Fórmula dermatológica de alta tolerancia de Neutrogena para el cuidado diario.', 'Bálsamo Desmaquillante Caléndula desarrollado por Neutrogena. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', TRUE, NULL, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, 'PRODUCTO_30', 'Crema Barrera Post-Retinoide - DermaCare Labs', 'Fórmula dermatológica de alta tolerancia de DermaCare Labs para el cuidado diario.', 'Crema Barrera Post-Retinoide desarrollado por DermaCare Labs. Activos estabilizados de grado clínico, testado bajo control dermatológico para maximizar eficacia sin alterar la barrera cutánea.', 'Aplicar sobre piel limpia y seca de 2 a 3 gotas o cantidad uniforme mediante masaje suave hasta su completa absorción.', FALSE, NULL, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.productos_maestros', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.productos_maestros), 1), true);

-- =================================================================================================
-- 033. TABLA: catalogo.subtonos_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.subtonos_maquillaje (ID, codigo_subtono, nombre_subtono, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SUBTONO_01', 'Frío Rosado (Cool)', 'Subtono con matices rosados o azulados; favorece tonos porcelana y rosa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SUBTONO_02', 'Cálido Dorado (Warm)', 'Subtono con matices amarillos, miel o dorados; favorece bronce y durazno.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SUBTONO_03', 'Neutro Equilibrado', 'Balance armónico entre pigmentos cálidos y fríos sin predominancia marcada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SUBTONO_04', 'Oliva Verdoso (Olive)', 'Subtono cálido-neutro con trasfondo verdoso característico en pieles latinas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SUBTONO_05', 'Cálido Melocotón (Peach)', 'Subtono luminoso con matiz durazno ideal para neutralizar ojeras violáceas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'SUBTONO_06', 'Frío Neutro (Cool-Neutral)', 'Ligeramente rosado con base neutra adaptable a iluminación mixta.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'SUBTONO_07', 'Cálido Neutro (Warm-Neutral)', 'Base neutra con sutil calidez dorada sin oxidación naranja.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'SUBTONO_08', 'Ámbar Profundo (Deep Golden)', 'Subtono cálido rico en pigmentos dorados y cobrizos para pieles oscuras.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'SUBTONO_09', 'Ébano Frío (Deep Cool)', 'Subtono profundo con matices ciruela y azulados sin aspecto cenizo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'SUBTONO_10', 'Universal Traslúcido', 'Sin carga de pigmento corrector; adaptable a cualquier fototipo Fitzpatrick.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'SUBTONO_11', 'Frío Rosado (Cool) (2)', 'Subtono con matices rosados o azulados; favorece tonos porcelana y rosa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'SUBTONO_12', 'Cálido Dorado (Warm) (2)', 'Subtono con matices amarillos, miel o dorados; favorece bronce y durazno.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'SUBTONO_13', 'Neutro Equilibrado (2)', 'Balance armónico entre pigmentos cálidos y fríos sin predominancia marcada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'SUBTONO_14', 'Oliva Verdoso (Olive) (2)', 'Subtono cálido-neutro con trasfondo verdoso característico en pieles latinas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'SUBTONO_15', 'Cálido Melocotón (Peach) (2)', 'Subtono luminoso con matiz durazno ideal para neutralizar ojeras violáceas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'SUBTONO_16', 'Frío Neutro (Cool-Neutral) (2)', 'Ligeramente rosado con base neutra adaptable a iluminación mixta.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'SUBTONO_17', 'Cálido Neutro (Warm-Neutral) (2)', 'Base neutra con sutil calidez dorada sin oxidación naranja.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'SUBTONO_18', 'Ámbar Profundo (Deep Golden) (2)', 'Subtono cálido rico en pigmentos dorados y cobrizos para pieles oscuras.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'SUBTONO_19', 'Ébano Frío (Deep Cool) (2)', 'Subtono profundo con matices ciruela y azulados sin aspecto cenizo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'SUBTONO_20', 'Universal Traslúcido (2)', 'Sin carga de pigmento corrector; adaptable a cualquier fototipo Fitzpatrick.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'SUBTONO_21', 'Frío Rosado (Cool) (3)', 'Subtono con matices rosados o azulados; favorece tonos porcelana y rosa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'SUBTONO_22', 'Cálido Dorado (Warm) (3)', 'Subtono con matices amarillos, miel o dorados; favorece bronce y durazno.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'SUBTONO_23', 'Neutro Equilibrado (3)', 'Balance armónico entre pigmentos cálidos y fríos sin predominancia marcada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'SUBTONO_24', 'Oliva Verdoso (Olive) (3)', 'Subtono cálido-neutro con trasfondo verdoso característico en pieles latinas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'SUBTONO_25', 'Cálido Melocotón (Peach) (3)', 'Subtono luminoso con matiz durazno ideal para neutralizar ojeras violáceas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'SUBTONO_26', 'Frío Neutro (Cool-Neutral) (3)', 'Ligeramente rosado con base neutra adaptable a iluminación mixta.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'SUBTONO_27', 'Cálido Neutro (Warm-Neutral) (3)', 'Base neutra con sutil calidez dorada sin oxidación naranja.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'SUBTONO_28', 'Ámbar Profundo (Deep Golden) (3)', 'Subtono cálido rico en pigmentos dorados y cobrizos para pieles oscuras.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'SUBTONO_29', 'Ébano Frío (Deep Cool) (3)', 'Subtono profundo con matices ciruela y azulados sin aspecto cenizo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'SUBTONO_30', 'Universal Traslúcido (3)', 'Sin carga de pigmento corrector; adaptable a cualquier fototipo Fitzpatrick.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.subtonos_maquillaje', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.subtonos_maquillaje), 1), true);

-- =================================================================================================
-- 034. TABLA: catalogo.acabados_maquillaje (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.acabados_maquillaje (ID, codigo_acabado, nombre_acabado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ACABADO_01', 'Mate Aterciopelado', 'Controla brillo hasta 12 horas sin resecar ni marcar líneas de expresión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ACABADO_02', 'Natural Segunda Piel', 'Imita el acabado saludable fisiológico de una epidermis equilibrada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ACABADO_03', 'Luminoso Glow', 'Aporta reflexión de luz hidratada con micro-emolientes no comedogénicos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'ACABADO_04', 'Satinado Hidratante', 'Equilibrio entre suavidad sedosa y confort flexible durante todo el día.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ACABADO_05', 'Soft-Matte Difuminado', 'Efecto filtro óptico que minimiza la apariencia visual de poros dilatados.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'ACABADO_06', 'Mineral Polvo Suelto', 'Partículas micronizadas ultrafinas libres de talco para sellar sin peso.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'ACABADO_07', 'Gel-Crema Acuoso', 'Acabado fresco invisible de absorción inmediata sin residuo graso.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'ACABADO_08', 'Bálsamo Brillante', 'Película protectora jugosa que sella humedad en labios y zonas secas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'ACABADO_09', 'Invisible Tacto Seco', 'Especialmente formulado en fotoprotectores para cero residuo blanco.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'ACABADO_10', 'Cobertura Construible', 'Permite modular desde cobertura ligera hasta alta manteniendo transpirabilidad.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ACABADO_11', 'Mate Aterciopelado (2)', 'Controla brillo hasta 12 horas sin resecar ni marcar líneas de expresión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ACABADO_12', 'Natural Segunda Piel (2)', 'Imita el acabado saludable fisiológico de una epidermis equilibrada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'ACABADO_13', 'Luminoso Glow (2)', 'Aporta reflexión de luz hidratada con micro-emolientes no comedogénicos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'ACABADO_14', 'Satinado Hidratante (2)', 'Equilibrio entre suavidad sedosa y confort flexible durante todo el día.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ACABADO_15', 'Soft-Matte Difuminado (2)', 'Efecto filtro óptico que minimiza la apariencia visual de poros dilatados.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'ACABADO_16', 'Mineral Polvo Suelto (2)', 'Partículas micronizadas ultrafinas libres de talco para sellar sin peso.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'ACABADO_17', 'Gel-Crema Acuoso (2)', 'Acabado fresco invisible de absorción inmediata sin residuo graso.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ACABADO_18', 'Bálsamo Brillante (2)', 'Película protectora jugosa que sella humedad en labios y zonas secas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'ACABADO_19', 'Invisible Tacto Seco (2)', 'Especialmente formulado en fotoprotectores para cero residuo blanco.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'ACABADO_20', 'Cobertura Construible (2)', 'Permite modular desde cobertura ligera hasta alta manteniendo transpirabilidad.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ACABADO_21', 'Mate Aterciopelado (3)', 'Controla brillo hasta 12 horas sin resecar ni marcar líneas de expresión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'ACABADO_22', 'Natural Segunda Piel (3)', 'Imita el acabado saludable fisiológico de una epidermis equilibrada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'ACABADO_23', 'Luminoso Glow (3)', 'Aporta reflexión de luz hidratada con micro-emolientes no comedogénicos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'ACABADO_24', 'Satinado Hidratante (3)', 'Equilibrio entre suavidad sedosa y confort flexible durante todo el día.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'ACABADO_25', 'Soft-Matte Difuminado (3)', 'Efecto filtro óptico que minimiza la apariencia visual de poros dilatados.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'ACABADO_26', 'Mineral Polvo Suelto (3)', 'Partículas micronizadas ultrafinas libres de talco para sellar sin peso.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ACABADO_27', 'Gel-Crema Acuoso (3)', 'Acabado fresco invisible de absorción inmediata sin residuo graso.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'ACABADO_28', 'Bálsamo Brillante (3)', 'Película protectora jugosa que sella humedad en labios y zonas secas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'ACABADO_29', 'Invisible Tacto Seco (3)', 'Especialmente formulado en fotoprotectores para cero residuo blanco.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'ACABADO_30', 'Cobertura Construible (3)', 'Permite modular desde cobertura ligera hasta alta manteniendo transpirabilidad.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.acabados_maquillaje', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.acabados_maquillaje), 1), true);

-- =================================================================================================
-- 035. TABLA: catalogo.variantes_sku (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.variantes_sku (ID, ID_producto, sku_codigo, codigo_barras_ean13, nombre_presentacion, contenido_neto_gramos_ml, unidad_medida, precio_base_menudeo, costo_estandar_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'DERMA-SKU-1001', '7501000000019', 'Frasco Gotero / Dosificador 30 ml - La Roche-Posay', 30.00, 'ML', 285.50, 148.46, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'DERMA-SKU-1002', '7501000000029', 'Tubo Dermocosmético 50 g - CeraVe', 50.00, 'G', 321.00, 166.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'DERMA-SKU-1003', '7501000000039', 'Envase Airless 1.7 oz - The Ordinary', 1.70, 'OZ', 356.50, 185.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DERMA-SKU-1004', '7501000000049', 'Presentación Unitaria Sellada - ISDIN', 1.00, 'PZ', 392.00, 203.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'DERMA-SKU-1005', '7501000000059', 'Frasco Gotero / Dosificador 30 ml - Bioderma', 30.00, 'ML', 427.50, 222.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'DERMA-SKU-1006', '7501000000069', 'Tubo Dermocosmético 50 g - Eau Thermale Avène', 50.00, 'G', 463.00, 240.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'DERMA-SKU-1007', '7501000000079', 'Envase Airless 1.7 oz - Eucerin', 1.70, 'OZ', 498.50, 259.22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DERMA-SKU-1008', '7501000000089', 'Presentación Unitaria Sellada - Vichy Laboratoires', 1.00, 'PZ', 534.00, 277.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'DERMA-SKU-1009', '7501000000099', 'Frasco Gotero / Dosificador 30 ml - SkinCeuticals', 30.00, 'ML', 569.50, 296.14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'DERMA-SKU-1010', '7501000000109', 'Tubo Dermocosmético 50 g - Sesderma', 50.00, 'G', 605.00, 314.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'DERMA-SKU-1011', '7501000000119', 'Envase Airless 1.7 oz - NARS Cosmetics', 1.70, 'OZ', 640.50, 333.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DERMA-SKU-1012', '7501000000129', 'Presentación Unitaria Sellada - MAC Cosmetics', 1.00, 'PZ', 676.00, 351.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'DERMA-SKU-1013', '7501000000139', 'Frasco Gotero / Dosificador 30 ml - Fenty Beauty', 30.00, 'ML', 711.50, 369.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'DERMA-SKU-1014', '7501000000149', 'Tubo Dermocosmético 50 g - Rare Beauty', 50.00, 'G', 747.00, 388.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'DERMA-SKU-1015', '7501000000159', 'Envase Airless 1.7 oz - Clinique', 1.70, 'OZ', 782.50, 406.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DERMA-SKU-1016', '7501000000169', 'Presentación Unitaria Sellada - Estée Lauder', 1.00, 'PZ', 818.00, 425.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'DERMA-SKU-1017', '7501000000179', 'Frasco Gotero / Dosificador 30 ml - Lancôme', 30.00, 'ML', 853.50, 443.82, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'DERMA-SKU-1018', '7501000000189', 'Tubo Dermocosmético 50 g - Charlotte Tilbury', 50.00, 'G', 889.00, 462.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'DERMA-SKU-1019', '7501000000199', 'Envase Airless 1.7 oz - Paula''s Choice', 1.70, 'OZ', 924.50, 480.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DERMA-SKU-1020', '7501000000209', 'Presentación Unitaria Sellada - COSRX', 1.00, 'PZ', 960.00, 499.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'DERMA-SKU-1021', '7501000000219', 'Frasco Gotero / Dosificador 30 ml - Laneige', 30.00, 'ML', 995.50, 517.66, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'DERMA-SKU-1022', '7501000000229', 'Tubo Dermocosmético 50 g - Uriage', 50.00, 'G', 1031.00, 536.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'DERMA-SKU-1023', '7501000000239', 'Envase Airless 1.7 oz - Laboratoire SVR', 1.70, 'OZ', 1066.50, 554.58, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DERMA-SKU-1024', '7501000000249', 'Presentación Unitaria Sellada - MartiDerm', 1.00, 'PZ', 1102.00, 573.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DERMA-SKU-1025', '7501000000259', 'Frasco Gotero / Dosificador 30 ml - Heliocare', 30.00, 'ML', 1137.50, 591.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'DERMA-SKU-1026', '7501000000269', 'Tubo Dermocosmético 50 g - Kiehl''s', 50.00, 'G', 1173.00, 609.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'DERMA-SKU-1027', '7501000000279', 'Envase Airless 1.7 oz - Garnier SkinActive', 1.70, 'OZ', 1208.50, 628.42, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DERMA-SKU-1028', '7501000000289', 'Presentación Unitaria Sellada - L''Oréal Paris Derm', 1.00, 'PZ', 1244.00, 646.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'DERMA-SKU-1029', '7501000000299', 'Frasco Gotero / Dosificador 30 ml - Neutrogena', 30.00, 'ML', 1279.50, 665.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'DERMA-SKU-1030', '7501000000309', 'Tubo Dermocosmético 50 g - DermaCare Labs', 50.00, 'G', 1315.00, 683.80, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.variantes_sku', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.variantes_sku), 1), true);

-- =================================================================================================
-- 036. TABLA: catalogo.tonos_variante (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.tonos_variante (ID, ID_variante_sku, ID_subtono, ID_acabado, codigo_tono_color, nombre_tono, color_hexadecimal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 'TONO_COL_01', '010 Porcelana Fría', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'TONO_COL_02', '015 Marfil Neutro', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'TONO_COL_03', '020 Vainilla Cálida', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 'TONO_COL_04', '025 Arena Dorada', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 'TONO_COL_05', '030 Beige Natural', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 'TONO_COL_06', '035 Miel Suave', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 'TONO_COL_07', '040 Trigo Oliva', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 'TONO_COL_08', '045 Caramelo Neutro', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 'TONO_COL_09', '050 Canela Cálida', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 'TONO_COL_10', '055 Avellana Dorada', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 'TONO_COL_11', '060 Ámbar Profundo', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 'TONO_COL_12', '065 Cacao Frío', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 'TONO_COL_13', '110 Alabastro', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 'TONO_COL_14', '120 Lino Claro', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 'TONO_COL_15', '130 Durazno Luminoso', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 'TONO_COL_16', '140 Almendra', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 'TONO_COL_17', '150 Duna', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 'TONO_COL_18', '160 Terracota Suave', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 'TONO_COL_19', '170 Bronce Medio', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 'TONO_COL_20', '180 Expresso', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 'TONO_COL_21', '210 Rosa Pétalo', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 'TONO_COL_22', '220 Nude Malva', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 'TONO_COL_23', '230 Coral Terracota', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 'TONO_COL_24', '240 Frambuesa', '#7D412E', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 'TONO_COL_25', '000 Traslúcido Universal', '#F5D0C5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 'TONO_COL_26', '005 Iluminador Champán', '#E8B4A0', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 'TONO_COL_27', '012 Salmón Corrector', '#D4967D', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 'TONO_COL_28', '018 Verde Neutralizador', '#C27A61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 'TONO_COL_29', '022 Lavanda Iluminador', '#9E5B44', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 'TONO_COL_30', '090 Tinted Bronze FPS50', '#7D412E', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.tonos_variante', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.tonos_variante), 1), true);

-- =================================================================================================
-- 037. TABLA: catalogo.ingredientes_inci (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.ingredientes_inci (ID, codigo_cas, nombre_inci, nombre_comun, funcion_principal, es_comedogenico, indice_comedogenico, es_alergeno_frecuente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CAS_01', 'Niacinamide', 'Vitamina B3', 'Seborregulador, despigmentante y fortalecedor de ceramidas', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CAS_02', 'Sodium Hyaluronate', 'Sal de Ácido Hialurónico', 'Humectante captador de agua de alta penetración', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAS_03', 'Retinol', 'Vitamina A Pura', 'Renovador celular, estimulante de colágeno y antiarrugas', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAS_04', 'Salicylic Acid', 'Ácido Salicílico (BHA)', 'Exfoliante lipofílico desobstructor de poros', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CAS_05', 'Ascorbic Acid', 'Vitamina C Pura', 'Antioxidante potente, iluminador y cofactor de colágeno', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CAS_06', 'Ceramide NP', 'Ceramida Bioidéntica NP', 'Lípido estructural reparador de la barrera epidérmica', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CAS_07', 'Panthenol', 'Provitamina B5', 'Calmante, regenerador epitelial y humectante', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CAS_08', 'Azelaic Acid', 'Ácido Azelaico', 'Antiinflamatorio para rosácea, acné y manchas', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAS_09', 'Glycolic Acid', 'Ácido Glicólico (AHA)', 'Exfoliante químico superficial que mejora textura', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CAS_10', 'Zinc Oxide', 'Óxido de Zinc Micronizado', 'Filtro solar mineral de amplio espectro y calmante', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CAS_11', 'Titanium Dioxide', 'Dióxido de Titanio', 'Filtro físico protector frente a radiación UVB/UVA', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CAS_12', 'Tocopherol', 'Vitamina E', 'Antioxidante liposoluble estabilizador de membranas', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CAS_13', 'Madecassoside', 'Extracto Purificado de Centella', 'Reparador dérmico y calmante post-inflamatorio', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CAS_14', 'Squalane', 'Escualano Vegetal', 'Emoliente biomimético ligero no comedogénico', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CAS_15', 'Allantoin', 'Alantoína', 'Queratolítico suave, calmante y cicatrizante', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CAS_16', 'Caffeine', 'Cafeína Anhidra', 'Vasoconstrictor y drenante para contorno ocular', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CAS_17', 'Urea', 'Urea Dermatológica', 'Humectante natural NMF y queratolítico suave', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CAS_18', 'Ferulic Acid', 'Ácido Ferúlico', 'Antioxidante sinérgico estabilizador de Vitamina C y E', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CAS_19', 'Lactic Acid', 'Ácido Láctico (AHA)', 'Exfoliante hidratante suave para pieles sensibles', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CAS_20', 'Bisabolol', 'Alfa-Bisabolol', 'Activo calmante derivado de manzanilla anti-eritema', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CAS_21', 'Bakuchiol', 'Bakuchiol Botánico', 'Alternativa fitoquímica al retinol apta para piel sensible', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CAS_22', 'Tranexamic Acid', 'Ácido Tranexámico', 'Inhibidor de plasmina para melasma persistente', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CAS_23', 'Copper Tripeptide-1', 'Tripéptido de Cobre', 'Péptido señalizador reparador y reafirmante', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CAS_24', 'Glycerin', 'Glicerina Vegetal USP', 'Humectante clásico retenedor de hidratación', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CAS_25', 'Dimethicone', 'Dimeticona Grado Médico', 'Protector oclusivo transpirable suavizante', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CAS_26', 'Shea Butter', 'Manteca de Karité Refinada', 'Emoliente rico en ácidos grasos nutritivos', FALSE, 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CAS_27', 'Thermal Spring Water', 'Agua Termal Mineralizante', 'Calma irritación y refuerza defensas antioxidantes', TRUE, 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CAS_28', 'Zinc PCA', 'Sal de Zinc PCA', 'Controla secreción sebácea y proliferación microbiana', FALSE, 0, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CAS_29', 'Kojic Acid', 'Ácido Kójico', 'Quelante de cobre inhibidor de melanogénesis', TRUE, 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CAS_30', 'Peptide Matrixyl 3000', 'Palmitoil Tripéptido-1/7', 'Complejo peptídico estimulante de matriz extracelular', FALSE, 2, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.ingredientes_inci', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.ingredientes_inci), 1), true);

-- =================================================================================================
-- 038. TABLA: catalogo.alergenos_ingrediente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.alergenos_ingrediente (ID, ID_ingrediente, nombre_alergeno, clasificacion_riesgo, advertencia_etiqueta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Linalool', 'BAJO', 'Contiene Linalool natural; realizar prueba de parche en piel reactiva.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Limonene', 'MEDIO', 'Contiene Limonene oxidable; mantener cerrado y alejado de luz directa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Retinoides Concentrados', 'ALTO', 'No usar durante embarazo; suspender si hay descamación intensa.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Ácido Salicílico 2%', 'MEDIO', 'Contraindicado en alergia a salicilatos o aspirina.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Ácido Ascórbico Ácido pH<3.5', 'MEDIO', 'Puede causar hormigueo transitorio en barrera comprometida.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Ceramidas Vegetales', 'BAJO', 'Libre de fragancia; apto para piel atópica bajo tolerancia.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Alcohol Desnaturalizado Trazas', 'MEDIO', 'Evitar en eccema agudo o heridas abiertas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Ácido Azelaico 10%', 'BAJO', 'Sensación leve de picor los primeros minutos de adaptación.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Alfa-Hidroxiácidos (AHA)', 'ALTO', 'Incrementa fotosensibilidad; obligatorio usar FPS 50+ diario.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Filtros Minerales Nano', 'BAJO', 'Uso tópico exclusivo; evitar inhalación en presentaciones en bruma.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Dióxido de Titanio Recubierto', 'BAJO', 'Limpiar completamente por la noche con doble limpieza.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Tocoferol Sintético', 'BAJO', 'Baja incidencia alergénica; conservar en lugar fresco.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Extractos Botánicos Centella', 'BAJO', 'Suspender inmediatamente ante erupción urticarial.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Escualano de Oliva', 'BAJO', 'Seguro en dermatitis seborreica; no comedogénico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Alantoína USP', 'BAJO', 'Apto para uso frecuente; uso externo exclusivo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Cafeína Tópica', 'MEDIO', 'Evitar entrada directa al saco conjuntival del ojo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Urea Alta Concentración', 'MEDIO', 'Puede causar escozor sobre piel fisurada o recién rasurada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Ácido Ferúlico Botánico', 'MEDIO', 'Posible sensibilización en personas alérgicas a gramíneas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Ácido Láctico 5-10%', 'MEDIO', 'No combinar simultáneamente con otros ácidos exfoliantes.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Sesquiterpenos Manzanilla', 'MEDIO', 'Precaución en pacientes alérgicos a familia Asteraceae.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Psoralea Corylifolia', 'BAJO', 'Alternativa suave al retinol; probar primero en antebrazo.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ácido Tranexámico Tópico', 'BAJO', 'Uso exclusivo cutáneo; evitar mucosas.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Complejos de Cobre', 'MEDIO', 'No mezclar en la misma aplicación con vitamina C ácida.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Polioles Humectantes', 'BAJO', 'Hipoalergénico; sin advertencias restrictivas mayores.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Siliconas Volátiles', 'BAJO', 'Uso externo; retirar correctamente antes de dormir.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Látex / Nueces Karité Trazas', 'MEDIO', 'Aunque refinada, verificar tolerancia en alergia severa a nueces.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Sales Minerales Hipertónicas', 'BAJO', 'Secar exceso suavemente tras 2 minutos en piel muy seca.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sales de Zinc', 'BAJO', 'Evitar contacto directo con ojos.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Ácido Kójico 1-2%', 'ALTO', 'Potencial sensibilizante tras uso prolongado; usar bajo supervisión.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Péptidos Biomiméticos', 'BAJO', 'Compatible con piel sensible; suspender si hay enrojecimiento.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.alergenos_ingrediente', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.alergenos_ingrediente), 1), true);

-- =================================================================================================
-- 039. TABLA: catalogo.formula_ingredientes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.formula_ingredientes (ID, ID_producto, ID_ingrediente, orden_en_etiqueta, porcentaje_concentracion, es_principio_activo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 10.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 0.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 2.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 15.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 1.50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 5.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 10.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 7.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 12.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 10.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 2.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 0.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 2.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 1.50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 5.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 10.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 7.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 12.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 10.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 2.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 0.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 2.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 15.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 1.50, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 5.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 10.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 7.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 12.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.formula_ingredientes', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.formula_ingredientes), 1), true);

-- =================================================================================================
-- 040. TABLA: catalogo.registros_sanitarios_cofepris (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.registros_sanitarios_cofepris (ID, ID_producto, numero_registro_sanitario, folio_ingreso_tramite, fecha_emision, fecha_vencimiento, estatus_regulatorio, documento_oficial_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'COF-2026-MX-10001-SAN', 'FOL-INGRE-2026-0001', '2024-01-01', '2029-01-01', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'COF-2026-MX-10002-SAN', 'FOL-INGRE-2026-0002', '2024-02-02', '2029-02-02', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'COF-2026-MX-10003-SAN', 'FOL-INGRE-2026-0003', '2024-03-03', '2029-03-03', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'COF-2026-MX-10004-SAN', 'FOL-INGRE-2026-0004', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'COF-2026-MX-10005-SAN', 'FOL-INGRE-2026-0005', '2024-05-05', '2029-05-05', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'COF-2026-MX-10006-SAN', 'FOL-INGRE-2026-0006', '2024-06-06', '2029-06-06', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'COF-2026-MX-10007-SAN', 'FOL-INGRE-2026-0007', '2024-07-07', '2029-07-07', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'COF-2026-MX-10008-SAN', 'FOL-INGRE-2026-0008', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'COF-2026-MX-10009-SAN', 'FOL-INGRE-2026-0009', '2024-09-09', '2029-09-09', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'COF-2026-MX-10010-SAN', 'FOL-INGRE-2026-0010', '2024-10-10', '2029-10-10', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'COF-2026-MX-10011-SAN', 'FOL-INGRE-2026-0011', '2024-11-11', '2029-11-11', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'COF-2026-MX-10012-SAN', 'FOL-INGRE-2026-0012', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'COF-2026-MX-10013-SAN', 'FOL-INGRE-2026-0013', '2024-01-13', '2029-01-13', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'COF-2026-MX-10014-SAN', 'FOL-INGRE-2026-0014', '2024-02-14', '2029-02-14', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'COF-2026-MX-10015-SAN', 'FOL-INGRE-2026-0015', '2024-03-15', '2029-03-15', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'COF-2026-MX-10016-SAN', 'FOL-INGRE-2026-0016', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'COF-2026-MX-10017-SAN', 'FOL-INGRE-2026-0017', '2024-05-17', '2029-05-17', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'COF-2026-MX-10018-SAN', 'FOL-INGRE-2026-0018', '2024-06-18', '2029-06-18', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'COF-2026-MX-10019-SAN', 'FOL-INGRE-2026-0019', '2024-07-19', '2029-07-19', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'COF-2026-MX-10020-SAN', 'FOL-INGRE-2026-0020', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'COF-2026-MX-10021-SAN', 'FOL-INGRE-2026-0021', '2024-09-21', '2029-09-21', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'COF-2026-MX-10022-SAN', 'FOL-INGRE-2026-0022', '2024-10-22', '2029-10-22', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'COF-2026-MX-10023-SAN', 'FOL-INGRE-2026-0023', '2024-11-23', '2029-11-23', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'COF-2026-MX-10024-SAN', 'FOL-INGRE-2026-0024', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'COF-2026-MX-10025-SAN', 'FOL-INGRE-2026-0025', '2024-01-25', '2029-01-25', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'COF-2026-MX-10026-SAN', 'FOL-INGRE-2026-0026', '2024-02-01', '2029-02-01', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'COF-2026-MX-10027-SAN', 'FOL-INGRE-2026-0027', '2024-03-02', '2029-03-02', 'SUSPENDIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'COF-2026-MX-10028-SAN', 'FOL-INGRE-2026-0028', '2020-03-15', '2025-03-15', 'VENCIDO', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'COF-2026-MX-10029-SAN', 'FOL-INGRE-2026-0029', '2024-05-04', '2029-05-04', 'VIGENTE', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'COF-2026-MX-10030-SAN', 'FOL-INGRE-2026-0030', '2024-06-05', '2029-06-05', 'EN_RENOVACION', 'https://cdn.dermacare.mx/cofepris/registros/COF-2026-MX-10030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.registros_sanitarios_cofepris', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.registros_sanitarios_cofepris), 1), true);

-- =================================================================================================
-- 041. TABLA: catalogo.advertencias_contraindicaciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.advertencias_contraindicaciones (ID, ID_producto, tipo_advertencia, texto_advertencia, medida_en_caso_ingestion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Niacinamide.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Sodium Hyaluronate.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Retinol.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Salicylic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ascorbic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ceramide NP.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Panthenol.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Azelaic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycolic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc Oxide.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Titanium Dioxide.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tocopherol.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Madecassoside.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Squalane.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Allantoin.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Caffeine.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Urea.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Ferulic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Lactic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bisabolol.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Bakuchiol.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Tranexamic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Copper Tripeptide-1.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Glycerin.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Dimethicone.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'EMBARAZO_LACTANCIA', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Shea Butter.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOTOSENSIBLE', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Thermal Spring Water.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'USO_EXTERNO_EXCLUSIVO', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Zinc PCA.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'HERIDAS_ABIERTAS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Kojic Acid.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'EVITAR_OJOS', 'Evitar contacto directo con mucosas; usar protector solar SPF 50+ durante el uso de Peptide Matrixyl 3000.', 'No inducir el vómito; enjuagar la cavidad oral con agua abundante y acudir al centro médico con el envase.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.advertencias_contraindicaciones', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.advertencias_contraindicaciones), 1), true);

-- =================================================================================================
-- 042. TABLA: catalogo.multimedia_variantes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.multimedia_variantes (ID, ID_variante_sku, tipo_archivo, url_recurso, texto_alternativo_accesibilidad, numero_orden, es_imagen_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_001.webp', 'Fotografía clínica de Sérum Niacinamida 10% + Zinc 1% marca La Roche-Posay', 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_002.webp', 'Fotografía clínica de Gel Limpiador Espumoso Facial marca CeraVe Dermatological', 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_003.webp', 'Fotografía clínica de Protector Solar Fluido SPF 50+ marca The Ordinary Deciem', 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_004.mp4', 'Fotografía clínica de Sérum Ácido Hialurónico 2% + B5 marca ISDIN Fotoprotección', 4, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_005.webp', 'Fotografía clínica de Crema Hidratante con Ceramidas marca Bioderma Laboratoire', 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_006.webp', 'Fotografía clínica de Retinol Puro 0.5% Nocturno marca Eau Thermale Avène', 6, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_007.webp', 'Fotografía clínica de Agua Micelar Dermolimpiadora marca Eucerin Beiersdorf', 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_008.mp4', 'Fotografía clínica de Sérum Vitamina C Pura 15% marca Vichy Laboratoires', 8, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_009.webp', 'Fotografía clínica de Base de Maquillaje Cobertura Media marca SkinCeuticals Clinical', 9, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_010.webp', 'Fotografía clínica de Corrector Líquido Alta Duración marca Sesderma Nanotech', 10, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_011.webp', 'Fotografía clínica de Bálsamo Reparador Cicaplast B5 marca NARS Cosmetics', 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_012.mp4', 'Fotografía clínica de Exfoliante Ácido Salicílico 2% marca MAC Professional', 12, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_013.webp', 'Fotografía clínica de Contorno de Ojos con Cafeína 5% marca Fenty Beauty', 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_014.webp', 'Fotografía clínica de Mascarilla Nocturna Hidratante marca Rare Beauty', 14, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_015.webp', 'Fotografía clínica de Bruma Termal Calmante Mineral marca Clinique Laboratories', 15, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_016.mp4', 'Fotografía clínica de Aceite Limpiador Emulsionable marca Estée Lauder', 16, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_017.webp', 'Fotografía clínica de Tónico Equilibrante Ácido Glicólico 7% marca Lancôme Paris', 17, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_018.webp', 'Fotografía clínica de Labial Hidratante Péptidos Nude marca Charlotte Tilbury', 18, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_019.webp', 'Fotografía clínica de Polvo Traslúcido Matificante Mineral marca Paula''s Choice Skincare', 19, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_020.mp4', 'Fotografía clínica de Rubor Líquido Pigmento Natural marca COSRX K-Beauty', 20, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_021.webp', 'Fotografía clínica de Sérum Ácido Azelaico 10% Suspensión marca Laneige Amorepacific', 21, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_022.webp', 'Fotografía clínica de Ampolletas Proteoglicanos Firmeza marca Uriage Eau Thermale', 22, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_023.webp', 'Fotografía clínica de Crema Despigmentante Noche Melasma marca Laboratoire SVR', 23, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_024.mp4', 'Fotografía clínica de Protector Solar Mineral Óxido Zinc marca MartiDerm Ampollas', 24, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_025.webp', 'Fotografía clínica de Loción Corporal Urea 10% Reparadora marca Heliocare Cantabria Labs', 25, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_026.webp', 'Fotografía clínica de Primer Facial Minimizador de Poros marca Kiehl''s Since 1851', 26, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOTO_EMPAQUE', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_027.webp', 'Fotografía clínica de Máscara de Pestañas Hipoalergénica marca Garnier SkinActive', 27, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'VIDEO_TUTORIAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_028.mp4', 'Fotografía clínica de Sérum Péptidos de Cobre 1% marca L''Oréal Paris Derm', 28, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOTO_FRONTAL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_029.webp', 'Fotografía clínica de Bálsamo Desmaquillante Caléndula marca Neutrogena Derm', 29, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOTO_SWATCH_PIEL', 'https://cdn.dermacare.mx/recursos/catalogo_multimedia/sku_030.webp', 'Fotografía clínica de Crema Barrera Post-Retinoide marca DermaCare Labs México', 30, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.multimedia_variantes', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.multimedia_variantes), 1), true);

-- =================================================================================================
-- 043. TABLA: catalogo.kits_sets (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.kits_sets (ID, codigo_kit, nombre_kit, descripcion, descuento_porcentual_kit, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'KIT_01', 'Kit Rutina La Roche-Posay #1', 'Set dermatológico curado con rutina completa La Roche-Posay para sinergia clínica.', 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'KIT_02', 'Kit Rutina CeraVe Dermatological #2', 'Set dermatológico curado con rutina completa CeraVe para sinergia clínica.', 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'KIT_03', 'Kit Rutina The Ordinary Deciem #3', 'Set dermatológico curado con rutina completa The Ordinary para sinergia clínica.', 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'KIT_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Set dermatológico curado con rutina completa ISDIN para sinergia clínica.', 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'KIT_05', 'Kit Rutina Bioderma Laboratoire #5', 'Set dermatológico curado con rutina completa Bioderma para sinergia clínica.', 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'KIT_06', 'Kit Rutina Eau Thermale Avène #6', 'Set dermatológico curado con rutina completa Eau Thermale Avène para sinergia clínica.', 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'KIT_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Set dermatológico curado con rutina completa Eucerin para sinergia clínica.', 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'KIT_08', 'Kit Rutina Vichy Laboratoires #8', 'Set dermatológico curado con rutina completa Vichy Laboratoires para sinergia clínica.', 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'KIT_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Set dermatológico curado con rutina completa SkinCeuticals para sinergia clínica.', 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'KIT_10', 'Kit Rutina Sesderma Nanotech #10', 'Set dermatológico curado con rutina completa Sesderma para sinergia clínica.', 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'KIT_11', 'Kit Rutina NARS Cosmetics #11', 'Set dermatológico curado con rutina completa NARS Cosmetics para sinergia clínica.', 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'KIT_12', 'Kit Rutina MAC Professional #12', 'Set dermatológico curado con rutina completa MAC Cosmetics para sinergia clínica.', 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'KIT_13', 'Kit Rutina Fenty Beauty #13', 'Set dermatológico curado con rutina completa Fenty Beauty para sinergia clínica.', 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'KIT_14', 'Kit Rutina Rare Beauty #14', 'Set dermatológico curado con rutina completa Rare Beauty para sinergia clínica.', 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'KIT_15', 'Kit Rutina Clinique Laboratories #15', 'Set dermatológico curado con rutina completa Clinique para sinergia clínica.', 5.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'KIT_16', 'Kit Rutina Estée Lauder #16', 'Set dermatológico curado con rutina completa Estée Lauder para sinergia clínica.', 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'KIT_17', 'Kit Rutina Lancôme Paris #17', 'Set dermatológico curado con rutina completa Lancôme para sinergia clínica.', 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'KIT_18', 'Kit Rutina Charlotte Tilbury #18', 'Set dermatológico curado con rutina completa Charlotte Tilbury para sinergia clínica.', 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'KIT_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Set dermatológico curado con rutina completa Paula''s Choice para sinergia clínica.', 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'KIT_20', 'Kit Rutina COSRX K-Beauty #20', 'Set dermatológico curado con rutina completa COSRX para sinergia clínica.', 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'KIT_21', 'Kit Rutina Laneige Amorepacific #21', 'Set dermatológico curado con rutina completa Laneige para sinergia clínica.', 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'KIT_22', 'Kit Rutina Uriage Eau Thermale #22', 'Set dermatológico curado con rutina completa Uriage para sinergia clínica.', 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'KIT_23', 'Kit Rutina Laboratoire SVR #23', 'Set dermatológico curado con rutina completa Laboratoire SVR para sinergia clínica.', 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'KIT_24', 'Kit Rutina MartiDerm Ampollas #24', 'Set dermatológico curado con rutina completa MartiDerm para sinergia clínica.', 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'KIT_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Set dermatológico curado con rutina completa Heliocare para sinergia clínica.', 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'KIT_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Set dermatológico curado con rutina completa Kiehl''s para sinergia clínica.', 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'KIT_27', 'Kit Rutina Garnier SkinActive #27', 'Set dermatológico curado con rutina completa Garnier SkinActive para sinergia clínica.', 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'KIT_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Set dermatológico curado con rutina completa L''Oréal Paris Derm para sinergia clínica.', 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'KIT_29', 'Kit Rutina Neutrogena Derm #29', 'Set dermatológico curado con rutina completa Neutrogena para sinergia clínica.', 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'KIT_30', 'Kit Rutina DermaCare Labs México #30', 'Set dermatológico curado con rutina completa DermaCare Labs para sinergia clínica.', 5.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.kits_sets', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.kits_sets), 1), true);

-- =================================================================================================
-- 044. TABLA: catalogo.kits_items (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.kits_items (ID, ID_kit, ID_variante_sku, cantidad_unidades, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('catalogo.kits_items', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.kits_items), 1), true);

-- =================================================================================================
-- 045. TABLA: catalogo.productos_relacionados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.productos_relacionados (ID, ID_producto_origen, ID_producto_destino, tipo_relacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('catalogo.productos_relacionados', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.productos_relacionados), 1), true);

-- =================================================================================================
-- 046. TABLA: catalogo.historial_precios_base (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO catalogo.historial_precios_base (ID, ID_variante_sku, precio_anterior, precio_nuevo, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 262.66, 285.50, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 295.32, 321.00, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 327.98, 356.50, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 360.64, 392.00, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 393.30, 427.50, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 425.96, 463.00, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 458.62, 498.50, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 491.28, 534.00, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 523.94, 569.50, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 556.60, 605.00, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 589.26, 640.50, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 621.92, 676.00, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 654.58, 711.50, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 687.24, 747.00, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 719.90, 782.50, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 752.56, 818.00, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 785.22, 853.50, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 817.88, 889.00, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 850.54, 924.50, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 883.20, 960.00, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 915.86, 995.50, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 948.52, 1031.00, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 981.18, 1066.50, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1013.84, 1102.00, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1046.50, 1137.50, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1079.16, 1173.00, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1111.82, 1208.50, 'Fin de campaña promocional de lanzamiento', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1144.48, 1244.00, 'Actualización de lista de precios de laboratorio fabricante 2026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1177.14, 1279.50, 'Ajuste cambiario en insumos dermatológicos importados', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1209.80, 1315.00, 'Fin de campaña promocional de lanzamiento', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('catalogo.historial_precios_base', 'id'), COALESCE((SELECT MAX(id) FROM catalogo.historial_precios_base), 1), true);

-- =================================================================================================
-- 047. TABLA: comunidad.rutinas_belleza (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.rutinas_belleza (ID, ID_cliente, nombre_rutina, momento_dia, es_publica, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('comunidad.rutinas_belleza', 'id'), COALESCE((SELECT MAX(id) FROM comunidad.rutinas_belleza), 1), true);

-- =================================================================================================
-- 048. TABLA: comunidad.rutinas_pasos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.rutinas_pasos (ID, ID_rutina, numero_paso, nombre_fase, instrucciones_aplicacion, tiempo_espera_segundos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Paso 1: Limpieza Suave', 'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Paso 2: Tónico Equilibrante', 'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Paso 3: Sérum Concentrado', 'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Paso 4: Emulsión Reparadora', 'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Paso 5: Fotoprotección Solar', 'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Paso 1: Limpieza Suave', 'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Paso 2: Tónico Equilibrante', 'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Paso 3: Sérum Concentrado', 'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Paso 4: Emulsión Reparadora', 'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Paso 5: Fotoprotección Solar', 'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Paso 1: Limpieza Suave', 'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 'Paso 2: Tónico Equilibrante', 'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 'Paso 3: Sérum Concentrado', 'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 'Paso 4: Emulsión Reparadora', 'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 'Paso 5: Fotoprotección Solar', 'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 6, 'Paso 1: Limpieza Suave', 'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 7, 'Paso 2: Tónico Equilibrante', 'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 8, 'Paso 3: Sérum Concentrado', 'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 9, 'Paso 4: Emulsión Reparadora', 'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 10, 'Paso 5: Fotoprotección Solar', 'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 'Paso 1: Limpieza Suave', 'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 'Paso 2: Tónico Equilibrante', 'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 'Paso 3: Sérum Concentrado', 'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 'Paso 4: Emulsión Reparadora', 'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 'Paso 5: Fotoprotección Solar', 'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 6, 'Paso 1: Limpieza Suave', 'Humedecer el rostro y masajear suavemente por 45 segundos antes de enjuagar con agua tibia.', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 7, 'Paso 2: Tónico Equilibrante', 'Aplicar con las palmas limpias dando toques suaves sin frotar con algodón.', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 8, 'Paso 3: Sérum Concentrado', 'Distribuir 3 gotas sobre piel ligeramente húmeda evitando contorno ocular directo.', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 9, 'Paso 4: Emulsión Reparadora', 'Sellar la hidratación con cantidad equivalente a un chícharo en rostro y cuello.', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 10, 'Paso 5: Fotoprotección Solar', 'Aplicar la regla de los dos dedos 15 minutos antes de la exposición solar.', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('comunidad.rutinas_pasos', 'id'), COALESCE((SELECT MAX(id) FROM comunidad.rutinas_pasos), 1), true);

-- =================================================================================================
-- 049. TABLA: comunidad.rutinas_productos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.rutinas_productos (ID, ID_rutina_paso, ID_variante_sku, es_producto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('comunidad.rutinas_productos', 'id'), COALESCE((SELECT MAX(id) FROM comunidad.rutinas_productos), 1), true);

-- =================================================================================================
-- 050. TABLA: comunidad.listas_deseos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO comunidad.listas_deseos (ID, ID_cliente, nombre_lista, es_publica, token_compartir, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Favoritos Skincare & Maquillaje #01', TRUE, 'wish_46c2d695009e3876d9820e61', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Favoritos Skincare & Maquillaje #02', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Favoritos Skincare & Maquillaje #03', TRUE, 'wish_92e40fcfc0020c78d9849f46', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Favoritos Skincare & Maquillaje #04', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Favoritos Skincare & Maquillaje #05', TRUE, 'wish_1d5e6d839cdd0b06cff18d5e', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Favoritos Skincare & Maquillaje #06', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Favoritos Skincare & Maquillaje #07', TRUE, 'wish_ddb188aba146f0e23a3fb26a', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Favoritos Skincare & Maquillaje #08', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Favoritos Skincare & Maquillaje #09', TRUE, 'wish_e4aea1e96e244453feb40b3c', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Favoritos Skincare & Maquillaje #10', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Favoritos Skincare & Maquillaje #11', TRUE, 'wish_da4984c762bfefe99427bd6e', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Favoritos Skincare & Maquillaje #12', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Favoritos Skincare & Maquillaje #13', TRUE, 'wish_b32dee77d35cd7cc666b369a', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Favoritos Skincare & Maquillaje #14', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Favoritos Skincare & Maquillaje #15', TRUE, 'wish_80f3db5a45e7f0688af8c710', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Favoritos Skincare & Maquillaje #16', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Favoritos Skincare & Maquillaje #17', TRUE, 'wish_0907dfa8a2545d3dc11e737d', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Favoritos Skincare & Maquillaje #18', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Favoritos Skincare & Maquillaje #19', TRUE, 'wish_b47136fd92a060c62011ad69', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Favoritos Skincare & Maquillaje #20', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Favoritos Skincare & Maquillaje #21', TRUE, 'wish_e195bdd0b74512e76e47556b', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Favoritos Skincare & Maquillaje #22', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Favoritos Skincare & Maquillaje #23', TRUE, 'wish_44967c2f84d267b8c0fc5ebe', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Favoritos Skincare & Maquillaje #24', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Favoritos Skincare & Maquillaje #25', TRUE, 'wish_6af153663542efe59aed7c0c', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Favoritos Skincare & Maquillaje #26', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Favoritos Skincare & Maquillaje #27', TRUE, 'wish_e766ab1c99e15269af37245f', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Favoritos Skincare & Maquillaje #28', FALSE, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Favoritos Skincare & Maquillaje #29', TRUE, 'wish_1762339787b94cbfab70f624', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Favoritos Skincare & Maquillaje #30', FALSE, NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('comunidad.listas_deseos', 'id'), COALESCE((SELECT MAX(id) FROM comunidad.listas_deseos), 1), true);

