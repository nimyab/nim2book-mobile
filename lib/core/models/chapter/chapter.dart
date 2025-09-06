import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class ChapterAlignNode with _$ChapterAlignNode {
  const factory ChapterAlignNode({
    required String id,
    required String title,
    required String translatedTitle,
    required int order,
    required List<ParagraphAlignNode> content,
  }) = _ChapterAlignNode;

  factory ChapterAlignNode.fromJson(Map<String, dynamic> json) => 
      _$ChapterAlignNodeFromJson(json);
}

@freezed
abstract class ParagraphAlignNode with _$ParagraphAlignNode {
  const factory ParagraphAlignNode({
    required String op,
    required String tp,
    required List<WordAlignNode> aw,
  }) = _ParagraphAlignNode;

  factory ParagraphAlignNode.fromJson(Map<String, dynamic> json) => 
      _$ParagraphAlignNodeFromJson(json);
}

@freezed
abstract class WordAlignNode with _$WordAlignNode {
  const factory WordAlignNode({
    required List<int> iow,
    required List<int> itw,
  }) = _WordAlignNode;

  factory WordAlignNode.fromJson(Map<String, dynamic> json) => 
      _$WordAlignNodeFromJson(json);
}