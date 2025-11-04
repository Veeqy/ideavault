import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideavault/features/ideas/application/ideas_notifier.dart';

class AddEditIdeaScreen extends ConsumerStatefulWidget {
  final String? ideaId;

  const AddEditIdeaScreen({super.key, this.ideaId});

  @override
  ConsumerState<AddEditIdeaScreen> createState() => _AddEditIdeaScreenState();
}

class _AddEditIdeaScreenState extends ConsumerState<AddEditIdeaScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _selectedCategory;
  bool isEditing = false;

// bool get editing => widget.ideaId != null;

  @override
  void initState() {
    super.initState();
    if (widget.ideaId != null) {
      isEditing = true;
      _titleController.text = 'This is an existing idea';
      _contentController.text =
          'Here are the details of the idea I am editing.';
    } else {
      isEditing = false;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Idea' : 'New Idea')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await context.pushNamed(
                      AppRouteNames.categoryPicker,
                    );
                    if (result != null && result is String) {
                      setState(() {
                        _selectedCategory = result;
                      });
                    }
                  },
                  child: const Text('Pick Category'),
                ),

                if (_selectedCategory != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Selected Category: $_selectedCategory',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(AppRouteNames.tagPicker);
                  },
                  child: const Text('Tag Picker'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = _titleController.text;
                    final content = _contentController.text;
                     if (title.isNotEmpty && content.isNotEmpty) {
                      final ideaProvider = ref.read(ideasProvider.notifier);
                      ideaProvider.addIdea(title: title, content: content);
                    }
                    context.pop(AppRouteNames.HomeScreen);
                  },
                  child: const Text('Save Idea'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
