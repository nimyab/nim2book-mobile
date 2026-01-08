import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/bloc/app_bloc_observer.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_cubit.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/bloc/locale/locale_cubit.dart';
import 'package:nim2book_mobile_flutter/core/bloc/theme/theme_cubit.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/router/router.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/core/services/locale_service.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_settings_service.dart';
import 'package:nim2book_mobile_flutter/features/books/bloc/books_cubit.dart';
import 'package:nim2book_mobile_flutter/firebase_options.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // Initialize Intl date symbols for supported locales to avoid web runtime crashes
  // when using DateFormat (e.g., DateFormat.MMMd()).
  await initializeDateFormatting('en');
  await initializeDateFormatting('ru');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseMessaging.instance.requestPermission(provisional: true);

  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    Logger().e('Failed to set high refresh rate: $e');
  }

  final env = await Env.load();
  GetIt.I.registerSingleton(env);

  await GoogleSignIn.instance.initialize(
    clientId: env.googleClientId,
    serverClientId: env.googleServerClientId,
  );

  if (env.appEnv == AppEnv.dev) {
    Logger.level = Level.all;
  } else {
    Logger.level = Level.info;
  }

  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton(sharedPreferences);

  final tokenService = await TokenService.init();
  GetIt.I.registerSingleton(tokenService);

  final apiClient = ApiClient();
  GetIt.I.registerSingleton(apiClient);

  final bookService = BookService();
  GetIt.I.registerSingleton(bookService);

  // Регистрируем LocaleService для LocaleCubit
  final localeService = LocaleService();
  GetIt.I.registerSingleton(localeService);

  final themeService = ThemeService();
  GetIt.I.registerSingleton(themeService);

  final fcmTokenService = FcmTokenService();
  GetIt.I.registerSingleton(fcmTokenService);

  final dictService = DictionaryService();
  GetIt.I.registerSingleton(dictService);

  final srsService = SrsService();
  GetIt.I.registerSingleton(srsService);

  final readingPersistence = ReadingSettingsService();
  GetIt.I.registerSingleton(readingPersistence);

  final ttsService = TtsService();
  GetIt.I.registerSingleton(ttsService);

  runApp(const Nim2BookApp());
}

class Nim2BookApp extends StatelessWidget {
  const Nim2BookApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BooksCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(create: (_) => DictionaryCubit()),
      ],
      child: _AppInitializer(),
    );
  }
}

class _AppInitializer extends StatefulWidget {
  @override
  State<_AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<_AppInitializer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize Cubits
      context.read<AuthCubit>().getUser();
      context.read<ThemeCubit>().initialize();
      context.read<LocaleCubit>().initialize();
      context.read<BooksCubit>().initialize();
    });
  }

  @override
  Widget build(final BuildContext context) {
    final themeMode = context.select((final ThemeCubit c) => c.state.themeMode);
    final locale = context.select(
      (final LocaleCubit c) => c.state.currentLocale,
    );
    return MaterialApp.router(
      routerConfig: router,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
