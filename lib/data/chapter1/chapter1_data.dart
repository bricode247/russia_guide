import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// ESTACIONES DEL AÑO
// ─────────────────────────────────────────────
class SeasonData {
  final String emoji;
  final String name;
  final String months;
  final String tempRange;
  final Color color;
  final Color lightColor;
  final List<String> pros;
  final List<String> cons;

  const SeasonData({
    required this.emoji,
    required this.name,
    required this.months,
    required this.tempRange,
    required this.color,
    required this.lightColor,
    required this.pros,
    required this.cons,
  });
}

const List<SeasonData> seasons = [
  SeasonData(
    emoji: '❄️',
    name: 'Invierno',
    months: 'Dic — Feb',
    tempRange: '−5 °C a −25 °C',
    color: Color(0xFF185FA5),
    lightColor: Color(0xFFE6F1FB),
    pros: [
      'Rusia nevada como postal navideña',
      'Menos turistas y precios más bajos',
      'Mercados de Navidad y Año Nuevo ruso',
      'Ver aurora boreal en el norte',
      'Experiencia cultural única e inmersiva',
    ],
    cons: [
      'Frío extremo (hasta −30 °C en zonas)',
      'Días muy cortos (atardece a las 4 PM)',
      'Equipaje voluminoso (ropa de abrigo)',
      'Algunas atracciones con horario reducido',
    ],
  ),

  SeasonData(
    emoji: '🌱',
    name: 'Primavera',
    months: 'Mar — May',
    tempRange: '+2 °C a +16 °C',
    color: Color(0xFF3B6D11),
    lightColor: Color(0xFFEAF3DE),
    pros: [
      'Clima progresivamente más suave',
      'Precios más bajos que en verano',
      'La ciudad renace: parques y terrazas',
      'Menos aglomeración turística',
    ],
    cons: [
      'Abril: deshielo = calles con barro',
      'Lluvias frecuentes e impredecibles',
      'Marzo aún puede ser muy frío',
      'Paisajes menos fotogénicos en abril',
    ],
  ),

  SeasonData(
    emoji: '☀️',
    name: 'Verano',
    months: 'Jun — Ago',
    tempRange: '+18 °C a +30 °C',
    color: Color(0xFFBA7517),
    lightColor: Color(0xFFFAEEDA),
    pros: [
      'Clima cálido y agradable',
      'Noches Blancas en San Petersburgo (junio)',
      'Días larguísimos, más horas para explorar',
      'Máxima actividad cultural y festivales',
      'Navegación por canales y ríos',
    ],
    cons: [
      'Temporada alta: precios más altos',
      'Muchos turistas, colas en atracciones',
      'Reservas con mucha antelación obligatorias',
      'Posibles olas de calor en julio',
    ],
  ),

  SeasonData(
     emoji: '🍂',
    name: 'Otoño',
    months: 'Sep — Nov',
    tempRange: '+14 °C a −3 °C',
    color: Color(0xFF853810),
    lightColor: Color(0xFFFAECE7),
    pros: [
      'Paisajes otoñales espectaculares',
      'Septiembre aún es cálido y soleado',
      'Menor afluencia de turistas',
      'Precios más razonables que en verano',
    ],
    cons: [
      'Lluvia frecuente a partir de octubre',
      'Los días se acortan rápidamente',
      'Noviembre ya es frío y gris',
      'Algunos eventos culturales pausan',
    ],
  ),
];

// ─────────────────────────────────────────────
// TIPOS DE VISA
// ─────────────────────────────────────────────
const List<Map<String, String>> visaTypes = [
  {
    'type': 'Visa Turista (B-1)',
    'duration': 'Hasta 30 días',
    'for': 'Turismo, visitas familiares cortas',
    'note': 'La más común para viajeros independientes',
  },
  {
    'type': 'Visa de Negocios',
    'duration': 'Hasta 90 días',
    'for': 'Conferencias, reuniones de trabajo',
    'note': 'Requiere carta de invitación de empresa rusa',
  },
  {
    'type': 'Visa de Estudiante',
    'duration': 'Duración del programa',
    'for': 'Estudios en universidad rusa',
    'note': 'Emitida con carta de admisión oficial',
  },
  {
    'type': 'Visa de Trabajo',
    'duration': 'Según contrato',
    'for': 'Empleo en empresa rusa',
    'note': 'Proceso más complejo, requiere permiso laboral',
  },
];

// ─────────────────────────────────────────────
// PASOS PARA LA VISA
// ─────────────────────────────────────────────
const List<Map<String, String>> visaSteps = [
  {
    'num': '1',
    'title': 'Conseguir la Invitación (Visa Support)',
    'body':
        'Necesitas una carta de invitación o voucher turístico. Si te hospedas en un hotel registrado en Rusia, ellos la emiten gratuitamente. Si no, puedes comprarla a través de agencias especializadas en visados rusos (por unos 20–30 €). Sin este documento no puedes iniciar el trámite.',
  },
  {
    'num': '2',
    'title': 'Rellenar el formulario online',
    'body':
        'El formulario oficial de solicitud de visa se completa en el portal del Consulado. Requiere datos personales, historial de viajes, información de contacto en Rusia y una foto digital. Tómate tiempo: un error obliga a empezar de nuevo.',
  },
  {
    'num': '3',
    'title': 'Reunir los documentos',
    'body':
        'Pasaporte original (válido 6+ meses), formulario impreso y firmado, foto tipo carnet, invitación turística, seguro médico, y el pago de tasas consulares (varía según país y tipo de visa, generalmente 35–80 €).',
  },
  {
    'num': '4',
    'title': 'Presentar en el Consulado o Centro de Visados',
    'body':
        'En muchos países existe un VFS Global o ILS (centros de visados autorizados). Busca el centro más cercano a tu ciudad. Agenda la cita con tiempo. En temporada alta las citas pueden estar ocupadas por semanas.',
  },
  {
    'num': '5',
    'title': 'Esperar y recoger',
    'body':
        'Una vez aprobada, la visa se pega directamente en tu pasaporte. Revisa bien todos los datos al recibirla: fechas de entrada/salida, tipo de visa y número de entradas permitidas.',
  },
];

// ─────────────────────────────────────────────
// APPS IMPRESCINDIBLES
// ─────────────────────────────────────────────
const List<Map<String, String>> essentialApps = [
  {
    'icon': '🗺️',
    'name': 'Yandex Maps',
    'desc': 'Mejor que Google Maps en Rusia. Funciona offline.',
  },
  {
    'icon': '🚕',
    'name': 'Yandex Taxi',
    'desc': 'Uber funciona asociado a Yandex. Barato y fiable.',
  },
  {
    'icon': '🚇',
    'name': 'Metro de Moscú / SPb',
    'desc': 'Apps oficiales del metro. Esenciales para moverte.',
  },
  {
    'icon': '🌐',
    'name': 'Yandex Translate',
    'desc': 'Descarga el paquete de ruso offline. Usa la cámara.',
  },
  {
    'icon': '📱',
    'name': 'VPN (antes de llegar)',
    'desc': 'Algunas apps occidentales requieren VPN en Rusia.',
  },
  {
    'icon': '💬',
    'name': 'Telegram',
    'desc': 'La app de mensajería más usada en Rusia. Instálala.',
  },
];

// ─────────────────────────────────────────────
// CHECKLIST FINAL
// ─────────────────────────────────────────────
const List<Map<String, String>> checklistItems = [
  {'cat': '📄 Documentos', 'item': 'Pasaporte vigente (mín. 6 meses de validez)'},
  {'cat': '📄 Documentos', 'item': 'Visa rusa tramitada y pegada en el pasaporte'},
  {'cat': '📄 Documentos', 'item': 'Itinerario de vuelos impreso y en el móvil'},
  {'cat': '📄 Documentos', 'item': 'Confirmación de hotel impresa (para inmigración)'},
  {'cat': '📄 Documentos', 'item': 'Seguro médico de viaje impreso (¡obligatorio!)'},
  {'cat': '📄 Documentos', 'item': 'Fotocopias del pasaporte y visa por separado'},
  {'cat': '💰 Dinero', 'item': 'Efectivo en euros o dólares (billetes nuevos y sin marcas)'},
  {'cat': '💰 Dinero', 'item': 'Dinero repartido en diferentes lugares (bolso, maleta, cinturón)'},
  {'cat': '🏥 Salud', 'item': 'Botiquín básico (analgésicos, antidiarreicos, tiritas)'},
  {'cat': '🏥 Salud', 'item': 'Medicamentos personales con receta médica original'},
  {'cat': '🔌 Tecnología', 'item': 'Adaptador de enchufe europeo (tipo C/F, 220 V)'},
  {'cat': '🔌 Tecnología', 'item': 'Power bank cargado (el frío agota las baterías)'},
  {'cat': '🔌 Tecnología', 'item': 'Apps descargadas: Yandex Maps, Yandex Taxi, Translate'},
  {'cat': '🔌 Tecnología', 'item': 'Paquete de idioma ruso descargado offline'},
  {'cat': '👔 Equipaje', 'item': 'Ropa adecuada para la estación del año'},
  {'cat': '👔 Equipaje', 'item': 'Calzado impermeable con suela antideslizante (invierno)'},
  {'cat': '👔 Equipaje', 'item': 'Datos del consulado/embajada del país en Rusia anotados'},
];

// ─────────────────────────────────────────────
// TIPS DE DINERO
// ─────────────────────────────────────────────
const List<List<String>> moneyTips = [
  ['💵', 'Moneda recomendada para llevar', 'Euros o dólares en billetes nuevos, sin roturas, arrugas ni marcas. Los bancos rusos rechazan billetes deteriorados. Lleva distintos valores (no solo billetes grandes).'],
  ['🏦', 'Dónde cambiar en Rusia', 'Solo en bancos oficiales o casas de cambio autorizadas (обмен валюты — obmen valyuty). Nunca en la calle. Guarda el recibo del cambio.'],
  ['💰', '¿Cuánto llevar?', 'Depende de la duración y estilo de viaje. Estimación orientativa: 50–100 € diarios para turismo estándar en Moscú o SPb (alojamiento aparte).'],
  ['🔒', 'Reparte el efectivo', 'No lleves todo el dinero en el mismo lugar. Distribuye entre maleta facturada, bolso de mano y, si tienes, un cinturón de viaje bajo la ropa.'],
];

// ─────────────────────────────────────────────
// OPCIONES DE SIM
// ─────────────────────────────────────────────
const List<List<String>> simOptions = [
  ['💰', 'Roaming de tu operadora', 'Caro y a veces limitado. Útil solo como backup de emergencia. Avisa a tu operadora antes de viajar para saber las tarifas exactas.'],
  ['🌐', 'eSIM (recomendado)', 'Compra una eSIM antes de salir (Airalo, Holafly). Tendrás internet desde el momento del aterrizaje sin buscar una tienda. Ideal si tu móvil es compatible.'],
  ['📱', 'SIM local en Rusia', 'Los operadores MTS, Beeline y Megafon tienen stands en los aeropuertos. Barato y con buena cobertura. Necesitarás tu pasaporte para la compra.'],
];

// ─────────────────────────────────────────────
// ARTÍCULOS OCULTOS DEL EQUIPAJE
// ─────────────────────────────────────────────
const List<List<String>> hiddenItems = [
  ['🔋', 'Power bank grande (20.000+ mAh)', 'El frío extremo agota la batería del móvil en horas. Saldrás mucho y necesitas teléfono para el mapa, el taxi y la traducción.'],
  ['📄', 'Fotocopias de documentos', 'Lleva copias físicas del pasaporte y la visa por separado de los originales. También guarda copias digitales en la nube (Google Drive o similar).'],
  ['🔌', 'Adaptador universal', 'Enchufes tipo C/F europeo, 220 V. La mayoría de cargadores modernos son compatibles, pero necesitas el adaptador físico.'],
  ['💧', 'Botella de agua reutilizable', 'El agua del grifo en Moscú y SPb no es recomendable para beber directamente. Necesitarás reponer agua constantemente.'],
  ['📸', 'Batería de repuesto para cámara', 'Si viajas en invierno, el frío drena también las baterías de las cámaras.'],
];