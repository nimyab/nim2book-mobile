import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/models/word_item.dart';

class ChapterConverter {
  const ChapterConverter();

  static List<WordItem> convertParagraph(
    final ParagraphAlignNode paragraph,
    final int paragraphIndex,
  ) {
    final alignWordNodes = paragraph.aw;
    final items = <WordItem>[];

    for (var idx = 0; idx < alignWordNodes.length; idx++) {
      final wordAlign = alignWordNodes[idx];
      final startIndex = wordAlign.iow.first;
      final endIndex = wordAlign.iow.last;

      final wordText = paragraph.op.substring(startIndex, endIndex);

      items.add(
        WordItem(
          wordText: wordText,
          wordIndex: idx,
          paragraphIndex: paragraphIndex,
        ),
      );
    }

    return items;
  }
}
