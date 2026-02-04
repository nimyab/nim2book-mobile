// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_reading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookReadingState {

 String get bookId; List<ChapterAlignNode> get chapters; int get currentChapterIndex; int? get selectedParagraphIndex; int? get selectedWordIndex; Map<int, double> get chapterProgress; bool get prefsLoaded;
/// Create a copy of BookReadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookReadingStateCopyWith<BookReadingState> get copyWith => _$BookReadingStateCopyWithImpl<BookReadingState>(this as BookReadingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookReadingState&&(identical(other.bookId, bookId) || other.bookId == bookId)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.currentChapterIndex, currentChapterIndex) || other.currentChapterIndex == currentChapterIndex)&&(identical(other.selectedParagraphIndex, selectedParagraphIndex) || other.selectedParagraphIndex == selectedParagraphIndex)&&(identical(other.selectedWordIndex, selectedWordIndex) || other.selectedWordIndex == selectedWordIndex)&&const DeepCollectionEquality().equals(other.chapterProgress, chapterProgress)&&(identical(other.prefsLoaded, prefsLoaded) || other.prefsLoaded == prefsLoaded));
}


@override
int get hashCode => Object.hash(runtimeType,bookId,const DeepCollectionEquality().hash(chapters),currentChapterIndex,selectedParagraphIndex,selectedWordIndex,const DeepCollectionEquality().hash(chapterProgress),prefsLoaded);

@override
String toString() {
  return 'BookReadingState(bookId: $bookId, chapters: $chapters, currentChapterIndex: $currentChapterIndex, selectedParagraphIndex: $selectedParagraphIndex, selectedWordIndex: $selectedWordIndex, chapterProgress: $chapterProgress, prefsLoaded: $prefsLoaded)';
}


}

/// @nodoc
abstract mixin class $BookReadingStateCopyWith<$Res>  {
  factory $BookReadingStateCopyWith(BookReadingState value, $Res Function(BookReadingState) _then) = _$BookReadingStateCopyWithImpl;
@useResult
$Res call({
 String bookId, List<ChapterAlignNode> chapters, int currentChapterIndex, int? selectedParagraphIndex, int? selectedWordIndex, Map<int, double> chapterProgress, bool prefsLoaded
});




}
/// @nodoc
class _$BookReadingStateCopyWithImpl<$Res>
    implements $BookReadingStateCopyWith<$Res> {
  _$BookReadingStateCopyWithImpl(this._self, this._then);

  final BookReadingState _self;
  final $Res Function(BookReadingState) _then;

/// Create a copy of BookReadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookId = null,Object? chapters = null,Object? currentChapterIndex = null,Object? selectedParagraphIndex = freezed,Object? selectedWordIndex = freezed,Object? chapterProgress = null,Object? prefsLoaded = null,}) {
  return _then(_self.copyWith(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterAlignNode>,currentChapterIndex: null == currentChapterIndex ? _self.currentChapterIndex : currentChapterIndex // ignore: cast_nullable_to_non_nullable
as int,selectedParagraphIndex: freezed == selectedParagraphIndex ? _self.selectedParagraphIndex : selectedParagraphIndex // ignore: cast_nullable_to_non_nullable
as int?,selectedWordIndex: freezed == selectedWordIndex ? _self.selectedWordIndex : selectedWordIndex // ignore: cast_nullable_to_non_nullable
as int?,chapterProgress: null == chapterProgress ? _self.chapterProgress : chapterProgress // ignore: cast_nullable_to_non_nullable
as Map<int, double>,prefsLoaded: null == prefsLoaded ? _self.prefsLoaded : prefsLoaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BookReadingState].
extension BookReadingStatePatterns on BookReadingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookReadingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookReadingState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookReadingState value)  $default,){
final _that = this;
switch (_that) {
case _BookReadingState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookReadingState value)?  $default,){
final _that = this;
switch (_that) {
case _BookReadingState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookId,  List<ChapterAlignNode> chapters,  int currentChapterIndex,  int? selectedParagraphIndex,  int? selectedWordIndex,  Map<int, double> chapterProgress,  bool prefsLoaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookReadingState() when $default != null:
return $default(_that.bookId,_that.chapters,_that.currentChapterIndex,_that.selectedParagraphIndex,_that.selectedWordIndex,_that.chapterProgress,_that.prefsLoaded);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookId,  List<ChapterAlignNode> chapters,  int currentChapterIndex,  int? selectedParagraphIndex,  int? selectedWordIndex,  Map<int, double> chapterProgress,  bool prefsLoaded)  $default,) {final _that = this;
switch (_that) {
case _BookReadingState():
return $default(_that.bookId,_that.chapters,_that.currentChapterIndex,_that.selectedParagraphIndex,_that.selectedWordIndex,_that.chapterProgress,_that.prefsLoaded);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookId,  List<ChapterAlignNode> chapters,  int currentChapterIndex,  int? selectedParagraphIndex,  int? selectedWordIndex,  Map<int, double> chapterProgress,  bool prefsLoaded)?  $default,) {final _that = this;
switch (_that) {
case _BookReadingState() when $default != null:
return $default(_that.bookId,_that.chapters,_that.currentChapterIndex,_that.selectedParagraphIndex,_that.selectedWordIndex,_that.chapterProgress,_that.prefsLoaded);case _:
  return null;

}
}

}

/// @nodoc


class _BookReadingState implements BookReadingState {
  const _BookReadingState({required this.bookId, required final  List<ChapterAlignNode> chapters, required this.currentChapterIndex, required this.selectedParagraphIndex, required this.selectedWordIndex, required final  Map<int, double> chapterProgress, this.prefsLoaded = false}): _chapters = chapters,_chapterProgress = chapterProgress;
  

@override final  String bookId;
 final  List<ChapterAlignNode> _chapters;
@override List<ChapterAlignNode> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  int currentChapterIndex;
@override final  int? selectedParagraphIndex;
@override final  int? selectedWordIndex;
 final  Map<int, double> _chapterProgress;
@override Map<int, double> get chapterProgress {
  if (_chapterProgress is EqualUnmodifiableMapView) return _chapterProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_chapterProgress);
}

@override@JsonKey() final  bool prefsLoaded;

/// Create a copy of BookReadingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookReadingStateCopyWith<_BookReadingState> get copyWith => __$BookReadingStateCopyWithImpl<_BookReadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookReadingState&&(identical(other.bookId, bookId) || other.bookId == bookId)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.currentChapterIndex, currentChapterIndex) || other.currentChapterIndex == currentChapterIndex)&&(identical(other.selectedParagraphIndex, selectedParagraphIndex) || other.selectedParagraphIndex == selectedParagraphIndex)&&(identical(other.selectedWordIndex, selectedWordIndex) || other.selectedWordIndex == selectedWordIndex)&&const DeepCollectionEquality().equals(other._chapterProgress, _chapterProgress)&&(identical(other.prefsLoaded, prefsLoaded) || other.prefsLoaded == prefsLoaded));
}


@override
int get hashCode => Object.hash(runtimeType,bookId,const DeepCollectionEquality().hash(_chapters),currentChapterIndex,selectedParagraphIndex,selectedWordIndex,const DeepCollectionEquality().hash(_chapterProgress),prefsLoaded);

@override
String toString() {
  return 'BookReadingState(bookId: $bookId, chapters: $chapters, currentChapterIndex: $currentChapterIndex, selectedParagraphIndex: $selectedParagraphIndex, selectedWordIndex: $selectedWordIndex, chapterProgress: $chapterProgress, prefsLoaded: $prefsLoaded)';
}


}

/// @nodoc
abstract mixin class _$BookReadingStateCopyWith<$Res> implements $BookReadingStateCopyWith<$Res> {
  factory _$BookReadingStateCopyWith(_BookReadingState value, $Res Function(_BookReadingState) _then) = __$BookReadingStateCopyWithImpl;
@override @useResult
$Res call({
 String bookId, List<ChapterAlignNode> chapters, int currentChapterIndex, int? selectedParagraphIndex, int? selectedWordIndex, Map<int, double> chapterProgress, bool prefsLoaded
});




}
/// @nodoc
class __$BookReadingStateCopyWithImpl<$Res>
    implements _$BookReadingStateCopyWith<$Res> {
  __$BookReadingStateCopyWithImpl(this._self, this._then);

  final _BookReadingState _self;
  final $Res Function(_BookReadingState) _then;

/// Create a copy of BookReadingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookId = null,Object? chapters = null,Object? currentChapterIndex = null,Object? selectedParagraphIndex = freezed,Object? selectedWordIndex = freezed,Object? chapterProgress = null,Object? prefsLoaded = null,}) {
  return _then(_BookReadingState(
bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterAlignNode>,currentChapterIndex: null == currentChapterIndex ? _self.currentChapterIndex : currentChapterIndex // ignore: cast_nullable_to_non_nullable
as int,selectedParagraphIndex: freezed == selectedParagraphIndex ? _self.selectedParagraphIndex : selectedParagraphIndex // ignore: cast_nullable_to_non_nullable
as int?,selectedWordIndex: freezed == selectedWordIndex ? _self.selectedWordIndex : selectedWordIndex // ignore: cast_nullable_to_non_nullable
as int?,chapterProgress: null == chapterProgress ? _self._chapterProgress : chapterProgress // ignore: cast_nullable_to_non_nullable
as Map<int, double>,prefsLoaded: null == prefsLoaded ? _self.prefsLoaded : prefsLoaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
