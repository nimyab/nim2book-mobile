import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/book_reading/book_reading_cubit.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/book_reading/book_reading_state.dart';

class ChapterListTab extends StatelessWidget {
  final List<ChapterAlignNode> chapters;

  const ChapterListTab({super.key, required this.chapters});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<BookReadingCubit, BookReadingState>(
      builder: (final context, final readingState) {
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
                context.read<BookReadingCubit>().goToChapter(index);
              },
            );
          },
        );
      },
    );
  }
}
