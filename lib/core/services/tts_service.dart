import 'package:flutter_tts/flutter_tts.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _hasInit = false;
  final Talker _logger;

  TtsService(this._logger);

  Future<void> _ensureInit({final String? language}) async {
    if (!_hasInit) {
      await _tts.setLanguage(language ?? 'en-US');
      await _tts.setSpeechRate(0.45);
      await _tts.setPitch(1.0);
      _hasInit = true;
    } else if (language != null) {
      await _tts.setLanguage(language);
    }
  }

  Future<void> speak(final String text, {final String? language}) async {
    _logger.log('Speaking text: $text; with language: $language');
    await _ensureInit(language: language);
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> stop() async {
    await _tts.stop();
  }
}
