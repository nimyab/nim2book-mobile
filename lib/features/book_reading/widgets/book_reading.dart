import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/widgets/original_text_scroll.dart';
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
  late String _fontFamily;
  late double _fontSize;
  late Color _backgroundColor;
  late Color _textColor;
  bool _initializedFromTheme = false;

  double _lineHeight = 1.3;
  double _sidePadding = 10;
  double _firstLineIndentEm = 1.5;
  double _paragraphSpacing = 7;

  // Превью значения для оптимистичных обновлений
  late double _fontSizePreview;
  double _lineHeightPreview = 1.3;
  double _sidePaddingPreview = 10;
  double _firstLineIndentEmPreview = 1.5;
  double _paragraphSpacingPreview = 7;

  @override
  void initState() {
    super.initState();
    _translatedController = ScrollController();
    _fontFamily = 'System';
    _fontSize = 24;
    _fontSizePreview = _fontSize;
    _lineHeightPreview = _lineHeight;
    _sidePaddingPreview = _sidePadding;
    _firstLineIndentEmPreview = _firstLineIndentEm;
    _paragraphSpacingPreview = _paragraphSpacing;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoadingBookContext>().getBookData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initializedFromTheme) {
      final theme = Theme.of(context);
      _backgroundColor = theme.colorScheme.surface;
      _textColor =
          Theme.of(context).textTheme.bodyLarge?.color ??
          theme.colorScheme.onSurface;
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
                            Consumer<BookReadingContext>(
                              builder: (context, readingContext, _) {
                                final theme = Theme.of(context);
                                return ListView.separated(
                                  itemCount: chapters.length,
                                  separatorBuilder: (_, __) =>
                                      const Divider(height: 1),
                                  itemBuilder: (ctx, index) {
                                    final chapter = chapters[index];
                                    final title =
                                        chapter.translatedTitle.isNotEmpty
                                        ? chapter.translatedTitle
                                        : chapter.title;
                                    final isCurrent =
                                        index ==
                                        readingContext.currentChapterIndex;
                                    return ListTile(
                                      tileColor: isCurrent
                                          ? theme.colorScheme.primary
                                                .withValues(alpha: 0.15)
                                          : null,
                                      title: Text(
                                        title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        readingContext.goToChapter(index);
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListView(
                                children: [
                                  const SizedBox(height: 4),
                                  ExpansionTile(
                                    title: Text(l10n.bookTextSettings),
                                    initiallyExpanded: false,
                                    children: [
                                      ListTile(
                                        title: Text(l10n.font),
                                        subtitle: Row(
                                          children: [
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: _fontFamily,
                                                isExpanded: true,
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: 'System',
                                                    child: Text('System'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'NotoSerif',
                                                    child: Text('Noto Serif'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Merriweather',
                                                    child: Text('Merriweather'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Roboto',
                                                    child: Text('Roboto'),
                                                  ),
                                                ],
                                                onChanged: (v) => setState(
                                                  () => _fontFamily =
                                                      v ?? 'System',
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () => setState(
                                                () => _fontFamily = 'System',
                                              ),
                                              child: Text(l10n.reset),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(height: 1),
                                      StatefulBuilder(
                                        builder: (context, setInnerState) {
                                          return ListTile(
                                            title: Text(
                                              l10n.fontSizeValue(
                                                _fontSizePreview.round(),
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Slider(
                                                    value: _fontSizePreview,
                                                    min: 12,
                                                    max: 32,
                                                    divisions: 20,
                                                    label:
                                                        '${_fontSizePreview.round()}',
                                                    onChanged: (v) =>
                                                        setInnerState(
                                                          () =>
                                                              _fontSizePreview =
                                                                  v,
                                                        ),
                                                    onChangeEnd: (v) =>
                                                        setState(
                                                          () => _fontSize = v,
                                                        ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setInnerState(
                                                      () =>
                                                          _fontSizePreview = 24,
                                                    );
                                                    setState(
                                                      () => _fontSize = 24,
                                                    );
                                                  },
                                                  child: Text(l10n.reset),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      const Divider(height: 1),
                                      ListTile(
                                        title: Text(l10n.backgroundColor),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: [
                                                for (final c in [
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.surface,
                                                  Colors.white,
                                                  Colors.black,
                                                  Colors.grey,
                                                  Colors.amberAccent.shade100,
                                                ])
                                                  GestureDetector(
                                                    onTap: () => setState(
                                                      () =>
                                                          _backgroundColor = c,
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 14,
                                                      backgroundColor: c,
                                                      child:
                                                          c == _backgroundColor
                                                          ? const Icon(
                                                              Icons.check,
                                                              size: 16,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            TextButton(
                                              onPressed: () => setState(
                                                () =>
                                                    _backgroundColor = Theme.of(
                                                      context,
                                                    ).colorScheme.surface,
                                              ),
                                              child: Text(l10n.reset),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(height: 1),
                                      ListTile(
                                        title: Text(l10n.textColor),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: [
                                                for (final c in [
                                                  Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.color ??
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.onSurface,
                                                  Colors.black,
                                                  Colors.white,
                                                  Colors.brown,
                                                ])
                                                  GestureDetector(
                                                    onTap: () => setState(
                                                      () => _textColor = c,
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 14,
                                                      backgroundColor: c,
                                                      child: c == _textColor
                                                          ? Icon(
                                                              Icons.check,
                                                              size: 16,
                                                              color:
                                                                  c.computeLuminance() <
                                                                      0.5
                                                                  ? Colors.white
                                                                  : Colors.black,
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            TextButton(
                                              onPressed: () => setState(
                                                () => _textColor =
                                                    Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.color ??
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.onSurface,
                                              ),
                                              child: Text(l10n.reset),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(height: 1),
                                      StatefulBuilder(
                                        builder: (context, setInnerState) {
                                          return ListTile(
                                            title: Text(
                                              l10n.lineHeightValue(
                                                _lineHeightPreview
                                                    .toStringAsFixed(2),
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Slider(
                                                    value: _lineHeightPreview,
                                                    min: 1.0,
                                                    max: 2.0,
                                                    divisions: 20,
                                                    label: _lineHeightPreview
                                                        .toStringAsFixed(2),
                                                    onChanged: (v) =>
                                                        setInnerState(
                                                          () =>
                                                              _lineHeightPreview =
                                                                  v,
                                                        ),
                                                    onChangeEnd: (v) =>
                                                        setState(
                                                          () => _lineHeight = v,
                                                        ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setInnerState(
                                                      () => _lineHeightPreview =
                                                          1.3,
                                                    );
                                                    setState(
                                                      () => _lineHeight = 1.3,
                                                    );
                                                  },
                                                  child: Text(l10n.reset),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      const Divider(height: 1),
                                      StatefulBuilder(
                                        builder: (context, setInnerState) {
                                          return ListTile(
                                            title: Text(
                                              l10n.sidePaddingPx(
                                                _sidePaddingPreview.round(),
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Slider(
                                                    value: _sidePaddingPreview,
                                                    min: 0,
                                                    max: 32,
                                                    divisions: 32,
                                                    label:
                                                        '${_sidePaddingPreview.round()} px',
                                                    onChanged: (v) =>
                                                        setInnerState(
                                                          () =>
                                                              _sidePaddingPreview =
                                                                  v,
                                                        ),
                                                    onChangeEnd: (v) =>
                                                        setState(
                                                          () =>
                                                              _sidePadding = v,
                                                        ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setInnerState(
                                                      () =>
                                                          _sidePaddingPreview =
                                                              10,
                                                    );
                                                    setState(
                                                      () => _sidePadding = 10,
                                                    );
                                                  },
                                                  child: Text(l10n.reset),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      const Divider(height: 1),
                                      StatefulBuilder(
                                        builder: (context, setInnerState) {
                                          return ListTile(
                                            title: Text(
                                              l10n.firstLineIndentEm(
                                                _firstLineIndentEmPreview
                                                    .toStringAsFixed(1),
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Slider(
                                                    value:
                                                        _firstLineIndentEmPreview,
                                                    min: 0.0,
                                                    max: 3.0,
                                                    divisions: 30,
                                                    label:
                                                        '${_firstLineIndentEmPreview.toStringAsFixed(1)} em',
                                                    onChanged: (v) => setInnerState(
                                                      () =>
                                                          _firstLineIndentEmPreview =
                                                              v,
                                                    ),
                                                    onChangeEnd: (v) => setState(
                                                      () => _firstLineIndentEm =
                                                          v,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setInnerState(
                                                      () =>
                                                          _firstLineIndentEmPreview =
                                                              1.5,
                                                    );
                                                    setState(
                                                      () => _firstLineIndentEm =
                                                          1.5,
                                                    );
                                                  },
                                                  child: Text(l10n.reset),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      const Divider(height: 1),
                                      StatefulBuilder(
                                        builder: (context, setInnerState) {
                                          return ListTile(
                                            title: Text(
                                              l10n.paragraphSpacingPx(
                                                _paragraphSpacingPreview
                                                    .round(),
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Expanded(
                                                  child: Slider(
                                                    value:
                                                        _paragraphSpacingPreview,
                                                    min: 0,
                                                    max: 24,
                                                    divisions: 24,
                                                    label:
                                                        '${_paragraphSpacingPreview.round()} px',
                                                    onChanged: (v) => setInnerState(
                                                      () =>
                                                          _paragraphSpacingPreview =
                                                              v,
                                                    ),
                                                    onChangeEnd: (v) => setState(
                                                      () =>
                                                          _paragraphSpacing = v,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setInnerState(
                                                      () =>
                                                          _paragraphSpacingPreview =
                                                              7,
                                                    );
                                                    setState(
                                                      () =>
                                                          _paragraphSpacing = 7,
                                                    );
                                                  },
                                                  child: Text(l10n.reset),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  ExpansionTile(
                                    title: Text(
                                      l10n.parallelTranslationHorizontalScroll,
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(''),
                                            TextButton(
                                              onPressed: () =>
                                                  _translatedController.jumpTo(
                                                    0,
                                                  ),
                                              child: Text(l10n.resetPosition),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
