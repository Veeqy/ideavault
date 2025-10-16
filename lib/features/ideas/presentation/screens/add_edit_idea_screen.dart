import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ideavault/core/routing/app_route_names.dart';

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
    if (isEditing) {
      _titleController.text = 'This is an existing idea';
      _contentController.text =
          'Here are the details of the idea I am editing.';
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
