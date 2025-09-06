// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterAlignNode _$ChapterAlignNodeFromJson(Map<String, dynamic> json) =>
    _ChapterAlignNode(
      id: json['id'] as String,
      title: json['title'] as String,
      translatedTitle: json['translatedTitle'] as String,
      order: (json['order'] as num).toInt(),
      content: (json['content'] as List<dynamic>)
          .map((e) => ParagraphAlignNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChapterAlignNodeToJson(_ChapterAlignNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'translatedTitle': instance.translatedTitle,
      'order': instance.order,
      'content': instance.content,
    };

_ParagraphAlignNode _$ParagraphAlignNodeFromJson(Map<String, dynamic> json) =>
    _ParagraphAlignNode(
      op: json['op'] as String,
      tp: json['tp'] as String,
      aw: (json['aw'] as List<dynamic>)
          .map((e) => WordAlignNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParagraphAlignNodeToJson(_ParagraphAlignNode instance) =>
    <String, dynamic>{'op': instance.op, 'tp': instance.tp, 'aw': instance.aw};

_WordAlignNode _$WordAlignNodeFromJson(
  Map<String, dynamic> json,
) => _WordAlignNode(
  iow: (json['iow'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  itw: (json['itw'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$WordAlignNodeToJson(_WordAlignNode instance) =>
    <String, dynamic>{'iow': instance.iow, 'itw': instance.itw};
