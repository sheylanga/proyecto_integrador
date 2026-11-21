# CAPÍTULO II: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI - IFE-1005)
## Entregable 2.5: Modelos de Implementación y Arquitectura (Componentes y Despliegue Físico/Lógico)

---

### 1. Modelo y Diagrama de Componentes de Software

El sistema integral de comercio electrónico de cosmecéutica y dermatología se estructura bajo un patrón arquitectónico de **Microservicios Modulares desacoplados por Dominio (Domain-Driven Design)**, orquestados mediante un API Gateway centralizado y comunicados asincrónicamente mediante un Message Broker distribuido.

```mermaid
graph TD
    subgraph Capa_Cliente [Capa de Presentación y Clientes]
        SPA[Web SPA Storefront Next.js / React]
        PWA[Portal Médico y Suscriptor PWA]
        PDA[Terminal Móvil WMS Flutter / Android]
    end

    subgraph Capa_Perimetro [Capa Perimetral y Enrutamiento]
        WAF[WAF / Cloudflare DDoS & SSL Offloading]
        APIGW[API Gateway Ingress NGINX / Kong]
        OAuth[Módulo Autenticación JWT / OAuth2 / TOTP]
    end

    subgraph Capa_Microservicios [Capa de Lógica de Negocio y Microservicios]
        MS_Auth[Microservicio de Identidad y Seguridad]
        MS_Diag[Microservicio de Diagnóstico Clínico Cutáneo]
        MS_Cat[Microservicio de Catálogo y Fórmulas COFEPRIS]
        MS_Orders[Microservicio Comercial y Checkout Multi-CEDIS]
        MS_Sub[Microservicio de Suscripciones Beauty-Box]
        MS_Tax[Microservicio de Facturación CFDI 4.0 SAT]
        MS_WMS[Microservicio Logístico y Trazabilidad FEFO]
        MS_IoT[Microservicio Ingesta Telemetría Cadena de Frío]
    end

    subgraph Capa_Integracion [Capa de Integración y Mensajería Asincrónica]
        Broker[Message Broker RabbitMQ / Apache Kafka]
        Redis[Cache Distribuida Redis Cluster]
    end

    subgraph Capa_Datos [Capa de Persistencia y Multi-SGBD]
        DAO_MSSQL[Adaptador de Persistencia SQL Server Provider]
        DAO_PG[Adaptador de Persistencia PostgreSQL Provider]
        DB_MSSQL[(Base de Datos Primaria Microsoft SQL Server)]
        DB_PG[(Base de Datos Secundaria PostgreSQL SGBD Libre)]
        BlobStorage[(Almacén de Objetos S3 / MinIO - Docs y Fotos)]
    end

    %% Conexiones
    SPA --> WAF
    PWA --> WAF
    PDA --> WAF
    WAF --> APIGW
    APIGW --> OAuth
    APIGW --> MS_Auth
    APIGW --> MS_Diag
    APIGW --> MS_Cat
    APIGW --> MS_Orders
    APIGW --> MS_Sub
    APIGW --> MS_Tax
    APIGW --> MS_WMS

    MS_Orders --> Broker
    MS_Sub --> Broker
    MS_WMS --> Broker
    MS_IoT --> Broker
    Broker --> MS_WMS
    Broker --> MS_Orders

    MS_Auth --> Redis
    MS_Cat --> Redis

    MS_Auth --> DAO_MSSQL
    MS_Diag --> DAO_MSSQL
    MS_Orders --> DAO_MSSQL
    MS_WMS --> DAO_MSSQL

    MS_Auth -.-> DAO_PG
    MS_Orders -.-> DAO_PG
    MS_WMS -.-> DAO_PG

    DAO_MSSQL --> DB_MSSQL
    DAO_PG --> DB_PG

    MS_Tax --> BlobStorage
    MS_Diag --> BlobStorage
```

---

### 2. Especificación Técnica de Componentes

| Componente | Tecnología | Responsabilidad Primaria |
| :--- | :--- | :--- |
| **API Gateway & Ingress** | NGINX / Kong Enterprise | Balanceo de carga L7, terminación TLS 1.3, rate limiting y enrutamiento reverso hacia microservicios. |
| **Security & Auth Module** | Node.js / NestJS + Passport | Validación de firmas JWT RS256, autenticación MFA RFC 6238, y hashing Argon2id. |
| **Dermatology Engine** | Python / FastAPI + Scikit-Learn | Análisis de respuestas del test cutáneo, cálculo de fototipo Fitzpatrick y reglas clínicas COFEPRIS. |
| **Split Multi-CEDIS Engine** | Go (Golang) / High-Concurrency | Algoritmo determinístico de enrutamiento y partición de órdenes de compra según proximidad geográfica y stock FEFO. |
| **SAT Tax Invoicing Adapter** | C# .NET 8 / WCF SOAP Client | Consumo de WebServices de PAC autorizado, sellado digital SHA256 con llave CSD y generación de timbre fiscal. |
| **IoT Telemetry Ingest** | Rust / MQTT Broker | Ingesta masiva y procesamiento de bajo consumo de sensores térmicos Bluetooth/Zigbee en andenes y transportes. |
| **Multi-SGBD Abstraction** | TypeORM / Dapper Repository | Capa de abstracción que implementa el soporte dual: Microsoft SQL Server (producción corporativa) y PostgreSQL (entorno libre de contingencia). |

---

### 3. Diagrama de Despliegue Físico y de Infraestructura de Red

El despliegue de infraestructura garantiza alta disponibilidad ($99.9\%$), redundancia geográfica entre el Centro de Datos Principal y los Centros de Distribución (CEDIS Monterrey y CEDIS CDMX), y aislamiento perimetral estricto de acuerdo con el modelo jerárquico de redes.

```mermaid
graph TD
    subgraph Zona_Internet [Zona Pública / Red WAN]
        InternetUser((Clientes en Internet))
        AppUser((App Móvil WMS en Ruta))
        PAC_SAT[PAC Autorizado SAT WS]
        Openpay[Pasarela Bancaria Openpay / Stripe]
    end

    subgraph Nube_Hibrida [Infraestructura Data Center Corporativo]
        subgraph DMZ_Perimetro [Zona Desmilitarizada - VLAN 20]
            LB1[Balanceador F5 / NGINX Primario]
            LB2[Balanceador F5 / NGINX Secundario - VRRP]
            WAF_App[Reverse Proxy & WAF Ingress]
        end

        subgraph Cluster_Aplicaciones [Zona de Cómputo Kubernetes - VLAN 30]
            K8s_Node1[Worker Node 01 - Docker Pods Microservicios]
            K8s_Node2[Worker Node 02 - Docker Pods Microservicios]
            K8s_Node3[Worker Node 03 - Docker Pods Microservicios]
            Redis_Cluster[(Redis Cluster In-Memory)]
            Rabbit_Cluster[(Cluster RabbitMQ Mensajería)]
        end

        subgraph Zona_Datos_Segura [Zona de Base de Datos - VLAN 10 Isolada]
            FW_Internal[Firewall Interno de Capa 7 / SPI]
            SQL_Primary[(Servidor Primario Microsoft SQL Server AlwaysOn)]
            SQL_Secondary[(Servidor Secundario SQL Server - Solo Lectura)]
            PG_Standby[(Servidor Standby PostgreSQL Streaming Replication)]
            Storage_SAN[(Almacenamiento SAN Fibre Channel RAID 10)]
        end

        subgraph Gestion_SOC_NOC [Zona de Administración TI - VLAN 40]
            Bastion[Host Bastión SSH / VPN IPsec]
            SIEM[Servidor SIEM / Syslog Centralizado Wazuh]
        end
    end

    subgraph Edge_CEDIS_Monterrey [CEDIS Monterrey - Logística y Cadena Frío]
        Router_CEDIS[Router Cisco ISR 4331 Edge]
        Switch_L3_CEDIS[Switch Distribución Cisco Catalyst 3850]
        Switch_Acceso_L2[Switch Acceso Cisco Catalyst 2960 - Port Security]
        IoT_Gateway[Gateway Industrial IoT Cadena de Frío]
        Sensores_Frio((Sensores Inalámbricos BLE Frigorífico 2°C - 8°C))
        Term_WMS((Lectores Láser Handheld Zebra Android))
    end

    %% Flujos de Red
    InternetUser -->|HTTPS :443| LB1
    AppUser -->|HTTPS :443| LB1
    LB1 <--> LB2
    LB1 --> WAF_App
    WAF_App --> K8s_Node1
    WAF_App --> K8s_Node2
    WAF_App --> K8s_Node3

    K8s_Node1 <--> Redis_Cluster
    K8s_Node2 <--> Rabbit_Cluster

    K8s_Node1 -->|TDS :1433 / TCP :5432| FW_Internal
    K8s_Node2 -->|TDS :1433 / TCP :5432| FW_Internal
    K8s_Node3 -->|TDS :1433 / TCP :5432| FW_Internal
    FW_Internal --> SQL_Primary
    SQL_Primary -.->|AlwaysOn Sync| SQL_Secondary
    SQL_Primary -.->|ETL CDC Sync| PG_Standby
    SQL_Primary --- Storage_SAN

    K8s_Node1 -->|SOAP HTTPS| PAC_SAT
    K8s_Node2 -->|REST HTTPS| Openpay

    %% Conectividad WAN / VPN hacia CEDIS
    FW_Internal <==>|Túnel VPN IPsec Cifrado AES-256| Router_CEDIS
    Router_CEDIS --> Switch_L3_CEDIS
    Switch_L3_CEDIS --> Switch_Acceso_L2
    Switch_Acceso_L2 --> IoT_Gateway
    Switch_Acceso_L2 --> Term_WMS
    IoT_Gateway -.->|Bluetooth 5.0 LE| Sensores_Frio

    %% Gestión
    Bastion --> FW_Internal
    Bastion --> Switch_L3_CEDIS
    SIEM <.- SQL_Primary
    SIEM <.- K8s_Node1
```

---

### 4. Matriz de Aislamiento de Red y Puertos de Despliegue

| Nodo Origen | Nodo Destino | Protocolo / Puerto | Propósito Técnico de Seguridad |
| :--- | :--- | :---: | :--- |
| Clientes Externos | DMZ (Balanceador NGINX) | `TCP 443 (HTTPS)` | Cifrado TLS 1.3 con certificados RSA 4096-bit o ECDSA P-384. |
| DMZ (Balanceador) | Pods Microservicios | `TCP 8080 / 8443` | Tráfico HTTP/2 balanceado internamente mediante Service Mesh. |
| Pods Microservicios | Redis Cluster | `TCP 6379` | Cache de sesiones, rate-limiting de IPs y tokens de refresco. |
| Pods Microservicios | RabbitMQ Broker | `TCP 5672 / 15672` | Colas de eventos de compras, splits y solicitudes de timbrado. |
| Pods Microservicios | SQL Server Cluster | `TCP 1433 (TDS)` | Consultas OLTP seguras con autenticación cifrada obligatoria. |
| Pods Microservicios | PostgreSQL Cluster | `TCP 5432` | Persistencia en SGBD libre para réplicas analíticas y contingencia. |
| Terminales WMS CEDIS | API Ingress | `TCP 443 (HTTPS)` | Sincronización de recepciones, empaquetado y lectura de códigos FEFO. |
| Sensores IoT Frigorífico | Gateway Edge CEDIS | `Bluetooth LE 2.4 GHz` | Telemetría continua de temperatura ($2^{\circ}\text{C}$ a $8^{\circ}\text{C}$) y humedad relativa. |
| Gateway Edge CEDIS | Router Corporativo | `IPsec ESP / UDP 500/4500`| Túnel VPN punto a punto con cifrado AES-GCM-256 entre sucursales. |
