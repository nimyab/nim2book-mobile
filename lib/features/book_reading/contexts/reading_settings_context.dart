import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/data/reading_settings_service.dart';

class ReadingSettingsContext with ChangeNotifier {
  final _readSS = GetIt.I.get<ReadingSettingsService>();

  String _fontFamily = 'System';

  set fontFamily(String value) {
    _fontFamily = value;
    _readSS.setFontFamily(value);
    notifyListeners();
  }

  String get fontFamily => _fontFamily;

  double _fontSize = 24.0;

  set fontSize(double value) {
    _fontSize = value;
    _readSS.setFontSize(value);
    notifyListeners();
  }

  double get fontSize => _fontSize;

  Color _backgroundColor = Colors.white;

  set backgroundColor(Color value) {
    _backgroundColor = value;
    _readSS.setBackgroundColor(value);
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;

  Color _textColor = Colors.black;

  set textColor(Color value) {
    _textColor = value;
    _readSS.setTextColor(value);
    notifyListeners();
  }

  Color get textColor => _textColor;

  bool _isTranslatedVisible = false;

  set isTranslatedVisible(bool value) {
    _isTranslatedVisible = value;
    notifyListeners();
  }

  bool get isTranslatedVisible => _isTranslatedVisible;

  bool _isFullscreen = false;

  set isFullscreen(bool value) {
    _isFullscreen = value;
    notifyListeners();
  }

  bool get isFullscreen => _isFullscreen;

  int _lastSelectionParagraphIndex = -1;

  set lastSelectionParagraphIndex(int value) {
    _lastSelectionParagraphIndex = value;
    notifyListeners();
  }

  int get lastSelectionParagraphIndex => _lastSelectionParagraphIndex;

  int _lastSelectionWordIndex = -1;

  set lastSelectionWordIndex(int value) {
    _lastSelectionWordIndex = value;
    notifyListeners();
  }

  int get lastSelectionWordIndex => _lastSelectionWordIndex;

  double _lineHeight = 1.3;

  set lineHeight(double value) {
    _lineHeight = value;
    notifyListeners();
  }

  double get lineHeight => _lineHeight;

  double _sidePadding = 10;

  set sidePadding(double value) {
    _sidePadding = value;
    notifyListeners();
  }

  double get sidePadding => _sidePadding;

  double _firstLineIndentEm = 1.5;

  set firstLineIndentEm(double value) {
    _firstLineIndentEm = value;
    notifyListeners();
  }

  double get firstLineIndentEm => _firstLineIndentEm;

  double _paragraphSpacing = 7;

  set paragraphSpacing(double value) {
    _paragraphSpacing = value;
    notifyListeners();
  }

  double get paragraphSpacing => _paragraphSpacing;

  TextAlign _textAlign = TextAlign.justify;

  set textAlign(TextAlign value) {
    _textAlign = value;
    _readSS.setTextAlign(value);
    notifyListeners();
  }

  TextAlign get textAlign => _textAlign;

  double _translatedFontSize = 20;

  set translatedFontSize(double value) {
    _translatedFontSize = value;
    _readSS.setTranslatedFontSize(value);
    notifyListeners();
  }

  double get translatedFontSize => _translatedFontSize;

  String _translatedFontFamily = 'System';

  set translatedFontFamily(String value) {
    _translatedFontFamily = value;
    _readSS.setTranslatedFontFamily(value);
    notifyListeners();
  }

  String get translatedFontFamily => _translatedFontFamily;

  double _translatedVerticalPadding = 5;

  set translatedVerticalPadding(double value) {
    _translatedVerticalPadding = value;
    _readSS.setTranslatedVerticalPadding(value);
    notifyListeners();
  }

  double get translatedVerticalPadding => _translatedVerticalPadding;

  ReadingSettingsContext(ThemeData theme) {
    _fontFamily = _readSS.getFontFamily() ?? _fontFamily;
    _fontSize = _readSS.getFontSize() ?? _fontSize;
    _textAlign = _readSS.getTextAlign() ?? _textAlign;
    _translatedFontSize =
        _readSS.getTranslatedFontSize() ?? _translatedFontSize;
    _translatedFontFamily =
        _readSS.getTranslatedFontFamily() ?? _translatedFontFamily;
    _translatedVerticalPadding = _readSS.getTranslatedVerticalPadding();
    _backgroundColor =
        _readSS.getBackgroundColor() ?? theme.colorScheme.surface;
    _textColor =
        _readSS.getTextColor() ??
        (theme.textTheme.bodyLarge?.color ?? theme.colorScheme.onSurface);
    _lineHeight = _readSS.getLineHeight() ?? _lineHeight;
    _sidePadding = _readSS.getSidePadding() ?? _sidePadding;
    _firstLineIndentEm = _readSS.getFirstLineIndentEm() ?? _firstLineIndentEm;
    _paragraphSpacing = _readSS.getParagraphSpacing() ?? _paragraphSpacing;
  }
}
