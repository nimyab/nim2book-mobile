import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/core/contexts/books_context.dart';
import 'package:nim2book_mobile_flutter/core/contexts/theme_context.dart';
import 'package:nim2book_mobile_flutter/core/contexts/locale_context.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/router/router.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    Logger().e('Failed to set high refresh rate: $e');
  }

  final env = await Env.load();
  GetIt.I.registerSingleton(env);

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

  final themeService = ThemeService();
  GetIt.I.registerSingleton(themeService);

  runApp(const Nim2BookApp());
}

class Nim2BookApp extends StatelessWidget {
  const Nim2BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthContext()),
        ChangeNotifierProvider(create: (_) => BooksContext()),
        ChangeNotifierProvider(create: (_) => ThemeContext()),
        ChangeNotifierProvider(create: (_) => LocaleContext()),
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
      context.read<AuthContext>().getUser();
      context.read<BooksContext>().initial();
      context.read<ThemeContext>().initialize();
      context.read<LocaleContext>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeContext, LocaleContext>(
      builder: (context, themeContext, localeContext, child) {
        return MaterialApp.router(
          routerConfig: router,
          // theme
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeContext.themeMode,
          // locale
          locale: localeContext.currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
