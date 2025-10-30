import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/contexts/auth_context.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/daily_new_limit_switcher.dart';
import 'package:nim2book_mobile_flutter/widgets/language_switcher.dart';
import 'package:nim2book_mobile_flutter/widgets/theme_switcher.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = context.select<AuthContext, User?>((value) => value.user);
    final isAuthLoading = context.select<AuthContext, bool>(
      (value) => value.isLoading,
    );
    final logout = context.read<AuthContext>().logout;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 16,
                  children: [
                    Text(
                      l10n.profile,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${l10n.email}: ${user?.emailPasswordAccount?.email ?? user?.googleAccount?.email ?? l10n.notAvailable}',
                    ),
                  ],
                ),
              ),
            ),
            const ThemeSwitcher(),
            const LanguageSwitcher(),
            const DailyNewLimitSwitcher(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/stats'),
                icon: Icon(Icons.insights),
                label: Text(l10n.showStatistics),
              ),
            ),
            ElevatedButton(
              onPressed: isAuthLoading
                  ? null
                  : () async {
                      final success = await logout();
                      if (!success && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.logoutFailed)),
                        );
                      }
                    },
              child: isAuthLoading
                  ? const CircularProgressIndicator(padding: EdgeInsets.all(10))
                  : Text(l10n.logout),
            ),
          ],
        ),
      ),
    );
  }
}
