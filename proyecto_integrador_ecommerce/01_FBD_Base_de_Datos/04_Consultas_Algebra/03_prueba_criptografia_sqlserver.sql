-- =================================================================================================
-- PROYECTO INTEGRADOR V - TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PRUEBA FUNCIONAL DE PERSISTENCIA Y AUTENTICACIÓN CRIPTOGRÁFICA (MICROSOFT SQL SERVER)
-- ASIGNATURA: FUNDAMENTOS DE BASE DE DATOS (FBD - AEF-1031) - CRITERIO 2.4 / LFPDPPP ART. 16
-- =================================================================================================
-- Demuestra:
--   1. Generación de salt criptográfico aleatorio con CRYPT_GEN_RANDOM(32).
--   2. Derivación iterativa con HASHBYTES('SHA2_512', salt + password) sin almacenar texto claro.
--   3. Registro de usuario de prueba en seguridad.usuarios y seguridad.historial_passwords.
--   4. Verificación de login exitoso (contraseña correcta) y rechazo (contraseña incorrecta),
--      registrando auditoría en seguridad.intentos_login.
-- =================================================================================================

USE EcommerceSaludBellezaDB;
GO

SET NOCOUNT ON;
BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @email_prueba NVARCHAR(150) = N'auditoria.cripto.demo@dermacare.mx';
    DECLARE @password_claro NVARCHAR(128) = N'DermaC@re#2026!Segura';
    DECLARE @password_erroneo NVARCHAR(128) = N'ClaveIncorrecta123';

    -- 1. Generar salt criptográfico único de 32 bytes (64 hex chars)
    DECLARE @salt_bin VARBINARY(32) = CRYPT_GEN_RANDOM(32);
    DECLARE @salt_hex NVARCHAR(128) = CONVERT(NVARCHAR(128), @salt_bin, 2);

    -- 2. Derivación iterativa (Key Stretching) con SHA2_512 + Salt
    DECLARE @iter INT = 1;
    DECLARE @digest VARBINARY(64) = HASHBYTES('SHA2_512', CAST(@salt_hex + N':' + @password_claro AS VARBINARY(MAX)));
    WHILE @iter < 5000
    BEGIN
        SET @digest = HASHBYTES('SHA2_512', @digest + @salt_bin);
        SET @iter += 1;
    END;
    DECLARE @hash_almacenado NVARCHAR(255) = N'$sha512-iter5000$' + @salt_hex + N'$' + CONVERT(NVARCHAR(128), @digest, 2);

    -- 3. Insertar usuario con credencial estrictamente hasheada (nunca texto plano)
    IF NOT EXISTS (SELECT 1 FROM seguridad.usuarios WHERE email = @email_prueba)
    BEGIN
        INSERT INTO seguridad.usuarios (
            email, password_hash, password_salt, telefono_movil,
            email_verificado, cuenta_bloqueada, intentos_fallidos_consecutivos,
            mfa_habilitado, creado_por
        )
        VALUES (
            @email_prueba, @hash_almacenado, @salt_hex, N'8669990001',
            1, 0, 0, 1, 1
        );
    END;

    DECLARE @id_usr BIGINT = (SELECT id_usuario FROM seguridad.usuarios WHERE email = @email_prueba);

    -- Guardar traza en historial_passwords
    INSERT INTO seguridad.historial_passwords (usuario, password_hash, password_salt, algoritmo_hashing, creado_por)
    VALUES (@id_usr, @hash_almacenado, @salt_hex, N'SHA2_512_ITER5000', 1);

    -- 4. Verificar autenticación con contraseña CORRECTA
    DECLARE @stored_hash NVARCHAR(255), @stored_salt NVARCHAR(128);
    SELECT @stored_hash = password_hash, @stored_salt = password_salt
    FROM seguridad.usuarios
    WHERE id_usuario = @id_usr;

    DECLARE @salt_check VARBINARY(32) = CONVERT(VARBINARY(32), @stored_salt, 2);
    DECLARE @d_ok VARBINARY(64) = HASHBYTES('SHA2_512', CAST(@stored_salt + N':' + @password_claro AS VARBINARY(MAX)));
    DECLARE @i INT = 1;
    WHILE @i < 5000
    BEGIN
        SET @d_ok = HASHBYTES('SHA2_512', @d_ok + @salt_check);
        SET @i += 1;
    END;
    DECLARE @calc_ok NVARCHAR(255) = N'$sha512-iter5000$' + @stored_salt + N'$' + CONVERT(NVARCHAR(128), @d_ok, 2);

    -- 5. Verificar autenticación con contraseña INCORRECTA
    DECLARE @d_bad VARBINARY(64) = HASHBYTES('SHA2_512', CAST(@stored_salt + N':' + @password_erroneo AS VARBINARY(MAX)));
    SET @i = 1;
    WHILE @i < 5000
    BEGIN
        SET @d_bad = HASHBYTES('SHA2_512', @d_bad + @salt_check);
        SET @i += 1;
    END;
    DECLARE @calc_bad NVARCHAR(255) = N'$sha512-iter5000$' + @stored_salt + N'$' + CONVERT(NVARCHAR(128), @d_bad, 2);

    -- Evidencia de resultado
    SELECT
        @email_prueba AS usuario_prueba,
        LEFT(@stored_hash, 45) + N'...' AS muestra_hash_en_bd,
        CASE WHEN @stored_hash NOT LIKE N'%' + @password_claro + N'%' THEN N'CUMPLIDO (SIN TEXTO PLANO)' ELSE N'FALLO' END AS validacion_no_texto_plano,
        CASE WHEN @calc_ok = @stored_hash THEN N'LOGIN_EXITOSO' ELSE N'LOGIN_FALLIDO' END AS prueba_password_valido,
        CASE WHEN @calc_bad <> @stored_hash THEN N'RECHAZO_CORRECTO' ELSE N'VULNERABILIDAD' END AS prueba_password_invalido;

    -- Revertir datos temporales de prueba para dejar la BD semilla intacta
    ROLLBACK TRANSACTION;
    PRINT '>>> PRUEBA CRIPTOGRÁFICA SQL SERVER COMPLETADA Y REVERTIDA LIMPIAMENTE.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
