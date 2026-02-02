import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';

part 'dictionary_card.freezed.dart';

@freezed
abstract class DictionaryCard with _$DictionaryCard {
  const DictionaryCard._();

  const factory DictionaryCard({
    required final DictionaryWord wordData,
    required final Card fsrsCard,
  }) = _DictionaryCard;

  factory DictionaryCard.fromJson(final Map<String, dynamic> json) {
    return DictionaryCard(
      wordData: DictionaryWord.fromJson(
        json['wordData'] as Map<String, dynamic>,
      ),
      fsrsCard: Card.fromMap(json['fsrsCard'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'wordData': wordData.toJson(), 'fsrsCard': fsrsCard.toMap()};
  }
}
