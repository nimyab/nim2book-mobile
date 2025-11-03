import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/translated_dialog.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final savedWords = context.select(
      (final DictionaryCubit c) => c.state.savedWords,
    );
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.dictionary), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            if (savedWords.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (final context) {
                        final srs = GetIt.I.get<SrsService>();
                        final count = srs.getDueCount(savedWords.keys);
                        return Text(
                          l10n.reviewDueToday(count),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
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
                      itemBuilder: (final context, final index) {
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
                            showDialog<void>(
                              context: context,
                              builder: (final context) =>
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
                  const Spacer(),
                  Tooltip(
                    message: l10n.add,
                    child: ElevatedButton(
                      onPressed: () {
                        final controller = TextEditingController();
                        showDialog<void>(
                          context: context,
                          builder: (final dialogContext) => AlertDialog(
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
                                  final dict = context.read<DictionaryCubit>();
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
