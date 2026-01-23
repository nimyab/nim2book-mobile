import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/translated_dialog.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAdd(BuildContext context) {
    final word = _controller.text.trim();
    if (word.isEmpty) return;

    Navigator.of(context).pop();
    showDialog<void>(
      context: context,
      builder: (context) => TranslatedDialog(phrase: word),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.add),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(hintText: l10n.enterWordHint),
        onSubmitted: (_) => _onAdd(context),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        TextButton(onPressed: () => _onAdd(context), child: Text(l10n.add)),
      ],
    );
  }
}
