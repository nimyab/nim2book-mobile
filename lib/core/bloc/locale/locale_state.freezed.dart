// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocaleState {

 Locale? get currentLocale; List<Locale> get supportedLocales;
/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleStateCopyWith<LocaleState> get copyWith => _$LocaleStateCopyWithImpl<LocaleState>(this as LocaleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleState&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale)&&const DeepCollectionEquality().equals(other.supportedLocales, supportedLocales));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocale,const DeepCollectionEquality().hash(supportedLocales));

@override
String toString() {
  return 'LocaleState(currentLocale: $currentLocale, supportedLocales: $supportedLocales)';
}


}

/// @nodoc
abstract mixin class $LocaleStateCopyWith<$Res>  {
  factory $LocaleStateCopyWith(LocaleState value, $Res Function(LocaleState) _then) = _$LocaleStateCopyWithImpl;
@useResult
$Res call({
 Locale? currentLocale, List<Locale> supportedLocales
});




}
/// @nodoc
class _$LocaleStateCopyWithImpl<$Res>
    implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._self, this._then);

  final LocaleState _self;
  final $Res Function(LocaleState) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLocale = freezed,Object? supportedLocales = null,}) {
  return _then(_self.copyWith(
currentLocale: freezed == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as Locale?,supportedLocales: null == supportedLocales ? _self.supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<Locale>,
  ));
}

}


/// Adds pattern-matching-related methods to [LocaleState].
extension LocaleStatePatterns on LocaleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocaleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocaleState value)  $default,){
final _that = this;
switch (_that) {
case _LocaleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocaleState value)?  $default,){
final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Locale? currentLocale,  List<Locale> supportedLocales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
return $default(_that.currentLocale,_that.supportedLocales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Locale? currentLocale,  List<Locale> supportedLocales)  $default,) {final _that = this;
switch (_that) {
case _LocaleState():
return $default(_that.currentLocale,_that.supportedLocales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Locale? currentLocale,  List<Locale> supportedLocales)?  $default,) {final _that = this;
switch (_that) {
case _LocaleState() when $default != null:
return $default(_that.currentLocale,_that.supportedLocales);case _:
  return null;

}
}

}

/// @nodoc


class _LocaleState implements LocaleState {
  const _LocaleState({this.currentLocale, final  List<Locale> supportedLocales = const []}): _supportedLocales = supportedLocales;
  

@override final  Locale? currentLocale;
 final  List<Locale> _supportedLocales;
@override@JsonKey() List<Locale> get supportedLocales {
  if (_supportedLocales is EqualUnmodifiableListView) return _supportedLocales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedLocales);
}


/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleStateCopyWith<_LocaleState> get copyWith => __$LocaleStateCopyWithImpl<_LocaleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleState&&(identical(other.currentLocale, currentLocale) || other.currentLocale == currentLocale)&&const DeepCollectionEquality().equals(other._supportedLocales, _supportedLocales));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocale,const DeepCollectionEquality().hash(_supportedLocales));

@override
String toString() {
  return 'LocaleState(currentLocale: $currentLocale, supportedLocales: $supportedLocales)';
}


}

/// @nodoc
abstract mixin class _$LocaleStateCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory _$LocaleStateCopyWith(_LocaleState value, $Res Function(_LocaleState) _then) = __$LocaleStateCopyWithImpl;
@override @useResult
$Res call({
 Locale? currentLocale, List<Locale> supportedLocales
});




}
/// @nodoc
class __$LocaleStateCopyWithImpl<$Res>
    implements _$LocaleStateCopyWith<$Res> {
  __$LocaleStateCopyWithImpl(this._self, this._then);

  final _LocaleState _self;
  final $Res Function(_LocaleState) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLocale = freezed,Object? supportedLocales = null,}) {
  return _then(_LocaleState(
currentLocale: freezed == currentLocale ? _self.currentLocale : currentLocale // ignore: cast_nullable_to_non_nullable
as Locale?,supportedLocales: null == supportedLocales ? _self._supportedLocales : supportedLocales // ignore: cast_nullable_to_non_nullable
as List<Locale>,
  ));
}


}

// dart format on
