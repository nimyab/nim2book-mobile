import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadingSettingsService {
  static const _fontFamilyKey = 'reading_font_family';
  static const _fontSizeKey = 'reading_font_size';
  static const _backgroundColorKey = 'reading_background_color';
  static const _textColorKey = 'reading_text_color';
  static const _lineHeightKey = 'reading_line_height';
  static const _sidePaddingKey = 'reading_side_padding';
  static const _firstLineIndentEmKey = 'reading_first_line_indent_em';
  static const _paragraphSpacingKey = 'reading_paragraph_spacing';
  static const _textAlignKey = 'reading_text_align';

  static const _translatedHeightKey = 'translated_height';
  static const _translatedFontSizeKey = 'translated_font_size';
  static const _translatedFontFamilyKey = 'translated_font_family';
  static const _translatedVerticalPaddingKey = 'translated_vertical_padding';

  final SharedPreferences _prefs = GetIt.I.get<SharedPreferences>();

  String? getFontFamily() => _prefs.getString(_fontFamilyKey);
  Future<void> setFontFamily(String value) =>
      _prefs.setString(_fontFamilyKey, value);

  double? getFontSize() => _prefs.getDouble(_fontSizeKey);
  Future<void> setFontSize(double value) =>
      _prefs.setDouble(_fontSizeKey, value);

  Color? getBackgroundColor() {
    final v = _prefs.getInt(_backgroundColorKey);
    return v != null ? Color(v) : null;
  }

  Future<void> setBackgroundColor(Color value) =>
      _prefs.setInt(_backgroundColorKey, value.toARGB32());

  Color? getTextColor() {
    final v = _prefs.getInt(_textColorKey);
    return v != null ? Color(v) : null;
  }

  Future<void> setTextColor(Color value) =>
      _prefs.setInt(_textColorKey, value.toARGB32());

  double? getLineHeight() => _prefs.getDouble(_lineHeightKey);
  Future<void> setLineHeight(double value) =>
      _prefs.setDouble(_lineHeightKey, value);

  double? getSidePadding() => _prefs.getDouble(_sidePaddingKey);
  Future<void> setSidePadding(double value) =>
      _prefs.setDouble(_sidePaddingKey, value);

  double? getFirstLineIndentEm() => _prefs.getDouble(_firstLineIndentEmKey);
  Future<void> setFirstLineIndentEm(double value) =>
      _prefs.setDouble(_firstLineIndentEmKey, value);

  double? getParagraphSpacing() => _prefs.getDouble(_paragraphSpacingKey);
  Future<void> setParagraphSpacing(double value) =>
      _prefs.setDouble(_paragraphSpacingKey, value);

  TextAlign? getTextAlign() {
    final s = _prefs.getString(_textAlignKey) ?? 'justify';
    switch (s) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'justify':
        return TextAlign.justify;
      default:
        return null;
    }
  }

  Future<void> setTextAlign(TextAlign align) {
    String s;
    switch (align) {
      case TextAlign.left:
        s = 'left';
        break;
      case TextAlign.right:
        s = 'right';
        break;
      case TextAlign.center:
        s = 'center';
        break;
      case TextAlign.justify:
      default:
        s = 'justify';
        break;
    }
    return _prefs.setString(_textAlignKey, s);
  }

  double getTranslatedHeight() =>
      _prefs.getDouble(_translatedHeightKey) ?? 30.0;
  Future<void> setTranslatedHeight(double value) =>
      _prefs.setDouble(_translatedHeightKey, value);

  double getTranslatedVerticalPadding() =>
      _prefs.getDouble(_translatedVerticalPaddingKey) ?? 5.0;
  Future<void> setTranslatedVerticalPadding(double value) =>
      _prefs.setDouble(_translatedVerticalPaddingKey, value);

  double? getTranslatedFontSize() => _prefs.getDouble(_translatedFontSizeKey);
  Future<void> setTranslatedFontSize(double value) =>
      _prefs.setDouble(_translatedFontSizeKey, value);

  String? getTranslatedFontFamily() =>
      _prefs.getString(_translatedFontFamilyKey);
  Future<void> setTranslatedFontFamily(String value) =>
      _prefs.setString(_translatedFontFamilyKey, value);
}
