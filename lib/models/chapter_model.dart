class Chapter {
  final int id;
  final int number;
  final String title;
  final String description;
  final int totalPages;
  final double progress; // 0.0 a 1.0

  Chapter({
    required this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.totalPages,
    this.progress = 0.0,
  });
}