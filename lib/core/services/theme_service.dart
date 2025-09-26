import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme {
  light,
  dark,
  system,
}

class ThemeService {
  static const String _themeKey = 'app_theme';
  
  final SharedPreferences _prefs = GetIt.I<SharedPreferences>();

  AppTheme get currentTheme {
    final themeIndex = _prefs.getInt(_themeKey);
    if (themeIndex == null) return AppTheme.system;
    return AppTheme.values[themeIndex];
  }

  Future<void> setTheme(AppTheme theme) async {
    await _prefs.setInt(_themeKey, theme.index);
  }

  ThemeMode getThemeMode() {
    switch (currentTheme) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
        return ThemeMode.system;
    }
  }

  String getThemeName(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
      case AppTheme.system:
        return 'System';
    }
  }
}