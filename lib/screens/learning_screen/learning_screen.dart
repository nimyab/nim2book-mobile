import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/providers/statistics/statistics_provider.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';

import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class LearningScreen extends ConsumerStatefulWidget {
  const LearningScreen({super.key});

  @override
  ConsumerState<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends ConsumerState<LearningScreen> {
  static const bool isMock = false;

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final savedCards = ref.watch(dictionaryCardsProvider);
    final theme = Theme.of(context);
    final dictionary = ref.watch(dictionaryServiceProvider);
    final statisticState = ref.watch(statisticsNotifierProvider);
    final now = DateTime.now();

    // Преобразуем Map в плоский список карточек
    final allCards = savedCards;

    final reviewDueCount = dictionary.getReviewDueCount(allCards, now: now);
    final newDueCount = dictionary.getNewDueCount(allCards, now: now);

    final hasNew = newDueCount > 0;
    final hasReview = reviewDueCount > 0;

    var learnedTotal = statisticState.countLearnedCards;
    // Повторенные = все карточки, которые не новые (Review + Relearning)
    var repeatedTotal =
        statisticState.countLearnedCards + statisticState.countRelearningCards;

    if (isMock) {
      final today = DateTime(now.year, now.month, now.day);
      final mockStart = today.subtract(const Duration(days: 729));
      final rnd = math.Random(42);

      final mockDays = today.difference(mockStart).inDays + 1;
      final learnedDaily = List<int>.generate(mockDays, (final i) {
        const base = 3;
        const amp = 4;
        final seasonal = math.sin(i / 14.0) * amp;
        final noise = rnd.nextInt(3);
        final v = (base + seasonal + noise).round();
        return v < 0 ? 0 : v;
      });
      final repeatedDaily = List<int>.generate(mockDays, (final i) {
        return (learnedDaily[i] ~/ 2) + rnd.nextInt(2);
      });

      // Дополнительно мокируем агрегаты для статистики
      final totalLearned = learnedDaily.fold<int>(
        0,
        (final a, final b) => a + b,
      );
      final totalRepeated = repeatedDaily.fold<int>(
        0,
        (final a, final b) => a + b,
      );

      learnedTotal = totalLearned;
      repeatedTotal = totalRepeated;
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.learning), centerTitle: true),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Переход в словарь в виде карточки, как и другие кнопки
            Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(l10n.dictionary),
                onTap: () => context.push('/dictionary'),
              ),
            ),

            const SizedBox(height: 8),

            // Карточки режимов обучения
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.add_circle_outline,
                  color: hasNew
                      ? null
                      : theme.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.38,
                        ),
                ),
                title: Text(l10n.learnNewWords),
                onTap: () {
                  if (!hasNew) {
                    final messenger = ScaffoldMessenger.of(context);
                    messenger.clearSnackBars();
                    messenger.showSnackBar(
                      SnackBar(content: Text(l10n.noNewWordsToday)),
                    );
                    return;
                  }
                  context.push('/learning-session/new');
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.refresh_outlined,
                  color: hasReview
                      ? null
                      : theme.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.38,
                        ),
                ),
                title: Text(l10n.reviewWords),
                subtitle: Text(l10n.reviewDueToday(reviewDueCount)),
                onTap: () {
                  if (!hasReview) {
                    final messenger = ScaffoldMessenger.of(context);
                    messenger.clearSnackBars();
                    messenger.showSnackBar(
                      SnackBar(content: Text(l10n.noReviewWordsDue)),
                    );
                    return;
                  }
                  context.push('/learning-session/review');
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.auto_awesome_motion_outlined),
                title: Text(l10n.mixedMode),
                onTap: () {
                  context.push('/learning-session/mixed');
                },
              ),
            ),

            // Убраны кнопки "Пролистать слова" и "Автоматический режим"
            const SizedBox(height: 12),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${l10n.period}: ',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.0,
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).extension<ChartColors>()!.learned,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        SizedBox(
                          width: 64,
                          child: Text(
                            l10n.chartLegendTotal,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            l10n.chartLegendLearned,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$learnedTotal',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).extension<ChartColors>()!.repeated,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            l10n.chartLegendRepeated,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$repeatedTotal',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
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
