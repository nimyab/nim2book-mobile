import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/dialog_header.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/empty_state.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/loading_state.dart';
import 'package:nim2book_mobile_flutter/features/translated_dialog/widgets/word_item.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TranslatedDialog extends StatefulWidget {
  final String phrase;

  const TranslatedDialog({super.key, required this.phrase});

  @override
  State<TranslatedDialog> createState() => _TranslatedDialogState();
}

class _TranslatedDialogState extends State<TranslatedDialog> {
  final List<DictionaryWord> _words = [];
  bool _isLoading = false;

  Future<void> _fetchTranslation() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final words = await context.read<DictionaryCubit>().getWordServiceFirst(
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
    _fetchTranslation();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = theme.colorScheme.surface;
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
            DialogHeader(
              phrase: widget.phrase,
              transcription: _words.isNotEmpty
                  ? _words.first.transcription
                  : null,
              headerColor: headerColor,
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
            ),
            Flexible(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const LoadingState();
    }

    if (_words.isEmpty) {
      return const EmptyState();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _words.length,
      itemBuilder: (context, index) {
        final word = _words[index];
        return WordItem(phrase: widget.phrase, word: word);
      },
    );
  }
}
