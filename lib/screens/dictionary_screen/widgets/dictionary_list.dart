import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/dictionary_list_item.dart';

class DictionaryList extends StatelessWidget {
  final List<DictionaryCard> savedCards;

  const DictionaryList({super.key, required this.savedCards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savedCards.length,
      itemBuilder: (context, index) {
        final flattenCard = savedCards[index];
        return DictionaryListItem(cardData: flattenCard);
      },
    );
  }
}
