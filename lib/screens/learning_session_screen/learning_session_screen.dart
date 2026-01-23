import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/bloc/learning_session/learning_session_cubit.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/learning_session_content.dart';

export 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/learning_session_content.dart'
    show LearningMode;

class LearningSessionScreen extends StatelessWidget {
  final LearningMode mode;

  const LearningSessionScreen({super.key, required this.mode});

  String _getTitle(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (mode) {
      case LearningMode.newOnly:
        return l10n.learnNewWords;
      case LearningMode.reviewOnly:
        return l10n.reviewWords;
      case LearningMode.mixed:
        return l10n.mixedMode;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final savedWords = context.read<DictionaryCubit>().state.savedWords;

    return BlocProvider(
      create: (final context) =>
          LearningSessionCubit(mode: mode, allSavedWords: savedWords)
            ..initializeSession(),
      child: Scaffold(
        appBar: AppBar(title: Text(_getTitle(context)), centerTitle: true),
        body: const LearningSessionContent(),
      ),
    );
  }
}
