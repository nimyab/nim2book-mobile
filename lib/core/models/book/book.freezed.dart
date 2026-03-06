// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Book {

 String get id; String get title; String get originalLang; String get translatedLang; String get createdAt; Author? get author; String? get coverUrl; List<Genre>? get genres; List<BookChapter>? get bookChapters; ProcessStatus? get processStatus;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalLang, originalLang) || other.originalLang == originalLang)&&(identical(other.translatedLang, translatedLang) || other.translatedLang == translatedLang)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.bookChapters, bookChapters)&&(identical(other.processStatus, processStatus) || other.processStatus == processStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalLang,translatedLang,createdAt,author,coverUrl,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(bookChapters),processStatus);

@override
String toString() {
  return 'Book(id: $id, title: $title, originalLang: $originalLang, translatedLang: $translatedLang, createdAt: $createdAt, author: $author, coverUrl: $coverUrl, genres: $genres, bookChapters: $bookChapters, processStatus: $processStatus)';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String originalLang, String translatedLang, String createdAt, Author? author, String? coverUrl, List<Genre>? genres, List<BookChapter>? bookChapters, ProcessStatus? processStatus
});


$AuthorCopyWith<$Res>? get author;

}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? originalLang = null,Object? translatedLang = null,Object? createdAt = null,Object? author = freezed,Object? coverUrl = freezed,Object? genres = freezed,Object? bookChapters = freezed,Object? processStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalLang: null == originalLang ? _self.originalLang : originalLang // ignore: cast_nullable_to_non_nullable
as String,translatedLang: null == translatedLang ? _self.translatedLang : translatedLang // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,bookChapters: freezed == bookChapters ? _self.bookChapters : bookChapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,processStatus: freezed == processStatus ? _self.processStatus : processStatus // ignore: cast_nullable_to_non_nullable
as ProcessStatus?,
  ));
}
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $AuthorCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String originalLang,  String translatedLang,  String createdAt,  Author? author,  String? coverUrl,  List<Genre>? genres,  List<BookChapter>? bookChapters,  ProcessStatus? processStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.originalLang,_that.translatedLang,_that.createdAt,_that.author,_that.coverUrl,_that.genres,_that.bookChapters,_that.processStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String originalLang,  String translatedLang,  String createdAt,  Author? author,  String? coverUrl,  List<Genre>? genres,  List<BookChapter>? bookChapters,  ProcessStatus? processStatus)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.title,_that.originalLang,_that.translatedLang,_that.createdAt,_that.author,_that.coverUrl,_that.genres,_that.bookChapters,_that.processStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String originalLang,  String translatedLang,  String createdAt,  Author? author,  String? coverUrl,  List<Genre>? genres,  List<BookChapter>? bookChapters,  ProcessStatus? processStatus)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.title,_that.originalLang,_that.translatedLang,_that.createdAt,_that.author,_that.coverUrl,_that.genres,_that.bookChapters,_that.processStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Book implements Book {
  const _Book({required this.id, required this.title, required this.originalLang, required this.translatedLang, required this.createdAt, this.author, this.coverUrl, final  List<Genre>? genres, final  List<BookChapter>? bookChapters, this.processStatus}): _genres = genres,_bookChapters = bookChapters;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

@override final  String id;
@override final  String title;
@override final  String originalLang;
@override final  String translatedLang;
@override final  String createdAt;
@override final  Author? author;
@override final  String? coverUrl;
 final  List<Genre>? _genres;
@override List<Genre>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<BookChapter>? _bookChapters;
@override List<BookChapter>? get bookChapters {
  final value = _bookChapters;
  if (value == null) return null;
  if (_bookChapters is EqualUnmodifiableListView) return _bookChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  ProcessStatus? processStatus;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalLang, originalLang) || other.originalLang == originalLang)&&(identical(other.translatedLang, translatedLang) || other.translatedLang == translatedLang)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._bookChapters, _bookChapters)&&(identical(other.processStatus, processStatus) || other.processStatus == processStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalLang,translatedLang,createdAt,author,coverUrl,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_bookChapters),processStatus);

@override
String toString() {
  return 'Book(id: $id, title: $title, originalLang: $originalLang, translatedLang: $translatedLang, createdAt: $createdAt, author: $author, coverUrl: $coverUrl, genres: $genres, bookChapters: $bookChapters, processStatus: $processStatus)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String originalLang, String translatedLang, String createdAt, Author? author, String? coverUrl, List<Genre>? genres, List<BookChapter>? bookChapters, ProcessStatus? processStatus
});


@override $AuthorCopyWith<$Res>? get author;

}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? originalLang = null,Object? translatedLang = null,Object? createdAt = null,Object? author = freezed,Object? coverUrl = freezed,Object? genres = freezed,Object? bookChapters = freezed,Object? processStatus = freezed,}) {
  return _then(_Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalLang: null == originalLang ? _self.originalLang : originalLang // ignore: cast_nullable_to_non_nullable
as String,translatedLang: null == translatedLang ? _self.translatedLang : translatedLang // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,bookChapters: freezed == bookChapters ? _self._bookChapters : bookChapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,processStatus: freezed == processStatus ? _self.processStatus : processStatus // ignore: cast_nullable_to_non_nullable
as ProcessStatus?,
  ));
}

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $AuthorCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}

// dart format on
