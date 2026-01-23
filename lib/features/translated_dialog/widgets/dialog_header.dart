import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';

class DialogHeader extends StatelessWidget {
  final String phrase;
  final String? transcription;
  final Color headerColor;
  final Color textColor;
  final Color secondaryTextColor;

  const DialogHeader({
    super.key,
    required this.phrase,
    this.transcription,
    required this.headerColor,
    required this.textColor,
    required this.secondaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => GetIt.I.get<TtsService>().speak(phrase),
                  child: Text(
                    phrase,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                if (transcription != null)
                  Text(
                    '[$transcription]',
                    style: TextStyle(fontSize: 14, color: secondaryTextColor),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            color: textColor,
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
