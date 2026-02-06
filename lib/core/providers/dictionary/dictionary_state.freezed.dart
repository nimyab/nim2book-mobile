// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DictionaryState {

 int get dailyLimitNewWords; Map<String, List<DictionaryCard>> get savedCards;
/// Create a copy of DictionaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DictionaryStateCopyWith<DictionaryState> get copyWith => _$DictionaryStateCopyWithImpl<DictionaryState>(this as DictionaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DictionaryState&&(identical(other.dailyLimitNewWords, dailyLimitNewWords) || other.dailyLimitNewWords == dailyLimitNewWords)&&const DeepCollectionEquality().equals(other.savedCards, savedCards));
}


@override
int get hashCode => Object.hash(runtimeType,dailyLimitNewWords,const DeepCollectionEquality().hash(savedCards));

@override
String toString() {
  return 'DictionaryState(dailyLimitNewWords: $dailyLimitNewWords, savedCards: $savedCards)';
}


}

/// @nodoc
abstract mixin class $DictionaryStateCopyWith<$Res>  {
  factory $DictionaryStateCopyWith(DictionaryState value, $Res Function(DictionaryState) _then) = _$DictionaryStateCopyWithImpl;
@useResult
$Res call({
 int dailyLimitNewWords, Map<String, List<DictionaryCard>> savedCards
});




}
/// @nodoc
class _$DictionaryStateCopyWithImpl<$Res>
    implements $DictionaryStateCopyWith<$Res> {
  _$DictionaryStateCopyWithImpl(this._self, this._then);

  final DictionaryState _self;
  final $Res Function(DictionaryState) _then;

/// Create a copy of DictionaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyLimitNewWords = null,Object? savedCards = null,}) {
  return _then(_self.copyWith(
dailyLimitNewWords: null == dailyLimitNewWords ? _self.dailyLimitNewWords : dailyLimitNewWords // ignore: cast_nullable_to_non_nullable
as int,savedCards: null == savedCards ? _self.savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as Map<String, List<DictionaryCard>>,
  ));
}

}


/// Adds pattern-matching-related methods to [DictionaryState].
extension DictionaryStatePatterns on DictionaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DictionaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DictionaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DictionaryState value)  $default,){
final _that = this;
switch (_that) {
case _DictionaryState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DictionaryState value)?  $default,){
final _that = this;
switch (_that) {
case _DictionaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dailyLimitNewWords,  Map<String, List<DictionaryCard>> savedCards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DictionaryState() when $default != null:
return $default(_that.dailyLimitNewWords,_that.savedCards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dailyLimitNewWords,  Map<String, List<DictionaryCard>> savedCards)  $default,) {final _that = this;
switch (_that) {
case _DictionaryState():
return $default(_that.dailyLimitNewWords,_that.savedCards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dailyLimitNewWords,  Map<String, List<DictionaryCard>> savedCards)?  $default,) {final _that = this;
switch (_that) {
case _DictionaryState() when $default != null:
return $default(_that.dailyLimitNewWords,_that.savedCards);case _:
  return null;

}
}

}

/// @nodoc


class _DictionaryState implements DictionaryState {
  const _DictionaryState({required this.dailyLimitNewWords, final  Map<String, List<DictionaryCard>> savedCards = const {}}): _savedCards = savedCards;
  

@override final  int dailyLimitNewWords;
 final  Map<String, List<DictionaryCard>> _savedCards;
@override@JsonKey() Map<String, List<DictionaryCard>> get savedCards {
  if (_savedCards is EqualUnmodifiableMapView) return _savedCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_savedCards);
}


/// Create a copy of DictionaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DictionaryStateCopyWith<_DictionaryState> get copyWith => __$DictionaryStateCopyWithImpl<_DictionaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryState&&(identical(other.dailyLimitNewWords, dailyLimitNewWords) || other.dailyLimitNewWords == dailyLimitNewWords)&&const DeepCollectionEquality().equals(other._savedCards, _savedCards));
}


@override
int get hashCode => Object.hash(runtimeType,dailyLimitNewWords,const DeepCollectionEquality().hash(_savedCards));

@override
String toString() {
  return 'DictionaryState(dailyLimitNewWords: $dailyLimitNewWords, savedCards: $savedCards)';
}


}

/// @nodoc
abstract mixin class _$DictionaryStateCopyWith<$Res> implements $DictionaryStateCopyWith<$Res> {
  factory _$DictionaryStateCopyWith(_DictionaryState value, $Res Function(_DictionaryState) _then) = __$DictionaryStateCopyWithImpl;
@override @useResult
$Res call({
 int dailyLimitNewWords, Map<String, List<DictionaryCard>> savedCards
});




}
/// @nodoc
class __$DictionaryStateCopyWithImpl<$Res>
    implements _$DictionaryStateCopyWith<$Res> {
  __$DictionaryStateCopyWithImpl(this._self, this._then);

  final _DictionaryState _self;
  final $Res Function(_DictionaryState) _then;

/// Create a copy of DictionaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyLimitNewWords = null,Object? savedCards = null,}) {
  return _then(_DictionaryState(
dailyLimitNewWords: null == dailyLimitNewWords ? _self.dailyLimitNewWords : dailyLimitNewWords // ignore: cast_nullable_to_non_nullable
as int,savedCards: null == savedCards ? _self._savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as Map<String, List<DictionaryCard>>,
  ));
}


}

// dart format on
