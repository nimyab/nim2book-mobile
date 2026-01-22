// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleAccount {

 String get sub; String get email; String get name; bool get emailVerified; String? get picture;
/// Create a copy of GoogleAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleAccountCopyWith<GoogleAccount> get copyWith => _$GoogleAccountCopyWithImpl<GoogleAccount>(this as GoogleAccount, _$identity);

  /// Serializes this GoogleAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleAccount&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,email,name,emailVerified,picture);

@override
String toString() {
  return 'GoogleAccount(sub: $sub, email: $email, name: $name, emailVerified: $emailVerified, picture: $picture)';
}


}

/// @nodoc
abstract mixin class $GoogleAccountCopyWith<$Res>  {
  factory $GoogleAccountCopyWith(GoogleAccount value, $Res Function(GoogleAccount) _then) = _$GoogleAccountCopyWithImpl;
@useResult
$Res call({
 String sub, String email, String name, bool emailVerified, String? picture
});




}
/// @nodoc
class _$GoogleAccountCopyWithImpl<$Res>
    implements $GoogleAccountCopyWith<$Res> {
  _$GoogleAccountCopyWithImpl(this._self, this._then);

  final GoogleAccount _self;
  final $Res Function(GoogleAccount) _then;

/// Create a copy of GoogleAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sub = null,Object? email = null,Object? name = null,Object? emailVerified = null,Object? picture = freezed,}) {
  return _then(_self.copyWith(
sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleAccount].
extension GoogleAccountPatterns on GoogleAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleAccount value)  $default,){
final _that = this;
switch (_that) {
case _GoogleAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleAccount value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sub,  String email,  String name,  bool emailVerified,  String? picture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleAccount() when $default != null:
return $default(_that.sub,_that.email,_that.name,_that.emailVerified,_that.picture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sub,  String email,  String name,  bool emailVerified,  String? picture)  $default,) {final _that = this;
switch (_that) {
case _GoogleAccount():
return $default(_that.sub,_that.email,_that.name,_that.emailVerified,_that.picture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sub,  String email,  String name,  bool emailVerified,  String? picture)?  $default,) {final _that = this;
switch (_that) {
case _GoogleAccount() when $default != null:
return $default(_that.sub,_that.email,_that.name,_that.emailVerified,_that.picture);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleAccount implements GoogleAccount {
  const _GoogleAccount({required this.sub, required this.email, required this.name, required this.emailVerified, this.picture});
  factory _GoogleAccount.fromJson(Map<String, dynamic> json) => _$GoogleAccountFromJson(json);

@override final  String sub;
@override final  String email;
@override final  String name;
@override final  bool emailVerified;
@override final  String? picture;

/// Create a copy of GoogleAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleAccountCopyWith<_GoogleAccount> get copyWith => __$GoogleAccountCopyWithImpl<_GoogleAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleAccount&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,email,name,emailVerified,picture);

@override
String toString() {
  return 'GoogleAccount(sub: $sub, email: $email, name: $name, emailVerified: $emailVerified, picture: $picture)';
}


}

/// @nodoc
abstract mixin class _$GoogleAccountCopyWith<$Res> implements $GoogleAccountCopyWith<$Res> {
  factory _$GoogleAccountCopyWith(_GoogleAccount value, $Res Function(_GoogleAccount) _then) = __$GoogleAccountCopyWithImpl;
@override @useResult
$Res call({
 String sub, String email, String name, bool emailVerified, String? picture
});




}
/// @nodoc
class __$GoogleAccountCopyWithImpl<$Res>
    implements _$GoogleAccountCopyWith<$Res> {
  __$GoogleAccountCopyWithImpl(this._self, this._then);

  final _GoogleAccount _self;
  final $Res Function(_GoogleAccount) _then;

/// Create a copy of GoogleAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sub = null,Object? email = null,Object? name = null,Object? emailVerified = null,Object? picture = freezed,}) {
  return _then(_GoogleAccount(
sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EmailPasswordAccount {

 String get id; String get email;
/// Create a copy of EmailPasswordAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailPasswordAccountCopyWith<EmailPasswordAccount> get copyWith => _$EmailPasswordAccountCopyWithImpl<EmailPasswordAccount>(this as EmailPasswordAccount, _$identity);

  /// Serializes this EmailPasswordAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailPasswordAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email);

@override
String toString() {
  return 'EmailPasswordAccount(id: $id, email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailPasswordAccountCopyWith<$Res>  {
  factory $EmailPasswordAccountCopyWith(EmailPasswordAccount value, $Res Function(EmailPasswordAccount) _then) = _$EmailPasswordAccountCopyWithImpl;
@useResult
$Res call({
 String id, String email
});




}
/// @nodoc
class _$EmailPasswordAccountCopyWithImpl<$Res>
    implements $EmailPasswordAccountCopyWith<$Res> {
  _$EmailPasswordAccountCopyWithImpl(this._self, this._then);

  final EmailPasswordAccount _self;
  final $Res Function(EmailPasswordAccount) _then;

/// Create a copy of EmailPasswordAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailPasswordAccount].
extension EmailPasswordAccountPatterns on EmailPasswordAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailPasswordAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailPasswordAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailPasswordAccount value)  $default,){
final _that = this;
switch (_that) {
case _EmailPasswordAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailPasswordAccount value)?  $default,){
final _that = this;
switch (_that) {
case _EmailPasswordAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailPasswordAccount() when $default != null:
return $default(_that.id,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email)  $default,) {final _that = this;
switch (_that) {
case _EmailPasswordAccount():
return $default(_that.id,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email)?  $default,) {final _that = this;
switch (_that) {
case _EmailPasswordAccount() when $default != null:
return $default(_that.id,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailPasswordAccount implements EmailPasswordAccount {
  const _EmailPasswordAccount({required this.id, required this.email});
  factory _EmailPasswordAccount.fromJson(Map<String, dynamic> json) => _$EmailPasswordAccountFromJson(json);

@override final  String id;
@override final  String email;

/// Create a copy of EmailPasswordAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailPasswordAccountCopyWith<_EmailPasswordAccount> get copyWith => __$EmailPasswordAccountCopyWithImpl<_EmailPasswordAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailPasswordAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailPasswordAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email);

@override
String toString() {
  return 'EmailPasswordAccount(id: $id, email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailPasswordAccountCopyWith<$Res> implements $EmailPasswordAccountCopyWith<$Res> {
  factory _$EmailPasswordAccountCopyWith(_EmailPasswordAccount value, $Res Function(_EmailPasswordAccount) _then) = __$EmailPasswordAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String email
});




}
/// @nodoc
class __$EmailPasswordAccountCopyWithImpl<$Res>
    implements _$EmailPasswordAccountCopyWith<$Res> {
  __$EmailPasswordAccountCopyWithImpl(this._self, this._then);

  final _EmailPasswordAccount _self;
  final $Res Function(_EmailPasswordAccount) _then;

/// Create a copy of EmailPasswordAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,}) {
  return _then(_EmailPasswordAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


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


/// @nodoc
mixin _$User {

 String get id; bool get isAdmin; bool get isVIP; GoogleAccount? get googleAccount; EmailPasswordAccount? get emailPasswordAccount; Map<String, dynamic>? get metadata; List<PersonalUserBook>? get personalUserBooks;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isVIP, isVIP) || other.isVIP == isVIP)&&(identical(other.googleAccount, googleAccount) || other.googleAccount == googleAccount)&&(identical(other.emailPasswordAccount, emailPasswordAccount) || other.emailPasswordAccount == emailPasswordAccount)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&const DeepCollectionEquality().equals(other.personalUserBooks, personalUserBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isAdmin,isVIP,googleAccount,emailPasswordAccount,const DeepCollectionEquality().hash(metadata),const DeepCollectionEquality().hash(personalUserBooks));

@override
String toString() {
  return 'User(id: $id, isAdmin: $isAdmin, isVIP: $isVIP, googleAccount: $googleAccount, emailPasswordAccount: $emailPasswordAccount, metadata: $metadata, personalUserBooks: $personalUserBooks)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, bool isAdmin, bool isVIP, GoogleAccount? googleAccount, EmailPasswordAccount? emailPasswordAccount, Map<String, dynamic>? metadata, List<PersonalUserBook>? personalUserBooks
});


$GoogleAccountCopyWith<$Res>? get googleAccount;$EmailPasswordAccountCopyWith<$Res>? get emailPasswordAccount;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isAdmin = null,Object? isVIP = null,Object? googleAccount = freezed,Object? emailPasswordAccount = freezed,Object? metadata = freezed,Object? personalUserBooks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isVIP: null == isVIP ? _self.isVIP : isVIP // ignore: cast_nullable_to_non_nullable
as bool,googleAccount: freezed == googleAccount ? _self.googleAccount : googleAccount // ignore: cast_nullable_to_non_nullable
as GoogleAccount?,emailPasswordAccount: freezed == emailPasswordAccount ? _self.emailPasswordAccount : emailPasswordAccount // ignore: cast_nullable_to_non_nullable
as EmailPasswordAccount?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,personalUserBooks: freezed == personalUserBooks ? _self.personalUserBooks : personalUserBooks // ignore: cast_nullable_to_non_nullable
as List<PersonalUserBook>?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleAccountCopyWith<$Res>? get googleAccount {
    if (_self.googleAccount == null) {
    return null;
  }

  return $GoogleAccountCopyWith<$Res>(_self.googleAccount!, (value) {
    return _then(_self.copyWith(googleAccount: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmailPasswordAccountCopyWith<$Res>? get emailPasswordAccount {
    if (_self.emailPasswordAccount == null) {
    return null;
  }

  return $EmailPasswordAccountCopyWith<$Res>(_self.emailPasswordAccount!, (value) {
    return _then(_self.copyWith(emailPasswordAccount: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isAdmin,  bool isVIP,  GoogleAccount? googleAccount,  EmailPasswordAccount? emailPasswordAccount,  Map<String, dynamic>? metadata,  List<PersonalUserBook>? personalUserBooks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.isAdmin,_that.isVIP,_that.googleAccount,_that.emailPasswordAccount,_that.metadata,_that.personalUserBooks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isAdmin,  bool isVIP,  GoogleAccount? googleAccount,  EmailPasswordAccount? emailPasswordAccount,  Map<String, dynamic>? metadata,  List<PersonalUserBook>? personalUserBooks)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.isAdmin,_that.isVIP,_that.googleAccount,_that.emailPasswordAccount,_that.metadata,_that.personalUserBooks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isAdmin,  bool isVIP,  GoogleAccount? googleAccount,  EmailPasswordAccount? emailPasswordAccount,  Map<String, dynamic>? metadata,  List<PersonalUserBook>? personalUserBooks)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.isAdmin,_that.isVIP,_that.googleAccount,_that.emailPasswordAccount,_that.metadata,_that.personalUserBooks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.isAdmin, required this.isVIP, this.googleAccount, this.emailPasswordAccount, final  Map<String, dynamic>? metadata, final  List<PersonalUserBook>? personalUserBooks}): _metadata = metadata,_personalUserBooks = personalUserBooks;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  bool isAdmin;
@override final  bool isVIP;
@override final  GoogleAccount? googleAccount;
@override final  EmailPasswordAccount? emailPasswordAccount;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<PersonalUserBook>? _personalUserBooks;
@override List<PersonalUserBook>? get personalUserBooks {
  final value = _personalUserBooks;
  if (value == null) return null;
  if (_personalUserBooks is EqualUnmodifiableListView) return _personalUserBooks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isVIP, isVIP) || other.isVIP == isVIP)&&(identical(other.googleAccount, googleAccount) || other.googleAccount == googleAccount)&&(identical(other.emailPasswordAccount, emailPasswordAccount) || other.emailPasswordAccount == emailPasswordAccount)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&const DeepCollectionEquality().equals(other._personalUserBooks, _personalUserBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isAdmin,isVIP,googleAccount,emailPasswordAccount,const DeepCollectionEquality().hash(_metadata),const DeepCollectionEquality().hash(_personalUserBooks));

@override
String toString() {
  return 'User(id: $id, isAdmin: $isAdmin, isVIP: $isVIP, googleAccount: $googleAccount, emailPasswordAccount: $emailPasswordAccount, metadata: $metadata, personalUserBooks: $personalUserBooks)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isAdmin, bool isVIP, GoogleAccount? googleAccount, EmailPasswordAccount? emailPasswordAccount, Map<String, dynamic>? metadata, List<PersonalUserBook>? personalUserBooks
});


@override $GoogleAccountCopyWith<$Res>? get googleAccount;@override $EmailPasswordAccountCopyWith<$Res>? get emailPasswordAccount;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isAdmin = null,Object? isVIP = null,Object? googleAccount = freezed,Object? emailPasswordAccount = freezed,Object? metadata = freezed,Object? personalUserBooks = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isVIP: null == isVIP ? _self.isVIP : isVIP // ignore: cast_nullable_to_non_nullable
as bool,googleAccount: freezed == googleAccount ? _self.googleAccount : googleAccount // ignore: cast_nullable_to_non_nullable
as GoogleAccount?,emailPasswordAccount: freezed == emailPasswordAccount ? _self.emailPasswordAccount : emailPasswordAccount // ignore: cast_nullable_to_non_nullable
as EmailPasswordAccount?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,personalUserBooks: freezed == personalUserBooks ? _self._personalUserBooks : personalUserBooks // ignore: cast_nullable_to_non_nullable
as List<PersonalUserBook>?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleAccountCopyWith<$Res>? get googleAccount {
    if (_self.googleAccount == null) {
    return null;
  }

  return $GoogleAccountCopyWith<$Res>(_self.googleAccount!, (value) {
    return _then(_self.copyWith(googleAccount: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmailPasswordAccountCopyWith<$Res>? get emailPasswordAccount {
    if (_self.emailPasswordAccount == null) {
    return null;
  }

  return $EmailPasswordAccountCopyWith<$Res>(_self.emailPasswordAccount!, (value) {
    return _then(_self.copyWith(emailPasswordAccount: value));
  });
}
}

// dart format on
