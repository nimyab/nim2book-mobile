import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/original_paragraph.dart';
import 'package:provider/provider.dart';

class OriginalTextScroll extends StatelessWidget {
  const OriginalTextScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final readingContext = context.watch<ReadingContext>();
    final currentConvertedChapter = readingContext.currentConvertedChapter;

    return ListView.builder(
      cacheExtent: 2000,
      itemCount: currentConvertedChapter.length,
      itemBuilder: (context, paragraphIndex) {
        final paragraph = currentConvertedChapter[paragraphIndex];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: OriginalParagraph(
            paragraph: paragraph,
            paragraphIndex: paragraphIndex,
            selectedParagraphIndex: readingContext.selectedParagraphIndex,
            selectedWordIndex: readingContext.selectedWordIndex,
            selectWord: readingContext.selectWord,
          ),
        );
      },
    );
  }
}
