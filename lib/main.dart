import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/book/books_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/locale/locale_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/providers/theme/theme_provider.dart';
import 'package:nim2book_mobile_flutter/core/router/router.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/firebase_options.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

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

  final talker = TalkerFlutter.init(
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(
        level: env.appEnv == AppEnv.dev ? LogLevel.verbose : LogLevel.info,
      ),
    ),
  );

  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    talker.error('Failed to set high refresh rate: $e');
  }

  await GoogleSignIn.instance.initialize(
    clientId: env.googleClientId,
    serverClientId: env.googleServerClientId,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final tokenService = await TokenService.init();

  runApp(
    ProviderScope(
      overrides: [
        envProvider.overrideWithValue(env),
        talkerProvider.overrideWithValue(talker),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        tokenServiceProvider.overrideWithValue(tokenService),
      ],
      observers: [TalkerRiverpodObserver()],
      child: const Nim2BookApp(),
    ),
  );
}

class Nim2BookApp extends ConsumerStatefulWidget {
  const Nim2BookApp({super.key});

  @override
  ConsumerState<Nim2BookApp> createState() => _Nim2BookAppState();
}

class _Nim2BookAppState extends ConsumerState<Nim2BookApp> {
  @override
  void initState() {
    super.initState();

    // Initialize auth and books
    Future.microtask(() {
      ref.read(authNotifierProvider.notifier).initialize();
      ref.read(booksNotifierProvider.notifier).initialize();
      // Dictionary notifier initializes itself in build()
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(
      themeNotifierProvider.select((state) => state.themeMode),
    );
    final locale = ref.watch(
      localeNotifierProvider.select((state) => state.currentLocale),
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
