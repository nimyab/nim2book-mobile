import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/reading_settings/reading_settings_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_paragraph_painter.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';

class OriginalParagraph extends ConsumerStatefulWidget {
  final ParagraphAlignNode paragraph;
  final int paragraphIndex;
  final int selectedParagraphIndex;
  final int selectedWordIndex;
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const OriginalParagraph({
    super.key,
    required this.paragraph,
    required this.paragraphIndex,
    required this.selectedParagraphIndex,
    required this.selectedWordIndex,
    required this.bookId,
    required this.chapters,
  });

  @override
  ConsumerState<OriginalParagraph> createState() => _OriginalParagraphState();
}

class _OriginalParagraphState extends ConsumerState<OriginalParagraph> {
  TextPainter? _tp;
  double? _lastMaxWidth;
  String? _lastStyleSig;
  TextAlign? _lastTextAlign;
  double? _lastIndentEm;

  @override
  void didUpdateWidget(covariant final OriginalParagraph oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.paragraph != widget.paragraph) {
      // Инвалидируем кэш разметки при изменении текста
      _tp = null;
    }
  }

  void _handleWordTap(final int wordIndex) {
    if (!(widget.selectedParagraphIndex == widget.paragraphIndex &&
        widget.selectedWordIndex == wordIndex)) {
      final bookReadingParam = (
        bookId: widget.bookId,
        chapters: widget.chapters,
      );
      ref
          .read(bookReadingNotifierProvider(bookReadingParam).notifier)
          .selectWord(widget.paragraphIndex, wordIndex);
    } else {
      // Извлекаем текст слова из оригинальной строки
      final wordAlign = widget.paragraph.aw[wordIndex];
      final startIndex = wordAlign.iow.first;
      final endIndex = wordAlign.iow.last;
      final rawWordText = widget.paragraph.op.substring(startIndex, endIndex);

      final regExp = RegExp(r'^[\\W_]*(.*?)[\\W_]*$');
      final match = regExp.firstMatch(rawWordText);
      if (match == null) return;
      final wordText = match.group(1)!;
      showDialog<void>(
        context: context,
        builder: (final context) {
          return TranslatedDialog(phrase: wordText);
        },
      );
    }
  }

  // Возвращаем индекс слова по смещению в строке абзаца, используя индексы из paragraph.aw
  int? _getWordIndexForTextOffset(final int offset) {
    for (var i = 0; i < widget.paragraph.aw.length; i++) {
      final wordAlign = widget.paragraph.aw[i];
      final start = wordAlign.iow.first;
      final end = wordAlign.iow.last;
      if (offset >= start && offset < end) return i;
    }
    return null;
  }

  @override
  Widget build(final BuildContext context) {
    final settingsState = ref.watch(readingSettingsNotifierProvider);
    final fontFamily = settingsState.fontFamily;
    final fontSize = settingsState.fontSize;
    final lineHeight = settingsState.lineHeight;
    final textColor = settingsState.textColor;
    final textAlign = settingsState.textAlign;
    final firstLineIndentEm = settingsState.firstLineIndentEm;
    final readingColors = Theme.of(context).extension<BookReadingColors>()!;

    final baseStyle = TextStyle(
      fontSize: fontSize,
      height: lineHeight,
      color: textColor,
      // Добавляем fontFamily в baseStyle для гарантии обновления
      fontFamily: fontFamily.toLowerCase() == 'system' ? null : fontFamily,
    );

    TextStyle style;
    if (fontFamily.toLowerCase() == 'system') {
      style = baseStyle;
    } else {
      try {
        style = GoogleFonts.getFont(fontFamily, textStyle: baseStyle);
      } catch (_) {
        style = baseStyle;
      }
    }

    return LayoutBuilder(
      builder: (final context, final constraints) {
        final indentWidth = (style.fontSize ?? 24) * (firstLineIndentEm);
        const indentCharCount = 1;
        // Кэшируем разметку абзаца: пересчитываем только при изменении ширины/стиля
        final styleSig =
            '${style.fontFamily}|${style.fontSize}|${style.height}|${style.color?.toARGB32()}';
        final needsLayout =
            _tp == null ||
            _lastMaxWidth != constraints.maxWidth ||
            _lastStyleSig != styleSig ||
            _lastTextAlign != textAlign ||
            _lastIndentEm != firstLineIndentEm;
        if (needsLayout) {
          final textSpan = TextSpan(
            children: [
              const WidgetSpan(
                child: SizedBox(),
              ), // placeholder, dimensions below
              TextSpan(text: widget.paragraph.op, style: style),
            ],
          );
          final tp = TextPainter(
            text: textSpan,
            textAlign: textAlign,
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
          _tp = tp;
          _lastMaxWidth = constraints.maxWidth;
          _lastStyleSig = styleSig;
          _lastTextAlign = textAlign;
          _lastIndentEm = firstLineIndentEm;
        }

        int? selectionStart;
        int? selectionEnd;
        if (widget.paragraphIndex == widget.selectedParagraphIndex &&
            widget.selectedWordIndex >= 0 &&
            widget.selectedWordIndex < widget.paragraph.aw.length) {
          final wordAlign = widget.paragraph.aw[widget.selectedWordIndex];
          // Сдвигаем диапазон на символы отступа, чтобы подсветка совпадала.
          selectionStart = wordAlign.iow.first + indentCharCount;
          selectionEnd = wordAlign.iow.last + indentCharCount;
        }

        return GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onTapDown: (final details) {
            final local = details.localPosition;
            final dx = local.dx;
            if (dx < 0) return;
            // Получаем позицию в тексте с учетом отступа.
            final pos = _tp!.getPositionForOffset(Offset(dx, local.dy));
            final offset = pos.offset;

            if (offset < indentCharCount) return;
            final normalizedOffset = offset - indentCharCount;

            // Проверяем границы и игнорируем пробелы между словами.
            if (normalizedOffset < 0 ||
                normalizedOffset >= widget.paragraph.op.length) {
              return;
            }
            if (widget.paragraph.op[normalizedOffset] == ' ') return;

            // По смещению ищем индекс слова и обрабатываем нажатие.
            final wordIndex = _getWordIndexForTextOffset(normalizedOffset);
            if (wordIndex != null) {
              _handleWordTap(wordIndex);
            }
          },
          child: SizedBox(
            width: double.infinity,
            height: _tp!.height,
            child: RepaintBoundary(
              child: CustomPaint(
                painter: OriginalParagraphPainter(
                  textPainter: _tp!,
                  selectionStart: selectionStart,
                  selectionEnd: selectionEnd,
                  highlightColor: readingColors.highlightBackgroundColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
