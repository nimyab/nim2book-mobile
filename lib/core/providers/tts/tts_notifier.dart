import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/tts/tts_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/tts_service.dart';

class TtsNotifier extends AutoDisposeNotifier<TtsState> {
  late final TtsService _ttsService;

  @override
  TtsState build() {
    final service = ref.watch(ttsServiceProvider);
    _ttsService = service;
    return const TtsState();
  }

  Future<void> speak(String text, {String? language}) async {
    if (state.isPlaying) {
      await stop();
    }

    state = state.copyWith(
      currentText: text,
      isPlaying: true,
      errorMessage: null,
      language: language ?? state.language,
    );

    try {
      await _ttsService.speak(text, language: language ?? state.language);
      state = state.copyWith(isPlaying: false);
    } catch (e) {
      state = state.copyWith(isPlaying: false, errorMessage: e.toString());
    }
  }

  Future<void> stop() async {
    try {
      await _ttsService.stop();
      state = state.copyWith(isPlaying: false, currentText: null);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void setLanguage(String language) {
    state = state.copyWith(language: language);
  }

  bool get isPlaying => state.isPlaying;
  String? get currentText => state.currentText;
}

final ttsNotifierProvider = AutoDisposeNotifierProvider<TtsNotifier, TtsState>(
  TtsNotifier.new,
);
