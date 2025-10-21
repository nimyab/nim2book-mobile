import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary.freezed.dart';
part 'dictionary.g.dart';

@freezed
abstract class Definition with _$Definition {
  const factory Definition({
    required String text,
    required List<Translation> tr,
    String? pos,
    String? ts,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}

@freezed
abstract class Translation with _$Translation {
  const factory Translation({
    required String text,
    String? pos,
    List<Mean>? mean,
    List<Example>? ex,
  }) = _Translation;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}

@freezed
abstract class Mean with _$Mean {
  const factory Mean({required String text}) = _Mean;

  factory Mean.fromJson(Map<String, dynamic> json) => _$MeanFromJson(json);
}

@freezed
abstract class Example with _$Example {
  const factory Example({required String text, List<ExampleTranslation>? tr}) =
      _Example;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@freezed
abstract class ExampleTranslation with _$ExampleTranslation {
  const factory ExampleTranslation({required String text}) =
      _ExampleTranslation;

  factory ExampleTranslation.fromJson(Map<String, dynamic> json) =>
      _$ExampleTranslationFromJson(json);
}
