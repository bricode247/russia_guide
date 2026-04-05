// lib/data/chapter3/chapter3_quizzes.dart

import 'package:russia_guide/models/quiz_model.dart';

// ── QUIZ 1: Salud durante el vuelo ──────────────────────────
const QuizData quizFlightHealth = QuizData(
  question: '¿Cada cuánto tiempo se recomienda levantarse a caminar '
      'durante un vuelo largo para prevenir problemas circulatorios?',
  correctAnswer: 'Cada 2 horas aproximadamente',
  options: [
    'Solo si notas molestias en las piernas',
    'Cada 2 horas aproximadamente',
    'Una vez al final del vuelo',
  ],
  explanation: 'La inactividad prolongada en vuelos largos aumenta el riesgo '
      'de trombosis venosa profunda (TVP). Levantarse y caminar cada 1–2 horas, '
      'o al menos realizar ejercicios de tobillo en el asiento, mantiene la '
      'circulación activa. El riesgo sube especialmente en vuelos de más de 6 horas.',
);

// ── QUIZ 2: Documentación para la llegada ───────────────────
const QuizData quizArrivalDocs = QuizData(
  question: '¿Qué documento, además del pasaporte, te entrega la '
      'tripulación durante el vuelo y que necesitas presentar obligatoriamente '
      'al entrar a Rusia?',
  correctAnswer: 'La tarjeta de migración (Миграционная карта)',
  options: [
    'El seguro médico internacional',
    'La tarjeta de migración (Миграционная карта)',
    'Una declaración aduanera de equipaje',
  ],
  explanation: 'La tarjeta de migración es un documento obligatorio para todos '
      'los extranjeros que entran a Rusia. La reparte la tripulación antes de '
      'aterrizar. Debes rellenarla con bolígrafo con tus datos exactamente como '
      'aparecen en el pasaporte, y conservarla durante toda tu estancia en el '
      'país — te la pedirán al salir.',
);