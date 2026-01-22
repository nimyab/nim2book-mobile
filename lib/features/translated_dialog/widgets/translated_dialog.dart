import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TranslatedDialog extends StatefulWidget {
  final String phrase;

  const TranslatedDialog({super.key, required this.phrase});

  @override
  State<TranslatedDialog> createState() => _TranslatedDialogState();
}

class _TranslatedDialogState extends State<TranslatedDialog> {
  final apiClient = GetIt.I.get<ApiClient>();
  final List<DictionaryWord> _words = [];
  bool _isLoading = false;

  Future<void> fetchTranslation() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final words = await context.read<DictionaryCubit>().getWord(
        widget.phrase,
      );
      if (words != null) _words.addAll(words);
    } catch (e) {
      GetIt.I.get<Talker>().error('Failed to fetch translation: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTranslation();
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;
    final isInDict = context.select(
      (final DictionaryCubit c) => c.checkWordInDict(widget.phrase),
    );

    final backgroundColor = isDark
        ? theme.colorScheme.surface
        : theme.colorScheme.surface;
    final headerColor = isDark
        ? theme.colorScheme.surfaceContainerHighest
        : theme.colorScheme.primaryContainer.withValues(alpha: 0.3);
    final textColor = theme.colorScheme.onSurface;
    final secondaryTextColor = theme.colorScheme.onSurfaceVariant;

    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: headerColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: isInDict
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_border),
                    color: Colors.amber,
                    iconSize: 28,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      if (isInDict) {
                        context.read<DictionaryCubit>().deleteWord(
                          widget.phrase,
                        );
                      } else {
                        if (_words.isEmpty) return;
                        context.read<DictionaryCubit>().saveWord(
                          widget.phrase,
                          _words,
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 12),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              GetIt.I.get<TtsService>().speak(widget.phrase),
                          child: Text(
                            widget.phrase,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                        if (_words.isNotEmpty &&
                            _words[0].transcription != null)
                          Text(
                            '[${_words[0].transcription}]',
                            style: TextStyle(
                              fontSize: 14,
                              color: secondaryTextColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: textColor,
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            Flexible(
              child: _isLoading
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    )
                  : _words.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: secondaryTextColor.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              l10n.translationNotFound,
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      itemCount: _words.length,
                      itemBuilder: (final context, final index) {
                        final word = _words[index];
                        return _buildWordItem(context, word);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWordItem(
    final BuildContext context,
    final DictionaryWord word,
  ) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final textColor = theme.colorScheme.onSurface;
    final secondaryTextColor = theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (word.partOfSpeech != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                _getPartOfSpeechLabel(l10n, word.partOfSpeech!),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
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

          ...(word.translations ?? []).asMap().entries.map((final entry) {
            final translation = entry.value;
            return Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '- ',
                    style: TextStyle(
                      fontSize: 16,
                      color: secondaryTextColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      translation,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          // Display examples if available
          if (word.examples != null && word.examples!.isNotEmpty)
            ...word.examples!.map((final example) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      example.text,
                      style: TextStyle(
                        fontSize: 13,
                        color: secondaryTextColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    if (example.translatedText.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '— ${example.translatedText}',
                          style: TextStyle(
                            fontSize: 13,
                            color: secondaryTextColor.withValues(alpha: 0.8),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }

  String _getPartOfSpeechLabel(final AppLocalizations l10n, final String pos) {
    final posMap = {
      'noun': l10n.posNoun,
      'adjective': l10n.posAdjective,
      'verb': l10n.posVerb,
      'adverb': l10n.posAdverb,
      'participle': l10n.posParticiple,
      'conjunction': l10n.posConjunction,
      'preposition': l10n.posPreposition,
      'pronoun': l10n.posPronoun,
    };
    return posMap[pos] ?? pos;
  }
}
