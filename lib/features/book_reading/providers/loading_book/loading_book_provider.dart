import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_state.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LoadingBookNotifier extends Notifier<LoadingBookState> {
  LoadingBookNotifier(this.bookId);

  final String bookId;
  late final BookService _bookService;
  late final Talker _logger;

  @override
  LoadingBookState build() {
    _bookService = ref.read(bookServiceProvider);
    _logger = ref.read(talkerProvider);
    return const LoadingBookState();
  }

  Future<void> getBookData() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final book = await _bookService.getBook(bookId);
      if (book == null) {
        _logger.warning('Book not found: $bookId');
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
      _logger.error('Failed to load book data for $bookId: $e');
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
      const progressThrottle = Duration(milliseconds: 250);
      var lastProgressUpdate = DateTime.now();

      for (var i = 0; i < total; i += 1) {
        final bookChapter = bookChapters[i];
        try {
          results[i] = await _bookService
              .getChapter(
                bookId: book.id,
                chapterNumber: bookChapter.order,
                path: bookChapter.contentURL,
              )
              .timeout(const Duration(seconds: 30));
          _logger.info(
            'Loaded chapter ${bookChapter.order} for book ${book.id}, total $total',
          );
        } catch (e) {
          _logger.warning(
            'Failed to load chapter ${bookChapter.order} for book ${book.id}: $e',
          );
          results[i] = null;
        }
        final now = DateTime.now();
        if (now.difference(lastProgressUpdate) >= progressThrottle ||
            i == total - 1) {
          lastProgressUpdate = now;
          state = state.copyWith(progress: (i + 1) / total);
        }
      }

      state = state.copyWith(chapters: results, progress: 1.0);
    } catch (e) {
      _logger.error('Failed to load chapters for book ${book.id}: $e');
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}

final loadingBookNotifierProvider = NotifierProvider.autoDispose
    .family<LoadingBookNotifier, LoadingBookState, String>(
      LoadingBookNotifier.new,
    );
