// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookChapter {

 String get id; int get order; String get title; String get translatedTitle; String get contentURL; String get createdAt;
/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookChapterCopyWith<BookChapter> get copyWith => _$BookChapterCopyWithImpl<BookChapter>(this as BookChapter, _$identity);

  /// Serializes this BookChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.translatedTitle, translatedTitle) || other.translatedTitle == translatedTitle)&&(identical(other.contentURL, contentURL) || other.contentURL == contentURL)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,translatedTitle,contentURL,createdAt);

@override
String toString() {
  return 'BookChapter(id: $id, order: $order, title: $title, translatedTitle: $translatedTitle, contentURL: $contentURL, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookChapterCopyWith<$Res>  {
  factory $BookChapterCopyWith(BookChapter value, $Res Function(BookChapter) _then) = _$BookChapterCopyWithImpl;
@useResult
$Res call({
 String id, int order, String title, String translatedTitle, String contentURL, String createdAt
});




}
/// @nodoc
class _$BookChapterCopyWithImpl<$Res>
    implements $BookChapterCopyWith<$Res> {
  _$BookChapterCopyWithImpl(this._self, this._then);

  final BookChapter _self;
  final $Res Function(BookChapter) _then;

/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? title = null,Object? translatedTitle = null,Object? contentURL = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,translatedTitle: null == translatedTitle ? _self.translatedTitle : translatedTitle // ignore: cast_nullable_to_non_nullable
as String,contentURL: null == contentURL ? _self.contentURL : contentURL // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookChapter].
extension BookChapterPatterns on BookChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookChapter value)  $default,){
final _that = this;
switch (_that) {
case _BookChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookChapter value)?  $default,){
final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int order,  String title,  String translatedTitle,  String contentURL,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
return $default(_that.id,_that.order,_that.title,_that.translatedTitle,_that.contentURL,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int order,  String title,  String translatedTitle,  String contentURL,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _BookChapter():
return $default(_that.id,_that.order,_that.title,_that.translatedTitle,_that.contentURL,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int order,  String title,  String translatedTitle,  String contentURL,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BookChapter() when $default != null:
return $default(_that.id,_that.order,_that.title,_that.translatedTitle,_that.contentURL,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookChapter implements BookChapter {
  const _BookChapter({required this.id, required this.order, required this.title, required this.translatedTitle, required this.contentURL, required this.createdAt});
  factory _BookChapter.fromJson(Map<String, dynamic> json) => _$BookChapterFromJson(json);

@override final  String id;
@override final  int order;
@override final  String title;
@override final  String translatedTitle;
@override final  String contentURL;
@override final  String createdAt;

/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookChapterCopyWith<_BookChapter> get copyWith => __$BookChapterCopyWithImpl<_BookChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.translatedTitle, translatedTitle) || other.translatedTitle == translatedTitle)&&(identical(other.contentURL, contentURL) || other.contentURL == contentURL)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,translatedTitle,contentURL,createdAt);

@override
String toString() {
  return 'BookChapter(id: $id, order: $order, title: $title, translatedTitle: $translatedTitle, contentURL: $contentURL, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookChapterCopyWith<$Res> implements $BookChapterCopyWith<$Res> {
  factory _$BookChapterCopyWith(_BookChapter value, $Res Function(_BookChapter) _then) = __$BookChapterCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String title, String translatedTitle, String contentURL, String createdAt
});




}
/// @nodoc
class __$BookChapterCopyWithImpl<$Res>
    implements _$BookChapterCopyWith<$Res> {
  __$BookChapterCopyWithImpl(this._self, this._then);

  final _BookChapter _self;
  final $Res Function(_BookChapter) _then;

/// Create a copy of BookChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = null,Object? translatedTitle = null,Object? contentURL = null,Object? createdAt = null,}) {
  return _then(_BookChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,translatedTitle: null == translatedTitle ? _self.translatedTitle : translatedTitle // ignore: cast_nullable_to_non_nullable
as String,contentURL: null == contentURL ? _self.contentURL : contentURL // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
