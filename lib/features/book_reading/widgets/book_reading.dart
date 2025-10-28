import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/search_sheet.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/drawer_header_actions.dart';

class BookReading extends StatefulWidget {
  const BookReading({super.key});

  @override
  State<BookReading> createState() => _BookReadingState();
}

class _BookReadingState extends State<BookReading>
    with TickerProviderStateMixin {
  late final ScrollController _translatedController;
  late final ReadingPersistence _readingPersistence;
  late String _fontFamily;
  late double _fontSize;
  late Color _backgroundColor;
  late Color _textColor;
  bool _initializedFromTheme = false;

  bool _isTranslatedVisible = false;
  bool _isFullscreen = false;
  int _lastSelectionParagraphIndex = -1;
  int _lastSelectionWordIndex = -1;

  double _lineHeight = 1.3;
  double _sidePadding = 10;
  double _firstLineIndentEm = 1.5;
  double _paragraphSpacing = 7;
  TextAlign _textAlign = TextAlign.justify;
  double _translatedFontSize = 20;
  String _translatedFontFamily = 'System';
  double _translatedVerticalPadding = 5;

  @override
  void initState() {
    super.initState();
    _translatedController = ScrollController();
    _readingPersistence = GetIt.I.get<ReadingPersistence>();
    _fontFamily = _readingPersistence.getFontFamily();
    _fontSize = _readingPersistence.getFontSize();
    _textAlign = _readingPersistence.getTextAlign();
    _translatedFontSize = _readingPersistence.getTranslatedFontSize();
    _translatedFontFamily = _readingPersistence.getTranslatedFontFamily();
    _translatedVerticalPadding = _readingPersistence
        .getTranslatedVerticalPadding();

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
      update: (context, value, previous) {
        if (previous == null) {
          return BookReadingContext(bookId: book.id, chapters: value.chapters);
        }
        previous.setChapters(value.chapters);
        return previous;
      },
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
            Tooltip(
              message: AppLocalizations.of(context)!.translate,
              child: IconButton(
                icon: Icon(
                  _isTranslatedVisible
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
                onPressed: () {
                  setState(() {
                    _isTranslatedVisible = !_isTranslatedVisible;
                  });
                },
              ),
            ),
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
                      DrawerHeaderActions(
                        isFullscreen: _isFullscreen,
                        onClose: () {
                          Navigator.of(context).maybePop();
                        },
                        onToggleFullscreen: () async {
                          setState(() {
                            _isFullscreen = !_isFullscreen;
                          });
                          if (_isFullscreen) {
                            await SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.immersiveSticky,
                            );
                          } else {
                            await SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.edgeToEdge,
                            );
                          }
                        },
                        onOpenSearch: () {
                          _openSearchSheet(context);
                        },
                      ),
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
                              textAlign: _textAlign,
                              onTextAlignChange: (v) => setState(() {
                                _textAlign = v;
                                _readingPersistence.setTextAlign(v);
                              }),
                              translatedVerticalPadding:
                                  _translatedVerticalPadding,
                              onTranslatedVerticalPaddingChange: (v) =>
                                  setState(() {
                                    _translatedVerticalPadding = v;
                                    _readingPersistence
                                        .setTranslatedVerticalPadding(v);
                                  }),
                              translatedFontSize: _translatedFontSize,
                              onTranslatedFontSizeChange: (v) => setState(() {
                                _translatedFontSize = v;
                                _readingPersistence.setTranslatedFontSize(v);
                              }),
                              translatedFontFamily: _translatedFontFamily,
                              onTranslatedFontFamilyChange: (v) => setState(() {
                                _translatedFontFamily = v;
                                _readingPersistence.setTranslatedFontFamily(v);
                              }),
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
            final selParagraph = readingContext.selectedParagraphIndex;
            final selWord = readingContext.selectedWordIndex;
            final selectionChanged =
                selParagraph != _lastSelectionParagraphIndex ||
                selWord != _lastSelectionWordIndex;
            if (selectionChanged) {
              _lastSelectionParagraphIndex = selParagraph;
              _lastSelectionWordIndex = selWord;
              if (selParagraph != -1 &&
                  selWord != -1 &&
                  !_isTranslatedVisible) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      _isTranslatedVisible = true;
                    });
                  }
                });
              }
            }
            return Container(
              color: _backgroundColor,
              child: Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: ClipRect(
                      child: Align(
                        heightFactor: _isTranslatedVisible ? 1.0 : 0.0,
                        child: TranslatedTextScroll(
                          key: ValueKey(index),
                          controller: _translatedController,
                          fontSize: _translatedFontSize,
                          fontFamily: _translatedFontFamily,
                          verticalPadding: _translatedVerticalPadding,
                        ),
                      ),
                    ),
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
                      textAlign: _textAlign,
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

  void _openSearchSheet(BuildContext context) {
    final loadingBookContext = context.read<LoadingBookContext>();
    final chapters = loadingBookContext.chapters;
    final readingContext = context.read<BookReadingContext>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) =>
          SearchSheet(chapters: chapters, readingContext: readingContext),
    );
  }
}
