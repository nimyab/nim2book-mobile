import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_settings_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_paragraph.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/select_chapter_buttons.dart';
import 'package:provider/provider.dart';

class OriginalTextScroll extends StatefulWidget {
  const OriginalTextScroll({super.key, this.translatedScrollController});

  final ScrollController? translatedScrollController;

  @override
  State<OriginalTextScroll> createState() => _OriginalTextScrollState();
}

class _OriginalTextScrollState extends State<OriginalTextScroll> {
  late final ScrollController _scrollController;
  Timer? _debounceTimer;
  bool _isInitialized = false;
  final Map<int, GlobalKey> _paragraphKeys = {};
  int _lastScrolledToParagraph = -1;

  GlobalKey _keyForParagraph(final int index) {
    return _paragraphKeys.putIfAbsent(index, () => GlobalKey());
  }

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
  Widget build(final BuildContext context) {
    final readingSettingsContext = context.watch<ReadingSettingsContext>();
    final readingContext = context.watch<BookReadingContext>();
    final paragraphCount = readingContext.currentParagraphCount;
    final currentChapterIndex = readingContext.currentChapterIndex;
    final currentChapter = readingContext.currentChapter;
    final chapterTitle = currentChapter.title;

    final selectedParagraph = readingContext.selectedParagraphIndex;
    if (selectedParagraph >= 0 &&
        selectedParagraph != _lastScrolledToParagraph) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ctx = _paragraphKeys[selectedParagraph]?.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 450),
            alignment: 0.2,
            curve: Curves.easeInOut,
          );
        }
      });
      _lastScrolledToParagraph = selectedParagraph;
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (final details) {
        final controller = widget.translatedScrollController;
        if (controller != null && controller.hasClients) {
          final maxExtent = controller.position.maxScrollExtent;
          final newOffset = (controller.offset - details.delta.dx).clamp(
            0.0,
            maxExtent,
          );
          controller.jumpTo(newOffset);
        }
      },
      onHorizontalDragEnd: (final details) {
        final controller = widget.translatedScrollController;
        if (controller != null && controller.hasClients) {
          final vx = details.velocity.pixelsPerSecond.dx;
          final maxExtent = controller.position.maxScrollExtent;
          final target = (controller.offset - vx * 0.20).clamp(0.0, maxExtent);
          final durationMs = (200 + vx.abs() * 1.0).clamp(0.0, 500.0).toInt();
          controller.animateTo(
            target,
            duration: Duration(milliseconds: durationMs),
            curve: Curves.decelerate,
          );
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        cacheExtent: 2000,
        controller: _scrollController,
        itemCount: paragraphCount + 2,
        itemBuilder: (final context, final index) {
          if (index == 0) {
            if (chapterTitle.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: readingSettingsContext.sidePadding,
                vertical: (readingSettingsContext.paragraphSpacing) * 3.5,
              ),
              child: Text(
                chapterTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: (readingSettingsContext.fontSize) * 1.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (index == paragraphCount + 1) {
            return const SelectChapterButtons();
          }

          final paragraphIndex = index - 1;
          final paragraphConverted = readingContext.getParagraphItems(
            paragraphIndex,
          );
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: readingSettingsContext.sidePadding,
              vertical: readingSettingsContext.paragraphSpacing,
            ),
            child: Container(
              key: _keyForParagraph(paragraphIndex),
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
            ),
          );
        },
      ),
    );
  }
}
