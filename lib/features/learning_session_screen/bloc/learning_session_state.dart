import 'package:equatable/equatable.dart';

class LearningSessionState extends Equatable {
  final List<String> sessionWords;
  final int currentWordIndex;
  final bool showTranslation;
  final bool sessionEmpty;

  const LearningSessionState({
    required this.sessionWords,
    required this.currentWordIndex,
    this.showTranslation = false,
    this.sessionEmpty = false,
  });

  LearningSessionState copyWith({
    final List<String>? sessionWords,
    final int? currentWordIndex,
    final bool? showTranslation,
    final bool? sessionEmpty,
  }) {
    return LearningSessionState(
      sessionWords: sessionWords ?? this.sessionWords,
      currentWordIndex: currentWordIndex ?? this.currentWordIndex,
      showTranslation: showTranslation ?? this.showTranslation,
      sessionEmpty: sessionEmpty ?? this.sessionEmpty,
    );
  }

  @override
  List<Object?> get props => [
    sessionWords,
    currentWordIndex,
    showTranslation,
    sessionEmpty,
  ];
}
