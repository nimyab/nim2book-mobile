import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_settings_service.dart';

class ReadingSettingsState {
  final String fontFamily;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final bool isTranslatedVisible;
  final bool isFullscreen;
  final int lastSelectionParagraphIndex;
  final int lastSelectionWordIndex;
  final double lineHeight;
  final double sidePadding;
  final double firstLineIndentEm;
  final double paragraphSpacing;
  final TextAlign textAlign;
  final double translatedFontSize;
  final String translatedFontFamily;
  final double translatedVerticalPadding;

  const ReadingSettingsState({
    this.fontFamily = 'System',
    this.fontSize = 24.0,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.isTranslatedVisible = false,
    this.isFullscreen = false,
    this.lastSelectionParagraphIndex = -1,
    this.lastSelectionWordIndex = -1,
    this.lineHeight = 1.3,
    this.sidePadding = 10.0,
    this.firstLineIndentEm = 1.5,
    this.paragraphSpacing = 7.0,
    this.textAlign = TextAlign.justify,
    this.translatedFontSize = 20.0,
    this.translatedFontFamily = 'System',
    this.translatedVerticalPadding = 5.0,
  });

  ReadingSettingsState copyWith({
    final String? fontFamily,
    final double? fontSize,
    final Color? backgroundColor,
    final Color? textColor,
    final bool? isTranslatedVisible,
    final bool? isFullscreen,
    final int? lastSelectionParagraphIndex,
    final int? lastSelectionWordIndex,
    final double? lineHeight,
    final double? sidePadding,
    final double? firstLineIndentEm,
    final double? paragraphSpacing,
    final TextAlign? textAlign,
    final double? translatedFontSize,
    final String? translatedFontFamily,
    final double? translatedVerticalPadding,
  }) {
    return ReadingSettingsState(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      isTranslatedVisible: isTranslatedVisible ?? this.isTranslatedVisible,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      lastSelectionParagraphIndex:
          lastSelectionParagraphIndex ?? this.lastSelectionParagraphIndex,
      lastSelectionWordIndex:
          lastSelectionWordIndex ?? this.lastSelectionWordIndex,
      lineHeight: lineHeight ?? this.lineHeight,
      sidePadding: sidePadding ?? this.sidePadding,
      firstLineIndentEm: firstLineIndentEm ?? this.firstLineIndentEm,
      paragraphSpacing: paragraphSpacing ?? this.paragraphSpacing,
      textAlign: textAlign ?? this.textAlign,
      translatedFontSize: translatedFontSize ?? this.translatedFontSize,
      translatedFontFamily: translatedFontFamily ?? this.translatedFontFamily,
      translatedVerticalPadding:
          translatedVerticalPadding ?? this.translatedVerticalPadding,
    );
  }
}

class ReadingSettingsCubit extends Cubit<ReadingSettingsState> {
  final ReadingSettingsService _service = GetIt.I.get<ReadingSettingsService>();

  ReadingSettingsCubit(final ThemeData theme)
    : super(const ReadingSettingsState()) {
    final initial = ReadingSettingsState(
      fontFamily: _service.getFontFamily() ?? state.fontFamily,
      fontSize: _service.getFontSize() ?? state.fontSize,
      textAlign: _service.getTextAlign() ?? state.textAlign,
      translatedFontSize:
          _service.getTranslatedFontSize() ?? state.translatedFontSize,
      translatedFontFamily:
          _service.getTranslatedFontFamily() ?? state.translatedFontFamily,
      translatedVerticalPadding: _service.getTranslatedVerticalPadding(),
      backgroundColor:
          _service.getBackgroundColor() ?? theme.colorScheme.surface,
      textColor:
          _service.getTextColor() ??
          (theme.textTheme.bodyLarge?.color ?? theme.colorScheme.onSurface),
      lineHeight: _service.getLineHeight() ?? state.lineHeight,
      sidePadding: _service.getSidePadding() ?? state.sidePadding,
      firstLineIndentEm:
          _service.getFirstLineIndentEm() ?? state.firstLineIndentEm,
      paragraphSpacing:
          _service.getParagraphSpacing() ?? state.paragraphSpacing,
    );
    emit(initial);
  }

  Future<void> setFontFamily(final String value) async {
    if (state.fontFamily == value) return;
    await _service.setFontFamily(value);
    emit(state.copyWith(fontFamily: value));
  }

  Future<void> setFontSize(final double value) async {
    if (state.fontSize == value) return;
    await _service.setFontSize(value);
    emit(state.copyWith(fontSize: value));
  }

  Future<void> setBackgroundColor(final Color value) async {
    if (state.backgroundColor == value) return;
    await _service.setBackgroundColor(value);
    emit(state.copyWith(backgroundColor: value));
  }

  Future<void> setTextColor(final Color value) async {
    if (state.textColor == value) return;
    await _service.setTextColor(value);
    emit(state.copyWith(textColor: value));
  }

  void setTranslatedVisible({required final bool value}) {
    if (state.isTranslatedVisible == value) return;
    emit(state.copyWith(isTranslatedVisible: value));
  }

  void setFullscreen({required final bool value}) {
    if (state.isFullscreen == value) return;
    emit(state.copyWith(isFullscreen: value));
  }

  void setLastSelection(final int paragraphIndex, final int wordIndex) {
    if (state.lastSelectionParagraphIndex == paragraphIndex &&
        state.lastSelectionWordIndex == wordIndex) {
      return;
    }
    emit(
      state.copyWith(
        lastSelectionParagraphIndex: paragraphIndex,
        lastSelectionWordIndex: wordIndex,
      ),
    );
  }

  void setLineHeight(final double value) {
    if (state.lineHeight == value) return;
    emit(state.copyWith(lineHeight: value));
  }

  void setSidePadding(final double value) {
    if (state.sidePadding == value) return;
    emit(state.copyWith(sidePadding: value));
  }

  void setFirstLineIndentEm(final double value) {
    if (state.firstLineIndentEm == value) return;
    emit(state.copyWith(firstLineIndentEm: value));
  }

  void setParagraphSpacing(final double value) {
    if (state.paragraphSpacing == value) return;
    emit(state.copyWith(paragraphSpacing: value));
  }

  Future<void> setTextAlign(final TextAlign value) async {
    if (state.textAlign == value) return;
    await _service.setTextAlign(value);
    emit(state.copyWith(textAlign: value));
  }

  Future<void> setTranslatedFontSize(final double value) async {
    if (state.translatedFontSize == value) return;
    await _service.setTranslatedFontSize(value);
    emit(state.copyWith(translatedFontSize: value));
  }

  Future<void> setTranslatedFontFamily(final String value) async {
    if (state.translatedFontFamily == value) return;
    await _service.setTranslatedFontFamily(value);
    emit(state.copyWith(translatedFontFamily: value));
  }

  Future<void> setTranslatedVerticalPadding(final double value) async {
    if (state.translatedVerticalPadding == value) return;
    await _service.setTranslatedVerticalPadding(value);
    emit(state.copyWith(translatedVerticalPadding: value));
  }

  // Обновляет последний выбор и, при необходимости, включает перевод одним эмитом
  void applySelection(final int? paragraphIndex, final int? wordIndex) {
    final newParagraph = paragraphIndex ?? -1;
    final newWord = wordIndex ?? -1;
    // Игнорируем изменения только слова внутри того же абзаца
    final sameParagraph = state.lastSelectionParagraphIndex == newParagraph;
    final wordOnlyChange =
        sameParagraph && state.lastSelectionWordIndex != newWord;
    // Если перевод уже видим, игнорируем чисто смену слова;
    // если перевод скрыт — не игнорируем, чтобы показать панель перевода.
    if (wordOnlyChange && state.isTranslatedVisible) return;

    final shouldShowTranslated =
        paragraphIndex != null &&
        wordIndex != null &&
        !state.isTranslatedVisible;

    final newIsTranslatedVisible = shouldShowTranslated
        ? true
        : state.isTranslatedVisible;

    final noChanges =
        state.lastSelectionParagraphIndex == newParagraph &&
        state.lastSelectionWordIndex == newWord &&
        state.isTranslatedVisible == newIsTranslatedVisible;
    if (noChanges) return;

    emit(
      state.copyWith(
        lastSelectionParagraphIndex: newParagraph,
        lastSelectionWordIndex: newWord,
        isTranslatedVisible: newIsTranslatedVisible,
      ),
    );
  }
}
