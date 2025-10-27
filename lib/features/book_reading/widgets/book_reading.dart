import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/reading_persistence.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/chapter_list_tab.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/original_text_scroll.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/text_settings_tab.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/translated_text_scroll.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
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
  late final ReadingPersistence _readingPersistence;
  late String _fontFamily;
  late double _fontSize;
  late Color _backgroundColor;
  late Color _textColor;
  bool _initializedFromTheme = false;

  double _lineHeight = 1.3;
  double _sidePadding = 10;
  double _firstLineIndentEm = 1.5;
  double _paragraphSpacing = 7;

  @override
  void initState() {
    super.initState();
    _translatedController = ScrollController();
    _readingPersistence = GetIt.I.get<ReadingPersistence>();
    _fontFamily = _readingPersistence.getFontFamily();
    _fontSize = _readingPersistence.getFontSize();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoadingBookContext>().getBookData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initializedFromTheme) {
      final theme = Theme.of(context);
      _backgroundColor =
          _readingPersistence.getBackgroundColor() ?? theme.colorScheme.surface;
      _textColor =
          _readingPersistence.getTextColor() ??
          (Theme.of(context).textTheme.bodyLarge?.color ??
              theme.colorScheme.onSurface);
      _initializedFromTheme = true;
    }
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
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 64,
          title: Consumer<BookReadingContext>(
            builder: (context, readingContext, _) {
              final theme = Theme.of(context);
              final percent = readingContext.totalChapters == 0
                  ? 0
                  : (((readingContext.currentChapterIndex + 1) /
                                readingContext.totalChapters) *
                            100)
                        .round();
              final chapterTitle =
                  readingContext.currentChapter.translatedTitle.isNotEmpty
                  ? readingContext.currentChapter.translatedTitle
                  : readingContext.currentChapter.title;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    book.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '$percent% - $chapterTitle',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            Builder(
              builder: (context) => Tooltip(
                message: AppLocalizations.of(context)!.menu,
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ),
          ],
        ),
        endDrawer: Builder(
          builder: (context) {
            final l10n = AppLocalizations.of(context)!;
            final loadingBookContext = context.watch<LoadingBookContext>();
            final chapters = loadingBookContext.chapters;
            return Drawer(
              child: SafeArea(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Material(
                        color: Theme.of(context).colorScheme.surface,
                        child: TabBar(
                          tabs: [
                            Tab(
                              icon: const Icon(Icons.menu_book),
                              text: l10n.chapter,
                            ),
                            Tab(
                              icon: const Icon(Icons.tune),
                              text: l10n.settings,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ChapterListTab(chapters: chapters),
                            TextSettingsTab(
                              fontFamily: _fontFamily,
                              onFontFamilyChange: (v) => setState(() {
                                _fontFamily = v;
                                _readingPersistence.setFontFamily(v);
                              }),
                              fontSize: _fontSize,
                              onFontSizeChange: (v) => setState(() {
                                _fontSize = v;
                                _readingPersistence.setFontSize(v);
                              }),
                              backgroundColor: _backgroundColor,
                              onBackgroundColorChange: (c) => setState(() {
                                _backgroundColor = c;
                                _readingPersistence.setBackgroundColor(c);
                              }),
                              textColor: _textColor,
                              onTextColorChange: (c) => setState(() {
                                _textColor = c;
                                _readingPersistence.setTextColor(c);
                              }),
                              lineHeight: _lineHeight,
                              onLineHeightChange: (v) => setState(() {
                                _lineHeight = v;
                                _readingPersistence.setLineHeight(v);
                              }),
                              sidePadding: _sidePadding,
                              onSidePaddingChange: (v) => setState(() {
                                _sidePadding = v;
                                _readingPersistence.setSidePadding(v);
                              }),
                              firstLineIndentEm: _firstLineIndentEm,
                              onFirstLineIndentEmChange: (v) => setState(() {
                                _firstLineIndentEm = v;
                                _readingPersistence.setFirstLineIndentEm(v);
                              }),
                              paragraphSpacing: _paragraphSpacing,
                              onParagraphSpacingChange: (v) => setState(() {
                                _paragraphSpacing = v;
                                _readingPersistence.setParagraphSpacing(v);
                              }),
                              translatedController: _translatedController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        body: Consumer<BookReadingContext>(
          builder: (context, readingContext, child) {
            final index = readingContext.currentChapterIndex;
            return Container(
              color: _backgroundColor,
              child: Column(
                children: [
                  TranslatedTextScroll(
                    key: ValueKey(index),
                    controller: _translatedController,
                  ),
                  Expanded(
                    child: OriginalTextScroll(
                      key: ValueKey(index),
                      translatedScrollController: _translatedController,
                      fontFamily: _fontFamily,
                      fontSize: _fontSize,
                      textColor: _textColor,
                      lineHeight: _lineHeight,
                      sidePadding: _sidePadding,
                      firstLineIndentEm: _firstLineIndentEm,
                      paragraphSpacing: _paragraphSpacing,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
