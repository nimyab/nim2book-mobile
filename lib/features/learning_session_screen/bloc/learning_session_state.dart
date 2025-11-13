import 'package:equatable/equatable.dart';

class LearningSessionState extends Equatable {
  final List<String> sessionWords;
  final int currentWordIndex;
  final bool showTranslation;
  final bool sessionEmpty;
  final int totalWordsStudied;
  final int initialSessionSize;

  const LearningSessionState({
    required this.sessionWords,
    required this.currentWordIndex,
    this.showTranslation = false,
    this.sessionEmpty = false,
    this.totalWordsStudied = 0,
    this.initialSessionSize = 0,
  });

  LearningSessionState copyWith({
    final List<String>? sessionWords,
    final int? currentWordIndex,
    final bool? showTranslation,
    final bool? sessionEmpty,
    final int? totalWordsStudied,
    final int? initialSessionSize,
  }) {
    return LearningSessionState(
      sessionWords: sessionWords ?? this.sessionWords,
      currentWordIndex: currentWordIndex ?? this.currentWordIndex,
      showTranslation: showTranslation ?? this.showTranslation,
      sessionEmpty: sessionEmpty ?? this.sessionEmpty,
      totalWordsStudied: totalWordsStudied ?? this.totalWordsStudied,
      initialSessionSize: initialSessionSize ?? this.initialSessionSize,
    );
  }

  @override
  List<Object?> get props => [
    sessionWords,
    currentWordIndex,
    showTranslation,
    sessionEmpty,
    totalWordsStudied,
    initialSessionSize,
  ];
}
