import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ideavault/core/routing/app_route_names.dart';
import 'package:ideavault/core/utils/app_colors.dart';
import 'package:ideavault/core/utils/app_styles.dart';

class IdeaCard extends StatelessWidget {
  final String title;
  final String content;

  const IdeaCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRouteNames.editIdea, pathParameters: {'id': '123'});
      },
      borderRadius: BorderRadius.circular(
        12.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.cardBackground
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.heading),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: AppStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}