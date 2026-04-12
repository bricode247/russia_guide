// lib/data/chapter5/chapter5_data.dart

// ═══════════════════════════════════════════════════════════
// BLOQUE 1 – PREPARACIÓN Y CONTEXTO
// ═══════════════════════════════════════════════════════════

const String ch5PrepIntro =
    'Ya pasaste migración y aduanas. Ahora estás en zona pública del aeropuerto '
    'y te enfrentas a una realidad crítica: sin internet móvil ruso no podrás '
    'pedir un taxi, contactar a quien te espera, ni acceder a los mapas. '
    'Comprarte una SIM en el aeropuerto es la primera decisión inteligente '
    'que debes tomar antes de salir al exterior.';

const String ch5OperatorsIntro =
    'En Rusia existen tres grandes operadores nacionales para residentes y '
    'visitantes de larga estancia. Cada uno tiene sus puntos fuertes según '
    'dónde vayas a vivir y cómo uses el móvil:';

// [operador, cobertura, recarga, soporte EN, calidad app, mejor para]
const List<List<String>> ch5OperatorsTable = [
  ['MTS', 'Excelente en Moscú y SPb', 'Fácil (app, web, tiendas)', 'Básico (chat)', '⭐⭐⭐⭐⭐', 'Moscú / SPb'],
  ['Megafon', 'Muy buena en todo el país', 'App sólida, SBP', 'Limitado', '⭐⭐⭐⭐', 'Viajes al interior'],
  ['Tele2', 'Buena en regiones', 'Sencilla, efectivo OK', 'No', '⭐⭐⭐', 'Regiones / bajo coste'],
];

const String ch5DocIntro =
    'Antes de acercarte al mostrador, prepara los documentos que el vendedor '
    'te pedirá. Sin ellos no podrán activar la SIM (es requisito legal en Rusia):';

const List<List<String>> ch5DocItems = [
  ['🛂', 'Pasaporte original', 'El vendedor escaneará la página con tu foto y datos personales. No vale fotocopia.'],
  ['📋', 'Visa vigente', 'La muestras junto al pasaporte. Solo aplica si no eres ciudadano de la CEI.'],
  ['📱', 'IMEI de tu teléfono', 'Márcalo ahora: *#06# en el teclado de llamadas. Anota los dos números que aparezcan.'],
  ['📄', 'Registro (si ya lo tienes)', 'No es obligatorio en el aeropuerto, pero acelera el proceso con algunos operadores.'],
];

const String ch5RecommendationMoscow =
    '🏙️ Solo en Moscú o San Petersburgo: MTS ofrece la mejor cobertura 4G/5G '
    'en metro, centros comerciales y zonas residenciales. Su app es la más '
    'completa y tiene soporte por chat.';

const String ch5RecommendationRegions =
    '🗺️ Viajes al interior de Rusia: Megafon tiene la red más extensa fuera '
    'de las grandes ciudades. Ideal si vas a ciudades como Ekaterimburgo, '
    'Novosibirsk o Kazán.';

// ═══════════════════════════════════════════════════════════
// BLOQUE 2 – COMPRA DE LA SIM
// ═══════════════════════════════════════════════════════════

const String ch5PurchaseIntro =
    'Los tres aeropuertos principales de Moscú tienen puntos de venta de los '
    'tres operadores. Los quioscos suelen estar en la zona de llegadas '
    'internacionales, nada más pasar la puerta de salida de aduanas. '
    'Busca las letras МТС (azul), Мегафон (verde) o Tele2 (negro y blanco).';

const List<List<String>> ch5AirportLocations = [
  ['✈️', 'SVO – Sheremétevo', 'Terminal D, E y F: junto a la salida de llegadas, entre los puestos de cambio de moneda y las oficinas de taxi.'],
  ['✈️', 'DME – Domodédovo', 'Planta baja de llegadas internacionales, zona central antes de los torniquetes de transporte.'],
  ['✈️', 'VKO – Vnúkovo', 'Pasillo principal de llegadas, lado derecho al salir de aduanas. Suelen estar los tres operadores juntos.'],
];

// [transliteración, cirílico, significado]
const List<List<String>> ch5UsefulPhrases = [
  ['Zdravstvuyte, mozhno kupit SIM-kartu?', 'Здравствуйте, можно купить СИМ-карту?', '¿Hola, puedo comprar una SIM?'],
  ['Mne nuzhna SIM dlya interneta', 'Мне нужна СИМ для интернета', 'Necesito una SIM para internet'],
  ['Kakoy tarif luchshe dlya zhiteley?', 'Какой тариф лучше для жителей?', '¿Qué tarifa es mejor para residentes?'],
  ['Skolko stoit podklyucheniye?', 'Сколько стоит подключение?', '¿Cuánto cuesta la conexión?'],
  ['Mozhno nomer zapisat?', 'Можно номер записать?', '¿Puede escribirme el número?'],
  ['Mne nuzhna kvitantsiya', 'Мне нужна квитанция', 'Necesito el recibo/factura'],
];

const List<List<String>> ch5PurchaseSteps = [
  ['1', 'Muestra tu pasaporte', 'Dáselo al vendedor. Escaneará la página principal. Es obligatorio.'],
  ['2', 'Elige el plan de residente', 'Pide tarifas para "zhiteli" (жители = residentes). Incluyen datos mensuales grandes (de 30 GB a ilimitados).'],
  ['3', 'Confirma que la SIM está activada', 'Antes de pagar, pide que inserten la SIM y verifiquen que hay señal con datos activos.'],
  ['4', 'Anota tu número', 'Pide que lo escriban en papel. Lo necesitarás para registrar la app del operador.'],
  ['5', 'Exige el recibo', 'Guarda el recibo físico. Es tu contrato y lo necesitarás si hay problemas futuros.'],
];

const List<List<String>> ch5CommonErrors = [
  ['❌', 'Comprar el paquete turista', 'Las tarifas turistas caducan en 7-30 días y son más caras por MB. Especifica siempre que buscas tarifa de residente.'],
  ['❌', 'No verificar cobertura antes de pagar', 'Activa los datos en el mostrador mismo y abre Google Maps para confirmar que hay señal.'],
  ['❌', 'No pedir factura', 'Sin recibo no podrás reclamar si el operador no activa el servicio o te cobra de más.'],
  ['❌', 'Comprar SIM de revendedores en la calle', 'Solo en puntos de venta oficiales. Los revendedores a veces venden SIMs ya activadas con datos falsos.'],
];

// ═══════════════════════════════════════════════════════════
// BLOQUE 3 – ACTIVACIÓN Y PRIMER USO
// ═══════════════════════════════════════════════════════════

const String ch5ActivationIntro =
    'Una vez tienes la SIM en la mano, la activación tarda menos de 5 minutos. '
    'Sigue estos pasos según tu sistema operativo y tipo de SIM:';

const List<List<String>> ch5ActivationAndroid = [
  ['1', 'Apaga el teléfono', 'Nunca insertes ni retires la SIM con el teléfono encendido.'],
  ['2', 'Inserta la SIM', 'Usa el pin incluido en el paquete para abrir la bandeja. Fíjate en la orientación del chip.'],
  ['3', 'Enciende y espera', 'El teléfono buscará red automáticamente. Puede tardar 30-60 segundos.'],
  ['4', 'Desactiva el roaming', 'Ajustes → Conexiones → Redes móviles → Itinerancia de datos: OFF.'],
  ['5', 'Verifica el APN', 'Si no hay datos, ve a Ajustes → Redes móviles → Nombres de punto de acceso y comprueba que aparezca el APN del operador.'],
];

const List<List<String>> ch5ActivationIOS = [
  ['1', 'Usa el pin del paquete', 'El lector SIM en iPhone está en el lateral derecho o izquierdo según modelo.'],
  ['2', 'Inserta y enciende', 'iOS detectará la nueva SIM automáticamente y pedirá confirmar el plan de datos.'],
  ['3', 'Ajustes → Datos móviles', 'Comprueba que "Datos móviles" está activado y "Itinerancia de datos" está en OFF.'],
  ['4', 'APN manual si es necesario', 'Si no hay internet, ve a Ajustes → Datos móviles → Red de datos móviles e introduce el APN del operador.'],
];

// [operador, APN, usuario, contraseña]
const List<List<String>> ch5ApnData = [
  ['MTS', 'internet.mts.ru', 'mts', 'mts'],
  ['Megafon', 'internet', '', ''],
  ['Tele2', 'internet.tele2.ru', '', ''],
];

const List<List<String>> ch5TroubleshootingItems = [
  ['🔄', 'Sin señal tras insertar', 'Reinicia el teléfono. Si persiste, pide al vendedor que verifique la SIM en el mostrador.'],
  ['📶', 'Señal pero sin datos', 'Comprueba el APN. Llama al número del operador (gratis desde tu SIM) para activar el servicio.'],
  ['🌐', 'Datos lentos (E/2G)', 'El plan puede no incluir 4G. Revisa el contrato o llama al soporte.'],
  ['📵', 'SIM no detectada', 'Puede ser incompatibilidad de banda. Pide al operador una SIM de formato diferente (nano/micro/estándar).'],
];


// ==================================================
// Tutorial steps para el carrusel de imágenes
// ==================================================

// En lib/data/chapter5/chapter5_data.dart

class CarouselItem {
  final String imagePath;
  final String title;
  final String description;

  CarouselItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// Lista de elementos del carrusel para MTS (ejemplo con placeholders)
final List<CarouselItem> mtsCarouselItems = [
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step01_mts_screen_movil.jpg',
    title: 'Buscar la tienda de apps que uses en tu teléfono',
    description: 'Abrir "Google Play Store", es la que usaremos para nuestro tutorial, proximamente lanzaremos el de "App Store" de iOS, pero el proceso es similar.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step02_mts_principal_screen_play_store.jpg',
    title: 'Buscar la app "Мой МТС" (My MTS) en la Play Store',
    description: 'Toca en la pestaña que dice "Buscar" (lupa) que se encuentra en la parte inferior de la pantalla.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step03_mts_search_play_store.jpg',
    title: 'Escribir "Мой МТС" en la barra de búsqueda',
    description: 'En la barra de búsqueda en la parte superior de la pantalla escribe "Мой МТС" en nuestro caso con solo escribir "Мой" ya aparecerá en la segunda opción, toca en ella.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step04_mts_play_store.jpg',
    title: 'Seleccionar la app oficial de MTS',
    description: 'Asegúrate de que la app es la oficial, debe tener el logo rojo con las letras "МТС". Toca en "Установить" (Instalar).',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step05_mts_install_app.jpg',
    title: 'Abrir la app "Мой МТС" (My MTS)',
    description: 'Una vez instalada, abre la app tocando en el botón "Открыть" (Abrir).',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step06_mts_first_screen.jpg',
    title: 'Pantalla de bienvenida de la app',
    description: 'Al abrir la app por primera vez, verás una pantalla de bienvenida. Toca en "Войти" (Iniciar sesión) para comenzar el proceso de registro.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step07_mts_enter_phone.jpg',
    title: 'Ingresar tu número de teléfono ruso',
    description: 'En la pantalla de inicio de sesión, ingresa tu número de teléfono ruso que te dieron al comprar la SIM. Asegúrate de incluir el código de país +7.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step08_mts_entered_phone.jpg',
    title: 'Número ingresado correctamente y tocar en Далее (Siguiente)',
    description: 'Después de ingresar tu número, toca en el botón "Далее" (Siguiente) para continuar con el proceso de verificación. Recibirás un SMS con un código de verificación en tu teléfono ruso.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step09_mts_sms_code.jpg',
    title: 'Localizar el código de verificación recibido por SMS',
    description: 'Revisa tu teléfono para encontrar el SMS con el código de verificación.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step10_mts_ingresed_code.jpg',
    title: 'Ingresar el código de verificación en la app',
    description: 'En la app, ingresa el código de verificación que recibiste por SMS y toca en "Подтвердить" (Confirmar) si es necesario para completar el proceso de inicio de sesión.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step11_mts_main_screen.jpg',
    title: 'Pantalla principal de la app Мой МТС',
    description: 'En la pantalla principal, verás la sección que muestra tu saldo actual. Toca en "Пополнить" (Recargar) para agregar saldo a tu cuenta.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step12_mts_check_balance.jpg',
    title: 'Recargar saldo',
    description: 'En la sección de recarga, puedes elegir entre diferentes métodos de pago. Nosotros recomendamos usar tarjeta bancaria para una recarga rápida y segura. Toca la segunda opción que dice "СБП, Банковская карта, Sber Pay"',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step13_mts_recharge_form.jpg',
    title: 'Método de recarga con tarjeta bancaria',
    description: 'En la sección de recarga con tarjeta bancaria, ingresa el monto que deseas recargar y luego toca en "Оплатить" (Pagar) para proceder al pago. En tu primera vez, es posible que debas ingresar los datos de tu tarjeta bancaria, pero luego se guardarán para futuras recargas. Nosotros no recargaremos, pero al ingresar el monto y tocar en pagar, se deberá realizar el pago automáticamente. En este tutorial tocaremos la x para salir de esta sección y regresar a la pantalla principal de la app.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step14_mts_main_screen.jpg',
    title: 'De regreso a la pantalla principal',
    description: 'De regreso a la pantalla principal, tocamos en подключенные услуги и сервисы (servicios conectados)',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step15_mts_services.jpg',
    title: 'Servicios conectados',
    description: 'En esta sección puedes ver los servicios adicionales que tienes activos en tu línea. Es importante revisar esta sección para asegurarte de que no tienes servicios innecesarios o de pago que puedan consumir tu saldo sin que te des cuenta.',
  ),
  CarouselItem(
    imagePath: 'assets/images/chapter5/mts/step16_mts_support_screen.jpg',
    title: 'Soporte al cliente',
    description: 'Si necesitas ayuda adicional, puedes acceder a la sección de soporte al cliente tocando en la parte inferior de la pantalla donde dice "Поддержка". Aquí podrás encontrar opciones para contactar al soporte, como chat en vivo o llamadas gratuitas desde tu línea МТS. Es recomendable usar el chat para consultas rápidas y el teléfono para problemas más complejos.',
  ),
];

// Datos de los tres operadores (para la sección de recursos)
const List<List<String>> ch5OperatorsResources = [
  ['МТС (MTS)', '0890', '+7 800 250-08-90', 'mts.ru'],
  ['Мегафон (Megafon)', '0500', '+7 800 550-05-00', 'megafon.ru'],
  ['Tele2', '611', '+7 800 555-06-11', 'tele2.ru'],
];

const String ch5LostSimTips =
    '🔐  Si pierdes la SIM o te roban el móvil: llama inmediatamente al número '
    'de soporte del operador desde cualquier teléfono. Pide bloquear la línea '
    '("заблокировать номер"). Con tu pasaporte puedes recuperar el número '
    'en cualquier tienda oficial del operador dentro de Rusia.';

// ═══════════════════════════════════════════════════════════
// BLOQUE 5 – VALOR AÑADIDO PREMIUM
// ═══════════════════════════════════════════════════════════

const List<List<String>> ch5AdvancedErrors = [
  ['⚠️', 'Comprar SIM sin señal 4G activa', 'Siempre pide al vendedor que active los datos y muestre la barra de señal 4G antes de pagar y marcharte.'],
  ['⚠️', 'No registrar el número en la app inmediatamente', 'Si esperas días, olvidarás el número y no podrás entrar en la app. Regístrala en el aeropuerto mientras tienes WiFi.'],
  ['⚠️', 'Creer que las apps funcionan sin registro', 'Las apps de МТС, Megafon y Tele2 solo muestran el saldo si estás logueado. El login requiere el número y un SMS.'],
  ['⚠️', 'Ignorar el ciclo de facturación', 'Muchas tarifas cobran el paquete mensual el mismo día de activación. Si recargas tarde, se suspende el servicio.'],
];

const List<List<String>> ch5IncompatiblePhone = [
  ['📡', '¿Tu teléfono no es compatible?', 'Si el móvil es de EE.UU. o algunas marcas chinas, puede no soportar las bandas rusas (1800/2100/2600 MHz para 4G). Comprueba en el manual o en "Ajustes → Acerca del dispositivo → Información de banda".'],
  ['🔧', 'Solución inmediata', 'En el aeropuerto existen tiendas de electrónica (DNS, М.Видео) donde puedes comprar un smartphone básico ruso por 3.000-5.000 rublos que funcionará perfectamente con cualquier operador local.'],
  ['📲', 'Opción eSIM', 'MTS y Megafon ofrecen eSIM para dispositivos compatibles (iPhone XS o posterior, Samsung Galaxy S20 o posterior). Pregunta en el mostrador directamente.'],
];

const List<List<String>> ch5RechargeWithoutCard = [
  ['🏪', 'Tiendas del operador', 'En cualquier tienda oficial МТС, Мегафон o Tele2 puedes pagar en efectivo. Di tu número y el importe.'],
  ['🖥️', 'Terminales Qiwi / Элекснет', 'Son máquinas de autopago (quioscos electrónicos) en centros comerciales, metro y tiendas 24h. Selecciona el operador, introduce tu número y paga con billetes.'],
  ['💳', 'SBP (Sistema de Pagos Rápidos)', 'Si abres una cuenta bancaria rusa (Tinkoff, Sber) podrás recargar vía transferencia SBP instantánea desde la app del operador.'],
  ['👥', 'Transferencia entre МТС', 'Desde la app МТС puedes transferir saldo a otro número МТС. Útil si un conocido tiene saldo y te lo puede pasar.'],
];

// ═══════════════════════════════════════════════════════════
// CHECKLIST FINAL
// ═══════════════════════════════════════════════════════════

const List<String> ch5ChecklistItems = [
  'Tengo mi pasaporte y visa a mano',
  'He anotado el IMEI de mi teléfono (*#06#)',
  'He elegido operador (MTS / Megafon / Tele2)',
  'He comprado la SIM y recibido el recibo',
  'He verificado señal 4G activa antes de pagar',
  'He anotado mi número ruso en papel',
  'He insertado la SIM y configurado el APN',
  'He descargado e iniciado sesión en la app del operador',
  'He recargado saldo suficiente para los primeros días',
  'Estoy listo para salir del aeropuerto conectado',
];