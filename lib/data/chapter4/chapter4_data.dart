// lib/data/chapter4/chapter4_data.dart

// ── INTRO ──────────────────────────────────────────────────
const String ch4Intro =
    'Las ruedas acaban de tocar suelo ruso. Después de horas de vuelo, '
    'la adrenalina sube — pero el viaje todavía no ha terminado. Entre '
    'el avión y la salida al exterior hay una serie de pasos que muchos '
    'viajeros afrontan sin saber exactamente qué esperar. Este capítulo '
    'te lleva de la mano por cada uno de ellos: señalización, inmigración, '
    'equipaje, aduanas y los servicios que encontrarás en la zona de llegadas. '
    'Cuando cruces esa puerta final, ya sabrás exactamente qué has hecho y '
    'por qué lo hiciste bien.';

// ── SECCIÓN 1: PRIMEROS MOMENTOS ──────────────────────────
const String ch4FirstMomentsIntro =
    'En cuanto el avión se detiene y se abren las puertas, el objetivo '
    'es uno solo: seguir el flujo. Los aeropuertos rusos grandes — '
    'Sheremétievo, Domodédovo y Púlkovo — están razonablemente bien '
    'señalizados en ruso e inglés. Los aeropuertos regionales más pequeños '
    'pueden tener menos señalización en inglés, pero la lógica es siempre '
    'la misma: sigue las flechas hacia "Passport Control / Паспортный '
    'контроль". No improvises caminos alternativos.';

const List<List<String>> ch4FirstMomentsTips = [
  [
    '📄',
    'Pasaporte y visa a mano',
    'Sácalos del equipaje de mano antes de bajarte. Los necesitarás en minutos y buscarlos en la fila genera estrés innecesario.',
  ],
  [
    '🎫',
    'Guarda la tarjeta de embarque',
    'No la tires ni la pierdas. Algunos controles pueden pedirla junto con el pasaporte para verificar el vuelo de llegada.',
  ],
  [
    '👁️',
    'Observa los carteles',
    'Busca "Arrivals / Прилёт" y "Passport Control / Паспортный контроль". En Sheremétievo los carteles son bilingües en casi toda la terminal.',
  ],
  [
    '⏱️',
    'Aeropuertos grandes vs. regionales',
    'En Moscú o San Petersburgo las distancias internas pueden ser considerables. En aeropuertos regionales el proceso es mucho más rápido y directo.',
  ],
];

// ── SECCIÓN 2: CONTROL DE PASAPORTES ──────────────────────
const String ch4PassportControlIntro =
    'Este es el momento más formal del proceso. El control de pasaportes '
    '(inmigración) separa a los ciudadanos rusos de los extranjeros — '
    'fíjate bien en los carteles para ir a la fila correcta. La fila '
    'de extranjeros (Иностранные граждане / Foreign citizens) suele '
    'ser más larga, especialmente en temporada alta. Ten paciencia: '
    'es normal esperar entre 20 y 60 minutos.';

const List<List<String>> ch4PassportControlSteps = [
  ['1', 'Fila correcta', 'Busca el cartel "Foreign citizens / Иностранные граждане". No te pongas en la fila de ciudadanos rusos — te pedirán que cambies y perderás tiempo.'],
  ['2', 'Documentos preparados', 'Pasaporte abierto en la página de datos, visa visible (física o electrónica impresa), seguro médico y, si ya la tienes rellena, la tarjeta de migración.'],
  ['3', 'En la cabina', 'Entrega los documentos al oficial sin decir nada que no te pregunten. Responde con calma: motivo del viaje, duración, dirección del alojamiento y vuelo de regreso si lo tienes.'],
  ['4', 'Biometría', 'En muchos aeropuertos rusos te tomarán foto y huellas dactilares directamente en la cabina. Es un procedimiento estándar — coopera tranquilamente.'],
  ['5', 'Recoge todo', 'Una vez sellado el pasaporte, recoge todos los documentos antes de alejarte. Revisa que no te hayas dejado nada en el mostrador.'],
];

const String ch4PassportControlTip =
    '💡  Consejo: No fotografíes la zona de control de pasaportes. '
    'Está prohibido y puede generar una situación incómoda con los oficiales. '
    'Guarda el teléfono y mantén una actitud tranquila y colaboradora.';

// ── SECCIÓN 3: TARJETA DE MIGRACIÓN ────────────────────────
const String ch4MigrationCardIntro =
    'La tarjeta de migración (Миграционная карта) es un documento '
    'de dos partes que registra tu entrada a Rusia. Históricamente '
    'se repartía en el avión o se entregaba en inmigración; en algunos '
    'aeropuertos el propio oficial la imprime a partir de tus datos. '
    'Infórmate antes del viaje sobre la práctica actual en tu punto '
    'de entrada, ya que el proceso puede variar.';

const List<List<String>> ch4MigrationCardItems = [
  [
    '📋',
    '¿Qué es?',
    'Un formulario con dos partes (entrada y salida) que acredita tu ingreso legal al país. El oficial de inmigración retiene una parte y tú conservas la otra.',
  ],
  [
    '🔒',
    'Consérvala siempre',
    'Esta es la regla más importante: guarda tu copia en el pasaporte o en un lugar seguro. La necesitarás al salir de Rusia. Perderla complica seriamente tu salida.',
  ],
  [
    '🚨',
    'Si la pierdes',
    'Debes acudir al Servicio de Migración (УМВД / ГУВМ МВД) lo antes posible para notificarlo. El proceso puede implicar papeleo, tiempo y posiblemente una multa.',
  ],
  [
    '🏨',
    'Registro en alojamiento',
    'Tu hotel o anfitrión usará la tarjeta de migración para registrarte en el sistema. Es obligatorio registrarse en las primeras 7 días laborables desde la llegada.',
  ],
];

const String ch4MigrationCardWarning =
    '⚠️  IMPORTANTE: La tarjeta de migración es tan importante como el '
    'pasaporte durante tu estancia en Rusia. Guárdala siempre junto '
    'a tu pasaporte — nunca la dejes en el hotel ni la metas en la maleta '
    'documentada. La necesitarás para salir del país.';

// ── SECCIÓN 4: RECOGIDA DE EQUIPAJE ────────────────────────
const String ch4LuggageIntro =
    'Con el pasaporte sellado y los documentos en orden, el siguiente '
    'paso es recoger el equipaje. Sigue los carteles hacia "Baggage '
    'Claim / Получение багажа". Las cintas están numeradas y los '
    'monitores muestran qué número de cinta corresponde a cada vuelo. '
    'Busca tu número de vuelo en los monitores antes de dirigirte a '
    'una cinta específica.';

const List<List<String>> ch4LuggageItems = [
  [
    '🏷️',
    'Verifica las etiquetas',
    'Antes de retirar una maleta de la cinta, confirma que el talón de equipaje coincide con el que te dieron al facturar. Dos maletas iguales pueden provocar confusiones.',
  ],
  [
    '⏳',
    'Si no aparece',
    'Espera hasta que la cinta se detenga completamente. Si tu equipaje no aparece, ve directamente al mostrador de "Lost Baggage / Розыск багажа" de tu aerolínea antes de salir del área de recogida.',
  ],
  [
    '💥',
    'Equipaje dañado',
    'Si recibes la maleta con daños visibles, repórtalo en el mismo mostrador de la aerolínea antes de salir del aeropuerto. Una vez que sales, el proceso de reclamación se complica.',
  ],
  [
    '👀',
    'No pierdas de vista tu equipaje',
    'No dejes maletas desatendidas en el área de recogida. Además de los obvios riesgos de seguridad, dejar equipaje sin vigilancia en zonas aeroportuarias puede generar alertas.',
  ],
];

// ── SECCIÓN 5: ADUANAS ─────────────────────────────────────
const String ch4CustomsIntro =
    'Después de recoger el equipaje, pasarás por el control de aduanas. '
    'El sistema ruso usa los dos canales clásicos: verde y rojo. '
    'Elegir bien no es opcional — pasar por el canal equivocado '
    'puede resultar en una multa significativa o en la confiscación '
    'de bienes. La regla de oro: en caso de duda, canal rojo.';

const List<List<String>> ch4greenChannelItems = [
  ['✅', 'Dinero en efectivo', 'Menos de 10.000 USD (o equivalente en otras monedas) en total entre efectivo y instrumentos monetarios.'],
  ['✅', 'Alcohol y tabaco', 'Dentro de los límites permitidos: generalmente 3 litros de alcohol o 2 litros de licor fuerte, y 200 cigarrillos.'],
  ['✅', 'Bienes personales', 'Objetos de uso personal que no estén destinados a la venta. Artículos electrónicos para uso propio (portátil, cámara, teléfono).'],
  ['✅', 'Sin bienes prohibidos', 'No llevas productos de origen animal sin certificado, plantas, drogas, armas ni material prohibido de ningún tipo.'],
];

const List<List<String>> ch4redChannelItems = [
  ['🔴', 'Dinero superior al límite', '10.000 USD o más en efectivo u otros instrumentos monetarios deben declararse obligatoriamente.'],
  ['🔴', 'Bienes de valor', 'Joyas, relojes de lujo, equipos profesionales (cámaras de alta gama, equipos de vídeo) o cualquier objeto de valor inusual.'],
  ['🔴', 'Alcohol y tabaco en exceso', 'Si superas los límites permitidos, debes declararlo y podrías pagar aranceles.'],
  ['🔴', 'Medicamentos con receta', 'Ciertos medicamentos — especialmente los que contienen sustancias controladas — deben declararse con la receta médica original.'],
];

const String ch4CustomsWarning =
    '⚠️  Las consecuencias de no declarar pueden ser graves: desde multas '
    'elevadas hasta la confiscación de los bienes y, en casos extremos, '
    'procedimientos legales. Si tienes cualquier duda sobre lo que llevas, '
    'usa el canal rojo. El proceso tarda más, pero es infinitamente mejor '
    'que las alternativas.';

const String ch4CustomsTip =
    '💡  Guarda las facturas o recibos de objetos caros que lleves '
    '(cámaras, ordenadores, relojes). En caso de ser inspeccionado, '
    'demuestran que son de uso personal y no mercancía importada para venta.';

// ── SECCIÓN 6: SERVICIOS EN LLEGADAS ──────────────────────
const String ch4ServicesIntro =
    'Antes de salir al exterior, la zona de llegadas ofrece varios '
    'servicios que pueden ser útiles, especialmente si llegas por '
    'primera vez o en horario nocturno. Tómate unos minutos — '
    'ya estás dentro del aeropuerto y todo es más manejable aquí '
    'que en la calle.';

const List<List<String>> ch4ServiceItems = [
  [
    '💱',
    'Casas de cambio y cajeros',
    'Hay disponibles dentro del aeropuerto, pero las comisiones suelen ser más altas que en la ciudad. Cambia solo lo necesario para el transporte inicial (taxi, metro) y el primer día.',
  ],
  [
    '📱',
    'SIM / eSIM local',
    'Varios operadores (MTS, Beeline, МегаФон) tienen puntos de venta en las zonas de llegadas. Necesitarás tu pasaporte para la activación. Es una de las mejores inversiones de los primeros minutos.',
  ],
  [
    '🌐',
    'WiFi gratuito',
    'Los grandes aeropuertos rusos ofrecen WiFi gratuito. El registro suele requerir un número de teléfono ruso — si aún no tienes SIM, pregunta en el mostrador de información o usa una VPN desde tu conexión de datos internacional.',
  ],
  [
    'ℹ️',
    'Información turística',
    'Sheremétievo y Domodédovo tienen mostradores de información donde pueden ayudarte con mapas, transporte y preguntas básicas. El personal no siempre habla español, pero el inglés suele funcionar.',
  ],
  [
    '☕',
    'Comida y descanso',
    'Hay cafeterías y tiendas en la zona de llegadas. Si tu vuelo llegó de madrugada y no tienes transporte inmediato, puedes esperar aquí con calma hasta que amanezca.',
  ],
];

// ── SECCIÓN 7: ÚLTIMOS PASOS ANTES DE SALIR ───────────────
const String ch4LastStepsIntro =
    'Antes de cruzar la puerta hacia el exterior — y hacia Rusia de verdad — '
    'hay un momento de verificación que vale la pena hacer. No tardarás más '
    'de dos minutos, pero puede ahorrarte muchos problemas después.';

const List<List<String>> ch4LastStepsItems = [
  [
    '🛂',
    'Documentación completa',
    'Pasaporte con sello de entrada, visa (si es física), tarjeta de migración y seguro médico. Todos en el mismo sitio, idealmente en una carpeta o funda de documentos.',
  ],
  [
    '🧥',
    'Ropa adecuada para el exterior',
    'Especialmente en otoño e invierno, la diferencia de temperatura entre el interior climatizado del aeropuerto y el exterior puede ser brutal. Ten el abrigo y el gorro accesibles antes de salir.',
  ],
  [
    '📲',
    'Navegación lista',
    'Comprueba que tienes la dirección del alojamiento guardada, mapas offline descargados (Yandex Maps o Maps.me funcionan bien en Rusia) y batería suficiente en el teléfono.',
  ],
  [
    '💰',
    'Efectivo local disponible',
    'Ten rublos a mano para el transporte inicial, incluso si planeas pagar con tarjeta — no todos los taxis independientes o medios de transporte la aceptan.',
  ],
];

// ── CHECKLIST ITEMS ────────────────────────────────────────
const List<String> ch4ChecklistItems = [
  'Pasaporte sellado y guardado en lugar seguro',
  'Tarjeta de migración conservada (no tirada)',
  'Visa comprobada (física o impresa si es electrónica)',
  'Seguro médico impreso y accesible',
  'Todo el equipaje recogido y revisado',
  'Aduanas cruzadas por el canal correcto',
  'SIM / eSIM local activada con datos',
  'Mapas offline descargados en el teléfono',
  'Dinero local en efectivo para el transporte',
  'Dirección del alojamiento guardada o memorizada',
];