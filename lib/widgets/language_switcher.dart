import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/contexts/locale_context.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeContext = context.watch<LocaleContext>();

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
              initialValue: localeContext.currentLocale,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              items: localeContext.supportedLocales.map((locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Row(
                    children: [
                      Icon(_getLanguageIcon(locale), size: 20),
                      const SizedBox(width: 8),
                      Text(localeContext.getLanguageName(locale)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (Locale? value) {
                if (value != null) {
                  localeContext.changeLocale(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getLanguageIcon(Locale locale) {
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

class LanguageSwitcherTile extends StatelessWidget {
  const LanguageSwitcherTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeContext = context.watch<LocaleContext>();

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(l10n.language),
      subtitle: Text(
        localeContext.getLanguageName(
          localeContext.currentLocale ?? const Locale('en'),
        ),
      ),
      trailing: DropdownButton<Locale>(
        value: localeContext.currentLocale,
        underline: const SizedBox(),
        items: localeContext.supportedLocales.map((locale) {
          return DropdownMenuItem<Locale>(
            value: locale,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_getLanguageIcon(locale), size: 16),
                const SizedBox(width: 8),
                Text(localeContext.getLanguageName(locale)),
              ],
            ),
          );
        }).toList(),
        onChanged: (Locale? value) {
          if (value != null) {
            localeContext.changeLocale(value);
          }
        },
      ),
    );
  }

  IconData _getLanguageIcon(Locale locale) {
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
