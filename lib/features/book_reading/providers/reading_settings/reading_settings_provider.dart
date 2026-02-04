import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/reading_settings/reading_settings_state.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_settings_service.dart';

class ReadingSettingsNotifier extends Notifier<ReadingSettingsState> {
  late final ReadingSettingsService _service;

  @override
  ReadingSettingsState build() {
    _service = ref.read(readingSettingsServiceProvider);

    // Get theme from context (will be passed via provider override if needed)
    final theme = ThemeData.light(); // Default, should be overridden

    return ReadingSettingsState(
      fontFamily: _service.getFontFamily() ?? 'System',
      fontSize: _service.getFontSize() ?? 24.0,
      textAlign: _service.getTextAlign() ?? TextAlign.justify,
      translatedFontSize: _service.getTranslatedFontSize() ?? 20.0,
      translatedFontFamily: _service.getTranslatedFontFamily() ?? 'System',
      translatedVerticalPadding: _service.getTranslatedVerticalPadding(),
      backgroundColor:
          _service.getBackgroundColor() ?? theme.colorScheme.surface,
      textColor:
          _service.getTextColor() ??
          (theme.textTheme.bodyLarge?.color ?? theme.colorScheme.onSurface),
      lineHeight: _service.getLineHeight() ?? 1.3,
      sidePadding: _service.getSidePadding() ?? 10.0,
      firstLineIndentEm: _service.getFirstLineIndentEm() ?? 1.5,
      paragraphSpacing: _service.getParagraphSpacing() ?? 7.0,
    );
  }

  Future<void> setFontFamily(final String value) async {
    if (state.fontFamily == value) return;
    await _service.setFontFamily(value);
    state = state.copyWith(fontFamily: value);
  }

  Future<void> setFontSize(final double value) async {
    if (state.fontSize == value) return;
    await _service.setFontSize(value);
    state = state.copyWith(fontSize: value);
  }

  Future<void> setBackgroundColor(final Color value) async {
    if (state.backgroundColor == value) return;
    await _service.setBackgroundColor(value);
    state = state.copyWith(backgroundColor: value);
  }

  Future<void> setTextColor(final Color value) async {
    if (state.textColor == value) return;
    await _service.setTextColor(value);
    state = state.copyWith(textColor: value);
  }

  void setTranslatedVisible({required final bool value}) {
    if (state.isTranslatedVisible == value) return;
    state = state.copyWith(isTranslatedVisible: value);
  }

  void setFullscreen({required final bool value}) {
    if (state.isFullscreen == value) return;
    state = state.copyWith(isFullscreen: value);
  }

  void setLastSelection(final int paragraphIndex, final int wordIndex) {
    if (state.lastSelectionParagraphIndex == paragraphIndex &&
        state.lastSelectionWordIndex == wordIndex) {
      return;
    }
    state = state.copyWith(
      lastSelectionParagraphIndex: paragraphIndex,
      lastSelectionWordIndex: wordIndex,
    );
  }

  void setLineHeight(final double value) {
    if (state.lineHeight == value) return;
    state = state.copyWith(lineHeight: value);
  }

  void setSidePadding(final double value) {
    if (state.sidePadding == value) return;
    state = state.copyWith(sidePadding: value);
  }

  void setFirstLineIndentEm(final double value) {
    if (state.firstLineIndentEm == value) return;
    state = state.copyWith(firstLineIndentEm: value);
  }

  void setParagraphSpacing(final double value) {
    if (state.paragraphSpacing == value) return;
    state = state.copyWith(paragraphSpacing: value);
  }

  Future<void> setTextAlign(final TextAlign value) async {
    if (state.textAlign == value) return;
    await _service.setTextAlign(value);
    state = state.copyWith(textAlign: value);
  }

  Future<void> setTranslatedFontSize(final double value) async {
    if (state.translatedFontSize == value) return;
    await _service.setTranslatedFontSize(value);
    state = state.copyWith(translatedFontSize: value);
  }

  Future<void> setTranslatedFontFamily(final String value) async {
    if (state.translatedFontFamily == value) return;
    await _service.setTranslatedFontFamily(value);
    state = state.copyWith(translatedFontFamily: value);
  }

  Future<void> setTranslatedVerticalPadding(final double value) async {
    if (state.translatedVerticalPadding == value) return;
    await _service.setTranslatedVerticalPadding(value);
    state = state.copyWith(translatedVerticalPadding: value);
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

    state = state.copyWith(
      lastSelectionParagraphIndex: newParagraph,
      lastSelectionWordIndex: newWord,
      isTranslatedVisible: newIsTranslatedVisible,
    );
  }
}

final readingSettingsNotifierProvider =
    NotifierProvider<ReadingSettingsNotifier, ReadingSettingsState>(
      ReadingSettingsNotifier.new,
    );
