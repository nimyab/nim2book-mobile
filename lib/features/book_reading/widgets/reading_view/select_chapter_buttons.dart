import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/bloc/book_reading/book_reading_cubit.dart';

class SelectChapterButtons extends StatelessWidget {
  const SelectChapterButtons({super.key});

  @override
  Widget build(final BuildContext context) {
    final readingState = context.watch<BookReadingCubit>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        if (readingState.currentChapterIndex > 0)
          IconButton.filledTonal(
            onPressed: () =>
                context.read<BookReadingCubit>().goToPreviousChapter(),
            icon: const Icon(Icons.arrow_back),
          ),
        if (readingState.currentChapterIndex < readingState.chapters.length - 1)
          IconButton.filledTonal(
            onPressed: () => context.read<BookReadingCubit>().goToNextChapter(),
            icon: const Icon(Icons.arrow_forward),
          ),
      ],
    );
  }
}
