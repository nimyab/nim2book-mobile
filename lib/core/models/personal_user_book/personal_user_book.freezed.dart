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

 String get id; String get title; String get originalLang; String get translatedLang; String get createdAt; Author? get author; User? get user; String? get coverUrl; List<Genre>? get genres; List<PersonalBookChapter>? get personalBookChapters; ProcessStatus? get processStatus;
/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalUserBookCopyWith<PersonalUserBook> get copyWith => _$PersonalUserBookCopyWithImpl<PersonalUserBook>(this as PersonalUserBook, _$identity);

  /// Serializes this PersonalUserBook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalUserBook&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalLang, originalLang) || other.originalLang == originalLang)&&(identical(other.translatedLang, translatedLang) || other.translatedLang == translatedLang)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.user, user) || other.user == user)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.personalBookChapters, personalBookChapters)&&(identical(other.processStatus, processStatus) || other.processStatus == processStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalLang,translatedLang,createdAt,author,user,coverUrl,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(personalBookChapters),processStatus);

@override
String toString() {
  return 'PersonalUserBook(id: $id, title: $title, originalLang: $originalLang, translatedLang: $translatedLang, createdAt: $createdAt, author: $author, user: $user, coverUrl: $coverUrl, genres: $genres, personalBookChapters: $personalBookChapters, processStatus: $processStatus)';
}


}

/// @nodoc
abstract mixin class $PersonalUserBookCopyWith<$Res>  {
  factory $PersonalUserBookCopyWith(PersonalUserBook value, $Res Function(PersonalUserBook) _then) = _$PersonalUserBookCopyWithImpl;
@useResult
$Res call({
 String id, String title, String originalLang, String translatedLang, String createdAt, Author? author, User? user, String? coverUrl, List<Genre>? genres, List<PersonalBookChapter>? personalBookChapters, ProcessStatus? processStatus
});


$AuthorCopyWith<$Res>? get author;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$PersonalUserBookCopyWithImpl<$Res>
    implements $PersonalUserBookCopyWith<$Res> {
  _$PersonalUserBookCopyWithImpl(this._self, this._then);

  final PersonalUserBook _self;
  final $Res Function(PersonalUserBook) _then;

/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? originalLang = null,Object? translatedLang = null,Object? createdAt = null,Object? author = freezed,Object? user = freezed,Object? coverUrl = freezed,Object? genres = freezed,Object? personalBookChapters = freezed,Object? processStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalLang: null == originalLang ? _self.originalLang : originalLang // ignore: cast_nullable_to_non_nullable
as String,translatedLang: null == translatedLang ? _self.translatedLang : translatedLang // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,personalBookChapters: freezed == personalBookChapters ? _self.personalBookChapters : personalBookChapters // ignore: cast_nullable_to_non_nullable
as List<PersonalBookChapter>?,processStatus: freezed == processStatus ? _self.processStatus : processStatus // ignore: cast_nullable_to_non_nullable
as ProcessStatus?,
  ));
}
/// Create a copy of PersonalUserBook
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
}/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String originalLang,  String translatedLang,  String createdAt,  Author? author,  User? user,  String? coverUrl,  List<Genre>? genres,  List<PersonalBookChapter>? personalBookChapters,  ProcessStatus? processStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalUserBook() when $default != null:
return $default(_that.id,_that.title,_that.originalLang,_that.translatedLang,_that.createdAt,_that.author,_that.user,_that.coverUrl,_that.genres,_that.personalBookChapters,_that.processStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String originalLang,  String translatedLang,  String createdAt,  Author? author,  User? user,  String? coverUrl,  List<Genre>? genres,  List<PersonalBookChapter>? personalBookChapters,  ProcessStatus? processStatus)  $default,) {final _that = this;
switch (_that) {
case _PersonalUserBook():
return $default(_that.id,_that.title,_that.originalLang,_that.translatedLang,_that.createdAt,_that.author,_that.user,_that.coverUrl,_that.genres,_that.personalBookChapters,_that.processStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String originalLang,  String translatedLang,  String createdAt,  Author? author,  User? user,  String? coverUrl,  List<Genre>? genres,  List<PersonalBookChapter>? personalBookChapters,  ProcessStatus? processStatus)?  $default,) {final _that = this;
switch (_that) {
case _PersonalUserBook() when $default != null:
return $default(_that.id,_that.title,_that.originalLang,_that.translatedLang,_that.createdAt,_that.author,_that.user,_that.coverUrl,_that.genres,_that.personalBookChapters,_that.processStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalUserBook implements PersonalUserBook {
  const _PersonalUserBook({required this.id, required this.title, required this.originalLang, required this.translatedLang, required this.createdAt, this.author, this.user, this.coverUrl, final  List<Genre>? genres, final  List<PersonalBookChapter>? personalBookChapters, this.processStatus}): _genres = genres,_personalBookChapters = personalBookChapters;
  factory _PersonalUserBook.fromJson(Map<String, dynamic> json) => _$PersonalUserBookFromJson(json);

@override final  String id;
@override final  String title;
@override final  String originalLang;
@override final  String translatedLang;
@override final  String createdAt;
@override final  Author? author;
@override final  User? user;
@override final  String? coverUrl;
 final  List<Genre>? _genres;
@override List<Genre>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PersonalBookChapter>? _personalBookChapters;
@override List<PersonalBookChapter>? get personalBookChapters {
  final value = _personalBookChapters;
  if (value == null) return null;
  if (_personalBookChapters is EqualUnmodifiableListView) return _personalBookChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  ProcessStatus? processStatus;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalUserBook&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalLang, originalLang) || other.originalLang == originalLang)&&(identical(other.translatedLang, translatedLang) || other.translatedLang == translatedLang)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.author, author) || other.author == author)&&(identical(other.user, user) || other.user == user)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._personalBookChapters, _personalBookChapters)&&(identical(other.processStatus, processStatus) || other.processStatus == processStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalLang,translatedLang,createdAt,author,user,coverUrl,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_personalBookChapters),processStatus);

@override
String toString() {
  return 'PersonalUserBook(id: $id, title: $title, originalLang: $originalLang, translatedLang: $translatedLang, createdAt: $createdAt, author: $author, user: $user, coverUrl: $coverUrl, genres: $genres, personalBookChapters: $personalBookChapters, processStatus: $processStatus)';
}


}

/// @nodoc
abstract mixin class _$PersonalUserBookCopyWith<$Res> implements $PersonalUserBookCopyWith<$Res> {
  factory _$PersonalUserBookCopyWith(_PersonalUserBook value, $Res Function(_PersonalUserBook) _then) = __$PersonalUserBookCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String originalLang, String translatedLang, String createdAt, Author? author, User? user, String? coverUrl, List<Genre>? genres, List<PersonalBookChapter>? personalBookChapters, ProcessStatus? processStatus
});


@override $AuthorCopyWith<$Res>? get author;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$PersonalUserBookCopyWithImpl<$Res>
    implements _$PersonalUserBookCopyWith<$Res> {
  __$PersonalUserBookCopyWithImpl(this._self, this._then);

  final _PersonalUserBook _self;
  final $Res Function(_PersonalUserBook) _then;

/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? originalLang = null,Object? translatedLang = null,Object? createdAt = null,Object? author = freezed,Object? user = freezed,Object? coverUrl = freezed,Object? genres = freezed,Object? personalBookChapters = freezed,Object? processStatus = freezed,}) {
  return _then(_PersonalUserBook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalLang: null == originalLang ? _self.originalLang : originalLang // ignore: cast_nullable_to_non_nullable
as String,translatedLang: null == translatedLang ? _self.translatedLang : translatedLang // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>?,personalBookChapters: freezed == personalBookChapters ? _self._personalBookChapters : personalBookChapters // ignore: cast_nullable_to_non_nullable
as List<PersonalBookChapter>?,processStatus: freezed == processStatus ? _self.processStatus : processStatus // ignore: cast_nullable_to_non_nullable
as ProcessStatus?,
  ));
}

/// Create a copy of PersonalUserBook
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
}/// Create a copy of PersonalUserBook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
