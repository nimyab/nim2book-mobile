import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/states/loading_book_state.dart';

class LoadingBookNotifier extends FamilyNotifier<LoadingBookState, String> {
  late final BookService _bookService;
  late final String bookId;

  @override
  LoadingBookState build(String arg) {
    bookId = arg;
    _bookService = ref.read(bookServiceProvider);
    return const LoadingBookState();
  }

  Future<void> getBookData() async {
    try {
      state = state.copyWith(isLoading: true);

      final book = await _bookService.getBook(bookId);
      if (book == null) return;
      state = state.copyWith(book: book);

      final chapterCount = book.chapterPaths.length;
      for (var i = 0; i < chapterCount; i++) {
        final path = book.chapterPaths[i];
        final chapter = await _bookService.getChapter(path);
        if (chapter == null) continue;

        final updatedChapters = List<ChapterAlignNode>.from(state.chapters)
          ..add(chapter);
        final progress = (i + 1) / chapterCount;
        state = state.copyWith(chapters: updatedChapters, progress: progress);
      }
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final loadingBookNotifierProvider =
    NotifierProvider.family<LoadingBookNotifier, LoadingBookState, String>(
      LoadingBookNotifier.new,
    );
