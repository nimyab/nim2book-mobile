import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/theme/theme_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ThemeNotifier extends Notifier<ThemeState> {
  late final ThemeService _themeService;

  @override
  ThemeState build() {
    _themeService = ref.read(themeServiceProvider);
    final theme = _themeService.currentTheme;
    return ThemeState(
      currentTheme: theme,
      themeMode: _themeService.getThemeMode(),
    );
  }

  Future<void> setTheme(final AppTheme theme) async {
    await _themeService.setTheme(theme);
    state = state.copyWith(
      currentTheme: theme,
      themeMode: _themeService.getThemeMode(),
    );
  }

  String getThemeName(final AppTheme theme, final AppLocalizations l10n) {
    return _themeService.getThemeName(theme, l10n);
  }
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeState>(
  ThemeNotifier.new,
);
