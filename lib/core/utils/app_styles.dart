import 'package:flutter/material.dart';
import 'package:ideavault/core/utils/app_colors.dart';

class AppStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    color: AppColors.textSecondary,
  );
}