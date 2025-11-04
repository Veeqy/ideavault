import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/features/ideas/application/ideas_notifier.dart';
import 'package:ideavault/features/ideas/presentation/widgets/idea_card.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ideas = ref.watch(ideasProvider);
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
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: ideas.isEmpty
        ?[
                const SizedBox(height: 40),
                const Center(child: Text('No ideas yet. Tap + to add one.')),
              ]
            : ideas
                .map((idea) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: IdeaCard(
                        title: idea.title,
                        content: idea.content,
                      ),
                    ))
                .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/new-idea');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
