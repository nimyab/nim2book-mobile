import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:provider/provider.dart';

class TranslatedTextScroll extends StatelessWidget {
  const TranslatedTextScroll({
    super.key,
    this.controller,
    this.fontSize = 20,
    this.fontFamily,
    this.verticalPadding = 5,
  });

  final ScrollController? controller;
  final double fontSize;
  final String? fontFamily;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
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

    final baseStyle = TextStyle(fontSize: fontSize);
    TextStyle textStyle;
    if (fontFamily == null || fontFamily!.toLowerCase() == 'system') {
      textStyle = baseStyle;
    } else {
      try {
        textStyle = GoogleFonts.getFont(fontFamily!, textStyle: baseStyle);
      } catch (_) {
        textStyle = baseStyle;
      }
    }

    final metricsPainter = TextPainter(
      text: TextSpan(text: 'pqAy', style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();
    final lineHeight = metricsPainter.height;
    final computedHeight = lineHeight + verticalPadding * 2;

    return SizedBox(
      height: computedHeight,
      child: Container(
        color: scrollColors.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: verticalPadding),
        alignment: Alignment.center,
        child: ListView.separated(
          controller: controller,
          separatorBuilder: (context, index) => SizedBox(width: 10),
          cacheExtent: double.infinity,
          scrollDirection: Axis.horizontal,
          itemCount: currentChapter.content.length,
          itemBuilder: (context, index) {
            final paragraph = currentChapter.content[index];

            if (index == selectedParagraphIndex && selectedWordNode != null) {
              final selectedWordKey = GlobalKey();

              WidgetsBinding.instance.addPostFrameCallback((_) {
                final selectedWordContext = selectedWordKey.currentContext;
                if (selectedWordContext != null) {
                  Scrollable.ensureVisible(
                    selectedWordContext,
                    duration: Duration(milliseconds: 300),
                    alignment: 0.5,
                    curve: Curves.easeInOut,
                  );
                }
              });

              return Center(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          paragraph.tp.substring(0, selectedWordNode.itw[0]),
                          style: textStyle,
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
                          ),
                        ),
                      ),

                      WidgetSpan(
                        child: Text(
                          paragraph.tp.substring(selectedWordNode.itw[1]),
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text(paragraph.tp, style: textStyle));
            }
          },
        ),
      ),
    );
  }
}
