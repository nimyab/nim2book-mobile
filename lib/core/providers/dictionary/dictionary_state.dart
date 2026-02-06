import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';

part 'dictionary_state.freezed.dart';

@freezed
sealed class DictionaryState with _$DictionaryState {
  const factory DictionaryState({
    @Default([]) final List<DictionaryCard> savedCards,
  }) = _DictionaryState;
}
