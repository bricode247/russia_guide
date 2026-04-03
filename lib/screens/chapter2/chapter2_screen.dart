// lib/screens/chapter2/chapter2_screen.dart

import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter2/chapter2_data.dart';
import 'package:russia_guide/data/chapter2/chapter2_quizzes.dart';
import 'package:russia_guide/data/general_data/chapters_repository.dart';
import 'package:russia_guide/models/chapter_model.dart';
import 'package:russia_guide/themes/app_colors.dart';
import 'package:russia_guide/widgets/general_widgets/next_chapter_button.dart';
import 'package:russia_guide/widgets/general_widgets/quiz_card.dart';
import 'package:russia_guide/widgets/general_widgets/section_header.dart';
import 'package:russia_guide/widgets/chapter2/chapter2_checklist.dart';

class Chapter2Screen extends StatelessWidget {
  final Chapter chapter;
  const Chapter2Screen({super.key, required this.chapter});

  double _getImageHeight(double availableWidth) {
    if (availableWidth >= 1200) return 320;
    if (availableWidth >= 800) return 280;
    if (availableWidth >= 600) return 240;
    return 200;
  }

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
                  builder: (context) =>
                      ChaptersRepository.getScreenForChapter(previous),
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
            onPressed: () => Navigator.pop(context),
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
              _Chapter2Header(),
              const SizedBox(height: 20),

              // ── FOTO 1: Aeropuerto sala de facturación ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter2/check_in_hall.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth * MediaQuery.of(context).devicePixelRatio).round(),
                      cacheHeight: (imageHeight * MediaQuery.of(context).devicePixelRatio).round(),
                    ),
                  );
                },
              ),

              // ── SECCIÓN 1: INTRODUCCIÓN ──
              const SectionHeader(
                title: 'El aeropuerto: no es el lugar para improvisar',
                emoji: '✈️',
              ),
              _buildIntroContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 2: LLEGADA AL AEROPUERTO ──
              const SectionHeader(
                title: '¿Cuándo llegar? La regla de las 3–4 horas',
                emoji: '⏰',
              ),
              _buildArrivalContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 3: FACTURACIÓN ──
              const SectionHeader(
                title: 'Facturación y entrega de maletas',
                emoji: '🧳',
              ),
              _buildCheckInContent(),
              const SizedBox(height: 24),

              // ── FOTO 2: Mostrador de facturación ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter2/check_in_counter.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth * MediaQuery.of(context).devicePixelRatio).round(),
                      cacheHeight: (imageHeight * MediaQuery.of(context).devicePixelRatio).round(),
                    ),
                  );
                },
              ),

              // ── QUIZ 1 ──
              QuizCard(quiz: quizCheckin),
              const SizedBox(height: 40),

              // ── SECCIÓN 4: CONTROL DE SEGURIDAD ──
              const SectionHeader(
                title: 'Control de seguridad: sin dramas',
                emoji: '🔍',
              ),
              _buildSecurityContent(),
              const SizedBox(height: 24),

              // ── FOTO 3: Control de seguridad ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter2/security_control.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth * MediaQuery.of(context).devicePixelRatio).round(),
                      cacheHeight: (imageHeight * MediaQuery.of(context).devicePixelRatio).round(),
                    ),
                  );
                },
              ),

              // ── QUIZ 2 ──
              QuizCard(quiz: quizProhibited),
              const SizedBox(height: 40),

              // ── SECCIÓN 5: CONTROL MIGRATORIO DE SALIDA ──
              const SectionHeader(
                title: 'Control migratorio de salida',
                emoji: '🛂',
              ),
              _buildMigrationContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 6: DUTY FREE Y ZONA DE EMBARQUE ──
              const SectionHeader(
                title: 'Duty free y zona de embarque',
                emoji: '🛍️',
              ),
              _buildDutyFreeContent(),
              const SizedBox(height: 24),

              // ── FOTO 4: Zona de embarque ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter2/boarding_gate.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth * MediaQuery.of(context).devicePixelRatio).round(),
                      cacheHeight: (imageHeight * MediaQuery.of(context).devicePixelRatio).round(),
                    ),
                  );
                },
              ),

              // ── SECCIÓN 7: ANTES DE ABORDAR ──
              const SectionHeader(
                title: 'Antes de cruzar la puerta: últimos 30 minutos',
                emoji: '🚪',
              ),
              _buildBeforeBoardingContent(),
              const SizedBox(height: 40),

              // ── CHECKLIST FINAL ──
              const SectionHeader(
                title: 'Checklist: ¿todo listo para despegar?',
                emoji: '✅',
              ),
              const Chapter2Checklist(),
              const SizedBox(height: 40),

              // ── TARJETA DE CIERRE ──
              const _Chapter2ClosingCard(),
              const SizedBox(height: 40),

              // ── BOTÓN SIGUIENTE CAPÍTULO ──
              NextChapterButton(currentChapter: chapter),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ─── SECCIÓN 1: INTRO ───────────────────────────────────
  Widget _buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Llegaste hasta aquí: tienes la visa, la maleta hecha y los nervios a punto. Ahora el aeropuerto. Parece intimidante la primera vez — pero es un proceso lineal y predecible. Si sabes el orden de los pasos, fluye solo.',
        ),
        const SizedBox(height: 12),
        _bodyText(
          'Este capítulo cubre todo lo que pasa desde que entras al aeropuerto de tu país de origen hasta que te sientas en el avión. El vuelo, el aterrizaje en Rusia y los trámites de llegada los cubrirá el Capítulo 3.',
        ),
        const SizedBox(height: 12),
        _infoBox(
          '📍  Orden del proceso: Llegada al aeropuerto → Facturación → Control de seguridad → Control migratorio → Zona de embarque → Puerta → Abordaje',
        ),
      ],
    );
  }

  // ─── SECCIÓN 2: LLEGADA ─────────────────────────────────
  Widget _buildArrivalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Para vuelos internacionales, la recomendación estándar es llegar con al menos 3 horas de antelación. Para vuelos a Rusia, con toda la documentación específica que puede verificarse en el mostrador, considera llegar con 3,5–4 horas. Es mejor esperar sentado en la zona de embarque que correr.',
        ),
        const SizedBox(height: 16),
        ...[
          [
            '🚗',
            'Si llegas en coche o taxi',
            'Consulta el terminal exacto de tu aerolínea antes de salir. En aeropuertos grandes (Madrid Barajas, Barcelona, Lisboa, Miami...) hay varios terminales y moverse entre ellos lleva tiempo.'
          ],
          [
            '🚇',
            'Si llegas en transporte público',
            'Calcula el tiempo de trayecto con margen. Un retraso en el metro no es excusa válida para perder un vuelo internacional.'
          ],
          [
            '🅿️',
            'Si dejas el coche aparcado',
            'Confirma con antelación el tiempo de desplazamiento desde el parking hasta la terminal. Muchos parkings de aeropuerto tienen lanzadera y el trayecto puede ser de 10–20 minutos.'
          ],
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
          ),
        ),
        const SizedBox(height: 12),
        _warningBox(
          '⚠️  No confíes ciegamente en las apps de navegación para el tiempo de llegada. Añade siempre un margen de al menos 30 minutos a su estimación.',
        ),
      ],
    );
  }

  // ─── SECCIÓN 3: FACTURACIÓN ─────────────────────────────
  Widget _buildCheckInContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'La facturación es el primer trámite oficial. Puedes hacerla online (check-in web o app de la aerolínea) hasta 24–48 horas antes del vuelo, lo que te ahorra cola. Aun así, si tienes maleta que facturar, tendrás que pasar por el mostrador para entregarla.',
        ),
        const SizedBox(height: 20),
        _sectionSubtitle('📋  Pasos en el mostrador'),
        const SizedBox(height: 12),
        ...checkInSteps.map(
          (step) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _ProcessStep(
              number: step['num']!,
              title: step['title']!,
              body: step['body']!,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _sectionSubtitle('⚖️  Límites de equipaje habituales'),
        const SizedBox(height: 12),
        ...luggageLimits.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _BulletCard(
              icon: item['icon']!,
              title: item['title']!,
              body: item['desc'] ?? item['body'] ?? '',
            ),
          ),
        ),
        const SizedBox(height: 12),
        _tipBox(
          '💡  Pesa tu maleta en casa con una báscula de mano antes de salir. Si estás cerca del límite, lleva ropa extra en el equipaje de mano para equilibrar. Es mucho más barato que pagar el exceso en el aeropuerto.',
        ),
      ],
    );
  }

  // ─── SECCIÓN 4: SEGURIDAD ───────────────────────────────
  Widget _buildSecurityContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'El control de seguridad asusta la primera vez. No hay nada especial: es un escáner de rayos X para el equipaje y un arco detector de metales (o escáner corporal). Si sabes cómo prepararte, pasas en dos minutos.',
        ),
        const SizedBox(height: 16),
        ...securityTips.map(
          (tip) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _CulturalItem(
              icon: tip['icon']!,
              title: tip['title']!,
              body: tip['body']!,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _sectionSubtitle('🚫  Objetos prohibidos en cabina'),
        const SizedBox(height: 12),
        ...prohibitedCabinItems.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _ProhibitedRow(
              icon: item[0],
              name: item[1],
              detail: item[2],
            ),
          ),
        ),
        const SizedBox(height: 12),
        _warningBox(
          '⚠️  Si llevas un power bank grande (>27.000 mAh / >100 Wh), debe ir en cabina — NUNCA en bodega. Indícalo al hacer el check-in. Las baterías de litio en bodega están prohibidas por riesgo de incendio.',
        ),
      ],
    );
  }

  // ─── SECCIÓN 5: CONTROL MIGRATORIO ─────────────────────
  Widget _buildMigrationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Después del control de seguridad (en muchos aeropuertos), cruzarás el control migratorio de salida. En la mayoría de países hispanohablantes este trámite es rápido: un agente revisa el pasaporte, comprueba que no haya alertas y pone el sello de salida.',
        ),
        const SizedBox(height: 12),
        _bodyText(
          'No hay entrevista especial por viajar a Rusia. El agente no está evaluando tu visado ruso — eso lo hará el control migratorio ruso a tu llegada. Aquí simplemente verifican que eres quien dices ser y que puedes salir del país.',
        ),
        const SizedBox(height: 12),
        ...[
          [
            '📘',
            'Ten el pasaporte listo',
            'Abierto por la página de la foto. No busques el pasaporte cuando ya estás delante del agente.'
          ],
          [
            '😐',
            'Actitud tranquila y directa',
            'El agente puede preguntar destino y motivo del viaje. Responde con calma: "Moscú, turismo" o "estudios", según tu caso.'
          ],
          [
            '🔏',
            'Guarda el sello',
            'El sello de salida puede ser relevante para demostrar fechas en futuros trámites migratorios. No arranques páginas del pasaporte.'
          ],
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
          ),
        ),
      ],
    );
  }

  // ─── SECCIÓN 6: DUTY FREE ───────────────────────────────
  Widget _buildDutyFreeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Una vez pasados los controles, estás en la zona de embarque. Aquí tienes tiendas duty free, restaurantes y cafeterías. Es territorio libre — puedes comprar líquidos sin restricción de tamaño porque ya pasaste el control.',
        ),
        const SizedBox(height: 16),
        ...dutyFreeTips.map(
          (tip) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _CulturalItem(
              icon: tip['icon']!,
              title: tip['title']!,
              body: tip['body']!,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _tipBox(
          '💡  Si tu vuelo tiene escala, las compras de duty free pueden ser confiscadas en el control de seguridad de la escala si van en bolsas sin sellar o abiertas. Verifica las normas de tránsito antes de comprar alcohol o perfumes.',
        ),
      ],
    );
  }

  // ─── SECCIÓN 7: ANTES DE ABORDAR ───────────────────────
  Widget _buildBeforeBoardingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(
          'Tienes la tarjeta de embarque, estás en la zona correcta. Falta poco. Estos últimos minutos antes de cruzar la puerta son los que definen si el vuelo empieza con calma o con estrés.',
        ),
        const SizedBox(height: 16),
        ...[
          [
            '📺',
            'Localiza tu puerta en las pantallas',
            'Las puertas pueden cambiar. Comprueba las pantallas de información nada más pasar seguridad y vuelve a hacerlo 30 minutos antes del embarque. No asumas que la puerta del boarding pass siempre es la final.'
          ],
          [
            '🔋',
            'Carga el móvil al máximo',
            'Busca enchufes o puertos USB en la zona de espera. Necesitarás el teléfono para el mapa, el taxi y la traducción en cuanto aterrices. Empieza el vuelo con batería al 100%.'
          ],
          [
            '🚻',
            'Ve al baño antes de embarcar',
            'Los baños a bordo son pequeños, hay cola durante el vuelo y durante el despegue no puedes moverte. Ve antes de subir al avión, sin discusión.'
          ],
          [
            '📂',
            'Documenta todo a mano',
            'Pasaporte, tarjeta de embarque y, si la tienes impresa, la confirmación del hotel. Colócalos en el bolsillo exterior de la mochila de cabina — los necesitarás en el aterrizaje.'
          ],
          [
            '⌚',
            'Llega a la puerta con tiempo',
            'El embarque suele comenzar 30–45 minutos antes de la hora de salida. No confíes en los altavoces — ve a la puerta con 45 minutos de antelación como norma.'
          ],
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ENCABEZADO DEL CAPÍTULO
// ═══════════════════════════════════════════════════════════
class _Chapter2Header extends StatelessWidget {
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
            'CAPÍTULO 2',
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
          'Aeropuerto de salida',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Desde que llegas hasta que abordas',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5F5E5A),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'El paso a paso para cruzar el aeropuerto sin estrés y subir al avión con todo bajo control.',
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
// TARJETA DE CIERRE
// ═══════════════════════════════════════════════════════════
class _Chapter2ClosingCard extends StatelessWidget {
  const _Chapter2ClosingCard();

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
          const Text('🛫', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          const Text(
            'Ya estás en el aire.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Los documentos están en el bolsillo delantero. La maleta va en la bodega con su etiqueta. Pasaste seguridad, migración y el duty free sin incidentes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Ahora solo hay que llegar. En el Capítulo 3 te esperamos con todo lo que pasa estando en el avión.',
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
// WIDGETS PRIVADOS REUTILIZABLES DENTRO DE ESTE ARCHIVO
// ═══════════════════════════════════════════════════════════

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String body;
  const _ProcessStep({
    required this.number,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Color(0xFFD1170E),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A))),
              const SizedBox(height: 4),
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

class _CulturalItem extends StatelessWidget {
  final String icon;
  final String title;
  final String body;
  const _CulturalItem(
      {required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A))),
              const SizedBox(height: 4),
              Text(body,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF5F5E5A),
                      height: 1.65)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProhibitedRow extends StatelessWidget {
  final String icon;
  final String name;
  final String detail;
  const _ProhibitedRow(
      {required this.icon, required this.name, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0DDD5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A))),
                Text(detail,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF888780),
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// HELPERS DE ESTILO (locales, no exportados)
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
      border: Border.all(
          color: const Color(0xFFF09595).withValues(alpha: 0.7)),
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
      border: Border.all(
          color: const Color(0xFFFAC775).withValues(alpha: 0.6)),
    ),
    child: Text(text,
        style: const TextStyle(
            fontSize: 14, color: Color(0xFF5C4A00), height: 1.6)),
  );
}

Widget _infoBox(String text) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFE6F1FB),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
          color: const Color(0xFFB5D4F4).withValues(alpha: 0.7)),
    ),
    child: Text(text,
        style: const TextStyle(
            fontSize: 14, color: Color(0xFF185FA5), height: 1.6)),
  );
}