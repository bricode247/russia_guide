import 'package:flutter/material.dart';
import '../../data/chapter1/chapter1_data.dart';

class SeasonCard extends StatefulWidget {
  final SeasonData season;
  const SeasonCard({super.key, required this.season});

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.season;
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        decoration: BoxDecoration(
          color: _expanded ? s.lightColor : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _expanded ? s.color.withValues(alpha: 0.4) : const Color(0xFFE0DDD5),
            width: _expanded ? 1.5 : 1,
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
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(s.emoji, style: const TextStyle(fontSize: 26)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: s.color,
                          ),
                        ),
                        Text(
                          '${s.months}  ·  ${s.tempRange}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ProConColumn(
                        title: '✅  Pros',
                        items: s.pros,
                        color: const Color(0xFF3B6D11),
                        bgColor: const Color(0xFFEAF3DE),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _ProConColumn(
                        title: '❌  Contras',
                        items: s.cons,
                        color: const Color(0xFF993C1D),
                        bgColor: const Color(0xFFFAECE7),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ProConColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  final Color color;
  final Color bgColor;
  const _ProConColumn({
    required this.title,
    required this.items,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700, color: color)),
          const SizedBox(height: 8),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '• $item',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700], height: 1.4),
                ),
              )),
        ],
      ),
    );
  }
}