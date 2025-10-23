import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/original_paragraph.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/select_chapter_buttons.dart';
import 'package:provider/provider.dart';

class OriginalTextScroll extends StatefulWidget {
  const OriginalTextScroll({super.key});

  @override
  State<OriginalTextScroll> createState() => _OriginalTextScrollState();
}

class _OriginalTextScrollState extends State<OriginalTextScroll> {
  late final ScrollController _scrollController;
  Timer? _debounceTimer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    // Инициализируем контроллер сразу с нужной позицией, чтобы избежать скачка
    final chapterProgress = context.read<BookReadingContext>().chapterProgress;
    _scrollController = ScrollController(initialScrollOffset: chapterProgress);

    // Отмечаем как инициализированный после первого фрейма
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isInitialized = true;
      });
    });
    _scrollController.addListener(_saveScrollPosition);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _scrollController.removeListener(_saveScrollPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _saveScrollPosition() {
    if (!_isInitialized) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 200), () {
      if (_scrollController.hasClients) {
        final readingContext = context.read<BookReadingContext>();
        readingContext.setChapterProgress(_scrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final readingContext = context.watch<BookReadingContext>();
    final currentConvertedChapter = readingContext.currentConvertedChapter;
    final currentChapterIndex = readingContext.currentChapterIndex;

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      cacheExtent: 2000,
      controller: _scrollController,
      itemCount: currentConvertedChapter.length + 1,
      itemBuilder: (context, paragraphIndex) {
        if (paragraphIndex == currentConvertedChapter.length) {
          return const SelectChapterButtons();
        }

        final paragraphConverted = currentConvertedChapter[paragraphIndex];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: OriginalParagraph(
            key: ValueKey(
              'chapter_${currentChapterIndex}_paragraph_$paragraphIndex',
            ),
            paragraph: paragraphConverted,
            paragraphIndex: paragraphIndex,
            selectedParagraphIndex: readingContext.selectedParagraphIndex,
            selectedWordIndex: readingContext.selectedWordIndex,
            selectWord: readingContext.selectWord,
          ),
        );
      },
    );
  }
}
