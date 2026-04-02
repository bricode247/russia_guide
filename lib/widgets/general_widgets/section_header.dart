import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String emoji;

  const SectionHeader({
    super.key,
    required this.title,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 2,
          width: 48,
          margin: const EdgeInsets.only(left: 32, bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFD1170E),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}