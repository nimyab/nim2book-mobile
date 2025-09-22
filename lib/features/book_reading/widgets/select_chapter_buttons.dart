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
          ElevatedButton(
            onPressed: () {
              readingContext.goToPreviousChapter();
            },
            child: const Text('prev'),
          ),
        if (readingContext.currentChapterIndex <
            readingContext.totalChapters - 1)
          ElevatedButton(
            onPressed: () async {
              await readingContext.goToNextChapter();
            },
            child: const Text('next'),
          ),
      ],
    );
  }
}
