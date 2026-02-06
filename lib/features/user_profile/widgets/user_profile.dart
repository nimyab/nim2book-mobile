import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_provider.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/language_switcher.dart';
import 'package:nim2book_mobile_flutter/widgets/theme_switcher.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final user = ref.watch(userProvider);
    final isLoading = ref.watch(isAuthLoadingProvider);

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
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      final success = await authNotifier.logout();
                      if (!success && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.logoutFailed)),
                        );
                      }
                    },
              child: isLoading
                  ? const CircularProgressIndicator(padding: EdgeInsets.all(10))
                  : Text(l10n.logout),
            ),
          ],
        ),
      ),
    );
  }
}
