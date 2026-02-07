import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/reading_settings/reading_settings_provider.dart';

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
  bool _listenersInitialized = false;

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

  void _initializeListeners() {
    if (_listenersInitialized) return;
    _listenersInitialized = true;

    // Setup listener for selection changes (only once, not in build)
    ref.listen(bookReadingNotifierProvider(widget.bookId), (
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

    // Use only bookId as parameter to prevent provider recreation
    final bookId = widget.bookId;

    // Watch reading state and settings with select for granular updates
    final readingState = ref.watch(bookReadingNotifierProvider(bookId));
    final settingsState = ref.watch(readingSettingsNotifierProvider);

    // Initialize listeners once
    _initializeListeners();

    // Initialize book reading notifier if needed
    if (!readingState.prefsLoaded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(bookReadingNotifierProvider(bookId).notifier).initialize();
      });
    }

    final index = readingState.currentChapterIndex;
    final isTranslatedVisible = settingsState.isTranslatedVisible;
    final bgColor = settingsState.backgroundColor;

    return Scaffold(
      appBar: BookReadingBar(book: book, bookId: widget.bookId),
      endDrawer: ReadingDrawer(bookId: bookId),
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
                          bookId: bookId,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OriginalTextScroll(
                      key: ValueKey(index),
                      translatedScrollController: _translatedController,
                      bookId: bookId,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
