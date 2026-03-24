import 'package:flutter/material.dart';
import '../models/quiz_model.dart';

class DoubleQuizCard extends StatefulWidget {
  final QuizData quizA;
  final QuizData quizB;

  const DoubleQuizCard({super.key, required this.quizA, required this.quizB});

  @override
  State<DoubleQuizCard> createState() => _DoubleQuizCardState();
}

class _DoubleQuizCardState extends State<DoubleQuizCard> {
  final TextEditingController _ctrlA = TextEditingController();
  final TextEditingController _ctrlB = TextEditingController();
  bool _revealedA = false;
  bool _revealedB = false;

  bool _isCorrect(String input, QuizData quiz) {
    final clean = input.trim().toLowerCase();
    return clean == quiz.answer.toLowerCase() ||
        clean == quiz.transliteration.toLowerCase();
  }

  @override
  void dispose() {
    _ctrlA.dispose();
    _ctrlB.dispose();
    super.dispose();
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1170E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '🧐  Mini Quiz',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildSingleQuestion(widget.quizA, _ctrlA, _revealedA, () {
            setState(() => _revealedA = true);
          }),
          const Divider(height: 28, color: Color(0xFFD6D1C4)),
          _buildSingleQuestion(widget.quizB, _ctrlB, _revealedB, () {
            setState(() => _revealedB = true);
          }),
        ],
      ),
    );
  }

  Widget _buildSingleQuestion(
    QuizData quiz,
    TextEditingController ctrl,
    bool revealed,
    VoidCallback onReveal,
  ) {
    final correct = _isCorrect(ctrl.text, quiz);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.question,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
              height: 1.4),
        ),
        const SizedBox(height: 8),
        Text(
          quiz.hint,
          style: const TextStyle(
            fontSize: 22,
            letterSpacing: 4,
            fontFamily: 'monospace',
            color: Color(0xFF5F5E5A),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: ctrl,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Escribe en ruso o transliteración...',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFD6D1C4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFD6D1C4)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: onReveal,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 12),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color(0xFFD6D1C4)),
                ),
              ),
              child: const Text(
                'Revelar',
                style: TextStyle(fontSize: 13, color: Color(0xFF5F5E5A)),
              ),
            ),
          ],
        ),
        if (revealed || (ctrl.text.isNotEmpty && correct))
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: correct
                    ? const Color(0xFFEAF3DE)
                    : const Color(0xFFE8E4D9),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: correct
                      ? const Color(0xFF97C459)
                      : const Color(0xFFD6D1C4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: quiz.answer,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3B6D11)),
                        ),
                        TextSpan(
                          text: '  (${quiz.transliteration})',
                          style: const TextStyle(
                              fontSize: 13, color: Color(0xFF639922)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    quiz.explanation,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF5F5E5A),
                        height: 1.5),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}