import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system); // Default to light mode
  void toggleTheme() {
// toggle ThemeMode, preserving system if present
if (state == ThemeMode.light) {
  state = ThemeMode.dark;
} else if (state == ThemeMode.dark) {
  state = ThemeMode.light;
} else {
  // keep system or set a default
  state = ThemeMode.system;
} 
}
}
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});