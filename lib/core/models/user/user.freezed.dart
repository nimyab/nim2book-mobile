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

 String get id; String get sub; String get email; String get name; bool get emailVerified; String get createdAt; String? get picture;
/// Create a copy of GoogleAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleAccountCopyWith<GoogleAccount> get copyWith => _$GoogleAccountCopyWithImpl<GoogleAccount>(this as GoogleAccount, _$identity);

  /// Serializes this GoogleAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sub,email,name,emailVerified,createdAt,picture);

@override
String toString() {
  return 'GoogleAccount(id: $id, sub: $sub, email: $email, name: $name, emailVerified: $emailVerified, createdAt: $createdAt, picture: $picture)';
}


}

/// @nodoc
abstract mixin class $GoogleAccountCopyWith<$Res>  {
  factory $GoogleAccountCopyWith(GoogleAccount value, $Res Function(GoogleAccount) _then) = _$GoogleAccountCopyWithImpl;
@useResult
$Res call({
 String id, String sub, String email, String name, bool emailVerified, String createdAt, String? picture
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sub = null,Object? email = null,Object? name = null,Object? emailVerified = null,Object? createdAt = null,Object? picture = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sub,  String email,  String name,  bool emailVerified,  String createdAt,  String? picture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleAccount() when $default != null:
return $default(_that.id,_that.sub,_that.email,_that.name,_that.emailVerified,_that.createdAt,_that.picture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sub,  String email,  String name,  bool emailVerified,  String createdAt,  String? picture)  $default,) {final _that = this;
switch (_that) {
case _GoogleAccount():
return $default(_that.id,_that.sub,_that.email,_that.name,_that.emailVerified,_that.createdAt,_that.picture);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sub,  String email,  String name,  bool emailVerified,  String createdAt,  String? picture)?  $default,) {final _that = this;
switch (_that) {
case _GoogleAccount() when $default != null:
return $default(_that.id,_that.sub,_that.email,_that.name,_that.emailVerified,_that.createdAt,_that.picture);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleAccount implements GoogleAccount {
  const _GoogleAccount({required this.id, required this.sub, required this.email, required this.name, required this.emailVerified, required this.createdAt, this.picture});
  factory _GoogleAccount.fromJson(Map<String, dynamic> json) => _$GoogleAccountFromJson(json);

@override final  String id;
@override final  String sub;
@override final  String email;
@override final  String name;
@override final  bool emailVerified;
@override final  String createdAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.picture, picture) || other.picture == picture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sub,email,name,emailVerified,createdAt,picture);

@override
String toString() {
  return 'GoogleAccount(id: $id, sub: $sub, email: $email, name: $name, emailVerified: $emailVerified, createdAt: $createdAt, picture: $picture)';
}


}

/// @nodoc
abstract mixin class _$GoogleAccountCopyWith<$Res> implements $GoogleAccountCopyWith<$Res> {
  factory _$GoogleAccountCopyWith(_GoogleAccount value, $Res Function(_GoogleAccount) _then) = __$GoogleAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String sub, String email, String name, bool emailVerified, String createdAt, String? picture
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sub = null,Object? email = null,Object? name = null,Object? emailVerified = null,Object? createdAt = null,Object? picture = freezed,}) {
  return _then(_GoogleAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,picture: freezed == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BasicAccount {

 String get id; String get email; bool get isVerified; String get createdAt; String? get verifyLink;
/// Create a copy of BasicAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicAccountCopyWith<BasicAccount> get copyWith => _$BasicAccountCopyWithImpl<BasicAccount>(this as BasicAccount, _$identity);

  /// Serializes this BasicAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.verifyLink, verifyLink) || other.verifyLink == verifyLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,isVerified,createdAt,verifyLink);

@override
String toString() {
  return 'BasicAccount(id: $id, email: $email, isVerified: $isVerified, createdAt: $createdAt, verifyLink: $verifyLink)';
}


}

/// @nodoc
abstract mixin class $BasicAccountCopyWith<$Res>  {
  factory $BasicAccountCopyWith(BasicAccount value, $Res Function(BasicAccount) _then) = _$BasicAccountCopyWithImpl;
@useResult
$Res call({
 String id, String email, bool isVerified, String createdAt, String? verifyLink
});




}
/// @nodoc
class _$BasicAccountCopyWithImpl<$Res>
    implements $BasicAccountCopyWith<$Res> {
  _$BasicAccountCopyWithImpl(this._self, this._then);

  final BasicAccount _self;
  final $Res Function(BasicAccount) _then;

/// Create a copy of BasicAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? isVerified = null,Object? createdAt = null,Object? verifyLink = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,verifyLink: freezed == verifyLink ? _self.verifyLink : verifyLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicAccount].
extension BasicAccountPatterns on BasicAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicAccount value)  $default,){
final _that = this;
switch (_that) {
case _BasicAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicAccount value)?  $default,){
final _that = this;
switch (_that) {
case _BasicAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  bool isVerified,  String createdAt,  String? verifyLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicAccount() when $default != null:
return $default(_that.id,_that.email,_that.isVerified,_that.createdAt,_that.verifyLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  bool isVerified,  String createdAt,  String? verifyLink)  $default,) {final _that = this;
switch (_that) {
case _BasicAccount():
return $default(_that.id,_that.email,_that.isVerified,_that.createdAt,_that.verifyLink);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  bool isVerified,  String createdAt,  String? verifyLink)?  $default,) {final _that = this;
switch (_that) {
case _BasicAccount() when $default != null:
return $default(_that.id,_that.email,_that.isVerified,_that.createdAt,_that.verifyLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasicAccount implements BasicAccount {
  const _BasicAccount({required this.id, required this.email, required this.isVerified, required this.createdAt, this.verifyLink});
  factory _BasicAccount.fromJson(Map<String, dynamic> json) => _$BasicAccountFromJson(json);

@override final  String id;
@override final  String email;
@override final  bool isVerified;
@override final  String createdAt;
@override final  String? verifyLink;

/// Create a copy of BasicAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicAccountCopyWith<_BasicAccount> get copyWith => __$BasicAccountCopyWithImpl<_BasicAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.verifyLink, verifyLink) || other.verifyLink == verifyLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,isVerified,createdAt,verifyLink);

@override
String toString() {
  return 'BasicAccount(id: $id, email: $email, isVerified: $isVerified, createdAt: $createdAt, verifyLink: $verifyLink)';
}


}

/// @nodoc
abstract mixin class _$BasicAccountCopyWith<$Res> implements $BasicAccountCopyWith<$Res> {
  factory _$BasicAccountCopyWith(_BasicAccount value, $Res Function(_BasicAccount) _then) = __$BasicAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, bool isVerified, String createdAt, String? verifyLink
});




}
/// @nodoc
class __$BasicAccountCopyWithImpl<$Res>
    implements _$BasicAccountCopyWith<$Res> {
  __$BasicAccountCopyWithImpl(this._self, this._then);

  final _BasicAccount _self;
  final $Res Function(_BasicAccount) _then;

/// Create a copy of BasicAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? isVerified = null,Object? createdAt = null,Object? verifyLink = freezed,}) {
  return _then(_BasicAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,verifyLink: freezed == verifyLink ? _self.verifyLink : verifyLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$User {

 String get id; bool get isAdmin; bool get isVIP; String get createdAt; GoogleAccount? get googleAccount; BasicAccount? get basicAccount; Map<String, dynamic>? get metadata; List<PersonalUserBook>? get personalBooks;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isVIP, isVIP) || other.isVIP == isVIP)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.googleAccount, googleAccount) || other.googleAccount == googleAccount)&&(identical(other.basicAccount, basicAccount) || other.basicAccount == basicAccount)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&const DeepCollectionEquality().equals(other.personalBooks, personalBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isAdmin,isVIP,createdAt,googleAccount,basicAccount,const DeepCollectionEquality().hash(metadata),const DeepCollectionEquality().hash(personalBooks));

@override
String toString() {
  return 'User(id: $id, isAdmin: $isAdmin, isVIP: $isVIP, createdAt: $createdAt, googleAccount: $googleAccount, basicAccount: $basicAccount, metadata: $metadata, personalBooks: $personalBooks)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, bool isAdmin, bool isVIP, String createdAt, GoogleAccount? googleAccount, BasicAccount? basicAccount, Map<String, dynamic>? metadata, List<PersonalUserBook>? personalBooks
});


$GoogleAccountCopyWith<$Res>? get googleAccount;$BasicAccountCopyWith<$Res>? get basicAccount;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isAdmin = null,Object? isVIP = null,Object? createdAt = null,Object? googleAccount = freezed,Object? basicAccount = freezed,Object? metadata = freezed,Object? personalBooks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isVIP: null == isVIP ? _self.isVIP : isVIP // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,googleAccount: freezed == googleAccount ? _self.googleAccount : googleAccount // ignore: cast_nullable_to_non_nullable
as GoogleAccount?,basicAccount: freezed == basicAccount ? _self.basicAccount : basicAccount // ignore: cast_nullable_to_non_nullable
as BasicAccount?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,personalBooks: freezed == personalBooks ? _self.personalBooks : personalBooks // ignore: cast_nullable_to_non_nullable
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
$BasicAccountCopyWith<$Res>? get basicAccount {
    if (_self.basicAccount == null) {
    return null;
  }

  return $BasicAccountCopyWith<$Res>(_self.basicAccount!, (value) {
    return _then(_self.copyWith(basicAccount: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isAdmin,  bool isVIP,  String createdAt,  GoogleAccount? googleAccount,  BasicAccount? basicAccount,  Map<String, dynamic>? metadata,  List<PersonalUserBook>? personalBooks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.isAdmin,_that.isVIP,_that.createdAt,_that.googleAccount,_that.basicAccount,_that.metadata,_that.personalBooks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isAdmin,  bool isVIP,  String createdAt,  GoogleAccount? googleAccount,  BasicAccount? basicAccount,  Map<String, dynamic>? metadata,  List<PersonalUserBook>? personalBooks)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.isAdmin,_that.isVIP,_that.createdAt,_that.googleAccount,_that.basicAccount,_that.metadata,_that.personalBooks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isAdmin,  bool isVIP,  String createdAt,  GoogleAccount? googleAccount,  BasicAccount? basicAccount,  Map<String, dynamic>? metadata,  List<PersonalUserBook>? personalBooks)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.isAdmin,_that.isVIP,_that.createdAt,_that.googleAccount,_that.basicAccount,_that.metadata,_that.personalBooks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.isAdmin, required this.isVIP, required this.createdAt, this.googleAccount, this.basicAccount, final  Map<String, dynamic>? metadata, final  List<PersonalUserBook>? personalBooks}): _metadata = metadata,_personalBooks = personalBooks;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  bool isAdmin;
@override final  bool isVIP;
@override final  String createdAt;
@override final  GoogleAccount? googleAccount;
@override final  BasicAccount? basicAccount;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<PersonalUserBook>? _personalBooks;
@override List<PersonalUserBook>? get personalBooks {
  final value = _personalBooks;
  if (value == null) return null;
  if (_personalBooks is EqualUnmodifiableListView) return _personalBooks;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.isVIP, isVIP) || other.isVIP == isVIP)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.googleAccount, googleAccount) || other.googleAccount == googleAccount)&&(identical(other.basicAccount, basicAccount) || other.basicAccount == basicAccount)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&const DeepCollectionEquality().equals(other._personalBooks, _personalBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isAdmin,isVIP,createdAt,googleAccount,basicAccount,const DeepCollectionEquality().hash(_metadata),const DeepCollectionEquality().hash(_personalBooks));

@override
String toString() {
  return 'User(id: $id, isAdmin: $isAdmin, isVIP: $isVIP, createdAt: $createdAt, googleAccount: $googleAccount, basicAccount: $basicAccount, metadata: $metadata, personalBooks: $personalBooks)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isAdmin, bool isVIP, String createdAt, GoogleAccount? googleAccount, BasicAccount? basicAccount, Map<String, dynamic>? metadata, List<PersonalUserBook>? personalBooks
});


@override $GoogleAccountCopyWith<$Res>? get googleAccount;@override $BasicAccountCopyWith<$Res>? get basicAccount;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isAdmin = null,Object? isVIP = null,Object? createdAt = null,Object? googleAccount = freezed,Object? basicAccount = freezed,Object? metadata = freezed,Object? personalBooks = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,isVIP: null == isVIP ? _self.isVIP : isVIP // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,googleAccount: freezed == googleAccount ? _self.googleAccount : googleAccount // ignore: cast_nullable_to_non_nullable
as GoogleAccount?,basicAccount: freezed == basicAccount ? _self.basicAccount : basicAccount // ignore: cast_nullable_to_non_nullable
as BasicAccount?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,personalBooks: freezed == personalBooks ? _self._personalBooks : personalBooks // ignore: cast_nullable_to_non_nullable
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
$BasicAccountCopyWith<$Res>? get basicAccount {
    if (_self.basicAccount == null) {
    return null;
  }

  return $BasicAccountCopyWith<$Res>(_self.basicAccount!, (value) {
    return _then(_self.copyWith(basicAccount: value));
  });
}
}

// dart format on
