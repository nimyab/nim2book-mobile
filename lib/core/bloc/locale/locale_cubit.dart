import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/locale_service.dart';

class LocaleState {
  final Locale? currentLocale;
  final List<Locale> supportedLocales;

  const LocaleState({this.currentLocale, this.supportedLocales = const []});

  LocaleState copyWith({
    final Locale? currentLocale,
    final List<Locale>? supportedLocales,
  }) {
    return LocaleState(
      currentLocale: currentLocale ?? this.currentLocale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
    );
  }
}

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleService _localeService = GetIt.I<LocaleService>();

  LocaleCubit() : super(const LocaleState());

  void initialize() {
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
