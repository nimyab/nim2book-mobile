// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DictionaryWord _$DictionaryWordFromJson(Map<String, dynamic> json) =>
    _DictionaryWord(
      id: json['id'] as String,
      text: json['text'] as String,
      fromLangCode: json['fromLangCode'] as String,
      toLangCode: json['toLangCode'] as String,
      partOfSpeech: json['partOfSpeech'] as String,
      translations: (json['translations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      transcription: json['transcription'] as String?,
      examples: (json['examples'] as List<dynamic>)
          .map((e) => DictionaryExample.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictionaryWordToJson(_DictionaryWord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'fromLangCode': instance.fromLangCode,
      'toLangCode': instance.toLangCode,
      'partOfSpeech': instance.partOfSpeech,
      'translations': instance.translations,
      'transcription': instance.transcription,
      'examples': instance.examples,
    };

_DictionaryExample _$DictionaryExampleFromJson(Map<String, dynamic> json) =>
    _DictionaryExample(
      id: json['id'] as String,
      dictionaryID: json['dictionaryID'] as String,
      text: json['text'] as String,
      translatedText: json['translatedText'] as String,
      wordPositionStart: (json['wordPositionStart'] as num).toInt(),
      wordPositionEnd: (json['wordPositionEnd'] as num).toInt(),
    );

Map<String, dynamic> _$DictionaryExampleToJson(_DictionaryExample instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dictionaryID': instance.dictionaryID,
      'text': instance.text,
      'translatedText': instance.translatedText,
      'wordPositionStart': instance.wordPositionStart,
      'wordPositionEnd': instance.wordPositionEnd,
    };
