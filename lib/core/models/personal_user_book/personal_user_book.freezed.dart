// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_user_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalUserBook {

 String get id; String get title; String get author; List<String> get chapterPaths; String get userId; String? get cover; List<Genre>? get genres;
/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<PersonalUserBook> get copyWith => _$PersonalUserBookCopyWithImpl<PersonalUserBook>(this as PersonalUserBook, _$identity);

  /// Serializes this PersonalUserBook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalUserBook&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.chapterPaths, chapterPaths)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,author,const DeepCollectionEquality().hash(chapterPaths),userId,cover,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'PersonalUserBook(id: $id, title: $title, author: $author, chapterPaths: $chapterPaths, userId: $userId, cover: $cover, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $PersonalUserBookCopyWith<$Res>  {
  factory $PersonalUserBookCopyWith(PersonalUserBook value, $Res Function(PersonalUserBook) _then) = _$PersonalUserBookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String author, List<String> chapterPaths, String userId, String? cover, List<Genre>? genres
});




}
/// @nodoc
class _$PersonalUserBookCopyWithImpl<$Res>
    implements $PersonalUserBookCopyWith<$Res> {
  _$PersonalUserBookCopyWithImpl(this._self, this._then);

  final PersonalUserBook _self;
  final $Res Function(PersonalUserBook) _then;

/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? author = null,Object? chapterPaths = null,Object? userId = null,Object? cover = freezed,Object? genres = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,chapterPaths: null == chapterPaths ? _self.chapterPaths : chapterPaths // ignore: cast_nullable_to_non_nullable
as List<String>,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalUserBook].
extension PersonalUserBookPatterns on PersonalUserBook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalUserBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalUserBook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalUserBook value)  $default,){
final _that = this;
switch (_that) {
case _PersonalUserBook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalUserBook value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalUserBook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String author,  List<String> chapterPaths,  String userId,  String? cover,  List<Genre>? genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalUserBook() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.chapterPaths,_that.userId,_that.cover,_that.genres);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String author,  List<String> chapterPaths,  String userId,  String? cover,  List<Genre>? genres)  $default,) {final _that = this;
switch (_that) {
case _PersonalUserBook():
return $default(_that.id,_that.title,_that.author,_that.chapterPaths,_that.userId,_that.cover,_that.genres);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String author,  List<String> chapterPaths,  String userId,  String? cover,  List<Genre>? genres)?  $default,) {final _that = this;
switch (_that) {
case _PersonalUserBook() when $default != null:
return $default(_that.id,_that.title,_that.author,_that.chapterPaths,_that.userId,_that.cover,_that.genres);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalUserBook implements PersonalUserBook {
  const _PersonalUserBook({required this.id, required this.title, required this.author, required final  List<String> chapterPaths, required this.userId, this.cover, final  List<Genre>? genres}): _chapterPaths = chapterPaths,_genres = genres;
  factory _PersonalUserBook.fromJson(Map<String, dynamic> json) => _$PersonalUserBookFromJson(json);

@override final  String id;
@override final  String title;
@override final  String author;
 final  List<String> _chapterPaths;
@override List<String> get chapterPaths {
  if (_chapterPaths is EqualUnmodifiableListView) return _chapterPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapterPaths);
}

@override final  String userId;
@override final  String? cover;
 final  List<Genre>? _genres;
@override List<Genre>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalUserBookCopyWith<_PersonalUserBook> get copyWith => __$PersonalUserBookCopyWithImpl<_PersonalUserBook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalUserBookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalUserBook&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._chapterPaths, _chapterPaths)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,author,const DeepCollectionEquality().hash(_chapterPaths),userId,cover,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'PersonalUserBook(id: $id, title: $title, author: $author, chapterPaths: $chapterPaths, userId: $userId, cover: $cover, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$PersonalUserBookCopyWith<$Res> implements $PersonalUserBookCopyWith<$Res> {
  factory _$PersonalUserBookCopyWith(_PersonalUserBook value, $Res Function(_PersonalUserBook) _then) = __$PersonalUserBookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String author, List<String> chapterPaths, String userId, String? cover, List<Genre>? genres
});




}
/// @nodoc
class __$PersonalUserBookCopyWithImpl<$Res>
    implements _$PersonalUserBookCopyWith<$Res> {
  __$PersonalUserBookCopyWithImpl(this._self, this._then);

  final _PersonalUserBook _self;
  final $Res Function(_PersonalUserBook) _then;

/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? author = null,Object? chapterPaths = null,Object? userId = null,Object? cover = freezed,Object? genres = freezed,}) {
  return _then(_PersonalUserBook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,chapterPaths: null == chapterPaths ? _self._chapterPaths : chapterPaths // ignore: cast_nullable_to_non_nullable
as List<String>,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,
  ));
}


}

// dart format on
