import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnv { dev, prod }

class Env {
  AppEnv appEnv;
  String apiBaseUrl;

  static Future<Env> load() async {
    await dotenv.load();

    AppEnv appEnv;
    switch (dotenv.env['ENV']) {
      case 'dev':
        appEnv = AppEnv.dev;
        break;
      case 'prod':
        appEnv = AppEnv.prod;
        break;
      default:
        throw Exception('Invalid ENV value');
    }

    final apiBaseUrl = dotenv.env['API_BASE_URL'];
    if (apiBaseUrl == null || apiBaseUrl.isEmpty) {
      throw Exception('invalid API_BASE_URL value');
    }

    return Env._privateConstructor(appEnv, apiBaseUrl);
  }

  Env._privateConstructor(this.appEnv, this.apiBaseUrl);
}
