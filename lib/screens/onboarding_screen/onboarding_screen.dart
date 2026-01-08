import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/services/onboarding_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    l10n.onboarding,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final onboardingService = GetIt.I.get<OnboardingService>();
                    await onboardingService.completeOnboarding();
                    if (context.mounted) {
                      context.go('/login');
                    }
                  },
                  child: Text(l10n.skip),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
