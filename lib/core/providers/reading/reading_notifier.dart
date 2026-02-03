import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/reading/reading_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_settings_service.dart';

class ReadingNotifier extends AutoDisposeNotifier<ReadingState> {
  late final ReadingSettingsService _readingSettingsService;

  @override
  ReadingState build() {
    final service = ref.watch(readingSettingsServiceProvider);
    _readingSettingsService = service;
    _loadSettings();
    return const ReadingState();
  }

  Future<void> _loadSettings() async {
    state = state.copyWith(isLoading: true);
    try {
      final fontSize = _readingSettingsService.getFontSize();
      final lineHeight = _readingSettingsService.getLineHeight();
      final fontFamily = _readingSettingsService.getFontFamily();
      final sidePadding = _readingSettingsService.getSidePadding();
      final firstLineIndent = _readingSettingsService.getFirstLineIndentEm();
      final paragraphSpacing = _readingSettingsService.getParagraphSpacing();
      final textAlign = _readingSettingsService.getTextAlign();
      final backgroundColor = _readingSettingsService.getBackgroundColor();
      final textColor = _readingSettingsService.getTextColor();

      state = state.copyWith(
        fontSize: fontSize ?? 16.0,
        lineHeight: lineHeight ?? 1.5,
        fontFamily: fontFamily ?? 'default',
        sidePadding: sidePadding ?? 20.0,
        firstLineIndentEm: firstLineIndent ?? 2.0,
        paragraphSpacing: paragraphSpacing ?? 8.0,
        textAlign: textAlign ?? TextAlign.justify,
        backgroundColor: backgroundColor,
        textColor: textColor,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> setFontSize(double size) async {
    state = state.copyWith(fontSize: size);
    await _readingSettingsService.setFontSize(size);
  }

  Future<void> setLineHeight(double height) async {
    state = state.copyWith(lineHeight: height);
    await _readingSettingsService.setLineHeight(height);
  }

  Future<void> setFontFamily(String family) async {
    state = state.copyWith(fontFamily: family);
    await _readingSettingsService.setFontFamily(family);
  }

  Future<void> setSidePadding(double padding) async {
    state = state.copyWith(sidePadding: padding);
    await _readingSettingsService.setSidePadding(padding);
  }

  Future<void> setFirstLineIndentEm(double indent) async {
    state = state.copyWith(firstLineIndentEm: indent);
    await _readingSettingsService.setFirstLineIndentEm(indent);
  }

  Future<void> setParagraphSpacing(double spacing) async {
    state = state.copyWith(paragraphSpacing: spacing);
    await _readingSettingsService.setParagraphSpacing(spacing);
  }

  Future<void> setTextAlign(TextAlign align) async {
    state = state.copyWith(textAlign: align);
    await _readingSettingsService.setTextAlign(align);
  }

  Future<void> setBackgroundColor(Color color) async {
    state = state.copyWith(backgroundColor: color);
    await _readingSettingsService.setBackgroundColor(color);
  }

  Future<void> setTextColor(Color color) async {
    state = state.copyWith(textColor: color);
    await _readingSettingsService.setTextColor(color);
  }

  Future<void> refresh() async {
    await _loadSettings();
  }
}

final readingNotifierProvider =
    AutoDisposeNotifierProvider<ReadingNotifier, ReadingState>(
      ReadingNotifier.new,
    );
