import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class ChapterAlignNode with _$ChapterAlignNode {
  const factory ChapterAlignNode({
    required final String id,
    required final String title,
    required final String translatedTitle,
    required final int order,
    required final List<ParagraphAlignNode> content,
  }) = _ChapterAlignNode;

  factory ChapterAlignNode.fromJson(final Map<String, dynamic> json) =>
      _$ChapterAlignNodeFromJson(json);
}

@freezed
abstract class ParagraphAlignNode with _$ParagraphAlignNode {
  const factory ParagraphAlignNode({
    required final String op,
    required final String tp,
    required final List<WordAlignNode> aw,
  }) = _ParagraphAlignNode;

  factory ParagraphAlignNode.fromJson(final Map<String, dynamic> json) =>
      _$ParagraphAlignNodeFromJson(json);
}

@freezed
abstract class WordAlignNode with _$WordAlignNode {
  const factory WordAlignNode({
    required final List<int> iow,
    required final List<int> itw,
  }) = _WordAlignNode;

  factory WordAlignNode.fromJson(final Map<String, dynamic> json) =>
      _$WordAlignNodeFromJson(json);
}
