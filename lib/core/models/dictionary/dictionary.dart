import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary.freezed.dart';
part 'dictionary.g.dart';

@freezed
abstract class DictionaryWord with _$DictionaryWord {
  const factory DictionaryWord({
    required final String id,
    required final String text,
    required final String fromLangCode,
    required final String toLangCode,
    final String? partOfSpeech,
    final String? transcription,
    final List<String>? translations,
    final List<DictionaryExample>? examples,
  }) = _DictionaryWord;

  factory DictionaryWord.fromJson(final Map<String, dynamic> json) =>
      _$DictionaryWordFromJson(json);
}

@freezed
abstract class DictionaryExample with _$DictionaryExample {
  const factory DictionaryExample({
    required final String id,
    required final String dictionaryID,
    required final String text,
    required final String translatedText,
    required final int wordPositionStart,
    required final int wordPositionEnd,
  }) = _DictionaryExample;

  factory DictionaryExample.fromJson(final Map<String, dynamic> json) =>
      _$DictionaryExampleFromJson(json);
}
