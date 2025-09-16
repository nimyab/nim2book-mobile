import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/translated_text_scroll.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/reading_context.dart';
import 'package:provider/provider.dart';

class ReadingView extends StatefulWidget {
  const ReadingView({super.key});

  @override
  State<ReadingView> createState() => _ReadingViewState();
}

class _ReadingViewState extends State<ReadingView> {
  @override
  Widget build(BuildContext context) {
    final readingContext = context.watch<ReadingContext>();
    final currentChapter = readingContext.currentChapter;
    final currentChapterIndex = readingContext.currentChapterIndex;
    final totalChapters = readingContext.totalChapters;

    return Column(
      children: [
        TranslatedTextScroll(),
        Expanded(
          child: ListView.builder(
            itemCount: currentChapter.content.length,
            itemBuilder: (context, paragraphIndex) {
              final paragraph = currentChapter.content[paragraphIndex];

              List<Widget> words = [];
              for (
                var wordIndex = 0;
                wordIndex < paragraph.aw.length;
                wordIndex++
              ) {
                final alignWord = paragraph.aw[wordIndex];
                // разделяю параграф на слова, чтобы можно было на каждое слово сделать кнопку для отображения перевода
                final originalWord = paragraph.op
                    .substring(alignWord.iow[0], alignWord.iow[1])
                    .trim();

                words.add(
                  GestureDetector(
                    onTap: () {
                      readingContext.selectWord(paragraphIndex, wordIndex);
                    },
                    child: Container(
                      margin: (wordIndex == 0)
                          ? EdgeInsets.only(left: 20)
                          : null,
                      color:
                          (readingContext.selectedParagraphIndex ==
                                  paragraphIndex &&
                              readingContext.selectedWordIndex == wordIndex)
                          ? Colors.yellow
                          : null,
                      child: Text(originalWord, style: TextStyle(fontSize: 20)),
                    ),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                child: Wrap(spacing: 10, children: words),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentChapterIndex > 0)
              ElevatedButton(
                onPressed: () {
                  readingContext.goToPreviousChapter();
                },
                child: const Text('prev'),
              ),
            if (currentChapterIndex < totalChapters - 1)
              ElevatedButton(
                onPressed: () async {
                  await readingContext.goToNextChapter();
                },
                child: const Text('next'),
              ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
