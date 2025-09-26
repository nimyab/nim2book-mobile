import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ThemeContext extends ChangeNotifier {
  final ThemeService _themeService = GetIt.I<ThemeService>();

  AppTheme _currentTheme = AppTheme.system;

  AppTheme get currentTheme => _currentTheme;

  ThemeMode get themeMode => _themeService.getThemeMode();

  void initialize() {
    _currentTheme = _themeService.currentTheme;
    notifyListeners();
  }

  Future<void> setTheme(AppTheme theme) async {
    _currentTheme = theme;
    await _themeService.setTheme(theme);
    notifyListeners();
  }

  String getThemeName(AppTheme theme, AppLocalizations l10n) {
    return _themeService.getThemeName(theme, l10n);
  }
}
