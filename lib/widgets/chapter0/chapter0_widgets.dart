// lib/widgets/chapter_widgets.dart

import 'package:flutter/material.dart';

// ────────────────────────────────────────────────────────────
// HELPERS DE TEXTO (para usar en cualquier parte)
// ────────────────────────────────────────────────────────────
Widget bodyText(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 0),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF2C2C2A),
        height: 1.75,
      ),
    ),
  );
}

TextSpan highlightSpan(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      fontWeight: FontWeight.w700,
      color: Color(0xFFD1170E), // rojo usado por Claude
    ),
  );
}

TextSpan boldSpan(String text) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
  );
}

// ────────────────────────────────────────────────────────────
// TARJETA DE ESTADÍSTICA (para datos numéricos)
// ────────────────────────────────────────────────────────────
class StatCard extends StatelessWidget {
  final String number;
  final String label;

  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0DDD5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFFD1170E),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ),
          ),  
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// TARJETA DE MITO
// ────────────────────────────────────────────────────────────
class MythCard extends StatelessWidget {
  final String myth;
  final String reality;

  const MythCard({super.key, required this.myth, required this.reality});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: const Color(0xFFD1170E), width: 3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, color: Color(0xFF888780)),
              children: [
                const TextSpan(text: '❌  Mito: '),
                TextSpan(
                  text: myth,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 15, color: Color(0xFF2C2C2A), height: 1.6),
              children: [
                const TextSpan(
                  text: '✅  Realidad: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: reality),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// TARJETA DE SALUDO (para las dos formas de hola)
// ────────────────────────────────────────────────────────────
class GreetingCard extends StatelessWidget {
  final String ru;
  final String trans;
  final String meaning;
  final String note;

  const GreetingCard({
    super.key,
    required this.ru,
    required this.trans,
    required this.meaning,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F1FB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFB5D4F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ru,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF185FA5),
            ),
          ),
          const SizedBox(height: 2),
          Text(trans,
              style: const TextStyle(fontSize: 12, color: Color(0xFF4A90D9))),
          const SizedBox(height: 6),
          Text(
            meaning,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A)),
          ),
          const SizedBox(height: 4),
          Text(
            note,
            style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// TARJETA DE VOCABULARIO (para la cuadrícula de palabras básicas)
// ────────────────────────────────────────────────────────────
class VocabCard extends StatelessWidget {
  final String ru;
  final String trans;
  final String spanish;

  const VocabCard({
    super.key,
    required this.ru,
    required this.trans,
    required this.spanish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0DDD5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ru,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
          Text(
            trans,
            style: const TextStyle(fontSize: 11, color: Color(0xFF888780)),
          ),
          const SizedBox(height: 4),
          Text(
            spanish,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// ELEMENTO DE CHOQUE CULTURAL (fila con icono, título y texto)
// ────────────────────────────────────────────────────────────
class CulturalShockItem extends StatelessWidget {
  final String icon;
  final String title;
  final String body;

  const CulturalShockItem({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                body,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF5F5E5A),
                  height: 1.65,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ────────────────────────────────────────────────────────────
// FILA DE CAPÍTULO (para la lista de capítulos de la app)
// ────────────────────────────────────────────────────────────
class ChapterRow extends StatelessWidget {
  final String icon;
  final String chapter;
  final String desc;

  const ChapterRow({
    super.key,
    required this.icon,
    required this.chapter,
    required this.desc,
  });

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
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          SizedBox(
            width: 88,
            child: Text(
              chapter,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF888780),
              ),
            ),
          ),
          Expanded(
            child: Text(
              desc,
              style: const TextStyle(fontSize: 15, color: Color(0xFF1A1A1A)),
            ),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// TARJETA DE CIERRE (final motivacional)
// ────────────────────────────────────────────────────────────
class ClosingCard extends StatelessWidget {
  const ClosingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EDE4),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD6D1C4)),
      ),
      child: Column(
        children: [
          const Text('🚀', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          const Text(
            'El viaje comienza ahora',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Rusia puede parecer intimidante desde afuera. Pero quienes se atreven '
            'a conocerla de verdad, casi siempre se enamoran de ella. La arquitectura, '
            'la gente, la comida, la historia, la profundidad cultural... todo está ahí esperándote.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Y ahora tienes una ventaja que muchos no tuvieron: esta guía. Úsala bien.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.7,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFD1170E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Удачи — Udachi — ¡Buena suerte!  🇷🇺',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────
// CHIP DE PALABRA RUSA (con nota etimológica o cultural)
// ────────────────────────────────────────────────────────────
class RuWordChip extends StatelessWidget {
  final String ru;
  final String trans;
  final String meaning;
  final String prefixNote;

  const RuWordChip({
    super.key,
    required this.ru,
    required this.trans,
    required this.meaning,
    required this.prefixNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F1FB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFB5D4F4).withValues(alpha: 0.7)),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
              fontSize: 14, color: Color(0xFF2C2C2A), height: 1.5),
          children: [
            TextSpan(
                text: prefixNote,
                style: const TextStyle(fontStyle: FontStyle.italic)),
            TextSpan(
              text: ru,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xFF185FA5),
              ),
            ),
            TextSpan(
              text: ' ($trans) — $meaning',
              style: const TextStyle(color: Color(0xFF4A7AB5)),
            ),
          ],
        ),
      ),
    );
  }
}