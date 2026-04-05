// lib/data/chapter3/chapter3_data.dart

// ═══════════════════════════════════════════════════════════
// INTRODUCCIÓN
// ═══════════════════════════════════════════════════════════

const String ch3Intro = 'El avión ya ha cerrado sus puertas. Desde este momento '
    'hasta que las ruedas toquen la pista rusa, tienes entre 3 y 12 horas '
    'dependiendo de tu punto de origen. Un vuelo a Moscú desde Madrid dura '
    'unas 4 horas; desde Ciudad de México, casi 13. Esa diferencia horaria '
    'con Rusia (UTC+3 en Moscú) puede ir de 2 a 11 horas según tu país, lo '
    'que convierte el vuelo en tu primera batalla contra el jet lag. Quienes '
    'llegan descansados, hidratados y con los documentos a mano pasan el '
    'control migratorio en minutos. Los demás aprenden la lección de la peor '
    'manera. Este capítulo te prepara para todo lo que ocurre a 10.000 metros '
    'de altitud.';

// ═══════════════════════════════════════════════════════════
// SECCIÓN 1: ANTES DEL DESPEGUE
// ═══════════════════════════════════════════════════════════

const String ch3BeforeTakeoffIntro = 'Los primeros minutos a bordo son los más '
    'importantes para organizarte. Aprovéchalos bien antes de que el avión '
    'empiece a moverse.';

const List<List<String>> ch3BeforeTakeoffSteps = [
  ['1', 'Encuentra tu asiento', 'Revisa tu tarjeta de embarque: fila y letra. '
      'En aviones de dos pasillos (ej. Boeing 777), las letras A–C son ventana/centro/'
      'pasillo izquierdo; D–G o H–K el pasillo derecho. Si tienes asiento de ventana '
      'y prefieres salir con facilidad, sigue leyendo — lo resolveremos en el check-in '
      'del próximo vuelo.'],
  ['2', 'Coloca el equipaje de mano', 'El compartimento superior es para tu maleta '
      'de cabina. El espacio bajo el asiento delantero es para la mochila o bolso '
      'que necesitarás durante el vuelo: auriculares, documentos, botella de agua '
      'y pastillas. Nunca bloquees el espacio bajo tu propio asiento — es para '
      'el pasajero de atrás.'],
  ['3', 'Modo avión y cinturón', 'Activa el modo avión antes de que la '
      'tripulación lo indique. Abróchate el cinturón visible sobre la manta — '
      'así el personal no te despertará si hay turbulencia nocturna. La regla '
      'básica: cinturón puesto siempre que estés sentado.'],
  ['4', 'Escucha las instrucciones de seguridad', 'Aunque no sea tu primer '
      'vuelo, identifica las salidas de emergencia más cercanas (pueden estar '
      'detrás de ti). Cuenta las filas hasta ellas: en una cabina sin luz, '
      'esa cuenta puede marcar la diferencia.'],
];

// ═══════════════════════════════════════════════════════════
// SECCIÓN 2: COMODIDAD Y SALUD
// ═══════════════════════════════════════════════════════════

const String ch3HealthIntro = 'La cabina de un avión tiene una humedad de entre '
    'el 10 y el 20 % — mucho más seca que cualquier desierto. Combinado con la '
    'inactividad prolongada, puede dejarte agotado antes de llegar. Estos hábitos '
    'marcan la diferencia:';

const List<List<String>> ch3HealthTips = [
  ['💧', 'Hidratación constante', 'Bebe al menos 250 ml de agua por hora de vuelo. '
      'Pide agua sin gas cada vez que pase la tripulación. Evita el café y el '
      'alcohol en exceso — ambos deshidratan y empeoran el jet lag.'],
  ['🚶', 'Muévete cada 2 horas', 'Levántate, camina hasta el fondo y vuelve. '
      'Si no puedes levantarte, bombea los tobillos: 20 círculos en cada dirección '
      'cada hora. Esto reduce el riesgo de trombosis venosa profunda, especialmente '
      'en vuelos de más de 6 horas.'],
  ['🧦', 'Calcetines de compresión', 'Son baratos, fáciles de llevar y muy eficaces '
      'para prevenir piernas hinchadas. Úsalos desde antes de embarcar.'],
  ['👗', 'Ropa cómoda', 'La temperatura en cabina varía. Lleva capas: '
      'una camiseta, un jersey fino y un cortavientos. Las aerolíneas suelen '
      'dar mantas, pero no siempre son suficientes en vuelos nocturnos.'],
  ['🍷', 'Modera el alcohol', 'A 10.000 metros, el alcohol se absorbe más '
      'rápido y la deshidratación se acelera. Un vino está bien; tres copas '
      'te dejarán destrozado al aterrizar.'],
  ['👁️', 'Cuida los ojos y la piel', 'El aire seco reseca las lentillas '
      'y la piel. Usa gafas durante el vuelo, hidrátate la cara y aplica '
      'crema labial. Pequeños detalles que cambian cómo llegas.'],
];

// ═══════════════════════════════════════════════════════════
// SECCIÓN 3: COMIDA A BORDO
// ═══════════════════════════════════════════════════════════

const String ch3FoodIntro = 'La comida a bordo varía enormemente según la aerolínea '
    'y la clase. Aquí lo que puedes esperar en los vuelos más habituales hacia Rusia:';

const List<List<String>> ch3FoodCards = [
  ['🇷🇺', 'Aeroflot y Pobeda (aerolíneas rusas)',
      'Aeroflot ofrece servicio completo en clase económica en vuelos internacionales: '
      'bandeja caliente, pan, postre y bebidas. Pobeda (low-cost) cobra por todo — '
      'ni siquiera el agua es gratuita. Compra comida en el aeropuerto si vuelas '
      'con ellos.'],
  ['🌍', 'Aerolíneas internacionales (Iberia, Turkish, Lufthansa...)',
      'Servicio de bandeja completo en económica. Turkish Airlines tiene fama '
      'de dar de las mejores comidas en clase turista. Suele haber dos servicios '
      'en vuelos largos: uno tras el despegue y otro antes de aterrizar.'],
  ['⚠️', 'Restricciones alimentarias',
      'Si eres vegetariano, vegano, halal, kosher o tienes alguna alergia, '
      'solicita la comida especial al menos 24 horas antes del vuelo a través '
      'de la web de la aerolínea. A bordo, las opciones especiales son muy '
      'limitadas o inexistentes si no las reservaste.'],
  ['🍫', 'Lleva snacks propios',
      'Una barrita de cereales, frutos secos o galletas en el bolso de cabina '
      'son tu mejor seguro. Los horarios de servicio pueden no coincidir con '
      'tu hambre, y los snacks de compra a bordo suelen ser caros.'],
];

// ═══════════════════════════════════════════════════════════
// SECCIÓN 4: ENTRETENIMIENTO Y CONECTIVIDAD
// ═══════════════════════════════════════════════════════════

const String ch3EntertainmentIntro = 'Las horas pasan de forma muy distinta '
    'según cómo te prepares.';

const List<List<String>> ch3EntertainmentItems = [
  ['🎬', 'Pantallas de entretenimiento',
      'La mayoría de aerolíneas en vuelos internacionales tiene pantalla individual '
      'con películas, series, música y juegos. Aeroflot tiene buena selección en '
      'varios idiomas. Pobeda y vuelos regionales cortos puede no tenerla.'],
  ['🎧', 'Auriculares propios',
      'Los auriculares que dan las aerolíneas suelen ser de baja calidad. '
      'Lleva los tuyos — con cancelación de ruido si puedes, para dormir mejor.'],
  ['🔋', 'Carga de dispositivos',
      'Muchos asientos en clase económica tienen puerto USB o enchufe. '
      'Lleva tu cargador y un cable corto. No cuentes siempre con que funcione — '
      'trae el power bank cargado al 100 %.'],
  ['📶', 'WiFi a bordo',
      'Algunas aerolíneas ofrecen WiFi de pago (muy lento). Úsalo solo para '
      'mensajería básica. Descarga películas, podcasts y libros ANTES del vuelo.'],
  ['📚', 'Tu propio entretenimiento',
      'Series descargadas en Netflix/HBO, podcasts, audiolibros, ebooks. '
      'Un vuelo largo es el momento perfecto para avanzar ese libro que '
      'llevas meses queriendo leer.'],
];

// ═══════════════════════════════════════════════════════════
// SECCIÓN 5: SUEÑO Y ADAPTACIÓN AL HUSO HORARIO
// ═══════════════════════════════════════════════════════════

const String ch3SleepIntro = 'Llegar a Rusia con sueño acumulado arruina '
    'los primeros días. La estrategia para minimizar el jet lag empieza '
    'antes de abordar:';

const List<List<String>> ch3SleepTips = [
  ['⏰', 'Ajusta tu reloj al despegar',
      'Nada más sentarte, cambia el reloj a la hora de destino. Empieza a '
      'pensar en horario ruso. Si en Moscú es de noche, intenta dormir aunque '
      'en tu país de origen sea mediodía.'],
  ['😴', 'Kit de sueño básico',
      'Máscara para ojos, tapones para oídos y un cojín cervical de viaje. '
      'Con estos tres elementos, puedes dormir en cualquier asiento de económica.'],
  ['💊', 'Melatonina',
      'La melatonina (0.5–3 mg) tomada al inicio del vuelo nocturno ayuda '
      'a conciliar el sueño sin los efectos secundarios de los somníferos. '
      'Es de venta libre en la mayoría de países. Consulta con tu médico '
      'si tomas otra medicación.'],
  ['🌅', 'A la llegada',
      'Expon​te a la luz natural al aterrizar. Intenta aguantar despierto '
      'hasta las 21h–22h hora local. No te quedes en el hotel durmiendo '
      'la tarde del primer día — eso prolonga el jet lag varios días.'],
];

const String ch3SleepWarning = '⚠️ Evita tomar somníferos fuertes (tipo '
    'benzodiacepinas) en el avión si no los conoces. En tierra puedes '
    'desorientarte al aterrizar y eso complica el control migratorio.';

// ═══════════════════════════════════════════════════════════
// SECCIÓN 6: DOCUMENTACIÓN DURANTE EL VUELO
// ═══════════════════════════════════════════════════════════

const String ch3DocsIntro = 'El control migratorio de Rusia empieza a prepararse '
    'en el aire. Tener los documentos en orden cuando aterrizas ahorra '
    'largas esperas — y eventuales problemas.';

const List<List<String>> ch3DocItems = [
  ['🛂', 'Pasaporte con visa vigente',
      'Verifica en el avión que tu visa no ha caducado y que el tipo de visa '
      'coincide con el propósito de tu visita. Fotocopias (físicas o digitales) '
      'en el teléfono como respaldo.'],
  ['📋', 'Tarjeta de migración (Миграционная карта)',
      'La tripulación la reparte durante el vuelo, generalmente en los '
      'últimos 60–90 minutos. Rellénala con bolígrafo (siempre lleva uno). '
      'Pide una nueva si te equivocas — no uses corrector. '
      'Guárdala: la necesitarás al salir de Rusia.'],
  ['🏨', 'Reserva de hotel o dirección de alojamiento',
      'Te preguntarán la dirección donde te hospedarás. Tenla en papel '
      'impreso o en pantalla sin necesidad de internet. La dirección en '
      'ruso o en inglés latino es válida.'],
  ['🏥', 'Seguro médico con cobertura en Rusia',
      'Algunos agentes migratorios lo solicitan. Ten el número de póliza '
      'y el teléfono de asistencia visibles en tu teléfono.'],
  ['✉️', 'Carta de invitación (si aplica)',
      'Los viajeros con visa de negocios o privada suelen llevar la carta '
      'de invitación de su empresa o anfitrión ruso. Imprímela.'],
];

const String ch3DocsTip = '💡 Rellena la tarjeta de migración con datos '
    'exactamente como aparecen en tu pasaporte. Cualquier discrepancia '
    'puede causar demoras en el control migratorio.';

// ═══════════════════════════════════════════════════════════
// SECCIÓN 7: ANTES DE ATERRIZAR
// ═══════════════════════════════════════════════════════════

const String ch3BeforeLandingIntro = 'Los últimos 45–60 minutos del vuelo '
    'son los más importantes para organizarte. El piloto avisará del inicio '
    'del descenso — ese es tu momento.';

const List<List<String>> ch3BeforeLandingSteps = [
  ['1', 'Ajusta el reloj a la hora rusa', 'Moscú es UTC+3. San Petersburgo, '
      'igual. Ekaterimburgo UTC+5. Confirma la zona horaria de tu destino.'],
  ['2', 'Recoge todos tus objetos personales', 'Teléfono, auriculares, '
      'pasaporte, tarjeta de migración rellena, cartera, medicamentos. '
      'Revisa el bolsillo del asiento delantero — es el lugar donde más '
      'cosas se olvidan.'],
  ['3', 'Prepara el bolso de mano para el control', 'Ten el pasaporte '
      'y la tarjeta de migración en el bolsillo exterior del bolso. '
      'No los entierres en el fondo de la mochila.'],
  ['4', 'Aseo rápido', 'Lávate la cara, cepíllate los dientes si '
      'puedes. Llegar fresco al control migratorio mejora no solo '
      'cómo te sientes, sino cómo te perciben.'],
  ['5', 'Desactiva el modo avión', 'Actívalo solo cuando el piloto '
      'lo indique. Tu teléfono buscará red rusa automáticamente. '
      'Revisa si tienes roaming activado o tu SIM local.'],
];

// ═══════════════════════════════════════════════════════════
// CHECKLIST FINAL
// ═══════════════════════════════════════════════════════════

const List<Map<String, String>> ch3ChecklistItems = [
  {
    'icon': '🛂',
    'text': 'Pasaporte en el bolsillo delantero del bolso de cabina',
  },
  {
    'icon': '📋',
    'text': 'Tarjeta de migración rellenada con bolígrafo (letra clara)',
  },
  {
    'icon': '🏨',
    'text': 'Dirección del hotel / alojamiento en Rusia a mano (papel o pantalla)',
  },
  {
    'icon': '🏥',
    'text': 'Número de póliza del seguro médico visible sin internet',
  },
  {
    'icon': '💧',
    'text': 'Hidratación cumplida: al menos 250 ml/hora durante el vuelo',
  },
  {
    'icon': '🕐',
    'text': 'Reloj ajustado a la hora de destino ruso',
  },
  {
    'icon': '🧴',
    'text': 'Aseo realizado antes del aterrizaje (cara y dientes)',
  },
  {
    'icon': '📱',
    'text': 'Power bank cargado y modo avión listo para desactivar',
  },
  {
    'icon': '✉️',
    'text': 'Carta de invitación impresa (si tu visa lo requiere)',
  },
  {
    'icon': '🎒',
    'text': 'Compartimento superior vaciado y bolso de mano con todo lo esencial',
  },
];