import 'package:flutter/material.dart';

class VisaTypeCard extends StatelessWidget {
  final Map<String, String> data;
  const VisaTypeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0DDD5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFD1170E),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data['type']!,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0EDE4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        data['duration']!,
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5F5E5A)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(data['for']!,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF5F5E5A))),
                const SizedBox(height: 3),
                Text(
                  data['note']!,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF888780),
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}