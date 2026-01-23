import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/add_word_dialog.dart';

class AddWordButton extends StatelessWidget {
  const AddWordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Spacer(),
          Tooltip(
            message: l10n.add,
            child: ElevatedButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => const AddWordDialog(),
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
    );
  }
}
