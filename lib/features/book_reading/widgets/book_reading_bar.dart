import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

const double bookAppBarHeight = 64;

class BookReadingBar extends StatelessWidget implements PreferredSizeWidget {
  final Book book;

  const BookReadingBar({super.key, required this.book});

  @override
  Size get preferredSize => const Size.fromHeight(bookAppBarHeight);

  @override
  Widget build(final BuildContext context) {
    final readingContext = context.watch<BookReadingContext>();
    final theme = Theme.of(context);
    final percent = readingContext.totalChapters == 0
        ? 0
        : (((readingContext.currentChapterIndex + 1) /
                      readingContext.totalChapters) *
                  100)
              .round();
    final chapterTitle = readingContext.currentChapter.title;

    return AppBar(
      centerTitle: false,
      toolbarHeight: bookAppBarHeight,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(book.title, overflow: TextOverflow.ellipsis, maxLines: 1),
          Text(
            '$percent% - $chapterTitle',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      actions: [
        Tooltip(
          message: AppLocalizations.of(context)!.translate,
          child: IconButton(
            icon: Icon(
              readingContext.isTranslatedVisible
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              readingContext.isTranslatedVisible =
                  !readingContext.isTranslatedVisible;
            },
          ),
        ),
        Builder(
          builder: (final context) => Tooltip(
            message: AppLocalizations.of(context)!.menu,
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ),
      ],
    );
  }
}
