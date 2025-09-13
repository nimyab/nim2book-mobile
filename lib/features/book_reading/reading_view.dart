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
            itemBuilder: (context, index) {
              final paragraph = currentChapter.content[index];
              return Padding(
                padding: EdgeInsetsGeometry.directional(start: 20),
                child: Text(paragraph.op),
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
