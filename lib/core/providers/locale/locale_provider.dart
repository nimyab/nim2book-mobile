import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/locale/locale_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/locale_service.dart';

class LocaleNotifier extends Notifier<LocaleState> {
  late final LocaleService _localeService;

  @override
  LocaleState build() {
    _localeService = ref.read(localeServiceProvider);
    final supported = _localeService.getSupportedLocales();
    return LocaleState(
      currentLocale: _localeService.getLocaleToUse(),
      supportedLocales: supported,
    );
  }

  Future<void> changeLocale(final Locale locale) async {
    if (state.currentLocale == locale) return;
    await _localeService.saveLocale(locale);
    state = state.copyWith(currentLocale: locale);
  }

  String getLanguageName(final Locale locale) {
    return _localeService.getLanguageName(locale);
  }
}

final localeNotifierProvider = NotifierProvider<LocaleNotifier, LocaleState>(
  LocaleNotifier.new,
);
