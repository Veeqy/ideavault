import 'package:flutter/material.dart';
import 'package:ideavault/core/utils/app_colors.dart';

class ProfileCard extends  StatelessWidget{
   final String name;
  final String subtitle;

  const ProfileCard({
    super.key,
    required this.name,
    required this.subtitle,
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
          Text(
            name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14.0, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}