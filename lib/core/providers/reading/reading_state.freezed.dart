// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadingState {

 double get fontSize; double get lineHeight; String get fontFamily; double get sidePadding; double get firstLineIndentEm; double get paragraphSpacing; TextAlign get textAlign; Color? get backgroundColor; Color? get textColor; bool get isLoading;
/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingStateCopyWith<ReadingState> get copyWith => _$ReadingStateCopyWithImpl<ReadingState>(this as ReadingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingState&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.sidePadding, sidePadding) || other.sidePadding == sidePadding)&&(identical(other.firstLineIndentEm, firstLineIndentEm) || other.firstLineIndentEm == firstLineIndentEm)&&(identical(other.paragraphSpacing, paragraphSpacing) || other.paragraphSpacing == paragraphSpacing)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,fontSize,lineHeight,fontFamily,sidePadding,firstLineIndentEm,paragraphSpacing,textAlign,backgroundColor,textColor,isLoading);

@override
String toString() {
  return 'ReadingState(fontSize: $fontSize, lineHeight: $lineHeight, fontFamily: $fontFamily, sidePadding: $sidePadding, firstLineIndentEm: $firstLineIndentEm, paragraphSpacing: $paragraphSpacing, textAlign: $textAlign, backgroundColor: $backgroundColor, textColor: $textColor, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $ReadingStateCopyWith<$Res>  {
  factory $ReadingStateCopyWith(ReadingState value, $Res Function(ReadingState) _then) = _$ReadingStateCopyWithImpl;
@useResult
$Res call({
 double fontSize, double lineHeight, String fontFamily, double sidePadding, double firstLineIndentEm, double paragraphSpacing, TextAlign textAlign, Color? backgroundColor, Color? textColor, bool isLoading
});




}
/// @nodoc
class _$ReadingStateCopyWithImpl<$Res>
    implements $ReadingStateCopyWith<$Res> {
  _$ReadingStateCopyWithImpl(this._self, this._then);

  final ReadingState _self;
  final $Res Function(ReadingState) _then;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontSize = null,Object? lineHeight = null,Object? fontFamily = null,Object? sidePadding = null,Object? firstLineIndentEm = null,Object? paragraphSpacing = null,Object? textAlign = null,Object? backgroundColor = freezed,Object? textColor = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,sidePadding: null == sidePadding ? _self.sidePadding : sidePadding // ignore: cast_nullable_to_non_nullable
as double,firstLineIndentEm: null == firstLineIndentEm ? _self.firstLineIndentEm : firstLineIndentEm // ignore: cast_nullable_to_non_nullable
as double,paragraphSpacing: null == paragraphSpacing ? _self.paragraphSpacing : paragraphSpacing // ignore: cast_nullable_to_non_nullable
as double,textAlign: null == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as TextAlign,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color?,textColor: freezed == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingState].
extension ReadingStatePatterns on ReadingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingState value)  $default,){
final _that = this;
switch (_that) {
case _ReadingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingState value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fontSize,  double lineHeight,  String fontFamily,  double sidePadding,  double firstLineIndentEm,  double paragraphSpacing,  TextAlign textAlign,  Color? backgroundColor,  Color? textColor,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingState() when $default != null:
return $default(_that.fontSize,_that.lineHeight,_that.fontFamily,_that.sidePadding,_that.firstLineIndentEm,_that.paragraphSpacing,_that.textAlign,_that.backgroundColor,_that.textColor,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fontSize,  double lineHeight,  String fontFamily,  double sidePadding,  double firstLineIndentEm,  double paragraphSpacing,  TextAlign textAlign,  Color? backgroundColor,  Color? textColor,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _ReadingState():
return $default(_that.fontSize,_that.lineHeight,_that.fontFamily,_that.sidePadding,_that.firstLineIndentEm,_that.paragraphSpacing,_that.textAlign,_that.backgroundColor,_that.textColor,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fontSize,  double lineHeight,  String fontFamily,  double sidePadding,  double firstLineIndentEm,  double paragraphSpacing,  TextAlign textAlign,  Color? backgroundColor,  Color? textColor,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _ReadingState() when $default != null:
return $default(_that.fontSize,_that.lineHeight,_that.fontFamily,_that.sidePadding,_that.firstLineIndentEm,_that.paragraphSpacing,_that.textAlign,_that.backgroundColor,_that.textColor,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ReadingState implements ReadingState {
  const _ReadingState({this.fontSize = 16.0, this.lineHeight = 1.5, this.fontFamily = 'default', this.sidePadding = 20.0, this.firstLineIndentEm = 2.0, this.paragraphSpacing = 8.0, this.textAlign = TextAlign.justify, this.backgroundColor, this.textColor, this.isLoading = false});
  

@override@JsonKey() final  double fontSize;
@override@JsonKey() final  double lineHeight;
@override@JsonKey() final  String fontFamily;
@override@JsonKey() final  double sidePadding;
@override@JsonKey() final  double firstLineIndentEm;
@override@JsonKey() final  double paragraphSpacing;
@override@JsonKey() final  TextAlign textAlign;
@override final  Color? backgroundColor;
@override final  Color? textColor;
@override@JsonKey() final  bool isLoading;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingStateCopyWith<_ReadingState> get copyWith => __$ReadingStateCopyWithImpl<_ReadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingState&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.sidePadding, sidePadding) || other.sidePadding == sidePadding)&&(identical(other.firstLineIndentEm, firstLineIndentEm) || other.firstLineIndentEm == firstLineIndentEm)&&(identical(other.paragraphSpacing, paragraphSpacing) || other.paragraphSpacing == paragraphSpacing)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,fontSize,lineHeight,fontFamily,sidePadding,firstLineIndentEm,paragraphSpacing,textAlign,backgroundColor,textColor,isLoading);

@override
String toString() {
  return 'ReadingState(fontSize: $fontSize, lineHeight: $lineHeight, fontFamily: $fontFamily, sidePadding: $sidePadding, firstLineIndentEm: $firstLineIndentEm, paragraphSpacing: $paragraphSpacing, textAlign: $textAlign, backgroundColor: $backgroundColor, textColor: $textColor, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$ReadingStateCopyWith<$Res> implements $ReadingStateCopyWith<$Res> {
  factory _$ReadingStateCopyWith(_ReadingState value, $Res Function(_ReadingState) _then) = __$ReadingStateCopyWithImpl;
@override @useResult
$Res call({
 double fontSize, double lineHeight, String fontFamily, double sidePadding, double firstLineIndentEm, double paragraphSpacing, TextAlign textAlign, Color? backgroundColor, Color? textColor, bool isLoading
});




}
/// @nodoc
class __$ReadingStateCopyWithImpl<$Res>
    implements _$ReadingStateCopyWith<$Res> {
  __$ReadingStateCopyWithImpl(this._self, this._then);

  final _ReadingState _self;
  final $Res Function(_ReadingState) _then;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontSize = null,Object? lineHeight = null,Object? fontFamily = null,Object? sidePadding = null,Object? firstLineIndentEm = null,Object? paragraphSpacing = null,Object? textAlign = null,Object? backgroundColor = freezed,Object? textColor = freezed,Object? isLoading = null,}) {
  return _then(_ReadingState(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,sidePadding: null == sidePadding ? _self.sidePadding : sidePadding // ignore: cast_nullable_to_non_nullable
as double,firstLineIndentEm: null == firstLineIndentEm ? _self.firstLineIndentEm : firstLineIndentEm // ignore: cast_nullable_to_non_nullable
as double,paragraphSpacing: null == paragraphSpacing ? _self.paragraphSpacing : paragraphSpacing // ignore: cast_nullable_to_non_nullable
as double,textAlign: null == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as TextAlign,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color?,textColor: freezed == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
