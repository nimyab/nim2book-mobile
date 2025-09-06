import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/shared/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  final apiClient = ApiClient(dotenv.env['API_BASE_URL']!);
  GetIt.I.registerSingleton(apiClient);

  final asyncPreferences = SharedPreferencesAsync();
  GetIt.I.registerSingletonAsync(() async => asyncPreferences);

  Bloc.observer = TalkerBlocObserver(talker: talker);

  runApp(const Nim2BookApp());
}

class Nim2BookApp extends StatelessWidget {
  const Nim2BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
