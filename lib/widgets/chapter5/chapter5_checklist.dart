// lib/widgets/chapter5/chapter5_checklist.dart

import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter5/chapter5_data.dart';

class Chapter5Checklist extends StatefulWidget {
  const Chapter5Checklist({super.key});

  @override
  State<Chapter5Checklist> createState() => _Chapter5ChecklistState();
}

class _Chapter5ChecklistState extends State<Chapter5Checklist> {
  final List<bool> _checked =
      List.generate(ch5ChecklistItems.length, (_) => false);

  int get _completedCount => _checked.where((v) => v).length;
  double get _progress => _completedCount / ch5ChecklistItems.length;

  Color get _progressColor {
    if (_progress < 0.4) return const Color(0xFFD1170E);
    if (_progress < 0.8) return const Color(0xFFF5A623);
    return const Color(0xFF4CAF50);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EDE4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD6D1C4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de progreso
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_completedCount / ${ch5ChecklistItems.length} completados',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5F5E5A),
                ),
              ),
              Text(
                '${(_progress * 100).round()}%',
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
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 8,
              backgroundColor: const Color(0xFFD6D1C4),
              valueColor: AlwaysStoppedAnimation<Color>(_progressColor),
            ),
          ),
          const SizedBox(height: 20),
          // Items
          ...List.generate(ch5ChecklistItems.length, (index) {
            return GestureDetector(
              onTap: () => setState(() => _checked[index] = !_checked[index]),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _checked[index]
                            ? const Color(0xFF4CAF50)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: _checked[index]
                              ? const Color(0xFF4CAF50)
                              : const Color(0xFFB5AD98),
                          width: 1.5,
                        ),
                      ),
                      child: _checked[index]
                          ? const Icon(Icons.check,
                              size: 16, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        ch5ChecklistItems[index],
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: _checked[index]
                              ? const Color(0xFF8A8A85)
                              : const Color(0xFF1A1A1A),
                          decoration: _checked[index]
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          // Mensaje de felicitación
          if (_progress == 1.0) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3DE),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF97C459)),
              ),
              child: const Text(
                '🎉 ¡Perfecto! Estás conectado y listo para comenzar tu vida en Rusia.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF3B6D11),
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}