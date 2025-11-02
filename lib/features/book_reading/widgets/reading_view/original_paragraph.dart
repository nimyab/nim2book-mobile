import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_settings_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/models/word_item.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_paragraph_painter.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/translated_dialog.dart';
import 'package:provider/provider.dart';

class OriginalParagraph extends StatefulWidget {
  final List<WordItem> paragraph;
  final int paragraphIndex;
  final void Function(int paragraphIndex, int wordIndex) selectWord;
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
  late String _paragraphText;
  late List<_WordRange> _wordRanges;

  @override
  void initState() {
    super.initState();
    _computeTextData();
  }

  @override
  void didUpdateWidget(covariant final OriginalParagraph oldWidget) {
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

  void _handleWordTap(final WordItem wordItem) {
    if (wordItem.paragraphIndex != null && wordItem.wordIndex != null) {
      if (!(widget.selectedParagraphIndex == wordItem.paragraphIndex &&
          widget.selectedWordIndex == wordItem.wordIndex)) {
        widget.selectWord(wordItem.paragraphIndex!, wordItem.wordIndex!);
      } else {
        showDialog<void>(
          context: context,
          builder: (final context) {
            return TranslatedDialog(phrase: wordItem.wordText);
          },
        );
      }
    }
  }

  // Возвращаем индекс слова по смещению в строке абзаца, используя предрасчитанные диапазоны `_wordRanges`.
  int? _getWordIndexForTextOffset(final int offset) {
    for (var i = 0; i < _wordRanges.length; i++) {
      final r = _wordRanges[i];
      if (offset >= r.start && offset < r.end) return i;
    }
    return null;
  }

  @override
  Widget build(final BuildContext context) {
    final readingSettings = context.watch<ReadingSettingsContext>();
    final readingColors = Theme.of(context).extension<BookReadingColors>()!;

    // Создаем уникальный ключ на основе fontFamily для принудительной перестройки
    final family = readingSettings.fontFamily;
    final baseStyle = TextStyle(
      fontSize: readingSettings.fontSize,
      height: readingSettings.lineHeight,
      color: readingSettings.textColor,
      // Добавляем fontFamily в baseStyle для гарантии обновления
      fontFamily: family.toLowerCase() == 'system' ? null : family,
    );

    TextStyle style;
    if (family.toLowerCase() == 'system') {
      style = baseStyle;
    } else {
      try {
        style = GoogleFonts.getFont(family, textStyle: baseStyle);
      } catch (_) {
        style = baseStyle;
      }
    }

    return LayoutBuilder(
      builder: (final context, final constraints) {
        final indentWidth =
            (style.fontSize ?? 24) * (readingSettings.firstLineIndentEm);
        const indentCharCount = 1;

        final textSpan = TextSpan(
          children: [
            WidgetSpan(child: SizedBox(width: indentWidth)),
            TextSpan(text: _paragraphText, style: style),
          ],
        );

        final tp = TextPainter(
          text: textSpan,
          textAlign: readingSettings.textAlign,
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
        final selectionStart = selectedRange == null
            ? null
            : selectedRange.start + indentCharCount;
        final selectionEnd = selectedRange == null
            ? null
            : selectedRange.end + indentCharCount;

        return GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onTapDown: (final details) {
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
