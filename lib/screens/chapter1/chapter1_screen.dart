// lib/screens/chapter1/chapter1_screen.dart
import 'package:flutter/material.dart';
import '../../data/chapter1/chapter1_data.dart';
import '../../data/chapter1/chapter1_quizzes.dart';
import '../../widgets/photo_placeholder.dart'; // Nuestro placeholder
import '../../widgets/quiz_card.dart'; // Nuestro quiz card
import '../../widgets/section_header.dart'; // Nuestro header de sección
import '../../widgets/chapter1/season_card.dart';
import '../../widgets/chapter1/visa_type_card.dart';
import '../../widgets/chapter1/process_step.dart';
import '../../widgets/chapter1/three_layers_widget.dart';
import '../../widgets/chapter1/checklist_section.dart';
import '../../data/chapters_repository.dart';
import '../../themes/app_colors.dart';
import '../../models/chapter_model.dart';
import '../../widgets/next_chapter_button.dart';

class Chapter1Screen extends StatelessWidget {
  final Chapter chapter;
  const Chapter1Screen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo ${chapter.number}: ${chapter.title}'),
        backgroundColor: AppColors.azulPrimario,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final previous = ChaptersRepository.getPreviousChapter(chapter);
            if (previous != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChaptersRepository.getScreenForChapter(previous),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               // ── ENCABEZADO ──
              _Ch1Header(),
              const SizedBox(height: 20),
 
              // ── FOTO 1: Panorámica invernal de Moscú / San Petersburgo ──
              PhotoPlaceholder(
                label: '📸 FOTO: Rusia en invierno — Plaza Roja nevada o San Petersburgo bajo la nieve',
                suggestion: 'Panorámica invernal que transmita la magnitud y belleza del destino.',
                height: 210,
              ),
              const SizedBox(height: 40),

              // Sección 1: Introducción
              SectionHeader(title: 'La gran aventura empieza en casa', emoji: '🏠'),
              _IntroContent(),
              const SizedBox(height: 40),

              // Sección 2: Cuándo ir
              SectionHeader(title: '¿Cuándo ir? Las 4 caras de Rusia', emoji: '📅'),
              _SeasonsContent(),
              const SizedBox(height: 24),

              // ── FOTO 2: Noches Blancas de San Petersburgo ──
              PhotoPlaceholder(
                label: '📸 FOTO: Noches Blancas — San Petersburgo en junio a medianoche',
                suggestion: 'Cielo claro a las 11 PM sobre los canales o la Perspectiva Nevsky.',
                height: 190,
              ),
              const SizedBox(height: 32),

              // Quiz 1: Invierno
              QuizCard(quiz: quizWinter),
              const SizedBox(height: 40),

              // ── SECCIÓN 3: PASAPORTE Y VISA ──
              SectionHeader(title: 'Pasaporte y visa: el punto más crítico', emoji: '🛂'),
              _VisaContent(),
              const SizedBox(height: 24),

              // ── FOTO 3: Consulado / Embajada rusa ──
              PhotoPlaceholder(label: '📸 FOTO: Embajada o Consulado de Rusia — Documentos de visa',
                suggestion: 'Exterior de una embajada rusa o imagen de pasaporte con visa estampada.',
                height: 180,
              ),
              const SizedBox(height: 32),

              // ── QUIZ 2: PASAPORTE ──
              QuizCard(quiz: quizPassport),
              const SizedBox(height: 40),

              // Sección 4: Vuelos y alojamiento
              SectionHeader(title: 'Vuelos y alojamiento: la logística', emoji: '✈️'),
              _FlightsContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 5: DINERO (CRÍTICO) ──
              SectionHeader(title: '💳 Dinero: lo que nadie te dice hasta que llegas', emoji: '💰'),
              _MoneyContent(),
              const SizedBox(height: 32),

              // Quiz 3: Rublo
              QuizCard(quiz: quizMoney),
              const SizedBox(height: 40),

              // ── SECCIÓN 6: SALUD ──
              SectionHeader(title: 'Salud: botiquín y seguros', emoji: '🏥'),
              _HealthContent(),
              const SizedBox(height: 32),

              // Quiz 4: Farmacia
              QuizCard(quiz: quizPharmacy),
              const SizedBox(height: 40),

              // Sección 7: Tecnología
              SectionHeader(title: 'Tecnología: tus aliados digitales', emoji: '📱'),
              _TechContent(),
              const SizedBox(height: 40),

              // Sección 8: Equipaje
              SectionHeader(title: 'Equipaje: la ciencia de empacar para Rusia', emoji: '🧳'),
              _PackingContent(),
              const SizedBox(height: 24),

              // Foto 4: Ropa de invierno
              PhotoPlaceholder(
                label: '📸 FOTO: Capas de ropa de invierno — Térmica, polar y parka exterior',
                suggestion: 'Ropa invernal bien equipada. Puede ser persona en calle nevada o tienda.',
                height: 190,
              ),
              const SizedBox(height: 40),

               // Sección 9: Checklist final
              SectionHeader(title: 'Checklist final: ¿listo para salir?', emoji: '✅'),
              ChecklistSection(),
              const SizedBox(height: 32),

              // Quiz 5: Aeropuerto
              QuizCard(quiz: quizAirport),
              const SizedBox(height: 40),

              // Cierre del capítulo
              _ChapterClosingCard(),

              // Botón de siguiente capítulo
              const SizedBox(height: 40),
              NextChapterButton(currentChapter: chapter),
              const SizedBox(height: 40),
            ]
          )
        )
      )
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ENCABEZADO DEL CAPÍTULO
// ═══════════════════════════════════════════════════════════
class _Ch1Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFD1170E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'CAPÍTULO 1',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Desde tu casa\nhasta el aeropuerto',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Todo lo que necesitas preparar antes de que empiece la aventura.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Container(width: 48, height: 2, color: Colors.grey[300]),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 1: INTRODUCCIÓN
// ═══════════════════════════════════════════════════════════
class _IntroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          '¿Tomaste la decisión? ¿Rusia? Excelente. Ahora agárrate, porque esto no va a ser como organizar un fin de semana en la playa. Rusia requiere preparación. Pero no te asustes: para eso está esta guía.',
        ),
        const SizedBox(height: 12),
        _bodyText(
          'La diferencia entre un viaje increíble y un desastre logístico suele medirse en semanas de anticipación. La visa sola puede tardar de 7 a 20 días hábiles. El pasaporte puede estar vencido. El efectivo hay que conseguirlo antes de llegar. Sí, hay mucho que hacer — pero si sigues este capítulo paso a paso, llegarás al aeropuerto con todo bajo control.',
        ),
        const SizedBox(height: 12),
        _warningBox(
          '⚠️  Este capítulo cubre todo desde que decides viajar hasta que llegas al aeropuerto de tu país. El Capítulo 2 cubrirá lo que sucede dentro del aeropuerto antes de embarcar.',
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 2: ESTACIONES
// ═══════════════════════════════════════════════════════════
class _SeasonsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Esta no es una decisión menor. La época del año en que vayas determinará tu ropa, tu presupuesto, las experiencias disponibles y hasta el estado de ánimo del viaje. Rusia en cada estación es casi un país diferente.',
        ),
        const SizedBox(height: 20),
        ...seasons.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: SeasonCard(season: s),
            )),
        const SizedBox(height: 8),
        _tipBox(
          '💡  Recomendación: Si es tu primer viaje, el verano (junio–agosto) es la entrada más suave. Clima agradable, días larguísimos y todo está abierto. Si buscas aventura auténtica y un Rusia de postal, el invierno te cambiará la vida.',
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 3: VISA Y PASAPORTE
// ═══════════════════════════════════════════════════════════
class _VisaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Aquí viene la parte que la mayoría de los viajeros subestima. La visa rusa no es complicada si la planificas con tiempo, pero puede arruinar tu viaje si la dejas para último momento.',
        ),
        const SizedBox(height: 20),
 
        // PASAPORTE
        _sectionSubtitle('📘 El pasaporte'),
        const SizedBox(height: 10),
        _warningBox(
          '⚠️  Tu pasaporte debe tener al menos 6 meses de validez a partir de la fecha de ENTRADA a Rusia, no de salida. Revísalo ahora mismo. Si necesitas renovarlo, hazlo con meses de antelación.',
        ),
        const SizedBox(height: 16),
 
        // VISA
        _sectionSubtitle('🔖 ¿Necesito visa?'),
        const SizedBox(height: 10),
        _bodyText(
          'La mayoría de los ciudadanos de América Latina, España y gran parte del mundo necesitan visa para entrar a Rusia. Hay excepciones para algunos países con acuerdos específicos, pero siempre verifica con fuentes oficiales.',
        ),
        const SizedBox(height: 10),
        _tipBox(
          '💡  Fuente oficial: Consulta SIEMPRE el sitio web de la Embajada o Consulado de la Federación Rusa en tu país, o el portal del Ministerio de Asuntos Exteriores de Rusia (mid.ru). Los requisitos pueden cambiar y varían por nacionalidad.',
        ),
        const SizedBox(height: 20),
 
        // TIPOS DE VISA
        _sectionSubtitle('📋 Tipos de visa'),
        const SizedBox(height: 12),
        ...visaTypes.map((v) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: VisaTypeCard(data: v),
            )),
        const SizedBox(height: 16),
 
        // PROCESO
        _sectionSubtitle('📝 Proceso para obtener la visa'),
        const SizedBox(height: 10),
        ...visaSteps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProcessStep(
                number: step['num']!,
                title: step['title']!,
                body: step['body']!,
              ),
            )),
        const SizedBox(height: 16),
 
        // SEGURO MÉDICO
        _warningBox(
          '⚠️  SEGURO MÉDICO OBLIGATORIO: Para obtener la visa rusa es obligatorio presentar un seguro médico de viaje válido en Rusia que cubra todo el período de tu estancia. Sin este seguro, la visa no se concede. El monto mínimo de cobertura recomendado es de 30.000 €.',
        ),
        const SizedBox(height: 16),
 
        // TIEMPO
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFE6F1FB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFB5D4F4).withValues(alpha: 0.7)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '⏱️  Tiempo estimado del proceso',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF185FA5)),
              ),
              const SizedBox(height: 10),
              _timeRow('Visa estándar', '7 – 10 días hábiles'),
              _timeRow('Visa urgente (doble coste)', '3 días hábiles'),
              _timeRow('Recomendación mínima', 'Iniciar 4–6 semanas antes'),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _timeRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        Expanded(
          child: Text(label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF2C2C2A))),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF185FA5)),
        ),
      ],
    ),
  );
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 4: VUELOS Y ALOJAMIENTO
// ═══════════════════════════════════════════════════════════
class _FlightsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionSubtitle('✈️  Compra de vuelos'),
        const SizedBox(height: 10),
        _bodyText(
          'Los vuelos a Rusia se reservan principalmente en Moscú (Sheremetyevo — SVO, Domodedovo — DME, o Vnukovo — VKO) o San Petersburgo (Pulkovo — LED). Los vuelos directos existen desde varias ciudades europeas, pero si vienes de América, probablemente harás escala.',
        ),
        const SizedBox(height: 14),
        ...[
          ['🕐', 'Cuándo comprar', 'Con 2–4 meses de antelación para temporada alta (verano), 4–8 semanas para temporada baja. Los martes y miércoles suelen tener precios más bajos.'],
          ['🔍', 'Dónde buscar', 'Google Flights, Skyscanner y Kayak son los comparadores más fiables. Activa las alertas de precio para las fechas que te interesan.'],
          ['⚠️', 'Escalas y visados de tránsito', 'Cuidado: si tu escala es en un país que requiere visa de tránsito (algunos aeropuertos europeos la exigen), necesitarás tramitarla también. Verifica siempre.'],
          ['🧳', 'Equipaje', 'Revisa bien la política de equipaje de tu aerolínea. En invierno el equipo de ropa será voluminoso. Muchas veces vale la pena pagar por maleta facturada.'],
        ].map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _BulletCard(
                  icon: item[0], title: item[1], body: item[2]),
            )),
        const SizedBox(height: 20),
        _sectionSubtitle('🏨  Alojamiento'),
        const SizedBox(height: 10),
        _bodyText(
          'Booking.com y Airbnb funcionan bien para Rusia. Importante: la confirmación de tu reserva de hotel es un documento que necesitarás tanto para tramitar la visa como para rellenar la tarjeta de migración al aterrizar. Guarda siempre la copia impresa.',
        ),
        const SizedBox(height: 10),
        _tipBox(
          '💡  En temporada de verano, las ciudades populares como Moscú y San Petersburgo se agotan rápido. Reserva el alojamiento antes incluso de tramitar la visa — necesitas la confirmación para el trámite.',
        ),
      ],
    );
  }
}

class _BulletCard extends StatelessWidget {
  final String icon;
  final String title;
  final String body;
  const _BulletCard(
      {required this.icon, required this.title, required this.body});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A))),
              const SizedBox(height: 3),
              Text(body,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5F5E5A),
                      height: 1.6)),
            ],
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 5: DINERO
// ═══════════════════════════════════════════════════════════
class _MoneyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFCEBEB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF09595)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🚨 Atención: las tarjetas occidentales NO funcionan en Rusia',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFA32D2D),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Desde 2022, Visa, Mastercard y American Express han suspendido sus operaciones en Rusia debido a sanciones internacionales. Esto significa que tu tarjeta bancaria habitual — sin importar qué banco tengas — no funcionará para pagar ni en tiendas, restaurantes, ni para sacar dinero en cajeros rusos. Este es probablemente el error número 1 de los viajeros desprevenidos.',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF791F1F),
                    height: 1.6),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _sectionSubtitle('💡  La solución: efectivo'),
        const SizedBox(height: 10),
        _bodyText(
          'La forma más segura y universal de manejarse en Rusia es llevar efectivo en euros o dólares estadounidenses y cambiarlos una vez en el país. Dentro de Rusia encontrarás bancos y casas de cambio oficiales con buenos tipos de cambio.',
        ),
        const SizedBox(height: 14),
        ...moneyTips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _BulletCard(
                  icon: tip[0], title: tip[1], body: tip[2]),
            )),
        const SizedBox(height: 16),
        _tipBox(
          '💡  Opción alternativa: La tarjeta UnionPay (emitida por bancos chinos o algunos latinoamericanos) sí funciona en Rusia. También existe el sistema de pago local МИР (Mir). Infórmate en tu banco si ofrecen alguna de estas opciones antes del viaje.',
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 6: SALUD
// ═══════════════════════════════════════════════════════════
class _HealthContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionSubtitle('🏥  Seguro médico de viaje'),
        const SizedBox(height: 10),
        _bodyText(
          'Ya lo mencionamos en la sección de visa: el seguro médico NO es opcional. Es obligatorio para tramitar la visa y esencial para tu seguridad. Asegúrate de que cubra Rusia, todo el período de tu viaje, y tenga cobertura mínima de 30.000 €. Guarda siempre la póliza impresa.',
        ),
        const SizedBox(height: 20),
        _sectionSubtitle('💊  Botiquín básico de viaje'),
        const SizedBox(height: 10),
        _bodyText(
          'Las farmacias rusas (Аптека — Apteka) están bien surtidas, pero los nombres de los medicamentos son diferentes. Es mucho más fácil llevar lo básico desde casa.',
        ),
        const SizedBox(height: 12),
        _MedicineGrid(),
        const SizedBox(height: 16),
        _warningBox(
          '⚠️  Si tomas medicamentos con receta o controlados, lleva la receta médica original (idealmente traducida al inglés). Algunos medicamentos de uso común en otros países están regulados o prohibidos en Rusia. Consulta con tu médico y, si es necesario, con el Consulado ruso.',
        ),
        const SizedBox(height: 16),
        _sectionSubtitle('💉  Vacunas'),
        const SizedBox(height: 10),
        _tipBox(
          '💡  Rusia no exige vacunas obligatorias para la entrada (excepto en situaciones epidemiológicas específicas). Sin embargo, es recomendable tener al día el calendario de vacunación básico y consultar con tu médico si viajas por períodos prolongados o a zonas rurales (especialmente en verano: hay riesgo de encefalitis transmitida por garrapatas en zonas boscosas).',
        ),
      ],
    );
  }
}

class _MedicineGrid extends StatelessWidget {
  final List<Map<String, String>> _items = const [
    {'icon': '💊', 'name': 'Analgésicos', 'example': 'Ibuprofeno, Paracetamol'},
    {'icon': '🤢', 'name': 'Antidiarreicos', 'example': 'Loperamida'},
    {'icon': '🤧', 'name': 'Antihistamínicos', 'example': 'Para alergias'},
    {'icon': '🩹', 'name': 'Botiquín básico', 'example': 'Tiritas, antiséptico'},
    {'icon': '🌡️', 'name': 'Termómetro', 'example': 'Digital'},
    {'icon': '💧', 'name': 'Suero oral', 'example': 'Para hidratación'},
    {'icon': '😷', 'name': 'Mascarillas', 'example': 'Útiles en invierno'},
    {'icon': '🧴', 'name': 'Protector solar', 'example': 'Verano y nieve'},
  ];
 
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.4,
      children: _items
          .map(
            (item) => Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE0DDD5)),
              ),
              child: Row(
                children: [
                  Text(item['icon']!,
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item['name']!,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A))),
                        Text(item['example']!,
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey[500])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 7: TECNOLOGÍA
// ═══════════════════════════════════════════════════════════
class _TechContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionSubtitle('📡  Internet y SIM'),
        const SizedBox(height: 10),
        ...simOptions.map((opt) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _BulletCard(
                  icon: opt[0], title: opt[1], body: opt[2]),
            )),
        const SizedBox(height: 20),
        _sectionSubtitle('📲  Apps imprescindibles — descárgalas ANTES de volar'),
        const SizedBox(height: 12),
        ...essentialApps.map((app) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _AppRow(data: app),
            )),
        const SizedBox(height: 16),
        _sectionSubtitle('🔌  Adaptador de enchufe'),
        const SizedBox(height: 10),
        _tipBox(
          '💡  Rusia usa enchufes europeos tipo C y F (los redondos de 2 pines) a 220 V. Si vienes de América del Norte o del Sur, necesitas un adaptador y verificar que tus dispositivos soporten 220 V (la mayoría de cargadores modernos sí lo hacen — revisa la etiqueta).',
        ),
      ],
    );
  }
}

class _AppRow extends StatelessWidget {
  final Map<String, String> data;
  const _AppRow({required this.data});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0DDD5)),
      ),
      child: Row(
        children: [
          Text(data['icon']!, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['name']!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
                Text(data['desc']!,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xFF5F5E5A))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SECCIÓN 8: EQUIPAJE
// ═══════════════════════════════════════════════════════════
class _PackingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Empacar para Rusia es un arte. La clave no es llevar mucho, sino llevar lo correcto. Y lo correcto depende completamente de cuándo vayas.',
        ),
        const SizedBox(height: 20),
 
        // INVIERNO
        _sectionSubtitle('❄️  Invierno: la regla de las tres capas'),
        const SizedBox(height: 10),
        _bodyText('Esta es la regla de oro del invierno ruso. No es opcional — es supervivencia:'),
        const SizedBox(height: 12),
        ThreeLayersWidget(),
        const SizedBox(height: 12),
        _warningBox(
          '⚠️  El calzado de invierno es CRÍTICO. Necesitas botas impermeables con suela gruesa y antideslizante. Las aceras en invierno son placas de hielo. Las zapatillas deportivas normales son una invitación al accidente.',
        ),
        const SizedBox(height: 20),
 
        // VERANO Y OTRAS ÉPOCAS
        _sectionSubtitle('☀️  Primavera / Verano / Otoño'),
        const SizedBox(height: 10),
        _bodyText(
          'Ropa ligera para el día, pero siempre incluye una capa intermedia (jersey o sudadera) para las noches, que pueden ser frescas incluso en agosto. Un cortavientos o paraguas compacto es imprescindible.',
        ),
        const SizedBox(height: 20),
 
        // ARTÍCULOS NO EVIDENTES
        _sectionSubtitle('🎒  Artículos que suelen olvidarse'),
        const SizedBox(height: 12),
        ...hiddenItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _BulletCard(
                  icon: item[0], title: item[1], body: item[2]),
            )),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CIERRE DEL CAPÍTULO
// ═══════════════════════════════════════════════════════════
class _ChapterClosingCard extends StatelessWidget {
  const _ChapterClosingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Text('🚪', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          const Text(
            'La maleta está cerrada.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Los documentos están en orden. El seguro está impreso. El efectivo repartido en tres bolsillos distintos. El power bank, cargado.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Es hora de cerrar la puerta de casa. El corazón late un poco más rápido de lo normal — y eso está bien. Significa que esto es real.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// WIDGETS REUTILIZABLES
// ═══════════════════════════════════════════════════════════
Widget _sectionSubtitle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Color(0xFF1A1A1A),
    ),
  );
}
 
Widget _bodyText(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 16, color: Color(0xFF2C2C2A), height: 1.75),
  );
}

Widget _warningBox(String text) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFFCEBEB),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xFFF09595).withValues(alpha: 0.7)),
    ),
    child: Text(text,
        style: const TextStyle(
            fontSize: 14, color: Color(0xFF791F1F), height: 1.6)),
  );
}

Widget _tipBox(String text) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF8E7),
      borderRadius: BorderRadius.circular(10),
      border:
          Border.all(color: const Color(0xFFFAC775).withValues(alpha: 0.6)),
    ),
    child: Text(text,
        style: const TextStyle(
            fontSize: 14, color: Color(0xFF5C4A00), height: 1.6)),
  );
}