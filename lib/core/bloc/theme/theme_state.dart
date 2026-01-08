import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(AppTheme.system) final AppTheme currentTheme,
    @Default(ThemeMode.system) final ThemeMode themeMode,
  }) = _ThemeState;
}
