import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/loading_book/loading_book_state.dart';

class LoadingBookCubit extends Cubit<LoadingBookState> {
  final String bookId;
  final BookService _bookService = GetIt.I.get<BookService>();

  LoadingBookCubit({required this.bookId}) : super(const LoadingBookState());

  Future<void> getBookData() async {
    try {
      emit(state.copyWith(isLoading: true));

      final book = await _bookService.getBook(bookId);
      if (book == null) return;
      emit(state.copyWith(book: book));

      final chapterCount = book.chapterPaths.length;
      for (var i = 0; i < chapterCount; i++) {
        final path = book.chapterPaths[i];
        final chapter = await _bookService.getChapter(path);
        if (chapter == null) continue;

        final updatedChapters = List<ChapterAlignNode>.from(state.chapters)
          ..add(chapter);
        final progress = (i + 1) / chapterCount;
        emit(state.copyWith(chapters: updatedChapters, progress: progress));
      }
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
