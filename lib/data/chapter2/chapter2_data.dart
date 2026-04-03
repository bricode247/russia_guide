// lib/data/chapter2/chapter2_data.dart

// ─────────────────────────────────────────────
// PASOS DE FACTURACIÓN
// ─────────────────────────────────────────────
const List<Map<String, String>> checkInSteps = [
  {
    'num': '1',
    'title': 'Busca el mostrador de tu aerolínea',
    'body':
        'Los mostradores están organizados por aerolínea y vuelo. Busca las pantallas de información o el código de tu vuelo. En aeropuertos grandes puede haber varios terminales — confirma en cuál está tu vuelo antes de ir.',
  },
  {
    'num': '2',
    'title': 'Haz fila en el mostrador correcto',
    'body':
        'Hay mostradores para facturación estándar y, en algunos casos, para pasajeros con equipaje especial o con discapacidad. Si ya hiciste el check-in online, busca los mostradores de "Drop Bag" — solo dejas la maleta y listo.',
  },
  {
    'num': '3',
    'title': 'Entrega los documentos',
    'body':
        'El agente pedirá pasaporte original y, en la mayoría de casos para vuelos a Rusia, también verificará que tengas la visa. Ten el itinerario del vuelo a mano. No los guardes en el fondo de la mochila.',
  },
  {
    'num': '4',
    'title': 'Pesa y factura la maleta',
    'body':
        'La maleta se pondrá en la cinta. El agente imprime la etiqueta y la pegará. Guarda siempre el recibo de equipaje facturado — es tu comprobante si hay pérdida o daño.',
  },
  {
    'num': '5',
    'title': 'Recibe tu tarjeta de embarque',
    'body':
        'Te entregarán la tarjeta de embarque (o la verificarán si ya tienes el boarding pass digital). Revisa que el nombre, número de vuelo, fecha, destino y puerta sean correctos antes de alejarte del mostrador.',
  },
];

// ─────────────────────────────────────────────
// LÍMITES DE EQUIPAJE COMUNES
// ─────────────────────────────────────────────
const List<Map<String, String>> luggageLimits = [
  {
    'icon': '🧳',
    'title': 'Maleta facturada (bodega)',
    'desc':
        'Lo más habitual es 23 kg por maleta en clase económica. Algunas aerolíneas permiten 20 kg. Superar el límite implica un cargo extra — a veces muy caro. Pesa la maleta en casa antes de salir.',
  },
  {
    'icon': '🎒',
    'title': 'Equipaje de mano (cabina)',
    'desc':
        'Generalmente hasta 10 kg y con dimensiones máximas de 55×40×20 cm (varía por aerolínea). Siempre cabe en el compartimento superior. Comprueba el límite exacto de tu aerolínea.',
  },
  {
    'icon': '👜',
    'title': 'Artículo personal',
    'body':
        'Bolso pequeño, mochila de ordenador o bolsa de compras. Debe caber bajo el asiento delantero. Sin límite de peso explícito, pero tiene que ser razonable.',
  },
];

// ─────────────────────────────────────────────
// OBJETOS PROHIBIDOS EN CABINA
// ─────────────────────────────────────────────
const List<List<String>> prohibitedCabinItems = [
  ['🔪', 'Cuchillos y objetos punzantes', 'Tijeras de más de 6 cm, navajas, cortaúñas grandes'],
  ['💧', 'Líquidos >100 ml', 'Agua, perfumes, champú — solo si van en envases ≤100 ml en bolsa transparente'],
  ['🔋', 'Baterías de litio grandes sin declarar', 'Power banks >100 Wh deben ir en cabina (¡no en bodega!), declarados al check-in'],
  ['🧪', 'Sustancias inflamables', 'Mecheros de recarga, aerosoles, pinturas'],
  ['🔫', 'Réplicas de armas', 'Aunque sean de juguete, están prohibidas en cabina'],
];

// ─────────────────────────────────────────────
// CONSEJOS DE SEGURIDAD
// ─────────────────────────────────────────────
const List<Map<String, String>> securityTips = [
  {
    'icon': '👟',
    'title': 'Lleva calzado fácil de quitar',
    'body':
        'En muchos aeropuertos pedirán que te quites los zapatos para pasarlos por el escáner. Los cordones eternos retrasan a todos. Usa calzado sin cordones o que se quite rápido.',
  },
  {
    'icon': '💻',
    'title': 'Saca el ordenador y electrónicos grandes',
    'body':
        'Portátiles, tablets y cámaras réflex deben salir de la mochila y pasar en bandeja separada. Si lo dejas dentro, te harán repetir el proceso.',
  },
  {
    'icon': '🧥',
    'title': 'Quítate la chaqueta y el cinturón',
    'body':
        'Antes de llegar al arco, deja chaqueta, cinturón, llaves y monedas en la bandeja. Hazlo con calma antes de llegar — no en el último momento bloqueando la cinta.',
  },
  {
    'icon': '💧',
    'title': 'Bolsa de líquidos lista para sacar',
    'body':
        'La bolsa ZIP transparente con tus envases de ≤100 ml debe estar accesible, no enterrada. Es uno de los motivos más comunes de retraso en seguridad.',
  },
  {
    'icon': '📱',
    'title': 'Teléfono en el bolsillo de la mochila',
    'body':
        'No en el bolsillo del pantalón. Así no tendrás que sacarlo a último momento y evitarás que suene el arco por error.',
  },
];

// ─────────────────────────────────────────────
// RECOMENDACIONES DUTY FREE
// ─────────────────────────────────────────────
const List<Map<String, String>> dutyFreeTips = [
  {
    'icon': '🚰',
    'title': 'Compra agua DESPUÉS del control',
    'body':
        'No puedes pasar agua comprada antes del control de seguridad (por la norma de >100 ml). Una vez en la zona de embarque, puedes comprar botellas normales sin restricción.',
  },
  {
    'icon': '💶',
    'title': 'Precios inflados: sé selectivo',
    'body':
        'El duty free no siempre es más barato, especialmente en comida. Las tiendas de perfumería y alcohol suelen ofrecer buenos precios; los snacks y gadgets, no tanto.',
  },
  {
    'icon': '⏰',
    'title': 'No te pierdas en las tiendas',
    'body':
        'Es fácil perder la noción del tiempo en el duty free. Pon una alarma 45 minutos antes del embarque para ir a la puerta con tiempo.',
  },
];

// ─────────────────────────────────────────────
// CHECKLIST AEROPUERTO DE SALIDA
// ─────────────────────────────────────────────
const List<Map<String, String>> checklistItems = [
  {'cat': '📄 Documentos a mano', 'item': 'Pasaporte original accesible (no en la maleta facturada)'},
  {'cat': '📄 Documentos a mano', 'item': 'Visa rusa impresa o digital visible'},
  {'cat': '📄 Documentos a mano', 'item': 'Tarjeta de embarque (impresa o en el móvil)'},
  {'cat': '📄 Documentos a mano', 'item': 'Confirmación de hotel (para inmigración en destino)'},
  {'cat': '🧳 Equipaje', 'item': 'Maleta dentro del límite de peso (verificado en casa)'},
  {'cat': '🧳 Equipaje', 'item': 'Bolsa ZIP con líquidos ≤100 ml lista para sacar en seguridad'},
  {'cat': '🧳 Equipaje', 'item': 'Sin objetos prohibidos en equipaje de mano'},
  {'cat': '⏱️ Logística', 'item': 'Llegada al aeropuerto con 3–4 horas de antelación'},
  {'cat': '⏱️ Logística', 'item': 'Número de puerta de embarque confirmada en las pantallas'},
  {'cat': '🔋 Tecnología', 'item': 'Móvil y dispositivos cargados antes de entrar al avión'},
];