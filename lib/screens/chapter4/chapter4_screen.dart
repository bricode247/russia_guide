// lib/screens/chapter4/chapter4_screen.dart

import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter4/chapter4_data.dart';
import 'package:russia_guide/data/chapter4/chapter4_quizzes.dart';
import 'package:russia_guide/data/general_data/chapters_repository.dart';
import 'package:russia_guide/models/chapter_model.dart';
import 'package:russia_guide/themes/app_colors.dart';
import 'package:russia_guide/widgets/chapter4/chapter4_checklist.dart';
import 'package:russia_guide/widgets/general_widgets/next_chapter_button.dart';
import 'package:russia_guide/widgets/general_widgets/quiz_card.dart';
import 'package:russia_guide/widgets/general_widgets/section_header.dart';

class Chapter4Screen extends StatelessWidget {
  final Chapter chapter;
  const Chapter4Screen({super.key, required this.chapter});

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
              const _Chapter4Header(),
              const SizedBox(height: 20),

              // ── FOTO 1: Control de pasaportes ──
               LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter4/aeroport_arrival.jpg',
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

              // ── SECCIÓN 1: INTRO ──
              const SectionHeader(
                title: 'Llegada a Rusia: paso a paso',
                emoji: '🛬',
              ),
              _buildIntroContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 2: PRIMEROS MOMENTOS ──
              const SectionHeader(
                title: 'Primeros momentos al bajar del avión',
                emoji: '🚶',
              ),
              _buildFirstMomentsContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 3: CONTROL DE PASAPORTES ──
              const SectionHeader(
                title: 'Control de pasaportes (inmigración)',
                emoji: '🛂',
              ),
              _buildPassportControlContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 4: TARJETA DE MIGRACIÓN ──
              const SectionHeader(
                title: 'Tarjeta de migración',
                emoji: '📋',
              ),
              _buildMigrationCardContent(),
              const SizedBox(height: 32),

              // ── QUIZ 1 ──
              const QuizCard(quiz: quizPassportControl),
              const SizedBox(height: 40),

              // ── FOTO 2: Recogida de equipaje ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter4/baggage_claim.jpg',
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

              // ── SECCIÓN 5: RECOGIDA DE EQUIPAJE ──
              const SectionHeader(
                title: 'Recogida de equipaje',
                emoji: '🧳',
              ),
              _buildLuggageContent(),
              const SizedBox(height: 40),

              // ── SECCIÓN 6: ADUANAS ──
              const SectionHeader(
                title: 'Control de aduanas',
                emoji: '🟢',
              ),
              _buildCustomsContent(),
              const SizedBox(height: 32),

              // ── QUIZ 2 ──
              const QuizCard(quiz: quizCustoms),
              const SizedBox(height: 40),

              // ── FOTO 3: Aduanas ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter4/customs_entrances.jpg',
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

              // ── SECCIÓN 7: SERVICIOS EN LLEGADAS ──
              const SectionHeader(
                title: 'Servicios en la zona de llegadas',
                emoji: '🏪',
              ),
              _buildServicesContent(),
              const SizedBox(height: 40),

              // ── FOTO 4: Zona de llegadas ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter4/exit_aeroport.jpg',
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

              // ── SECCIÓN 8: ÚLTIMOS PASOS ──
              const SectionHeader(
                title: 'Últimos pasos antes de salir',
                emoji: '🚪',
              ),
              _buildLastStepsContent(),
              const SizedBox(height: 40),

              // ── CHECKLIST FINAL ──
              const SectionHeader(
                title: 'Checklist: ¿listo para salir al exterior?',
                emoji: '✅',
              ),
              const Chapter4Checklist(),
              const SizedBox(height: 40),

              // ── TARJETA DE CIERRE ──
              const _Chapter4ClosingCard(),
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
    return _bodyText(ch4Intro);
  }

  // ─── SECCIÓN: PRIMEROS MOMENTOS ─────────────────────────
  Widget _buildFirstMomentsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4FirstMomentsIntro),
        const SizedBox(height: 20),
        ...ch4FirstMomentsTips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: tip[0], title: tip[1], body: tip[2]),
            )),
      ],
    );
  }

  // ─── SECCIÓN: CONTROL DE PASAPORTES ─────────────────────
  Widget _buildPassportControlContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4PassportControlIntro),
        const SizedBox(height: 20),
        ...ch4PassportControlSteps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _NumberedStep(
                number: step[0],
                title: step[1],
                body: step[2],
              ),
            )),
        const SizedBox(height: 8),
        _tipBox(ch4PassportControlTip),
      ],
    );
  }

  // ─── SECCIÓN: TARJETA DE MIGRACIÓN ──────────────────────
  Widget _buildMigrationCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4MigrationCardIntro),
        const SizedBox(height: 20),
        ...ch4MigrationCardItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
            )),
        const SizedBox(height: 8),
        _warningBox(ch4MigrationCardWarning),
      ],
    );
  }

  // ─── SECCIÓN: EQUIPAJE ──────────────────────────────────
  Widget _buildLuggageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4LuggageIntro),
        const SizedBox(height: 20),
        ...ch4LuggageItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
            )),
      ],
    );
  }

  // ─── SECCIÓN: ADUANAS ───────────────────────────────────
  Widget _buildCustomsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4CustomsIntro),
        const SizedBox(height: 20),
        const _ChannelCard(
          color: Color(0xFFE8F5E9),
          borderColor: Color(0xFF81C784),
          icon: '🟢',
          label: 'Canal Verde — nada que declarar',
          items: ch4greenChannelItems,
        ),
        const SizedBox(height: 14),
        const _ChannelCard(
          color: Color(0xFFFCEBEB),
          borderColor: Color(0xFFEF9A9A),
          icon: '🔴',
          label: 'Canal Rojo — debes declarar si...',
          items: ch4redChannelItems,
        ),
        const SizedBox(height: 14),
        _warningBox(ch4CustomsWarning),
        const SizedBox(height: 8),
        _tipBox(ch4CustomsTip),
      ],
    );
  }

  // ─── SECCIÓN: SERVICIOS ─────────────────────────────────
  Widget _buildServicesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4ServicesIntro),
        const SizedBox(height: 20),
        ...ch4ServiceItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
            )),
      ],
    );
  }

  // ─── SECCIÓN: ÚLTIMOS PASOS ──────────────────────────────
  Widget _buildLastStepsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch4LastStepsIntro),
        const SizedBox(height: 20),
        ...ch4LastStepsItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
            )),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ENCABEZADO DEL CAPÍTULO
// ═══════════════════════════════════════════════════════════
class _Chapter4Header extends StatelessWidget {
  const _Chapter4Header();

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
            'Capítulo 4',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Llegada a Rusia',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Desde que bajas del avión hasta que sales del aeropuerto',
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
class _Chapter4ClosingCard extends StatelessWidget {
  const _Chapter4ClosingCard();

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
          const Text('🇷🇺', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          const Text(
            'Lo lograste.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Pasaporte sellado. Equipaje en mano. Aduana cruzada. '
            'Esa puerta que tienes delante ya no es parte del aeropuerto — '
            'es la entrada a Rusia.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'El siguiente capítulo te esperará con todo lo que necesitas '
            'saber para moverte, orientarte y vivir en este país fascinante. '
            'Bienvenido.',
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

class _ChannelCard extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final String icon;
  final String label;
  final List<List<String>> items;

  const _ChannelCard({
    required this.color,
    required this.borderColor,
    required this.icon,
    required this.label,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item[0], style: const TextStyle(fontSize: 15)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item[1],
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A))),
                          const SizedBox(height: 2),
                          Text(item[2],
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF5F5E5A),
                                  height: 1.5)),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
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