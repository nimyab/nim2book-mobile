import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';

class ChapterListTab extends ConsumerWidget {
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const ChapterListTab({
    super.key,
    required this.bookId,
    required this.chapters,
  });

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final bookReadingParam = (bookId: bookId, chapters: chapters);
    final readingState = ref.watch(
      bookReadingNotifierProvider(bookReadingParam),
    );
    final theme = Theme.of(context);

    return ListView.separated(
      itemCount: chapters.length,
      separatorBuilder: (_, final __) => const Divider(height: 1),
      itemBuilder: (final ctx, final index) {
        final chapter = chapters[index];
        final title = chapter.title;
        final isCurrent = index == readingState.currentChapterIndex;
        return ListTile(
          tileColor: isCurrent
              ? theme.colorScheme.primary.withValues(alpha: 0.15)
              : null,
          title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          onTap: () {
            Navigator.of(context).pop();
            ref
                .read(bookReadingNotifierProvider(bookReadingParam).notifier)
                .goToChapter(index);
          },
        );
      },
    );
  }
}
