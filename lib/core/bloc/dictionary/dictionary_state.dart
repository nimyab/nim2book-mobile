import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';

part 'dictionary_state.freezed.dart';

@freezed
abstract class DictionaryState with _$DictionaryState {
  const factory DictionaryState({
    @Default({}) final Map<String, List<Definition>> savedWords,
    @Default(false) final bool isLoading,
  }) = _DictionaryState;
}
