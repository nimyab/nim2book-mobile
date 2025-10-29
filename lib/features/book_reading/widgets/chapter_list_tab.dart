import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
import 'package:provider/provider.dart';

class ChapterListTab extends StatelessWidget {
  final List<ChapterAlignNode> chapters;

  const ChapterListTab({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookReadingContext>(
      builder: (context, readingContext, _) {
        final theme = Theme.of(context);
        return ListView.separated(
          itemCount: chapters.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, index) {
            final chapter = chapters[index];
            // todo: consider showing translated title if available
            // final title = chapter.translatedTitle.isNotEmpty
            //     ? chapter.translatedTitle
            //     : chapter.title;
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
