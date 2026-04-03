// lib/data/chapter2/chapter2_quizzes.dart

import 'package:russia_guide/models/quiz_model.dart';

const QuizData quizCheckin = QuizData(
  question:
      '¿Qué documentos son OBLIGATORIOS en el mostrador de facturación para un vuelo a Rusia?',
  correctAnswer: 'Pasaporte original y visa rusa',
  options: [
    'Solo el DNI y el ticket del vuelo',
    'Pasaporte original y visa rusa',
    'Carnet de conducir y reserva de hotel',
  ],
  explanation:
      'Para volar a Rusia necesitas pasaporte original (vigente) y que la aerolínea verifique tu visa rusa. Sin visa el vuelo puede ser denegado incluso antes de embarcar.',
);

const QuizData quizProhibited = QuizData(
  question: '¿Cuál de estos objetos NO puede ir en el equipaje de mano (cabina)?',
  correctAnswer: 'Una botella de agua de 500 ml',
  options: [
    'Un portátil en una mochila',
    'Una botella de agua de 500 ml',
    'Auriculares inalámbricos',
  ],
  explanation:
      'Los líquidos en envases de más de 100 ml no están permitidos en cabina. El agua de 500 ml debe comprarse en la zona de embarque, después del control de seguridad.',
);