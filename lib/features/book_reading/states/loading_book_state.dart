import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';

part 'loading_book_state.freezed.dart';

@freezed
abstract class LoadingBookState with _$LoadingBookState {
  const factory LoadingBookState({
    final Book? book,
    @Default([]) final List<ChapterAlignNode> chapters,
    @Default(0.0) final double progress,
    @Default(false) final bool isLoading,
  }) = _LoadingBookState;
}
