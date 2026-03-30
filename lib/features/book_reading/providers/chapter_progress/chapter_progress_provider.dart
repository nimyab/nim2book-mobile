import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChapterProgressNotifier extends Notifier<Map<int, double>> {
  ChapterProgressNotifier(this.bookId);

  final String bookId;
  late SharedPreferences _prefs;
  Timer? _saveDebounceTimer;
  static const _saveDebounceDuration = Duration(milliseconds: 500);
  static const _minDeltaToUpdate = 16.0;

  @override
  Map<int, double> build() {
    _prefs = ref.read(sharedPreferencesProvider);
    ref.onDispose(() {
      _saveDebounceTimer?.cancel();
    });
    final serialized = _prefs.getString(_chapterProgressKey(bookId));
    if (serialized == null || serialized.isEmpty) {
      return const {};
    }
    final progress = <int, double>{};
    final pairs = serialized.split(';');
    for (final p in pairs) {
      final kv = p.split(':');
      if (kv.length != 2) continue;
      final k = int.tryParse(kv[0]);
      final v = double.tryParse(kv[1]);
      if (k != null && v != null) {
        progress[k] = v;
      }
    }
    return progress;
  }

  void setProgress(final int chapterIndex, final double progress) {
    if (chapterIndex < 0) return;
    final current = state[chapterIndex];
    if (current != null && (progress - current).abs() < _minDeltaToUpdate) {
      return;
    }
    final map = Map<int, double>.from(state);
    map[chapterIndex] = progress;
    state = map;
    _debouncedPersist();
  }

  double getProgress(final int chapterIndex) {
    return state[chapterIndex] ?? 0.0;
  }

  void _debouncedPersist() {
    _saveDebounceTimer?.cancel();
    _saveDebounceTimer = Timer(_saveDebounceDuration, _persistImmediately);
  }

  void _persistImmediately() {
    final serialized = state.entries
        .map((final e) => '${e.key}:${(e.value).toStringAsFixed(6)}')
        .join(';');
    _prefs.setString(_chapterProgressKey(bookId), serialized);
  }

  String _chapterProgressKey(final String currentBookId) =>
      'reading_progress_$currentBookId';
}

final chapterProgressNotifierProvider = NotifierProvider.autoDispose
    .family<ChapterProgressNotifier, Map<int, double>, String>(
      ChapterProgressNotifier.new,
    );
