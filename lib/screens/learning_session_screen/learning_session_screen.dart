import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/learning_session_content.dart';

class LearningSessionScreen extends ConsumerWidget {
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
  Widget build(final BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(_getTitle(context)), centerTitle: true),
      body: LearningSessionContent(mode: mode),
    );
  }
}
