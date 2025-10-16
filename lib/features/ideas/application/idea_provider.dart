import 'package:flutter/foundation.dart';
import 'package:ideavault/features/ideas/domain/idea.dart';
import 'dart:collection';

class IdeaProvider with ChangeNotifier {
  final List<Idea> _ideas = [
    // Let's start with some dummy data
    Idea(id: '1', title: 'My First Idea', content: 'This is the content of my first idea.'),
    Idea(id: '2', title: 'Flutter is Awesome', content: 'State management can be fun!'),
  ];

  UnmodifiableListView<Idea> get ideas => UnmodifiableListView(_ideas);

  void addIdea({required String title, required String content}) {
    final newIdea = Idea(
      id: DateTime.now().toIso8601String(),
      title: title,
      content: content,
    );
    _ideas.add(newIdea);
    notifyListeners(); // SHOUT! The list has changed!
  }

  void updateIdea({required String id, required String title, required String content}) {
    final index = _ideas.indexWhere((idea) => idea.id == id);
    if (index != -1) {
      _ideas[index] = Idea(id: id, title: title, content: content);
      notifyListeners(); // SHOUT! The list has changed!
    }
  }

  void deleteIdea(String id) {
    _ideas.removeWhere((idea) => idea.id == id);
    notifyListeners(); // SHOUT! The list has changed!
  }

  Idea? getIdeaById(String id) {
    try {
      return _ideas.firstWhere((idea) => idea.id == id);
    } catch (e) {
      return null;
    }
  }
}