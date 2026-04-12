// lib/data/chapter5/chapter5_quizzes.dart

import 'package:russia_guide/models/quiz_model.dart';

const QuizData quizSimPurchase = QuizData(
  question:
      '¿Qué documento NO es obligatorio para comprar una SIM en el aeropuerto ruso?',
  correctAnswer: 'Tarjeta de embarque del vuelo',
  options: [
    'Pasaporte original',
    'Tarjeta de embarque del vuelo',
    'Visa vigente (para no ciudadanos CEI)',
  ],
  explanation:
      'El vendedor necesita tu pasaporte (para escanearlo) y tu visa vigente '
      'si no eres de un país de la CEI. La tarjeta de embarque no es '
      'requerida y puedes guardarla o desecharla antes del mostrador.',
);

const QuizData quizOperatorSupport = QuizData(
  question: '¿Cuál es el número de soporte gratuito de МТС dentro de Rusia?',
  correctAnswer: '0890',
  options: [
    '0500',
    '0890',
    '611',
  ],
  explanation:
      '0890 es el número de atención al cliente de МТС, gratuito desde '
      'cualquier teléfono МТС. El 0500 corresponde a Мегафон y el 611 '
      'a Tele2. Guarda los tres en tu agenda por si necesitas cambiar de operador.',
);