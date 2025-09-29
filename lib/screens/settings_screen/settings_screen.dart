import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/features/user_profile/user_profile.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/language_switcher.dart';
import 'package:nim2book_mobile_flutter/widgets/theme_switcher.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.select<AuthContext, bool>(
      (value) => value.isAuthenticated,
    );
    final isAuthLoading = context.select<AuthContext, bool>(
      (value) => value.isLoading,
    );
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: isAuthenticated
            ? const UserProfile()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [LanguageSwitcher(), ThemeSwitcher()],
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
                            style: TextStyle(fontSize: 16),
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
