import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/theme/theme_state.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeService _themeService = GetIt.I<ThemeService>();

  ThemeCubit() : super(const ThemeState()) {
    final theme = _themeService.currentTheme;
    emit(
      state.copyWith(
        currentTheme: theme,
        themeMode: _themeService.getThemeMode(),
      ),
    );
  }

  Future<void> setTheme(final AppTheme theme) async {
    await _themeService.setTheme(theme);
    emit(
      state.copyWith(
        currentTheme: theme,
        themeMode: _themeService.getThemeMode(),
      ),
    );
  }

  String getThemeName(final AppTheme theme, final AppLocalizations l10n) {
    return _themeService.getThemeName(theme, l10n);
  }
}
