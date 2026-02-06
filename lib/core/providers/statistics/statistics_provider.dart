import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_provider.dart';
import 'package:nim2book_mobile_flutter/core/providers/statistics/statistics_state.dart';

class StatisticsNotifier extends Notifier<StatisticsState> {
  @override
  StatisticsState build() {
    final cards = ref.watch(dictionaryCardsProvider);

    return StatisticsState(
      countLearnedCards: _countLearnedCards(cards),
      countLearningCards: _countLearningCards(cards),
      countRelearningCards: _countRelearningCards(cards),
    );
  }

  /// Подсчитывает количество заученных карточек (в состоянии Review)
  int _countLearnedCards(List<DictionaryCard> cards) {
    return cards.where((card) => card.fsrsCard.state == State.review).length;
  }

  /// Подсчитывает количество карточек в процессе обучения (Learning)
  int _countLearningCards(List<DictionaryCard> cards) {
    return cards.where((card) => card.fsrsCard.state == State.learning).length;
  }

  /// Подсчитывает количество карточек на переобучении (Relearning)
  int _countRelearningCards(List<DictionaryCard> cards) {
    return cards
        .where((card) => card.fsrsCard.state == State.relearning)
        .length;
  }
}

final statisticsNotifierProvider =
    NotifierProvider.autoDispose<StatisticsNotifier, StatisticsState>(
      StatisticsNotifier.new,
    );
