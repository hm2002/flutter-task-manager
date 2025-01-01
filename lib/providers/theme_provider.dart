import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/constants/app_constants.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(_loadTheme());

  static ThemeMode _loadTheme() {
    final box = Hive.box(AppConstants.preferencesBox);
    final savedTheme = box.get(AppConstants.themeModeKey,
        defaultValue: AppConstants.themeModeSystem);
    switch (savedTheme) {
      case AppConstants.themeModeLight:
        return ThemeMode.light;
      case AppConstants.themeModeDark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void updateTheme(ThemeMode mode) {
    state = mode;
    final box = Hive.box(AppConstants.preferencesBox);
    box.put(AppConstants.themeModeKey, mode.name);
  }
}
