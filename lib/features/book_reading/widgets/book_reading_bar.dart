import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/reading_settings/reading_settings_provider.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

const double bookAppBarHeight = 64;

class BookReadingBar extends ConsumerWidget implements PreferredSizeWidget {
  final Book book;
  final String bookId;

  const BookReadingBar({super.key, required this.book, required this.bookId});

  @override
  Size get preferredSize => const Size.fromHeight(bookAppBarHeight);

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final bookId = this.bookId;

    // Get chapters from loading provider
    final chapters = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.chapters),
    );

    final readingState = ref.watch(bookReadingNotifierProvider(bookId));
    final theme = Theme.of(context);
    final total = chapters.length;
    final percent = total == 0
        ? 0
        : (((readingState.currentChapterIndex + 1) / total) * 100).round();
    final currentChapter =
        (chapters.isEmpty ||
            readingState.currentChapterIndex >= chapters.length)
        ? null
        : chapters[readingState.currentChapterIndex];
    final chapterTitle = currentChapter?.title ?? 'Loading...';

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
              ref.watch(
                    readingSettingsNotifierProvider.select(
                      (state) => state.isTranslatedVisible,
                    ),
                  )
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              final visible = ref
                  .read(readingSettingsNotifierProvider)
                  .isTranslatedVisible;
              ref
                  .read(readingSettingsNotifierProvider.notifier)
                  .setTranslatedVisible(value: !visible);
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
