import 'package:flutter/material.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/features/ideas/application/idea_provider.dart';
import 'package:ideavault/features/ideas/presentation/widgets/idea_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ideaProvider = context.watch<IdeaProvider>();
    final ideas = ideaProvider.ideas;

    return Scaffold(
      appBar: AppBar(title: const Text('Ideas')),
      body: ideas.isEmpty
          ? const Center(child: Text('No ideas yet. Add one!'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: ideas.length,
              itemBuilder: (context, index) {
                final idea = ideas[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: IdeaCard(
                    idea: idea,
                    onTap: () {
                      context.goNamed(
                        AppRouteNames.editIdea,
                        pathParameters: {'id': idea.id},
                      );
                    },
                    onDelete: () {
                      context.read<IdeaProvider>().deleteIdea(idea.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
          context.goNamed(AppRouteNames.newIdea),
        child: const Icon(Icons.add),
      ),
    );
  }
}
