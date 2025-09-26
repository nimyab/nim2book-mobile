import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  static const String _localeKey = 'selected_locale';

  final SharedPreferences _sharedPreferences = GetIt.I<SharedPreferences>();

  Locale? getSavedLocale() {
    final localeCode = _sharedPreferences.getString(_localeKey);
    if (localeCode != null) {
      return Locale(localeCode);
    }
    return null;
  }

  Future<void> saveLocale(Locale locale) async {
    await _sharedPreferences.setString(_localeKey, locale.languageCode);
  }

  Locale getDeviceLocale() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    if (AppLocalizations.supportedLocales.contains(deviceLocale)) {
      return deviceLocale;
    }
    return const Locale('en');
  }

  Locale getLocaleToUse() {
    final savedLocale = getSavedLocale();
    if (savedLocale != null) {
      return savedLocale;
    }

    return getDeviceLocale();
  }

  List<Locale> getSupportedLocales() {
    return AppLocalizations.supportedLocales;
  }

  String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      default:
        return locale.languageCode.toUpperCase();
    }
  }
}
