# CAPÍTULO IV: INFRAESTRUCTURA DE RED Y COMUNICACIONES (RC - IFD-1020)
## Entregable 4.1: Diseño de Arquitectura y Topología Jerárquica de Red Corporativa

---

### 1. Justificación y Fundamentos del Modelo Jerárquico de 3 Capas

Para garantizar la alta disponibilidad, escalabilidad modular, aislamiento de dominios de colisión/difusión y la protección integral de los servidores multi-SGBD (Microsoft SQL Server y PostgreSQL), la infraestructura de red corporativa del sistema de comercio electrónico de cosmecéutica se diseñó bajo el **Modelo Jerárquico de Redes de 3 Capas de Cisco**:

```
                 +---------------------------------------+
                 |       CAPA DE NÚCLEO (CORE)          |
                 | - Conmutación de ultra-alta velocidad |
                 | - Enrutamiento OSPFv2 backbone (Área 0)|
                 | - Sin filtrado de paquetes ni retardo |
                 +-------------------+-------------------+
                                     |
                 +-------------------+-------------------+
                 |    CAPA DE DISTRIBUCIÓN (DISTRIBUTION)|
                 | - Enrutamiento entre VLANs (SVIs)     |
                 | - Filtrado y seguridad ACLs L3 / L4   |
                 | - Redundancia HSRP / VRRP (Gateways)  |
                 | - Agregación de enlaces (LACP)        |
                 +-------------------+-------------------+
                                     |
                 +-------------------+-------------------+
                 |       CAPA DE ACCESO (ACCESS)         |
                 | - Conexión de terminales y servidores |
                 | - Segmentación de VLANs 802.1Q        |
                 | - Seguridad de puertos (Port Security)|
                 | - Spanning Tree (BPDU Guard, PortFast)|
                 +---------------------------------------+
```

#### 1.1 Funciones Específicas por Capa:
1. **Capa de Núcleo (Core):**
   - Integrada por dos conmutadores multicapa **Cisco Catalyst 9500 (Core-01 y Core-02)** interconectados mediante enlaces redundantes de fibra óptica a 40 Gbps (QSFP+).
   - Su única responsabilidad es el transporte masivo y transparente de paquetes IP entre el Centro de Datos Corporativo (Site Principal) y las sucursales remotas (CEDIS Monterrey y CEDIS CDMX), minimizando la latencia mediante conmutación en hardware (ASICs).
2. **Capa de Distribución (Distribution):**
   - Implementada con un par de switches de Capa 3 **Cisco Catalyst 9300 (Dist-01 y Dist-02)** operando en esquema activo/pasivo mediante **HSRP (Hot Standby Router Protocol)**.
   - Centraliza el enrutamiento inter-VLAN, aplica Listas de Control de Acceso (ACLs) para impedir que estaciones no autorizadas alcancen la VLAN de bases de datos, y agrega el ancho de banda mediante **EtherChannel LACP (802.3ad)**.
3. **Capa de Acceso (Access):**
   - Formada por conmutadores **Cisco Catalyst 2960-X / 9200L** distribuidos en racks por zona operativa:
     - `ASW-DC-01`: Switch de Acceso exclusivo para la Granja de Servidores (VLAN 10 DB Cluster y VLAN 20 DMZ).
     - `ASW-CEDIS-01`: Switch de Acceso para terminales WMS, lectores de código de barras y gateways IoT de cadena de frío (VLAN 30).
     - `ASW-CORP-01`: Switch de Acceso para personal administrativo, atención al cliente y médicos dermoconsultores (VLAN 50).
   - Aplica políticas estrictas de capa 2: **Port Security** (límite de MACs y apagado automático ante intrusiones), DHCP Snooping, Dynamic ARP Inspection (DAI) y BPDU Guard.

---

### 2. Diagrama Topológico Lógico y Físico (Mermaid)

El siguiente diagrama formaliza la topología con redundancia de enlaces, agregación LACP y segmentación perimetral:

```mermaid
graph TD
    subgraph WAN_Edge [Borde de Internet y Enlaces Redundantes]
        ISP1[Proveedor Principal ISP 1 - Fibra Simetrica 1 Gbps]
        ISP2[Proveedor Secundario ISP 2 - Fibra Simetrica 500 Mbps]
        FW_Edge1[Firewall Perimetral Cisco Firepower 2130 - Primario]
        FW_Edge2[Firewall Perimetral Cisco Firepower 2130 - Standby]
    end

    subgraph Capa_Core [Capa de Núcleo - Core Layer]
        SW_CORE1[Cisco Catalyst 9500 - CORE 01]
        SW_CORE2[Cisco Catalyst 9500 - CORE 02]
    end

    subgraph Capa_Distribucion [Capa de Distribución - Distribution Layer]
        SW_DIST1[Cisco Catalyst 9300 - DIST 01 (HSRP Activo)]
        SW_DIST2[Cisco Catalyst 9300 - DIST 02 (HSRP Standby)]
    end

    subgraph Capa_Acceso_DC [Capa de Acceso: Data Center & Servidores]
        SW_ACC_DC[Cisco Catalyst 9200 - ASW-DC-01]
        SRV_MSSQL[(Servidor Primario Microsoft SQL Server)]
        SRV_PG[(Servidor PostgreSQL SGBD Libre)]
        SRV_WEB1[Servidor Web NGINX Node 01]
        SRV_WEB2[Servidor Web NGINX Node 02]
    end

    subgraph Capa_Acceso_CEDIS [Capa de Acceso: CEDIS Monterrey / WMS]
        SW_ACC_WMS[Cisco Catalyst 2960X - ASW-WMS-01]
        IOT_GATEWAY[Gateway Industrial IoT Cadena de Frío]
        PDA_WMS[Terminales Láser Móviles Zebra WMS]
        AP_WIFI_CEDIS[Punto de Acceso Cisco Catalyst 9115AX]
    end

    subgraph Capa_Acceso_Admin [Capa de Acceso: Corporativo & SOC/NOC]
        SW_ACC_CORP[Cisco Catalyst 2960X - ASW-CORP-01]
        PC_ADMIN[Estación Administrador TI / Bastión]
        PC_DERMA[Estación Médico Dermoconsultor]
        CAM_CCTV[Cámaras IP Vigilancia SITE / CEDIS]
    end

    %% Enlaces WAN
    ISP1 --> FW_Edge1
    ISP2 --> FW_Edge2
    FW_Edge1 <-->|Heartbeat Sync| FW_Edge2
    FW_Edge1 --> SW_CORE1
    FW_Edge2 --> SW_CORE2

    %% Enlaces Core Redundantes (Enlaces de 40 Gbps)
    SW_CORE1 <==>|LACP EtherChannel 2x40G| SW_CORE2
    SW_CORE1 --> SW_DIST1
    SW_CORE1 --> SW_DIST2
    SW_CORE2 --> SW_DIST1
    SW_CORE2 --> SW_DIST2

    %% Enlaces Distribución (Trunks 802.1Q 10 Gbps)
    SW_DIST1 <==>|LACP EtherChannel HSRP| SW_DIST2
    SW_DIST1 --> SW_ACC_DC
    SW_DIST1 --> SW_ACC_WMS
    SW_DIST1 --> SW_ACC_CORP
    SW_DIST2 --> SW_ACC_DC
    SW_DIST2 --> SW_ACC_WMS
    SW_DIST2 --> SW_ACC_CORP

    %% Conexiones Capa Acceso -> Hosts
    SW_ACC_DC -->|VLAN 10 - Trunk/Access| SRV_MSSQL
    SW_ACC_DC -->|VLAN 10 - Access| SRV_PG
    SW_ACC_DC -->|VLAN 20 - Access| SRV_WEB1
    SW_ACC_DC -->|VLAN 20 - Access| SRV_WEB2

    SW_ACC_WMS -->|VLAN 30 - Access| IOT_GATEWAY
    SW_ACC_WMS -->|VLAN 30 - Trunk| AP_WIFI_CEDIS
    AP_WIFI_CEDIS -.->|Wi-Fi 6 WPA3| PDA_WMS

    SW_ACC_CORP -->|VLAN 40 - Port Security| PC_ADMIN
    SW_ACC_CORP -->|VLAN 50 - Port Security| PC_DERMA
    SW_ACC_CORP -->|VLAN 60 - Access PoE| CAM_CCTV
```

---

### 3. Mecanismos de Redundancia y Protocolos de Alta Disponibilidad

1. **Protocolo de Enrutamiento Dinámico OSPFv2 (Open Shortest Path First):**
   - Configurado en el backbone (Área 0) entre los firewalls de borde, Core Switches y Switches de Distribución.
   - Convergencia submétrica en menos de 200 milisegundos ante caída de enlaces primarios.
2. **HSRP (Hot Standby Router Protocol - Cisco RFC 2281):**
   - Implementado en las Interfaces Virtuales de Conmutador (SVIs) de los switches `DIST-01` (Prioridad 110, Activo con `preempt`) y `DIST-02` (Prioridad 100, Standby).
   - Proporciona una dirección IP virtual (VIP) como Default Gateway para cada VLAN, asegurando que las estaciones nunca pierdan salida aunque falle un conmutador de distribución.
3. **Agregación de Enlaces LACP (Link Aggregation Control Protocol - IEEE 802.3ad):**
   - Configuración de Port Channels de 2x10G entre switches de acceso y distribución, y 2x40G entre cores.
   - Distribución de carga por hashing de IP origen-destino (`port-channel load-balance src-dst-ip`), previniendo cuellos de botella en horas pico de facturación o telemetría.
4. **Rapid Spanning Tree Protocol (PVRST+ / IEEE 802.1w):**
   - Evita la formación de bucles de Capa 2 manteniendo tiempos de reconvergencia inferiores a 2 segundos mediante transiciones directas a estado de reenvío (*Forwarding*).
   - Protección perimetral con `spanning-tree bpduguard enable` en todos los puertos de acceso de usuarios para desconectar instantáneamente cualquier switch no autorizado que sea conectado por un usuario.
