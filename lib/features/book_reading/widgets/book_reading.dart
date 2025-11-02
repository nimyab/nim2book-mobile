import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/loading_book_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/reading_settings_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/book_reading_bar.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/reading_drawer.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_text_scroll.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/translated_text_scroll.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/circular_progress_with_percentage.dart';
import 'package:provider/provider.dart';

class BookReading extends StatefulWidget {
  const BookReading({super.key});

  @override
  State<BookReading> createState() => _BookReadingState();
}

class _BookReadingState extends State<BookReading>
    with TickerProviderStateMixin {
  final ScrollController _translatedController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoadingBookContext>().getBookData();
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
    final loadingBookContext = context.watch<LoadingBookContext>();
    final book = loadingBookContext.book;

    if (loadingBookContext.isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressWithPercentage(
            progress: loadingBookContext.progress,
          ),
        ),
      );
    }

    if (book == null || loadingBookContext.chapters.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.bookLoadFailed)),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider<LoadingBookContext, BookReadingContext>(
          create: (final context) =>
              BookReadingContext(bookId: book.id, chapters: []),
          update: (final context, final value, final previous) {
            if (previous == null) {
              return BookReadingContext(
                bookId: book.id,
                chapters: value.chapters,
              );
            }
            previous.setChapters(value.chapters);
            return previous;
          },
        ),
      ],
      builder: (final context, final child) {
        return ChangeNotifierProvider<ReadingSettingsContext>(
          create: (_) => ReadingSettingsContext(Theme.of(context)),
          child: Scaffold(
            appBar: BookReadingBar(book: book),
            endDrawer: const ReadingDrawer(),
            body: Consumer2<BookReadingContext, ReadingSettingsContext>(
              builder:
                  (
                    final context,
                    final readingContext,
                    final readingSettingsContext,
                    final child,
                  ) {
                    final index = readingContext.currentChapterIndex;
                    final selParagraph = readingContext.selectedParagraphIndex;
                    final selWord = readingContext.selectedWordIndex;
                    final selectionChanged =
                        selParagraph !=
                            readingContext.lastSelectionParagraphIndex ||
                        selWord != readingContext.lastSelectionWordIndex;
                    if (selectionChanged) {
                      readingContext.setLastSelection(selParagraph, selWord);
                      if (selParagraph != -1 &&
                          selWord != -1 &&
                          !readingContext.isTranslatedVisible) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            readingContext.isTranslatedVisible = true;
                          }
                        });
                      }
                    }
                    return ColoredBox(
                      color: readingSettingsContext.backgroundColor,
                      child: Column(
                        children: [
                          AnimatedSize(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            child: ClipRect(
                              child: Align(
                                heightFactor: readingContext.isTranslatedVisible
                                    ? 1.0
                                    : 0.0,
                                child: TranslatedTextScroll(
                                  key: ValueKey(index),
                                  controller: _translatedController,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: OriginalTextScroll(
                              key: ValueKey(index),
                              translatedScrollController: _translatedController,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
            ),
          ),
        );
      },
    );
  }
}
