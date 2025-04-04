class Task {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  bool isCompleted;
  String category;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
    this.category = 'Geral',
  });
}