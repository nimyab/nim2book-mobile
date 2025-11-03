import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/bloc/locale/locale_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = context.select(
      (final LocaleCubit c) => c.state.currentLocale,
    );
    final supportedLocales = context.select(
      (final LocaleCubit c) => c.state.supportedLocales,
    );

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
              initialValue: currentLocale,
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
                      Text(context.read<LocaleCubit>().getLanguageName(locale)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (final Locale? value) {
                if (value != null) {
                  context.read<LocaleCubit>().changeLocale(value);
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

class LanguageSwitcherTile extends StatelessWidget {
  const LanguageSwitcherTile({super.key});

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = context.select(
      (final LocaleCubit c) => c.state.currentLocale,
    );
    final supportedLocales = context.select(
      (final LocaleCubit c) => c.state.supportedLocales,
    );

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(l10n.language),
      subtitle: Text(
        context.read<LocaleCubit>().getLanguageName(
          currentLocale ?? const Locale('en'),
        ),
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
                Text(context.read<LocaleCubit>().getLanguageName(locale)),
              ],
            ),
          );
        }).toList(),
        onChanged: (final Locale? value) {
          if (value != null) {
            context.read<LocaleCubit>().changeLocale(value);
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
