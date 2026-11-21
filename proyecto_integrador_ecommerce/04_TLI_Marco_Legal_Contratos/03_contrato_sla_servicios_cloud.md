# CAPÍTULO VI: GESTIÓN NORMATIVA, JURÍDICA Y CONTRACTUAL (TLI — IFR-1024)
## Entregable 6.3 (Anexo): Acuerdo de Nivel de Servicio de Infraestructura Cloud, Alta Disponibilidad y Hot Swap (SLA)
**Autores (Equipo de 3 Integrantes):** José Luis Luna García · Sheyla Estefanía Moncada Guel · Eduardo Salazar Martínez

---

### ACUERDO DE NIVEL DE SERVICIO (SERVICE LEVEL AGREEMENT — SLA) PARA LA OPERACIÓN CONTINUA DEL SISTEMA DERMA-ECOM

El presente Acuerdo de Nivel de Servicio (**SLA**) es parte integrante del Contrato de Desarrollo de Software a Medida y establece los compromisos medibles de disponibilidad, rendimiento, continuidad operativa mediante **Hot Swap Multi-SGBD**, atención a incidentes y penalizaciones económicas que rigen la infraestructura del sistema **DERMA-ECOM**.

---

### 1. Métricas de Disponibilidad del Servicio (*Uptime*)

El Proveedor garantiza una disponibilidad operativa mensual mínima del **$99.9\%$**, calculada bajo la fórmula estándar:

$$\text{Disponibilidad (\%)} = \frac{\text{Minutos Totales del Mes} - \text{Minutos de Inactividad No Programada}}{\text{Minutos Totales del Mes}} \times 100$$

*Para un mes de 30 días (43,200 minutos), el tiempo máximo acumulado de inactividad no programada permitido es de **43.2 minutos/mes**.*

| Nivel de Disponibilidad Mensual | Tiempo Máximo de Caída (*Downtime*) | Estado Contractual |
| :--- | :---: | :--- |
| **$\ge 99.9\%$** | $\le 43.2\text{ min/mes}$ | Cumplimiento Pleno del SLA |
| **$99.5\% - 99.89\%$** | Hasta $3.6\text{ horas/mes}$ | Umbral de Alerta / Aplica Crédito de Servicio |
| **$< 99.0\%$** | $> 7.2\text{ horas/mes}$ | Incumplimiento Grave / Penalización Mayor |

---

### 2. Umbrales Máximos de Rendimiento y Latencia

| Componente del Sistema | Latencia Máxima Comprometida | Condición de Medición |
| :--- | :---: | :--- |
| **Consultas a Base de Datos (OLTP Multi-SGBD)** | $\le 150\text{ ms}$ | Consultas `SELECT` con índices secundarios (`30` índices) e inserciones auditadas en SQL Server 2022 / PostgreSQL 16–17. |
| **API Checkout y Tokenización Bancaria** | $\le 300\text{ ms}$ | Flujo de cobro tokenizado PCI-DSS, evaluación antifraude y split de almacenes. |
| **Ingesta de Telemetría IoT (Cadena de Frío)** | $\le 50\text{ ms}$ | Registro de sensores térmicos en `wms.monitoreo_temperatura_humedad`. |
| **Timbrado Fiscal SAT CFDI 4.0** | $\le 2.5\text{ seg}$ | Sellado digital, envío al PAC y persistencia en `fiscal.facturas_cfdi`. |
| **Conmutación *Hot Swap* Automática entre SGBD** | $\le 5\text{ seg}$ | Detección de caída del motor primario y desvío automático de consultas al motor respaldo (`hotswap_db_manager.ps1`). |

---

### 3. Matriz de Clasificación de Incidentes y Tiempos de Solución (MTTR)

| Severidad | Definición Operativa | Tiempo Máximo de Respuesta Inicial | Tiempo Máximo de Resolución (MTTR) |
| :---: | :--- | :---: | :---: |
| **Severidad 1 (Crítica)** | **Caída Total:** Indisponibilidad simultánea del sitio web o de ambos motores SGBD (SQL Server y PostgreSQL), o brecha activa de seguridad. | $\le 15\text{ minutos}$ | $\le 2\text{ horas}$ |
| **Severidad 2 (Alta)** | **Degradación Mayor:** Falla en timbrado CFDI 4.0, caída de un solo motor SGBD operando en *failover*, o pérdida de telemetría IoT en zona refrigerada. | $\le 30\text{ minutos}$ | $\le 4\text{ horas}$ |
| **Severidad 3 (Media)** | **Afectación Parcial:** Fallo en notificaciones de correo/WhatsApp, reportes analíticos lentos o errores visuales no bloqueantes. | $\le 2\text{ horas}$ | $\le 12\text{ horas}$ |
| **Severidad 4 (Baja)** | **Consultas y Mantenimiento Menor:** Ajustes en `sistema.parametros_configuracion`, alta de roles RBAC o soporte operativo general. | $\le 8\text{ horas}$ | $\le 48\text{ horas}$ |

---

### 4. Ventanas de Mantenimiento Programado

1. Notificación formal a "EL CLIENTE" con mínimo **72 horas de anticipación**.
2. Ejecución en horario de mínimo tráfico: **Domingos de 02:00 a 05:00 horas (CST, hora del centro de México)**.
3. Tope máximo de **3 horas acumuladas al mes**, aprovechando la arquitectura **Hot Swap Multi-SGBD** para aplicar parches en SQL Server o PostgreSQL sin interrupción total de lectura/operación.

---

### 5. Continuidad de Negocio y Recuperación ante Desastres (DRP)

- **RPO (*Recovery Point Objective*):** **$\le 15\text{ minutos}$**, respaldado mediante registros de transacciones (*transaction logs*) cada 10 minutos y replicación CDC hacia el motor secundario PostgreSQL.
- **RTO (*Recovery Time Objective*):** **$\le 2\text{ horas}$** para recuperación completa de infraestructura SITE (VLAN 10) y **$< 5\text{ segundos}$** para *failover* lógico de base de datos mediante la capa de abstracción Hot Swap.

---

### 6. Esquema de Penalizaciones y Créditos de Servicio

En caso de incumplimiento de la disponibilidad mensual garantizada, se aplicarán descuentos automáticos (**Créditos de Servicio**) sobre la facturación mensual siguiente:

| Disponibilidad Mensual Alcanzada | Crédito / Penalización Aplicable |
| :---: | :--- |
| **$99.00\% - 99.89\%$** | **10%** de descuento en la cuota mensual de operación/soporte. |
| **$95.00\% - 98.99\%$** | **25%** de descuento en la cuota mensual de operación/soporte. |
| **$< 95.00\%$** | **50%** de descuento + derecho de rescisión anticipada sin penalización para "EL CLIENTE". |
