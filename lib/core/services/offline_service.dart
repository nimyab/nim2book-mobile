import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

const _offlineModeKey = 'offline_mode_enabled';

class OfflineService {
  final _prefs = GetIt.I.get<SharedPreferences>();

  bool get isOffline => _prefs.getBool(_offlineModeKey) ?? false;

  Future<void> setOffline(bool value) async {
    await _prefs.setBool(_offlineModeKey, value);
  }
}
