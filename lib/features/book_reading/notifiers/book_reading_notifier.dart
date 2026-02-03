import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/states/book_reading_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookReadingNotifier
    extends
        FamilyNotifier<
          BookReadingState,
          ({String bookId, List<ChapterAlignNode> chapters})
        > {
  late final SharedPreferences _prefs;

  @override
  BookReadingState build(
    ({String bookId, List<ChapterAlignNode> chapters}) arg,
  ) {
    _prefs = ref.read(sharedPreferencesProvider);
    return BookReadingState(
      bookId: arg.bookId,
      chapters: arg.chapters,
      currentChapterIndex: 0,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
      chapterProgress: const {},
      prefsLoaded: false,
    );
  }

  Future<void> initialize() async {
    final chapterKey = _chapterIndexKey(state.bookId);
    final progressKey = _chapterProgressKey(state.bookId);
    final savedIndex = _prefs.getInt(chapterKey);
    final savedProgress = _prefs.getString(progressKey);

    final progress = <int, double>{};
    if (savedProgress != null && savedProgress.isNotEmpty) {
      // Simple "k:v;k:v" map serialization
      final pairs = savedProgress.split(';');
      for (final p in pairs) {
        final kv = p.split(':');
        if (kv.length == 2) {
          final k = int.tryParse(kv[0]);
          final v = double.tryParse(kv[1]);
          if (k != null && v != null) {
            progress[k] = v;
          }
        }
      }
    }

    state = state.copyWith(
      currentChapterIndex: savedIndex ?? 0,
      chapterProgress: progress,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
      prefsLoaded: true,
    );
  }

  void setChapters(final List<ChapterAlignNode> chapters) {
    state = state.copyWith(chapters: chapters);
  }

  int get totalChapters => state.chapters.length;

  ChapterAlignNode? get currentChapter =>
      state.chapters.isEmpty ? null : state.chapters[state.currentChapterIndex];

  void goToChapter(final int index) {
    if (index < 0 || index >= state.chapters.length) return;
    state = state.copyWith(
      currentChapterIndex: index,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
    );
    _persistChapterIndex(index);
  }

  void goToNextChapter() {
    final next = state.currentChapterIndex + 1;
    if (next < state.chapters.length) {
      goToChapter(next);
    }
  }

  void goToPreviousChapter() {
    final prev = state.currentChapterIndex - 1;
    if (prev >= 0) {
      goToChapter(prev);
    }
  }

  void selectParagraph(final int paragraphIndex) {
    state = state.copyWith(
      selectedParagraphIndex: paragraphIndex,
      selectedWordIndex: null,
    );
  }

  void selectWord(final int paragraphIndex, final int wordIndex) {
    state = state.copyWith(
      selectedParagraphIndex: paragraphIndex,
      selectedWordIndex: wordIndex,
    );
  }

  void clearSelection() {
    state = state.copyWith(
      selectedParagraphIndex: null,
      selectedWordIndex: null,
    );
  }

  void setChapterProgress(final int chapterIndex, final double progress) {
    final map = Map<int, double>.from(state.chapterProgress);
    map[chapterIndex] = progress;
    state = state.copyWith(chapterProgress: map);
    _persistChapterProgress(map);
  }

  double getChapterProgress(final int chapterIndex) {
    return state.chapterProgress[chapterIndex] ?? 0.0;
  }

  Future<void> _persistChapterIndex(final int index) async {
    await _prefs.setInt(_chapterIndexKey(state.bookId), index);
  }

  Future<void> _persistChapterProgress(final Map<int, double> map) async {
    final serialized = map.entries
        .map((final e) => '${e.key}:${(e.value).toStringAsFixed(6)}')
        .join(';');
    await _prefs.setString(_chapterProgressKey(state.bookId), serialized);
  }

  String _chapterIndexKey(final String bookId) =>
      'reading_current_chapter_$bookId';
  String _chapterProgressKey(final String bookId) => 'reading_progress_$bookId';
}

// Family provider for book reading with bookId parameter
final bookReadingNotifierProvider =
    NotifierProvider.family<
      BookReadingNotifier,
      BookReadingState,
      ({String bookId, List<ChapterAlignNode> chapters})
    >(BookReadingNotifier.new);
