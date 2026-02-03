import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/book_reading_notifier.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/loading_book_notifier.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/reading_settings_notifier.dart';

import 'package:nim2book_mobile_flutter/features/book_reading/widgets/book_reading_bar.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/reading_drawer.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_text_scroll.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/translated_text_scroll.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/circular_progress_with_percentage.dart';

class BookReading extends ConsumerStatefulWidget {
  final String bookId;

  const BookReading({super.key, required this.bookId});

  @override
  ConsumerState<BookReading> createState() => _BookReadingState();
}

class _BookReadingState extends ConsumerState<BookReading>
    with TickerProviderStateMixin {
  final ScrollController _translatedController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load book data when widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(loadingBookNotifierProvider(widget.bookId).notifier)
          .getBookData();
    });
  }

  @override
  void dispose() {
    _translatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final loadingState = ref.watch(loadingBookNotifierProvider(widget.bookId));
    final book = loadingState.book;

    if (loadingState.isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressWithPercentage(
            progress: loadingState.progress,
          ),
        ),
      );
    }

    if (book == null || loadingState.chapters.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.bookLoadFailed)),
      );
    }

    // Create the provider parameter for book reading notifier
    final bookReadingParam = (bookId: book.id, chapters: loadingState.chapters);

    // Watch reading state and settings
    final readingState = ref.watch(
      bookReadingNotifierProvider(bookReadingParam),
    );
    final settingsState = ref.watch(readingSettingsNotifierProvider);

    // Initialize book reading notifier if needed
    if (!readingState.prefsLoaded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(bookReadingNotifierProvider(bookReadingParam).notifier)
            .initialize();
      });
    }

    // Handle selection changes for translated text
    ref.listen(bookReadingNotifierProvider(bookReadingParam), (
      previous,
      current,
    ) {
      if (previous?.selectedParagraphIndex != current.selectedParagraphIndex ||
          previous?.selectedWordIndex != current.selectedWordIndex) {
        ref
            .read(readingSettingsNotifierProvider.notifier)
            .applySelection(
              current.selectedParagraphIndex,
              current.selectedWordIndex,
            );
      }
    });

    final index = readingState.currentChapterIndex;
    final isTranslatedVisible = settingsState.isTranslatedVisible;
    final bgColor = settingsState.backgroundColor;

    return Scaffold(
      appBar: BookReadingBar(
        book: book,
        bookId: widget.bookId,
        chapters: loadingState.chapters,
      ),
      endDrawer: ReadingDrawer(
        bookId: widget.bookId,
        chapters: loadingState.chapters,
      ),
      body: !readingState.prefsLoaded
          ? ColoredBox(color: bgColor, child: const SizedBox.expand())
          : ColoredBox(
              color: bgColor,
              child: Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: ClipRect(
                      child: Align(
                        heightFactor: isTranslatedVisible ? 1.0 : 0.0,
                        child: TranslatedTextScroll(
                          key: ValueKey(index),
                          controller: _translatedController,
                          bookId: widget.bookId,
                          chapters: loadingState.chapters,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OriginalTextScroll(
                      key: ValueKey(index),
                      translatedScrollController: _translatedController,
                      bookId: widget.bookId,
                      chapters: loadingState.chapters,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
