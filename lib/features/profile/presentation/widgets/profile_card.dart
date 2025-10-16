import 'package:flutter/material.dart';
import 'package:ideavault/core/utils/app_colors.dart';
import 'package:ideavault/core/utils/app_styles.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String? myEmail;
  const ProfileCard({
    super.key,
    required this.name,
    required this.subtitle,
    this.myEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.person),
          Text(name, style: AppStyles.heading),
          const SizedBox(height: 8.0),
          Text(subtitle, style: AppStyles.body),
          const SizedBox(height: 8.0),
          Text(myEmail ?? '', style: AppStyles.body )
        ],
      ),
    );
  }
}
