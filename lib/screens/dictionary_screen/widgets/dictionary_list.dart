import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/dictionary_list_item.dart';

class DictionaryList extends StatelessWidget {
  final Map<String, List<DictionaryCard>> savedCards;

  const DictionaryList({super.key, required this.savedCards});

  @override
  Widget build(BuildContext context) {
    final flattenCards = savedCards.entries
        .map((e) => e.value)
        .expand((i) => i)
        .toList();

    return ListView.builder(
      itemCount: flattenCards.length,
      itemBuilder: (context, index) {
        final flattenCard = flattenCards[index];
        return DictionaryListItem(cardData: flattenCard);
      },
    );
  }
}
