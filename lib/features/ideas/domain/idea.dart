// In lib/features/ideas/domain/idea.dart
class Idea {
  final String id;
  final String title;
  final String content;
  final String? category;
  final List<String> tags;

  Idea({
    required this.id,
    required this.title,
    required this.content,
    this.category,
    this.tags = const [], // Default to an empty list for safety
  });
}