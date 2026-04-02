import 'package:flutter/material.dart';
import '../../models/chapter_model.dart';
import '../../screens/chapter0/chapter0_screen.dart';
import '../../screens/chapter1/chapter1_screen.dart';

class ChaptersRepository {
  // Lista única de capítulos
  static final List<Chapter> _chapters = [
    Chapter(
      id: 0,
      number: 0,
      title: 'Introducción',
      description: 'Bienvenida y primeras palabras en ruso',
      totalPages: 1,
      progress: 0.0,
    ),
    Chapter(
      id: 1,
      number: 1,
      title: 'Desde tu casa hasta el aeropuerto',
      description: 'Visa, dinero, equipaje y toda la preparación previa',
      totalPages: 1,
      progress: 0.0,
    ),
  ];

  // Obtener todos los capítulos
  static List<Chapter> getAll() => _chapters;

  // Obtener la pantalla asociada a un capítulo
  static Widget getScreenForChapter(Chapter chapter) {
    switch (chapter.id) {
      case 0:
        return Chapter0Screen(chapter: chapter);
      case 1:
        return Chapter1Screen(chapter: chapter);
      default:
        // Fallback seguro (no debería ocurrir)
        return const SizedBox();
    }
  }

  // Obtener el siguiente capítulo a partir del actual
  static Chapter? getNextChapter(Chapter current) {
    final index = _chapters.indexWhere((c) => c.id == current.id);
    if (index != -1 && index + 1 < _chapters.length) {
      return _chapters[index + 1];
    }
    return null;
  }

  // Obtener el capítulo anterior a partir del actual
  static Chapter? getPreviousChapter(Chapter current) {
    final index = _chapters.indexWhere((c) => c.id == current.id);
    if (index > 0) {
      return _chapters[index - 1];
    }
    return null;
  }
}