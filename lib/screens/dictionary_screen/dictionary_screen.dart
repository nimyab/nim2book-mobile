import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/contexts/dictionary_context.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dictContext = context.watch<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dictionary),
      ),
      body: SafeArea(
        child: savedWords.isEmpty
            ? Center(
                child: Text(
                  l10n.noSavedWords,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: savedWords.length,
                itemBuilder: (context, index) {
                  final word = savedWords.keys.elementAt(index);
                  final definitions = savedWords[word]!;
                  final transcription = definitions.isNotEmpty 
                      ? definitions.first.ts 
                      : null;
                  
                  return ListTile(
                    title: Row(
                      children: [
                        Text(
                          word,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (transcription != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            '[$transcription]',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ],
                    ),
                    subtitle: definitions.isNotEmpty && 
                            definitions.first.tr.isNotEmpty
                        ? Text(
                            definitions.first.tr.first.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          )
                        : null,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => TranslatedDialog(phrase: word),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
