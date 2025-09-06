// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Definition _$DefinitionFromJson(Map<String, dynamic> json) => _Definition(
  text: json['text'] as String,
  tr: (json['tr'] as List<dynamic>)
      .map((e) => Translation.fromJson(e as Map<String, dynamic>))
      .toList(),
  pos: json['pos'] as String?,
  ts: json['ts'] as String?,
);

Map<String, dynamic> _$DefinitionToJson(_Definition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'tr': instance.tr,
      'pos': instance.pos,
      'ts': instance.ts,
    };

_Translation _$TranslationFromJson(Map<String, dynamic> json) => _Translation(
  text: json['text'] as String,
  pos: json['pos'] as String?,
  mean: (json['mean'] as List<dynamic>?)
      ?.map((e) => Mean.fromJson(e as Map<String, dynamic>))
      .toList(),
  ex: (json['ex'] as List<dynamic>?)
      ?.map((e) => Example.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TranslationToJson(_Translation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'pos': instance.pos,
      'mean': instance.mean,
      'ex': instance.ex,
    };

_Mean _$MeanFromJson(Map<String, dynamic> json) =>
    _Mean(text: json['text'] as String);

Map<String, dynamic> _$MeanToJson(_Mean instance) => <String, dynamic>{
  'text': instance.text,
};

_Example _$ExampleFromJson(Map<String, dynamic> json) => _Example(
  text: json['text'] as String,
  tr: (json['tr'] as List<dynamic>?)
      ?.map((e) => ExampleTranslation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExampleToJson(_Example instance) => <String, dynamic>{
  'text': instance.text,
  'tr': instance.tr,
};

_ExampleTranslation _$ExampleTranslationFromJson(Map<String, dynamic> json) =>
    _ExampleTranslation(text: json['text'] as String);

Map<String, dynamic> _$ExampleTranslationToJson(_ExampleTranslation instance) =>
    <String, dynamic>{'text': instance.text};
