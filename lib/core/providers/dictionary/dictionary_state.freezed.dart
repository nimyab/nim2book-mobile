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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DictionaryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DictionaryState()';
}


}

/// @nodoc
class $DictionaryStateCopyWith<$Res>  {
$DictionaryStateCopyWith(DictionaryState _, $Res Function(DictionaryState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DictionaryStateLoading value)?  loading,TResult Function( _DictionaryStateCards value)?  cards,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DictionaryStateLoading() when loading != null:
return loading(_that);case _DictionaryStateCards() when cards != null:
return cards(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DictionaryStateLoading value)  loading,required TResult Function( _DictionaryStateCards value)  cards,}){
final _that = this;
switch (_that) {
case _DictionaryStateLoading():
return loading(_that);case _DictionaryStateCards():
return cards(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DictionaryStateLoading value)?  loading,TResult? Function( _DictionaryStateCards value)?  cards,}){
final _that = this;
switch (_that) {
case _DictionaryStateLoading() when loading != null:
return loading(_that);case _DictionaryStateCards() when cards != null:
return cards(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Map<String, List<DictionaryCard>> savedCards)?  cards,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DictionaryStateLoading() when loading != null:
return loading();case _DictionaryStateCards() when cards != null:
return cards(_that.savedCards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Map<String, List<DictionaryCard>> savedCards)  cards,}) {final _that = this;
switch (_that) {
case _DictionaryStateLoading():
return loading();case _DictionaryStateCards():
return cards(_that.savedCards);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Map<String, List<DictionaryCard>> savedCards)?  cards,}) {final _that = this;
switch (_that) {
case _DictionaryStateLoading() when loading != null:
return loading();case _DictionaryStateCards() when cards != null:
return cards(_that.savedCards);case _:
  return null;

}
}

}

/// @nodoc


class _DictionaryStateLoading implements DictionaryState {
  const _DictionaryStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DictionaryState.loading()';
}


}




/// @nodoc


class _DictionaryStateCards implements DictionaryState {
  const _DictionaryStateCards({final  Map<String, List<DictionaryCard>> savedCards = const {}}): _savedCards = savedCards;
  

 final  Map<String, List<DictionaryCard>> _savedCards;
@JsonKey() Map<String, List<DictionaryCard>> get savedCards {
  if (_savedCards is EqualUnmodifiableMapView) return _savedCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_savedCards);
}


/// Create a copy of DictionaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DictionaryStateCardsCopyWith<_DictionaryStateCards> get copyWith => __$DictionaryStateCardsCopyWithImpl<_DictionaryStateCards>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryStateCards&&const DeepCollectionEquality().equals(other._savedCards, _savedCards));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_savedCards));

@override
String toString() {
  return 'DictionaryState.cards(savedCards: $savedCards)';
}


}

/// @nodoc
abstract mixin class _$DictionaryStateCardsCopyWith<$Res> implements $DictionaryStateCopyWith<$Res> {
  factory _$DictionaryStateCardsCopyWith(_DictionaryStateCards value, $Res Function(_DictionaryStateCards) _then) = __$DictionaryStateCardsCopyWithImpl;
@useResult
$Res call({
 Map<String, List<DictionaryCard>> savedCards
});




}
/// @nodoc
class __$DictionaryStateCardsCopyWithImpl<$Res>
    implements _$DictionaryStateCardsCopyWith<$Res> {
  __$DictionaryStateCardsCopyWithImpl(this._self, this._then);

  final _DictionaryStateCards _self;
  final $Res Function(_DictionaryStateCards) _then;

/// Create a copy of DictionaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? savedCards = null,}) {
  return _then(_DictionaryStateCards(
savedCards: null == savedCards ? _self._savedCards : savedCards // ignore: cast_nullable_to_non_nullable
as Map<String, List<DictionaryCard>>,
  ));
}


}

// dart format on
