import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingPageCounter extends _$OnboardingPageCounter {
  @override
  int build() => 0;

  void setPage(int index) {
    state = index;
  }
}
