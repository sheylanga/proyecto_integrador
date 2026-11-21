# CAPÍTULO VI: GESTIÓN NORMATIVA, JURÍDICA Y CONTRACTUAL (TLI — IFR-1024)
## Entregable 6.4: Términos y Condiciones de Uso y Contrato de Licencia para Usuario Final (EULA / SaaS)
**Autores (Equipo de 3 Integrantes):** José Luis Luna García · Sheyla Estefanía Moncada Guel · Eduardo Salazar Martínez

---

### TÉRMINOS Y CONDICIONES DE USO Y CONTRATO DE LICENCIA PARA USUARIO FINAL (EULA / SaaS) DE LA PLATAFORMA "DERMA-ECOM"

**VIGENCIA Y ÚLTIMA ACTUALIZACIÓN:** Febrero de 2026.

El presente contrato de adhesión regula el acceso, licencia de uso y transacciones efectuadas entre la persona física o moral que accede al sistema (el **"USUARIO"** o **"CLIENTE"**) y **DERMA-ECOM COSMECÉUTICA Y SALUD DIGITAL S.A.P.I. DE C.V.** (**"DERMA-ECOM"**), titular de los derechos de explotación comercial de la plataforma web y móvil de comercio electrónico dermocosmético.

---

### 1. Perfeccionamiento del Consentimiento por Medios Electrónicos (Código de Comercio)

Con fundamento en los **Artículos 89, 89 bis, 90, 93 y 97 del Código de Comercio** y el **Artículo 1803 del Código Civil Federal**, el USUARIO manifiesta su aceptación expresa e inequívoca al:
1. Marcar la casilla electrónica (*checkbox*) "Acepto los Términos y Condiciones (EULA) y el Aviso de Privacidad Integral", evento auditado en `clientes.clientes.acepta_terminos` y `clientes.consentimientos_privacidad`;
2. Crear una cuenta de acceso en `seguridad.usuarios`; o
3. Confirmar cualquier orden de compra o suscripción *Beauty-Box*.

Las partes reconocen pleno valor probatorio y fuerza vinculante al **Mensaje de Datos** generado por la plataforma.

---

### 2. Concesión y Restricciones de la Licencia de Uso (EULA / SaaS)

DERMA-ECOM otorga al USUARIO una **licencia limitada, personal, no exclusiva, intransferible y revocable** para utilizar la plataforma bajo modalidad **Software as a Service (SaaS)** exclusivamente para fines lícitos de adquisición personal de cosméticos, gestión de rutinas y consulta de comprobantes fiscales.

**Queda terminantemente prohibido al USUARIO:**
1. Realizar ingeniería inversa, descompilar, desensamblar o intentar obtener el código fuente, esquemas relacionales o algoritmos de diagnóstico cutáneo.
2. Utilizar *bots*, *web scrapers* o herramientas automatizadas para extraer el catálogo (`catalogo.productos_maestros`, `catalogo.variantes_sku`), precios, fórmulas INCI o reseñas de la tienda.
3. Vulnerar o eludir controles de autenticación, sesiones activas, límites de peticiones o infraestructura de red, conductas perseguibles penalmente bajo los Arts. 211 bis 1 al 7 del Código Penal Federal.
4. Revender, sublicenciar o explotar comercialmente el acceso a la plataforma sin autorización escrita.

---

### 3. Descargo de Responsabilidad Médica y Regulatoria (COFEPRIS / Ley General de Salud)

El módulo de cuestionario dermatológico (`clientes.cuestionarios_diagnostico`, `clientes.evaluaciones_diagnostico`) y las recomendaciones de rutinas (`comunidad.rutinas_belleza`) tienen fines **exclusivamente informativos y cosméticos**:
- **No sustituyen consulta, diagnóstico ni prescripción médica presencial** emitida por un dermatólogo titulado.
- Los productos ofertados son cosméticos y dermocosméticos regulados por COFEPRIS (Arts. 269 y 270 de la Ley General de Salud y NOM-141-SSA1/SCFI-2012); no son medicamentos curativos.
- El USUARIO es responsable de la veracidad de las alergias y condiciones declaradas en `clientes.cliente_condiciones`. Ante cualquier reacción adversa cutánea, deberá suspender su uso de inmediato, consultar a un médico y reportar el incidente mediante el módulo de farmacovigilancia (`postventa.reportes_farmacovigilancia`).

---

### 4. Condiciones Comerciales, Envíos, Suscripciones *Beauty-Box* y Devoluciones (RMA)

1. **Precios, Inventario y Facturación:** Los precios se expresan en Pesos Mexicanos (MXN) con IVA desglosado conforme a la Ley del IVA. Los envíos se despachan bajo rotación **FEFO** desde CEDIS con cadena de frío para fórmulas termosensibles. El USUARIO puede solicitar su factura **CFDI 4.0** dentro del mismo mes calendario de compra.
2. **Suscripciones Recurrentes (*Beauty-Box*):** Al activar un plan (`ventas.suscripciones_cliente`), el USUARIO autoriza el cobro periódico automático mediante token bancario PCI-DSS. Podrá pausar o cancelar sin penalización con al menos **5 días hábiles de anticipación** a su próxima fecha de cobro.
3. **Política Sanitaria de Devoluciones (RMA — Art. 56 LFPC y Bioseguridad COFEPRIS):** Por higiene y salud pública, **no se aceptan devoluciones de productos cosméticos, maquillaje o sueros cuyo sello de seguridad haya sido abierto o manipulado** (verificado en `postventa.inspeccion_sanitaria_retorno`), salvo defecto de fabricación, daño logístico en tránsito o reacción adversa documentada bajo protocolo RMA/COFEPRIS.

---

### 5. Seguridad de Cuenta, Propiedad Intelectual y Limitación de Responsabilidad

- **Custodia de Credenciales:** El USUARIO es responsable de resguardar su contraseña y segundo factor de autenticación (MFA TOTP). Debe notificar cualquier actividad sospechosa a `seguridad@dermaecom.tecnm.mx` para revocar sesiones activas.
- **Propiedad Intelectual:** La marca DERMA-ECOM, interfaces, textos, fotografías, código fuente y la base de datos de 150 tablas son propiedad intelectual protegida por la Ley Federal del Derecho de Autor (LFDA) y la Ley Federal de Protección a la Propiedad Industrial (LFPPI).
- **Disponibilidad:** DERMA-ECOM opera bajo objetivos de alta disponibilidad (99.9% SLA), pero no será responsable por fallas derivadas de interrupciones en la conexión a Internet del USUARIO o eventos de fuerza mayor.

---

### 6. Resolución de Controversias y Jurisdicción (PROFECO)

En caso de controversia derivada de compras en línea, el USUARIO podrá acudir en primera instancia al procedimiento conciliatorio ante la **Procuraduría Federal del Consumidor (PROFECO)** conforme a la Ley Federal de Protección al Consumidor (Art. 76 bis — Comercio Electrónico). Para cualquier litigio judicial subsistente, las partes se someten a las leyes mexicanas y a los tribunales competentes de **Monclova, Coahuila de Zaragoza**.
