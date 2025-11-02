class SrsItem {
  final String word;
  final int repetition;
  final int intervalDays;
  final double easiness;
  final DateTime? lastReviewedAt;
  final DateTime nextReviewAt;

  const SrsItem({
    required this.word,
    required this.repetition,
    required this.intervalDays,
    required this.easiness,
    required this.lastReviewedAt,
    required this.nextReviewAt,
  });

  factory SrsItem.initial(final String word, {final DateTime? now}) {
    final n = now ?? DateTime.now();
    return SrsItem(
      word: word,
      repetition: 0,
      intervalDays: 0,
      easiness: 2.5,
      lastReviewedAt: null,
      nextReviewAt: n,
    );
  }

  SrsItem copyWith({
    final String? word,
    final int? repetition,
    final int? intervalDays,
    final double? easiness,
    final DateTime? lastReviewedAt,
    final DateTime? nextReviewAt,
  }) {
    return SrsItem(
      word: word ?? this.word,
      repetition: repetition ?? this.repetition,
      intervalDays: intervalDays ?? this.intervalDays,
      easiness: easiness ?? this.easiness,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
    );
  }

  factory SrsItem.fromJson(final Map<String, dynamic> json) {
    return SrsItem(
      word: json['word'] as String,
      repetition: json['repetition'] as int? ?? 0,
      intervalDays: json['intervalDays'] as int? ?? 0,
      easiness: (json['easiness'] as num?)?.toDouble() ?? 2.5,
      lastReviewedAt: json['lastReviewedAt'] != null
          ? DateTime.parse(json['lastReviewedAt'] as String)
          : null,
      nextReviewAt: DateTime.parse(json['nextReviewAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'repetition': repetition,
      'intervalDays': intervalDays,
      'easiness': easiness,
      'lastReviewedAt': lastReviewedAt?.toIso8601String(),
      'nextReviewAt': nextReviewAt.toIso8601String(),
    };
  }
}

enum SrsRating { again, hard, good, easy }
