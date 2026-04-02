class QuizData {
  final String question;
  final String correctAnswer;
  final List<String> options; // Tres opciones, una es la correcta
  final String explanation;

  const QuizData({
    required this.question,
    required this.correctAnswer,
    required this.options,
    required this.explanation,
  });
}