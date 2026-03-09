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
      state = state.copyWith(isLoading: true, errorMessage: null);

      final book = await _bookService.getBook(bookId);
      if (book == null) {
        state = state.copyWith(errorMessage: 'Book not found');
        return;
      }
      state = state.copyWith(book: book);

      final totalChapters = book.bookChapters?.length ?? 0;
      final chapters = List<ChapterAlignNode?>.filled(totalChapters, null);

      state = state.copyWith(chapters: chapters, progress: 0.0);

      if (totalChapters > 0) {
        await _loadAllChapters(book);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _loadAllChapters(final Book book) async {
    try {
      final bookChapters = book.bookChapters;
      if (bookChapters == null || bookChapters.isEmpty) return;

      final total = bookChapters.length;
      final results = List<ChapterAlignNode?>.filled(total, null);
      var loadedCount = 0;
      const batchSize = 5;

      for (var i = 0; i < total; i += batchSize) {
        final end = (i + batchSize < total) ? i + batchSize : total;
        final futures = List.generate(end - i, (final localIndex) async {
          final chapterIndex = i + localIndex;
          final bookChapter = bookChapters[chapterIndex];
          try {
            return await _bookService
                .getChapter(
                  bookId: book.id,
                  chapterNumber: bookChapter.order,
                  path: bookChapter.contentURL,
                )
                .timeout(const Duration(seconds: 10));
          } catch (e) {
            return null;
          }
        });

        final batchResults = await Future.wait(futures);
        for (
          var localIndex = 0;
          localIndex < batchResults.length;
          localIndex++
        ) {
          results[i + localIndex] = batchResults[localIndex];
        }
        loadedCount += batchResults.length;

        state = state.copyWith(progress: loadedCount / total);
      }

      state = state.copyWith(chapters: results, progress: 1.0);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}

final loadingBookNotifierProvider = NotifierProvider.autoDispose
    .family<LoadingBookNotifier, LoadingBookState, String>(
      LoadingBookNotifier.new,
    );
