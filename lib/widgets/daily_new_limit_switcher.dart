import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/statistics/statistics_provider.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DailyNewLimitSwitcher extends ConsumerStatefulWidget {
  const DailyNewLimitSwitcher({super.key});

  @override
  ConsumerState<DailyNewLimitSwitcher> createState() =>
      _DailyNewLimitSwitcherState();
}

class _DailyNewLimitSwitcherState extends ConsumerState<DailyNewLimitSwitcher> {
  bool _saving = false;

  static const List<int> _options = [5, 10, 15, 20, 25, 30];

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final statisticsState = ref.watch(statisticsNotifierProvider);
    final dictionaryState = ref.watch(dictionaryNotifierProvider);

    final currentLimit = dictionaryState.dailyLimitNewWords;
    final dailyNewCount = statisticsState.dailyNewCount;

    final dropdownValue = _options.contains(currentLimit)
        ? currentLimit
        : _options.firstWhere(
            (final v) => v >= currentLimit,
            orElse: () => _options.last,
          );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Text(l10n.dailyNewWordsLimit, style: theme.textTheme.titleMedium),
            DropdownButtonFormField<int>(
              initialValue: dropdownValue,
              items: _options
                  .map(
                    (final v) => DropdownMenuItem<int>(
                      value: v,
                      child: Text(v.toString()),
                    ),
                  )
                  .toList(),
              onChanged: _saving
                  ? null
                  : (final v) async {
                      if (v == null) return;
                      setState(() {
                        _saving = true;
                      });
                      await ref
                          .read(dictionaryNotifierProvider.notifier)
                          .setDailyNewLimit(v);
                      if (mounted) {
                        setState(() {
                          _saving = false;
                        });
                      }
                    },
            ),
            Text(
              '$dailyNewCount / $currentLimit',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
