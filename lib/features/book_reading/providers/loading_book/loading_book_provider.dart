import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_state.dart';

class LoadingBookNotifier extends Notifier<LoadingBookState> {
  LoadingBookNotifier(this.bookId);

  final String bookId;
  late final BookService _bookService;

  @override
  LoadingBookState build() {
    _bookService = ref.read(bookServiceProvider);
    return const LoadingBookState();
  }

  Future<void> getBookData() async {
    try {
      state = state.copyWith(isLoading: true);

      final book = await _bookService.getBook(bookId);
      if (book == null) return;
      state = state.copyWith(book: book);

      // Don't load chapters here - they will be loaded lazily on demand
      state = state.copyWith(
        chapters: List.filled(book.chapterPaths.length, null),
        progress: 0.0,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Load chapter by index if not already loaded
  Future<void> ensureChapterLoaded(int chapterIndex) async {
    final book = state.book;
    if (book == null ||
        chapterIndex < 0 ||
        chapterIndex >= book.chapterPaths.length) {
      return;
    }

    // Already loaded?
    if (state.chapters[chapterIndex] != null) {
      return;
    }

    final path = book.chapterPaths[chapterIndex];
    final chapter = await _bookService.getChapter(path);
    if (chapter != null) {
      final updatedChapters = List<ChapterAlignNode?>.from(state.chapters);
      updatedChapters[chapterIndex] = chapter;
      state = state.copyWith(chapters: updatedChapters);
    }
  }

  /// Preload current chapter and adjacent chapters for smooth navigation
  Future<void> preloadChapters(int currentIndex) async {
    final book = state.book;
    if (book == null) return;

    final chapterCount = book.chapterPaths.length;

    // Load current, previous and next chapters in parallel
    final indicesToLoad = <int>[
      currentIndex,
      if (currentIndex > 0) currentIndex - 1,
      if (currentIndex < chapterCount - 1) currentIndex + 1,
    ];

    await Future.wait(indicesToLoad.map((index) => ensureChapterLoaded(index)));
  }
}

final loadingBookNotifierProvider =
    NotifierProvider.family<LoadingBookNotifier, LoadingBookState, String>(
      LoadingBookNotifier.new,
    );
