import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const String _onboardingCompleteKey = 'onboarding_complete';

  final SharedPreferences _prefs = GetIt.I.get<SharedPreferences>();

  bool get isOnboardingComplete =>
      _prefs.getBool(_onboardingCompleteKey) ?? false;

  Future<void> completeOnboarding() async {
    await _prefs.setBool(_onboardingCompleteKey, true);
  }

  Future<void> resetOnboarding() async {
    await _prefs.remove(_onboardingCompleteKey);
  }
}
