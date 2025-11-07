import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ideavault/core/utils/app_colors.dart';
import 'package:ideavault/core/utils/app_styles.dart';
import 'package:ideavault/features/ideas/application/theme_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.primary,
        ),
      body:  SwitchListTile(value: themeMode == ThemeMode.dark,
       onChanged: (bool value) {
        ref.read(themeNotifierProvider.notifier).toggleTheme();
      }, 
      title: Text('Dark Mode', 
      style: AppStyles.heading.copyWith(
        color: AppColors.textSecondary,
      )
      ),
      tileColor: AppColors.secondary,
      activeThumbColor: AppColors.primary,
      inactiveThumbColor: AppColors.primary,
      inactiveTrackColor: AppColors.secondary,
      ),
    );
  }
}
