import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/statistic_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DailyNewLimitSwitcher extends StatefulWidget {
  const DailyNewLimitSwitcher({super.key});

  @override
  State<DailyNewLimitSwitcher> createState() => _DailyNewLimitSwitcherState();
}

class _DailyNewLimitSwitcherState extends State<DailyNewLimitSwitcher> {
  late final StatisticService _statistic = GetIt.I.get<StatisticService>();
  late int _currentLimit = _statistic.getDailyNewLimit();
  bool _saving = false;

  static const List<int> _options = [5, 10, 15, 20, 25, 30];

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final dropdownValue = _options.contains(_currentLimit)
        ? _currentLimit
        : _options.firstWhere(
            (final v) => v >= _currentLimit,
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
                        _currentLimit = v;
                      });
                      await _statistic.setDailyNewLimit(v);
                      if (mounted) {
                        setState(() {
                          _saving = false;
                        });
                      }
                    },
            ),
            ValueListenableBuilder<int>(
              valueListenable: _statistic.dailyNewCountNotifier,
              builder: (_, final used, final __) {
                final total = _statistic.getDailyNewLimit();
                return Text(
                  '$used / $total',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
