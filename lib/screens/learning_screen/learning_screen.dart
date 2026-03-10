import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/providers/statistics/statistics_provider.dart';
import 'package:nim2book_mobile_flutter/core/router/app_routes.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/widgets/dictionary_entry_card.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/widgets/due_now_card.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/widgets/learning_mode_card.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/widgets/period_card.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/widgets/totals_card.dart';

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
    ref.listen<String?>(
      dictionaryNotifierProvider.select((s) => s.errorMessage),
      (previous, next) {
        if (next != null && next != previous) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next)));
        }
      },
    );

    final l10n = AppLocalizations.of(context)!;
    final savedCards = ref.watch(dictionaryCardsProvider);
    final theme = Theme.of(context);
    final chartColors = theme.extension<ChartColors>()!;
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
            DictionaryEntryCard(
              l10n: l10n,
              onTap: () => context.push(AppRoutes.dictionary),
            ),
            const SizedBox(height: 8),
            LearningModeCard(
              icon: Icons.add_circle_outline,
              title: l10n.learnNewWords,
              enabled: hasNew,
              theme: theme,
              onTap: () {
                if (!hasNew) {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.clearSnackBars();
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.noNewWordsToday)),
                  );
                  return;
                }
                context.push(AppRoutes.learningSessionNewPath);
              },
            ),
            const SizedBox(height: 8),
            LearningModeCard(
              icon: Icons.refresh_outlined,
              title: l10n.reviewWords,
              subtitle: l10n.reviewDueToday(reviewDueCount),
              enabled: hasReview,
              theme: theme,
              onTap: () {
                if (!hasReview) {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.clearSnackBars();
                  messenger.showSnackBar(
                    SnackBar(content: Text(l10n.noReviewWordsDue)),
                  );
                  return;
                }
                context.push(AppRoutes.learningSessionReviewPath);
              },
            ),
            const SizedBox(height: 8),
            LearningModeCard(
              icon: Icons.auto_awesome_motion_outlined,
              title: l10n.mixedMode,
              enabled: true,
              theme: theme,
              onTap: () {
                context.push(AppRoutes.learningSessionMixedPath);
              },
            ),
            const SizedBox(height: 12),
            DueNowCard(
              l10n: l10n,
              theme: theme,
              newDueCount: newDueCount,
              reviewDueCount: reviewDueCount,
            ),
            const SizedBox(height: 12),
            PeriodCard(l10n: l10n, theme: theme),
            const SizedBox(height: 12),
            TotalsCard(
              l10n: l10n,
              theme: theme,
              chartColors: chartColors,
              learnedTotal: learnedTotal,
              repeatedTotal: repeatedTotal,
            ),
          ],
        ),
      ),
    );
  }
}
