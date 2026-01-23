import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/add_word_button.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/dictionary_list.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/empty_dictionary_state.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/review_due_header.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final savedWords = context.select(
      (DictionaryCubit c) => c.state.savedWords,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.dictionary), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            if (savedWords.isNotEmpty) ReviewDueHeader(savedWords: savedWords),
            Expanded(
              child: savedWords.isEmpty
                  ? const EmptyDictionaryState()
                  : DictionaryList(savedWords: savedWords),
            ),
            const AddWordButton(),
          ],
        ),
      ),
    );
  }
}
