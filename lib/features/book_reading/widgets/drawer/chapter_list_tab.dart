import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:provider/provider.dart';

class ChapterListTab extends StatelessWidget {
  final List<ChapterAlignNode> chapters;

  const ChapterListTab({super.key, required this.chapters});

  @override
  Widget build(final BuildContext context) {
    return Consumer<BookReadingContext>(
      builder: (final context, final readingContext, _) {
        final theme = Theme.of(context);
        return ListView.separated(
          itemCount: chapters.length,
          separatorBuilder: (_, final __) => const Divider(height: 1),
          itemBuilder: (final ctx, final index) {
            final chapter = chapters[index];
            final title = chapter.title;
            final isCurrent = index == readingContext.currentChapterIndex;
            return ListTile(
              tileColor: isCurrent
                  ? theme.colorScheme.primary.withValues(alpha: 0.15)
                  : null,
              title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              onTap: () {
                Navigator.of(context).pop();
                readingContext.goToChapter(index);
              },
            );
          },
        );
      },
    );
  }
}
