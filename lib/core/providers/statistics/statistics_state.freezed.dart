// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatisticsState {

 int get countLearnedCards; int get countLearningCards; int get countRelearningCards;
/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsStateCopyWith<StatisticsState> get copyWith => _$StatisticsStateCopyWithImpl<StatisticsState>(this as StatisticsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticsState&&(identical(other.countLearnedCards, countLearnedCards) || other.countLearnedCards == countLearnedCards)&&(identical(other.countLearningCards, countLearningCards) || other.countLearningCards == countLearningCards)&&(identical(other.countRelearningCards, countRelearningCards) || other.countRelearningCards == countRelearningCards));
}


@override
int get hashCode => Object.hash(runtimeType,countLearnedCards,countLearningCards,countRelearningCards);

@override
String toString() {
  return 'StatisticsState(countLearnedCards: $countLearnedCards, countLearningCards: $countLearningCards, countRelearningCards: $countRelearningCards)';
}


}

/// @nodoc
abstract mixin class $StatisticsStateCopyWith<$Res>  {
  factory $StatisticsStateCopyWith(StatisticsState value, $Res Function(StatisticsState) _then) = _$StatisticsStateCopyWithImpl;
@useResult
$Res call({
 int countLearnedCards, int countLearningCards, int countRelearningCards
});




}
/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._self, this._then);

  final StatisticsState _self;
  final $Res Function(StatisticsState) _then;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countLearnedCards = null,Object? countLearningCards = null,Object? countRelearningCards = null,}) {
  return _then(_self.copyWith(
countLearnedCards: null == countLearnedCards ? _self.countLearnedCards : countLearnedCards // ignore: cast_nullable_to_non_nullable
as int,countLearningCards: null == countLearningCards ? _self.countLearningCards : countLearningCards // ignore: cast_nullable_to_non_nullable
as int,countRelearningCards: null == countRelearningCards ? _self.countRelearningCards : countRelearningCards // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StatisticsState].
extension StatisticsStatePatterns on StatisticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatisticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatisticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatisticsState value)  $default,){
final _that = this;
switch (_that) {
case _StatisticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatisticsState value)?  $default,){
final _that = this;
switch (_that) {
case _StatisticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int countLearnedCards,  int countLearningCards,  int countRelearningCards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatisticsState() when $default != null:
return $default(_that.countLearnedCards,_that.countLearningCards,_that.countRelearningCards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int countLearnedCards,  int countLearningCards,  int countRelearningCards)  $default,) {final _that = this;
switch (_that) {
case _StatisticsState():
return $default(_that.countLearnedCards,_that.countLearningCards,_that.countRelearningCards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int countLearnedCards,  int countLearningCards,  int countRelearningCards)?  $default,) {final _that = this;
switch (_that) {
case _StatisticsState() when $default != null:
return $default(_that.countLearnedCards,_that.countLearningCards,_that.countRelearningCards);case _:
  return null;

}
}

}

/// @nodoc


class _StatisticsState implements StatisticsState {
  const _StatisticsState({this.countLearnedCards = 0, this.countLearningCards = 0, this.countRelearningCards = 0});
  

@override@JsonKey() final  int countLearnedCards;
@override@JsonKey() final  int countLearningCards;
@override@JsonKey() final  int countRelearningCards;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsStateCopyWith<_StatisticsState> get copyWith => __$StatisticsStateCopyWithImpl<_StatisticsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatisticsState&&(identical(other.countLearnedCards, countLearnedCards) || other.countLearnedCards == countLearnedCards)&&(identical(other.countLearningCards, countLearningCards) || other.countLearningCards == countLearningCards)&&(identical(other.countRelearningCards, countRelearningCards) || other.countRelearningCards == countRelearningCards));
}


@override
int get hashCode => Object.hash(runtimeType,countLearnedCards,countLearningCards,countRelearningCards);

@override
String toString() {
  return 'StatisticsState(countLearnedCards: $countLearnedCards, countLearningCards: $countLearningCards, countRelearningCards: $countRelearningCards)';
}


}

/// @nodoc
abstract mixin class _$StatisticsStateCopyWith<$Res> implements $StatisticsStateCopyWith<$Res> {
  factory _$StatisticsStateCopyWith(_StatisticsState value, $Res Function(_StatisticsState) _then) = __$StatisticsStateCopyWithImpl;
@override @useResult
$Res call({
 int countLearnedCards, int countLearningCards, int countRelearningCards
});




}
/// @nodoc
class __$StatisticsStateCopyWithImpl<$Res>
    implements _$StatisticsStateCopyWith<$Res> {
  __$StatisticsStateCopyWithImpl(this._self, this._then);

  final _StatisticsState _self;
  final $Res Function(_StatisticsState) _then;

/// Create a copy of StatisticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countLearnedCards = null,Object? countLearningCards = null,Object? countRelearningCards = null,}) {
  return _then(_StatisticsState(
countLearnedCards: null == countLearnedCards ? _self.countLearnedCards : countLearnedCards // ignore: cast_nullable_to_non_nullable
as int,countLearningCards: null == countLearningCards ? _self.countLearningCards : countLearningCards // ignore: cast_nullable_to_non_nullable
as int,countRelearningCards: null == countRelearningCards ? _self.countRelearningCards : countRelearningCards // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
