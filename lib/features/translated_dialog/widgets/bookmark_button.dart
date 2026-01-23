import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_state.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';

class BookmarkButton extends StatelessWidget {
  final String phrase;
  final DictionaryWord word;

  const BookmarkButton({super.key, required this.phrase, required this.word});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DictionaryCubit, DictionaryState>(
      builder: (context, state) {
        final isInDict = context.read<DictionaryCubit>().checkWordWithPosInDict(
          phrase,
          word.partOfSpeech,
        );

        return IconButton(
          icon: Icon(isInDict ? Icons.bookmark : Icons.bookmark_border),
          color: isInDict
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurfaceVariant,
          iconSize: 24,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            if (isInDict) {
              context.read<DictionaryCubit>().deleteWordWithPos(
                phrase,
                word.partOfSpeech,
              );
            } else {
              context.read<DictionaryCubit>().saveWordWithPos(phrase, word);
            }
          },
        );
      },
    );
  }
}
