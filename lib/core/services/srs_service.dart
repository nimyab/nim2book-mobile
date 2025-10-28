import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../srs/srs_item.dart';
import '../srs/srs_scheduler_sm2.dart';

String _srsKey(String word) => 'srs_item_$word';

class SrsService {
  final SharedPreferences _sharedPreferences = GetIt.I.get<SharedPreferences>();
  final SrsSchedulerSM2 _scheduler = const SrsSchedulerSM2();

  SrsItem getOrCreateItem(String word) {
    final jsonStr = _sharedPreferences.getString(_srsKey(word));
    if (jsonStr == null) {
      final item = SrsItem.initial(word);
      _sharedPreferences.setString(_srsKey(word), jsonEncode(item.toJson()));
      return item;
    }
    try {
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      return SrsItem.fromJson(jsonMap);
    } catch (_) {
      final item = SrsItem.initial(word);
      _sharedPreferences.setString(_srsKey(word), jsonEncode(item.toJson()));
      return item;
    }
  }

  void upsertItem(SrsItem item) {
    _sharedPreferences.setString(_srsKey(item.word), jsonEncode(item.toJson()));
  }

  SrsItem updateWithRating(String word, SrsRating rating) {
    final item = getOrCreateItem(word);
    final updated = _scheduler.updateOnRating(item, rating);
    upsertItem(updated);
    return updated;
  }

  int getDueCount(Iterable<String> words, {DateTime? now}) {
    final n = now ?? DateTime.now();
    int count = 0;
    for (final word in words) {
      final item = getOrCreateItem(word);
      if (!item.nextReviewAt.isAfter(n)) {
        count++;
      }
    }
    return count;
  }

  List<String> getDueWords(Iterable<String> words, {DateTime? now}) {
    final n = now ?? DateTime.now();
    final due = <String>[];
    for (final word in words) {
      final item = getOrCreateItem(word);
      if (!item.nextReviewAt.isAfter(n)) {
        due.add(word);
      }
    }
    return due;
  }
}
