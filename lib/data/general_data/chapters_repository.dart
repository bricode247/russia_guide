// lib/data/general_data/chapters_repository.dart
import 'package:flutter/material.dart';
import 'package:russia_guide/models/chapter_model.dart';
import 'package:russia_guide/screens/chapter0/chapter0_screen.dart';
import 'package:russia_guide/screens/chapter1/chapter1_screen.dart';
import 'package:russia_guide/screens/chapter2/chapter2_screen.dart';
import 'package:russia_guide/screens/chapter3/chapter3_screen.dart';
import 'package:russia_guide/screens/chapter4/chapter4_screen.dart';

class ChaptersRepository {
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
    Chapter(
      id: 2,
      number: 2,
      title: 'Aeropuerto de salida',
      description: 'Desde que llegas hasta que abordas',
      totalPages: 1,
      progress: 0.0,
    ),
    Chapter(
      id: 3,
      number: 3,
      title: 'El vuelo',
      description: 'Desde que abordas hasta que aterrizas',
      totalPages: 1,
      progress: 0.0,
    ),
    Chapter(
      id: 4,
      number: 4,
      title: 'Llegada a Rusia',
      description: 'Desde que bajas del avión hasta que sales del aeropuerto',
      totalPages: 1,
      progress: 0.0,
    ),
  ];

  static List<Chapter> getAll() => _chapters;

  static Widget getScreenForChapter(Chapter chapter) {
    switch (chapter.id) {
      case 0:
        return Chapter0Screen(chapter: chapter);
      case 1:
        return Chapter1Screen(chapter: chapter);
      case 2:
        return Chapter2Screen(chapter: chapter);
      case 3:
        return Chapter3Screen(chapter: chapter);
      case 4:
        return Chapter4Screen(chapter: chapter);
      default:
        return const SizedBox();
    }
  }

  static Chapter? getNextChapter(Chapter current) {
    final index = _chapters.indexWhere((c) => c.id == current.id);
    if (index != -1 && index + 1 < _chapters.length) {
      return _chapters[index + 1];
    }
    return null;
  }

  static Chapter? getPreviousChapter(Chapter current) {
    final index = _chapters.indexWhere((c) => c.id == current.id);
    if (index > 0) {
      return _chapters[index - 1];
    }
    return null;
  }
}