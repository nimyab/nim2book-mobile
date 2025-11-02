import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/contexts/dictionary_context.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class TranslatedDialog extends StatefulWidget {
  final String phrase;

  const TranslatedDialog({super.key, required this.phrase});

  @override
  State<TranslatedDialog> createState() => _TranslatedDialogState();
}

class _TranslatedDialogState extends State<TranslatedDialog> {
  final apiClient = GetIt.I.get<ApiClient>();
  final List<Definition> _definitions = [];
  bool _isLoading = false;

  Future<void> fetchTranslation() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final definitions = await context.read<DictionaryContext>().getWord(
        widget.phrase,
      );
      if (definitions != null) _definitions.addAll(definitions);
    } catch (e) {
      Logger().e('Failed to fetch translation: $e');
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
    final dictContext = context.watch<DictionaryContext>();

    final isInDict = dictContext.checkWordInDict(widget.phrase);

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
                        dictContext.deleteWord(widget.phrase);
                      } else {
                        if (_definitions.isEmpty) return;
                        dictContext.saveWord(widget.phrase, _definitions);
                      }
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.phrase,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        if (_definitions.isNotEmpty &&
                            _definitions[0].ts != null)
                          Text(
                            '[${_definitions[0].ts}]',
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
                  : _definitions.isEmpty
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
                      itemCount: _definitions.length,
                      itemBuilder: (final context, final index) {
                        final definition = _definitions[index];
                        return _buildDefinitionItem(context, definition);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefinitionItem(
    final BuildContext context,
    final Definition definition,
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
          if (definition.pos != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                _getPartOfSpeechLabel(l10n, definition.pos!),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),

          ...definition.tr.asMap().entries.map((final entry) {
            final translation = entry.value;
            return Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                          translation.text,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (translation.ex != null && translation.ex!.isNotEmpty)
                    ...translation.ex!.map((final example) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, top: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: secondaryTextColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: example.text,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    if (example.tr != null &&
                                        example.tr!.isNotEmpty)
                                      TextSpan(
                                        text:
                                            ' — ${example.tr!.map((final t) => t.text).join(', ')}',
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),

                  if (translation.mean != null && translation.mean!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 4),
                      child: Text(
                        translation.mean!.map((final m) => m.text).join(', '),
                        style: TextStyle(
                          fontSize: 13,
                          color: secondaryTextColor.withValues(alpha: 0.8),
                          fontStyle: FontStyle.italic,
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
