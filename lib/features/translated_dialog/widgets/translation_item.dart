import 'package:flutter/material.dart';

class TranslationItem extends StatelessWidget {
  final String translation;
  final Color textColor;
  final Color secondaryTextColor;

  const TranslationItem({
    super.key,
    required this.translation,
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('- ', style: TextStyle(fontSize: 16, color: secondaryTextColor)),
          Expanded(
            child: Text(
              translation,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
