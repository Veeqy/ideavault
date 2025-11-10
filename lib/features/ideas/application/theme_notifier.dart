import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light); // Default to light mode
  void toggleTheme() {
// toggle ThemeMode, preserving system if present
if (state == ThemeMode.light) {
  state = ThemeMode.dark;
} else if (state == ThemeMode.dark) {
  state = ThemeMode.light;
} 
}
}
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});