import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_state.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookReadingNotifier extends Notifier<BookReadingState> {
  BookReadingNotifier(this.bookId);

  final String bookId;
  late SharedPreferences _prefs;

  // Debounce timer to avoid excessive writes
  Timer? _saveDebounceTimer;
  static const _saveDebounceDuration = Duration(milliseconds: 500);

  @override
  BookReadingState build() {
    _prefs = ref.read(sharedPreferencesProvider);

    // Get chapters from loading provider to avoid parameter mutation
    final chapters = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.chapters),
    );

    // Cancel debounce timer when provider is disposed
    ref.onDispose(() {
      _saveDebounceTimer?.cancel();
      // Save immediately on dispose to ensure state is persisted
      _persistImmediately();
    });

    return BookReadingState(
      bookId: bookId,
      chapters: chapters,
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

    final currentIndex = savedIndex ?? 0;
    state = state.copyWith(
      currentChapterIndex: currentIndex,
      chapterProgress: progress,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
      prefsLoaded: true,
    );

    // Preload current and adjacent chapters
    unawaited(
      ref
          .read(loadingBookNotifierProvider(bookId).notifier)
          .preloadChapters(currentIndex),
    );
  }

  void setChapters(final List<ChapterAlignNode?> chapters) {
    state = state.copyWith(chapters: chapters);
  }

  int get totalChapters => state.chapters.length;

  ChapterAlignNode? get currentChapter {
    if (state.chapters.isEmpty ||
        state.currentChapterIndex >= state.chapters.length) {
      return null;
    }
    return state.chapters[state.currentChapterIndex];
  }

  void goToChapter(final int index) {
    if (index < 0 || index >= state.chapters.length) return;
    state = state.copyWith(
      currentChapterIndex: index,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
    );
    _debouncedPersist();

    // Preload adjacent chapters when changing chapter
    ref
        .read(loadingBookNotifierProvider(bookId).notifier)
        .preloadChapters(index);
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

  void selectWord(final int paragraphIndex, final int wordIndex) {
    state = state.copyWith(
      selectedParagraphIndex: paragraphIndex,
      selectedWordIndex: wordIndex,
    );
  }

  void setChapterProgress(final int chapterIndex, final double progress) {
    final map = Map<int, double>.from(state.chapterProgress);
    map[chapterIndex] = progress;
    state = state.copyWith(chapterProgress: map);
    _debouncedPersist();
  }

  double getChapterProgress(final int chapterIndex) {
    return state.chapterProgress[chapterIndex] ?? 0.0;
  }

  /// Debounced persist to avoid excessive SharedPreferences writes
  void _debouncedPersist() {
    _saveDebounceTimer?.cancel();
    _saveDebounceTimer = Timer(_saveDebounceDuration, () {
      _persistImmediately();
    });
  }

  /// Persist both chapter index and progress immediately without blocking
  void _persistImmediately() {
    final chapterIndex = state.currentChapterIndex;
    final serialized = state.chapterProgress.entries
        .map((final e) => '${e.key}:${(e.value).toStringAsFixed(6)}')
        .join(';');

    // Fire both writes asynchronously without awaiting
    _prefs.setInt(_chapterIndexKey(state.bookId), chapterIndex);
    _prefs.setString(_chapterProgressKey(state.bookId), serialized);
  }

  String _chapterIndexKey(final String bookId) =>
      'reading_current_chapter_$bookId';
  String _chapterProgressKey(final String bookId) => 'reading_progress_$bookId';
}

// Family provider for book reading with bookId parameter only
// Chapters are retrieved from loadingBookNotifierProvider to avoid parameter mutation
final bookReadingNotifierProvider = NotifierProvider.autoDispose
    .family<BookReadingNotifier, BookReadingState, String>(
      BookReadingNotifier.new,
    );
