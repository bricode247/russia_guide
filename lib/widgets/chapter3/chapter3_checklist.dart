// lib/widgets/chapter3/chapter3_checklist.dart

import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter3/chapter3_data.dart';

class Chapter3Checklist extends StatefulWidget {
  const Chapter3Checklist({super.key});

  @override
  State<Chapter3Checklist> createState() => _Chapter3ChecklistState();
}

class _Chapter3ChecklistState extends State<Chapter3Checklist> {
  late final List<bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = List.filled(ch3ChecklistItems.length, false);
  }

  double get _progress {
    if (_checked.isEmpty) return 0;
    return _checked.where((v) => v).length / _checked.length;
  }

  Color get _progressColor {
    if (_progress < 0.4) return const Color(0xFFD1170E);
    if (_progress < 0.8) return const Color(0xFFFAC775);
    return const Color(0xFF4CAF50);
  }

  String get _progressLabel {
    final done = _checked.where((v) => v).length;
    final total = _checked.length;
    if (done == total) return '¡Todo listo para aterrizar! ✅';
    return '$done de $total completados';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5F0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDDD9CE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Barra de progreso ──────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _progressLabel,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5F5E5A),
                ),
              ),
              Text(
                '${(_progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _progressColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 8,
              backgroundColor: const Color(0xFFE0DDD5),
              valueColor: AlwaysStoppedAnimation<Color>(_progressColor),
            ),
          ),
          const SizedBox(height: 20),

          // ── Items del checklist ────────────────────────────
          ...List.generate(ch3ChecklistItems.length, (index) {
            final item = ch3ChecklistItems[index];
            final isChecked = _checked[index];
            return _ChecklistItem(
              icon: item['icon']!,
              text: item['text']!,
              isChecked: isChecked,
              onTap: () => setState(() => _checked[index] = !_checked[index]),
            );
          }),
        ],
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  final String icon;
  final String text;
  final bool isChecked;
  final VoidCallback onTap;

  const _ChecklistItem({
    required this.icon,
    required this.text,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isChecked ? const Color(0xFF4CAF50) : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isChecked
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFBDBDB8),
                  width: 2,
                ),
              ),
              child: isChecked
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 14),
            // Emoji + texto
            Text(icon, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: isChecked
                      ? const Color(0xFF9E9E9E)
                      : const Color(0xFF2C2C2A),
                  decoration:
                      isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}