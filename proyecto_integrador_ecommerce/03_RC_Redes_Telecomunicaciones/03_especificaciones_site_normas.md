# CAPÍTULO IV: INFRAESTRUCTURA DE RED Y COMUNICACIONES (RC - IFD-1020)
## Entregable 4.3: Especificaciones de Cableado Estructurado, Normativa Internacional y Diseño del SITE

---

### 1. Marco Normativo Internacional de Telecomunicaciones

El diseño e implementación física del Centro de Procesamiento de Datos (Data Center / SITE Principal) y de los Cuartos de Telecomunicaciones (IDF) de los almacenes CEDIS Monterrey y CEDIS CDMX se apega estrictamente a los estándares internacionales de la **Telecommunications Industry Association (TIA)** y la **Electronic Industries Alliance (EIA)**:

| Estándar | Denominación Oficial | Aplicación en el Proyecto |
| :--- | :--- | :--- |
| **ANSI/TIA-568-C** | *Commercial Building Telecommunications Cabling Standard* | Selección de medios de transmisión, distancias máximas, conectores, pruebas de reflectometría (OTDR) y atenuación de diafonía (NEXT, FEXT). |
| **ANSI/TIA-569-B** | *Commercial Building Standard for Telecommunications Pathways and Spaces* | Dimensionamiento de cuartos técnicos (SITE), bandejas portacables (canastilla tipo malla), ductos, separaciones mínimas respecto a líneas de alta tensión para mitigar interferencia electromagnética (EMI). |
| **ANSI/TIA-606-B** | *Administration Standard for Telecommunications Infrastructure* | Esquema alfanumérico estandarizado de etiquetado y codificación de colores para patch panels, cables, tomas de usuario y racks. |
| **ANSI/TIA-607-B** | *Generic Telecommunications Grounding (Earthing) and Bonding for Customer Premises* | Diseño de la red de puesta a tierra física para telecomunicaciones, barra TMGB, barras TGB secundarias y equipotencialidad de racks. |
| **ASHRAE TC 9.9** | *Thermal Guidelines for Data Processing Environments* | Parámetros higrotérmicos de climatización de precisión (temperatura, punto de rocío y humedad relativa). |
| **NFPA 2001** | *Standard on Clean Agent Fire Extinguishing Systems* | Protección contra incendios mediante inundación total con agente limpio gaseoso ecológico (Novec 1230 / FK-5-1-12). |

---

### 2. Especificación Técnica de Medios de Transmisión y Cableado Estructurado

#### 2.1 Cableado Horizontal (Áreas de Trabajo y Enlaces de Servidores):
- **Tipo de Cable:** Cobre Par Trenzado Apantallado **Categoría 6A F/UTP** (*Foiled / Unshielded Twisted Pair*) calibre 23 AWG con forro retardante a la flama y cero halógenos (**LSZH** - *Low Smoke Zero Halogen*).
- **Ancho de Banda y Rendimiento:** Frecuencia de hasta **500 MHz**, soportando velocidades de **10GBASE-T (10 Gbps)** a una distancia máxima de 90 metros de canal horizontal permanente más 10 metros de cordones de parcheo (patch cords), sumando los 100 metros del canal completo.
- **Conectores y Jacks:** Módulos RJ-45 Cat 6A blindados 180° Keystone Jack con baño de oro de 50 micropulgadas en pines.
- **Patch Cords:** Cables preensamblados Cat 6A multifilar blindados con fundas protectoras antienredo (*snagless boot*).

#### 2.2 Cableado Vertical o Dorsal (Backbone):
- **Backbone Interno del SITE (Racks Servidores <-> Racks Core/Distribución):**
  - Troncales de **Fibra Óptica Multimodo OM4** optimizada para láser (núcleo de 50 $\mu\text{m}$, revestimiento de 125 $\mu\text{m}$) con conectores MPO/MTP de 12 y 24 fibras y transductores LC dúplex.
  - Velocidad soportada: **40 Gbps (40GBASE-SR4)** y **100 Gbps (100GBASE-SR4)** para latencia submilimétrica en transacciones de la base de datos SQL Server y réplicas PostgreSQL.
- **Backbone Inter-Edificios / Campus (Data Center <-> Almacén CEDIS):**
  - Cable de **Fibra Óptica Monomodo OS2** dieléctrico para exteriores con tubo holgado (*loose tube*) y gel antihumedad, calibre 9/125 $\mu\text{m}$, conectorizado en LC-UPC.
  - Velocidad soportada: **10 Gbps (10GBASE-LR)** y **100 Gbps (100GBASE-LR4)** a longitudes de hasta 10 km.

---

### 3. Código de Colores y Esquema de Etiquetado (ANSI/TIA-606-B)

Para facilitar la administración, mantenimiento y auditoría física, se implementa una codificación de color estricta por servicio y función:

| Color Oficial | Servicio / Destino de Red | VLAN Asociada | Tipo de Tráfico |
| :---: | :--- | :---: | :--- |
| **Azul Rey** | Estaciones de Trabajo Operativas y Dermoconsultores | VLAN 50 | Tráfico corporativo regular y ERP |
| **Rojo Bermellón** | Servidores de Base de Datos Críticos (SQL Server / PG) | VLAN 10 | Tráfico transaccional OLTP y réplica |
| **Naranja Intenso** | Servidores de Aplicaciones Web y DMZ | VLAN 20 | Ingress HTTP/HTTPS y balanceo |
| **Amarillo Canario** | Cámaras IP de Videovigilancia (CCTV) y Biometría | VLAN 60 | Streaming RTSP de alta prioridad |
| **Gris Plata** | Dispositivos Industriales WMS e Ingesta IoT Frigorífico | VLAN 30 | Telemetría MQTT y lectores láser |
| **Verde Olivo** | Interfaces de Gestión de Red y Consola (OOB Management)| VLAN 99 | SSH, SNMPv3, Syslog seguro |
| **Morado Obscuro** | Puntos de Acceso Inalámbricos (Wi-Fi 6 APs) | VLAN 50/70 | Tráfico PoE+ 802.3at Trunk |

#### 3.1 Nomenclatura Alfanumérica de Identificación:
Cada enlace y puerto se etiqueta en ambos extremos (panel de parcheo y roseta mural) conforme al estándar:
$$\mathbf{f_s - r_a - p_n}$$
- $f_s$: Identificador de Sala o Cuarto Técnico (ej. `SITE-P01`).
- $r_a$: Identificador de Rack o Gabinete (ej. `RK01`).
- $p_n$: Panel y Puerto (ej. `PPA-24`).
*Ejemplo impreso en etiqueta de vinilo térmico:* `SITE-P01-RK01-PPA-24 <---> CEDIS-ZONA-B-PTO-04`.

---

### 4. Especificación Arquitectónica y Física del SITE (Data Center)

```
+------------------------------------------------------------------------------------+
|                             ESQUEMA ARQUITECTONICO DEL SITE                         |
|                               Dimensión: 6.00 m x 4.00 m (24 m2)                   |
+------------------------------------------------------------------------------------+
|                                    MURO NORTE                                      |
|   +----------------------------------------------------------------------------+   |
|   | [CRAC 01] Aire Acondicionado de Precision (N+1)                            |   |
|   +----------------------------------------------------------------------------+   |
|                                                                                    |
|                 PASILLO CALIENTE (HOT AISLE) - EXTRACCION A TECHO                  |
|   ==============================================================================   |
|   |  [RACK 01]       |  [RACK 02]       |  [RACK 03]       |  [RACK 04]        |   |
|   |  Core Switches   |  Cluster SGBD    |  Servidores Web  |  Patch Panels     |   |
|   |  Cisco 9500 / FW |  SQL Server & PG |  NGINX & K8s     |  Cobre & Fibra    |   |
|   ==============================================================================   |
|                 PASILLO FRIO (COLD AISLE CONFINADO) - AIRE 20°C                    |
|   ..............................................................................   |
|                               (Rejillas Perforadas en Piso Falso)                  |
|                                                                                    |
|   +-------------------+                                    +-------------------+   |
|   | [UPS MODULAR A]   |                                    | [UPS MODULAR B]   |   |
|   | 40 kVA Trifasico  |                                    | 40 kVA Trifasico  |   |
|   +-------------------+                                    +-------------------+   |
|                                                                                    |
|   +----------------------------------------------------------------------------+   |
|   | [CRAC 02] Aire Acondicionado de Precision (N+1 Respaldo)                   |   |
|   +----------------------------------------------------------------------------+   |
| [PUERTA BLINDADA BIOMETRICA]                                      [BARRA TMGB]     |
+------------------------------------------------------------------------------------+
```

#### 4.1 Características Físicas y Ambientales del Recinto:
1. **Dimensiones y Alturas:** Superficie total de $24\text{ m}^2$ ($6.00\text{ m} \times 4.00\text{ m}$) con altura libre de $3.20\text{ m}$ de piso a losa.
2. **Piso Falso Antiestático Elevado:** Sistema de losetas de acero rellenas de cemento liviano con recubrimiento disipativo de alta presión (HPL) elevado a $45\text{ cm}$ del suelo estructural, formando una cámara impelente para inyección de aire frío. Resistencia a la carga concentrada de $560\text{ kg/placa}$.
3. **Paredes y Techo:** Sellado hermético anti-polvo con pintura epóxica ignífuga clase A. Muros perimetrales con clasificación de resistencia al fuego de al menos 90 minutos (RF-90).
4. **Climatización y Control Ambiental (ASHRAE TC 9.9 Clase A1):**
   - Sistema dual de Aires Acondicionados de Precisión tipo In-Row / Perimetrales con redundancia **$N+1$** (Unidades CRAC 01 y CRAC 02).
   - Temperatura de operación constante: **$20^{\circ}\text{C} \pm 2^{\circ}\text{C}$**.
   - Humedad relativa controlada: **$45\% \pm 5\%$** (evitando condensación por debajo del punto de rocío y descargas electrostáticas ESD por sequedad).
   - Confinamiento térmico mediante contención de pasillo frío con puertas corredizas y paneles de policarbonato transparentes superiores.

#### 4.2 Sistema Eléctrico, Respaldo y Puesta a Tierra (ANSI/TIA-607-B):
1. **Doble Acometida Eléctrica Redundante (Feeders A y B):** Dos vías eléctricas completamente independientes desde la subestación de transformación hacia los tableros de distribución de emergencia.
2. **Sistema UPS Modular Trifásico:** Dos unidades UPS en topología $2N$ de **$40\text{ kVA}$** cada una con tecnología de doble conversión en línea (*Online Double Conversion*), factor de potencia 1.0, y bancos de baterías selladas VRLA con autonomía de **45 minutos** al 80% de carga.
3. **Planta de Generación Diésel de Emergencia:** Generador trifásico de **$100\text{ kW}$** con tanque de combustible para 72 horas continuas y tablero de transferencia automática (ATS) calibrado para conmutar en menos de **8 segundos** ante falla del suministro eléctrico comercial de CFE.
4. **Barras de Distribución Eléctrica en Racks (ePDUs Inteligentes):** Cada rack alberga 2 PDUs montadas verticalmente (PDU-A y PDU-B) monitoreadas vía SNMPv3 por IP, con salidas IEC C13 y C19 protegidas por interruptores magnetotérmicos individuales.
5. **Sistema de Tierra Física y Equipotencialidad:**
   - Barra Principal de Tierra de Telecomunicaciones (**TMGB** - *Telecommunications Main Grounding Busbar*) de cobre electrolítico de $6\text{ mm} \times 100\text{ mm} \times 500\text{ mm}$ fijada sobre aisladores de resina.
   - Resistencia de puesta a tierra certificada inferior a **$3\ \Omega$** medida con telurómetro bajo método de caída de potencial (norma NOM-001-SEDE-2012 y TIA-607-B).
   - Conductor de enlace vertical en calibre 3/0 AWG desnudo hacia el electrodo de tierra y barras secundarias **TGB** en cada gabinete conectadas con cable 6 AWG verde.

#### 4.3 Detección Temprana y Extinción de Incendios:
1. **Detección Precoz por Aspiración (VESDA):** Sistema de muestreo continuo de partículas de combustión invisible en aire mediante tecnología láser de alta sensibilidad, detectando conatos en fase incipiente (*fase pirolítica*) hasta 60 minutos antes de la aparición de llamas abiertas.
2. **Supresión por Agente Limpio Gaseoso Novec 1230 (Dodecafluoro-2-metilpentan-3-ona):** Cilindros presurizados con nitrógeno seco a 360 psi. En caso de activación confirmada (dos zonas cruzadas), el gas inunda la sala en menos de 10 segundos, extinguiendo el fuego por remoción de calor sin reducir el oxígeno respirable y sin dejar residuos conductores que dañen los microcircuitos de los servidores.

#### 4.4 Seguridad Física Perimetral y Control de Acceso Biométrico:
1. Puerta de acceso blindada en acero calibre 14 con cerradura electromagnética de retención magnética de 1200 libras ($540\text{ kg}$).
2. Control de acceso con doble factor de validación obligatorio: tarjeta inteligente RFID de alta seguridad (**Mifare DESFire EV3 con cifrado AES-128**) más lector biométrico dactilar y reconocimiento facial con detección de vida (*anti-spoofing*).
3. Registro de auditoría digital inmutable de entradas, salidas e intentos fallidos reportado en tiempo real al SIEM corporativo.
