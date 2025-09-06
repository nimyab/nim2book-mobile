// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Definition {

 String get text; List<Translation> get tr; String? get pos; String? get ts;
/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefinitionCopyWith<Definition> get copyWith => _$DefinitionCopyWithImpl<Definition>(this as Definition, _$identity);

  /// Serializes this Definition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Definition&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.tr, tr)&&(identical(other.pos, pos) || other.pos == pos)&&(identical(other.ts, ts) || other.ts == ts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(tr),pos,ts);

@override
String toString() {
  return 'Definition(text: $text, tr: $tr, pos: $pos, ts: $ts)';
}


}

/// @nodoc
abstract mixin class $DefinitionCopyWith<$Res>  {
  factory $DefinitionCopyWith(Definition value, $Res Function(Definition) _then) = _$DefinitionCopyWithImpl;
@useResult
$Res call({
 String text, List<Translation> tr, String? pos, String? ts
});




}
/// @nodoc
class _$DefinitionCopyWithImpl<$Res>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._self, this._then);

  final Definition _self;
  final $Res Function(Definition) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? tr = null,Object? pos = freezed,Object? ts = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,tr: null == tr ? _self.tr : tr // ignore: cast_nullable_to_non_nullable
as List<Translation>,pos: freezed == pos ? _self.pos : pos // ignore: cast_nullable_to_non_nullable
as String?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Definition].
extension DefinitionPatterns on Definition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Definition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Definition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Definition value)  $default,){
final _that = this;
switch (_that) {
case _Definition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Definition value)?  $default,){
final _that = this;
switch (_that) {
case _Definition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<Translation> tr,  String? pos,  String? ts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that.text,_that.tr,_that.pos,_that.ts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<Translation> tr,  String? pos,  String? ts)  $default,) {final _that = this;
switch (_that) {
case _Definition():
return $default(_that.text,_that.tr,_that.pos,_that.ts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<Translation> tr,  String? pos,  String? ts)?  $default,) {final _that = this;
switch (_that) {
case _Definition() when $default != null:
return $default(_that.text,_that.tr,_that.pos,_that.ts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Definition implements Definition {
  const _Definition({required this.text, required final  List<Translation> tr, this.pos, this.ts}): _tr = tr;
  factory _Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);

@override final  String text;
 final  List<Translation> _tr;
@override List<Translation> get tr {
  if (_tr is EqualUnmodifiableListView) return _tr;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tr);
}

@override final  String? pos;
@override final  String? ts;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefinitionCopyWith<_Definition> get copyWith => __$DefinitionCopyWithImpl<_Definition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Definition&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._tr, _tr)&&(identical(other.pos, pos) || other.pos == pos)&&(identical(other.ts, ts) || other.ts == ts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_tr),pos,ts);

@override
String toString() {
  return 'Definition(text: $text, tr: $tr, pos: $pos, ts: $ts)';
}


}

/// @nodoc
abstract mixin class _$DefinitionCopyWith<$Res> implements $DefinitionCopyWith<$Res> {
  factory _$DefinitionCopyWith(_Definition value, $Res Function(_Definition) _then) = __$DefinitionCopyWithImpl;
@override @useResult
$Res call({
 String text, List<Translation> tr, String? pos, String? ts
});




}
/// @nodoc
class __$DefinitionCopyWithImpl<$Res>
    implements _$DefinitionCopyWith<$Res> {
  __$DefinitionCopyWithImpl(this._self, this._then);

  final _Definition _self;
  final $Res Function(_Definition) _then;

/// Create a copy of Definition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? tr = null,Object? pos = freezed,Object? ts = freezed,}) {
  return _then(_Definition(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,tr: null == tr ? _self._tr : tr // ignore: cast_nullable_to_non_nullable
as List<Translation>,pos: freezed == pos ? _self.pos : pos // ignore: cast_nullable_to_non_nullable
as String?,ts: freezed == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Translation {

 String get text; String? get pos; List<Mean>? get mean; List<Example>? get ex;
/// Create a copy of Translation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationCopyWith<Translation> get copyWith => _$TranslationCopyWithImpl<Translation>(this as Translation, _$identity);

  /// Serializes this Translation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Translation&&(identical(other.text, text) || other.text == text)&&(identical(other.pos, pos) || other.pos == pos)&&const DeepCollectionEquality().equals(other.mean, mean)&&const DeepCollectionEquality().equals(other.ex, ex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,pos,const DeepCollectionEquality().hash(mean),const DeepCollectionEquality().hash(ex));

@override
String toString() {
  return 'Translation(text: $text, pos: $pos, mean: $mean, ex: $ex)';
}


}

/// @nodoc
abstract mixin class $TranslationCopyWith<$Res>  {
  factory $TranslationCopyWith(Translation value, $Res Function(Translation) _then) = _$TranslationCopyWithImpl;
@useResult
$Res call({
 String text, String? pos, List<Mean>? mean, List<Example>? ex
});




}
/// @nodoc
class _$TranslationCopyWithImpl<$Res>
    implements $TranslationCopyWith<$Res> {
  _$TranslationCopyWithImpl(this._self, this._then);

  final Translation _self;
  final $Res Function(Translation) _then;

/// Create a copy of Translation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? pos = freezed,Object? mean = freezed,Object? ex = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,pos: freezed == pos ? _self.pos : pos // ignore: cast_nullable_to_non_nullable
as String?,mean: freezed == mean ? _self.mean : mean // ignore: cast_nullable_to_non_nullable
as List<Mean>?,ex: freezed == ex ? _self.ex : ex // ignore: cast_nullable_to_non_nullable
as List<Example>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Translation].
extension TranslationPatterns on Translation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Translation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Translation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Translation value)  $default,){
final _that = this;
switch (_that) {
case _Translation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Translation value)?  $default,){
final _that = this;
switch (_that) {
case _Translation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String? pos,  List<Mean>? mean,  List<Example>? ex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Translation() when $default != null:
return $default(_that.text,_that.pos,_that.mean,_that.ex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String? pos,  List<Mean>? mean,  List<Example>? ex)  $default,) {final _that = this;
switch (_that) {
case _Translation():
return $default(_that.text,_that.pos,_that.mean,_that.ex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String? pos,  List<Mean>? mean,  List<Example>? ex)?  $default,) {final _that = this;
switch (_that) {
case _Translation() when $default != null:
return $default(_that.text,_that.pos,_that.mean,_that.ex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Translation implements Translation {
  const _Translation({required this.text, this.pos, final  List<Mean>? mean, final  List<Example>? ex}): _mean = mean,_ex = ex;
  factory _Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);

@override final  String text;
@override final  String? pos;
 final  List<Mean>? _mean;
@override List<Mean>? get mean {
  final value = _mean;
  if (value == null) return null;
  if (_mean is EqualUnmodifiableListView) return _mean;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Example>? _ex;
@override List<Example>? get ex {
  final value = _ex;
  if (value == null) return null;
  if (_ex is EqualUnmodifiableListView) return _ex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Translation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationCopyWith<_Translation> get copyWith => __$TranslationCopyWithImpl<_Translation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Translation&&(identical(other.text, text) || other.text == text)&&(identical(other.pos, pos) || other.pos == pos)&&const DeepCollectionEquality().equals(other._mean, _mean)&&const DeepCollectionEquality().equals(other._ex, _ex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,pos,const DeepCollectionEquality().hash(_mean),const DeepCollectionEquality().hash(_ex));

@override
String toString() {
  return 'Translation(text: $text, pos: $pos, mean: $mean, ex: $ex)';
}


}

/// @nodoc
abstract mixin class _$TranslationCopyWith<$Res> implements $TranslationCopyWith<$Res> {
  factory _$TranslationCopyWith(_Translation value, $Res Function(_Translation) _then) = __$TranslationCopyWithImpl;
@override @useResult
$Res call({
 String text, String? pos, List<Mean>? mean, List<Example>? ex
});




}
/// @nodoc
class __$TranslationCopyWithImpl<$Res>
    implements _$TranslationCopyWith<$Res> {
  __$TranslationCopyWithImpl(this._self, this._then);

  final _Translation _self;
  final $Res Function(_Translation) _then;

/// Create a copy of Translation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? pos = freezed,Object? mean = freezed,Object? ex = freezed,}) {
  return _then(_Translation(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,pos: freezed == pos ? _self.pos : pos // ignore: cast_nullable_to_non_nullable
as String?,mean: freezed == mean ? _self._mean : mean // ignore: cast_nullable_to_non_nullable
as List<Mean>?,ex: freezed == ex ? _self._ex : ex // ignore: cast_nullable_to_non_nullable
as List<Example>?,
  ));
}


}


/// @nodoc
mixin _$Mean {

 String get text;
/// Create a copy of Mean
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeanCopyWith<Mean> get copyWith => _$MeanCopyWithImpl<Mean>(this as Mean, _$identity);

  /// Serializes this Mean to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mean&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'Mean(text: $text)';
}


}

/// @nodoc
abstract mixin class $MeanCopyWith<$Res>  {
  factory $MeanCopyWith(Mean value, $Res Function(Mean) _then) = _$MeanCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$MeanCopyWithImpl<$Res>
    implements $MeanCopyWith<$Res> {
  _$MeanCopyWithImpl(this._self, this._then);

  final Mean _self;
  final $Res Function(Mean) _then;

/// Create a copy of Mean
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Mean].
extension MeanPatterns on Mean {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Mean value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Mean() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Mean value)  $default,){
final _that = this;
switch (_that) {
case _Mean():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Mean value)?  $default,){
final _that = this;
switch (_that) {
case _Mean() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Mean() when $default != null:
return $default(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text)  $default,) {final _that = this;
switch (_that) {
case _Mean():
return $default(_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text)?  $default,) {final _that = this;
switch (_that) {
case _Mean() when $default != null:
return $default(_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Mean implements Mean {
  const _Mean({required this.text});
  factory _Mean.fromJson(Map<String, dynamic> json) => _$MeanFromJson(json);

@override final  String text;

/// Create a copy of Mean
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeanCopyWith<_Mean> get copyWith => __$MeanCopyWithImpl<_Mean>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mean&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'Mean(text: $text)';
}


}

/// @nodoc
abstract mixin class _$MeanCopyWith<$Res> implements $MeanCopyWith<$Res> {
  factory _$MeanCopyWith(_Mean value, $Res Function(_Mean) _then) = __$MeanCopyWithImpl;
@override @useResult
$Res call({
 String text
});




}
/// @nodoc
class __$MeanCopyWithImpl<$Res>
    implements _$MeanCopyWith<$Res> {
  __$MeanCopyWithImpl(this._self, this._then);

  final _Mean _self;
  final $Res Function(_Mean) _then;

/// Create a copy of Mean
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_Mean(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Example {

 String get text; List<ExampleTranslation>? get tr;
/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleCopyWith<Example> get copyWith => _$ExampleCopyWithImpl<Example>(this as Example, _$identity);

  /// Serializes this Example to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Example&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.tr, tr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(tr));

@override
String toString() {
  return 'Example(text: $text, tr: $tr)';
}


}

/// @nodoc
abstract mixin class $ExampleCopyWith<$Res>  {
  factory $ExampleCopyWith(Example value, $Res Function(Example) _then) = _$ExampleCopyWithImpl;
@useResult
$Res call({
 String text, List<ExampleTranslation>? tr
});




}
/// @nodoc
class _$ExampleCopyWithImpl<$Res>
    implements $ExampleCopyWith<$Res> {
  _$ExampleCopyWithImpl(this._self, this._then);

  final Example _self;
  final $Res Function(Example) _then;

/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? tr = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,tr: freezed == tr ? _self.tr : tr // ignore: cast_nullable_to_non_nullable
as List<ExampleTranslation>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Example].
extension ExamplePatterns on Example {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Example value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Example() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Example value)  $default,){
final _that = this;
switch (_that) {
case _Example():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Example value)?  $default,){
final _that = this;
switch (_that) {
case _Example() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<ExampleTranslation>? tr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Example() when $default != null:
return $default(_that.text,_that.tr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<ExampleTranslation>? tr)  $default,) {final _that = this;
switch (_that) {
case _Example():
return $default(_that.text,_that.tr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<ExampleTranslation>? tr)?  $default,) {final _that = this;
switch (_that) {
case _Example() when $default != null:
return $default(_that.text,_that.tr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Example implements Example {
  const _Example({required this.text, final  List<ExampleTranslation>? tr}): _tr = tr;
  factory _Example.fromJson(Map<String, dynamic> json) => _$ExampleFromJson(json);

@override final  String text;
 final  List<ExampleTranslation>? _tr;
@override List<ExampleTranslation>? get tr {
  final value = _tr;
  if (value == null) return null;
  if (_tr is EqualUnmodifiableListView) return _tr;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleCopyWith<_Example> get copyWith => __$ExampleCopyWithImpl<_Example>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Example&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._tr, _tr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_tr));

@override
String toString() {
  return 'Example(text: $text, tr: $tr)';
}


}

/// @nodoc
abstract mixin class _$ExampleCopyWith<$Res> implements $ExampleCopyWith<$Res> {
  factory _$ExampleCopyWith(_Example value, $Res Function(_Example) _then) = __$ExampleCopyWithImpl;
@override @useResult
$Res call({
 String text, List<ExampleTranslation>? tr
});




}
/// @nodoc
class __$ExampleCopyWithImpl<$Res>
    implements _$ExampleCopyWith<$Res> {
  __$ExampleCopyWithImpl(this._self, this._then);

  final _Example _self;
  final $Res Function(_Example) _then;

/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? tr = freezed,}) {
  return _then(_Example(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,tr: freezed == tr ? _self._tr : tr // ignore: cast_nullable_to_non_nullable
as List<ExampleTranslation>?,
  ));
}


}


/// @nodoc
mixin _$ExampleTranslation {

 String get text;
/// Create a copy of ExampleTranslation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleTranslationCopyWith<ExampleTranslation> get copyWith => _$ExampleTranslationCopyWithImpl<ExampleTranslation>(this as ExampleTranslation, _$identity);

  /// Serializes this ExampleTranslation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleTranslation&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ExampleTranslation(text: $text)';
}


}

/// @nodoc
abstract mixin class $ExampleTranslationCopyWith<$Res>  {
  factory $ExampleTranslationCopyWith(ExampleTranslation value, $Res Function(ExampleTranslation) _then) = _$ExampleTranslationCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$ExampleTranslationCopyWithImpl<$Res>
    implements $ExampleTranslationCopyWith<$Res> {
  _$ExampleTranslationCopyWithImpl(this._self, this._then);

  final ExampleTranslation _self;
  final $Res Function(ExampleTranslation) _then;

/// Create a copy of ExampleTranslation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleTranslation].
extension ExampleTranslationPatterns on ExampleTranslation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleTranslation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleTranslation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleTranslation value)  $default,){
final _that = this;
switch (_that) {
case _ExampleTranslation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleTranslation value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleTranslation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleTranslation() when $default != null:
return $default(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text)  $default,) {final _that = this;
switch (_that) {
case _ExampleTranslation():
return $default(_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text)?  $default,) {final _that = this;
switch (_that) {
case _ExampleTranslation() when $default != null:
return $default(_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExampleTranslation implements ExampleTranslation {
  const _ExampleTranslation({required this.text});
  factory _ExampleTranslation.fromJson(Map<String, dynamic> json) => _$ExampleTranslationFromJson(json);

@override final  String text;

/// Create a copy of ExampleTranslation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleTranslationCopyWith<_ExampleTranslation> get copyWith => __$ExampleTranslationCopyWithImpl<_ExampleTranslation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleTranslationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleTranslation&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ExampleTranslation(text: $text)';
}


}

/// @nodoc
abstract mixin class _$ExampleTranslationCopyWith<$Res> implements $ExampleTranslationCopyWith<$Res> {
  factory _$ExampleTranslationCopyWith(_ExampleTranslation value, $Res Function(_ExampleTranslation) _then) = __$ExampleTranslationCopyWithImpl;
@override @useResult
$Res call({
 String text
});




}
/// @nodoc
class __$ExampleTranslationCopyWithImpl<$Res>
    implements _$ExampleTranslationCopyWith<$Res> {
  __$ExampleTranslationCopyWithImpl(this._self, this._then);

  final _ExampleTranslation _self;
  final $Res Function(_ExampleTranslation) _then;

/// Create a copy of ExampleTranslation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_ExampleTranslation(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
