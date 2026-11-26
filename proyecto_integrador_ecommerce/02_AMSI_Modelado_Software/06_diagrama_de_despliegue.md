# MODELO DE IMPLEMENTACIÓN: DIAGRAMA DE DESPLIEGUE FÍSICO Y RED (UML 2.5)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI — IFE-1005) — CRITERIO 1.4 (30%)
**Sistema:** DERMA-ECOM (E-Commerce de Salud Cutánea, Belleza y Maquillaje con Trazabilidad FEFO y Cadena de Frío)  
**Autores:** José Luis Luna García (SM1) · Sheyla Estefanía Moncada Guel (SM2) · Eduardo Salazar Martínez (SM3)

> [!IMPORTANT]
> **Diagrama de Despliegue UML 2.5 Visual Editable (`<<device>>`, `<<executionEnvironment>>`, `<<external>>`, alineado al plan VLSM `10.40.0.0/16`):**
> - Editable `.drawio`: [`06a_diagrama_despliegue_UML.drawio`](./06a_diagrama_despliegue_UML.drawio)
> - Visor Interactivo HTML/SVG (con zoom, paneo y exportación SVG): [`06b_visor_interactivo_despliegue_UML.html`](./06b_visor_interactivo_despliegue_UML.html)

---

## 1. DIAGRAMA DE DESPLIEGUE FÍSICO Y TOPOLOGÍA REAL DE RED (VLSM `10.40.0.0/16`)

El modelo de despliegue está **100% sincronizado** con el plan de direccionamiento **VLSM** y la arquitectura jerárquica de 3 capas de **Redes de Computadoras (RC — IFD-1020)** (`03_RC_Redes_Telecomunicaciones/02_esquema_direccionamiento_vlsm.md`), respetando exactamente cada VLAN, subred CIDR, nodo servidor y política de aislamiento perimetral.

```mermaid
flowchart TD
    subgraph WAN["Red Pública WAN / Servicios Externos"]
        CLI_EXT(["Clientes Web / Móvil\nHTTPS :443 TLS 1.3"])
        PAS_EXT["<<external>>\nPasarela PCI-DSS\n(Stripe / Mercado Pago)"]
        SAT_EXT["<<external>>\nPAC Autorizado SAT\n(CFDI 4.0)"]
        LOG_EXT["<<external>>\nAPI Paqueterías\n(DHL / FedEx / Estafeta)"]
        COF_EXT["<<external>>\nPortal COFEPRIS\n(Farmacovigilancia)"]
    end

    subgraph EDGE["Perímetro y Núcleo Jerárquico (10.40.5.128/30 · 10.40.5.132/30)"]
        FW_EDGE["<<device>>\nFirewall Perimetral / Router Borde\n(Cisco ISR 4331 · ACL + VPN IPsec)"]
        CORE["<<device>>\nCapa Núcleo & Distribución L3\n(Core-01/02 + Dist-01/02 · HSRP)"]
    end

    subgraph VLAN20["VLAN 20 — DMZ Web y Aplicaciones (10.40.4.0/25 · GW 10.40.4.1)"]
        LB_WAF["<<executionEnvironment>>\nNGINX / WAF Ingress\n(10.40.4.10 · TLS 1.3)"]
        APP_N1["<<executionEnvironment>>\nApp Server / Docker Node 01\n(SM1 + SM2 Microservicios · 10.40.4.20)"]
        APP_N2["<<executionEnvironment>>\nApp Server / Docker Node 02\n(SM3 + Redis + RabbitMQ · 10.40.4.21)"]
    end

    subgraph VLAN10["VLAN 10 — Granja Base de Datos Multi-SGBD Aislada (10.40.5.0/26 · GW 10.40.5.1)"]
        DB_S1[("<<device>>\nServidor SQL Server 2022\nPrimario OLTP\n(10.40.5.10 :1433)")]
        DB_S2[("<<device>>\nServidor PostgreSQL 17\nHot-Swap / SGBD Libre\n(10.40.5.11 :5432)")]
        SAN[("<<device>>\nAlmacenamiento SAN RAID 10\n+ Object Storage S3/MinIO\n(10.40.5.20)")]
    end

    subgraph VLAN30["VLAN 30 — CEDIS WMS, Andén e IoT Cadena de Frío (10.40.2.0/24 · GW 10.40.2.1)"]
        SW_WMS["<<device>>\nSwitch Acceso Catalyst 2960\n(Port Security Sticky MAC)"]
        IOT_GW["<<device>>\nGateway Industrial IoT\n(MQTT/TLS · Cámara Fría 2-8 °C)"]
        PDA_DEV(["Terminales PDA Zebra\nLectura Códigos FEFO"])
        SENS_IOT(["Sensores BLE 5.0\nTemp / Humedad"])
    end

    subgraph VLAN40["VLAN 40 — Administración TI, SOC/NOC (10.40.5.64/27) & VLAN 99 Mgmt (10.40.5.96/27)"]
        BASTION["<<device>>\nHost Bastión SSH / VPN\n(10.40.5.70)"]
        SIEM["<<device>>\nServidor SIEM / Syslog\n(Wazuh · 10.40.5.71)"]
    end

    subgraph VLAN50_60["VLAN 50 Corporativo / Dermoconsultores (10.40.0.0/23) & VLAN 60 CCTV (10.40.4.128/25)"]
        CORP_PC(["Estaciones Dermoconsultores,\nFacturación y QA"])
        CCTV(["Cámaras CCTV y Control\nBiométrico SITE/CEDIS"])
    end

    CLI_EXT -->|"HTTPS :443"| FW_EDGE
    FW_EDGE --> CORE
    CORE --> LB_WAF
    LB_WAF --> APP_N1
    LB_WAF --> APP_N2

    APP_N1 -->|"ACL Permit TDS :1433 / PG :5432"| DB_S1
    APP_N2 -->|"ACL Permit TDS :1433 / PG :5432"| DB_S1
    APP_N1 -.->|"Hot-Swap Failover :5432"| DB_S2
    APP_N2 -.->|"Hot-Swap Failover :5432"| DB_S2
    DB_S1 --- SAN
    DB_S2 --- SAN

    APP_N1 -->|"HTTPS REST"| PAS_EXT
    APP_N1 -->|"HTTPS SOAP"| SAT_EXT
    APP_N2 -->|"HTTPS Webhooks"| LOG_EXT
    APP_N2 -->|"HTTPS"| COF_EXT

    CORE --> SW_WMS
    SW_WMS --> IOT_GW
    SW_WMS --> PDA_DEV
    IOT_GW -.->|"BLE 2.4 GHz"| SENS_IOT
    IOT_GW -->|"MQTT/TLS :8883"| APP_N2

    CORE --> BASTION
    CORE --> SIEM
    CORE --> CORP_PC
    CORE --> CCTV
    SIEM -.->|"Syslog TLS :6514"| DB_S1
    SIEM -.->|"Syslog TLS :6514"| APP_N1
```

---

## 2. MATRIZ DE AISLAMIENTO DE RED, SUBREDES VLSM Y PUERTOS DE DESPLIEGUE

| Segmento / VLAN | Subred VLSM (RC) | Nodo Origen → Destino | Protocolo / Puerto | Política de Seguridad (ACL / Cifrado) |
| :--- | :---: | :--- | :---: | :--- |
| **WAN → VLAN 20 (DMZ)** | `10.40.4.0/25` | Clientes → NGINX / WAF | `TCP 443 (HTTPS)` | TLS 1.3 obligatorio; bloqueo DDoS y OWASP Top 10. |
| **VLAN 20 → VLAN 10 (BD)** | `10.40.5.0/26` | App Nodes → SQL Server 2022 | `TCP 1433 (TDS)` | Permitido únicamente desde VLAN 20 vía ACL estricta; cifrado obligatorio. |
| **VLAN 20 → VLAN 10 (BD)** | `10.40.5.0/26` | App Nodes → PostgreSQL 17 | `TCP 5432 (SSL)` | Failover automático *Hot-Swap* (`hotswap_db_manager.ps1`). |
| **VLAN 30 → VLAN 20 (DMZ)** | `10.40.2.0/24` | Gateway IoT / PDA → App Node 02 | `TCP 8883 / 443` | MQTT/TLS y HTTPS con Port Security Sticky MAC en acceso L2. |
| **VLAN 50 → VLAN 20 (DMZ)** | `10.40.0.0/23` | Dermoconsultores / QA → Portal | `TCP 443 (HTTPS)` | Autenticación RBAC + MFA TOTP; sin acceso directo a VLAN 10 (BD). |
| **VLAN 40 → VLAN 10 / 20 / 99** | `10.40.5.64/27` | Bastión SOC/NOC → Servidores | `TCP 22 (SSH) / 6514` | Administración exclusiva por Host Bastión y recolección Syslog SIEM. |
| **VLAN 60 (CCTV / Biométrico)** | `10.40.4.128/25` | Cámaras / Accesos → NVR SITE | `TCP 554 / 443` | Red física dedicada para videovigilancia y control de acceso al SITE. |
| **VLAN 70 (Invitados)** | `10.40.3.0/24` | Proveedores Wi-Fi → Internet | `TCP 80 / 443` | Aislamiento total: `DENY` hacia todas las subredes `10.40.0.0/16`. |
