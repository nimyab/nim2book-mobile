import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/locale/locale_notifier.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(
      localeNotifierProvider.select((state) => state.currentLocale),
    );
    final supportedLocales = ref.watch(
      localeNotifierProvider.select((state) => state.supportedLocales),
    );
    final localeNotifier = ref.read(localeNotifierProvider.notifier);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              l10n.language,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<Locale>(
              value: currentLocale,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              items: supportedLocales.map((final locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Row(
                    children: [
                      Icon(_getLanguageIcon(locale), size: 20),
                      const SizedBox(width: 8),
                      Text(localeNotifier.getLanguageName(locale)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (final Locale? value) {
                if (value != null) {
                  localeNotifier.changeLocale(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getLanguageIcon(final Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return Icons.language;
      case 'ru':
        return Icons.translate_outlined;
      default:
        return Icons.language;
    }
  }
}

class LanguageSwitcherTile extends ConsumerWidget {
  const LanguageSwitcherTile({super.key});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(
      localeNotifierProvider.select((state) => state.currentLocale),
    );
    final supportedLocales = ref.watch(
      localeNotifierProvider.select((state) => state.supportedLocales),
    );
    final localeNotifier = ref.read(localeNotifierProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(l10n.language),
      subtitle: Text(
        localeNotifier.getLanguageName(currentLocale ?? const Locale('en')),
      ),
      trailing: DropdownButton<Locale>(
        value: currentLocale,
        underline: const SizedBox(),
        items: supportedLocales.map((final locale) {
          return DropdownMenuItem<Locale>(
            value: locale,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_getLanguageIcon(locale), size: 16),
                const SizedBox(width: 8),
                Text(localeNotifier.getLanguageName(locale)),
              ],
            ),
          );
        }).toList(),
        onChanged: (final Locale? value) {
          if (value != null) {
            localeNotifier.changeLocale(value);
          }
        },
      ),
    );
  }

  IconData _getLanguageIcon(final Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return Icons.language;
      case 'ru':
        return Icons.translate_outlined;
      default:
        return Icons.language;
    }
  }
}
