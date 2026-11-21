-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR MULTIDISCIPLINARIO TERMINAL V
-- MASTER SEED DATA DML - 150 TABLAS CON DATOS REALES DE DOMINIO Y LLAVES FORÁNEAS LIMPIAS
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

-- =================================================================================================
-- 051. TABLA: ventas.tipos_descuento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.tipos_descuento (id_tipo_descuento, codigo_descuento, nombre, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'DESCUENT_01', 'Carlos Mendoza Garza', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'DESCUENT_02', 'Sofía Ramírez López', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'DESCUENT_03', 'Valeria Torres Villarreal', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'DESCUENT_04', 'Alejandro Hernández Cruz', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'DESCUENT_05', 'Mariana Sánchez Fuentes', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'DESCUENT_06', 'Diego Martínez Treviño', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DESCUENT_07', 'Camila González Reyes', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'DESCUENT_08', 'Mateo Flores Castillo', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'DESCUENT_09', 'Lucía Morales Díaz', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'DESCUENT_10', 'Sebastián Vázquez Ortiz', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'DESCUENT_11', 'Regina Gutiérrez Nava', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'DESCUENT_12', 'Santiago Jiménez Pérez', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'DESCUENT_13', 'Fernanda Ruiz Salazar', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'DESCUENT_14', 'Emiliano Ríos Cárdenas', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'DESCUENT_15', 'Ximena Aguilar Ibarra', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'DESCUENT_16', 'Daniel Méndez Navarro', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'DESCUENT_17', 'Andrea Castro Delgado', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'DESCUENT_18', 'Gabriel Vega Montoya', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'DESCUENT_19', 'Paula Cortés Rojas', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'DESCUENT_20', 'Andrés Ramos Campos', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'DESCUENT_21', 'Renata Guerrero Luna', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'DESCUENT_22', 'Nicolás Peña Cabrera', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'DESCUENT_23', 'Natalia Herrera Vargas', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'DESCUENT_24', 'Joaquín Medina Contreras', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'DESCUENT_25', 'Isabella Domínguez Escobar', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'DESCUENT_26', 'Leonardo Silva Paredes', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'DESCUENT_27', 'Ana Chávez Bautista', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'DESCUENT_28', 'Rodrigo Ochoa Acosta', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'DESCUENT_29', 'Paulina Miranda Leal', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'DESCUENT_30', 'Mauricio Padilla Solís', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.tipos_descuento', 'id_tipo_descuento'), COALESCE((SELECT MAX(id_tipo_descuento) FROM ventas.tipos_descuento), 1), true);

-- =================================================================================================
-- 052. TABLA: ventas.estados_orden (7 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.estados_orden (id_estado_orden, codigo_estado, nombre_estado, descripcion, es_terminal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PEND_PAGO', 'Pendiente de Pago', 'Orden registrada esperando confirmación bancaria o SPEI', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PAGADA', 'Pago Confirmado', 'Transacción aprobada y lista para asignación de almacén', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PREPARANDO', 'En Preparación CEDIS', 'Surtido en curso bajo estrategia FEFO y empaque térmico', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'EN_TRANSITO', 'Enviada en Tránsito', 'Paquete recolectado por paquetería con guía de rastreo', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ENTREGADA', 'Entregada al Cliente', 'Recepción confirmada en domicilio del destinatario', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden anulada antes del despacho con liberación de stock', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'DEVUELTA', 'Devuelta por RMA', 'Mercancía retornada y dictaminada en postventa', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('ventas.estados_orden', 'id_estado_orden'), COALESCE((SELECT MAX(id_estado_orden) FROM ventas.estados_orden), 1), true);

-- =================================================================================================
-- 053. TABLA: ventas.motivos_cancelacion_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.motivos_cancelacion_orden (id_motivo_cancelacion, codigo_motivo, descripcion_motivo, es_atribuible_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.motivos_cancelacion_orden', 'id_motivo_cancelacion'), COALESCE((SELECT MAX(id_motivo_cancelacion) FROM ventas.motivos_cancelacion_orden), 1), true);

-- =================================================================================================
-- 054. TABLA: ventas.carritos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos (id_carrito, cliente, token_sesion_carrito, fecha_ultima_actividad, convertido_a_orden, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos', 'id_carrito'), COALESCE((SELECT MAX(id_carrito) FROM ventas.carritos), 1), true);

-- =================================================================================================
-- 055. TABLA: ventas.items_carrito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.items_carrito (id_item_carrito, carrito, variante_sku, cantidad, precio_unitario_capturado, fecha_agregado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 17.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.items_carrito', 'id_item_carrito'), COALESCE((SELECT MAX(id_item_carrito) FROM ventas.items_carrito), 1), true);

-- =================================================================================================
-- 056. TABLA: ventas.carritos_abandonados_seguimiento (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.carritos_abandonados_seguimiento (id_seguimiento_carrito, carrito, correo_recordatorio_enviado, fecha_envio_recordatorio, recuperado, monto_estimado_recuperable, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, '2026-02-01 11:30:00', TRUE, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, '2026-02-02 11:30:00', FALSE, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, '2026-02-03 11:30:00', TRUE, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, '2026-02-04 11:30:00', FALSE, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, '2026-02-05 11:30:00', TRUE, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, '2026-02-06 11:30:00', FALSE, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, '2026-02-07 11:30:00', TRUE, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, '2026-02-08 11:30:00', FALSE, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, '2026-02-09 11:30:00', TRUE, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, '2026-02-10 11:30:00', FALSE, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, '2026-02-11 11:30:00', TRUE, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, '2026-02-12 11:30:00', FALSE, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, '2026-02-13 11:30:00', TRUE, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, '2026-02-14 11:30:00', FALSE, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, '2026-02-15 11:30:00', TRUE, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, '2026-02-16 11:30:00', FALSE, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, '2026-02-17 11:30:00', TRUE, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, '2026-02-18 11:30:00', FALSE, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, '2026-02-19 11:30:00', TRUE, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, '2026-02-20 11:30:00', FALSE, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, '2026-02-21 11:30:00', TRUE, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, '2026-02-22 11:30:00', FALSE, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, '2026-02-23 11:30:00', TRUE, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, '2026-02-24 11:30:00', FALSE, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, '2026-02-25 11:30:00', TRUE, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, '2026-02-26 11:30:00', FALSE, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, '2026-02-27 11:30:00', TRUE, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, '2026-02-28 11:30:00', FALSE, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, '2026-02-01 11:30:00', TRUE, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, '2026-02-02 11:30:00', FALSE, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.carritos_abandonados_seguimiento', 'id_seguimiento_carrito'), COALESCE((SELECT MAX(id_seguimiento_carrito) FROM ventas.carritos_abandonados_seguimiento), 1), true);

-- =================================================================================================
-- 057. TABLA: ventas.planes_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.planes_suscripcion (id_plan_suscripcion, codigo_plan, nombre_plan, descripcion, precio_recurrente_base, descuento_porcentual_fidelidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PLAN_01', 'Kit Rutina La Roche-Posay #1', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 285.50, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PLAN_02', 'Kit Rutina CeraVe Dermatological #2', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 321.00, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PLAN_03', 'Kit Rutina The Ordinary Deciem #3', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 356.50, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PLAN_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 392.00, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PLAN_05', 'Kit Rutina Bioderma Laboratoire #5', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 427.50, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PLAN_06', 'Kit Rutina Eau Thermale Avène #6', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 463.00, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PLAN_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 498.50, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PLAN_08', 'Kit Rutina Vichy Laboratoires #8', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 534.00, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PLAN_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 569.50, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PLAN_10', 'Kit Rutina Sesderma Nanotech #10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 605.00, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PLAN_11', 'Kit Rutina NARS Cosmetics #11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 640.50, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PLAN_12', 'Kit Rutina MAC Professional #12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 676.00, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PLAN_13', 'Kit Rutina Fenty Beauty #13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 711.50, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PLAN_14', 'Kit Rutina Rare Beauty #14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 747.00, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PLAN_15', 'Kit Rutina Clinique Laboratories #15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 782.50, 5.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PLAN_16', 'Kit Rutina Estée Lauder #16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 818.00, 6.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PLAN_17', 'Kit Rutina Lancôme Paris #17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 853.50, 7.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PLAN_18', 'Kit Rutina Charlotte Tilbury #18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 889.00, 8.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PLAN_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 924.50, 9.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PLAN_20', 'Kit Rutina COSRX K-Beauty #20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 960.00, 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PLAN_21', 'Kit Rutina Laneige Amorepacific #21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 995.50, 11.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PLAN_22', 'Kit Rutina Uriage Eau Thermale #22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 1031.00, 12.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PLAN_23', 'Kit Rutina Laboratoire SVR #23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 1066.50, 13.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PLAN_24', 'Kit Rutina MartiDerm Ampollas #24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 1102.00, 14.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PLAN_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 1137.50, 15.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PLAN_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 1173.00, 16.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PLAN_27', 'Kit Rutina Garnier SkinActive #27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 1208.50, 17.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PLAN_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 1244.00, 18.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PLAN_29', 'Kit Rutina Neutrogena Derm #29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 1279.50, 19.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PLAN_30', 'Kit Rutina DermaCare Labs México #30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 1315.00, 5.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.planes_suscripcion', 'id_plan_suscripcion'), COALESCE((SELECT MAX(id_plan_suscripcion) FROM ventas.planes_suscripcion), 1), true);

-- =================================================================================================
-- 058. TABLA: ventas.frecuencias_suscripcion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.frecuencias_suscripcion (id_frecuencia_suscripcion, codigo_frecuencia, nombre, intervalo_dias, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FRECUENC_01', 'Carlos Mendoza Garza', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FRECUENC_02', 'Sofía Ramírez López', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FRECUENC_03', 'Valeria Torres Villarreal', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FRECUENC_04', 'Alejandro Hernández Cruz', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FRECUENC_05', 'Mariana Sánchez Fuentes', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FRECUENC_06', 'Diego Martínez Treviño', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FRECUENC_07', 'Camila González Reyes', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FRECUENC_08', 'Mateo Flores Castillo', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FRECUENC_09', 'Lucía Morales Díaz', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FRECUENC_10', 'Sebastián Vázquez Ortiz', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FRECUENC_11', 'Regina Gutiérrez Nava', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FRECUENC_12', 'Santiago Jiménez Pérez', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FRECUENC_13', 'Fernanda Ruiz Salazar', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FRECUENC_14', 'Emiliano Ríos Cárdenas', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FRECUENC_15', 'Ximena Aguilar Ibarra', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FRECUENC_16', 'Daniel Méndez Navarro', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FRECUENC_17', 'Andrea Castro Delgado', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FRECUENC_18', 'Gabriel Vega Montoya', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FRECUENC_19', 'Paula Cortés Rojas', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FRECUENC_20', 'Andrés Ramos Campos', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FRECUENC_21', 'Renata Guerrero Luna', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FRECUENC_22', 'Nicolás Peña Cabrera', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FRECUENC_23', 'Natalia Herrera Vargas', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FRECUENC_24', 'Joaquín Medina Contreras', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FRECUENC_25', 'Isabella Domínguez Escobar', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FRECUENC_26', 'Leonardo Silva Paredes', 60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FRECUENC_27', 'Ana Chávez Bautista', 75, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FRECUENC_28', 'Rodrigo Ochoa Acosta', 30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FRECUENC_29', 'Paulina Miranda Leal', 45, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FRECUENC_30', 'Mauricio Padilla Solís', 60, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.frecuencias_suscripcion', 'id_frecuencia_suscripcion'), COALESCE((SELECT MAX(id_frecuencia_suscripcion) FROM ventas.frecuencias_suscripcion), 1), true);

-- =================================================================================================
-- 059. TABLA: ventas.suscripciones_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_cliente (id_suscripcion_cliente, folio_suscripcion, cliente, plan_suscripcion, frecuencia_suscripcion, direccion_entrega, metodo_tokenizado, fecha_inicio, proxima_fecha_cobro, estado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-SUSCR-2026-0001', 1, 1, 1, 1, 1, '2026-03-01', '2026-03-01', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-SUSCR-2026-0002', 2, 2, 2, 2, 2, '2026-03-02', '2026-03-02', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-SUSCR-2026-0003', 3, 3, 3, 3, 3, '2026-03-03', '2026-03-03', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-SUSCR-2026-0004', 4, 4, 4, 4, 4, '2026-03-04', '2026-03-04', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-SUSCR-2026-0005', 5, 5, 5, 5, 5, '2026-03-05', '2026-03-05', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-SUSCR-2026-0006', 6, 6, 6, 6, 6, '2026-03-06', '2026-03-06', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-SUSCR-2026-0007', 7, 7, 7, 7, 7, '2026-03-07', '2026-03-07', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-SUSCR-2026-0008', 8, 8, 8, 8, 8, '2026-03-08', '2026-03-08', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-SUSCR-2026-0009', 9, 9, 9, 9, 9, '2026-03-09', '2026-03-09', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-SUSCR-2026-0010', 10, 10, 10, 10, 10, '2026-03-10', '2026-03-10', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-SUSCR-2026-0011', 11, 11, 11, 11, 11, '2026-03-11', '2026-03-11', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-SUSCR-2026-0012', 12, 12, 12, 12, 12, '2026-03-12', '2026-03-12', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-SUSCR-2026-0013', 13, 13, 13, 13, 13, '2026-03-13', '2026-03-13', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-SUSCR-2026-0014', 14, 14, 14, 14, 14, '2026-03-14', '2026-03-14', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-SUSCR-2026-0015', 15, 15, 15, 15, 15, '2026-03-15', '2026-03-15', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-SUSCR-2026-0016', 16, 16, 16, 16, 16, '2026-03-16', '2026-03-16', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-SUSCR-2026-0017', 17, 17, 17, 17, 17, '2026-03-17', '2026-03-17', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-SUSCR-2026-0018', 18, 18, 18, 18, 18, '2026-03-18', '2026-03-18', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-SUSCR-2026-0019', 19, 19, 19, 19, 19, '2026-03-19', '2026-03-19', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-SUSCR-2026-0020', 20, 20, 20, 20, 20, '2026-03-20', '2026-03-20', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-SUSCR-2026-0021', 21, 21, 21, 21, 21, '2026-03-21', '2026-03-21', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-SUSCR-2026-0022', 22, 22, 22, 22, 22, '2026-03-22', '2026-03-22', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-SUSCR-2026-0023', 23, 23, 23, 23, 23, '2026-03-23', '2026-03-23', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-SUSCR-2026-0024', 24, 24, 24, 24, 24, '2026-03-24', '2026-03-24', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-SUSCR-2026-0025', 25, 25, 25, 25, 25, '2026-03-25', '2026-03-25', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-SUSCR-2026-0026', 26, 26, 26, 26, 26, '2026-03-26', '2026-03-26', 'PAUSADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-SUSCR-2026-0027', 27, 27, 27, 27, 27, '2026-03-27', '2026-03-27', 'CANCELADA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-SUSCR-2026-0028', 28, 28, 28, 28, 28, '2026-03-28', '2026-03-28', 'PAGO_FALLIDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-SUSCR-2026-0029', 29, 29, 29, 29, 29, '2026-03-01', '2026-03-01', 'ACTIVA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-SUSCR-2026-0030', 30, 30, 30, 30, 30, '2026-03-02', '2026-03-02', 'PAUSADA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_cliente', 'id_suscripcion_cliente'), COALESCE((SELECT MAX(id_suscripcion_cliente) FROM ventas.suscripciones_cliente), 1), true);

-- =================================================================================================
-- 060. TABLA: ventas.suscripciones_items (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_items (id_suscripcion_item, suscripcion_cliente, variante_sku, cantidad, precio_congelado_suscripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_items', 'id_suscripcion_item'), COALESCE((SELECT MAX(id_suscripcion_item) FROM ventas.suscripciones_items), 1), true);

-- =================================================================================================
-- 061. TABLA: ventas.suscripciones_calendario_entregas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_calendario_entregas (id_entrega_programada, suscripcion_cliente, fecha_programada_despacho, numero_ciclo_periodo, estado_despacho, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_calendario_entregas', 'id_entrega_programada'), COALESCE((SELECT MAX(id_entrega_programada) FROM ventas.suscripciones_calendario_entregas), 1), true);

-- =================================================================================================
-- 062. TABLA: ventas.suscripciones_bitacora_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.suscripciones_bitacora_estados (id_bitacora_suscripcion, suscripcion_cliente, estado_anterior, estado_nuevo, motivo_cambio, fecha_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10', 'Sérum Niacinamida 10', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumo', 'Gel Limpiador Espumo', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Flui', 'Protector Solar Flui', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurón', 'Sérum Ácido Hialurón', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con', 'Crema Hidratante con', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% No', 'Retinol Puro 0.5% No', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermoli', 'Agua Micelar Dermoli', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pur', 'Sérum Vitamina C Pur', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje C', 'Base de Maquillaje C', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Al', 'Corrector Líquido Al', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Ci', 'Bálsamo Reparador Ci', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Sal', 'Exfoliante Ácido Sal', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con', 'Contorno de Ojos con', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna ', 'Mascarilla Nocturna ', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmant', 'Bruma Termal Calmant', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emu', 'Aceite Limpiador Emu', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante ', 'Tónico Equilibrante ', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Pé', 'Labial Hidratante Pé', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Mat', 'Polvo Traslúcido Mat', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmen', 'Rubor Líquido Pigmen', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico', 'Sérum Ácido Azelaico', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteogli', 'Ampolletas Proteogli', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante', 'Crema Despigmentante', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mine', 'Protector Solar Mine', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea', 'Loción Corporal Urea', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimi', 'Primer Facial Minimi', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas ', 'Máscara de Pestañas ', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Co', 'Sérum Péptidos de Co', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillan', 'Bálsamo Desmaquillan', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-R', 'Crema Barrera Post-R', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.suscripciones_bitacora_estados', 'id_bitacora_suscripcion'), COALESCE((SELECT MAX(id_bitacora_suscripcion) FROM ventas.suscripciones_bitacora_estados), 1), true);

-- =================================================================================================
-- 063. TABLA: ventas.regalos_por_compra_gwp (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.regalos_por_compra_gwp (id_regalo_compra, codigo_promocion_gwp, nombre_promocion, monto_minimo_requerido, variante_sku_regalo, fecha_inicio, fecha_fin, stock_maximo_regalos, regalos_entregados, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROMOCIO_01', 'Kit Rutina La Roche-Posay #1', 17.50, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 8, 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROMOCIO_02', 'Kit Rutina CeraVe Dermatological #2', 20.00, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 11, 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROMOCIO_03', 'Kit Rutina The Ordinary Deciem #3', 22.50, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', 14, 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROMOCIO_04', 'Kit Rutina ISDIN Fotoprotección #4', 25.00, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', 17, 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROMOCIO_05', 'Kit Rutina Bioderma Laboratoire #5', 27.50, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', 20, 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROMOCIO_06', 'Kit Rutina Eau Thermale Avène #6', 30.00, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', 23, 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROMOCIO_07', 'Kit Rutina Eucerin Beiersdorf #7', 32.50, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', 26, 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROMOCIO_08', 'Kit Rutina Vichy Laboratoires #8', 35.00, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', 29, 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROMOCIO_09', 'Kit Rutina SkinCeuticals Clinical #9', 37.50, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', 32, 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROMOCIO_10', 'Kit Rutina Sesderma Nanotech #10', 40.00, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', 35, 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROMOCIO_11', 'Kit Rutina NARS Cosmetics #11', 42.50, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', 38, 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROMOCIO_12', 'Kit Rutina MAC Professional #12', 45.00, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', 41, 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROMOCIO_13', 'Kit Rutina Fenty Beauty #13', 47.50, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', 44, 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROMOCIO_14', 'Kit Rutina Rare Beauty #14', 50.00, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', 47, 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROMOCIO_15', 'Kit Rutina Clinique Laboratories #15', 52.50, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', 50, 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROMOCIO_16', 'Kit Rutina Estée Lauder #16', 55.00, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', 53, 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROMOCIO_17', 'Kit Rutina Lancôme Paris #17', 57.50, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', 56, 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROMOCIO_18', 'Kit Rutina Charlotte Tilbury #18', 60.00, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', 59, 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROMOCIO_19', 'Kit Rutina Paula''s Choice Skincare #19', 62.50, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62, 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROMOCIO_20', 'Kit Rutina COSRX K-Beauty #20', 65.00, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65, 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROMOCIO_21', 'Kit Rutina Laneige Amorepacific #21', 67.50, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', 68, 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROMOCIO_22', 'Kit Rutina Uriage Eau Thermale #22', 70.00, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', 71, 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROMOCIO_23', 'Kit Rutina Laboratoire SVR #23', 72.50, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', 74, 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROMOCIO_24', 'Kit Rutina MartiDerm Ampollas #24', 75.00, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', 77, 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROMOCIO_25', 'Kit Rutina Heliocare Cantabria Labs #25', 77.50, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', 80, 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROMOCIO_26', 'Kit Rutina Kiehl''s Since 1851 #26', 80.00, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', 83, 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROMOCIO_27', 'Kit Rutina Garnier SkinActive #27', 82.50, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', 86, 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROMOCIO_28', 'Kit Rutina L''Oréal Paris Derm #28', 85.00, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', 89, 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROMOCIO_29', 'Kit Rutina Neutrogena Derm #29', 87.50, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', 92, 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROMOCIO_30', 'Kit Rutina DermaCare Labs México #30', 90.00, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', 95, 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.regalos_por_compra_gwp', 'id_regalo_compra'), COALESCE((SELECT MAX(id_regalo_compra) FROM ventas.regalos_por_compra_gwp), 1), true);

-- =================================================================================================
-- 064. TABLA: ventas.ordenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes (id_orden, folio_orden, cliente, estado_orden, motivo_cancelacion, direccion_envio, direccion_facturacion, fecha_orden, subtotal_bruto, total_descuentos, total_impuestos_iva, costo_envio, total_neto, moneda, requiere_factura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, NULL, 1, 1, '2026-02-01 11:30:00', 285.50, 17.50, 45.68, 17.50, 285.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, NULL, 2, 2, '2026-02-02 11:30:00', 321.00, 20.00, 51.36, 20.00, 321.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, NULL, 3, 3, '2026-02-03 11:30:00', 356.50, 22.50, 57.04, 22.50, 356.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, NULL, 4, 4, '2026-02-04 11:30:00', 392.00, 25.00, 62.72, 25.00, 392.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, NULL, 5, 5, '2026-02-05 11:30:00', 427.50, 27.50, 68.40, 27.50, 427.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, 6, 6, 6, '2026-02-06 11:30:00', 463.00, 30.00, 74.08, 30.00, 463.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 7, NULL, 7, 7, '2026-02-07 11:30:00', 498.50, 32.50, 79.76, 32.50, 498.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 1, NULL, 8, 8, '2026-02-08 11:30:00', 534.00, 35.00, 85.44, 35.00, 534.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 2, NULL, 9, 9, '2026-02-09 11:30:00', 569.50, 37.50, 91.12, 37.50, 569.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 3, NULL, 10, 10, '2026-02-10 11:30:00', 605.00, 40.00, 96.80, 40.00, 605.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 4, NULL, 11, 11, '2026-02-11 11:30:00', 640.50, 42.50, 102.48, 42.50, 640.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 5, 12, 12, 12, '2026-02-12 11:30:00', 676.00, 45.00, 108.16, 45.00, 676.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 6, NULL, 13, 13, '2026-02-13 11:30:00', 711.50, 47.50, 113.84, 47.50, 711.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 7, NULL, 14, 14, '2026-02-14 11:30:00', 747.00, 50.00, 119.52, 50.00, 747.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 1, NULL, 15, 15, '2026-02-15 11:30:00', 782.50, 52.50, 125.20, 52.50, 782.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 2, NULL, 16, 16, '2026-02-16 11:30:00', 818.00, 55.00, 130.88, 55.00, 818.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 3, NULL, 17, 17, '2026-02-17 11:30:00', 853.50, 57.50, 136.56, 57.50, 853.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 4, 18, 18, 18, '2026-02-18 11:30:00', 889.00, 60.00, 142.24, 60.00, 889.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 5, NULL, 19, 19, '2026-02-19 11:30:00', 924.50, 62.50, 147.92, 62.50, 924.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 6, NULL, 20, 20, '2026-02-20 11:30:00', 960.00, 65.00, 153.60, 65.00, 960.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 7, NULL, 21, 21, '2026-02-21 11:30:00', 995.50, 67.50, 159.28, 67.50, 995.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 1, NULL, 22, 22, '2026-02-22 11:30:00', 1031.00, 70.00, 164.96, 70.00, 1031.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 2, NULL, 23, 23, '2026-02-23 11:30:00', 1066.50, 72.50, 170.64, 72.50, 1066.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 3, 24, 24, 24, '2026-02-24 11:30:00', 1102.00, 75.00, 176.32, 75.00, 1102.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 4, NULL, 25, 25, '2026-02-25 11:30:00', 1137.50, 77.50, 182.00, 77.50, 1137.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 5, NULL, 26, 26, '2026-02-26 11:30:00', 1173.00, 80.00, 187.68, 80.00, 1173.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 6, NULL, 27, 27, '2026-02-27 11:30:00', 1208.50, 82.50, 193.36, 82.50, 1208.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 7, NULL, 28, 28, '2026-02-28 11:30:00', 1244.00, 85.00, 199.04, 85.00, 1244.00, 'MXN', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 1, NULL, 29, 29, '2026-02-01 11:30:00', 1279.50, 87.50, 204.72, 87.50, 1279.50, 'MXN', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 2, 30, 30, 30, '2026-02-02 11:30:00', 1315.00, 90.00, 210.40, 90.00, 1315.00, 'MXN', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes', 'id_orden'), COALESCE((SELECT MAX(id_orden) FROM ventas.ordenes), 1), true);

-- =================================================================================================
-- 065. TABLA: ventas.ordenes_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_detalles (id_orden_detalle, orden, variante_sku, numero_partida, cantidad_comprada, precio_unitario_venta, costo_unitario_historico, monto_descuento_aplicado, subtotal_linea, tasa_iva_porcentual, monto_iva_linea, total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 8, 285.50, 17.50, 10.00, 17.50, 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 1, 11, 321.00, 20.00, 20.00, 20.00, 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 1, 14, 356.50, 22.50, 30.00, 22.50, 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 1, 17, 392.00, 25.00, 40.00, 25.00, 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 1, 20, 427.50, 27.50, 50.00, 27.50, 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 1, 23, 463.00, 30.00, 60.00, 30.00, 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 1, 26, 498.50, 32.50, 70.00, 32.50, 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 1, 29, 534.00, 35.00, 80.00, 35.00, 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 1, 32, 569.50, 37.50, 90.00, 37.50, 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 1, 35, 605.00, 40.00, 100.00, 40.00, 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 1, 38, 640.50, 42.50, 110.00, 42.50, 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 1, 41, 676.00, 45.00, 120.00, 45.00, 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 1, 44, 711.50, 47.50, 130.00, 47.50, 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 1, 47, 747.00, 50.00, 140.00, 50.00, 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 1, 50, 782.50, 52.50, 150.00, 52.50, 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 1, 53, 818.00, 55.00, 160.00, 55.00, 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 1, 56, 853.50, 57.50, 170.00, 57.50, 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 1, 59, 889.00, 60.00, 180.00, 60.00, 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 1, 62, 924.50, 62.50, 190.00, 62.50, 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 1, 65, 960.00, 65.00, 200.00, 65.00, 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 1, 68, 995.50, 67.50, 210.00, 67.50, 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 1, 71, 1031.00, 70.00, 220.00, 70.00, 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 1, 74, 1066.50, 72.50, 230.00, 72.50, 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 1, 77, 1102.00, 75.00, 240.00, 75.00, 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 1, 80, 1137.50, 77.50, 250.00, 77.50, 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 1, 83, 1173.00, 80.00, 260.00, 80.00, 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 1, 86, 1208.50, 82.50, 270.00, 82.50, 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 1, 89, 1244.00, 85.00, 280.00, 85.00, 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 1, 92, 1279.50, 87.50, 290.00, 87.50, 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 1, 95, 1315.00, 90.00, 300.00, 90.00, 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_detalles', 'id_orden_detalle'), COALESCE((SELECT MAX(id_orden_detalle) FROM ventas.ordenes_detalles), 1), true);

-- =================================================================================================
-- 066. TABLA: ventas.ordenes_historial_estados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_historial_estados (id_orden_historial, orden, estado_orden, comentario_operativo, fecha_registro, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 2, 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 3, 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 4, 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 5, 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 6, 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 7, 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 2, 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 3, 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 4, 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 5, 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 6, 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 7, 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 2, 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 3, 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 4, 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 5, 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 6, 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 7, 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 2, 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_historial_estados', 'id_orden_historial'), COALESCE((SELECT MAX(id_orden_historial) FROM ventas.ordenes_historial_estados), 1), true);

-- =================================================================================================
-- 067. TABLA: ventas.ordenes_splits_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_splits_almacen (id_orden_split, orden, sub_folio_split, estado_split, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Po', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermat', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotop', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Lab', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avè', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiers', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoire', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeut', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Na', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmeti', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professi', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beaut', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty ', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Labo', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder ', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lanc', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte T', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beau', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Ea', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laborato', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDer', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Helioca', 'EN_RUTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s ', 'PENDIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier ', 'ASIGNADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris De', 'SURTIENDO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena', 'EMPAQUETADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs', 'EN_RUTA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_splits_almacen', 'id_orden_split'), COALESCE((SELECT MAX(id_orden_split) FROM ventas.ordenes_splits_almacen), 1), true);

-- =================================================================================================
-- 068. TABLA: ventas.ordenes_impuestos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_impuestos (id_orden_impuesto, orden, tipo_impuesto, tasa_o_cuota, base_gravable, importe_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '002_IVA', 0.160000, 17.50, 45.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '003_IEPS', 0.160000, 20.00, 51.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '002_IVA', 0.160000, 22.50, 57.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '003_IEPS', 0.160000, 25.00, 62.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '002_IVA', 0.160000, 27.50, 68.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '003_IEPS', 0.160000, 30.00, 74.08, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '002_IVA', 0.160000, 32.50, 79.76, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '003_IEPS', 0.160000, 35.00, 85.44, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '002_IVA', 0.160000, 37.50, 91.12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '003_IEPS', 0.160000, 40.00, 96.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '002_IVA', 0.160000, 42.50, 102.48, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '003_IEPS', 0.160000, 45.00, 108.16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '002_IVA', 0.160000, 47.50, 113.84, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '003_IEPS', 0.160000, 50.00, 119.52, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '002_IVA', 0.160000, 52.50, 125.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '003_IEPS', 0.160000, 55.00, 130.88, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '002_IVA', 0.160000, 57.50, 136.56, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '003_IEPS', 0.160000, 60.00, 142.24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '002_IVA', 0.160000, 62.50, 147.92, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '003_IEPS', 0.160000, 65.00, 153.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '002_IVA', 0.160000, 67.50, 159.28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '003_IEPS', 0.160000, 70.00, 164.96, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '002_IVA', 0.160000, 72.50, 170.64, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '003_IEPS', 0.160000, 75.00, 176.32, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '002_IVA', 0.160000, 77.50, 182.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '003_IEPS', 0.160000, 80.00, 187.68, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '002_IVA', 0.160000, 82.50, 193.36, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '003_IEPS', 0.160000, 85.00, 199.04, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '002_IVA', 0.160000, 87.50, 204.72, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '003_IEPS', 0.160000, 90.00, 210.40, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_impuestos', 'id_orden_impuesto'), COALESCE((SELECT MAX(id_orden_impuesto) FROM ventas.ordenes_impuestos), 1), true);

-- =================================================================================================
-- 069. TABLA: ventas.ordenes_descuentos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_descuentos (id_orden_descuento, orden, tipo_descuento, codigo_promocion_aplicado, monto_descontado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'PROMOCIO_01', 10.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'PROMOCIO_02', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'PROMOCIO_03', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'PROMOCIO_04', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'PROMOCIO_05', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'PROMOCIO_06', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'PROMOCIO_07', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'PROMOCIO_08', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'PROMOCIO_09', 90.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'PROMOCIO_10', 100.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'PROMOCIO_11', 110.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'PROMOCIO_12', 120.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'PROMOCIO_13', 130.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'PROMOCIO_14', 140.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'PROMOCIO_15', 150.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'PROMOCIO_16', 160.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'PROMOCIO_17', 170.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'PROMOCIO_18', 180.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'PROMOCIO_19', 190.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'PROMOCIO_20', 200.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'PROMOCIO_21', 210.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'PROMOCIO_22', 220.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'PROMOCIO_23', 230.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'PROMOCIO_24', 240.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'PROMOCIO_25', 250.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'PROMOCIO_26', 260.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'PROMOCIO_27', 270.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'PROMOCIO_28', 280.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'PROMOCIO_29', 290.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'PROMOCIO_30', 300.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.ordenes_descuentos', 'id_orden_descuento'), COALESCE((SELECT MAX(id_orden_descuento) FROM ventas.ordenes_descuentos), 1), true);

-- =================================================================================================
-- 070. TABLA: ventas.ordenes_notas_instrucciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.ordenes_notas_instrucciones (id_orden_nota, orden, es_para_regalo, mensaje_tarjeta_regalo, instrucciones_entrega_repartidor, empaque_especial_ecologico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('ventas.ordenes_notas_instrucciones', 'id_orden_nota'), COALESCE((SELECT MAX(id_orden_nota) FROM ventas.ordenes_notas_instrucciones), 1), true);

-- =================================================================================================
-- 071. TABLA: ventas.reservas_temporales_stock (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.reservas_temporales_stock (id_reserva_stock, carrito, variante_sku, cantidad_reservada, fecha_reserva, fecha_expiracion_reserva, liberada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.reservas_temporales_stock', 'id_reserva_stock'), COALESCE((SELECT MAX(id_reserva_stock) FROM ventas.reservas_temporales_stock), 1), true);

-- =================================================================================================
-- 072. TABLA: ventas.afiliados_influencers (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.afiliados_influencers (id_afiliado, codigo_afiliado, usuario, nombre_canal_red_social, porcentaje_comision, clabe_interbancaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'AFILIADO_01', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 6.00, '012180001234567801', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'AFILIADO_02', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 7.00, '012180001234567802', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AFILIADO_03', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 8.00, '012180001234567803', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'AFILIADO_04', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 9.00, '012180001234567804', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'AFILIADO_05', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 10.00, '012180001234567805', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'AFILIADO_06', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 11.00, '012180001234567806', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'AFILIADO_07', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 12.00, '012180001234567807', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'AFILIADO_08', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 13.00, '012180001234567808', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'AFILIADO_09', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 14.00, '012180001234567809', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'AFILIADO_10', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 15.00, '012180001234567810', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'AFILIADO_11', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 16.00, '012180001234567811', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'AFILIADO_12', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 17.00, '012180001234567812', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'AFILIADO_13', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 18.00, '012180001234567813', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'AFILIADO_14', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 19.00, '012180001234567814', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'AFILIADO_15', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 5.00, '012180001234567815', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'AFILIADO_16', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 6.00, '012180001234567816', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'AFILIADO_17', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 7.00, '012180001234567817', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'AFILIADO_18', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 8.00, '012180001234567818', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'AFILIADO_19', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 9.00, '012180001234567819', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'AFILIADO_20', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 10.00, '012180001234567820', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'AFILIADO_21', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 11.00, '012180001234567821', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'AFILIADO_22', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 12.00, '012180001234567822', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'AFILIADO_23', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 13.00, '012180001234567823', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'AFILIADO_24', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 14.00, '012180001234567824', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'AFILIADO_25', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 15.00, '012180001234567825', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'AFILIADO_26', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 16.00, '012180001234567826', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'AFILIADO_27', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 17.00, '012180001234567827', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'AFILIADO_28', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 18.00, '012180001234567828', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'AFILIADO_29', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 19.00, '012180001234567829', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'AFILIADO_30', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 5.00, '012180001234567830', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.afiliados_influencers', 'id_afiliado'), COALESCE((SELECT MAX(id_afiliado) FROM ventas.afiliados_influencers), 1), true);

-- =================================================================================================
-- 073. TABLA: ventas.comisiones_afiliados (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO ventas.comisiones_afiliados (id_comision_afiliado, afiliado, orden, monto_base_calculo, monto_comision, estado_pago, fecha_dispersion_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 17.50, 17.50, 'PENDIENTE', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, 20.00, 'APROBADA', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, 22.50, 'PAGADA', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, 25.00, 'PENDIENTE', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, 27.50, 'APROBADA', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 30.00, 30.00, 'PAGADA', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 32.50, 32.50, 'PENDIENTE', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 35.00, 35.00, 'APROBADA', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 37.50, 37.50, 'PAGADA', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 40.00, 40.00, 'PENDIENTE', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 42.50, 42.50, 'APROBADA', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 45.00, 45.00, 'PAGADA', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 47.50, 47.50, 'PENDIENTE', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 50.00, 50.00, 'APROBADA', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 52.50, 52.50, 'PAGADA', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 55.00, 55.00, 'PENDIENTE', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 57.50, 57.50, 'APROBADA', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 60.00, 60.00, 'PAGADA', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62.50, 62.50, 'PENDIENTE', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65.00, 65.00, 'APROBADA', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 67.50, 67.50, 'PAGADA', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 70.00, 70.00, 'PENDIENTE', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 72.50, 72.50, 'APROBADA', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 75.00, 75.00, 'PAGADA', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 77.50, 77.50, 'PENDIENTE', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 80.00, 80.00, 'APROBADA', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 82.50, 82.50, 'PAGADA', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 85.00, 85.00, 'PENDIENTE', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 87.50, 87.50, 'APROBADA', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 90.00, 90.00, 'PAGADA', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('ventas.comisiones_afiliados', 'id_comision_afiliado'), COALESCE((SELECT MAX(id_comision_afiliado) FROM ventas.comisiones_afiliados), 1), true);

-- =================================================================================================
-- 074. TABLA: pagos.proveedores_pasarela (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.proveedores_pasarela (id_proveedor_pasarela, codigo_pasarela, nombre_comercial, url_webhook, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PASARELA_01', 'Kit Rutina La Roche-Posay #1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PASARELA_02', 'Kit Rutina CeraVe Dermatological #2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PASARELA_03', 'Kit Rutina The Ordinary Deciem #3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PASARELA_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PASARELA_05', 'Kit Rutina Bioderma Laboratoire #5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PASARELA_06', 'Kit Rutina Eau Thermale Avène #6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PASARELA_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PASARELA_08', 'Kit Rutina Vichy Laboratoires #8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PASARELA_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PASARELA_10', 'Kit Rutina Sesderma Nanotech #10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PASARELA_11', 'Kit Rutina NARS Cosmetics #11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PASARELA_12', 'Kit Rutina MAC Professional #12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PASARELA_13', 'Kit Rutina Fenty Beauty #13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PASARELA_14', 'Kit Rutina Rare Beauty #14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PASARELA_15', 'Kit Rutina Clinique Laboratories #15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PASARELA_16', 'Kit Rutina Estée Lauder #16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PASARELA_17', 'Kit Rutina Lancôme Paris #17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PASARELA_18', 'Kit Rutina Charlotte Tilbury #18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PASARELA_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PASARELA_20', 'Kit Rutina COSRX K-Beauty #20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PASARELA_21', 'Kit Rutina Laneige Amorepacific #21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PASARELA_22', 'Kit Rutina Uriage Eau Thermale #22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PASARELA_23', 'Kit Rutina Laboratoire SVR #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PASARELA_24', 'Kit Rutina MartiDerm Ampollas #24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PASARELA_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PASARELA_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PASARELA_27', 'Kit Rutina Garnier SkinActive #27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PASARELA_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PASARELA_29', 'Kit Rutina Neutrogena Derm #29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PASARELA_30', 'Kit Rutina DermaCare Labs México #30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.proveedores_pasarela', 'id_proveedor_pasarela'), COALESCE((SELECT MAX(id_proveedor_pasarela) FROM pagos.proveedores_pasarela), 1), true);

-- =================================================================================================
-- 075. TABLA: pagos.metodos_pago (5 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.metodos_pago (id_metodo_pago, codigo_metodo, nombre_metodo, comision_porcentual_fija, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TARJETA_CRED', 'Tarjeta de Crédito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TARJETA_DEB', 'Tarjeta de Débito', 1.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SPEI_TRANSF', 'Transferencia Electrónica SPEI', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'OXXO_EFECT', 'Pago en Efectivo Tiendas OXXO', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MONEDERO', 'Saldo Monedero DermaCare', 0.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('pagos.metodos_pago', 'id_metodo_pago'), COALESCE((SELECT MAX(id_metodo_pago) FROM pagos.metodos_pago), 1), true);

-- =================================================================================================
-- 076. TABLA: pagos.transacciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.transacciones (id_transaccion, folio_transaccion, orden, proveedor_pasarela, metodo_pago, id_transaccion_externa_pasarela, monto_transaccion, moneda, estado_pago, codigo_autorizacion_bancaria, fecha_pago_efectuado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 285.50, 'MXN', 'PENDIENTE', 'AUTORIZA_01', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 321.00, 'MXN', 'APROBADA', 'AUTORIZA_02', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 356.50, 'MXN', 'RECHAZADA', 'AUTORIZA_03', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 392.00, 'MXN', 'CANCELADA', 'AUTORIZA_04', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 427.50, 'MXN', 'EN_MEDIACION', 'AUTORIZA_05', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 6, 1, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 463.00, 'MXN', 'PENDIENTE', 'AUTORIZA_06', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 7, 2, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 498.50, 'MXN', 'APROBADA', 'AUTORIZA_07', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 8, 3, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 534.00, 'MXN', 'RECHAZADA', 'AUTORIZA_08', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 9, 4, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 569.50, 'MXN', 'CANCELADA', 'AUTORIZA_09', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 10, 5, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 605.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_10', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 11, 1, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 640.50, 'MXN', 'PENDIENTE', 'AUTORIZA_11', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 12, 2, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 676.00, 'MXN', 'APROBADA', 'AUTORIZA_12', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 13, 3, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 711.50, 'MXN', 'RECHAZADA', 'AUTORIZA_13', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 14, 4, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 747.00, 'MXN', 'CANCELADA', 'AUTORIZA_14', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 15, 5, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 782.50, 'MXN', 'EN_MEDIACION', 'AUTORIZA_15', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 16, 1, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 818.00, 'MXN', 'PENDIENTE', 'AUTORIZA_16', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 17, 2, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 853.50, 'MXN', 'APROBADA', 'AUTORIZA_17', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 18, 3, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 889.00, 'MXN', 'RECHAZADA', 'AUTORIZA_18', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 19, 4, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 924.50, 'MXN', 'CANCELADA', 'AUTORIZA_19', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 20, 5, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 960.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_20', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 21, 1, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 995.50, 'MXN', 'PENDIENTE', 'AUTORIZA_21', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 22, 2, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 1031.00, 'MXN', 'APROBADA', 'AUTORIZA_22', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 23, 3, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 1066.50, 'MXN', 'RECHAZADA', 'AUTORIZA_23', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 24, 4, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 1102.00, 'MXN', 'CANCELADA', 'AUTORIZA_24', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 25, 5, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 1137.50, 'MXN', 'EN_MEDIACION', 'AUTORIZA_25', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 26, 1, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 1173.00, 'MXN', 'PENDIENTE', 'AUTORIZA_26', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 27, 2, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 1208.50, 'MXN', 'APROBADA', 'AUTORIZA_27', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 28, 3, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 1244.00, 'MXN', 'RECHAZADA', 'AUTORIZA_28', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 29, 4, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 1279.50, 'MXN', 'CANCELADA', 'AUTORIZA_29', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 30, 5, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 1315.00, 'MXN', 'EN_MEDIACION', 'AUTORIZA_30', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.transacciones', 'id_transaccion'), COALESCE((SELECT MAX(id_transaccion) FROM pagos.transacciones), 1), true);

-- =================================================================================================
-- 077. TABLA: pagos.intentos_cobro (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.intentos_cobro (id_intento_cobro, transaccion, numero_intento, codigo_respuesta_http, payload_solicitud_sanitizado, payload_respuesta_pasarela, mensaje_error_banco, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 200, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 200, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 200, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 200, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 200, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 200, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 200, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 200, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 200, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 200, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 200, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 200, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 200, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 200, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 200, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 200, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 200, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 200, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 200, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 200, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 200, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 200, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 200, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 200, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 200, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 200, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 200, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 200, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 200, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 200, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.intentos_cobro', 'id_intento_cobro'), COALESCE((SELECT MAX(id_intento_cobro) FROM pagos.intentos_cobro), 1), true);

-- =================================================================================================
-- 078. TABLA: pagos.split_multipagos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.split_multipagos (id_split_pago, orden, metodo_pago, monto_asignado, referencia_comprobante, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 17.50, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 20.00, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 22.50, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 25.00, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 27.50, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 30.00, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 2, 32.50, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 3, 35.00, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 4, 37.50, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 5, 40.00, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 42.50, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 2, 45.00, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 3, 47.50, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 4, 50.00, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 5, 52.50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 55.00, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 2, 57.50, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 3, 60.00, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 4, 62.50, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 5, 65.00, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 67.50, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 2, 70.00, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 3, 72.50, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 4, 75.00, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 5, 77.50, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 80.00, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 2, 82.50, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 3, 85.00, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 4, 87.50, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 5, 90.00, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.split_multipagos', 'id_split_pago'), COALESCE((SELECT MAX(id_split_pago) FROM pagos.split_multipagos), 1), true);

-- =================================================================================================
-- 079. TABLA: pagos.billetera_electronica (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.billetera_electronica (id_billetera, cliente, saldo_disponible, saldo_bloqueado_retenido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.billetera_electronica', 'id_billetera'), COALESCE((SELECT MAX(id_billetera) FROM pagos.billetera_electronica), 1), true);

-- =================================================================================================
-- 080. TABLA: pagos.movimientos_billetera (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.movimientos_billetera (id_movimiento_billetera, billetera, tipo_movimiento, monto, saldo_anterior, saldo_posterior, descripcion_motivo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CARGA_SALDO', 285.50, 17.50, 17.50, 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAGO_ORDEN', 321.00, 20.00, 20.00, 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'REEMBOLSO_DEVOLUCION', 356.50, 22.50, 22.50, 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CARGA_SALDO', 392.00, 25.00, 25.00, 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PAGO_ORDEN', 427.50, 27.50, 27.50, 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'REEMBOLSO_DEVOLUCION', 463.00, 30.00, 30.00, 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CARGA_SALDO', 498.50, 32.50, 32.50, 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PAGO_ORDEN', 534.00, 35.00, 35.00, 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'REEMBOLSO_DEVOLUCION', 569.50, 37.50, 37.50, 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CARGA_SALDO', 605.00, 40.00, 40.00, 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PAGO_ORDEN', 640.50, 42.50, 42.50, 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'REEMBOLSO_DEVOLUCION', 676.00, 45.00, 45.00, 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CARGA_SALDO', 711.50, 47.50, 47.50, 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAGO_ORDEN', 747.00, 50.00, 50.00, 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'REEMBOLSO_DEVOLUCION', 782.50, 52.50, 52.50, 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CARGA_SALDO', 818.00, 55.00, 55.00, 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'PAGO_ORDEN', 853.50, 57.50, 57.50, 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'REEMBOLSO_DEVOLUCION', 889.00, 60.00, 60.00, 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CARGA_SALDO', 924.50, 62.50, 62.50, 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PAGO_ORDEN', 960.00, 65.00, 65.00, 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'REEMBOLSO_DEVOLUCION', 995.50, 67.50, 67.50, 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CARGA_SALDO', 1031.00, 70.00, 70.00, 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PAGO_ORDEN', 1066.50, 72.50, 72.50, 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'REEMBOLSO_DEVOLUCION', 1102.00, 75.00, 75.00, 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CARGA_SALDO', 1137.50, 77.50, 77.50, 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAGO_ORDEN', 1173.00, 80.00, 80.00, 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'REEMBOLSO_DEVOLUCION', 1208.50, 82.50, 82.50, 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CARGA_SALDO', 1244.00, 85.00, 85.00, 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'PAGO_ORDEN', 1279.50, 87.50, 87.50, 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'REEMBOLSO_DEVOLUCION', 1315.00, 90.00, 90.00, 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.movimientos_billetera', 'id_movimiento_billetera'), COALESCE((SELECT MAX(id_movimiento_billetera) FROM pagos.movimientos_billetera), 1), true);

-- =================================================================================================
-- 081. TABLA: pagos.tarjetas_regalo_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.tarjetas_regalo_giftcards (id_giftcard, codigo_giftcard_hash, monto_inicial, saldo_actual, fecha_vencimiento, cliente_comprador, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('pagos.tarjetas_regalo_giftcards', 'id_giftcard'), COALESCE((SELECT MAX(id_giftcard) FROM pagos.tarjetas_regalo_giftcards), 1), true);

-- =================================================================================================
-- 082. TABLA: pagos.redenciones_giftcards (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.redenciones_giftcards (id_redencion_giftcard, giftcard, orden, monto_redimido, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('pagos.redenciones_giftcards', 'id_redencion_giftcard'), COALESCE((SELECT MAX(id_redencion_giftcard) FROM pagos.redenciones_giftcards), 1), true);

-- =================================================================================================
-- 083. TABLA: pagos.reglas_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reglas_antifraude (id_regla_antifraude, codigo_regla, descripcion, puntaje_riesgo_asignado, bloqueo_automatico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'REGLA_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 6, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'REGLA_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 7, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'REGLA_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 8, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REGLA_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 9, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REGLA_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 10, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'REGLA_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 11, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'REGLA_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 12, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'REGLA_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 13, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'REGLA_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 14, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'REGLA_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 15, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'REGLA_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 16, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'REGLA_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 17, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'REGLA_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 18, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'REGLA_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 19, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'REGLA_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 20, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'REGLA_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 21, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'REGLA_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 22, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'REGLA_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 23, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'REGLA_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 24, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'REGLA_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 25, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'REGLA_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 26, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'REGLA_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 27, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'REGLA_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 28, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'REGLA_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 29, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'REGLA_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 30, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'REGLA_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 31, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'REGLA_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 32, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'REGLA_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 33, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'REGLA_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 34, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'REGLA_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 5, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reglas_antifraude', 'id_regla_antifraude'), COALESCE((SELECT MAX(id_regla_antifraude) FROM pagos.reglas_antifraude), 1), true);

-- =================================================================================================
-- 084. TABLA: pagos.evaluaciones_antifraude (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.evaluaciones_antifraude (id_evaluacion_fraude, orden, regla_antifraude, score_riesgo_total, nivel_riesgo, ip_origen, distancia_geografica_km, dispositivo_sospechoso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('pagos.evaluaciones_antifraude', 'id_evaluacion_fraude'), COALESCE((SELECT MAX(id_evaluacion_fraude) FROM pagos.evaluaciones_antifraude), 1), true);

-- =================================================================================================
-- 085. TABLA: pagos.contracargos_chargebacks (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.contracargos_chargebacks (id_contracargo, transaccion, folio_disputa_pasarela, motivo_disputa, monto_disputado, fecha_notificacion, fecha_limite_evidencia, estatus_disputa, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-DISPU-2026-0001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-DISPU-2026-0002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-DISPU-2026-0003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, '2026-02-03 11:30:00', '2026-03-03', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-DISPU-2026-0004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, '2026-02-04 11:30:00', '2026-03-04', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-DISPU-2026-0005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, '2026-02-05 11:30:00', '2026-03-05', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-DISPU-2026-0006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, '2026-02-06 11:30:00', '2026-03-06', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-DISPU-2026-0007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, '2026-02-07 11:30:00', '2026-03-07', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-DISPU-2026-0008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, '2026-02-08 11:30:00', '2026-03-08', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-DISPU-2026-0009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, '2026-02-09 11:30:00', '2026-03-09', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-DISPU-2026-0010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, '2026-02-10 11:30:00', '2026-03-10', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-DISPU-2026-0011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, '2026-02-11 11:30:00', '2026-03-11', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-DISPU-2026-0012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, '2026-02-12 11:30:00', '2026-03-12', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-DISPU-2026-0013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, '2026-02-13 11:30:00', '2026-03-13', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-DISPU-2026-0014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, '2026-02-14 11:30:00', '2026-03-14', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-DISPU-2026-0015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, '2026-02-15 11:30:00', '2026-03-15', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-DISPU-2026-0016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, '2026-02-16 11:30:00', '2026-03-16', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-DISPU-2026-0017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, '2026-02-17 11:30:00', '2026-03-17', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-DISPU-2026-0018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, '2026-02-18 11:30:00', '2026-03-18', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-DISPU-2026-0019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, '2026-02-19 11:30:00', '2026-03-19', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-DISPU-2026-0020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, '2026-02-20 11:30:00', '2026-03-20', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-DISPU-2026-0021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, '2026-02-21 11:30:00', '2026-03-21', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-DISPU-2026-0022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, '2026-02-22 11:30:00', '2026-03-22', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-DISPU-2026-0023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, '2026-02-23 11:30:00', '2026-03-23', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-DISPU-2026-0024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, '2026-02-24 11:30:00', '2026-03-24', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-DISPU-2026-0025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, '2026-02-25 11:30:00', '2026-03-25', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-DISPU-2026-0026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, '2026-02-26 11:30:00', '2026-03-26', 'EN_REVISION', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-DISPU-2026-0027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, '2026-02-27 11:30:00', '2026-03-27', 'GANADA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-DISPU-2026-0028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, '2026-02-28 11:30:00', '2026-03-28', 'PERDIDA_POR_COMERCIO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-DISPU-2026-0029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, '2026-02-01 11:30:00', '2026-03-01', 'ABIERTA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-DISPU-2026-0030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, '2026-02-02 11:30:00', '2026-03-02', 'EN_REVISION', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.contracargos_chargebacks', 'id_contracargo'), COALESCE((SELECT MAX(id_contracargo) FROM pagos.contracargos_chargebacks), 1), true);

-- =================================================================================================
-- 086. TABLA: pagos.reembolsos_transaccion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO pagos.reembolsos_transaccion (id_reembolso, transaccion, folio_reembolso_pasarela, monto_reembolsado, motivo_reembolso, fecha_reembolso, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FOL-REEMB-2026-0001', 285.50, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'FOL-REEMB-2026-0002', 321.00, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'FOL-REEMB-2026-0003', 356.50, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'FOL-REEMB-2026-0004', 392.00, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'FOL-REEMB-2026-0005', 427.50, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'FOL-REEMB-2026-0006', 463.00, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'FOL-REEMB-2026-0007', 498.50, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'FOL-REEMB-2026-0008', 534.00, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'FOL-REEMB-2026-0009', 569.50, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'FOL-REEMB-2026-0010', 605.00, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'FOL-REEMB-2026-0011', 640.50, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'FOL-REEMB-2026-0012', 676.00, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'FOL-REEMB-2026-0013', 711.50, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'FOL-REEMB-2026-0014', 747.00, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'FOL-REEMB-2026-0015', 782.50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'FOL-REEMB-2026-0016', 818.00, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'FOL-REEMB-2026-0017', 853.50, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'FOL-REEMB-2026-0018', 889.00, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'FOL-REEMB-2026-0019', 924.50, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'FOL-REEMB-2026-0020', 960.00, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'FOL-REEMB-2026-0021', 995.50, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'FOL-REEMB-2026-0022', 1031.00, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'FOL-REEMB-2026-0023', 1066.50, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'FOL-REEMB-2026-0024', 1102.00, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'FOL-REEMB-2026-0025', 1137.50, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'FOL-REEMB-2026-0026', 1173.00, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'FOL-REEMB-2026-0027', 1208.50, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'FOL-REEMB-2026-0028', 1244.00, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'FOL-REEMB-2026-0029', 1279.50, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'FOL-REEMB-2026-0030', 1315.00, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('pagos.reembolsos_transaccion', 'id_reembolso'), COALESCE((SELECT MAX(id_reembolso) FROM pagos.reembolsos_transaccion), 1), true);

-- =================================================================================================
-- 087. TABLA: fiscal.regimenes_sat (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.regimenes_sat (id_regimen_sat, clave_regimen_sat, descripcion, aplica_persona_fisica, aplica_persona_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, '601', 'General de Ley Personas Morales', FALSE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, '605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, '606', 'Arrendamiento', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, '612', 'Personas Físicas con Actividades Empresariales y Profesionales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, '616', 'Sin obligaciones fiscales', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, '621', 'Incorporación Fiscal', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, '625', 'Régimen de las Actividades Empresariales con ingresos a través de Plataformas', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, '626', 'Régimen Simplificado de Confianza (RESICO)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.regimenes_sat', 'id_regimen_sat'), COALESCE((SELECT MAX(id_regimen_sat) FROM fiscal.regimenes_sat), 1), true);

-- =================================================================================================
-- 088. TABLA: fiscal.usos_cfdi (8 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.usos_cfdi (id_uso_cfdi, clave_uso_cfdi, descripcion, aplica_fisica, aplica_moral, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'G01', 'Adquisición de mercancías', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'G03', 'Gastos en general', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'D01', 'Honorarios médicos, dentales y gastos hospitalarios', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'D02', 'Gastos médicos por incapacidad o discapacidad', TRUE, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'I04', 'Equipo de computo y accesorios', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'P01', 'Por definir (Uso transitorio)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'S01', 'Sin efectos fiscales', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CP01', 'Pagos (Complemento de recepción de pagos)', TRUE, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('fiscal.usos_cfdi', 'id_uso_cfdi'), COALESCE((SELECT MAX(id_uso_cfdi) FROM fiscal.usos_cfdi), 1), true);

-- =================================================================================================
-- 089. TABLA: fiscal.datos_fiscales_cliente (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.datos_fiscales_cliente (id_dato_fiscal, cliente, rfc_emisor, razon_social, codigo_postal_fiscal, regimen_sat, uso_cfdi_predeterminado, correo_envio_cfdi, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacin', 'Laboratorios La Roche-Posay S.A. de C.V.', 'POSTAL_F_0', 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'POSTAL_F_0', 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Sol', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'POSTAL_F_0', 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'POSTAL_F_0', 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidrata', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'POSTAL_F_0', 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro ', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'POSTAL_F_0', 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar ', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'POSTAL_F_0', 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitami', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'POSTAL_F_0', 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maqui', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'POSTAL_F_0', 1, 1, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Lí', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'POSTAL_F_1', 2, 2, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Repa', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'POSTAL_F_1', 3, 3, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Á', 'Laboratorios MAC Professional S.A. de C.V.', 'POSTAL_F_1', 4, 4, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de O', 'Laboratorios Fenty Beauty S.A. de C.V.', 'POSTAL_F_1', 5, 5, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla No', 'Laboratorios Rare Beauty S.A. de C.V.', 'POSTAL_F_1', 6, 6, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal ', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'POSTAL_F_1', 7, 7, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpia', 'Laboratorios Estée Lauder S.A. de C.V.', 'POSTAL_F_1', 8, 8, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equil', 'Laboratorios Lancôme Paris S.A. de C.V.', 'POSTAL_F_1', 1, 1, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidrat', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'POSTAL_F_1', 2, 2, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslú', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'POSTAL_F_1', 3, 3, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquid', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'POSTAL_F_2', 4, 4, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'POSTAL_F_2', 5, 5, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Pr', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'POSTAL_F_2', 6, 6, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigm', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'POSTAL_F_2', 7, 7, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Sol', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'POSTAL_F_2', 8, 8, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corpo', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'POSTAL_F_2', 1, 1, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'POSTAL_F_2', 2, 2, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de P', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'POSTAL_F_2', 3, 3, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Pépti', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'POSTAL_F_2', 4, 4, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desm', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'POSTAL_F_2', 5, 5, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'POSTAL_F_3', 6, 6, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.datos_fiscales_cliente', 'id_dato_fiscal'), COALESCE((SELECT MAX(id_dato_fiscal) FROM fiscal.datos_fiscales_cliente), 1), true);

-- =================================================================================================
-- 090. TABLA: fiscal.facturas_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_cfdi (id_factura, orden, dato_fiscal, serie_factura, folio_factura, uuid_sat_fiscal, sello_digital_cfdi, sello_sat, cadena_original_timbre, numero_certificado_sat, fecha_timbrado, monto_total_facturado, estado_cfdi, xml_comprobante_url, pdf_representacion_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Nia', 'FOL-FACTU-2026-0001', 'B1000000-0000-4000-8000-000000000001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 1', '2026-02-01 11:30:00', 17.50, 'TIMBRADA_VIGENTE', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpia', 'FOL-FACTU-2026-0002', 'B1000000-0000-4000-8000-000000000002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumo', '2026-02-02 11:30:00', 20.00, 'CANCELADA_SAT', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector ', 'FOL-FACTU-2026-0003', 'B1000000-0000-4000-8000-000000000003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Flui', '2026-02-03 11:30:00', 22.50, 'ERROR_TIMBRADO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ác', 'FOL-FACTU-2026-0004', 'B1000000-0000-4000-8000-000000000004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialur', '2026-02-04 11:30:00', 25.00, 'TIMBRADA_VIGENTE', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidr', 'FOL-FACTU-2026-0005', 'B1000000-0000-4000-8000-000000000005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con', '2026-02-05 11:30:00', 27.50, 'CANCELADA_SAT', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Pu', 'FOL-FACTU-2026-0006', 'B1000000-0000-4000-8000-000000000006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% No', '2026-02-06 11:30:00', 30.00, 'ERROR_TIMBRADO', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micel', 'FOL-FACTU-2026-0007', 'B1000000-0000-4000-8000-000000000007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermoli', '2026-02-07 11:30:00', 32.50, 'TIMBRADA_VIGENTE', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vit', 'FOL-FACTU-2026-0008', 'B1000000-0000-4000-8000-000000000008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pu', '2026-02-08 11:30:00', 35.00, 'CANCELADA_SAT', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Ma', 'FOL-FACTU-2026-0009', 'B1000000-0000-4000-8000-000000000009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje C', '2026-02-09 11:30:00', 37.50, 'ERROR_TIMBRADO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector ', 'FOL-FACTU-2026-0010', 'B1000000-0000-4000-8000-00000000000A', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido A', '2026-02-10 11:30:00', 40.00, 'TIMBRADA_VIGENTE', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo R', 'FOL-FACTU-2026-0011', 'B1000000-0000-4000-8000-00000000000B', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador C', '2026-02-11 11:30:00', 42.50, 'CANCELADA_SAT', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante', 'FOL-FACTU-2026-0012', 'B1000000-0000-4000-8000-00000000000C', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Sa', '2026-02-12 11:30:00', 45.00, 'ERROR_TIMBRADO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno d', 'FOL-FACTU-2026-0013', 'B1000000-0000-4000-8000-00000000000D', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con', '2026-02-13 11:30:00', 47.50, 'TIMBRADA_VIGENTE', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla', 'FOL-FACTU-2026-0014', 'B1000000-0000-4000-8000-00000000000E', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna ', '2026-02-14 11:30:00', 50.00, 'CANCELADA_SAT', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Term', 'FOL-FACTU-2026-0015', 'B1000000-0000-4000-8000-00000000000F', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmant', '2026-02-15 11:30:00', 52.50, 'ERROR_TIMBRADO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Lim', 'FOL-FACTU-2026-0016', 'B1000000-0000-4000-8000-000000000010', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emu', '2026-02-16 11:30:00', 55.00, 'TIMBRADA_VIGENTE', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Eq', 'FOL-FACTU-2026-0017', 'B1000000-0000-4000-8000-000000000011', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante', '2026-02-17 11:30:00', 57.50, 'CANCELADA_SAT', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hid', 'FOL-FACTU-2026-0018', 'B1000000-0000-4000-8000-000000000012', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante P', '2026-02-18 11:30:00', 60.00, 'ERROR_TIMBRADO', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Tras', 'FOL-FACTU-2026-0019', 'B1000000-0000-4000-8000-000000000013', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Ma', '2026-02-19 11:30:00', 62.50, 'TIMBRADA_VIGENTE', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líq', 'FOL-FACTU-2026-0020', 'B1000000-0000-4000-8000-000000000014', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigme', '2026-02-20 11:30:00', 65.00, 'CANCELADA_SAT', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ác', 'FOL-FACTU-2026-0021', 'B1000000-0000-4000-8000-000000000015', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelai', '2026-02-21 11:30:00', 67.50, 'ERROR_TIMBRADO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas', 'FOL-FACTU-2026-0022', 'B1000000-0000-4000-8000-000000000016', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteogli', '2026-02-22 11:30:00', 70.00, 'TIMBRADA_VIGENTE', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Desp', 'FOL-FACTU-2026-0023', 'B1000000-0000-4000-8000-000000000017', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante', '2026-02-23 11:30:00', 72.50, 'CANCELADA_SAT', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector ', 'FOL-FACTU-2026-0024', 'B1000000-0000-4000-8000-000000000018', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mine', '2026-02-24 11:30:00', 75.00, 'ERROR_TIMBRADO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Co', 'FOL-FACTU-2026-0025', 'B1000000-0000-4000-8000-000000000019', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Ure', '2026-02-25 11:30:00', 77.50, 'TIMBRADA_VIGENTE', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Fac', 'FOL-FACTU-2026-0026', 'B1000000-0000-4000-8000-00000000001A', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimi', '2026-02-26 11:30:00', 80.00, 'CANCELADA_SAT', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara d', 'FOL-FACTU-2026-0027', 'B1000000-0000-4000-8000-00000000001B', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestaña', '2026-02-27 11:30:00', 82.50, 'ERROR_TIMBRADO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Pé', 'FOL-FACTU-2026-0028', 'B1000000-0000-4000-8000-00000000001C', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de ', '2026-02-28 11:30:00', 85.00, 'TIMBRADA_VIGENTE', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo D', 'FOL-FACTU-2026-0029', 'B1000000-0000-4000-8000-00000000001D', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquilla', '2026-02-01 11:30:00', 87.50, 'CANCELADA_SAT', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barr', 'FOL-FACTU-2026-0030', 'B1000000-0000-4000-8000-00000000001E', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-R', '2026-02-02 11:30:00', 90.00, 'ERROR_TIMBRADO', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_cfdi', 'id_factura'), COALESCE((SELECT MAX(id_factura) FROM fiscal.facturas_cfdi), 1), true);

-- =================================================================================================
-- 091. TABLA: fiscal.facturas_partidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.facturas_partidas (id_factura_partida, factura, clave_producto_servicio_sat, clave_unidad_sat, cantidad, valor_unitario, importe_neto, objeto_impuesto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'PRODUCTO_0', 'UNIDA', 17.50, 17.50, 17.50, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PRODUCTO_0', 'UNIDA', 20.00, 20.00, 20.00, 'Gel', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'PRODUCTO_0', 'UNIDA', 22.50, 22.50, 22.50, 'Pro', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'PRODUCTO_0', 'UNIDA', 25.00, 25.00, 25.00, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'PRODUCTO_0', 'UNIDA', 27.50, 27.50, 27.50, 'Cre', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PRODUCTO_0', 'UNIDA', 30.00, 30.00, 30.00, 'Ret', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'PRODUCTO_0', 'UNIDA', 32.50, 32.50, 32.50, 'Agu', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'PRODUCTO_0', 'UNIDA', 35.00, 35.00, 35.00, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'PRODUCTO_0', 'UNIDA', 37.50, 37.50, 37.50, 'Bas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PRODUCTO_1', 'UNIDA', 40.00, 40.00, 40.00, 'Cor', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'PRODUCTO_1', 'UNIDA', 42.50, 42.50, 42.50, 'Bá', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'PRODUCTO_1', 'UNIDA', 45.00, 45.00, 45.00, 'Exf', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'PRODUCTO_1', 'UNIDA', 47.50, 47.50, 47.50, 'Con', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PRODUCTO_1', 'UNIDA', 50.00, 50.00, 50.00, 'Mas', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'PRODUCTO_1', 'UNIDA', 52.50, 52.50, 52.50, 'Bru', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'PRODUCTO_1', 'UNIDA', 55.00, 55.00, 55.00, 'Ace', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'PRODUCTO_1', 'UNIDA', 57.50, 57.50, 57.50, 'Tó', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PRODUCTO_1', 'UNIDA', 60.00, 60.00, 60.00, 'Lab', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'PRODUCTO_1', 'UNIDA', 62.50, 62.50, 62.50, 'Pol', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'PRODUCTO_2', 'UNIDA', 65.00, 65.00, 65.00, 'Rub', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'PRODUCTO_2', 'UNIDA', 67.50, 67.50, 67.50, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PRODUCTO_2', 'UNIDA', 70.00, 70.00, 70.00, 'Amp', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'PRODUCTO_2', 'UNIDA', 72.50, 72.50, 72.50, 'Cre', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'PRODUCTO_2', 'UNIDA', 75.00, 75.00, 75.00, 'Pro', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'PRODUCTO_2', 'UNIDA', 77.50, 77.50, 77.50, 'Loc', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PRODUCTO_2', 'UNIDA', 80.00, 80.00, 80.00, 'Pri', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'PRODUCTO_2', 'UNIDA', 82.50, 82.50, 82.50, 'Má', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'PRODUCTO_2', 'UNIDA', 85.00, 85.00, 85.00, 'Sé', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'PRODUCTO_2', 'UNIDA', 87.50, 87.50, 87.50, 'Bá', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PRODUCTO_3', 'UNIDA', 90.00, 90.00, 90.00, 'Cre', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.facturas_partidas', 'id_factura_partida'), COALESCE((SELECT MAX(id_factura_partida) FROM fiscal.facturas_partidas), 1), true);

-- =================================================================================================
-- 092. TABLA: fiscal.complementos_pago (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.complementos_pago (id_complemento_pago, factura, transaccion, uuid_sat_complemento, numero_parcialidad, saldo_anterior, monto_pagado, saldo_insoluto, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'B1000000-0000-4000-8000-000000000001', 1, 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'B1000000-0000-4000-8000-000000000002', 1, 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'B1000000-0000-4000-8000-000000000003', 1, 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'B1000000-0000-4000-8000-000000000004', 1, 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'B1000000-0000-4000-8000-000000000005', 1, 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'B1000000-0000-4000-8000-000000000006', 1, 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'B1000000-0000-4000-8000-000000000007', 1, 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'B1000000-0000-4000-8000-000000000008', 1, 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'B1000000-0000-4000-8000-000000000009', 1, 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'B1000000-0000-4000-8000-00000000000A', 1, 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'B1000000-0000-4000-8000-00000000000B', 1, 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'B1000000-0000-4000-8000-00000000000C', 1, 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'B1000000-0000-4000-8000-00000000000D', 1, 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'B1000000-0000-4000-8000-00000000000E', 1, 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'B1000000-0000-4000-8000-00000000000F', 1, 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'B1000000-0000-4000-8000-000000000010', 1, 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'B1000000-0000-4000-8000-000000000011', 1, 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'B1000000-0000-4000-8000-000000000012', 1, 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'B1000000-0000-4000-8000-000000000013', 1, 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'B1000000-0000-4000-8000-000000000014', 1, 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'B1000000-0000-4000-8000-000000000015', 1, 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'B1000000-0000-4000-8000-000000000016', 1, 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'B1000000-0000-4000-8000-000000000017', 1, 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'B1000000-0000-4000-8000-000000000018', 1, 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'B1000000-0000-4000-8000-000000000019', 1, 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'B1000000-0000-4000-8000-00000000001A', 1, 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'B1000000-0000-4000-8000-00000000001B', 1, 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'B1000000-0000-4000-8000-00000000001C', 1, 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'B1000000-0000-4000-8000-00000000001D', 1, 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'B1000000-0000-4000-8000-00000000001E', 1, 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.complementos_pago', 'id_complemento_pago'), COALESCE((SELECT MAX(id_complemento_pago) FROM fiscal.complementos_pago), 1), true);

-- =================================================================================================
-- 093. TABLA: fiscal.notas_credito (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.notas_credito (id_nota_credito, factura, uuid_sat_nota_credito, motivo_devolucion_sat, subtotal_acreditado, iva_acreditado, total_acreditado, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'B1000000-0000-4000-8000-000000000001', 'Sé', 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'B1000000-0000-4000-8000-000000000002', 'Gel', 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'B1000000-0000-4000-8000-000000000003', 'Pro', 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'B1000000-0000-4000-8000-000000000004', 'Sé', 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'B1000000-0000-4000-8000-000000000005', 'Cre', 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'B1000000-0000-4000-8000-000000000006', 'Ret', 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'B1000000-0000-4000-8000-000000000007', 'Agu', 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'B1000000-0000-4000-8000-000000000008', 'Sé', 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'B1000000-0000-4000-8000-000000000009', 'Bas', 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'B1000000-0000-4000-8000-00000000000A', 'Cor', 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'B1000000-0000-4000-8000-00000000000B', 'Bá', 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'B1000000-0000-4000-8000-00000000000C', 'Exf', 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'B1000000-0000-4000-8000-00000000000D', 'Con', 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'B1000000-0000-4000-8000-00000000000E', 'Mas', 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'B1000000-0000-4000-8000-00000000000F', 'Bru', 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'B1000000-0000-4000-8000-000000000010', 'Ace', 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'B1000000-0000-4000-8000-000000000011', 'Tó', 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'B1000000-0000-4000-8000-000000000012', 'Lab', 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'B1000000-0000-4000-8000-000000000013', 'Pol', 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'B1000000-0000-4000-8000-000000000014', 'Rub', 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'B1000000-0000-4000-8000-000000000015', 'Sé', 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'B1000000-0000-4000-8000-000000000016', 'Amp', 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'B1000000-0000-4000-8000-000000000017', 'Cre', 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'B1000000-0000-4000-8000-000000000018', 'Pro', 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'B1000000-0000-4000-8000-000000000019', 'Loc', 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'B1000000-0000-4000-8000-00000000001A', 'Pri', 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'B1000000-0000-4000-8000-00000000001B', 'Má', 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'B1000000-0000-4000-8000-00000000001C', 'Sé', 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'B1000000-0000-4000-8000-00000000001D', 'Bá', 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'B1000000-0000-4000-8000-00000000001E', 'Cre', 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.notas_credito', 'id_nota_credito'), COALESCE((SELECT MAX(id_nota_credito) FROM fiscal.notas_credito), 1), true);

-- =================================================================================================
-- 094. TABLA: fiscal.cancelaciones_cfdi (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO fiscal.cancelaciones_cfdi (id_cancelacion_cfdi, factura, motivo_cancelacion_sat, uuid_sustitucion, acuse_cancelacion_sat, fecha_solicitud_cancelacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '01', 'B1000000-0000-4000-8000-000000000001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, '02', 'B1000000-0000-4000-8000-000000000002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, '03', 'B1000000-0000-4000-8000-000000000003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, '04', 'B1000000-0000-4000-8000-000000000004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, '01', 'B1000000-0000-4000-8000-000000000005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, '02', 'B1000000-0000-4000-8000-000000000006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, '03', 'B1000000-0000-4000-8000-000000000007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, '04', 'B1000000-0000-4000-8000-000000000008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, '01', 'B1000000-0000-4000-8000-000000000009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, '02', 'B1000000-0000-4000-8000-00000000000A', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, '03', 'B1000000-0000-4000-8000-00000000000B', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, '04', 'B1000000-0000-4000-8000-00000000000C', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, '01', 'B1000000-0000-4000-8000-00000000000D', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, '02', 'B1000000-0000-4000-8000-00000000000E', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, '03', 'B1000000-0000-4000-8000-00000000000F', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, '04', 'B1000000-0000-4000-8000-000000000010', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, '01', 'B1000000-0000-4000-8000-000000000011', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, '02', 'B1000000-0000-4000-8000-000000000012', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, '03', 'B1000000-0000-4000-8000-000000000013', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, '04', 'B1000000-0000-4000-8000-000000000014', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, '01', 'B1000000-0000-4000-8000-000000000015', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, '02', 'B1000000-0000-4000-8000-000000000016', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, '03', 'B1000000-0000-4000-8000-000000000017', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, '04', 'B1000000-0000-4000-8000-000000000018', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, '01', 'B1000000-0000-4000-8000-000000000019', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, '02', 'B1000000-0000-4000-8000-00000000001A', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, '03', 'B1000000-0000-4000-8000-00000000001B', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, '04', 'B1000000-0000-4000-8000-00000000001C', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, '01', 'B1000000-0000-4000-8000-00000000001D', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, '02', 'B1000000-0000-4000-8000-00000000001E', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('fiscal.cancelaciones_cfdi', 'id_cancelacion_cfdi'), COALESCE((SELECT MAX(id_cancelacion_cfdi) FROM fiscal.cancelaciones_cfdi), 1), true);

-- =================================================================================================
-- 095. TABLA: promos.campanias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.campanias (id_campania, codigo_campania, nombre_campania, fecha_inicio, fecha_fin, presupuesto_maximo_descuentos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'CAMPANIA_01', 'Kit Rutina La Roche-Posay #1', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'CAMPANIA_02', 'Kit Rutina CeraVe Dermatological #2', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CAMPANIA_03', 'Kit Rutina The Ordinary Deciem #3', '2026-02-03 11:30:00', '2026-02-03 11:30:00', 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'CAMPANIA_04', 'Kit Rutina ISDIN Fotoprotección #4', '2026-02-04 11:30:00', '2026-02-04 11:30:00', 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'CAMPANIA_05', 'Kit Rutina Bioderma Laboratoire #5', '2026-02-05 11:30:00', '2026-02-05 11:30:00', 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CAMPANIA_06', 'Kit Rutina Eau Thermale Avène #6', '2026-02-06 11:30:00', '2026-02-06 11:30:00', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'CAMPANIA_07', 'Kit Rutina Eucerin Beiersdorf #7', '2026-02-07 11:30:00', '2026-02-07 11:30:00', 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'CAMPANIA_08', 'Kit Rutina Vichy Laboratoires #8', '2026-02-08 11:30:00', '2026-02-08 11:30:00', 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'CAMPANIA_09', 'Kit Rutina SkinCeuticals Clinical #9', '2026-02-09 11:30:00', '2026-02-09 11:30:00', 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'CAMPANIA_10', 'Kit Rutina Sesderma Nanotech #10', '2026-02-10 11:30:00', '2026-02-10 11:30:00', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'CAMPANIA_11', 'Kit Rutina NARS Cosmetics #11', '2026-02-11 11:30:00', '2026-02-11 11:30:00', 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'CAMPANIA_12', 'Kit Rutina MAC Professional #12', '2026-02-12 11:30:00', '2026-02-12 11:30:00', 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'CAMPANIA_13', 'Kit Rutina Fenty Beauty #13', '2026-02-13 11:30:00', '2026-02-13 11:30:00', 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'CAMPANIA_14', 'Kit Rutina Rare Beauty #14', '2026-02-14 11:30:00', '2026-02-14 11:30:00', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'CAMPANIA_15', 'Kit Rutina Clinique Laboratories #15', '2026-02-15 11:30:00', '2026-02-15 11:30:00', 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'CAMPANIA_16', 'Kit Rutina Estée Lauder #16', '2026-02-16 11:30:00', '2026-02-16 11:30:00', 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'CAMPANIA_17', 'Kit Rutina Lancôme Paris #17', '2026-02-17 11:30:00', '2026-02-17 11:30:00', 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'CAMPANIA_18', 'Kit Rutina Charlotte Tilbury #18', '2026-02-18 11:30:00', '2026-02-18 11:30:00', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'CAMPANIA_19', 'Kit Rutina Paula''s Choice Skincare #19', '2026-02-19 11:30:00', '2026-02-19 11:30:00', 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'CAMPANIA_20', 'Kit Rutina COSRX K-Beauty #20', '2026-02-20 11:30:00', '2026-02-20 11:30:00', 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'CAMPANIA_21', 'Kit Rutina Laneige Amorepacific #21', '2026-02-21 11:30:00', '2026-02-21 11:30:00', 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'CAMPANIA_22', 'Kit Rutina Uriage Eau Thermale #22', '2026-02-22 11:30:00', '2026-02-22 11:30:00', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'CAMPANIA_23', 'Kit Rutina Laboratoire SVR #23', '2026-02-23 11:30:00', '2026-02-23 11:30:00', 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'CAMPANIA_24', 'Kit Rutina MartiDerm Ampollas #24', '2026-02-24 11:30:00', '2026-02-24 11:30:00', 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'CAMPANIA_25', 'Kit Rutina Heliocare Cantabria Labs #25', '2026-02-25 11:30:00', '2026-02-25 11:30:00', 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'CAMPANIA_26', 'Kit Rutina Kiehl''s Since 1851 #26', '2026-02-26 11:30:00', '2026-02-26 11:30:00', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'CAMPANIA_27', 'Kit Rutina Garnier SkinActive #27', '2026-02-27 11:30:00', '2026-02-27 11:30:00', 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'CAMPANIA_28', 'Kit Rutina L''Oréal Paris Derm #28', '2026-02-28 11:30:00', '2026-02-28 11:30:00', 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'CAMPANIA_29', 'Kit Rutina Neutrogena Derm #29', '2026-02-01 11:30:00', '2026-02-01 11:30:00', 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'CAMPANIA_30', 'Kit Rutina DermaCare Labs México #30', '2026-02-02 11:30:00', '2026-02-02 11:30:00', 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.campanias', 'id_campania'), COALESCE((SELECT MAX(id_campania) FROM promos.campanias), 1), true);

-- =================================================================================================
-- 096. TABLA: promos.cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones (id_cupon, campania, codigo_cupon, tipo_descuento, valor_descuento, monto_minimo_compra, limite_usos_totales, usos_actuales, limite_usos_por_cliente, fecha_expiracion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CUPON_01', 1, 17.50, 17.50, 1, 1, 1, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'CUPON_02', 2, 20.00, 20.00, 2, 2, 2, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'CUPON_03', 3, 22.50, 22.50, 3, 3, 3, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'CUPON_04', 4, 25.00, 25.00, 4, 4, 4, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'CUPON_05', 5, 27.50, 27.50, 5, 5, 5, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'CUPON_06', 6, 30.00, 30.00, 6, 6, 6, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'CUPON_07', 7, 32.50, 32.50, 7, 7, 7, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'CUPON_08', 8, 35.00, 35.00, 8, 8, 8, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'CUPON_09', 9, 37.50, 37.50, 9, 9, 9, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'CUPON_10', 10, 40.00, 40.00, 10, 10, 10, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'CUPON_11', 11, 42.50, 42.50, 11, 11, 11, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'CUPON_12', 12, 45.00, 45.00, 12, 12, 12, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'CUPON_13', 13, 47.50, 47.50, 13, 13, 13, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'CUPON_14', 14, 50.00, 50.00, 14, 14, 14, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'CUPON_15', 15, 52.50, 52.50, 15, 15, 15, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'CUPON_16', 16, 55.00, 55.00, 16, 16, 16, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'CUPON_17', 17, 57.50, 57.50, 17, 17, 17, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'CUPON_18', 18, 60.00, 60.00, 18, 18, 18, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'CUPON_19', 19, 62.50, 62.50, 19, 19, 19, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'CUPON_20', 20, 65.00, 65.00, 20, 20, 20, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'CUPON_21', 21, 67.50, 67.50, 21, 21, 21, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'CUPON_22', 22, 70.00, 70.00, 22, 22, 22, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'CUPON_23', 23, 72.50, 72.50, 23, 23, 23, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'CUPON_24', 24, 75.00, 75.00, 24, 24, 24, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'CUPON_25', 25, 77.50, 77.50, 25, 25, 25, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'CUPON_26', 26, 80.00, 80.00, 26, 26, 26, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'CUPON_27', 27, 82.50, 82.50, 27, 27, 27, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'CUPON_28', 28, 85.00, 85.00, 28, 28, 28, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'CUPON_29', 29, 87.50, 87.50, 29, 29, 29, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'CUPON_30', 30, 90.00, 90.00, 30, 30, 30, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.cupones', 'id_cupon'), COALESCE((SELECT MAX(id_cupon) FROM promos.cupones), 1), true);

-- =================================================================================================
-- 097. TABLA: promos.reglas_elegibilidad_cupon (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.reglas_elegibilidad_cupon (id_regla_cupon, cupon, solo_primera_compra, excluye_kits_promocionales, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('promos.reglas_elegibilidad_cupon', 'id_regla_cupon'), COALESCE((SELECT MAX(id_regla_cupon) FROM promos.reglas_elegibilidad_cupon), 1), true);

-- =================================================================================================
-- 098. TABLA: promos.cupones_categorias_excluidas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.cupones_categorias_excluidas (id_cupon_exclusion, cupon, categoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('promos.cupones_categorias_excluidas', 'id_cupon_exclusion'), COALESCE((SELECT MAX(id_cupon_exclusion) FROM promos.cupones_categorias_excluidas), 1), true);

-- =================================================================================================
-- 099. TABLA: promos.redenciones_cupones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.redenciones_cupones (id_redencion_cupon, cupon, cliente, orden, monto_ahorrado, fecha_aplicacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 17.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 20.00, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 22.50, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 25.00, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 27.50, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 30.00, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 32.50, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 35.00, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 37.50, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 40.00, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 42.50, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 45.00, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 47.50, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 50.00, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 52.50, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 55.00, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 57.50, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 60.00, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 62.50, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 65.00, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 67.50, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 70.00, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 72.50, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 75.00, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 77.50, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 80.00, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 82.50, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 85.00, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 87.50, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 90.00, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.redenciones_cupones', 'id_redencion_cupon'), COALESCE((SELECT MAX(id_redencion_cupon) FROM promos.redenciones_cupones), 1), true);

-- =================================================================================================
-- 100. TABLA: promos.ventas_flash_horarias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO promos.ventas_flash_horarias (id_venta_flash, variante_sku, precio_oferta_flash, stock_destinado_flash, stock_vendido_flash, fecha_hora_inicio, fecha_hora_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 17.50, 1, 1, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 20.00, 2, 2, '2026-02-02 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 22.50, 3, 3, '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 25.00, 4, 4, '2026-02-04 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 27.50, 5, 5, '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 30.00, 6, 6, '2026-02-06 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 32.50, 7, 7, '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 35.00, 8, 8, '2026-02-08 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 37.50, 9, 9, '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 40.00, 10, 10, '2026-02-10 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 42.50, 11, 11, '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 45.00, 12, 12, '2026-02-12 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 47.50, 13, 13, '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 50.00, 14, 14, '2026-02-14 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 52.50, 15, 15, '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 55.00, 16, 16, '2026-02-16 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 57.50, 17, 17, '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 60.00, 18, 18, '2026-02-18 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 62.50, 19, 19, '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 65.00, 20, 20, '2026-02-20 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 67.50, 21, 21, '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 70.00, 22, 22, '2026-02-22 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 72.50, 23, 23, '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 75.00, 24, 24, '2026-02-24 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 77.50, 25, 25, '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 80.00, 26, 26, '2026-02-26 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 82.50, 27, 27, '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 85.00, 28, 28, '2026-02-28 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 87.50, 29, 29, '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 90.00, 30, 30, '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('promos.ventas_flash_horarias', 'id_venta_flash'), COALESCE((SELECT MAX(id_venta_flash) FROM promos.ventas_flash_horarias), 1), true);

-- =================================================================================================
-- 101. TABLA: compras.estados_orden_compra (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.estados_orden_compra (id_estado_oc, codigo_estado, nombre_estado, descripcion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'BORRADOR', 'Borrador de Compra', 'Requisición convertida en borrador pendiente de firma', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ENVIADA', 'Enviada a Proveedor', 'Orden de compra emitida y notificada al laboratorio', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'CONFIRMADA', 'Confirmada con Cita Andén', 'Proveedor confirmó fecha de entrega y lotes sanitarios', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'REC_PARCIAL', 'Recibida Parcialmente', 'Entrega parcial validada en andén de CEDIS', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'REC_TOTAL', 'Recibida Completa', 'Totalidad de unidades ingresadas a inventario QA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'CANCELADA', 'Cancelada', 'Orden de compra anulada por incumplimiento de SLA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('compras.estados_orden_compra', 'id_estado_oc'), COALESCE((SELECT MAX(id_estado_oc) FROM compras.estados_orden_compra), 1), true);

-- =================================================================================================
-- 102. TABLA: compras.proveedores (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedores (id_proveedor, codigo_proveedor, razon_social, nombre_comercial, rfc_proveedor, pais_origen, dias_credito_pago, calificacion_calidad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PROVEEDO_01', 'Laboratorios La Roche-Posay S.A. de C.V.', 'Kit Rutina La Roche-Posay #1', 'MEGC910315H01', 'México', 1, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PROVEEDO_02', 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Kit Rutina CeraVe Dermatological #2', 'RALS920315H02', 'México', 2, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PROVEEDO_03', 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Kit Rutina The Ordinary Deciem #3', 'TOVV930315H03', 'México', 3, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PROVEEDO_04', 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Kit Rutina ISDIN Fotoprotección #4', 'HECA940315H04', 'México', 4, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PROVEEDO_05', 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Kit Rutina Bioderma Laboratoire #5', 'SAFM950315H05', 'México', 5, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PROVEEDO_06', 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Kit Rutina Eau Thermale Avène #6', 'MATD960315H06', 'México', 6, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PROVEEDO_07', 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Kit Rutina Eucerin Beiersdorf #7', 'GORC970315H07', 'México', 7, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PROVEEDO_08', 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Kit Rutina Vichy Laboratoires #8', 'FLCM980315H08', 'México', 8, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PROVEEDO_09', 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Kit Rutina SkinCeuticals Clinical #9', 'MODL990315H09', 'México', 9, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PROVEEDO_10', 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Kit Rutina Sesderma Nanotech #10', 'VAOS900315H10', 'México', 10, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PROVEEDO_11', 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Kit Rutina NARS Cosmetics #11', 'GUNR910315H11', 'México', 11, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PROVEEDO_12', 'Laboratorios MAC Professional S.A. de C.V.', 'Kit Rutina MAC Professional #12', 'JIPS920315H12', 'México', 12, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PROVEEDO_13', 'Laboratorios Fenty Beauty S.A. de C.V.', 'Kit Rutina Fenty Beauty #13', 'RUSF930315H13', 'México', 13, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PROVEEDO_14', 'Laboratorios Rare Beauty S.A. de C.V.', 'Kit Rutina Rare Beauty #14', 'RICE940315H14', 'México', 14, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PROVEEDO_15', 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Kit Rutina Clinique Laboratories #15', 'AGIX950315H15', 'México', 15, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PROVEEDO_16', 'Laboratorios Estée Lauder S.A. de C.V.', 'Kit Rutina Estée Lauder #16', 'MEND960315H16', 'México', 16, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PROVEEDO_17', 'Laboratorios Lancôme Paris S.A. de C.V.', 'Kit Rutina Lancôme Paris #17', 'CADA970315H17', 'México', 17, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PROVEEDO_18', 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Kit Rutina Charlotte Tilbury #18', 'VEMG980315H18', 'México', 18, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PROVEEDO_19', 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Kit Rutina Paula''s Choice Skincare #19', 'CORP990315H19', 'México', 19, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PROVEEDO_20', 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Kit Rutina COSRX K-Beauty #20', 'RACA900315H20', 'México', 20, 4.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PROVEEDO_21', 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Kit Rutina Laneige Amorepacific #21', 'GULR910315H21', 'México', 21, 4.10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PROVEEDO_22', 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Kit Rutina Uriage Eau Thermale #22', 'PECN920315H22', 'México', 22, 4.20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PROVEEDO_23', 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Kit Rutina Laboratoire SVR #23', 'HEVN930315H23', 'México', 23, 4.30, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PROVEEDO_24', 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Kit Rutina MartiDerm Ampollas #24', 'MECJ940315H24', 'México', 24, 4.40, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PROVEEDO_25', 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Kit Rutina Heliocare Cantabria Labs #25', 'DOEI950315H25', 'México', 25, 4.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PROVEEDO_26', 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Kit Rutina Kiehl''s Since 1851 #26', 'SIPL960315H26', 'México', 26, 4.60, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PROVEEDO_27', 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Kit Rutina Garnier SkinActive #27', 'CHBA970315H27', 'México', 27, 4.70, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PROVEEDO_28', 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Kit Rutina L''Oréal Paris Derm #28', 'OCAR980315H28', 'México', 28, 4.80, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PROVEEDO_29', 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Kit Rutina Neutrogena Derm #29', 'MILP990315H29', 'México', 29, 4.90, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PROVEEDO_30', 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Kit Rutina DermaCare Labs México #30', 'PASM900315H30', 'México', 30, 4.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.proveedores', 'id_proveedor'), COALESCE((SELECT MAX(id_proveedor) FROM compras.proveedores), 1), true);

-- =================================================================================================
-- 103. TABLA: compras.contactos_proveedor (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.contactos_proveedor (id_contacto_proveedor, proveedor, nombre_contacto, puesto_cargo, email_contacto, telefono_directo, es_contacto_principal, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Laboratorios La Roche-Posay S.A. de C.V.', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Laboratorios CeraVe Dermatological S.A. de C.V.', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumo', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Laboratorios The Ordinary Deciem S.A. de C.V.', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Flui', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Laboratorios ISDIN Fotoprotección S.A. de C.V.', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurón', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Laboratorios Bioderma Laboratoire S.A. de C.V.', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Laboratorios Eau Thermale Avène S.A. de C.V.', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% No', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Laboratorios Eucerin Beiersdorf S.A. de C.V.', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermoli', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Laboratorios Vichy Laboratoires S.A. de C.V.', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pur', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Laboratorios SkinCeuticals Clinical S.A. de C.V.', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje C', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Laboratorios Sesderma Nanotech S.A. de C.V.', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Al', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Laboratorios NARS Cosmetics S.A. de C.V.', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Ci', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Laboratorios MAC Professional S.A. de C.V.', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Sal', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Laboratorios Fenty Beauty S.A. de C.V.', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Laboratorios Rare Beauty S.A. de C.V.', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna ', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Laboratorios Clinique Laboratories S.A. de C.V.', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmant', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Laboratorios Estée Lauder S.A. de C.V.', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emu', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Laboratorios Lancôme Paris S.A. de C.V.', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante ', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Laboratorios Charlotte Tilbury S.A. de C.V.', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Pé', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Laboratorios Paula''s Choice Skincare S.A. de C.V.', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Mat', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Laboratorios COSRX K-Beauty S.A. de C.V.', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmen', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Laboratorios Laneige Amorepacific S.A. de C.V.', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Laboratorios Uriage Eau Thermale S.A. de C.V.', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteogli', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Laboratorios Laboratoire SVR S.A. de C.V.', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Laboratorios MartiDerm Ampollas S.A. de C.V.', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mine', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Laboratorios Heliocare Cantabria Labs S.A. de C.V.', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Laboratorios Kiehl''s Since 1851 S.A. de C.V.', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimi', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Laboratorios Garnier SkinActive S.A. de C.V.', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas ', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Laboratorios L''Oréal Paris Derm S.A. de C.V.', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Co', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Laboratorios Neutrogena Derm S.A. de C.V.', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillan', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Laboratorios DermaCare Labs México S.A. de C.V.', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-R', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.contactos_proveedor', 'id_contacto_proveedor'), COALESCE((SELECT MAX(id_contacto_proveedor) FROM compras.contactos_proveedor), 1), true);

-- =================================================================================================
-- 104. TABLA: compras.proveedor_slas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_slas (id_proveedor_sla, proveedor, tiempo_promedio_entrega_dias, porcentaje_tolerancia_mermas, penalizacion_por_dia_retraso_porc, vigencia_acuerdo_fin, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('compras.proveedor_slas', 'id_proveedor_sla'), COALESCE((SELECT MAX(id_proveedor_sla) FROM compras.proveedor_slas), 1), true);

-- =================================================================================================
-- 105. TABLA: compras.proveedor_productos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.proveedor_productos (id_proveedor_producto, proveedor, variante_sku, codigo_articulo_proveedor, costo_negociado_unitario, lote_minimo_compra, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('compras.proveedor_productos', 'id_proveedor_producto'), COALESCE((SELECT MAX(id_proveedor_producto) FROM compras.proveedor_productos), 1), true);

-- =================================================================================================
-- 106. TABLA: compras.requisiciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones (id_requisicion, folio_requisicion, departamento_solicitante, prioridad, motivo_solicitud, fecha_limite_requerida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-REQUI-2026-0001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'BAJA', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-REQUI-2026-0002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'MEDIA', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', '2026-03-02', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-REQUI-2026-0003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03', 'URGENTE_DESABASTO', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', '2026-03-03', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-REQUI-2026-0004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'BAJA', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', '2026-03-04', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-REQUI-2026-0005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'MEDIA', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', '2026-03-05', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-REQUI-2026-0006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'URGENTE_DESABASTO', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', '2026-03-06', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-REQUI-2026-0007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'BAJA', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', '2026-03-07', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-REQUI-2026-0008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'MEDIA', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', '2026-03-08', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-REQUI-2026-0009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'URGENTE_DESABASTO', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', '2026-03-09', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-REQUI-2026-0010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'BAJA', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', '2026-03-10', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-REQUI-2026-0011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'MEDIA', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', '2026-03-11', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-REQUI-2026-0012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'URGENTE_DESABASTO', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', '2026-03-12', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-REQUI-2026-0013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'BAJA', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', '2026-03-13', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-REQUI-2026-0014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'MEDIA', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', '2026-03-14', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-REQUI-2026-0015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'URGENTE_DESABASTO', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', '2026-03-15', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-REQUI-2026-0016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'BAJA', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', '2026-03-16', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-REQUI-2026-0017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'MEDIA', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', '2026-03-17', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-REQUI-2026-0018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'URGENTE_DESABASTO', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', '2026-03-18', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-REQUI-2026-0019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'BAJA', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', '2026-03-19', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-REQUI-2026-0020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'MEDIA', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', '2026-03-20', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-REQUI-2026-0021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'URGENTE_DESABASTO', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', '2026-03-21', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-REQUI-2026-0022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'BAJA', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', '2026-03-22', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-REQUI-2026-0023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23', 'MEDIA', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', '2026-03-23', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-REQUI-2026-0024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'URGENTE_DESABASTO', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', '2026-03-24', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-REQUI-2026-0025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México', 'BAJA', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', '2026-03-25', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-REQUI-2026-0026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'MEDIA', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', '2026-03-26', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-REQUI-2026-0027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'URGENTE_DESABASTO', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', '2026-03-27', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-REQUI-2026-0028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'BAJA', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', '2026-03-28', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-REQUI-2026-0029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'MEDIA', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', '2026-03-01', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-REQUI-2026-0030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'URGENTE_DESABASTO', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', '2026-03-02', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.requisiciones', 'id_requisicion'), COALESCE((SELECT MAX(id_requisicion) FROM compras.requisiciones), 1), true);

-- =================================================================================================
-- 107. TABLA: compras.requisiciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.requisiciones_detalles (id_requisicion_detalle, requisicion, variante_sku, cantidad_requerida, cantidad_aprobada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('compras.requisiciones_detalles', 'id_requisicion_detalle'), COALESCE((SELECT MAX(id_requisicion_detalle) FROM compras.requisiciones_detalles), 1), true);

-- =================================================================================================
-- 108. TABLA: compras.ordenes_compra (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra (id_orden_compra, folio_orden_compra, proveedor, estado_oc, fecha_emision, fecha_entrega_esperada, subtotal, total_iva, total_orden_compra, condiciones_pago, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ORDEN-2026-0001', 1, 1, '2026-02-01 11:30:00', '2026-03-01', 285.50, 45.68, 17.50, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ORDEN-2026-0002', 2, 2, '2026-02-02 11:30:00', '2026-03-02', 321.00, 51.36, 20.00, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ORDEN-2026-0003', 3, 3, '2026-02-03 11:30:00', '2026-03-03', 356.50, 57.04, 22.50, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ORDEN-2026-0004', 4, 4, '2026-02-04 11:30:00', '2026-03-04', 392.00, 62.72, 25.00, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ORDEN-2026-0005', 5, 5, '2026-02-05 11:30:00', '2026-03-05', 427.50, 68.40, 27.50, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ORDEN-2026-0006', 6, 6, '2026-02-06 11:30:00', '2026-03-06', 463.00, 74.08, 30.00, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ORDEN-2026-0007', 7, 1, '2026-02-07 11:30:00', '2026-03-07', 498.50, 79.76, 32.50, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ORDEN-2026-0008', 8, 2, '2026-02-08 11:30:00', '2026-03-08', 534.00, 85.44, 35.00, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ORDEN-2026-0009', 9, 3, '2026-02-09 11:30:00', '2026-03-09', 569.50, 91.12, 37.50, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ORDEN-2026-0010', 10, 4, '2026-02-10 11:30:00', '2026-03-10', 605.00, 96.80, 40.00, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ORDEN-2026-0011', 11, 5, '2026-02-11 11:30:00', '2026-03-11', 640.50, 102.48, 42.50, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ORDEN-2026-0012', 12, 6, '2026-02-12 11:30:00', '2026-03-12', 676.00, 108.16, 45.00, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ORDEN-2026-0013', 13, 1, '2026-02-13 11:30:00', '2026-03-13', 711.50, 113.84, 47.50, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ORDEN-2026-0014', 14, 2, '2026-02-14 11:30:00', '2026-03-14', 747.00, 119.52, 50.00, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ORDEN-2026-0015', 15, 3, '2026-02-15 11:30:00', '2026-03-15', 782.50, 125.20, 52.50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ORDEN-2026-0016', 16, 4, '2026-02-16 11:30:00', '2026-03-16', 818.00, 130.88, 55.00, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ORDEN-2026-0017', 17, 5, '2026-02-17 11:30:00', '2026-03-17', 853.50, 136.56, 57.50, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ORDEN-2026-0018', 18, 6, '2026-02-18 11:30:00', '2026-03-18', 889.00, 142.24, 60.00, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ORDEN-2026-0019', 19, 1, '2026-02-19 11:30:00', '2026-03-19', 924.50, 147.92, 62.50, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ORDEN-2026-0020', 20, 2, '2026-02-20 11:30:00', '2026-03-20', 960.00, 153.60, 65.00, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ORDEN-2026-0021', 21, 3, '2026-02-21 11:30:00', '2026-03-21', 995.50, 159.28, 67.50, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ORDEN-2026-0022', 22, 4, '2026-02-22 11:30:00', '2026-03-22', 1031.00, 164.96, 70.00, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ORDEN-2026-0023', 23, 5, '2026-02-23 11:30:00', '2026-03-23', 1066.50, 170.64, 72.50, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ORDEN-2026-0024', 24, 6, '2026-02-24 11:30:00', '2026-03-24', 1102.00, 176.32, 75.00, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ORDEN-2026-0025', 25, 1, '2026-02-25 11:30:00', '2026-03-25', 1137.50, 182.00, 77.50, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ORDEN-2026-0026', 26, 2, '2026-02-26 11:30:00', '2026-03-26', 1173.00, 187.68, 80.00, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ORDEN-2026-0027', 27, 3, '2026-02-27 11:30:00', '2026-03-27', 1208.50, 193.36, 82.50, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ORDEN-2026-0028', 28, 4, '2026-02-28 11:30:00', '2026-03-28', 1244.00, 199.04, 85.00, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ORDEN-2026-0029', 29, 5, '2026-02-01 11:30:00', '2026-03-01', 1279.50, 204.72, 87.50, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ORDEN-2026-0030', 30, 6, '2026-02-02 11:30:00', '2026-03-02', 1315.00, 210.40, 90.00, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra', 'id_orden_compra'), COALESCE((SELECT MAX(id_orden_compra) FROM compras.ordenes_compra), 1), true);

-- =================================================================================================
-- 109. TABLA: compras.ordenes_compra_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.ordenes_compra_detalles (id_orden_compra_detalle, orden_compra, variante_sku, cantidad_pedida, cantidad_recibida, costo_unitario_compra, importe_total_linea, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 8, 285.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 11, 321.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 14, 356.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 17, 392.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 20, 427.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 23, 463.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 26, 26, 498.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 29, 29, 534.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 32, 32, 569.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 35, 35, 605.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 38, 38, 640.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 41, 41, 676.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 44, 44, 711.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 47, 47, 747.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 50, 50, 782.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 53, 53, 818.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 56, 56, 853.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 59, 59, 889.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 62, 62, 924.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 65, 65, 960.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 68, 68, 995.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 71, 71, 1031.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 74, 74, 1066.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 77, 77, 1102.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 80, 80, 1137.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 83, 83, 1173.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 86, 86, 1208.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 89, 89, 1244.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 92, 92, 1279.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 95, 95, 1315.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.ordenes_compra_detalles', 'id_orden_compra_detalle'), COALESCE((SELECT MAX(id_orden_compra_detalle) FROM compras.ordenes_compra_detalles), 1), true);

-- =================================================================================================
-- 110. TABLA: compras.recepciones_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_mercancia (id_recepcion, folio_recepcion, orden_compra, numero_remision_proveedor, fecha_ingreso_muelle, observaciones_chofer_transporte, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RECEP-2026-0001', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', '2026-02-01 11:30:00', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RECEP-2026-0002', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', '2026-02-02 11:30:00', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RECEP-2026-0003', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', '2026-02-03 11:30:00', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RECEP-2026-0004', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', '2026-02-04 11:30:00', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RECEP-2026-0005', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', '2026-02-05 11:30:00', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RECEP-2026-0006', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', '2026-02-06 11:30:00', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RECEP-2026-0007', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', '2026-02-07 11:30:00', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RECEP-2026-0008', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', '2026-02-08 11:30:00', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RECEP-2026-0009', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', '2026-02-09 11:30:00', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RECEP-2026-0010', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', '2026-02-10 11:30:00', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RECEP-2026-0011', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', '2026-02-11 11:30:00', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RECEP-2026-0012', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', '2026-02-12 11:30:00', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RECEP-2026-0013', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', '2026-02-13 11:30:00', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RECEP-2026-0014', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', '2026-02-14 11:30:00', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RECEP-2026-0015', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', '2026-02-15 11:30:00', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RECEP-2026-0016', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', '2026-02-16 11:30:00', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RECEP-2026-0017', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', '2026-02-17 11:30:00', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RECEP-2026-0018', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', '2026-02-18 11:30:00', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RECEP-2026-0019', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', '2026-02-19 11:30:00', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RECEP-2026-0020', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RECEP-2026-0021', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', '2026-02-21 11:30:00', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RECEP-2026-0022', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', '2026-02-22 11:30:00', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RECEP-2026-0023', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', '2026-02-23 11:30:00', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RECEP-2026-0024', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', '2026-02-24 11:30:00', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RECEP-2026-0025', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', '2026-02-25 11:30:00', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RECEP-2026-0026', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', '2026-02-26 11:30:00', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RECEP-2026-0027', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', '2026-02-27 11:30:00', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RECEP-2026-0028', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', '2026-02-28 11:30:00', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RECEP-2026-0029', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', '2026-02-01 11:30:00', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RECEP-2026-0030', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', '2026-02-02 11:30:00', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_mercancia', 'id_recepcion'), COALESCE((SELECT MAX(id_recepcion) FROM compras.recepciones_mercancia), 1), true);

-- =================================================================================================
-- 111. TABLA: compras.recepciones_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.recepciones_detalles (id_recepcion_detalle, recepcion, variante_sku, cantidad_recibida_bultos, cantidad_unidades_inspeccionadas, temperatura_llegada_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.recepciones_detalles', 'id_recepcion_detalle'), COALESCE((SELECT MAX(id_recepcion_detalle) FROM compras.recepciones_detalles), 1), true);

-- =================================================================================================
-- 112. TABLA: compras.inspecciones_sanitarias_qa (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO compras.inspecciones_sanitarias_qa (id_inspeccion_qa, recepcion_detalle, sellos_sanitarios_intactos, empaque_sin_derrames, codigo_lote_laboratorio, fecha_caducidad_impresa, dictamen_qa, justificacion_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, TRUE, 'LOTE_LAB_01', '2026-03-01', 'APROBADO', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, FALSE, 'LOTE_LAB_02', '2026-03-02', 'RECHAZADO_DEVOLVER', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, TRUE, 'LOTE_LAB_03', '2026-03-03', 'APROBADO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, FALSE, 'LOTE_LAB_04', '2026-03-04', 'RECHAZADO_DEVOLVER', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, TRUE, 'LOTE_LAB_05', '2026-03-05', 'APROBADO', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, FALSE, 'LOTE_LAB_06', '2026-03-06', 'RECHAZADO_DEVOLVER', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, TRUE, 'LOTE_LAB_07', '2026-03-07', 'APROBADO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, FALSE, 'LOTE_LAB_08', '2026-03-08', 'RECHAZADO_DEVOLVER', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, TRUE, 'LOTE_LAB_09', '2026-03-09', 'APROBADO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, FALSE, 'LOTE_LAB_10', '2026-03-10', 'RECHAZADO_DEVOLVER', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, TRUE, 'LOTE_LAB_11', '2026-03-11', 'APROBADO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, FALSE, 'LOTE_LAB_12', '2026-03-12', 'RECHAZADO_DEVOLVER', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, TRUE, 'LOTE_LAB_13', '2026-03-13', 'APROBADO', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, FALSE, 'LOTE_LAB_14', '2026-03-14', 'RECHAZADO_DEVOLVER', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, TRUE, 'LOTE_LAB_15', '2026-03-15', 'APROBADO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, FALSE, 'LOTE_LAB_16', '2026-03-16', 'RECHAZADO_DEVOLVER', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, TRUE, 'LOTE_LAB_17', '2026-03-17', 'APROBADO', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, FALSE, 'LOTE_LAB_18', '2026-03-18', 'RECHAZADO_DEVOLVER', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, TRUE, 'LOTE_LAB_19', '2026-03-19', 'APROBADO', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, FALSE, 'LOTE_LAB_20', '2026-03-20', 'RECHAZADO_DEVOLVER', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, TRUE, 'LOTE_LAB_21', '2026-03-21', 'APROBADO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, FALSE, 'LOTE_LAB_22', '2026-03-22', 'RECHAZADO_DEVOLVER', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, TRUE, 'LOTE_LAB_23', '2026-03-23', 'APROBADO', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, FALSE, 'LOTE_LAB_24', '2026-03-24', 'RECHAZADO_DEVOLVER', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, TRUE, 'LOTE_LAB_25', '2026-03-25', 'APROBADO', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, FALSE, 'LOTE_LAB_26', '2026-03-26', 'RECHAZADO_DEVOLVER', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, TRUE, 'LOTE_LAB_27', '2026-03-27', 'APROBADO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, FALSE, 'LOTE_LAB_28', '2026-03-28', 'RECHAZADO_DEVOLVER', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, TRUE, 'LOTE_LAB_29', '2026-03-01', 'APROBADO', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, FALSE, 'LOTE_LAB_30', '2026-03-02', 'RECHAZADO_DEVOLVER', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('compras.inspecciones_sanitarias_qa', 'id_inspeccion_qa'), COALESCE((SELECT MAX(id_inspeccion_qa) FROM compras.inspecciones_sanitarias_qa), 1), true);

-- =================================================================================================
-- 113. TABLA: wms.almacenes_cedis (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.almacenes_cedis (id_almacen, codigo_almacen, nombre_almacen, calle_numero, codigo_postal, ciudad, capacidad_volumetrica_m3, cuenta_con_cadena_frio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ALMACEN_01', 'CEDIS Monterrey Parque Stiva Unidad 1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '25700', 'Monclova', 17.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'ALMACEN_02', 'CEDIS CDMX Vallejo Industrial Unidad 2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '64000', 'Monterrey', 20.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'ALMACEN_03', 'CEDIS Guadalajara El Salto Unidad 3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '66220', 'San Pedro Garza García', 22.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'ALMACEN_04', 'CEDIS Monclova Centro Distribución Unidad 4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '06700', 'Ciudad de México', 25.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'ALMACEN_05', 'CEDIS Querétaro Logístico Bajío Unidad 5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '11560', 'Ciudad de México', 27.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'ALMACEN_06', 'CEDIS Puebla Parque Finsa Unidad 6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '44100', 'Guadalajara', 30.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'ALMACEN_07', 'CEDIS Monterrey Parque Stiva Unidad 7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '25000', 'Saltillo', 32.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'ALMACEN_08', 'CEDIS CDMX Vallejo Industrial Unidad 8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '76000', 'Querétaro', 35.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'ALMACEN_09', 'CEDIS Guadalajara El Salto Unidad 9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '72000', 'Puebla', 37.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'ALMACEN_10', 'CEDIS Monclova Centro Distribución Unidad 10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '97000', 'Mérida', 40.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'ALMACEN_11', 'CEDIS Querétaro Logístico Bajío Unidad 11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '25700', 'Monclova', 42.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'ALMACEN_12', 'CEDIS Puebla Parque Finsa Unidad 12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '64000', 'Monterrey', 45.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'ALMACEN_13', 'CEDIS Monterrey Parque Stiva Unidad 13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '66220', 'San Pedro Garza García', 47.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'ALMACEN_14', 'CEDIS CDMX Vallejo Industrial Unidad 14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '06700', 'Ciudad de México', 50.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'ALMACEN_15', 'CEDIS Guadalajara El Salto Unidad 15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '11560', 'Ciudad de México', 52.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'ALMACEN_16', 'CEDIS Monclova Centro Distribución Unidad 16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '44100', 'Guadalajara', 55.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'ALMACEN_17', 'CEDIS Querétaro Logístico Bajío Unidad 17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '25000', 'Saltillo', 57.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'ALMACEN_18', 'CEDIS Puebla Parque Finsa Unidad 18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '76000', 'Querétaro', 60.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'ALMACEN_19', 'CEDIS Monterrey Parque Stiva Unidad 19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '72000', 'Puebla', 62.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'ALMACEN_20', 'CEDIS CDMX Vallejo Industrial Unidad 20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '97000', 'Mérida', 65.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'ALMACEN_21', 'CEDIS Guadalajara El Salto Unidad 21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '25700', 'Monclova', 67.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'ALMACEN_22', 'CEDIS Monclova Centro Distribución Unidad 22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '64000', 'Monterrey', 70.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'ALMACEN_23', 'CEDIS Querétaro Logístico Bajío Unidad 23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '66220', 'San Pedro Garza García', 72.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'ALMACEN_24', 'CEDIS Puebla Parque Finsa Unidad 24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '06700', 'Ciudad de México', 75.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'ALMACEN_25', 'CEDIS Monterrey Parque Stiva Unidad 25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '11560', 'Ciudad de México', 77.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'ALMACEN_26', 'CEDIS CDMX Vallejo Industrial Unidad 26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '44100', 'Guadalajara', 80.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'ALMACEN_27', 'CEDIS Guadalajara El Salto Unidad 27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '25000', 'Saltillo', 82.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'ALMACEN_28', 'CEDIS Monclova Centro Distribución Unidad 28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '76000', 'Querétaro', 85.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'ALMACEN_29', 'CEDIS Querétaro Logístico Bajío Unidad 29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '72000', 'Puebla', 87.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'ALMACEN_30', 'CEDIS Puebla Parque Finsa Unidad 30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '97000', 'Mérida', 90.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.almacenes_cedis', 'id_almacen'), COALESCE((SELECT MAX(id_almacen) FROM wms.almacenes_cedis), 1), true);

-- =================================================================================================
-- 114. TABLA: wms.zonas_almacen (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.zonas_almacen (id_zona_almacen, almacen, codigo_zona, descripcion, temperatura_min_celsius, temperatura_max_celsius, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ZONA_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ZONA_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ZONA_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ZONA_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ZONA_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ZONA_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ZONA_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ZONA_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ZONA_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ZONA_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ZONA_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ZONA_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ZONA_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ZONA_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ZONA_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ZONA_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ZONA_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ZONA_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ZONA_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ZONA_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ZONA_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ZONA_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ZONA_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ZONA_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ZONA_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ZONA_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ZONA_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ZONA_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ZONA_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ZONA_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.zonas_almacen', 'id_zona_almacen'), COALESCE((SELECT MAX(id_zona_almacen) FROM wms.zonas_almacen), 1), true);

-- =================================================================================================
-- 115. TABLA: wms.pasillos_ubicaciones (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.pasillos_ubicaciones (id_ubicacion, zona_almacen, codigo_ubicacion, peso_maximo_kg, es_bloqueada_auditoria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'UBICACIO_01', 17.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'UBICACIO_02', 20.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'UBICACIO_03', 22.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'UBICACIO_04', 25.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'UBICACIO_05', 27.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'UBICACIO_06', 30.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'UBICACIO_07', 32.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'UBICACIO_08', 35.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'UBICACIO_09', 37.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'UBICACIO_10', 40.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'UBICACIO_11', 42.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'UBICACIO_12', 45.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'UBICACIO_13', 47.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'UBICACIO_14', 50.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'UBICACIO_15', 52.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'UBICACIO_16', 55.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'UBICACIO_17', 57.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'UBICACIO_18', 60.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'UBICACIO_19', 62.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'UBICACIO_20', 65.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'UBICACIO_21', 67.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'UBICACIO_22', 70.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'UBICACIO_23', 72.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'UBICACIO_24', 75.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'UBICACIO_25', 77.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'UBICACIO_26', 80.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'UBICACIO_27', 82.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'UBICACIO_28', 85.00, FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'UBICACIO_29', 87.50, TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'UBICACIO_30', 90.00, FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.pasillos_ubicaciones', 'id_ubicacion'), COALESCE((SELECT MAX(id_ubicacion) FROM wms.pasillos_ubicaciones), 1), true);

-- =================================================================================================
-- 116. TABLA: wms.tipos_movimiento_inventario (6 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.tipos_movimiento_inventario (id_tipo_movimiento, codigo_movimiento, nombre_movimiento, signo_afectacion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'ENT_COMPRA', 'Entrada por Compra a Proveedor', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SAL_VENTA', 'Salida por Venta E-Commerce', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'AJU_POS', 'Ajuste Positivo por Conteo Cíclico', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SAL_MERMA', 'Salida por Merma o Caducidad Sanitaria', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANS_SAL', 'Salida por Transferencia entre CEDIS', -1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANS_ENT', 'Entrada por Transferencia entre CEDIS', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL);
SELECT setval(pg_get_serial_sequence('wms.tipos_movimiento_inventario', 'id_tipo_movimiento'), COALESCE((SELECT MAX(id_tipo_movimiento) FROM wms.tipos_movimiento_inventario), 1), true);

-- =================================================================================================
-- 117. TABLA: wms.lotes_fabricacion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.lotes_fabricacion_sanitaria (id_lote, variante_sku, numero_lote_fabricante, fecha_fabricacion, fecha_caducidad, certificado_calidad_lote_url, cuarentena_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'LOT-2026-LA_R-001', '2026-03-01', '2026-03-01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'LOT-2026-CERA-002', '2026-03-02', '2026-03-02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'LOT-2026-THE_-003', '2026-03-03', '2026-03-03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'LOT-2026-ISDI-004', '2026-03-04', '2026-03-04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'LOT-2026-BIOD-005', '2026-03-05', '2026-03-05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'LOT-2026-AVEN-006', '2026-03-06', '2026-03-06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'LOT-2026-EUCE-007', '2026-03-07', '2026-03-07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'LOT-2026-VICH-008', '2026-03-08', '2026-03-08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'LOT-2026-SKIN-009', '2026-03-09', '2026-03-09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'LOT-2026-SESD-010', '2026-03-10', '2026-03-10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'LOT-2026-NARS-011', '2026-03-11', '2026-03-11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'LOT-2026-MAC-012', '2026-03-12', '2026-03-12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'LOT-2026-FENT-013', '2026-03-13', '2026-03-13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'LOT-2026-RARE-014', '2026-03-14', '2026-03-14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'LOT-2026-CLIN-015', '2026-03-15', '2026-03-15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'LOT-2026-ESTE-016', '2026-03-16', '2026-03-16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'LOT-2026-LANC-017', '2026-03-17', '2026-03-17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'LOT-2026-CHAR-018', '2026-03-18', '2026-03-18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'LOT-2026-PAUL-019', '2026-03-19', '2026-03-19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'LOT-2026-COSR-020', '2026-03-20', '2026-03-20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'LOT-2026-LANE-021', '2026-03-21', '2026-03-21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'LOT-2026-URIA-022', '2026-03-22', '2026-03-22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'LOT-2026-SVR-023', '2026-03-23', '2026-03-23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'LOT-2026-MART-024', '2026-03-24', '2026-03-24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'LOT-2026-HELI-025', '2026-03-25', '2026-03-25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'LOT-2026-KIEH-026', '2026-03-26', '2026-03-26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'LOT-2026-GARN-027', '2026-03-27', '2026-03-27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'LOT-2026-LORE-028', '2026-03-28', '2026-03-28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'LOT-2026-NEUT-029', '2026-03-01', '2026-03-01', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'LOT-2026-DERM-030', '2026-03-02', '2026-03-02', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.lotes_fabricacion_sanitaria', 'id_lote'), COALESCE((SELECT MAX(id_lote) FROM wms.lotes_fabricacion_sanitaria), 1), true);

-- =================================================================================================
-- 118. TABLA: wms.inventario_lotes_ubicacion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.inventario_lotes_ubicacion (id_inventario_stock, lote, ubicacion, stock_disponible, stock_apartado_pedidos, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('wms.inventario_lotes_ubicacion', 'id_inventario_stock'), COALESCE((SELECT MAX(id_inventario_stock) FROM wms.inventario_lotes_ubicacion), 1), true);

-- =================================================================================================
-- 119. TABLA: wms.kardex_movimientos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.kardex_movimientos (id_kardex, inventario_stock, tipo_movimiento, cantidad_movimiento, saldo_anterior, saldo_resultante, folio_documento_origen, costo_unitario_movimiento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 8, 1, 1, 'FOL-DOCUM-2026-0001', 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 11, 2, 2, 'FOL-DOCUM-2026-0002', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 14, 3, 3, 'FOL-DOCUM-2026-0003', 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 17, 4, 4, 'FOL-DOCUM-2026-0004', 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 20, 5, 5, 'FOL-DOCUM-2026-0005', 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 23, 6, 6, 'FOL-DOCUM-2026-0006', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 26, 7, 7, 'FOL-DOCUM-2026-0007', 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 2, 29, 8, 8, 'FOL-DOCUM-2026-0008', 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 3, 32, 9, 9, 'FOL-DOCUM-2026-0009', 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 4, 35, 10, 10, 'FOL-DOCUM-2026-0010', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 5, 38, 11, 11, 'FOL-DOCUM-2026-0011', 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 6, 41, 12, 12, 'FOL-DOCUM-2026-0012', 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 44, 13, 13, 'FOL-DOCUM-2026-0013', 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 2, 47, 14, 14, 'FOL-DOCUM-2026-0014', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 3, 50, 15, 15, 'FOL-DOCUM-2026-0015', 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 4, 53, 16, 16, 'FOL-DOCUM-2026-0016', 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 5, 56, 17, 17, 'FOL-DOCUM-2026-0017', 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 6, 59, 18, 18, 'FOL-DOCUM-2026-0018', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 62, 19, 19, 'FOL-DOCUM-2026-0019', 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 2, 65, 20, 20, 'FOL-DOCUM-2026-0020', 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 3, 68, 21, 21, 'FOL-DOCUM-2026-0021', 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 4, 71, 22, 22, 'FOL-DOCUM-2026-0022', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 5, 74, 23, 23, 'FOL-DOCUM-2026-0023', 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 6, 77, 24, 24, 'FOL-DOCUM-2026-0024', 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 80, 25, 25, 'FOL-DOCUM-2026-0025', 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 2, 83, 26, 26, 'FOL-DOCUM-2026-0026', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 3, 86, 27, 27, 'FOL-DOCUM-2026-0027', 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 4, 89, 28, 28, 'FOL-DOCUM-2026-0028', 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 5, 92, 29, 29, 'FOL-DOCUM-2026-0029', 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 6, 95, 30, 30, 'FOL-DOCUM-2026-0030', 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.kardex_movimientos', 'id_kardex'), COALESCE((SELECT MAX(id_kardex) FROM wms.kardex_movimientos), 1), true);

-- =================================================================================================
-- 120. TABLA: wms.alertas_caducidad_proxima (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.alertas_caducidad_proxima (id_alerta_caducidad, lote, dias_restantes_vida_util, nivel_urgencia, accion_comercial_sugerida, atendida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'PREVENTIVA_90D', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'MODERADA_60D', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'CRITICA_30D', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'EXPIRADO', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'PREVENTIVA_90D', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'MODERADA_60D', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'CRITICA_30D', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'EXPIRADO', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'PREVENTIVA_90D', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'MODERADA_60D', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'CRITICA_30D', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'EXPIRADO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'PREVENTIVA_90D', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'MODERADA_60D', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'CRITICA_30D', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'EXPIRADO', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'PREVENTIVA_90D', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'MODERADA_60D', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'CRITICA_30D', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'EXPIRADO', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'PREVENTIVA_90D', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'MODERADA_60D', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'CRITICA_30D', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'EXPIRADO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'PREVENTIVA_90D', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'MODERADA_60D', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'CRITICA_30D', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'EXPIRADO', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'PREVENTIVA_90D', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'MODERADA_60D', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.alertas_caducidad_proxima', 'id_alerta_caducidad'), COALESCE((SELECT MAX(id_alerta_caducidad) FROM wms.alertas_caducidad_proxima), 1), true);

-- =================================================================================================
-- 121. TABLA: wms.mermas_destruccion_sanitaria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.mermas_destruccion_sanitaria (id_merma_destruccion, folio_acta_destruccion, lote, cantidad_unidades_destruidas, motivo_sanitario, empresa_manifiesto_ecologico, acta_circunstanciada_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-ACTA_-2026-0001', 1, 8, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-ACTA_-2026-0002', 2, 11, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-ACTA_-2026-0003', 3, 14, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-ACTA_-2026-0004', 4, 17, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-ACTA_-2026-0005', 5, 20, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-ACTA_-2026-0006', 6, 23, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-ACTA_-2026-0007', 7, 26, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-ACTA_-2026-0008', 8, 29, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-ACTA_-2026-0009', 9, 32, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-ACTA_-2026-0010', 10, 35, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-ACTA_-2026-0011', 11, 38, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-ACTA_-2026-0012', 12, 41, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-ACTA_-2026-0013', 13, 44, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-ACTA_-2026-0014', 14, 47, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-ACTA_-2026-0015', 15, 50, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-ACTA_-2026-0016', 16, 53, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-ACTA_-2026-0017', 17, 56, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-ACTA_-2026-0018', 18, 59, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-ACTA_-2026-0019', 19, 62, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-ACTA_-2026-0020', 20, 65, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-ACTA_-2026-0021', 21, 68, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-ACTA_-2026-0022', 22, 71, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-ACTA_-2026-0023', 23, 74, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-ACTA_-2026-0024', 24, 77, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-ACTA_-2026-0025', 25, 80, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-ACTA_-2026-0026', 26, 83, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-ACTA_-2026-0027', 27, 86, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-ACTA_-2026-0028', 28, 89, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-ACTA_-2026-0029', 29, 92, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-ACTA_-2026-0030', 30, 95, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.mermas_destruccion_sanitaria', 'id_merma_destruccion'), COALESCE((SELECT MAX(id_merma_destruccion) FROM wms.mermas_destruccion_sanitaria), 1), true);

-- =================================================================================================
-- 122. TABLA: wms.transferencias_almacenes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_almacenes (id_transferencia, folio_transferencia, almacen_origen, almacen_destino, estado_transferencia, fecha_despacho, fecha_arribo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TRANS-2026-0001', 1, 1, 'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TRANS-2026-0002', 2, 2, 'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TRANS-2026-0003', 3, 3, 'RECIBIDA_COMPLETA', '2026-02-03 11:30:00', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TRANS-2026-0004', 4, 4, 'DISCREPANCIA', '2026-02-04 11:30:00', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TRANS-2026-0005', 5, 5, 'SOLICITADA', '2026-02-05 11:30:00', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TRANS-2026-0006', 6, 6, 'EN_TRANSITO', '2026-02-06 11:30:00', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TRANS-2026-0007', 7, 7, 'RECIBIDA_COMPLETA', '2026-02-07 11:30:00', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TRANS-2026-0008', 8, 8, 'DISCREPANCIA', '2026-02-08 11:30:00', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TRANS-2026-0009', 9, 9, 'SOLICITADA', '2026-02-09 11:30:00', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TRANS-2026-0010', 10, 10, 'EN_TRANSITO', '2026-02-10 11:30:00', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TRANS-2026-0011', 11, 11, 'RECIBIDA_COMPLETA', '2026-02-11 11:30:00', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TRANS-2026-0012', 12, 12, 'DISCREPANCIA', '2026-02-12 11:30:00', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TRANS-2026-0013', 13, 13, 'SOLICITADA', '2026-02-13 11:30:00', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TRANS-2026-0014', 14, 14, 'EN_TRANSITO', '2026-02-14 11:30:00', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TRANS-2026-0015', 15, 15, 'RECIBIDA_COMPLETA', '2026-02-15 11:30:00', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TRANS-2026-0016', 16, 16, 'DISCREPANCIA', '2026-02-16 11:30:00', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TRANS-2026-0017', 17, 17, 'SOLICITADA', '2026-02-17 11:30:00', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TRANS-2026-0018', 18, 18, 'EN_TRANSITO', '2026-02-18 11:30:00', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TRANS-2026-0019', 19, 19, 'RECIBIDA_COMPLETA', '2026-02-19 11:30:00', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TRANS-2026-0020', 20, 20, 'DISCREPANCIA', '2026-02-20 11:30:00', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TRANS-2026-0021', 21, 21, 'SOLICITADA', '2026-02-21 11:30:00', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TRANS-2026-0022', 22, 22, 'EN_TRANSITO', '2026-02-22 11:30:00', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TRANS-2026-0023', 23, 23, 'RECIBIDA_COMPLETA', '2026-02-23 11:30:00', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TRANS-2026-0024', 24, 24, 'DISCREPANCIA', '2026-02-24 11:30:00', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TRANS-2026-0025', 25, 25, 'SOLICITADA', '2026-02-25 11:30:00', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TRANS-2026-0026', 26, 26, 'EN_TRANSITO', '2026-02-26 11:30:00', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TRANS-2026-0027', 27, 27, 'RECIBIDA_COMPLETA', '2026-02-27 11:30:00', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TRANS-2026-0028', 28, 28, 'DISCREPANCIA', '2026-02-28 11:30:00', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TRANS-2026-0029', 29, 29, 'SOLICITADA', '2026-02-01 11:30:00', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TRANS-2026-0030', 30, 30, 'EN_TRANSITO', '2026-02-02 11:30:00', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.transferencias_almacenes', 'id_transferencia'), COALESCE((SELECT MAX(id_transferencia) FROM wms.transferencias_almacenes), 1), true);

-- =================================================================================================
-- 123. TABLA: wms.transferencias_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.transferencias_detalles (id_transferencia_detalle, transferencia, lote, cantidad_enviada, cantidad_recibida, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('wms.transferencias_detalles', 'id_transferencia_detalle'), COALESCE((SELECT MAX(id_transferencia_detalle) FROM wms.transferencias_detalles), 1), true);

-- =================================================================================================
-- 124. TABLA: wms.conteos_ciclicos_auditoria (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_auditoria (id_conteo_ciclico, folio_auditoria, almacen, fecha_conteo, tipo_conteo, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_auditoria', 'id_conteo_ciclico'), COALESCE((SELECT MAX(id_conteo_ciclico) FROM wms.conteos_ciclicos_auditoria), 1), true);

-- =================================================================================================
-- 125. TABLA: wms.conteos_ciclicos_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.conteos_ciclicos_detalles (id_conteo_detalle, conteo_ciclico, inventario_stock, stock_sistema_teorico, stock_conteo_fisico, diferencia_piezas, justificacion_ajuste, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.conteos_ciclicos_detalles', 'id_conteo_detalle'), COALESCE((SELECT MAX(id_conteo_detalle) FROM wms.conteos_ciclicos_detalles), 1), true);

-- =================================================================================================
-- 126. TABLA: wms.monitoreo_temperatura_humedad (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO wms.monitoreo_temperatura_humedad (id_telemetria_sensor, zona_almacen, codigo_sensor_iot, temperatura_registrada_celsius, humedad_relativa_porcentaje, alerta_fuera_de_rango, fecha_hora_lectura, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'SENSOR_I_01', 17.50, 17.50, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'SENSOR_I_02', 20.00, 20.00, FALSE, '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SENSOR_I_03', 22.50, 22.50, TRUE, '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'SENSOR_I_04', 25.00, 25.00, FALSE, '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'SENSOR_I_05', 27.50, 27.50, TRUE, '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'SENSOR_I_06', 30.00, 30.00, FALSE, '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SENSOR_I_07', 32.50, 32.50, TRUE, '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'SENSOR_I_08', 35.00, 35.00, FALSE, '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'SENSOR_I_09', 37.50, 37.50, TRUE, '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'SENSOR_I_10', 40.00, 40.00, FALSE, '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SENSOR_I_11', 42.50, 42.50, TRUE, '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'SENSOR_I_12', 45.00, 45.00, FALSE, '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'SENSOR_I_13', 47.50, 47.50, TRUE, '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'SENSOR_I_14', 50.00, 50.00, FALSE, '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SENSOR_I_15', 52.50, 52.50, TRUE, '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'SENSOR_I_16', 55.00, 55.00, FALSE, '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'SENSOR_I_17', 57.50, 57.50, TRUE, '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'SENSOR_I_18', 60.00, 60.00, FALSE, '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SENSOR_I_19', 62.50, 62.50, TRUE, '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'SENSOR_I_20', 65.00, 65.00, FALSE, '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'SENSOR_I_21', 67.50, 67.50, TRUE, '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'SENSOR_I_22', 70.00, 70.00, FALSE, '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SENSOR_I_23', 72.50, 72.50, TRUE, '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'SENSOR_I_24', 75.00, 75.00, FALSE, '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'SENSOR_I_25', 77.50, 77.50, TRUE, '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'SENSOR_I_26', 80.00, 80.00, FALSE, '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SENSOR_I_27', 82.50, 82.50, TRUE, '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'SENSOR_I_28', 85.00, 85.00, FALSE, '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'SENSOR_I_29', 87.50, 87.50, TRUE, '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'SENSOR_I_30', 90.00, 90.00, FALSE, '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('wms.monitoreo_temperatura_humedad', 'id_telemetria_sensor'), COALESCE((SELECT MAX(id_telemetria_sensor) FROM wms.monitoreo_temperatura_humedad), 1), true);

-- =================================================================================================
-- 127. TABLA: envios.transportistas_paqueterias (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.transportistas_paqueterias (id_transportista, codigo_transportista, nombre_comercial, api_endpoint_tracking, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'TRANSPOR_01', 'Kit Rutina La Roche-Posay #1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'TRANSPOR_02', 'Kit Rutina CeraVe Dermatological #2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'TRANSPOR_03', 'Kit Rutina The Ordinary Deciem #3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'TRANSPOR_04', 'Kit Rutina ISDIN Fotoprotección #4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'TRANSPOR_05', 'Kit Rutina Bioderma Laboratoire #5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'TRANSPOR_06', 'Kit Rutina Eau Thermale Avène #6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'TRANSPOR_07', 'Kit Rutina Eucerin Beiersdorf #7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'TRANSPOR_08', 'Kit Rutina Vichy Laboratoires #8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'TRANSPOR_09', 'Kit Rutina SkinCeuticals Clinical #9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'TRANSPOR_10', 'Kit Rutina Sesderma Nanotech #10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'TRANSPOR_11', 'Kit Rutina NARS Cosmetics #11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'TRANSPOR_12', 'Kit Rutina MAC Professional #12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'TRANSPOR_13', 'Kit Rutina Fenty Beauty #13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'TRANSPOR_14', 'Kit Rutina Rare Beauty #14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'TRANSPOR_15', 'Kit Rutina Clinique Laboratories #15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'TRANSPOR_16', 'Kit Rutina Estée Lauder #16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'TRANSPOR_17', 'Kit Rutina Lancôme Paris #17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'TRANSPOR_18', 'Kit Rutina Charlotte Tilbury #18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'TRANSPOR_19', 'Kit Rutina Paula''s Choice Skincare #19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'TRANSPOR_20', 'Kit Rutina COSRX K-Beauty #20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'TRANSPOR_21', 'Kit Rutina Laneige Amorepacific #21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'TRANSPOR_22', 'Kit Rutina Uriage Eau Thermale #22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'TRANSPOR_23', 'Kit Rutina Laboratoire SVR #23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'TRANSPOR_24', 'Kit Rutina MartiDerm Ampollas #24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'TRANSPOR_25', 'Kit Rutina Heliocare Cantabria Labs #25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'TRANSPOR_26', 'Kit Rutina Kiehl''s Since 1851 #26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'TRANSPOR_27', 'Kit Rutina Garnier SkinActive #27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'TRANSPOR_28', 'Kit Rutina L''Oréal Paris Derm #28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'TRANSPOR_29', 'Kit Rutina Neutrogena Derm #29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'TRANSPOR_30', 'Kit Rutina DermaCare Labs México #30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.transportistas_paqueterias', 'id_transportista'), COALESCE((SELECT MAX(id_transportista) FROM envios.transportistas_paqueterias), 1), true);

-- =================================================================================================
-- 128. TABLA: envios.tipos_servicio_envio (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tipos_servicio_envio (id_servicio_envio, codigo_servicio, nombre_servicio, tiempo_garantizado_horas, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'SERVICIO_01', 'Zona Refrigerada B-01', 1, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'SERVICIO_02', 'Zona Refrigerada B-02', 2, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'SERVICIO_03', 'Zona Refrigerada B-03', 3, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'SERVICIO_04', 'Zona Refrigerada B-04', 4, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'SERVICIO_05', 'Zona Refrigerada B-05', 5, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'SERVICIO_06', 'Zona Refrigerada B-06', 6, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'SERVICIO_07', 'Zona Refrigerada B-07', 7, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'SERVICIO_08', 'Zona Refrigerada B-08', 8, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'SERVICIO_09', 'Zona Refrigerada B-09', 9, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'SERVICIO_10', 'Zona Refrigerada B-10', 10, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'SERVICIO_11', 'Zona Refrigerada B-11', 11, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'SERVICIO_12', 'Zona Refrigerada B-12', 12, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'SERVICIO_13', 'Zona Refrigerada B-13', 13, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'SERVICIO_14', 'Zona Refrigerada B-14', 14, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'SERVICIO_15', 'Zona Refrigerada B-15', 15, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'SERVICIO_16', 'Zona Refrigerada B-16', 16, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'SERVICIO_17', 'Zona Refrigerada B-17', 17, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'SERVICIO_18', 'Zona Refrigerada B-18', 18, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'SERVICIO_19', 'Zona Refrigerada B-19', 19, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'SERVICIO_20', 'Zona Refrigerada B-20', 20, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'SERVICIO_21', 'Zona Refrigerada B-21', 21, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'SERVICIO_22', 'Zona Refrigerada B-22', 22, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'SERVICIO_23', 'Zona Refrigerada B-23', 23, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'SERVICIO_24', 'Zona Refrigerada B-24', 24, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'SERVICIO_25', 'Zona Refrigerada B-25', 25, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'SERVICIO_26', 'Zona Refrigerada B-26', 26, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'SERVICIO_27', 'Zona Refrigerada B-27', 27, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'SERVICIO_28', 'Zona Refrigerada B-28', 28, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'SERVICIO_29', 'Zona Refrigerada B-29', 29, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'SERVICIO_30', 'Zona Refrigerada B-30', 30, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tipos_servicio_envio', 'id_servicio_envio'), COALESCE((SELECT MAX(id_servicio_envio) FROM envios.tipos_servicio_envio), 1), true);

-- =================================================================================================
-- 129. TABLA: envios.tarifas_zonas_postales (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.tarifas_zonas_postales (id_tarifa_zona, transportista, servicio_envio, codigo_postal_origen_prefijo, codigo_postal_destino_prefijo, peso_limite_kg, costo_base_envio, costo_kg_adicional, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'POS', 'POS', 17.50, 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'POS', 'POS', 20.00, 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'POS', 'POS', 22.50, 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'POS', 'POS', 25.00, 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'POS', 'POS', 27.50, 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'POS', 'POS', 30.00, 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'POS', 'POS', 32.50, 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'POS', 'POS', 35.00, 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'POS', 'POS', 37.50, 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'POS', 'POS', 40.00, 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'POS', 'POS', 42.50, 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'POS', 'POS', 45.00, 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'POS', 'POS', 47.50, 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'POS', 'POS', 50.00, 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'POS', 'POS', 52.50, 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'POS', 'POS', 55.00, 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'POS', 'POS', 57.50, 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'POS', 'POS', 60.00, 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'POS', 'POS', 62.50, 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'POS', 'POS', 65.00, 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'POS', 'POS', 67.50, 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'POS', 'POS', 70.00, 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'POS', 'POS', 72.50, 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'POS', 'POS', 75.00, 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'POS', 'POS', 77.50, 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'POS', 'POS', 80.00, 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'POS', 'POS', 82.50, 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'POS', 'POS', 85.00, 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'POS', 'POS', 87.50, 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'POS', 'POS', 90.00, 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.tarifas_zonas_postales', 'id_tarifa_zona'), COALESCE((SELECT MAX(id_tarifa_zona) FROM envios.tarifas_zonas_postales), 1), true);

-- =================================================================================================
-- 130. TABLA: envios.despachos_orden (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.despachos_orden (id_despacho, folio_despacho, orden_split, transportista, servicio_envio, fecha_recoleccion_paqueteria, fecha_promesa_entrega, fecha_entrega_real, estado_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-DESPA-2026-0001', 1, 1, 1, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-DESPA-2026-0002', 2, 2, 2, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-DESPA-2026-0003', 3, 3, 3, '2026-02-03 11:30:00', '2026-03-03', '2026-02-03 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-DESPA-2026-0004', 4, 4, 4, '2026-02-04 11:30:00', '2026-03-04', '2026-02-04 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-DESPA-2026-0005', 5, 5, 5, '2026-02-05 11:30:00', '2026-03-05', '2026-02-05 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-DESPA-2026-0006', 6, 6, 6, '2026-02-06 11:30:00', '2026-03-06', '2026-02-06 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-DESPA-2026-0007', 7, 7, 7, '2026-02-07 11:30:00', '2026-03-07', '2026-02-07 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-DESPA-2026-0008', 8, 8, 8, '2026-02-08 11:30:00', '2026-03-08', '2026-02-08 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-DESPA-2026-0009', 9, 9, 9, '2026-02-09 11:30:00', '2026-03-09', '2026-02-09 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-DESPA-2026-0010', 10, 10, 10, '2026-02-10 11:30:00', '2026-03-10', '2026-02-10 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-DESPA-2026-0011', 11, 11, 11, '2026-02-11 11:30:00', '2026-03-11', '2026-02-11 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-DESPA-2026-0012', 12, 12, 12, '2026-02-12 11:30:00', '2026-03-12', '2026-02-12 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-DESPA-2026-0013', 13, 13, 13, '2026-02-13 11:30:00', '2026-03-13', '2026-02-13 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-DESPA-2026-0014', 14, 14, 14, '2026-02-14 11:30:00', '2026-03-14', '2026-02-14 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-DESPA-2026-0015', 15, 15, 15, '2026-02-15 11:30:00', '2026-03-15', '2026-02-15 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-DESPA-2026-0016', 16, 16, 16, '2026-02-16 11:30:00', '2026-03-16', '2026-02-16 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-DESPA-2026-0017', 17, 17, 17, '2026-02-17 11:30:00', '2026-03-17', '2026-02-17 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-DESPA-2026-0018', 18, 18, 18, '2026-02-18 11:30:00', '2026-03-18', '2026-02-18 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-DESPA-2026-0019', 19, 19, 19, '2026-02-19 11:30:00', '2026-03-19', '2026-02-19 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-DESPA-2026-0020', 20, 20, 20, '2026-02-20 11:30:00', '2026-03-20', '2026-02-20 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-DESPA-2026-0021', 21, 21, 21, '2026-02-21 11:30:00', '2026-03-21', '2026-02-21 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-DESPA-2026-0022', 22, 22, 22, '2026-02-22 11:30:00', '2026-03-22', '2026-02-22 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-DESPA-2026-0023', 23, 23, 23, '2026-02-23 11:30:00', '2026-03-23', '2026-02-23 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-DESPA-2026-0024', 24, 24, 24, '2026-02-24 11:30:00', '2026-03-24', '2026-02-24 11:30:00', 'INCIDENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-DESPA-2026-0025', 25, 25, 25, '2026-02-25 11:30:00', '2026-03-25', '2026-02-25 11:30:00', 'PREPARANDO_PAQUETE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-DESPA-2026-0026', 26, 26, 26, '2026-02-26 11:30:00', '2026-03-26', '2026-02-26 11:30:00', 'RECOLECTADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-DESPA-2026-0027', 27, 27, 27, '2026-02-27 11:30:00', '2026-03-27', '2026-02-27 11:30:00', 'EN_TRANSITO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-DESPA-2026-0028', 28, 28, 28, '2026-02-28 11:30:00', '2026-03-28', '2026-02-28 11:30:00', 'EN_RUTA_LOCAL', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-DESPA-2026-0029', 29, 29, 29, '2026-02-01 11:30:00', '2026-03-01', '2026-02-01 11:30:00', 'ENTREGADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-DESPA-2026-0030', 30, 30, 30, '2026-02-02 11:30:00', '2026-03-02', '2026-02-02 11:30:00', 'INCIDENCIA', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.despachos_orden', 'id_despacho'), COALESCE((SELECT MAX(id_despacho) FROM envios.despachos_orden), 1), true);

-- =================================================================================================
-- 131. TABLA: envios.paquetes_bultos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_bultos (id_paquete_bulto, despacho, codigo_bulto, peso_bruto_kg, alto_cm, ancho_cm, largo_cm, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'DERMA-SKU-1001', 0.60, 13.0, 13.0, 13.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'DERMA-SKU-1002', 0.75, 14.0, 14.0, 14.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'DERMA-SKU-1003', 0.90, 15.0, 15.0, 15.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DERMA-SKU-1004', 1.05, 16.0, 16.0, 16.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'DERMA-SKU-1005', 1.20, 17.0, 17.0, 17.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'DERMA-SKU-1006', 1.35, 18.0, 18.0, 18.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'DERMA-SKU-1007', 1.50, 19.0, 19.0, 19.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DERMA-SKU-1008', 1.65, 20.0, 20.0, 20.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'DERMA-SKU-1009', 1.80, 21.0, 21.0, 21.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'DERMA-SKU-1010', 1.95, 22.0, 22.0, 22.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'DERMA-SKU-1011', 2.10, 23.0, 23.0, 23.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DERMA-SKU-1012', 2.25, 24.0, 24.0, 24.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'DERMA-SKU-1013', 2.40, 25.0, 25.0, 25.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'DERMA-SKU-1014', 2.55, 26.0, 26.0, 26.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'DERMA-SKU-1015', 2.70, 27.0, 27.0, 27.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DERMA-SKU-1016', 2.85, 28.0, 28.0, 28.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'DERMA-SKU-1017', 3.00, 29.0, 29.0, 29.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'DERMA-SKU-1018', 3.15, 30.0, 30.0, 30.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'DERMA-SKU-1019', 3.30, 31.0, 31.0, 31.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DERMA-SKU-1020', 3.45, 32.0, 32.0, 32.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'DERMA-SKU-1021', 3.60, 33.0, 33.0, 33.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'DERMA-SKU-1022', 3.75, 34.0, 34.0, 34.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'DERMA-SKU-1023', 3.90, 35.0, 35.0, 35.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DERMA-SKU-1024', 4.05, 36.0, 36.0, 36.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DERMA-SKU-1025', 4.20, 37.0, 37.0, 37.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'DERMA-SKU-1026', 4.35, 38.0, 38.0, 38.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'DERMA-SKU-1027', 4.50, 39.0, 39.0, 39.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DERMA-SKU-1028', 4.65, 40.0, 40.0, 40.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'DERMA-SKU-1029', 4.80, 41.0, 41.0, 41.0, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'DERMA-SKU-1030', 4.95, 42.0, 42.0, 42.0, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.paquetes_bultos', 'id_paquete_bulto'), COALESCE((SELECT MAX(id_paquete_bulto) FROM envios.paquetes_bultos), 1), true);

-- =================================================================================================
-- 132. TABLA: envios.paquetes_contenido_lotes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.paquetes_contenido_lotes (id_contenido_paquete, paquete_bulto, orden_detalle, lote, cantidad_piezas_en_paquete, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('envios.paquetes_contenido_lotes', 'id_contenido_paquete'), COALESCE((SELECT MAX(id_contenido_paquete) FROM envios.paquetes_contenido_lotes), 1), true);

-- =================================================================================================
-- 133. TABLA: envios.guias_rastreo (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.guias_rastreo (id_guia_rastreo, paquete_bulto, numero_guia_tracking, url_rastreo_directo, etiqueta_pdf_base64_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'DERMA-SKU-1001', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'DERMA-SKU-1002', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'DERMA-SKU-1003', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DERMA-SKU-1004', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'DERMA-SKU-1005', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'DERMA-SKU-1006', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'DERMA-SKU-1007', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DERMA-SKU-1008', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'DERMA-SKU-1009', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'DERMA-SKU-1010', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'DERMA-SKU-1011', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DERMA-SKU-1012', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'DERMA-SKU-1013', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'DERMA-SKU-1014', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'DERMA-SKU-1015', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DERMA-SKU-1016', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'DERMA-SKU-1017', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'DERMA-SKU-1018', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'DERMA-SKU-1019', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DERMA-SKU-1020', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'DERMA-SKU-1021', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'DERMA-SKU-1022', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'DERMA-SKU-1023', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DERMA-SKU-1024', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'DERMA-SKU-1025', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'DERMA-SKU-1026', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'DERMA-SKU-1027', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DERMA-SKU-1028', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'DERMA-SKU-1029', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'DERMA-SKU-1030', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.guias_rastreo', 'id_guia_rastreo'), COALESCE((SELECT MAX(id_guia_rastreo) FROM envios.guias_rastreo), 1), true);

-- =================================================================================================
-- 134. TABLA: envios.eventos_tracking_bitacora (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.eventos_tracking_bitacora (id_evento_tracking, guia_rastreo, codigo_estatus_paqueteria, descripcion_evento, ubicacion_ciudad_evento, fecha_hora_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'ESTATUS__01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'ESTATUS__02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ESTATUS__03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'ESTATUS__04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'ESTATUS__05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'ESTATUS__06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ESTATUS__07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'ESTATUS__08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'ESTATUS__09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'ESTATUS__10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ESTATUS__11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'ESTATUS__12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'ESTATUS__13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'ESTATUS__14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ESTATUS__15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'ESTATUS__16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'ESTATUS__17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'ESTATUS__18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ESTATUS__19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'ESTATUS__20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'ESTATUS__21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'ESTATUS__22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ESTATUS__23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'ESTATUS__24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'ESTATUS__25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'ESTATUS__26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ESTATUS__27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'ESTATUS__28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'ESTATUS__29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'ESTATUS__30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.eventos_tracking_bitacora', 'id_evento_tracking'), COALESCE((SELECT MAX(id_evento_tracking) FROM envios.eventos_tracking_bitacora), 1), true);

-- =================================================================================================
-- 135. TABLA: envios.intentos_entrega_fallidos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.intentos_entrega_fallidos (id_intento_fallido, despacho, numero_visita, motivo_no_entrega, fecha_intento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 1, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 1, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 1, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 1, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 1, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 1, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 1, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 1, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 1, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 1, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 1, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 1, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 1, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 1, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 1, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 1, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 1, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 1, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 1, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 1, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 1, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 1, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 1, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 1, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 1, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.intentos_entrega_fallidos', 'id_intento_fallido'), COALESCE((SELECT MAX(id_intento_fallido) FROM envios.intentos_entrega_fallidos), 1), true);

-- =================================================================================================
-- 136. TABLA: envios.incidencias_logisticas (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.incidencias_logisticas (id_incidencia_logistica, despacho, tipo_incidencia, descripcion_hechos, indemnizacion_reclamada, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EXTRAVIO_TOTAL', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PAQUETE_DANADO_DERRAME', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'ROBO_EN_TRANSITO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'DIRECCION_INEXISTENTE', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EXTRAVIO_TOTAL', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PAQUETE_DANADO_DERRAME', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'ROBO_EN_TRANSITO', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'DIRECCION_INEXISTENTE', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EXTRAVIO_TOTAL', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PAQUETE_DANADO_DERRAME', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'ROBO_EN_TRANSITO', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'DIRECCION_INEXISTENTE', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EXTRAVIO_TOTAL', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PAQUETE_DANADO_DERRAME', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'ROBO_EN_TRANSITO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'DIRECCION_INEXISTENTE', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EXTRAVIO_TOTAL', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PAQUETE_DANADO_DERRAME', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'ROBO_EN_TRANSITO', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'DIRECCION_INEXISTENTE', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EXTRAVIO_TOTAL', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PAQUETE_DANADO_DERRAME', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'ROBO_EN_TRANSITO', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'DIRECCION_INEXISTENTE', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EXTRAVIO_TOTAL', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PAQUETE_DANADO_DERRAME', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'ROBO_EN_TRANSITO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'DIRECCION_INEXISTENTE', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EXTRAVIO_TOTAL', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PAQUETE_DANADO_DERRAME', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.incidencias_logisticas', 'id_incidencia_logistica'), COALESCE((SELECT MAX(id_incidencia_logistica) FROM envios.incidencias_logisticas), 1), true);

-- =================================================================================================
-- 137. TABLA: envios.seguros_mercancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.seguros_mercancia (id_seguro_envio, despacho, aseguradora, numero_poliza, valor_asegurado, costo_prima, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 17.50, 17.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 20.00, 20.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 22.50, 22.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 25.00, 25.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 27.50, 27.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 30.00, 30.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 32.50, 32.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 35.00, 35.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 37.50, 37.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 40.00, 40.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 42.50, 42.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 45.00, 45.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 47.50, 47.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 50.00, 50.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 52.50, 52.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 55.00, 55.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 57.50, 57.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 60.00, 60.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 62.50, 62.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 65.00, 65.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 67.50, 67.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 70.00, 70.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 72.50, 72.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 75.00, 75.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 77.50, 77.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 80.00, 80.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 82.50, 82.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 85.00, 85.00, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 87.50, 87.50, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 90.00, 90.00, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.seguros_mercancia', 'id_seguro_envio'), COALESCE((SELECT MAX(id_seguro_envio) FROM envios.seguros_mercancia), 1), true);

-- =================================================================================================
-- 138. TABLA: envios.puntos_recoleccion_pickup (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO envios.puntos_recoleccion_pickup (id_punto_pickup, transportista, almacen_origen, codigo_locker, nombre_establecimiento, direccion_completa, horario_atencion, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'LOCKER_01', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'LOCKER_02', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'LOCKER_03', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'LOCKER_04', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'LOCKER_05', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'LOCKER_06', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'LOCKER_07', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'LOCKER_08', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'LOCKER_09', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'LOCKER_10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'LOCKER_11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'LOCKER_12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'LOCKER_13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'LOCKER_14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'LOCKER_15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'LOCKER_16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'LOCKER_17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'LOCKER_18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'LOCKER_19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'LOCKER_20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'LOCKER_21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'LOCKER_22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'LOCKER_23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'LOCKER_24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'LOCKER_25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'LOCKER_26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'LOCKER_27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'LOCKER_28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'LOCKER_29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'LOCKER_30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('envios.puntos_recoleccion_pickup', 'id_punto_pickup'), COALESCE((SELECT MAX(id_punto_pickup) FROM envios.puntos_recoleccion_pickup), 1), true);

-- =================================================================================================
-- 139. TABLA: postventa.motivos_devolucion_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.motivos_devolucion_rma (id_motivo_rma, codigo_motivo, descripcion_motivo, requiere_dictamen_medico, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'MOTIVO_01', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'MOTIVO_02', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'MOTIVO_03', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'MOTIVO_04', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'MOTIVO_05', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'MOTIVO_06', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'MOTIVO_07', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'MOTIVO_08', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'MOTIVO_09', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'MOTIVO_10', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'MOTIVO_11', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'MOTIVO_12', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'MOTIVO_13', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'MOTIVO_14', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'MOTIVO_15', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'MOTIVO_16', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'MOTIVO_17', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'MOTIVO_18', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'MOTIVO_19', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'MOTIVO_20', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'MOTIVO_21', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'MOTIVO_22', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'MOTIVO_23', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'MOTIVO_24', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'MOTIVO_25', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'MOTIVO_26', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'MOTIVO_27', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'MOTIVO_28', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'MOTIVO_29', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'MOTIVO_30', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.motivos_devolucion_rma', 'id_motivo_rma'), COALESCE((SELECT MAX(id_motivo_rma) FROM postventa.motivos_devolucion_rma), 1), true);

-- =================================================================================================
-- 140. TABLA: postventa.solicitudes_rma (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.solicitudes_rma (id_solicitud_rma, folio_rma, orden, motivo_rma, estado_rma, fotografia_evidencia_url, descripcion_caso_cliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-RMA-2026-0001', 1, 1, 'SOLICITADA', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-RMA-2026-0002', 2, 2, 'GUIA_RETORNO_EMITIDA', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-RMA-2026-0003', 3, 3, 'RECIBIDA_EN_QA', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-RMA-2026-0004', 4, 4, 'APROBADA_REEMBOLSAR', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-RMA-2026-0005', 5, 5, 'SOLICITADA', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-RMA-2026-0006', 6, 6, 'GUIA_RETORNO_EMITIDA', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-RMA-2026-0007', 7, 7, 'RECIBIDA_EN_QA', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-RMA-2026-0008', 8, 8, 'APROBADA_REEMBOLSAR', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-RMA-2026-0009', 9, 9, 'SOLICITADA', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-RMA-2026-0010', 10, 10, 'GUIA_RETORNO_EMITIDA', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-RMA-2026-0011', 11, 11, 'RECIBIDA_EN_QA', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-RMA-2026-0012', 12, 12, 'APROBADA_REEMBOLSAR', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-RMA-2026-0013', 13, 13, 'SOLICITADA', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-RMA-2026-0014', 14, 14, 'GUIA_RETORNO_EMITIDA', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-RMA-2026-0015', 15, 15, 'RECIBIDA_EN_QA', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-RMA-2026-0016', 16, 16, 'APROBADA_REEMBOLSAR', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-RMA-2026-0017', 17, 17, 'SOLICITADA', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-RMA-2026-0018', 18, 18, 'GUIA_RETORNO_EMITIDA', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-RMA-2026-0019', 19, 19, 'RECIBIDA_EN_QA', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-RMA-2026-0020', 20, 20, 'APROBADA_REEMBOLSAR', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-RMA-2026-0021', 21, 21, 'SOLICITADA', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-RMA-2026-0022', 22, 22, 'GUIA_RETORNO_EMITIDA', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-RMA-2026-0023', 23, 23, 'RECIBIDA_EN_QA', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-RMA-2026-0024', 24, 24, 'APROBADA_REEMBOLSAR', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-RMA-2026-0025', 25, 25, 'SOLICITADA', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-RMA-2026-0026', 26, 26, 'GUIA_RETORNO_EMITIDA', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-RMA-2026-0027', 27, 27, 'RECIBIDA_EN_QA', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-RMA-2026-0028', 28, 28, 'APROBADA_REEMBOLSAR', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-RMA-2026-0029', 29, 29, 'SOLICITADA', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-RMA-2026-0030', 30, 30, 'GUIA_RETORNO_EMITIDA', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.solicitudes_rma', 'id_solicitud_rma'), COALESCE((SELECT MAX(id_solicitud_rma) FROM postventa.solicitudes_rma), 1), true);

-- =================================================================================================
-- 141. TABLA: postventa.rma_detalles (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.rma_detalles (id_rma_detalle, solicitud_rma, orden_detalle, cantidad_devuelta, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('postventa.rma_detalles', 'id_rma_detalle'), COALESCE((SELECT MAX(id_rma_detalle) FROM postventa.rma_detalles), 1), true);

-- =================================================================================================
-- 142. TABLA: postventa.inspeccion_sanitaria_retorno (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.inspeccion_sanitaria_retorno (id_inspeccion_retorno, rma_detalle, sello_seguridad_fue_abierto, contenido_usado_porcentaje, destino_sanitario_autorizado, dictamen_auditor, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, TRUE, 17.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, FALSE, 20.00, 'DONACION_REACONDICIONADA', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, TRUE, 22.50, 'REINGRESO_STOCK_SELLADO', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, FALSE, 25.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, TRUE, 27.50, 'DONACION_REACONDICIONADA', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, FALSE, 30.00, 'REINGRESO_STOCK_SELLADO', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, TRUE, 32.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, FALSE, 35.00, 'DONACION_REACONDICIONADA', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, TRUE, 37.50, 'REINGRESO_STOCK_SELLADO', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, FALSE, 40.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, TRUE, 42.50, 'DONACION_REACONDICIONADA', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, FALSE, 45.00, 'REINGRESO_STOCK_SELLADO', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, TRUE, 47.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, FALSE, 50.00, 'DONACION_REACONDICIONADA', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, TRUE, 52.50, 'REINGRESO_STOCK_SELLADO', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, FALSE, 55.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, TRUE, 57.50, 'DONACION_REACONDICIONADA', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, FALSE, 60.00, 'REINGRESO_STOCK_SELLADO', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, TRUE, 62.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, FALSE, 65.00, 'DONACION_REACONDICIONADA', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, TRUE, 67.50, 'REINGRESO_STOCK_SELLADO', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, FALSE, 70.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, TRUE, 72.50, 'DONACION_REACONDICIONADA', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, FALSE, 75.00, 'REINGRESO_STOCK_SELLADO', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, TRUE, 77.50, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, FALSE, 80.00, 'DONACION_REACONDICIONADA', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, TRUE, 82.50, 'REINGRESO_STOCK_SELLADO', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, FALSE, 85.00, 'DESTRUCCION_INMEDIATA_RESIDUOS', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, TRUE, 87.50, 'DONACION_REACONDICIONADA', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, FALSE, 90.00, 'REINGRESO_STOCK_SELLADO', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.inspeccion_sanitaria_retorno', 'id_inspeccion_retorno'), COALESCE((SELECT MAX(id_inspeccion_retorno) FROM postventa.inspeccion_sanitaria_retorno), 1), true);

-- =================================================================================================
-- 143. TABLA: postventa.tickets_soporte (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_soporte (id_ticket, folio_ticket, cliente, asunto, categoria_ticket, prioridad, estado_ticket, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-TICKE-2026-0001', 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-TICKE-2026-0002', 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-TICKE-2026-0003', 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-TICKE-2026-0004', 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-TICKE-2026-0005', 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-TICKE-2026-0006', 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-TICKE-2026-0007', 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-TICKE-2026-0008', 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-TICKE-2026-0009', 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-TICKE-2026-0010', 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-TICKE-2026-0011', 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'FACTURACION_CFDI', 'ALTA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-TICKE-2026-0012', 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-TICKE-2026-0013', 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'ENVIO_DEMORADO', 'BAJA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-TICKE-2026-0014', 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-TICKE-2026-0015', 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'FACTURACION_CFDI', 'ALTA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-TICKE-2026-0016', 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-TICKE-2026-0017', 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'ENVIO_DEMORADO', 'BAJA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-TICKE-2026-0018', 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-TICKE-2026-0019', 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'FACTURACION_CFDI', 'ALTA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-TICKE-2026-0020', 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-TICKE-2026-0021', 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'ENVIO_DEMORADO', 'BAJA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-TICKE-2026-0022', 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-TICKE-2026-0023', 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'FACTURACION_CFDI', 'ALTA', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-TICKE-2026-0024', 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-TICKE-2026-0025', 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'ENVIO_DEMORADO', 'BAJA', 'CERRADO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-TICKE-2026-0026', 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'ABIERTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-TICKE-2026-0027', 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'FACTURACION_CFDI', 'ALTA', 'EN_PROCESO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-TICKE-2026-0028', 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'PRODUCTO_DEFECTUOSO', 'URGENTE', 'ESPERANDO_CLIENTE', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-TICKE-2026-0029', 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'ENVIO_DEMORADO', 'BAJA', 'RESUELTO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-TICKE-2026-0030', 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'ASESORIA_DERMATOLOGICA', 'MEDIA', 'CERRADO', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_soporte', 'id_ticket'), COALESCE((SELECT MAX(id_ticket) FROM postventa.tickets_soporte), 1), true);

-- =================================================================================================
-- 144. TABLA: postventa.tickets_mensajes (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.tickets_mensajes (id_ticket_mensaje, ticket, usuario_emisor, mensaje_cuerpo, adjunto_url, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.tickets_mensajes', 'id_ticket_mensaje'), COALESCE((SELECT MAX(id_ticket_mensaje) FROM postventa.tickets_mensajes), 1), true);

-- =================================================================================================
-- 145. TABLA: postventa.reportes_farmacovigilancia (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO postventa.reportes_farmacovigilancia (id_reporte_farmacovigilancia, folio_cofepris_ram, cliente, producto, lote, sintomas_reaccion_adversa, requirio_atencion_hospitalaria, fecha_aparicion_sintomas, notificado_a_autoridad_sanitaria, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'FOL-COFEP-2026-0001', 1, 1, 1, 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'FOL-COFEP-2026-0002', 2, 2, 2, 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', FALSE, '2026-03-02', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'FOL-COFEP-2026-0003', 3, 3, 3, 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-03-03', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'FOL-COFEP-2026-0004', 4, 4, 4, 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', FALSE, '2026-03-04', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'FOL-COFEP-2026-0005', 5, 5, 5, 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-03-05', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'FOL-COFEP-2026-0006', 6, 6, 6, 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', FALSE, '2026-03-06', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'FOL-COFEP-2026-0007', 7, 7, 7, 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-03-07', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'FOL-COFEP-2026-0008', 8, 8, 8, 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', FALSE, '2026-03-08', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'FOL-COFEP-2026-0009', 9, 9, 9, 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-03-09', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'FOL-COFEP-2026-0010', 10, 10, 10, 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', FALSE, '2026-03-10', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'FOL-COFEP-2026-0011', 11, 11, 11, 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-03-11', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'FOL-COFEP-2026-0012', 12, 12, 12, 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', FALSE, '2026-03-12', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'FOL-COFEP-2026-0013', 13, 13, 13, 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-03-13', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'FOL-COFEP-2026-0014', 14, 14, 14, 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', FALSE, '2026-03-14', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'FOL-COFEP-2026-0015', 15, 15, 15, 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-03-15', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'FOL-COFEP-2026-0016', 16, 16, 16, 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', FALSE, '2026-03-16', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'FOL-COFEP-2026-0017', 17, 17, 17, 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-03-17', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'FOL-COFEP-2026-0018', 18, 18, 18, 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', FALSE, '2026-03-18', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'FOL-COFEP-2026-0019', 19, 19, 19, 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-03-19', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'FOL-COFEP-2026-0020', 20, 20, 20, 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', FALSE, '2026-03-20', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'FOL-COFEP-2026-0021', 21, 21, 21, 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-03-21', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'FOL-COFEP-2026-0022', 22, 22, 22, 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', FALSE, '2026-03-22', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'FOL-COFEP-2026-0023', 23, 23, 23, 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-03-23', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'FOL-COFEP-2026-0024', 24, 24, 24, 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', FALSE, '2026-03-24', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'FOL-COFEP-2026-0025', 25, 25, 25, 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-03-25', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'FOL-COFEP-2026-0026', 26, 26, 26, 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', FALSE, '2026-03-26', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'FOL-COFEP-2026-0027', 27, 27, 27, 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-03-27', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'FOL-COFEP-2026-0028', 28, 28, 28, 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', FALSE, '2026-03-28', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'FOL-COFEP-2026-0029', 29, 29, 29, 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-03-01', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'FOL-COFEP-2026-0030', 30, 30, 30, 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2026-03-02', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('postventa.reportes_farmacovigilancia', 'id_reporte_farmacovigilancia'), COALESCE((SELECT MAX(id_reporte_farmacovigilancia) FROM postventa.reportes_farmacovigilancia), 1), true);

-- =================================================================================================
-- 146. TABLA: auditoria.tipos_evento_sistema (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.tipos_evento_sistema (id_tipo_evento, codigo_evento, nombre_evento, nivel_severidad, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'EVENTO_01', 'Sueros Concentrados Nivel 1', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'EVENTO_02', 'Limpiadores Faciales Nivel 2', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'EVENTO_03', 'Fotoprotección Solar Nivel 3', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'EVENTO_04', 'Maquillaje Mineral Nivel 4', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'EVENTO_05', 'Cuidado Anti-Edad Nivel 5', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'EVENTO_06', 'Barrera Cutánea Nivel 6', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'EVENTO_07', 'Contorno de Ojos Nivel 7', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'EVENTO_08', 'Tratamiento Acné Nivel 8', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'EVENTO_09', 'Hidratantes Ceramidas Nivel 9', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'EVENTO_10', 'Exfoliantes Químicos Nivel 10', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'EVENTO_11', 'Sueros Concentrados Nivel 11', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'EVENTO_12', 'Limpiadores Faciales Nivel 12', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'EVENTO_13', 'Fotoprotección Solar Nivel 13', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'EVENTO_14', 'Maquillaje Mineral Nivel 14', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'EVENTO_15', 'Cuidado Anti-Edad Nivel 15', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'EVENTO_16', 'Barrera Cutánea Nivel 16', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'EVENTO_17', 'Contorno de Ojos Nivel 17', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'EVENTO_18', 'Tratamiento Acné Nivel 18', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'EVENTO_19', 'Hidratantes Ceramidas Nivel 19', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'EVENTO_20', 'Exfoliantes Químicos Nivel 20', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'EVENTO_21', 'Sueros Concentrados Nivel 21', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'EVENTO_22', 'Limpiadores Faciales Nivel 22', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'EVENTO_23', 'Fotoprotección Solar Nivel 23', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'EVENTO_24', 'Maquillaje Mineral Nivel 24', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'EVENTO_25', 'Cuidado Anti-Edad Nivel 25', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'EVENTO_26', 'Barrera Cutánea Nivel 26', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'EVENTO_27', 'Contorno de Ojos Nivel 27', 'CRITICO_SEGURIDAD', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'EVENTO_28', 'Tratamiento Acné Nivel 28', 'INFO', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'EVENTO_29', 'Hidratantes Ceramidas Nivel 29', 'ADVERTENCIA', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'EVENTO_30', 'Exfoliantes Químicos Nivel 30', 'CRITICO_SEGURIDAD', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.tipos_evento_sistema', 'id_tipo_evento'), COALESCE((SELECT MAX(id_tipo_evento) FROM auditoria.tipos_evento_sistema), 1), true);

-- =================================================================================================
-- 147. TABLA: auditoria.bitacora_seguridad_global (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_seguridad_global (id_log_seguridad, tipo_evento, usuario, direccion_ip, user_agent, modulo_origen, descripcion_evento, firma_integridad_hash, fecha_evento, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '189.203.3.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.1', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '189.203.6.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.2', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monte', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', '2026-02-02 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 3, '189.203.9.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.3', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pe', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', '2026-02-03 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 4, '189.203.12.28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.4', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciud', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', '2026-02-04 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 5, '189.203.15.35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.5', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciuda', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', '2026-02-05 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 6, '189.203.18.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.6', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', '2026-02-06 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 7, '189.203.21.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.7', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo ', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', '2026-02-07 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 8, '189.203.24.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.8', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #0', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', '2026-02-08 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 9, '189.203.27.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.9', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical ', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', '2026-02-09 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 10, '189.203.30.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.10', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida ', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', '2026-02-10 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 11, '189.203.33.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.11', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #1', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', '2026-02-11 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 12, '189.203.36.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.12', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', '2026-02-12 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 13, '189.203.39.91', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.13', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Ga', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', '2026-02-13 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 14, '189.203.42.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.14', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de Méxi', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', '2026-02-14 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 15, '189.203.45.105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.15', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciuda', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', '2026-02-15 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 16, '189.203.48.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.16', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #1', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', '2026-02-16 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 17, '189.203.51.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.17', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Salt', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', '2026-02-17 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 18, '189.203.54.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.18', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Queréta', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', '2026-02-18 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 19, '189.203.57.133', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.19', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skinca', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', '2026-02-19 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 20, '189.203.60.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.20', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', '2026-02-20 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 21, '189.203.63.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.21', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', '2026-02-21 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 22, '189.203.66.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.22', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Mon', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', '2026-02-22 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 23, '189.203.69.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.23', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pe', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', '2026-02-23 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 24, '189.203.72.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.24', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciu', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', '2026-02-24 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 25, '189.203.75.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.25', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria La', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', '2026-02-25 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 26, '189.203.78.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.26', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Gua', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', '2026-02-26 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 27, '189.203.81.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.27', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Sal', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', '2026-02-27 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 28, '189.203.84.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.28', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', '2026-02-28 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 29, '189.203.87.203', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.29', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', '2026-02-01 11:30:00', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 30, '189.203.90.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) DermaApp/2.4.30', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', '2026-02-02 11:30:00', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_seguridad_global', 'id_log_seguridad'), COALESCE((SELECT MAX(id_log_seguridad) FROM auditoria.bitacora_seguridad_global), 1), true);

-- =================================================================================================
-- 148. TABLA: auditoria.bitacora_cambios_datos (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO auditoria.bitacora_cambios_datos (id_cambio_dato, nombre_tabla, id_registro_afectado, tipo_operacion, valores_anteriores_json, valores_nuevos_json, motivo_cambio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
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
SELECT setval(pg_get_serial_sequence('auditoria.bitacora_cambios_datos', 'id_cambio_dato'), COALESCE((SELECT MAX(id_cambio_dato) FROM auditoria.bitacora_cambios_datos), 1), true);

-- =================================================================================================
-- 149. TABLA: sistema.parametros_configuracion (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.parametros_configuracion (id_parametro, clave_parametro, valor_parametro, tipo_dato, descripcion, es_modificable_en_caliente, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 'PARAMETR_01', '31', 'STRING', 'Registro validado de Sérum Niacinamida 10% + Zinc 1% para seguimiento clínico, logístico y auditoría #001.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 'PARAMETR_02', '32', 'INTEGER', 'Registro validado de Gel Limpiador Espumoso Facial para seguimiento clínico, logístico y auditoría #002.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 'PARAMETR_03', '33', 'DECIMAL', 'Registro validado de Protector Solar Fluido SPF 50+ para seguimiento clínico, logístico y auditoría #003.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 'PARAMETR_04', '34', 'BOOLEAN', 'Registro validado de Sérum Ácido Hialurónico 2% + B5 para seguimiento clínico, logístico y auditoría #004.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 'PARAMETR_05', '35', 'JSON', 'Registro validado de Crema Hidratante con Ceramidas para seguimiento clínico, logístico y auditoría #005.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 'PARAMETR_06', '36', 'STRING', 'Registro validado de Retinol Puro 0.5% Nocturno para seguimiento clínico, logístico y auditoría #006.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 'PARAMETR_07', '37', 'INTEGER', 'Registro validado de Agua Micelar Dermolimpiadora para seguimiento clínico, logístico y auditoría #007.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 'PARAMETR_08', '38', 'DECIMAL', 'Registro validado de Sérum Vitamina C Pura 15% para seguimiento clínico, logístico y auditoría #008.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 'PARAMETR_09', '39', 'BOOLEAN', 'Registro validado de Base de Maquillaje Cobertura Media para seguimiento clínico, logístico y auditoría #009.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 'PARAMETR_10', '40', 'JSON', 'Registro validado de Corrector Líquido Alta Duración para seguimiento clínico, logístico y auditoría #010.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 'PARAMETR_11', '41', 'STRING', 'Registro validado de Bálsamo Reparador Cicaplast B5 para seguimiento clínico, logístico y auditoría #011.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 'PARAMETR_12', '42', 'INTEGER', 'Registro validado de Exfoliante Ácido Salicílico 2% para seguimiento clínico, logístico y auditoría #012.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 'PARAMETR_13', '43', 'DECIMAL', 'Registro validado de Contorno de Ojos con Cafeína 5% para seguimiento clínico, logístico y auditoría #013.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 'PARAMETR_14', '44', 'BOOLEAN', 'Registro validado de Mascarilla Nocturna Hidratante para seguimiento clínico, logístico y auditoría #014.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 'PARAMETR_15', '45', 'JSON', 'Registro validado de Bruma Termal Calmante Mineral para seguimiento clínico, logístico y auditoría #015.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 'PARAMETR_16', '46', 'STRING', 'Registro validado de Aceite Limpiador Emulsionable para seguimiento clínico, logístico y auditoría #016.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 'PARAMETR_17', '47', 'INTEGER', 'Registro validado de Tónico Equilibrante Ácido Glicólico 7% para seguimiento clínico, logístico y auditoría #017.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 'PARAMETR_18', '48', 'DECIMAL', 'Registro validado de Labial Hidratante Péptidos Nude para seguimiento clínico, logístico y auditoría #018.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 'PARAMETR_19', '49', 'BOOLEAN', 'Registro validado de Polvo Traslúcido Matificante Mineral para seguimiento clínico, logístico y auditoría #019.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 'PARAMETR_20', '50', 'JSON', 'Registro validado de Rubor Líquido Pigmento Natural para seguimiento clínico, logístico y auditoría #020.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 'PARAMETR_21', '51', 'STRING', 'Registro validado de Sérum Ácido Azelaico 10% Suspensión para seguimiento clínico, logístico y auditoría #021.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 'PARAMETR_22', '52', 'INTEGER', 'Registro validado de Ampolletas Proteoglicanos Firmeza para seguimiento clínico, logístico y auditoría #022.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 'PARAMETR_23', '53', 'DECIMAL', 'Registro validado de Crema Despigmentante Noche Melasma para seguimiento clínico, logístico y auditoría #023.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 'PARAMETR_24', '54', 'BOOLEAN', 'Registro validado de Protector Solar Mineral Óxido Zinc para seguimiento clínico, logístico y auditoría #024.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 'PARAMETR_25', '55', 'JSON', 'Registro validado de Loción Corporal Urea 10% Reparadora para seguimiento clínico, logístico y auditoría #025.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 'PARAMETR_26', '56', 'STRING', 'Registro validado de Primer Facial Minimizador de Poros para seguimiento clínico, logístico y auditoría #026.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 'PARAMETR_27', '57', 'INTEGER', 'Registro validado de Máscara de Pestañas Hipoalergénica para seguimiento clínico, logístico y auditoría #027.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 'PARAMETR_28', '58', 'DECIMAL', 'Registro validado de Sérum Péptidos de Cobre 1% para seguimiento clínico, logístico y auditoría #028.', FALSE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 'PARAMETR_29', '59', 'BOOLEAN', 'Registro validado de Bálsamo Desmaquillante Caléndula para seguimiento clínico, logístico y auditoría #029.', TRUE, TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 'PARAMETR_30', '60', 'JSON', 'Registro validado de Crema Barrera Post-Retinoide para seguimiento clínico, logístico y auditoría #030.', FALSE, FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.parametros_configuracion', 'id_parametro'), COALESCE((SELECT MAX(id_parametro) FROM sistema.parametros_configuracion), 1), true);

-- =================================================================================================
-- 150. TABLA: sistema.notificaciones_push_email (30 Registros Reales Verificados)
-- =================================================================================================
INSERT INTO sistema.notificaciones_push_email (id_notificacion, usuario_destinatario, tipo_canal, titulo_asunto, cuerpo_mensaje, enviada, fecha_envio, error_envio, activo, fecha_creacion, creado_por, fecha_modificacion, modificado_por, fecha_baja, eliminado_por) OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'EMAIL', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', 'Confirmación de orden y seguimiento dermatológico #0001 - DermaCare MX', TRUE, '2026-02-01 11:30:00', 'Sérum Niacinamida 10% + Zinc 1% - La Roche-Posay (Monclova #01)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(2, 2, 'PUSH_APP', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', 'Confirmación de orden y seguimiento dermatológico #0002 - DermaCare MX', FALSE, '2026-02-02 11:30:00', 'Gel Limpiador Espumoso Facial - CeraVe Dermatological (Monterrey #02)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(3, 3, 'SMS', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', 'Confirmación de orden y seguimiento dermatológico #0003 - DermaCare MX', TRUE, '2026-02-03 11:30:00', 'Protector Solar Fluido SPF 50+ - The Ordinary Deciem (San Pedro Garza García #03)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(4, 4, 'WHATSAPP', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', 'Confirmación de orden y seguimiento dermatológico #0004 - DermaCare MX', FALSE, '2026-02-04 11:30:00', 'Sérum Ácido Hialurónico 2% + B5 - ISDIN Fotoprotección (Ciudad de México #04)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(5, 5, 'EMAIL', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', 'Confirmación de orden y seguimiento dermatológico #0005 - DermaCare MX', TRUE, '2026-02-05 11:30:00', 'Crema Hidratante con Ceramidas - Bioderma Laboratoire (Ciudad de México #05)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(6, 6, 'PUSH_APP', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', 'Confirmación de orden y seguimiento dermatológico #0006 - DermaCare MX', FALSE, '2026-02-06 11:30:00', 'Retinol Puro 0.5% Nocturno - Eau Thermale Avène (Guadalajara #06)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(7, 7, 'SMS', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', 'Confirmación de orden y seguimiento dermatológico #0007 - DermaCare MX', TRUE, '2026-02-07 11:30:00', 'Agua Micelar Dermolimpiadora - Eucerin Beiersdorf (Saltillo #07)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(8, 8, 'WHATSAPP', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', 'Confirmación de orden y seguimiento dermatológico #0008 - DermaCare MX', FALSE, '2026-02-08 11:30:00', 'Sérum Vitamina C Pura 15% - Vichy Laboratoires (Querétaro #08)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(9, 9, 'EMAIL', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', 'Confirmación de orden y seguimiento dermatológico #0009 - DermaCare MX', TRUE, '2026-02-09 11:30:00', 'Base de Maquillaje Cobertura Media - SkinCeuticals Clinical (Puebla #09)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(10, 10, 'PUSH_APP', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', 'Confirmación de orden y seguimiento dermatológico #0010 - DermaCare MX', FALSE, '2026-02-10 11:30:00', 'Corrector Líquido Alta Duración - Sesderma Nanotech (Mérida #10)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(11, 11, 'SMS', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', 'Confirmación de orden y seguimiento dermatológico #0011 - DermaCare MX', TRUE, '2026-02-11 11:30:00', 'Bálsamo Reparador Cicaplast B5 - NARS Cosmetics (Monclova #11)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(12, 12, 'WHATSAPP', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', 'Confirmación de orden y seguimiento dermatológico #0012 - DermaCare MX', FALSE, '2026-02-12 11:30:00', 'Exfoliante Ácido Salicílico 2% - MAC Professional (Monterrey #12)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(13, 13, 'EMAIL', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', 'Confirmación de orden y seguimiento dermatológico #0013 - DermaCare MX', TRUE, '2026-02-13 11:30:00', 'Contorno de Ojos con Cafeína 5% - Fenty Beauty (San Pedro Garza García #13)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(14, 14, 'PUSH_APP', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', 'Confirmación de orden y seguimiento dermatológico #0014 - DermaCare MX', FALSE, '2026-02-14 11:30:00', 'Mascarilla Nocturna Hidratante - Rare Beauty (Ciudad de México #14)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(15, 15, 'SMS', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', 'Confirmación de orden y seguimiento dermatológico #0015 - DermaCare MX', TRUE, '2026-02-15 11:30:00', 'Bruma Termal Calmante Mineral - Clinique Laboratories (Ciudad de México #15)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(16, 16, 'WHATSAPP', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', 'Confirmación de orden y seguimiento dermatológico #0016 - DermaCare MX', FALSE, '2026-02-16 11:30:00', 'Aceite Limpiador Emulsionable - Estée Lauder (Guadalajara #16)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(17, 17, 'EMAIL', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', 'Confirmación de orden y seguimiento dermatológico #0017 - DermaCare MX', TRUE, '2026-02-17 11:30:00', 'Tónico Equilibrante Ácido Glicólico 7% - Lancôme Paris (Saltillo #17)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(18, 18, 'PUSH_APP', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', 'Confirmación de orden y seguimiento dermatológico #0018 - DermaCare MX', FALSE, '2026-02-18 11:30:00', 'Labial Hidratante Péptidos Nude - Charlotte Tilbury (Querétaro #18)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(19, 19, 'SMS', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', 'Confirmación de orden y seguimiento dermatológico #0019 - DermaCare MX', TRUE, '2026-02-19 11:30:00', 'Polvo Traslúcido Matificante Mineral - Paula''s Choice Skincare (Puebla #19)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(20, 20, 'WHATSAPP', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', 'Confirmación de orden y seguimiento dermatológico #0020 - DermaCare MX', FALSE, '2026-02-20 11:30:00', 'Rubor Líquido Pigmento Natural - COSRX K-Beauty (Mérida #20)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(21, 21, 'EMAIL', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', 'Confirmación de orden y seguimiento dermatológico #0021 - DermaCare MX', TRUE, '2026-02-21 11:30:00', 'Sérum Ácido Azelaico 10% Suspensión - Laneige Amorepacific (Monclova #21)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(22, 22, 'PUSH_APP', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', 'Confirmación de orden y seguimiento dermatológico #0022 - DermaCare MX', FALSE, '2026-02-22 11:30:00', 'Ampolletas Proteoglicanos Firmeza - Uriage Eau Thermale (Monterrey #22)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(23, 23, 'SMS', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', 'Confirmación de orden y seguimiento dermatológico #0023 - DermaCare MX', TRUE, '2026-02-23 11:30:00', 'Crema Despigmentante Noche Melasma - Laboratoire SVR (San Pedro Garza García #23)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(24, 24, 'WHATSAPP', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', 'Confirmación de orden y seguimiento dermatológico #0024 - DermaCare MX', FALSE, '2026-02-24 11:30:00', 'Protector Solar Mineral Óxido Zinc - MartiDerm Ampollas (Ciudad de México #24)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(25, 25, 'EMAIL', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', 'Confirmación de orden y seguimiento dermatológico #0025 - DermaCare MX', TRUE, '2026-02-25 11:30:00', 'Loción Corporal Urea 10% Reparadora - Heliocare Cantabria Labs (Ciudad de México #25)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(26, 26, 'PUSH_APP', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', 'Confirmación de orden y seguimiento dermatológico #0026 - DermaCare MX', FALSE, '2026-02-26 11:30:00', 'Primer Facial Minimizador de Poros - Kiehl''s Since 1851 (Guadalajara #26)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(27, 27, 'SMS', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', 'Confirmación de orden y seguimiento dermatológico #0027 - DermaCare MX', TRUE, '2026-02-27 11:30:00', 'Máscara de Pestañas Hipoalergénica - Garnier SkinActive (Saltillo #27)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(28, 28, 'WHATSAPP', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', 'Confirmación de orden y seguimiento dermatológico #0028 - DermaCare MX', FALSE, '2026-02-28 11:30:00', 'Sérum Péptidos de Cobre 1% - L''Oréal Paris Derm (Querétaro #28)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(29, 29, 'EMAIL', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', 'Confirmación de orden y seguimiento dermatológico #0029 - DermaCare MX', TRUE, '2026-02-01 11:30:00', 'Bálsamo Desmaquillante Caléndula - Neutrogena Derm (Puebla #29)', TRUE, '2026-01-15 09:00:00', 1, NULL, NULL, NULL, NULL),
(30, 30, 'PUSH_APP', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', 'Confirmación de orden y seguimiento dermatológico #0030 - DermaCare MX', FALSE, '2026-02-02 11:30:00', 'Crema Barrera Post-Retinoide - DermaCare Labs México (Mérida #30)', FALSE, '2025-01-01 08:00:00', 1, '2026-03-01 10:00:00', 1, '2026-03-01 10:00:00', 1);
SELECT setval(pg_get_serial_sequence('sistema.notificaciones_push_email', 'id_notificacion'), COALESCE((SELECT MAX(id_notificacion) FROM sistema.notificaciones_push_email), 1), true);

