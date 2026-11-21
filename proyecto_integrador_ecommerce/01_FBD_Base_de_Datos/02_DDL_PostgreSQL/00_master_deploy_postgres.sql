-- =================================================================================================
-- TECNOLÓGICO NACIONAL DE MÉXICO - INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
-- PROYECTO INTEGRADOR V - INGENIERÍA INFORMÁTICA
-- SISTEMA E-COMMERCE DE CUIDADO DE LA SALUD, BELLEZA Y MAQUILLAJE
-- =================================================================================================
-- SCRIPT MAESTRO DE DESPLIEGUE CONSOLIDADO - POSTGRESQL 14 / 15 / 16 (MOTOR LIBRE)
-- TOTAL: 150 TABLAS NORMALIZADAS (50 POR INTEGRANTE)
-- =================================================================================================
-- INSTRUCCIONES DE EJECUCIÓN EN PSQL O PGADMIN:
-- psql -U postgres -d ecommerce_salud_belleza -f 00_master_deploy_postgres.sql
-- =================================================================================================

\echo '>>> INICIANDO DESPLIEGUE EN POSTGRESQL (150 TABLAS)...';

\ir 01_modulo_identidad_catalogo_alu1_postgres.sql
\ir 02_modulo_comercial_pagos_alu2_postgres.sql
\ir 03_modulo_logistica_inventario_alu3_postgres.sql

\echo '>>> DESPLIEGUE POSTGRESQL COMPLETADO EXITOSAMENTE AL 100%.';
