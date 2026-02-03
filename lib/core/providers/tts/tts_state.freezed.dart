// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TtsState {

 bool get isPlaying; String get language; String? get currentText; String? get errorMessage;
/// Create a copy of TtsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TtsStateCopyWith<TtsState> get copyWith => _$TtsStateCopyWithImpl<TtsState>(this as TtsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TtsState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.language, language) || other.language == language)&&(identical(other.currentText, currentText) || other.currentText == currentText)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,language,currentText,errorMessage);

@override
String toString() {
  return 'TtsState(isPlaying: $isPlaying, language: $language, currentText: $currentText, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TtsStateCopyWith<$Res>  {
  factory $TtsStateCopyWith(TtsState value, $Res Function(TtsState) _then) = _$TtsStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, String language, String? currentText, String? errorMessage
});




}
/// @nodoc
class _$TtsStateCopyWithImpl<$Res>
    implements $TtsStateCopyWith<$Res> {
  _$TtsStateCopyWithImpl(this._self, this._then);

  final TtsState _self;
  final $Res Function(TtsState) _then;

/// Create a copy of TtsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? language = null,Object? currentText = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,currentText: freezed == currentText ? _self.currentText : currentText // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TtsState].
extension TtsStatePatterns on TtsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TtsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TtsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TtsState value)  $default,){
final _that = this;
switch (_that) {
case _TtsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TtsState value)?  $default,){
final _that = this;
switch (_that) {
case _TtsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  String language,  String? currentText,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TtsState() when $default != null:
return $default(_that.isPlaying,_that.language,_that.currentText,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  String language,  String? currentText,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TtsState():
return $default(_that.isPlaying,_that.language,_that.currentText,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  String language,  String? currentText,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TtsState() when $default != null:
return $default(_that.isPlaying,_that.language,_that.currentText,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TtsState implements TtsState {
  const _TtsState({this.isPlaying = false, this.language = 'zh-CN', this.currentText, this.errorMessage});
  

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  String language;
@override final  String? currentText;
@override final  String? errorMessage;

/// Create a copy of TtsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TtsStateCopyWith<_TtsState> get copyWith => __$TtsStateCopyWithImpl<_TtsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TtsState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.language, language) || other.language == language)&&(identical(other.currentText, currentText) || other.currentText == currentText)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,language,currentText,errorMessage);

@override
String toString() {
  return 'TtsState(isPlaying: $isPlaying, language: $language, currentText: $currentText, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TtsStateCopyWith<$Res> implements $TtsStateCopyWith<$Res> {
  factory _$TtsStateCopyWith(_TtsState value, $Res Function(_TtsState) _then) = __$TtsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, String language, String? currentText, String? errorMessage
});




}
/// @nodoc
class __$TtsStateCopyWithImpl<$Res>
    implements _$TtsStateCopyWith<$Res> {
  __$TtsStateCopyWithImpl(this._self, this._then);

  final _TtsState _self;
  final $Res Function(_TtsState) _then;

/// Create a copy of TtsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? language = null,Object? currentText = freezed,Object? errorMessage = freezed,}) {
  return _then(_TtsState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,currentText: freezed == currentText ? _self.currentText : currentText // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
