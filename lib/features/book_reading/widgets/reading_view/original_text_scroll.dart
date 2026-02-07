import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/reading_settings/reading_settings_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_paragraph.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/select_chapter_buttons.dart';

class OriginalTextScroll extends ConsumerStatefulWidget {
  final ScrollController? translatedScrollController;
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const OriginalTextScroll({
    super.key,
    this.translatedScrollController,
    required this.bookId,
    required this.chapters,
  });

  @override
  ConsumerState<OriginalTextScroll> createState() => _OriginalTextScrollState();
}

class _OriginalTextScrollState extends ConsumerState<OriginalTextScroll> {
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
    final bookReadingParam = (bookId: widget.bookId, chapters: widget.chapters);
    final notifier = ref.read(
      bookReadingNotifierProvider(bookReadingParam).notifier,
    );
    final readingState = ref.read(
      bookReadingNotifierProvider(bookReadingParam),
    );
    final initialOffset = notifier.getChapterProgress(
      readingState.currentChapterIndex,
    );
    _scrollController = ScrollController(initialScrollOffset: initialOffset);

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
        final bookReadingParam = (
          bookId: widget.bookId,
          chapters: widget.chapters,
        );
        final notifier = ref.read(
          bookReadingNotifierProvider(bookReadingParam).notifier,
        );
        final state = ref.read(bookReadingNotifierProvider(bookReadingParam));
        notifier.setChapterProgress(
          state.currentChapterIndex,
          _scrollController.offset,
        );
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    final bookReadingParam = (bookId: widget.bookId, chapters: widget.chapters);
    final settingsState = ref.watch(readingSettingsNotifierProvider);
    final sidePadding = settingsState.sidePadding;
    final paragraphSpacing = settingsState.paragraphSpacing;
    final fontSize = settingsState.fontSize;
    final readingState = ref.watch(
      bookReadingNotifierProvider(bookReadingParam),
    );
    final currentChapterIndex = readingState.currentChapterIndex;
    final currentChapter = readingState.chapters[currentChapterIndex];
    final paragraphCount = currentChapter.content.length;
    final chapterTitle = currentChapter.title;

    final selectedParagraph = readingState.selectedParagraphIndex ?? -1;
    final hasWordSelected = readingState.selectedWordIndex != null;
    // Не скроллим оригинальный текст при выборе слова, только при выборе абзаца
    if (!hasWordSelected &&
        selectedParagraph >= 0 &&
        selectedParagraph != _lastScrolledToParagraph) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ctx = _paragraphKeys[selectedParagraph]?.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: const Duration(milliseconds: 300),
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
                horizontal: sidePadding,
                vertical: (paragraphSpacing) * 3.5,
              ),
              child: Text(
                chapterTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: (fontSize) * 1.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (index == paragraphCount + 1) {
            return SelectChapterButtons(
              bookId: widget.bookId,
              chapters: widget.chapters,
            );
          }

          final paragraphIndex = index - 1;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding,
              vertical: paragraphSpacing,
            ),
            child: Container(
              key: _keyForParagraph(paragraphIndex),
              child: OriginalParagraph(
                key: ValueKey(
                  'chapter_${currentChapterIndex}_paragraph_$paragraphIndex',
                ),
                paragraph: currentChapter.content[paragraphIndex],
                paragraphIndex: paragraphIndex,
                selectedParagraphIndex:
                    readingState.selectedParagraphIndex ?? -1,
                selectedWordIndex: readingState.selectedWordIndex ?? -1,
                bookId: widget.bookId,
                chapters: widget.chapters,
              ),
            ),
          );
        },
      ),
    );
  }
}
