import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/learning_screen/learning_screen.dart';
import 'package:provider/provider.dart';

import '../../core/contexts/dictionary_context.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dictContext = context.watch<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.dictionary), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                          subtitle:
                              definitions.isNotEmpty &&
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
                              builder: (context) =>
                                  TranslatedDialog(phrase: word),
                            );
                          },
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: savedWords.isNotEmpty
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LearningScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  theme.colorScheme.surfaceContainer,
                              foregroundColor: theme.colorScheme.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              l10n.learnWords,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 12),
                  Tooltip(
                    message: l10n.add,
                    child: ElevatedButton(
                      onPressed: () {
                        final controller = TextEditingController();
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: Text(l10n.add),
                            content: TextField(
                              controller: controller,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: l10n.enterWordHint,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(),
                                child: Text(l10n.cancel),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final word = controller.text.trim();
                                  if (word.isEmpty) return;
                                  Navigator.of(dialogContext).pop();
                                  final dict = context
                                      .read<DictionaryContext>();
                                  final defs = await dict.getWord(word);
                                  await dict.saveWord(word, defs ?? []);
                                },
                                child: Text(l10n.add),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.surfaceContainer,
                        foregroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
