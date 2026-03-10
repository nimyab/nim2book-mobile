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

 DictionaryCard? get currentCard; bool get isLoading; bool get showTranslation;
/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningSessionStateCopyWith<LearningSessionState> get copyWith => _$LearningSessionStateCopyWithImpl<LearningSessionState>(this as LearningSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningSessionState&&(identical(other.currentCard, currentCard) || other.currentCard == currentCard)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.showTranslation, showTranslation) || other.showTranslation == showTranslation));
}


@override
int get hashCode => Object.hash(runtimeType,currentCard,isLoading,showTranslation);

@override
String toString() {
  return 'LearningSessionState(currentCard: $currentCard, isLoading: $isLoading, showTranslation: $showTranslation)';
}


}

/// @nodoc
abstract mixin class $LearningSessionStateCopyWith<$Res>  {
  factory $LearningSessionStateCopyWith(LearningSessionState value, $Res Function(LearningSessionState) _then) = _$LearningSessionStateCopyWithImpl;
@useResult
$Res call({
 DictionaryCard? currentCard, bool isLoading, bool showTranslation
});


$DictionaryCardCopyWith<$Res>? get currentCard;

}
/// @nodoc
class _$LearningSessionStateCopyWithImpl<$Res>
    implements $LearningSessionStateCopyWith<$Res> {
  _$LearningSessionStateCopyWithImpl(this._self, this._then);

  final LearningSessionState _self;
  final $Res Function(LearningSessionState) _then;

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentCard = freezed,Object? isLoading = null,Object? showTranslation = null,}) {
  return _then(_self.copyWith(
currentCard: freezed == currentCard ? _self.currentCard : currentCard // ignore: cast_nullable_to_non_nullable
as DictionaryCard?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,showTranslation: null == showTranslation ? _self.showTranslation : showTranslation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DictionaryCardCopyWith<$Res>? get currentCard {
    if (_self.currentCard == null) {
    return null;
  }

  return $DictionaryCardCopyWith<$Res>(_self.currentCard!, (value) {
    return _then(_self.copyWith(currentCard: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DictionaryCard? currentCard,  bool isLoading,  bool showTranslation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningSessionState() when $default != null:
return $default(_that.currentCard,_that.isLoading,_that.showTranslation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DictionaryCard? currentCard,  bool isLoading,  bool showTranslation)  $default,) {final _that = this;
switch (_that) {
case _LearningSessionState():
return $default(_that.currentCard,_that.isLoading,_that.showTranslation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DictionaryCard? currentCard,  bool isLoading,  bool showTranslation)?  $default,) {final _that = this;
switch (_that) {
case _LearningSessionState() when $default != null:
return $default(_that.currentCard,_that.isLoading,_that.showTranslation);case _:
  return null;

}
}

}

/// @nodoc


class _LearningSessionState implements LearningSessionState {
  const _LearningSessionState({required this.currentCard, this.isLoading = false, this.showTranslation = false});
  

@override final  DictionaryCard? currentCard;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool showTranslation;

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningSessionStateCopyWith<_LearningSessionState> get copyWith => __$LearningSessionStateCopyWithImpl<_LearningSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningSessionState&&(identical(other.currentCard, currentCard) || other.currentCard == currentCard)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.showTranslation, showTranslation) || other.showTranslation == showTranslation));
}


@override
int get hashCode => Object.hash(runtimeType,currentCard,isLoading,showTranslation);

@override
String toString() {
  return 'LearningSessionState(currentCard: $currentCard, isLoading: $isLoading, showTranslation: $showTranslation)';
}


}

/// @nodoc
abstract mixin class _$LearningSessionStateCopyWith<$Res> implements $LearningSessionStateCopyWith<$Res> {
  factory _$LearningSessionStateCopyWith(_LearningSessionState value, $Res Function(_LearningSessionState) _then) = __$LearningSessionStateCopyWithImpl;
@override @useResult
$Res call({
 DictionaryCard? currentCard, bool isLoading, bool showTranslation
});


@override $DictionaryCardCopyWith<$Res>? get currentCard;

}
/// @nodoc
class __$LearningSessionStateCopyWithImpl<$Res>
    implements _$LearningSessionStateCopyWith<$Res> {
  __$LearningSessionStateCopyWithImpl(this._self, this._then);

  final _LearningSessionState _self;
  final $Res Function(_LearningSessionState) _then;

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentCard = freezed,Object? isLoading = null,Object? showTranslation = null,}) {
  return _then(_LearningSessionState(
currentCard: freezed == currentCard ? _self.currentCard : currentCard // ignore: cast_nullable_to_non_nullable
as DictionaryCard?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,showTranslation: null == showTranslation ? _self.showTranslation : showTranslation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LearningSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DictionaryCardCopyWith<$Res>? get currentCard {
    if (_self.currentCard == null) {
    return null;
  }

  return $DictionaryCardCopyWith<$Res>(_self.currentCard!, (value) {
    return _then(_self.copyWith(currentCard: value));
  });
}
}

// dart format on
