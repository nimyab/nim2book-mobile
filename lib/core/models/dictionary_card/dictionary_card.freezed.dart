// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DictionaryCard {

 DictionaryWord get wordData; Card get fsrsCard;
/// Create a copy of DictionaryCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DictionaryCardCopyWith<DictionaryCard> get copyWith => _$DictionaryCardCopyWithImpl<DictionaryCard>(this as DictionaryCard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DictionaryCard&&(identical(other.wordData, wordData) || other.wordData == wordData)&&(identical(other.fsrsCard, fsrsCard) || other.fsrsCard == fsrsCard));
}


@override
int get hashCode => Object.hash(runtimeType,wordData,fsrsCard);

@override
String toString() {
  return 'DictionaryCard(wordData: $wordData, fsrsCard: $fsrsCard)';
}


}

/// @nodoc
abstract mixin class $DictionaryCardCopyWith<$Res>  {
  factory $DictionaryCardCopyWith(DictionaryCard value, $Res Function(DictionaryCard) _then) = _$DictionaryCardCopyWithImpl;
@useResult
$Res call({
 DictionaryWord wordData, Card fsrsCard
});


$DictionaryWordCopyWith<$Res> get wordData;

}
/// @nodoc
class _$DictionaryCardCopyWithImpl<$Res>
    implements $DictionaryCardCopyWith<$Res> {
  _$DictionaryCardCopyWithImpl(this._self, this._then);

  final DictionaryCard _self;
  final $Res Function(DictionaryCard) _then;

/// Create a copy of DictionaryCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wordData = null,Object? fsrsCard = null,}) {
  return _then(_self.copyWith(
wordData: null == wordData ? _self.wordData : wordData // ignore: cast_nullable_to_non_nullable
as DictionaryWord,fsrsCard: null == fsrsCard ? _self.fsrsCard : fsrsCard // ignore: cast_nullable_to_non_nullable
as Card,
  ));
}
/// Create a copy of DictionaryCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DictionaryWordCopyWith<$Res> get wordData {
  
  return $DictionaryWordCopyWith<$Res>(_self.wordData, (value) {
    return _then(_self.copyWith(wordData: value));
  });
}
}


/// Adds pattern-matching-related methods to [DictionaryCard].
extension DictionaryCardPatterns on DictionaryCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DictionaryCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DictionaryCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DictionaryCard value)  $default,){
final _that = this;
switch (_that) {
case _DictionaryCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DictionaryCard value)?  $default,){
final _that = this;
switch (_that) {
case _DictionaryCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DictionaryWord wordData,  Card fsrsCard)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DictionaryCard() when $default != null:
return $default(_that.wordData,_that.fsrsCard);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DictionaryWord wordData,  Card fsrsCard)  $default,) {final _that = this;
switch (_that) {
case _DictionaryCard():
return $default(_that.wordData,_that.fsrsCard);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DictionaryWord wordData,  Card fsrsCard)?  $default,) {final _that = this;
switch (_that) {
case _DictionaryCard() when $default != null:
return $default(_that.wordData,_that.fsrsCard);case _:
  return null;

}
}

}

/// @nodoc


class _DictionaryCard extends DictionaryCard {
  const _DictionaryCard({required this.wordData, required this.fsrsCard}): super._();
  

@override final  DictionaryWord wordData;
@override final  Card fsrsCard;

/// Create a copy of DictionaryCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DictionaryCardCopyWith<_DictionaryCard> get copyWith => __$DictionaryCardCopyWithImpl<_DictionaryCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryCard&&(identical(other.wordData, wordData) || other.wordData == wordData)&&(identical(other.fsrsCard, fsrsCard) || other.fsrsCard == fsrsCard));
}


@override
int get hashCode => Object.hash(runtimeType,wordData,fsrsCard);

@override
String toString() {
  return 'DictionaryCard(wordData: $wordData, fsrsCard: $fsrsCard)';
}


}

/// @nodoc
abstract mixin class _$DictionaryCardCopyWith<$Res> implements $DictionaryCardCopyWith<$Res> {
  factory _$DictionaryCardCopyWith(_DictionaryCard value, $Res Function(_DictionaryCard) _then) = __$DictionaryCardCopyWithImpl;
@override @useResult
$Res call({
 DictionaryWord wordData, Card fsrsCard
});


@override $DictionaryWordCopyWith<$Res> get wordData;

}
/// @nodoc
class __$DictionaryCardCopyWithImpl<$Res>
    implements _$DictionaryCardCopyWith<$Res> {
  __$DictionaryCardCopyWithImpl(this._self, this._then);

  final _DictionaryCard _self;
  final $Res Function(_DictionaryCard) _then;

/// Create a copy of DictionaryCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wordData = null,Object? fsrsCard = null,}) {
  return _then(_DictionaryCard(
wordData: null == wordData ? _self.wordData : wordData // ignore: cast_nullable_to_non_nullable
as DictionaryWord,fsrsCard: null == fsrsCard ? _self.fsrsCard : fsrsCard // ignore: cast_nullable_to_non_nullable
as Card,
  ));
}

/// Create a copy of DictionaryCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DictionaryWordCopyWith<$Res> get wordData {
  
  return $DictionaryWordCopyWith<$Res>(_self.wordData, (value) {
    return _then(_self.copyWith(wordData: value));
  });
}
}

// dart format on
