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
mixin _$DictionaryWord {

 String get id; String get text; String get fromLangCode; String get toLangCode; String get partOfSpeech; List<String> get translations; String? get transcription; List<DictionaryExample> get examples;
/// Create a copy of DictionaryWord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DictionaryWordCopyWith<DictionaryWord> get copyWith => _$DictionaryWordCopyWithImpl<DictionaryWord>(this as DictionaryWord, _$identity);

  /// Serializes this DictionaryWord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DictionaryWord&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.fromLangCode, fromLangCode) || other.fromLangCode == fromLangCode)&&(identical(other.toLangCode, toLangCode) || other.toLangCode == toLangCode)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&const DeepCollectionEquality().equals(other.translations, translations)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&const DeepCollectionEquality().equals(other.examples, examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,fromLangCode,toLangCode,partOfSpeech,const DeepCollectionEquality().hash(translations),transcription,const DeepCollectionEquality().hash(examples));

@override
String toString() {
  return 'DictionaryWord(id: $id, text: $text, fromLangCode: $fromLangCode, toLangCode: $toLangCode, partOfSpeech: $partOfSpeech, translations: $translations, transcription: $transcription, examples: $examples)';
}


}

/// @nodoc
abstract mixin class $DictionaryWordCopyWith<$Res>  {
  factory $DictionaryWordCopyWith(DictionaryWord value, $Res Function(DictionaryWord) _then) = _$DictionaryWordCopyWithImpl;
@useResult
$Res call({
 String id, String text, String fromLangCode, String toLangCode, String partOfSpeech, List<String> translations, String? transcription, List<DictionaryExample> examples
});




}
/// @nodoc
class _$DictionaryWordCopyWithImpl<$Res>
    implements $DictionaryWordCopyWith<$Res> {
  _$DictionaryWordCopyWithImpl(this._self, this._then);

  final DictionaryWord _self;
  final $Res Function(DictionaryWord) _then;

/// Create a copy of DictionaryWord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? fromLangCode = null,Object? toLangCode = null,Object? partOfSpeech = null,Object? translations = null,Object? transcription = freezed,Object? examples = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,fromLangCode: null == fromLangCode ? _self.fromLangCode : fromLangCode // ignore: cast_nullable_to_non_nullable
as String,toLangCode: null == toLangCode ? _self.toLangCode : toLangCode // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as List<String>,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<DictionaryExample>,
  ));
}

}


/// Adds pattern-matching-related methods to [DictionaryWord].
extension DictionaryWordPatterns on DictionaryWord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DictionaryWord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DictionaryWord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DictionaryWord value)  $default,){
final _that = this;
switch (_that) {
case _DictionaryWord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DictionaryWord value)?  $default,){
final _that = this;
switch (_that) {
case _DictionaryWord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String fromLangCode,  String toLangCode,  String partOfSpeech,  List<String> translations,  String? transcription,  List<DictionaryExample> examples)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DictionaryWord() when $default != null:
return $default(_that.id,_that.text,_that.fromLangCode,_that.toLangCode,_that.partOfSpeech,_that.translations,_that.transcription,_that.examples);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String fromLangCode,  String toLangCode,  String partOfSpeech,  List<String> translations,  String? transcription,  List<DictionaryExample> examples)  $default,) {final _that = this;
switch (_that) {
case _DictionaryWord():
return $default(_that.id,_that.text,_that.fromLangCode,_that.toLangCode,_that.partOfSpeech,_that.translations,_that.transcription,_that.examples);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String fromLangCode,  String toLangCode,  String partOfSpeech,  List<String> translations,  String? transcription,  List<DictionaryExample> examples)?  $default,) {final _that = this;
switch (_that) {
case _DictionaryWord() when $default != null:
return $default(_that.id,_that.text,_that.fromLangCode,_that.toLangCode,_that.partOfSpeech,_that.translations,_that.transcription,_that.examples);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DictionaryWord implements DictionaryWord {
  const _DictionaryWord({required this.id, required this.text, required this.fromLangCode, required this.toLangCode, required this.partOfSpeech, required final  List<String> translations, this.transcription, required final  List<DictionaryExample> examples}): _translations = translations,_examples = examples;
  factory _DictionaryWord.fromJson(Map<String, dynamic> json) => _$DictionaryWordFromJson(json);

@override final  String id;
@override final  String text;
@override final  String fromLangCode;
@override final  String toLangCode;
@override final  String partOfSpeech;
 final  List<String> _translations;
@override List<String> get translations {
  if (_translations is EqualUnmodifiableListView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translations);
}

@override final  String? transcription;
 final  List<DictionaryExample> _examples;
@override List<DictionaryExample> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}


/// Create a copy of DictionaryWord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DictionaryWordCopyWith<_DictionaryWord> get copyWith => __$DictionaryWordCopyWithImpl<_DictionaryWord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DictionaryWordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryWord&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.fromLangCode, fromLangCode) || other.fromLangCode == fromLangCode)&&(identical(other.toLangCode, toLangCode) || other.toLangCode == toLangCode)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&const DeepCollectionEquality().equals(other._translations, _translations)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&const DeepCollectionEquality().equals(other._examples, _examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,fromLangCode,toLangCode,partOfSpeech,const DeepCollectionEquality().hash(_translations),transcription,const DeepCollectionEquality().hash(_examples));

@override
String toString() {
  return 'DictionaryWord(id: $id, text: $text, fromLangCode: $fromLangCode, toLangCode: $toLangCode, partOfSpeech: $partOfSpeech, translations: $translations, transcription: $transcription, examples: $examples)';
}


}

/// @nodoc
abstract mixin class _$DictionaryWordCopyWith<$Res> implements $DictionaryWordCopyWith<$Res> {
  factory _$DictionaryWordCopyWith(_DictionaryWord value, $Res Function(_DictionaryWord) _then) = __$DictionaryWordCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String fromLangCode, String toLangCode, String partOfSpeech, List<String> translations, String? transcription, List<DictionaryExample> examples
});




}
/// @nodoc
class __$DictionaryWordCopyWithImpl<$Res>
    implements _$DictionaryWordCopyWith<$Res> {
  __$DictionaryWordCopyWithImpl(this._self, this._then);

  final _DictionaryWord _self;
  final $Res Function(_DictionaryWord) _then;

/// Create a copy of DictionaryWord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? fromLangCode = null,Object? toLangCode = null,Object? partOfSpeech = null,Object? translations = null,Object? transcription = freezed,Object? examples = null,}) {
  return _then(_DictionaryWord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,fromLangCode: null == fromLangCode ? _self.fromLangCode : fromLangCode // ignore: cast_nullable_to_non_nullable
as String,toLangCode: null == toLangCode ? _self.toLangCode : toLangCode // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as List<String>,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<DictionaryExample>,
  ));
}


}


/// @nodoc
mixin _$DictionaryExample {

 String get id; String get dictionaryID; String get text; String get translatedText; int get wordPositionStart; int get wordPositionEnd;
/// Create a copy of DictionaryExample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DictionaryExampleCopyWith<DictionaryExample> get copyWith => _$DictionaryExampleCopyWithImpl<DictionaryExample>(this as DictionaryExample, _$identity);

  /// Serializes this DictionaryExample to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DictionaryExample&&(identical(other.id, id) || other.id == id)&&(identical(other.dictionaryID, dictionaryID) || other.dictionaryID == dictionaryID)&&(identical(other.text, text) || other.text == text)&&(identical(other.translatedText, translatedText) || other.translatedText == translatedText)&&(identical(other.wordPositionStart, wordPositionStart) || other.wordPositionStart == wordPositionStart)&&(identical(other.wordPositionEnd, wordPositionEnd) || other.wordPositionEnd == wordPositionEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dictionaryID,text,translatedText,wordPositionStart,wordPositionEnd);

@override
String toString() {
  return 'DictionaryExample(id: $id, dictionaryID: $dictionaryID, text: $text, translatedText: $translatedText, wordPositionStart: $wordPositionStart, wordPositionEnd: $wordPositionEnd)';
}


}

/// @nodoc
abstract mixin class $DictionaryExampleCopyWith<$Res>  {
  factory $DictionaryExampleCopyWith(DictionaryExample value, $Res Function(DictionaryExample) _then) = _$DictionaryExampleCopyWithImpl;
@useResult
$Res call({
 String id, String dictionaryID, String text, String translatedText, int wordPositionStart, int wordPositionEnd
});




}
/// @nodoc
class _$DictionaryExampleCopyWithImpl<$Res>
    implements $DictionaryExampleCopyWith<$Res> {
  _$DictionaryExampleCopyWithImpl(this._self, this._then);

  final DictionaryExample _self;
  final $Res Function(DictionaryExample) _then;

/// Create a copy of DictionaryExample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dictionaryID = null,Object? text = null,Object? translatedText = null,Object? wordPositionStart = null,Object? wordPositionEnd = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dictionaryID: null == dictionaryID ? _self.dictionaryID : dictionaryID // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,translatedText: null == translatedText ? _self.translatedText : translatedText // ignore: cast_nullable_to_non_nullable
as String,wordPositionStart: null == wordPositionStart ? _self.wordPositionStart : wordPositionStart // ignore: cast_nullable_to_non_nullable
as int,wordPositionEnd: null == wordPositionEnd ? _self.wordPositionEnd : wordPositionEnd // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DictionaryExample].
extension DictionaryExamplePatterns on DictionaryExample {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DictionaryExample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DictionaryExample() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DictionaryExample value)  $default,){
final _that = this;
switch (_that) {
case _DictionaryExample():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DictionaryExample value)?  $default,){
final _that = this;
switch (_that) {
case _DictionaryExample() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String dictionaryID,  String text,  String translatedText,  int wordPositionStart,  int wordPositionEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DictionaryExample() when $default != null:
return $default(_that.id,_that.dictionaryID,_that.text,_that.translatedText,_that.wordPositionStart,_that.wordPositionEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String dictionaryID,  String text,  String translatedText,  int wordPositionStart,  int wordPositionEnd)  $default,) {final _that = this;
switch (_that) {
case _DictionaryExample():
return $default(_that.id,_that.dictionaryID,_that.text,_that.translatedText,_that.wordPositionStart,_that.wordPositionEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String dictionaryID,  String text,  String translatedText,  int wordPositionStart,  int wordPositionEnd)?  $default,) {final _that = this;
switch (_that) {
case _DictionaryExample() when $default != null:
return $default(_that.id,_that.dictionaryID,_that.text,_that.translatedText,_that.wordPositionStart,_that.wordPositionEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DictionaryExample implements DictionaryExample {
  const _DictionaryExample({required this.id, required this.dictionaryID, required this.text, required this.translatedText, required this.wordPositionStart, required this.wordPositionEnd});
  factory _DictionaryExample.fromJson(Map<String, dynamic> json) => _$DictionaryExampleFromJson(json);

@override final  String id;
@override final  String dictionaryID;
@override final  String text;
@override final  String translatedText;
@override final  int wordPositionStart;
@override final  int wordPositionEnd;

/// Create a copy of DictionaryExample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DictionaryExampleCopyWith<_DictionaryExample> get copyWith => __$DictionaryExampleCopyWithImpl<_DictionaryExample>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DictionaryExampleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DictionaryExample&&(identical(other.id, id) || other.id == id)&&(identical(other.dictionaryID, dictionaryID) || other.dictionaryID == dictionaryID)&&(identical(other.text, text) || other.text == text)&&(identical(other.translatedText, translatedText) || other.translatedText == translatedText)&&(identical(other.wordPositionStart, wordPositionStart) || other.wordPositionStart == wordPositionStart)&&(identical(other.wordPositionEnd, wordPositionEnd) || other.wordPositionEnd == wordPositionEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dictionaryID,text,translatedText,wordPositionStart,wordPositionEnd);

@override
String toString() {
  return 'DictionaryExample(id: $id, dictionaryID: $dictionaryID, text: $text, translatedText: $translatedText, wordPositionStart: $wordPositionStart, wordPositionEnd: $wordPositionEnd)';
}


}

/// @nodoc
abstract mixin class _$DictionaryExampleCopyWith<$Res> implements $DictionaryExampleCopyWith<$Res> {
  factory _$DictionaryExampleCopyWith(_DictionaryExample value, $Res Function(_DictionaryExample) _then) = __$DictionaryExampleCopyWithImpl;
@override @useResult
$Res call({
 String id, String dictionaryID, String text, String translatedText, int wordPositionStart, int wordPositionEnd
});




}
/// @nodoc
class __$DictionaryExampleCopyWithImpl<$Res>
    implements _$DictionaryExampleCopyWith<$Res> {
  __$DictionaryExampleCopyWithImpl(this._self, this._then);

  final _DictionaryExample _self;
  final $Res Function(_DictionaryExample) _then;

/// Create a copy of DictionaryExample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dictionaryID = null,Object? text = null,Object? translatedText = null,Object? wordPositionStart = null,Object? wordPositionEnd = null,}) {
  return _then(_DictionaryExample(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dictionaryID: null == dictionaryID ? _self.dictionaryID : dictionaryID // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,translatedText: null == translatedText ? _self.translatedText : translatedText // ignore: cast_nullable_to_non_nullable
as String,wordPositionStart: null == wordPositionStart ? _self.wordPositionStart : wordPositionStart // ignore: cast_nullable_to_non_nullable
as int,wordPositionEnd: null == wordPositionEnd ? _self.wordPositionEnd : wordPositionEnd // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
