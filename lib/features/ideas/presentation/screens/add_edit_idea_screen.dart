import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/features/ideas/application/idea_provider.dart';
import 'package:provider/provider.dart';

class AddEditIdeaScreen extends StatefulWidget {
  final String? ideaId;

  const AddEditIdeaScreen({super.key, this.ideaId});

  @override
  State<AddEditIdeaScreen> createState() => _AddEditIdeaScreenState();
}

class _AddEditIdeaScreenState extends State<AddEditIdeaScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  bool get isEditing => widget.ideaId != null;

  @override
  void initState() {
    super.initState();
    final ideaProvider = context.read<IdeaProvider>();
    if (widget.ideaId != null) {
      final idea = ideaProvider.getIdeaById(widget.ideaId!);
      if (idea != null) {
        _titleController.text = idea.title;
        _contentController.text = idea.content;
      }
    }
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
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final content = _contentController.text;

                if (title.isNotEmpty && content.isNotEmpty) {
                  final ideaProvider = context.read<IdeaProvider>();
                  if (isEditing) {
                    ideaProvider.updateIdea(
                      id: widget.ideaId!,
                      title: title,
                      content: content,
                    );
                  } else {
                    ideaProvider.addIdea(title: title, content: content);
                  }
                  context.pop();
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
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRouteNames.tagPicker);
              },
              child: const Text('Tag Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
