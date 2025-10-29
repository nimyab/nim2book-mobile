import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/models/word_item.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/original_paragraph_painter.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';

class OriginalParagraph extends StatefulWidget {
  final List<WordItem> paragraph;
  final int paragraphIndex;
  final Function(int paragraphIndex, int wordIndex) selectWord;
  final int selectedParagraphIndex;
  final int selectedWordIndex;
  final String? fontFamily;
  final double? fontSize;
  final Color? textColor;
  final double? lineHeight;
  final double? firstLineIndentEm;
  final TextAlign? textAlign;

  const OriginalParagraph({
    super.key,
    required this.paragraph,
    required this.paragraphIndex,
    required this.selectedParagraphIndex,
    required this.selectedWordIndex,
    required this.selectWord,
    this.fontFamily,
    this.fontSize,
    this.textColor,
    this.lineHeight,
    this.firstLineIndentEm,
    this.textAlign,
  });

  @override
  State<OriginalParagraph> createState() => _OriginalParagraphState();
}

class _OriginalParagraphState extends State<OriginalParagraph> {
  late String _paragraphText;
  late List<_WordRange> _wordRanges;

  @override
  void initState() {
    super.initState();
    _computeTextData();
  }

  @override
  void didUpdateWidget(covariant OriginalParagraph oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.paragraph != widget.paragraph) {
      _computeTextData();
    }
  }

  void _computeTextData() {
    final sb = StringBuffer();
    final ranges = <_WordRange>[];
    var cursor = 0;

    for (var i = 0; i < widget.paragraph.length; i++) {
      final word = widget.paragraph[i].wordText;
      // Сохраняем диапазон символов для текущего слова
      ranges.add(_WordRange(cursor, cursor + word.length));
      sb.write(word);
      cursor += word.length;
      if (i != widget.paragraph.length - 1) {
        sb.write(' ');
        cursor += 1;
      }
    }

    _paragraphText = sb.toString();
    _wordRanges = ranges;
  }

  void _handleWordTap(WordItem wordItem) {
    if (wordItem.paragraphIndex != null && wordItem.wordIndex != null) {
      if (!(widget.selectedParagraphIndex == wordItem.paragraphIndex &&
          widget.selectedWordIndex == wordItem.wordIndex)) {
        widget.selectWord(wordItem.paragraphIndex!, wordItem.wordIndex!);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return TranslatedDialog(phrase: wordItem.wordText);
          },
        );
      }
    }
  }

  // Возвращаем индекс слова по смещению в строке абзаца, используя предрасчитанные диапазоны `_wordRanges`.
  int? _getWordIndexForTextOffset(int offset) {
    for (var i = 0; i < _wordRanges.length; i++) {
      final r = _wordRanges[i];
      if (offset >= r.start && offset < r.end) return i;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final readingColors = Theme.of(context).extension<BookReadingColors>()!;
    final baseStyle = TextStyle(
      fontSize: widget.fontSize ?? 24,
      height: widget.lineHeight ?? 1.3,
      color: widget.textColor ?? Theme.of(context).textTheme.bodyLarge?.color,
    );
    TextStyle style;
    final family = widget.fontFamily;
    if (family == null || family.toLowerCase() == 'system') {
      style = baseStyle;
    } else {
      try {
        style = GoogleFonts.getFont(family, textStyle: baseStyle);
      } catch (_) {
        style = baseStyle;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final indentWidth =
            (style.fontSize ?? 24) * (widget.firstLineIndentEm ?? 1.5);
        const indentCharCount = 1;

        final textSpan = TextSpan(
          children: [
            WidgetSpan(child: SizedBox(width: indentWidth)),
            TextSpan(text: _paragraphText, style: style),
          ],
        );

        final tp = TextPainter(
          text: textSpan,
          textAlign: widget.textAlign ?? TextAlign.justify,
          textDirection: TextDirection.ltr,
        );

        tp.setPlaceholderDimensions([
          PlaceholderDimensions(
            size: Size(
              indentWidth,
              (style.fontSize ?? 24) * (style.height ?? 1.0),
            ),
            alignment: PlaceholderAlignment.middle,
            baseline: null,
            baselineOffset: 0,
          ),
        ]);

        tp.layout(maxWidth: constraints.maxWidth);

        _WordRange? selectedRange;
        if (widget.paragraphIndex == widget.selectedParagraphIndex &&
            widget.selectedWordIndex >= 0 &&
            widget.selectedWordIndex < _wordRanges.length) {
          selectedRange = _wordRanges[widget.selectedWordIndex];
        }

        // Сдвигаем диапазон на символы отступа, чтобы подсветка совпадала.
        final int? selectionStart = selectedRange == null
            ? null
            : selectedRange.start + indentCharCount;
        final int? selectionEnd = selectedRange == null
            ? null
            : selectedRange.end + indentCharCount;

        return GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onTapDown: (details) {
            final local = details.localPosition;
            final dx = local.dx;
            if (dx < 0) return;
            // Получаем позицию в тексте с учетом отступа.
            final pos = tp.getPositionForOffset(Offset(dx, local.dy));
            final offset = pos.offset;

            if (offset < indentCharCount) return;
            final normalizedOffset = offset - indentCharCount;

            // Проверяем границы и игнорируем пробелы между словами.
            if (normalizedOffset < 0 ||
                normalizedOffset >= _paragraphText.length) {
              return;
            }
            if (_paragraphText[normalizedOffset] == ' ') return;

            // По смещению ищем индекс слова и обрабатываем нажатие.
            final wordIndex = _getWordIndexForTextOffset(normalizedOffset);
            if (wordIndex != null) {
              _handleWordTap(widget.paragraph[wordIndex]);
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: tp.height,
            child: CustomPaint(
              painter: OriginalParagraphPainter(
                textPainter: tp,
                selectionStart: selectionStart,
                selectionEnd: selectionEnd,
                highlightColor: readingColors.highlightBackgroundColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WordRange {
  final int start;
  final int end;
  const _WordRange(this.start, this.end);
}
