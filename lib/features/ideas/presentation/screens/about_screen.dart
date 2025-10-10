import 'package:flutter/material.dart';
import 'package:ideavault/core/utils/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About'),
      backgroundColor: AppColors.primary,
      ),
    );
  }
}
