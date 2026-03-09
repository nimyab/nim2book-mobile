import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_reading_state.freezed.dart';

@freezed
abstract class BookReadingState with _$BookReadingState {
  const factory BookReadingState({
    required final String bookId,
    required final int currentChapterIndex,
    required final int? selectedParagraphIndex,
    required final int? selectedWordIndex,
    @Default(false) final bool prefsLoaded,
  }) = _BookReadingState;
}
