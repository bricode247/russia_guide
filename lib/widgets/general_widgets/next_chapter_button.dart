import 'package:flutter/material.dart';
import '../../data/general_data/chapters_repository.dart';
import '../../models/chapter_model.dart';

class NextChapterButton extends StatelessWidget {
  final Chapter currentChapter;

  const NextChapterButton({super.key, required this.currentChapter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final next = ChaptersRepository.getNextChapter(currentChapter);
          if (next != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChaptersRepository.getScreenForChapter(next),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Próximamente más capítulos.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A73E8), // Azul primario
          foregroundColor: Colors.white, // Texto blanco
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Siguiente capítulo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}