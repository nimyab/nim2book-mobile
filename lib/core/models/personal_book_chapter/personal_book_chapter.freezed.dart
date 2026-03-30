// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_book_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalBookChapter {

 String get id; int get order; String get title; String get translatedTitle; String get contentUrl; String get createdAt;
/// Create a copy of PersonalBookChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalBookChapterCopyWith<PersonalBookChapter> get copyWith => _$PersonalBookChapterCopyWithImpl<PersonalBookChapter>(this as PersonalBookChapter, _$identity);

  /// Serializes this PersonalBookChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalBookChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.translatedTitle, translatedTitle) || other.translatedTitle == translatedTitle)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,translatedTitle,contentUrl,createdAt);

@override
String toString() {
  return 'PersonalBookChapter(id: $id, order: $order, title: $title, translatedTitle: $translatedTitle, contentUrl: $contentUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PersonalBookChapterCopyWith<$Res>  {
  factory $PersonalBookChapterCopyWith(PersonalBookChapter value, $Res Function(PersonalBookChapter) _then) = _$PersonalBookChapterCopyWithImpl;
@useResult
$Res call({
 String id, int order, String title, String translatedTitle, String contentUrl, String createdAt
});




}
/// @nodoc
class _$PersonalBookChapterCopyWithImpl<$Res>
    implements $PersonalBookChapterCopyWith<$Res> {
  _$PersonalBookChapterCopyWithImpl(this._self, this._then);

  final PersonalBookChapter _self;
  final $Res Function(PersonalBookChapter) _then;

/// Create a copy of PersonalBookChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? title = null,Object? translatedTitle = null,Object? contentUrl = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,translatedTitle: null == translatedTitle ? _self.translatedTitle : translatedTitle // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalBookChapter].
extension PersonalBookChapterPatterns on PersonalBookChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalBookChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalBookChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalBookChapter value)  $default,){
final _that = this;
switch (_that) {
case _PersonalBookChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalBookChapter value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalBookChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int order,  String title,  String translatedTitle,  String contentUrl,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalBookChapter() when $default != null:
return $default(_that.id,_that.order,_that.title,_that.translatedTitle,_that.contentUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int order,  String title,  String translatedTitle,  String contentUrl,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _PersonalBookChapter():
return $default(_that.id,_that.order,_that.title,_that.translatedTitle,_that.contentUrl,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int order,  String title,  String translatedTitle,  String contentUrl,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PersonalBookChapter() when $default != null:
return $default(_that.id,_that.order,_that.title,_that.translatedTitle,_that.contentUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalBookChapter implements PersonalBookChapter {
  const _PersonalBookChapter({required this.id, required this.order, required this.title, required this.translatedTitle, required this.contentUrl, required this.createdAt});
  factory _PersonalBookChapter.fromJson(Map<String, dynamic> json) => _$PersonalBookChapterFromJson(json);

@override final  String id;
@override final  int order;
@override final  String title;
@override final  String translatedTitle;
@override final  String contentUrl;
@override final  String createdAt;

/// Create a copy of PersonalBookChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalBookChapterCopyWith<_PersonalBookChapter> get copyWith => __$PersonalBookChapterCopyWithImpl<_PersonalBookChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalBookChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalBookChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.translatedTitle, translatedTitle) || other.translatedTitle == translatedTitle)&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,translatedTitle,contentUrl,createdAt);

@override
String toString() {
  return 'PersonalBookChapter(id: $id, order: $order, title: $title, translatedTitle: $translatedTitle, contentUrl: $contentUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PersonalBookChapterCopyWith<$Res> implements $PersonalBookChapterCopyWith<$Res> {
  factory _$PersonalBookChapterCopyWith(_PersonalBookChapter value, $Res Function(_PersonalBookChapter) _then) = __$PersonalBookChapterCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String title, String translatedTitle, String contentUrl, String createdAt
});




}
/// @nodoc
class __$PersonalBookChapterCopyWithImpl<$Res>
    implements _$PersonalBookChapterCopyWith<$Res> {
  __$PersonalBookChapterCopyWithImpl(this._self, this._then);

  final _PersonalBookChapter _self;
  final $Res Function(_PersonalBookChapter) _then;

/// Create a copy of PersonalBookChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = null,Object? translatedTitle = null,Object? contentUrl = null,Object? createdAt = null,}) {
  return _then(_PersonalBookChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,translatedTitle: null == translatedTitle ? _self.translatedTitle : translatedTitle // ignore: cast_nullable_to_non_nullable
as String,contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
