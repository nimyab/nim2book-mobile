import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/utils/part_of_speech_localizer.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/bookmark_button.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/translation_item.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/word_example_item.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class WordItem extends StatelessWidget {
  final String phrase;
  final DictionaryWord word;

  const WordItem({super.key, required this.phrase, required this.word});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final textColor = theme.colorScheme.onSurface;
    final secondaryTextColor = theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    PartOfSpeechLocalizer.getLabel(l10n, word.partOfSpeech),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                BookmarkButton(phrase: phrase, word: word),
              ],
            ),
          ),
          if (word.transcription != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Text(
                '[${word.transcription}]',
                style: TextStyle(
                  fontSize: 14,
                  color: secondaryTextColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ...word.translations.map(
            (translation) => TranslationItem(
              translation: translation,
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
            ),
          ),
          if (word.examples.isNotEmpty)
            ...word.examples.map(
              (example) => WordExampleItem(
                example: example,
                secondaryTextColor: secondaryTextColor,
              ),
            ),
        ],
      ),
    );
  }
}
