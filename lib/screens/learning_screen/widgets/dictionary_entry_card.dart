import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DictionaryEntryCard extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onTap;

  const DictionaryEntryCard({
    super.key,
    required this.l10n,
    required this.onTap,
  });

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book_outlined),
        title: Text(l10n.dictionary),
        onTap: onTap,
      ),
    );
  }
}
