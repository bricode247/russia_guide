// lib/widgets/chapter4/chapter4_checklist.dart

import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter4/chapter4_data.dart';

class Chapter4Checklist extends StatefulWidget {
  const Chapter4Checklist({super.key});

  @override
  State<Chapter4Checklist> createState() => _Chapter4ChecklistState();
}

class _Chapter4ChecklistState extends State<Chapter4Checklist> {
  late final List<bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = List<bool>.filled(ch4ChecklistItems.length, false);
  }

  int get _checkedCount => _checked.where((v) => v).length;
  double get _progress => _checkedCount / ch4ChecklistItems.length;

  Color get _progressColor {
    if (_progress >= 1.0) return const Color(0xFF4CAF50);
    if (_progress >= 0.5) return const Color(0xFF1A73E8);
    return const Color(0xFFD1170E);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Barra de progreso ──
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: _progress,
                  minHeight: 10,
                  backgroundColor: const Color(0xFFE0DDD5),
                  valueColor: AlwaysStoppedAnimation<Color>(_progressColor),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$_checkedCount / ${ch4ChecklistItems.length}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _progressColor,
              ),
            ),
          ],
        ),
        if (_progress >= 1.0) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3DE),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF97C459)),
            ),
            child: const Text(
              '🎉  ¡Todo listo! Ya puedes salir al exterior con tranquilidad.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3B6D11),
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        // ── Ítems ──
        ...List.generate(ch4ChecklistItems.length, (index) {
          final isChecked = _checked[index];
          return GestureDetector(
            onTap: () => setState(() => _checked[index] = !_checked[index]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 10),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: isChecked
                    ? const Color(0xFFEAF3DE)
                    : const Color(0xFFF7F5F0),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isChecked
                      ? const Color(0xFF97C459)
                      : const Color(0xFFDDD9D0),
                ),
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isChecked
                          ? const Color(0xFF4CAF50)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isChecked
                            ? const Color(0xFF4CAF50)
                            : const Color(0xFFB0A99A),
                        width: 2,
                      ),
                    ),
                    child: isChecked
                        ? const Icon(Icons.check,
                            size: 14, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      ch4ChecklistItems[index],
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: isChecked
                            ? const Color(0xFF3B6D11)
                            : const Color(0xFF2C2C2A),
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: const Color(0xFF97C459),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}