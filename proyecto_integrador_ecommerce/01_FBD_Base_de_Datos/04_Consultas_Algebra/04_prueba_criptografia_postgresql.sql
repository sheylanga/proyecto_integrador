-- =================================================================================================
-- PROYECTO INTEGRADOR V - TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PRUEBA FUNCIONAL DE PERSISTENCIA Y AUTENTICACIÓN CRIPTOGRÁFICA (POSTGRESQL + PGCRYPTO)
-- ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD - AEF-1031) - CRITERIO 2.4 / LFPDPPP ART. 16
-- =================================================================================================
-- EJECUCIÓN: psql -U postgres -d ecommerce_salud_belleza -f 04_prueba_criptografia_postgresql.sql
-- Demuestra:
--   1. Uso nativo de la extensión pgcrypto con bcrypt (gen_salt('bf', 12)).
--   2. Inserción segura en seguridad.usuarios sin almacenamiento en texto plano.
--   3. Validación criptográfica de login correcto vs rechazo de contraseña incorrecta.
-- =================================================================================================

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

BEGIN;

WITH params AS (
    SELECT
        'auditoria.cripto.demo@dermacare.mx'::VARCHAR(150) AS email_prueba,
        'DermaC@re#2026!Segura'::TEXT AS password_claro,
        'ClaveIncorrecta123'::TEXT AS password_erroneo,
        gen_salt('bf', 12) AS bcrypt_salt
),
usuario_insertado AS (
    INSERT INTO seguridad.usuarios (
        email, password_hash, password_salt, telefono_movil,
        email_verificado, cuenta_bloqueada, intentos_fallidos_consecutivos,
        mfa_habilitado, creado_por
    )
    SELECT
        p.email_prueba,
        crypt(p.password_claro, p.bcrypt_salt),
        p.bcrypt_salt,
        '8669990001',
        TRUE,
        FALSE,
        0,
        TRUE,
        1
    FROM params p
    RETURNING id_usuario, email, password_hash, password_salt
),
historial_insertado AS (
    INSERT INTO seguridad.historial_passwords (usuario, password_hash, password_salt, algoritmo_hashing, creado_por)
    SELECT u.id_usuario, u.password_hash, u.password_salt, 'bcrypt-pgcrypto', 1
    FROM usuario_insertado u
    RETURNING id_historial_pwd
)
SELECT
    u.email AS usuario_prueba,
    LEFT(u.password_hash, 35) || '...' AS muestra_hash_bcrypt_en_bd,
    CASE
        WHEN POSITION(p.password_claro IN u.password_hash) = 0
        THEN 'CUMPLIDO (SIN TEXTO PLANO)'
        ELSE 'FALLO'
    END AS validacion_no_texto_plano,
    CASE
        WHEN u.password_hash = crypt(p.password_claro, u.password_hash)
        THEN 'LOGIN_EXITOSO'
        ELSE 'LOGIN_FALLIDO'
    END AS prueba_password_valido,
    CASE
        WHEN u.password_hash <> crypt(p.password_erroneo, u.password_hash)
        THEN 'RECHAZO_CORRECTO'
        ELSE 'VULNERABILIDAD'
    END AS prueba_password_invalido
FROM usuario_insertado u
CROSS JOIN params p
CROSS JOIN historial_insertado h;

-- Revertir datos temporales de prueba para mantener intacta la BD semilla
ROLLBACK;
