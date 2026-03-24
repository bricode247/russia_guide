import 'package:flutter/material.dart';
import '../../data/chapter1/chapter1_data.dart';

class ChecklistSection extends StatefulWidget {
  const ChecklistSection({super.key});

  @override
  State<ChecklistSection> createState() => _ChecklistSectionState();
}

class _ChecklistSectionState extends State<ChecklistSection> {
  late List<bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = List.filled(checklistItems.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _checked.where((c) => c).length;
    final total = checklistItems.length;
    final progress = completedCount / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra de progreso
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: completedCount == total
                ? const Color(0xFFEAF3DE)
                : const Color(0xFFF0EDE4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: completedCount == total
                  ? const Color(0xFF97C459)
                  : const Color(0xFFD6D1C4),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    completedCount == total
                        ? '✅  ¡Todo listo! Puedes irte.'
                        : '🧳  Progreso de preparación',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: completedCount == total
                          ? const Color(0xFF3B6D11)
                          : const Color(0xFF2C2C2A),
                    ),
                  ),
                  Text(
                    '$completedCount / $total',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD1170E)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFD6D1C4),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    completedCount == total
                        ? const Color(0xFF639922)
                        : const Color(0xFFD1170E),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Ítems agrupados por categoría
        ..._buildGroupedItems(),
      ],
    );
  }

  List<Widget> _buildGroupedItems() {
    String currentCat = '';
    final List<Widget> widgets = [];
    for (int i = 0; i < checklistItems.length; i++) {
      final item = checklistItems[i];
      final cat = item['cat']!;
      if (cat != currentCat) {
        if (currentCat.isNotEmpty) {
          widgets.add(const SizedBox(height: 12));
        }
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: Text(
              cat,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF888780),
                letterSpacing: 0.5,
              ),
            ),
          ),
        );
        currentCat = cat;
      }
      widgets.add(
        _ChecklistItem(
          label: item['item']!,
          checked: _checked[i],
          onChanged: (val) => setState(() => _checked[i] = val ?? false),
        ),
      );
    }
    return widgets;
  }
}

class _ChecklistItem extends StatelessWidget {
  final String label;
  final bool checked;
  final ValueChanged<bool?> onChanged;
  const _ChecklistItem({
    required this.label,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!checked),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: checked ? const Color(0xFFEAF3DE) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: checked ? const Color(0xFF97C459) : const Color(0xFFE0DDD5),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: checked ? const Color(0xFF639922) : Colors.transparent,
                border: Border.all(
                  color: checked ? const Color(0xFF639922) : const Color(0xFFB5AD98),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: checked ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: checked ? const Color(0xFF3B6D11) : const Color(0xFF2C2C2A),
                  decoration: checked ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}