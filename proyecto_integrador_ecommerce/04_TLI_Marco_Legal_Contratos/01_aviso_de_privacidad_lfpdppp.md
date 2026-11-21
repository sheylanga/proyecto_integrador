# CAPÍTULO VI: GESTIÓN NORMATIVA, JURÍDICA Y CONTRACTUAL (TLI — IFR-1024)
## Entregables 6.1 y 6.2: Régimen de Protección de Datos Personales, Aviso de Privacidad Integral y Dictamen Técnico-Jurídico del Art. 16 Constitucional
**Autores (Equipo de 3 Integrantes — ITSM / TecNM):** José Luis Luna García · Sheyla Estefanía Moncada Guel · Eduardo Salazar Martínez

---

## 6.1 TRATAMIENTO DE DATOS PERSONALES, INVENTARIO Y AVISO DE PRIVACIDAD INTEGRAL

### 1. Fundamentación Constitucional y Legal (LFPDPPP)

El tratamiento de datos personales dentro del esquema relacional de **150 tablas normalizadas** del sistema **DERMA-ECOM** se rige estrictamente por:
- **Constitución Política de los Estados Unidos Mexicanos (CPEUM):** Artículo 16, párrafo segundo (derecho humano a la protección de datos personales y derechos ARCO).
- **Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP):** Artículos 3 (fracciones V y VI), 6 (principios rectores), 8, 9 (consentimiento expreso y por escrito para datos sensibles), 15, 16 (Aviso de Privacidad), 19 (medidas de seguridad administrativas, técnicas y físicas), 25 (bloqueo y cancelación) y 28–35 (procedimiento ARCO).
- **Reglamento de la LFPDPPP** y **Lineamientos del Aviso de Privacidad** (DOF).
- **Normatividad Sectorial Concurrente:** Código Fiscal de la Federación (Arts. 29, 29-A y 30 — conservación fiscal por 5 años), Ley General de Salud (Arts. 269–270) y NOM-141-SSA1/SCFI-2012 / NOM-220-SSA1-2016 (etiquetado cosmético y farmacovigilancia ante COFEPRIS).

---

### 2. Inventario Exhaustivo de Datos Personales y Sensibles en la Base de Datos (150 Tablas)

En estricto cumplimiento del **Criterio 4.1 (25%)** y la **Sección 4.4.1** de *Proyecto Integrador V*, cada tabla y campo que recolecta datos personales o sensibles se encuentra **marcado explícitamente en el Diccionario de Datos** (`01_FBD_Base_de_Datos/05_Diccionario_de_Datos/00_DICCIONARIO_DE_DATOS_150_TABLAS.md`, 150 fichas y 2,020 campos clasificados). A continuación se presenta la vinculación directa con las tablas y columnas reales del DDL:

| Categoría LFPDPPP (Art. 3) | Tablas Reales en el DDL (150 Tablas) | Columnas Específicas Recabadas | Riesgo y Régimen de Consentimiento |
| :--- | :--- | :--- | :--- |
| **Datos Personales de Identificación y Contacto** | `seguridad.usuarios`, `clientes.clientes`, `clientes.direcciones`, `clientes.preferencias_comunicacion`, `compras.contactos_proveedor`, `postventa.tickets_soporte`, `postventa.tickets_mensajes`, `sistema.notificaciones_push_email` | `email`, `telefono_movil`, `nombres`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `genero`, `curp`, `rfc`, `telefono_fijo`, `calle_numero`, `colonia`, `codigo_postal`, `ciudad` | **Riesgo Medio.** Consentimiento tácito/expreso al registrarse (`clientes.acepta_terminos = 1`). |
| **Datos de Seguridad, Red y Sesión** | `seguridad.usuarios`, `seguridad.sesiones_activas`, `seguridad.historial_passwords`, `seguridad.intentos_login`, `seguridad.tokens_recuperacion`, `seguridad.dispositivos_confianza`, `pagos.evaluaciones_antifraude`, `auditoria.bitacora_seguridad_global` | `password_hash`, `password_salt`, `mfa_secreto`, `token_sesion_hash`, `direccion_ip`, `ip_origen`, `user_agent`, `fingerprint_dispositivo`, `firma_integridad_hash` | **Confidencial / Alto.** Protección criptográfica obligatoria (Art. 19 LFPDPPP); prohibido texto claro. |
| **Datos Patrimoniales, Financieros y Fiscales (SAT)** | `clientes.metodos_pago_tokenizados`, `ventas.ordenes`, `ventas.suscripciones_cliente`, `ventas.afiliados_influencers`, `pagos.transacciones`, `pagos.billetera_electronica`, `pagos.movimientos_billetera`, `fiscal.datos_fiscales_cliente`, `fiscal.facturas_cfdi` | Tokens PCI-DSS (sin PAN ni CVV), `clabe_interbancaria`, `saldo_disponible`, `rfc`, `razon_social`, `domicilio_fiscal`, `uuid_sat_fiscal`, `sello_digital_cfdi`, `monto_total_facturado` | **Riesgo Alto.** Requiere **consentimiento expreso** (Art. 8 LFPDPPP) y cumplimiento PCI-DSS / SAT CFDI 4.0. |
| **Datos Personales Sensibles (Salud Cutánea y Farmacovigilancia)** | `clientes.perfil_cutaneo`, `clientes.cliente_condiciones`, `clientes.evaluaciones_diagnostico`, `clientes.respuestas_evaluacion`, `postventa.solicitudes_rma`, `postventa.reportes_farmacovigilancia` | Fototipo/biotipo cutáneo, sensibilidad solar, `condicion_dermatologica`, `diagnosticada_por_medico`, `notas_paciente`, `fotografia_evidencia_url`, `sintomas_reaccion_adversa`, `requirio_atencion_hospitalaria`, `folio_cofepris_ram` | **Riesgo Crítico.** Requiere **consentimiento expreso y por escrito / firma electrónica** (Art. 9 LFPDPPP). |
| **Evidencia Legal de Privacidad y Derechos ARCO** | `clientes.consentimientos_privacidad`, `clientes.solicitudes_arco`, `auditoria.bitacora_cambios_datos` | Fecha y evidencia de aceptación *opt-in*, folio y tipo de solicitud ARCO, estado de atención, `valores_anteriores_json`, `valores_nuevos_json` | **Evidencia Legal Obligatoria.** Resguardo inmutable bajo política *Soft Delete*. |

---

### 3. AVISO DE PRIVACIDAD INTEGRAL (CONFORME A LA LFPDPPP)

#### **I. IDENTIDAD Y DOMICILIO DEL RESPONSABLE**
**DERMA-ECOM COSMECÉUTICA Y SALUD DIGITAL S.A.P.I. DE C.V.** (en lo sucesivo, **"EL RESPONSABLE"**), proyecto desarrollado en coautoría por **José Luis Luna García**, **Sheyla Estefanía Moncada Guel** y **Eduardo Salazar Martínez**, con domicilio convencional para oír y recibir notificaciones en **Av. Tecnológico #1200, Col. Tecnológico, C.P. 25700, Monclova, Coahuila de Zaragoza, México**, es responsable del uso, resguardo y protección de sus datos personales y datos personales sensibles conforme a la LFPDPPP y su Reglamento.

#### **II. DATOS PERSONALES SOMETIDOS A TRATAMIENTO**
1. **Identificación y Contacto:** Nombre completo (`nombres`, `primer_apellido`, `segundo_apellido`), correo electrónico, teléfono móvil y fijo, fecha de nacimiento, género, RFC, CURP y domicilios de entrega/facturación.
2. **Patrimoniales y Financieros:** Datos fiscales para timbrado CFDI 4.0 (RFC, razón social, régimen fiscal SAT y uso de CFDI), historial de compras, saldo de billetera electrónica y **tokens criptográficos de pago** generados por pasarelas certificadas PCI-DSS (DERMA-ECOM jamás almacena números completos de tarjeta PAN ni códigos CVV).
3. **Datos Personales Sensibles (Salud Física y Dermatológica):** Tipo de piel, sensibilidad solar, oleosidad, afecciones dermatológicas declaradas (acné, rosácea, dermatitis, melasma), resultados de cuestionarios clínicos de diagnóstico cutáneo, fotografías de evidencia en devoluciones por reacción adversa y reportes de farmacovigilancia.

#### **III. CONSENTIMIENTO EXPRESO PARA DATOS FINANCIEROS Y SENSIBLES (ARTS. 8 Y 9 LFPDPPP)**
Al tratarse de datos financieros y **datos personales sensibles relacionados con su estado de salud cutánea**, EL RESPONSABLE recabará su **consentimiento expreso y verificable** mediante casilla electrónica *opt-in* desmarcada por defecto y registro auditado en la tabla `clientes.consentimientos_privacidad` (almacenando fecha, hora, versión del aviso e IP de origen). La negativa a otorgar consentimiento sobre datos sensibles impedirá únicamente el uso del módulo de diagnóstico dermatológico personalizado, sin afectar la navegación general del catálogo.

#### **IV. FINALIDADES DEL TRATAMIENTO**
**A. Finalidades Primarias (Necesarias para la relación jurídica):**
1. Registro, autenticación segura de cuenta (hash criptográfico + MFA) y prevención de fraude transaccional.
2. Evaluación del perfil dermatológico y verificación de incompatibilidades con ingredientes INCI y alérgenos.
3. Procesamiento de órdenes de compra, cobro tokenizado, suscripciones recurrentes (*Beauty-Box*) y logística multialmacén con trazabilidad FEFO y cadena de frío.
4. Emisión y timbrado de comprobantes fiscales CFDI 4.0, complementos de pago y notas de crédito ante el SAT.
5. Gestión de devoluciones (RMA), atención a clientes y notificación de reacciones adversas (farmacovigilancia) ante COFEPRIS.

**B. Finalidades Secundarias (Opcionales — No necesarias para el servicio):**
1. Envío de boletines, cupones promocionales, campañas *Hot Sale / Ventas Flash* y recordatorios de carrito abandonado.
2. Encuestas de satisfacción y analítica estadística disociada sobre tendencias cosmecéuticas.

*Mecanismo de negativa para finalidades secundarias:* El titular puede manifestar su negativa desde el registro o en cualquier momento mediante el panel de `clientes.preferencias_comunicacion` o escribiendo a `privacidad@dermaecom.tecnm.mx` dentro de los 5 días hábiles siguientes a la aceptación del aviso.

#### **V. TRANSFERENCIAS DE DATOS PERSONALES (ART. 36 Y 37 LFPDPPP)**
| Destinatario | Finalidad de la Transferencia | Requiere Consentimiento |
| :--- | :--- | :---: |
| **Servicio de Administración Tributaria (SAT) y PAC Autorizado** | Timbrado, validación y cancelación de CFDI 4.0 (Arts. 29 y 29-A CFF). | No (Art. 37 fracc. I LFPDPPP) |
| **COFEPRIS (Secretaría de Salud)** | Notificación obligatoria de eventos adversos dermatológicos (farmacovigilancia). | No (Art. 37 fracc. I y V LFPDPPP) |
| **Pasarelas Bancarias (Stripe / MercadoPago / PayPal / SPEI)** | Procesamiento tokenizado de pagos, validación 3D-Secure y contracargos. | No (Art. 37 fracc. IV — cumplimiento de contrato) |
| **Empresas de Paquetería (DHL / FedEx / Estafeta)** | Entrega física de pedidos en domicilio o puntos *pickup* (solo nombre, domicilio y teléfono). | No (Art. 37 fracc. IV — cumplimiento de contrato) |

#### **VI. MEDIOS Y PROCEDIMIENTO PARA EJERCER DERECHOS ARCO Y REVOCACIÓN DEL CONSENTIMIENTO**
El titular podrá ejercer en todo momento sus derechos de **Acceso, Rectificación, Cancelación y Oposición (ARCO)**, así como revocar su consentimiento, registrando una solicitud en el portal (persistida en `clientes.solicitudes_arco`) o enviando correo al **Departamento de Datos Personales**: `derechos.arco@dermaecom.tecnm.mx`.
- **Requisitos (Art. 29 LFPDPPP):** Nombre del titular, correo de respuesta, identificación oficial vigente (INE/pasaporte) o carta poder en caso de representante legal, y descripción clara de los datos y derecho ARCO solicitado.
- **Plazos Legales (Art. 32 LFPDPPP):**
  - **20 días hábiles** máximos a partir de la recepción para comunicar la determinación adoptada.
  - **15 días hábiles** máximos posteriores a la notificación para hacer efectiva la resolución si resulta procedente.
- **Limitación de uso y cookies:** El usuario puede deshabilitar *cookies* analíticas desde la configuración de su navegador y revocar sesiones activas en `seguridad.sesiones_activas`.

#### **VII. POLÍTICA DE BLOQUEO, CONSERVACIÓN Y BORRADO LÓGICO (*SOFT DELETE*)**
Conforme al **Artículo 25 de la LFPDPPP**, una solicitud de Cancelación da lugar a un periodo de **bloqueo** cuando subsiste obligación legal de resguardo:
- **Información fiscal (CFDI 4.0):** Bloqueo y resguardo por **5 años** (Art. 30 del Código Fiscal de la Federación).
- **Trazabilidad sanitaria de lotes FEFO y farmacovigilancia:** Bloqueo por **10 años** (lineamientos COFEPRIS).
- **Implementación técnica:** Todas las 150 tablas prohíben el `DELETE` físico y ejecutan **borrado lógico** (`activo = 0` / `FALSE`, `fecha_baja`, `eliminado_por`), dejando traza inmutable en `auditoria.bitacora_cambios_datos`.

#### **VIII. CAMBIOS AL AVISO DE PRIVACIDAD**
Cualquier modificación derivada de reformas legales o cambios operativos será publicada en `https://dermaecom.tecnm.mx/privacidad` y notificada mediante `sistema.notificaciones_push_email`.

---

## 6.2 DICTAMEN TÉCNICO-JURÍDICO DE LA CRIPTOGRAFÍA OBLIGATORIA (ART. 16 CONSTITUCIONAL)

### 1. Análisis Constitucional y del Principio de Seguridad
El **Artículo 16, párrafo segundo de la CPEUM** eleva la protección de datos personales a rango de derecho humano fundamental, estableciendo que toda persona tiene derecho a la autodeterminación informativa y a que sus datos sean resguardados contra accesos no autorizados. Este mandato se materializa en la **LFPDPPP** mediante:
- **Artículo 6:** Consagra el *Principio de Responsabilidad* y *Confidencialidad*.
- **Artículo 19:** Obliga expresamente a todo Responsable a *"establecer y mantener medidas de seguridad administrativas, técnicas y físicas que permitan proteger los datos personales contra daño, pérdida, alteración, destrucción o el uso, acceso o tratamiento no autorizado"*.
- **Artículo 21:** Impone deber de confidencialidad permanente incluso tras finalizar la relación con el titular.

### 2. Correlación Obligatoria entre el Mandato Legal y la Implementación Criptográfica en DERMA-ECOM

Almacenar contraseñas o credenciales en texto plano constituye una **negligencia técnica grave** que viola directamente el Art. 16 Constitucional y el Art. 19 de la LFPDPPP, exponiendo a la organización a sanciones administrativas de hasta **320,000 UMAs** (Art. 64 LFPDPPP, duplicables cuando involucran datos sensibles de salud).

Para cumplir de forma verificable con el Principio de Seguridad, **DERMA-ECOM** implementa defensa criptográfica en profundidad comprobada en ambos motores:

| Capa Arquitectónica | Mecanismo Criptográfico Implementado | Evidencia Verificada en el Repositorio | Salvaguarda Jurídica que Cumple |
| :--- | :--- | :--- | :--- |
| **Capa de Aplicación (Autenticación Login)** | Derivación de clave resistente a GPU/ASIC (**Argon2id**, memoria 64 MiB, 3 iteraciones, paralelismo 4) + **MFA TOTP** (RFC 6238). | `02_AMSI_Modelado_Software/04_diagramas_de_secuencia.md` y tabla `seguridad.usuarios` (`password_hash`, `password_salt`, `mfa_secreto`). | Art. 16 CPEUM; Art. 19 LFPDPPP (confidencialidad ante brecha de datos). |
| **Capa de Persistencia — Microsoft SQL Server 2022** | Salt criptográfico aleatorio de 256 bits (`CRYPT_GEN_RANDOM(32)`) + estiramiento iterativo `HASHBYTES('SHA2_512', ...)` (5,000 rondas) + registro en `seguridad.historial_passwords`. | Ejecutado en vivo en `01_FBD_Base_de_Datos/04_Consultas_Algebra/03_prueba_criptografia_sqlserver.sql` → **`CUMPLIDO (SIN TEXTO PLANO) \| LOGIN_EXITOSO \| RECHAZO_CORRECTO`**. | Prohibición de credenciales en texto claro; trazabilidad contra reutilización de claves. |
| **Capa de Persistencia — PostgreSQL 16/17** | Extensión nativa **`pgcrypto`** aplicando **bcrypt** (`crypt(password, gen_salt('bf', 12))`, factor de costo $2^{12}$). | `01_FBD_Base_de_Datos/04_Consultas_Algebra/04_prueba_criptografia_postgresql.sql` y `CREATE EXTENSION "pgcrypto"` en el DDL. | Portabilidad segura multi-SGBD sin degradar el estándar criptográfico. |
| **Datos en Tránsito y Bitácoras Forenses** | Cifrado de canal **TLS 1.3**, tokenización PCI-DSS en `clientes.metodos_pago_tokenizados` y firma de integridad **HMAC/SHA-256** en `auditoria.bitacora_seguridad_global`. | Esquema DDL (`firma_integridad_hash`), ACLs de capa 3 (VLAN 10) y *Port Security* en switches. | Integridad probatoria ante Ministerio Público (Art. 227 CNPP) y Arts. 211 bis 1–7 CPF. |

### 3. Conclusión del Dictamen Técnico-Jurídico
Se dictamina que la persistencia criptográfica implementada y verificada en **DERMA-ECOM** satisface de manera integral el **Principio de Seguridad** del Artículo 16 Constitucional y el Artículo 19 de la LFPDPPP, asegurando que, aun ante un escenario hipotético de exfiltración de respaldo (*dump*) de la base de datos, las credenciales de usuarios y administradores permanecen matemáticamente ininteligibles e irreversibles.
