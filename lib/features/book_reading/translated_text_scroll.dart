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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: currentChapter.content.length,
          itemBuilder: (context, index) {
            final paragraph = currentChapter.content[index];

            if (index == selectedParagraphIndex && selectedWordNode != null) {
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: paragraph.tp.substring(0, selectedWordNode.itw[0]),
                      style: DefaultTextStyle.of(context).style,
                    ),
                    TextSpan(
                      text: paragraph.tp.substring(
                        selectedWordNode.itw[0],
                        selectedWordNode.itw[1],
                      ),
                      style: const TextStyle(
                        backgroundColor: Colors.yellow,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: paragraph.tp.substring(selectedWordNode.itw[1]),
                      style: DefaultTextStyle.of(context).style,
                    ),
                  ],
                ),
              );
            } else {
              return Text(paragraph.tp);
            }
          },
        ),
      ),
    );
  }
}
