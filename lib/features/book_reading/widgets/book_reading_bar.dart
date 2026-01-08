import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/book_reading/book_reading_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/reading_settings/reading_settings_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

const double bookAppBarHeight = 64;

class BookReadingBar extends StatelessWidget implements PreferredSizeWidget {
  final Book book;

  const BookReadingBar({super.key, required this.book});

  @override
  Size get preferredSize => const Size.fromHeight(bookAppBarHeight);

  @override
  Widget build(final BuildContext context) {
    final readingState = context.watch<BookReadingCubit>().state;
    final theme = Theme.of(context);
    final total = readingState.chapters.length;
    final percent = total == 0
        ? 0
        : (((readingState.currentChapterIndex + 1) / total) * 100).round();
    final chapterTitle = readingState.chapters.isEmpty
        ? ''
        : readingState.chapters[readingState.currentChapterIndex].title;

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
              context.select(
                    (final ReadingSettingsCubit c) =>
                        c.state.isTranslatedVisible,
                  )
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              final visible = context
                  .read<ReadingSettingsCubit>()
                  .state
                  .isTranslatedVisible;
              context.read<ReadingSettingsCubit>().setTranslatedVisible(
                value: !visible,
              );
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
