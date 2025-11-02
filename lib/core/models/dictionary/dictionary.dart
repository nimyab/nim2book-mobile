import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary.freezed.dart';
part 'dictionary.g.dart';

@freezed
abstract class Definition with _$Definition {
  const factory Definition({
    required final String text,
    required final List<Translation> tr,
    final String? pos,
    final String? ts,
  }) = _Definition;

  factory Definition.fromJson(final Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}

@freezed
abstract class Translation with _$Translation {
  const factory Translation({
    required final String text,
    final String? pos,
    final List<Mean>? mean,
    final List<Example>? ex,
  }) = _Translation;

  factory Translation.fromJson(final Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}

@freezed
abstract class Mean with _$Mean {
  const factory Mean({required final String text}) = _Mean;

  factory Mean.fromJson(final Map<String, dynamic> json) =>
      _$MeanFromJson(json);
}

@freezed
abstract class Example with _$Example {
  const factory Example({
    required final String text,
    final List<ExampleTranslation>? tr,
  }) = _Example;

  factory Example.fromJson(final Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@freezed
abstract class ExampleTranslation with _$ExampleTranslation {
  const factory ExampleTranslation({required final String text}) =
      _ExampleTranslation;

  factory ExampleTranslation.fromJson(final Map<String, dynamic> json) =>
      _$ExampleTranslationFromJson(json);
}
