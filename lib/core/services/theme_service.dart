import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, system }

class ThemeService {
  static const String _themeKey = 'app_theme';

  final SharedPreferences _sharedPreferences = GetIt.I<SharedPreferences>();

  AppTheme get currentTheme {
    final themeIndex = _sharedPreferences.getInt(_themeKey);
    if (themeIndex == null) return AppTheme.system;
    return AppTheme.values[themeIndex];
  }

  Future<void> setTheme(final AppTheme theme) async {
    await _sharedPreferences.setInt(_themeKey, theme.index);
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

  String getThemeName(final AppTheme theme, final AppLocalizations l10n) {
    switch (theme) {
      case AppTheme.light:
        return l10n.light;
      case AppTheme.dark:
        return l10n.dark;
      case AppTheme.system:
        return l10n.system;
    }
  }
}
