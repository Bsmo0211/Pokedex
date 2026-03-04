import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/assets_constants.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_item.dart';
import 'package:pokedex/l10n/app_localizations.dart';

List<OnboardingItem> getOnboardingPages(BuildContext context) {
  AppLocalizations l10n = AppLocalizations.of(context)!;

  return [
    OnboardingItem(
      title: l10n.onboardingTitle1,
      description: l10n.onboardingDesc1,
      imagePath: AssetsManager.onboarding1,
    ),
    OnboardingItem(
      title: l10n.onboardingTitle2,
      description: l10n.onboardingDesc2,
      imagePath: AssetsManager.onboarding2,
      isLastPage: true,
    ),
  ];
}
