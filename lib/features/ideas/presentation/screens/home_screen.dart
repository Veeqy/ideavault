
import 'package:flutter/material.dart';
import 'package:ideavault/core/utils/app_colors.dart';
import 'package:ideavault/features/ideas/presentation/widgets/idea_card.dart';
import 'package:ideavault/features/profile/presentation/profile_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.primary,
        title: const Text('IdeaVault'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: 
        [  ProfileCard(
          name: "Victoria Anoruo",
          subtitle: "Flutter Developer",
        ),
  //   IdeaCard(
  //   title: 'My Great App Idea',
  //   content: 'A detailed description of my fantastic app idea...',
  //   ),
  //   SizedBox(height: 16.0),
  // IdeaCard(
  //   title: 'Another Brilliant Idea',
  //   content: 'This idea is even better than the last one...',
  // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
