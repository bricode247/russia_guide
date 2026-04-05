// lib/data/chapter4/chapter4_quizzes.dart

import 'package:russia_guide/models/quiz_model.dart';

// ── QUIZ 1: CONTROL DE PASAPORTES ─────────────────────────
const QuizData quizPassportControl = QuizData(
  question:
      '¿Cuál de los siguientes documentos NO es obligatorio presentar en el '
      'control de pasaportes de un aeropuerto ruso?',
  correctAnswer: 'Tarjeta de crédito internacional',
  options: [
    'Pasaporte con visa válida',
    'Tarjeta de crédito internacional',
    'Seguro médico impreso',
  ],
  explanation:
      'En el control de pasaportes rusos debes presentar tu pasaporte '
      'con la visa, el seguro médico (impreso o con respaldo físico) y, '
      'si aplica, la tarjeta de migración ya rellena. La tarjeta de crédito '
      'no es un documento requerido en inmigración — te servirá después, '
      'pero no aquí.',
);

// ── QUIZ 2: ADUANAS ────────────────────────────────────────
const QuizData quizCustoms = QuizData(
  question:
      '¿A partir de qué cantidad de dinero en efectivo estás obligado a '
      'declararlo en la aduana rusa y usar el canal rojo?',
  correctAnswer: '10.000 USD (o equivalente en otras monedas)',
  options: [
    '5.000 USD (o equivalente en otras monedas)',
    '10.000 USD (o equivalente en otras monedas)',
    '20.000 USD (o equivalente en otras monedas)',
  ],
  explanation:
      'El límite para declarar efectivo en la aduana rusa es de 10.000 USD '
      'o su equivalente en cualquier otra moneda. Si llevas esa cantidad o '
      'más — en efectivo, cheques de viaje u otros instrumentos monetarios — '
      'debes pasar por el canal rojo y cumplimentar una declaración aduanera. '
      'No hacerlo puede resultar en multas graves o confiscación.',
);