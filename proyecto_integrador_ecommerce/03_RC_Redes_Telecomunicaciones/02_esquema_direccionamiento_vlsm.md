# CAPÍTULO IV: INFRAESTRUCTURA DE RED Y COMUNICACIONES (RC - IFD-1020)
## Entregable 4.2: Esquema de Direccionamiento IP con Máscaras de Longitud Variable (VLSM) y CIDR

---

### 1. Memoria Técnica de Cálculo Matemático VLSM

El presente diseño de direccionamiento aplica la metodología de **Máscaras de Subred de Longitud Variable (VLSM - Variable Length Subnet Mask)** bajo el estándar **CIDR (Classless Inter-Domain Routing - RFC 1519)**, sobre el bloque institucional privado asignado:
$$\text{Red Base Corporativa: } \mathbf{10.40.0.0 / 16}$$

#### 1.1 Fórmula de Dimensionamiento de Subredes:
Para calcular la cantidad de bits de host ($h$) necesarios para satisfacer la demanda de cada departamento o servicio, se aplica la fórmula fundamental:
$$2^h - 2 \ge \text{Hosts Solicitados}$$
Donde se sustraen 2 direcciones no asignables: el **Identificador de Subred** (todos los bits de host en 0) y la **Dirección de Difusión o Broadcast** (todos los bits de host en 1).

El nuevo prefijo CIDR ($/n$) se obtiene restando los bits de host a los 32 bits totales de la dirección IPv4:
$$n = 32 - h$$

#### 1.2 Algoritmo de Ordenamiento Decreciente:
De acuerdo con las mejores prácticas de ingeniería de redes para evitar la fragmentación del espacio de direccionamiento, los requerimientos se ordenan estrictamente de **mayor a menor demanda**:

1. **Subred 1 (VLAN 50 - Empleados y Dermoconsultores):** 
   - Requerimiento: $500$ hosts.
   - Cálculo: $2^8 - 2 = 254$ (Insuficiente). $2^9 - 2 = 510 \ge 500 \implies h = 9$ bits.
   - Prefijo: $32 - 9 = /23$. Máscara decimal punteada: `255.255.254.0`.
   - Bloque asignado: `10.40.0.0/23`. Rango: `10.40.0.0` a `10.40.1.255`.

2. **Subred 2 (VLAN 30 - WMS, Andén e IoT Cadena de Frío):** 
   - Requerimiento: $250$ hosts.
   - Cálculo: $2^8 - 2 = 254 \ge 250 \implies h = 8$ bits.
   - Prefijo: $32 - 8 = /24$. Máscara decimal punteada: `255.255.255.0`.
   - Bloque asignado: `10.40.2.0/24`. Rango: `10.40.2.0` a `10.40.2.255`.

3. **Subred 3 (VLAN 70 - Red de Invitados y Proveedores Wi-Fi):** 
   - Requerimiento: $250$ hosts.
   - Cálculo: $2^8 - 2 = 254 \ge 250 \implies h = 8$ bits.
   - Prefijo: $32 - 8 = /24$. Máscara decimal punteada: `255.255.255.0`.
   - Bloque asignado: `10.40.3.0/24`. Rango: `10.40.3.0` a `10.40.3.255`.

4. **Subred 4 (VLAN 20 - DMZ / Servidores Web y Aplicaciones):** 
   - Requerimiento: $120$ hosts.
   - Cálculo: $2^7 - 2 = 126 \ge 120 \implies h = 7$ bits.
   - Prefijo: $32 - 7 = /25$. Máscara decimal punteada: `255.255.255.128`.
   - Bloque asignado: `10.40.4.0/25`. Rango: `10.40.4.0` a `10.40.4.127`.

5. **Subred 5 (VLAN 60 - Cámaras CCTV y Control de Acceso Biométrico):** 
   - Requerimiento: $120$ hosts.
   - Cálculo: $2^7 - 2 = 126 \ge 120 \implies h = 7$ bits.
   - Prefijo: $32 - 7 = /25$. Máscara decimal punteada: `255.255.255.128`.
   - Bloque asignado: `10.40.4.128/25`. Rango: `10.40.4.128` a `10.40.4.255`.

6. **Subred 6 (VLAN 10 - Granja de Base de Datos Multi-SGBD Cluster):** 
   - Requerimiento: $60$ hosts.
   - Cálculo: $2^6 - 2 = 62 \ge 60 \implies h = 6$ bits.
   - Prefijo: $32 - 6 = /26$. Máscara decimal punteada: `255.255.255.192`.
   - Bloque asignado: `10.40.5.0/26`. Rango: `10.40.5.0` a `10.40.5.63`.

7. **Subred 7 (VLAN 40 - Administración TI, Ciberseguridad y SOC/NOC):** 
   - Requerimiento: $30$ hosts.
   - Cálculo: $2^5 - 2 = 30 \ge 30 \implies h = 5$ bits.
   - Prefijo: $32 - 5 = /27$. Máscara decimal punteada: `255.255.255.224`.
   - Bloque asignado: `10.40.5.64/27`. Rango: `10.40.5.64` a `10.40.5.95`.

8. **Subred 8 (VLAN 99 - Gestión Fuera de Banda / Management de Equipos de Red):** 
   - Requerimiento: $30$ hosts.
   - Cálculo: $2^5 - 2 = 30 \ge 30 \implies h = 5$ bits.
   - Prefijo: $32 - 5 = /27$. Máscara decimal punteada: `255.255.255.224`.
   - Bloque asignado: `10.40.5.96/27`. Rango: `10.40.5.96` a `10.40.5.127`.

9. **Subred 9 (Enlace Punto a Punto Core-01 <-> Dist-01):** 
   - Requerimiento: $2$ hosts.
   - Cálculo: $2^2 - 2 = 2 \ge 2 \implies h = 2$ bits.
   - Prefijo: $32 - 2 = /30$. Máscara: `255.255.255.252`.
   - Bloque: `10.40.5.128/30`. Rango: `10.40.5.128` a `10.40.5.131`.

10. **Subred 10 (Enlace Punto a Punto Core-02 <-> Dist-02):** 
    - Requerimiento: $2$ hosts.
    - Bloque: `10.40.5.132/30`. Rango: `10.40.5.132` a `10.40.5.135`.

11. **Subred 11 (Enlace Punto a Punto WAN Borde <-> Core Cluster):** 
    - Requerimiento: $2$ hosts.
    - Bloque: `10.40.5.136/30`. Rango: `10.40.5.136` a `10.40.5.139`.

---

### 2. Tabla Maestra de Direccionamiento VLSM y Asignación de Pasarelas

| Subred / Nombre | VLAN ID | Hosts Req. | Hosts Disp. | ID de Red | Prefijo CIDR | Máscara de Subred | Primera IP Utilizable | Última IP Utilizable | Dirección de Broadcast | Default Gateway Virtual (HSRP) |
| :--- | :---: | :---: | :---: | :--- | :---: | :--- | :--- | :--- | :--- | :--- |
| **Empleados y Dermoconsultores** | 50 | 500 | 510 | `10.40.0.0` | `/23` | `255.255.254.0` | `10.40.0.1` | `10.40.1.254` | `10.40.1.255` | `10.40.0.1` |
| **WMS & IoT Cadena de Frío** | 30 | 250 | 254 | `10.40.2.0` | `/24` | `255.255.255.0` | `10.40.2.1` | `10.40.2.254` | `10.40.2.255` | `10.40.2.1` |
| **Red Invitados y Proveedores** | 70 | 250 | 254 | `10.40.3.0` | `/24` | `255.255.255.0` | `10.40.3.1` | `10.40.3.254` | `10.40.3.255` | `10.40.3.1` |
| **DMZ / Servidores Web & Apps** | 20 | 120 | 126 | `10.40.4.0` | `/25` | `255.255.255.128` | `10.40.4.1` | `10.40.4.126` | `10.40.4.127` | `10.40.4.1` |
| **CCTV & Control Biométrico** | 60 | 120 | 126 | `10.40.4.128` | `/25` | `255.255.255.128` | `10.40.4.129` | `10.40.4.254` | `10.40.4.255` | `10.40.4.129` |
| **Cluster Base de Datos (SGBD)** | 10 | 60 | 62 | `10.40.5.0` | `/26` | `255.255.255.192` | `10.40.5.1` | `10.40.5.62` | `10.40.5.63` | `10.40.5.1` |
| **Admin TI & Ciberseguridad** | 40 | 30 | 30 | `10.40.5.64` | `/27` | `255.255.255.224` | `10.40.5.65` | `10.40.5.94` | `10.40.5.95` | `10.40.5.65` |
| **Gestión de Red (Management)** | 99 | 30 | 30 | `10.40.5.96` | `/27` | `255.255.255.224` | `10.40.5.97` | `10.40.5.126` | `10.40.5.127` | `10.40.5.97` |
| **PTP Core-01 <-> Dist-01** | N/A | 2 | 2 | `10.40.5.128` | `/30` | `255.255.255.252` | `10.40.5.129` | `10.40.5.130` | `10.40.5.131` | `10.40.5.129` |
| **PTP Core-02 <-> Dist-02** | N/A | 2 | 2 | `10.40.5.132` | `/30` | `255.255.255.252` | `10.40.5.133` | `10.40.5.134` | `10.40.5.135` | `10.40.5.133` |
| **PTP WAN Borde <-> Core** | N/A | 2 | 2 | `10.40.5.136` | `/30` | `255.255.255.252` | `10.40.5.137` | `10.40.5.138` | `10.40.5.139` | `10.40.5.137` |

---

### 3. Asignación Estática de Servidores Críticos de Base de Datos y Servicios

Para garantizar estabilidad operacional y evitar fluctuaciones en los DNS o conexiones de los microservicios, los siguientes activos cuentan con direccionamiento estático reservado dentro de sus respectivas subredes:

| Activo de Red / Servidor | Subred / VLAN | Dirección IP Asignada | Rol Arquitectónico |
| :--- | :---: | :---: | :--- |
| **HSRP VIP Gateway BD** | VLAN 10 | `10.40.5.1` | Pasarela Virtual Redundante para Base de Datos |
| **SQL Server Primario (AlwaysOn)** | VLAN 10 | `10.40.5.10` | Motor Transaccional Principal (150 Tablas OLTP) |
| **SQL Server Réplica Lectura** | VLAN 10 | `10.40.5.11` | Réplica de solo lectura para reportes y analytics |
| **PostgreSQL Primario (SGBD Libre)** | VLAN 10 | `10.40.5.20` | Servidor de Contingencia y Auditoría de Datos |
| **PostgreSQL Standby Réplica** | VLAN 10 | `10.40.5.21` | Réplica asíncrona Streaming Replication |
| **HSRP VIP Gateway Web DMZ** | VLAN 20 | `10.40.4.1` | Pasarela Virtual Redundante para DMZ |
| **Balanceador NGINX Ingress 01** | VLAN 20 | `10.40.4.10` | Ingress Controller Primario (SSL Offloading) |
| **Balanceador NGINX Ingress 02** | VLAN 20 | `10.40.4.11` | Ingress Controller Secundario (Keepalived VRRP) |
| **RabbitMQ & Redis Cluster 01** | VLAN 20 | `10.40.4.30` | Broker de Mensajería y Cache en Memoria |
| **Gateway IoT Cadena Frío CEDIS** | VLAN 30 | `10.40.2.10` | Concentrador de Telemetría Frigorífica |
| **Servidor Host Bastión / VPN** | VLAN 40 | `10.40.5.70` | Punto Único de Acceso SSH / RDP Seguro |
| **Servidor Central SIEM / Wazuh** | VLAN 40 | `10.40.5.80` | Recolector de Syslog y Detección de Intrusos |
