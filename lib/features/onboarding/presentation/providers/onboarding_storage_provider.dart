import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_storage_provider.g.dart';

@riverpod
class OnboardingStorage extends _$OnboardingStorage {
  late SharedPreferences _prefs;

  @override
  Future<bool> build() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('completed') ?? false;
  }

  Future<void> completeOnboarding() async {
    await _prefs.setBool('completed', true);
    state = const AsyncData(true);
  }
}
