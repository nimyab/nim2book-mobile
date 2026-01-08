// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearningSessionState {

 List<String> get sessionWords; int get currentWordIndex; bool get showTranslation; bool get sessionEmpty; int get totalWordsStudied; int get initialSessionSize;
/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningSessionStateCopyWith<LearningSessionState> get copyWith => _$LearningSessionStateCopyWithImpl<LearningSessionState>(this as LearningSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningSessionState&&const DeepCollectionEquality().equals(other.sessionWords, sessionWords)&&(identical(other.currentWordIndex, currentWordIndex) || other.currentWordIndex == currentWordIndex)&&(identical(other.showTranslation, showTranslation) || other.showTranslation == showTranslation)&&(identical(other.sessionEmpty, sessionEmpty) || other.sessionEmpty == sessionEmpty)&&(identical(other.totalWordsStudied, totalWordsStudied) || other.totalWordsStudied == totalWordsStudied)&&(identical(other.initialSessionSize, initialSessionSize) || other.initialSessionSize == initialSessionSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessionWords),currentWordIndex,showTranslation,sessionEmpty,totalWordsStudied,initialSessionSize);

@override
String toString() {
  return 'LearningSessionState(sessionWords: $sessionWords, currentWordIndex: $currentWordIndex, showTranslation: $showTranslation, sessionEmpty: $sessionEmpty, totalWordsStudied: $totalWordsStudied, initialSessionSize: $initialSessionSize)';
}


}

/// @nodoc
abstract mixin class $LearningSessionStateCopyWith<$Res>  {
  factory $LearningSessionStateCopyWith(LearningSessionState value, $Res Function(LearningSessionState) _then) = _$LearningSessionStateCopyWithImpl;
@useResult
$Res call({
 List<String> sessionWords, int currentWordIndex, bool showTranslation, bool sessionEmpty, int totalWordsStudied, int initialSessionSize
});




}
/// @nodoc
class _$LearningSessionStateCopyWithImpl<$Res>
    implements $LearningSessionStateCopyWith<$Res> {
  _$LearningSessionStateCopyWithImpl(this._self, this._then);

  final LearningSessionState _self;
  final $Res Function(LearningSessionState) _then;

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionWords = null,Object? currentWordIndex = null,Object? showTranslation = null,Object? sessionEmpty = null,Object? totalWordsStudied = null,Object? initialSessionSize = null,}) {
  return _then(_self.copyWith(
sessionWords: null == sessionWords ? _self.sessionWords : sessionWords // ignore: cast_nullable_to_non_nullable
as List<String>,currentWordIndex: null == currentWordIndex ? _self.currentWordIndex : currentWordIndex // ignore: cast_nullable_to_non_nullable
as int,showTranslation: null == showTranslation ? _self.showTranslation : showTranslation // ignore: cast_nullable_to_non_nullable
as bool,sessionEmpty: null == sessionEmpty ? _self.sessionEmpty : sessionEmpty // ignore: cast_nullable_to_non_nullable
as bool,totalWordsStudied: null == totalWordsStudied ? _self.totalWordsStudied : totalWordsStudied // ignore: cast_nullable_to_non_nullable
as int,initialSessionSize: null == initialSessionSize ? _self.initialSessionSize : initialSessionSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningSessionState].
extension LearningSessionStatePatterns on LearningSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningSessionState value)  $default,){
final _that = this;
switch (_that) {
case _LearningSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _LearningSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> sessionWords,  int currentWordIndex,  bool showTranslation,  bool sessionEmpty,  int totalWordsStudied,  int initialSessionSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningSessionState() when $default != null:
return $default(_that.sessionWords,_that.currentWordIndex,_that.showTranslation,_that.sessionEmpty,_that.totalWordsStudied,_that.initialSessionSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> sessionWords,  int currentWordIndex,  bool showTranslation,  bool sessionEmpty,  int totalWordsStudied,  int initialSessionSize)  $default,) {final _that = this;
switch (_that) {
case _LearningSessionState():
return $default(_that.sessionWords,_that.currentWordIndex,_that.showTranslation,_that.sessionEmpty,_that.totalWordsStudied,_that.initialSessionSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> sessionWords,  int currentWordIndex,  bool showTranslation,  bool sessionEmpty,  int totalWordsStudied,  int initialSessionSize)?  $default,) {final _that = this;
switch (_that) {
case _LearningSessionState() when $default != null:
return $default(_that.sessionWords,_that.currentWordIndex,_that.showTranslation,_that.sessionEmpty,_that.totalWordsStudied,_that.initialSessionSize);case _:
  return null;

}
}

}

/// @nodoc


class _LearningSessionState implements LearningSessionState {
  const _LearningSessionState({required final  List<String> sessionWords, required this.currentWordIndex, this.showTranslation = false, this.sessionEmpty = false, this.totalWordsStudied = 0, this.initialSessionSize = 0}): _sessionWords = sessionWords;
  

 final  List<String> _sessionWords;
@override List<String> get sessionWords {
  if (_sessionWords is EqualUnmodifiableListView) return _sessionWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessionWords);
}

@override final  int currentWordIndex;
@override@JsonKey() final  bool showTranslation;
@override@JsonKey() final  bool sessionEmpty;
@override@JsonKey() final  int totalWordsStudied;
@override@JsonKey() final  int initialSessionSize;

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningSessionStateCopyWith<_LearningSessionState> get copyWith => __$LearningSessionStateCopyWithImpl<_LearningSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningSessionState&&const DeepCollectionEquality().equals(other._sessionWords, _sessionWords)&&(identical(other.currentWordIndex, currentWordIndex) || other.currentWordIndex == currentWordIndex)&&(identical(other.showTranslation, showTranslation) || other.showTranslation == showTranslation)&&(identical(other.sessionEmpty, sessionEmpty) || other.sessionEmpty == sessionEmpty)&&(identical(other.totalWordsStudied, totalWordsStudied) || other.totalWordsStudied == totalWordsStudied)&&(identical(other.initialSessionSize, initialSessionSize) || other.initialSessionSize == initialSessionSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessionWords),currentWordIndex,showTranslation,sessionEmpty,totalWordsStudied,initialSessionSize);

@override
String toString() {
  return 'LearningSessionState(sessionWords: $sessionWords, currentWordIndex: $currentWordIndex, showTranslation: $showTranslation, sessionEmpty: $sessionEmpty, totalWordsStudied: $totalWordsStudied, initialSessionSize: $initialSessionSize)';
}


}

/// @nodoc
abstract mixin class _$LearningSessionStateCopyWith<$Res> implements $LearningSessionStateCopyWith<$Res> {
  factory _$LearningSessionStateCopyWith(_LearningSessionState value, $Res Function(_LearningSessionState) _then) = __$LearningSessionStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> sessionWords, int currentWordIndex, bool showTranslation, bool sessionEmpty, int totalWordsStudied, int initialSessionSize
});




}
/// @nodoc
class __$LearningSessionStateCopyWithImpl<$Res>
    implements _$LearningSessionStateCopyWith<$Res> {
  __$LearningSessionStateCopyWithImpl(this._self, this._then);

  final _LearningSessionState _self;
  final $Res Function(_LearningSessionState) _then;

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionWords = null,Object? currentWordIndex = null,Object? showTranslation = null,Object? sessionEmpty = null,Object? totalWordsStudied = null,Object? initialSessionSize = null,}) {
  return _then(_LearningSessionState(
sessionWords: null == sessionWords ? _self._sessionWords : sessionWords // ignore: cast_nullable_to_non_nullable
as List<String>,currentWordIndex: null == currentWordIndex ? _self.currentWordIndex : currentWordIndex // ignore: cast_nullable_to_non_nullable
as int,showTranslation: null == showTranslation ? _self.showTranslation : showTranslation // ignore: cast_nullable_to_non_nullable
as bool,sessionEmpty: null == sessionEmpty ? _self.sessionEmpty : sessionEmpty // ignore: cast_nullable_to_non_nullable
as bool,totalWordsStudied: null == totalWordsStudied ? _self.totalWordsStudied : totalWordsStudied // ignore: cast_nullable_to_non_nullable
as int,initialSessionSize: null == initialSessionSize ? _self.initialSessionSize : initialSessionSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
