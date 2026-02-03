import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/book_reading_notifier.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';

class SelectChapterButtons extends ConsumerWidget {
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const SelectChapterButtons({
    super.key,
    required this.bookId,
    required this.chapters,
  });

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final bookReadingParam = (bookId: bookId, chapters: chapters);
    final readingState = ref.watch(
      bookReadingNotifierProvider(bookReadingParam),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        if (readingState.currentChapterIndex > 0)
          IconButton.filledTonal(
            onPressed: () => ref
                .read(bookReadingNotifierProvider(bookReadingParam).notifier)
                .goToPreviousChapter(),
            icon: const Icon(Icons.arrow_back),
          ),
        if (readingState.currentChapterIndex < readingState.chapters.length - 1)
          IconButton.filledTonal(
            onPressed: () => ref
                .read(bookReadingNotifierProvider(bookReadingParam).notifier)
                .goToNextChapter(),
            icon: const Icon(Icons.arrow_forward),
          ),
      ],
    );
  }
}
