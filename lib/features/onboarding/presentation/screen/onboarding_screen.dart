import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/onboarding/data/onboarding_data.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_item.dart';
import 'package:pokedex/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:pokedex/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:pokedex/features/onboarding/presentation/widgets/onboarding_page_content.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<OnboardingItem> pages = getOnboardingPages(context);
    PageController pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) => ref
                    .read(onboardingPageCounterProvider.notifier)
                    .setPage(index),
                itemBuilder: (context, index) {
                  OnboardingItem item = pages[index];

                  return OnboardingPageContent(item: item, index: index);
                },
              ),
            ),
            OnboardingButton(ref: ref, pageController: pageController),
          ],
        ),
      ),
    );
  }
}
