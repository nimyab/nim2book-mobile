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
    });

    return BookReadingState(
      bookId: bookId,
      chapters: chapters,
      currentChapterIndex: 0,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
      prefsLoaded: false,
    );
  }

  Future<void> initialize() async {
    final chapterKey = _chapterIndexKey(state.bookId);
    final savedIndex = _prefs.getInt(chapterKey);

    final currentIndex = savedIndex ?? 0;
    state = state.copyWith(
      currentChapterIndex: currentIndex,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
      prefsLoaded: true,
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
    if (state.currentChapterIndex == index &&
        state.selectedParagraphIndex == null &&
        state.selectedWordIndex == null) {
      return;
    }
    state = state.copyWith(
      currentChapterIndex: index,
      selectedParagraphIndex: null,
      selectedWordIndex: null,
    );
    _debouncedPersist();
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
    if (state.selectedParagraphIndex == paragraphIndex &&
        state.selectedWordIndex == wordIndex) {
      return;
    }
    state = state.copyWith(
      selectedParagraphIndex: paragraphIndex,
      selectedWordIndex: wordIndex,
    );
  }

  /// Debounced persist to avoid excessive SharedPreferences writes
  void _debouncedPersist() {
    _saveDebounceTimer?.cancel();
    _saveDebounceTimer = Timer(_saveDebounceDuration, () {
      _persistImmediately();
    });
  }

  /// Persist chapter index immediately without blocking
  void _persistImmediately() {
    final chapterIndex = state.currentChapterIndex;

    _prefs.setInt(_chapterIndexKey(state.bookId), chapterIndex);
  }

  String _chapterIndexKey(final String bookId) =>
      'reading_current_chapter_$bookId';
}

final bookReadingNotifierProvider = NotifierProvider.autoDispose
    .family<BookReadingNotifier, BookReadingState, String>(
      BookReadingNotifier.new,
    );
