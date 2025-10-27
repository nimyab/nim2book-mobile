import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/models/word_item.dart';

class ChapterConverter {
  const ChapterConverter();

  List<WordItem> convertParagraph(
    ParagraphAlignNode paragraph,
    int paragraphIndex,
  ) {
    final alignWordNodes = paragraph.aw;
    final tokens = _tokenize(paragraph.op);
    final items = <WordItem>[];

    for (var idx = 0; idx < alignWordNodes.length; idx++) {
      final wordAlign = alignWordNodes[idx];
      final validIndices = wordAlign.iow
          .where((i) => i >= 0 && i < tokens.length)
          .toList();
      final originalWordText = validIndices.isNotEmpty
          ? tokens[validIndices.first]
          : (idx >= 0 && idx < tokens.length ? tokens[idx] : '');

      items.add(
        WordItem(
          wordText: originalWordText,
          wordIndex: idx,
          paragraphIndex: paragraphIndex,
        ),
      );
    }

    return items;
  }

  List<String> _tokenize(String text) {
    final raw = text.split(RegExp(r"\s+"));
    return raw.map((w) => w.trim()).where((w) => w.isNotEmpty).toList();
  }
}
