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
  bool _readingInitScheduled = false;

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

    ref.listen<(int?, int?)>(
      bookReadingNotifierProvider(
        widget.bookId,
      ).select((s) => (s.selectedParagraphIndex, s.selectedWordIndex)),
      (previous, current) {
        if (previous != current) {
          ref
              .read(readingSettingsNotifierProvider.notifier)
              .applySelection(current.$1, current.$2);
        }
      },
    );
  }

  @override
  void dispose() {
    _translatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    ref.listen<String?>(
      loadingBookNotifierProvider(widget.bookId).select((s) => s.errorMessage),
      (previous, next) {
        if (next != null && next != previous) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next)));
        }
      },
    );

    final l10n = AppLocalizations.of(context)!;
    final bookId = widget.bookId;
    final isLoading = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.isLoading),
    );
    final loadingProgress = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.progress),
    );
    final book = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.book),
    );
    final hasChapters = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.chapters.isNotEmpty),
    );
    final loadingError = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.errorMessage),
    );

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressWithPercentage(progress: loadingProgress),
        ),
      );
    }

    if (book == null || !hasChapters) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(loadingError ?? l10n.bookLoadFailed)),
      );
    }

    final prefsLoaded = ref.watch(
      bookReadingNotifierProvider(bookId).select((s) => s.prefsLoaded),
    );
    final index = ref.watch(
      bookReadingNotifierProvider(bookId).select((s) => s.currentChapterIndex),
    );
    final isTranslatedVisible = ref.watch(
      readingSettingsNotifierProvider.select((s) => s.isTranslatedVisible),
    );
    final bgColor = ref.watch(
      readingSettingsNotifierProvider.select((s) => s.backgroundColor),
    );

    _initializeListeners();

    if (!prefsLoaded && !_readingInitScheduled) {
      _readingInitScheduled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(bookReadingNotifierProvider(bookId).notifier).initialize();
      });
    }

    return Scaffold(
      appBar: BookReadingBar(book: book, bookId: widget.bookId),
      endDrawer: ReadingDrawer(bookId: bookId),
      body: !prefsLoaded
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
