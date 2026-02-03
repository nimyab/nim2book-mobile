// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'srs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SrsState {

 List<String> get dueWords; int get totalDueCount; int get reviewedToday; int get currentStreak; int get longestStreak; int get dailyLimit; bool get isLoading;
/// Create a copy of SrsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SrsStateCopyWith<SrsState> get copyWith => _$SrsStateCopyWithImpl<SrsState>(this as SrsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SrsState&&const DeepCollectionEquality().equals(other.dueWords, dueWords)&&(identical(other.totalDueCount, totalDueCount) || other.totalDueCount == totalDueCount)&&(identical(other.reviewedToday, reviewedToday) || other.reviewedToday == reviewedToday)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dueWords),totalDueCount,reviewedToday,currentStreak,longestStreak,dailyLimit,isLoading);

@override
String toString() {
  return 'SrsState(dueWords: $dueWords, totalDueCount: $totalDueCount, reviewedToday: $reviewedToday, currentStreak: $currentStreak, longestStreak: $longestStreak, dailyLimit: $dailyLimit, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SrsStateCopyWith<$Res>  {
  factory $SrsStateCopyWith(SrsState value, $Res Function(SrsState) _then) = _$SrsStateCopyWithImpl;
@useResult
$Res call({
 List<String> dueWords, int totalDueCount, int reviewedToday, int currentStreak, int longestStreak, int dailyLimit, bool isLoading
});




}
/// @nodoc
class _$SrsStateCopyWithImpl<$Res>
    implements $SrsStateCopyWith<$Res> {
  _$SrsStateCopyWithImpl(this._self, this._then);

  final SrsState _self;
  final $Res Function(SrsState) _then;

/// Create a copy of SrsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dueWords = null,Object? totalDueCount = null,Object? reviewedToday = null,Object? currentStreak = null,Object? longestStreak = null,Object? dailyLimit = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
dueWords: null == dueWords ? _self.dueWords : dueWords // ignore: cast_nullable_to_non_nullable
as List<String>,totalDueCount: null == totalDueCount ? _self.totalDueCount : totalDueCount // ignore: cast_nullable_to_non_nullable
as int,reviewedToday: null == reviewedToday ? _self.reviewedToday : reviewedToday // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SrsState].
extension SrsStatePatterns on SrsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SrsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SrsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SrsState value)  $default,){
final _that = this;
switch (_that) {
case _SrsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SrsState value)?  $default,){
final _that = this;
switch (_that) {
case _SrsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> dueWords,  int totalDueCount,  int reviewedToday,  int currentStreak,  int longestStreak,  int dailyLimit,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SrsState() when $default != null:
return $default(_that.dueWords,_that.totalDueCount,_that.reviewedToday,_that.currentStreak,_that.longestStreak,_that.dailyLimit,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> dueWords,  int totalDueCount,  int reviewedToday,  int currentStreak,  int longestStreak,  int dailyLimit,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SrsState():
return $default(_that.dueWords,_that.totalDueCount,_that.reviewedToday,_that.currentStreak,_that.longestStreak,_that.dailyLimit,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> dueWords,  int totalDueCount,  int reviewedToday,  int currentStreak,  int longestStreak,  int dailyLimit,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SrsState() when $default != null:
return $default(_that.dueWords,_that.totalDueCount,_that.reviewedToday,_that.currentStreak,_that.longestStreak,_that.dailyLimit,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SrsState implements SrsState {
  const _SrsState({final  List<String> dueWords = const [], this.totalDueCount = 0, this.reviewedToday = 0, this.currentStreak = 0, this.longestStreak = 0, this.dailyLimit = 15, this.isLoading = false}): _dueWords = dueWords;
  

 final  List<String> _dueWords;
@override@JsonKey() List<String> get dueWords {
  if (_dueWords is EqualUnmodifiableListView) return _dueWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dueWords);
}

@override@JsonKey() final  int totalDueCount;
@override@JsonKey() final  int reviewedToday;
@override@JsonKey() final  int currentStreak;
@override@JsonKey() final  int longestStreak;
@override@JsonKey() final  int dailyLimit;
@override@JsonKey() final  bool isLoading;

/// Create a copy of SrsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SrsStateCopyWith<_SrsState> get copyWith => __$SrsStateCopyWithImpl<_SrsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SrsState&&const DeepCollectionEquality().equals(other._dueWords, _dueWords)&&(identical(other.totalDueCount, totalDueCount) || other.totalDueCount == totalDueCount)&&(identical(other.reviewedToday, reviewedToday) || other.reviewedToday == reviewedToday)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dueWords),totalDueCount,reviewedToday,currentStreak,longestStreak,dailyLimit,isLoading);

@override
String toString() {
  return 'SrsState(dueWords: $dueWords, totalDueCount: $totalDueCount, reviewedToday: $reviewedToday, currentStreak: $currentStreak, longestStreak: $longestStreak, dailyLimit: $dailyLimit, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SrsStateCopyWith<$Res> implements $SrsStateCopyWith<$Res> {
  factory _$SrsStateCopyWith(_SrsState value, $Res Function(_SrsState) _then) = __$SrsStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> dueWords, int totalDueCount, int reviewedToday, int currentStreak, int longestStreak, int dailyLimit, bool isLoading
});




}
/// @nodoc
class __$SrsStateCopyWithImpl<$Res>
    implements _$SrsStateCopyWith<$Res> {
  __$SrsStateCopyWithImpl(this._self, this._then);

  final _SrsState _self;
  final $Res Function(_SrsState) _then;

/// Create a copy of SrsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dueWords = null,Object? totalDueCount = null,Object? reviewedToday = null,Object? currentStreak = null,Object? longestStreak = null,Object? dailyLimit = null,Object? isLoading = null,}) {
  return _then(_SrsState(
dueWords: null == dueWords ? _self._dueWords : dueWords // ignore: cast_nullable_to_non_nullable
as List<String>,totalDueCount: null == totalDueCount ? _self.totalDueCount : totalDueCount // ignore: cast_nullable_to_non_nullable
as int,reviewedToday: null == reviewedToday ? _self.reviewedToday : reviewedToday // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
