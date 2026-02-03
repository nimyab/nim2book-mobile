import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_notifier.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/add_word_button.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/dictionary_list.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/empty_dictionary_state.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/review_due_header.dart';

class DictionaryScreen extends ConsumerWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final savedCards = ref.watch(
      dictionaryNotifierProvider.select((state) => state.savedCards),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.dictionary), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            if (savedCards.isNotEmpty) ReviewDueHeader(savedCards: savedCards),
            Expanded(
              child: savedCards.isEmpty
                  ? const EmptyDictionaryState()
                  : DictionaryList(savedCards: savedCards),
            ),
            const AddWordButton(),
          ],
        ),
      ),
    );
  }
}
