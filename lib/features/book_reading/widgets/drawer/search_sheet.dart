import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/contexts/book_reading_context.dart';
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

class SearchSheet extends StatefulWidget {
  final List<ChapterAlignNode> chapters;
  final BookReadingContext readingContext;
  const SearchSheet({
    super.key,
    required this.chapters,
    required this.readingContext,
  });

  @override
  State<SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends State<SearchSheet> {
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

  void _performSearch(String q) {
    final chapters = widget.chapters;
    final qTrim = q.trim();
    final qLower = qTrim.toLowerCase();

    setState(() {
      _query = q;
      _results = [];
      if (qTrim.isEmpty) return;
      for (int ci = 0; ci < chapters.length; ci++) {
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
        for (int pi = 0; pi < content.length; pi++) {
          final p = content[pi];
          final op = p.op.toString();
          final tp = p.tp.toString();
          int idx = op.toLowerCase().indexOf(qLower);
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

  String _buildSnippetLocal(String text, int startIndex, int matchLength) {
    const int radius = 40;
    final int begin = (startIndex - radius).clamp(0, text.length);
    final int end = (startIndex + matchLength + radius).clamp(0, text.length);
    String snippet = text.substring(begin, end);
    if (begin > 0) snippet = '…$snippet';
    if (end < text.length) snippet = '$snippet…';
    return snippet;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
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
                    onChanged: (v) => _performSearch(v),
                    onSubmitted: (v) => _performSearch(v),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: _results.isEmpty
                        ? Center(
                            child: Text(
                              _query.isEmpty ? l10n.search : 'No results',
                            ),
                          )
                        : ListView.separated(
                            controller: scrollController,
                            itemCount: _results.length,
                            separatorBuilder: (_, __) =>
                                const Divider(height: 1),
                            itemBuilder: (ctx, index) {
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
                                  final rc = widget.readingContext;
                                  Navigator.of(context).pop();
                                  rc.goToChapter(r.chapterIndex);
                                  if (r.paragraphIndex >= 0 &&
                                      r.wordIndex >= 0) {
                                    rc.selectWord(
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

  int _wordIndexForOriginal(ParagraphAlignNode p, int charIndex, int matchLen) {
    final rawTokens = p.op
        .split(RegExp(r"\s+"))
        .map((w) => w.trim())
        .where((w) => w.isNotEmpty)
        .toList();
    int running = 0;
    int tokenIdx = -1;
    for (int i = 0; i < rawTokens.length; i++) {
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
    for (int wi = 0; wi < p.aw.length; wi++) {
      final node = p.aw[wi];
      if (node.iow.contains(tokenIdx)) {
        return wi;
      }
    }
    return -1;
  }

  int _wordIndexForTranslated(ParagraphAlignNode p, int charIndex) {
    for (int wi = 0; wi < p.aw.length; wi++) {
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
