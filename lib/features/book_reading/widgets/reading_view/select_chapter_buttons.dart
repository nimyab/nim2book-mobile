import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:provider/provider.dart';

class SelectChapterButtons extends StatelessWidget {
  const SelectChapterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final readingContext = context.watch<BookReadingContext>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        if (readingContext.currentChapterIndex > 0)
          IconButton.filledTonal(
            onPressed: () => readingContext.goToPreviousChapter(),
            icon: const Icon(Icons.arrow_back),
          ),
        if (readingContext.currentChapterIndex <
            readingContext.totalChapters - 1)
          IconButton.filledTonal(
            onPressed: () => readingContext.goToNextChapter(),
            icon: const Icon(Icons.arrow_forward),
          ),
      ],
    );
  }
}
