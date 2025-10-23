import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';

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
  final List<Widget> _words = [];
  final List<GlobalKey> _wordKeys = [];

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
    _words.clear();
    _wordKeys.clear();

    for (var i = 0; i < widget.paragraph.length; i++) {
      final wordItem = widget.paragraph[i];
      final isSelected =
          (widget.selectedParagraphIndex == wordItem.paragraphIndex &&
          widget.selectedWordIndex == wordItem.wordIndex);

      final wordKey = GlobalKey();
      _wordKeys.add(wordKey);

      _words.add(
        Container(
          key: wordKey,
          margin: (i == 0) ? const EdgeInsets.only(left: 30) : null,
          color: isSelected ? Colors.yellow : null,
          child: Text(
            wordItem.wordText,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.black87 : null,
            ),
          ),
        ),
      );
    }
  }

  void _handleTap(TapDownDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);

    for (int i = 0; i < _wordKeys.length; i++) {
      final wordKey = _wordKeys[i];
      final wordRenderBox =
          wordKey.currentContext?.findRenderObject() as RenderBox?;

      if (wordRenderBox != null) {
        final wordPosition = renderBox.globalToLocal(
          wordRenderBox.localToGlobal(Offset.zero),
        );
        final wordSize = wordRenderBox.size;
        final wordRect = Rect.fromLTWH(
          wordPosition.dx,
          wordPosition.dy,
          wordSize.width,
          wordSize.height,
        );

        if (wordRect.contains(localPosition)) {
          final wordItem = widget.paragraph[i];
          if (wordItem.paragraphIndex != null && wordItem.wordIndex != null) {
            // если слово не выделено, то выделяем его
            if (!(widget.selectedParagraphIndex == wordItem.paragraphIndex &&
                widget.selectedWordIndex == wordItem.wordIndex)) {
              widget.selectWord(wordItem.paragraphIndex!, wordItem.wordIndex!);
            } else {
              // иначе будем показывать перевод слова из словаря
              showDialog(
                context: context,
                builder: (context) {
                  return TranslatedDialog(phrase: wordItem.wordText);
                },
              );
            }
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTap,
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 3,
        children: _words,
      ),
    );
  }
}
