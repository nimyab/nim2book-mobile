import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';
import 'package:nim2book_mobile_flutter/core/utils/part_of_speech_localizer.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DictionaryListItem extends StatelessWidget {
  final DictionaryCard cardData;

  const DictionaryListItem({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cardData.wordData.text,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (cardData.wordData.transcription != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        '[${cardData.wordData.transcription}]',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  PartOfSpeechLocalizer.getLabel(
                    l10n,
                    cardData.wordData.partOfSpeech,
                  ),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      subtitle: cardData.wordData.translations.isNotEmpty
          ? Text(
              cardData.wordData.translations.first,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
            message: l10n.pronounce,
            child: IconButton(
              icon: Icon(Icons.volume_up, color: theme.colorScheme.primary),
              onPressed: () {
                GetIt.I.get<TtsService>().speak(cardData.wordData.text);
              },
            ),
          ),
          Tooltip(
            message: l10n.delete,
            child: IconButton(
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              onPressed: () {
                context.read<DictionaryCubit>().deleteWord(
                  cardData.wordData.text,
                  cardData.wordData.partOfSpeech,
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (context) =>
              TranslatedDialog(phrase: cardData.wordData.text),
        );
      },
    );
  }
}
