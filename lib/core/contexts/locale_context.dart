import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/services/locale_service.dart';

class LocaleContext extends ChangeNotifier {
  final LocaleService _localeService = LocaleService();
  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  void initialize() {
    _currentLocale = _localeService.getLocaleToUse();
    notifyListeners();
  }

  Future<void> changeLocale(final Locale locale) async {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      await _localeService.saveLocale(locale);
      notifyListeners();
    }
  }

  List<Locale> get supportedLocales => _localeService.getSupportedLocales();

  String getLanguageName(final Locale locale) =>
      _localeService.getLanguageName(locale);
}
