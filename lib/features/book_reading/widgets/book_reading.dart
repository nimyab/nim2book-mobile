import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/original_text_scroll.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/translated_text_scroll.dart';
import 'package:nim2book_mobile_flutter/screens/reading_screen/loading_book_context.dart';
import 'package:nim2book_mobile_flutter/widgets/circular_progress_with_percentage.dart';
import 'package:provider/provider.dart';

class BookReading extends StatefulWidget {
  const BookReading({super.key});

  @override
  State<BookReading> createState() => _BookReadingState();
}

class _BookReadingState extends State<BookReading> {
  late final ScrollController _translatedController;

  @override
  void initState() {
    super.initState();
    _translatedController = ScrollController();
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
  Widget build(BuildContext context) {
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
        body: const Center(child: Text('Failed to load book data.')),
      );
    }

    return ChangeNotifierProxyProvider<LoadingBookContext, BookReadingContext>(
      create: (context) => BookReadingContext(bookId: book.id, chapters: []),
      update: (context, value, previous) =>
          BookReadingContext(bookId: book.id, chapters: value.chapters),
      child: Scaffold(
        appBar: AppBar(title: Text(book.title)),
        body: Consumer<BookReadingContext>(
          builder: (context, readingContext, child) {
            final index = readingContext.currentChapterIndex;
            return Column(
              children: [
                TranslatedTextScroll(
                  key: ValueKey(index),
                  controller: _translatedController,
                ),
                Expanded(
                  child: OriginalTextScroll(
                    key: ValueKey(index),
                    translatedScrollController: _translatedController,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
