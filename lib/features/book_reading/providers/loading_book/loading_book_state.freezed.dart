// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadingBookState {

 Book? get book; List<ChapterAlignNode?> get chapters; double get progress; bool get isLoading;
/// Create a copy of LoadingBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingBookStateCopyWith<LoadingBookState> get copyWith => _$LoadingBookStateCopyWithImpl<LoadingBookState>(this as LoadingBookState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingBookState&&(identical(other.book, book) || other.book == book)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,book,const DeepCollectionEquality().hash(chapters),progress,isLoading);

@override
String toString() {
  return 'LoadingBookState(book: $book, chapters: $chapters, progress: $progress, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $LoadingBookStateCopyWith<$Res>  {
  factory $LoadingBookStateCopyWith(LoadingBookState value, $Res Function(LoadingBookState) _then) = _$LoadingBookStateCopyWithImpl;
@useResult
$Res call({
 Book? book, List<ChapterAlignNode?> chapters, double progress, bool isLoading
});


$BookCopyWith<$Res>? get book;

}
/// @nodoc
class _$LoadingBookStateCopyWithImpl<$Res>
    implements $LoadingBookStateCopyWith<$Res> {
  _$LoadingBookStateCopyWithImpl(this._self, this._then);

  final LoadingBookState _self;
  final $Res Function(LoadingBookState) _then;

/// Create a copy of LoadingBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = freezed,Object? chapters = null,Object? progress = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book?,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterAlignNode?>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LoadingBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $BookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoadingBookState].
extension LoadingBookStatePatterns on LoadingBookState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadingBookState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadingBookState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadingBookState value)  $default,){
final _that = this;
switch (_that) {
case _LoadingBookState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadingBookState value)?  $default,){
final _that = this;
switch (_that) {
case _LoadingBookState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Book? book,  List<ChapterAlignNode?> chapters,  double progress,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadingBookState() when $default != null:
return $default(_that.book,_that.chapters,_that.progress,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Book? book,  List<ChapterAlignNode?> chapters,  double progress,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _LoadingBookState():
return $default(_that.book,_that.chapters,_that.progress,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Book? book,  List<ChapterAlignNode?> chapters,  double progress,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _LoadingBookState() when $default != null:
return $default(_that.book,_that.chapters,_that.progress,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _LoadingBookState implements LoadingBookState {
  const _LoadingBookState({this.book, final  List<ChapterAlignNode?> chapters = const [], this.progress = 0.0, this.isLoading = false}): _chapters = chapters;
  

@override final  Book? book;
 final  List<ChapterAlignNode?> _chapters;
@override@JsonKey() List<ChapterAlignNode?> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override@JsonKey() final  double progress;
@override@JsonKey() final  bool isLoading;

/// Create a copy of LoadingBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingBookStateCopyWith<_LoadingBookState> get copyWith => __$LoadingBookStateCopyWithImpl<_LoadingBookState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingBookState&&(identical(other.book, book) || other.book == book)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,book,const DeepCollectionEquality().hash(_chapters),progress,isLoading);

@override
String toString() {
  return 'LoadingBookState(book: $book, chapters: $chapters, progress: $progress, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$LoadingBookStateCopyWith<$Res> implements $LoadingBookStateCopyWith<$Res> {
  factory _$LoadingBookStateCopyWith(_LoadingBookState value, $Res Function(_LoadingBookState) _then) = __$LoadingBookStateCopyWithImpl;
@override @useResult
$Res call({
 Book? book, List<ChapterAlignNode?> chapters, double progress, bool isLoading
});


@override $BookCopyWith<$Res>? get book;

}
/// @nodoc
class __$LoadingBookStateCopyWithImpl<$Res>
    implements _$LoadingBookStateCopyWith<$Res> {
  __$LoadingBookStateCopyWithImpl(this._self, this._then);

  final _LoadingBookState _self;
  final $Res Function(_LoadingBookState) _then;

/// Create a copy of LoadingBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = freezed,Object? chapters = null,Object? progress = null,Object? isLoading = null,}) {
  return _then(_LoadingBookState(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book?,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterAlignNode?>,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LoadingBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $BookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

// dart format on
