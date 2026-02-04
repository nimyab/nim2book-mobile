import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_provider.dart';

class BookmarkButton extends ConsumerWidget {
  final String phrase;
  final DictionaryWord word;

  const BookmarkButton({super.key, required this.phrase, required this.word});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dictionaryNotifier = ref.read(dictionaryNotifierProvider.notifier);
    final isInDict = ref.watch(
      dictionaryNotifierProvider.select(
        (state) =>
            dictionaryNotifier.checkWordInDict(phrase, word.partOfSpeech),
      ),
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
          dictionaryNotifier.deleteWord(phrase, word.partOfSpeech);
        } else {
          dictionaryNotifier.saveWord(phrase, word);
        }
      },
    );
  }
}
