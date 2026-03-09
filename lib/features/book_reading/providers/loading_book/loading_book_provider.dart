import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
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

      final totalChapters = book.bookChapters?.length ?? 0;
      final chapters = List<ChapterAlignNode?>.filled(totalChapters, null);

      state = state.copyWith(
        chapters: chapters,
        progress: 0.0,
      );

      if (totalChapters > 0) {
        await _loadAllChapters(book);
      }
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _loadAllChapters(final Book book) async {
    final bookChapters = book.bookChapters;
    if (bookChapters == null || bookChapters.isEmpty) return;

    final total = bookChapters.length;
    final updatedChapters = List<ChapterAlignNode?>.from(state.chapters);

    // Load in batches to avoid overwhelming the network but still be fast
    const batchSize = 5;

    for (var i = 0; i < total; i += batchSize) {
      final end = (i + batchSize < total) ? i + batchSize : total;
      final batchFutures = <Future<void>>[];

      for (var j = i; j < end; j++) {
        batchFutures.add(() async {
          final bookChapter = bookChapters[j];
          final chapter = await _bookService.getChapter(
            bookId: book.id,
            chapterNumber: bookChapter.order,
            path: bookChapter.contentURL,
          );
          updatedChapters[j] = chapter;
        }());
      }

      await Future.wait(batchFutures);

      // Check if mounted/active before updating state (Notifier doesn't have mounted check like State,
      // but we can check if we are disposed if we had a way, or just update.
      // Riverpod notifiers are generally safe to update unless disposed, but let's just update.)
      state = state.copyWith(
        chapters: List.from(updatedChapters),
        progress: end / total,
      );
    }
  }

  /// Load chapter by index if not already loaded
  Future<void> ensureChapterLoaded(final int chapterIndex) async {
    final book = state.book;
    if (book == null ||
        book.bookChapters == null ||
        chapterIndex < 0 ||
        chapterIndex >= (book.bookChapters?.length ?? 0)) {
      return;
    }

    // Already loaded?
    if (state.chapters[chapterIndex] != null) {
      return;
    }

    final bookChapter = book.bookChapters![chapterIndex];
    final path = bookChapter.contentURL;
    final chapter = await _bookService.getChapter(
      bookId: book.id,
      chapterNumber: bookChapter.order,
      path: path,
    );
    if (chapter != null) {
      final updatedChapters = List<ChapterAlignNode?>.from(state.chapters);
      updatedChapters[chapterIndex] = chapter;
      state = state.copyWith(chapters: updatedChapters);
    }
  }
}

final loadingBookNotifierProvider = NotifierProvider.autoDispose
    .family<LoadingBookNotifier, LoadingBookState, String>(
      LoadingBookNotifier.new,
    );
