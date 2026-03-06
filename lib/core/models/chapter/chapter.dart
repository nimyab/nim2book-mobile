import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
sealed class ChapterAlignNode with _$ChapterAlignNode {
  const factory ChapterAlignNode({
    required final String id,
    required final String title,
    required final String translatedTitle,
    required final int order,
    required final List<ContentNode> content,
  }) = _ChapterAlignNode;

  factory ChapterAlignNode.fromJson(final Map<String, dynamic> json) =>
      _$ChapterAlignNodeFromJson(json);
}

@Freezed(unionKey: 'type')
sealed class ContentNode with _$ContentNode {
  @FreezedUnionValue('paragraph')
  const factory ContentNode.paragraph({
    @JsonKey(name: 'pan') required ParagraphAlignNode paragraphAlignNode,
  }) = ContentNodeParagraph;

  @FreezedUnionValue('image')
  const factory ContentNode.image({
    @JsonKey(name: 'in') required ImageNode imageNode,
  }) = ContentNodeImage;

  factory ContentNode.fromJson(final Map<String, dynamic> json) =>
      _$ContentNodeFromJson(json);
}

@freezed
sealed class ImageNode with _$ImageNode {
  const factory ImageNode({
    required final String path,
    required final String alt,
  }) = _ImageNode;

  factory ImageNode.fromJson(final Map<String, dynamic> json) =>
      _$ImageNodeFromJson(json);
}

@freezed
sealed class ParagraphAlignNode with _$ParagraphAlignNode {
  const factory ParagraphAlignNode({
    required final String op,
    required final String tp,
    required final List<WordAlignNode> aw,
  }) = _ParagraphAlignNode;

  factory ParagraphAlignNode.fromJson(final Map<String, dynamic> json) =>
      _$ParagraphAlignNodeFromJson(json);
}

@freezed
sealed class WordAlignNode with _$WordAlignNode {
  const factory WordAlignNode({
    required final List<int> iow,
    required final List<int> itw,
  }) = _WordAlignNode;

  factory WordAlignNode.fromJson(final Map<String, dynamic> json) =>
      _$WordAlignNodeFromJson(json);
}
