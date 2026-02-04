import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_provider.dart';
import 'package:nim2book_mobile_flutter/features/user_profile/widgets/user_profile.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/daily_new_limit_switcher.dart';
import 'package:nim2book_mobile_flutter/widgets/language_switcher.dart';
import 'package:nim2book_mobile_flutter/widgets/theme_switcher.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(isAuthenticatedProvider);
    final isAuthLoading = ref.watch(isAuthLoadingProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: isAuthenticated
            ? const UserProfile()
            : Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        LanguageSwitcher(),
                        ThemeSwitcher(),
                        DailyNewLimitSwitcher(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Text(
                            l10n.pleaseLoginOrRegister,
                            style: const TextStyle(fontSize: 16),
                          ),
                          ElevatedButton(
                            onPressed: isAuthLoading
                                ? null
                                : () => context.push('/login'),
                            child: isAuthLoading
                                ? const CircularProgressIndicator(
                                    padding: EdgeInsets.all(10),
                                  )
                                : Text(l10n.loginButton),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
