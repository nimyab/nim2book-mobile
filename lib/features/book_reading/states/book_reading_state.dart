import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';

part 'book_reading_state.freezed.dart';

@freezed
abstract class BookReadingState with _$BookReadingState {
  const factory BookReadingState({
    required final String bookId,
    required final List<ChapterAlignNode> chapters,
    required final int currentChapterIndex,
    required final int? selectedParagraphIndex,
    required final int? selectedWordIndex,
    required final Map<int, double> chapterProgress,
    @Default(false) final bool prefsLoaded,
  }) = _BookReadingState;
}
