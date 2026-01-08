import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_state.freezed.dart';

@freezed
abstract class LocaleState with _$LocaleState {
  const factory LocaleState({
    final Locale? currentLocale,
    @Default([]) final List<Locale> supportedLocales,
  }) = _LocaleState;
}
