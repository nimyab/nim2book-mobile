import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/reading_context.dart';
import 'package:provider/provider.dart';

class TranslatedTextScroll extends StatefulWidget {
  const TranslatedTextScroll({super.key});

  @override
  State<TranslatedTextScroll> createState() => _TranslatedTextScrollState();
}

class _TranslatedTextScrollState extends State<TranslatedTextScroll> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final readingContext = context.watch<ReadingContext>();

    final selectedParagraphIndex = readingContext.selectedParagraphIndex;
    final selectedWordIndex = readingContext.selectedWordIndex;
    final currentChapter = readingContext.currentChapter;

    final selectedWordNode =
        selectedWordIndex == -1 || selectedParagraphIndex == -1
        ? null
        : currentChapter.content[selectedParagraphIndex].aw[selectedWordIndex];

    return SizedBox(
      height: 30,
      child: Container(
        color: Color.fromARGB(255, 205, 204, 197),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.bottomRight,
        child: ListView.builder(
          controller: _scrollController,
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

              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: paragraph.tp.substring(0, selectedWordNode.itw[0]),
                      style: DefaultTextStyle.of(
                        context,
                      ).style.copyWith(fontSize: 20),
                    ),
                    WidgetSpan(
                      child: Container(
                        key: selectedWordKey,
                        child: Text(
                          paragraph.tp.substring(
                            selectedWordNode.itw[0],
                            selectedWordNode.itw[1],
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.yellow,
                          ),
                        ),
                      ),
                    ),

                    TextSpan(
                      text: paragraph.tp.substring(selectedWordNode.itw[1]),
                      style: DefaultTextStyle.of(
                        context,
                      ).style.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              );
            } else {
              return Text(paragraph.tp, style: TextStyle(fontSize: 20));
            }
          },
        ),
      ),
    );
  }
}
