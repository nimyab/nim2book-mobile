import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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

  runApp(const Nim2BookAppWrapper());
}

class Nim2BookAppWrapper extends StatelessWidget {
  const Nim2BookAppWrapper({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(create: (_) => AuthCubit()..initialize()),
        BlocProvider(create: (_) => BooksCubit()..initialize()),
        BlocProvider(create: (_) => DictionaryCubit()),
      ],
      child: const Nim2BookApp(),
    );
  }
}

class Nim2BookApp extends StatefulWidget {
  const Nim2BookApp({super.key});

  @override
  State<Nim2BookApp> createState() => _Nim2BookAppState();
}

class _Nim2BookAppState extends State<Nim2BookApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    final authCubit = context.read<AuthCubit>();
    _router = createRouter(authCubit);
  }

  @override
  Widget build(final BuildContext context) {
    final themeMode = context.select((final ThemeCubit c) => c.state.themeMode);
    final locale = context.select(
      (final LocaleCubit c) => c.state.currentLocale,
    );

    return MaterialApp.router(
      routerConfig: _router,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
