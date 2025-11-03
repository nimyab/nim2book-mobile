import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/bloc/theme/theme_cubit.dart';
import 'package:nim2book_mobile_flutter/core/services/theme_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentTheme = context.select(
      (final ThemeCubit c) => c.state.currentTheme,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              l10n.theme,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<AppTheme>(
              initialValue: currentTheme,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              items: AppTheme.values.map((final theme) {
                return DropdownMenuItem<AppTheme>(
                  value: theme,
                  child: Row(
                    children: [
                      Icon(_getThemeIcon(theme), size: 20),
                      const SizedBox(width: 8),
                      Text(
                        context.read<ThemeCubit>().getThemeName(theme, l10n),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (final AppTheme? value) {
                if (value != null) {
                  context.read<ThemeCubit>().setTheme(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getThemeIcon(final AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return Icons.light_mode;
      case AppTheme.dark:
        return Icons.dark_mode;
      case AppTheme.system:
        return Icons.settings_system_daydream;
    }
  }
}

class ThemeSwitcherTile extends StatelessWidget {
  const ThemeSwitcherTile({super.key});

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentTheme = context.select(
      (final ThemeCubit c) => c.state.currentTheme,
    );

    return ListTile(
      leading: const Icon(Icons.palette),
      title: Text(l10n.theme),
      subtitle: Text(
        context.read<ThemeCubit>().getThemeName(currentTheme, l10n),
      ),
      trailing: DropdownButton<AppTheme>(
        value: currentTheme,
        underline: const SizedBox(),
        items: AppTheme.values.map((final theme) {
          return DropdownMenuItem<AppTheme>(
            value: theme,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_getThemeIcon(theme), size: 16),
                const SizedBox(width: 8),
                Text(context.read<ThemeCubit>().getThemeName(theme, l10n)),
              ],
            ),
          );
        }).toList(),
        onChanged: (final AppTheme? value) {
          if (value != null) {
            context.read<ThemeCubit>().setTheme(value);
          }
        },
      ),
    );
  }

  IconData _getThemeIcon(final AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        return Icons.light_mode;
      case AppTheme.dark:
        return Icons.dark_mode;
      case AppTheme.system:
        return Icons.settings_system_daydream;
    }
  }
}
