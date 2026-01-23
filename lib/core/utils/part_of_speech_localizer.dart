import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class PartOfSpeechLocalizer {
  static String getLabel(AppLocalizations l10n, String? pos) {
    if (pos == null) return '';

    final posKey = pos.toLowerCase();
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

    return posMap[posKey] ?? pos;
  }
}
