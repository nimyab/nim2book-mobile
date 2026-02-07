import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/book_reading/book_reading_provider.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/providers/loading_book/loading_book_provider.dart';

class ChapterListTab extends ConsumerWidget {
  final String bookId;

  const ChapterListTab({super.key, required this.bookId});

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final bookId = this.bookId;

    // Get chapters from loading provider
    final chapters = ref.watch(
      loadingBookNotifierProvider(bookId).select((s) => s.chapters),
    );

    final readingState = ref.watch(bookReadingNotifierProvider(bookId));
    final theme = Theme.of(context);

    return ListView.separated(
      itemCount: chapters.length,
      separatorBuilder: (_, final __) => const Divider(height: 1),
      itemBuilder: (final ctx, final index) {
        final chapter = chapters[index];
        final title = chapter?.title ?? 'Loading...';
        final isCurrent = index == readingState.currentChapterIndex;
        return ListTile(
          tileColor: isCurrent
              ? theme.colorScheme.primary.withValues(alpha: 0.15)
              : null,
          title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: chapter == null
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : null,
          onTap: chapter == null
              ? null
              : () {
                  Navigator.of(context).pop();
                  ref
                      .read(bookReadingNotifierProvider(bookId).notifier)
                      .goToChapter(index);
                },
        );
      },
    );
  }
}
