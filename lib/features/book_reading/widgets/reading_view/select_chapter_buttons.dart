import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_provider.dart';

class SelectChapterButtons extends ConsumerWidget {
  final String bookId;

  const SelectChapterButtons({super.key, required this.bookId});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final bookId = this.bookId;

    // Get chapters length from loading provider
    final chaptersLength = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.chapters.length),
    );

    final readingState = ref.watch(bookReadingNotifierProvider(bookId));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        if (readingState.currentChapterIndex > 0)
          IconButton.filledTonal(
            onPressed: () => ref
                .read(bookReadingNotifierProvider(bookId).notifier)
                .goToPreviousChapter(),
            icon: const Icon(Icons.arrow_back),
          ),
        if (readingState.currentChapterIndex < chaptersLength - 1)
          IconButton.filledTonal(
            onPressed: () => ref
                .read(bookReadingNotifierProvider(bookId).notifier)
                .goToNextChapter(),
            icon: const Icon(Icons.arrow_forward),
          ),
      ],
    );
  }
}
