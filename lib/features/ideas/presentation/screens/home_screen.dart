import 'package:flutter/material.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/features/ideas/presentation/widgets/idea_card.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('IdeaVault'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
             context.pushNamed(AppRouteNames.about);
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          const IdeaCard(
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
        onPressed: (){
            context.push('/new-idea');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
 