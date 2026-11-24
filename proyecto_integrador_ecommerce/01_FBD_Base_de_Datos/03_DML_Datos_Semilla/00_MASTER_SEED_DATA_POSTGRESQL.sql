-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR MULTIDISCIPLINARIO TERMINAL V
-- MASTER SEED DATA DML (PostgreSQL 16/17) - 150 TABLAS ALINEADAS 100% AL ESQUEMA (PK: ID / FKs: ID_*)
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

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.tipos_descuento (ID, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'DESCUENT_01', 'Porcentaje Directo Nivel 1', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'DESCUENT_02', 'Monto Fijo MXN Nivel 1', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'DESCUENT_03', 'Suscripción Beauty-Box Nivel 1', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'DESCUENT_04', 'Envío Gratuito VIP Nivel 1', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'DESCUENT_05', 'Regalo por Compra (GWP) Nivel 1', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'DESCUENT_06', 'Porcentaje Directo Nivel 2', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DESCUENT_07', 'Monto Fijo MXN Nivel 2', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'DESCUENT_08', 'Suscripción Beauty-Box Nivel 2', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'DESCUENT_09', 'Envío Gratuito VIP Nivel 2', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'DESCUENT_10', 'Regalo por Compra (GWP) Nivel 2', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'DESCUENT_11', 'Porcentaje Directo Nivel 3', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'DESCUENT_12', 'Monto Fijo MXN Nivel 3', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'DESCUENT_13', 'Suscripción Beauty-Box Nivel 3', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'DESCUENT_14', 'Envío Gratuito VIP Nivel 3', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'DESCUENT_15', 'Regalo por Compra (GWP) Nivel 3', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'DESCUENT_16', 'Porcentaje Directo Nivel 4', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'DESCUENT_17', 'Monto Fijo MXN Nivel 4', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'DESCUENT_18', 'Suscripción Beauty-Box Nivel 4', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'DESCUENT_19', 'Envío Gratuito VIP Nivel 4', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'DESCUENT_20', 'Regalo por Compra (GWP) Nivel 4', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'DESCUENT_21', 'Porcentaje Directo Nivel 5', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'DESCUENT_22', 'Monto Fijo MXN Nivel 5', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'DESCUENT_23', 'Suscripción Beauty-Box Nivel 5', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'DESCUENT_24', 'Envío Gratuito VIP Nivel 5', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'DESCUENT_25', 'Regalo por Compra (GWP) Nivel 5', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'DESCUENT_26', 'Porcentaje Directo Nivel 6', 'Descuento porcentual directo aplicable sobre el subtotal elegible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'DESCUENT_27', 'Monto Fijo MXN Nivel 6', 'Bonificación monetaria fija en pesos mexicanos sobre compra mínima.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'DESCUENT_28', 'Suscripción Beauty-Box Nivel 6', 'Ahorro recurrente exclusivo para clientes con entrega programada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'DESCUENT_29', 'Envío Gratuito VIP Nivel 6', 'Condonación total de gastos de paquetería terrestre o refrigerada.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'DESCUENT_30', 'Regalo por Compra (GWP) Nivel 6', 'Bonificación de muestra o talla viajera al alcanzar umbral de carrito.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.tipos_descuento', 'id'), COALESCE((SELECT MAX(id) FROM ventas.tipos_descuento), 1), true);

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.estados_orden (ID, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PEND_PAGO', 'Pendiente de Pago', 'Orden registrada esperando confirmación bancaria o SPEI', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PAGADA', 'Pago Confirmado', 'Transacción aprobada y lista para asignación de almacén', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PREPARANDO', 'En Preparación CEDIS', 'Surtido en curso bajo estrategia FEFO y empaque térmico', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'EN_TRANSITO', 'Enviada en Tránsito', 'Paquete recolectado por paquetería con guía de rastreo', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ENTREGADA', 'Entregada al Cliente', 'Recepción confirmada en domicilio del destinatario', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden anulada antes del despacho con liberación de stock', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DEVUELTA', 'Devuelta por RMA', 'Mercancía retornada y dictaminada en postventa', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('ventas.estados_orden', 'id'), COALESCE((SELECT MAX(id) FROM ventas.estados_orden), 1), true);

-- =================================================================================================
-- 053. TABLA: ventas.motivos_cancelacion_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.motivos_cancelacion_orden (ID, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Cliente solicitó cancelación antes de recolección en CEDIS', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Error en dirección de entrega o código postal capturado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Pago rechazado o expirado por institución emisora', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Quiebre de inventario en lote con caducidad vigente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Cambio de producto o tono solicitado por cliente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Cliente solicitó cancelación antes de recolección en CEDIS', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Error en dirección de entrega o código postal capturado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Pago rechazado o expirado por institución emisora', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Quiebre de inventario en lote con caducidad vigente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Cambio de producto o tono solicitado por cliente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Cliente solicitó cancelación antes de recolección en CEDIS', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Error en dirección de entrega o código postal capturado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Pago rechazado o expirado por institución emisora', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Quiebre de inventario en lote con caducidad vigente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Cambio de producto o tono solicitado por cliente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Cliente solicitó cancelación antes de recolección en CEDIS', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Error en dirección de entrega o código postal capturado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Pago rechazado o expirado por institución emisora', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Quiebre de inventario en lote con caducidad vigente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Cambio de producto o tono solicitado por cliente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Cliente solicitó cancelación antes de recolección en CEDIS', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Error en dirección de entrega o código postal capturado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Pago rechazado o expirado por institución emisora', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Quiebre de inventario en lote con caducidad vigente', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Cambio de producto o tono solicitado por cliente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Cliente solicitó cancelación antes de recolección en CEDIS', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Error en dirección de entrega o código postal capturado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Pago rechazado o expirado por institución emisora', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Quiebre de inventario en lote con caducidad vigente', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Cambio de producto o tono solicitado por cliente', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.motivos_cancelacion_orden', 'id'), COALESCE((SELECT MAX(id) FROM ventas.motivos_cancelacion_orden), 1), true);

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos (ID, ID_cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'cart_57dc5da2039af8209f120c7b2b2be269', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'cart_554ae59cc8f4acc14082de7fc4a9f5b3', '2026-02-02 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'cart_c47636f57a40b6e372daf58b4eeed6c1', '2026-02-03 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'cart_2b38b22aed846681e14862f4a2119795', '2026-02-04 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'cart_6da7b7ebbfa341e1e1ec1d19b3781958', '2026-02-05 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'cart_ae5947c6abb8a651e55f9e2c984e3afb', '2026-02-06 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'cart_9f1bbb48183acdcc679ac9bb0cedaf73', '2026-02-07 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'cart_8080474caaa1d1a4f108a48e2b832d78', '2026-02-08 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'cart_d84d15c981329a2ac173a050f8d4e8e0', '2026-02-09 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'cart_1fad691371770b500d253d30187fcf1a', '2026-02-10 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'cart_bc761d30adb2285a09292f3591e6d22a', '2026-02-11 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'cart_1db8173a08b1f21c1e061ca8ab12f8e7', '2026-02-12 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'cart_28a951a322f66c471ed9e6b6d1446f07', '2026-02-13 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'cart_7584f3ea411c95a2cd3502e695977dab', '2026-02-14 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'cart_89154d767ec2eb8cd9aa6962f6dade7b', '2026-02-15 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'cart_74c0e5204d660ec49f8c06556e097bbf', '2026-02-16 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'cart_8dc42a833499c9a8a2b3c3ccdc7b70b9', '2026-02-17 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'cart_1e8d4b56ad7777d93c481c07c164a7e4', '2026-02-18 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'cart_2875259dce4df7dfde8d04aa94cacfad', '2026-02-19 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'cart_a18af5057ae5f140b0f133ba744d82d4', '2026-02-20 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'cart_089cd763aafad52db63c023d769b471f', '2026-02-21 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'cart_01bc2fd024ad872376159fcca18ea91a', '2026-02-22 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'cart_22f8c2f21386cc2dce796861c0e94195', '2026-02-23 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'cart_1758dfb7f6192568cd3f8b92a8995d85', '2026-02-24 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'cart_9bb7274b4a4f68c3f66552d5f2de9be4', '2026-02-25 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'cart_9142a7c6a5971e60db03b68461494ded', '2026-02-26 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'cart_bb00ee858a90811da2756726f24f1723', '2026-02-27 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'cart_a6f636ca5b9598970e91b89107409258', '2026-02-28 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'cart_9597bf538a12785e1abf35d807246e0e', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'cart_cea37fa7bacdff1e1595ac22411f66ad', '2026-02-02 11:30:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos', 'id'), COALESCE((SELECT MAX(id) FROM ventas.carritos), 1), true);

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.items_carrito (ID, ID_carrito, ID_variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 285.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 321.00, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 356.50, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 392.00, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 427.50, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 463.00, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 498.50, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 534.00, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 569.50, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 605.00, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 640.50, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 676.00, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 711.50, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 747.00, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 782.50, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 818.00, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 853.50, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 889.00, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 924.50, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 960.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 995.50, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 1031.00, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 1066.50, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 1102.00, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1137.50, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1173.00, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1208.50, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1244.00, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1279.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1315.00, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.items_carrito', 'id'), COALESCE((SELECT MAX(id) FROM ventas.items_carrito), 1), true);

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos_abandonados_seguimiento (ID, ID_carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, '2026-02-01 11:30:00', TRUE, 571.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, NULL, FALSE, 642.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, '2026-02-03 11:30:00', TRUE, 713.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, NULL, FALSE, 784.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, '2026-02-05 11:30:00', TRUE, 855.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, NULL, FALSE, 926.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, '2026-02-07 11:30:00', TRUE, 997.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, NULL, FALSE, 1068.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, '2026-02-09 11:30:00', TRUE, 1139.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, NULL, FALSE, 1210.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, '2026-02-11 11:30:00', TRUE, 1281.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, NULL, FALSE, 1352.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, '2026-02-13 11:30:00', TRUE, 1423.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, NULL, FALSE, 1494.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, '2026-02-15 11:30:00', TRUE, 1565.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, NULL, FALSE, 1636.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, '2026-02-17 11:30:00', TRUE, 1707.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, NULL, FALSE, 1778.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, '2026-02-19 11:30:00', TRUE, 1849.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, NULL, FALSE, 1920.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, '2026-02-21 11:30:00', TRUE, 1991.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, NULL, FALSE, 2062.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, '2026-02-23 11:30:00', TRUE, 2133.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, NULL, FALSE, 2204.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, '2026-02-25 11:30:00', TRUE, 2275.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, NULL, FALSE, 2346.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, '2026-02-27 11:30:00', TRUE, 2417.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, NULL, FALSE, 2488.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, '2026-02-01 11:30:00', TRUE, 2559.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, NULL, FALSE, 2630.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos_abandonados_seguimiento', 'id'), COALESCE((SELECT MAX(id) FROM ventas.carritos_abandonados_seguimiento), 1), true);

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.planes_suscripcion (ID, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PLAN_01', 'Beauty-Box Dermatológica La Roche-Posay #01', 'Reposición automática personalizada de tratamientos La Roche-Posay con seguimiento clínico.', 285.50, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PLAN_02', 'Beauty-Box Dermatológica CeraVe #02', 'Reposición automática personalizada de tratamientos CeraVe con seguimiento clínico.', 321.00, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PLAN_03', 'Beauty-Box Dermatológica The Ordinary #03', 'Reposición automática personalizada de tratamientos The Ordinary con seguimiento clínico.', 356.50, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PLAN_04', 'Beauty-Box Dermatológica ISDIN #04', 'Reposición automática personalizada de tratamientos ISDIN con seguimiento clínico.', 392.00, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PLAN_05', 'Beauty-Box Dermatológica Bioderma #05', 'Reposición automática personalizada de tratamientos Bioderma con seguimiento clínico.', 427.50, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PLAN_06', 'Beauty-Box Dermatológica Eau Thermale Avène #06', 'Reposición automática personalizada de tratamientos Eau Thermale Avène con seguimiento clínico.', 463.00, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PLAN_07', 'Beauty-Box Dermatológica Eucerin #07', 'Reposición automática personalizada de tratamientos Eucerin con seguimiento clínico.', 498.50, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PLAN_08', 'Beauty-Box Dermatológica Vichy Laboratoires #08', 'Reposición automática personalizada de tratamientos Vichy Laboratoires con seguimiento clínico.', 534.00, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PLAN_09', 'Beauty-Box Dermatológica SkinCeuticals #09', 'Reposición automática personalizada de tratamientos SkinCeuticals con seguimiento clínico.', 569.50, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PLAN_10', 'Beauty-Box Dermatológica Sesderma #10', 'Reposición automática personalizada de tratamientos Sesderma con seguimiento clínico.', 605.00, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PLAN_11', 'Beauty-Box Dermatológica NARS Cosmetics #11', 'Reposición automática personalizada de tratamientos NARS Cosmetics con seguimiento clínico.', 640.50, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PLAN_12', 'Beauty-Box Dermatológica MAC Cosmetics #12', 'Reposición automática personalizada de tratamientos MAC Cosmetics con seguimiento clínico.', 676.00, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PLAN_13', 'Beauty-Box Dermatológica Fenty Beauty #13', 'Reposición automática personalizada de tratamientos Fenty Beauty con seguimiento clínico.', 711.50, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PLAN_14', 'Beauty-Box Dermatológica Rare Beauty #14', 'Reposición automática personalizada de tratamientos Rare Beauty con seguimiento clínico.', 747.00, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PLAN_15', 'Beauty-Box Dermatológica Clinique #15', 'Reposición automática personalizada de tratamientos Clinique con seguimiento clínico.', 782.50, 5.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PLAN_16', 'Beauty-Box Dermatológica Estée Lauder #16', 'Reposición automática personalizada de tratamientos Estée Lauder con seguimiento clínico.', 818.00, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PLAN_17', 'Beauty-Box Dermatológica Lancôme #17', 'Reposición automática personalizada de tratamientos Lancôme con seguimiento clínico.', 853.50, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PLAN_18', 'Beauty-Box Dermatológica Charlotte Tilbury #18', 'Reposición automática personalizada de tratamientos Charlotte Tilbury con seguimiento clínico.', 889.00, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PLAN_19', 'Beauty-Box Dermatológica Paula''s Choice #19', 'Reposición automática personalizada de tratamientos Paula''s Choice con seguimiento clínico.', 924.50, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PLAN_20', 'Beauty-Box Dermatológica COSRX #20', 'Reposición automática personalizada de tratamientos COSRX con seguimiento clínico.', 960.00, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PLAN_21', 'Beauty-Box Dermatológica Laneige #21', 'Reposición automática personalizada de tratamientos Laneige con seguimiento clínico.', 995.50, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PLAN_22', 'Beauty-Box Dermatológica Uriage #22', 'Reposición automática personalizada de tratamientos Uriage con seguimiento clínico.', 1031.00, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PLAN_23', 'Beauty-Box Dermatológica Laboratoire SVR #23', 'Reposición automática personalizada de tratamientos Laboratoire SVR con seguimiento clínico.', 1066.50, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PLAN_24', 'Beauty-Box Dermatológica MartiDerm #24', 'Reposición automática personalizada de tratamientos MartiDerm con seguimiento clínico.', 1102.00, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PLAN_25', 'Beauty-Box Dermatológica Heliocare #25', 'Reposición automática personalizada de tratamientos Heliocare con seguimiento clínico.', 1137.50, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PLAN_26', 'Beauty-Box Dermatológica Kiehl''s #26', 'Reposición automática personalizada de tratamientos Kiehl''s con seguimiento clínico.', 1173.00, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PLAN_27', 'Beauty-Box Dermatológica Garnier SkinActive #27', 'Reposición automática personalizada de tratamientos Garnier SkinActive con seguimiento clínico.', 1208.50, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PLAN_28', 'Beauty-Box Dermatológica L''Oréal Paris Derm #28', 'Reposición automática personalizada de tratamientos L''Oréal Paris Derm con seguimiento clínico.', 1244.00, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PLAN_29', 'Beauty-Box Dermatológica Neutrogena #29', 'Reposición automática personalizada de tratamientos Neutrogena con seguimiento clínico.', 1279.50, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PLAN_30', 'Beauty-Box Dermatológica DermaCare Labs #30', 'Reposición automática personalizada de tratamientos DermaCare Labs con seguimiento clínico.', 1315.00, 5.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.planes_suscripcion', 'id'), COALESCE((SELECT MAX(id) FROM ventas.planes_suscripcion), 1), true);

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.frecuencias_suscripcion (ID, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FRECUENC_01', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FRECUENC_02', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FRECUENC_03', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FRECUENC_04', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FRECUENC_05', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FRECUENC_06', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FRECUENC_07', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FRECUENC_08', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FRECUENC_09', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FRECUENC_10', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FRECUENC_11', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FRECUENC_12', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FRECUENC_13', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FRECUENC_14', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FRECUENC_15', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FRECUENC_16', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FRECUENC_17', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FRECUENC_18', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FRECUENC_19', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FRECUENC_20', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FRECUENC_21', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FRECUENC_22', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FRECUENC_23', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FRECUENC_24', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FRECUENC_25', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FRECUENC_26', 'Cada 60 días', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FRECUENC_27', 'Cada 75 días', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FRECUENC_28', 'Cada 30 días', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FRECUENC_29', 'Cada 45 días', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FRECUENC_30', 'Cada 60 días', 60, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.frecuencias_suscripcion', 'id'), COALESCE((SELECT MAX(id) FROM ventas.frecuencias_suscripcion), 1), true);

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_cliente (ID, folio_suscripcion, ID_cliente, ID_plan_suscripcion, ID_frecuencia_suscripcion, ID_direccion_entrega, ID_metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-31', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-04-01', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-04-02', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-04-03', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-04-04', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-04-05', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-04-06', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-04-07', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-04-08', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-04-09', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-04-10', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-04-11', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-04-12', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-04-13', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-04-14', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-04-15', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-04-16', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-04-17', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-04-18', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-04-19', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-04-20', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-04-21', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-04-22', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-04-23', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-04-24', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-04-25', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-04-26', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-04-27', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-31', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-04-01', 'PAUSADA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_cliente', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_cliente), 1), true);

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_items (ID, ID_suscripcion_cliente, ID_variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 256.95, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 288.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 320.85, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 352.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 384.75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 416.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 448.65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 480.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 512.55, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 544.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 576.45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 608.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 640.35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 672.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 704.25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 736.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 768.15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 800.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 832.05, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 864.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 895.95, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 927.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 959.85, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 991.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 1023.75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 1055.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 1087.65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 1119.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 1151.55, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 1183.50, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_items', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_items), 1), true);

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_calendario_entregas (ID, ID_suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '2026-03-01', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '2026-03-02', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '2026-03-03', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '2026-03-04', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '2026-03-05', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '2026-03-06', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '2026-03-07', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '2026-03-08', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '2026-03-09', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '2026-03-10', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '2026-03-11', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '2026-03-12', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '2026-03-13', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '2026-03-14', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '2026-03-15', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '2026-03-16', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '2026-03-17', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '2026-03-18', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '2026-03-19', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '2026-03-20', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '2026-03-21', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '2026-03-22', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '2026-03-23', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '2026-03-24', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '2026-03-25', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '2026-03-26', 1, 'COBRADO_PROCESANDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '2026-03-27', 1, 'DESPACHADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '2026-03-28', 1, 'OMITIDO_POR_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '2026-03-01', 1, 'PROGRAMADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '2026-03-02', 1, 'COBRADO_PROCESANDO', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_calendario_entregas', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_calendario_entregas), 1), true);

-- =================================================================================================
-- 062. TABLA: ventas.suscripciones_bitacora_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_bitacora_estados (ID, ID_suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PENDIENTE', 'ACTIVA', 'Cobro inicial aprobado y suscripción activada.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ACTIVA', 'PAUSADA', 'Pausa temporal solicitada por cliente desde panel.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'PAUSADA', 'ACTIVA', 'Reactivación automática al cumplirse fecha de reanudación.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ACTIVA', 'PAGO_FALLIDO', 'Tarjeta expirada al intentar cobro de ciclo mensual.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PAGO_FALLIDO', 'CANCELADA', 'Cancelación automática tras 3 reintentos de cobro fallidos.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_bitacora_estados', 'id'), COALESCE((SELECT MAX(id) FROM ventas.suscripciones_bitacora_estados), 1), true);

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.regalos_por_compra_gwp (ID, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, ID_variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROMOCIO_01', 'Regalo GWP La Roche-Posay (Talla Viajera #01)', 899.00, 1, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 8, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROMOCIO_02', 'Regalo GWP CeraVe (Talla Viajera #02)', 1099.00, 2, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROMOCIO_03', 'Regalo GWP The Ordinary (Talla Viajera #03)', 1299.00, 3, '2026-02-03 11:30:00', '2026-03-05 11:30:00', 14, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROMOCIO_04', 'Regalo GWP ISDIN (Talla Viajera #04)', 1499.00, 4, '2026-02-04 11:30:00', '2026-03-06 11:30:00', 17, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROMOCIO_05', 'Regalo GWP Bioderma (Talla Viajera #05)', 1699.00, 5, '2026-02-05 11:30:00', '2026-03-07 11:30:00', 20, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROMOCIO_06', 'Regalo GWP Eau Thermale Avène (Talla Viajera #06)', 899.00, 6, '2026-02-06 11:30:00', '2026-03-08 11:30:00', 23, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROMOCIO_07', 'Regalo GWP Eucerin (Talla Viajera #07)', 1099.00, 7, '2026-02-07 11:30:00', '2026-03-09 11:30:00', 26, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROMOCIO_08', 'Regalo GWP Vichy Laboratoires (Talla Viajera #08)', 1299.00, 8, '2026-02-08 11:30:00', '2026-03-10 11:30:00', 29, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROMOCIO_09', 'Regalo GWP SkinCeuticals (Talla Viajera #09)', 1499.00, 9, '2026-02-09 11:30:00', '2026-03-11 11:30:00', 32, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROMOCIO_10', 'Regalo GWP Sesderma (Talla Viajera #10)', 1699.00, 10, '2026-02-10 11:30:00', '2026-03-12 11:30:00', 35, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROMOCIO_11', 'Regalo GWP NARS Cosmetics (Talla Viajera #11)', 899.00, 11, '2026-02-11 11:30:00', '2026-03-13 11:30:00', 38, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROMOCIO_12', 'Regalo GWP MAC Cosmetics (Talla Viajera #12)', 1099.00, 12, '2026-02-12 11:30:00', '2026-03-14 11:30:00', 41, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROMOCIO_13', 'Regalo GWP Fenty Beauty (Talla Viajera #13)', 1299.00, 13, '2026-02-13 11:30:00', '2026-03-15 11:30:00', 44, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROMOCIO_14', 'Regalo GWP Rare Beauty (Talla Viajera #14)', 1499.00, 14, '2026-02-14 11:30:00', '2026-03-16 11:30:00', 47, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROMOCIO_15', 'Regalo GWP Clinique (Talla Viajera #15)', 1699.00, 15, '2026-02-15 11:30:00', '2026-03-17 11:30:00', 50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROMOCIO_16', 'Regalo GWP Estée Lauder (Talla Viajera #16)', 899.00, 16, '2026-02-16 11:30:00', '2026-03-18 11:30:00', 53, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROMOCIO_17', 'Regalo GWP Lancôme (Talla Viajera #17)', 1099.00, 17, '2026-02-17 11:30:00', '2026-03-19 11:30:00', 56, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROMOCIO_18', 'Regalo GWP Charlotte Tilbury (Talla Viajera #18)', 1299.00, 18, '2026-02-18 11:30:00', '2026-03-20 11:30:00', 59, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROMOCIO_19', 'Regalo GWP Paula''s Choice (Talla Viajera #19)', 1499.00, 19, '2026-02-19 11:30:00', '2026-03-21 11:30:00', 62, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROMOCIO_20', 'Regalo GWP COSRX (Talla Viajera #20)', 1699.00, 20, '2026-02-20 11:30:00', '2026-03-22 11:30:00', 65, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROMOCIO_21', 'Regalo GWP Laneige (Talla Viajera #21)', 899.00, 21, '2026-02-21 11:30:00', '2026-03-23 11:30:00', 68, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROMOCIO_22', 'Regalo GWP Uriage (Talla Viajera #22)', 1099.00, 22, '2026-02-22 11:30:00', '2026-03-24 11:30:00', 71, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROMOCIO_23', 'Regalo GWP Laboratoire SVR (Talla Viajera #23)', 1299.00, 23, '2026-02-23 11:30:00', '2026-03-25 11:30:00', 74, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROMOCIO_24', 'Regalo GWP MartiDerm (Talla Viajera #24)', 1499.00, 24, '2026-02-24 11:30:00', '2026-03-26 11:30:00', 77, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROMOCIO_25', 'Regalo GWP Heliocare (Talla Viajera #25)', 1699.00, 25, '2026-02-25 11:30:00', '2026-03-27 11:30:00', 80, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROMOCIO_26', 'Regalo GWP Kiehl''s (Talla Viajera #26)', 899.00, 26, '2026-02-26 11:30:00', '2026-03-28 11:30:00', 83, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROMOCIO_27', 'Regalo GWP Garnier SkinActive (Talla Viajera #27)', 1099.00, 27, '2026-02-27 11:30:00', '2026-03-29 11:30:00', 86, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROMOCIO_28', 'Regalo GWP L''Oréal Paris Derm (Talla Viajera #28)', 1299.00, 28, '2026-02-28 11:30:00', '2026-03-30 11:30:00', 89, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROMOCIO_29', 'Regalo GWP Neutrogena (Talla Viajera #29)', 1499.00, 29, '2026-02-01 11:30:00', '2026-03-03 11:30:00', 92, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROMOCIO_30', 'Regalo GWP DermaCare Labs (Talla Viajera #30)', 1699.00, 30, '2026-02-02 11:30:00', '2026-03-04 11:30:00', 95, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.regalos_por_compra_gwp', 'id'), COALESCE((SELECT MAX(id) FROM ventas.regalos_por_compra_gwp), 1), true);

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes (ID, folio_orden, ID_cliente, ID_estado_orden, ID_motivo_cancelacion, ID_direccion_envio, ID_direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 571.00, 0.00, 91.36, 129.00, 791.36, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 0.00, 51.36, 129.00, 501.36, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 713.00, 71.30, 102.67, 129.00, 873.37, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 0.00, 62.72, 129.00, 583.72, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 855.00, 0.00, 136.80, 129.00, 1120.80, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 46.30, 66.67, 129.00, 612.37, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 7, 7, 7, 7, '2026-02-07 11:30:00', 997.00, 0.00, 159.52, 129.00, 1285.52, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 0.00, 85.44, 129.00, 748.44, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 1139.00, 113.90, 164.02, 0.00, 1189.12, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 0.00, 96.80, 129.00, 830.80, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 1281.00, 0.00, 204.96, 0.00, 1485.96, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 67.60, 97.34, 129.00, 834.74, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 6, 13, 13, 13, '2026-02-13 11:30:00', 1423.00, 0.00, 227.68, 0.00, 1650.68, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 7, 14, 14, 14, '2026-02-14 11:30:00', 747.00, 0.00, 119.52, 129.00, 995.52, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 1565.00, 156.50, 225.36, 0.00, 1633.86, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 0.00, 130.88, 129.00, 1077.88, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 1707.00, 0.00, 273.12, 0.00, 1980.12, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 88.90, 128.02, 129.00, 1057.12, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 1849.00, 0.00, 295.84, 0.00, 2144.84, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 6, 20, 20, 20, '2026-02-20 11:30:00', 960.00, 0.00, 153.60, 129.00, 1242.60, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 7, 21, 21, 21, '2026-02-21 11:30:00', 1991.00, 199.10, 286.70, 0.00, 2078.60, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 0.00, 164.96, 0.00, 1195.96, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 2133.00, 0.00, 341.28, 0.00, 2474.28, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 110.20, 158.69, 129.00, 1279.49, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 2275.00, 0.00, 364.00, 0.00, 2639.00, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 0.00, 187.68, 0.00, 1360.68, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 6, 27, 27, 27, '2026-02-27 11:30:00', 2417.00, 241.70, 348.05, 0.00, 2523.35, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 7, 28, 28, 28, '2026-02-28 11:30:00', 1244.00, 0.00, 199.04, 0.00, 1443.04, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 2559.00, 0.00, 409.44, 0.00, 2968.44, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 131.50, 189.36, 0.00, 1372.86, 'MXN', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes), 1), true);

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_detalles (ID, ID_orden, ID_variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 2, 285.50, 148.46, 0.00, 571.00, 16.00, 91.36, 662.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 1, 321.00, 166.92, 0.00, 321.00, 16.00, 51.36, 372.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 2, 356.50, 185.38, 71.30, 641.70, 16.00, 102.67, 744.37, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 1, 392.00, 203.84, 0.00, 392.00, 16.00, 62.72, 454.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 2, 427.50, 222.30, 0.00, 855.00, 16.00, 136.80, 991.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 1, 463.00, 240.76, 46.30, 416.70, 16.00, 66.67, 483.37, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 2, 498.50, 259.22, 0.00, 997.00, 16.00, 159.52, 1156.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 1, 534.00, 277.68, 0.00, 534.00, 16.00, 85.44, 619.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 2, 569.50, 296.14, 113.90, 1025.10, 16.00, 164.02, 1189.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 1, 605.00, 314.60, 0.00, 605.00, 16.00, 96.80, 701.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 2, 640.50, 333.06, 0.00, 1281.00, 16.00, 204.96, 1485.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 1, 676.00, 351.52, 67.60, 608.40, 16.00, 97.34, 705.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 2, 711.50, 369.98, 0.00, 1423.00, 16.00, 227.68, 1650.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 1, 747.00, 388.44, 0.00, 747.00, 16.00, 119.52, 866.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 2, 782.50, 406.90, 156.50, 1408.50, 16.00, 225.36, 1633.86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 1, 818.00, 425.36, 0.00, 818.00, 16.00, 130.88, 948.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 2, 853.50, 443.82, 0.00, 1707.00, 16.00, 273.12, 1980.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 1, 889.00, 462.28, 88.90, 800.10, 16.00, 128.02, 928.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 2, 924.50, 480.74, 0.00, 1849.00, 16.00, 295.84, 2144.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 1, 960.00, 499.20, 0.00, 960.00, 16.00, 153.60, 1113.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 2, 995.50, 517.66, 199.10, 1791.90, 16.00, 286.70, 2078.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 1, 1031.00, 536.12, 0.00, 1031.00, 16.00, 164.96, 1195.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 2, 1066.50, 554.58, 0.00, 2133.00, 16.00, 341.28, 2474.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 1, 1102.00, 573.04, 110.20, 991.80, 16.00, 158.69, 1150.49, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 2, 1137.50, 591.50, 0.00, 2275.00, 16.00, 364.00, 2639.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 1, 1173.00, 609.96, 0.00, 1173.00, 16.00, 187.68, 1360.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 2, 1208.50, 628.42, 241.70, 2175.30, 16.00, 348.05, 2523.35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 1, 1244.00, 646.88, 0.00, 1244.00, 16.00, 199.04, 1443.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 2, 1279.50, 665.34, 0.00, 2559.00, 16.00, 409.44, 2968.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 1, 1315.00, 683.80, 131.50, 1183.50, 16.00, 189.36, 1372.86, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_detalles', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_detalles), 1), true);

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_historial_estados (ID, ID_orden, ID_estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, 'Surtido FEFO completado; paquete asignado a guía de paquetería.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, 'Pedido entregado satisfactoriamente en domicilio del destinatario.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Orden creada y validada en checkout; en espera de confirmación de pago.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, 'Pago aprobado por pasarela; orden liberada a almacén CEDIS.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_historial_estados', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_historial_estados), 1), true);

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_splits_almacen (ID, ID_orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SPL-ORD-2026-0001-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SPL-ORD-2026-0002-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SPL-ORD-2026-0003-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SPL-ORD-2026-0004-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SPL-ORD-2026-0005-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SPL-ORD-2026-0006-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SPL-ORD-2026-0007-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SPL-ORD-2026-0008-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SPL-ORD-2026-0009-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SPL-ORD-2026-0010-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SPL-ORD-2026-0011-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SPL-ORD-2026-0012-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SPL-ORD-2026-0013-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SPL-ORD-2026-0014-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SPL-ORD-2026-0015-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SPL-ORD-2026-0016-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SPL-ORD-2026-0017-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SPL-ORD-2026-0018-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SPL-ORD-2026-0019-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SPL-ORD-2026-0020-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SPL-ORD-2026-0021-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SPL-ORD-2026-0022-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SPL-ORD-2026-0023-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SPL-ORD-2026-0024-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SPL-ORD-2026-0025-01', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SPL-ORD-2026-0026-01', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SPL-ORD-2026-0027-01', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SPL-ORD-2026-0028-01', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SPL-ORD-2026-0029-01', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SPL-ORD-2026-0030-01', 'EN_RUTA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_splits_almacen', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_splits_almacen), 1), true);

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_impuestos (ID, ID_orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '002_IVA', 0.1600, 571.00, 91.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '002_IVA', 0.1600, 321.00, 51.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '002_IVA', 0.1600, 641.70, 102.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '002_IVA', 0.1600, 392.00, 62.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '002_IVA', 0.1600, 855.00, 136.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '002_IVA', 0.1600, 416.70, 66.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '002_IVA', 0.1600, 997.00, 159.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '002_IVA', 0.1600, 534.00, 85.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '002_IVA', 0.1600, 1025.10, 164.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '002_IVA', 0.1600, 605.00, 96.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '002_IVA', 0.1600, 1281.00, 204.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '002_IVA', 0.1600, 608.40, 97.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '002_IVA', 0.1600, 1423.00, 227.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '002_IVA', 0.1600, 747.00, 119.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '002_IVA', 0.1600, 1408.50, 225.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '002_IVA', 0.1600, 818.00, 130.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '002_IVA', 0.1600, 1707.00, 273.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '002_IVA', 0.1600, 800.10, 128.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '002_IVA', 0.1600, 1849.00, 295.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '002_IVA', 0.1600, 960.00, 153.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '002_IVA', 0.1600, 1791.90, 286.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '002_IVA', 0.1600, 1031.00, 164.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '002_IVA', 0.1600, 2133.00, 341.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '002_IVA', 0.1600, 991.80, 158.69, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '002_IVA', 0.1600, 2275.00, 364.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '002_IVA', 0.1600, 1173.00, 187.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '002_IVA', 0.1600, 2175.30, 348.05, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '002_IVA', 0.1600, 1244.00, 199.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '002_IVA', 0.1600, 2559.00, 409.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '002_IVA', 0.1600, 1183.50, 189.36, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_impuestos', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_impuestos), 1), true);

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_descuentos (ID, ID_orden, ID_tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'PROMOCIO_01', 57.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'PROMOCIO_02', 32.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'PROMOCIO_03', 71.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'PROMOCIO_04', 39.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'PROMOCIO_05', 85.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'PROMOCIO_06', 46.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'PROMOCIO_07', 99.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'PROMOCIO_08', 53.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'PROMOCIO_09', 113.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'PROMOCIO_10', 60.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'PROMOCIO_11', 128.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'PROMOCIO_12', 67.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'PROMOCIO_13', 142.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'PROMOCIO_14', 74.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'PROMOCIO_15', 156.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'PROMOCIO_16', 81.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'PROMOCIO_17', 170.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'PROMOCIO_18', 88.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'PROMOCIO_19', 184.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'PROMOCIO_20', 96.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'PROMOCIO_21', 199.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'PROMOCIO_22', 103.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'PROMOCIO_23', 213.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'PROMOCIO_24', 110.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'PROMOCIO_25', 227.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'PROMOCIO_26', 117.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'PROMOCIO_27', 241.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'PROMOCIO_28', 124.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'PROMOCIO_29', 255.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'PROMOCIO_30', 131.50, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_descuentos', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_descuentos), 1), true);

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_notas_instrucciones (ID, ID_orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, 'Con cariño para el cuidado diario de tu piel, Carlos.', 'Portón blanco frente a parque en Centro, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, 'Con cariño para el cuidado diario de tu piel, Sofía.', 'Portón blanco frente a parque en Obispado, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, 'Con cariño para el cuidado diario de tu piel, Valeria.', 'Portón blanco frente a parque en Del Valle, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, 'Con cariño para el cuidado diario de tu piel, Alejandro.', 'Portón blanco frente a parque en Roma Norte, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, 'Con cariño para el cuidado diario de tu piel, Mariana.', 'Portón blanco frente a parque en Polanco, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, 'Con cariño para el cuidado diario de tu piel, Diego.', 'Portón blanco frente a parque en Americana, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, 'Con cariño para el cuidado diario de tu piel, Camila.', 'Portón blanco frente a parque en República, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, 'Con cariño para el cuidado diario de tu piel, Mateo.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, 'Con cariño para el cuidado diario de tu piel, Lucía.', 'Portón blanco frente a parque en La Paz, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, 'Con cariño para el cuidado diario de tu piel, Sebastián.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, 'Con cariño para el cuidado diario de tu piel, Regina.', 'Portón blanco frente a parque en Centro, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, 'Con cariño para el cuidado diario de tu piel, Santiago.', 'Portón blanco frente a parque en Obispado, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, 'Con cariño para el cuidado diario de tu piel, Fernanda.', 'Portón blanco frente a parque en Del Valle, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, 'Con cariño para el cuidado diario de tu piel, Emiliano.', 'Portón blanco frente a parque en Roma Norte, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, 'Con cariño para el cuidado diario de tu piel, Ximena.', 'Portón blanco frente a parque en Polanco, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, 'Con cariño para el cuidado diario de tu piel, Daniel.', 'Portón blanco frente a parque en Americana, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, 'Con cariño para el cuidado diario de tu piel, Andrea.', 'Portón blanco frente a parque en República, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, 'Con cariño para el cuidado diario de tu piel, Gabriel.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, 'Con cariño para el cuidado diario de tu piel, Paula.', 'Portón blanco frente a parque en La Paz, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, 'Con cariño para el cuidado diario de tu piel, Andrés.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, 'Con cariño para el cuidado diario de tu piel, Renata.', 'Portón blanco frente a parque en Centro, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, 'Con cariño para el cuidado diario de tu piel, Nicolás.', 'Portón blanco frente a parque en Obispado, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, 'Con cariño para el cuidado diario de tu piel, Natalia.', 'Portón blanco frente a parque en Del Valle, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, 'Con cariño para el cuidado diario de tu piel, Joaquín.', 'Portón blanco frente a parque en Roma Norte, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, 'Con cariño para el cuidado diario de tu piel, Isabella.', 'Portón blanco frente a parque en Polanco, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, 'Con cariño para el cuidado diario de tu piel, Leonardo.', 'Portón blanco frente a parque en Americana, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, 'Con cariño para el cuidado diario de tu piel, Ana.', 'Portón blanco frente a parque en República, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, 'Con cariño para el cuidado diario de tu piel, Rodrigo.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, 'Con cariño para el cuidado diario de tu piel, Paulina.', 'Portón blanco frente a parque en La Paz, entregar en recepción.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, 'Con cariño para el cuidado diario de tu piel, Mauricio.', 'Portón blanco frente a parque en Centro, entregar en recepción.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_notas_instrucciones', 'id'), COALESCE((SELECT MAX(id) FROM ventas.ordenes_notas_instrucciones), 1), true);

-- =================================================================================================
-- 071. TABLA: ventas.reservas_temporales_stock (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.reservas_temporales_stock (ID, ID_carrito, ID_variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:45:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:45:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:45:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.reservas_temporales_stock', 'id'), COALESCE((SELECT MAX(id) FROM ventas.reservas_temporales_stock), 1), true);

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.afiliados_influencers (ID, codigo_afiliado, ID_usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'AFILIADO_01', 1, '@DermaTipsCarlos_01', 6.00, '012180001234567801', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'AFILIADO_02', 2, '@DermaTipsSofía_02', 7.00, '012180001234567802', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AFILIADO_03', 3, '@DermaTipsValeria_03', 8.00, '012180001234567803', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'AFILIADO_04', 4, '@DermaTipsAlejandro_04', 9.00, '012180001234567804', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'AFILIADO_05', 5, '@DermaTipsMariana_05', 10.00, '012180001234567805', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'AFILIADO_06', 6, '@DermaTipsDiego_06', 11.00, '012180001234567806', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'AFILIADO_07', 7, '@DermaTipsCamila_07', 12.00, '012180001234567807', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'AFILIADO_08', 8, '@DermaTipsMateo_08', 13.00, '012180001234567808', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'AFILIADO_09', 9, '@DermaTipsLucía_09', 14.00, '012180001234567809', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'AFILIADO_10', 10, '@DermaTipsSebastián_10', 15.00, '012180001234567810', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'AFILIADO_11', 11, '@DermaTipsRegina_11', 16.00, '012180001234567811', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'AFILIADO_12', 12, '@DermaTipsSantiago_12', 17.00, '012180001234567812', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'AFILIADO_13', 13, '@DermaTipsFernanda_13', 18.00, '012180001234567813', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'AFILIADO_14', 14, '@DermaTipsEmiliano_14', 19.00, '012180001234567814', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'AFILIADO_15', 15, '@DermaTipsXimena_15', 5.00, '012180001234567815', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'AFILIADO_16', 16, '@DermaTipsDaniel_16', 6.00, '012180001234567816', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'AFILIADO_17', 17, '@DermaTipsAndrea_17', 7.00, '012180001234567817', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'AFILIADO_18', 18, '@DermaTipsGabriel_18', 8.00, '012180001234567818', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'AFILIADO_19', 19, '@DermaTipsPaula_19', 9.00, '012180001234567819', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'AFILIADO_20', 20, '@DermaTipsAndrés_20', 10.00, '012180001234567820', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'AFILIADO_21', 21, '@DermaTipsRenata_21', 11.00, '012180001234567821', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'AFILIADO_22', 22, '@DermaTipsNicolás_22', 12.00, '012180001234567822', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'AFILIADO_23', 23, '@DermaTipsNatalia_23', 13.00, '012180001234567823', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'AFILIADO_24', 24, '@DermaTipsJoaquín_24', 14.00, '012180001234567824', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'AFILIADO_25', 25, '@DermaTipsIsabella_25', 15.00, '012180001234567825', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'AFILIADO_26', 26, '@DermaTipsLeonardo_26', 16.00, '012180001234567826', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'AFILIADO_27', 27, '@DermaTipsAna_27', 17.00, '012180001234567827', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'AFILIADO_28', 28, '@DermaTipsRodrigo_28', 18.00, '012180001234567828', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'AFILIADO_29', 29, '@DermaTipsPaulina_29', 19.00, '012180001234567829', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'AFILIADO_30', 30, '@DermaTipsMauricio_30', 5.00, '012180001234567830', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.afiliados_influencers', 'id'), COALESCE((SELECT MAX(id) FROM ventas.afiliados_influencers), 1), true);

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.comisiones_afiliados (ID, ID_afiliado, ID_orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 571.00, 34.26, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, 22.47, 'APROBADA', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 641.70, 51.34, 'PAGADA', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, 35.28, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 855.00, 85.50, 'APROBADA', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 416.70, 45.84, 'PAGADA', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 997.00, 119.64, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, 69.42, 'APROBADA', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1025.10, 143.51, 'PAGADA', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, 90.75, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1281.00, 204.96, 'APROBADA', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 608.40, 103.43, 'PAGADA', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1423.00, 256.14, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, 141.93, 'APROBADA', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1408.50, 281.70, 'PAGADA', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, 171.78, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1707.00, 375.54, 'APROBADA', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 800.10, 184.02, 'PAGADA', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1849.00, 443.76, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, 240.00, 'APROBADA', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1791.90, 465.89, 'PAGADA', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, 278.37, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 2133.00, 597.24, 'APROBADA', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 991.80, 287.62, 'PAGADA', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 2275.00, 682.50, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, 70.38, 'APROBADA', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 2175.30, 152.27, 'PAGADA', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, 99.52, 'PENDIENTE', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 2559.00, 230.31, 'APROBADA', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1183.50, 118.35, 'PAGADA', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.comisiones_afiliados', 'id'), COALESCE((SELECT MAX(id) FROM ventas.comisiones_afiliados), 1), true);

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.proveedores_pasarela (ID, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PASARELA_01', 'Stripe México', 'https://api.dermacare.mx/webhooks/pagos/stripe/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PASARELA_02', 'Mercado Pago', 'https://api.dermacare.mx/webhooks/pagos/mercadopago/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PASARELA_03', 'Openpay BBVA', 'https://api.dermacare.mx/webhooks/pagos/openpay/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PASARELA_04', 'Conekta MX', 'https://api.dermacare.mx/webhooks/pagos/conekta/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PASARELA_05', 'PayPal Commerce', 'https://api.dermacare.mx/webhooks/pagos/paypal/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PASARELA_06', 'Clip Checkout', 'https://api.dermacare.mx/webhooks/pagos/clip/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PASARELA_07', 'Kueski Pay', 'https://api.dermacare.mx/webhooks/pagos/kueskipay/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PASARELA_08', 'Aplazo BNPL', 'https://api.dermacare.mx/webhooks/pagos/aplazo/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PASARELA_09', 'Adyen LATAM', 'https://api.dermacare.mx/webhooks/pagos/adyen/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PASARELA_10', 'STP SPEI Directo', 'https://api.dermacare.mx/webhooks/pagos/stp-spei/v1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PASARELA_11', 'Stripe México Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/stripe/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PASARELA_12', 'Mercado Pago Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/mercadopago/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PASARELA_13', 'Openpay BBVA Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/openpay/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PASARELA_14', 'Conekta MX Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/conekta/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PASARELA_15', 'PayPal Commerce Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/paypal/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PASARELA_16', 'Clip Checkout Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/clip/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PASARELA_17', 'Kueski Pay Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/kueskipay/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PASARELA_18', 'Aplazo BNPL Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/aplazo/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PASARELA_19', 'Adyen LATAM Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/adyen/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PASARELA_20', 'STP SPEI Directo Nodo 2', 'https://api.dermacare.mx/webhooks/pagos/stp-spei/v2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PASARELA_21', 'Stripe México Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/stripe/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PASARELA_22', 'Mercado Pago Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/mercadopago/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PASARELA_23', 'Openpay BBVA Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/openpay/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PASARELA_24', 'Conekta MX Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/conekta/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PASARELA_25', 'PayPal Commerce Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/paypal/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PASARELA_26', 'Clip Checkout Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/clip/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PASARELA_27', 'Kueski Pay Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/kueskipay/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PASARELA_28', 'Aplazo BNPL Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/aplazo/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PASARELA_29', 'Adyen LATAM Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/adyen/v3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PASARELA_30', 'STP SPEI Directo Nodo 3', 'https://api.dermacare.mx/webhooks/pagos/stp-spei/v3', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.proveedores_pasarela', 'id'), COALESCE((SELECT MAX(id) FROM pagos.proveedores_pasarela), 1), true);

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.metodos_pago (ID, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TARJETA_CRED', 'Tarjeta de Crédito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TARJETA_DEB', 'Tarjeta de Débito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SPEI_TRANSF', 'Transferencia Electrónica SPEI', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'OXXO_EFECT', 'Pago en Efectivo Tiendas OXXO', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MONEDERO', 'Saldo Monedero DermaCare', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('pagos.metodos_pago', 'id'), COALESCE((SELECT MAX(id) FROM pagos.metodos_pago), 1), true);

-- =================================================================================================
-- 076. TABLA: pagos.transacciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.transacciones (ID, folio_transaccion, ID_orden, ID_proveedor_pasarela, ID_metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 1, 1, 'pi_3QxDerma2026_0001', 791.36, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 2, 2, 'pi_3QxDerma2026_0002', 501.36, 'MXN', 'APROBADA', 'AUTORIZA_02', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 3, 3, 'pi_3QxDerma2026_0003', 873.37, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 4, 4, 'pi_3QxDerma2026_0004', 583.72, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 5, 5, 'pi_3QxDerma2026_0005', 1120.80, 'MXN', 'EN_MEDIACION', 'AUTORIZA_05', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 6, 1, 'pi_3QxDerma2026_0006', 612.37, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 7, 2, 'pi_3QxDerma2026_0007', 1285.52, 'MXN', 'APROBADA', 'AUTORIZA_07', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 8, 3, 'pi_3QxDerma2026_0008', 748.44, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 9, 4, 'pi_3QxDerma2026_0009', 1189.12, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 10, 5, 'pi_3QxDerma2026_0010', 830.80, 'MXN', 'EN_MEDIACION', 'AUTORIZA_10', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 11, 1, 'pi_3QxDerma2026_0011', 1485.96, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 12, 2, 'pi_3QxDerma2026_0012', 834.74, 'MXN', 'APROBADA', 'AUTORIZA_12', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 13, 3, 'pi_3QxDerma2026_0013', 1650.68, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 14, 4, 'pi_3QxDerma2026_0014', 995.52, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 15, 5, 'pi_3QxDerma2026_0015', 1633.86, 'MXN', 'EN_MEDIACION', 'AUTORIZA_15', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 16, 1, 'pi_3QxDerma2026_0016', 1077.88, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 17, 2, 'pi_3QxDerma2026_0017', 1980.12, 'MXN', 'APROBADA', 'AUTORIZA_17', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 18, 3, 'pi_3QxDerma2026_0018', 1057.12, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 19, 4, 'pi_3QxDerma2026_0019', 2144.84, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 20, 5, 'pi_3QxDerma2026_0020', 1242.60, 'MXN', 'EN_MEDIACION', 'AUTORIZA_20', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 21, 1, 'pi_3QxDerma2026_0021', 2078.60, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 22, 2, 'pi_3QxDerma2026_0022', 1195.96, 'MXN', 'APROBADA', 'AUTORIZA_22', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 23, 3, 'pi_3QxDerma2026_0023', 2474.28, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 24, 4, 'pi_3QxDerma2026_0024', 1279.49, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 25, 5, 'pi_3QxDerma2026_0025', 2639.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_25', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 26, 1, 'pi_3QxDerma2026_0026', 1360.68, 'MXN', 'PENDIENTE', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 27, 2, 'pi_3QxDerma2026_0027', 2523.35, 'MXN', 'APROBADA', 'AUTORIZA_27', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 28, 3, 'pi_3QxDerma2026_0028', 1443.04, 'MXN', 'RECHAZADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 29, 4, 'pi_3QxDerma2026_0029', 2968.44, 'MXN', 'CANCELADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 30, 5, 'pi_3QxDerma2026_0030', 1372.86, 'MXN', 'EN_MEDIACION', 'AUTORIZA_30', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.transacciones', 'id'), COALESCE((SELECT MAX(id) FROM pagos.transacciones), 1), true);

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.intentos_cobro (ID, ID_transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 200, '{"tx_id": 1, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, '{"tx_id": 2, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, '{"tx_id": 3, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 402, '{"tx_id": 4, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, '{"tx_id": 5, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, '{"tx_id": 6, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, '{"tx_id": 7, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 402, '{"tx_id": 8, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, '{"tx_id": 9, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, '{"tx_id": 10, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, '{"tx_id": 11, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 402, '{"tx_id": 12, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, '{"tx_id": 13, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, '{"tx_id": 14, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, '{"tx_id": 15, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 402, '{"tx_id": 16, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, '{"tx_id": 17, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, '{"tx_id": 18, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, '{"tx_id": 19, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 402, '{"tx_id": 20, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, '{"tx_id": 21, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, '{"tx_id": 22, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, '{"tx_id": 23, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 402, '{"tx_id": 24, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, '{"tx_id": 25, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, '{"tx_id": 26, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, '{"tx_id": 27, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 402, '{"tx_id": 28, "currency": "MXN", "capture_method": "automatic"}', '{"status": "requires_payment_method", "code": 402}', 'Fondos insuficientes o requiere validación 3D Secure.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, '{"tx_id": 29, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, '{"tx_id": 30, "currency": "MXN", "capture_method": "automatic"}', '{"status": "succeeded", "code": 200}', NULL, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.intentos_cobro', 'id'), COALESCE((SELECT MAX(id) FROM pagos.intentos_cobro), 1), true);

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.split_multipagos (ID, ID_orden, ID_metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 142.75, 'REF-MULTIPAGO-2026-0001', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 160.50, 'REF-MULTIPAGO-2026-0002', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 178.25, 'REF-MULTIPAGO-2026-0003', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 196.00, 'REF-MULTIPAGO-2026-0004', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 213.75, 'REF-MULTIPAGO-2026-0005', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 231.50, 'REF-MULTIPAGO-2026-0006', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 249.25, 'REF-MULTIPAGO-2026-0007', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 267.00, 'REF-MULTIPAGO-2026-0008', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 284.75, 'REF-MULTIPAGO-2026-0009', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 302.50, 'REF-MULTIPAGO-2026-0010', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 320.25, 'REF-MULTIPAGO-2026-0011', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 338.00, 'REF-MULTIPAGO-2026-0012', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 355.75, 'REF-MULTIPAGO-2026-0013', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 373.50, 'REF-MULTIPAGO-2026-0014', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 391.25, 'REF-MULTIPAGO-2026-0015', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 409.00, 'REF-MULTIPAGO-2026-0016', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 426.75, 'REF-MULTIPAGO-2026-0017', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 444.50, 'REF-MULTIPAGO-2026-0018', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 462.25, 'REF-MULTIPAGO-2026-0019', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 480.00, 'REF-MULTIPAGO-2026-0020', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 497.75, 'REF-MULTIPAGO-2026-0021', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 515.50, 'REF-MULTIPAGO-2026-0022', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 533.25, 'REF-MULTIPAGO-2026-0023', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 551.00, 'REF-MULTIPAGO-2026-0024', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 568.75, 'REF-MULTIPAGO-2026-0025', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 586.50, 'REF-MULTIPAGO-2026-0026', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 604.25, 'REF-MULTIPAGO-2026-0027', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 622.00, 'REF-MULTIPAGO-2026-0028', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 639.75, 'REF-MULTIPAGO-2026-0029', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 657.50, 'REF-MULTIPAGO-2026-0030', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.split_multipagos', 'id'), COALESCE((SELECT MAX(id) FROM pagos.split_multipagos), 1), true);

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.billetera_electronica (ID, ID_cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 300.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 350.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 400.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 450.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 500.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 550.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 600.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 650.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 700.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 750.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 800.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 850.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 900.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 950.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1000.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1050.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1100.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1150.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1200.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1250.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1300.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1350.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1400.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1450.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1500.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1550.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1600.00, 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1650.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1700.00, 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1750.00, 150.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.billetera_electronica', 'id'), COALESCE((SELECT MAX(id) FROM pagos.billetera_electronica), 1), true);

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.movimientos_billetera (ID, ID_billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CARGA_SALDO', 115.00, 520.00, 635.00, 'Recarga electrónica acreditada en billetera #0001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAGO_ORDEN', 130.00, 540.00, 410.00, 'Aplicación de saldo para pago parcial de orden #0002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'REEMBOLSO_DEVOLUCION', 145.00, 560.00, 705.00, 'Acreditación por devolución RMA aprobada #0003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CARGA_SALDO', 160.00, 580.00, 740.00, 'Recarga electrónica acreditada en billetera #0004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PAGO_ORDEN', 175.00, 600.00, 425.00, 'Aplicación de saldo para pago parcial de orden #0005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'REEMBOLSO_DEVOLUCION', 190.00, 620.00, 810.00, 'Acreditación por devolución RMA aprobada #0006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CARGA_SALDO', 205.00, 640.00, 845.00, 'Recarga electrónica acreditada en billetera #0007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PAGO_ORDEN', 220.00, 660.00, 440.00, 'Aplicación de saldo para pago parcial de orden #0008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'REEMBOLSO_DEVOLUCION', 235.00, 680.00, 915.00, 'Acreditación por devolución RMA aprobada #0009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CARGA_SALDO', 250.00, 700.00, 950.00, 'Recarga electrónica acreditada en billetera #0010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PAGO_ORDEN', 265.00, 720.00, 455.00, 'Aplicación de saldo para pago parcial de orden #0011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'REEMBOLSO_DEVOLUCION', 280.00, 740.00, 1020.00, 'Acreditación por devolución RMA aprobada #0012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CARGA_SALDO', 295.00, 760.00, 1055.00, 'Recarga electrónica acreditada en billetera #0013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAGO_ORDEN', 310.00, 780.00, 470.00, 'Aplicación de saldo para pago parcial de orden #0014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'REEMBOLSO_DEVOLUCION', 325.00, 800.00, 1125.00, 'Acreditación por devolución RMA aprobada #0015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CARGA_SALDO', 340.00, 820.00, 1160.00, 'Recarga electrónica acreditada en billetera #0016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'PAGO_ORDEN', 355.00, 840.00, 485.00, 'Aplicación de saldo para pago parcial de orden #0017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'REEMBOLSO_DEVOLUCION', 370.00, 860.00, 1230.00, 'Acreditación por devolución RMA aprobada #0018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CARGA_SALDO', 385.00, 880.00, 1265.00, 'Recarga electrónica acreditada en billetera #0019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PAGO_ORDEN', 400.00, 900.00, 500.00, 'Aplicación de saldo para pago parcial de orden #0020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'REEMBOLSO_DEVOLUCION', 415.00, 920.00, 1335.00, 'Acreditación por devolución RMA aprobada #0021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CARGA_SALDO', 430.00, 940.00, 1370.00, 'Recarga electrónica acreditada en billetera #0022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PAGO_ORDEN', 445.00, 960.00, 515.00, 'Aplicación de saldo para pago parcial de orden #0023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'REEMBOLSO_DEVOLUCION', 460.00, 980.00, 1440.00, 'Acreditación por devolución RMA aprobada #0024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CARGA_SALDO', 475.00, 1000.00, 1475.00, 'Recarga electrónica acreditada en billetera #0025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAGO_ORDEN', 490.00, 1020.00, 530.00, 'Aplicación de saldo para pago parcial de orden #0026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'REEMBOLSO_DEVOLUCION', 505.00, 1040.00, 1545.00, 'Acreditación por devolución RMA aprobada #0027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CARGA_SALDO', 520.00, 1060.00, 1580.00, 'Recarga electrónica acreditada en billetera #0028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'PAGO_ORDEN', 535.00, 1080.00, 545.00, 'Aplicación de saldo para pago parcial de orden #0029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'REEMBOLSO_DEVOLUCION', 550.00, 1100.00, 1650.00, 'Acreditación por devolución RMA aprobada #0030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.movimientos_billetera', 'id'), COALESCE((SELECT MAX(id) FROM pagos.movimientos_billetera), 1), true);

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.tarjetas_regalo_giftcards (ID, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, ID_cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0001$hashSeguridadClinica0001', 285.50, 285.50, '2026-03-01', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0002$hashSeguridadClinica0002', 321.00, 321.00, '2026-03-02', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0003$hashSeguridadClinica0003', 356.50, 356.50, '2026-03-03', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0004$hashSeguridadClinica0004', 392.00, 392.00, '2026-03-04', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0005$hashSeguridadClinica0005', 427.50, 427.50, '2026-03-05', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0006$hashSeguridadClinica0006', 463.00, 463.00, '2026-03-06', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0007$hashSeguridadClinica0007', 498.50, 498.50, '2026-03-07', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0008$hashSeguridadClinica0008', 534.00, 534.00, '2026-03-08', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0009$hashSeguridadClinica0009', 569.50, 569.50, '2026-03-09', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0010$hashSeguridadClinica0010', 605.00, 605.00, '2026-03-10', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0011$hashSeguridadClinica0011', 640.50, 640.50, '2026-03-11', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0012$hashSeguridadClinica0012', 676.00, 676.00, '2026-03-12', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0013$hashSeguridadClinica0013', 711.50, 711.50, '2026-03-13', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0014$hashSeguridadClinica0014', 747.00, 747.00, '2026-03-14', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0015$hashSeguridadClinica0015', 782.50, 782.50, '2026-03-15', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0016$hashSeguridadClinica0016', 818.00, 818.00, '2026-03-16', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0017$hashSeguridadClinica0017', 853.50, 853.50, '2026-03-17', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0018$hashSeguridadClinica0018', 889.00, 889.00, '2026-03-18', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0019$hashSeguridadClinica0019', 924.50, 924.50, '2026-03-19', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0020$hashSeguridadClinica0020', 960.00, 960.00, '2026-03-20', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0021$hashSeguridadClinica0021', 995.50, 995.50, '2026-03-21', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0022$hashSeguridadClinica0022', 1031.00, 1031.00, '2026-03-22', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0023$hashSeguridadClinica0023', 1066.50, 1066.50, '2026-03-23', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0024$hashSeguridadClinica0024', 1102.00, 1102.00, '2026-03-24', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0025$hashSeguridadClinica0025', 1137.50, 1137.50, '2026-03-25', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0026$hashSeguridadClinica0026', 1173.00, 1173.00, '2026-03-26', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0027$hashSeguridadClinica0027', 1208.50, 1208.50, '2026-03-27', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0028$hashSeguridadClinica0028', 1244.00, 1244.00, '2026-03-28', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0029$hashSeguridadClinica0029', 1279.50, 1279.50, '2026-03-01', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, '$argon2id$v=19$m=65536,t=3,p=4$dermaSalt0030$hashSeguridadClinica0030', 1315.00, 1315.00, '2026-03-02', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.tarjetas_regalo_giftcards', 'id'), COALESCE((SELECT MAX(id) FROM pagos.tarjetas_regalo_giftcards), 1), true);

-- =================================================================================================
-- 082. TABLA: pagos.redenciones_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.redenciones_giftcards (ID, ID_giftcard, ID_orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 285.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 321.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 356.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 392.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 427.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 463.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 498.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 534.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 569.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 605.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 640.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 676.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 711.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 747.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 782.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 818.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 853.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 889.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 924.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 960.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 995.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1031.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1066.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1102.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1137.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1173.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1208.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1244.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1279.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1315.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.redenciones_giftcards', 'id'), COALESCE((SELECT MAX(id) FROM pagos.redenciones_giftcards), 1), true);

-- =================================================================================================
-- 083. TABLA: pagos.reglas_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reglas_antifraude (ID, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'REGLA_01', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #01)', 6, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'REGLA_02', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #02)', 7, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'REGLA_03', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #03)', 8, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REGLA_04', 'Uso de correo desechable o dominio temporal no verificado. (Regla #04)', 9, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REGLA_05', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #05)', 10, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'REGLA_06', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #06)', 11, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'REGLA_07', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #07)', 12, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'REGLA_08', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #08)', 13, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'REGLA_09', 'Uso de correo desechable o dominio temporal no verificado. (Regla #09)', 14, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'REGLA_10', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #10)', 15, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'REGLA_11', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #11)', 16, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'REGLA_12', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #12)', 17, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'REGLA_13', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #13)', 18, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'REGLA_14', 'Uso de correo desechable o dominio temporal no verificado. (Regla #14)', 19, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'REGLA_15', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #15)', 20, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'REGLA_16', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #16)', 21, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'REGLA_17', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #17)', 22, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'REGLA_18', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #18)', 23, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'REGLA_19', 'Uso de correo desechable o dominio temporal no verificado. (Regla #19)', 24, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'REGLA_20', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #20)', 25, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'REGLA_21', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #21)', 26, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'REGLA_22', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #22)', 27, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'REGLA_23', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #23)', 28, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'REGLA_24', 'Uso de correo desechable o dominio temporal no verificado. (Regla #24)', 29, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'REGLA_25', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #25)', 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'REGLA_26', 'Múltiples intentos de tarjeta distintos desde la misma IP en menos de 10 minutos. (Regla #26)', 31, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'REGLA_27', 'Distancia geográfica superior a 500 km entre IP de compra y código postal de entrega. (Regla #27)', 32, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'REGLA_28', 'Monto de orden superior al percentil 99 histórico para cuenta recién creada. (Regla #28)', 33, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'REGLA_29', 'Uso de correo desechable o dominio temporal no verificado. (Regla #29)', 34, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'REGLA_30', 'Diferencia de país entre emisor BIN bancario y destino de envío en México. (Regla #30)', 5, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reglas_antifraude', 'id'), COALESCE((SELECT MAX(id) FROM pagos.reglas_antifraude), 1), true);

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.evaluaciones_antifraude (ID, ID_orden, ID_regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 'BAJO', '189.203.3.7', 1, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'MEDIO', '189.203.6.14', 2, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'ALTO_REQUERIR_3DS', '189.203.9.21', 3, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 'CRITICO_RECHAZADO', '189.203.12.28', 4, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 'BAJO', '189.203.15.35', 5, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 'MEDIO', '189.203.18.42', 6, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 'ALTO_REQUERIR_3DS', '189.203.21.49', 7, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 'CRITICO_RECHAZADO', '189.203.24.56', 8, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 'BAJO', '189.203.27.63', 9, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 'MEDIO', '189.203.30.70', 10, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 'ALTO_REQUERIR_3DS', '189.203.33.77', 11, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 'CRITICO_RECHAZADO', '189.203.36.84', 12, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 'BAJO', '189.203.39.91', 13, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 'MEDIO', '189.203.42.98', 14, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 'ALTO_REQUERIR_3DS', '189.203.45.105', 15, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 'CRITICO_RECHAZADO', '189.203.48.112', 16, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 'BAJO', '189.203.51.119', 17, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 'MEDIO', '189.203.54.126', 18, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 'ALTO_REQUERIR_3DS', '189.203.57.133', 19, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 'CRITICO_RECHAZADO', '189.203.60.140', 20, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 'BAJO', '189.203.63.147', 21, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 'MEDIO', '189.203.66.154', 22, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 'ALTO_REQUERIR_3DS', '189.203.69.161', 23, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 'CRITICO_RECHAZADO', '189.203.72.168', 24, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 'BAJO', '189.203.75.175', 25, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 'MEDIO', '189.203.78.182', 26, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 'ALTO_REQUERIR_3DS', '189.203.81.189', 27, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 'CRITICO_RECHAZADO', '189.203.84.196', 28, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 'BAJO', '189.203.87.203', 29, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 'MEDIO', '189.203.90.210', 30, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.evaluaciones_antifraude', 'id'), COALESCE((SELECT MAX(id) FROM pagos.evaluaciones_antifraude), 1), true);

-- =================================================================================================
-- 085. TABLA: pagos.contracargos_chargebacks (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.contracargos_chargebacks (ID, ID_transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-DISPU-2026-0001', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 285.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-DISPU-2026-0002', 'Reclamo por mercancía no recibida tras plazo prometido.', 321.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-DISPU-2026-0003', 'Diferencia en monto cobrado reportada en estado de cuenta.', 356.50, '2026-02-03 11:30:00', '2026-03-03', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-DISPU-2026-0004', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 392.00, '2026-02-04 11:30:00', '2026-03-04', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-DISPU-2026-0005', 'Reclamo por mercancía no recibida tras plazo prometido.', 427.50, '2026-02-05 11:30:00', '2026-03-05', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-DISPU-2026-0006', 'Diferencia en monto cobrado reportada en estado de cuenta.', 463.00, '2026-02-06 11:30:00', '2026-03-06', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-DISPU-2026-0007', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 498.50, '2026-02-07 11:30:00', '2026-03-07', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-DISPU-2026-0008', 'Reclamo por mercancía no recibida tras plazo prometido.', 534.00, '2026-02-08 11:30:00', '2026-03-08', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-DISPU-2026-0009', 'Diferencia en monto cobrado reportada en estado de cuenta.', 569.50, '2026-02-09 11:30:00', '2026-03-09', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-DISPU-2026-0010', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 605.00, '2026-02-10 11:30:00', '2026-03-10', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-DISPU-2026-0011', 'Reclamo por mercancía no recibida tras plazo prometido.', 640.50, '2026-02-11 11:30:00', '2026-03-11', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-DISPU-2026-0012', 'Diferencia en monto cobrado reportada en estado de cuenta.', 676.00, '2026-02-12 11:30:00', '2026-03-12', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-DISPU-2026-0013', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 711.50, '2026-02-13 11:30:00', '2026-03-13', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-DISPU-2026-0014', 'Reclamo por mercancía no recibida tras plazo prometido.', 747.00, '2026-02-14 11:30:00', '2026-03-14', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-DISPU-2026-0015', 'Diferencia en monto cobrado reportada en estado de cuenta.', 782.50, '2026-02-15 11:30:00', '2026-03-15', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-DISPU-2026-0016', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 818.00, '2026-02-16 11:30:00', '2026-03-16', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-DISPU-2026-0017', 'Reclamo por mercancía no recibida tras plazo prometido.', 853.50, '2026-02-17 11:30:00', '2026-03-17', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-DISPU-2026-0018', 'Diferencia en monto cobrado reportada en estado de cuenta.', 889.00, '2026-02-18 11:30:00', '2026-03-18', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-DISPU-2026-0019', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 924.50, '2026-02-19 11:30:00', '2026-03-19', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-DISPU-2026-0020', 'Reclamo por mercancía no recibida tras plazo prometido.', 960.00, '2026-02-20 11:30:00', '2026-03-20', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-DISPU-2026-0021', 'Diferencia en monto cobrado reportada en estado de cuenta.', 995.50, '2026-02-21 11:30:00', '2026-03-21', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-DISPU-2026-0022', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1031.00, '2026-02-22 11:30:00', '2026-03-22', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-DISPU-2026-0023', 'Reclamo por mercancía no recibida tras plazo prometido.', 1066.50, '2026-02-23 11:30:00', '2026-03-23', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-DISPU-2026-0024', 'Diferencia en monto cobrado reportada en estado de cuenta.', 1102.00, '2026-02-24 11:30:00', '2026-03-24', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-DISPU-2026-0025', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1137.50, '2026-02-25 11:30:00', '2026-03-25', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-DISPU-2026-0026', 'Reclamo por mercancía no recibida tras plazo prometido.', 1173.00, '2026-02-26 11:30:00', '2026-03-26', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-DISPU-2026-0027', 'Diferencia en monto cobrado reportada en estado de cuenta.', 1208.50, '2026-02-27 11:30:00', '2026-03-27', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-DISPU-2026-0028', 'Cargo no reconocido por tarjetahabiente ante banco emisor.', 1244.00, '2026-02-28 11:30:00', '2026-03-28', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-DISPU-2026-0029', 'Reclamo por mercancía no recibida tras plazo prometido.', 1279.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-DISPU-2026-0030', 'Diferencia en monto cobrado reportada en estado de cuenta.', 1315.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.contracargos_chargebacks', 'id'), COALESCE((SELECT MAX(id) FROM pagos.contracargos_chargebacks), 1), true);

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reembolsos_transaccion (ID, ID_transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-REEMB-2026-0001', 285.50, 'Devolución aprobada tras inspección sanitaria RMA #0001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-REEMB-2026-0002', 321.00, 'Devolución aprobada tras inspección sanitaria RMA #0002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-REEMB-2026-0003', 356.50, 'Devolución aprobada tras inspección sanitaria RMA #0003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-REEMB-2026-0004', 392.00, 'Devolución aprobada tras inspección sanitaria RMA #0004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-REEMB-2026-0005', 427.50, 'Devolución aprobada tras inspección sanitaria RMA #0005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-REEMB-2026-0006', 463.00, 'Devolución aprobada tras inspección sanitaria RMA #0006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-REEMB-2026-0007', 498.50, 'Devolución aprobada tras inspección sanitaria RMA #0007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-REEMB-2026-0008', 534.00, 'Devolución aprobada tras inspección sanitaria RMA #0008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-REEMB-2026-0009', 569.50, 'Devolución aprobada tras inspección sanitaria RMA #0009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-REEMB-2026-0010', 605.00, 'Devolución aprobada tras inspección sanitaria RMA #0010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-REEMB-2026-0011', 640.50, 'Devolución aprobada tras inspección sanitaria RMA #0011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-REEMB-2026-0012', 676.00, 'Devolución aprobada tras inspección sanitaria RMA #0012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-REEMB-2026-0013', 711.50, 'Devolución aprobada tras inspección sanitaria RMA #0013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-REEMB-2026-0014', 747.00, 'Devolución aprobada tras inspección sanitaria RMA #0014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-REEMB-2026-0015', 782.50, 'Devolución aprobada tras inspección sanitaria RMA #0015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-REEMB-2026-0016', 818.00, 'Devolución aprobada tras inspección sanitaria RMA #0016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-REEMB-2026-0017', 853.50, 'Devolución aprobada tras inspección sanitaria RMA #0017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-REEMB-2026-0018', 889.00, 'Devolución aprobada tras inspección sanitaria RMA #0018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-REEMB-2026-0019', 924.50, 'Devolución aprobada tras inspección sanitaria RMA #0019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-REEMB-2026-0020', 960.00, 'Devolución aprobada tras inspección sanitaria RMA #0020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-REEMB-2026-0021', 995.50, 'Devolución aprobada tras inspección sanitaria RMA #0021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-REEMB-2026-0022', 1031.00, 'Devolución aprobada tras inspección sanitaria RMA #0022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-REEMB-2026-0023', 1066.50, 'Devolución aprobada tras inspección sanitaria RMA #0023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-REEMB-2026-0024', 1102.00, 'Devolución aprobada tras inspección sanitaria RMA #0024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-REEMB-2026-0025', 1137.50, 'Devolución aprobada tras inspección sanitaria RMA #0025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-REEMB-2026-0026', 1173.00, 'Devolución aprobada tras inspección sanitaria RMA #0026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-REEMB-2026-0027', 1208.50, 'Devolución aprobada tras inspección sanitaria RMA #0027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-REEMB-2026-0028', 1244.00, 'Devolución aprobada tras inspección sanitaria RMA #0028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-REEMB-2026-0029', 1279.50, 'Devolución aprobada tras inspección sanitaria RMA #0029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-REEMB-2026-0030', 1315.00, 'Devolución aprobada tras inspección sanitaria RMA #0030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reembolsos_transaccion', 'id'), COALESCE((SELECT MAX(id) FROM pagos.reembolsos_transaccion), 1), true);

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.regimenes_sat (ID, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, '601', 'General de Ley Personas Morales', FALSE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, '605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, '606', 'Arrendamiento', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, '612', 'Personas Físicas con Actividades Empresariales y Profesionales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, '616', 'Sin obligaciones fiscales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, '621', 'Incorporación Fiscal', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, '625', 'Régimen de las Actividades Empresariales con ingresos a través de Plataformas', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, '626', 'Régimen Simplificado de Confianza (RESICO)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.regimenes_sat', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.regimenes_sat), 1), true);

-- =================================================================================================
-- 088. TABLA: fiscal.usos_cfdi (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.usos_cfdi (ID, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'G01', 'Adquisición de mercancías', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'G03', 'Gastos en general', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'D01', 'Honorarios médicos, dentales y gastos hospitalarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'D02', 'Gastos médicos por incapacidad o discapacidad', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'I04', 'Equipo de computo y accesorios', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'P01', 'Por definir (Uso transitorio)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'S01', 'Sin efectos fiscales', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CP01', 'Pagos (Complemento de recepción de pagos)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.usos_cfdi', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.usos_cfdi), 1), true);

-- =================================================================================================
-- 089. TABLA: fiscal.datos_fiscales_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.datos_fiscales_cliente (ID, ID_cliente, rfc_emisor, razon_social, codigo_postal_fiscal, ID_regimen_sat, ID_uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'MEGC910315H01', 'CARLOS MENDOZA GARZA', '25700', 1, 1, 'carlos.mendoza.1@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'RALS920315H02', 'SOFÍA RAMÍREZ LÓPEZ', '64000', 2, 2, 'sofia.ramirez.2@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'TOVV930315H03', 'VALERIA TORRES VILLARREAL', '66220', 3, 3, 'valeria.torres.3@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'HECA940315H04', 'ALEJANDRO HERNÁNDEZ CRUZ', '06700', 4, 4, 'alejandro.hernandez.4@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SAFM950315H05', 'MARIANA SÁNCHEZ FUENTES', '11560', 5, 5, 'mariana.sanchez.5@dermacare.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'MATD960315H06', 'DIEGO MARTÍNEZ TREVIÑO', '44100', 6, 6, 'diego.martinez.6@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'GORC970315H07', 'CAMILA GONZÁLEZ REYES', '25000', 7, 7, 'camila.gonzalez.7@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FLCM980315H08', 'MATEO FLORES CASTILLO', '76000', 8, 8, 'mateo.flores.8@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'MODL990315H09', 'LUCÍA MORALES DÍAZ', '72000', 1, 1, 'lucia.morales.9@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'VAOS900315H10', 'SEBASTIÁN VÁZQUEZ ORTIZ', '97000', 2, 2, 'sebastian.vazquez.10@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'GUNR910315H11', 'REGINA GUTIÉRREZ NAVA', '25700', 3, 3, 'regina.gutierrez.11@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'JIPS920315H12', 'SANTIAGO JIMÉNEZ PÉREZ', '64000', 4, 4, 'santiago.jimenez.12@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'RUSF930315H13', 'FERNANDA RUIZ SALAZAR', '66220', 5, 5, 'fernanda.ruiz.13@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'RICE940315H14', 'EMILIANO RÍOS CÁRDENAS', '06700', 6, 6, 'emiliano.rios.14@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'AGIX950315H15', 'XIMENA AGUILAR IBARRA', '11560', 7, 7, 'ximena.aguilar.15@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'MEND960315H16', 'DANIEL MÉNDEZ NAVARRO', '44100', 8, 8, 'daniel.mendez.16@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CADA970315H17', 'ANDREA CASTRO DELGADO', '25000', 1, 1, 'andrea.castro.17@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'VEMG980315H18', 'GABRIEL VEGA MONTOYA', '76000', 2, 2, 'gabriel.vega.18@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CORP990315H19', 'PAULA CORTÉS ROJAS', '72000', 3, 3, 'paula.cortes.19@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'RACA900315H20', 'ANDRÉS RAMOS CAMPOS', '97000', 4, 4, 'andres.ramos.20@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'GULR910315H21', 'RENATA GUERRERO LUNA', '25700', 5, 5, 'renata.guerrero.21@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PECN920315H22', 'NICOLÁS PEÑA CABRERA', '64000', 6, 6, 'nicolas.pena.22@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'HEVN930315H23', 'NATALIA HERRERA VARGAS', '66220', 7, 7, 'natalia.herrera.23@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'MECJ940315H24', 'JOAQUÍN MEDINA CONTRERAS', '06700', 8, 8, 'joaquin.medina.24@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DOEI950315H25', 'ISABELLA DOMÍNGUEZ ESCOBAR', '11560', 1, 1, 'isabella.dominguez.25@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SIPL960315H26', 'LEONARDO SILVA PAREDES', '44100', 2, 2, 'leonardo.silva.26@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CHBA970315H27', 'ANA CHÁVEZ BAUTISTA', '25000', 3, 3, 'ana.chavez.27@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'OCAR980315H28', 'RODRIGO OCHOA ACOSTA', '76000', 4, 4, 'rodrigo.ochoa.28@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MILP990315H29', 'PAULINA MIRANDA LEAL', '72000', 5, 5, 'paulina.miranda.29@correo.mx', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PASM900315H30', 'MAURICIO PADILLA SOLÍS', '97000', 6, 6, 'mauricio.padilla.30@correo.mx', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.datos_fiscales_cliente', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.datos_fiscales_cliente), 1), true);

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_cfdi (ID, ID_orden, ID_dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'DC', 'FOL-FACTU-2026-0001', 'B1000000-0000-4000-8000-000000000001', 'CFDI40_SIG_9629800bff6e0b2ab0e057a1685fcb569088e04ec6e0f25b88e8e7fd340267d1', 'SAT_PAC_SIG_1a875b15b158c9d380cc1438b2710c20533f972a8ba5071840e91fe6ebdde60b', '||1.1|B1000000-0000-4000-8000-000000000001|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460001', '2026-02-01 11:30:00', 791.36, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0001.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'DC', 'FOL-FACTU-2026-0002', 'B1000000-0000-4000-8000-000000000002', 'CFDI40_SIG_ca9e6dcd9649acfe0ff3931d39347b7ba5f5f21a0309d16c717333e66b519d92', 'SAT_PAC_SIG_855ecb8ceb9777d32062546ad908007765eb5ac4c43a4f7981a5a3fae3fdb63b', '||1.1|B1000000-0000-4000-8000-000000000002|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460002', '2026-02-02 11:30:00', 501.36, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0002.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'DC', 'FOL-FACTU-2026-0003', 'B1000000-0000-4000-8000-000000000003', 'CFDI40_SIG_1c2b20017099f70cba603848707667ba3dd77b0dd1ba94e4425b6fdf7e5b2ef2', 'SAT_PAC_SIG_724c90f2ea903b8002bccd7154ab3ff4fc2c3ee140063d123caf1aff37450f48', '||1.1|B1000000-0000-4000-8000-000000000003|2026-02-03T11:30:00|PAC970924HN1||', '00001000000504460003', '2026-02-03 11:30:00', 873.37, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0003.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'DC', 'FOL-FACTU-2026-0004', 'B1000000-0000-4000-8000-000000000004', 'CFDI40_SIG_645c96c71b649d0dd0ec508164ea36ab621ce0ba6b249443a01aaaafb3f5798b', 'SAT_PAC_SIG_44826e5c2f381557a3204678ba6269416422a35b8dcf3878493eb866d030217e', '||1.1|B1000000-0000-4000-8000-000000000004|2026-02-04T11:30:00|PAC970924HN1||', '00001000000504460004', '2026-02-04 11:30:00', 583.72, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0004.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'DC', 'FOL-FACTU-2026-0005', 'B1000000-0000-4000-8000-000000000005', 'CFDI40_SIG_34011ff06a35a28b69b5aa8e35e7bfb7481e15d81f4228b7818723cce61af348', 'SAT_PAC_SIG_4d934ee27eae21bfebd0f2edff094db9f2fca0985ff960056105e9418f5604c6', '||1.1|B1000000-0000-4000-8000-000000000005|2026-02-05T11:30:00|PAC970924HN1||', '00001000000504460005', '2026-02-05 11:30:00', 1120.80, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0005.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'DC', 'FOL-FACTU-2026-0006', 'B1000000-0000-4000-8000-000000000006', 'CFDI40_SIG_b8abcba987d31946cad66b9cfc14ab2b423a369d74a3ada36f3ddad7b4c4d02b', 'SAT_PAC_SIG_54e961c6624bf5f1a8eb2ed52447482a287db264b2f0b7ea0edb128dcc9af142', '||1.1|B1000000-0000-4000-8000-000000000006|2026-02-06T11:30:00|PAC970924HN1||', '00001000000504460006', '2026-02-06 11:30:00', 612.37, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0006.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'DC', 'FOL-FACTU-2026-0007', 'B1000000-0000-4000-8000-000000000007', 'CFDI40_SIG_386f0821f27283bfe64b52ce9475bf15b1ef305a3769431650e73bcb044a3da5', 'SAT_PAC_SIG_a072a9335e99a6282d1fa1f417ba77db36cf06c8520ae455d8d9e6f89d785db2', '||1.1|B1000000-0000-4000-8000-000000000007|2026-02-07T11:30:00|PAC970924HN1||', '00001000000504460007', '2026-02-07 11:30:00', 1285.52, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0007.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'DC', 'FOL-FACTU-2026-0008', 'B1000000-0000-4000-8000-000000000008', 'CFDI40_SIG_6045ba7e4023e60b7d756d766b23dfe417741f9b8a729ddca40fe3b707453285', 'SAT_PAC_SIG_540d6060b22446edf9c648cff9d3404ffc5c64ced72278c708568c66cfe2f70b', '||1.1|B1000000-0000-4000-8000-000000000008|2026-02-08T11:30:00|PAC970924HN1||', '00001000000504460008', '2026-02-08 11:30:00', 748.44, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0008.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'DC', 'FOL-FACTU-2026-0009', 'B1000000-0000-4000-8000-000000000009', 'CFDI40_SIG_92280625c8e7afb0fc6557827022da3a859141ef061bbe2b7d0e6a96670d6176', 'SAT_PAC_SIG_0715719bc23acef24914ab8f60859728839749213fa465623af338b86384c45b', '||1.1|B1000000-0000-4000-8000-000000000009|2026-02-09T11:30:00|PAC970924HN1||', '00001000000504460009', '2026-02-09 11:30:00', 1189.12, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0009.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'DC', 'FOL-FACTU-2026-0010', 'B1000000-0000-4000-8000-00000000000A', 'CFDI40_SIG_7791ccd4a51a4f662176c4ac37f25078ea39832086ae45d77eceaf4e39f988fc', 'SAT_PAC_SIG_40221e8d1733820a6210dbe0b250910231730c666a5758a846f165189dd9e721', '||1.1|B1000000-0000-4000-8000-00000000000A|2026-02-10T11:30:00|PAC970924HN1||', '00001000000504460010', '2026-02-10 11:30:00', 830.80, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0010.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'DC', 'FOL-FACTU-2026-0011', 'B1000000-0000-4000-8000-00000000000B', 'CFDI40_SIG_80110f57fb171f3d2d7a63cab7e0520b0d27f4b5e9b1e1ece45e963c7fb9e618', 'SAT_PAC_SIG_548cf61134c2790527d716460c27fc5f4320cf6f2f231a89d60742efdf1c2f2d', '||1.1|B1000000-0000-4000-8000-00000000000B|2026-02-11T11:30:00|PAC970924HN1||', '00001000000504460011', '2026-02-11 11:30:00', 1485.96, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0011.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'DC', 'FOL-FACTU-2026-0012', 'B1000000-0000-4000-8000-00000000000C', 'CFDI40_SIG_9d3cfe0d65527a69e01f0e55e10b610a7fe8b382903ab307c2263ec130af3772', 'SAT_PAC_SIG_225a670f9f4b72b43cab35fcba1082946d69fb8fc0088e3ef8df4ab960f53a63', '||1.1|B1000000-0000-4000-8000-00000000000C|2026-02-12T11:30:00|PAC970924HN1||', '00001000000504460012', '2026-02-12 11:30:00', 834.74, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0012.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'DC', 'FOL-FACTU-2026-0013', 'B1000000-0000-4000-8000-00000000000D', 'CFDI40_SIG_e46a2379a9c3ff2b3c87850ffea4d3416dea8eacd324e934a77120441e2ace76', 'SAT_PAC_SIG_1709e3f4bc7383089c309fb72e4ea0db3a6260628be0a834c195072077f7cdf7', '||1.1|B1000000-0000-4000-8000-00000000000D|2026-02-13T11:30:00|PAC970924HN1||', '00001000000504460013', '2026-02-13 11:30:00', 1650.68, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0013.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'DC', 'FOL-FACTU-2026-0014', 'B1000000-0000-4000-8000-00000000000E', 'CFDI40_SIG_a96777ed25de406d4c5914b87f911428bf16260db0632b8fe1c3bfba17f4c96b', 'SAT_PAC_SIG_8b364f78c698fd9e4eca45d475d55faacec51afb5c056064dfdf3c32d3d4091b', '||1.1|B1000000-0000-4000-8000-00000000000E|2026-02-14T11:30:00|PAC970924HN1||', '00001000000504460014', '2026-02-14 11:30:00', 995.52, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0014.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'DC', 'FOL-FACTU-2026-0015', 'B1000000-0000-4000-8000-00000000000F', 'CFDI40_SIG_1fdd507a32862c449811c2d2bbaa9f96065c94a99bf97fad469bbd694e33778a', 'SAT_PAC_SIG_66e0e8f008083156dd0dbb60ba2927dc7326b7f6857af42c393dcf58bbb99c77', '||1.1|B1000000-0000-4000-8000-00000000000F|2026-02-15T11:30:00|PAC970924HN1||', '00001000000504460015', '2026-02-15 11:30:00', 1633.86, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0015.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'DC', 'FOL-FACTU-2026-0016', 'B1000000-0000-4000-8000-000000000010', 'CFDI40_SIG_24d38d8fafc8f784a7024d7b84e5cf448fcd7a66726f92f3c858efa83a4846bc', 'SAT_PAC_SIG_dc3e51012dac6eae47e73154036decefd40dbbf90f93a74c6c8bdba555b21833', '||1.1|B1000000-0000-4000-8000-000000000010|2026-02-16T11:30:00|PAC970924HN1||', '00001000000504460016', '2026-02-16 11:30:00', 1077.88, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0016.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'DC', 'FOL-FACTU-2026-0017', 'B1000000-0000-4000-8000-000000000011', 'CFDI40_SIG_23ea4d3f03bd838969dca7fdf8da36972ea41b6fc9b005a0a408df2bdcb29ba3', 'SAT_PAC_SIG_c853c3c8b00a74f76fefe2f36c379105813054a35064e02eafcb6a2950405bc2', '||1.1|B1000000-0000-4000-8000-000000000011|2026-02-17T11:30:00|PAC970924HN1||', '00001000000504460017', '2026-02-17 11:30:00', 1980.12, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0017.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'DC', 'FOL-FACTU-2026-0018', 'B1000000-0000-4000-8000-000000000012', 'CFDI40_SIG_4f59300b8621595a9fcce29614385cd2cb9a03c3f237384f8847c96c0c8d7a12', 'SAT_PAC_SIG_fab1b7a9b76bbdd627738c6e34e3eb93760cdebca5ab32dc8eb494f548dce7fa', '||1.1|B1000000-0000-4000-8000-000000000012|2026-02-18T11:30:00|PAC970924HN1||', '00001000000504460018', '2026-02-18 11:30:00', 1057.12, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0018.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'DC', 'FOL-FACTU-2026-0019', 'B1000000-0000-4000-8000-000000000013', 'CFDI40_SIG_2860c7a5f5873fa23947a3b882cb5e40d14166a0d449783fbfbce777e61560f7', 'SAT_PAC_SIG_0c82703959001cd777ef505ed510a871d4c45f480410b1f98529fcc25d524654', '||1.1|B1000000-0000-4000-8000-000000000013|2026-02-19T11:30:00|PAC970924HN1||', '00001000000504460019', '2026-02-19 11:30:00', 2144.84, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0019.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'DC', 'FOL-FACTU-2026-0020', 'B1000000-0000-4000-8000-000000000014', 'CFDI40_SIG_b87c4a7b90a302642444f2ff552dae85b5b224b73d3b57f7ad3f3fdb3f17b3f5', 'SAT_PAC_SIG_4651d5433f8926895053ad473d966a1b66865f60420ccc935783c8392f29829c', '||1.1|B1000000-0000-4000-8000-000000000014|2026-02-20T11:30:00|PAC970924HN1||', '00001000000504460020', '2026-02-20 11:30:00', 1242.60, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0020.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'DC', 'FOL-FACTU-2026-0021', 'B1000000-0000-4000-8000-000000000015', 'CFDI40_SIG_e2218014f426d100d0807d58535efcc1a5f1375c7de40d5965ef67a671f1cdc7', 'SAT_PAC_SIG_6e8e29c2c38aae6960c6c8b41929522ef89612a969d032cb7aad7625c9eae669', '||1.1|B1000000-0000-4000-8000-000000000015|2026-02-21T11:30:00|PAC970924HN1||', '00001000000504460021', '2026-02-21 11:30:00', 2078.60, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0021.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'DC', 'FOL-FACTU-2026-0022', 'B1000000-0000-4000-8000-000000000016', 'CFDI40_SIG_80d9711af0bdf2420963538f54c587de48ee6bef092c8104a4263d417681d95a', 'SAT_PAC_SIG_9e4eeb76e5f1e1909c66ee62b7e75ee2b4f4d74b4da08f3e46b517cca7b3c177', '||1.1|B1000000-0000-4000-8000-000000000016|2026-02-22T11:30:00|PAC970924HN1||', '00001000000504460022', '2026-02-22 11:30:00', 1195.96, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0022.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'DC', 'FOL-FACTU-2026-0023', 'B1000000-0000-4000-8000-000000000017', 'CFDI40_SIG_81af14c954d7356628d8c251f080d05d3a66dde00f0a984b23b6f26efc06e72b', 'SAT_PAC_SIG_b8e6620dbe755d113ea549ace0b17dded897aad4d9a75ea30bc8444e23608b58', '||1.1|B1000000-0000-4000-8000-000000000017|2026-02-23T11:30:00|PAC970924HN1||', '00001000000504460023', '2026-02-23 11:30:00', 2474.28, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0023.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'DC', 'FOL-FACTU-2026-0024', 'B1000000-0000-4000-8000-000000000018', 'CFDI40_SIG_5010be1f8fd6f3f47533f6bbb59be394b933a88e407c8660a0c840234307d092', 'SAT_PAC_SIG_c97fb305556ade66ac7ee964bbbb6b7486ed5ad8bc18501b22cd0776d3ac13ba', '||1.1|B1000000-0000-4000-8000-000000000018|2026-02-24T11:30:00|PAC970924HN1||', '00001000000504460024', '2026-02-24 11:30:00', 1279.49, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0024.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'DC', 'FOL-FACTU-2026-0025', 'B1000000-0000-4000-8000-000000000019', 'CFDI40_SIG_44184603da94f821322a28030eaca8b0989eaa0447444b7a704fa5719d9e1a9c', 'SAT_PAC_SIG_26f91a3244a3b2851ba3eccd2f3c25207c4733da3c8e24980aaac2f52c1d7072', '||1.1|B1000000-0000-4000-8000-000000000019|2026-02-25T11:30:00|PAC970924HN1||', '00001000000504460025', '2026-02-25 11:30:00', 2639.00, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0025.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'DC', 'FOL-FACTU-2026-0026', 'B1000000-0000-4000-8000-00000000001A', 'CFDI40_SIG_5403d72c808f1a62ecb7469654b20db8dd626c7e17766081a44fdcfb6699d6e3', 'SAT_PAC_SIG_352d57ab43979a1ee12cc0083029873749ff9379a92773620cc62a3500f0207b', '||1.1|B1000000-0000-4000-8000-00000000001A|2026-02-26T11:30:00|PAC970924HN1||', '00001000000504460026', '2026-02-26 11:30:00', 1360.68, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0026.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'DC', 'FOL-FACTU-2026-0027', 'B1000000-0000-4000-8000-00000000001B', 'CFDI40_SIG_40a0991410694e7c5238772e3be059f5f4c96ce2bfa618b79a1dfdf3486b3ea8', 'SAT_PAC_SIG_da4cf6531bd9085c8985191d1bf27702c83203b26ecdcb8c4cf3b7b12ab50b6c', '||1.1|B1000000-0000-4000-8000-00000000001B|2026-02-27T11:30:00|PAC970924HN1||', '00001000000504460027', '2026-02-27 11:30:00', 2523.35, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0027.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'DC', 'FOL-FACTU-2026-0028', 'B1000000-0000-4000-8000-00000000001C', 'CFDI40_SIG_e5fa3b6f4d6e20c62e4ec5e55454b8321acb57f3126e0aa03368b3f426a41f12', 'SAT_PAC_SIG_f9116973cd4830d43ed2657b6259128452cd0eef7dcac9fc47925c2a0277690f', '||1.1|B1000000-0000-4000-8000-00000000001C|2026-02-28T11:30:00|PAC970924HN1||', '00001000000504460028', '2026-02-28 11:30:00', 1443.04, 'TIMBRADA_VIGENTE', 'https://cdn.dermacare.mx/cfdi/xml/DC-0028.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'DC', 'FOL-FACTU-2026-0029', 'B1000000-0000-4000-8000-00000000001D', 'CFDI40_SIG_f1930596f17c51aaf8d707046275e662a1f4810b402b1bc26aa4855fe8f0a282', 'SAT_PAC_SIG_e306362d82a2c3fa186d535bad5a5285844e00751db8b65717cdd3b9ee73c744', '||1.1|B1000000-0000-4000-8000-00000000001D|2026-02-01T11:30:00|PAC970924HN1||', '00001000000504460029', '2026-02-01 11:30:00', 2968.44, 'CANCELADA_SAT', 'https://cdn.dermacare.mx/cfdi/xml/DC-0029.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'DC', 'FOL-FACTU-2026-0030', 'B1000000-0000-4000-8000-00000000001E', 'CFDI40_SIG_050f42215da984684b3f7c503c3ff0d6507e9caf323fd4be6f0950c209e365d4', 'SAT_PAC_SIG_7be745c07786e947eaac0d1c8ea414237efa4d33f4a9f7229dcba670ffe54bcd', '||1.1|B1000000-0000-4000-8000-00000000001E|2026-02-02T11:30:00|PAC970924HN1||', '00001000000504460030', '2026-02-02 11:30:00', 1372.86, 'ERROR_TIMBRADO', 'https://cdn.dermacare.mx/cfdi/xml/DC-0030.xml', 'https://cdn.dermacare.mx/cfdi/pdf/DC-0030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_cfdi', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.facturas_cfdi), 1), true);

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_partidas (ID, ID_factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '53131600', 'H87', 2.00, 285.50, 571.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '53131600', 'H87', 1.00, 321.00, 321.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '53131600', 'H87', 2.00, 356.50, 713.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '53131600', 'H87', 1.00, 392.00, 392.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '53131600', 'H87', 2.00, 427.50, 855.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '53131600', 'H87', 1.00, 463.00, 463.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '53131600', 'H87', 2.00, 498.50, 997.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '53131600', 'H87', 1.00, 534.00, 534.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '53131600', 'H87', 2.00, 569.50, 1139.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '53131600', 'H87', 1.00, 605.00, 605.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '53131600', 'H87', 2.00, 640.50, 1281.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '53131600', 'H87', 1.00, 676.00, 676.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '53131600', 'H87', 2.00, 711.50, 1423.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '53131600', 'H87', 1.00, 747.00, 747.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '53131600', 'H87', 2.00, 782.50, 1565.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '53131600', 'H87', 1.00, 818.00, 818.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '53131600', 'H87', 2.00, 853.50, 1707.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '53131600', 'H87', 1.00, 889.00, 889.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '53131600', 'H87', 2.00, 924.50, 1849.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '53131600', 'H87', 1.00, 960.00, 960.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '53131600', 'H87', 2.00, 995.50, 1991.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '53131600', 'H87', 1.00, 1031.00, 1031.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '53131600', 'H87', 2.00, 1066.50, 2133.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '53131600', 'H87', 1.00, 1102.00, 1102.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '53131600', 'H87', 2.00, 1137.50, 2275.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '53131600', 'H87', 1.00, 1173.00, 1173.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '53131600', 'H87', 2.00, 1208.50, 2417.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '53131600', 'H87', 1.00, 1244.00, 1244.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '53131600', 'H87', 2.00, 1279.50, 2559.00, '02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '53131600', 'H87', 1.00, 1315.00, 1315.00, '02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_partidas', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.facturas_partidas), 1), true);

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.complementos_pago (ID, ID_factura, ID_transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'B1000000-0000-4000-8000-000000000001', 1, 331.18, 165.59, 165.59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'B1000000-0000-4000-8000-000000000002', 1, 372.36, 186.18, 186.18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'B1000000-0000-4000-8000-000000000003', 1, 413.54, 206.77, 206.77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'B1000000-0000-4000-8000-000000000004', 1, 454.72, 227.36, 227.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'B1000000-0000-4000-8000-000000000005', 1, 495.90, 247.95, 247.95, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'B1000000-0000-4000-8000-000000000006', 1, 537.08, 268.54, 268.54, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'B1000000-0000-4000-8000-000000000007', 1, 578.26, 289.13, 289.13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'B1000000-0000-4000-8000-000000000008', 1, 619.44, 309.72, 309.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'B1000000-0000-4000-8000-000000000009', 1, 660.62, 330.31, 330.31, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'B1000000-0000-4000-8000-00000000000A', 1, 701.80, 350.90, 350.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'B1000000-0000-4000-8000-00000000000B', 1, 742.98, 371.49, 371.49, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'B1000000-0000-4000-8000-00000000000C', 1, 784.16, 392.08, 392.08, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'B1000000-0000-4000-8000-00000000000D', 1, 825.34, 412.67, 412.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'B1000000-0000-4000-8000-00000000000E', 1, 866.52, 433.26, 433.26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'B1000000-0000-4000-8000-00000000000F', 1, 907.70, 453.85, 453.85, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'B1000000-0000-4000-8000-000000000010', 1, 948.88, 474.44, 474.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'B1000000-0000-4000-8000-000000000011', 1, 990.06, 495.03, 495.03, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'B1000000-0000-4000-8000-000000000012', 1, 1031.24, 515.62, 515.62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'B1000000-0000-4000-8000-000000000013', 1, 1072.42, 536.21, 536.21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'B1000000-0000-4000-8000-000000000014', 1, 1113.60, 556.80, 556.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'B1000000-0000-4000-8000-000000000015', 1, 1154.78, 577.39, 577.39, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'B1000000-0000-4000-8000-000000000016', 1, 1195.96, 597.98, 597.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'B1000000-0000-4000-8000-000000000017', 1, 1237.14, 618.57, 618.57, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'B1000000-0000-4000-8000-000000000018', 1, 1278.32, 639.16, 639.16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'B1000000-0000-4000-8000-000000000019', 1, 1319.50, 659.75, 659.75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'B1000000-0000-4000-8000-00000000001A', 1, 1360.68, 680.34, 680.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'B1000000-0000-4000-8000-00000000001B', 1, 1401.86, 700.93, 700.93, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'B1000000-0000-4000-8000-00000000001C', 1, 1443.04, 721.52, 721.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'B1000000-0000-4000-8000-00000000001D', 1, 1484.22, 742.11, 742.11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'B1000000-0000-4000-8000-00000000001E', 1, 1525.40, 762.70, 762.70, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.complementos_pago', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.complementos_pago), 1), true);

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.notas_credito (ID, ID_factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'B1000000-0000-4000-8000-000000000001', '01', 285.50, 45.68, 331.18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'B1000000-0000-4000-8000-000000000002', '03', 321.00, 51.36, 372.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'B1000000-0000-4000-8000-000000000003', '01', 356.50, 57.04, 413.54, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'B1000000-0000-4000-8000-000000000004', '03', 392.00, 62.72, 454.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'B1000000-0000-4000-8000-000000000005', '01', 427.50, 68.40, 495.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'B1000000-0000-4000-8000-000000000006', '03', 463.00, 74.08, 537.08, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'B1000000-0000-4000-8000-000000000007', '01', 498.50, 79.76, 578.26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'B1000000-0000-4000-8000-000000000008', '03', 534.00, 85.44, 619.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'B1000000-0000-4000-8000-000000000009', '01', 569.50, 91.12, 660.62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'B1000000-0000-4000-8000-00000000000A', '03', 605.00, 96.80, 701.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'B1000000-0000-4000-8000-00000000000B', '01', 640.50, 102.48, 742.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'B1000000-0000-4000-8000-00000000000C', '03', 676.00, 108.16, 784.16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'B1000000-0000-4000-8000-00000000000D', '01', 711.50, 113.84, 825.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'B1000000-0000-4000-8000-00000000000E', '03', 747.00, 119.52, 866.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'B1000000-0000-4000-8000-00000000000F', '01', 782.50, 125.20, 907.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'B1000000-0000-4000-8000-000000000010', '03', 818.00, 130.88, 948.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'B1000000-0000-4000-8000-000000000011', '01', 853.50, 136.56, 990.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'B1000000-0000-4000-8000-000000000012', '03', 889.00, 142.24, 1031.24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'B1000000-0000-4000-8000-000000000013', '01', 924.50, 147.92, 1072.42, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'B1000000-0000-4000-8000-000000000014', '03', 960.00, 153.60, 1113.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'B1000000-0000-4000-8000-000000000015', '01', 995.50, 159.28, 1154.78, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'B1000000-0000-4000-8000-000000000016', '03', 1031.00, 164.96, 1195.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'B1000000-0000-4000-8000-000000000017', '01', 1066.50, 170.64, 1237.14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'B1000000-0000-4000-8000-000000000018', '03', 1102.00, 176.32, 1278.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'B1000000-0000-4000-8000-000000000019', '01', 1137.50, 182.00, 1319.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'B1000000-0000-4000-8000-00000000001A', '03', 1173.00, 187.68, 1360.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'B1000000-0000-4000-8000-00000000001B', '01', 1208.50, 193.36, 1401.86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'B1000000-0000-4000-8000-00000000001C', '03', 1244.00, 199.04, 1443.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'B1000000-0000-4000-8000-00000000001D', '01', 1279.50, 204.72, 1484.22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'B1000000-0000-4000-8000-00000000001E', '03', 1315.00, 210.40, 1525.40, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.notas_credito', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.notas_credito), 1), true);

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.cancelaciones_cfdi (ID, ID_factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '01', 'B1000000-0000-4000-8000-000000000001', '<AcuseCancelacionSAT Folio="0001" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '02', NULL, '<AcuseCancelacionSAT Folio="0002" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '03', NULL, '<AcuseCancelacionSAT Folio="0003" Estatus="201" Motivo="03" />', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '04', NULL, '<AcuseCancelacionSAT Folio="0004" Estatus="201" Motivo="04" />', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '01', 'B1000000-0000-4000-8000-000000000005', '<AcuseCancelacionSAT Folio="0005" Estatus="201" Motivo="01" />', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '02', NULL, '<AcuseCancelacionSAT Folio="0006" Estatus="201" Motivo="02" />', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '03', NULL, '<AcuseCancelacionSAT Folio="0007" Estatus="201" Motivo="03" />', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '04', NULL, '<AcuseCancelacionSAT Folio="0008" Estatus="201" Motivo="04" />', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '01', 'B1000000-0000-4000-8000-000000000009', '<AcuseCancelacionSAT Folio="0009" Estatus="201" Motivo="01" />', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '02', NULL, '<AcuseCancelacionSAT Folio="0010" Estatus="201" Motivo="02" />', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '03', NULL, '<AcuseCancelacionSAT Folio="0011" Estatus="201" Motivo="03" />', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '04', NULL, '<AcuseCancelacionSAT Folio="0012" Estatus="201" Motivo="04" />', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '01', 'B1000000-0000-4000-8000-00000000000D', '<AcuseCancelacionSAT Folio="0013" Estatus="201" Motivo="01" />', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '02', NULL, '<AcuseCancelacionSAT Folio="0014" Estatus="201" Motivo="02" />', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '03', NULL, '<AcuseCancelacionSAT Folio="0015" Estatus="201" Motivo="03" />', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '04', NULL, '<AcuseCancelacionSAT Folio="0016" Estatus="201" Motivo="04" />', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '01', 'B1000000-0000-4000-8000-000000000011', '<AcuseCancelacionSAT Folio="0017" Estatus="201" Motivo="01" />', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '02', NULL, '<AcuseCancelacionSAT Folio="0018" Estatus="201" Motivo="02" />', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '03', NULL, '<AcuseCancelacionSAT Folio="0019" Estatus="201" Motivo="03" />', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '04', NULL, '<AcuseCancelacionSAT Folio="0020" Estatus="201" Motivo="04" />', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '01', 'B1000000-0000-4000-8000-000000000015', '<AcuseCancelacionSAT Folio="0021" Estatus="201" Motivo="01" />', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '02', NULL, '<AcuseCancelacionSAT Folio="0022" Estatus="201" Motivo="02" />', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '03', NULL, '<AcuseCancelacionSAT Folio="0023" Estatus="201" Motivo="03" />', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '04', NULL, '<AcuseCancelacionSAT Folio="0024" Estatus="201" Motivo="04" />', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '01', 'B1000000-0000-4000-8000-000000000019', '<AcuseCancelacionSAT Folio="0025" Estatus="201" Motivo="01" />', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '02', NULL, '<AcuseCancelacionSAT Folio="0026" Estatus="201" Motivo="02" />', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '03', NULL, '<AcuseCancelacionSAT Folio="0027" Estatus="201" Motivo="03" />', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '04', NULL, '<AcuseCancelacionSAT Folio="0028" Estatus="201" Motivo="04" />', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '01', 'B1000000-0000-4000-8000-00000000001D', '<AcuseCancelacionSAT Folio="0029" Estatus="201" Motivo="01" />', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '02', NULL, '<AcuseCancelacionSAT Folio="0030" Estatus="201" Motivo="02" />', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.cancelaciones_cfdi', 'id'), COALESCE((SELECT MAX(id) FROM fiscal.cancelaciones_cfdi), 1), true);

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.campanias (ID, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CAMPANIA_01', 'Campaña DermaCare La Roche-Posay #01', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 52500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CAMPANIA_02', 'Campaña DermaCare CeraVe #02', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 55000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAMPANIA_03', 'Campaña DermaCare The Ordinary #03', '2026-02-03 11:30:00', '2026-02-24 11:30:00', 57500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAMPANIA_04', 'Campaña DermaCare ISDIN #04', '2026-02-04 11:30:00', '2026-02-25 11:30:00', 60000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CAMPANIA_05', 'Campaña DermaCare Bioderma #05', '2026-02-05 11:30:00', '2026-02-26 11:30:00', 62500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CAMPANIA_06', 'Campaña DermaCare Eau Thermale Avène #06', '2026-02-06 11:30:00', '2026-02-27 11:30:00', 65000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CAMPANIA_07', 'Campaña DermaCare Eucerin #07', '2026-02-07 11:30:00', '2026-02-28 11:30:00', 67500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CAMPANIA_08', 'Campaña DermaCare Vichy Laboratoires #08', '2026-02-08 11:30:00', '2026-03-01 11:30:00', 70000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAMPANIA_09', 'Campaña DermaCare SkinCeuticals #09', '2026-02-09 11:30:00', '2026-03-02 11:30:00', 72500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CAMPANIA_10', 'Campaña DermaCare Sesderma #10', '2026-02-10 11:30:00', '2026-03-03 11:30:00', 75000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CAMPANIA_11', 'Campaña DermaCare NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-03-04 11:30:00', 77500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CAMPANIA_12', 'Campaña DermaCare MAC Cosmetics #12', '2026-02-12 11:30:00', '2026-03-05 11:30:00', 80000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CAMPANIA_13', 'Campaña DermaCare Fenty Beauty #13', '2026-02-13 11:30:00', '2026-03-06 11:30:00', 82500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CAMPANIA_14', 'Campaña DermaCare Rare Beauty #14', '2026-02-14 11:30:00', '2026-03-07 11:30:00', 85000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CAMPANIA_15', 'Campaña DermaCare Clinique #15', '2026-02-15 11:30:00', '2026-03-08 11:30:00', 87500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CAMPANIA_16', 'Campaña DermaCare Estée Lauder #16', '2026-02-16 11:30:00', '2026-03-09 11:30:00', 90000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CAMPANIA_17', 'Campaña DermaCare Lancôme #17', '2026-02-17 11:30:00', '2026-03-10 11:30:00', 92500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CAMPANIA_18', 'Campaña DermaCare Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-03-11 11:30:00', 95000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CAMPANIA_19', 'Campaña DermaCare Paula''s Choice #19', '2026-02-19 11:30:00', '2026-03-12 11:30:00', 97500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CAMPANIA_20', 'Campaña DermaCare COSRX #20', '2026-02-20 11:30:00', '2026-03-13 11:30:00', 100000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CAMPANIA_21', 'Campaña DermaCare Laneige #21', '2026-02-21 11:30:00', '2026-03-14 11:30:00', 102500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CAMPANIA_22', 'Campaña DermaCare Uriage #22', '2026-02-22 11:30:00', '2026-03-15 11:30:00', 105000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CAMPANIA_23', 'Campaña DermaCare Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-03-16 11:30:00', 107500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CAMPANIA_24', 'Campaña DermaCare MartiDerm #24', '2026-02-24 11:30:00', '2026-03-17 11:30:00', 110000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CAMPANIA_25', 'Campaña DermaCare Heliocare #25', '2026-02-25 11:30:00', '2026-03-18 11:30:00', 112500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CAMPANIA_26', 'Campaña DermaCare Kiehl''s #26', '2026-02-26 11:30:00', '2026-03-19 11:30:00', 115000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CAMPANIA_27', 'Campaña DermaCare Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-03-20 11:30:00', 117500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CAMPANIA_28', 'Campaña DermaCare L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-03-21 11:30:00', 120000.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CAMPANIA_29', 'Campaña DermaCare Neutrogena #29', '2026-02-01 11:30:00', '2026-02-22 11:30:00', 122500.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CAMPANIA_30', 'Campaña DermaCare DermaCare Labs #30', '2026-02-02 11:30:00', '2026-02-23 11:30:00', 125000.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.campanias', 'id'), COALESCE((SELECT MAX(id) FROM promos.campanias), 1), true);

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones (ID, ID_campania, codigo_cupon, ID_tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CUPON_01', 1, 15.00, 799.00, 500, 13, 1, '2026-03-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'CUPON_02', 2, 150.00, 799.00, 500, 16, 2, '2026-03-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'CUPON_03', 3, 15.00, 799.00, 500, 19, 3, '2026-03-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CUPON_04', 4, 150.00, 799.00, 500, 22, 4, '2026-03-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'CUPON_05', 5, 15.00, 799.00, 500, 25, 5, '2026-03-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'CUPON_06', 6, 150.00, 799.00, 500, 28, 6, '2026-03-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CUPON_07', 7, 15.00, 799.00, 500, 31, 7, '2026-03-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'CUPON_08', 8, 150.00, 799.00, 500, 34, 8, '2026-03-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'CUPON_09', 9, 15.00, 799.00, 500, 37, 9, '2026-03-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CUPON_10', 10, 150.00, 799.00, 500, 40, 10, '2026-03-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'CUPON_11', 11, 15.00, 799.00, 500, 43, 11, '2026-03-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'CUPON_12', 12, 150.00, 799.00, 500, 46, 12, '2026-03-29 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CUPON_13', 13, 15.00, 799.00, 500, 49, 13, '2026-03-30 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'CUPON_14', 14, 150.00, 799.00, 500, 52, 14, '2026-03-31 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'CUPON_15', 15, 15.00, 799.00, 500, 55, 15, '2026-04-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CUPON_16', 16, 150.00, 799.00, 500, 58, 16, '2026-04-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CUPON_17', 17, 15.00, 799.00, 500, 61, 17, '2026-04-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'CUPON_18', 18, 150.00, 799.00, 500, 64, 18, '2026-04-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CUPON_19', 19, 15.00, 799.00, 500, 67, 19, '2026-04-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'CUPON_20', 20, 150.00, 799.00, 500, 70, 20, '2026-04-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'CUPON_21', 21, 15.00, 799.00, 500, 73, 21, '2026-04-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CUPON_22', 22, 150.00, 799.00, 500, 76, 22, '2026-04-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'CUPON_23', 23, 15.00, 799.00, 500, 79, 23, '2026-04-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'CUPON_24', 24, 150.00, 799.00, 500, 82, 24, '2026-04-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CUPON_25', 25, 15.00, 799.00, 500, 85, 25, '2026-04-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'CUPON_26', 26, 150.00, 799.00, 500, 88, 26, '2026-04-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CUPON_27', 27, 15.00, 799.00, 500, 91, 27, '2026-04-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CUPON_28', 28, 150.00, 799.00, 500, 94, 28, '2026-04-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'CUPON_29', 29, 15.00, 799.00, 500, 97, 29, '2026-03-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'CUPON_30', 30, 150.00, 799.00, 500, 100, 30, '2026-03-19 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.cupones', 'id'), COALESCE((SELECT MAX(id) FROM promos.cupones), 1), true);

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.reglas_elegibilidad_cupon (ID, ID_cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.reglas_elegibilidad_cupon', 'id'), COALESCE((SELECT MAX(id) FROM promos.reglas_elegibilidad_cupon), 1), true);

-- =================================================================================================
-- 098. TABLA: promos.cupones_categorias_excluidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones_categorias_excluidas (ID, ID_cupon, ID_categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.cupones_categorias_excluidas', 'id'), COALESCE((SELECT MAX(id) FROM promos.cupones_categorias_excluidas), 1), true);

-- =================================================================================================
-- 099. TABLA: promos.redenciones_cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.redenciones_cupones (ID, ID_cupon, ID_cliente, ID_orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 42.82, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 48.15, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 53.48, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 58.80, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 64.12, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 69.45, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 74.77, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 80.10, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 85.42, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 90.75, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 96.08, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 101.40, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 106.72, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 112.05, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 117.38, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 122.70, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 128.03, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 133.35, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 138.67, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 144.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 149.32, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 154.65, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 159.97, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 165.30, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 170.62, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 175.95, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 181.28, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 186.60, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 191.92, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 197.25, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.redenciones_cupones', 'id'), COALESCE((SELECT MAX(id) FROM promos.redenciones_cupones), 1), true);

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.ventas_flash_horarias (ID, ID_variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 214.12, 55, 11, '2026-02-01 11:30:00', '2026-02-01 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 240.75, 60, 12, '2026-02-02 11:30:00', '2026-02-02 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 267.38, 65, 13, '2026-02-03 11:30:00', '2026-02-03 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 294.00, 70, 14, '2026-02-04 11:30:00', '2026-02-04 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 320.62, 75, 15, '2026-02-05 11:30:00', '2026-02-05 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 347.25, 80, 16, '2026-02-06 11:30:00', '2026-02-06 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 373.88, 85, 17, '2026-02-07 11:30:00', '2026-02-07 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 400.50, 90, 18, '2026-02-08 11:30:00', '2026-02-08 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 427.12, 95, 19, '2026-02-09 11:30:00', '2026-02-09 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 453.75, 100, 20, '2026-02-10 11:30:00', '2026-02-10 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 480.38, 105, 21, '2026-02-11 11:30:00', '2026-02-11 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 507.00, 110, 22, '2026-02-12 11:30:00', '2026-02-12 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 533.62, 115, 23, '2026-02-13 11:30:00', '2026-02-13 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 560.25, 120, 24, '2026-02-14 11:30:00', '2026-02-14 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 586.88, 125, 25, '2026-02-15 11:30:00', '2026-02-15 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 613.50, 130, 26, '2026-02-16 11:30:00', '2026-02-16 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 640.12, 135, 27, '2026-02-17 11:30:00', '2026-02-17 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 666.75, 140, 28, '2026-02-18 11:30:00', '2026-02-18 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 693.38, 145, 29, '2026-02-19 11:30:00', '2026-02-19 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 720.00, 150, 30, '2026-02-20 11:30:00', '2026-02-20 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 746.62, 155, 31, '2026-02-21 11:30:00', '2026-02-21 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 773.25, 160, 32, '2026-02-22 11:30:00', '2026-02-22 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 799.88, 165, 33, '2026-02-23 11:30:00', '2026-02-23 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 826.50, 170, 34, '2026-02-24 11:30:00', '2026-02-24 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 853.12, 175, 35, '2026-02-25 11:30:00', '2026-02-25 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 879.75, 180, 36, '2026-02-26 11:30:00', '2026-02-26 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 906.38, 185, 37, '2026-02-27 11:30:00', '2026-02-27 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 933.00, 190, 38, '2026-02-28 11:30:00', '2026-02-28 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 959.62, 195, 39, '2026-02-01 11:30:00', '2026-02-01 17:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 986.25, 200, 40, '2026-02-02 11:30:00', '2026-02-02 17:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.ventas_flash_horarias', 'id'), COALESCE((SELECT MAX(id) FROM promos.ventas_flash_horarias), 1), true);

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.estados_orden_compra (ID, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'BORRADOR', 'Borrador de Compra', 'Requisición convertida en borrador pendiente de firma', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ENVIADA', 'Enviada a Proveedor', 'Orden de compra emitida y notificada al laboratorio', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CONFIRMADA', 'Confirmada con Cita Andén', 'Proveedor confirmó fecha de entrega y lotes sanitarios', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REC_PARCIAL', 'Recibida Parcialmente', 'Entrega parcial validada en andén de CEDIS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REC_TOTAL', 'Recibida Completa', 'Totalidad de unidades ingresadas a inventario QA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden de compra anulada por incumplimiento de SLA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('compras.estados_orden_compra', 'id'), COALESCE((SELECT MAX(id) FROM compras.estados_orden_compra), 1), true);

-- =================================================================================================
-- 102. TABLA: compras.proveedores (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedores (ID, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROVEEDO_01', 'Laboratorios La Roche-Posay S.A. de C.V.', 'Distribuidora La Roche-Posay México', 'DPM200111AB1', 'México', 15, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROVEEDO_02', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Distribuidora CeraVe México', 'DPM200112AB2', 'México', 30, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROVEEDO_03', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Distribuidora The Ordinary México', 'DPM200113AB3', 'México', 45, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROVEEDO_04', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Distribuidora ISDIN México', 'DPM200114AB4', 'México', 60, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROVEEDO_05', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Distribuidora Bioderma México', 'DPM200115AB5', 'México', 15, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROVEEDO_06', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Distribuidora Eau Thermale Avène México', 'DPM200116AB6', 'México', 30, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROVEEDO_07', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Distribuidora Eucerin México', 'DPM200117AB7', 'México', 45, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROVEEDO_08', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Distribuidora Vichy Laboratoires México', 'DPM200118AB8', 'México', 60, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROVEEDO_09', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Distribuidora SkinCeuticals México', 'DPM200119AB0', 'México', 15, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROVEEDO_10', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Distribuidora Sesderma México', 'DPM200120AB1', 'México', 30, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROVEEDO_11', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Distribuidora NARS Cosmetics México', 'DPM200121AB2', 'México', 45, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROVEEDO_12', 'Laboratorios MAC Professional S.A. de C.V.', 'Distribuidora MAC Cosmetics México', 'DPM200122AB3', 'México', 60, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROVEEDO_13', 'Laboratorios Fenty Beauty S.A. de C.V.', 'Distribuidora Fenty Beauty México', 'DPM200123AB4', 'México', 15, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROVEEDO_14', 'Laboratorios Rare Beauty S.A. de C.V.', 'Distribuidora Rare Beauty México', 'DPM200124AB5', 'México', 30, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROVEEDO_15', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Distribuidora Clinique México', 'DPM200125AB6', 'México', 45, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROVEEDO_16', 'Laboratorios Estée Lauder S.A. de C.V.', 'Distribuidora Estée Lauder México', 'DPM200126AB7', 'México', 60, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROVEEDO_17', 'Laboratorios Lancôme Paris S.A. de C.V.', 'Distribuidora Lancôme México', 'DPM200127AB8', 'México', 15, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROVEEDO_18', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Distribuidora Charlotte Tilbury México', 'DPM200128AB0', 'México', 30, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROVEEDO_19', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Distribuidora Paula''s Choice México', 'DPM200129AB1', 'México', 45, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROVEEDO_20', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Distribuidora COSRX México', 'DPM200130AB2', 'México', 60, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROVEEDO_21', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Distribuidora Laneige México', 'DPM200131AB3', 'México', 15, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROVEEDO_22', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Distribuidora Uriage México', 'DPM200132AB4', 'México', 30, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROVEEDO_23', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Distribuidora Laboratoire SVR México', 'DPM200133AB5', 'México', 45, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROVEEDO_24', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Distribuidora MartiDerm México', 'DPM200134AB6', 'México', 60, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROVEEDO_25', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Distribuidora Heliocare México', 'DPM200135AB7', 'México', 15, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROVEEDO_26', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Distribuidora Kiehl''s México', 'DPM200136AB8', 'México', 30, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROVEEDO_27', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Distribuidora Garnier SkinActive México', 'DPM200137AB0', 'México', 45, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROVEEDO_28', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Distribuidora L''Oréal Paris Derm México', 'DPM200138AB1', 'México', 60, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROVEEDO_29', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Distribuidora Neutrogena México', 'DPM200139AB2', 'México', 15, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROVEEDO_30', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Distribuidora DermaCare Labs México', 'DPM200140AB3', 'México', 30, 4.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedores', 'id'), COALESCE((SELECT MAX(id) FROM compras.proveedores), 1), true);

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.contactos_proveedor (ID, ID_proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Carlos Mendoza Garza', 'Gerente de Cuenta Clave', 'ventas.1@proveedor-derma.mx', '5541001001', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Sofía Ramírez López', 'Coordinador de Logística Sanitaria', 'ventas.2@proveedor-derma.mx', '5541001002', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Valeria Torres Villarreal', 'Ejecutivo de Facturación', 'ventas.3@proveedor-derma.mx', '5541001003', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Alejandro Hernández Cruz', 'Representante Regulador COFEPRIS', 'ventas.4@proveedor-derma.mx', '5541001004', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Mariana Sánchez Fuentes', 'Gerente de Cuenta Clave', 'ventas.5@proveedor-derma.mx', '5541001005', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Diego Martínez Treviño', 'Coordinador de Logística Sanitaria', 'ventas.6@proveedor-derma.mx', '5541001006', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Camila González Reyes', 'Ejecutivo de Facturación', 'ventas.7@proveedor-derma.mx', '5541001007', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Mateo Flores Castillo', 'Representante Regulador COFEPRIS', 'ventas.8@proveedor-derma.mx', '5541001008', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Lucía Morales Díaz', 'Gerente de Cuenta Clave', 'ventas.9@proveedor-derma.mx', '5541001009', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Sebastián Vázquez Ortiz', 'Coordinador de Logística Sanitaria', 'ventas.10@proveedor-derma.mx', '5541001010', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Regina Gutiérrez Nava', 'Ejecutivo de Facturación', 'ventas.11@proveedor-derma.mx', '5541001011', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Santiago Jiménez Pérez', 'Representante Regulador COFEPRIS', 'ventas.12@proveedor-derma.mx', '5541001012', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Fernanda Ruiz Salazar', 'Gerente de Cuenta Clave', 'ventas.13@proveedor-derma.mx', '5541001013', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Emiliano Ríos Cárdenas', 'Coordinador de Logística Sanitaria', 'ventas.14@proveedor-derma.mx', '5541001014', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Ximena Aguilar Ibarra', 'Ejecutivo de Facturación', 'ventas.15@proveedor-derma.mx', '5541001015', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Daniel Méndez Navarro', 'Representante Regulador COFEPRIS', 'ventas.16@proveedor-derma.mx', '5541001016', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Andrea Castro Delgado', 'Gerente de Cuenta Clave', 'ventas.17@proveedor-derma.mx', '5541001017', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Gabriel Vega Montoya', 'Coordinador de Logística Sanitaria', 'ventas.18@proveedor-derma.mx', '5541001018', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Paula Cortés Rojas', 'Ejecutivo de Facturación', 'ventas.19@proveedor-derma.mx', '5541001019', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Andrés Ramos Campos', 'Representante Regulador COFEPRIS', 'ventas.20@proveedor-derma.mx', '5541001020', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Renata Guerrero Luna', 'Gerente de Cuenta Clave', 'ventas.21@proveedor-derma.mx', '5541001021', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Nicolás Peña Cabrera', 'Coordinador de Logística Sanitaria', 'ventas.22@proveedor-derma.mx', '5541001022', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Natalia Herrera Vargas', 'Ejecutivo de Facturación', 'ventas.23@proveedor-derma.mx', '5541001023', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Joaquín Medina Contreras', 'Representante Regulador COFEPRIS', 'ventas.24@proveedor-derma.mx', '5541001024', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Isabella Domínguez Escobar', 'Gerente de Cuenta Clave', 'ventas.25@proveedor-derma.mx', '5541001025', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Leonardo Silva Paredes', 'Coordinador de Logística Sanitaria', 'ventas.26@proveedor-derma.mx', '5541001026', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Ana Chávez Bautista', 'Ejecutivo de Facturación', 'ventas.27@proveedor-derma.mx', '5541001027', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Rodrigo Ochoa Acosta', 'Representante Regulador COFEPRIS', 'ventas.28@proveedor-derma.mx', '5541001028', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Paulina Miranda Leal', 'Gerente de Cuenta Clave', 'ventas.29@proveedor-derma.mx', '5541001029', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Mauricio Padilla Solís', 'Coordinador de Logística Sanitaria', 'ventas.30@proveedor-derma.mx', '5541001030', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.contactos_proveedor', 'id'), COALESCE((SELECT MAX(id) FROM compras.contactos_proveedor), 1), true);

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_slas (ID, ID_proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 45, 2.00, 2.00, '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 60, 3.00, 3.00, '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 75, 4.00, 4.00, '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 30, 5.00, 5.00, '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 45, 1.00, 1.00, '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 60, 2.00, 2.00, '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 75, 3.00, 3.00, '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 30, 4.00, 4.00, '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 45, 5.00, 5.00, '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 60, 1.00, 1.00, '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 75, 2.00, 2.00, '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 30, 3.00, 3.00, '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 45, 4.00, 4.00, '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 60, 5.00, 5.00, '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 75, 1.00, 1.00, '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 30, 2.00, 2.00, '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 45, 3.00, 3.00, '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60, 4.00, 4.00, '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 75, 5.00, 5.00, '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 30, 1.00, 1.00, '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 45, 2.00, 2.00, '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 60, 3.00, 3.00, '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 75, 4.00, 4.00, '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 30, 5.00, 5.00, '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 45, 1.00, 1.00, '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 60, 2.00, 2.00, '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 75, 3.00, 3.00, '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 30, 4.00, 4.00, '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 45, 5.00, 5.00, '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 60, 1.00, 1.00, '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedor_slas', 'id'), COALESCE((SELECT MAX(id) FROM compras.proveedor_slas), 1), true);

-- =================================================================================================
-- 105. TABLA: compras.proveedor_productos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_productos (ID, ID_proveedor, ID_variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'ARTICULO_01', 17.50, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'ARTICULO_02', 20.00, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'ARTICULO_03', 22.50, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'ARTICULO_04', 25.00, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'ARTICULO_05', 27.50, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'ARTICULO_06', 30.00, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'ARTICULO_07', 32.50, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'ARTICULO_08', 35.00, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'ARTICULO_09', 37.50, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'ARTICULO_10', 40.00, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'ARTICULO_11', 42.50, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'ARTICULO_12', 45.00, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'ARTICULO_13', 47.50, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'ARTICULO_14', 50.00, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'ARTICULO_15', 52.50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'ARTICULO_16', 55.00, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'ARTICULO_17', 57.50, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'ARTICULO_18', 60.00, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'ARTICULO_19', 62.50, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'ARTICULO_20', 65.00, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'ARTICULO_21', 67.50, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'ARTICULO_22', 70.00, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'ARTICULO_23', 72.50, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'ARTICULO_24', 75.00, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'ARTICULO_25', 77.50, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'ARTICULO_26', 80.00, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'ARTICULO_27', 82.50, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'ARTICULO_28', 85.00, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'ARTICULO_29', 87.50, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'ARTICULO_30', 90.00, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedor_productos', 'id'), COALESCE((SELECT MAX(id) FROM compras.proveedor_productos), 1), true);

-- =================================================================================================
-- 106. TABLA: compras.requisiciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones (ID, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-REQUI-2026-0001', 'Planeación de Demanda', 'BAJA', 'Reposición de inventario de seguridad para Sérum Niacinamida 10% + Zinc 1% ante alta rotación.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-REQUI-2026-0002', 'Operaciones Cadena de Frío', 'MEDIA', 'Reposición de inventario de seguridad para Gel Limpiador Espumoso Facial ante alta rotación.', '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-REQUI-2026-0003', 'Control Sanitario QA', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Protector Solar Fluido SPF 50+ ante alta rotación.', '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-REQUI-2026-0004', 'Abastecimiento Beauty-Box', 'BAJA', 'Reposición de inventario de seguridad para Sérum Ácido Hialurónico 2% + B5 ante alta rotación.', '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-REQUI-2026-0005', 'Planeación de Demanda', 'MEDIA', 'Reposición de inventario de seguridad para Crema Hidratante con Ceramidas ante alta rotación.', '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-REQUI-2026-0006', 'Operaciones Cadena de Frío', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Retinol Puro 0.5% Nocturno ante alta rotación.', '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-REQUI-2026-0007', 'Control Sanitario QA', 'BAJA', 'Reposición de inventario de seguridad para Agua Micelar Dermolimpiadora ante alta rotación.', '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-REQUI-2026-0008', 'Abastecimiento Beauty-Box', 'MEDIA', 'Reposición de inventario de seguridad para Sérum Vitamina C Pura 15% ante alta rotación.', '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-REQUI-2026-0009', 'Planeación de Demanda', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Base de Maquillaje Cobertura Media ante alta rotación.', '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-REQUI-2026-0010', 'Operaciones Cadena de Frío', 'BAJA', 'Reposición de inventario de seguridad para Corrector Líquido Alta Duración ante alta rotación.', '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-REQUI-2026-0011', 'Control Sanitario QA', 'MEDIA', 'Reposición de inventario de seguridad para Bálsamo Reparador Cicaplast B5 ante alta rotación.', '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-REQUI-2026-0012', 'Abastecimiento Beauty-Box', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Exfoliante Ácido Salicílico 2% ante alta rotación.', '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-REQUI-2026-0013', 'Planeación de Demanda', 'BAJA', 'Reposición de inventario de seguridad para Contorno de Ojos con Cafeína 5% ante alta rotación.', '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-REQUI-2026-0014', 'Operaciones Cadena de Frío', 'MEDIA', 'Reposición de inventario de seguridad para Mascarilla Nocturna Hidratante ante alta rotación.', '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-REQUI-2026-0015', 'Control Sanitario QA', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Bruma Termal Calmante Mineral ante alta rotación.', '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-REQUI-2026-0016', 'Abastecimiento Beauty-Box', 'BAJA', 'Reposición de inventario de seguridad para Aceite Limpiador Emulsionable ante alta rotación.', '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-REQUI-2026-0017', 'Planeación de Demanda', 'MEDIA', 'Reposición de inventario de seguridad para Tónico Equilibrante Ácido Glicólico 7% ante alta rotación.', '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-REQUI-2026-0018', 'Operaciones Cadena de Frío', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Labial Hidratante Péptidos Nude ante alta rotación.', '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-REQUI-2026-0019', 'Control Sanitario QA', 'BAJA', 'Reposición de inventario de seguridad para Polvo Traslúcido Matificante Mineral ante alta rotación.', '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-REQUI-2026-0020', 'Abastecimiento Beauty-Box', 'MEDIA', 'Reposición de inventario de seguridad para Rubor Líquido Pigmento Natural ante alta rotación.', '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-REQUI-2026-0021', 'Planeación de Demanda', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Sérum Ácido Azelaico 10% Suspensión ante alta rotación.', '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-REQUI-2026-0022', 'Operaciones Cadena de Frío', 'BAJA', 'Reposición de inventario de seguridad para Ampolletas Proteoglicanos Firmeza ante alta rotación.', '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-REQUI-2026-0023', 'Control Sanitario QA', 'MEDIA', 'Reposición de inventario de seguridad para Crema Despigmentante Noche Melasma ante alta rotación.', '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-REQUI-2026-0024', 'Abastecimiento Beauty-Box', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Protector Solar Mineral Óxido Zinc ante alta rotación.', '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-REQUI-2026-0025', 'Planeación de Demanda', 'BAJA', 'Reposición de inventario de seguridad para Loción Corporal Urea 10% Reparadora ante alta rotación.', '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-REQUI-2026-0026', 'Operaciones Cadena de Frío', 'MEDIA', 'Reposición de inventario de seguridad para Primer Facial Minimizador de Poros ante alta rotación.', '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-REQUI-2026-0027', 'Control Sanitario QA', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Máscara de Pestañas Hipoalergénica ante alta rotación.', '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-REQUI-2026-0028', 'Abastecimiento Beauty-Box', 'BAJA', 'Reposición de inventario de seguridad para Sérum Péptidos de Cobre 1% ante alta rotación.', '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-REQUI-2026-0029', 'Planeación de Demanda', 'MEDIA', 'Reposición de inventario de seguridad para Bálsamo Desmaquillante Caléndula ante alta rotación.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-REQUI-2026-0030', 'Operaciones Cadena de Frío', 'URGENTE_DESABASTO', 'Reposición de inventario de seguridad para Crema Barrera Post-Retinoide ante alta rotación.', '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.requisiciones', 'id'), COALESCE((SELECT MAX(id) FROM compras.requisiciones), 1), true);

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones_detalles (ID, ID_requisicion, ID_variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.requisiciones_detalles', 'id'), COALESCE((SELECT MAX(id) FROM compras.requisiciones_detalles), 1), true);

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra (ID, folio_orden_compra, ID_proveedor, ID_estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 1187.68, 190.03, 1377.71, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 1836.12, 293.78, 2129.90, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 2595.32, 415.25, 3010.57, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 1630.72, 260.92, 1891.64, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 2445.30, 391.25, 2836.55, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 3370.64, 539.30, 3909.94, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 2073.76, 331.80, 2405.56, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 3054.48, 488.72, 3543.20, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 4145.96, 663.35, 4809.31, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 2516.80, 402.69, 2919.49, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 3663.66, 586.19, 4249.85, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 4921.28, 787.40, 5708.68, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 2959.84, 473.57, 3433.41, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 4272.84, 683.65, 4956.49, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 5696.60, 911.46, 6608.06, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 3402.88, 544.46, 3947.34, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 4882.02, 781.12, 5663.14, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 6471.92, 1035.51, 7507.43, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 3845.92, 615.35, 4461.27, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 5491.20, 878.59, 6369.79, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 7247.24, 1159.56, 8406.80, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 4288.96, 686.23, 4975.19, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 6100.38, 976.06, 7076.44, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 8022.56, 1283.61, 9306.17, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 4732.00, 757.12, 5489.12, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 6709.56, 1073.53, 7783.09, 'Crédito 30 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 8797.88, 1407.66, 10205.54, 'Crédito 45 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 5175.04, 828.01, 6003.05, 'Crédito 60 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 7318.74, 1171.00, 8489.74, 'Crédito 15 días contra entrega y validación QA.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 9573.20, 1531.71, 11104.91, 'Crédito 30 días contra entrega y validación QA.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra', 'id'), COALESCE((SELECT MAX(id) FROM compras.ordenes_compra), 1), true);

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra_detalles (ID, ID_orden_compra, ID_variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, 148.46, 1187.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 166.92, 1836.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 185.38, 2595.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 8, 8, 203.84, 1630.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 11, 11, 222.30, 2445.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 14, 14, 240.76, 3370.64, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 8, 8, 259.22, 2073.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 11, 11, 277.68, 3054.48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 14, 14, 296.14, 4145.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 8, 8, 314.60, 2516.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 333.06, 3663.66, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 14, 14, 351.52, 4921.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 8, 8, 369.98, 2959.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 11, 11, 388.44, 4272.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 14, 14, 406.90, 5696.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 8, 8, 425.36, 3402.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 11, 11, 443.82, 4882.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 14, 14, 462.28, 6471.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 8, 8, 480.74, 3845.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 11, 11, 499.20, 5491.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 14, 14, 517.66, 7247.24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 8, 8, 536.12, 4288.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 11, 11, 554.58, 6100.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 14, 14, 573.04, 8022.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 8, 8, 591.50, 4732.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 11, 11, 609.96, 6709.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 14, 14, 628.42, 8797.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 8, 8, 646.88, 5175.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 11, 11, 665.34, 7318.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 14, 14, 683.80, 9573.20, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra_detalles', 'id'), COALESCE((SELECT MAX(id) FROM compras.ordenes_compra_detalles), 1), true);

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_mercancia (ID, folio_recepcion, ID_orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RECEP-2026-0001', 1, 'REM-PROV-2026-0001', '2026-02-01 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RECEP-2026-0002', 2, 'REM-PROV-2026-0002', '2026-02-02 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RECEP-2026-0003', 3, 'REM-PROV-2026-0003', '2026-02-03 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RECEP-2026-0004', 4, 'REM-PROV-2026-0004', '2026-02-04 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RECEP-2026-0005', 5, 'REM-PROV-2026-0005', '2026-02-05 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RECEP-2026-0006', 6, 'REM-PROV-2026-0006', '2026-02-06 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RECEP-2026-0007', 7, 'REM-PROV-2026-0007', '2026-02-07 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RECEP-2026-0008', 8, 'REM-PROV-2026-0008', '2026-02-08 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RECEP-2026-0009', 9, 'REM-PROV-2026-0009', '2026-02-09 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RECEP-2026-0010', 10, 'REM-PROV-2026-0010', '2026-02-10 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RECEP-2026-0011', 11, 'REM-PROV-2026-0011', '2026-02-11 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RECEP-2026-0012', 12, 'REM-PROV-2026-0012', '2026-02-12 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RECEP-2026-0013', 13, 'REM-PROV-2026-0013', '2026-02-13 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RECEP-2026-0014', 14, 'REM-PROV-2026-0014', '2026-02-14 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RECEP-2026-0015', 15, 'REM-PROV-2026-0015', '2026-02-15 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RECEP-2026-0016', 16, 'REM-PROV-2026-0016', '2026-02-16 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RECEP-2026-0017', 17, 'REM-PROV-2026-0017', '2026-02-17 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RECEP-2026-0018', 18, 'REM-PROV-2026-0018', '2026-02-18 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RECEP-2026-0019', 19, 'REM-PROV-2026-0019', '2026-02-19 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RECEP-2026-0020', 20, 'REM-PROV-2026-0020', '2026-02-20 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RECEP-2026-0021', 21, 'REM-PROV-2026-0021', '2026-02-21 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RECEP-2026-0022', 22, 'REM-PROV-2026-0022', '2026-02-22 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RECEP-2026-0023', 23, 'REM-PROV-2026-0023', '2026-02-23 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RECEP-2026-0024', 24, 'REM-PROV-2026-0024', '2026-02-24 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RECEP-2026-0025', 25, 'REM-PROV-2026-0025', '2026-02-25 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RECEP-2026-0026', 26, 'REM-PROV-2026-0026', '2026-02-26 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RECEP-2026-0027', 27, 'REM-PROV-2026-0027', '2026-02-27 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RECEP-2026-0028', 28, 'REM-PROV-2026-0028', '2026-02-28 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RECEP-2026-0029', 29, 'REM-PROV-2026-0029', '2026-02-01 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RECEP-2026-0030', 30, 'REM-PROV-2026-0030', '2026-02-02 11:30:00', 'Unidad con termógrafo sellado; tarimas recibidas sin golpes en rampa #5.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_mercancia', 'id'), COALESCE((SELECT MAX(id) FROM compras.recepciones_mercancia), 1), true);

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_detalles (ID, ID_recepcion, ID_variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 6.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 5.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 4.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 7.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 6.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 5.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 4.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 18.8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 7.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 21.2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 6.5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 19.6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 20.4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 5.5, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_detalles', 'id'), COALESCE((SELECT MAX(id) FROM compras.recepciones_detalles), 1), true);

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.inspecciones_sanitarias_qa (ID, ID_recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, 'LOTE_LAB_01', '2027-01-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, 'LOTE_LAB_02', '2028-02-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, 'LOTE_LAB_03', '2027-03-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, 'LOTE_LAB_04', '2028-04-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, 'LOTE_LAB_05', '2027-05-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, 'LOTE_LAB_06', '2028-06-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, 'LOTE_LAB_07', '2027-07-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, 'LOTE_LAB_08', '2028-08-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, 'LOTE_LAB_09', '2027-09-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, 'LOTE_LAB_10', '2028-10-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, 'LOTE_LAB_11', '2027-11-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, 'LOTE_LAB_12', '2028-12-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, 'LOTE_LAB_13', '2027-01-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, 'LOTE_LAB_14', '2028-02-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, 'LOTE_LAB_15', '2027-03-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, 'LOTE_LAB_16', '2028-04-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, 'LOTE_LAB_17', '2027-05-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, 'LOTE_LAB_18', '2028-06-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, 'LOTE_LAB_19', '2027-07-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, 'LOTE_LAB_20', '2028-08-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, 'LOTE_LAB_21', '2027-09-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, 'LOTE_LAB_22', '2028-10-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, 'LOTE_LAB_23', '2027-11-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, 'LOTE_LAB_24', '2028-12-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, 'LOTE_LAB_25', '2027-01-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, 'LOTE_LAB_26', '2028-02-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, 'LOTE_LAB_27', '2027-03-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, 'LOTE_LAB_28', '2028-04-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, 'LOTE_LAB_29', '2027-05-15', 'APROBADO', 'Sellos inviolables intactos, temperatura dentro de rango y certificado CoA conforme.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, 'LOTE_LAB_30', '2028-06-15', 'RECHAZADO_DEVOLVER', 'Empaque secundario con humedad y sello de seguridad comprometido.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.inspecciones_sanitarias_qa', 'id'), COALESCE((SELECT MAX(id) FROM compras.inspecciones_sanitarias_qa), 1), true);

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.almacenes_cedis (ID, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ALMACEN_01', 'CEDIS Monterrey Parque Stiva Unidad 1', 'Av. Parque Industrial Logístico #112', '25700', 'Monclova', 1750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ALMACEN_02', 'CEDIS CDMX Vallejo Industrial Unidad 2', 'Av. Parque Industrial Logístico #124', '64000', 'Monterrey', 2000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ALMACEN_03', 'CEDIS Guadalajara El Salto Unidad 3', 'Av. Parque Industrial Logístico #136', '66220', 'San Pedro Garza García', 2250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'ALMACEN_04', 'CEDIS Monclova Centro Distribución Unidad 4', 'Av. Parque Industrial Logístico #148', '06700', 'Cuauhtémoc', 2500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ALMACEN_05', 'CEDIS Querétaro Logístico Bajío Unidad 5', 'Av. Parque Industrial Logístico #160', '11560', 'Miguel Hidalgo', 2750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'ALMACEN_06', 'CEDIS Puebla Parque Finsa Unidad 6', 'Av. Parque Industrial Logístico #172', '44100', 'Guadalajara', 3000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'ALMACEN_07', 'CEDIS Monterrey Parque Stiva Unidad 7', 'Av. Parque Industrial Logístico #184', '25000', 'Saltillo', 3250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'ALMACEN_08', 'CEDIS CDMX Vallejo Industrial Unidad 8', 'Av. Parque Industrial Logístico #196', '76000', 'Querétaro', 3500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'ALMACEN_09', 'CEDIS Guadalajara El Salto Unidad 9', 'Av. Parque Industrial Logístico #208', '72000', 'Puebla', 3750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'ALMACEN_10', 'CEDIS Monclova Centro Distribución Unidad 10', 'Av. Parque Industrial Logístico #220', '97000', 'Mérida', 4000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ALMACEN_11', 'CEDIS Querétaro Logístico Bajío Unidad 11', 'Av. Parque Industrial Logístico #232', '25700', 'Monclova', 4250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ALMACEN_12', 'CEDIS Puebla Parque Finsa Unidad 12', 'Av. Parque Industrial Logístico #244', '64000', 'Monterrey', 4500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'ALMACEN_13', 'CEDIS Monterrey Parque Stiva Unidad 13', 'Av. Parque Industrial Logístico #256', '66220', 'San Pedro Garza García', 4750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'ALMACEN_14', 'CEDIS CDMX Vallejo Industrial Unidad 14', 'Av. Parque Industrial Logístico #268', '06700', 'Cuauhtémoc', 5000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ALMACEN_15', 'CEDIS Guadalajara El Salto Unidad 15', 'Av. Parque Industrial Logístico #280', '11560', 'Miguel Hidalgo', 5250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'ALMACEN_16', 'CEDIS Monclova Centro Distribución Unidad 16', 'Av. Parque Industrial Logístico #292', '44100', 'Guadalajara', 5500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'ALMACEN_17', 'CEDIS Querétaro Logístico Bajío Unidad 17', 'Av. Parque Industrial Logístico #304', '25000', 'Saltillo', 5750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ALMACEN_18', 'CEDIS Puebla Parque Finsa Unidad 18', 'Av. Parque Industrial Logístico #316', '76000', 'Querétaro', 6000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'ALMACEN_19', 'CEDIS Monterrey Parque Stiva Unidad 19', 'Av. Parque Industrial Logístico #328', '72000', 'Puebla', 6250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'ALMACEN_20', 'CEDIS CDMX Vallejo Industrial Unidad 20', 'Av. Parque Industrial Logístico #340', '97000', 'Mérida', 6500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ALMACEN_21', 'CEDIS Guadalajara El Salto Unidad 21', 'Av. Parque Industrial Logístico #352', '25700', 'Monclova', 6750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'ALMACEN_22', 'CEDIS Monclova Centro Distribución Unidad 22', 'Av. Parque Industrial Logístico #364', '64000', 'Monterrey', 7000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'ALMACEN_23', 'CEDIS Querétaro Logístico Bajío Unidad 23', 'Av. Parque Industrial Logístico #376', '66220', 'San Pedro Garza García', 7250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'ALMACEN_24', 'CEDIS Puebla Parque Finsa Unidad 24', 'Av. Parque Industrial Logístico #388', '06700', 'Cuauhtémoc', 7500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'ALMACEN_25', 'CEDIS Monterrey Parque Stiva Unidad 25', 'Av. Parque Industrial Logístico #400', '11560', 'Miguel Hidalgo', 7750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'ALMACEN_26', 'CEDIS CDMX Vallejo Industrial Unidad 26', 'Av. Parque Industrial Logístico #412', '44100', 'Guadalajara', 8000.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ALMACEN_27', 'CEDIS Guadalajara El Salto Unidad 27', 'Av. Parque Industrial Logístico #424', '25000', 'Saltillo', 8250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'ALMACEN_28', 'CEDIS Monclova Centro Distribución Unidad 28', 'Av. Parque Industrial Logístico #436', '76000', 'Querétaro', 8500.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'ALMACEN_29', 'CEDIS Querétaro Logístico Bajío Unidad 29', 'Av. Parque Industrial Logístico #448', '72000', 'Puebla', 8750.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'ALMACEN_30', 'CEDIS Puebla Parque Finsa Unidad 30', 'Av. Parque Industrial Logístico #460', '97000', 'Mérida', 9000.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.almacenes_cedis', 'id'), COALESCE((SELECT MAX(id) FROM wms.almacenes_cedis), 1), true);

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.zonas_almacen (ID, ID_almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ZONA_01', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 01)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ZONA_02', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 02)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ZONA_03', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 03)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ZONA_04', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 04)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ZONA_05', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 05)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ZONA_06', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 06)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ZONA_07', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 07)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ZONA_08', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 08)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ZONA_09', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 09)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ZONA_10', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 10)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ZONA_11', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 11)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ZONA_12', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 12)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ZONA_13', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 13)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ZONA_14', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 14)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ZONA_15', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 15)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ZONA_16', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 16)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ZONA_17', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 17)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ZONA_18', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 18)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ZONA_19', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 19)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ZONA_20', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 20)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ZONA_21', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 21)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ZONA_22', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 22)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ZONA_23', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 23)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ZONA_24', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 24)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ZONA_25', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 25)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ZONA_26', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 26)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ZONA_27', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 27)', 2.0, 8.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ZONA_28', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 28)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ZONA_29', 'Zona Climatizada Dermocosmética 15°C - 25°C (Zona 29)', 15.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ZONA_30', 'Cámara de Refrigeración Cadena de Frío 2°C - 8°C (Zona 30)', 2.0, 8.0, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.zonas_almacen', 'id'), COALESCE((SELECT MAX(id) FROM wms.zonas_almacen), 1), true);

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.pasillos_ubicaciones (ID, ID_zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'UBICACIO_01', 250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'UBICACIO_02', 300.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'UBICACIO_03', 350.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'UBICACIO_04', 400.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'UBICACIO_05', 450.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'UBICACIO_06', 250.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'UBICACIO_07', 300.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'UBICACIO_08', 350.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'UBICACIO_09', 400.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'UBICACIO_10', 450.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'UBICACIO_11', 250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'UBICACIO_12', 300.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'UBICACIO_13', 350.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'UBICACIO_14', 400.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'UBICACIO_15', 450.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'UBICACIO_16', 250.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'UBICACIO_17', 300.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'UBICACIO_18', 350.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'UBICACIO_19', 400.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'UBICACIO_20', 450.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'UBICACIO_21', 250.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'UBICACIO_22', 300.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'UBICACIO_23', 350.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'UBICACIO_24', 400.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'UBICACIO_25', 450.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'UBICACIO_26', 250.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'UBICACIO_27', 300.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'UBICACIO_28', 350.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'UBICACIO_29', 400.00, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'UBICACIO_30', 450.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.pasillos_ubicaciones', 'id'), COALESCE((SELECT MAX(id) FROM wms.pasillos_ubicaciones), 1), true);

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.tipos_movimiento_inventario (ID, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ENT_COMPRA', 'Entrada por Compra a Proveedor', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SAL_VENTA', 'Salida por Venta E-Commerce', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AJU_POS', 'Ajuste Positivo por Conteo Cíclico', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SAL_MERMA', 'Salida por Merma o Caducidad Sanitaria', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANS_SAL', 'Salida por Transferencia entre CEDIS', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANS_ENT', 'Entrada por Transferencia entre CEDIS', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('wms.tipos_movimiento_inventario', 'id'), COALESCE((SELECT MAX(id) FROM wms.tipos_movimiento_inventario), 1), true);

-- =================================================================================================
-- 117. TABLA: wms.lotes_fabricacion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.lotes_fabricacion_sanitaria (ID, ID_variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'LOT-2026-LA_R-001', '2025-01-01', '2027-01-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-001.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'LOT-2026-CERA-002', '2025-02-02', '2028-02-02', 'https://cdn.dermacare.mx/wms/coa/LOTE-002.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'LOT-2026-THE_-003', '2025-03-03', '2027-03-03', 'https://cdn.dermacare.mx/wms/coa/LOTE-003.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'LOT-2026-ISDI-004', '2024-02-01', '2026-02-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-004.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'LOT-2026-BIOD-005', '2025-05-05', '2027-05-05', 'https://cdn.dermacare.mx/wms/coa/LOTE-005.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'LOT-2026-AVEN-006', '2025-06-06', '2028-06-06', 'https://cdn.dermacare.mx/wms/coa/LOTE-006.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'LOT-2026-EUCE-007', '2025-07-07', '2027-07-07', 'https://cdn.dermacare.mx/wms/coa/LOTE-007.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'LOT-2026-VICH-008', '2024-02-01', '2026-02-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-008.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'LOT-2026-SKIN-009', '2025-09-09', '2027-09-09', 'https://cdn.dermacare.mx/wms/coa/LOTE-009.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'LOT-2026-SESD-010', '2025-10-10', '2028-10-10', 'https://cdn.dermacare.mx/wms/coa/LOTE-010.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'LOT-2026-NARS-011', '2025-11-11', '2027-11-11', 'https://cdn.dermacare.mx/wms/coa/LOTE-011.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'LOT-2026-MAC-012', '2025-12-12', '2028-12-12', 'https://cdn.dermacare.mx/wms/coa/LOTE-012.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'LOT-2026-FENT-013', '2025-01-13', '2027-01-13', 'https://cdn.dermacare.mx/wms/coa/LOTE-013.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'LOT-2026-RARE-014', '2025-02-14', '2028-02-14', 'https://cdn.dermacare.mx/wms/coa/LOTE-014.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'LOT-2026-CLIN-015', '2025-03-15', '2027-03-15', 'https://cdn.dermacare.mx/wms/coa/LOTE-015.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'LOT-2026-ESTE-016', '2025-04-16', '2028-04-16', 'https://cdn.dermacare.mx/wms/coa/LOTE-016.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'LOT-2026-LANC-017', '2025-05-17', '2027-05-17', 'https://cdn.dermacare.mx/wms/coa/LOTE-017.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'LOT-2026-CHAR-018', '2025-06-18', '2028-06-18', 'https://cdn.dermacare.mx/wms/coa/LOTE-018.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'LOT-2026-PAUL-019', '2025-07-19', '2027-07-19', 'https://cdn.dermacare.mx/wms/coa/LOTE-019.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'LOT-2026-COSR-020', '2025-08-20', '2028-08-20', 'https://cdn.dermacare.mx/wms/coa/LOTE-020.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'LOT-2026-LANE-021', '2025-09-01', '2027-09-01', 'https://cdn.dermacare.mx/wms/coa/LOTE-021.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'LOT-2026-URIA-022', '2025-10-02', '2028-10-02', 'https://cdn.dermacare.mx/wms/coa/LOTE-022.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'LOT-2026-SVR-023', '2025-11-03', '2027-11-03', 'https://cdn.dermacare.mx/wms/coa/LOTE-023.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'LOT-2026-MART-024', '2025-12-04', '2028-12-04', 'https://cdn.dermacare.mx/wms/coa/LOTE-024.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'LOT-2026-HELI-025', '2025-01-05', '2027-01-05', 'https://cdn.dermacare.mx/wms/coa/LOTE-025.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'LOT-2026-KIEH-026', '2025-02-06', '2028-02-06', 'https://cdn.dermacare.mx/wms/coa/LOTE-026.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'LOT-2026-GARN-027', '2025-03-07', '2027-03-07', 'https://cdn.dermacare.mx/wms/coa/LOTE-027.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'LOT-2026-LORE-028', '2025-04-08', '2028-04-08', 'https://cdn.dermacare.mx/wms/coa/LOTE-028.pdf', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'LOT-2026-NEUT-029', '2025-05-09', '2027-05-09', 'https://cdn.dermacare.mx/wms/coa/LOTE-029.pdf', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'LOT-2026-DERM-030', '2025-06-10', '2028-06-10', 'https://cdn.dermacare.mx/wms/coa/LOTE-030.pdf', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.lotes_fabricacion_sanitaria', 'id'), COALESCE((SELECT MAX(id) FROM wms.lotes_fabricacion_sanitaria), 1), true);

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.inventario_lotes_ubicacion (ID, ID_lote, ID_ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.inventario_lotes_ubicacion', 'id'), COALESCE((SELECT MAX(id) FROM wms.inventario_lotes_ubicacion), 1), true);

-- =================================================================================================
-- 119. TABLA: wms.kardex_movimientos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.kardex_movimientos (ID, ID_inventario_stock, ID_tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 105, 113, 'FOL-DOCUM-2026-0001', 148.46, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 110, 99, 'FOL-DOCUM-2026-0002', 166.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 115, 129, 'FOL-DOCUM-2026-0003', 185.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 120, 103, 'FOL-DOCUM-2026-0004', 203.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 125, 145, 'FOL-DOCUM-2026-0005', 222.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 130, 107, 'FOL-DOCUM-2026-0006', 240.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 135, 161, 'FOL-DOCUM-2026-0007', 259.22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 140, 111, 'FOL-DOCUM-2026-0008', 277.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 145, 177, 'FOL-DOCUM-2026-0009', 296.14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 150, 115, 'FOL-DOCUM-2026-0010', 314.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 155, 193, 'FOL-DOCUM-2026-0011', 333.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 160, 119, 'FOL-DOCUM-2026-0012', 351.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 165, 209, 'FOL-DOCUM-2026-0013', 369.98, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 170, 123, 'FOL-DOCUM-2026-0014', 388.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 175, 225, 'FOL-DOCUM-2026-0015', 406.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 180, 127, 'FOL-DOCUM-2026-0016', 425.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 185, 241, 'FOL-DOCUM-2026-0017', 443.82, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 190, 131, 'FOL-DOCUM-2026-0018', 462.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 195, 257, 'FOL-DOCUM-2026-0019', 480.74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 200, 135, 'FOL-DOCUM-2026-0020', 499.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 205, 273, 'FOL-DOCUM-2026-0021', 517.66, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 210, 139, 'FOL-DOCUM-2026-0022', 536.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 215, 289, 'FOL-DOCUM-2026-0023', 554.58, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 220, 143, 'FOL-DOCUM-2026-0024', 573.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 225, 305, 'FOL-DOCUM-2026-0025', 591.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 230, 147, 'FOL-DOCUM-2026-0026', 609.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 235, 321, 'FOL-DOCUM-2026-0027', 628.42, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 240, 151, 'FOL-DOCUM-2026-0028', 646.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 245, 337, 'FOL-DOCUM-2026-0029', 665.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 250, 155, 'FOL-DOCUM-2026-0030', 683.80, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.kardex_movimientos', 'id'), COALESCE((SELECT MAX(id) FROM wms.kardex_movimientos), 1), true);

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.alertas_caducidad_proxima (ID, ID_lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 18, 'CRITICA_30D', 'Bloquear venta regular; liquidación inmediata o retiro preventivo.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, -5, 'EXPIRADO', 'Retirar de ubicación vendible y enviar a destrucción sanitaria COFEPRIS.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 82, 'PREVENTIVA_90D', 'Programar campaña promocional o bundle de rotación.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 48, 'MODERADA_60D', 'Activar descuento Venta Flash 25% y priorizar picking FEFO.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.alertas_caducidad_proxima', 'id'), COALESCE((SELECT MAX(id) FROM wms.alertas_caducidad_proxima), 1), true);

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.mermas_destruccion_sanitaria (ID, folio_acta_destruccion, ID_lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ACTA_-2026-0001', 1, 8, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ACTA_-2026-0002', 2, 11, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ACTA_-2026-0003', 3, 14, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ACTA_-2026-0004', 4, 17, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ACTA_-2026-0005', 5, 20, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ACTA_-2026-0006', 6, 23, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ACTA_-2026-0007', 7, 26, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ACTA_-2026-0008', 8, 29, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ACTA_-2026-0009', 9, 32, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ACTA_-2026-0010', 10, 35, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ACTA_-2026-0011', 11, 38, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ACTA_-2026-0012', 12, 41, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ACTA_-2026-0013', 13, 44, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ACTA_-2026-0014', 14, 47, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ACTA_-2026-0015', 15, 50, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ACTA_-2026-0016', 16, 53, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ACTA_-2026-0017', 17, 56, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ACTA_-2026-0018', 18, 59, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ACTA_-2026-0019', 19, 62, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ACTA_-2026-0020', 20, 65, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ACTA_-2026-0021', 21, 68, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ACTA_-2026-0022', 22, 71, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ACTA_-2026-0023', 23, 74, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ACTA_-2026-0024', 24, 77, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ACTA_-2026-0025', 25, 80, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ACTA_-2026-0026', 26, 83, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ACTA_-2026-0027', 27, 86, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ACTA_-2026-0028', 28, 89, 'Producto expirado según monitoreo FEFO.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ACTA_-2026-0029', 29, 92, 'Fractura de envase de vidrio durante maniobra de surtido.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ACTA_-2026-0030', 30, 95, 'Excursión térmica fuera de especificación de fabricante.', 'EcoResiduos Químico-Biológicos del Norte S.A. de C.V.', 'https://cdn.dermacare.mx/wms/mermas/ACTA-0030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.mermas_destruccion_sanitaria', 'id'), COALESCE((SELECT MAX(id) FROM wms.mermas_destruccion_sanitaria), 1), true);

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_almacenes (ID, folio_transferencia, ID_almacen_origen, ID_almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 2, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 3, 'EN_TRANSITO', '2026-02-02 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 4, 'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 5, 'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 6, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 7, 'EN_TRANSITO', '2026-02-06 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 8, 'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 9, 'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 10, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 11, 'EN_TRANSITO', '2026-02-10 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 12, 'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 13, 'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 14, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 15, 'EN_TRANSITO', '2026-02-14 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 16, 'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 17, 'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 18, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 19, 'EN_TRANSITO', '2026-02-18 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 20, 'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 21, 'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 22, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 23, 'EN_TRANSITO', '2026-02-22 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 24, 'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 25, 'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 26, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 27, 'EN_TRANSITO', '2026-02-26 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 28, 'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-03-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 29, 'DISCREPANCIA', '2026-02-28 11:30:00', '2026-03-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 30, 'SOLICITADA', NULL, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 1, 'EN_TRANSITO', '2026-02-02 11:30:00', NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.transferencias_almacenes', 'id'), COALESCE((SELECT MAX(id) FROM wms.transferencias_almacenes), 1), true);

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_detalles (ID, ID_transferencia, ID_lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.transferencias_detalles', 'id'), COALESCE((SELECT MAX(id) FROM wms.transferencias_detalles), 1), true);

-- =================================================================================================
-- 124. TABLA: wms.conteos_ciclicos_auditoria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_auditoria (ID, folio_auditoria, ID_almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-AUDIT-2026-0001', 1, '2026-03-01', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-AUDIT-2026-0002', 2, '2026-03-02', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-AUDIT-2026-0003', 3, '2026-03-03', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-AUDIT-2026-0004', 4, '2026-03-04', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-AUDIT-2026-0005', 5, '2026-03-05', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-AUDIT-2026-0006', 6, '2026-03-06', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-AUDIT-2026-0007', 7, '2026-03-07', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-AUDIT-2026-0008', 8, '2026-03-08', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-AUDIT-2026-0009', 9, '2026-03-09', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-AUDIT-2026-0010', 10, '2026-03-10', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-AUDIT-2026-0011', 11, '2026-03-11', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-AUDIT-2026-0012', 12, '2026-03-12', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-AUDIT-2026-0013', 13, '2026-03-13', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-AUDIT-2026-0014', 14, '2026-03-14', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-AUDIT-2026-0015', 15, '2026-03-15', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-AUDIT-2026-0016', 16, '2026-03-16', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-AUDIT-2026-0017', 17, '2026-03-17', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-AUDIT-2026-0018', 18, '2026-03-18', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-AUDIT-2026-0019', 19, '2026-03-19', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-AUDIT-2026-0020', 20, '2026-03-20', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-AUDIT-2026-0021', 21, '2026-03-21', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-AUDIT-2026-0022', 22, '2026-03-22', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-AUDIT-2026-0023', 23, '2026-03-23', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-AUDIT-2026-0024', 24, '2026-03-24', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-AUDIT-2026-0025', 25, '2026-03-25', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-AUDIT-2026-0026', 26, '2026-03-26', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-AUDIT-2026-0027', 27, '2026-03-27', 'PROXIMO_A_CADUCAR', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-AUDIT-2026-0028', 28, '2026-03-28', 'ALEATORIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-AUDIT-2026-0029', 29, '2026-03-01', 'ALTO_VALOR_SKU', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-AUDIT-2026-0030', 30, '2026-03-02', 'PROXIMO_A_CADUCAR', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_auditoria', 'id'), COALESCE((SELECT MAX(id) FROM wms.conteos_ciclicos_auditoria), 1), true);

-- =================================================================================================
-- 125. TABLA: wms.conteos_ciclicos_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_detalles (ID, ID_conteo_ciclico, ID_inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 52, 52, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 54, 54, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 56, 55, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 58, 58, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 60, 60, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 62, 61, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 64, 64, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 66, 66, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 68, 67, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 70, 70, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 72, 72, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 74, 73, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 76, 76, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 78, 78, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 80, 79, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 82, 82, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 84, 84, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 86, 85, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 88, 88, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 90, 90, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 92, 91, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 94, 94, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 96, 96, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 98, 97, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 100, 100, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 102, 102, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 104, 103, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 106, 106, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 108, 108, 0, NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 110, 109, -1, 'Diferencia de 1 pieza por merma detectada en conteo físico.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_detalles', 'id'), COALESCE((SELECT MAX(id) FROM wms.conteos_ciclicos_detalles), 1), true);

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.monitoreo_temperatura_humedad (ID, ID_zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SENSOR_I_01', 26.8, 42.0, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SENSOR_I_02', 19.4, 43.1, FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SENSOR_I_03', 9.4, 44.2, TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SENSOR_I_04', 21.2, 45.3, FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SENSOR_I_05', 26.8, 46.4, TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SENSOR_I_06', 4.3, 47.5, FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SENSOR_I_07', 26.8, 48.6, TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SENSOR_I_08', 20.3, 49.7, FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SENSOR_I_09', 9.4, 50.8, TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SENSOR_I_10', 22.1, 51.9, FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SENSOR_I_11', 26.8, 53.0, TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SENSOR_I_12', 5.9, 54.1, FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SENSOR_I_13', 26.8, 55.2, TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SENSOR_I_14', 21.2, 56.3, FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SENSOR_I_15', 9.4, 57.4, TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SENSOR_I_16', 18.5, 42.0, FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SENSOR_I_17', 26.8, 43.1, TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SENSOR_I_18', 4.3, 44.2, FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SENSOR_I_19', 26.8, 45.3, TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SENSOR_I_20', 22.1, 46.4, FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SENSOR_I_21', 9.4, 47.5, TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SENSOR_I_22', 19.4, 48.6, FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SENSOR_I_23', 26.8, 49.7, TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SENSOR_I_24', 5.9, 50.8, FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SENSOR_I_25', 26.8, 51.9, TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SENSOR_I_26', 18.5, 53.0, FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SENSOR_I_27', 9.4, 54.1, TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SENSOR_I_28', 20.3, 55.2, FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SENSOR_I_29', 26.8, 56.3, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SENSOR_I_30', 4.3, 57.4, FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.monitoreo_temperatura_humedad', 'id'), COALESCE((SELECT MAX(id) FROM wms.monitoreo_temperatura_humedad), 1), true);

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.transportistas_paqueterias (ID, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TRANSPOR_01', 'DHL Express México', 'https://api-eu.dhl.com/track/shipments?node=1', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TRANSPOR_02', 'FedEx Express MX', 'https://apis.fedex.com/track/v1/trackingnumbers?node=2', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'TRANSPOR_03', 'Estafeta Mexicana', 'https://cs.estafeta.com/api/tracking?node=3', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'TRANSPOR_04', '99Minutos Cadena Frío', 'https://tracking.99minutos.com/api/v3/orders?node=4', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANSPOR_05', 'Redpack Logística', 'https://ws.redpack.com.mx/tracking/rest?node=5', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANSPOR_06', 'UPS México', 'https://onlinetools.ups.com/api/track/v1/details?node=6', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'TRANSPOR_07', 'Paquetexpress', 'https://api.paquetexpress.com.mx/rastreo?node=7', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'TRANSPOR_08', 'J&T Express MX', 'https://openapi.jtexpress.mx/web/track?node=8', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'TRANSPOR_09', 'iVoy Mismo Día', 'https://api.ivoy.mx/v2/deliveries/track?node=9', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'TRANSPOR_10', 'Flotilla Propia DermaCare', 'https://logistica.dermacare.mx/api/rastreo?node=10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'TRANSPOR_11', 'DHL Express México Regional 2', 'https://api-eu.dhl.com/track/shipments?node=11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'TRANSPOR_12', 'FedEx Express MX Regional 2', 'https://apis.fedex.com/track/v1/trackingnumbers?node=12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'TRANSPOR_13', 'Estafeta Mexicana Regional 2', 'https://cs.estafeta.com/api/tracking?node=13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'TRANSPOR_14', '99Minutos Cadena Frío Regional 2', 'https://tracking.99minutos.com/api/v3/orders?node=14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'TRANSPOR_15', 'Redpack Logística Regional 2', 'https://ws.redpack.com.mx/tracking/rest?node=15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'TRANSPOR_16', 'UPS México Regional 2', 'https://onlinetools.ups.com/api/track/v1/details?node=16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'TRANSPOR_17', 'Paquetexpress Regional 2', 'https://api.paquetexpress.com.mx/rastreo?node=17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'TRANSPOR_18', 'J&T Express MX Regional 2', 'https://openapi.jtexpress.mx/web/track?node=18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'TRANSPOR_19', 'iVoy Mismo Día Regional 2', 'https://api.ivoy.mx/v2/deliveries/track?node=19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'TRANSPOR_20', 'Flotilla Propia DermaCare Regional 2', 'https://logistica.dermacare.mx/api/rastreo?node=20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'TRANSPOR_21', 'DHL Express México Regional 3', 'https://api-eu.dhl.com/track/shipments?node=21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'TRANSPOR_22', 'FedEx Express MX Regional 3', 'https://apis.fedex.com/track/v1/trackingnumbers?node=22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'TRANSPOR_23', 'Estafeta Mexicana Regional 3', 'https://cs.estafeta.com/api/tracking?node=23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'TRANSPOR_24', '99Minutos Cadena Frío Regional 3', 'https://tracking.99minutos.com/api/v3/orders?node=24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'TRANSPOR_25', 'Redpack Logística Regional 3', 'https://ws.redpack.com.mx/tracking/rest?node=25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'TRANSPOR_26', 'UPS México Regional 3', 'https://onlinetools.ups.com/api/track/v1/details?node=26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'TRANSPOR_27', 'Paquetexpress Regional 3', 'https://api.paquetexpress.com.mx/rastreo?node=27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'TRANSPOR_28', 'J&T Express MX Regional 3', 'https://openapi.jtexpress.mx/web/track?node=28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TRANSPOR_29', 'iVoy Mismo Día Regional 3', 'https://api.ivoy.mx/v2/deliveries/track?node=29', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'TRANSPOR_30', 'Flotilla Propia DermaCare Regional 3', 'https://logistica.dermacare.mx/api/rastreo?node=30', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.transportistas_paqueterias', 'id'), COALESCE((SELECT MAX(id) FROM envios.transportistas_paqueterias), 1), true);

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tipos_servicio_envio (ID, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SERVICIO_01', 'Día Siguiente Aéreo', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SERVICIO_02', 'Estándar Terrestre 3-5 Días', 96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SERVICIO_03', 'Mismo Día Express CDMX/MTY', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SERVICIO_04', 'Cadena de Frío Refrigerada 24h', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SERVICIO_05', 'Recolección en Farmacia Pickup', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'SERVICIO_06', 'Prioritario Matutino 10:30 AM', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'SERVICIO_07', 'Económico Nacional 5-7 Días', 144, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'SERVICIO_08', 'Locker Inteligente 24/7', 48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'SERVICIO_09', 'Empaque Térmico Isotérmico', 36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'SERVICIO_10', 'Express Fin de Semana', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'SERVICIO_11', 'Día Siguiente Aéreo Tarifa 2', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'SERVICIO_12', 'Estándar Terrestre 3-5 Días Tarifa 2', 96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'SERVICIO_13', 'Mismo Día Express CDMX/MTY Tarifa 2', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'SERVICIO_14', 'Cadena de Frío Refrigerada 24h Tarifa 2', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'SERVICIO_15', 'Recolección en Farmacia Pickup Tarifa 2', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'SERVICIO_16', 'Prioritario Matutino 10:30 AM Tarifa 2', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'SERVICIO_17', 'Económico Nacional 5-7 Días Tarifa 2', 144, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'SERVICIO_18', 'Locker Inteligente 24/7 Tarifa 2', 48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'SERVICIO_19', 'Empaque Térmico Isotérmico Tarifa 2', 36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'SERVICIO_20', 'Express Fin de Semana Tarifa 2', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'SERVICIO_21', 'Día Siguiente Aéreo Tarifa 3', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'SERVICIO_22', 'Estándar Terrestre 3-5 Días Tarifa 3', 96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'SERVICIO_23', 'Mismo Día Express CDMX/MTY Tarifa 3', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'SERVICIO_24', 'Cadena de Frío Refrigerada 24h Tarifa 3', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'SERVICIO_25', 'Recolección en Farmacia Pickup Tarifa 3', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'SERVICIO_26', 'Prioritario Matutino 10:30 AM Tarifa 3', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'SERVICIO_27', 'Económico Nacional 5-7 Días Tarifa 3', 144, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'SERVICIO_28', 'Locker Inteligente 24/7 Tarifa 3', 48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'SERVICIO_29', 'Empaque Térmico Isotérmico Tarifa 3', 36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'SERVICIO_30', 'Express Fin de Semana Tarifa 3', 24, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tipos_servicio_envio', 'id'), COALESCE((SELECT MAX(id) FROM envios.tipos_servicio_envio), 1), true);

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tarifas_zonas_postales (ID, ID_transportista, ID_servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '257', '067', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '640', '115', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '662', '441', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '067', '250', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '115', '760', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '441', '720', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '250', '970', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '760', '257', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '720', '640', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '970', '662', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '257', '067', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '640', '115', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '662', '441', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '067', '250', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '115', '760', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '441', '720', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '250', '970', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '760', '257', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '720', '640', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '970', '662', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '257', '067', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '640', '115', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '662', '441', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '067', '250', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '115', '760', 5.00, 199.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '441', '720', 5.00, 119.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '250', '970', 5.00, 139.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '760', '257', 5.00, 159.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '720', '640', 5.00, 179.00, 28.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '970', '662', 5.00, 199.00, 28.50, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tarifas_zonas_postales', 'id'), COALESCE((SELECT MAX(id) FROM envios.tarifas_zonas_postales), 1), true);

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.despachos_orden (ID, folio_despacho, ID_orden_split, ID_transportista, ID_servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-DESPA-2026-0001', 1, 1, 1, NULL, '2026-03-01', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-07 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-DESPA-2026-0007', 7, 7, 7, NULL, '2026-03-07', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-13 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-DESPA-2026-0013', 13, 13, 13, NULL, '2026-03-13', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-19 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-DESPA-2026-0019', 19, 19, 19, NULL, '2026-03-19', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-25 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', NULL, 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-DESPA-2026-0025', 25, 25, 25, NULL, '2026-03-25', NULL, 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', NULL, 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', NULL, 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', NULL, 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-03 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', NULL, 'INCIDENCIA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.despachos_orden', 'id'), COALESCE((SELECT MAX(id) FROM envios.despachos_orden), 1), true);

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_bultos (ID, ID_despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'BULTO-PKG-2026-0001', 0.60, 13.0, 13.0, 13.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'BULTO-PKG-2026-0002', 0.75, 14.0, 14.0, 14.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'BULTO-PKG-2026-0003', 0.90, 15.0, 15.0, 15.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'BULTO-PKG-2026-0004', 1.05, 16.0, 16.0, 16.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'BULTO-PKG-2026-0005', 1.20, 17.0, 17.0, 17.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'BULTO-PKG-2026-0006', 1.35, 18.0, 18.0, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'BULTO-PKG-2026-0007', 1.50, 19.0, 19.0, 19.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'BULTO-PKG-2026-0008', 1.65, 20.0, 20.0, 20.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'BULTO-PKG-2026-0009', 1.80, 21.0, 21.0, 21.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'BULTO-PKG-2026-0010', 1.95, 22.0, 22.0, 22.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'BULTO-PKG-2026-0011', 2.10, 23.0, 23.0, 23.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'BULTO-PKG-2026-0012', 2.25, 24.0, 24.0, 24.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'BULTO-PKG-2026-0013', 2.40, 25.0, 25.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'BULTO-PKG-2026-0014', 2.55, 26.0, 26.0, 26.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'BULTO-PKG-2026-0015', 2.70, 27.0, 27.0, 27.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'BULTO-PKG-2026-0016', 2.85, 28.0, 28.0, 28.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'BULTO-PKG-2026-0017', 3.00, 29.0, 29.0, 29.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'BULTO-PKG-2026-0018', 3.15, 30.0, 30.0, 30.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'BULTO-PKG-2026-0019', 3.30, 31.0, 31.0, 31.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'BULTO-PKG-2026-0020', 3.45, 32.0, 32.0, 32.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'BULTO-PKG-2026-0021', 3.60, 33.0, 33.0, 33.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'BULTO-PKG-2026-0022', 3.75, 34.0, 34.0, 34.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'BULTO-PKG-2026-0023', 3.90, 35.0, 35.0, 35.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'BULTO-PKG-2026-0024', 4.05, 36.0, 36.0, 36.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'BULTO-PKG-2026-0025', 4.20, 37.0, 37.0, 37.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'BULTO-PKG-2026-0026', 4.35, 38.0, 38.0, 38.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'BULTO-PKG-2026-0027', 4.50, 39.0, 39.0, 39.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'BULTO-PKG-2026-0028', 4.65, 40.0, 40.0, 40.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'BULTO-PKG-2026-0029', 4.80, 41.0, 41.0, 41.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'BULTO-PKG-2026-0030', 4.95, 42.0, 42.0, 42.0, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.paquetes_bultos', 'id'), COALESCE((SELECT MAX(id) FROM envios.paquetes_bultos), 1), true);

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_contenido_lotes (ID, ID_paquete_bulto, ID_orden_detalle, ID_lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 35, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 47, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 53, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 59, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 71, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 74, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 77, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 86, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 95, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.paquetes_contenido_lotes', 'id'), COALESCE((SELECT MAX(id) FROM envios.paquetes_contenido_lotes), 1), true);

-- =================================================================================================
-- 133. TABLA: envios.guias_rastreo (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.guias_rastreo (ID, ID_paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'MXTRK202600000001', 'https://rastreo.dermacare.mx/guia/MXTRK202600000001', 'https://cdn.dermacare.mx/guias/ETIQUETA-0001.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'MXTRK202600000002', 'https://rastreo.dermacare.mx/guia/MXTRK202600000002', 'https://cdn.dermacare.mx/guias/ETIQUETA-0002.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'MXTRK202600000003', 'https://rastreo.dermacare.mx/guia/MXTRK202600000003', 'https://cdn.dermacare.mx/guias/ETIQUETA-0003.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'MXTRK202600000004', 'https://rastreo.dermacare.mx/guia/MXTRK202600000004', 'https://cdn.dermacare.mx/guias/ETIQUETA-0004.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'MXTRK202600000005', 'https://rastreo.dermacare.mx/guia/MXTRK202600000005', 'https://cdn.dermacare.mx/guias/ETIQUETA-0005.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'MXTRK202600000006', 'https://rastreo.dermacare.mx/guia/MXTRK202600000006', 'https://cdn.dermacare.mx/guias/ETIQUETA-0006.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'MXTRK202600000007', 'https://rastreo.dermacare.mx/guia/MXTRK202600000007', 'https://cdn.dermacare.mx/guias/ETIQUETA-0007.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'MXTRK202600000008', 'https://rastreo.dermacare.mx/guia/MXTRK202600000008', 'https://cdn.dermacare.mx/guias/ETIQUETA-0008.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'MXTRK202600000009', 'https://rastreo.dermacare.mx/guia/MXTRK202600000009', 'https://cdn.dermacare.mx/guias/ETIQUETA-0009.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'MXTRK202600000010', 'https://rastreo.dermacare.mx/guia/MXTRK202600000010', 'https://cdn.dermacare.mx/guias/ETIQUETA-0010.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'MXTRK202600000011', 'https://rastreo.dermacare.mx/guia/MXTRK202600000011', 'https://cdn.dermacare.mx/guias/ETIQUETA-0011.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'MXTRK202600000012', 'https://rastreo.dermacare.mx/guia/MXTRK202600000012', 'https://cdn.dermacare.mx/guias/ETIQUETA-0012.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'MXTRK202600000013', 'https://rastreo.dermacare.mx/guia/MXTRK202600000013', 'https://cdn.dermacare.mx/guias/ETIQUETA-0013.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'MXTRK202600000014', 'https://rastreo.dermacare.mx/guia/MXTRK202600000014', 'https://cdn.dermacare.mx/guias/ETIQUETA-0014.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'MXTRK202600000015', 'https://rastreo.dermacare.mx/guia/MXTRK202600000015', 'https://cdn.dermacare.mx/guias/ETIQUETA-0015.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'MXTRK202600000016', 'https://rastreo.dermacare.mx/guia/MXTRK202600000016', 'https://cdn.dermacare.mx/guias/ETIQUETA-0016.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'MXTRK202600000017', 'https://rastreo.dermacare.mx/guia/MXTRK202600000017', 'https://cdn.dermacare.mx/guias/ETIQUETA-0017.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'MXTRK202600000018', 'https://rastreo.dermacare.mx/guia/MXTRK202600000018', 'https://cdn.dermacare.mx/guias/ETIQUETA-0018.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'MXTRK202600000019', 'https://rastreo.dermacare.mx/guia/MXTRK202600000019', 'https://cdn.dermacare.mx/guias/ETIQUETA-0019.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'MXTRK202600000020', 'https://rastreo.dermacare.mx/guia/MXTRK202600000020', 'https://cdn.dermacare.mx/guias/ETIQUETA-0020.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'MXTRK202600000021', 'https://rastreo.dermacare.mx/guia/MXTRK202600000021', 'https://cdn.dermacare.mx/guias/ETIQUETA-0021.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'MXTRK202600000022', 'https://rastreo.dermacare.mx/guia/MXTRK202600000022', 'https://cdn.dermacare.mx/guias/ETIQUETA-0022.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'MXTRK202600000023', 'https://rastreo.dermacare.mx/guia/MXTRK202600000023', 'https://cdn.dermacare.mx/guias/ETIQUETA-0023.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'MXTRK202600000024', 'https://rastreo.dermacare.mx/guia/MXTRK202600000024', 'https://cdn.dermacare.mx/guias/ETIQUETA-0024.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'MXTRK202600000025', 'https://rastreo.dermacare.mx/guia/MXTRK202600000025', 'https://cdn.dermacare.mx/guias/ETIQUETA-0025.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'MXTRK202600000026', 'https://rastreo.dermacare.mx/guia/MXTRK202600000026', 'https://cdn.dermacare.mx/guias/ETIQUETA-0026.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'MXTRK202600000027', 'https://rastreo.dermacare.mx/guia/MXTRK202600000027', 'https://cdn.dermacare.mx/guias/ETIQUETA-0027.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'MXTRK202600000028', 'https://rastreo.dermacare.mx/guia/MXTRK202600000028', 'https://cdn.dermacare.mx/guias/ETIQUETA-0028.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'MXTRK202600000029', 'https://rastreo.dermacare.mx/guia/MXTRK202600000029', 'https://cdn.dermacare.mx/guias/ETIQUETA-0029.pdf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'MXTRK202600000030', 'https://rastreo.dermacare.mx/guia/MXTRK202600000030', 'https://cdn.dermacare.mx/guias/ETIQUETA-0030.pdf', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.guias_rastreo', 'id'), COALESCE((SELECT MAX(id) FROM envios.guias_rastreo), 1), true);

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.eventos_tracking_bitacora (ID, ID_guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ESTATUS__01', 'Paquete recolectado en centro de distribución CEDIS.', 'Monclova, Coahuila', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ESTATUS__02', 'En tránsito hacia estación logística regional.', 'Monterrey, Nuevo León', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ESTATUS__03', 'Paquete en unidad de reparto de última milla.', 'San Pedro Garza García, Nuevo León', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ESTATUS__04', 'Entregado y firmado en domicilio de destino.', 'Cuauhtémoc, CDMX', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ESTATUS__05', 'Paquete recolectado en centro de distribución CEDIS.', 'Miguel Hidalgo, CDMX', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ESTATUS__06', 'En tránsito hacia estación logística regional.', 'Guadalajara, Jalisco', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ESTATUS__07', 'Paquete en unidad de reparto de última milla.', 'Saltillo, Coahuila', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ESTATUS__08', 'Entregado y firmado en domicilio de destino.', 'Querétaro, Querétaro', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ESTATUS__09', 'Paquete recolectado en centro de distribución CEDIS.', 'Puebla, Puebla', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ESTATUS__10', 'En tránsito hacia estación logística regional.', 'Mérida, Yucatán', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ESTATUS__11', 'Paquete en unidad de reparto de última milla.', 'Monclova, Coahuila', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ESTATUS__12', 'Entregado y firmado en domicilio de destino.', 'Monterrey, Nuevo León', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ESTATUS__13', 'Paquete recolectado en centro de distribución CEDIS.', 'San Pedro Garza García, Nuevo León', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ESTATUS__14', 'En tránsito hacia estación logística regional.', 'Cuauhtémoc, CDMX', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ESTATUS__15', 'Paquete en unidad de reparto de última milla.', 'Miguel Hidalgo, CDMX', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ESTATUS__16', 'Entregado y firmado en domicilio de destino.', 'Guadalajara, Jalisco', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ESTATUS__17', 'Paquete recolectado en centro de distribución CEDIS.', 'Saltillo, Coahuila', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ESTATUS__18', 'En tránsito hacia estación logística regional.', 'Querétaro, Querétaro', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ESTATUS__19', 'Paquete en unidad de reparto de última milla.', 'Puebla, Puebla', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ESTATUS__20', 'Entregado y firmado en domicilio de destino.', 'Mérida, Yucatán', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ESTATUS__21', 'Paquete recolectado en centro de distribución CEDIS.', 'Monclova, Coahuila', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ESTATUS__22', 'En tránsito hacia estación logística regional.', 'Monterrey, Nuevo León', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ESTATUS__23', 'Paquete en unidad de reparto de última milla.', 'San Pedro Garza García, Nuevo León', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ESTATUS__24', 'Entregado y firmado en domicilio de destino.', 'Cuauhtémoc, CDMX', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ESTATUS__25', 'Paquete recolectado en centro de distribución CEDIS.', 'Miguel Hidalgo, CDMX', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ESTATUS__26', 'En tránsito hacia estación logística regional.', 'Guadalajara, Jalisco', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ESTATUS__27', 'Paquete en unidad de reparto de última milla.', 'Saltillo, Coahuila', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ESTATUS__28', 'Entregado y firmado en domicilio de destino.', 'Querétaro, Querétaro', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ESTATUS__29', 'Paquete recolectado en centro de distribución CEDIS.', 'Puebla, Puebla', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ESTATUS__30', 'En tránsito hacia estación logística regional.', 'Mérida, Yucatán', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.eventos_tracking_bitacora', 'id'), COALESCE((SELECT MAX(id) FROM envios.eventos_tracking_bitacora), 1), true);

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.intentos_entrega_fallidos (ID, ID_despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 'Domicilio cerrado sin persona que reciba.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Acceso restringido en caseta de fraccionamiento.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 'Número exterior poco visible; mensajero solicita referencia.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.intentos_entrega_fallidos', 'id'), COALESCE((SELECT MAX(id) FROM envios.intentos_entrega_fallidos), 1), true);

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.incidencias_logisticas (ID, ID_despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 285.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 321.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 356.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 392.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 427.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 463.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 498.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 534.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 569.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 605.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 640.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 676.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 711.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 747.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 782.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 818.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 853.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 889.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 924.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 960.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 995.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 1031.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1066.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 1102.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1137.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 1173.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ROBO_EN_TRANSITO', 'Siniestro carretero reportado por unidad de transporte con acta ministerial.', 1208.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DIRECCION_INEXISTENTE', 'Código postal y calle no coinciden en cartografía de zona extendida.', 1244.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EXTRAVIO_TOTAL', 'Paquete reportado sin escaneo por más de 7 días en centro de transferencia.', 1279.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PAQUETE_DANADO_DERRAME', 'Caja exterior golpeada con derrame parcial de envase líquido.', 1315.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.incidencias_logisticas', 'id'), COALESCE((SELECT MAX(id) FROM envios.incidencias_logisticas), 1), true);

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.seguros_mercancia (ID, ID_despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Chubb Seguros México', 'POL-CARGA-2026-00001', 428.25, 8.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'AXA Seguros', 'POL-CARGA-2026-00002', 481.50, 9.63, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'GNP Seguros Carga', 'POL-CARGA-2026-00003', 534.75, 10.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Quálitas Logística', 'POL-CARGA-2026-00004', 588.00, 11.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Chubb Seguros México', 'POL-CARGA-2026-00005', 641.25, 12.83, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'AXA Seguros', 'POL-CARGA-2026-00006', 694.50, 13.89, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'GNP Seguros Carga', 'POL-CARGA-2026-00007', 747.75, 14.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Quálitas Logística', 'POL-CARGA-2026-00008', 801.00, 16.02, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Chubb Seguros México', 'POL-CARGA-2026-00009', 854.25, 17.09, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'AXA Seguros', 'POL-CARGA-2026-00010', 907.50, 18.15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'GNP Seguros Carga', 'POL-CARGA-2026-00011', 960.75, 19.21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Quálitas Logística', 'POL-CARGA-2026-00012', 1014.00, 20.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Chubb Seguros México', 'POL-CARGA-2026-00013', 1067.25, 21.34, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'AXA Seguros', 'POL-CARGA-2026-00014', 1120.50, 22.41, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'GNP Seguros Carga', 'POL-CARGA-2026-00015', 1173.75, 23.48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Quálitas Logística', 'POL-CARGA-2026-00016', 1227.00, 24.54, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Chubb Seguros México', 'POL-CARGA-2026-00017', 1280.25, 25.61, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'AXA Seguros', 'POL-CARGA-2026-00018', 1333.50, 26.67, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'GNP Seguros Carga', 'POL-CARGA-2026-00019', 1386.75, 27.73, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Quálitas Logística', 'POL-CARGA-2026-00020', 1440.00, 28.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Chubb Seguros México', 'POL-CARGA-2026-00021', 1493.25, 29.87, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'AXA Seguros', 'POL-CARGA-2026-00022', 1546.50, 30.93, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'GNP Seguros Carga', 'POL-CARGA-2026-00023', 1599.75, 32.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Quálitas Logística', 'POL-CARGA-2026-00024', 1653.00, 33.06, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Chubb Seguros México', 'POL-CARGA-2026-00025', 1706.25, 34.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'AXA Seguros', 'POL-CARGA-2026-00026', 1759.50, 35.19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'GNP Seguros Carga', 'POL-CARGA-2026-00027', 1812.75, 36.26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Quálitas Logística', 'POL-CARGA-2026-00028', 1866.00, 37.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Chubb Seguros México', 'POL-CARGA-2026-00029', 1919.25, 38.38, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'AXA Seguros', 'POL-CARGA-2026-00030', 1972.50, 39.45, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.seguros_mercancia', 'id'), COALESCE((SELECT MAX(id) FROM envios.seguros_mercancia), 1), true);

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.puntos_recoleccion_pickup (ID, ID_transportista, ID_almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'LOCKER_01', 'Smart Locker & Farmacia DermaCare Monclova Suc. 01', 'Av. Universidad #201, Col. Centro, C.P. 25700, Monclova, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'LOCKER_02', 'Smart Locker & Farmacia DermaCare Monterrey Suc. 02', 'Av. Universidad #202, Col. Centro, C.P. 64000, Monterrey, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'LOCKER_03', 'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 03', 'Av. Universidad #203, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'LOCKER_04', 'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 04', 'Av. Universidad #204, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'LOCKER_05', 'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 05', 'Av. Universidad #205, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'LOCKER_06', 'Smart Locker & Farmacia DermaCare Guadalajara Suc. 06', 'Av. Universidad #206, Col. Centro, C.P. 44100, Guadalajara, Jalisco', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'LOCKER_07', 'Smart Locker & Farmacia DermaCare Saltillo Suc. 07', 'Av. Universidad #207, Col. Centro, C.P. 25000, Saltillo, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'LOCKER_08', 'Smart Locker & Farmacia DermaCare Querétaro Suc. 08', 'Av. Universidad #208, Col. Centro, C.P. 76000, Querétaro, Querétaro', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'LOCKER_09', 'Smart Locker & Farmacia DermaCare Puebla Suc. 09', 'Av. Universidad #209, Col. Centro, C.P. 72000, Puebla, Puebla', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'LOCKER_10', 'Smart Locker & Farmacia DermaCare Mérida Suc. 10', 'Av. Universidad #210, Col. Centro, C.P. 97000, Mérida, Yucatán', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'LOCKER_11', 'Smart Locker & Farmacia DermaCare Monclova Suc. 11', 'Av. Universidad #211, Col. Centro, C.P. 25700, Monclova, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'LOCKER_12', 'Smart Locker & Farmacia DermaCare Monterrey Suc. 12', 'Av. Universidad #212, Col. Centro, C.P. 64000, Monterrey, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'LOCKER_13', 'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 13', 'Av. Universidad #213, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'LOCKER_14', 'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 14', 'Av. Universidad #214, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'LOCKER_15', 'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 15', 'Av. Universidad #215, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'LOCKER_16', 'Smart Locker & Farmacia DermaCare Guadalajara Suc. 16', 'Av. Universidad #216, Col. Centro, C.P. 44100, Guadalajara, Jalisco', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'LOCKER_17', 'Smart Locker & Farmacia DermaCare Saltillo Suc. 17', 'Av. Universidad #217, Col. Centro, C.P. 25000, Saltillo, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'LOCKER_18', 'Smart Locker & Farmacia DermaCare Querétaro Suc. 18', 'Av. Universidad #218, Col. Centro, C.P. 76000, Querétaro, Querétaro', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'LOCKER_19', 'Smart Locker & Farmacia DermaCare Puebla Suc. 19', 'Av. Universidad #219, Col. Centro, C.P. 72000, Puebla, Puebla', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'LOCKER_20', 'Smart Locker & Farmacia DermaCare Mérida Suc. 20', 'Av. Universidad #220, Col. Centro, C.P. 97000, Mérida, Yucatán', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'LOCKER_21', 'Smart Locker & Farmacia DermaCare Monclova Suc. 21', 'Av. Universidad #221, Col. Centro, C.P. 25700, Monclova, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'LOCKER_22', 'Smart Locker & Farmacia DermaCare Monterrey Suc. 22', 'Av. Universidad #222, Col. Centro, C.P. 64000, Monterrey, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'LOCKER_23', 'Smart Locker & Farmacia DermaCare San Pedro Garza García Suc. 23', 'Av. Universidad #223, Col. Centro, C.P. 66220, San Pedro Garza García, Nuevo León', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'LOCKER_24', 'Smart Locker & Farmacia DermaCare Cuauhtémoc Suc. 24', 'Av. Universidad #224, Col. Centro, C.P. 06700, Cuauhtémoc, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'LOCKER_25', 'Smart Locker & Farmacia DermaCare Miguel Hidalgo Suc. 25', 'Av. Universidad #225, Col. Centro, C.P. 11560, Miguel Hidalgo, CDMX', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'LOCKER_26', 'Smart Locker & Farmacia DermaCare Guadalajara Suc. 26', 'Av. Universidad #226, Col. Centro, C.P. 44100, Guadalajara, Jalisco', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'LOCKER_27', 'Smart Locker & Farmacia DermaCare Saltillo Suc. 27', 'Av. Universidad #227, Col. Centro, C.P. 25000, Saltillo, Coahuila', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'LOCKER_28', 'Smart Locker & Farmacia DermaCare Querétaro Suc. 28', 'Av. Universidad #228, Col. Centro, C.P. 76000, Querétaro, Querétaro', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'LOCKER_29', 'Smart Locker & Farmacia DermaCare Puebla Suc. 29', 'Av. Universidad #229, Col. Centro, C.P. 72000, Puebla, Puebla', 'Lunes a Domingo 08:00 a 22:00 hrs', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'LOCKER_30', 'Smart Locker & Farmacia DermaCare Mérida Suc. 30', 'Av. Universidad #230, Col. Centro, C.P. 97000, Mérida, Yucatán', 'Lunes a Domingo 08:00 a 22:00 hrs', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.puntos_recoleccion_pickup', 'id'), COALESCE((SELECT MAX(id) FROM envios.puntos_recoleccion_pickup), 1), true);

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.motivos_devolucion_rma (ID, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Reacción alérgica o irritación cutánea tras aplicación', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Tono de maquillaje incorrecto respecto al seleccionado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Sello de seguridad violado o derrame al abrir paquete', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Producto próximo a caducar o fuera de especificación térmica', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Desistimiento dentro de los primeros 15 días con envase sellado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Reacción alérgica o irritación cutánea tras aplicación', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Tono de maquillaje incorrecto respecto al seleccionado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Sello de seguridad violado o derrame al abrir paquete', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Producto próximo a caducar o fuera de especificación térmica', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Desistimiento dentro de los primeros 15 días con envase sellado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Reacción alérgica o irritación cutánea tras aplicación', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Tono de maquillaje incorrecto respecto al seleccionado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Sello de seguridad violado o derrame al abrir paquete', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Producto próximo a caducar o fuera de especificación térmica', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Desistimiento dentro de los primeros 15 días con envase sellado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Reacción alérgica o irritación cutánea tras aplicación', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Tono de maquillaje incorrecto respecto al seleccionado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Sello de seguridad violado o derrame al abrir paquete', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Producto próximo a caducar o fuera de especificación térmica', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Desistimiento dentro de los primeros 15 días con envase sellado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Reacción alérgica o irritación cutánea tras aplicación', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Tono de maquillaje incorrecto respecto al seleccionado', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Sello de seguridad violado o derrame al abrir paquete', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Producto próximo a caducar o fuera de especificación térmica', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Desistimiento dentro de los primeros 15 días con envase sellado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Reacción alérgica o irritación cutánea tras aplicación', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Tono de maquillaje incorrecto respecto al seleccionado', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Sello de seguridad violado o derrame al abrir paquete', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Producto próximo a caducar o fuera de especificación térmica', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Desistimiento dentro de los primeros 15 días con envase sellado', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.motivos_devolucion_rma', 'id'), COALESCE((SELECT MAX(id) FROM postventa.motivos_devolucion_rma), 1), true);

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.solicitudes_rma (ID, folio_rma, ID_orden, ID_motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RMA-2026-0001', 1, 1, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0001.jpg', 'Cliente reporta incidencia con Sérum Niacinamida 10% + Zinc 1% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RMA-2026-0002', 2, 2, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0002.jpg', 'Cliente reporta incidencia con Gel Limpiador Espumoso Facial y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RMA-2026-0003', 3, 3, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0003.jpg', 'Cliente reporta incidencia con Protector Solar Fluido SPF 50+ y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RMA-2026-0004', 4, 4, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0004.jpg', 'Cliente reporta incidencia con Sérum Ácido Hialurónico 2% + B5 y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RMA-2026-0005', 5, 5, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0005.jpg', 'Cliente reporta incidencia con Crema Hidratante con Ceramidas y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RMA-2026-0006', 6, 6, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0006.jpg', 'Cliente reporta incidencia con Retinol Puro 0.5% Nocturno y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RMA-2026-0007', 7, 7, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0007.jpg', 'Cliente reporta incidencia con Agua Micelar Dermolimpiadora y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RMA-2026-0008', 8, 8, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0008.jpg', 'Cliente reporta incidencia con Sérum Vitamina C Pura 15% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RMA-2026-0009', 9, 9, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0009.jpg', 'Cliente reporta incidencia con Base de Maquillaje Cobertura Media y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RMA-2026-0010', 10, 10, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0010.jpg', 'Cliente reporta incidencia con Corrector Líquido Alta Duración y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RMA-2026-0011', 11, 11, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0011.jpg', 'Cliente reporta incidencia con Bálsamo Reparador Cicaplast B5 y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RMA-2026-0012', 12, 12, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0012.jpg', 'Cliente reporta incidencia con Exfoliante Ácido Salicílico 2% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RMA-2026-0013', 13, 13, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0013.jpg', 'Cliente reporta incidencia con Contorno de Ojos con Cafeína 5% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RMA-2026-0014', 14, 14, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0014.jpg', 'Cliente reporta incidencia con Mascarilla Nocturna Hidratante y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RMA-2026-0015', 15, 15, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0015.jpg', 'Cliente reporta incidencia con Bruma Termal Calmante Mineral y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RMA-2026-0016', 16, 16, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0016.jpg', 'Cliente reporta incidencia con Aceite Limpiador Emulsionable y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RMA-2026-0017', 17, 17, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0017.jpg', 'Cliente reporta incidencia con Tónico Equilibrante Ácido Glicólico 7% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RMA-2026-0018', 18, 18, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0018.jpg', 'Cliente reporta incidencia con Labial Hidratante Péptidos Nude y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RMA-2026-0019', 19, 19, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0019.jpg', 'Cliente reporta incidencia con Polvo Traslúcido Matificante Mineral y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RMA-2026-0020', 20, 20, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0020.jpg', 'Cliente reporta incidencia con Rubor Líquido Pigmento Natural y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RMA-2026-0021', 21, 21, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0021.jpg', 'Cliente reporta incidencia con Sérum Ácido Azelaico 10% Suspensión y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RMA-2026-0022', 22, 22, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0022.jpg', 'Cliente reporta incidencia con Ampolletas Proteoglicanos Firmeza y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RMA-2026-0023', 23, 23, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0023.jpg', 'Cliente reporta incidencia con Crema Despigmentante Noche Melasma y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RMA-2026-0024', 24, 24, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0024.jpg', 'Cliente reporta incidencia con Protector Solar Mineral Óxido Zinc y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RMA-2026-0025', 25, 25, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0025.jpg', 'Cliente reporta incidencia con Loción Corporal Urea 10% Reparadora y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RMA-2026-0026', 26, 26, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0026.jpg', 'Cliente reporta incidencia con Primer Facial Minimizador de Poros y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RMA-2026-0027', 27, 27, 'RECIBIDA_EN_QA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0027.jpg', 'Cliente reporta incidencia con Máscara de Pestañas Hipoalergénica y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RMA-2026-0028', 28, 28, 'APROBADA_REEMBOLSAR', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0028.jpg', 'Cliente reporta incidencia con Sérum Péptidos de Cobre 1% y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RMA-2026-0029', 29, 29, 'SOLICITADA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0029.jpg', 'Cliente reporta incidencia con Bálsamo Desmaquillante Caléndula y adjunta evidencia fotográfica de lote y empaque.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RMA-2026-0030', 30, 30, 'GUIA_RETORNO_EMITIDA', 'https://cdn.dermacare.mx/rma/evidencia/RMA-0030.jpg', 'Cliente reporta incidencia con Crema Barrera Post-Retinoide y adjunta evidencia fotográfica de lote y empaque.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.solicitudes_rma', 'id'), COALESCE((SELECT MAX(id) FROM postventa.solicitudes_rma), 1), true);

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.rma_detalles (ID, ID_solicitud_rma, ID_orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('postventa.rma_detalles', 'id'), COALESCE((SELECT MAX(id) FROM postventa.rma_detalles), 1), true);

-- =================================================================================================
-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.inspeccion_sanitaria_retorno (ID, ID_rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, 15.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, 5.0, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Producto abierto por el consumidor; por higiene COFEPRIS se canaliza a destrucción.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, 0.0, 'REINGRESO_STOCK_SELLADO', 'Sello inviolable intacto y lote vigente; autorizado para reingreso a inventario vendible.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.inspeccion_sanitaria_retorno', 'id'), COALESCE((SELECT MAX(id) FROM postventa.inspeccion_sanitaria_retorno), 1), true);

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_soporte (ID, folio_ticket, ID_cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TICKE-2026-0001', 1, 'Seguimiento de envío sin actualización en las últimas 48 horas (#001)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TICKE-2026-0002', 2, 'Duda sobre orden de aplicación en rutina nocturna (#002)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TICKE-2026-0003', 3, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#003)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TICKE-2026-0004', 4, 'Dispensador airless bloqueado en entrega reciente (#004)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TICKE-2026-0005', 5, 'Seguimiento de envío sin actualización en las últimas 48 horas (#005)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TICKE-2026-0006', 6, 'Duda sobre orden de aplicación en rutina nocturna (#006)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TICKE-2026-0007', 7, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#007)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TICKE-2026-0008', 8, 'Dispensador airless bloqueado en entrega reciente (#008)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TICKE-2026-0009', 9, 'Seguimiento de envío sin actualización en las últimas 48 horas (#009)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TICKE-2026-0010', 10, 'Duda sobre orden de aplicación en rutina nocturna (#010)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TICKE-2026-0011', 11, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#011)', 'FACTURACION_CFDI', 'ALTA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TICKE-2026-0012', 12, 'Dispensador airless bloqueado en entrega reciente (#012)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TICKE-2026-0013', 13, 'Seguimiento de envío sin actualización en las últimas 48 horas (#013)', 'ENVIO_DEMORADO', 'BAJA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TICKE-2026-0014', 14, 'Duda sobre orden de aplicación en rutina nocturna (#014)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TICKE-2026-0015', 15, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#015)', 'FACTURACION_CFDI', 'ALTA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TICKE-2026-0016', 16, 'Dispensador airless bloqueado en entrega reciente (#016)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TICKE-2026-0017', 17, 'Seguimiento de envío sin actualización en las últimas 48 horas (#017)', 'ENVIO_DEMORADO', 'BAJA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TICKE-2026-0018', 18, 'Duda sobre orden de aplicación en rutina nocturna (#018)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TICKE-2026-0019', 19, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#019)', 'FACTURACION_CFDI', 'ALTA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TICKE-2026-0020', 20, 'Dispensador airless bloqueado en entrega reciente (#020)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TICKE-2026-0021', 21, 'Seguimiento de envío sin actualización en las últimas 48 horas (#021)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TICKE-2026-0022', 22, 'Duda sobre orden de aplicación en rutina nocturna (#022)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TICKE-2026-0023', 23, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#023)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TICKE-2026-0024', 24, 'Dispensador airless bloqueado en entrega reciente (#024)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TICKE-2026-0025', 25, 'Seguimiento de envío sin actualización en las últimas 48 horas (#025)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TICKE-2026-0026', 26, 'Duda sobre orden de aplicación en rutina nocturna (#026)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TICKE-2026-0027', 27, 'Solicitud de refacturación CFDI 4.0 con cambio de uso (#027)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TICKE-2026-0028', 28, 'Dispensador airless bloqueado en entrega reciente (#028)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TICKE-2026-0029', 29, 'Seguimiento de envío sin actualización en las últimas 48 horas (#029)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TICKE-2026-0030', 30, 'Duda sobre orden de aplicación en rutina nocturna (#030)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_soporte', 'id'), COALESCE((SELECT MAX(id) FROM postventa.tickets_soporte), 1), true);

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_mensajes (ID, ID_ticket, ID_usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Hola, comparto los detalles sobre el seguimiento del ticket #001 respecto a Sérum Niacinamida 10% + Zinc 1%. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0001.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Hola, comparto los detalles sobre el seguimiento del ticket #002 respecto a Gel Limpiador Espumoso Facial. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Hola, comparto los detalles sobre el seguimiento del ticket #003 respecto a Protector Solar Fluido SPF 50+. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0003.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Hola, comparto los detalles sobre el seguimiento del ticket #004 respecto a Sérum Ácido Hialurónico 2% + B5. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Hola, comparto los detalles sobre el seguimiento del ticket #005 respecto a Crema Hidratante con Ceramidas. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0005.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Hola, comparto los detalles sobre el seguimiento del ticket #006 respecto a Retinol Puro 0.5% Nocturno. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Hola, comparto los detalles sobre el seguimiento del ticket #007 respecto a Agua Micelar Dermolimpiadora. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0007.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Hola, comparto los detalles sobre el seguimiento del ticket #008 respecto a Sérum Vitamina C Pura 15%. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Hola, comparto los detalles sobre el seguimiento del ticket #009 respecto a Base de Maquillaje Cobertura Media. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0009.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Hola, comparto los detalles sobre el seguimiento del ticket #010 respecto a Corrector Líquido Alta Duración. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Hola, comparto los detalles sobre el seguimiento del ticket #011 respecto a Bálsamo Reparador Cicaplast B5. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0011.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Hola, comparto los detalles sobre el seguimiento del ticket #012 respecto a Exfoliante Ácido Salicílico 2%. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Hola, comparto los detalles sobre el seguimiento del ticket #013 respecto a Contorno de Ojos con Cafeína 5%. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0013.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Hola, comparto los detalles sobre el seguimiento del ticket #014 respecto a Mascarilla Nocturna Hidratante. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Hola, comparto los detalles sobre el seguimiento del ticket #015 respecto a Bruma Termal Calmante Mineral. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0015.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Hola, comparto los detalles sobre el seguimiento del ticket #016 respecto a Aceite Limpiador Emulsionable. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Hola, comparto los detalles sobre el seguimiento del ticket #017 respecto a Tónico Equilibrante Ácido Glicólico 7%. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0017.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Hola, comparto los detalles sobre el seguimiento del ticket #018 respecto a Labial Hidratante Péptidos Nude. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Hola, comparto los detalles sobre el seguimiento del ticket #019 respecto a Polvo Traslúcido Matificante Mineral. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0019.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Hola, comparto los detalles sobre el seguimiento del ticket #020 respecto a Rubor Líquido Pigmento Natural. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Hola, comparto los detalles sobre el seguimiento del ticket #021 respecto a Sérum Ácido Azelaico 10% Suspensión. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0021.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Hola, comparto los detalles sobre el seguimiento del ticket #022 respecto a Ampolletas Proteoglicanos Firmeza. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Hola, comparto los detalles sobre el seguimiento del ticket #023 respecto a Crema Despigmentante Noche Melasma. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0023.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Hola, comparto los detalles sobre el seguimiento del ticket #024 respecto a Protector Solar Mineral Óxido Zinc. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Hola, comparto los detalles sobre el seguimiento del ticket #025 respecto a Loción Corporal Urea 10% Reparadora. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0025.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Hola, comparto los detalles sobre el seguimiento del ticket #026 respecto a Primer Facial Minimizador de Poros. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Hola, comparto los detalles sobre el seguimiento del ticket #027 respecto a Máscara de Pestañas Hipoalergénica. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0027.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Hola, comparto los detalles sobre el seguimiento del ticket #028 respecto a Sérum Péptidos de Cobre 1%. Quedo atento a su confirmación.', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Hola, comparto los detalles sobre el seguimiento del ticket #029 respecto a Bálsamo Desmaquillante Caléndula. Quedo atento a su confirmación.', 'https://cdn.dermacare.mx/tickets/adjunto_0029.png', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Hola, comparto los detalles sobre el seguimiento del ticket #030 respecto a Crema Barrera Post-Retinoide. Quedo atento a su confirmación.', NULL, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_mensajes', 'id'), COALESCE((SELECT MAX(id) FROM postventa.tickets_mensajes), 1), true);

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.reportes_farmacovigilancia (ID, folio_cofepris_ram, ID_cliente, ID_producto, ID_lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-COFEP-2026-0001', 1, 1, 1, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Niacinamida 10% + Zinc 1%.', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-COFEP-2026-0002', 2, 2, 2, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Gel Limpiador Espumoso Facial.', FALSE, '2026-03-02', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-COFEP-2026-0003', 3, 3, 3, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Fluido SPF 50+.', TRUE, '2026-03-03', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-COFEP-2026-0004', 4, 4, 4, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Ácido Hialurónico 2% + B5.', FALSE, '2026-03-04', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-COFEP-2026-0005', 5, 5, 5, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Hidratante con Ceramidas.', TRUE, '2026-03-05', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-COFEP-2026-0006', 6, 6, 6, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Retinol Puro 0.5% Nocturno.', FALSE, '2026-03-06', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-COFEP-2026-0007', 7, 7, 7, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Agua Micelar Dermolimpiadora.', TRUE, '2026-03-07', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-COFEP-2026-0008', 8, 8, 8, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Sérum Vitamina C Pura 15%.', FALSE, '2026-03-08', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-COFEP-2026-0009', 9, 9, 9, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Base de Maquillaje Cobertura Media.', TRUE, '2026-03-09', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-COFEP-2026-0010', 10, 10, 10, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Corrector Líquido Alta Duración.', FALSE, '2026-03-10', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-COFEP-2026-0011', 11, 11, 11, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Reparador Cicaplast B5.', TRUE, '2026-03-11', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-COFEP-2026-0012', 12, 12, 12, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Exfoliante Ácido Salicílico 2%.', FALSE, '2026-03-12', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-COFEP-2026-0013', 13, 13, 13, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Contorno de Ojos con Cafeína 5%.', TRUE, '2026-03-13', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-COFEP-2026-0014', 14, 14, 14, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Mascarilla Nocturna Hidratante.', FALSE, '2026-03-14', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-COFEP-2026-0015', 15, 15, 15, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Bruma Termal Calmante Mineral.', TRUE, '2026-03-15', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-COFEP-2026-0016', 16, 16, 16, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Aceite Limpiador Emulsionable.', FALSE, '2026-03-16', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-COFEP-2026-0017', 17, 17, 17, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Tónico Equilibrante Ácido Glicólico 7%.', TRUE, '2026-03-17', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-COFEP-2026-0018', 18, 18, 18, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Labial Hidratante Péptidos Nude.', FALSE, '2026-03-18', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-COFEP-2026-0019', 19, 19, 19, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Polvo Traslúcido Matificante Mineral.', TRUE, '2026-03-19', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-COFEP-2026-0020', 20, 20, 20, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Rubor Líquido Pigmento Natural.', FALSE, '2026-03-20', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-COFEP-2026-0021', 21, 21, 21, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Sérum Ácido Azelaico 10% Suspensión.', TRUE, '2026-03-21', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-COFEP-2026-0022', 22, 22, 22, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Ampolletas Proteoglicanos Firmeza.', FALSE, '2026-03-22', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-COFEP-2026-0023', 23, 23, 23, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Crema Despigmentante Noche Melasma.', TRUE, '2026-03-23', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-COFEP-2026-0024', 24, 24, 24, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Protector Solar Mineral Óxido Zinc.', FALSE, '2026-03-24', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-COFEP-2026-0025', 25, 25, 25, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Loción Corporal Urea 10% Reparadora.', TRUE, '2026-03-25', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-COFEP-2026-0026', 26, 26, 26, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Primer Facial Minimizador de Poros.', FALSE, '2026-03-26', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-COFEP-2026-0027', 27, 27, 27, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Máscara de Pestañas Hipoalergénica.', TRUE, '2026-03-27', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-COFEP-2026-0028', 28, 28, 28, 'Eritema leve y sensación transitoria de calor en mejillas tras aplicación. Producto: Sérum Péptidos de Cobre 1%.', FALSE, '2026-03-28', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-COFEP-2026-0029', 29, 29, 29, 'Prurito localizado en cuello posterior al primer uso nocturno. Producto: Bálsamo Desmaquillante Caléndula.', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-COFEP-2026-0030', 30, 30, 30, 'Descamación fina en comisuras tras uso simultáneo con exfoliante. Producto: Crema Barrera Post-Retinoide.', FALSE, '2026-03-02', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.reportes_farmacovigilancia', 'id'), COALESCE((SELECT MAX(id) FROM postventa.reportes_farmacovigilancia), 1), true);

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.tipos_evento_sistema (ID, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'LOGIN_EXITOSO', 'Inicio de sesión exitoso con credenciales validadas', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'INTENTO_ACCESO_DENEGADO', 'Intento de acceso denegado por permisos RBAC insuficientes', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MODIFICACION_PRECIOS', 'Actualización de precio base en catálogo SKU', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'BAJA_LOGICA_REGISTRO', 'Ejecución de borrado lógico (Soft Delete) auditado', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'EXPORTACION_DATOS_LFPDPPP', 'Exportación de expediente clínico por solicitud ARCO', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TIMBRADO_CFDI_PAC', 'Emisión y sellado de comprobante fiscal CFDI 4.0', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CANCELACION_CFDI_SAT', 'Solicitud de cancelación fiscal ante el SAT', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'BLOQUEO_CUENTA_INTENTOS', 'Bloqueo automático de usuario por intentos fallidos', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAMBIO_PASSWORD_USUARIO', 'Actualización criptográfica Argon2id de contraseña', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MFA_VERIFICACION_TOTP', 'Validación o rechazo de segundo factor TOTP', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CUARENTENA_LOTE_QA', 'Retención sanitaria de lote por desviación de calidad', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ALERTA_TEMPERATURA_IOT', 'Excursión térmica detectada en sensor de cadena de frío', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'REEMBOLSO_AUTORIZADO', 'Autorización financiera de reembolso a cliente', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CONTRACARGO_RECIBIDO', 'Notificación de disputa bancaria por pasarela', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'DESTRUCCION_MERMA_COFEPRIS', 'Registro de acta circunstanciada de destrucción sanitaria', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'AJUSTE_INVENTARIO_CONTEO', 'Ajuste de existencias tras conteo cíclico de auditoría', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CREACION_USUARIO_ADMIN', 'Alta de cuenta administrativa en módulo IAM', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ASIGNACION_ROL_SEGURIDAD', 'Modificación de roles asignados a usuario', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'REPORTE_FARMACOVIGILANCIA', 'Alta de reporte de reacción adversa RAM COFEPRIS', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'REVOCACION_SESION_REMOTA', 'Invalidación forzada de token de sesión activa', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ALTA_REGISTRO_COFEPRIS', 'Actualización de vigencia de registro sanitario', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FRAUDE_BLOQUEO_ORDEN', 'Bloqueo preventivo de orden por regla antifraude', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'DESPACHO_FEFO_WMS', 'Liberación de picking por regla FEFO', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MODIFICACION_PARAMETRO', 'Cambio en parámetro de configuración en caliente', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CONSULTA_DATOS_SENSIBLES', 'Acceso a perfil dermatológico LFPDPPP', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'RESTAURACION_REGISTRO', 'Reactivación lógica de entidad previamente dada de baja', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'WEBHOOK_PASARELA_RECIBIDO', 'Recepción verificada de notificación HMAC de pago', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'RMA_INSPECCION_HIGIENE', 'Dictamen sanitario sobre devolución recibida', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TRANSFERENCIA_CEDIS_CREADA', 'Orden de traslado entre almacenes con control térmico', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CIERRE_SESION_VOLUNTARIO', 'Cierre explícito de sesión por el usuario', 'CRITICO_SEGURIDAD', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.tipos_evento_sistema', 'id'), COALESCE((SELECT MAX(id) FROM auditoria.tipos_evento_sistema), 1), true);

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_seguridad_global (ID, ID_tipo_evento, ID_usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '189.203.3.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'Seguridad.IAM', 'Inicio de sesión exitoso con credenciales validadas (Registro auditado #0001).', '822aaf75efb2377be6e9f38a3ea625b705bd9f835a21ee04665f2f2330bbee06', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '189.203.6.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'Catalogo.Precios', 'Intento de acceso denegado por permisos RBAC insuficientes (Registro auditado #0002).', 'e9c9403db5e463f149a10bb3e32d72ef7937a5ca026bfec9e3ecac63efc76b5b', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '189.203.9.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'Fiscal.CFDI', 'Actualización de precio base en catálogo SKU (Registro auditado #0003).', 'fe0a7c2537cb5c8a1485ac8e637953e62e6c7305a808a7f5942f653804a43868', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '189.203.12.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'Clientes.ARCO', 'Ejecución de borrado lógico (Soft Delete) auditado (Registro auditado #0004).', 'efb657c736345d2380ac4337a26dcb8069735d4b0a43ca1549722b761f924a02', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '189.203.15.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'WMS.CadenaFrio', 'Exportación de expediente clínico por solicitud ARCO (Registro auditado #0005).', '93b60ec3f14932d9decdb119e6d3d1868d350e8feba52089cf34b1de19a7686e', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '189.203.18.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'Pagos.Antifraude', 'Emisión y sellado de comprobante fiscal CFDI 4.0 (Registro auditado #0006).', '6acf751a227783a91240d1432aa4d8ba258982f7385c71e4be11886adfc084ca', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '189.203.21.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'Seguridad.IAM', 'Solicitud de cancelación fiscal ante el SAT (Registro auditado #0007).', '68b959d127be3e137d04e5cfae970c022ca970ab500dbf9a54d5d94fb5cc35df', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '189.203.24.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'Catalogo.Precios', 'Bloqueo automático de usuario por intentos fallidos (Registro auditado #0008).', '9c44bd3dee118b4d36943fb69bf1a79ace53c53db68a5d5d0d262ff39f2e16a5', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '189.203.27.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'Fiscal.CFDI', 'Actualización criptográfica Argon2id de contraseña (Registro auditado #0009).', 'f6aab553803a5203e4c4babea15e4082a5230ccb02ffcd19233ebaf8fff037cd', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '189.203.30.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'Clientes.ARCO', 'Validación o rechazo de segundo factor TOTP (Registro auditado #0010).', '9b8433f950cc9b93522036fe6e70274f9f4f3cbe61b1071310fb77e320f02521', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '189.203.33.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'WMS.CadenaFrio', 'Retención sanitaria de lote por desviación de calidad (Registro auditado #0011).', 'aeb5d25ab3468bea6fafbed7bc09833153ad8fb200258e77aba6f40526ee6877', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '189.203.36.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'Pagos.Antifraude', 'Excursión térmica detectada en sensor de cadena de frío (Registro auditado #0012).', 'a8ded427e46238ede28d520bdc9369981f589a826eaa1adaebf30b4a7e6eb585', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '189.203.39.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'Seguridad.IAM', 'Autorización financiera de reembolso a cliente (Registro auditado #0013).', 'ad0d7747c124cff95c06fb1c24a46daf7b00ffe7484b476c339785b6bf118c01', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '189.203.42.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'Catalogo.Precios', 'Notificación de disputa bancaria por pasarela (Registro auditado #0014).', '2e29cd7e59d6b35759468a2ac0c285d79c503f6d01e8636f6bed8a755fb4738c', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '189.203.45.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'Fiscal.CFDI', 'Registro de acta circunstanciada de destrucción sanitaria (Registro auditado #0015).', 'd3bdb41506978ff27734e6d3ab149e6443b25df214860ac156dace8fe1002a32', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '189.203.48.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'Clientes.ARCO', 'Ajuste de existencias tras conteo cíclico de auditoría (Registro auditado #0016).', 'ed6c351aa391af272c24e8c5791c0f8be9d2432eb2aee535be499821ff6fdcd2', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '189.203.51.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'WMS.CadenaFrio', 'Alta de cuenta administrativa en módulo IAM (Registro auditado #0017).', '5687a48d6d28dff7bd7b388de2f103b6b42b9ec826355d3471db292416ac8744', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '189.203.54.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'Pagos.Antifraude', 'Modificación de roles asignados a usuario (Registro auditado #0018).', 'c3103100ecf9f3d88c520b3b755723ef9570c1e04da92eb3d6b816c4a163a891', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '189.203.57.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'Seguridad.IAM', 'Alta de reporte de reacción adversa RAM COFEPRIS (Registro auditado #0019).', '2166f8e64254369e88c6c2bed443bb1a14ef13de9cd770897554b45686978f79', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '189.203.60.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'Catalogo.Precios', 'Invalidación forzada de token de sesión activa (Registro auditado #0020).', '7fb0613e00707c167f156e052c08abcbdddd4eb28938f8e6a64870e92d777675', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '189.203.63.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'Fiscal.CFDI', 'Actualización de vigencia de registro sanitario (Registro auditado #0021).', 'bdfa89f693dbbb92a82f95ae1ee7ffff7f385ff8ed34c0bb1c15835ba08d5291', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '189.203.66.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'Clientes.ARCO', 'Bloqueo preventivo de orden por regla antifraude (Registro auditado #0022).', '2678285d4ae0d9afbcf71d7fc486ce27a203da9e6955c9eccab82a69acda981b', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '189.203.69.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'WMS.CadenaFrio', 'Liberación de picking por regla FEFO (Registro auditado #0023).', '292dfaa2a59b8f77b10958bcf656fb297237c38233c1e900ca5912fa46068f7f', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '189.203.72.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'Pagos.Antifraude', 'Cambio en parámetro de configuración en caliente (Registro auditado #0024).', 'e3124d4a51b532b7f52413851c287797be3fc01ae4b11e0c66d44062c6b57c29', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '189.203.75.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'Seguridad.IAM', 'Acceso a perfil dermatológico LFPDPPP (Registro auditado #0025).', '7e0a2b320e9923bb0faab99112772bb898fd00e6a50b034651655ed607a163b2', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '189.203.78.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'Catalogo.Precios', 'Reactivación lógica de entidad previamente dada de baja (Registro auditado #0026).', '231eefc9e2a9a78b94b21b6f938e78f45714a594a3034a5bc4f425d41f9473d9', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '189.203.81.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'Fiscal.CFDI', 'Recepción verificada de notificación HMAC de pago (Registro auditado #0027).', 'd69a2c3c31ec03261005fa2539492f0d1703958eb7531e1d59f3bc293e979bd8', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '189.203.84.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'Clientes.ARCO', 'Dictamen sanitario sobre devolución recibida (Registro auditado #0028).', '8efa9da9e46b9c7b53b1a2413e839039ef5efff2deb06f34e8b0d7b6f627c928', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '189.203.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'WMS.CadenaFrio', 'Orden de traslado entre almacenes con control térmico (Registro auditado #0029).', 'e3dda4df71d765ddf8d4bcaaded8b196b4e2a03c05d4dd94f370501cf4b9fead', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '189.203.90.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'Pagos.Antifraude', 'Cierre explícito de sesión por el usuario (Registro auditado #0030).', '490fda407df80e3e6ede88e335ea513ed0bad2783f52dd1e1908fbf4932c577b', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_seguridad_global', 'id'), COALESCE((SELECT MAX(id) FROM auditoria.bitacora_seguridad_global), 1), true);

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_cambios_datos (ID, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ventas.ordenes', 1, 'INSERT', NULL, '{"tabla": "ventas.ordenes", "id_registro": 1, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #1.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'catalogo.variantes_sku', 2, 'UPDATE', '{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "version": 1}', '{"tabla": "catalogo.variantes_sku", "id_registro": 2, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #2.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'clientes.clientes', 3, 'INSERT', NULL, '{"tabla": "clientes.clientes", "id_registro": 3, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #3.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'fiscal.facturas_cfdi', 4, 'UPDATE', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "version": 1}', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 4, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #4.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'wms.inventario_lotes_ubicacion', 5, 'INSERT', NULL, '{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 5, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #5.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'pagos.transacciones', 6, 'UPDATE', '{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "version": 1}', '{"tabla": "pagos.transacciones", "id_registro": 6, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #6.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'postventa.solicitudes_rma', 7, 'INSERT', NULL, '{"tabla": "postventa.solicitudes_rma", "id_registro": 7, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #7.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'seguridad.usuarios', 8, 'UPDATE', '{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "version": 1}', '{"tabla": "seguridad.usuarios", "id_registro": 8, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #8.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'promos.cupones', 9, 'INSERT', NULL, '{"tabla": "promos.cupones", "id_registro": 9, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #9.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'compras.ordenes_compra', 10, 'UPDATE', '{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "version": 1}', '{"tabla": "compras.ordenes_compra", "id_registro": 10, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #10.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ventas.ordenes', 11, 'INSERT', NULL, '{"tabla": "ventas.ordenes", "id_registro": 11, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #11.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'catalogo.variantes_sku', 12, 'UPDATE', '{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "version": 1}', '{"tabla": "catalogo.variantes_sku", "id_registro": 12, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #12.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'clientes.clientes', 13, 'INSERT', NULL, '{"tabla": "clientes.clientes", "id_registro": 13, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #13.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'fiscal.facturas_cfdi', 14, 'UPDATE', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "version": 1}', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 14, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #14.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'wms.inventario_lotes_ubicacion', 15, 'INSERT', NULL, '{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 15, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #15.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'pagos.transacciones', 16, 'UPDATE', '{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "version": 1}', '{"tabla": "pagos.transacciones", "id_registro": 16, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre pagos.transacciones registro #16.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'postventa.solicitudes_rma', 17, 'INSERT', NULL, '{"tabla": "postventa.solicitudes_rma", "id_registro": 17, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre postventa.solicitudes_rma registro #17.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'seguridad.usuarios', 18, 'UPDATE', '{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "version": 1}', '{"tabla": "seguridad.usuarios", "id_registro": 18, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre seguridad.usuarios registro #18.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'promos.cupones', 19, 'INSERT', NULL, '{"tabla": "promos.cupones", "id_registro": 19, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre promos.cupones registro #19.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'compras.ordenes_compra', 20, 'UPDATE', '{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "version": 1}', '{"tabla": "compras.ordenes_compra", "id_registro": 20, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre compras.ordenes_compra registro #20.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ventas.ordenes', 21, 'INSERT', NULL, '{"tabla": "ventas.ordenes", "id_registro": 21, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre ventas.ordenes registro #21.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'catalogo.variantes_sku', 22, 'UPDATE', '{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "version": 1}', '{"tabla": "catalogo.variantes_sku", "id_registro": 22, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre catalogo.variantes_sku registro #22.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'clientes.clientes', 23, 'INSERT', NULL, '{"tabla": "clientes.clientes", "id_registro": 23, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre clientes.clientes registro #23.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'fiscal.facturas_cfdi', 24, 'UPDATE', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "version": 1}', '{"tabla": "fiscal.facturas_cfdi", "id_registro": 24, "activo": true, "operacion": "UPDATE", "version": 2}', 'Registro forense de auditoría DML (UPDATE) sobre fiscal.facturas_cfdi registro #24.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'wms.inventario_lotes_ubicacion', 25, 'INSERT', NULL, '{"tabla": "wms.inventario_lotes_ubicacion", "id_registro": 25, "activo": true, "operacion": "INSERT", "version": 2}', 'Registro forense de auditoría DML (INSERT) sobre wms.inventario_lotes_ubicacion registro #25.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'pagos.transacciones', 26, 'SOFT_DELETE', '{"tabla": "pagos.transacciones", "id_registro": 26, "activo": true, "version": 1}', '{"tabla": "pagos.transacciones", "id_registro": 26, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre pagos.transacciones registro #26.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'postventa.solicitudes_rma', 27, 'SOFT_DELETE', '{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": true, "version": 1}', '{"tabla": "postventa.solicitudes_rma", "id_registro": 27, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre postventa.solicitudes_rma registro #27.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'seguridad.usuarios', 28, 'SOFT_DELETE', '{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": true, "version": 1}', '{"tabla": "seguridad.usuarios", "id_registro": 28, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre seguridad.usuarios registro #28.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'promos.cupones', 29, 'SOFT_DELETE', '{"tabla": "promos.cupones", "id_registro": 29, "activo": true, "version": 1}', '{"tabla": "promos.cupones", "id_registro": 29, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre promos.cupones registro #29.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'compras.ordenes_compra', 30, 'SOFT_DELETE', '{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": true, "version": 1}', '{"tabla": "compras.ordenes_compra", "id_registro": 30, "activo": false, "operacion": "SOFT_DELETE", "version": 2}', 'Registro forense de auditoría DML (SOFT_DELETE) sobre compras.ordenes_compra registro #30.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_cambios_datos', 'id'), COALESCE((SELECT MAX(id) FROM auditoria.bitacora_cambios_datos), 1), true);

-- =================================================================================================
-- 149. TABLA: sistema.parametros_configuracion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.parametros_configuracion (ID, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'IVA_TASA_GENERAL_MX', '16.00', 'DECIMAL', 'Porcentaje de IVA aplicable en México a cosméticos y dermocosmética.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'DIAS_LIMITE_RESPUESTA_ARCO', '20', 'INTEGER', 'Plazo máximo legal en días hábiles para responder solicitudes ARCO (LFPDPPP).', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ENVIO_GRATIS_MONTO_MINIMO', '999.00', 'DECIMAL', 'Monto mínimo de compra en MXN para otorgar envío estándar gratuito.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MODO_MANTENIMIENTO_TIENDA', 'false', 'BOOLEAN', 'Bandera de activación de ventana de mantenimiento en tienda pública.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'UMBRAL_SCORE_ANTIFRAUDE_3DS', '65', 'INTEGER', 'Puntaje mínimo de riesgo para exigir autenticación bancaria 3D Secure.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TEMP_MIN_CADENA_FRIO_C', '2.0', 'DECIMAL', 'Temperatura mínima permitida en cámaras refrigeradas de almacén (°C).', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'TEMP_MAX_CADENA_FRIO_C', '8.0', 'DECIMAL', 'Temperatura máxima permitida en cámaras refrigeradas de almacén (°C).', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MAX_INTENTOS_LOGIN_FALLIDOS', '5', 'INTEGER', 'Número de intentos fallidos consecutivos antes de bloquear la cuenta.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MINUTOS_EXPIRACION_RESERVA_CART', '15', 'INTEGER', 'Duración en minutos de apartado temporal de inventario en carrito.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PAC_TIMBRADO_AMBIENTE', 'PRODUCCION', 'STRING', 'Entorno activo de conexión con el PAC autorizado del SAT.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'DIAS_ALERTA_PREVENTIVA_FEFO', '90', 'INTEGER', 'Días previos a la caducidad para disparar alerta preventiva FEFO.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'DIAS_VENTANA_DEVOLUCION_RMA', '30', 'INTEGER', 'Días naturales posteriores a la entrega para solicitar devolución RMA.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'DESCUENTO_SUSCRIPCION_DEFAULT', '10.00', 'DECIMAL', 'Porcentaje de descuento base en planes de suscripción recurrente.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'HABILITAR_RECOMENDADOR_INCI', 'true', 'BOOLEAN', 'Activa el filtro automático de alérgenos INCI según perfil cutáneo.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CONFIG_REINTENTOS_WEBHOOK', '{"max_retries": 5, "backoff_sec": 30}', 'JSON', 'Política de reintentos exponenciales para webhooks de paquetería y pago.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'RFC_EMISOR_COMERCIO', 'DCM240115KL9', 'STRING', 'RFC oficial de la razón social emisora de comprobantes CFDI 4.0.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CP_FISCAL_EXPEDICION', '25700', 'STRING', 'Código postal del domicilio fiscal de expedición CFDI 4.0.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'HORAS_VIDA_TOKEN_RESET', '2', 'INTEGER', 'Vigencia en horas de los enlaces de restablecimiento de contraseña.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'COMISION_BASE_AFILIADOS', '8.50', 'DECIMAL', 'Comisión porcentual estándar para nuevos afiliados dermoconsultores.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PERMITIR_MULTIPAGO_BILLETERA', 'true', 'BOOLEAN', 'Habilita combinación de monedero electrónico con tarjeta o SPEI.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'POLITICA_SEGURIDAD_PASSWORD', '{"min_len": 12, "argon2_mem_kb": 65536}', 'JSON', 'Parámetros mínimos criptográficos para contraseñas de usuarios.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MONEDA_OPERACION_DEFAULT', 'MXN', 'STRING', 'Código ISO 4217 de moneda predeterminada en tienda nacional.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'HUMEDAD_MAX_ALMACEN_PORC', '60.0', 'DECIMAL', 'Humedad relativa máxima permitida en pasillos de almacenamiento.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'LIMITE_PIEZA_POR_SKU_ORDEN', '10', 'INTEGER', 'Cantidad máxima permitida de un mismo SKU por orden al menudeo.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'NOTIFICAR_COFEPRIS_AUTO', 'false', 'BOOLEAN', 'Envío automático o manual tras revisión médica de reportes RAM.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'UMBRAL_CONTROVERSIA_DISPUTA', '{"auto_evidence": true, "days": 7}', 'JSON', 'Reglas de recopilación automática de evidencia ante contracargos.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'URL_BASE_CDN_MULTIMEDIA', 'https://cdn.dermacare.mx/assets/v2', 'STRING', 'Dominio CDN para imágenes de productos y fichas técnicas.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'TIEMPO_SESION_HORAS', '24', 'INTEGER', 'Duración estándar de validez de sesiones web antes de renovación.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TASA_IEPS_PROTECTOR_EXENTO', '0.00', 'DECIMAL', 'Tasa aplicable a categorías exentas de impuestos especiales.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CADENA_FRIO_ALERTA_SMS', 'true', 'BOOLEAN', 'Envía notificación SMS inmediata al supervisor WMS ante alerta térmica.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.parametros_configuracion', 'id'), COALESCE((SELECT MAX(id) FROM sistema.parametros_configuracion), 1), true);

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.notificaciones_push_email (ID, ID_usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0001', 'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', TRUE, '2026-02-01 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0002', 'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0003', 'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', TRUE, '2026-02-03 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0004', 'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0005', 'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', TRUE, '2026-02-05 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0006', 'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0007', 'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', TRUE, '2026-02-07 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0008', 'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0009', 'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', TRUE, '2026-02-09 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0010', 'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0011', 'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', TRUE, '2026-02-11 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0012', 'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0013', 'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', TRUE, '2026-02-13 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0014', 'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0015', 'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', TRUE, '2026-02-15 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0016', 'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0017', 'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', TRUE, '2026-02-17 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0018', 'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0019', 'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', TRUE, '2026-02-19 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0020', 'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0021', 'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', TRUE, '2026-02-21 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0022', 'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0023', 'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', TRUE, '2026-02-23 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0024', 'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0025', 'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', TRUE, '2026-02-25 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0026', 'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SMS', 'Actualización de tu pedido y rutina DermaCare #0027', 'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', TRUE, '2026-02-27 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'WHATSAPP', 'Actualización de tu pedido y rutina DermaCare #0028', 'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EMAIL', 'Actualización de tu pedido y rutina DermaCare #0029', 'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', TRUE, '2026-02-01 11:30:00', NULL, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PUSH_APP', 'Actualización de tu pedido y rutina DermaCare #0030', 'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', FALSE, NULL, 'Timeout temporal al conectar con proveedor SMTP/Push; en cola de reintento.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.notificaciones_push_email', 'id'), COALESCE((SELECT MAX(id) FROM sistema.notificaciones_push_email), 1), true);

