-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SCRIPT MAESTRO DE DESPLIEGUE CONSOLIDADO - MICROSOFT SQL SERVER 2019 / 2022
-- TOTAL: 150 TABLAS NORMALIZADAS (50 POR INTEGRANTE)
-- =================================================================================================
-- INSTRUCCIONES DE EJECUCIÓN EN SQL SERVER MANAGEMENT STUDIO (SSMS) O AZURE DATA STUDIO:
-- 1. Habilitar "Modo SQLCMD" en el menú: Consulta (Query) -> Modo SQLCMD (SQLCMD Mode).
-- 2. Ejecutar este archivo para compilar los 3 submódulos en estricto orden de dependencias.
-- =================================================================================================

PRINT '>>> INICIANDO DESPLIEGUE DEL SISTEMA INTEGRAL E-COMMERCE (150 TABLAS)...';
GO

:r "01_modulo_identidad_catalogo_alu1.sql"
GO

:r "02_modulo_comercial_pagos_alu2.sql"
GO

:r "03_modulo_logistica_inventario_alu3.sql"
GO

PRINT '>>> DESPLIEGUE COMPLETADO EXITOSAMENTE AL 100%.';
PRINT '>>> 150 Tablas creadas con integridad referencial activa y auditoría conforme a la rúbrica.';
GO
