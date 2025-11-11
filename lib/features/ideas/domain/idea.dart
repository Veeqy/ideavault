class Idea {
  final String id;
  final String title;
  final String content;
  final String? category;
  final List<String> tags;
  dynamic copyWith({
    String? title,
    String? content,
    String? category,
    List<String>? tags,
  }) {
    return Idea(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      tags: tags ?? this.tags,
    );
  }

  Idea({
    required this.id,
    required this.title,
    required this.content,
    this.category,
    this.tags = const [], // Default to an empty list for safety
  });
}