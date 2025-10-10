
import 'package:flutter/material.dart';
import 'package:ideavault/features/ideas/presentation/widgets/idea_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('IdeaVault'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: const[
    IdeaCard(
    title: 'My Great App Idea',
    content: 'A detailed description of my fantastic app idea...',
    ),
    SizedBox(height: 16.0),
  IdeaCard(
    title: 'Another Brilliant Idea',
    content: 'This idea is even better than the last one...',
  ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
