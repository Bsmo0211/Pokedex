import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/onboarding/data/onboarding_data.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_item.dart';
import 'package:pokedex/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:pokedex/features/onboarding/presentation/providers/onboarding_storage_provider.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class OnboardingButton extends StatelessWidget {
  final WidgetRef ref;
  final PageController pageController;
  const OnboardingButton({
    super.key,
    required this.ref,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    List<OnboardingItem> pages = getOnboardingPages(context);
    int currentPage = ref.watch(onboardingPageCounterProvider);
    bool isLastPage = currentPage == pages.length - 1;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (index) => Container(
              margin: const EdgeInsets.all(4),
              width: currentPage == index ? 25 : 10,
              height: 8,
              decoration: BoxDecoration(
                color: currentPage == index
                    ? Colors.blue
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            width: double.infinity,
            height: 55,
            child:
                ElevatedButton(
                      onPressed: () async {
                        if (isLastPage) {
                          await ref
                              .read(onboardingStorageProvider.notifier)
                              .completeOnboarding();
                          if (context.mounted) {
                            context.go('/home');
                          }
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        isLastPage ? l10n.startButton : l10n.continueButton,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                    .animate(key: ValueKey('btn_$currentPage'))
                    .fadeIn(delay: 400.ms)
                    .move(begin: const Offset(0, 20), end: Offset.zero),
          ),
        ),
      ],
    );
  }
}
