import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnv { dev, prod }

class Env {
  AppEnv appEnv;
  String apiBaseUrl;
  String googleClientId;
  String googleServerClientId;

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

    final googleClientId = dotenv.env['GOOGLE_CLIENT_ID'];
    if (googleClientId == null || googleClientId.isEmpty) {
      throw Exception('invalid GOOGLE_CLIENT_ID value');
    }

    final googleServerClientId = dotenv.env['GOOGLE_SERVER_CLIENT_ID'];
    if (googleServerClientId == null || googleServerClientId.isEmpty) {
      throw Exception('invalid GOOGLE_SERVER_CLIENT_ID value');
    }

    return Env._privateConstructor(
      appEnv,
      apiBaseUrl,
      googleClientId,
      googleServerClientId,
    );
  }

  Env._privateConstructor(
    this.appEnv,
    this.apiBaseUrl,
    this.googleClientId,
    this.googleServerClientId,
  );
}
