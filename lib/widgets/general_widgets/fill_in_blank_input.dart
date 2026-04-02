import 'package:flutter/material.dart';

class FillInBlankInput extends StatefulWidget {
  final String hint;
  final String answer;
  final Function(String) onChanged;
  final Color? borderColor;

  const FillInBlankInput({
    super.key,
    required this.hint,
    required this.answer,
    required this.onChanged,
    this.borderColor,
  });

  @override
  State<FillInBlankInput> createState() => _FillInBlankInputState();
}

class _FillInBlankInputState extends State<FillInBlankInput> {
  late int _letterCount;
  late List<String> _letters;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _letterCount = widget.hint.split('').where((c) => c == '_').length;
    _letters = List.filled(_letterCount, '');
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final rawText = _controller.text;
    // Extraer solo letras cirílicas o latinas (aunque esperamos cirílico)
    final String cleanText = rawText.replaceAll(RegExp(r'[^a-zA-Zа-яА-Я]'), '');
    final List<String> newLetters = List.filled(_letterCount, '');
    for (int i = 0; i < cleanText.length && i < _letterCount; i++) {
      newLetters[i] = cleanText[i];
    }
    setState(() {
      _letters = newLetters;
    });
    widget.onChanged(newLetters.join());
  }

  void _requestFocus() {
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.borderColor ?? const Color(0xFFD6D1C4);

    return Stack(
      children: [
        // TextField oculto que captura la entrada del teclado
        SizedBox(
          height: 0,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: const TextStyle(fontSize: 0, color: Colors.transparent),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        // Contenedor visible con los cuadros de letras
        GestureDetector(
          onTap: _requestFocus,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_letterCount, (index) {
                return Container(
                  width: 40,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _letters[index],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}