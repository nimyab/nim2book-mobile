import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadingPersistence {
  static const _fontFamilyKey = 'reading_font_family';
  static const _fontSizeKey = 'reading_font_size';
  static const _backgroundColorKey = 'reading_background_color';
  static const _textColorKey = 'reading_text_color';
  static const _lineHeightKey = 'reading_line_height';
  static const _sidePaddingKey = 'reading_side_padding';
  static const _firstLineIndentEmKey = 'reading_first_line_indent_em';
  static const _paragraphSpacingKey = 'reading_paragraph_spacing';

  final SharedPreferences _prefs = GetIt.I.get<SharedPreferences>();

  String getFontFamily() => _prefs.getString(_fontFamilyKey) ?? 'System';
  Future<void> setFontFamily(String value) =>
      _prefs.setString(_fontFamilyKey, value);

  double getFontSize() => _prefs.getDouble(_fontSizeKey) ?? 24.0;
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

  double getLineHeight() => _prefs.getDouble(_lineHeightKey) ?? 1.3;
  Future<void> setLineHeight(double value) =>
      _prefs.setDouble(_lineHeightKey, value);

  double getSidePadding() => _prefs.getDouble(_sidePaddingKey) ?? 10.0;
  Future<void> setSidePadding(double value) =>
      _prefs.setDouble(_sidePaddingKey, value);

  double getFirstLineIndentEm() =>
      _prefs.getDouble(_firstLineIndentEmKey) ?? 1.5;
  Future<void> setFirstLineIndentEm(double value) =>
      _prefs.setDouble(_firstLineIndentEmKey, value);

  double getParagraphSpacing() => _prefs.getDouble(_paragraphSpacingKey) ?? 7.0;
  Future<void> setParagraphSpacing(double value) =>
      _prefs.setDouble(_paragraphSpacingKey, value);
}
