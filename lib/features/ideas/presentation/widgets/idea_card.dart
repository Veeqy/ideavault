import 'package:flutter/material.dart';
import 'package:ideavault/core/utils/app_colors.dart';
import 'package:ideavault/features/ideas/domain/idea.dart';

class IdeaCard extends StatelessWidget {
  final Idea idea;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  const IdeaCard({super.key, required this.idea, this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: AppColors.cardBackground),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    idea.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    idea.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
