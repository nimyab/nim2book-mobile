import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/locale/locale_state.dart';
import 'package:nim2book_mobile_flutter/core/services/locale_service.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleService _localeService = GetIt.I<LocaleService>();

  LocaleCubit() : super(const LocaleState()) {
    final supported = _localeService.getSupportedLocales();
    emit(
      state.copyWith(
        currentLocale: _localeService.getLocaleToUse(),
        supportedLocales: supported,
      ),
    );
  }

  Future<void> changeLocale(final Locale locale) async {
    if (state.currentLocale == locale) return;
    await _localeService.saveLocale(locale);
    emit(state.copyWith(currentLocale: locale));
  }

  String getLanguageName(final Locale locale) {
    return _localeService.getLanguageName(locale);
  }
}
