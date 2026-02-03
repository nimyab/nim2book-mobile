import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_state.freezed.dart';

@freezed
sealed class ReadingState with _$ReadingState {
  const factory ReadingState({
    @Default(16.0) double fontSize,
    @Default(1.5) double lineHeight,
    @Default('default') String fontFamily,
    @Default(20.0) double sidePadding,
    @Default(2.0) double firstLineIndentEm,
    @Default(8.0) double paragraphSpacing,
    @Default(TextAlign.justify) TextAlign textAlign,
    Color? backgroundColor,
    Color? textColor,
    @Default(false) bool isLoading,
  }) = _ReadingState;
}
