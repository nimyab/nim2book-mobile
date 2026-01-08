import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/book_reading/book_reading_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/book_reading/book_reading_state.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/loading_book/loading_book_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/loading_book/loading_book_state.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/reading_settings/reading_settings_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/book_reading_bar.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer/reading_drawer.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/original_text_scroll.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/reading_view/translated_text_scroll.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/circular_progress_with_percentage.dart';

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
  }

  @override
  void dispose() {
    _translatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final loadingState = context.watch<LoadingBookCubit>().state;
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

    return MultiBlocProvider(
      providers: [
        BlocProvider<ReadingSettingsCubit>(
          create: (_) => ReadingSettingsCubit(Theme.of(context)),
        ),
        BlocProvider<BookReadingCubit>(
          create: (_) =>
              BookReadingCubit(bookId: book.id, chapters: loadingState.chapters)
                ..initialize(),
        ),
      ],
      child: BlocListener<LoadingBookCubit, LoadingBookState>(
        listenWhen: (final previous, final current) =>
            previous.chapters != current.chapters,
        listener: (final context, final state) {
          context.read<BookReadingCubit>().setChapters(state.chapters);
        },
        child: BlocListener<BookReadingCubit, BookReadingState>(
          // Переносим побочные эффекты из build: реагируем на изменения выделения
          listenWhen: (final prev, final curr) =>
              prev.selectedParagraphIndex != curr.selectedParagraphIndex ||
              prev.selectedWordIndex != curr.selectedWordIndex,
          listener: (final context, final readingState) {
            final selParagraph = readingState.selectedParagraphIndex;
            final selWord = readingState.selectedWordIndex;
            context.read<ReadingSettingsCubit>().applySelection(
              selParagraph,
              selWord,
            );
          },
          child: Scaffold(
            appBar: BookReadingBar(book: book),
            endDrawer: const ReadingDrawer(),
            body: BlocBuilder<BookReadingCubit, BookReadingState>(
              builder: (final context, final readingState) {
                final index = readingState.currentChapterIndex;
                final isTranslatedVisible = context.select(
                  (final ReadingSettingsCubit c) => c.state.isTranslatedVisible,
                );
                final bgColor = context.select(
                  (final ReadingSettingsCubit c) => c.state.backgroundColor,
                );
                if (!readingState.prefsLoaded) {
                  return ColoredBox(
                    color: bgColor,
                    child: const SizedBox.expand(),
                  );
                }
                return ColoredBox(
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
        ),
      ),
    );
  }
}
