import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/database/database.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:nim2book_mobile_flutter/core/services/locale_service.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';
import 'package:nim2book_mobile_flutter/core/services/onboarding_service.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_settings_service.dart';

// Environment provider
final envProvider = Provider<Env>((ref) {
  throw UnimplementedError('envProvider must be overridden');
});

// Talker provider
final talkerProvider = Provider<Talker>((ref) {
  throw UnimplementedError('talkerProvider must be overridden');
});

// SharedPreferences provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('talkerProvider must be overridden');
});

// AppDatabase provider
final databaseProvider = Provider<Database>((ref) {
  throw UnimplementedError('databaseProvider must be overridden');
});

// TokenService provider
final tokenServiceProvider = Provider<TokenService>((ref) {
  throw UnimplementedError('talkerProvider must be overridden');
});

// ApiClient provider
final apiClientProvider = Provider<ApiClient>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  final env = ref.watch(envProvider);
  final talker = ref.watch(talkerProvider);
  return ApiClient(tokenService: tokenService, env: env, talker: talker);
});

// BookService provider
final bookServiceProvider = Provider<BookService>((ref) {
  final talker = ref.watch(talkerProvider);
  final apiClient = ref.watch(apiClientProvider);
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return BookService(talker, apiClient, sharedPreferences);
});

// LocaleService provider
final localeServiceProvider = Provider<LocaleService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return LocaleService(sharedPreferences);
});

// ThemeService provider
final themeServiceProvider = Provider<ThemeService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return ThemeService(sharedPreferences);
});

// FcmTokenService provider
final fcmTokenServiceProvider = Provider<FcmTokenService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final talker = ref.watch(talkerProvider);
  return FcmTokenService(apiClient, talker);
});

// DictionaryService provider
final dictionaryServiceProvider = Provider<DictionaryService>((ref) {
  final talker = ref.watch(talkerProvider);
  final apiClient = ref.watch(apiClientProvider);
  final database = ref.watch(databaseProvider);
  return DictionaryService(talker, apiClient, database);
});

// StatisticService provider
// todo: пока этот провайдер не нужен, так как будет переписываться работа с карточками
// final statisticServiceProvider = Provider<StatisticService>((ref) {
//   final sharedPreferences = ref.watch(sharedPreferencesProvider);
//   return StatisticService(sharedPreferences);
// });

// ReadingSettingsService provider
final readingSettingsServiceProvider = Provider<ReadingSettingsService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return ReadingSettingsService(sharedPreferences);
});

// TtsService provider
final ttsServiceProvider = Provider<TtsService>((ref) {
  final talker = ref.watch(talkerProvider);
  return TtsService(talker);
});

// OnboardingService provider
final onboardingServiceProvider = Provider<OnboardingService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return OnboardingService(sharedPreferences);
});
