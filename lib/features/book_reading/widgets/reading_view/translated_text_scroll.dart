import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/book_reading_notifier.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/reading_settings_notifier.dart';

class TranslatedTextScroll extends ConsumerStatefulWidget {
  final ScrollController? controller;
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const TranslatedTextScroll({
    super.key,
    this.controller,
    required this.bookId,
    required this.chapters,
  });

  @override
  ConsumerState<TranslatedTextScroll> createState() =>
      _TranslatedTextScrollState();
}

class _TranslatedTextScrollState extends ConsumerState<TranslatedTextScroll> {
  int? _lastEnsuredParagraph;
  int? _lastEnsuredWord;
  @override
  Widget build(final BuildContext context) {
    final bookReadingParam = (bookId: widget.bookId, chapters: widget.chapters);
    final settingsState = ref.watch(readingSettingsNotifierProvider);
    final translatedFontSize = settingsState.translatedFontSize;
    final translatedFontFamily = settingsState.translatedFontFamily;
    final translatedVerticalPadding = settingsState.translatedVerticalPadding;
    final readingState = ref.watch(
      bookReadingNotifierProvider(bookReadingParam),
    );
    final theme = Theme.of(context);
    final scrollColors = theme.extension<TranslatedTextScrollColors>()!;
    final readingColors = theme.extension<BookReadingColors>()!;

    final selectedParagraphIndex = readingState.selectedParagraphIndex;
    final selectedWordIndex = readingState.selectedWordIndex;
    final currentChapter =
        readingState.chapters[readingState.currentChapterIndex];

    final selectedWordNode =
        selectedWordIndex == null || selectedParagraphIndex == null
        ? null
        : currentChapter.content[selectedParagraphIndex].aw[selectedWordIndex];

    final baseStyle = TextStyle(
      fontSize: translatedFontSize,
      // Добавляем fontFamily для гарантии обновления
      fontFamily: translatedFontFamily.toLowerCase() == 'system'
          ? null
          : translatedFontFamily,
    );

    TextStyle textStyle;
    if (translatedFontFamily.toLowerCase() == 'system') {
      textStyle = baseStyle;
    } else {
      try {
        textStyle = GoogleFonts.getFont(
          translatedFontFamily,
          textStyle: baseStyle,
        );
      } catch (_) {
        textStyle = baseStyle;
      }
    }

    final metricsPainter = TextPainter(
      text: TextSpan(text: 'pqAy', style: textStyle),
      textDirection: TextDirection.ltr,
      textScaler: const TextScaler.linear(1.0),
    )..layout();
    final lineHeight = metricsPainter.height;
    final computedHeight = lineHeight + translatedVerticalPadding * 2;

    return SizedBox(
      height: computedHeight,
      child: Container(
        color: scrollColors.backgroundColor,
        alignment: Alignment.center,
        child: ListView.separated(
          controller: widget.controller,
          separatorBuilder: (final context, final index) =>
              const SizedBox(width: 10),
          cacheExtent: double.infinity,
          scrollDirection: Axis.horizontal,
          itemCount: currentChapter.content.length,
          itemBuilder: (final context, final index) {
            final paragraph = currentChapter.content[index];

            if (index == selectedParagraphIndex && selectedWordNode != null) {
              final selectedWordKey = GlobalKey();
              final needEnsure =
                  _lastEnsuredParagraph != selectedParagraphIndex ||
                  _lastEnsuredWord != selectedWordIndex;
              if (needEnsure) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final selectedWordContext = selectedWordKey.currentContext;
                  if (selectedWordContext != null) {
                    Scrollable.ensureVisible(
                      selectedWordContext,
                      duration: const Duration(milliseconds: 300),
                      alignment: 0.5,
                      curve: Curves.easeInOut,
                    );
                  }
                });
                _lastEnsuredParagraph = selectedParagraphIndex;
                _lastEnsuredWord = selectedWordIndex;
              }

              return Center(
                child: RichText(
                  textScaler: const TextScaler.linear(1.0),
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          paragraph.tp.substring(0, selectedWordNode.itw[0]),
                          style: textStyle,
                          textScaler: const TextScaler.linear(1.0),
                        ),
                      ),

                      WidgetSpan(
                        child: Container(
                          key: selectedWordKey,
                          child: Text(
                            paragraph.tp.substring(
                              selectedWordNode.itw[0],
                              selectedWordNode.itw[1],
                            ),
                            style: textStyle.copyWith(
                              backgroundColor:
                                  readingColors.highlightBackgroundColor,
                              color: readingColors.highlightTextColor,
                            ),
                            textScaler: const TextScaler.linear(1.0),
                          ),
                        ),
                      ),

                      WidgetSpan(
                        child: Text(
                          paragraph.tp.substring(selectedWordNode.itw[1]),
                          style: textStyle,
                          textScaler: const TextScaler.linear(1.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  paragraph.tp,
                  style: textStyle,
                  textScaler: const TextScaler.linear(1.0),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
