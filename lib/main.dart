import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
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
import 'package:nim2book_mobile_flutter/core/services/onboarding_service.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_settings_service.dart';
import 'package:nim2book_mobile_flutter/features/books/bloc/books/books_cubit.dart';
import 'package:nim2book_mobile_flutter/firebase_options.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Intl date symbols for supported locales to avoid web runtime crashes
  // when using DateFormat (e.g., DateFormat.MMMd()).
  await initializeDateFormatting('en');
  await initializeDateFormatting('ru');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseMessaging.instance.requestPermission(provisional: true);

  final env = await Env.load();
  GetIt.I.registerSingleton(env);

  GetIt.I.registerSingleton<Talker>(
    TalkerFlutter.init(
      logger: TalkerLogger(
        settings: TalkerLoggerSettings(
          level: env.appEnv == AppEnv.dev ? LogLevel.verbose : LogLevel.info,
        ),
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(talker: GetIt.I.get<Talker>());

  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    GetIt.I.get<Talker>().error('Failed to set high refresh rate: $e');
  }

  await GoogleSignIn.instance.initialize(
    clientId: env.googleClientId,
    serverClientId: env.googleServerClientId,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton(sharedPreferences);
  final tokenService = await TokenService.init();
  GetIt.I.registerSingleton(tokenService);
  GetIt.I.registerSingleton(ApiClient());
  GetIt.I.registerSingleton(BookService());
  GetIt.I.registerSingleton(LocaleService());
  GetIt.I.registerSingleton(ThemeService());
  GetIt.I.registerSingleton(FcmTokenService());
  GetIt.I.registerSingleton(DictionaryService());
  GetIt.I.registerSingleton(SrsService());
  GetIt.I.registerSingleton(ReadingSettingsService());
  GetIt.I.registerSingleton(TtsService());
  GetIt.I.registerSingleton(OnboardingService());

  // Создаем AuthCubit и инициализируем его до запуска приложения
  final authCubit = AuthCubit();
  await authCubit.getUser();

  runApp(Nim2BookApp(authCubit: authCubit));
}

class Nim2BookApp extends StatelessWidget {
  final AuthCubit authCubit;

  const Nim2BookApp({super.key, required this.authCubit});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authCubit),
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
      context.read<BooksCubit>().initialize();
    });
  }

  @override
  Widget build(final BuildContext context) {
    final themeMode = context.select((final ThemeCubit c) => c.state.themeMode);
    final locale = context.select(
      (final LocaleCubit c) => c.state.currentLocale,
    );
    final router = AppRouter.getRouter(context);

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
