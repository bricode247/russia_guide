import '../../models/chapter_model.dart';
import '../../models/note_model.dart';

final List<Chapter> mockChapters = [
  Chapter(
    id: 1,
    number: 1,
    title: 'Introducción a Rusia',
    description: 'Historia, geografía y datos básicos',
    totalPages: 15,
    progress: 0.3,
  ),
  Chapter(
    id: 2,
    number: 2,
    title: 'Visados y documentación',
    description: 'Todo sobre trámites legales',
    totalPages: 22,
    progress: 0.0,
  ),
  Chapter(
    id: 3,
    number: 3,
    title: 'Alojamiento',
    description: 'Cómo encontrar vivienda',
    totalPages: 18,
    progress: 0.0,
  ),
];

final List<Note> mockNotes = [
  Note(
    id: 1,
    title: 'Documentos necesarios',
    content: 'Pasaporte, visa, registro migratorio...',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    modifiedAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Note(
    id: 2,
    title: 'Teléfonos útiles',
    content: 'Embajada: +7...',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
    modifiedAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
];