// lib/screens/chapter5/chapter5_screen.dart
// ⭐ CAPÍTULO PREMIUM ⭐
// Este capítulo forma parte del contenido de pago de Russia Guide.

import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter5/chapter5_data.dart';
import 'package:russia_guide/data/chapter5/chapter5_quizzes.dart';
import 'package:russia_guide/data/general_data/chapters_repository.dart';
import 'package:russia_guide/models/chapter_model.dart';
import 'package:russia_guide/themes/app_colors.dart';
import 'package:russia_guide/widgets/chapter5/chapter5_checklist.dart';
import 'package:russia_guide/widgets/general_widgets/next_chapter_button.dart';
import 'package:russia_guide/widgets/general_widgets/quiz_card.dart';
import 'package:russia_guide/widgets/general_widgets/section_header.dart';
import 'package:russia_guide/widgets/general_widgets/image_carousel.dart';

class Chapter5Screen extends StatelessWidget {
  final Chapter chapter;
  const Chapter5Screen({super.key, required this.chapter});

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
          // Badge premium
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '⭐ PREMIUM',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ),
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
              const _Chapter5Header(),
              const SizedBox(height: 20),

              // ── FOTO HERO: quiosco operador ──
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = _getImageHeight(constraints.maxWidth);
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/chapter5/sim_card.jpg',
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

              // ══════════════════════════════════════════
              // BLOQUE 1 – PREPARACIÓN Y CONTEXTO
              // ══════════════════════════════════════════
              const SectionHeader(
                title: 'Antes de acercarte al mostrador',
                emoji: '🧭',
              ),
              _buildPrepContent(),
              const SizedBox(height: 40),

              // ══════════════════════════════════════════
              // BLOQUE 2 – COMPRA PASO A PASO
              // ══════════════════════════════════════════
              const SectionHeader(
                title: 'Compra de la SIM: paso a paso',
                emoji: '📲',
              ),
              _buildPurchaseContent(),
              const SizedBox(height: 32),

              // ── QUIZ 1 ──
              const QuizCard(quiz: quizSimPurchase),
              const SizedBox(height: 40),

              // ══════════════════════════════════════════
              // BLOQUE 3 – ACTIVACIÓN
              // ══════════════════════════════════════════
              const SectionHeader(
                title: 'Activación y primer uso',
                emoji: '⚙️',
              ),
              _buildActivationContent(),
              const SizedBox(height: 40),

              // ══════════════════════════════════════════
              // BLOQUE 4 – TUTORIAL VISUAL APP МТС
              // ══════════════════════════════════════════
              const SizedBox(height: 16),
              ImageCarousel(
                items: mtsCarouselItems,
                title: 'Tutorial visual: Мой МТС',
              ),
              _buildPostTutorialMessage(),
              const SizedBox(height: 32),

              // ── QUIZ 2 ──
              const QuizCard(quiz: quizOperatorSupport),
              const SizedBox(height: 40),

              // ══════════════════════════════════════════
              // BLOQUE 5 – RECURSOS Y CHECKLIST
              // ══════════════════════════════════════════
              const SectionHeader(
                title: 'Recursos útiles y contactos',
                emoji: '📞',
              ),
              _buildResourcesContent(),
              const SizedBox(height: 40),

              // ══════════════════════════════════════════
              // BLOQUE 6 – VALOR AÑADIDO PREMIUM
              // ══════════════════════════════════════════
              const SectionHeader(
                title: 'Errores que cometen todos',
                emoji: '⚠️',
              ),
              _buildAdvancedErrorsContent(),
              const SizedBox(height: 40),

              const SectionHeader(
                title: 'Si tu teléfono no es compatible',
                emoji: '🔧',
              ),
              _buildIncompatiblePhoneContent(),
              const SizedBox(height: 40),

              const SectionHeader(
                title: 'Recargar sin tarjeta bancaria rusa',
                emoji: '💸',
              ),
              _buildRechargeContent(),
              const SizedBox(height: 40),

              // ── CHECKLIST PREMIUM ──
              const SectionHeader(
                title: 'Checklist: ¿listo para salir conectado?',
                emoji: '✅',
              ),
              const Chapter5Checklist(),
              const SizedBox(height: 40),

              // ── TARJETA DE CIERRE ──
              const _Chapter5ClosingCard(),
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

  // ─── BLOQUE 1: PREPARACIÓN ──────────────────────────────
  Widget _buildPrepContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch5PrepIntro),
        const SizedBox(height: 24),
        _bodyText(ch5OperatorsIntro),
        const SizedBox(height: 16),
        // Tabla comparativa de operadores
        _OperatorsTable(),
        const SizedBox(height: 24),
        _bodyText('Documentación obligatoria:'),
        const SizedBox(height: 14),
        ...ch5DocItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
            )),
        const SizedBox(height: 8),
        _tipBox(ch5RecommendationMoscow),
        const SizedBox(height: 10),
        _tipBox(ch5RecommendationRegions),
      ],
    );
  }

  // ─── BLOQUE 2: COMPRA ───────────────────────────────────
  Widget _buildPurchaseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch5PurchaseIntro),
        const SizedBox(height: 20),
        ...ch5AirportLocations.map((loc) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: loc[0], title: loc[1], body: loc[2]),
            )),
        const SizedBox(height: 20),
        // Frases útiles en ruso
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F0FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFBCAFE0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('💬', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 8),
                  Text(
                    'Frases útiles en el mostrador',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ...ch5UsefulPhrases.map((phrase) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          phrase[1], // Cirílico
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          phrase[0], // Transliteración
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7B5EA7),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          phrase[2], // Significado
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF5F5E5A),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ...ch5PurchaseSteps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _NumberedStep(
                number: step[0],
                title: step[1],
                body: step[2],
              ),
            )),
        const SizedBox(height: 8),
        // Errores comunes al comprar
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFCEBEB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEF9A9A)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Errores comunes al comprar la SIM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF791F1F),
                ),
              ),
              const SizedBox(height: 12),
              ...ch5CommonErrors.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e[0], style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e[1],
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF791F1F))),
                              const SizedBox(height: 3),
                              Text(e[2],
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
        ),
      ],
    );
  }

  // ─── BLOQUE 3: ACTIVACIÓN ───────────────────────────────
  Widget _buildActivationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bodyText(ch5ActivationIntro),
        const SizedBox(height: 20),
        // Android
        _PlatformStepsCard(
          platform: 'Android',
          icon: '🤖',
          steps: ch5ActivationAndroid,
          color: const Color(0xFFE8F5E9),
          borderColor: const Color(0xFF81C784),
        ),
        const SizedBox(height: 14),
        // iOS
        _PlatformStepsCard(
          platform: 'iOS / iPhone',
          icon: '🍎',
          steps: ch5ActivationIOS,
          color: const Color(0xFFF0F4FF),
          borderColor: const Color(0xFFABB7E8),
        ),
        const SizedBox(height: 20),
        // APN tabla
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E7),
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: const Color(0xFFFAC775).withValues(alpha: 0.6)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🌐  Configuración APN por operador',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF5C4A00)),
              ),
              const SizedBox(height: 12),
              ...ch5ApnData.map((apn) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(apn[0],
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1A1A1A))),
                        ),
                        Expanded(
                          child: Text(
                            'APN: ${apn[1]}${apn[2].isNotEmpty ? '  ·  User: ${apn[2]}  ·  Pass: ${apn[3]}' : '  (sin usuario/contraseña)'}',
                            style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF5C4A00),
                                fontFamily: 'monospace'),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ...ch5TroubleshootingItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _BulletCard(icon: item[0], title: item[1], body: item[2]),
            )),
      ],
    );
  }

  // ─── BLOQUE 4: TUTORIAL VISUAL APP МТС (DESPEDIDA) ─────────────────
  Widget _buildPostTutorialMessage() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFE8F0FE),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFB3D4FF)),
    ),
    child: Row(
      children: [
        const Icon(Icons.info_outline, color: Color(0xFF1A73E8), size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Más allá del tutorial',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lo que acabas de ver es lo esencial para activar tu línea y estar conectado desde el aeropuerto. '
                'La app de МТС tiene muchas otras funciones (gestión de suscripciones, roaming, bonificaciones, etc.), '
                'pero con estos pasos ya tienes resuelto el primer y más crítico problema de comunicación al llegar a Rusia.',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF3C4043),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  // ─── BLOQUE 5: RECURSOS ─────────────────────────────────
  Widget _buildResourcesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabla de contactos
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF0EDE4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD6D1C4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '📞  Números de atención al cliente',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A)),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  SizedBox(
                      width: 90,
                      child: Text('Operador',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF8A8A85)))),
                  SizedBox(
                      width: 50,
                      child: Text('Rusia',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF8A8A85)))),
                  Expanded(
                      child: Text('Internacional',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF8A8A85)))),
                ],
              ),
              const Divider(height: 16),
              ...ch5OperatorsResources.map((op) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90,
                          child: Text(op[0],
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A))),
                        ),
                        SizedBox(
                          width: 50,
                          child: Text(op[1],
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFD1170E),
                                  fontWeight: FontWeight.w700)),
                        ),
                        Expanded(
                          child: Text(op[2],
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xFF5F5E5A))),
                        ),
                      ],
                    ),
                  )),
              const Divider(height: 16),
              ...ch5OperatorsResources.map((op) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 90,
                          child: Text(op[0].split(' ').first,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF5F5E5A))),
                        ),
                        Expanded(
                          child: Text('🌐 ${op[3]}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF1A73E8),
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _warningBox(ch5LostSimTips),
      ],
    );
  }

  // ─── BLOQUE 6: VALOR PREMIUM ─────────────────────────────
  Widget _buildAdvancedErrorsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ch5AdvancedErrors
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _BulletCard(icon: e[0], title: e[1], body: e[2]),
              ))
          .toList(),
    );
  }

  Widget _buildIncompatiblePhoneContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ch5IncompatiblePhone
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _BulletCard(icon: e[0], title: e[1], body: e[2]),
              ))
          .toList(),
    );
  }

  Widget _buildRechargeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ch5RechargeWithoutCard
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _BulletCard(icon: e[0], title: e[1], body: e[2]),
              ))
          .toList(),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ENCABEZADO DEL CAPÍTULO
// ═══════════════════════════════════════════════════════════
class _Chapter5Header extends StatelessWidget {
  const _Chapter5Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFD1170E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Capítulo 5',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '⭐ Premium',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1A1A1A),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Conectividad inmediata',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Tu primer paso como residente en Rusia: SIM, app y datos activos antes de salir del aeropuerto',
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
class _Chapter5ClosingCard extends StatelessWidget {
  const _Chapter5ClosingCard();

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
          const Text('📶', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          const Text(
            'Ya estás conectado.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'SIM activa. App instalada. Número en tu agenda. '
            'Acabas de completar el paso que más viajeros omiten y que '
            'más problemas causa en las primeras horas en un país nuevo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'El próximo capítulo (también premium) te guiará paso a paso por la aplicacion '
            'que necesitarás para localizar nuevas direcciones: YANDEX MAPS.',
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

class _OperatorsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0EDE4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD6D1C4)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Row(
              children: [
                SizedBox(
                    width: 80,
                    child: Text('Operador',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                SizedBox(
                    width: 80,
                    child: Text('Cobertura',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Expanded(
                    child: Text('App',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                SizedBox(
                    width: 50,
                    child: Text('Rating',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
              ],
            ),
          ),
          ...ch5OperatorsTable.asMap().entries.map((entry) {
            final op = entry.value;
            final isLast = entry.key == ch5OperatorsTable.length - 1;
            return Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : const Border(
                        bottom:
                            BorderSide(color: Color(0xFFD6D1C4), width: 0.5)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(op[0],
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A))),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(op[1],
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xFF5F5E5A))),
                  ),
                  Expanded(
                    child: Text(op[2],
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xFF5F5E5A))),
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(op[4],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _PlatformStepsCard extends StatelessWidget {
  final String platform;
  final String icon;
  final List<List<String>> steps;
  final Color color;
  final Color borderColor;

  const _PlatformStepsCard({
    required this.platform,
    required this.icon,
    required this.steps,
    required this.color,
    required this.borderColor,
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
              Text(
                platform,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...steps.map((step) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A1A),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(step[0],
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(step[1],
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A))),
                          const SizedBox(height: 2),
                          Text(step[2],
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

// ── Helpers de estilo ──────────────────────────────────────

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