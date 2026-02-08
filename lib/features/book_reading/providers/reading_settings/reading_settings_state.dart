import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_settings_state.freezed.dart';

@freezed
abstract class ReadingSettingsState with _$ReadingSettingsState {
  const factory ReadingSettingsState({
    @Default('System') final String fontFamily,
    @Default(24.0) final double fontSize,
    @Default(Colors.black) final Color backgroundColor,
    @Default(Colors.white) final Color textColor,
    @Default(false) final bool isTranslatedVisible,
    @Default(false) final bool isFullscreen,
    @Default(-1) final int lastSelectionParagraphIndex,
    @Default(-1) final int lastSelectionWordIndex,
    @Default(1.3) final double lineHeight,
    @Default(10.0) final double sidePadding,
    @Default(1.5) final double firstLineIndentEm,
    @Default(7.0) final double paragraphSpacing,
    @Default(TextAlign.justify) final TextAlign textAlign,
    @Default(20.0) final double translatedFontSize,
    @Default('System') final String translatedFontFamily,
    @Default(5.0) final double translatedVerticalPadding,
  }) = _ReadingSettingsState;
}
