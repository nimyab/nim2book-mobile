import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DailyNewLimitSwitcher extends StatefulWidget {
  const DailyNewLimitSwitcher({super.key});

  @override
  State<DailyNewLimitSwitcher> createState() => _DailyNewLimitSwitcherState();
}

class _DailyNewLimitSwitcherState extends State<DailyNewLimitSwitcher> {
  late final SrsService _srs = GetIt.I.get<SrsService>();
  late int _currentLimit = _srs.getDailyNewLimit();
  bool _saving = false;

  static const List<int> _options = [5, 10, 15, 20, 25, 30];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final dropdownValue = _options.contains(_currentLimit)
        ? _currentLimit
        : _options.firstWhere(
            (v) => v >= _currentLimit,
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
                    (v) => DropdownMenuItem<int>(
                      value: v,
                      child: Text(v.toString()),
                    ),
                  )
                  .toList(),
              onChanged: _saving
                  ? null
                  : (v) async {
                      if (v == null) return;
                      setState(() {
                        _saving = true;
                        _currentLimit = v;
                      });
                      await _srs.setDailyNewLimit(v);
                      if (mounted) {
                        setState(() {
                          _saving = false;
                        });
                      }
                    },
            ),
            ValueListenableBuilder<int>(
              valueListenable: _srs.dailyNewCountNotifier,
              builder: (_, used, __) {
                final total = _srs.getDailyNewLimit();
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
