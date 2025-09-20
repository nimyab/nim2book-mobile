import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_context.dart';

class OriginalParagraph extends StatefulWidget {
  final List<WordItem> paragraph;
  final int paragraphIndex;
  final Function(int paragraphIndex, int wordIndex) selectWord;
  final int selectedParagraphIndex;
  final int selectedWordIndex;

  const OriginalParagraph({
    super.key,
    required this.paragraph,
    required this.paragraphIndex,
    required this.selectedParagraphIndex,
    required this.selectedWordIndex,
    required this.selectWord,
  });

  @override
  State<OriginalParagraph> createState() => _OriginalParagraphState();
}

class _OriginalParagraphState extends State<OriginalParagraph> {
  late List<Widget> _words;

  @override
  void initState() {
    super.initState();
    _buildWords();
  }

  @override
  void didUpdateWidget(covariant OriginalParagraph oldWidget) {
    super.didUpdateWidget(oldWidget);

    // пересоздаю слова если этот параграф был или выбран сейчас или был выбран раньше
    if (widget.paragraphIndex == widget.selectedParagraphIndex ||
        widget.paragraphIndex == oldWidget.selectedParagraphIndex) {
      _buildWords();
    }
  }

  void _buildWords() {
    _words = [];

    for (var i = 0; i < widget.paragraph.length; i++) {
      final wordItem = widget.paragraph[i];
      final isSelected =
          (widget.selectedParagraphIndex == wordItem.paragraphIndex &&
          widget.selectedWordIndex == wordItem.wordIndex);

      _words.add(
        GestureDetector(
          onTap: wordItem.paragraphIndex != null && wordItem.wordIndex != null
              ? () {
                  widget.selectWord(
                    wordItem.paragraphIndex!,
                    wordItem.wordIndex!,
                  );
                }
              : null,
          child: Container(
            margin: (i == 0) ? EdgeInsets.only(left: 20) : null,
            color: isSelected ? Colors.yellow : null,
            child: Text(wordItem.wordText, style: TextStyle(fontSize: 20)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(key: ValueKey(widget.paragraphIndex), children: _words);
  }
}
