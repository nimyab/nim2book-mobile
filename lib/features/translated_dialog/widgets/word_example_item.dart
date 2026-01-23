import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';

class WordExampleItem extends StatelessWidget {
  final DictionaryExample example;
  final Color secondaryTextColor;

  const WordExampleItem({
    super.key,
    required this.example,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            example.text,
            style: TextStyle(
              fontSize: 13,
              color: secondaryTextColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          if (example.translatedText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '— ${example.translatedText}',
                style: TextStyle(
                  fontSize: 13,
                  color: secondaryTextColor.withValues(alpha: 0.8),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
