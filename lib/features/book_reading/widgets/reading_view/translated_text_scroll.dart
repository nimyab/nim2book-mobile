import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_settings_context.dart';
import 'package:provider/provider.dart';

class TranslatedTextScroll extends StatefulWidget {
  const TranslatedTextScroll({super.key, this.controller});

  final ScrollController? controller;

  @override
  State<TranslatedTextScroll> createState() => _TranslatedTextScrollState();
}

class _TranslatedTextScrollState extends State<TranslatedTextScroll> {
  @override
  Widget build(final BuildContext context) {
    final readingSettingsContext = context.watch<ReadingSettingsContext>();
    final readingContext = context.watch<BookReadingContext>();
    final theme = Theme.of(context);
    final scrollColors = theme.extension<TranslatedTextScrollColors>()!;
    final readingColors = theme.extension<BookReadingColors>()!;

    final selectedParagraphIndex = readingContext.selectedParagraphIndex;
    final selectedWordIndex = readingContext.selectedWordIndex;
    final currentChapter = readingContext.currentChapter;

    final selectedWordNode =
        selectedWordIndex == -1 || selectedParagraphIndex == -1
        ? null
        : currentChapter.content[selectedParagraphIndex].aw[selectedWordIndex];

    final translatedFamily = readingSettingsContext.translatedFontFamily;
    final baseStyle = TextStyle(
      fontSize: readingSettingsContext.translatedFontSize,
      // Добавляем fontFamily для гарантии обновления
      fontFamily: translatedFamily.toLowerCase() == 'system'
          ? null
          : translatedFamily,
    );

    TextStyle textStyle;
    if (translatedFamily.toLowerCase() == 'system') {
      textStyle = baseStyle;
    } else {
      try {
        textStyle = GoogleFonts.getFont(translatedFamily, textStyle: baseStyle);
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
    final computedHeight =
        lineHeight + readingSettingsContext.translatedVerticalPadding * 2;

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
