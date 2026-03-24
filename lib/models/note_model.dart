class Note {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime modifiedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.modifiedAt,
  });
}