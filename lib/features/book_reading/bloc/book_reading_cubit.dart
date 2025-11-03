import 'package:bloc/bloc.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookReadingState {
  final String bookId;
  final List<ChapterAlignNode> chapters;
  final int currentChapterIndex;
  final int? selectedParagraphIndex;
  final int? selectedWordIndex;
  final Map<int, double> chapterProgress;
  final bool prefsLoaded;

  const BookReadingState({
    required this.bookId,
    required this.chapters,
    required this.currentChapterIndex,
    required this.selectedParagraphIndex,
    required this.selectedWordIndex,
    required this.chapterProgress,
    this.prefsLoaded = false,
  });

  static const Object _noParam = Object();

  BookReadingState copyWith({
    final String? bookId,
    final List<ChapterAlignNode>? chapters,
    final int? currentChapterIndex,
    final Object? selectedParagraphIndex = _noParam,
    final Object? selectedWordIndex = _noParam,
    final Map<int, double>? chapterProgress,
    final bool? prefsLoaded,
  }) {
    final selectedParagraphIndex0 = selectedParagraphIndex == _noParam
        ? this.selectedParagraphIndex
        : selectedParagraphIndex as int?;
    final selectedWordIndex0 = selectedWordIndex == _noParam
        ? this.selectedWordIndex
        : selectedWordIndex as int?;

    return BookReadingState(
      bookId: bookId ?? this.bookId,
      chapters: chapters ?? this.chapters,
      currentChapterIndex: currentChapterIndex ?? this.currentChapterIndex,
      selectedParagraphIndex: selectedParagraphIndex0,
      selectedWordIndex: selectedWordIndex0,
      chapterProgress: chapterProgress ?? this.chapterProgress,
      prefsLoaded: prefsLoaded ?? this.prefsLoaded,
    );
  }

  @override
  String toString() {
    return 'BookReadingState(bookId: $bookId, chapterIndex: $currentChapterIndex, '
        'selection: ${selectedParagraphIndex ?? -1}:${selectedWordIndex ?? -1}, '
        'chapters: ${chapters.length}, progressKeys: ${chapterProgress.length}, '
        'prefsLoaded: $prefsLoaded)';
  }
}

class BookReadingCubit extends Cubit<BookReadingState> {
  BookReadingCubit({
    required final String bookId,
    required final List<ChapterAlignNode> chapters,
  }) : super(
         BookReadingState(
           bookId: bookId,
           chapters: chapters,
           currentChapterIndex: 0,
           selectedParagraphIndex: null,
           selectedWordIndex: null,
           chapterProgress: const {},
           prefsLoaded: false,
         ),
       );

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final chapterKey = _chapterIndexKey(state.bookId);
    final progressKey = _chapterProgressKey(state.bookId);
    final savedIndex = prefs.getInt(chapterKey);
    final savedProgress = prefs.getString(progressKey);

    final progress = <int, double>{};
    if (savedProgress != null && savedProgress.isNotEmpty) {
      // Simple "k:v;k:v" map serialization
      final pairs = savedProgress.split(';');
      for (final p in pairs) {
        final kv = p.split(':');
        if (kv.length == 2) {
          final k = int.tryParse(kv[0]);
          final v = double.tryParse(kv[1]);
          if (k != null && v != null) {
            progress[k] = v;
          }
        }
      }
    }

    emit(
      state.copyWith(
        currentChapterIndex: savedIndex ?? 0,
        chapterProgress: progress,
        selectedParagraphIndex: null,
        selectedWordIndex: null,
        prefsLoaded: true,
      ),
    );
  }

  void setChapters(final List<ChapterAlignNode> chapters) {
    emit(state.copyWith(chapters: chapters));
  }

  int get totalChapters => state.chapters.length;

  ChapterAlignNode? get currentChapter =>
      state.chapters.isEmpty ? null : state.chapters[state.currentChapterIndex];

  void goToChapter(final int index) {
    if (index < 0 || index >= state.chapters.length) return;
    emit(
      state.copyWith(
        currentChapterIndex: index,
        selectedParagraphIndex: null,
        selectedWordIndex: null,
      ),
    );
    _persistChapterIndex(index);
  }

  void goToNextChapter() {
    final next = state.currentChapterIndex + 1;
    if (next < state.chapters.length) {
      goToChapter(next);
    }
  }

  void goToPreviousChapter() {
    final prev = state.currentChapterIndex - 1;
    if (prev >= 0) {
      goToChapter(prev);
    }
  }

  void selectParagraph(final int paragraphIndex) {
    emit(
      state.copyWith(
        selectedParagraphIndex: paragraphIndex,
        selectedWordIndex: null,
      ),
    );
  }

  void selectWord(final int paragraphIndex, final int wordIndex) {
    emit(
      state.copyWith(
        selectedParagraphIndex: paragraphIndex,
        selectedWordIndex: wordIndex,
      ),
    );
  }

  void clearSelection() {
    emit(state.copyWith(selectedParagraphIndex: null, selectedWordIndex: null));
  }

  void setChapterProgress(final int chapterIndex, final double progress) {
    final map = Map<int, double>.from(state.chapterProgress);
    map[chapterIndex] = progress;
    emit(state.copyWith(chapterProgress: map));
    _persistChapterProgress(map);
  }

  double getChapterProgress(final int chapterIndex) {
    return state.chapterProgress[chapterIndex] ?? 0.0;
  }

  Future<void> _persistChapterIndex(final int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_chapterIndexKey(state.bookId), index);
  }

  Future<void> _persistChapterProgress(final Map<int, double> map) async {
    final prefs = await SharedPreferences.getInstance();
    final serialized = map.entries
        .map((final e) => '${e.key}:${(e.value).toStringAsFixed(6)}')
        .join(';');
    await prefs.setString(_chapterProgressKey(state.bookId), serialized);
  }

  String _chapterIndexKey(final String bookId) =>
      'reading_current_chapter_$bookId';
  String _chapterProgressKey(final String bookId) => 'reading_progress_$bookId';
}
