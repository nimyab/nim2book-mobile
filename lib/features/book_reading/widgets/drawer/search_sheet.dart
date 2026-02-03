import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/notifiers/book_reading_notifier.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class SearchResult {
  final int chapterIndex;
  final int paragraphIndex;
  final int wordIndex;
  final String chapterTitle;
  final String snippet;

  SearchResult({
    required this.chapterIndex,
    required this.paragraphIndex,
    required this.wordIndex,
    required this.chapterTitle,
    required this.snippet,
  });
}

class SearchSheet extends ConsumerStatefulWidget {
  final String bookId;
  final List<ChapterAlignNode> chapters;

  const SearchSheet({super.key, required this.bookId, required this.chapters});

  @override
  ConsumerState<SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends ConsumerState<SearchSheet> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<SearchResult> _results = [];
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _performSearch(final String q) {
    final chapters = widget.chapters;
    final qTrim = q.trim();
    final qLower = qTrim.toLowerCase();

    setState(() {
      _query = q;
      _results = [];
      if (qTrim.isEmpty) return;
      for (var ci = 0; ci < chapters.length; ci++) {
        final ch = chapters[ci];
        final title = ch.translatedTitle.isNotEmpty
            ? ch.translatedTitle
            : ch.title;
        final titleStr = title.toString();
        if (titleStr.toLowerCase().contains(qLower)) {
          _results.add(
            SearchResult(
              chapterIndex: ci,
              paragraphIndex: -1,
              wordIndex: -1,
              chapterTitle: titleStr,
              snippet: titleStr,
            ),
          );
        }
        final content = ch.content;
        for (var pi = 0; pi < content.length; pi++) {
          final p = content[pi];
          final op = p.op.toString();
          final tp = p.tp.toString();
          var idx = op.toLowerCase().indexOf(qLower);
          if (idx != -1) {
            final snippet = _buildSnippetLocal(op, idx, qTrim.length);
            final wordIdx = _wordIndexForOriginal(p, idx, qTrim.length);
            _results.add(
              SearchResult(
                chapterIndex: ci,
                paragraphIndex: pi,
                wordIndex: wordIdx,
                chapterTitle: titleStr,
                snippet: snippet,
              ),
            );
          } else {
            idx = tp.toLowerCase().indexOf(qLower);
            if (idx != -1) {
              final snippet = _buildSnippetLocal(tp, idx, qTrim.length);
              final wordIdx = _wordIndexForTranslated(p, idx);
              _results.add(
                SearchResult(
                  chapterIndex: ci,
                  paragraphIndex: pi,
                  wordIndex: wordIdx,
                  chapterTitle: titleStr,
                  snippet: snippet,
                ),
              );
            }
          }
        }
      }
    });
  }

  String _buildSnippetLocal(
    final String text,
    final int startIndex,
    final int matchLength,
  ) {
    const radius = 40;
    final begin = (startIndex - radius).clamp(0, text.length);
    final end = (startIndex + matchLength + radius).clamp(0, text.length);
    var snippet = text.substring(begin, end);
    if (begin > 0) snippet = '…$snippet';
    if (end < text.length) snippet = '$snippet…';
    return snippet;
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (final context, final scrollController) {
        return Material(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      labelText: l10n.search,
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (final v) => _performSearch(v),
                    onSubmitted: (final v) => _performSearch(v),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: _results.isEmpty
                        ? Center(
                            child: Text(
                              _query.isEmpty ? l10n.search : l10n.noResults,
                            ),
                          )
                        : ListView.separated(
                            controller: scrollController,
                            itemCount: _results.length,
                            separatorBuilder: (_, final __) =>
                                const Divider(height: 1),
                            itemBuilder: (final ctx, final index) {
                              final r = _results[index];
                              return ListTile(
                                title: Text(
                                  r.chapterTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  r.snippet,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () {
                                  final bookReadingParam = (
                                    bookId: widget.bookId,
                                    chapters: widget.chapters,
                                  );
                                  final notifier = ref.read(
                                    bookReadingNotifierProvider(
                                      bookReadingParam,
                                    ).notifier,
                                  );
                                  Navigator.of(context).pop();
                                  notifier.goToChapter(r.chapterIndex);
                                  if (r.paragraphIndex >= 0 &&
                                      r.wordIndex >= 0) {
                                    notifier.selectWord(
                                      r.paragraphIndex,
                                      r.wordIndex,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  int _wordIndexForOriginal(
    final ParagraphAlignNode p,
    final int charIndex,
    final int matchLen,
  ) {
    final rawTokens = p.op
        .split(RegExp(r'\s+'))
        .map((final w) => w.trim())
        .where((final w) => w.isNotEmpty)
        .toList();
    var running = 0;
    var tokenIdx = -1;
    for (var i = 0; i < rawTokens.length; i++) {
      final t = rawTokens[i];
      final start = running;
      final end = running + t.length;
      if (charIndex >= start && charIndex < end ||
          (charIndex + matchLen) > start && (charIndex + matchLen) <= end) {
        tokenIdx = i;
        break;
      }
      running = end + 1;
    }
    if (tokenIdx == -1) return -1;
    for (var wi = 0; wi < p.aw.length; wi++) {
      final node = p.aw[wi];
      if (node.iow.contains(tokenIdx)) {
        return wi;
      }
    }
    return -1;
  }

  int _wordIndexForTranslated(final ParagraphAlignNode p, final int charIndex) {
    for (var wi = 0; wi < p.aw.length; wi++) {
      final node = p.aw[wi];
      if (node.itw.length >= 2) {
        final start = node.itw[0];
        final end = node.itw[1];
        if (charIndex >= start && charIndex < end) {
          return wi;
        }
      }
    }
    return -1;
  }
}
