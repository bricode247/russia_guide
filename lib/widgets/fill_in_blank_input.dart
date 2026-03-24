import 'package:flutter/material.dart';

class FillInBlankInput extends StatefulWidget {
  final String hint;          // Cadena con guiones consecutivos, ej: "______"
  final String answer;        // Respuesta correcta completa
  final Function(String) onChanged;
  final TextEditingController? controller;
  final Color? borderColor;

  const FillInBlankInput({
    super.key,
    required this.hint,
    required this.answer,
    required this.onChanged,
    this.controller,
    this.borderColor,
  });

  @override
  State<FillInBlankInput> createState() => _FillInBlankInputState();
}

class _FillInBlankInputState extends State<FillInBlankInput> {
  late TextEditingController _controller;
  late List<String> _letters;     // letras escritas en cada posición de guión
  late int _underscoreCount;      // número de guiones

  @override
  void initState() {
    super.initState();
    // Contar guiones en la hint
    _underscoreCount = widget.hint.split('').where((c) => c == '_').length;
    _letters = List.filled(_underscoreCount, '');
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _updateDisplay();
  }

  void _onTextChanged() {
    final newText = _controller.text;
    final oldText = _getDisplayText();

    if (newText == oldText) return;

    if (newText.length > oldText.length) {
      // Se añadió un carácter
      final addedChar = newText[newText.length - 1];
      // Buscar el primer guión vacío
      int index = -1;
      for (int i = 0; i < _letters.length; i++) {
        if (_letters[i].isEmpty) {
          index = i;
          break;
        }
      }
      if (index != -1) {
        _letters[index] = addedChar;
      }
    } else if (newText.length < oldText.length) {
      // Se borró un carácter
      // Encontrar el último guión no vacío
      for (int i = _letters.length - 1; i >= 0; i--) {
        if (_letters[i].isNotEmpty) {
          _letters[i] = '';
          break;
        }
      }
    }

    _updateDisplay();
    // Enviar la cadena completa (sin guiones) al callback
    widget.onChanged(_getFilledText());
  }

  String _getDisplayText() {
    // Construir la cadena mostrada: reemplazar cada guión por la letra correspondiente
    // La cadena de hint puede tener otros caracteres (por ejemplo, si hay espacios o símbolos).
    // Asumimos que solo los '_' son reemplazables.
    final List<String> chars = widget.hint.split('');
    int letterIndex = 0;
    for (int i = 0; i < chars.length; i++) {
      if (chars[i] == '_' && letterIndex < _letters.length) {
        if (_letters[letterIndex].isNotEmpty) {
          chars[i] = _letters[letterIndex];
        }
        letterIndex++;
      }
    }
    return chars.join();
  }

  String _getFilledText() {
    // Devolver solo las letras escritas (sin guiones ni espacios)
    // Es la concatenación de _letters (solo las no vacías, pero todas están en orden)
    return _letters.join();
  }

  void _updateDisplay() {
    final newText = _getDisplayText();
    if (_controller.text != newText) {
      _controller.text = newText;
      _controller.selection = TextSelection.collapsed(offset: newText.length);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.borderColor ?? const Color(0xFFD6D1C4);
    Color focusedBorderColor = widget.borderColor ?? const Color(0xFF1A73E8);

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Escribe en ruso (cirílico)',
        hintStyle: TextStyle(fontSize: 13, color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}