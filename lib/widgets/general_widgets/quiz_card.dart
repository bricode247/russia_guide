import 'package:flutter/material.dart';
import 'package:russia_guide/models/quiz_model.dart';

class QuizCard extends StatefulWidget {
  final QuizData quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  bool _revealed = false;
  String? _selectedOption;
  bool _isCorrect = false;

  void _checkAnswer(String option) {
    setState(() {
      _selectedOption = option;
      _isCorrect = option == widget.quiz.correctAnswer;
      _revealed = true;
    });
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
          // Etiqueta "Mini Quiz"
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Pregunta
          Text(
            widget.quiz.question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Opciones (tres botones)
          ...widget.quiz.options.map((option) {
            bool isSelected = _selectedOption == option;
            bool isCorrectOption = option == widget.quiz.correctAnswer;
            Color? buttonColor;
            if (_revealed && isSelected) {
              buttonColor = isCorrectOption ? Colors.green : Colors.red;
            } else if (_revealed && !isSelected && isCorrectOption) {
              buttonColor = Colors.green; // mostrar la correcta aunque no la haya elegido
            } else {
              buttonColor = const Color(0xFFE0E0E0);
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                onPressed: _revealed ? null : () => _checkAnswer(option),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 14),
                ),
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          // Explicación (solo si se ha respondido)
          if (_revealed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _isCorrect ? const Color(0xFFEAF3DE) : const Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _isCorrect ? const Color(0xFF97C459) : const Color(0xFFFFC0C0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isCorrect ? '✅ ¡Correcto!' : '❌ Incorrecto',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _isCorrect ? const Color(0xFF3B6D11) : const Color(0xFFD32F2F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.quiz.explanation,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5F5E5A),
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
}