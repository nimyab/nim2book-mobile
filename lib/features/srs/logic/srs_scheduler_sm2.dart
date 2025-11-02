import 'package:nim2book_mobile_flutter/features/srs/models/srs_item.dart';

class SrsSchedulerSM2 {
  const SrsSchedulerSM2();

  /// Применяет обновление по алгоритму SM‑2 для указанного [item] и [rating].
  /// Возвращает обновлённую неизменяемую копию.
  SrsItem updateOnRating(SrsItem item, SrsRating rating, {DateTime? now}) {
    final q = _qualityFromRating(rating);
    final currentEf = item.easiness;
    final n = now ?? DateTime.now();

    // Обновление EF
    final delta = 0.1 - (5 - q) * (0.08 + (5 - q) * 0.02);
    double newEf = currentEf + delta;
    if (newEf < 1.3) newEf = 1.3; // нижняя граница по SM-2

    int newRepetition = item.repetition;
    int newInterval;

    if (q < 3) {
      // Сброс при провале
      newRepetition = 0;
      newInterval = 1; // повтор завтра
    } else {
      newRepetition += 1;
      if (newRepetition == 1) {
        newInterval = 1; // первое успешное повторение: на следующий день
      } else if (newRepetition == 2) {
        newInterval = 6; // второе успешное повторение: 6 дней
      } else {
        newInterval = (item.intervalDays * newEf).round();
        if (newInterval < 1) newInterval = 1;
      }
    }

    final next = n.add(Duration(days: newInterval));

    return item.copyWith(
      repetition: newRepetition,
      intervalDays: newInterval,
      easiness: newEf,
      lastReviewedAt: n,
      nextReviewAt: next,
    );
  }

  int _qualityFromRating(SrsRating rating) {
    switch (rating) {
      case SrsRating.again:
        return 2; // провал
      case SrsRating.hard:
        return 3;
      case SrsRating.good:
        return 4;
      case SrsRating.easy:
        return 5;
    }
  }
}
