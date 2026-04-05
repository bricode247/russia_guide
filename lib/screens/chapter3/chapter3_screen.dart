// lib/screens/chapter3/chapter3_screen.dart
import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter3/chapter3_data.dart';
import 'package:russia_guide/data/chapter3/chapter3_quizzes.dart';
import 'package:russia_guide/data/general_data/chapters_repository.dart';
import 'package:russia_guide/models/chapter_model.dart';
import 'package:russia_guide/themes/app_colors.dart';
import 'package:russia_guide/widgets/chapter3/chapter3_checklist.dart';
import 'package:russia_guide/widgets/general_widgets/next_chapter_button.dart';
import 'package:russia_guide/widgets/general_widgets/quiz_card.dart';
import 'package:russia_guide/widgets/general_widgets/section_header.dart';

class Chapter3Screen extends StatelessWidget {
  final Chapter chapter;
  const Chapter3Screen({super.key, required this.chapter});

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
              const _Chapter3Header(),
              const SizedBox(height: 20),

              // ── FOTO 1: Interior de cabina / ventana de avión ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter3/cabin_airplane.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                      cacheHeight: (imageHeight *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // ── SECCIÓN 1: INTRODUCCIÓN ──
              const SectionHeader(
                title: 'El vuelo: tu primera prueba rusa',
                emoji: '✈️',
              ),
              _buildIntroContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 2: ANTES DEL DESPEGUE ──
              const SectionHeader(
                title: 'Antes del despegue: los primeros minutos',
                emoji: '🪑',
              ),
              _buildBeforeTakeoffContent(),
              const SizedBox(height: 24),

              // ── FOTO 2: Pasillo de avión con equipaje de mano ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter3/airplane_aisle.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                      cacheHeight: (imageHeight *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              // ── SECCIÓN 3: COMODIDAD Y SALUD ──
              const SectionHeader(
                title: 'Durante el vuelo: comodidad y salud',
                emoji: '💙',
              ),
              _buildHealthContent(),
              const SizedBox(height: 32),

              // ── QUIZ 1 ──
              const QuizCard(quiz: quizFlightHealth),
              const SizedBox(height: 40),

              // ── SECCIÓN 4: COMIDA A BORDO ──
              const SectionHeader(
                title: 'Comida a bordo: qué esperar',
                emoji: '🍽️',
              ),
              _buildFoodContent(),
              const SizedBox(height: 24),

              // ── FOTO 3: Bandeja de comida en avión ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter3/airplane_meal.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                      cacheHeight: (imageHeight *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              // ── SECCIÓN 5: ENTRETENIMIENTO Y CONECTIVIDAD ──
              const SectionHeader(
                title: 'Entretenimiento y conectividad',
                emoji: '🎬',
              ),
              _buildEntertainmentContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 6: SUEÑO Y JET LAG ──
              const SectionHeader(
                title: 'Sueño y adaptación al huso horario',
                emoji: '😴',
              ),
              _buildSleepContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 7: DOCUMENTACIÓN EN EL VUELO ──
              const SectionHeader(
                title: 'Documentación durante el vuelo',
                emoji: '📋',
              ),
              _buildDocsContent(),
              const SizedBox(height: 32),

              // ── QUIZ 2 ──
              const QuizCard(quiz: quizArrivalDocs),
              const SizedBox(height: 40),

              // ── FOTO 4: Tarjeta de migración rusa ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter3/migration_card.jpg',
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      cacheWidth: (constraints.maxWidth *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                      cacheHeight: (imageHeight *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              // ── SECCIÓN 8: ANTES DE ATERRIZAR ──
              const SectionHeader(
                title: 'Antes de aterrizar: los últimos 60 minutos',
                emoji: '🛬',
              ),
              _buildBeforeLandingContent(),
              const SizedBox(height: 40),

              // ── CHECKLIST FINAL ──
              const SectionHeader(
                title: 'Checklist final: ¿listo para aterrizar?',
                emoji: '✅',
              ),
              const Chapter3Checklist(),
              const SizedBox(height: 40),

              // ── TARJETA DE CIERRE ──
              const _Chapter3ClosingCard(),
              const SizedBox(height: 32),

              // ── BOTÓN SIGUIENTE CAPÍTULO ──
              NextChapterButton(currentChapter: chapter),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ─── SECCIÓN: INTRO ─────────────────────────────────────
  Widget _buildIntroContent() {
    return _bodyText(ch3Intro);
  }

  // ─── SECCIÓN: ANTES DEL DESPEGUE ────────────────────────
  Widget _buildBeforeTakeoffContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3BeforeTakeoffIntro),
        const SizedBox(height: 20),
        ...ch3BeforeTakeoffSteps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _NumberedStep(
                number: step[0],
                title: step[1],
                body: step[2],
              ),
            )),
      ],
    );
  }

  // ─── SECCIÓN: SALUD ─────────────────────────────────────
  Widget _buildHealthContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3HealthIntro),
        const SizedBox(height: 20),
        ...ch3HealthTips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: tip[0], title: tip[1], body: tip[2]),
            )),
      ],
    );
  }

  // ─── SECCIÓN: COMIDA ─────────────────────────────────────
  Widget _buildFoodContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3FoodIntro),
        const SizedBox(height: 20),
        ...ch3FoodCards.map((card) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _FoodCard(
                icon: card[0],
                title: card[1],
                body: card[2],
              ),
            )),
      ],
    );
  }

  // ─── SECCIÓN: ENTRETENIMIENTO ────────────────────────────
  Widget _buildEntertainmentContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3EntertainmentIntro),
        const SizedBox(height: 20),
        ...ch3EntertainmentItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(
                  icon: item[0], title: item[1], body: item[2]),
            )),
      ],
    );
  }

  // ─── SECCIÓN: SUEÑO ─────────────────────────────────────
  Widget _buildSleepContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3SleepIntro),
        const SizedBox(height: 20),
        ...ch3SleepTips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: tip[0], title: tip[1], body: tip[2]),
            )),
        const SizedBox(height: 8),
        _warningBox(ch3SleepWarning),
      ],
    );
  }

  // ─── SECCIÓN: DOCUMENTACIÓN ─────────────────────────────
  Widget _buildDocsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3DocsIntro),
        const SizedBox(height: 20),
        ...ch3DocItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(
                  icon: item[0], title: item[1], body: item[2]),
            )),
        const SizedBox(height: 8),
        _tipBox(ch3DocsTip),
      ],
    );
  }

  // ─── SECCIÓN: ANTES DE ATERRIZAR ────────────────────────
  Widget _buildBeforeLandingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch3BeforeLandingIntro),
        const SizedBox(height: 20),
        ...ch3BeforeLandingSteps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _NumberedStep(
                number: step[0],
                title: step[1],
                body: step[2],
              ),
            )),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ENCABEZADO DEL CAPÍTULO
// ═══════════════════════════════════════════════════════════
class _Chapter3Header extends StatelessWidget {
  const _Chapter3Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFD1170E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Capítulo 3',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'El vuelo',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Desde que abordas hasta que aterrizas',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF5F5E5A),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TARJETA DE CIERRE
// ═══════════════════════════════════════════════════════════
class _Chapter3ClosingCard extends StatelessWidget {
  const _Chapter3ClosingCard();

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
          const Text('🛬', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          const Text(
            'Casi estás ahí.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Pasaporte en mano. Tarjeta de migración rellena. Reloj ajustado '
            'a la hora de Moscú. A kilómetros por debajo, la estepa rusa '
            'se extiende bajo las nubes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'En unos minutos, esas ruedas tocarán suelo ruso. '
            'El aeropuerto de llegada es el siguiente paso — '
            'y ya sabes cómo afrontarlo.',
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
// WIDGETS LOCALES
// ═══════════════════════════════════════════════════════════

class _NumberedStep extends StatelessWidget {
  final String number;
  final String title;
  final String body;
  const _NumberedStep(
      {required this.number, required this.title, required this.body});

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

class _FoodCard extends StatelessWidget {
  final String icon;
  final String title;
  final String body;
  const _FoodCard(
      {required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0DDD5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 26)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
                const SizedBox(height: 6),
                Text(body,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF5F5E5A),
                        height: 1.6)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Helpers de estilo (locales) ──────────────────────────────

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