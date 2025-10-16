import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryPickerScreen extends StatelessWidget {
  const CategoryPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Work', 'Personal', 'Tech', 'Health'];
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Category')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category),
            onTap: () {
              // Pop the screen and return the selected category
              context.pop(category);
            },
          );
        },
      ),
    );
  }
}