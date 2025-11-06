import 'package:flutter_riverpod/legacy.dart';
import 'package:ideavault/features/ideas/domain/idea.dart';

class IdeasNotifier extends StateNotifier<List<Idea>> {
  
  IdeasNotifier()
    : super([]);

  /// Adds a new Idea to the state list.
  ///
  /// Generates a unique id based on the current timestamp, constructs an
  /// Idea object with the provided title and content, and appends it to the
  /// existing state list.
  void addIdea({required String title, required String content}) {
    // Create a new Idea with a simple timestamp-based unique id.
    final newIdea = Idea(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );

    // Append the new idea to the existing state list immutably.
    state = [...state, newIdea];
  }

  /// Updates an existing Idea in the state list.
  ///
  /// Finds the idea by [id]. If not found, returns early. Otherwise creates a
  /// copy of the idea with any provided non-null [title] and/or [content],
  /// replaces the original in a new list (immutably) and assigns it to state.
  void updateIdea(String id, {String? title, String? content}) {
    // Locate the index of the idea to update.
    final ideaIndex = state.indexWhere((i) => i.id == id);
    if (ideaIndex == -1) return; // Nothing to do if the idea doesn't exist.

    // Get the existing idea and create an updated copy using copyWith.
    final existingIdea = state[ideaIndex];
    final updatedIdea = existingIdea.copyWith(
      title: title ?? existingIdea.title,
      content: content ?? existingIdea.content,
    );

    // Replace the item in a new list to keep state updates immutable.
    final updatedIdeas = List<Idea>.from(state);
    updatedIdeas[ideaIndex] = updatedIdea;


    // Update the state with the modified list.
    state = updatedIdeas;
  }

  void deleteIdea(String id) {
    state = state.where((idea) => idea.id != id).toList();
  }
}

final ideasProvider = StateNotifierProvider<IdeasNotifier, List<Idea>>((ref) {
  return IdeasNotifier();
});
