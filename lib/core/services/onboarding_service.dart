import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const _onboardingCompleteKey = 'onboarding_complete';

  final SharedPreferences _prefs;

  OnboardingService(this._prefs);

  bool get isOnboardingComplete =>
      _prefs.getBool(_onboardingCompleteKey) ?? false;

  Future<void> completeOnboarding() async {
    await _prefs.setBool(_onboardingCompleteKey, true);
  }

  Future<void> resetOnboarding() async {
    await _prefs.remove(_onboardingCompleteKey);
  }
}
