import 'package:flutter/material.dart';
import '../../models/quiz_model.dart';
import 'fill_in_blank_input.dart';

class QuizCard extends StatefulWidget {
  final QuizData quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  final TextEditingController _ctrl = TextEditingController();
  bool _revealed = false;
  String _userInput = '';
  Color? _borderColor;

  // Genera la pista con guiones bajos según la longitud de la respuesta
  String get _hint {
  final answer = widget.quiz.answer;
  return '_' * answer.length;
  }

  bool get _isCorrect {
    // Comparar solo con la respuesta en cirílico, sin transliteración
    final input = _userInput.trim().toLowerCase();
    return input == widget.quiz.answer.toLowerCase();
  }

  bool get _isFilled {
    // Si la cadena aún contiene guiones bajos, no está completamente rellenada
    return !_userInput.contains('_');
  }

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_onInputChange);
  }

  void _onInputChange() {
    // No se necesita acción aquí porque FillInBlankInput llama a onChanged
  }

  void _onUserInputChanged(String value) {
    setState(() {
      _userInput = value;

      // Determinar color del borde
      if (_isFilled) {
        if (_isCorrect) {
          _borderColor = Colors.green;
          // Auto-revelar si es correcto
          if (!_revealed) {
            _revealed = true;
          }
        } else {
          _borderColor = Colors.red;
        }
      } else {
        _borderColor = null; // color por defecto
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
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
          const SizedBox(height: 12),
          // Campo de entrada con pista de guiones
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FillInBlankInput(
                  hint: _hint,
                  answer: widget.quiz.answer,
                  onChanged: _onUserInputChanged,
                  controller: _ctrl,
                  borderColor: _borderColor,
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () => setState(() => _revealed = true),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
          // Texto informativo
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Escribe en ruso (cirílico) – no se acepta transliteración',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          // Respuesta revelada
          if (_revealed || (_userInput.isNotEmpty && _isFilled && _isCorrect))
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _isCorrect
                      ? const Color(0xFFEAF3DE)
                      : const Color(0xFFE8E4D9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: _isCorrect
                        ? const Color(0xFF97C459)
                        : const Color(0xFFD6D1C4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.quiz.answer,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3B6D11),
                      ),
                    ),
                    const SizedBox(height: 6),
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
            ),
        ],
      ),
    );
  }
}