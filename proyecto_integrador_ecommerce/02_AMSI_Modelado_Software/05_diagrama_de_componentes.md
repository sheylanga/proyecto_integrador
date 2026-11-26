# MODELO DE IMPLEMENTACIÓN: DIAGRAMA DE COMPONENTES (UML 2.5)
## PROYECTO INTEGRADOR V — TECNM / INSTITUTO TECNOLÓGICO SUPERIOR DE MONCLOVA
### ASIGNATURA: ANÁLISIS Y MODELADO DE SISTEMAS DE INFORMACIÓN (AMSI — IFE-1005) — CRITERIO 1.4 (30%)
**Sistema:** DERMA-ECOM (E-Commerce de Salud Cutánea, Belleza y Maquillaje con Trazabilidad FEFO y Cadena de Frío)  
**Autores y Distribución Equitativa:**
- **Submódulo 1 (Componentes IAM/Criptografía, Diagnóstico Cutáneo, Catálogo INCI):** José Luis Luna García
- **Submódulo 2 (Componentes Checkout/Split, Pagos PCI-DSS, Antifraude, CFDI 4.0, Promos):** Sheyla Estefanía Moncada Guel
- **Submódulo 3 (Componentes Compras/QA, WMS FEFO, Telemetría IoT, Envíos, RMA, Auditoría Forense y Hot-Swap):** Eduardo Salazar Martínez

> [!IMPORTANT]
> **Diagrama de Componentes UML 2.5 Visual Editable (`<<component>>`, `<<interface>>`, `<<database>>`):**
> - Editable `.drawio`: [`05a_diagrama_componentes_UML.drawio`](./05a_diagrama_componentes_UML.drawio)
> - Visor Interactivo HTML/SVG (con zoom, paneo y exportación SVG): [`05b_visor_interactivo_componentes_UML.html`](./05b_visor_interactivo_componentes_UML.html)

---

## 1. DIAGRAMA DE COMPONENTES DE SOFTWARE (ARQUITECTURA POR CAPAS)

El sistema **DERMA-ECOM** se estructura en **5 capas desacopladas** mediante interfaces formales (`ICryptoHashingService`, `IPaymentGateway`, `ITaxStampingPAC`, `IFefoAllocationService`, `IDataRepositoryMultiSGBD`), garantizando interoperabilidad **Hot-Swap** entre **Microsoft SQL Server 2022** y **PostgreSQL 17** sobre las **150 tablas** normalizadas (`PK = ID`, `FK = ID_*`).

```mermaid
flowchart TD
    subgraph Capa_Cliente["1. Capa de Presentación (Clientes)"]
        SPA["<<component>>\nWeb SPA Storefront\n(React / Next.js)"]
        PWA["<<component>>\nPortal Clínico, Fiscal y ARCO\n(Web PWA)"]
        PDA["<<component>>\nTerminal Móvil WMS / QA\n(Android / Flutter)"]
    end

    subgraph Capa_Perimetro["2. Capa Perimetral y Seguridad"]
        WAF["<<component>>\nWAF & Reverse Proxy\n(TLS 1.3 / OWASP)"]
        APIGW["<<component>>\nAPI Gateway\n(NGINX / Kong · Rate Limit)"]
        AUTH_MOD["<<component>>\nCrypto & Auth Service\n(PBKDF2/bcrypt · TOTP · JWT · HMAC)"]
    end

    subgraph Capa_Dominio["3. Capa de Lógica de Negocio (Microservicios por Submódulo)"]
        subgraph SM1_C["Submódulo 1 — José Luis Luna García"]
            MS_IAM["<<component>>\nIAM & RBAC Service"]
            MS_DERMO["<<component>>\nDiagnóstico Cutáneo & ARCO"]
            MS_CAT["<<component>>\nCatálogo INCI & COFEPRIS"]
        end
        subgraph SM2_C["Submódulo 2 — Sheyla Estefanía Moncada Guel"]
            MS_ORD["<<component>>\nCheckout, Split & Promos"]
            MS_PAY["<<component>>\nPagos PCI-DSS & Antifraude"]
            MS_TAX["<<component>>\nFacturación CFDI 4.0 SAT"]
        end
        subgraph SM3_C["Submódulo 3 — Eduardo Salazar Martínez"]
            MS_WMS["<<component>>\nCompras, QA & WMS FEFO"]
            MS_IOT["<<component>>\nIngesta Telemetría IoT 2-8 C"]
            MS_RMA["<<component>>\nEnvíos, RMA & Auditoría Forense"]
        end
    end

    subgraph Capa_Integracion["4. Capa de Integración y Mensajería"]
        REDIS["<<component>>\nRedis Cluster\n(Sesiones / Rate-Limit / Reservas)"]
        BROKER["<<component>>\nRabbitMQ / Kafka\n(Eventos Split, CFDI, IoT, COFEPRIS)"]
    end

    subgraph Capa_Persistencia["5. Capa de Persistencia Multi-SGBD (Hot-Swap)"]
        HOTSWAP["<<component>>\nHot-Swap DB Abstraction Layer\n(SQL Server <-> PostgreSQL)"]
        DB_SS[("<<database>>\nSQL Server 2022\nEcommerceSaludBellezaDB\n(150 Tablas · 183 FKs)")]
        DB_PG[("<<database>>\nPostgreSQL 17\nEcommerceSaludBellezaDB\n(150 Tablas · 183 FKs)")]
        OBJ[("<<storage>>\nObject Storage S3/MinIO\n(XML/PDF CFDI, COA, Fotos RMA)")]
    end

    SPA --> WAF
    PWA --> WAF
    PDA --> WAF
    WAF --> APIGW
    APIGW --> AUTH_MOD
    APIGW --> MS_IAM
    APIGW --> MS_DERMO
    APIGW --> MS_CAT
    APIGW --> MS_ORD
    APIGW --> MS_PAY
    APIGW --> MS_TAX
    APIGW --> MS_WMS
    APIGW --> MS_RMA

    MS_IAM --> REDIS
    MS_ORD --> REDIS
    MS_ORD --> BROKER
    MS_PAY --> BROKER
    MS_WMS --> BROKER
    MS_IOT --> BROKER
    MS_RMA --> BROKER

    MS_IAM --> HOTSWAP
    MS_DERMO --> HOTSWAP
    MS_CAT --> HOTSWAP
    MS_ORD --> HOTSWAP
    MS_PAY --> HOTSWAP
    MS_TAX --> HOTSWAP
    MS_WMS --> HOTSWAP
    MS_IOT --> HOTSWAP
    MS_RMA --> HOTSWAP

    HOTSWAP -->|"Activo (TCP 1433)"| DB_SS
    HOTSWAP -.->|"Failover Hot-Swap (TCP 5432)"| DB_PG
    MS_TAX --> OBJ
    MS_WMS --> OBJ
    MS_RMA --> OBJ
```

---

## 2. ESPECIFICACIÓN TÉCNICA DE COMPONENTES E INTERFACES

| Componente | Submódulo / Autor | Tecnología | Interfaz / Contrato | Esquemas BD Asociados |
| :--- | :--- | :--- | :--- | :--- |
| **API Gateway & WAF** | Transversal | NGINX / Kong + TLS 1.3 | `REST/HTTPS :443` | `seguridad.sesiones_activas` |
| **Crypto & Auth Service** | SM1 · José Luis Luna García | .NET 8 / Node.js + TOTP | `ICryptoHashingService` | `seguridad.*` (10 tablas) |
| **Diagnóstico & ARCO Service** | SM1 · José Luis Luna García | Python FastAPI | `IDermoDiagnosisService` | `clientes.*` (15 tablas) |
| **Catálogo INCI & COFEPRIS** | SM1 · José Luis Luna García | .NET 8 / REST | `ICatalogoSanitarioService` | `catalogo.*`, `comunidad.*` (25 tablas) |
| **Checkout, Split & Promos** | SM2 · Sheyla E. Moncada Guel | Go / .NET 8 | `ICheckoutSplitService` | `ventas.*`, `promos.*` (29 tablas) |
| **Pagos PCI-DSS & Antifraude** | SM2 · Sheyla E. Moncada Guel | .NET 8 + Stripe/MP SDK | `IPaymentGateway` | `pagos.*` (13 tablas) |
| **Facturación CFDI 4.0 SAT** | SM2 · Sheyla E. Moncada Guel | .NET 8 + OpenSSL CSD | `ITaxStampingPAC` | `fiscal.*` (8 tablas) |
| **Compras, QA & WMS FEFO** | SM3 · Eduardo Salazar Martínez | .NET 8 / Go | `IFefoAllocationService` | `compras.*`, `wms.*` (26 tablas) |
| **Ingesta Telemetría IoT** | SM3 · Eduardo Salazar Martínez | Rust / MQTT Broker | `IIoTTelemetryIngest` | `wms.monitoreo_temperatura_humedad` |
| **Envíos, RMA & Forense** | SM3 · Eduardo Salazar Martínez | .NET 8 + Webhooks | `IForensicAuditService` | `envios.*`, `postventa.*`, `auditoria.*`, `sistema.*` (24 tablas) |
| **Hot-Swap DB Abstraction** | Transversal (FBD + AMSI) | Repository + `hotswap_db_manager` | `IDataRepositoryMultiSGBD` | 150 tablas en SQL Server 2022 y PostgreSQL 17 |
